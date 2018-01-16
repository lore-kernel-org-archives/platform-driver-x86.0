From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v8 0/3] drivers/platform: replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Tue, 16 Jan 2018 08:08:41 +0000
Message-ID: <AM4PR05MB33300E8711CC0EE6E0ABBD5FA2EA0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <20180116034209.GA4590@fury> <20180116034511.GE4590@fury>
 <20180116034947.GG4590@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve1eur01on0084.outbound.protection.outlook.com ([104.47.1.84]:9392
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750765AbeAPIIp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Jan 2018 03:08:45 -0500
In-Reply-To: <20180116034947.GG4590@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Tuesday, January 16, 2018 5:50 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [patch v8 0/3] drivers/platform: replace module x86/mlxcpld-
> hotplug with mellanox/mlxreg-hotplug
>=20
> On Mon, Jan 15, 2018 at 07:45:11PM -0800, Darren Hart wrote:
> > On Mon, Jan 15, 2018 at 07:42:09PM -0800, Darren Hart wrote:
> > > To follow this email, are two patches which are minor incremental
> > > cleanups, which I'd appreciate your review of before I push them to
> > > testing.
> >
> >
> > From 2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab Mon Sep 17 00:00:00
> 2001
> > Message-Id:
> >
> <2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab.1516073719.git.dvhart@infra
> d
> > ead.org>
> > From: "Darren Hart (VMware)" <dvhart@infradead.org>
> > Date: Mon, 15 Jan 2018 19:16:36 -0800
> > Subject: [PATCH 1/2] platform/mellanox: mlxreg-hotplug: Simplify exit
> > path
> >
> > Several functions use a "goto access_error" pattern result in a
> > duplicated exit path at the end of the function. Address this by using
> > a single exit path, and checking for (ret) prior to printing the error
> > message. This adds a conditional, but only in the failure case, and
> > simplifies the exit path.
> >
> > Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> > Cc: Vadim Pasternak <vadimp@mellanox.com>

Acked-by: Vadim Pasternak <vadimp@mellanox.com>

> > ---
> >  drivers/platform/mellanox/mlxreg-hotplug.c | 62
> > ++++++++++++------------------
> >  1 file changed, 25 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c
> > b/drivers/platform/mellanox/mlxreg-hotplug.c
> > index 9bbaa8c..78056f7 100644
> > --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> > +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> ...
> > @@ -267,18 +267,15 @@ mlxreg_hotplug_work_helper(struct
> mlxreg_hotplug_priv_data *priv,
> >  	ret =3D regmap_write(priv->regmap, item->reg +
> MLXREG_HOTPLUG_EVENT_OFF,
> >  			   0);
> >  	if (ret)
> > -		goto access_error;
> > +		goto out:
>=20
> Apologies:	goto out;
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
