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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B09C5519F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 21:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABD6C216C4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 21:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuCQT9bg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgKLVNC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Nov 2020 16:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgKLVNB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Nov 2020 16:13:01 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3342C0613D1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2020 13:13:01 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id r186so5303126pgr.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2020 13:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WQ5Qt6M6eKjDpapVqJKvN6/yg69yM8z3sHD0JSu2LrU=;
        b=UuCQT9bg8RhDtrIsKrr0Ar9CCGuRvAoFMllaUGQAx4oSElOBnvWH4l76fkJ0z93NoD
         zoD1esMiyVQCxpesI2K4IrfdFEqrxCTLjo/+gXBniB/U+WxAWXa99mMBlQfZajQUeecy
         3x6yziWXyl0ggr4tFHwvfIcOUfWCDvuHdFVk2cKsSfwW0aHBLRN59ZRWFkCxoKZMRifw
         QCYNUWWQYZYMronczrW4hg1Fp00fHmo431JJhJIEGX1z0NDp78J3Dk+iAxXiNU8/uLS/
         gY/E9YEVUWaaKxlqs3ZpDbpbO3NYBq81wrYrC62EzUq+Aqxmo5KzgC4jVEZkcVO8paCf
         GsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQ5Qt6M6eKjDpapVqJKvN6/yg69yM8z3sHD0JSu2LrU=;
        b=fgM53JgwXrc9PlwHYzcJQ5+n/qQFZo3o96VRJV1oiYgvhrE40gU3L71+ksU8wqTz0p
         qW6M5YENJQHGZyBJQLO77vlLN4K8NaVzkzyoBTzD7wxAMBUF2qVXllccCgqTDlgTl7EN
         HN2cRgR54cf7K2O/7ElcHM/fKcgNlbJDYp/9uDsSsyz0w74MpB7CVcYc2WcjBDpYvI/r
         jeBmOARjo1mtyI5JM5bfP+hX73t6w/aiQ+AFhpAFA5LJvfW4+qwnGn9HcdTNewir6gm2
         emRJsZkwKG1R7JffuZ3AYBZTsL7xpnkueTFyCc/eRR7m+PZvLG0qmsgSYMcAVcpLknGi
         +RQQ==
X-Gm-Message-State: AOAM533aLNosjuRTzlIlWR7nQACSrRhwfJ62zJWzlJLCB6EnbdeA4lMr
        ZqPfBBTXnYg2I8RoJNHHl5rEaFiGVfYaXYBxWZc=
X-Google-Smtp-Source: ABdhPJwFEcoSb7ixXT1C/ttMO+gQ3gy1jkEqg+i4uxOyPOFvrbKlOULTjda9u8g4xQPv0UvRMLPZtI11gjO+SAGq2pU=
X-Received: by 2002:a17:90a:4816:: with SMTP id a22mr1173199pjh.228.1605215581174;
 Thu, 12 Nov 2020 13:13:01 -0800 (PST)
MIME-Version: 1.0
References: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
In-Reply-To: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 23:13:49 +0200
Message-ID: <CAHp75VcFx01Ez1MiFP1hoanABrWFWJmmwQDugW6VyFiQNftaqg@mail.gmail.com>
Subject: Re: Asus Zephyrus G14 GA401IH-HE003 problem with sound and fan
To:     Mamchyts Dmitry <mamchyts@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: maintainers
On Thu, Nov 12, 2020 at 9:22 PM Mamchyts Dmitry <mamchyts@gmail.com> wrote:
>
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
> The second problem is a fan speed.
> I try to use the solution from gitlab.com/asus-linux/asus-nb-ctrl -
> but it doesn't work.
>
>     xxx@ga401ih:~/downloads$ asusctl -p silent
>     Error: D-Bus error: The name org.asuslinux.Daemon was not provided
> by any .service files (org.freedesktop.DBus.Error.ServiceUnknown)
>
> I was try to use fancontrol
> (wiki.archlinux.org/index.php/fan_speed_control#lm-sensors)
> but got an error:
>
>     xxx@ga401ih:~/downloads$ sudo pwmconfig
>     # pwmconfig version 3.6.0
>     ...
>     /usr/sbin/pwmconfig: There are no pwm-capable sensor modules installed
>
>
> But:
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
> And:
>     xxx@ga401ih:~/downloads$ sensors | grep -i -C2 fan
>     asus-isa-0000
>     Adapter: ISA adapter
>     cpu_fan:     2600 RPM
>
> Maybe you can help me?
> I can provide more info if you need it.
>
> PS. Issue with broken fn-keys was solved with gitlab.com/asus-linux/asus-nb-ctrl



-- 
With Best Regards,
Andy Shevchenko
