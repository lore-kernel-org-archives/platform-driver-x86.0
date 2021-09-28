Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C021FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 12:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93773611CA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 12:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240453AbhI1MFi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 08:05:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34449 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240410AbhI1MFh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 08:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632830638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TrMZ42g/G3Kkz26yMPZtqroMl+g6CgMq/DrfJClCp8w=;
        b=CZPPvrcWqIeY0TsqrlmLDu9P+cdxgkafmPzAIYuEIuQSiHbdVIEftQxQKeNZL4Oml3rjwu
        mljdTiC7+oIfWfDLg6VEHfnKPSdo1fO5yyUOsv8HBOC7BEBCP6pKYBjK5ShhLLAxtbxQnW
        tYv39cNNz0EUxaGD0iREvYi9GNfY4F8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345--MWeZpUlNV6ZUedL6i7kmw-1; Tue, 28 Sep 2021 08:03:56 -0400
X-MC-Unique: -MWeZpUlNV6ZUedL6i7kmw-1
Received: by mail-ed1-f69.google.com with SMTP id z62-20020a509e44000000b003da839b9821so3187479ede.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 05:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TrMZ42g/G3Kkz26yMPZtqroMl+g6CgMq/DrfJClCp8w=;
        b=hpY0z3a4eq2qV3JRYLylyMbo1iOv39gNh3667/J29nAqNj+JUAIBJMdBGrb9U8oaK4
         in4WxgOwlm++IeCwngYEMsxJebhBL6nCPd4PIQKDNX7R2C+P+FJ8blXBnfLPN/e+kIUv
         OIuQhNheOpyP+wlA4xrYry50P5eXdLoGvavskqdOfnAdQBjNY5Z9kaortroBOYa3vtjw
         XoaidH7m2I+MUDUK75VgxJtbhwpWmsDHRIT1s9Z1ApIxxxkKa0AqnCzfYFGGOQ7ISx6k
         tMi5XR9rQG+ww5RO/8hTR7Cq9ZqFR+9APf1xXG0OH0RDb3LuYLqeDEnC1cBVDoCrta5q
         FMRQ==
X-Gm-Message-State: AOAM531vM8BBiQbTTzGCpmGevk4agTTWPe7DbMAwDHoULULsATWucxY7
        mP2oC0CzCkHNQTyxqrtMX8jW6l4BMBLm3UvNbQMlDlctyb5cindAq/oWw9Rx/31jUYuSjPjAesl
        CN+7psAnYaSuClR/lvbes1nyB/Rb+sEXivMGw5HO7ZxeUvSf0Tcxh1qPnloHC/fnuNXVRFy6bmc
        U0H6njoXiBqg==
X-Received: by 2002:a17:907:e91:: with SMTP id ho17mr2782028ejc.287.1632830635294;
        Tue, 28 Sep 2021 05:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE1hWUA634mQtZ+6fBawrpxRt9f5U+RYXzP767pfFl9nRwH1KVSbGCqC4TA3dHZBG9VmuQ2A==
X-Received: by 2002:a17:907:e91:: with SMTP id ho17mr2781996ejc.287.1632830635003;
        Tue, 28 Sep 2021 05:03:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s11sm12867225edy.64.2021.09.28.05.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 05:03:54 -0700 (PDT)
Subject: Re: [PATCH v11] asus-wmi: Add support for custom fan curves
To:     Luke Jones <luke@ljones.dev>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-kernel@vger.kernel.org,
        pobrn@protonmail.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org
References: <20210907232232.5205-1-luke@ljones.dev>
 <20210907232232.5205-2-luke@ljones.dev>
 <1d9d4de26d0c862acf3e579f14de9596027f3c3b.camel@hadess.net>
 <99750R.GZYR2PKX93HX@ljones.dev>
 <10be9244-0d89-ef79-08d0-fe7024609ee2@redhat.com>
 <NY750R.JRUHTBKNLH1F1@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <461e3768-7c6d-7351-3482-2545ad0af754@redhat.com>
Date:   Tue, 28 Sep 2021 14:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <NY750R.JRUHTBKNLH1F1@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/28/21 1:59 PM, Luke Jones wrote:
> 
> 
> On Tue, Sep 28 2021 at 13:56:05 +0200, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 9/28/21 1:43 PM, Luke Jones wrote:
>>>  Sure, the path is similar to /sys/devices/platform/asus-nb-wmi/hwmon/hwmon4/pwm1_enable where hwmon4 will likely be different depending on init, and pwm2_enable is the second fan if it exists. The values are 1,2,3 - where 1 = fan curve enabled/manual, 2 = auto. 3 here is custom extra that writes default curve back then defaults to 2.
>>>
>>>  As I understand it, this should be adhering to the accepted kernel standard, so if you use this for ASUS laptops, then it should carry over to other brands that implement it also.
>>
>> Ah, so this is a bit different then how I thought this would work
>> (this is probably better though).
>>
>> <snip>
>>
>>>>>   The fans have settings [1,2,3] under pwm<N>_enable:
>>>>>   1. Enable and write settings out
>>>>>   2. Disable and use factory fan mode
>>>>>   3. Same as 2, additionally restoring default factory curve.
>>
>> Quoting Documentation/hwmon/sysfs-interface.rst
>>
>> `pwm[1-*]_enable`
>>                 Fan speed control method:
>>
>>                 - 0: no fan speed control (i.e. fan at full speed)
>>                 - 1: manual fan speed control enabled (using `pwm[1-*]`)
>>                 - 2+: automatic fan speed control enabled
>>
>> 1 normally means the fans runs at a fixed speed, but you are using it
>> for the custom/manual profile, which is still a temp<->pwm table,
>> right?
>>
>> I guess this make sense since full manual control is not supported
>> and this keeps "2" aka auto as being the normal factory auto
>> setting which is good.
>>
>> Bastien is this interface usable for p-p-d ?
>>
>> I guess that it is a bit annoying that you need to figure out
>> the # in the hwmon# part of the path, but there will be only
>> one hwmon child.
>>
>> You could also go through /sys/class/hwmon but then you really
>> have no idea which one to use. Ideally we would have some way
>> to indicate that there is a hmwon class-dev associated with
>> /sys/firmware/acpi/platform_profile but as we mentioned before
>> we should defer coming up with a generic solution for this
>> until we have more then 1 user, so that we hopefully get the
>> generic solution right in one go.
> 
> If it's at all helpful, I named the interface as "asus_custom_fan_curve". I use this to verify I have the correct hwmon for asusctl. Open to suggestions on that.

Ah yes, that means the interface could be looked up through /sys/class/hwmon
too, that is probably the safest route to go then, as the
/sys/devices/platform/asus-nb-wmi/ path might change if we e.g. ever
convert the asus-wmi code to use the new wmi bus interface.

Now that you have confirmed that any writes to
/sys/firmware/acpi/platform_profile override any custom profiles
I wonder if p-p-d needs to take this into account at all though.

The easiest way to deal with this in p-p-d, is just to not deal
with it at all...    If that turns out to be a bad idea, we
can always reconsider and add some special handling to p-p-d for
this later.

Regards,

Hans

