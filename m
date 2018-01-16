From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v8 1/3] platform/x86: move Mellanox hardware platform
 hotplug driver to platform/mellanox
Date: Tue, 16 Jan 2018 08:06:18 +0000
Message-ID: <AM4PR05MB33305B31938957C720A3842DA2EA0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <1515661123-76604-2-git-send-email-vadimp@mellanox.com>
 <20180116034243.GB4590@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-eopbgr60083.outbound.protection.outlook.com ([40.107.6.83]:39613
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750750AbeAPIGV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Jan 2018 03:06:21 -0500
In-Reply-To: <20180116034243.GB4590@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Tuesday, January 16, 2018 5:43 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [patch v8 1/3] platform/x86: move Mellanox hardware platform
> hotplug driver to platform/mellanox
>=20
> On Thu, Jan 11, 2018 at 08:58:41AM +0000, Vadim Pasternak wrote:
> > It moves drivers/platform/x86/mlxcpld-hotplug.c to
> > drivers/platform/mellanox/mlxreg-hotplug.c and
> > include/linux/platform_data/mlxcpld-hotplug.h to
> > include/linux/platform_data/mlxreg.h for making hotplug driver usable
> > for the different machine architectures.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > ---
> > v7->v8:
> > v6->v7:
> >  Fixes added by Vadim:
> >  - remove dependency on X86_64 to allow also X86 architecture;
> > v5->v6:
> >  Fixes added by Vadim:
> >  - add SPD license record to Kconfig and Makefile;
> > v4->v5:
> >  Comments pointed out by Andy:
> >  - arrange MAINTAINERS in correct alphabetic order;
> > v3->v4:
> >  Comments pointed out by Darren:
> >  - Refactor the patches to provide the changes in patchset in increment=
al
> >    order;
> >  - Modify MAINTAINERS records;
> >  - Use git-mv for the replaced files;
> >   Commnets pointed out by Colin:
> >  - Make structures mlxplat_dev and mlxplat_hotplug static;
> > ---
>=20
> ...
>=20
> >  config MLX_PLATFORM
> >  	tristate "Mellanox Technologies platform support"
> > -	depends on X86_64
>=20
> This seems like it would be more appropriately applied to 2/3 as this pat=
ch is
> supposed to be just about the renaming of the files, methods, and defines=
 from
> CPLD to reg, and the creation of the mellanox platform.
>=20
> Any reason this needs to be in this patch?
>=20

Hi Darren,
Thank you very much for reviews.

I removed X86_64 dependency in this patch to allow the driver also for
32 bit architecture.

> --
> Darren Hart
> VMware Open Source Technology Center
