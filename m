Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC50C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Jan 2021 00:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F8082389F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Jan 2021 00:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbhAVAQj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 21 Jan 2021 19:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24063 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726379AbhAVAQh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Jan 2021 19:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611274510;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=unTyrNG0iCcxyVv753APpH5fDC/OUU/QeB1FmcXHoJk=;
        b=ITW+/QL38AGObUKitquBDI0F5mYaMMOks04oYQlOtdpJjbY1DqIB5iONz4aE1OsFOprQZC
        stAIFtrZX0gMNTLJG9FYlbd9qkFym6ErKnkJ0ltfsU/rQRtWN4iUlan++/7agaDgWZTDc3
        hv750re4a8/kKuOlvMYoEJmB2ZtFVvk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-kZCNgLBfNBylDhbKYr1pJw-1; Thu, 21 Jan 2021 19:15:08 -0500
X-MC-Unique: kZCNgLBfNBylDhbKYr1pJw-1
Received: by mail-ej1-f71.google.com with SMTP id b18so1481236ejz.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Jan 2021 16:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=unTyrNG0iCcxyVv753APpH5fDC/OUU/QeB1FmcXHoJk=;
        b=VKE1SmXMQA2AnCZBm7v9BC0IO7l19pyEKUPftiI2CIdN2dXYXAexz0biZKRjkXrHtd
         8DHsUQn8McX2il0ZQR547cF8bQFmG5JYFqTVsbnh0ki+D4khZJsDnc5HkyKshRVM1UaD
         ubKl2L0NLlgGnWCsVM+eBx9/pJrLQmTAUlsZbXFlgORpOKug8F0ha8bcvWhuYPis8G4N
         AQTOjQILlCmqPHwAz+pcI1qY/FmG/8S4EaliG1+F6/6NgOg3bTUjwALdaMebgMcnTjrs
         4uHVQfnh6E6FbxnXmv8cYNQ/n8WNWwQpdq6BzxqX+00wy+3e/vAIjXwPQ5R8Wg3jBF8h
         NaBg==
X-Gm-Message-State: AOAM533gNJSTH/94yVVh9d/nLPjjwG75+NRV5a1ixdPPzYyj6EsMUUkO
        18zmLI0sKaGpf2SW81a6yGNnMTXSzMVONgFXigzLFsHNY7Rm/m7UkD0dRH5zuVgSVJ/L+HJoons
        Y5pmoCBMjgFGsmkSrjpPnxkGjLE91uUJeSQ==
X-Received: by 2002:a50:d646:: with SMTP id c6mr1225562edj.177.1611274507144;
        Thu, 21 Jan 2021 16:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+jIxI6h8NSwJgYdJGeV8IuY9dmO3Ru32/iadXdFpwlQSO3YMOnK1cA1iZvzVbU8aSXxg45Q==
X-Received: by 2002:a50:d646:: with SMTP id c6mr1225551edj.177.1611274506897;
        Thu, 21 Jan 2021 16:15:06 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id p21sm3747420edx.90.2021.01.21.16.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 16:15:06 -0800 (PST)
Subject: Re: [PATCH] platform/x86: hp-wmi: Disable tablet-mode reporting by
 default
To:     mgross@linux.intel.com
Cc:     Andy Shevchenko <andy@infradead.org>,
        Elia Devito <eliadevito@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Stefan_Br=c3=bcns?= <stefan.bruens@rwth-aachen.de>
References: <20210120124941.73409-1-hdegoede@redhat.com>
 <20210121234803.GB60912@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2a964e64-866e-b2aa-702b-e33c80fd046d@redhat.com>
Date:   Fri, 22 Jan 2021 01:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210121234803.GB60912@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/22/21 12:48 AM, mark gross wrote:
> On Wed, Jan 20, 2021 at 01:49:41PM +0100, Hans de Goede wrote:
>> Recently userspace has started making more use of SW_TABLET_MODE
>> (when an input-dev reports this).
>>
>> Specifically recent GNOME3 versions will:
>>
>> 1.  When SW_TABLET_MODE is reported and is reporting 0:
>> 1.1 Disable accelerometer-based screen auto-rotation
>> 1.2 Disable automatically showing the on-screen keyboard when a
>>     text-input field is focussed
>>
>> 2.  When SW_TABLET_MODE is reported and is reporting 1:
>> 2.1 Ignore input-events from the builtin keyboard and touchpad
>>     (this is for 360Â° hinges style 2-in-1s where the keyboard and
>>      touchpads are accessible on the back of the tablet when folded
>>      into tablet-mode)
>>
>> This means that claiming to support SW_TABLET_MODE when it does not
>> actually work / reports correct values has bad side-effects.
> did you mean "reports incorrect values"?

