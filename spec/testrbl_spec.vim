describe "Testrbl"

  before
    cd spec/fixtures/minitest
    let g:test#ruby#minitest#executable = 'testrbl'
  end

  after
    call Teardown()
    cd -
    unlet g:test#ruby#minitest#executable
  end

  it "runs nearest tests"
    view +1 normal_test.rb
    TestNearest

    Expect g:test#last_command == 'testrbl normal_test.rb:1'
  end

  it "runs file tests"
    view normal_test.rb
    TestFile

    Expect g:test#last_command == 'testrbl normal_test.rb'
  end

  it "runs test suites"
    view normal_test.rb
    TestSuite

    Expect g:test#last_command == 'testrbl'
  end

end
