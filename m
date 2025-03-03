Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F2D212B34
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Mar 2025 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741009276; cv=none; b=PlZJ9Bmosxs48enl2nWwO7JiF51uFInwTG0WKHOe9tvK14QfbW9Onb0mDP6imfmrSkl09WUrKhVIUpEUtIFVwxSicRocsjODqTz+Mey6K2PNdJGwjF0jV4GvxXeBnjyIGJJtoMgOr/DJGOQKgCzP9guCIp5eWqdK1+JDgGiQq5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741009276; c=relaxed/simple;
	bh=aeMvAT17042BtfL/IpGfoeKyBKZPAnMUYGKpbhDJI7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8DWtX/TaTQsg2SjsxaNnENa/AvIz9f4tdAwEEOhlq+75qweuaKvhb/+/zo/CRPLNA6e0jMCxvBky3ZIbOeMDr7mdOEG9GnJuRCivw9CFdwW9JWefmRjHfmeorUYpk+E0mZwow6NJ5WHijT/xOAxZcLiyOnPj7/ynvMF3f6IPL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d/ag1vLr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d/ag1vLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741009273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iefXvX3pMp47Dzkf3+ysKe2mkAh2HFa1RNhZSRAia6M=;
	b=d/ag1vLrI+5V3pz8IR2okawP24rhCfbFXbIMovikwjLUmESFc3V0RJDIoe2JtKajtD8m9s
	6SC1lLfp2t0rwVxbk8zXyGwPXtCyeygs6dXKmk+Y5ONdSseMyg5QR6FbfsAshP1pwBo2lV
	F24xBswDpgWCm6a4UF6bs09+HybCuKk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-ijrxTV48OqiW_KaNdZRNmg-1; Mon, 03 Mar 2025 08:41:07 -0500
X-MC-Unique: ijrxTV48OqiW_KaNdZRNmg-1
X-Mimecast-MFC-AGG-ID: ijrxTV48OqiW_KaNdZRNmg_1741009266
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e550e71966so956598a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Mar 2025 05:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741009266; x=1741614066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iefXvX3pMp47Dzkf3+ysKe2mkAh2HFa1RNhZSRAia6M=;
        b=Dkbb0/YMx3LZA2UGsoS9BfOT1yIJwWIY8s8h3b2RfQyrXU1VXVNava+/l7snfQboej
         iW0hHoZ+zWS/TqQZcU57tPPnTa0aSq+IU03qoPZsHD+tZ8ahW7eO/gdXi4DQjQl6JrKY
         ZPI9wRZIjrupbwks74pgRXAmTzsLOc9IbZQEd92F9nFEPvlggObzyHW9QOr4b9bZ6fqN
         HEQJkK2hPx/fEXbreH5OAt+r7MttJt13he3IptwHeD5rk6k9rUzR/2kUTZ3Jxi/upNhA
         8PzHsC20IXPMb2ipsakWg/ImOcm2LR+yFgEcE5SowY2GGcuQNliJGaqvbqjd/uUsiI/9
         jFCQ==
X-Gm-Message-State: AOJu0YwY/odXKj5tIW+t9t2IO0bPb0hQZiJucRNrt56w9dfH2JMFC+9y
	WLX2LdgsGm8ya4uXpziSHgw05pldp8X5utAQUBnjo/K6oyYKBQijffKUGklIBaDGQrytMbFVxZB
	0vAJLkoHhHpo6QDt8jMScGrIxQN3WAnx+AGDP1en6Rz5zRJHZfFDHhkLoSX1n8ta4W7fqdng=
X-Gm-Gg: ASbGnct03zAYbvUhe/gY5zkD97ewOFF/l0o7+jOQlvOcBnW9MiAp99osqRNa0PwUNGg
	reCjqWfoVGjvWY1ynMcI3rySEEJ/QAGPMCqugBCLukTejHwOg2RDwPl8UcnrN3qy9a2jyL9UsOc
	GW98wNctI911p/He6M+iSPtUwBrSN35rAnqKGVUNxofahctv9UODe3CEf4nQqAC+qzlrlZ+JPaC
	oDcvWsV6D5952bcfWVEDaS2Lz6KhtoznXLuPqY8ecKZUUE9B2B8phVDrYNdwGB8AaEP2zcAmmVr
	UcI0nENT6iEFSCtshGY=
X-Received: by 2002:a05:6402:254d:b0:5e4:cfe8:3502 with SMTP id 4fb4d7f45d1cf-5e4d6afa314mr15430333a12.17.1741009264016;
        Mon, 03 Mar 2025 05:41:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw+N+h2RM3Y9DCNRWclwdG5Vz8ZTSM7z6QJd5l/2loxNdR3YQEu3drealeX71uDlwNoPmkCA==
X-Received: by 2002:a05:6402:254d:b0:5e4:cfe8:3502 with SMTP id 4fb4d7f45d1cf-5e4d6afa314mr15430311a12.17.1741009263565;
        Mon, 03 Mar 2025 05:41:03 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b70112sm6735702a12.31.2025.03.03.05.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 05:41:02 -0800 (PST)
