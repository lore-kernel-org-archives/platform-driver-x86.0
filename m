From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] drivers/platform/x86: select hwmon for Mellanox
 hotplug driver in Kconfig
Date: Mon, 24 Oct 2016 05:33:30 +0000
Message-ID: <AM5PR0501MB209742F84A0724DA79D8DE33A2A90@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
 <20161023145153.GC120221@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0061.outbound.protection.outlook.com ([104.47.2.61]:23534
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750818AbcJXFdd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2016 01:33:33 -0400
In-Reply-To: <20161023145153.GC120221@f23x64.localdomain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "fengguang.wu@intel.com" <fengguang.wu@intel.com>, "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Sunday, October 23, 2016 5:52 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: fengguang.wu@intel.com; davem@davemloft.net; geert@linux-m68k.org;
> akpm@linux-foundation.org; kvalo@codeaurora.org;
> gregkh@linuxfoundation.org; mchehab@kernel.org; linux@roeck-us.net; linux=
-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us;
> andriy.shevchenko@linux.intel.com
> Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
> hotplug driver in Kconfig
>=20
> On Sun, Oct 23, 2016 at 12:45:27PM +0000, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
> > Add select HWMON for mlxcpld-hotplug driver config, since it requires
> > hwmon APIs.
>=20
> Is this in response to the 0-day Error report?

Yes.
>=20
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> >  drivers/platform/x86/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/platform/x86/Kconfig
> > b/drivers/platform/x86/Kconfig index 65d9b04..1853769 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1032,6 +1032,7 @@ config MLX_CPLD_PLATFORM
> >  	tristate "Mellanox platform hotplug driver support"
> >  	default n
> >  	depends on MLX_PLATFORM
> > +	select HWMON
> >  	select I2C
> >  	---help---
> >  	  This driver handles hot-plug events for the power suppliers, power
> > --
> > 2.1.4
> >
> >
>=20
> --
> Darren Hart
> Intel Open Source Technology Center
