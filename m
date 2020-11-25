Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC219C5519F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 10:23:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81F47206D9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 10:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9O3iouE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgKYKXP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgKYKXO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 05:23:14 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66B3C0613D4
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 02:23:14 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id q1so1632509ilt.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 02:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q99CHCyiMtv3JweuqeR168CekkG5AiCXeca5YbGYqTM=;
        b=L9O3iouEJfrwES6i+Ic6sl4c4KB7KFOBO4ifjef5woyPr63zaBRweFrQxF1AHgZznX
         jYh+lrfG0eBoPBsQdRUbts9//H0gdDHq7L12wRb5ihuje5LU8AvpZFNepC1tYWJvW8oO
         t9CILkBZ6xm4lx/5YodmoGVD7VZzqtl7Pfld2EWMq3NMvx6y7wEGp2DDaKFzxngU7L2T
         Por0CvlQH7GIC1XlcZSRvIhUIxZnAymip8IDRKJRupmTnZaiJKVhs6O/WislQ8enLRrE
         cK5BcQnVlaah6K2vD0YVYNuvM38lgO9mVmUHcidqZ9Yog1XxOmCYBdSvEhHx06aK3xGX
         R3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q99CHCyiMtv3JweuqeR168CekkG5AiCXeca5YbGYqTM=;
        b=V5OWXNvvYAe3b7+LRHu7orFvGxhaCzwEoL/z3bgB1yLmRliR823s+KiIUO4xH5F5iN
         AqeoozzYgg9NDBT7RPA2UEdJRryLdkAqpiNU8Rm0Qlf1e2O7YYIXOzExajR7Ja+QUWK7
         ENcKHQsDP1tKaUNdM0Eoyz9iooBm1stG5ArUhpA13oAAOBSqMwRQcAm+Xj46wWhdlabo
         0xmUFl1FWPN6E6atzk33XGZTtrT79nePjOJJVTQQhcgEBXY+s72GjHHhWRuYTIFoOo3m
         aQEaWaB7ca/z7XpwMMwOI9YZddNlnsZSzYLzX1oxXtumtUKJ5c4GSvNUyGt2d6CHI9QR
         ZL7Q==
X-Gm-Message-State: AOAM530PmjLTWvLlsv6eQqHwk4175xVwMm5cevy5Slq5sIPSLIrrTm3n
        7faAW97tO6EGiHpSlL3Kw7WwkYX5/u13oiCS/AN7/ZDPOm8=
X-Google-Smtp-Source: ABdhPJznrS+Vi7Bo2sH91LSmXp0zpnD/dQmgKt+oE/utDMoaG++orExnF+gNJbOosKvYvQQ5lpe4PKVnx9GCnOMoEag=
X-Received: by 2002:a92:d0cf:: with SMTP id y15mr2357004ila.168.1606299794088;
 Wed, 25 Nov 2020 02:23:14 -0800 (PST)
MIME-Version: 1.0
References: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
 <0c2fd9aa-7af4-5adb-ae6d-923c5eefb0b8@redhat.com> <CAC+zXp9LpSqTBBCwOVbxK0VUjvyk3H4PU6jnqJSwx8v_O5g3xg@mail.gmail.com>
 <d9c16af8-5cbb-55cf-089a-158986734937@redhat.com>
In-Reply-To: <d9c16af8-5cbb-55cf-089a-158986734937@redhat.com>
From:   Mamchyts Dmitry <mamchyts@gmail.com>
Date:   Wed, 25 Nov 2020 13:23:03 +0300
Message-ID: <CAC+zXp99B=J_qqCnP=xdzJpDDrDDWi6PzDQHwSMb-yi7jX0=xA@mail.gmail.com>
Subject: Re: Asus Zephyrus G14 GA401IH-HE003 problem with sound and fan
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,
Yes, you are right.

cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable returns 2

but it's too loud.
I want to set a lower fan RPM value. 2400 - is too big for me.

Can I set 2000 or lower?


PS. When I set 0 into pwm1_enable. Fan speed is near 6000 RPM.

