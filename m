Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C19C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 14:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237064AbiCJOyQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 09:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244541AbiCJOhI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 09:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B1D2D9968A
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646922706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JrLzakUrMJBAMNgEdvFCs5qEtarTsgRpxeGRRxOBwCM=;
        b=ba9/xNjxKaLVvw+86XlizQApeI/ymxZUgmSvHis0ZCqJ6j+BxHPuSv0erEsaiDfGWd1c/n
        ewVVm8oF6Ox1mmhFgwDBX2Io3i7zBsNgkarnNMW4C9k1C1AyBabs25e4sheLhrlTO+jNHO
        j2ayedsz89h8I0squwYYBIqFjxB+VL4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-vkPjQO6XNtus8tQyLxqWTQ-1; Thu, 10 Mar 2022 09:31:44 -0500
X-MC-Unique: vkPjQO6XNtus8tQyLxqWTQ-1
Received: by mail-ed1-f72.google.com with SMTP id o20-20020aa7dd54000000b00413bc19ad08so3212601edw.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 06:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JrLzakUrMJBAMNgEdvFCs5qEtarTsgRpxeGRRxOBwCM=;
        b=LLIP6EMVxaZydZKGzDaqgP2Z+yyqBWI2n5vcPbKyAJmqKWJSjyRlT3OhTxZPWPviRe
         k5SL+V3+FW0ZJyWw9lYDjEY194CMd10F0ZNql+z36QkP8SG4zpX43IYPk6w31F/fdQlo
         PXmCBC7c5NXrXEapH2CInQg1oDL4oI5jQzyVqN/DoIwHRd0+spEANxjUxK0kSLuwBL/4
         nNgBfgc5fj25BTxNglk9bPo+zfvE454pqIBY+CN7X3jDpjx6GY56PrWFwBU4Q74XsWrq
         Weh8nN5/u369NW7BTvuqJpKsDrB2gA+tapwdIokGqSj94Q/04GgDcoJodhu2QAZnJkWb
         mXEQ==
X-Gm-Message-State: AOAM531tOdWaymOnKcWMFV91oy7PSLKGjNSRU+lxYDs+eaaXLblKt66E
        daiCh2UibWlcehKKwScO5WtxXWC1ZSFuxrFgUKSHGLFwvKwUISziTMk1eoydslq5gkPqdp919nR
        bJN8UcD0UrvkSjSAmeIiSVbUr5QgeFsjGsw==
X-Received: by 2002:a17:907:3da1:b0:6d7:9f9:8d3c with SMTP id he33-20020a1709073da100b006d709f98d3cmr4432347ejc.503.1646922703064;
        Thu, 10 Mar 2022 06:31:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSvGGjs1UAMH/+T6yimS+1xmoCDrbjc2iYUsxmabROLhTHb0TCG6wUph+YsBZu+c0V63dAhQ==
X-Received: by 2002:a17:907:3da1:b0:6d7:9f9:8d3c with SMTP id he33-20020a1709073da100b006d709f98d3cmr4432338ejc.503.1646922702844;
        Thu, 10 Mar 2022 06:31:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id v24-20020a1709067d9800b006daacd199afsm1858364ejo.8.2022.03.10.06.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 06:31:42 -0800 (PST)
Message-ID: <d8704f6d-627a-4409-afa8-6f9193def891@redhat.com>
Date:   Thu, 10 Mar 2022 15:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 3/3] Changing bios_args.data to be dynamically
 allocated
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
 <20220307220932.23607-4-jorge.lopez2@hp.com>
 <BL1PR12MB5157BEF156685B3DE7B09096E2089@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BL1PR12MB5157BEF156685B3DE7B09096E2089@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/7/22 23:12, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: Jorge Lopez <jorgealtxwork@gmail.com>
>> Sent: Monday, March 7, 2022 16:10
>> To: platform-driver-x86@vger.kernel.org
>> Subject: [PATCH v4 3/3] Changing bios_args.data to be dynamically allocated
>>
>> The purpose of this patch is to remove 128 bytes buffer limitation
>> imposed in bios_args structure.
>>
>> A limiting factor discovered during this investigation was the struct
>> bios_args.data size restriction.  The data member size limits all possible
>> WMI commands to those requiring buffer size of 128 bytes or less.
>> Several WMI commands and queries require a buffer size larger than 128
>> bytes hence limiting current and feature supported by the driver.
>> It is for this reason, struct bios_args.data changed and is dynamically
>> allocated.  hp_wmi_perform_query function changed to handle the memory
>> allocation and release of any required buffer size.
>>
>> All changes were validated on a HP ZBook Workstation notebook,
>> HP EliteBook x360, and HP EliteBook 850 G8.  Additional
>> validation was included in the test process to ensure no other
>> commands were incorrectly handled.
>>
>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
>>
>> ---
>> Based on the latest platform-drivers-x86.git/for-next
> 
> Was this meant as "changes from v3->v4"?  Or it's just a comment?
> 
>> ---
> 
> No need for double --.  Just put everything commentary below the one --.

