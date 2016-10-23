From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v3] drivers/platform/x86: introduce support for Mellanox
 hotplug driver
Date: Sun, 23 Oct 2016 06:14:53 +0000
Message-ID: <AM5PR0501MB2097FAB9ED7C7B465A24CD64A2D60@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1476980881-62938-1-git-send-email-vadimp@mellanox.com>
 <20161021184208.GB91380@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0058.outbound.protection.outlook.com ([104.47.2.58]:64336
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752651AbcJWJql (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Oct 2016 05:46:41 -0400
In-Reply-To: <20161021184208.GB91380@f23x64.localdomain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, October 21, 2016 9:42 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: davem@davemloft.net; geert@linux-m68k.org; akpm@linux-
> foundation.org; kvalo@codeaurora.org; gregkh@linuxfoundation.org;
> mchehab@kernel.org; linux@roeck-us.net; linux-kernel@vger.kernel.org;
> platform-driver-x86@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [patch v3] drivers/platform/x86: introduce support for Mella=
nox
> hotplug driver
>=20
> On Thu, Oct 20, 2016 at 04:28:01PM +0000, vadimp@mellanox.com wrote:
> > From: Vadim Pasternak <vadimp@mellanox.com>
> >
> > Enable system support for the Mellanox Technologies hotplug platform
> > driver, which provides support for the next Mellanox basic systems:
> > "msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> > "msb7800", "msn2740", "msn2100" and also various number of derivative
> > systems from the above basic types.
> > This driver handles hot-plug events for the power suppliers, power
> > cables and fans for the above systems.
> >
> > The Kconfig currently controlling compilation of this code is:
> > driver/platform/x86:config MLX_CPLD_PLATFORM
> >                        tristate "Mellanox platform hotplug driver suppo=
rt"
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> > v1->v2:
> >  Comments pointed out by Darren:
> >  - remove whitespaces in config;
> >  - remove redundant includes for header files;
> >  - fix comments styling;
> >  - fix register value assignment in mlxcpld_hotplug_attr_show;
> >  - mlxcpld_hotplug_attr_init - use local aliases to reduce line
> > length;
> >  - Add fields description in the struct mlxcpld_hotplug_device;
> > v2->v3:
> >  Comments pointed out by Darren:
> >   - Fix structures and enum comments in mlxcpld-hotplug.c according to
> >     Documentation/kernel-documentation.rst guideline;
> >   - Assign and mask aggregation status in mlxcpld_hotplug_work_handler =
on
> >     the same line.
> >   - Refactor mlxcpld_hotplug_work_handler. Make common helper routine f=
or
> >     each attribute type.
> >   - Produce error message in case signal is not expected.
> >   - Fix header file according to Documentation/kernel-documentation.rst
> >     guideline;
>=20
> >  Fix added by Vadim:
> > 	Fix re-scheduling flow for possibly missed signals. By mistake it
> > 	was coupled with FAN.
>=20
> Thanks Vadim. Merged to for-next for 4.10.
>=20
> Also for 4.10, it would be good to move mlx-platform out of arch/x86/plat=
form
> to
> drivers/platform/x86 as it isn't an architectural driver. Would you be ab=
le to
> prepare the patch?

Hi Darren,

Thank you very much for all your reviews.

Sure, I'll prepare the patch.

Should it be submitted in two different patches (remove in git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip.git; and add in
git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git)?
Or in one patch, in  git://git.infradead.org/users/dvhart/linux-platform-dr=
ivers-x86.git?

Thanks,
Vadim.

>=20
> Thanks,
>=20
> --
> Darren Hart
> Intel Open Source Technology Center
