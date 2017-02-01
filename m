From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Wed, 1 Feb 2017 17:07:31 +0200
Message-ID: <CAHp75VcHE8ZHpuS=WEQOD7kMLSDSiFhZSAx_55ARidi0FUhapw@mail.gmail.com>
References: <20170130105749.17338-1-rrs@debian.org> <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
 <1485863265.11199.3.camel@debian.org> <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
 <1485959219.8977.1.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34442 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752103AbdBAPHd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 10:07:33 -0500
Received: by mail-qt0-f195.google.com with SMTP id w20so31110922qtb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Feb 2017 07:07:33 -0800 (PST)
In-Reply-To: <1485959219.8977.1.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

On Wed, Feb 1, 2017 at 4:26 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
> On Wed, 2017-02-01 at 13:25 +0200, Andy Shevchenko wrote:
>> We have Yoga 900 here and I just played with it.
>> So, can you do the following:
>> 1. Boot system to a text mode (no X).
>> 2. Be sure that ideapad_lenovo module is loaded
>> 3. By looking into output of
>> % ls -l /sys/class/input
>> find VPC2004 related *event* number (/.../eventX/...)
>> 4. Run
>> % od -x /dev/input/eventX
>> 5. Ensure that you get events (hex dump) when you bend the cover.
>>
>> We can continue after you try the above.
>>
>
> Fantastic. In that case, I hope you can help enable SW_TABLET_MODE for ideapad
> driver too.
>
> Here's what you asked for:

> lrwxrwxrwx 1 root root 0 Feb  1 19:33 event6 -> ../../devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/input/input8/event6

> root@learner:/sys/class/input# od -x /dev/input/event6
> ?0000000 ee33 5891 0000 0000 2bd9 0005 0000 0000
> ^@0000020 0004 0004 0042 0000 ee33 5891 0000 0000
> 0000040 2bd9 0005 0000 0000 0001 00c1 0001 0000
> 0000060 ee33 5891 0000 0000 2bd9 0005 0000 0000
> 0000100 0000 0000 0000 0000 ee33 5891 0000 0000
> 0000120 2c09 0005 0000 0000 0001 00c1 0000 0000
> 0000140 ee33 5891 0000 0000 2c09 0005 0000 0000
> 0000160 0000 0000 0000 0000 ee37 5891 0000 0000
> 0000200 3d7e 000f 0000 0000 0004 0004 0043 0000
> 0000220 ee37 5891 0000 0000 3d7e 000f 0000 0000
> 0000240 0001 00c0 0001 0000 ee37 5891 0000 0000
> 0000260 3d7e 000f 0000 0000 0000 0000 0000 0000
> 0000300 ee37 5891 0000 0000 3dae 000f 0000 0000
> 0000320 0001 00c0 0000 0000 ee37 5891 0000 0000
> 0000340 3dae 000f 0000 0000 0000 0000 0000 0000

So, the whole idea of this exercise is to show that driver sends an
event whenever you bend / unbend the cover.
User space already will know what is the state of the cover.

> By the way, does the patch make sense for
> inclusion ? To have an interface for touchpad mode ?

The question now is why do you need that on top of existing event?

-- 
With Best Regards,
Andy Shevchenko
