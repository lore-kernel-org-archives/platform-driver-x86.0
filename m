Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD967254849;
	Tue,  6 Jan 2026 15:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767713973; cv=none; b=LSXCjFzM3vfEvtJIXIfCLOij7XnBQc1w51pljxOIdKaf2i5wxZ0JncTvdyARJcfTOKshJ1+my2Oa9GJ4DrY6lADlZkZTnSdjzRve9r8BaVox3jAOR2z2VEhADthMWVRL/nDgl2Yh7JqRuq77Bt2NVGK+RkBZydl4zKd+PqWaLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767713973; c=relaxed/simple;
	bh=8qGW2uEzqBbPwPvzuWjFgWsFf4aLK50Jwkzi+pyPRLw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oQBz5p0LvRd/uY0La6u1tKveuPsH9kt9Fi7CdggFSiSQj4j6JFH6RjklFGnA1Qfxawn0cyI+ndL3OgwFa89UkwZXcy4j9kENHns8dHNL9clbltBBcGiHCAOQqQdMRZHTja6UTiLCYHygFr6ak/i8HuW9hO1bCJjFQoZxVqd9KHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Afiz3Vxd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Afiz3Vxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767713971; x=1799249971;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8qGW2uEzqBbPwPvzuWjFgWsFf4aLK50Jwkzi+pyPRLw=;
  b=Afiz3Vxd7z9/UgIVeg8oU+UFIcchwI+iyht+1IkLfB2YjUzW3wQxh8V8
   RObqVc84oqZDTSGURjsE4RNOIQ0RzBAoD2PFh9RnjGWBIX6LPoEtwre+a
   fq9+kOBAy0lPKv/p95OkDUp+QDqhrTZqVJ6HDF93Pi2LkJKx6JtgVAU8K
   ZJZR9j62q0iJud0Zd9PlcPpAmexhT8O5NPHtIkCVxNUL/QpWE0YrvcqN4
   k6lZsPufYG1GoTG/8XB+lgijyuZWzDOBz3pX+/04Cd+vo6mQtZ5vVwKwc
   l52h8bpSDAXPfSjpvIwUpyRV4F0gmf8n2eOkxv64IA6qq4sFSO+VDkusu
   A==;
X-CSE-ConnectionGUID: mCMyUFhgSMqPuFkjeFcTkQ==
X-CSE-MsgGUID: bExnYoniTki9x8KYE2EZ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91736174"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="91736174"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 07:39:30 -0800
X-CSE-ConnectionGUID: 9W4NxWreRKeq5SEB6nkS2g==
X-CSE-MsgGUID: 8IDncIfoSv+MfVEla/Mr2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="233812285"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 07:39:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Jan 2026 17:39:23 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux@weissschuh.net, 
    Dell.Client.Kernel@dell.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/9] platform/wmi: Add kunit test for the marshalling
 code
In-Reply-To: <20251220204622.3541-3-W_Armin@gmx.de>
Message-ID: <d81e5214-4aaa-9e72-5a3c-5c0e67528ee0@linux.intel.com>
References: <20251220204622.3541-1-W_Armin@gmx.de> <20251220204622.3541-3-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 20 Dec 2025, Armin Wolf wrote:

