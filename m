Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF44C04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 13:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbiG0N5r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 09:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbiG0N5q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 09:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CCFB71F2F9
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658930263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DsZEoKW1zw0v92nyprXXXVoELcAdYVpH/+xYPtaMJtM=;
        b=LB6aKVEgq5UWdOW4KOvjjQ/e2Ff7dpKq39EaIZK+LVgU8BPub+YEQawvdvIJyG4B/4PhyX
        09LrEtBJ0CNBw9wgxnkDTwWzXORXCdXnDxHh11kvUpCvKqp8YM0i55rEJ3N71JfW1OAQSP
        XigBkiVNKFeaGs9yT3+J9ewuO0YcuQU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-fUUQ4qTVOI6lw-Ux6jMI-A-1; Wed, 27 Jul 2022 09:57:42 -0400
X-MC-Unique: fUUQ4qTVOI6lw-Ux6jMI-A-1
Received: by mail-ed1-f71.google.com with SMTP id m20-20020a056402431400b0043be03aa310so7215962edc.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 06:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DsZEoKW1zw0v92nyprXXXVoELcAdYVpH/+xYPtaMJtM=;
        b=CigtJvocBMd8Z08TDyC0fb6sw1OPlbvxCjQJOVbeFQzb44Hw+0oXCkk1nfbEhV0LHw
         wR23F+OMNDWBrOiyersVmxBa6d7zfHQV3GxSuRzVDVAGMVoOpJfrV4EjM4/CyFckeWxE
         vn8VVtZZVkI4TiAQwc1vkYXlihVf413Xbm3nUOvjpTOJneKTjk1bPzcbVOWjeYSd0xh2
         l8TvgdlKpjx9EerOJ1yjX5NhVilpGUaL1+R/cC6ioYobCujKDWsSvXOmGOkhJgHidGc7
         kaN2qNfifGJMaxdAJbBKxhx29g3fGq4BQoQs6hfAYcKu1btrHOd9vSM76MrQLcVy0dWQ
         j0gQ==
X-Gm-Message-State: AJIora+QRb8H93orvoU//Eqgoy0MxJqE4YAoFxbomhXLMUKQWUsb4Ljx
        dKDc0LDTH4hij+l3tJvJJSF/2KL1rCdW4PgPv3DkEwABNIoBqr24eP2Z7jJwKQkXIj4Wn8XMCb/
        oGi/vjV3MPLORjVOr8S3VssZEOZsyroYg6g==
X-Received: by 2002:a05:6402:4014:b0:43b:cd24:fff3 with SMTP id d20-20020a056402401400b0043bcd24fff3mr23535407eda.351.1658930261418;
        Wed, 27 Jul 2022 06:57:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1spu+8UFODQa54yBvksXt/rDsfrj9PISMfd5JgT9LKZoRqsP+11AgcnBYxsQ9bpdO8eS4qgbQ==
X-Received: by 2002:a05:6402:4014:b0:43b:cd24:fff3 with SMTP id d20-20020a056402401400b0043bcd24fff3mr23535381eda.351.1658930260917;
        Wed, 27 Jul 2022 06:57:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g21-20020aa7c855000000b0043bd753174esm7967968edt.27.2022.07.27.06.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 06:57:40 -0700 (PDT)
