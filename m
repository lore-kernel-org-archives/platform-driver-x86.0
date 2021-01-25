Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E62C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:30:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFB7B216FD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732322AbhAYUaN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 15:30:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57662 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732313AbhAYUaA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 15:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611606507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M8yxaMgosp2/+gYRd3wFsVq8borWyKyeLbTDljcAt88=;
        b=i0u5YOMvQNRnEmGTP/fjfPQXLFNeJFQd4S3HSJlhtdfuYHJuI5mAJ8e3PiyowKEkAEM052
        Cpl+PFZ0qQzshV6O3wRF2hPNPa5A05PUGyXdf1zk4R9M1aiaBKU3kvaH4zhzXF/Yo9NVyg
        hUCTmuDYqzN/NyDq392anUwr44ftE3s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-X7-GZy5EPmm9p1yEii-RhQ-1; Mon, 25 Jan 2021 15:28:25 -0500
X-MC-Unique: X7-GZy5EPmm9p1yEii-RhQ-1
Received: by mail-ej1-f70.google.com with SMTP id dc21so4238825ejb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 12:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M8yxaMgosp2/+gYRd3wFsVq8borWyKyeLbTDljcAt88=;
        b=d/vSUHH6rOX3MqLll3Mkql/sAsp7/9ShjNHkXVxuILgSeJxXB431BO3lP4VzMxjCpO
         qidildrMA48VTstS+rUpWVVM0V8OpGjzfqUWgHcfZ/Os1fSsNowRnV++CRDKN+gNh4Fp
         5ywT8+VUHknVPJw5ZyhcXjtYCQ+TOrcLL3pn2sFIPWS328Mpi3IWInAJ3V3gM15Du7ww
         hE2A9JGj53OU3JkZX9l0YhrO6c5da0n2KRG4I1vXmGxENtp0LprthXxPP9uhZGkY+/Pt
         G48yxjK5YuXqL4wo123BMipfgS2puw5KJgg4TTWtzw7ct6+FCUV2jik1JlW6IGMaawZ8
         4exg==
X-Gm-Message-State: AOAM532/oXbV5V3sM/x6hgAFUQPavLg773GNolh3xYh2EJbCyXDpODgM
        lniF7TKodamSWG1M1SIZJ0rUQl29AX9BJBF7Dm0Hxd+AmFocMFSVTH0NSz54MEvpItw+Puj3QHm
        XVjmr8/C/VJqgKNGk9CzYly0tm9eN0HaQxg==
X-Received: by 2002:a05:6402:160f:: with SMTP id f15mr1953244edv.348.1611606503993;
        Mon, 25 Jan 2021 12:28:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNfnuvu6AeqNNvFkywz6/0NohR/5QZ+YNCCAKucQcZIcxF6G2UOs3NoxciVGMg5SEvQUIq5A==
X-Received: by 2002:a05:6402:160f:: with SMTP id f15mr1953224edv.348.1611606503809;
        Mon, 25 Jan 2021 12:28:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id x2sm9801193eds.51.2021.01.25.12.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 12:28:23 -0800 (PST)
Subject: Re: [PATCH] platform/x86: hp-wmi: Disable tablet-mode reporting by
 default
To:     mgross@linux.intel.com
Cc:     Andy Shevchenko <andy@infradead.org>,
        Elia Devito <eliadevito@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Stefan_Br=c3=bcns?= <stefan.bruens@rwth-aachen.de>
References: <20210120124941.73409-1-hdegoede@redhat.com>
 <20210121234803.GB60912@linux.intel.com>
 <2a964e64-866e-b2aa-702b-e33c80fd046d@redhat.com>
 <20210125194324.GA5486@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3cebe2c6-1fed-1a7b-ff36-70e3677c1cd2@redhat.com>
