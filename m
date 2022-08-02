Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01805C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 12:55:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236745AbiHBMzb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 08:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234134AbiHBMza (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 08:55:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A5F43A463
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659444927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0/XK1qjSHCFllgeTeFH+FAiJ8XML4xORb2K+oSjxxTg=;
        b=FOIR9WCArb2BTBmhAzziTOZ44YS2F23Cu1l0HMITBm8cKwDSGr4iMHpapW/IXSXQ6Yks0F
        EXhYjvZK8SkOrSXWy1D+Ti+QBRHqLLjiG5EEpnlRq8OK0ObYPd9WLiNSZUr2NJTVQoX0tG
        7kURyYP3uwbpTSgE1kf0ABjPOtns0dI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-meXQWDsrP5CX09dejq4KdA-1; Tue, 02 Aug 2022 08:55:26 -0400
X-MC-Unique: meXQWDsrP5CX09dejq4KdA-1
Received: by mail-ed1-f72.google.com with SMTP id e6-20020a056402190600b0043bde36ab23so9142721edz.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 05:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0/XK1qjSHCFllgeTeFH+FAiJ8XML4xORb2K+oSjxxTg=;
        b=Iae+u37pA9tJwvO0z01p16NOJg+FsXoToN6GptBglVgfxIFjRc26EfWgP7FVV5R19P
         CJllU60VRqBEzhJq/dLUv+d6Aeb88WwWq3wkEO5hd72obnYwaTOKFNvmOf7hCUTtMKDA
         tE5kxeA30CVKwrttWKz+J4hAmHx304houFwifbr22SGQ/QTBoJy/CAuxbbIqI9aueWbg
         zhpmyA4KXLROpF+qpRPUljiTvc0+gXjCwoCA+MIg8WS1PoDxULAHl/F7rrJcAgRykU6U
         9AviX3ECnAVRkaTU6jyEFbDgbhpA1wwJaBrV6DGMrwZpqqmZ1IIwKLRdfZ0/9qUfNyPg
         RuVQ==
X-Gm-Message-State: AJIora89zw4ImYvac6Iwx5rrwrPE8f0QbvGSLQJAKB5hz1Ftx0c3ccED
        cKfUFiMMEVcFywZTHCdSgWiWqOpD5cjDclZ1JLg8h1OTqYGWQYiNT/9+Kll69k/TqD7OcXxxNAw
        9xyFLvLAI09UwXAJ/ovFb3DkQvMuKfbHMdA==
X-Received: by 2002:a17:907:7292:b0:72f:d76:b243 with SMTP id dt18-20020a170907729200b0072f0d76b243mr16256617ejc.230.1659444925359;
        Tue, 02 Aug 2022 05:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vqR61BTXfOok0OEW6HCyZ2Ga6TC37qrq2uWGp6EkVRx8TiLEaECpbL5xex+xFL9qVi4aMPpA==
X-Received: by 2002:a17:907:7292:b0:72f:d76:b243 with SMTP id dt18-20020a170907729200b0072f0d76b243mr16256600ejc.230.1659444925111;
        Tue, 02 Aug 2022 05:55:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906311700b0072b2ef2757csm6204749ejx.180.2022.08.02.05.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 05:55:24 -0700 (PDT)
Message-ID: <b553fcca-91dc-504a-106a-053c724f4833@redhat.com>
Date:   Tue, 2 Aug 2022 14:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 02/11] platform/x86/amd/pmf: Add support for PMF APCI
 layer
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
 <20220802112545.2118632-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802112545.2118632-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 13:25, Shyam Sundar S K wrote:
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
>  drivers/platform/x86/amd/pmf/acpi.c   | 153 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |   1 +
>  drivers/platform/x86/amd/pmf/pmf.h    |  23 ++++
>  4 files changed, 178 insertions(+), 1 deletion(-)
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
> index 000000000000..5269d48b1f5f
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -0,0 +1,153 @@
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
> +static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct acpi_buffer *param)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_handle ahandle = ACPI_HANDLE(pdev->dev);
> +	struct acpi_object_list apmf_if_arg_list;
> +	union acpi_object apmf_if_args[2];
> +	acpi_status status;
> +
> +	apmf_if_arg_list.count = 2;
> +	apmf_if_arg_list.pointer = &apmf_if_args[0];
> +
> +	apmf_if_args[0].type = ACPI_TYPE_INTEGER;
> +	apmf_if_args[0].integer.value = fn;
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
> +	status = acpi_evaluate_object(ahandle, "APMF", &apmf_if_arg_list, &buffer);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(pdev->dev, "APMF method call failed\n");

