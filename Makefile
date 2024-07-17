.PHONY: playbook-handle playbook-run playbook-local

workdir := $(shell git rev-parse --show-toplevel)

# Default values
is_remove ?= false

playbook-handle:
	@ansible-playbook $(workdir)/ansible/playbooks/_handler.yml \
		-e workdir=$(workdir) \
		-e task_file=$(if $(task_file),$(task_file),ansible/tasks/hello.yml) \
		-e '{"is_remove": $(is_remove)}' \
		-i ansible/inventory.yml

playbook-run:
	@if [ -z "$(playbook)" ]; then \
		echo "Error: playbook parameter is required."; \
		exit 1; \
	fi
	@ansible-playbook $(workdir)/$(playbook) \
		-e workdir=$(workdir) \
		-e '{"is_remove": $(is_remove)}' \
		-i ansible/inventory.yml

playbook-local:
	@if [ -z "$(playbook)" ]; then \
		echo "Error: playbook parameter is required."; \
		exit 1; \
	fi
	@ansible-playbook $(workdir)/$(playbook) \
		-e workdir=$(workdir) \
		-e _hosts=localhost \
		-e _connection=local \
		-e '{"is_remove": $(is_remove)}' \
		-i ansible/inventory.yml
