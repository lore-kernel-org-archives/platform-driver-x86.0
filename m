Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FA6C83014
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 13:28:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A484A208C3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 13:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VGkGEFqn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388104AbgKXN2a (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 08:28:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33058 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388097AbgKXN23 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 08:28:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606224507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hoVQsGPeYMPg55a/CIpD3Pwyw+YZDv743HAsIiOzXBw=;
        b=VGkGEFqnCwSPFzr1nwSzOmfUdNFYGlhDyBWKch/u9pdY03pIz6qZDST1K3R+mZd0J85P5p
        0Y3IIwvJMdUL15hExRWJuICrDbw/SogNraaGFuNPbyBpbTqxy0HD8U+24xxvylHBQrh+1E
        MCotc/La4NSUx1xI8zZiO0qHvt51c1A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-MKP7T9glOX-O_5FL_hnjcw-1; Tue, 24 Nov 2020 08:28:24 -0500
X-MC-Unique: MKP7T9glOX-O_5FL_hnjcw-1
Received: by mail-ej1-f72.google.com with SMTP id p18so6905618ejl.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 05:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hoVQsGPeYMPg55a/CIpD3Pwyw+YZDv743HAsIiOzXBw=;
        b=GNWIyAempfIN4f0q9r2cNLHCnA2UZPLxxzTfrPf6xUufjurZJRe+G4djOwqEpaYd32
         BdjPnBhq9Z+VqFNG9pfW1yiX/SuhHqHNMu3VOknA4E/kCa1cdOB7mETjnWg5bfUtOfLq
         6focD8hcNS5RV/ezm2lXb+eZ/WLAHday41SfqIZKSib9MVsOrlApWx2CzYMtpfzluwN6
         PZQEQbIBJY6Rjxhfvbn+7rkwPOLWSaVDHLkTUAP58psuhjYheh1W+tF9mQ9ixBbgW36s
         x4CLY5C0Wn0Gi4jZXzDsfsIy3UPTQLOMqQ7xdEbMTQZMpelwRMl0QZ1K9IwLQMjP4kvj
         bkrA==
X-Gm-Message-State: AOAM531M2EVXAYMSBABxJKnkOrB6LmyfiR2YM0LLpzE81D6H6CJqbKnh
        HZOniwrSNyL8IoArqctJP37W0vJkS+Ur8/EYdhJKoq8jfNxQcEohEv5DyJ6aIcZdeEgQ4U/Jtmi
        v49RAM4WFzUKnORzcpeF3es+lqMclmxQ1uw==
X-Received: by 2002:a50:e786:: with SMTP id b6mr3807353edn.242.1606224503658;
        Tue, 24 Nov 2020 05:28:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiOTsKnrd5EVrA/8Cw7tRFpmDTYAleAZiY1oHxMLmMUuCRkwTGTiradXiqU871AuVkFJoXqg==
X-Received: by 2002:a50:e786:: with SMTP id b6mr3807344edn.242.1606224503423;
        Tue, 24 Nov 2020 05:28:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id x15sm7020012edj.91.2020.11.24.05.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 05:28:22 -0800 (PST)
Subject: Re: Asus Zephyrus G14 GA401IH-HE003 problem with sound and fan
To:     Mamchyts Dmitry <mamchyts@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com
References: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0c2fd9aa-7af4-5adb-ae6d-923c5eefb0b8@redhat.com>
Date:   Tue, 24 Nov 2020 14:28:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/12/20 8:19 PM, Mamchyts Dmitry wrote:
> I got an Asus Zephyrus G14 GA401IH-HE003 with AMD Ryzen 7 4800HS and a
> NVIDIA GeForce GTX 1650.
> I am use 5.9.8-050908-generic kernel from
> (kernel.ubuntu.com/~kernel-ppa/mainline/v5.9.8/)
> 
>     dmamchyts@ga401ih:~$ cat /etc/os-release
>     NAME="Ubuntu"
>     VERSION="20.10 (Groovy Gorilla)"
> 
> I have some problem with sound and fan:
> The first problem is a sound from notebook speakers: when I use
> headphones via 3.5 jack - all works fine. I can control sound level
> (from low to high). But when I try to listen to any sounds from
> notebook speakers - volume always has a high level (I think it's a max
> level of notebook speakers sound). I am using KDE, and I hear a sound
> level of 5% the same as 100%.

Next time please try reporting 1 issue per bug report. The
platform-driver-x86@vger.kernel.org mailinglist is the right address
for the fan issue, but for the sound issue you really should send
a separate bug report to the sound/alsa developers.

> The second problem is a fan speed.

What exactly is the problem with the fan speed ?

<snip>

>     xxx@ga401ih:~/downloads$ ll /sys/class/hwmon/hwmon6/
>     total 0
>     drwxr-xr-x 3 root root    0 Nov 12 20:33 ./
>     drwxr-xr-x 3 root root    0 Nov 12 20:33 ../
>     lrwxrwxrwx 1 root root    0 Nov 12 20:34 device -> ../../../asus-nb-wmi/
>     -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_input
>     -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_label
>     -r--r--r-- 1 root root 4096 Nov 12 20:34 name
>     drwxr-xr-x 2 root root    0 Nov 12 21:30 power/
>     -rw-r--r-- 1 root root 4096 Nov 12 21:30 pwm1_enable
>     lrwxrwxrwx 1 root root    0 Nov 12 21:30 subsystem ->
> ../../../../../class/hwmon/
>     -rw-r--r-- 1 root root 4096 Nov 12 20:33 uevent

Ok, so pwmconfig will not work here because there only is a
pwm1_enable file and not a pwm1 file for controlling the actual
fan-speed.

This is normal on most newer Asus models you can sat the fan
to 1 of 2 modes:

1. fullspeed:

echo 0 > /sys/class/hwmon/hwmon6/pwm1_enable

2. automatic speed control (the default)

echo 2 > /sys/class/hwmon/hwmon6/pwm1_enable

Regards,

Hans

