From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Wed, 1 Feb 2017 13:25:15 +0200
Message-ID: <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
References: <20170130105749.17338-1-rrs@debian.org> <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
 <1485863265.11199.3.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34954 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbdBALZV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 06:25:21 -0500
Received: by mail-qt0-f195.google.com with SMTP id s58so22725365qtc.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Feb 2017 03:25:16 -0800 (PST)
In-Reply-To: <1485863265.11199.3.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

On Tue, Jan 31, 2017 at 1:47 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
> Hello Andy,
>
> On Mon, 2017-01-30 at 22:25 +0200, Andy Shevchenko wrote:
>> On Mon, Jan 30, 2017 at 12:57 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
>> > Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
>> > 14 etc) has multiple modles that are a hybrid laptop, working in laptop
>> > mode as well as tablet mode.
>>
>> The main question is who is the initiator of the mode change? Do you
>> need to do anything in UI to prepare OS for such switch?
>>
>
> The human user is the only initiator. The hardware has 360 degree rotation.
> There is nothing special needed in the UI, or the OS, to get into tablet mode.
> Just flip the hardware 360 degree into tablet mode.
>
> More details on the hardware series can be found at:
> http://shop.lenovo.com/us/en/laptops/lenovo/yoga-laptop-series/yoga-laptop-2-13/

We have Yoga 900 here and I just played with it.
So, can you do the following:
1. Boot system to a text mode (no X).
2. Be sure that ideapad_lenovo module is loaded
3. By looking into output of
% ls -l /sys/class/input
find VPC2004 related *event* number (/.../eventX/...)
4. Run
% od -x /dev/input/eventX
5. Ensure that you get events (hex dump) when you bend the cover.

We can continue after you try the above.

> Sorry about that. I am no kernel developer, just wanting to fix my hardware.
>
> I looked into the doc. The documentation mentions the sysfs path:
> '/sys/devices/platform/ideapad/fan_mode', which is what we would also want to
> use.
>
> But the driver only shows the interface through:
> '/sys/devices/platform/devices/VPC2004:00/'
>
> Is this an expected behavior ?

Driver is old, perhaps it's not fixed part, perhaps it's by design.

> Please find attached revised patch along with write support and ABI
> Documentation changes.

Next time please avoid attachments here.

-- 
With Best Regards,
Andy Shevchenko
