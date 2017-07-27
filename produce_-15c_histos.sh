# clear the output directory to prevent old files from being used for the plots
rm output/*

# arguments: TOB, TIB, TECP, and TECM filename lists, output directory, output prefix, y-axis parameter file, x-axis begin and end dates
root -l -q run_make_partition_hists.C'("config/tob_-15c_filenames.txt",
                                       "config/tib_-15c_filenames.txt",
                                       "config/tecp_-15c_filenames.txt",
                                       "config/tecm_-15c_filenames.txt",
                                       "output", 
                                       "-15c_output", 
                                       "config/yaxis_params_-15c.txt",
                                       20150301,
                                       20170801)'
#
hadd -f output/tob_-15c_added.root output/tob_-15c_output_*.root
hadd -f output/tib_-15c_added.root output/tib_-15c_output_*.root
hadd -f output/tecp_-15c_added.root output/tecp_-15c_output_*.root
hadd -f output/tecm_-15c_added.root output/tecm_-15c_output_*.root

# arguments: the output files followed by the corresponding reference run numbers, begin date, plot directory
root -l -q draw_partition.C'("output/tob_-15c_added.root", "219662", "output/tib_-15c_added.root", "219716", "output/tecp_-15c_added.root", "219661", "output/tecm_-15c_added.root", "219659", 20150301, "pdfs_-15c")'