> The marshalling code used by the WMI driver core is implemented as
> a separate component, suitable for unit tests.
> 
> Implmented such a unit test using KUnit. Those unit tests verify that
> ACPI objects are correctly converted into WMI buffers and that WMI
> strings are correctly converted into ACPI strings. They also verify
> that invalid ACPI data (like nested packages) is rejected.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/wmi/Kconfig                  |   2 +
>  drivers/platform/wmi/Makefile                 |   3 +
>  drivers/platform/wmi/tests/Kconfig            |  16 +
>  drivers/platform/wmi/tests/Makefile           |   8 +
>  .../platform/wmi/tests/marshalling_kunit.c    | 448 ++++++++++++++++++
>  5 files changed, 477 insertions(+)
>  create mode 100644 drivers/platform/wmi/tests/Kconfig
>  create mode 100644 drivers/platform/wmi/tests/Makefile
>  create mode 100644 drivers/platform/wmi/tests/marshalling_kunit.c
> 
> diff --git a/drivers/platform/wmi/Kconfig b/drivers/platform/wmi/Kconfig
> index 77fcbb18746b..21fa3e440042 100644
> --- a/drivers/platform/wmi/Kconfig
> +++ b/drivers/platform/wmi/Kconfig
> @@ -31,4 +31,6 @@ config ACPI_WMI_LEGACY_DEVICE_NAMES
>  	  userspace applications but will cause the registration of WMI devices with
>  	  the same GUID to fail in some corner cases.
>  
> +source "drivers/platform/wmi/tests/Kconfig"
> +
>  endif # ACPI_WMI
> diff --git a/drivers/platform/wmi/Makefile b/drivers/platform/wmi/Makefile
> index 6f2bf8cc709e..93f37ce519ae 100644
> --- a/drivers/platform/wmi/Makefile
> +++ b/drivers/platform/wmi/Makefile
> @@ -6,3 +6,6 @@
>  
>  wmi-y			:= core.o marshalling.o
>  obj-$(CONFIG_ACPI_WMI)	+= wmi.o
> +
> +# Unit tests
> +obj-y			+= tests/
> diff --git a/drivers/platform/wmi/tests/Kconfig b/drivers/platform/wmi/tests/Kconfig
> new file mode 100644
> index 000000000000..efcbcb51c251
> --- /dev/null
> +++ b/drivers/platform/wmi/tests/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# ACPI WMI KUnit tests
> +#
> +
> +config ACPI_WMI_MARSHALLING_KUNIT_TEST
> +	tristate "KUnit Test for ACPI-WMI marshalling" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds unit tests for the ACPI-WMI marshalling code.
> +
> +	  For more information on KUnit and unit tests in general, please refer
> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.
> +
> +	  If unsure, say N.
> diff --git a/drivers/platform/wmi/tests/Makefile b/drivers/platform/wmi/tests/Makefile
> new file mode 100644
> index 000000000000..252c3125353a
> --- /dev/null
> +++ b/drivers/platform/wmi/tests/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Makefile for linux/drivers/platform/x86/wmi/tests
> +# ACPI WMI KUnit tests
> +#
> +
> +wmi_marshalling_kunit-y				:= marshalling_kunit.o
> +obj-$(CONFIG_ACPI_WMI_MARSHALLING_KUNIT_TEST)	+= wmi_marshalling_kunit.o
> diff --git a/drivers/platform/wmi/tests/marshalling_kunit.c b/drivers/platform/wmi/tests/marshalling_kunit.c
> new file mode 100644
> index 000000000000..e339791e81e5
> --- /dev/null
> +++ b/drivers/platform/wmi/tests/marshalling_kunit.c
> @@ -0,0 +1,448 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * KUnit test for the ACPI-WMI marshalling code.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/wmi.h>
> +
> +#include <kunit/resource.h>
> +#include <kunit/test.h>
> +
> +#include "../internal.h"
> +
> +struct wmi_acpi_param {
> +	const char *name;
> +	const union acpi_object obj;
> +	const struct wmi_buffer buffer;
> +};
> +
> +struct wmi_string_param {
> +	const char *name;
> +	const char *string;
> +	const struct wmi_buffer buffer;
> +};
> +
> +struct wmi_invalid_acpi_param {
> +	const char *name;
> +	const union acpi_object obj;
> +};
> +
> +struct wmi_invalid_string_param {
> +	const char *name;
> +	const struct wmi_buffer buffer;
> +};
> +
> +/* 0xdeadbeef */
> +static u8 expected_single_integer[] = {
> +	0xef, 0xbe, 0xad, 0xde,
> +};
> +
> +/* "TEST" */
> +static u8 expected_single_string[] = {
> +	0x0a, 0x00, 0x54, 0x00, 0x45, 0x00, 0x53, 0x00, 0x54, 0x00, 0x00, 0x00
> +};
> +
> +static u8 test_buffer[] = {
> +	0xab, 0xcd
> +};
> +
> +static u8 expected_single_buffer[] = {
> +	0xab, 0xcd
> +};

Inconsistent trailing commas.

