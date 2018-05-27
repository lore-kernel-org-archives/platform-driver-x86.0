From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v3 6/7] platform/mellanox: Introduce support for Mellanox
 register access driver
Date: Sun, 27 May 2018 15:22:06 +0000
Message-ID: <HE1PR0502MB375324E5F279A2733339365FA26F0@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <1527439664-127317-1-git-send-email-vadimp@mellanox.com>
 <20180527151347.GA15487@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180527151347.GA15487@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>, "ivecera@redhat.com" <ivecera@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Sunday, May 27, 2018 6:14 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us;
> Michael Shych <michaelsh@mellanox.com>; ivecera@redhat.com
> Subject: Re: [PATCH v3 6/7] platform/mellanox: Introduce support for Mell=
anox
> register access driver
>=20
> On Sun, May 27, 2018 at 04:47:43PM +0000, Vadim Pasternak wrote:
> > Introduce new Mellanox platform driver to allow access to Mellanox
> > programmable device register space trough sysfs interface.
> > The driver purpose is to provide sysfs interface for user space for
> > the registers essential for system control and monitoring.
> > The sets of registers for sysfs access are supposed to be defined per
> > system type bases and include the registers related to system resets
> > operation, system reset causes monitoring and some kinds of mux selecti=
on.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> > v1->v2:
> >  Changed added by Vadim:
> >  - Change ---help--- to help in Kconfig, according to new
> > requirements;
> > v2->v3:
> >  Comments pointed out by Darren:
> >  - Remove conditional assignment per attribute mode type, because mode
> >    will guard against not permitted access.
> >    Verified by Vadim.
> > ---
> >  drivers/platform/mellanox/Kconfig     |  11 ++
> >  drivers/platform/mellanox/Makefile    |   1 +
> >  drivers/platform/mellanox/mlxreg-io.c | 203
> > ++++++++++++++++++++++++++++++++++
> >  3 files changed, 215 insertions(+)
> >  create mode 100644 drivers/platform/mellanox/mlxreg-io.c
> >
> > diff --git a/drivers/platform/mellanox/Kconfig
> > b/drivers/platform/mellanox/Kconfig
> > index 591bccd..ddfae9fc 100644
> > --- a/drivers/platform/mellanox/Kconfig
> > +++ b/drivers/platform/mellanox/Kconfig
> > @@ -23,4 +23,15 @@ config MLXREG_HOTPLUG
> >  	  This driver handles hot-plug events for the power suppliers, power
> >  	  cables and fans on the wide range Mellanox IB and Ethernet systems.
> >
> > +config MLXREG_IO
> > +	tristate "Mellanox platform register access driver support"
> > +	depends on REGMAP
> > +	depends on HWMON
> > +	help
> > +	  This driver allows access to Mellanox programmable device register
> > +	  space trough sysfs interface. The sets of registers for sysfs acces=
s
> > +	  are defined per system type bases and includes the registers relate=
d
> > +	  to system resets operation, system reset causes monitoring and some
> > +	  kinds of mux selection.
>=20
> No Documentation/ABI/ entries for these new sysfs files?  Not good :(
>=20

Thanks Greg for your comment.

Should I call doc file like:
Documentation/ABI/stable/sysfs-driver-mlxreg-io
?

> greg k-h
