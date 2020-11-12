Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2559C5519F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 19:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69C3620B80
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 19:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tYETp5jZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgKLTTl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Nov 2020 14:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgKLTTk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Nov 2020 14:19:40 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFC4C0613D1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2020 11:19:40 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id y17so6309220ilg.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2020 11:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=GDEe9f1lQV+OQNx1PHgQawCaHxvwqF3odprS2leHfX0=;
        b=tYETp5jZSWmO6Ycyi0JtbwKP+2ghdrQ81fRzL6KBes0GBZalINqIl6YBBZ99BumWlj
         /YOJk1Ocx/me7S6osFaJyW9X6VOW5MmbcgZ7iHyamnltBh+TqDBE2wrmJfDdr1JIIs4S
         qKJcr8oeDFIllpBdRbVDYOd072tOGWvTDlbya2TL123oL2bFi62yi/LQ579GahAZo2LC
         4rwweYnCq3Z/jSYOiK2W5dMsMYUxZ/csSP0pyoRcnPey34y6ojsbENkv3mgEoQy+EyLg
         gdbxNOGH15zICT7+bqVns56cp6dThHPBvXdc9+9jSs5sizdRUz3F6JxAbYM9QPpZP5C4
         dyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=GDEe9f1lQV+OQNx1PHgQawCaHxvwqF3odprS2leHfX0=;
        b=bCPtUV5r57YNwQSDU+C6G2gZEViQL9DbQUzmAuLAbQ9qh5+o91F8oBg5avOoM913sx
         //9AlHIerh1xSDEb4Wf/+LPsczgFULc39PDH5F62nxmkS1HdGRWNRquol54nGgWkZazP
         2AOLVUXzoDZmmsfJclZ3c56eEGKB3K6mV35JOfl0SSGj5Ctdu6p6p5dYytPqekCdAmwx
         q6ktHyc6Dzvmdfr7bzktUQCvmzE1o4bW+QJig5jRe11+Ujg7IVe4gZqq1gvfyfCRmh5J
         ToPMw6uBTSnDn5Gvq8MyqAvzM+VU5OQxPBDW8zb7ZN2wrvY8mlg/cGh1vzxsSYGdJkoy
         ZSSw==
X-Gm-Message-State: AOAM532c6A1rEU0Q7pkFfnnwLlu3od4tLWdts8sOholUWLZojq+BDsfP
        dA5SbrtkIt1MwKGgJwOIeOwaHIL5hB9BUWUzuL791C8lnPI=
X-Google-Smtp-Source: ABdhPJzaB+52A5qvvOdO05/Oi37kjB4m8OG4gZlnJ06RYA7uO164+flQV1y3tkfdrTtN/6iol2YNwVmagPdJQP8E+iA=
X-Received: by 2002:a92:3403:: with SMTP id b3mr873519ila.140.1605208779810;
 Thu, 12 Nov 2020 11:19:39 -0800 (PST)
MIME-Version: 1.0
From:   Mamchyts Dmitry <mamchyts@gmail.com>
Date:   Thu, 12 Nov 2020 22:19:28 +0300
Message-ID: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
Subject: Asus Zephyrus G14 GA401IH-HE003 problem with sound and fan
To:     platform-driver-x86@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I got an Asus Zephyrus G14 GA401IH-HE003 with AMD Ryzen 7 4800HS and a
NVIDIA GeForce GTX 1650.
I am use 5.9.8-050908-generic kernel from
(kernel.ubuntu.com/~kernel-ppa/mainline/v5.9.8/)

    dmamchyts@ga401ih:~$ cat /etc/os-release
    NAME="Ubuntu"
    VERSION="20.10 (Groovy Gorilla)"

I have some problem with sound and fan:
The first problem is a sound from notebook speakers: when I use
headphones via 3.5 jack - all works fine. I can control sound level
(from low to high). But when I try to listen to any sounds from
notebook speakers - volume always has a high level (I think it's a max
level of notebook speakers sound). I am using KDE, and I hear a sound
level of 5% the same as 100%.
The second problem is a fan speed.
I try to use the solution from gitlab.com/asus-linux/asus-nb-ctrl -
but it doesn't work.

    xxx@ga401ih:~/downloads$ asusctl -p silent
    Error: D-Bus error: The name org.asuslinux.Daemon was not provided
by any .service files (org.freedesktop.DBus.Error.ServiceUnknown)

I was try to use fancontrol
(wiki.archlinux.org/index.php/fan_speed_control#lm-sensors)
but got an error:

    xxx@ga401ih:~/downloads$ sudo pwmconfig
    # pwmconfig version 3.6.0
    ...
    /usr/sbin/pwmconfig: There are no pwm-capable sensor modules installed


But:
    xxx@ga401ih:~/downloads$ ll /sys/class/hwmon/hwmon6/
    total 0
    drwxr-xr-x 3 root root    0 Nov 12 20:33 ./
    drwxr-xr-x 3 root root    0 Nov 12 20:33 ../
    lrwxrwxrwx 1 root root    0 Nov 12 20:34 device -> ../../../asus-nb-wmi/
    -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_input
    -r--r--r-- 1 root root 4096 Nov 12 20:34 fan1_label
    -r--r--r-- 1 root root 4096 Nov 12 20:34 name
    drwxr-xr-x 2 root root    0 Nov 12 21:30 power/
    -rw-r--r-- 1 root root 4096 Nov 12 21:30 pwm1_enable
    lrwxrwxrwx 1 root root    0 Nov 12 21:30 subsystem ->
../../../../../class/hwmon/
    -rw-r--r-- 1 root root 4096 Nov 12 20:33 uevent
And:
    xxx@ga401ih:~/downloads$ sensors | grep -i -C2 fan
    asus-isa-0000
    Adapter: ISA adapter
    cpu_fan:     2600 RPM

Maybe you can help me?
I can provide more info if you need it.

PS. Issue with broken fn-keys was solved with gitlab.com/asus-linux/asus-nb-ctrl
