Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C772DC28CF5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jan 2022 20:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiAZUDU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jan 2022 15:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40388 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229534AbiAZUDT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jan 2022 15:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643227398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YA1fJCJVGx0HIVPV5S8E0xXYcQoT/M3H2C13KbjNkzs=;
        b=hwttRGM2hrNzve5hqRIQTFoCS4QY/xyGOovaa6v7S+ljpxgPtcHKRVtxR3wOCiA6UBohY7
        gSLPK//NH3dPS/+bluQVLzEgUeIJUnIWSFejyrMlWqilV45xIPyy8HI36ww+tsyogQAAFa
        XTBjxGOsnW+DMSBAZQG5PoltMj5YWpA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-MVGsmpzAOXiIxmY569N6zA-1; Wed, 26 Jan 2022 15:03:17 -0500
X-MC-Unique: MVGsmpzAOXiIxmY569N6zA-1
Received: by mail-ed1-f71.google.com with SMTP id h21-20020aa7c955000000b0040390b2bfc5so231336edt.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jan 2022 12:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YA1fJCJVGx0HIVPV5S8E0xXYcQoT/M3H2C13KbjNkzs=;
        b=ly5uWPy+xeyIVzrL/g15uVjAdJq8CbndwsiGyCcw5ucrXRJqPf9WPqLSzOo4NVYUz1
         5RtqvrjbdwQJqTBqqiFUGnM+njiTIwITAkGIaltlBX5h2O9Cu5G1o/Zoa/IjT4arfN53
         aKJQrbDGXmJhCRPR+iPymkXAqDq79+TdWOY2Vaq0ph87t2g4IsR4qLuMqHkfZ6RMzWZR
         SsBI/bg4Ojqgj39UnGdb049SIt9vFTrQgOzdRQkGpCZcBQYGYt9O931wvCBsWf2UydCj
         nhg7KUDretvtt6FpI+G0OEeu9FC7xlbmOFPwEQ1OKiHEMJ9tqGM8DOBbDHFaSyIP3Drt
         5K7g==
X-Gm-Message-State: AOAM533sgA1UcIFyIya3VtTUy5DdQleDKpgp3dI7JmT/U/w+As5lWi5V
        lU9SEAl7J4HMwBoPSRa3fV0HgebaaKH2WOr3RPGECW8kt6j4Vu7zMTn/nSjLiIT2e7aaBnQnAMZ
        La9AH1iztxUiA00x3Xd9oVkgosL5ZS0Ugmg==
X-Received: by 2002:a17:907:1c11:: with SMTP id nc17mr312691ejc.320.1643227395853;
        Wed, 26 Jan 2022 12:03:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7dG+eK28i3hHq6OG9FO/AdWbSEG1RuxUaHeJqmEeGy5qPrW9guAxhPZ80F9nybZgCLNZWPw==
X-Received: by 2002:a17:907:1c11:: with SMTP id nc17mr312674ejc.320.1643227395592;
        Wed, 26 Jan 2022 12:03:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id j3sm7862454ejm.152.2022.01.26.12.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 12:03:15 -0800 (PST)
Message-ID: <85f50641-fc14-ee82-81b0-d2f72c022c6b@redhat.com>
Date:   Wed, 26 Jan 2022 21:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Fix incorrect
 use of platform profile on AMD platforms
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        mario.limonciello@amd.com
References: <markpearson@lenovo.com>
 <20220121201722.3423-1-markpearson@lenovo.com>
 <cedb4ef6-867b-7c00-2f77-1ad7b07c5aa2@redhat.com>
 <a3df9ada-29d1-d172-6144-2093fa345366@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a3df9ada-29d1-d172-6144-2093fa345366@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/22 17:49, Mark Pearson wrote:
> 
> On 1/24/22 05:42, Hans de Goede wrote:
>> Hi Mark,
>>
>> On 1/21/22 21:17, Mark Pearson wrote:
>>> Lenovo AMD based platforms have been offering platform_profiles but they
>>> are not working correctly. This is because the mode we are using on the
>>> Intel platforms (MMC) is not available on the AMD platforms.
>>>
>>> This commit adds checking of the functional capabilities returned by the
>>> BIOS to confirm if MMC is supported or not. Profiles will not be
>>> available if the platform is not MMC capable.
>>>
>>> I'm investigating and working on an alternative for AMD platforms but
>>> that is still work-in-progress.
>>>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>> ---
>>>   drivers/platform/x86/thinkpad_acpi.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>> index 9c632df734bb..42a04e44135b 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -10026,6 +10026,9 @@ static struct ibm_struct proxsensor_driver_data = {
>>>   #define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
>>>   #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>>>   +#define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
>>> +#define DYTC_FC_MMC           27 /* MMC Mode supported */
>>> +
>>>   #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
>>>   #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
>>>   @@ -10253,6 +10256,16 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>>>       if (dytc_version >= 5) {
>>>           dbg_printk(TPACPI_DBG_INIT,
>>>                   "DYTC version %d: thermal mode available\n", dytc_version);
>> This code has been refactored and this will not apply as is:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=0b0d2fba4f3302b601c429c9286e66b3af2d29cb
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=798682e236893a20e5674de02ede474373dd342d
>>
>> Please rebase on top of 5.17-rc1
> My apologies - I thought I was on the latest. Will rebase

No problem.


>>
>>> +
>>> +        /* Check what capabilities are supported. Currently MMC is needed */
>>> +        err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
>>> +        if (err)
>>> +            return err;
>>> +        if (!test_bit(DYTC_FC_MMC, (void *)&output)) {
>>> +            dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
>>> +            return 0;
>> This should be return -ENODEV;
> 
> I'll double check, but I don't think we want an error here as we want to continue on, it's just the feature is not supported so 0 is OK?

-ENODEV is treated as "feature not supported" and will not cause any
errors be printed and probing will continue normally with an -ENODEV
error.

Where as 0 will still cause the corresponding exit function to get
called on module unload, causing platform_profile_remove() to get
called even though we never registered the platform_profile handler.
So -ENODEV is better.

Regards,

Hans

