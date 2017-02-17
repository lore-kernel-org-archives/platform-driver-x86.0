From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Fri, 17 Feb 2017 09:39:20 +0200
Message-ID: <CAHp75VeUGMYpmth34OisQT54VhmkuDSFp=OAOu+c69L3GUZUmg@mail.gmail.com>
References: <20170214141612.16913-1-rrs@debian.org> <20170217033301.GI6814@wisp>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:35397 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751579AbdBQHjV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 02:39:21 -0500
In-Reply-To: <20170217033301.GI6814@wisp>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ritesh Raj Sarraf <rrs@debian.org>, Rafael Wysocki <rjw@rjwysocki.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 17, 2017 at 5:33 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Feb 14, 2017 at 07:46:12PM +0530, Ritesh Raj Sarraf wrote:
>> Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
>> 14 etc) has multiple modles that are a hybrid laptop, working in laptop
>> mode as well as tablet mode.

> That said, we need to make these systems usable, and as there appears not to be
> an accepted standard way of doing this, I don't object to the approach. However,
> you mentioned in the bug comments (#64) on 2/12:
>
>     "I have attached the final patch that I had proposed, but for whatever
>     reasons, the maintainer isn't convinced that that interface is needed."
>
> This is the only version of this patch I have seen.

This patch is actually a v2 that includes maintainers as I had asked
and additional paragraph to explain why we need such interface.

> Who objected to the patch?

I was trying to understand why /dev/input/eventX can not be used for a such.

> I would like to hear from Rafael and Dmitry, for their opinion on an ACPI or INPUT
> interface for indicating TABLET_MODE to userspace. Even if we accept this patch
> as is, we should be thinking about how to do this in a standard way.

Good point!

>> +
>> +     if (!count)
>> +             return 0;
>> +     if (sscanf(buf, "%i", &state) != 1)
>> +             return -EINVAL;
>
> Please use kstrtoint, and no need to check for count as this function won't get
> called if it is 0.

I guess Ritesh followed existing style in the code.

-- 
With Best Regards,
Andy Shevchenko
