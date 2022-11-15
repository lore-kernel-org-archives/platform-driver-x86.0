Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB22C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 11:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbiKOLkk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 06:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiKOLkj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 06:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD59F7E
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 03:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668512379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=clJblXD10wtzgzD9dPDP2bGq4INWjHFqJItPDD4Hsv0=;
        b=GZQZYbZIXthKRbUpB+LvOWF2xBOQbd/OqBGz6S/s/fXI5Crw/7/OTdeutOe8Q/DG+iKibN
        B3vusQzeRLK09rrWHux05osMRfFnEx9vkmQIsO8FyV42tzYJhlqrYpZqHC8NLyQBgVI7rO
        tXbdTVhRffRkFnSLzt+BprHHVe0Nmlk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-6Bv-mHUIMc-yvQwtZbvxAA-1; Tue, 15 Nov 2022 06:39:37 -0500
X-MC-Unique: 6Bv-mHUIMc-yvQwtZbvxAA-1
Received: by mail-ed1-f72.google.com with SMTP id h9-20020a05640250c900b00461d8ee12e2so9919560edb.23
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 03:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clJblXD10wtzgzD9dPDP2bGq4INWjHFqJItPDD4Hsv0=;
        b=U/hlMK0gbwin0vxfcG22FfTTPV+OqeSKaTusEkWafUHy56k7phsoF9cLlB60w8ovku
         1ZfO9qIrxC48Yh9A7kGX6mrICJwzaxKetDmCOEAZqtWyKlp0uPHe2bOVkBVuFNINnfR/
         DZ9uj/v7RMTF7sF6EyxP065c/Qvw4Y+GmNbochfL07mdpUmDOr12/sW14nel1QDm0qjw
         Yc3Gwf8Epi3ILXI282KAKQZaxMLCjZljK8RbT662LSO4ejGnEVFStP8Q7uvjBYVJ1tNG
         Usq9PmyPySuoixkV+gJAqsCo9ZPZJg/h3koinSaFNss6zZwVhObB1yVd6D5D3QHsr2xS
         pSZA==
X-Gm-Message-State: ANoB5pmPBUTXChmHso6FyLQvQ/tV7ZsHG6kZ+CrYARFrKieeuq/jC1Un
        QlES4pDZbD3HlZCPWaxAe4HMWIo6JTqCbGHqHfBtAqNvAbb7RRwihoUibQ3pOxWf851pgl3OlO4
        vp5jDOBTcnnFSZ7hGhc8ubkn8O6fVyLrMhA==
X-Received: by 2002:a17:906:95d1:b0:7ad:b9f3:a66a with SMTP id n17-20020a17090695d100b007adb9f3a66amr13975581ejy.282.1668512376687;
        Tue, 15 Nov 2022 03:39:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6X0v0rVFVgQR/Ee2b2v/q8p2rGqG/St+w6cQIpP6qRC1fhgioIAclUhTJm1L5FHSpDJEhUog==
X-Received: by 2002:a17:906:95d1:b0:7ad:b9f3:a66a with SMTP id n17-20020a17090695d100b007adb9f3a66amr13975572ejy.282.1668512376516;
        Tue, 15 Nov 2022 03:39:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ay26-20020a056402203a00b00461816beef9sm6000717edb.14.2022.11.15.03.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 03:39:35 -0800 (PST)
Message-ID: <edd01f60-63fc-3556-4790-1684d4d059cc@redhat.com>
Date:   Tue, 15 Nov 2022 12:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] x86/thinkpad_acpi: Enable s2idle quirk for 21A1 machine
 type
Content-Language: en-US, nl
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        =?UTF-8?Q?Lennard_G=c3=a4her?= <gaeher@mpi-sws.org>
Cc:     hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20221108072023.17069-1-gaeher@mpi-sws.org>
 <abbd370f-4240-db15-5add-b848a5108c21@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <abbd370f-4240-db15-5add-b848a5108c21@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/8/22 13:47, Limonciello, Mario wrote:
> On 11/8/2022 01:20, Lennard Gäher wrote:
>> Previously, the s2idle quirk was only active for the 21A0 machine type
>> of the P14s Gen2a product. This also enables it for the second 21A1 type,
>> thus reducing wake-up times from s2idle.
>>
>> Signed-off-by: Lennard Gäher <gaeher@mpi-sws.org>
>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2181

Thank you, I've applied the patch with both tags added:

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> 
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 20e5c043a8e8..8476dfef4e62 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -4497,6 +4497,14 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
>>               DMI_MATCH(DMI_PRODUCT_NAME, "21A0"),
>>           }
>>       },
>> +    {
>> +        .ident = "P14s Gen2 AMD",
>> +        .driver_data = &quirk_s2idle_bug,
>> +        .matches = {
>> +            DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>> +            DMI_MATCH(DMI_PRODUCT_NAME, "21A1"),
>> +        }
>> +    },
>>       {}
>>   };
>>   
> 

