From: kedar kedar <k3dar7@gmail.com>
Subject: Re: Feature request - support kbd_backlight on Hewlett-Packard
Date: Fri, 10 Nov 2017 02:39:14 +0100
Message-ID: <CA+5nTAKf8qX=b0+Czt==haYm32_a-KWCiOzy63Fr0=ccezr01A@mail.gmail.com>
References: <CA+5nTALWPfriz7O63C09hUqy6bPrsO9z1mk9wjANMZqdStn=Kg@mail.gmail.com>
 <CAHp75VdwZSF=+gqvktXB5qvO9ntTWvajiUqifC72E_s5jW9yfw@mail.gmail.com> <20171109182054.GE21449@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.161.176]:45169 "EHLO
        mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755402AbdKJBjP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 20:39:15 -0500
In-Reply-To: <20171109182054.GE21449@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

2017-11-09 19:20 GMT+01:00, Darren Hart <dvhart@infradead.org>:
> On Thu, Nov 09, 2017 at 02:24:44PM +0200, Andy Shevchenko wrote:
>> +Cc: correct subsystem
>>
>> On Thu, Nov 9, 2017 at 3:04 AM, kedar kedar <k3dar7@gmail.com> wrote:
>> > Hello,
>> >
>> > Can anyone please try add support for controlling keyboard backlight
>> > via sysfs on Hewlett-Packard notebooks?
>> > Maybe in a similar way as this last year patch for Thinkpad?
>> > https://lkml.org/lkml/2015/12/24/295
>> > BTW: This functionality is already supported (minimaly) on Apple,
>> > ASUS, Dell, Samsung, Sony, Thinkpad, Toshiba :-)
>>
>> I dunno if my corporate windows laptop has this feature, though I
>> can't do anything in near future regarding to this, no time.
>>
>> In any case it looks like HP stuff is kinda orphaned in PDx86
>> subsystem (just occasional fixes happen).
>
> Hi Kedar,
>
> is there a bugzilla entry open for this? If not, this is a good way to
> capture the problem and share details on the system with people that may
> be able to help but do not have the hardware platform itself.
>
>
> https://bugzilla.kernel.org
>
> --
> Darren Hart
> VMware Open Source Technology Center
>

Hi Darren,
Thanks for answer, opened entry on bugzilla and attach DSDT from HP 8570w:
https://bugzilla.kernel.org/show_bug.cgi?id=197829
k3dAR
