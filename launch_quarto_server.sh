#!/bin/bash
#SBATCH --job-name=quarto-vs-code
#SBATCH --time=2-00:00:00   # days-hours:minutes:seconds
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8   # per sciwiki, use CPUs to inform mem. 1 CPU = 4 Gb
#SBATCH --mem-per-cpu=4G
#SBATCH --output=quarto-server.job.out
#SBATCH --error=quarto-server.job.err

module purge
module load Apptainer

apptainer run \
      -B /var/tmp:$TMPDIR \
      -B /fh/fast/_IRC/FHIL \
      /fh/fast/_IRC/FHIL/grp/inhouse_computational_resources/quarto-launcher/quarto-code-server.sif \
      code tunnel