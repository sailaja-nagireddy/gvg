# gvg

A generic voicexml generator (gvg) as the name indicates generates voicexml from different sources, such as database, json and other supported.


## getting started

The easiest way to get started is to simply install the gem, but as the latest version may not be available to rubygems continuously, it is better that the repository is cloned or forked.

### prerequisites

[ruby](https://www.ruby-lang.org/en/documentation/installation/)

### installation

```
gem install gvg
```

or

```
git clone git@github.com:sailaja-nagireddy/gvg.git
```

### usage

```
gvg --help
gvg generate --source test/raw/hello.json
gvg help generate
```

## built with

* [ruby](https://ruby-lang.org)


## todo

- [x] Update readme file.
- [x] Test gemmified version.
- [ ] Publish version 0.0.3 of the gem.
- [ ] Print gem version upon `gvg --version`.
- [ ] Implement auto versioning.
- [ ] Write tests for state machine.
- [ ] Add listen state.
- [ ] Add do/work/perform state.
- [ ] Add more tests.


## versioning

We use [Semantic Versioning](https://semver.org) for versioning.  For the versions available, see the [tags](https://github.com/sailaja-nagireddy/gvg/tags) on this repository.


## authors

[Sailja Nagireddy](https://github.com/sailaja-nagireddy)

See also the list of [contributors](https://github.com/sailaja-nagireddy/gvg/contributors) who participated in this project.


## license

This project is licensed under the Mozilla Public License 2.0 - see the [LICENSE](LICENSE) for details.


## acknowledgements

* Hat tip to [PurpleBooth](https://github.com/PurpleBooth) for the readme template.
