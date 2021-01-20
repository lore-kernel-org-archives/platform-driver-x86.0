Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD406C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Jan 2021 21:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 594C723444
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Jan 2021 21:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbhATV2A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 20 Jan 2021 16:28:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55857 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726305AbhATNpU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Jan 2021 08:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611150186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dr5nOM1QIIs4pWSt/yrhgFsPGfeO6HvUBuahNJK7aHc=;
        b=JWP+EYHKOUjG06VNHbE2DniYZyjQ9XystMdkvUsiU0mxAgogr9uFTUYvpeI4vb/xDqe54j
        vjunSJscEQBi4lP2bVLDKmF9f1kS6jCD+vkGsddN3DdP7jq3gpMo4VZ+aBKiOPGIzahqcd
        3xtXDgv/907boLqiwya/ocf65M7Buvg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-vIRVxLCeOFWb9oaYXO7CHA-1; Wed, 20 Jan 2021 08:43:04 -0500
X-MC-Unique: vIRVxLCeOFWb9oaYXO7CHA-1
Received: by mail-ed1-f70.google.com with SMTP id a24so5797328eda.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Jan 2021 05:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dr5nOM1QIIs4pWSt/yrhgFsPGfeO6HvUBuahNJK7aHc=;
        b=FjMkRhwIU8Z9LCVtIJsLk0GoVA81Mh2iEzVozYOu12lTSsYU3Xu5nNXlh1V3Mnprqn
         hjOK5z/XN/clvtww8UOQ/2/T3KgGLpp+Qdv3aKTc9Zg9Hgt+arWFIYUokoJnOv9usOWQ
         vTdjj/qBRtoRzobQBw2KNZZIPesgh8WOFmmauRqvJslXdZyvgRB/IErwxYbcf1oslh3a
         uy4VyGdVhKBg6Q5U1XxbAEao/ujznFABqqEUO+HvV7LdQZ/vp+qROBXQgEWXMqV7TLVR
         rN476NmgWHWEjUFxn0IguUwNiwT4ze6HcvtO/zP23s4fH8IaDdiH5NZBVIN73HFI7Fng
         Jw7A==
X-Gm-Message-State: AOAM533i0CZ6ZaVTOUsG6+7oCBb8fKQayTvrDVQJswSmG6b1nvb0a26B
        2lBHNhrcoumMOkgO2VtE5DPnQ9C+weGrBzzzfJa2aAmwfOvQHYCcn+DxSPK+C4O0b+V/pX0HBZS
        ZG8GllrH0y9eAzZkgIfAas1b5z/g8UWo9vg==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr7631219edj.293.1611150183306;
        Wed, 20 Jan 2021 05:43:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs44Krq/36YOiqX65JTocN0nS/9lZoNk+Waa5AWk6/YCgAIE+TmtJeexwUyDKD3jM62jahsQ==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr7631205edj.293.1611150183066;
        Wed, 20 Jan 2021 05:43:03 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id j23sm1168676edv.45.2021.01.20.05.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 05:43:00 -0800 (PST)
Subject: Re: [PATCH] platform/x86: hp-wmi: Disable tablet-mode reporting by
 default
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Elia Devito <eliadevito@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Stefan_Br=c3=bcns?= <stefan.bruens@rwth-aachen.de>
References: <20210120124941.73409-1-hdegoede@redhat.com>
 <CAHp75VcCX6z+AGn5EhTRq4LudWg+7vUwzU7sb4tGiLPaw4z0Sg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <74257696-12df-ff95-bcd9-2a30efb860b0@redhat.com>
Date:   Wed, 20 Jan 2021 14:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcCX6z+AGn5EhTRq4LudWg+7vUwzU7sb4tGiLPaw4z0Sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Thank you for the review.

Unrelated, but I would really appreciate a review of the series stating with:
"[PATCH 1/4] platform/x86: intel-vbtn: Rework wakeup handling in notify_handler()"

On 1/20/21 2:10 PM, Andy Shevchenko wrote:
> On Wed, Jan 20, 2021 at 2:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
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
>>     (this is for 360° hinges style 2-in-1s where the keyboard and
>>      touchpads are accessible on the back of the tablet when folded
>>      into tablet-mode)
>>
>> This means that claiming to support SW_TABLET_MODE when it does not
>> actually work / reports correct values has bad side-effects.
>>
>> The check in the hp-wmi code which is used to decide if the input-dev
>> should claim SW_TABLET_MODE support, only checks if the
>> HPWMI_HARDWARE_QUERY is supported. It does *not* check if the hardware
>> actually is capable of reporting SW_TABLET_MODE.
>>
>> This leads to the hp-wmi input-dev claming SW_TABLET_MODE support,
> 
> claiming

Ack, I will fix this up before merging this into review-hans.

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
>> to claim to support it while it does not work.
>>
>> To avoid the mentioned problems, add a new enable_tablet_mode_sw
>> module-parameter which defaults to false.
>>
>> Note I've made this an int using the standard -1=auto, 0=off, 1=on
>> tripplet, with the hope that in the future we can come up with a
> 
> triplett

Ack, I will fix this up before merging this into review-hans.

>> better way to detect SW_TABLET_MODE support. ATM the default
>> auto option just does the same as off.
> 
> ...
> 
>> +static int enable_tablet_mode_sw = -1;
>> +module_param(enable_tablet_mode_sw, int, 0444);
>> +MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
> 
> Does it need any documentation update?
> 

There is no documentation for this driver:

[hans@x1 linux]$ find Documentation -name '*wmi*'
Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
Documentation/ABI/testing/sysfs-platform-asus-wmi
Documentation/ABI/testing/dell-smbios-wmi
Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt


> ...
> 
>> +       if (enable_tablet_mode_sw > 0) {
>> +               val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> 
>> +               if (!(val < 0)) {
> 
> Perhaps while at it you may change it to more natural
>   if (val >= 0)
> ?

Ack, I will fix this up before merging this into review-hans.

Note I plan to let this patch sit for a while before merging it
to give people time to complain about me just outright disabing
the SW_TABLET_MODE reporting by default.

Regards,

Hans



> 
>> +                       __set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
>> +                       input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
>> +               }
>>         }
> 

