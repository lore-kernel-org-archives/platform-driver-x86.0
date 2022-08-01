Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CE6C00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 12:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbiHAMxi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 08:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbiHAMxS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 08:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2EBF646DB3
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 05:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659358115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OoqLd3doK+LofJyCsxhmHdsL1HRp7tbTbcBvstsun8c=;
        b=IU6CwMJvbljC81cfOC5YJui9Sjta+DgaXggR0IwtMxjqTx2aqI+o9NzSeeNI30TySVx38F
        93Wih2f8uaYO4SoL2rVwzslX+nHXsWsTC5afLQlVN9/TKWSG6NFUsQvCUGjZnSKM/SKtAr
        /qpJOq7tKh4tsQYbGEJ7xUy0HdPyKfA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-E6wlCJu7PPaJ5qCAJkznYw-1; Mon, 01 Aug 2022 08:48:34 -0400
X-MC-Unique: E6wlCJu7PPaJ5qCAJkznYw-1
Received: by mail-ed1-f70.google.com with SMTP id f13-20020a0564021e8d00b00437a2acb543so7032027edf.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 05:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OoqLd3doK+LofJyCsxhmHdsL1HRp7tbTbcBvstsun8c=;
        b=rmxWqUv9VDP8o+pUtGxfNU+X4hEx2/lMgDlRHqgMGqKA06qz1V+Uvwx4SUYqLCdmTX
         BvnCdLsSWiWfSLgdApsxlQCHBEKsNie7fsMcIVIJnNd7nHQLtaDpcQ4/FSWfIFZtu5N6
         ZQnn7dIXEMisAGNl+UK/u6heQnY4pYAFH5p8GRn6327Hw7BaIjlcdYF6ukgH5SQBxBun
         BWuSTeVoP/3RmffGNPhLeS6U3Iede6c+iamyxsC1LE8YZBNHUwLkuJ6k3VRXw+PnNMjn
         YR46LnxSRJkzmw1UnUogHbOZ7kn5vzfbPf6KCFcsbxwBZK/ITSCNk2j3B/ArZSxhTQ+T
         yCXA==
X-Gm-Message-State: AJIora9hPOm/9afZ87Sc1kp5LzXoJO/tFDGzIMVR4RiRrZDE4BengKLh
        +InOplXqYGRWLFO2kstPSWLpIrw7C/k0WLJH7Y/fz5Z18gT2tAYEyGJm4CKRnywr84jzaUXC1PN
        UeGtWYcCI176PLkSzFeM0Bi9CEAOeGQEoDg==
X-Received: by 2002:a17:906:5d04:b0:722:f46c:b891 with SMTP id g4-20020a1709065d0400b00722f46cb891mr12280214ejt.4.1659358113024;
        Mon, 01 Aug 2022 05:48:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfFn7L9jD+AGkhX5PBI0EiJGRNkdm87hAlMkSDPzn8umWzGvIwEcg0NT5Kn772FBvkrtKQ7w==
X-Received: by 2002:a17:906:5d04:b0:722:f46c:b891 with SMTP id g4-20020a1709065d0400b00722f46cb891mr12280203ejt.4.1659358112812;
        Mon, 01 Aug 2022 05:48:32 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7dc16000000b0043d2424aeefsm5268420edu.87.2022.08.01.05.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 05:48:32 -0700 (PDT)
