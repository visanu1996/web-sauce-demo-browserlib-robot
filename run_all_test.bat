robot --outputdir .\reports\login\ .\test\login.robot
robot --outputdir .\reports\products\ .\test\product.robot
robot --outputdir .\reports\cart\ .\test\cart.robot
robot --outputdir .\reports\inform\ .\test\inform.robot

rebot --outputdir .\reports\combine ^
      --output output.xml ^
      --log log.html ^
      --report report.html ^
      .\reports\login\output.xml ^
      .\reports\products\output.xml ^
      .\reports\cart\output.xml ^
      .\reports\inform\output.xml 