Message-ID: <2dc85390-3a45-dec1-934d-09b3f09fa434@redhat.com>
Date:   Wed, 27 Jul 2022 15:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 03/15] platform/x86/amd/pmf: Add support for PMF APCI
 layer
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-4-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> PMF driver implements the ACPI methods as defined by AMD for PMF Support.
> The ACPI layer acts as a glue that helps in providing the infrastructure
> for OEMs customization.
> 
> OEMs can refer to PMF support documentation to decide on the list of
> functions to be supported on their specific platform model.
> 
> AMD mandates that PMF ACPI fn0 and fn1 to be implemented which
> provides the set of functions, params and the notifications that
> would be sent to PMF driver so that PMF driver can adapt and
> react.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>  drivers/platform/x86/amd/pmf/acpi.c   | 188 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |   1 +
>  drivers/platform/x86/amd/pmf/pmf.h    |  32 +++++
>  4 files changed, 222 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/acpi.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index 459005f659e5..2617eba773ce 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -5,4 +5,4 @@
>  #
>  
>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
> -amd-pmf-objs := core.o
> +amd-pmf-objs := core.o acpi.o
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> new file mode 100644
> index 000000000000..addcaae5675c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Platform Management Framework Driver
> + *
> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include "pmf.h"
> +
> +#define APMF_METHOD "\\_SB_.PMF_.APMF"
> +
> +static unsigned long supported_func;
> +
> +static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask);
> +
> +static union acpi_object *apmf_if_call(struct apmf_if *apmf_if, int func, struct acpi_buffer *param)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_object_list apmf_if_arg_list;
> +	union acpi_object apmf_if_args[2];
> +	acpi_status status;
> +
> +	apmf_if_arg_list.count = 2;
> +	apmf_if_arg_list.pointer = &apmf_if_args[0];
> +
> +	apmf_if_args[0].type = ACPI_TYPE_INTEGER;
> +	apmf_if_args[0].integer.value = func;
> +
> +	if (param) {
> +		apmf_if_args[1].type = ACPI_TYPE_BUFFER;
> +		apmf_if_args[1].buffer.length = param->length;
> +		apmf_if_args[1].buffer.pointer = param->pointer;
> +	} else {
> +		apmf_if_args[1].type = ACPI_TYPE_INTEGER;
> +		apmf_if_args[1].integer.value = 0;
> +	}
> +
> +	status = acpi_evaluate_object(apmf_if->handle, NULL, &apmf_if_arg_list, &buffer);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("PMF: APMF method call failed\n");
> +		if (status != AE_NOT_FOUND)
> +			kfree(buffer.pointer);
> +
> +		return NULL;
> +	}
> +
> +	return buffer.pointer;
> +}
> +
> +static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
> +{
> +	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
> +}
> +
> +static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ampf_if)
> +{
> +	struct apmf_verify_interface output;
> +	union acpi_object *info;
> +	size_t size;
> +	int err = 0;
> +
> +	info = apmf_if_call(ampf_if, APMF_FUNC_VERIFY_INTERFACE, NULL);
> +	if (!info)
> +		return -EIO;
> +

You are missing the following checks here:

	if (info->type != ACPI_TYPE_BUFFER) {
		dev_err(pdev->dev, "object is not a buffer\n");
		err = -EINVAL;
		goto out;
	}

	if (info->buffer.length < 2) }
		dev_err(pdev->dev, "buffer too small\n");
		err = -EINVAL;
		goto out;
	}

> +	size = *(u16 *)info->buffer.pointer;

And here you are missing:

	if (info->buffer.length < size) {
		dev_err(pdev->dev, "buffer smaller then headersize %zu < %zu\n",
			info->buffer.length, size);
		err = -EINVAL;
		goto out;
	}

