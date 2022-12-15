# test ----
  
# start recording session  
shinyloadtest::record_session(
  target_app_url = Sys.getenv("APP_URL"),
  connect_api_key = Sys.getenv("API_KEY")
  )

# close tab

# run command system
system("HISTCONTROL=ignoreboth")
system(paste0("export SHINYCANNON_USER=",Sys.getenv("USERNAME"),""))
system(paste0("export SHINYCANNON_PASS=",Sys.getenv("PASSWORD"),""))
system(paste0("export SHINYCANNON_CONNECT_API_KEY=",Sys.getenv("API_KEY"),""))


# app name
app_name <- "panopticon"
print(
  paste0(
    "shinycannon recording.log ",
    Sys.getenv("APP_URL"),
   " --workers 5 --loaded-duration-minutes 1 --output-dir ",
   app_name,
   " --overwrite-output" 
  )
)


# record settings
df <- shinyloadtest::load_runs(app_name)
shinyloadtest::shinyloadtest_report(df, paste0(app_name,".html"))


# archive ------------------------------

shinyloadtest::record_session(
  target_app_url = "https://rstudio-connect.testing.ap.datim.org/content/175",
  connect_api_key = Sys.getenv("API_KEY")
)
HISTCONTROL=ignoreboth
export SHINYCANNON_USER=myuser
export SHINYCANNON_PASS=mypassword
shinycannon recording.log https://rstudio-connect.testing.ap.datim.org/content/175 --workers 5 --loaded-duration-minutes 2 --output-dir run1 --overwrite-output 


# record settings
df <- shinyloadtest::load_runs("run1")
shinyloadtest::shinyloadtest_report(df, "run1.html")




