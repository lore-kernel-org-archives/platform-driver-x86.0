From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Wed, 1 Feb 2017 22:53:21 +0200
Message-ID: <CAHp75VckDTD+yx4tTwpzgvgsygiWFEs1t5Uc85UsbaJD8inx_w@mail.gmail.com>
References: <20170130105749.17338-1-rrs@debian.org> <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
 <1485863265.11199.3.camel@debian.org> <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
 <1485959219.8977.1.camel@debian.org> <CAHp75VcHE8ZHpuS=WEQOD7kMLSDSiFhZSAx_55ARidi0FUhapw@mail.gmail.com>
 <1485965846.14297.1.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:36824 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751532AbdBAUxW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 15:53:22 -0500
Received: by mail-yw0-f193.google.com with SMTP id q71so27034514ywg.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Feb 2017 12:53:22 -0800 (PST)
In-Reply-To: <1485965846.14297.1.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

On Wed, Feb 1, 2017 at 6:17 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:

> On Wed, 2017-02-01 at 17:07 +0200, Andy Shevchenko wrote:
>> > root@learner:/sys/class/input# od -x /dev/input/event6
>> > ?0000000 ee33 5891 0000 0000 2bd9 0005 0000 0000
>> > ^@0000020 0004 0004 0042 0000 ee33 5891 0000 0000
>> > 0000040 2bd9 0005 0000 0000 0001 00c1 0001 0000
>> > 0000060 ee33 5891 0000 0000 2bd9 0005 0000 0000
>> > 0000100 0000 0000 0000 0000 ee33 5891 0000 0000
>> > 0000120 2c09 0005 0000 0000 0001 00c1 0000 0000
>> > 0000140 ee33 5891 0000 0000 2c09 0005 0000 0000
>> > 0000160 0000 0000 0000 0000 ee37 5891 0000 0000
>> > 0000200 3d7e 000f 0000 0000 0004 0004 0043 0000
>> > 0000220 ee37 5891 0000 0000 3d7e 000f 0000 0000
>> > 0000240 0001 00c0 0001 0000 ee37 5891 0000 0000
>> > 0000260 3d7e 000f 0000 0000 0000 0000 0000 0000
>> > 0000300 ee37 5891 0000 0000 3dae 000f 0000 0000
>> > 0000320 0001 00c0 0000 0000 ee37 5891 0000 0000
>> > 0000340 3dae 000f 0000 0000 0000 0000 0000 0000
>>
>> So, the whole idea of this exercise is to show that driver sends an
>> event whenever you bend / unbend the cover.
>> User space already will know what is the state of the cover.
>>
>
> Yes. But we've not found the interface in sysfs where we could read that from.
> Nor did udev report anything meaningful for it.
>
>> > By the way, does the patch make sense for
>> > inclusion ? To have an interface for touchpad mode ?
>>
>> The question now is why do you need that on top of existing event?
>
> If you have time, please see:
> https://bugs.launchpad.net/bugs/1366421
>
> It has pretty much all the details on what and why we need something in sysfs.

It's a lo-o-ong discussion from which I, might be wrongly, assumed
that there couple of problems: a) you don't know initial state, b)
something preventing use of event.

Keyboard and touchpad are disabled by hw, so, only what OS needs is a
notification.

Can you point me exactly to the message that explains _why_ it's
impossible to use standard eventX mechanism for that?

> For HP and ThinkPad, there already are interfaces available.

Perhaps those hybrids didn't lock keyboard and touchpad in hw and
don't send any event, that's why OS needs it.

> /sys/devices/platform/hp-wmi/tablet
> /sys/devices/platform/thinkpad_acpi/hotkey_tablet_mode
>
> It'd be nice to see the same for Yoga IdeaPad; a proper interface for tablet-
> mode


-- 
With Best Regards,
Andy Shevchenko
