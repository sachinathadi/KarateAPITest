package com.tests;

import com.intuit.karate.junit5.Karate;

public class SampleTest {

	@Karate.Test
	Karate testSpecificFeature() {
		return Karate.run("JsonServerCrudTest").relativeTo(getClass());
	}

}
