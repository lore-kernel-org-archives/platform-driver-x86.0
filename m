From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 12 Sep 2016 06:44:03 +0000
Message-ID: <AM5PR0501MB2097F4FF64CD69BD634B8CCEA2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1473661798-112691-1-git-send-email-vadimp@mellanox.com>
 <20160912061237.GB11230@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-he1eur01on0070.outbound.protection.outlook.com ([104.47.0.70]:36787
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750896AbcILIP6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2016 04:15:58 -0400
In-Reply-To: <20160912061237.GB11230@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Monday, September 12, 2016 9:13 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com;
> davem@davemloft.net; geert@linux-m68k.org; akpm@linux-foundation.org;
> kvalo@codeaurora.org; mchehab@kernel.org; linux@roeck-us.net;
> x86@kernel.org; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mell=
anox
> systems platform
>=20
> On Mon, Sep 12, 2016 at 06:29:58AM +0000, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
> > Enable system support for the Mellanox Technologies platform, which
> > provides support for the next Mellanox basic systems: "msx6710",
> > "msx6720", "msb7700", "msn2700", "msx1410", "msn2410", "msb7800",
> > "msn2740", "msn2100" and also various number of derivative systems
> > from the above basic types.
>=20
> What does "system support" mean?
>=20
> Why can't this just be a "normal" PCI driver, as you are just accessing a=
 PCI
> device and doing something with it, seems odd to claim it is a "platform"=
 driver.
>=20

This driver also activates probes to create i2c platform driver and muxes.
For ARM and PPC based systems I can activate such stuff through dts. To be =
honest I don't know what is the right way to do such things for x86 systems=
.
If I will move PCI related stuff to separate driver, could you suggest some=
 right location for that?

For example, could I have the code like in f.e. in arch/x86/platform/ts5500=
/ts5500.c as a platform initialization code?=20

Thanks,
Vadim.

> thanks,
>=20
> greg k-h
