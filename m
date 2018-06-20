From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v6 6/8] platform/mellanox: Introduce support for Mellanox
 register access driver
Date: Wed, 20 Jun 2018 04:30:09 +0000
Message-ID: <HE1PR0502MB37530DD5B696E1AC256E2632A2770@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <1529254615-88124-1-git-send-email-vadimp@mellanox.com>
 <b804ccc4-77c3-e7a9-9486-8d12d50ec5f7@infradead.org>
 <20180620002025.GC11460@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620002025.GC11460@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>, "ivecera@redhat.com" <ivecera@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, June 20, 2018 3:20 AM
> To: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vadim Pasternak <vadimp@mellanox.com>; andy.shevchenko@gmail.com;
> gregkh@linuxfoundation.org; linux-kernel@vger.kernel.org; platform-driver=
-
> x86@vger.kernel.org; jiri@resnulli.us; Michael Shych
> <michaelsh@mellanox.com>; ivecera@redhat.com
> Subject: Re: [PATCH v6 6/8] platform/mellanox: Introduce support for Mell=
anox
> register access driver
>=20
> On Sun, Jun 17, 2018 at 09:52:16AM -0700, Randy Dunlap wrote:
> > On 06/17/2018 09:56 AM, Vadim Pasternak wrote:
> > > diff --git a/drivers/platform/mellanox/Kconfig
> > > b/drivers/platform/mellanox/Kconfig
> ...
> > > +	  space trough sysfs interface. The sets of registers for sysfs
> > > +access
> >
> > 	        through
> >
> > > +	  are defined per system type bases and includes the registers
> > > +related
> >
> > 	                                    and include the
> >
>=20
> I've taken care of these, thanks Randy, and applied the series to my test=
ing
> queue. Once the builds complete, I'll move these to for-next.
>=20
> Vadim, I see you've already updated the kernel version in the sys documen=
tation
> to 4.19, so I won't attempt to push these into the 4.18 RC cycle.
>=20

Hi Daren,

Thank you very much.
Yes, it's good to push into 4.19.

Thanks,
Vadim.

> --
> Darren Hart
> VMware Open Source Technology Center
