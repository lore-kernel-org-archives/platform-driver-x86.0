Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4FAC4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 10:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiKGKlu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 05:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiKGKlt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 05:41:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC0513F8C
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667817653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mOI04EjI3O9ZzvsFWiAIDa7+u7EqLZMtqbHkmMa9+zY=;
        b=IabWpwoy0Xjd8BkdZKxafd610fTNwDIBxMkJFX7Gb4HOaULNlzYF8AxqR1+ixrOe2LnUAB
        WZ+IVQ0CVkalmCpyaKRbNfFD4YvaJLQMeKz8W6WhF+2gtTi+GMCzklXQRULcqaknoTKAxV
        OSteclel6IRWUo2padIZLwc1F3kYUmc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-ZUmGHx9XMkeK9YWJZT8nag-1; Mon, 07 Nov 2022 05:40:52 -0500
X-MC-Unique: ZUmGHx9XMkeK9YWJZT8nag-1
Received: by mail-ed1-f70.google.com with SMTP id b13-20020a056402350d00b00464175c3f1eso8047544edd.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 02:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOI04EjI3O9ZzvsFWiAIDa7+u7EqLZMtqbHkmMa9+zY=;
        b=b6/TVLtmZMQW/fl71ICTqqxvvZZE0evzyLuHvh26psC0bRr7DbusWtzOuZROuKH+Qp
         ww71C/tcNKdPD8wGSUy6TEdBylyhMZKRhsRl9DRUeGBf+h65kDfq+j+iwD5WKEA6U+8f
         oLRlh6cidZzBA4zi0ZesiY0u3nwT1V/4TY9Shnkqwn08gVMIv+5CJs1WpS6b0ogA0/ZY
         P0+u2GrnxnTk5d+df0h1KJxxeT/In/n3oa6gvZ/ApaUyszxYOXQ0HT+9UCSa0OcCj+To
         KC5IM+a7Y80S/4XsfUz+qsNKF68TtOLklXMaM2m2jmUyz0rS88W4lZpOCrUw3VTobf5e
         jeHw==
X-Gm-Message-State: ACrzQf0Fb9uBL3cJ/QL/eCToM4CNQqvxwvdTFNKkcJYh74DH8jEuw7lW
        nBE76gePsnCL6kDSZJS06jROI1TPLj7ty6uOjsS9X6l0W8lCwxAiFI8fVFYfnybERjPLr4fnEKx
        bUk2rQ2ESPr0Y2uhtBHcuJ+7WOGKg+8YM/A==
X-Received: by 2002:a17:907:969e:b0:7a6:fe3:6f11 with SMTP id hd30-20020a170907969e00b007a60fe36f11mr47854633ejc.501.1667817651416;
        Mon, 07 Nov 2022 02:40:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5yuuVGtrX6nqxx0QzI2KV2bH4Ckq5XZu6QTRAyQ52BRH+Jsx6QTaPYbCZFV/iTxAa6SrTNPA==
X-Received: by 2002:a17:907:969e:b0:7a6:fe3:6f11 with SMTP id hd30-20020a170907969e00b007a60fe36f11mr47854622ejc.501.1667817651237;
        Mon, 07 Nov 2022 02:40:51 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g22-20020a50ee16000000b004616b006871sm3979043eds.82.2022.11.07.02.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:40:50 -0800 (PST)
Message-ID: <718b55db-5597-45eb-893a-aabd59646bf2@redhat.com>
Date:   Mon, 7 Nov 2022 11:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1] hp_wmi causing rfkill soft blocked wifi
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>,
        "balalic.enver@gmail.com" <balalic.enver@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "markgross@kernel.org" <markgross@kernel.org>,
        "Tsao, Anson" <anson.tsao@amd.com>
References: <20221028155527.7724-1-jorge.lopez2@hp.com>
 <MN0PR12MB6101426E91BB9B6D1A4F03F6E2329@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <MN0PR12MB6101426E91BB9B6D1A4F03F6E2329@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/28/22 18:08, Limonciello, Mario wrote:
> [Public]
> 
> +Anson
> 
>> -----Original Message-----
>> From: Jorge Lopez <jorgealtxwork@gmail.com>
>> Sent: Friday, October 28, 2022 10:55
>> To: hdegoede@redhat.com; balalic.enver@gmail.com; platform-driver-
>> x86@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: markgross@kernel.org
>> Subject: [PATCH v1] hp_wmi causing rfkill soft blocked wifi
>>
>> After upgrading BIOS to U82 01.02.01 Rev.A, the console is flooded
>> strange char "^@" which printed out every second and makes login
>> nearly impossible. Also the below messages were shown both in console
>> and journal/dmesg every second:
>>
>> usb 1-3: Device not responding to setup address.
>> usb 1-3: device not accepting address 4, error -71
>> usb 1-3: device descriptor read/all, error -71
>> usb usb1-port3: unable to enumerate USB device
>>
>> Wifi is soft blocked by checking rfkill. When unblocked manually,
>> after few seconds it would be soft blocked again. So I was suspecting
>> something triggered rfkill to soft block wifi.  At the end it was
>> fixed by removing hp_wmi module.
>>
>> The root cause is the way hp-wmi driver handles command 1B on
>> post-2009 BIOS.  In pre-2009 BIOS, command 1Bh return 0x4 to indicate
>> that BIOS no longer controls the power for the wireless devices.
>>
>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216468
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Hans,
> 
> Since this is effectively essentially removing the broken BIOS RFKILL interface
> for numerous machines I think this should probably go to stable too, if you agree.

I agree, I've added a Cc: stable while merging this and I'll include this
in my next fixes pull-req to Linus.

Jorge, many thanks for fixing this!

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
>> ---
>> Based on the latest platform-drivers-x86.git/for-next
>> ---
>>  drivers/platform/x86/hp-wmi.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>> index 627a6d0eaf83..29cd4e437d97 100644
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -1300,8 +1300,15 @@ static int __init hp_wmi_bios_setup(struct
>> platform_device *device)
>>  	wwan_rfkill = NULL;
>>  	rfkill2_count = 0;
>>
>> -	if (hp_wmi_rfkill_setup(device))
>> -		hp_wmi_rfkill2_setup(device);
>> +	/*
>> +	 * In pre-2009 BIOS, command 1Bh return 0x4 to indicate that
>> +	 * BIOS no longer controls the power for the wireless
>> +	 * devices. All features supported by this command will no
>> +	 * longer be supported.
>> +	 */
>> +	if (!hp_wmi_bios_2009_later())
>> +		if (hp_wmi_rfkill_setup(device))
>> +			hp_wmi_rfkill2_setup(device);
>>
>>  	err = hp_wmi_hwmon_init();
>>
>> --
>> 2.34.1
> 