On Wed, Nov 25, 2020 at 1:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/25/20 10:04 AM, Mamchyts Dmitry wrote:
> > Hi, general problem with fan - fans run very loud
> >
> >   root@ga401ih:/sys/devices/platform/asus-nb-wmi/hwmon/hwmon6# cat fan1_input
> >   2400
> >
> > But all sensors show temperatures 27-30 C.
> > So, I want to set  a lower fan speed manually.
> > Current speed - 2400
> >
> >   root@ga401ih:/sys/devices/platform/asus-nb-wmi/hwmon/hwmon6# cat fan1_input
> >   2400
> >
> > Can I set lower fan speed?
>
> AFAIK the asus-wmi code sets the mode to auto at probe, you can check by doing:
>
> cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
>
> That should return "2". If it does not try:
>
> echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
>
> Regards,
>
> Hans
>
>
> >
> >
> >
> > On Tue, Nov 24, 2020 at 4:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 11/12/20 8:19 PM, Mamchyts Dmitry wrote:
> >>> I got an Asus Zephyrus G14 GA401IH-HE003 with AMD Ryzen 7 4800HS and a
> >>> NVIDIA GeForce GTX 1650.
> >>> I am use 5.9.8-050908-generic kernel from
> >>> (kernel.ubuntu.com/~kernel-ppa/mainline/v5.9.8/)
> >>>
> >>>     dmamchyts@ga401ih:~$ cat /etc/os-release
> >>>     NAME="Ubuntu"
> >>>     VERSION="20.10 (Groovy Gorilla)"
> >>>
> >>> I have some problem with sound and fan:
> >>> The first problem is a sound from notebook speakers: when I use
> >>> headphones via 3.5 jack - all works fine. I can control sound level
> >>> (from low to high). But when I try to listen to any sounds from
> >>> notebook speakers - volume always has a high level (I think it's a max
> >>> level of notebook speakers sound). I am using KDE, and I hear a sound
> >>> level of 5% the same as 100%.
> >>
> >> Next time please try reporting 1 issue per bug report. The
> >> platform-driver-x86@vger.kernel.org mailinglist is the right address
> >> for the fan issue, but for the sound issue you really should send
> >> a separate bug report to the sound/alsa developers.
> >>
> >>> The second problem is a fan speed.
> >>
> >> What exactly is the problem with the fan speed ?
> >>
> >> <snip>
> >>
> >>>     xxx@ga401ih:~/downloads$ ll /sys/class/hwmon/hwmon6/
> >>>     total 0
> >>>     drwxr-xr-x 3 root root    0 Nov 12 20:33 ./
> >>>     drwxr-xr-x 3 root root    0 Nov 12 20:33 ../
> >>>     lrwxrwxrwx 1 root root    0 Nov 12 20:34 device -> ../../../asus-nb-wmi/
> >>>     -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_input
> >>>     -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_label
> >>>     -r--r--r-- 1 root root 4096 Nov 12 20:34 name
> >>>     drwxr-xr-x 2 root root    0 Nov 12 21:30 power/
> >>>     -rw-r--r-- 1 root root 4096 Nov 12 21:30 pwm1_enable
> >>>     lrwxrwxrwx 1 root root    0 Nov 12 21:30 subsystem ->
> >>> ../../../../../class/hwmon/
> >>>     -rw-r--r-- 1 root root 4096 Nov 12 20:33 uevent
> >>
> >> Ok, so pwmconfig will not work here because there only is a
> >> pwm1_enable file and not a pwm1 file for controlling the actual
> >> fan-speed.
> >>
> >> This is normal on most newer Asus models you can sat the fan
> >> to 1 of 2 modes:
> >>
> >> 1. fullspeed:
> >>
> >> echo 0 > /sys/class/hwmon/hwmon6/pwm1_enable
> >>
> >> 2. automatic speed control (the default)
> >>
> >> echo 2 > /sys/class/hwmon/hwmon6/pwm1_enable
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >
>