For the next version please also log the fn variable here, so that is
clear for which call the error is happening.

> +		if (status != AE_NOT_FOUND)
> +			kfree(buffer.pointer);

buffer.pointer is initialized to NULL, so no need to check status,
just call kfree(buffer.pointer); unconditionally here.

Regards,

Hans


> +
> +		return NULL;
> +	}
> +
> +	return buffer.pointer;
> +}
> +
> +static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
> +{
> +	union acpi_object *info;
> +	size_t size;
> +	int err = 0;
> +
> +	info = apmf_if_call(pdev, fn, NULL);
> +	if (!info)
> +		return -EIO;
> +
> +	if (info->type != ACPI_TYPE_BUFFER) {
> +		dev_err(pdev->dev, "object is not a buffer\n");
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (info->buffer.length < 2) {
> +		dev_err(pdev->dev, "buffer too small\n");
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	size = *(u16 *)info->buffer.pointer;
> +	if (info->buffer.length < size) {
> +		dev_err(pdev->dev, "buffer smaller then headersize %u < %zu\n",
> +			info->buffer.length, size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (size < out_sz) {
> +		dev_err(pdev->dev, "buffer too small %zu\n", size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	memcpy(dest, info->buffer.pointer, out_sz);
> +
> +out:
> +	kfree(info);
> +	return err;
> +}
> +
> +int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
> +{
> +	/* If bit-n is set, that indicates function n+1 is supported */
> +	return !!(pdev->supported_func & BIT(index - 1));
> +}
> +
> +static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
> +{
> +	struct apmf_verify_interface output;
> +	int err;
> +
> +	err = apmf_if_call_store_buffer(pdev, APMF_FUNC_VERIFY_INTERFACE, &output, sizeof(output));
> +	if (err)
> +		return err;
> +
> +	pdev->supported_func = output.supported_functions;
> +	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
> +		output.supported_functions, output.notification_mask);
> +
> +	return 0;
> +}
> +
> +static int apmf_get_system_params(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_system_params params;
> +	int err;
> +
> +	if (!is_apmf_func_supported(dev, APMF_FUNC_GET_SYS_PARAMS))
> +		return -EINVAL;
> +
> +	err = apmf_if_call_store_buffer(dev, APMF_FUNC_GET_SYS_PARAMS, &params, sizeof(params));
> +	if (err)
> +		return err;
> +
> +	dev_dbg(dev->dev, "system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
> +		params.valid_mask,
> +		params.flags,
> +		params.command_code);
> +	params.flags = params.flags & params.valid_mask;
> +
> +	return 0;
> +}
> +
> +int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
> +{
> +	int ret;
> +
> +	ret = apmf_if_verify_interface(pmf_dev);
> +	if (ret) {
> +		dev_err(pmf_dev->dev, "APMF verify interface failed :%d\n", ret);
> +		goto out;
> +	}
> +
> +	ret = apmf_get_system_params(pmf_dev);
> +	if (ret) {
> +		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
> +		goto out;
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
> index 1c2e942e5096..bdadbff168ee 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -11,6 +11,12 @@
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
> @@ -30,6 +36,21 @@
>  #define GET_STT_LIMIT_APU	0x20
>  #define GET_STT_LIMIT_HS2	0x21
>  
> +/* AMD PMF BIOS interfaces */
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
> @@ -38,9 +59,11 @@ struct amd_pmf_dev {
>  	u32 cpu_id;
>  	struct device *dev;
>  	struct mutex lock; /* protects the PMF interface */
> +	u32 supported_func;
>  };
>  
>  /* Core Layer */
> +int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>  
>  #endif /* PMF_H */

