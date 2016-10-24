From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] drivers/platform/x86: select hwmon for Mellanox
 hotplug driver in Kconfig
Date: Mon, 24 Oct 2016 05:41:17 +0000
Message-ID: <AM5PR0501MB20976E48C946BD3DB3A79143A2A90@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
 <a20039d5-6456-7450-f83c-572c5ce4fb8f@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve1eur01on0074.outbound.protection.outlook.com ([104.47.1.74]:31376
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S941433AbcJXRSC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2016 13:18:02 -0400
In-Reply-To: <a20039d5-6456-7450-f83c-572c5ce4fb8f@infradead.org>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "fengguang.wu@intel.com" <fengguang.wu@intel.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>



> -----Original Message-----
> From: Randy Dunlap [mailto:rdunlap@infradead.org]
> Sent: Sunday, October 23, 2016 7:57 PM
> To: Vadim Pasternak <vadimp@mellanox.com>; dvhart@infradead.org;
> fengguang.wu@intel.com
> Cc: davem@davemloft.net; geert@linux-m68k.org; akpm@linux-
> foundation.org; kvalo@codeaurora.org; gregkh@linuxfoundation.org;
> mchehab@kernel.org; linux@roeck-us.net; linux-kernel@vger.kernel.org;
> platform-driver-x86@vger.kernel.org; jiri@resnulli.us;
> andriy.shevchenko@linux.intel.com
> Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
> hotplug driver in Kconfig
>=20
> On 10/23/16 05:45, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
> > Add select HWMON for mlxcpld-hotplug driver config, since it requires
> > hwmon APIs.
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
> >
>=20
> Hi,
> did you test this?  I would expect it to cause a kconfig warning, somethi=
ng about
> HWMON having a dependency on HAS_IOMEM.

Hi Randy,

Yes,=20
I built tree with this fix with the attached .config file.
Didn't see kconfig warnings.
I can have a look again.

Thanks,
Vadim.

>=20
> thanks.
> --
> ~Randy
