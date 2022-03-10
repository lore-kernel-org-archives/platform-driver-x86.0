Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96403C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 15:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344806AbiCJPMq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:12:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344882AbiCJPMV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 10:12:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7EEE0692A6
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 07:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646924861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rvHIRvpd13CgLqsri2yobHE1WO98tVZlRSYP0Xx5P3w=;
        b=ImDwGd93VfFN+DjaCeNXVDK3Z00sRjhWPfos35rYZcajdFz6XJbg91NBJu6DaPVATRC8FZ
        qfgL0TOXUKVuyYYhIvLnVSguH5/JUJ0EglpayAybZAvu9F+7PZBne5ud+hGEBbPbLMt/8A
        U1gYw3uBEJTNSoYaDeO9WsTS51NJL/0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-RKQ9Uhv3OUCMbKntmwGy2A-1; Thu, 10 Mar 2022 10:07:39 -0500
X-MC-Unique: RKQ9Uhv3OUCMbKntmwGy2A-1
Received: by mail-ej1-f70.google.com with SMTP id lf15-20020a170906ae4f00b006da86a43346so3255420ejb.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 07:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rvHIRvpd13CgLqsri2yobHE1WO98tVZlRSYP0Xx5P3w=;
        b=4AQgtbeCdqYnykYNLw2LIyInlzU9TrmseCFnH2V4B15PDp3tATyQIm4h+gPrBi9llR
         gkrLVsgLPMNArO+VG2BdB+0teVV3L6kw33YU+UqHBPIk5WbJWlT4Lss6HHcdyP5HzXuI
         xAsMQEHaJ8hIvfqAduxjyZT7jYh8dIXuTpijIVkZaHG5wf84YoJnfk4VS5qanw2WCMmj
         WTM+86AHKZzj9pdFXRcwzBMbb1fQaAdZAWa4+Wis4oYYbhg46zOb9TvtJhl1YG4XvBfm
         z25Vvtu+MtYcrmSz9vkxEV3ldzp3ldx+FDETVizdiAysK2Xj+S1oR5AsebbbpBEczzF7
         RcmA==
X-Gm-Message-State: AOAM533D0JUCeKi5aF4DAje7Qol9Xxs+0TSQQhoFAvTQHCTgCf5gFztN
        0ub5jInIJDu9DVENzPjPpxRHv6/d3jSt9wtCikRmZWo2a3dETTGZtKNxibZLYcfAhRZQOnF1TbH
        6tCZb/8+0W3XWpjbZeRhjPkrRoMeOQ6RD9Q==
X-Received: by 2002:a17:906:7315:b0:6da:820d:4e02 with SMTP id di21-20020a170906731500b006da820d4e02mr4651234ejc.65.1646924858675;
        Thu, 10 Mar 2022 07:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL3IOSW57v7b5enV5OsqFvKslsA5/Zi8GqCSZR5MAB3/JermdbkwCsWc261ihSygEhC0Gz5g==
X-Received: by 2002:a17:906:7315:b0:6da:820d:4e02 with SMTP id di21-20020a170906731500b006da820d4e02mr4651207ejc.65.1646924858274;
        Thu, 10 Mar 2022 07:07:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id b9-20020a1709063ca900b006cea15612cbsm1943816ejh.176.2022.03.10.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 07:07:37 -0800 (PST)
Message-ID: <f031d40b-7162-e15c-ce40-4536486f7a62@redhat.com>
Date:   Thu, 10 Mar 2022 16:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 3/3] Changing bios_args.data to be dynamically
 allocated
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
 <20220307220932.23607-4-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220307220932.23607-4-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/7/22 23:09, Jorge Lopez wrote:
> The purpose of this patch is to remove 128 bytes buffer limitation
> imposed in bios_args structure.
> 
> A limiting factor discovered during this investigation was the struct
> bios_args.data size restriction.  The data member size limits all possible
> WMI commands to those requiring buffer size of 128 bytes or less.
> Several WMI commands and queries require a buffer size larger than 128
> bytes hence limiting current and feature supported by the driver.
> It is for this reason, struct bios_args.data changed and is dynamically
> allocated.  hp_wmi_perform_query function changed to handle the memory
> allocation and release of any required buffer size.
> 
> All changes were validated on a HP ZBook Workstation notebook,
> HP EliteBook x360, and HP EliteBook 850 G8.  Additional
> validation was included in the test process to ensure no other
> commands were incorrectly handled.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 59 ++++++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index a0aba7db8a1c..a04723fdea60 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -82,12 +82,17 @@ enum hp_wmi_event_ids {
>  	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
>  };
>  
> +/**
> + * struct bios_args buffer is dynamically allocated.  New WMI command types
> + * were introduced that exceeds 128-byte data size.  Changes to handle
> + * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
> + */
>  struct bios_args {
>  	u32 signature;
>  	u32 command;
>  	u32 commandtype;
>  	u32 datasize;
> -	u8 data[128];
> +	u8 data[0];

This should be:

	u8 data[];

See:

https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays




>  };
>  
>  enum hp_wmi_commandtype {
> @@ -268,34 +273,39 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  	int mid;
>  	struct bios_return *bios_return;
>  	int actual_outsize;
> -	union acpi_object *obj;
> -	struct bios_args args = {
> -		.signature = 0x55434553,
> -		.command = command,
> -		.commandtype = query,
> -		.datasize = insize,
> -		.data = { 0 },
> -	};
> -	struct acpi_buffer input = { sizeof(struct bios_args), &args };
> +	union acpi_object *obj = NULL;
> +	size_t bios_args_size = sizeof(struct bios_args) + insize;

Please use the struct_size() macro for this, see the end of:

https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays

for an example.

> +	struct bios_args *args = NULL;
> +	struct acpi_buffer input;
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	int ret = 0;
>  
> -	mid = encode_outsize_for_pvsz(outsize);
> -	if (WARN_ON(mid < 0))
> -		return mid;
> +	args = kmalloc(bios_args_size, GFP_KERNEL);
> +	if (!args)
> +		return -ENOMEM;
>  
> -	if (WARN_ON(insize > sizeof(args.data)))
> -		return -EINVAL;
> -	memcpy(&args.data[0], buffer, insize);
> +	input.length = bios_args_size;
> +	input.pointer = args;
>  
> -	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
> +	mid = encode_outsize_for_pvsz(outsize);
> +	if (WARN_ON(mid < 0)) {
> +		ret = mid;
> +		goto out_free;
> +	}
>  
> -	obj = output.pointer;
> +	memcpy(args->data, buffer, insize);
>  
> -	if (!obj)
> -		return -EINVAL;
> +	args->signature = 0x55434553;
> +	args->command = command;
> +	args->commandtype = query;
> +	args->datasize = insize;
>  
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> +	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
> +	if (ret)
> +		goto out_free;
> +
> +	obj = output.pointer;
> +	if (!obj) {
>  		ret = -EINVAL;
>  		goto out_free;
>  	}
> @@ -310,6 +320,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  		goto out_free;
>  	}
>  
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
> +		ret = -EINVAL;
> +		goto out_free;
> +	}
> +
>  	/* Ignore output data of zero size */
>  	if (!outsize)
>  		goto out_free;

Should we maybe have  a "ret = -EINVAL" here, or
maybe ret = 0 ? Or is ret always 0 here already ?

> @@ -320,6 +336,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  
>  out_free:
>  	kfree(obj);
> +	kfree(args);
>  	return ret;
>  }
>  

Otherwise this looks good to me.

Regards,

Hans

