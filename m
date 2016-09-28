From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] drivers/platform/x86: introduce support for Mellanox
 hotplug driver
Date: Wed, 28 Sep 2016 12:48:37 +0000
Message-ID: <AM5PR0501MB2097CFDA1ACEDC6D9DB6F59FA2CF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1474550067-142107-1-git-send-email-vadimp@mellanox.com>
 <20160922123038.GA2630@kroah.com>
 <AM5PR0501MB20971F191335B0BB88243DF3A2C90@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160922134312.GA30274@kroah.com>
 <AM5PR0501MB2097867B8A822E1026D33CB1A2C90@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160922135312.GA13047@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0075.outbound.protection.outlook.com ([104.47.2.75]:43008
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753182AbcI1Msm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2016 08:48:42 -0400
In-Reply-To: <20160922135312.GA13047@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday, September 22, 2016 4:53 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: dvhart@infradead.org; davem@davemloft.net; geert@linux-m68k.org;
> akpm@linux-foundation.org; kvalo@codeaurora.org; mchehab@kernel.org;
> linux@roeck-us.net; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [patch v1] drivers/platform/x86: introduce support for Mella=
nox
> hotplug driver
>=20
> On Thu, Sep 22, 2016 at 01:50:28PM +0000, Vadim Pasternak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > Sent: Thursday, September 22, 2016 4:43 PM
> > > To: Vadim Pasternak <vadimp@mellanox.com>
> > > Cc: dvhart@infradead.org; davem@davemloft.net; geert@linux-m68k.org;
> > > akpm@linux-foundation.org; kvalo@codeaurora.org; mchehab@kernel.org;
> > > linux@roeck-us.net; linux-kernel@vger.kernel.org; platform-driver-
> > > x86@vger.kernel.org; jiri@resnulli.us
> > > Subject: Re: [patch v1] drivers/platform/x86: introduce support for
> > > Mellanox hotplug driver
> > >
> > > On Thu, Sep 22, 2016 at 01:01:46PM +0000, Vadim Pasternak wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > > Sent: Thursday, September 22, 2016 3:31 PM
> > > > > To: Vadim Pasternak <vadimp@mellanox.com>
> > > > > Cc: dvhart@infradead.org; davem@davemloft.net;
> > > > > geert@linux-m68k.org; akpm@linux-foundation.org;
> > > > > kvalo@codeaurora.org; mchehab@kernel.org; linux@roeck-us.net;
> > > > > linux-kernel@vger.kernel.org; platform-driver-
> > > > > x86@vger.kernel.org; jiri@resnulli.us
> > > > > Subject: Re: [patch v1] drivers/platform/x86: introduce support
> > > > > for Mellanox hotplug driver
> > > > >
> > > > > On Thu, Sep 22, 2016 at 01:14:27PM +0000, vadimp@mellanox.com
> wrote:
> > > > > > From: Vadim Pasternak <vadimp@mellanox.com>
> > > > > >
> > > > > > Enable system support for the Mellanox Technologies hotplug
> > > > > > platform driver, which provides support for the next Mellanox
> > > > > > basic
> > > systems:
> > > > > > "msx6710", "msx6720", "msb7700", "msn2700", "msx1410",
> > > > > > "msn2410", "msb7800", "msn2740", "msn2100" and also various
> > > > > > number of derivative systems from the above basic types.
> > > > > > This driver handles hot-plug events for the power suppliers,
> > > > > > power cables and fans for the above systems.
> > > > > >
> > > > > > The Kconfig currently controlling compilation of this code is:
> > > > > > driver/platform/x86:config MLX_CPLD_PLATFORM
> > > > > >                        tristate "Mellanox platform hotplug driv=
er support"
> > > > > >
> > > > > > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > > > > > ---
> > > > > >  MAINTAINERS                                   |   7 +
> > > > > >  drivers/platform/x86/Kconfig                  |  10 +
> > > > > >  drivers/platform/x86/Makefile                 |   1 +
> > > > > >  drivers/platform/x86/mlxcpld-hotplug.c        | 543
> > > > > ++++++++++++++++++++++++++
> > > > > >  include/linux/platform_data/mlxcpld-hotplug.h |  90 +++++
> > > > >
> > > > > Why do you need a platform_data .h file for a stand-alone driver?
> > > > >
> > > >
> > > > I have another module mlx-platform, which is reviewed now (I also
> > > > got a number feedbacks from you on this matter).  I want to
> > > > activate mlxcpld-hotplug from this module.
> > >
> > > Ah.  Hm, I thought "platform_data" was depreciated.  Really, there
> > > is no way to put this in acpi or device tree?  This feels so 1990's..=
.
> > >
> >
> > I can't put in ACPI, since we don't have it.
> > Regarding device tree - I know how to do it for ARM and PPC, but I didn=
't find
> some good examples for x86.
> > Maybe you can give me some reference for that?
>=20
> I have no idea, sorry :(

Hi,

I'd like to kindly clarify whether the patch I sent could be applied, or I =
need to modify something?

Best regards,
Vadim.
