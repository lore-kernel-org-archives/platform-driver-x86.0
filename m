From: Yin Kangkai <kangkai.yin@linux.intel.com>
Subject: Re: [PATCH V2] platform-driver-x86: ACPI EC Extra driver for
 Oaktrail
Date: Mon, 10 Jan 2011 14:57:10 +0800
Message-ID: <20110110065710.GI30215@kai-debian>
References: <20110106025949.GJ9496@kai-debian>
 <20110107074115.GH30215@kai-debian>
 <AANLkTik=x-OTWGzRB2BgB1u748EDM=B3nsGpWbR8D-C5@mail.gmail.com>
 <20110107112409.GU9496@kai-debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:35248 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751292Ab1AJG5d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Jan 2011 01:57:33 -0500
Content-Disposition: inline
In-Reply-To: <20110107112409.GU9496@kai-debian>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, "Wang, Yong Y" <yong.y.wang@intel.com>, "Liu, Bing Wei" <bing.wei.liu@intel.com>, Matthew Garrett <mjg@redhat.com>

On 2011-01-07, 19:24 +0800, Yin Kangkai wrote:
> On 2011-01-07, 09:56 +0100, Corentin Chary wrote:
> > > +static struct rfkill *oaktrail_rfkill_new(char *name, enum rfkil=
l_type type,
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 unsigned long mask)
> > > +{
> > > + =A0 =A0 =A0 int err;
> > > + =A0 =A0 =A0 struct rfkill *rfkill_dev;
> > > +
> > > + =A0 =A0 =A0 rfkill_dev =3D rfkill_alloc(name, &oaktrail_device-=
>dev, type,
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 &oaktrail_rfkill_ops, (void *)mask);
> > > + =A0 =A0 =A0 if (!rfkill_dev)
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-ENOMEM);
> > > +
> > > + =A0 =A0 =A0 err =3D rfkill_register(rfkill_dev);
> >=20
> > Maybe you should add a rfkill_init_sw_state() call here, to be sure
> > that the rfkill initial state is right.
>=20
> Yes, agree with you, and I'm trying to do that, add a
> rfkill_init_sw_state between rfkill_alloc() and rfkill_register()...
>=20
> +       ec_read(OT_EC_DEVICE_STATE_ADDRESS, &value);
> +       rfkill_init_sw_state(rfkill_dev, (value & mask) !=3D 1);
>=20
>=20
> However, test shows the EC seems not ready yet when booting runs here
> (value =3D 0), and then all the radio set as "blocked". Hence the rad=
io
> state can't be persistent during reboot.. This is not we want.
>=20
> Also tried to read out the EC address a little bit later, seems the E=
C
> won't be ready until very late.
>=20
> Am I doing something wrong? or I need to check with HW guy about this=
=2E

It turns out that is because of a bug in driver itself and the way I'm
doing "rebooting" is wrong..

Yes, the rfkill_init_sw_state() is needed, otherwise,
rfkill_register() will wrongly set the rfkill status.

Am sending the V3 patch right away.

Kangkai
