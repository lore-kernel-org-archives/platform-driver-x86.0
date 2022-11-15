Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA473C3A5A7
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 12:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238136AbiKOMTd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 07:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238049AbiKOMTC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 07:19:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B280275CB
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 04:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668514678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2iE84x3h4uXan3TGSNygfvrFo1+GB/y+3rbzvCpgNjY=;
        b=NHDZ/kEPluE4j7Fk2Ph+NNic8QSQaDOQzLOrS6UgJ5Mn77jyqh61Sh+nN9qp6L0otUv91p
        byCqKv0E7H8Z585BYAsjX5ENtFQJo4Boa+WkH5g3lCLa0aocpHBQxh9FT/UwAB4gT6hgQr
        qzNbWRbYYlS8XAxf1lh3FvLgN949bd8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-Y-8i8cU9NX2uaV6BHHFwAQ-1; Tue, 15 Nov 2022 07:17:57 -0500
X-MC-Unique: Y-8i8cU9NX2uaV6BHHFwAQ-1
Received: by mail-ej1-f72.google.com with SMTP id hp16-20020a1709073e1000b007adf5a83df7so7161456ejc.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 04:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iE84x3h4uXan3TGSNygfvrFo1+GB/y+3rbzvCpgNjY=;
        b=oviTvNOxHuZQYibB3ioaNOnmVpk29ydolZSnQ+lIFqSyeQp/vZYXRezCgpZEQqHjMY
         hJvbmSjBirIo1rs5+7iwiIAF1lwuwupKkXqgkQ2WzIobPikxHygCkrT5wfninznJtu2V
         wMzzu+TCLldcvjTME/Zrub9PJaiLaoffvDEuxo85eDgxnXE4HCsmn++f+9jRTcC3xL0L
         vBQTvAkBX8leYE7Y97ALfNmnt0QrJXgtlTQ7Ddii4amu4jZ0jzZDBznLUlh1raUju7wR
         87XNnOi1zy9MwtrcKashTNx4aRm2xE8v2toIY0aXjy/oKsJ4+WsWp3E2YMvLPOZDJljG
         P94w==
X-Gm-Message-State: ANoB5plZRWQwu9lp1LzpNrVEhHyneXqVPuEoxu2nwHGRfLJ7ErQeHMap
        wW4CRBLlKVKDej4yWwFBxmHvPqGibE5KGWAwqIgy/79pcZCO24i0lP2LQrfdFYdXT+mpJyVgfwa
        Y5BK0t9qd+4udpNrN1ZFXCllXBH1uLPDYag==
X-Received: by 2002:a17:906:1597:b0:7ad:ba48:7e7f with SMTP id k23-20020a170906159700b007adba487e7fmr13336894ejd.215.1668514676147;
        Tue, 15 Nov 2022 04:17:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Aqbpwxrh8Z5T63G8ZhYF0G6bk2tbcuOKB2pT0BXcf9UtNMWJWtzVuFAnoyAPRoqt1hjfkXQ==
X-Received: by 2002:a17:906:1597:b0:7ad:ba48:7e7f with SMTP id k23-20020a170906159700b007adba487e7fmr13336877ejd.215.1668514675942;
        Tue, 15 Nov 2022 04:17:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id dk6-20020a0564021d8600b0046146c730easm6133582edb.75.2022.11.15.04.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:17:55 -0800 (PST)
Message-ID: <384ebdbb-a571-279f-71bc-c8c4e3bf6729@redhat.com>
Date:   Tue, 15 Nov 2022 13:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86/amd/pmc: Add new ACPI ID AMDI0009
Content-Language: en-US, nl
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "markgross@kernel.org" <markgross@kernel.org>
References: <20221109083346.361603-1-Shyam-sundar.S-k@amd.com>
 <MN0PR12MB61017CD9A9AB1AEC409D5EEEE2009@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <MN0PR12MB61017CD9A9AB1AEC409D5EEEE2009@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/11/22 18:29, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
>> Sent: Wednesday, November 9, 2022 02:34
>> To: hdegoede@redhat.com; markgross@kernel.org
>> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; platform-driver-
>> x86@vger.kernel.org; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
>> Subject: [PATCH] platform/x86/amd/pmc: Add new ACPI ID AMDI0009
>>
>> Add new a new ACPI ID AMDI0009 used by upcoming AMD platform to the
>> pmc
>> supported list of devices.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Hans,
> 
> As this is just a new ID it should be relatively low risk. The rest of this
> platform's enablement is in 6.0, would you also please consider to take
> this to:
> 
> Cc: stable@vger.kernel.org # 6.0

Done.

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


>> ---
>>  drivers/platform/x86/amd/pmc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c
>> b/drivers/platform/x86/amd/pmc.c
>> index 96e790e639a2..febd798d1fa2 100644
>> --- a/drivers/platform/x86/amd/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc.c
>> @@ -964,6 +964,7 @@ static const struct acpi_device_id
>> amd_pmc_acpi_ids[] = {
>>  	{"AMDI0006", 0},
>>  	{"AMDI0007", 0},
>>  	{"AMDI0008", 0},
>> +	{"AMDI0009", 0},
>>  	{"AMD0004", 0},
>>  	{"AMD0005", 0},
>>  	{ }
>> --
>> 2.25.1
> 

