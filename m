Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E432B138
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187228; cv=none; b=DfwkWpvlFLviW24nJ1oA2V6qHC057Qbp1H9D2xzZ5tu57TFqFKn6u6nWYYgGndK9N5M06IFJKzGlEZcWtTRo/jXTbwrbZKAn1tq7i2BmuK2fdbS1sGmXLZuLJcKDviBv90meNMRE9+gMPzePAH3t8jZFLXqAjnStkEUZ3qkP6UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187228; c=relaxed/simple;
	bh=8oazqcFjGMVkDBCxvVRn4ICrLm2cips7l3BXQtN8kcw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q6MYnokTe2viKObhdQh06wDzZ+h9ANm1saOuowCIgaDQQoPQLZt3dF1e355y8rZltUGMemalXBcjFIYiAhzWjNyr7diw37WYAfoz74aJlExGDwNpYkzGF+mcv/EaMuGLou6MEA3Wjt4Y87oMW9RXbp78l/m2DC1CIZlXVwhD0VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gH9iN4i+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gH9iN4i+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779187226; x=1810723226;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8oazqcFjGMVkDBCxvVRn4ICrLm2cips7l3BXQtN8kcw=;
  b=gH9iN4i+LjwCWLTxE79ydCYNAkP9sfGGZnc9mN+7AX8bS21odltplvQk
   D6Bc5OqEbJLXXdEhV0zeD7fsgKw8/liXM5a7vqBFnmif3+CYGBHHsvtlK
   Q+7N7zJZ5SQ1TF25ucdf1zJObPUoUQXjlEkMakEJ+MycSbcGNqx1fcQaG
   bbLFoTaKKtvO4nYuYZCQSr6kXkE0EGHTCShj01XCl9mLNlI4S+jlvZu3l
   6+mrbBiYBCWMSYjev44Pt/6gGv/eIWM7xPgGsKiUpZqZvuNc3nSFbjNPT
   FH1Z4hBAvStUuNk4oAE9ucqwXalbYEOJcVql7H7tUC4yyWM02YXGomuOf
   g==;
X-CSE-ConnectionGUID: IAetrKW8SemOUlBz/4PM6Q==
X-CSE-MsgGUID: Y1sJQnqlR/qhsw059gGt2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80181254"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80181254"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:40:26 -0700
X-CSE-ConnectionGUID: WDv0m9IAQXS/bYD+5Q1sPQ==
X-CSE-MsgGUID: MYtBivwiSuOIsRt5bXEEZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235288440"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:40:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 13:40:20 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing
 tool for driver metrics and features
In-Reply-To: <20260507144524.664001-7-Shyam-sundar.S-k@amd.com>
Message-ID: <6a14c3a2-1d61-7431-eab5-6bac57580c36@linux.intel.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com> <20260507144524.664001-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, Shyam Sundar S K wrote:

