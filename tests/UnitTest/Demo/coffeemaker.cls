Class UnitTest.Demo.coffeemaker Extends %UnitTest.TestCase
{

ClassMethod Run()
{
  do ##class(%UnitTest.Manager).DebugRunTestCase(..%ClassName(1))
}

Method OnBeforeOneTest(testname As %String) As %Status
{
  TStart 
  Quit $$$OK
}

Method OnAfterOneTest(testname As %String) As %Status
{
  TROllback 
  Quit $$$OK
}

Method "Test Required fields"()
{
  Set coffeemaker = ##class(Demo.coffeemaker).%New()
  Do $$$AssertStatusNotOK(coffeemaker.%Save(), "Shouldn't save, due to empty required fields")

  #; Fill Required fields
  Set coffeemaker.Name = ##class(%PopulateUtils).String()
  Set coffeemaker.Brand = ##class(%PopulateUtils).String()
  Do $$$AssertStatusOK(coffeemaker.%Save(), "Should save correctly, due to filled required fields")
}

}
