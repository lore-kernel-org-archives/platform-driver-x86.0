From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v11 - re-ordered 03/12] FIXME platform/mellanox: Remove
 redundant dev_err messages on device_create
Date: Sat, 27 Jan 2018 05:08:13 +0000
Message-ID: <AM4PR05MB33306423267272590EEFC86BA2E70@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1516826019-124903-1-git-send-email-vadimp@mellanox.com>
 <20180125214643.GB24122@fury>
 <AM4PR05MB33307B7EE13E93C681171C94A2E00@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20180126234117.GB3736@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180126234117.GB3736@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Saturday, January 27, 2018 1:41 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [patch v11 - re-ordered 03/12] FIXME platform/mellanox: Remo=
ve
> redundant dev_err messages on device_create
>=20
> On Fri, Jan 26, 2018 at 04:59:32PM +0000, Vadim Pasternak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Darren Hart [mailto:dvhart@infradead.org]
> > > Sent: Thursday, January 25, 2018 11:47 PM
> > > To: Vadim Pasternak <vadimp@mellanox.com>
> > > Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> > > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> > > jiri@resnulli.us
> > > Subject: Re: [patch v11 - re-ordered 03/12] FIXME platform/mellanox:
> > > Remove redundant dev_err messages on device_create
> > >
> > > On Wed, Jan 24, 2018 at 08:33:37PM +0000, Vadim Pasternak wrote:
> > > > The upper layer will manage and report errors returned by the
> > > > create and destroy functions.
> > > >
> > > > FIXME: but it doesn't - we don't even check
> > >
> > > I think we agreed to just drop this patch entirely, since this error
> > > is not checked elsewhere? Keeping the dev_err messages?
> > >
> >
> > Yes, we'll keep it.
> > We just had conflict in patch order and I wanted to fix it, staying as
> > much as possible aligned with the top of mellanox v10 branch.
> >
> > However currently we still  have a problem in mellanox v11 after patch
> > platform/mellanox: mlxreg-hotplug: Modify to use a regmap interface It
> > dropped parameter device  in mlxreg_hotplug_device_create, which is
> > Used inside the routine.
> >
> > I'll send a separate patch to fix it from top of v11. In other case
> > it'll be necessary to fix Modify to use a regmap interface  and
> > re-send all from 5-th patch in series.
> >
> > Also we  should drop the patch:
> > platform/x86: mlx-platform: Simplify IO access to regmap context It
> > introduced the issue reported by sparse.
> >
> > I am resending two last patches from review-dvhart-mellanox-v11 branch
> > and also patch with fix for mlxreg_hotplug_device_create, as:
> > 0010-platform-x86-mlx-platform-Extend-register-map-config.patch
> > 0011-platform-mellanox-mlxreg-hotplug-Add-check-for-negat.patch
> > 0012-platform-mellanox-mlxreg-hotplug-Fix-issue-of-commit.patch
> >
> > Thank you very much for your help,
>=20
> OK, please see review-dvhart-mellanox-v12 on infradead or github. I've ve=
rified
> this passes a clean C=3D1 (sparse) build at each patch. I believe this is=
 in a state
> that can be moved to testing. Please confirm.
>=20

Confirmed.

> If you still want to move the dev_err messages out of the create function=
, we
> can do that separately. Let's get this merged so we can move forward.
>=20

It's OK with me. Let's leave it as it is now.

Thank you,
Vadim.

> --
> Darren Hart
> VMware Open Source Technology Center
