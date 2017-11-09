From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Feature request - support kbd_backlight on Hewlett-Packard
Date: Thu, 9 Nov 2017 14:24:44 +0200
Message-ID: <CAHp75VdwZSF=+gqvktXB5qvO9ntTWvajiUqifC72E_s5jW9yfw@mail.gmail.com>
References: <CA+5nTALWPfriz7O63C09hUqy6bPrsO9z1mk9wjANMZqdStn=Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+5nTALWPfriz7O63C09hUqy6bPrsO9z1mk9wjANMZqdStn=Kg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kedar kedar <k3dar7@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: correct subsystem

On Thu, Nov 9, 2017 at 3:04 AM, kedar kedar <k3dar7@gmail.com> wrote:
> Hello,
>
> Can anyone please try add support for controlling keyboard backlight
> via sysfs on Hewlett-Packard notebooks?
> Maybe in a similar way as this last year patch for Thinkpad?
> https://lkml.org/lkml/2015/12/24/295
> BTW: This functionality is already supported (minimaly) on Apple,
> ASUS, Dell, Samsung, Sony, Thinkpad, Toshiba :-)

I dunno if my corporate windows laptop has this feature, though I
can't do anything in near future regarding to this, no time.

In any case it looks like HP stuff is kinda orphaned in PDx86
subsystem (just occasional fixes happen).

-- 
With Best Regards,
Andy Shevchenko
