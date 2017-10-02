From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: keyboard backlight max_brightness bug on Dell Latitude E6410
Date: Mon, 2 Oct 2017 15:15:40 +0200
Message-ID: <20171002131540.GE10938@pali>
References: <20170929070823.669a95d04dbb6b53be537852cb8ecb8c.0314fabe33.wbe@email22.secureserver.net>
 <20170929141125.GO13546@pali>
 <CAHp75VdBJxWKEsso1VrV_Q5UbU7oGx5G=DRX8SZ5K=qWx=6VBA@mail.gmail.com>
 <20171002115247.GB10938@pali>
 <85b11afa464948a1abcede55b7f66a25@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:49084 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbdJBNPn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Oct 2017 09:15:43 -0400
Content-Disposition: inline
In-Reply-To: <85b11afa464948a1abcede55b7f66a25@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: andy.shevchenko@gmail.com, gabriel@tekgnowsys.com, gabriele.mzt@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario.Limonciello@dell.com

On Monday 02 October 2017 13:06:46 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Monday, October 2, 2017 6:53 AM
> > To: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Gabriel M. Elder <gabriel@tekgnowsys.com>; Gabriele Mazzotta
> > <gabriele.mzt@gmail.com>; Limonciello, Mario <Mario_Limonciello@Dell.com>;
> > Darren Hart <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
> > platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: keyboard backlight max_brightness bug on Dell Latitude E6410
> > 
> > On Friday 29 September 2017 18:19:59 Andy Shevchenko wrote:
> > > >> FYI, latest update and info relating to
> > > >> https://bugzilla.kernel.org/show_bug.cgi?id=196913
> > >
> > > Quick solution is to apply DMI to that.
> > 
> > It is only the Dell Latitude E6410 affected?
> > 
> > Mario, do you have any information about that API from Dell?
> > 
> > --
> > Pali Rohár
> > pali.rohar@gmail.com
> 
> Pali,
> 
> I believe this particular API shouldn't have changed over generations, so it's 
> likely something that needs to be quirked for that generation.  
> I haven't had a chance to check on this yet in detail though.
> For now could you guys quirk this one and if I find out there was something
> more systemic we can undo the quirk and do something more broad.
> 
> Thanks,

Ok! Gabriel, can you provide us your DMI information about your machine?

They are included in following files:
/sys/class/dmi/id/sys_vendor
/sys/class/dmi/id/product_name

Beware that they may contain whitespace characters and it is important.

-- 
Pali Rohár
pali.rohar@gmail.com
