#!/bin/bash

# move to ELS S3
function copy_to_aws_s3 { aws_profile=${1} aws_bucket=${2} local_source=${3} aws_prefix_user=${4}
  if [ "${aws_prefix_user}" == "" ]; then
    aws_destination="s3://${aws_bucket}/${local_source}"
  else
    aws_destination="s3://${aws_bucket}/${aws_prefix_user}/${local_source}"
  fi
  echo "DEBUG: 'aws --profile ${aws_profile} s3 cp ${local_source} ${aws_destination}'"
  aws --profile ${aws_profile} s3 cp ${local_source} ${aws_destination}
}

# download NOAA data uncompress
function download_and_unzip_noaa_data() { year=${1} base_filename=${2} data_dir=${3}
  remote_zip_source="https://coast.noaa.gov/htdata/CMSP/AISDataHandler/${year}/${base_filename}.zip"
  local_zip_source="${data_dir}/${base_filename}.zip"
  local_csv_source="${data_dir}/${base_filename}.csv"

  echo "DEBUG: 'curl ${remote_zip_source} > ${local_zip_source}'"
  http_code=$(curl --write-out "%{http_code}\n"  ${remote_zip_source} --output ${local_zip_source} --silent)
  # http_code="404"
  if [ 200 -eq ${http_code} ]; then
    echo "DEBUG: 'unzip -o ${local_zip_source} -d ${data_dir}'"
    unzip -o ${local_zip_source} -d ${data_dir}
  else
    # the data is the 404 page not the zipped data
    echo "Got a '${http_code}' return code when calling '${remote_zip_source}'"
    echo "DEBUG: 'rm -f ${local_csv_source}'"
    rm -f ${local_csv_source}
  fi
  echo "DEBUG: 'rm -f ${local_zip_source}'"
  rm -f ${local_zip_source}
}

function build_line() { s=${1}
  line=""
  for (( c=1; c<=${#s}; c++ )); do
    line+="-"
  done
  echo ${line}
}

if [ $# -ne 2 ] && [ $# -ne 5 ] && [ $# -ne 6 ]; then
  echo "please provide a start_date && end_date in the format yyyy-mm-dd"
  echo ""
  echo "if you want to upload to AWS S3 please provide the following additionals:"
  echo "aws_profile aws_bucket copy|move aws_prefix_user"
  echo ""
  echo "eg. . acquire-noaa-ais-data.sh 2022-03-01 2022-03-30"
  echo "eg. . acquire-noaa-ais-data.sh 2022-03-01 2022-03-30 recs-dev-admin com-elsevier-recs-dev-experiments move lyner"
else
  start_date=${1} # format yyyy-mm-dd or yyyymmdd
  end_date=${2}   # format yyyy-mm-dd or yyyymmdd
  # Also optionally pass these in:
  aws_profile=${3}
  aws_bucket=${4}
  copy_or_move=${5}
  if [ $# -eq 6 ]; then
    aws_prefix_user=${6}
  else
    aws_prefix_user=""
  fi

  # default to move
  if [ "${copy_or_move}" != "copy" ]; then
    copy_or_move="move"
  fi

  this_date=`date -d ${start_date} +"%Y%m%d"`
  stop_date=`date -d ${end_date} +"%Y%m%d"`

  data_dir="data/noaa/ais"

  mkdir -p ${data_dir}

  dates=()
  while [ ${this_date} -le ${stop_date} ]; do
    dates+=(`date -d ${this_date} +"%Y_%m_%d"`)
    this_date=`date -d "${this_date} +1 day" +"%Y%m%d"`
  done

  for d in ${dates[@]}; do
    year=`echo ${d} | awk -F'_' '{print $1}'`
    month=`echo ${d} | awk -F'_' '{print $2}'`
    day=`echo ${d} | awk -F'_' '{print $3}'`

    base_filename="AIS_${year}_${month}_${day}"

    line=`build_line ${base_filename}`

    echo "${line}"
    echo "${base_filename}"
    echo "${line}"
    download_and_unzip_noaa_data ${year} ${base_filename} ${data_dir}
    if [ ${#aws_bucket} -ne 0 ]; then
      local_csv_source="${data_dir}/${base_filename}.csv"
      echo "${base_filename}"s_s3 ${aws_profile} ${aws_bucket} ${aws_prefix_user} ${local_csv_source}
      copy_to_aws_s3 ${aws_profile} ${aws_bucket} ${local_csv_source} ${aws_prefix_user}
      if [ "${copy_or_move}" == "move" ]; then
        rm -f ${local_csv_source}
      fi
    fi
    echo "${line}"
    echo ""
  done
fi