> This tool leverages amd-pmf ioctls exposed via the util layer, allowing
> validation of its newly integrated util layer and /dev/amdpmf_interface.
> It includes a user-space test application, test_amd_pmf, designed to
> interact with the PMF driver and retrieve relevant metrics for the
> testing and analysis.
> 
> It provides definitions for test metrics, feature IDs, and device states,
> and includes tests for various AMD PMF metrics such as power source, skin
> temperature, battery state, and custom BIOS inputs/outputs. It also
> enables the testing of PMF metrics data and feature support reporting.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  tools/platform/x86/amd/Makefile   |  60 +++++++++++++
>  tools/platform/x86/amd/test-pmf.c | 142 ++++++++++++++++++++++++++++++
>  2 files changed, 202 insertions(+)
>  create mode 100644 tools/platform/x86/amd/Makefile
>  create mode 100644 tools/platform/x86/amd/test-pmf.c
> 
> diff --git a/tools/platform/x86/amd/Makefile b/tools/platform/x86/amd/Makefile
> new file mode 100644
> index 000000000000..5d820df5871f
> --- /dev/null
> +++ b/tools/platform/x86/amd/Makefile
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0
> +ifeq ($(srctree),)
> +srctree := $(patsubst %/,%,$(dir $(CURDIR)))
> +srctree := $(patsubst %/,%,$(dir $(srctree)))
> +srctree := $(patsubst %/,%,$(dir $(srctree)))
> +srctree := $(patsubst %/,%,$(dir $(srctree)))
> +endif
> +
> +# Include common tools build infrastructure
> +include $(srctree)/tools/scripts/Makefile.include
> +
> +CC		= $(CROSS_COMPILE)gcc
> +BUILD_OUTPUT	:= $(CURDIR)
> +PREFIX		?= /usr
> +DESTDIR		?=
> +
> +ifeq ("$(origin O)", "command line")
> +	BUILD_OUTPUT := $(O)
> +endif
> +
> +# Include paths: tools/include has linux/kernel.h with ARRAY_SIZE
> +INCLUDES	= -I$(srctree)/tools/include
> +INCLUDES	+= -I$(srctree)/tools/include/uapi
> +INCLUDES	+= -I$(srctree)/include/uapi
> +INCLUDES	+= -I$(srctree)/include
> +
> +override CFLAGS += -O2 -Wall -Wextra -D_GNU_SOURCE $(INCLUDES)
> +override CFLAGS += -D_FILE_OFFSET_BITS=64
> +override CFLAGS += -D__EXPORTED_HEADERS__
> +
> +TARGETS		= test_amd_pmf
> +
> +all: $(TARGETS)
> +
> +test_amd_pmf: test-pmf.c
> +	$(QUIET_CC)$(CC) $(CFLAGS) $< -o $(BUILD_OUTPUT)/$@ $(LDFLAGS)
> +
> +.PHONY: clean
> +clean:
> +	$(call QUIET_CLEAN, test_amd_pmf)$(RM) $(BUILD_OUTPUT)/test_amd_pmf
> +
> +.PHONY: install
> +install: $(TARGETS)
> +	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
> +	$(INSTALL) $(BUILD_OUTPUT)/test_amd_pmf $(DESTDIR)$(PREFIX)/bin/test_amd_pmf
> +
> +.PHONY: help
> +help:
> +	@echo "AMD Platform Tools Makefile"
> +	@echo ""
> +	@echo "Targets:"
> +	@echo "  all           - Build all tools (default)"
> +	@echo "  test_amd_pmf  - Build the PMF test tool"
> +	@echo "  clean         - Remove built files"
> +	@echo "  install       - Install tools to $(PREFIX)/bin"
> +	@echo ""
> +	@echo "Variables:"
> +	@echo "  O=<dir>        - Build output directory"
> +	@echo "  PREFIX         - Installation prefix (default: /usr)"
> +	@echo "  DESTDIR        - Destination directory for install"
> diff --git a/tools/platform/x86/amd/test-pmf.c b/tools/platform/x86/amd/test-pmf.c
> new file mode 100644
> index 000000000000..a57f5c0e2565
> --- /dev/null
> +++ b/tools/platform/x86/amd/test-pmf.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Test Tool
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <unistd.h>

Add an empty like here.

