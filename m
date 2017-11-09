From: Darren Hart <dvhart@infradead.org>
Subject: Re: Feature request - support kbd_backlight on Hewlett-Packard
Date: Thu, 9 Nov 2017 10:20:54 -0800
Message-ID: <20171109182054.GE21449@fury>
References: <CA+5nTALWPfriz7O63C09hUqy6bPrsO9z1mk9wjANMZqdStn=Kg@mail.gmail.com>
 <CAHp75VdwZSF=+gqvktXB5qvO9ntTWvajiUqifC72E_s5jW9yfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:44408 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbdKISUz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 13:20:55 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VdwZSF=+gqvktXB5qvO9ntTWvajiUqifC72E_s5jW9yfw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kedar kedar <k3dar7@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Thu, Nov 09, 2017 at 02:24:44PM +0200, Andy Shevchenko wrote:
> +Cc: correct subsystem
> 
> On Thu, Nov 9, 2017 at 3:04 AM, kedar kedar <k3dar7@gmail.com> wrote:
> > Hello,
> >
> > Can anyone please try add support for controlling keyboard backlight
> > via sysfs on Hewlett-Packard notebooks?
> > Maybe in a similar way as this last year patch for Thinkpad?
> > https://lkml.org/lkml/2015/12/24/295
> > BTW: This functionality is already supported (minimaly) on Apple,
> > ASUS, Dell, Samsung, Sony, Thinkpad, Toshiba :-)
> 
> I dunno if my corporate windows laptop has this feature, though I
> can't do anything in near future regarding to this, no time.
> 
> In any case it looks like HP stuff is kinda orphaned in PDx86
> subsystem (just occasional fixes happen).

Hi Kedar,

is there a bugzilla entry open for this? If not, this is a good way to
capture the problem and share details on the system with people that may
be able to help but do not have the hardware platform itself.


https://bugzilla.kernel.org

-- 
Darren Hart
VMware Open Source Technology Center
