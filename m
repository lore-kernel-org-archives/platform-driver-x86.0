From: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
Subject: RE: keyboard backlight =?UTF-8?Q?max=5Fbrightness=20bug=20on=20Dell=20Lat?=
 =?UTF-8?Q?itude=20E=36=34=31=30?=
Date: Mon, 02 Oct 2017 12:10:01 -0700
Message-ID: <20171002121000.669a95d04dbb6b53be537852cb8ecb8c.7af7edfd14.wbe@email22.secureserver.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from p3plsmtp22-01-2.prod.phx3.secureserver.net ([68.178.252.54]:51868
        "EHLO p3plwbeout22-01.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751336AbdJBTKe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Oct 2017 15:10:34 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?UTF-8?Q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: andy.shevchenko@gmail.com, gabriele.mzt@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario.Limonciello@dell.com

-------- Original Message --------
Subject: Re: keyboard backlight max_brightness bug on Dell Latitude
E6410
From: Pali Rohár <pali.rohar@gmail.com>
Date: Mon, October 02, 2017 8:15 am
To: gabriel@tekgnowsys.com
Cc: andy.shevchenko@gmail.com, gabriel@tekgnowsys.com,
gabriele.mzt@gmail.com, dvhart@infradead.org, andy@infradead.org,
platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
Mario.Limonciello@dell.com

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

-------------------------------------------------------------------------------
# cat -v /sys/class/dmi/id/sys_vendor
Dell Inc.
# cat -v /sys/class/dmi/id/product_name
Latitude E6410
# cat -v /sys/class/dmi/id/sys_vendor | hexdump
0000000 6544 6c6c 4920 636e 0a2e               
000000a
# cat -v /sys/class/dmi/id/product_name | hexdump
0000000 614c 6974 7574 6564 4520 3436 3031 000a
000000f

Also updated https://bugzilla.kernel.org/show_bug.cgi?id=196913 with
this info

- Gabriel
-------------------------------------------------------------------------------
