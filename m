Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A055C77B70
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 09:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjDQJgB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 05:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjDQJfy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 05:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B531BE1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681724009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cHr2WdOjSs9BopZLugcJ3JL6xeQQEOb/bphFwfXEDmE=;
        b=AF2JwUbdAFfawMPxYoOzLQHLyCto8nBWJrnym/yFy3Tse56MHZCwGROWurWF56XxYyUsMn
        55IFcYZpQjD9H27Cdn9sGh74H+8fSzs3AqE1+2+TqL8DuidtwaghFmuHWl8Ah22ARz9PZM
        t7eNxdnHNtloIYqf4jczjk613+uwgts=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-uAaJ1nYvMfmKmCVuDMh16Q-1; Mon, 17 Apr 2023 05:33:27 -0400
X-MC-Unique: uAaJ1nYvMfmKmCVuDMh16Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94eaa8f18eeso119940566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 02:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681724007; x=1684316007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHr2WdOjSs9BopZLugcJ3JL6xeQQEOb/bphFwfXEDmE=;
        b=WjZqP3lOb6VhrEveYn2zgrlY7iNs8PvZ3d3R2Qra3ekzebMT8YnCc57FPxj19GYEwn
         WIw0kAwPnqHjsW3+TlXFaLwinNIEzwneRebLcdGGv1/Gb/qKXbdhGiijzGcuWrxswxJ5
         gNDKQLwqmFPakN4Hsu0YFCf8NpnAoT+6UZ+HOK+vimAmJJ6LJoGIfduUFKUyq5w7Kcu7
         ES5qcXL13qunPmSwwUX7OUkXqNX0ORDzTthI2ixtKMDaRZCLtvEMZXQwl7iM738Z5DjF
         izzfDHL3DlOscO7Nw3tUyB5wFZ+XoLtSEZgnI2PVGpjldqMhX2zVyFTrzdE1+lwzU3/b
         N2OA==
X-Gm-Message-State: AAQBX9c+8lfrwHZAioZi0Nh3g3SDaI7INpPcQ+YkPPEWldRDsFLyhKno
        Y9YZpFZ55fWUYXBaggQWvJo5dI8r+1QPAfUsTYeqyqCV4TLW2qi3xU5fmCv64JJYmzipgWc6/nR
        sTE4WLerqSh5zKiuDI9h3Z43BU0ea/a6CIA==
X-Received: by 2002:a05:6402:209:b0:506:741e:5c14 with SMTP id t9-20020a056402020900b00506741e5c14mr13130938edv.30.1681724006778;
        Mon, 17 Apr 2023 02:33:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLAYM1bs3qCkldmaV9H41+yBA7NDbAsnoyKPyXWNzp/2YurKW+Pz6VR62I5nh2GZhYIoSdug==
X-Received: by 2002:a05:6402:209:b0:506:741e:5c14 with SMTP id t9-20020a056402020900b00506741e5c14mr13130920edv.30.1681724006445;
        Mon, 17 Apr 2023 02:33:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p11-20020aa7d30b000000b0050696b9e78fsm2695296edq.81.2023.04.17.02.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 02:33:25 -0700 (PDT)
Message-ID: <389eb60d-ba58-7bcf-eda6-b6db5b0e2cd9@redhat.com>
Date:   Mon, 17 Apr 2023 11:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: amd: pmc: provide user message where s0ix
 is not supported
Content-Language: en-US, nl
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "markgross@kernel.org" <markgross@kernel.org>
Cc:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20230412111500.2602529-1-Shyam-sundar.S-k@amd.com>
 <MN0PR12MB6101DDEDF1410015A35DBF7DE29B9@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <MN0PR12MB6101DDEDF1410015A35DBF7DE29B9@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/12/23 16:23, Limonciello, Mario wrote:
> [Public]
> 
>> Some platforms do not support hardware backed s0i3 transitions. When such
>> CPUs are detected, provide a warning message to the user.
>>
>> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> Based on review-hans. Apologies, I missed this change in the earlier
>> series.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Hmm. I find it a bit weird to add a cpu-id, causing the module
to get loaded, just to print a warning and then abort the probe().

But I guess this will help you with debugging AMD suspend/resume
issues so I'll take this:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
>>
>>  drivers/platform/x86/amd/pmc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c
>> b/drivers/platform/x86/amd/pmc.c
>> index bb7597ca334f..3d2a377f4424 100644
>> --- a/drivers/platform/x86/amd/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc.c
>> @@ -93,6 +93,7 @@
>>  #define AMD_CPU_ID_YC			0x14B5
>>  #define AMD_CPU_ID_CB			0x14D8
>>  #define AMD_CPU_ID_PS			0x14E8
>> +#define AMD_CPU_ID_SP			0x14A4
>>
>>  #define PMC_MSG_DELAY_MIN_US		50
>>  #define RESPONSE_REGISTER_LOOP_MAX	20000
>> @@ -913,6 +914,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
>>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
>>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>>  	{ }
>>  };
>>
>> @@ -1022,6 +1024,13 @@ static int amd_pmc_probe(struct platform_device
>> *pdev)
>>  	}
>>
>>  	dev->cpu_id = rdev->device;
>> +
>> +	if (dev->cpu_id == AMD_CPU_ID_SP) {
>> +		dev_warn_once(dev->dev, "S0i3 is not supported on this
>> hardware\n");
>> +		err = -ENODEV;
>> +		goto err_pci_dev_put;
>> +	}
>> +
>>  	dev->rdev = rdev;
>>  	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
>>  	if (err) {
>> --
>> 2.25.1
> 