> +
> +	if (size < sizeof(output)) {
> +		dev_err(pdev->dev, "buffer too small %zu\n", size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	size = min(sizeof(output), size);

You already know that size >= sizeof(output) because of the above if
so this boils down to:

	size = sizeof(output);



> +	memset(&output, 0, sizeof(output));

Since the memcpy size == sizeof(output), this memset is not necessary,
please drop it.

> +	memcpy(&output, info->buffer.pointer, size);
> +	apmf_if_parse_functions(&ampf_if->func, output.supported_functions);
> +	supported_func = output.supported_functions;
> +	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
> +		output.supported_functions, output.notification_mask);
> +
> +out:
> +	kfree(info);
> +	return err;
> +}
> +
> +int is_apmf_func_supported(unsigned long index)
> +{
> +	/* If bit-n is set, that indicates function n+1 is supported */
> +	return ((supported_func & (1 << (index - 1))) != 0);
> +}
> +
> +static int apmf_get_system_params(struct apmf_if *ampf_if)
> +{
> +	struct apmf_system_params params;
> +	union acpi_object *info;
> +	size_t size;
> +	int err = 0;
> +
> +	info = apmf_if_call(ampf_if, APMF_FUNC_GET_SYS_PARAMS, NULL);
> +	if (!info) {
> +		err = -EIO;
> +		goto out;
> +	}
> +
> +	size = *(u16 *)info->buffer.pointer;
> +
> +	if (size < sizeof(params)) {
> +		pr_err("PMF: buffer too small %zu\n", size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	size = min(sizeof(params), size);

All the same remarks wrt size handling as above. It would be good
to write a common helper for this, which takes a void *pointer to the
struct to fill as well as the struct size as parameters and then do
the apmf_if_call() + all the size checks + memcpy in the helper.


> +	memset(&params, 0, sizeof(params));
> +	memcpy(&params, info->buffer.pointer, size);
> +
> +	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
> +		 params.valid_mask,
> +		 params.flags,
> +		 params.command_code);
> +	params.flags = params.flags & params.valid_mask;
> +
> +out:
> +	kfree(info);
> +	return err;
> +}
> +
> +static acpi_handle apmf_if_probe_handle(void)
> +{
> +	acpi_handle handle = NULL;
> +	char acpi_method_name[255] = { 0 };

Please also use ACPI_FULL_PATHNAME here, like you do below
in the acpi_get_name() call.

> +	struct acpi_buffer buffer = { sizeof(acpi_method_name), acpi_method_name };

Please always use named struct initializers.

> +	acpi_status status;
> +
> +	status = acpi_get_handle(NULL, (acpi_string) APMF_METHOD, &handle);
> +	if (ACPI_SUCCESS(status))
> +		goto out;
> +
> +	pr_err("PMF: APMF handle not found\n");
> +	return NULL;
> +
> +out:
> +	acpi_get_name(handle, ACPI_FULL_PATHNAME, &buffer);

You already know the name since you just looked up the handle by its
ACPI path, so this is not useful and can be dropped.

> +	pr_debug("PMF: APMF handle %s found\n", acpi_method_name);
> +	return handle;
> +}
> +
> +int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
> +{
> +	acpi_handle apmf_if_handle;
> +	struct apmf_if *apmf_if;
> +	int ret;
> +
> +	apmf_if_handle = apmf_if_probe_handle();
> +	if (!apmf_if_handle)
> +		goto out;
> +
> +	apmf_if = kzalloc(sizeof(*apmf_if), GFP_KERNEL);
> +	if (!apmf_if)
> +		goto out;
> +
> +	apmf_if->handle = apmf_if_handle;
> +
> +	ret = apmf_if_verify_interface(pmf_dev, apmf_if);
> +	if (ret) {
> +		dev_err(pmf_dev->dev, "APMF verify interface failed :%d\n", ret);
> +		kfree(apmf_if);
> +		goto out;
> +	}
> +	pmf_dev->apmf_if = apmf_if;
> +
> +	if (apmf_if->func.system_params) {

Maybe move this if check to inside apmf_get_system_params() ?

> +		ret = apmf_get_system_params(apmf_if);
> +		if (ret) {
> +			dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
> +			kfree(apmf_if);
> +			goto out;
> +		}
> +	}
> +
> +out:
> +	return ret;
> +}
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index aef97965c181..c5002b7bb904 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -204,6 +204,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (!dev->regbase)
>  		return -ENOMEM;
>  
> +	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  
>  	mutex_init(&dev->lock);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index ab773aa5a6e1..40f038eb6197 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -10,6 +10,12 @@
>  #ifndef PMF_H
>  #define PMF_H
>  
> +#include <linux/acpi.h>
> +
> +/* APMF Functions */
> +#define APMF_FUNC_VERIFY_INTERFACE			0
> +#define APMF_FUNC_GET_SYS_PARAMS			1
> +
>  /* Message Definitions */
>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
>  #define SET_SPPT			0x05 /* SPPT: Slow Package Power Tracking */
> @@ -29,6 +35,30 @@
>  #define GET_STT_LIMIT_APU	0x20
>  #define GET_STT_LIMIT_HS2	0x21
>  
> +/* AMD PMF BIOS interfaces */
> +struct apmf_if_functions {
> +	bool system_params;
> +};
> +
> +struct apmf_if {
> +	acpi_handle handle;
> +	struct apmf_if_functions func;
> +};
> +
> +struct apmf_verify_interface {
> +	u16 size;
> +	u16 version;
> +	u32 notification_mask;
> +	u32 supported_functions;
> +} __packed;
> +
> +struct apmf_system_params {
> +	u16 size;
> +	u32 valid_mask;
> +	u32 flags;
> +	u8 command_code;
> +} __packed;
> +
>  struct amd_pmf_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -38,10 +68,12 @@ struct amd_pmf_dev {
>  	u32 hi;
>  	u32 low;
>  	struct device *dev;
> +	struct apmf_if *apmf_if;
>  	struct mutex lock; /* protects the PMF interface */
>  };
>  
>  /* Core Layer */
> +int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>  
>  #endif /* PMF_H */


Regards,

Hans

