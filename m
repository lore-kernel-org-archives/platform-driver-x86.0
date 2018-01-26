From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4] Support intel-vbtn based tablet mode switch
Date: Fri, 26 Jan 2018 11:52:33 +0100
Message-ID: <20180126105233.yhowbofqfcx6yvdw@pali>
References: <1516720704-19831-1-git-send-email-notmart@gmail.com>
 <1914818.Wtl4XKE3JN@phobos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:37501 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752090AbeAZKwh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 05:52:37 -0500
Content-Disposition: inline
In-Reply-To: <1914818.Wtl4XKE3JN@phobos>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Martin <notmart@gmail.com>
Cc: linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, bhush94@gmail.com, platform-driver-x86@vger.kernel.org, mario.limonciello@dell.com, Mario Limonciello <mario_limonciello@dell.com>

On Friday 26 January 2018 10:45:55 Marco Martin wrote:
> On marted=C3=AC 23 gennaio 2018 16:18:24 CET Marco Martin wrote:
> > Some laptops such as Dell Inspiron 7000 series have the
> > tablet mode switch implemented in Intel ACPI,
> > the events to enter and exit the tablet mode are 0xCC and 0xCD
> >=20
> > CC: platform-driver-x86@vger.kernel.org
> > CC: Matthew Garrett <mjg59@srcf.ucam.org>
> > CC: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> > CC: Darren Hart <dvhart@infradead.org>
> > CC: Mario Limonciello <mario_limonciello@dell.com>
> > CC: Andy Shevchenko <andy@infradead.org>
> >=20
> > Signed-off-by: Marco Martin <notmart@gmail.com>
> > ---
> >  drivers/platform/x86/intel-vbtn.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/intel-vbtn.c
> > b/drivers/platform/x86/intel-vbtn.c index 58c5ff3..64b4b34 100644
> > --- a/drivers/platform/x86/intel-vbtn.c
> > +++ b/drivers/platform/x86/intel-vbtn.c
> > @@ -26,6 +26,9 @@
> >  #include <linux/suspend.h>
> >  #include <acpi/acpi_bus.h>
> >=20
> > +/* When NOT in tablet mode, VBDS has the flag 0x40 */
> > +#define TABLET_MODE_FLAG 0x40
> > +
> >  MODULE_LICENSE("GPL");
> >  MODULE_AUTHOR("AceLan Kao");
> >=20
> > @@ -42,6 +45,8 @@ static const struct key_entry intel_vbtn_keymap[] =3D=
 {
> >  	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },		/* volume-up key release */
> >  	{ KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },		/* volume-down key press */
> >  	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
> > +	{ KE_SW,  0xCC, { .sw =3D { SW_TABLET_MODE, 1 } } }, /* Tablet mode i=
n */
> > +	{ KE_SW,  0xCD, { .sw =3D { SW_TABLET_MODE, 0 } } }, /* Tablet mode o=
ut */
> >  	{ KE_END },
> >  };
> >=20
> > @@ -88,6 +93,7 @@ static void notify_handler(acpi_handle handle, u32 ev=
ent,
> > void *context)
> >=20
> >  static int intel_vbtn_probe(struct platform_device *device)
> >  {
> > +	struct acpi_buffer vgbs_output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> >  	acpi_handle handle =3D ACPI_HANDLE(&device->dev);
> >  	struct intel_vbtn_priv *priv;
> >  	acpi_status status;
> > @@ -110,6 +116,21 @@ static int intel_vbtn_probe(struct platform_device
> > *device) return err;
> >  	}
> >=20
> > +	status =3D acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_output);
> > +	/* VGBS being present and returning something means
> > +	 * we have a tablet mode switch
> > +	 */
> > +	if (ACPI_SUCCESS(status)) {
> > +		union acpi_object *obj =3D vgbs_output.pointer;
> > +
> > +		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
> > +			input_set_capability(priv->input_dev, EV_SW, SW_TABLET_MODE);
> > +			input_report_switch(priv->input_dev,
> > +								SW_TABLET_MODE,
> > +								!(obj->integer.value & TABLET_MODE_FLAG));
> > +		}
> > +	}
> > +
> >  	status =3D acpi_install_notify_handler(handle,
> >  					     ACPI_DEVICE_NOTIFY,
> >  					     notify_handler,
>=20
> Is there still something to change in this version of the patch?

Yes, I already wrote it in thread for older patch version. Calling
input_set_capability() is not needed at all because all capabilities are
already set by sparse_keymap_setup() function.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
