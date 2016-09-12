From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 12 Sep 2016 07:23:59 +0000
Message-ID: <AM5PR0501MB2097F6324F291676415B3513A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1473661798-112691-1-git-send-email-vadimp@mellanox.com>
 <20160912061237.GB11230@kroah.com>
 <AM5PR0501MB2097F4FF64CD69BD634B8CCEA2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912070457.GA4590@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0067.outbound.protection.outlook.com ([104.47.2.67]:61762
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753142AbcILH5M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2016 03:57:12 -0400
In-Reply-To: <20160912070457.GA4590@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Monday, September 12, 2016 10:05 AM
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
> On Mon, Sep 12, 2016 at 06:44:03AM +0000, Vadim Pasternak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > Sent: Monday, September 12, 2016 9:13 AM
> > > To: Vadim Pasternak <vadimp@mellanox.com>
> > > Cc: tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com;
> > > davem@davemloft.net; geert@linux-m68k.org;
> > > akpm@linux-foundation.org; kvalo@codeaurora.org; mchehab@kernel.org;
> > > linux@roeck-us.net; x86@kernel.org; linux-kernel@vger.kernel.org;
> > > platform-driver- x86@vger.kernel.org; jiri@resnulli.us
> > > Subject: Re: [patch v1] x86/platform/mellanox: introduce support for
> > > Mellanox systems platform
> > >
> > > On Mon, Sep 12, 2016 at 06:29:58AM +0000, vadimp@mellanox.com wrote:
> > > > From: Vadim Pasternak <vadimp@mellanox.com>
> > > >
> > > > Enable system support for the Mellanox Technologies platform,
> > > > which provides support for the next Mellanox basic systems:
> > > > "msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> > > > "msb7800", "msn2740", "msn2100" and also various number of
> > > > derivative systems from the above basic types.
> > >
> > > What does "system support" mean?
> > >
> > > Why can't this just be a "normal" PCI driver, as you are just
> > > accessing a PCI device and doing something with it, seems odd to clai=
m it is a
> "platform" driver.
> > >
> >
> > This driver also activates probes to create i2c platform driver and mux=
es.
>=20
> And how does it do that?  Through the PCI device?
>=20
> > For ARM and PPC based systems I can activate such stuff through dts.
> > To be honest I don't know what is the right way to do such things for
> > x86 systems.
>=20
> How is it found in a x86 system, in ACPI?
>=20

We have no support in ACPI.
Currently it could be found through DMI.

> > If I will move PCI related stuff to separate driver, could you suggest
> > some right location for that?
>=20
> Depends on what it does.

It creates platform i2c driver (Mellanox controller), like:
platform_device_register_simple("i2c_mlxcpld", -1,
                                                         NULL, 0);
And two mux platform device instances, like:
platform_device_register_resndata(dev,
                                                " i2c-mux-reg", i, NULL,
                                                0, &mlxplat_mux_data[i],
                                                sizeof(mlxplat_mux_data[i])=
);

>=20
> > For example, could I have the code like in f.e. in
> > arch/x86/platform/ts5500/ts5500.c as a platform initialization code?
>=20
> How does it talk to the hardware for this?
>=20
It defines several platform devices, like:
static struct platform_device ts5500_dio1_pdev =3D {
        .name =3D "ts5500-dio1",
        .id =3D -1,
        .resource =3D ts5500_dio1_resource,
        .num_resources =3D 1,
};
And registers them in __init, like:
platform_device_register(&ts5500_dio1_pdev)


> thanks,
>=20
> greg k-h

Thanks,
Vadim.
