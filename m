Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7981CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 11:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51D68611C0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 11:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240452AbhI1L5t (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 07:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32690 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240419AbhI1L5t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 07:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632830169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rjm7Vjsi8Ok261qADZaLGin7Csvz6AWK9T4SwjSAPz8=;
        b=CeU1wAA51AT6lgEVj+OHNRnLDNX0NSeUJ65Wea11gnWYRVVNZbzIhRYXfWKxIhimi1ZJvb
        bvLkwHdi65fT40f3aJkPBmMrcKMiTjAl/lxJijBkJtY8T/VQkKMf3PzfSeeoSDyTC7svad
        colEZsn1m0pydR3ULQceu5IjTdXR7zg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-3H6GOLbMMq2bhrshr29Q5Q-1; Tue, 28 Sep 2021 07:56:08 -0400
X-MC-Unique: 3H6GOLbMMq2bhrshr29Q5Q-1
Received: by mail-ed1-f69.google.com with SMTP id s18-20020a508d12000000b003da7a7161d5so6037301eds.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 04:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rjm7Vjsi8Ok261qADZaLGin7Csvz6AWK9T4SwjSAPz8=;
        b=wwPrn5BR1E9JmaozYjFgCEGVLk9gw3jGhlvmrnKzxk+2O7qmp5PkA223/grooCJhIl
         x8D5OK6+Ro6tVpjV/OBI/xHJ3j+fBCfoydnMdf70X6pQBHrM0vsTnE7fLQpxiVN4TMCA
         tE9X73jUyd06U8wqerAGS+kPg6ktoCFAgvuK2CdG5j823V/oRfZLKJvm/Or+/eB2LMZ0
         Yew31ZfGsVhr639Be7u9KSRTYUV1tvE8ZJ+2zDi/E0eCcrsBmCH9M/zt/oremOjsiqOX
         oDyK8+45BzMbmnmeOaqRICTmGiTMk/RtQzP/Xb7ob2CupJi5Vkv/ZK/ofplEQu4asqGT
         42Uw==
X-Gm-Message-State: AOAM533hhheA6dSbdgimqlQp5xi6bGhpLtQFoBHc2Uku4lleGY17fzIg
        oB2a4Ziq6l64kPBNMB6/UX4CnSl4IgnUdRWqalymZPi90N9ijqsbrYLUZ5saU1rbdOEupCNrCJK
        Lq4oJAxUavyYFJmMhx2VySWP2nTFFFFGWdADeJoCtWRRaLfC+fZ0njuq2zjGveOAH3sAESb+VnM
        XYZuIWI+zzjA==
X-Received: by 2002:a50:bec9:: with SMTP id e9mr7113720edk.33.1632830167004;
        Tue, 28 Sep 2021 04:56:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH7yKYuEerR6UE9XimQ1zulbKazvbUFmJoANPIYrxAPb6qFWAqhdNrwSAjGBKWoOLuei0Bkw==
X-Received: by 2002:a50:bec9:: with SMTP id e9mr7113695edk.33.1632830166786;
        Tue, 28 Sep 2021 04:56:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d7sm12925886eds.42.2021.09.28.04.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 04:56:06 -0700 (PDT)
Subject: Re: [PATCH v11] asus-wmi: Add support for custom fan curves
To:     Luke Jones <luke@ljones.dev>, Bastien Nocera <hadess@hadess.net>
Cc:     linux-kernel@vger.kernel.org, pobrn@protonmail.com,
        linux@roeck-us.net, platform-driver-x86@vger.kernel.org
References: <20210907232232.5205-1-luke@ljones.dev>
 <20210907232232.5205-2-luke@ljones.dev>
 <1d9d4de26d0c862acf3e579f14de9596027f3c3b.camel@hadess.net>
 <99750R.GZYR2PKX93HX@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <10be9244-0d89-ef79-08d0-fe7024609ee2@redhat.com>
Date:   Tue, 28 Sep 2021 13:56:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <99750R.GZYR2PKX93HX@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/28/21 1:43 PM, Luke Jones wrote:
> Sure, the path is similar to /sys/devices/platform/asus-nb-wmi/hwmon/hwmon4/pwm1_enable where hwmon4 will likely be different depending on init, and pwm2_enable is the second fan if it exists. The values are 1,2,3 - where 1 = fan curve enabled/manual, 2 = auto. 3 here is custom extra that writes default curve back then defaults to 2.
> 
> As I understand it, this should be adhering to the accepted kernel standard, so if you use this for ASUS laptops, then it should carry over to other brands that implement it also.

Ah, so this is a bit different then how I thought this would work
(this is probably better though).

<snip>

>>>  The fans have settings [1,2,3] under pwm<N>_enable:
>>>  1. Enable and write settings out
>>>  2. Disable and use factory fan mode
>>>  3. Same as 2, additionally restoring default factory curve.

Quoting Documentation/hwmon/sysfs-interface.rst

`pwm[1-*]_enable`
                Fan speed control method:

                - 0: no fan speed control (i.e. fan at full speed)
                - 1: manual fan speed control enabled (using `pwm[1-*]`)
                - 2+: automatic fan speed control enabled

1 normally means the fans runs at a fixed speed, but you are using it
for the custom/manual profile, which is still a temp<->pwm table,
right?

I guess this make sense since full manual control is not supported
and this keeps "2" aka auto as being the normal factory auto
setting which is good.

Bastien is this interface usable for p-p-d ?

I guess that it is a bit annoying that you need to figure out
the # in the hwmon# part of the path, but there will be only
one hwmon child.

You could also go through /sys/class/hwmon but then you really
have no idea which one to use. Ideally we would have some way
to indicate that there is a hmwon class-dev associated with
/sys/firmware/acpi/platform_profile but as we mentioned before
we should defer coming up with a generic solution for this
until we have more then 1 user, so that we hopefully get the
generic solution right in one go.

Regards,

Hans





>>>
>>>  Use of 2 means that the curve the user has set is still stored and
>>>  won't be erased, but the laptop will be using its default auto-fan
>>>  mode. Re-enabling the manual mode then activates the curves again.
>>>
>>>  Notes:
>>>  - pwm<N>_enable = 0 is an invalid setting.
>>>  - pwm is actually a percentage and is scaled on writing to device.
>>
>> I was trying to update:
>> https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/merge_requests/80
>> but I don't understand what files I need to check for what values to
>> detect whether custom fan curves were used.
>>
>> Can you help me out here?
>>
>> Also, was this patch accepted in the pdx86 tree?
>>
>> Cheers
>>
> 
> 

