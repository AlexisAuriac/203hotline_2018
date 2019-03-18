#!/bin/bash

# CONSTANTS
readonly TEST_DIR='./tests'

readonly TESTS=(
    $TEST_DIR/tests_params.rb
    $TEST_DIR/tests_utilities.rb
    $TEST_DIR/tests_examples.rb
)

readonly INTERPRET='ruby'


# EXECUTE TESTS
for i in ${TESTS[@]}; do
    $INTERPRET $i
    echo
done