Message-ID: <cd25d131-bead-4a38-98dc-1011c2843286@redhat.com>
Date: Mon, 3 Mar 2025 14:41:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: amd: Add ISP platform info
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com
References: <20250228170238.3484860-1-pratap.nirujogi@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250228170238.3484860-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Pratap,

Thank you for your patch.

On 28-Feb-25 18:02, Pratap Nirujogi wrote:
> Add ov05c i2c boardinfo and GPIO pin info for AMD ISP platform.
> 
> Details of the resources added:
> 
> - Added i2c bus number for AMD ISP platform is 99.
> - Added GPIO 85 to allow ISP driver to enable and disable ISP access.
> - Added GPIO 0 to allow sensor driver to enable and disable sensor module.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>  drivers/platform/x86/amd/Kconfig   | 11 +++++
>  drivers/platform/x86/amd/Makefile  |  1 +
>  drivers/platform/x86/amd/amd_isp.c | 72 ++++++++++++++++++++++++++++++
>  3 files changed, 84 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/amd_isp.c
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index c3e086ea64fc..4b373edd750d 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>  
>  	  This mechanism will only be activated on platforms that advertise a
>  	  need for it.
> +
> +config AMD_ISP_PLATFORM
> +	bool "AMD platform with ISP4 that supports Camera sensor device"
> +	depends on I2C && X86_64 && AMD_ISP4
> +	help
> +	  For AMD platform that support Image signal processor generation 4, it
> +	  is necessary to add platform specific camera sensor module board info
> +	  which includes the sensor driver device id and the i2c address.
> +
> +	  If you have a AMD platform that support ISP4 and with a sensor
> +	  connected to it, say Y here
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index 56f62fc9c97b..0d89e2d4f7e6 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
>  obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>  obj-$(CONFIG_AMD_PMF)		+= pmf/
>  obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> +obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp.o
> diff --git a/drivers/platform/x86/amd/amd_isp.c b/drivers/platform/x86/amd/amd_isp.c
> new file mode 100644
> index 000000000000..751f209e9509
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp.c
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/gpio/machine.h>
> +
> +#define AMDISP_I2C_BUS		99

I'm not a fan of using static i2c-bus numbers for this. static bus numbers are
something of the past and we typically do not use these on x86 anymore.

Using this static number + i2c_register_board_info() also requires this code
to be builtin rather then modular which is also undesirable.

For a more dynamic way of manually adding i2c-devices see:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/dell/dell-lis3lv02d.c

But a better question here is why instantiate the sensor i2c device
manually at all.

ACPI has a standardized way to describe I2C-clients which tyically
is used for all I2C devices on ACPI platforms like I2C touchscreens /
touchpads / audio-codecs / accelerometers / etc.
I don't see why the camera sensor on AMD platforms is so special that
it could not be described in ACPI using an ACPI child-device of the
i2c-controller with a ACPI resource (_CRS entry) of the I2cSerialBusV2()
type.

Likewise the sensor enable GPIO should also be described in the ACPI
table as a Gpio type resource in the same _CRS table.

Can you run acpidump -o acpidump.txt on a laptop with this camera
sensor and send me the acpidupm.txt offlist ? Please run this
on a production hardware laptop model using production firmware.

I suspect that Windows will also be using the ACPI description
for the sensor so we really should figure out what Windows is doing
here.

As Mario mentioned we cannot just assume that the GPIOs +
sensor address and model are valid for all laptops. Ideally we should
be getting this information from ACPI rather then hardcoding it
in the kernel.

> +
> +static struct gpiod_lookup_table isp_gpio_table = {
> +	.dev_id = "amd_isp_capture",
> +	.table = {
> +		GPIO_LOOKUP("AMDI0030:00", 85, "enable_isp", GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};

This too really should be an Gpio() type ACPI resource on the ACPI device
node for the ISP.

How/where is this "amd_isp_capture" device created ?

Regards,

Hans


> +
> +static struct gpiod_lookup_table isp_sensor_gpio_table = {
> +	.dev_id = "ov05c",
> +	.table = {
> +		GPIO_LOOKUP("amdisp-pinctrl", 0, "sensor0_enable", GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};
> +
> +static struct i2c_board_info sensor_info = {
> +	.dev_name = "ov05c",
> +	I2C_BOARD_INFO("ov05c", 0x10),
> +};
> +
> +static int __init amd_isp_init(void)
> +{
> +	int ret;
> +
> +	gpiod_add_lookup_table(&isp_gpio_table);
> +	gpiod_add_lookup_table(&isp_sensor_gpio_table);
> +
> +	ret = i2c_register_board_info(AMDISP_I2C_BUS, &sensor_info, 1);
> +	if (ret)
> +		pr_err("%s: cannot register i2c board devices:%s",
> +		       __func__, sensor_info.dev_name);
> +
> +	return ret;
> +}
> +
> +arch_initcall(amd_isp_init);
> +
> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("AMD ISP Platform parameters");
> +MODULE_LICENSE("GPL and additional rights");

