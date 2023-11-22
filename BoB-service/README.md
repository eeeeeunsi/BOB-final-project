# Book of BoB
## [petclinic](https://github.com/spring-projects/spring-petclinic)의 MSA service
--
  
### codepipeline 및 codebuild를 활용한 CI/CD  
- 각 디렉터리의 `buildspec.yml` 활용  
- `deploy` 디렉터리의 `svc`는 `kubectl apply`를 통해 미리 apply해 주어야 함  
  
### `config`  
- 각 monitoring agent 및 msa service 를 위한 config 파일 존재