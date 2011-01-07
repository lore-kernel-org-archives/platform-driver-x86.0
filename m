From: Yin Kangkai <kangkai.yin@intel.com>
Subject: Re: [PATCH V2] platform-driver-x86: ACPI EC Extra driver for
 Oaktrail
Date: Fri, 7 Jan 2011 19:24:09 +0800
Message-ID: <20110107112409.GU9496@kai-debian>
References: <20110106025949.GJ9496@kai-debian>
 <20110107074115.GH30215@kai-debian>
 <AANLkTik=x-OTWGzRB2BgB1u748EDM=B3nsGpWbR8D-C5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:24634 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751686Ab1AGLYM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Jan 2011 06:24:12 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTik=x-OTWGzRB2BgB1u748EDM=B3nsGpWbR8D-C5@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, "Wang, Yong Y" <yong.y.wang@intel.com>, "Liu, Bing Wei" <bing.wei.liu@intel.com>, Matthew Garrett <mjg@redhat.com>

On 2011-01-07, 09:56 +0100, Corentin Chary wrote:
> > +static struct rfkill *oaktrail_rfkill_new(char *name, enum rfkill_=
type type,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 unsigned long mask)
> > +{
> > + =A0 =A0 =A0 int err;
> > + =A0 =A0 =A0 struct rfkill *rfkill_dev;
> > +
> > + =A0 =A0 =A0 rfkill_dev =3D rfkill_alloc(name, &oaktrail_device->d=
ev, type,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &=
oaktrail_rfkill_ops, (void *)mask);
> > + =A0 =A0 =A0 if (!rfkill_dev)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-ENOMEM);
> > +
> > + =A0 =A0 =A0 err =3D rfkill_register(rfkill_dev);
>=20
> Maybe you should add a rfkill_init_sw_state() call here, to be sure
> that the rfkill initial state is right.

Yes, agree with you, and I'm trying to do that, add a
rfkill_init_sw_state between rfkill_alloc() and rfkill_register()...

+       ec_read(OT_EC_DEVICE_STATE_ADDRESS, &value);
+       rfkill_init_sw_state(rfkill_dev, (value & mask) !=3D 1);


However, test shows the EC seems not ready yet when booting runs here
(value =3D 0), and then all the radio set as "blocked". Hence the radio
state can't be persistent during reboot.. This is not we want.

Also tried to read out the EC address a little bit later, seems the EC
won't be ready until very late.

Am I doing something wrong? or I need to check with HW guy about this.


> > + =A0 =A0 =A0 if (err) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rfkill_destroy(rfkill_dev);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(err);
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 return rfkill_dev;
> > +}
> > +