> +#include <linux/amd-pmf.h>
> +#include <linux/kernel.h>
> +
> +#define DEVICE_NODE	"/dev/amdpmf_interface"
> +
> +/* Feature flag names */
> +static const char * const feature_names[] = {
> +	"Auto Mode",
> +	"Static Power Slider",
> +	"Policy Builder (Smart PC)",
> +	"Dynamic Power Slider AC",
> +	"Dynamic Power Slider DC",
> +};
> +
> +/* Print feature flags */
> +static void pmf_print_features(uint32_t flags)
> +{
> +	int i;
> +
> +	for (i = 0; i < (int)ARRAY_SIZE(feature_names); i++) {

Why can't this be done without cast?

> +		if (flags & (1U << i))
> +			printf("  [x] %s\n", feature_names[i]);
> +		else
> +			printf("  [ ] %s\n", feature_names[i]);

I suggest using elvis operator for " "/"x" variation.

> +	}
> +}
> +
> +/* Print BIOS parameters */
> +static void pmf_print_bios_params(const char *type, const __u32 *params)
> +{
> +	int i;
> +
> +	for (i = 0; i < AMD_PMF_BIOS_PARAMS_MAX; i++)
> +		printf("  Custom BIOS %s%d: %u\n", type, i + 1, params[i]);
> +}
> +
> +/* Open the PMF device */
> +static int pmf_open_device(void)
> +{
> +	int fd;
> +
> +	fd = open(DEVICE_NODE, O_RDONLY);
> +	if (fd < 0)
> +		fprintf(stderr, "Error: Cannot open %s: %s\n", DEVICE_NODE, strerror(errno));
> +
> +	return fd;
> +}
> +
> +/* Query PMF info using the single IOCTL */
> +static int pmf_get_info(int fd, struct amd_pmf_info *info)
> +{
> +	int ret;
> +
> +	/* Zero-initialize and set size for versioning */
> +	memset(info, 0, sizeof(*info));
> +	info->size = sizeof(*info);
> +
> +	ret = ioctl(fd, IOCTL_AMD_PMF_POPULATE_DATA, info);
> +	if (ret < 0) {
> +		fprintf(stderr, "Error: IOCTL_AMD_PMF_POPULATE_DATA failed: %s\n", strerror(errno));
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void pmf_print_info(const struct amd_pmf_info *info)
> +{
> +	printf("=================================================\n");
> +	printf("      AMD PMF Metrics info and Feature Status\n");
> +	printf("=================================================\n\n");

I suppose you could make this banner a const char * and call printf() only 
once for it (it can be nicely formatted to multiple lines by splitting 
"" per line).

> +
> +	/* Feature status */
> +	printf("Feature Status:\n");
> +	pmf_print_features(info->features_supported);
> +
> +	/* Device states */
> +	printf("\nDevice States:\n");
> +	printf("  Platform Type:     %s\n", amd_pmf_get_pt(info->platform_type));
> +	printf("  Laptop Placement:  %s\n", amd_pmf_get_lp(info->laptop_placement));
> +	printf("  Lid State:         %s\n", info->lid_state ? "Closed" : "Open");
> +	printf("  User Presence:     %s\n", info->user_presence ? "Present" : "Away");
> +	printf("  Slider Position:   %s\n", amd_pmf_get_sp(info->slider_position));
> +
> +	/* Thermal and power metrics */
> +	printf("\nThermal/Power Metrics:\n");
> +	printf("  Skin Temperature:  %d\n", info->skin_temp / 100);
> +	printf("  GFX Busy:          %u\n", info->gfx_busy);
> +	printf("  Ambient Light:     %d\n", info->ambient_light);
> +	printf("  Avg C0 Residency:  %u\n", info->avg_c0_residency);
> +	printf("  Max C0 Residency:  %u\n", info->max_c0_residency);
> +	printf("  Socket Power:      %u\n", info->socket_power);
> +
> +	/* BIOS parameters */
> +	printf("\nCustom BIOS Input Parameters:\n");
> +	pmf_print_bios_params("Input", info->bios_input);
> +	printf("\nCustom BIOS Output Parameters:\n");
> +	pmf_print_bios_params("Output", info->bios_output);
> +
> +	printf("\n=================================================\n");
> +}
> +
> +int main(void)
> +{
> +	struct amd_pmf_info info;
> +	int fd, ret;
> +
> +	fd = pmf_open_device();
> +	if (fd < 0)
> +		return -1;
> +
> +	/* Query all info with single IOCTL */
> +	ret = pmf_get_info(fd, &info);
> +	close(fd);
> +
> +	if (ret < 0)
> +		return -1;
> +
> +	pmf_print_info(&info);
> +
> +	return 0;
> +}
> 

-- 
 i.

