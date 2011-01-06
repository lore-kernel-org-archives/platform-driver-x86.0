From: Yin Kangkai <kangkai.yin@linux.intel.com>
Subject: Re: [PATCH] platform-driver-x86: ACPI EC Extra driver for Oaktrail
Date: Thu, 6 Jan 2011 18:11:06 +0800
Message-ID: <20110106101106.GE30215@kai-debian>
References: <20110106025949.GJ9496@kai-debian>
 <AANLkTi=B1XeBTogjVPWqOSFgJMD72gTpNZgg4znAR0t3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:55938 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752469Ab1AFKLJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Jan 2011 05:11:09 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTi=B1XeBTogjVPWqOSFgJMD72gTpNZgg4znAR0t3@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Wang, Yong Y" <yong.y.wang@intel.com>, "Liu, Bing Wei" <bing.wei.liu@intel.com>

On 2011-01-06, 08:29 +0100, Corentin Chary wrote:
> Hi,

Thanks for the review and comments.

> > @@ -0,0 +1,349 @@
> > +/*-*-linux-c-*-*/
>=20
> I don't know what's our general policy about that, but I don't think
> each text editor should be allowed to add its own header on each
> files. Most of the time you can configure your editor to set the
> right indent style based on the path of the file or something like th=
at.

Yes, I agree with you, will remove that.

> > + * gps - GPS subsystem enabled: contains either 0 or 1. (rw)
> > + * wifi - WiFi subsystem enabled: contains either 0 or 1. (rw)
> > + * wwan - WWAN (3G) subsystem enabled: contains either 0 or 1. (rw=
)
>=20
> Is there a reason do add these files in /sys/devices/platform while t=
he
> functionality is already provided by rfkill ?

Provide a alternative way to enable/disable these devices, and also
for debugging. Does that make any sense?

> > + * camera - Camera subsystem enabled: contains either 0 or 1. (rw)
> > + * bluetooth - Bluetooth subsystem enabled: contains either 0 or 1=
=2E (rw)
> > + * touchscreen - Touchscreen subsystem enabled: contains either 0 =
or 1. (ro)
>=20
> This should be in Documentation/ABI/testing/

Should I prepare the document now and submit also?

> > +
> > +static struct platform_device *oaktrail_device;
> > +static struct rfkill *bt_rfkill;
> > +static struct rfkill *gps_rfkill;
> > +static struct rfkill *wifi_rfkill;
> > +static struct rfkill *wwan_rfkill;
>=20
> Here you could create two (four ?) helpers that contains the logic,
> and craft dummy functions which only call the helpers with the right
> parameters in your macros.
>=20
> These helpers could also be used by later functions.
>=20

I will try to define some micros..

> > +static int setup_rfkill(void)
>=20
> oaktrail_rfkill_init() ?

Sure.

> > + =A0 =A0 =A0 rfkill_destroy(wwan_rfkill);
> > +err_allocate_wwan:
> > + =A0 =A0 =A0 rfkill_unregister(gps_rfkill);
> > +err_register_gps:
> > + =A0 =A0 =A0 rfkill_destroy(gps_rfkill);
> > +err_allocate_gps:
> > + =A0 =A0 =A0 rfkill_unregister(bt_rfkill);
> > +err_register_bt:
> > + =A0 =A0 =A0 rfkill_destroy(bt_rfkill);
> > +err_allocate_bt:
> > + =A0 =A0 =A0 rfkill_unregister(wifi_rfkill);
> > +err_register_wifi:
> > + =A0 =A0 =A0 rfkill_destroy(wifi_rfkill);
> > +
> > + =A0 =A0 =A0 return ret;
> > +}
>=20
> Here  I'd write an helper function to call rfkill_alloc,
> rfkill_register and handle
> rfkill_register failure. And then, if any of the helper calls fail, j=
ust call
> oaktrail_rfkill_exit (which which rfkill if the rfkill pointer is NUL=
L or not).
>=20
> oaktrail_rfkill_exit could also be used in the module exit function.

Yes, will try to do that.

> > +static int __devinit oaktrail_probe(struct platform_device *pdev)
> > +{
> > + =A0 =A0 =A0 int err;
> > +
> > + =A0 =A0 =A0 err =3D sysfs_create_group(&pdev->dev.kobj, &oaktrail=
_attribute_group);
> > + =A0 =A0 =A0 return err;
> > +}
>=20
> return sysfs_create_group(&pdev->dev.kobj, &oaktrail_attribute_group)=
;
>=20
> we don't really need err right now, do we ?

Will change this.

> > +MODULE_AUTHOR("Yin Kangkai (kangkai.yin@intel.com)");
> > +MODULE_DESCRIPTION("Intel Oaktrail Platform ACPI Extras");
> > +MODULE_VERSION(DRIVER_VERSION);
> > +MODULE_LICENSE("GPL");
>=20
> Maybe you could add some MODULE_ALIAS("dmi:xxxxx") lines
> to enable module autoloading ?

Will try to.

Thanks for the review.

Regards,
Kangkai
