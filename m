Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80702C00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 13:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiHANSe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 09:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiHANSd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 09:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C9CE2B267
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659359911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nmwDeLQvJDLKEJgLy8vWuAULGkgEWIC8QOStKrp6Mzs=;
        b=EdtQVjQ5AI2Cjh+xbYtsGZwNkT+/DR9rhJxJSz1jvCtuDlo57I/N9MJiNobCUfhRc/Mr8/
        tXOypm3oZqONMZwBT6kuJUda1hAAksdFt4itSttVmrwn0dUlUHjWSGEqMVrohW5qY9aMem
        v5zBNnMC5B0hkBldEdng5y0mt8EHtbs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91--xNMJrSiOxOARkUA1sl7Pg-1; Mon, 01 Aug 2022 09:18:30 -0400
X-MC-Unique: -xNMJrSiOxOARkUA1sl7Pg-1
Received: by mail-ed1-f69.google.com with SMTP id c9-20020a05640227c900b0043ad14b1fa0so7130309ede.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 06:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=nmwDeLQvJDLKEJgLy8vWuAULGkgEWIC8QOStKrp6Mzs=;
        b=1ncxcUP5on5OoDgFYDlneurPxJFK3mp060tHBKiDKTdlZg76KohLXYT54pcxmfQ19I
         +BlEne5c70IUn5U7hZoeqZArOeX4Tvo8GFJvmnHVpYfIWl72Rh16hMWhlVD2kUJXtsh3
         he0ByIEufWH7iuSzcUQ1sW9TdA0QD1am4OatRLqdJrWifHHczXm+KQZ6msfCke0YTIq0
         FaQdgpCqltXnzlJdvirWIkcfyKlFz5hui+TB+AN/L9vLMNGibp4TeRYcYa8NZU055LTQ
         DEIbaobrGUfHN4Y9eVSSAVccGq/t62bvFK7z9pmVdYKzWC0/haQNLGJiZMKd9Eciq6vk
         BU3Q==
X-Gm-Message-State: AJIora91/gJ48nV86T+O+ZEq1QyRjMBv1smUBxTNrMU0lKMakOC5Ql5/
        KEoDIx87BMbIfV7ZHdH+QjMzZkOtU45LLvH2csLxEJmCW1meNXeuGCxO9s6bz/z2cSnslQCXeoI
        VZZsWt25UQl9rBodLRHBYHOjPm2NlUfGLdg==
X-Received: by 2002:a17:907:3e11:b0:72b:49d1:2054 with SMTP id hp17-20020a1709073e1100b0072b49d12054mr12707098ejc.78.1659359909486;
        Mon, 01 Aug 2022 06:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUCwSo/ZwlnSMxpdIPrrAqu+o4P39ja/eZLvs4zI2cSCHxhov2xr9GN06YlgSehA39IJNIrg==
X-Received: by 2002:a17:907:3e11:b0:72b:49d1:2054 with SMTP id hp17-20020a1709073e1100b0072b49d12054mr12707073ejc.78.1659359909184;
        Mon, 01 Aug 2022 06:18:29 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id kf23-20020a17090776d700b00718d18a1860sm5195568ejc.61.2022.08.01.06.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 06:18:28 -0700 (PDT)
Message-ID: <83e3c4d6-79c4-2ceb-c366-8f03b4be886f@redhat.com>
Date:   Mon, 1 Aug 2022 15:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 02/11] platform/x86/amd/pmf: Add support for PMF
 APCI layer
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-3-Shyam-sundar.S-k@amd.com>
 <ca75e2b7-e18d-4610-af16-b4ef8fb9f95d@redhat.com>
