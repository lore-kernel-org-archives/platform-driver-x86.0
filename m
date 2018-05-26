From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v2 3/7] platform/mellanox: mlxreg-hotplug: add extra cycle
 for hotplug work queue
Date: Sat, 26 May 2018 11:11:24 +0000
Message-ID: <HE1PR0502MB375373810FB25EE95704FD1CA2680@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <1525675735-125547-1-git-send-email-vadimp@mellanox.com>
 <20180524235214.GA10172@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180524235214.GA10172@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>, "ivecera@redhat.com" <ivecera@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, May 25, 2018 2:52 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us;
> Michael Shych <michaelsh@mellanox.com>; ivecera@redhat.com
> Subject: Re: [PATCH v2 3/7] platform/mellanox: mlxreg-hotplug: add extra =
cycle
> for hotplug work queue
>=20
> On Mon, May 07, 2018 at 06:48:51AM +0000, Vadim Pasternak wrote:
>=20
> Hi Vadim,
>=20
> > Add extra cycle for hotplug work queue to handle the case when a
> > signal is It adds missed logic for signal acknowledge, by adding an
> > extra run for received, but no specific signal assertion is detected.
> > Such case theoretically can happen for example in case several units
> > are removed or inserted at the same time. In this situation
> > acknowledge for some signal can be missed at signal top aggreagation
> > status level. The extra run will allow to handler to acknowledge the mi=
ssed
> signal.
> >
>=20
> ...
>=20
> >
> > Fixes: 07b89c2b2a5e ("platform/x86: Introduce support for Mellanox
> > hotplug driver")
>=20
> This sha doesn't exist in mainline, I believe you are referring to:
>=20
> $ git l | grep "Introduce support for Mellanox hotplug"
> 304887041d95 platform/x86: Introduce support for Mellanox hotplug driver
>=20
> While this was introduced in 4.10. There have been many changes since the=
n,
> with significant changes in the 4.17 cycle. I have not added the stable t=
ag, please
> let me know if you think this should be pushed to stable, and which of th=
e
> intervening patches you'd consider dependencies.

Hi Darren,

Thank you for review.

I think it's worth pushing to stable.
It doesn't depend one previous patches from the patchset, but possibly
this one, which just fixes few comments in mlxreg-hotplug:
platform/mellanox: mlxreg-hotplug: Document fixes for hotplug private data
(commit 321089a4da2f6b20bb8af96354f76d260a4ca2c6 in testing branch).

Thanks,
Vadim.

>=20
> I've fixed the sha in the commit message, and queued for testing.
>=20
> Thanks,
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