Date:   Mon, 25 Jan 2021 21:28:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125194324.GA5486@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/21 8:43 PM, mark gross wrote:
> On Fri, Jan 22, 2021 at 01:15:05AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/22/21 12:48 AM, mark gross wrote:
>>> On Wed, Jan 20, 2021 at 01:49:41PM +0100, Hans de Goede wrote:
>>>> Recently userspace has started making more use of SW_TABLET_MODE
>>>> (when an input-dev reports this).
>>>>
>>>> Specifically recent GNOME3 versions will:
>>>>
>>>> 1.  When SW_TABLET_MODE is reported and is reporting 0:
>>>> 1.1 Disable accelerometer-based screen auto-rotation
>>>> 1.2 Disable automatically showing the on-screen keyboard when a
>>>>     text-input field is focussed
>>>>
>>>> 2.  When SW_TABLET_MODE is reported and is reporting 1:
>>>> 2.1 Ignore input-events from the builtin keyboard and touchpad
>>>>     (this is for 360Â° hinges style 2-in-1s where the keyboard and
>>>>      touchpads are accessible on the back of the tablet when folded
>>>>      into tablet-mode)
>>>>
>>>> This means that claiming to support SW_TABLET_MODE when it does not
>>>> actually work / reports correct values has bad side-effects.
>>> did you mean "reports incorrect values"?
>>
>> Yes and no, I meant this to be read as "does not (...) report correct values"
>> but your suggestion is better I will fix this for v2.
>>
>>>
>>>>
>>>> The check in the hp-wmi code which is used to decide if the input-dev
>>>> should claim SW_TABLET_MODE support, only checks if the
>>>> HPWMI_HARDWARE_QUERY is supported. It does *not* check if the hardware
>>>> actually is capable of reporting SW_TABLET_MODE.
>>>>
>>>> This leads to the hp-wmi input-dev claming SW_TABLET_MODE support,
>>>> while in reality it will always report 0 as SW_TABLET_MODE value.
>>>> This has been seen on a "HP ENVY x360 Convertible 15-cp0xxx" and
>>>> this likely is the case on a whole lot of other HP models.
>>>>
>>>> This problem causes both auto-rotation and on-screen keyboard
>>>> support to not work on affected x360 models.
>>>>
>>>> There is no easy fix for this, but since userspace expects
>>>> SW_TABLET_MODE reporting to be reliable when advertised it is
>>>> better to not claim/report SW_TABLET_MODE support at all, then
>>>                                                             than
>>>> to claim to support it while it does not work.
>>>>
>>>> To avoid the mentioned problems, add a new enable_tablet_mode_sw
>>>> module-parameter which defaults to false.
>>>>
>>>> Note I've made this an int using the standard -1=auto, 0=off, 1=on
>>>> tripplet, with the hope that in the future we can come up with a
>>>> better way to detect SW_TABLET_MODE support. ATM the default
>>>> auto option just does the same as off.
>>>>
>>>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1918255
>>>> Cc: Stefan BrÃ¼ns <stefan.bruens@rwth-aachen.de>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/platform/x86/hp-wmi.c | 14 ++++++++++----
>>>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>>>> index 18bf8aeb5f87..ff028587cd21 100644
>>>> --- a/drivers/platform/x86/hp-wmi.c
>>>> +++ b/drivers/platform/x86/hp-wmi.c
>>>> @@ -32,6 +32,10 @@ MODULE_LICENSE("GPL");
>>>>  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
>>>>  MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>>>>  
>>>> +static int enable_tablet_mode_sw = -1;
>>> So busted HW gets the default while working HW will need to add a boot time
>>> parameter.  If there are no working tablet_mode devices I guess its ok but, if
>>> I had a working platform I'd be a little miffed at the choice to make my life
>>> harder (by forcing me to add a enable_tablet_mode_sw=1 to my kernel
>>> command line) while making life easier for those with busted hardware.
>>>
>>> I'm not saying change it but, it should be considered.
>>
>> Until recently userspace pretty much ignored SW_TABLET_MODE, so reporting
>> it while it did not work was not a big deal, but as I tried to explain
>> in the commit message always reporting SW_TABLET_MODE=0 does cause some
>> real issues:
>>
>>>> 1.  When SW_TABLET_MODE is reported and is reporting 0:
>>>> 1.1 Disable accelerometer-based screen auto-rotation
>>>> 1.2 Disable automatically showing the on-screen keyboard when a
>>>>     text-input field is focussed
>>
>> By defaulting to not reporting SW_TABLET_MODE at all we go back to the
>> (slightly) older userspace behavior of always doing auto-rotation and
>> always popping up the onscreen-keyboard on text-field focus (on devices
>> with a touchscreen).
>>
>> So basically the bad side-effects of reporting SW_TABLET_MODE while it
>> is not working are much worse then the bad side-effects of not reporting
>> it on devices where it does work.
>>
>> More in general the way userspace uses SW_TABLET_MODE means that if
>> we report it, then it MUST be reliable. If it is not reliable then it
>> is better to not support it at all.
> Yeah, thats all too true as well.  Making user mode work correctly takes
> priority over my sense of fairness.
> 
> Acked-by: Mark Gross <mgross@linux.intel.com>

Thank you.

I've applied this patch to my review-hans branch now, so this will
show up in for-next and fixes soon.

Regards,

Hans