Message-ID: <ca75e2b7-e18d-4610-af16-b4ef8fb9f95d@redhat.com>
Date:   Mon, 1 Aug 2022 14:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 02/11] platform/x86/amd/pmf: Add support for PMF
 APCI layer
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 20:20, Shyam Sundar S K wrote:
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
>  drivers/platform/x86/amd/pmf/acpi.c   | 182 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |   1 +
>  drivers/platform/x86/amd/pmf/pmf.h    |  32 +++++
>  4 files changed, 216 insertions(+), 1 deletion(-)
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
> index 000000000000..bd796d7e1d96
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -0,0 +1,182 @@
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
> +static int apmf_if_call_store_buffer(struct apmf_if *apmf_if, int func, void *dest, size_t out_sz)
> +{
> +	union acpi_object *info;
> +	size_t size;
> +	int err = 0;
> +
> +	info = apmf_if_call(apmf_if, func, NULL);
> +	if (!info)
> +		return -EIO;
> +
> +	if (info->type != ACPI_TYPE_BUFFER) {
> +		pr_err("object is not a buffer\n");
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (info->buffer.length < 2) {
> +		pr_err("buffer too small\n");
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	size = *(u16 *)info->buffer.pointer;
> +	if (info->buffer.length < size) {
> +		pr_err("buffer smaller then headersize %u < %zu\n",
> +		       info->buffer.length, size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (size < out_sz) {
> +		pr_err("buffer too small %zu\n", size);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	size = out_sz;
> +	memcpy(dest, info->buffer.pointer, size);
> +
> +out:
> +	kfree(info);
> +	return err;
> +}
> +
> +static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
> +{
> +	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;

I just noticed that this is not correct, this should be:

	func->system_params = mask & BIT(APMF_FUNC_GET_SYS_PARAMS - 1);

Which for APMF_FUNC_GET_SYS_PARAMS happens to be the same, but for
other AMPF_FUNC_* values the difference does matter!

Also this information is duplicated by:

is_apmf_func_supported(APMF_FUNC_GET_SYS_PARAMS) please drop the
apmf_if_functions struct and use is_apmf_func_supported() everywhere.

Note this means that you also will need to drop func->sbios_heartbeat
which does not come from the mask and which is initialized in
a different place rather then inside apmf_if_parse_functions() which
already shows that sbios_hearbeat does not really belong inside
this struct.

Instead of moving the sbios_heartbeat flag, please just directly
use notify_cfg.hb_interval inside apmf_acpi_deinit(). This will also
make the cancel_delayed_work_sync(&pmf_dev->heart_beat) condition
match the queue condition 1:1.


> +}
> +
> +int is_apmf_func_supported(unsigned long index)
> +{
> +	/* If bit-n is set, that indicates function n+1 is supported */
> +	return ((supported_func & (1 << (index - 1))) != 0);

Please write this as:

	return (supported_func & BIT(index - 1)) != 0;

or as:

	return !!(supported_func & BIT(index - 1));


> +}
> +
> +static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
> +{
> +	struct apmf_verify_interface output;
> +	int err;
> +
> +	err = apmf_if_call_store_buffer(apmf_if, APMF_FUNC_VERIFY_INTERFACE,
> +					&output, sizeof(output));
> +	if (err)
> +		return err;
> +
> +	apmf_if_parse_functions(&apmf_if->func, output.supported_functions);
> +	supported_func = output.supported_functions;
> +	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
> +		output.supported_functions, output.notification_mask);
> +
> +	return 0;
> +}
> +
> +static int apmf_get_system_params(struct apmf_if *apmf_if)
> +{
> +	struct apmf_system_params params;
> +	int err;
> +
> +	if (apmf_if->func.system_params) {
> +		err = apmf_if_call_store_buffer(apmf_if, APMF_FUNC_GET_SYS_PARAMS,
> +						&params, sizeof(params));
> +		if (err)
> +			return err;
> +	}
> +
> +	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
> +		 params.valid_mask,
> +		 params.flags,
> +		 params.command_code);
> +	params.flags = params.flags & params.valid_mask;
> +
> +	return 0;
> +}
> +
> +int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
> +{
> +	acpi_handle apmf_if_handle;
> +	struct apmf_if *apmf_if;
> +	acpi_status status;
> +	int ret;
> +
> +	status = acpi_get_handle(NULL, (acpi_string) APMF_METHOD, &apmf_if_handle);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
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

After dropping the apmf_if_functions sub-struct from amp_if amp_if only contains
an acpi_handle. Please just store the handle (and later on also the struct
apmf_notification_cfg) directly inside struct amd_pmf_dev, this also removes
the need for doing the whole alloc + free + associated error handling dance here.

Regsards,

Hans


> +
> +	ret = apmf_get_system_params(apmf_if);
> +	if (ret) {
> +		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
> +		kfree(apmf_if);
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
> index 1c2e942e5096..08c6bc0e2b42 100644
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
> @@ -30,6 +36,30 @@
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
> @@ -37,10 +67,12 @@ struct amd_pmf_dev {
>  	u32 base_addr;
>  	u32 cpu_id;
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

