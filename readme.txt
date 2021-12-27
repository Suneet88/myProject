Google search project Documentation

The project is developed purely on Pycharm with Windows 10 as the OS. Hence all the installation references will be w.r.t Pycharm only.

1. Download and install Pycharm Community Edition 
2. Download and install latest python 3.x (Here I have taken 3.10.x)
3. Download and install GIT
4. Clone the project to your desired folder

	C:\<desired_folder> git clone https://github.com/Suneet88/myProject.git

5.(Optional Step) When the cloning is complete, you can create a separate branch

	C:\<desired_folder> git checkout -b myBranch

6. Now open your desired folder which contains the project in Pycharm.

	File -> Open -> Select your folder

7. Set your Python as Interpreter in Pycharm
	
	* File -> Settings -> Project: <Your Project Name> (On panel's left side)
	* Click On Python Interpreter
	* Click on gear icon on right side of "Python Interpreter" dropdown and click Add
	* Select Existing Environment radio button and browse your Python there.
	* Click Apply / OK on every panel open.

8. We need to install now the desired packages of python in order to support our project.
	
	* robotframework
	* robotframework-pabot
	* robotframework-seleniumlibrary
	* selenium

	Note: You can either install these packages from Pycharm or you can install using pip	

9. We need some Plugins as well in order to make this project work in PYCHARM.
	
	* Intellibot
	* Robot Framework Language Server
	* Git plugin (to checkin checkout from Pycharm itself. Else can be done from cmd)
	* GitHub plugin (just incase same as Git above)


HOW TO RUN THE PROJECT

1. Open the Teminal inside Pycharm (we can use cmd as well). 
2. Go inside the testui folder : cd testui
3. If every installation is correct, you should be able to run pabot --include TC-001 test/