The second cut-line gets added by git format-patch, there is nothing
which can be done about that.

Regards,

Hans


> 
>>  drivers/platform/x86/hp-wmi.c | 59 ++++++++++++++++++++++-------------
>>  1 file changed, 38 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>> index a0aba7db8a1c..a04723fdea60 100644
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -82,12 +82,17 @@ enum hp_wmi_event_ids {
>>  	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
>>  };
>>
>> +/**
>> + * struct bios_args buffer is dynamically allocated.  New WMI command
>> types
>> + * were introduced that exceeds 128-byte data size.  Changes to handle
>> + * the data size allocation scheme were kept in hp_wmi_perform_qurey
>> function.
>> + */
>>  struct bios_args {
>>  	u32 signature;
>>  	u32 command;
>>  	u32 commandtype;
>>  	u32 datasize;
>> -	u8 data[128];
>> +	u8 data[0];
>>  };
>>
>>  enum hp_wmi_commandtype {
>> @@ -268,34 +273,39 @@ static int hp_wmi_perform_query(int query, enum
>> hp_wmi_command command,
>>  	int mid;
>>  	struct bios_return *bios_return;
>>  	int actual_outsize;
>> -	union acpi_object *obj;
>> -	struct bios_args args = {
>> -		.signature = 0x55434553,
>> -		.command = command,
>> -		.commandtype = query,
>> -		.datasize = insize,
>> -		.data = { 0 },
>> -	};
>> -	struct acpi_buffer input = { sizeof(struct bios_args), &args };
>> +	union acpi_object *obj = NULL;
>> +	size_t bios_args_size = sizeof(struct bios_args) + insize;
>> +	struct bios_args *args = NULL;
>> +	struct acpi_buffer input;
>>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>  	int ret = 0;
>>
>> -	mid = encode_outsize_for_pvsz(outsize);
>> -	if (WARN_ON(mid < 0))
>> -		return mid;
>> +	args = kmalloc(bios_args_size, GFP_KERNEL);
>> +	if (!args)
>> +		return -ENOMEM;
>>
>> -	if (WARN_ON(insize > sizeof(args.data)))
>> -		return -EINVAL;
>> -	memcpy(&args.data[0], buffer, insize);
>> +	input.length = bios_args_size;
>> +	input.pointer = args;
>>
>> -	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input,
>> &output);
>> +	mid = encode_outsize_for_pvsz(outsize);
>> +	if (WARN_ON(mid < 0)) {
>> +		ret = mid;
>> +		goto out_free;
>> +	}
>>
>> -	obj = output.pointer;
>> +	memcpy(args->data, buffer, insize);
>>
>> -	if (!obj)
>> -		return -EINVAL;
>> +	args->signature = 0x55434553;
>> +	args->command = command;
>> +	args->commandtype = query;
>> +	args->datasize = insize;
>>
>> -	if (obj->type != ACPI_TYPE_BUFFER) {
>> +	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input,
>> &output);
>> +	if (ret)
>> +		goto out_free;
>> +
>> +	obj = output.pointer;
>> +	if (!obj) {
>>  		ret = -EINVAL;
>>  		goto out_free;
>>  	}
>> @@ -310,6 +320,12 @@ static int hp_wmi_perform_query(int query, enum
>> hp_wmi_command command,
>>  		goto out_free;
>>  	}
>>
>> +	if (obj->type != ACPI_TYPE_BUFFER) {
>> +		pr_warn("query 0x%x returned an invalid object 0x%x\n",
>> query, ret);
>> +		ret = -EINVAL;
>> +		goto out_free;
>> +	}
>> +
>>  	/* Ignore output data of zero size */
>>  	if (!outsize)
>>  		goto out_free;
>> @@ -320,6 +336,7 @@ static int hp_wmi_perform_query(int query, enum
>> hp_wmi_command command,
>>
>>  out_free:
>>  	kfree(obj);
>> +	kfree(args);
>>  	return ret;
>>  }
>>
>> --
>> 2.25.1
> 