> +
> +static union acpi_object simple_package_elements[] = {
> +	{
> +		.buffer = {
> +			.type = ACPI_TYPE_BUFFER,
> +			.length = sizeof(test_buffer),
> +			.pointer = test_buffer,
> +		},
> +	},
> +	{
> +		.integer = {
> +			.type = ACPI_TYPE_INTEGER,
> +			.value = 0x01020304,
> +		},
> +	},
> +};
> +
> +static u8 expected_simple_package[] = {
> +	0xab, 0xcd,
> +	0x00, 0x00,
> +	0x04, 0x03, 0x02, 0x01
> +};
> +
> +static u8 test_small_buffer[] = {
> +	0xde
> +};
> +
> +static union acpi_object complex_package_elements[] = {
> +	{
> +		.integer = {
> +			.type = ACPI_TYPE_INTEGER,
> +			.value = 0xdeadbeef,
> +		},
> +	},
> +	{
> +		.buffer = {
> +			.type = ACPI_TYPE_BUFFER,
> +			.length = sizeof(test_small_buffer),
> +			.pointer = test_small_buffer,
> +		},
> +	},
> +	{
> +		.string = {
> +			.type = ACPI_TYPE_STRING,
> +			.length = sizeof("TEST") - 1,
> +			.pointer = "TEST",
> +		},
> +	},
> +	{
> +		.buffer = {
> +			.type = ACPI_TYPE_BUFFER,
> +			.length = sizeof(test_small_buffer),
> +			.pointer = test_small_buffer,
> +		},
> +	},
> +	{
> +		.integer = {
> +			.type = ACPI_TYPE_INTEGER,
> +			.value = 0x01020304,
> +		},
> +	}
> +};
> +
> +static u8 expected_complex_package[] = {
> +	0xef, 0xbe, 0xad, 0xde,
> +	0xde,
> +	0x00,
> +	0x0a, 0x00, 0x54, 0x00, 0x45, 0x00, 0x53, 0x00, 0x54, 0x00, 0x00, 0x00,
> +	0xde,
> +	0x00,
> +	0x04, 0x03, 0x02, 0x01,
> +};
> +
> +static const struct wmi_acpi_param wmi_acpi_params_array[] = {
> +	{
> +		.name = "single_integer",
> +		.obj = {
> +			.integer = {
> +				.type = ACPI_TYPE_INTEGER,
> +				.value = 0xdeadbeef,
> +			},
> +		},
> +		.buffer = {
> +			.data = expected_single_integer,
> +			.length = sizeof(expected_single_integer),
> +		},
> +	},
> +	{
> +		.name = "single_string",
> +		.obj = {
> +			.string = {
> +				.type = ACPI_TYPE_STRING,
> +				.length = sizeof("TEST") - 1,
> +				.pointer = "TEST",
> +			},
> +		},
> +		.buffer = {
> +			.data = expected_single_string,
> +			.length = sizeof(expected_single_string),
> +		},
> +	},
> +	{
> +		.name = "single_buffer",
> +		.obj = {
> +			.buffer = {
> +				.type = ACPI_TYPE_BUFFER,
> +				.length = sizeof(test_buffer),
> +				.pointer = test_buffer,
> +			},
> +		},
> +		.buffer = {
> +			.data = expected_single_buffer,
> +			.length = sizeof(expected_single_buffer),
> +		},
> +	},
> +	{
> +		.name = "simple_package",
> +		.obj = {
> +			.package = {
> +				.type = ACPI_TYPE_PACKAGE,
> +				.count = ARRAY_SIZE(simple_package_elements),
> +				.elements = simple_package_elements,
> +			},
> +		},
> +		.buffer = {
> +			.data = expected_simple_package,
> +			.length = sizeof(expected_simple_package),
> +		},
> +	},
> +	{
> +		.name = "complex_package",
> +		.obj = {
> +			.package = {
> +				.type = ACPI_TYPE_PACKAGE,
> +				.count = ARRAY_SIZE(complex_package_elements),
> +				.elements = complex_package_elements,
> +			},
> +		},
> +		.buffer = {
> +			.data = expected_complex_package,
> +			.length = sizeof(expected_complex_package),
> +		},
> +	},
> +};
> +
> +static void wmi_acpi_param_get_desc(const struct wmi_acpi_param *param, char *desc)
> +{
> +	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(wmi_unmarshal_acpi_object, wmi_acpi_params_array, wmi_acpi_param_get_desc);
> +
> +/* "WMI\0" */
> +static u8 padded_wmi_string[] = {
> +	0x0a, 0x00,
> +	0x57, 0x00,
> +	0x4D, 0x00,
> +	0x49, 0x00,
> +	0x00, 0x00,
> +	0x00, 0x00
> +};
> +
> +static const struct wmi_string_param wmi_string_params_array[] = {
> +	{
> +		.name = "test",
> +		.string = "TEST",
> +		.buffer = {
> +			.length = sizeof(expected_single_string),
> +			.data = expected_single_string,
> +		},
> +	},
> +	{
> +		.name = "padded",
> +		.string = "WMI",
> +		.buffer = {
> +			.length = sizeof(padded_wmi_string),
> +			.data = padded_wmi_string,
> +		},
> +	},
> +};
> +
> +static void wmi_string_param_get_desc(const struct wmi_string_param *param, char *desc)
> +{
> +	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(wmi_marshal_string, wmi_string_params_array, wmi_string_param_get_desc);
> +
> +static union acpi_object nested_package_elements[] = {
> +	{
> +		.package = {
> +			.type = ACPI_TYPE_PACKAGE,
> +			.count = ARRAY_SIZE(simple_package_elements),
> +			.elements = simple_package_elements,
> +		},
> +	}
> +};
> +
> +static const struct wmi_invalid_acpi_param wmi_invalid_acpi_params_array[] = {
> +	{
> +		.name = "nested_package",
> +		.obj = {
> +			.package = {
> +				.type = ACPI_TYPE_PACKAGE,
> +				.count = ARRAY_SIZE(nested_package_elements),
> +				.elements = nested_package_elements,
> +			},
> +		},
> +	},
> +	{
> +		.name = "reference",
> +		.obj = {
> +			.reference = {
> +				.type = ACPI_TYPE_LOCAL_REFERENCE,
> +				.actual_type = ACPI_TYPE_ANY,
> +				.handle = NULL,
> +			},
> +		},
> +	},
> +	{
> +		.name = "processor",
> +		.obj = {
> +			.processor = {
> +				.type = ACPI_TYPE_PROCESSOR,
> +				.proc_id = 0,
> +				.pblk_address = 0,
> +				.pblk_length = 0,
> +			},
> +		},
> +	},
> +	{
> +		.name = "power_resource",
> +		.obj = {
> +			.power_resource = {
> +				.type = ACPI_TYPE_POWER,
> +				.system_level = 0,
> +				.resource_order = 0,
> +			},
> +		},
> +	},
> +};
> +
> +static void wmi_invalid_acpi_param_get_desc(const struct wmi_invalid_acpi_param *param, char *desc)
> +{
> +	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(wmi_unmarshal_acpi_object_failure, wmi_invalid_acpi_params_array,
> +		  wmi_invalid_acpi_param_get_desc);
> +
> +static u8 oversized_wmi_string[] = {
> +	0x04, 0x00, 0x00, 0x00,
> +};
> +
> +/*
> + * The error is that 3 bytes can not hold UTF-16 characters
> + * without cutting of the last one.
> + */
> +static u8 undersized_wmi_string[] = {
> +	0x03, 0x00, 0x00, 0x00, 0x00,
> +};
> +
> +static u8 non_ascii_wmi_string[] = {
> +	0x04, 0x00, 0xC4, 0x00, 0x00, 0x00
> +};
> +
> +static const struct wmi_invalid_string_param wmi_invalid_string_params_array[] = {
> +	{
> +		.name = "empty_buffer",
> +		.buffer = {
> +			.length = 0,
> +			.data = ZERO_SIZE_PTR,
> +		},
> +
> +	},
> +	{
> +		.name = "oversized",
> +		.buffer = {
> +			.length = sizeof(oversized_wmi_string),
> +			.data = oversized_wmi_string,
> +		},
> +	},
> +	{
> +		.name = "undersized",
> +		.buffer = {
> +			.length = sizeof(undersized_wmi_string),
> +			.data = undersized_wmi_string,
> +		},
> +	},
> +	{
> +		.name = "non_ascii",
> +		.buffer = {
> +			.length = sizeof(non_ascii_wmi_string),
> +			.data = non_ascii_wmi_string,
> +		},
> +	},
> +};
> +
> +static void wmi_invalid_string_param_get_desc(const struct wmi_invalid_string_param *param,
> +					      char *desc)
> +{
> +	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);

Add include.

-- 
 i.

> +}
> +
> +KUNIT_ARRAY_PARAM(wmi_marshal_string_failure, wmi_invalid_string_params_array,
> +		  wmi_invalid_string_param_get_desc);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(kfree_wrapper, kfree, const void *);
> +
> +static void wmi_unmarshal_acpi_object_test(struct kunit *test)
> +{
> +	const struct wmi_acpi_param *param = test->param_value;
> +	struct wmi_buffer result;
> +	int ret;
> +
> +	ret = wmi_unmarshal_acpi_object(&param->obj, &result);
> +	if (ret < 0)
> +		KUNIT_FAIL_AND_ABORT(test, "Unmarshalling of ACPI object failed\n");
> +
> +	kunit_add_action(test, kfree_wrapper, result.data);
> +
> +	KUNIT_EXPECT_EQ(test, result.length, param->buffer.length);
> +	KUNIT_EXPECT_MEMEQ(test, result.data, param->buffer.data, result.length);
> +}
> +
> +static void wmi_unmarshal_acpi_object_failure_test(struct kunit *test)
> +{
> +	const struct wmi_invalid_acpi_param *param = test->param_value;
> +	struct wmi_buffer result;
> +	int ret;
> +
> +	ret = wmi_unmarshal_acpi_object(&param->obj, &result);
> +	if (ret < 0)
> +		return;
> +
> +	kfree(result.data);
> +	KUNIT_FAIL(test, "Invalid ACPI object was not rejected\n");
> +}
> +
> +static void wmi_marshal_string_test(struct kunit *test)
> +{
> +	const struct wmi_string_param *param = test->param_value;
> +	struct acpi_buffer result;
> +	int ret;
> +
> +	ret = wmi_marshal_string(&param->buffer, &result);
> +	if (ret < 0)
> +		KUNIT_FAIL_AND_ABORT(test, "Marshalling of WMI string failed\n");
> +
> +	kunit_add_action(test, kfree_wrapper, result.pointer);
> +
> +	KUNIT_EXPECT_EQ(test, result.length, strlen(param->string));
> +	KUNIT_EXPECT_STREQ(test, result.pointer, param->string);
> +}
> +
> +static void wmi_marshal_string_failure_test(struct kunit *test)
> +{
> +	const struct wmi_invalid_string_param *param = test->param_value;
> +	struct acpi_buffer result;
> +	int ret;
> +
> +	ret = wmi_marshal_string(&param->buffer, &result);
> +	if (ret < 0)
> +		return;
> +
> +	kfree(result.pointer);
> +	KUNIT_FAIL(test, "Invalid string was not rejected\n");
> +}
> +
> +static struct kunit_case wmi_marshalling_test_cases[] = {
> +	KUNIT_CASE_PARAM(wmi_unmarshal_acpi_object_test,
> +			 wmi_unmarshal_acpi_object_gen_params),
> +	KUNIT_CASE_PARAM(wmi_marshal_string_test,
> +			 wmi_marshal_string_gen_params),
> +	KUNIT_CASE_PARAM(wmi_unmarshal_acpi_object_failure_test,
> +			 wmi_unmarshal_acpi_object_failure_gen_params),
> +	KUNIT_CASE_PARAM(wmi_marshal_string_failure_test,
> +			 wmi_marshal_string_failure_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite wmi_marshalling_test_suite = {
> +	.name = "wmi_marshalling",
> +	.test_cases = wmi_marshalling_test_cases,
> +};
> +
> +kunit_test_suite(wmi_marshalling_test_suite);
> +
> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
> +MODULE_DESCRIPTION("KUnit test for the ACPI-WMI marshalling code");
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +MODULE_LICENSE("GPL");
> 