In-Reply-To: <ca75e2b7-e18d-4610-af16-b4ef8fb9f95d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/1/22 14:48, Hans de Goede wrote:
> Hi,
> 
> On 7/28/22 20:20, Shyam Sundar S K wrote:
>> PMF driver implements the ACPI methods as defined by AMD for PMF Support.
>> The ACPI layer acts as a glue that helps in providing the infrastructure
>> for OEMs customization.
>>
>> OEMs can refer to PMF support documentation to decide on the list of
>> functions to be supported on their specific platform model.
>>
>> AMD mandates that PMF ACPI fn0 and fn1 to be implemented which
>> provides the set of functions, params and the notifications that
>> would be sent to PMF driver so that PMF driver can adapt and
>> react.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>>  drivers/platform/x86/amd/pmf/acpi.c   | 182 ++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/core.c   |   1 +
>>  drivers/platform/x86/amd/pmf/pmf.h    |  32 +++++
>>  4 files changed, 216 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/platform/x86/amd/pmf/acpi.c
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
>> index 459005f659e5..2617eba773ce 100644
>> --- a/drivers/platform/x86/amd/pmf/Makefile
>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>> @@ -5,4 +5,4 @@
>>  #
>>  
>>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>> -amd-pmf-objs := core.o
>> +amd-pmf-objs := core.o acpi.o
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> new file mode 100644
>> index 000000000000..bd796d7e1d96
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -0,0 +1,182 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD Platform Management Framework Driver
>> + *
>> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include "pmf.h"
>> +
>> +#define APMF_METHOD "\\_SB_.PMF_.APMF"
>> +
>> +static unsigned long supported_func;
>> +
>> +static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask);
>> +
>> +static union acpi_object *apmf_if_call(struct apmf_if *apmf_if, int func, struct acpi_buffer *param)
>> +{
>> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	struct acpi_object_list apmf_if_arg_list;
>> +	union acpi_object apmf_if_args[2];
>> +	acpi_status status;
>> +
>> +	apmf_if_arg_list.count = 2;
>> +	apmf_if_arg_list.pointer = &apmf_if_args[0];
>> +
>> +	apmf_if_args[0].type = ACPI_TYPE_INTEGER;
>> +	apmf_if_args[0].integer.value = func;
>> +
>> +	if (param) {
>> +		apmf_if_args[1].type = ACPI_TYPE_BUFFER;
>> +		apmf_if_args[1].buffer.length = param->length;
>> +		apmf_if_args[1].buffer.pointer = param->pointer;
>> +	} else {
>> +		apmf_if_args[1].type = ACPI_TYPE_INTEGER;
>> +		apmf_if_args[1].integer.value = 0;
>> +	}
>> +
>> +	status = acpi_evaluate_object(apmf_if->handle, NULL, &apmf_if_arg_list, &buffer);
>> +	if (ACPI_FAILURE(status)) {
>> +		pr_err("PMF: APMF method call failed\n");

Since the plan is to drop struct apmf_if and to directly store the
handle in amd_pmf_dev we will now have an amd_pmf_dev here so
please use dev_err() instead of pr_err() here.

>> +		if (status != AE_NOT_FOUND)
>> +			kfree(buffer.pointer);
>> +
>> +		return NULL;
>> +	}
>> +
>> +	return buffer.pointer;
>> +}
>> +
>> +static int apmf_if_call_store_buffer(struct apmf_if *apmf_if, int func, void *dest, size_t out_sz)
>> +{
>> +	union acpi_object *info;
>> +	size_t size;
>> +	int err = 0;
>> +
>> +	info = apmf_if_call(apmf_if, func, NULL);
>> +	if (!info)
>> +		return -EIO;
>> +
>> +	if (info->type != ACPI_TYPE_BUFFER) {
>> +		pr_err("object is not a buffer\n");

Since the plan is to drop struct apmf_if and to directly store the
handle in amd_pmf_dev we will now have an amd_pmf_dev here so
please use dev_err() instead of pr_err() here.

This also means that adding the:

#define pr_fmt(fmt) "AMD-PMF: " fmt

line will no longer be necessary.

>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	if (info->buffer.length < 2) {
>> +		pr_err("buffer too small\n");
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	size = *(u16 *)info->buffer.pointer;
>> +	if (info->buffer.length < size) {
>> +		pr_err("buffer smaller then headersize %u < %zu\n",
>> +		       info->buffer.length, size);
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	if (size < out_sz) {
>> +		pr_err("buffer too small %zu\n", size);
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	size = out_sz;
>> +	memcpy(dest, info->buffer.pointer, size);
>> +
>> +out:
>> +	kfree(info);
>> +	return err;
>> +}
>> +
>> +static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>> +{
>> +	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
> 
> I just noticed that this is not correct, this should be:
> 
> 	func->system_params = mask & BIT(APMF_FUNC_GET_SYS_PARAMS - 1);
> 
> Which for APMF_FUNC_GET_SYS_PARAMS happens to be the same, but for
> other AMPF_FUNC_* values the difference does matter!
> 
> Also this information is duplicated by:
> 
> is_apmf_func_supported(APMF_FUNC_GET_SYS_PARAMS) please drop the
> apmf_if_functions struct and use is_apmf_func_supported() everywhere.
> 
> Note this means that you also will need to drop func->sbios_heartbeat
> which does not come from the mask and which is initialized in
> a different place rather then inside apmf_if_parse_functions() which
> already shows that sbios_hearbeat does not really belong inside
> this struct.
> 
> Instead of moving the sbios_heartbeat flag, please just directly
> use notify_cfg.hb_interval inside apmf_acpi_deinit(). This will also
> make the cancel_delayed_work_sync(&pmf_dev->heart_beat) condition
> match the queue condition 1:1.
> 
> 
>> +}
>> +
>> +int is_apmf_func_supported(unsigned long index)
>> +{
>> +	/* If bit-n is set, that indicates function n+1 is supported */
>> +	return ((supported_func & (1 << (index - 1))) != 0);
> 
> Please write this as:
> 
> 	return (supported_func & BIT(index - 1)) != 0;
> 
> or as:
> 
> 	return !!(supported_func & BIT(index - 1));
> 
> 

Also please make this function take a "struct amd_pmf_dev *pdev" argument
and add an "u32 supported_func" to amd_pmf_dev instead of making it a global
variable.

Regards,

Hans



>> +}
>> +
>> +static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
>> +{
>> +	struct apmf_verify_interface output;
>> +	int err;
>> +
>> +	err = apmf_if_call_store_buffer(apmf_if, APMF_FUNC_VERIFY_INTERFACE,
>> +					&output, sizeof(output));
>> +	if (err)
>> +		return err;
>> +
>> +	apmf_if_parse_functions(&apmf_if->func, output.supported_functions);
>> +	supported_func = output.supported_functions;
>> +	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
>> +		output.supported_functions, output.notification_mask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int apmf_get_system_params(struct apmf_if *apmf_if)
>> +{
>> +	struct apmf_system_params params;
>> +	int err;
>> +
>> +	if (apmf_if->func.system_params) {
>> +		err = apmf_if_call_store_buffer(apmf_if, APMF_FUNC_GET_SYS_PARAMS,
>> +						&params, sizeof(params));
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
>> +		 params.valid_mask,
>> +		 params.flags,
>> +		 params.command_code);
>> +	params.flags = params.flags & params.valid_mask;
>> +
>> +	return 0;
>> +}
>> +
>> +int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>> +{
>> +	acpi_handle apmf_if_handle;
>> +	struct apmf_if *apmf_if;
>> +	acpi_status status;
>> +	int ret;
>> +
>> +	status = acpi_get_handle(NULL, (acpi_string) APMF_METHOD, &apmf_if_handle);
>> +	if (ACPI_FAILURE(status))
>> +		return -ENODEV;
>> +
>> +	apmf_if = kzalloc(sizeof(*apmf_if), GFP_KERNEL);
>> +	if (!apmf_if)
>> +		goto out;
>> +
>> +	apmf_if->handle = apmf_if_handle;
>> +
>> +	ret = apmf_if_verify_interface(pmf_dev, apmf_if);
>> +	if (ret) {
>> +		dev_err(pmf_dev->dev, "APMF verify interface failed :%d\n", ret);
>> +		kfree(apmf_if);
>> +		goto out;
>> +	}
>> +	pmf_dev->apmf_if = apmf_if;
> 
> After dropping the apmf_if_functions sub-struct from amp_if amp_if only contains
> an acpi_handle. Please just store the handle (and later on also the struct
> apmf_notification_cfg) directly inside struct amd_pmf_dev, this also removes
> the need for doing the whole alloc + free + associated error handling dance here.
> 
> Regsards,
> 
> Hans
> 
> 
>> +
>> +	ret = apmf_get_system_params(apmf_if);
>> +	if (ret) {
>> +		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
>> +		kfree(apmf_if);
>> +		goto out;
>> +	}
>> +
>> +out:
>> +	return ret;
>> +}
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index aef97965c181..c5002b7bb904 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -204,6 +204,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	if (!dev->regbase)
>>  		return -ENOMEM;
>>  
>> +	apmf_acpi_init(dev);
>>  	platform_set_drvdata(pdev, dev);
>>  
>>  	mutex_init(&dev->lock);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 1c2e942e5096..08c6bc0e2b42 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -11,6 +11,12 @@
>>  #ifndef PMF_H
>>  #define PMF_H
>>  
>> +#include <linux/acpi.h>
>> +
>> +/* APMF Functions */
>> +#define APMF_FUNC_VERIFY_INTERFACE			0
>> +#define APMF_FUNC_GET_SYS_PARAMS			1
>> +
>>  /* Message Definitions */
>>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
>>  #define SET_SPPT			0x05 /* SPPT: Slow Package Power Tracking */
>> @@ -30,6 +36,30 @@
>>  #define GET_STT_LIMIT_APU	0x20
>>  #define GET_STT_LIMIT_HS2	0x21
>>  
>> +/* AMD PMF BIOS interfaces */
>> +struct apmf_if_functions {
>> +	bool system_params;
>> +};
>> +
>> +struct apmf_if {
>> +	acpi_handle handle;
>> +	struct apmf_if_functions func;
>> +};
>> +
>> +struct apmf_verify_interface {
>> +	u16 size;
>> +	u16 version;
>> +	u32 notification_mask;
>> +	u32 supported_functions;
>> +} __packed;
>> +
>> +struct apmf_system_params {
>> +	u16 size;
>> +	u32 valid_mask;
>> +	u32 flags;
>> +	u8 command_code;
>> +} __packed;
>> +
>>  struct amd_pmf_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -37,10 +67,12 @@ struct amd_pmf_dev {
>>  	u32 base_addr;
>>  	u32 cpu_id;
>>  	struct device *dev;
>> +	struct apmf_if *apmf_if;
>>  	struct mutex lock; /* protects the PMF interface */
>>  };
>>  
>>  /* Core Layer */
>> +int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>>  
>>  #endif /* PMF_H */

