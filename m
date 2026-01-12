Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0970365A06;
	Mon, 12 Jan 2026 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235652; cv=none; b=CZcATeo1H8TcpU3WsZJ+TMt5eBRK7XUu0a4F/dn/6kyLPH41Tbf3gz98XSS42pj4SlDhiCk/rQlOH65IkT3dsxiYqhSggJ8T7DOsgcpR2N8fj3e5Yq9ZrEWdz/LjAZSNbUeYkP0SCJn1PfI2Fyv/qSwYPrPBxLkEc/q6Q5L9vkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235652; c=relaxed/simple;
	bh=u8oTTBSHtJi5NXIoOIGW/SpB1SQo94tKDO2DT9Q+mVc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XrC4Q4iiHBOoHnbZwnE5GZDizSVn6OhwRiWZFr7VMamYsXlKZTmj7CcBpHXjyfUukwhwD5JGs1YI3quvti2IyUH4wAjj7//PMZ3SehiKE6fYGBgdvnT/Js8fcghJHBI5MFBU6UNI8b3CzdXSuT38OhnSxxEfeDMjbNkDPVln51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOMa7Z74; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOMa7Z74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768235650; x=1799771650;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=u8oTTBSHtJi5NXIoOIGW/SpB1SQo94tKDO2DT9Q+mVc=;
  b=gOMa7Z74t6FwxCQv8Ybmke/3qL85MQ/o/uZ2ljO8heFVAoL1ca5MbtdU
   hKhkd1wLG8vBK7/zB3xfu6G8PyIsbyP85rGIsKafANim4dmeIRCzfjg+B
   ESjW1KwY92xcs54aMXaRL4zW6kov3XaM5W0LdbRHU42jkTVZhKDDG9x7n
   8UI7GPzGEG+UdjdmGesMiaADWvxShnaNfMv4njlm1Q4s2P7Zht+Kb3ry/
   lUfC8IVxO1s9WMLGe69pUh6ZjieAsNNGk/vXhC2XpAPnDSa1NCwNHar6D
   60u2J0VFXN1oP5Qa7SPMDctZ4rpDQ4QgiywUUcPEZ7gMmuywjcee3/W5v
   g==;
X-CSE-ConnectionGUID: 1RjrHDmERzemcsASWE0U9g==
X-CSE-MsgGUID: RQtsArWUSiWx7gaKp021Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80234426"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80234426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:34:10 -0800
X-CSE-ConnectionGUID: lqlrwNdMRp2+jTUFCg4UDQ==
X-CSE-MsgGUID: WsLBGQWKS1yiBBvN0hExig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204041272"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:34:07 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Jan 2026 18:34:05 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux@weissschuh.net, 
    Dell.Client.Kernel@dell.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 4/9] platform/wmi: Add kunit test for the string
 conversion code
In-Reply-To: <20260109214619.7289-5-W_Armin@gmx.de>
Message-ID: <c8c399b0-7eda-a12a-61b4-9777e07c98ae@linux.intel.com>
References: <20260109214619.7289-1-W_Armin@gmx.de> <20260109214619.7289-5-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Jan 2026, Armin Wolf wrote:

> The string conversion frunctions provided by the WMI driver core
> have no dependencies on the remaining WMI API, making them suitable
> for unit tests.
> 
> Implement such a unit test using kunit. Those unit tests verify that
> converting between WMI strings and UTF8 strings works as expected.
> They also verify that edge cases are handled correctly.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/wmi/tests/Kconfig        |  11 +
>  drivers/platform/wmi/tests/Makefile       |   3 +
>  drivers/platform/wmi/tests/string_kunit.c | 278 ++++++++++++++++++++++
>  3 files changed, 292 insertions(+)
>  create mode 100644 drivers/platform/wmi/tests/string_kunit.c
> 
> diff --git a/drivers/platform/wmi/tests/Kconfig b/drivers/platform/wmi/tests/Kconfig
> index efcbcb51c251..f7f0f3c540f5 100644
> --- a/drivers/platform/wmi/tests/Kconfig
> +++ b/drivers/platform/wmi/tests/Kconfig
> @@ -14,3 +14,14 @@ config ACPI_WMI_MARSHALLING_KUNIT_TEST
>  	  to the KUnit documentation in Documentation/dev-tools/kunit/.
>  
>  	  If unsure, say N.
> +
> +config ACPI_WMI_STRING_KUNIT_TEST
> +	tristate "KUnit Test for ACPI-WMI string conversion" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds unit tests for the ACPI-WMI string conversion code.
> +	  For more information on KUnit and unit tests in general, please refer
> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.
> +
> +	  If unsure, say N.
> diff --git a/drivers/platform/wmi/tests/Makefile b/drivers/platform/wmi/tests/Makefile
> index 252c3125353a..62c438e26259 100644
> --- a/drivers/platform/wmi/tests/Makefile
> +++ b/drivers/platform/wmi/tests/Makefile
> @@ -6,3 +6,6 @@
>  
>  wmi_marshalling_kunit-y				:= marshalling_kunit.o
>  obj-$(CONFIG_ACPI_WMI_MARSHALLING_KUNIT_TEST)	+= wmi_marshalling_kunit.o
> +
> +wmi_string_kunit-y				:= string_kunit.o
> +obj-$(CONFIG_ACPI_WMI_STRING_KUNIT_TEST)	+= wmi_string_kunit.o
> diff --git a/drivers/platform/wmi/tests/string_kunit.c b/drivers/platform/wmi/tests/string_kunit.c
> new file mode 100644
> index 000000000000..9aa3ffa85090
> --- /dev/null
> +++ b/drivers/platform/wmi/tests/string_kunit.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * KUnit test for the ACPI-WMI string conversion code.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/wmi.h>
> +
> +#include <kunit/resource.h>
> +#include <kunit/test.h>
> +
> +#include <asm/byteorder.h>
> +
> +struct wmi_string_param {
> +	const char *name;
> +	const struct wmi_string *wmi_string;
> +	/*
> +	 * Remember that using sizeof() on a struct wmi_string will
> +	 * always return a size of two bytes due to the flexible
> +	 * array member!
> +	 */
> +	size_t wmi_string_length;
> +	const u8 *utf8_string;
> +	size_t utf8_string_length;
> +};
> +
> +#define TEST_WMI_STRING_LENGTH 12
> +
> +static const struct wmi_string test_wmi_string = {
> +	.length = cpu_to_le16(10),
> +	.chars = {
> +		cpu_to_le16(u'T'),

I've applied this to for-next and intend to keep these there but FYI these 
trigger sparse errors. I don't know if they're fixable or not with 
reasonable effort on kernel side.

$ sparse --version
0.6.4 (Debian: 0.6.4-3)

--
 i.
