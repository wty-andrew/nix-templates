val scala3Version = "3.3.3"

val munitVersion = "1.0.0"

lazy val root = project
  .in(file("."))
  .settings(
    name := "Scala 3 Project Template",
    version := "0.1.0",

    scalaVersion := scala3Version,

    libraryDependencies ++= Seq(
      "org.scalameta" %% "munit" % munitVersion % Test,
    ),

    assembly / assemblyJarName := "main.jar",
  )
