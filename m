Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45A8C5519F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 09:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47CA9206F9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 09:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkiTG7D9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgKYJFJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Nov 2020 04:05:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgKYJFI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 04:05:08 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD7CC0613D4
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 01:05:08 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id z136so636130iof.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P+7JbAA3Wl0yVLNbLRzroBFByjTsk+aXse4qKhnxo7A=;
        b=BkiTG7D9LM/ZP/tjec1Hx52PThcKNYzvrD30WaDs6dujjfJaeQLr29OnvSvfv1v+ra
         jwovA0nC2TEfgENIanHJlRyB6c9GaogGVDzsFXqXpRAieTYG0Pr24SoSeUy3obI2AXch
         xrXwfj1bY+khkIZQJEqWrxfgTaE+7oC7aQh5Ak41+SmI9IDiSwo2SCcODpdU51HCi3Yy
         DzIrQKd6XesClAkym78o2b0XlWkgEK0noija8M0VbSnr2I0vC1t9Hjdz3a+reZ6IqliR
         9jOQJofg+KQaTpX7qMpUVAQZFxXu/Nc/VveH/1SKQYQLpj43HUpaUYTg8V3swE+wujSN
         RJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P+7JbAA3Wl0yVLNbLRzroBFByjTsk+aXse4qKhnxo7A=;
        b=fWnf0SqMmUFYXXwjCKCl/8KP8WIZAU1Tb8Vg/D32f9Cxh8Wq6HHGDUUKIGd8i+WqAH
         zbTKjsHanJAFP562EY1jpjZgNgEyavud3taJHHPWVOg/0/6RtXK4F1HPl9WiSXm6LiWD
         YPZe8c0O3a2KrFj0KLGOpyw3nOetR+gCetZBEYQcKjtppZGCVcesUe2rTONzz6t0o1Cp
         JUBxHRze2QK+ekL3bBZTzK+hfTGjdyOD6ENs5ovAQ/1kE7UOWTaiVmzVBQ4SXX+Sh9cV
         gst1p8vQsAJd+OwSzT5Er7OKPigkXhLz82A4hzIWi5353G6Pxpvr/Bm+6mbn9O32CUR4
         E3Cw==
X-Gm-Message-State: AOAM533jMSf58+Dm++5twOKmgxeTEoG930s4Gp8FPXNiRJ92d9C7mljb
        R424CEPmDCjosmc9E/kR2XKNpkrbCgKu4kdE2CE=
X-Google-Smtp-Source: ABdhPJxrzGhqHPjJvKNeyVgygLdrRVwObjTOGw8lh1NsNI2BQrDAHkP3apBekJCw4DSqg/7AjgftB0iZc93dlX7/nyo=
X-Received: by 2002:a05:6602:8d:: with SMTP id h13mr1837277iob.163.1606295107095;
 Wed, 25 Nov 2020 01:05:07 -0800 (PST)
MIME-Version: 1.0
References: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
 <0c2fd9aa-7af4-5adb-ae6d-923c5eefb0b8@redhat.com>
In-Reply-To: <0c2fd9aa-7af4-5adb-ae6d-923c5eefb0b8@redhat.com>
From:   Mamchyts Dmitry <mamchyts@gmail.com>
Date:   Wed, 25 Nov 2020 12:04:56 +0300
Message-ID: <CAC+zXp9LpSqTBBCwOVbxK0VUjvyk3H4PU6jnqJSwx8v_O5g3xg@mail.gmail.com>
Subject: Re: Asus Zephyrus G14 GA401IH-HE003 problem with sound and fan
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, general problem with fan - fans run very loud

  root@ga401ih:/sys/devices/platform/asus-nb-wmi/hwmon/hwmon6# cat fan1_input
  2400

But all sensors show temperatures 27-30 C.
So, I want to set  a lower fan speed manually.
Current speed - 2400

  root@ga401ih:/sys/devices/platform/asus-nb-wmi/hwmon/hwmon6# cat fan1_input
  2400

Can I set lower fan speed?



On Tue, Nov 24, 2020 at 4:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/12/20 8:19 PM, Mamchyts Dmitry wrote:
> > I got an Asus Zephyrus G14 GA401IH-HE003 with AMD Ryzen 7 4800HS and a
> > NVIDIA GeForce GTX 1650.
> > I am use 5.9.8-050908-generic kernel from
> > (kernel.ubuntu.com/~kernel-ppa/mainline/v5.9.8/)
> >
> >     dmamchyts@ga401ih:~$ cat /etc/os-release
> >     NAME="Ubuntu"
> >     VERSION="20.10 (Groovy Gorilla)"
> >
> > I have some problem with sound and fan:
> > The first problem is a sound from notebook speakers: when I use
> > headphones via 3.5 jack - all works fine. I can control sound level
> > (from low to high). But when I try to listen to any sounds from
> > notebook speakers - volume always has a high level (I think it's a max
> > level of notebook speakers sound). I am using KDE, and I hear a sound
> > level of 5% the same as 100%.
>
> Next time please try reporting 1 issue per bug report. The
> platform-driver-x86@vger.kernel.org mailinglist is the right address
> for the fan issue, but for the sound issue you really should send
> a separate bug report to the sound/alsa developers.
>
> > The second problem is a fan speed.
>
> What exactly is the problem with the fan speed ?
>
> <snip>
>
> >     xxx@ga401ih:~/downloads$ ll /sys/class/hwmon/hwmon6/
> >     total 0
> >     drwxr-xr-x 3 root root    0 Nov 12 20:33 ./
> >     drwxr-xr-x 3 root root    0 Nov 12 20:33 ../
> >     lrwxrwxrwx 1 root root    0 Nov 12 20:34 device -> ../../../asus-nb-wmi/
> >     -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_input
> >     -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_label
> >     -r--r--r-- 1 root root 4096 Nov 12 20:34 name
> >     drwxr-xr-x 2 root root    0 Nov 12 21:30 power/
> >     -rw-r--r-- 1 root root 4096 Nov 12 21:30 pwm1_enable
> >     lrwxrwxrwx 1 root root    0 Nov 12 21:30 subsystem ->
> > ../../../../../class/hwmon/
> >     -rw-r--r-- 1 root root 4096 Nov 12 20:33 uevent
>
> Ok, so pwmconfig will not work here because there only is a
> pwm1_enable file and not a pwm1 file for controlling the actual
> fan-speed.
>
> This is normal on most newer Asus models you can sat the fan
> to 1 of 2 modes:
>
> 1. fullspeed:
>
> echo 0 > /sys/class/hwmon/hwmon6/pwm1_enable
>
> 2. automatic speed control (the default)
>
> echo 2 > /sys/class/hwmon/hwmon6/pwm1_enable
>
> Regards,
>
> Hans
>