Yes and no, I meant this to be read as "does not (...) report correct values"
but your suggestion is better I will fix this for v2.

> 
>>
>> The check in the hp-wmi code which is used to decide if the input-dev
>> should claim SW_TABLET_MODE support, only checks if the
>> HPWMI_HARDWARE_QUERY is supported. It does *not* check if the hardware
>> actually is capable of reporting SW_TABLET_MODE.
>>
>> This leads to the hp-wmi input-dev claming SW_TABLET_MODE support,
>> while in reality it will always report 0 as SW_TABLET_MODE value.
>> This has been seen on a "HP ENVY x360 Convertible 15-cp0xxx" and
>> this likely is the case on a whole lot of other HP models.
>>
>> This problem causes both auto-rotation and on-screen keyboard
>> support to not work on affected x360 models.
>>
>> There is no easy fix for this, but since userspace expects
>> SW_TABLET_MODE reporting to be reliable when advertised it is
>> better to not claim/report SW_TABLET_MODE support at all, then
>                                                             than
>> to claim to support it while it does not work.
>>
>> To avoid the mentioned problems, add a new enable_tablet_mode_sw
>> module-parameter which defaults to false.
>>
>> Note I've made this an int using the standard -1=auto, 0=off, 1=on
>> tripplet, with the hope that in the future we can come up with a
>> better way to detect SW_TABLET_MODE support. ATM the default
>> auto option just does the same as off.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1918255
>> Cc: Stefan BrÃ¼ns <stefan.bruens@rwth-aachen.de>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/hp-wmi.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>> index 18bf8aeb5f87..ff028587cd21 100644
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -32,6 +32,10 @@ MODULE_LICENSE("GPL");
>>  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
>>  MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>>  
>> +static int enable_tablet_mode_sw = -1;
> So busted HW gets the default while working HW will need to add a boot time
> parameter.  If there are no working tablet_mode devices I guess its ok but, if
> I had a working platform I'd be a little miffed at the choice to make my life
> harder (by forcing me to add a enable_tablet_mode_sw=1 to my kernel
> command line) while making life easier for those with busted hardware.
> 
> I'm not saying change it but, it should be considered.

Until recently userspace pretty much ignored SW_TABLET_MODE, so reporting
it while it did not work was not a big deal, but as I tried to explain
in the commit message always reporting SW_TABLET_MODE=0 does cause some
real issues:

>> 1.  When SW_TABLET_MODE is reported and is reporting 0:
>> 1.1 Disable accelerometer-based screen auto-rotation
>> 1.2 Disable automatically showing the on-screen keyboard when a
>>     text-input field is focussed

By defaulting to not reporting SW_TABLET_MODE at all we go back to the
(slightly) older userspace behavior of always doing auto-rotation and
always popping up the onscreen-keyboard on text-field focus (on devices
with a touchscreen).

So basically the bad side-effects of reporting SW_TABLET_MODE while it
is not working are much worse then the bad side-effects of not reporting
it on devices where it does work.

More in general the way userspace uses SW_TABLET_MODE means that if
we report it, then it MUST be reliable. If it is not reliable then it
is better to not support it at all.

For this reason the intel-vbtn, intel-hid and asus-wmi driver have all
3 already been moved over to using a DMI based whitelist. And now I
guess it is hp-wmi's turn to follow in their footsteps.

Ideally there is some WMI query other then the HPWMI_HARDWARE_QUERY
which actually tells us which bits in the HPWMI_HARDWARE_QUERY result
are valid and which bits are simply always 0.  I hope someone who
actually has this hardware can spend some time figuring this out.

In the mean time disabling SW_TABLET_MODE reporting is the safe
fallback option; and if people come forward where this does work
then we can do a DMI based whitelist (*).

Regards,

Hans

*) Which will hopefully be a temporary solution but there is absolutely 
no documentation for all this crap and most vendors don't seem to care
about helping us with this, so...










> 
> --mark
> 
> 
>> +module_param(enable_tablet_mode_sw, int, 0444);
>> +MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
>> +
>>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
>>  
>> @@ -654,10 +658,12 @@ static int __init hp_wmi_input_setup(void)
>>  	}
>>  
>>  	/* Tablet mode */
>> -	val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
>> -	if (!(val < 0)) {
>> -		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
>> -		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
>> +	if (enable_tablet_mode_sw > 0) {
>> +		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
>> +		if (!(val < 0)) {
>> +			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
>> +			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
>> +		}
>>  	}
>>  
>>  	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
>> -- 
>> 2.28.0
>>
> 

