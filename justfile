build:
    npm run build

deploy: build
    wrangler pages deploy --project-name=lint-article ./build
