From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: new backlight driver
 for DELL AIO
Date: Fri, 27 Oct 2017 10:21:09 +0800
Message-ID: <CAMz9Wg9saRUE514u1RyYEuf6fDppQWgqFPyk+iiXQW3F9ZJc7A@mail.gmail.com>
References: <1509004429-1596-1-git-send-email-acelan.kao@canonical.com>
 <08add166d5b34992ba167a878ca2a808@ausx13mpc124.AMER.DELL.COM> <20171026171011.3eca122e@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:44942 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751399AbdJ0CVL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Oct 2017 22:21:11 -0400
In-Reply-To: <20171026171011.3eca122e@alans-desktop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: Mario.Limonciello@dell.com, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Alex,

2017-10-27 0:10 GMT+08:00 Alan Cox <gnomes@lxorguk.ukuu.org.uk>:
>
>> > +static int __init dell_uart_bl_init(void)
>> > +{
>> > +   ftty = filp_open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY, 0);
>>
>
> You have no idea what name is assigned. This doesn't work.
Yes, I did. The port is defined in BIOS as PNP0501 uart port,
so the port will be registered by 8250 PNP driver as ttyS* device.
And consider it's defined in the BIOS, so it should be the first uart
port on the system,
and ttyS0 would be his name.

>
> This isn't the way to do it any more because the 'tty from kernel'
> problem finally got fixed. You can attach it as a serdev directly to the
> kernel.
>
> Take a look at serdev_tty_port_register/serdev_tty_port_unreg
Yes, I'm studying serdev, but currently there are not many examples
for reference,
so I still have no clues how to implement it by serdev.
I'll try using serdev_tty_port_register/serdev_tty_port_unreg to
re-implement the driver.
Thanks.

>
> Alan



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
