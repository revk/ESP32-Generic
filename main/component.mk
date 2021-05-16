ULP_APP_NAME ?= ulp-$(COMPONENT_NAME)
ULP_S_SOURCES = $(addprefix $(COMPONENT_PATH)/ulp/, \
	wake.S \
	)
ULP_EXP_DEP_OBJECTS := main.o ulp-util.o
include $(IDF_PATH)/components/ulp/component_ulp_common.mk
