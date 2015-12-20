From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I open my laptop lid
Date: Sun, 20 Dec 2015 17:21:40 +0100
Message-ID: <4630444.0gh5fv1p6X@vostro.rjw.lan>
References: <5628C069.8040902@gmail.com> <20151120144425.GI29966@pali> <20151219001208.GB7244@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:59859 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751545AbbLTPvY convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Dec 2015 10:51:24 -0500
In-Reply-To: <20151219001208.GB7244@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Friday, December 18, 2015 04:12:08 PM Darren Hart wrote:
> On Fri, Nov 20, 2015 at 03:44:25PM +0100, Pali Roh=C3=A1r wrote:
> > On Friday 23 October 2015 20:03:19 Gabriele Mazzotta wrote:
> > > On 23/10/2015 13:14, Pali Roh=C3=A1r wrote:
> > > >On Friday 23 October 2015 11:47:25 Gabriele Mazzotta wrote:
> > > >>>In my opinion it is better to ignore user key press after resu=
me, if it
> > > >>>fix our problem. Better as false-positive event.
> > > >>
> > > >>The following appears to work really well. The notification arr=
ives
> > > >>before rbtn_resume() has been executed, so the extra event is i=
gnored.
> > > >>
> > > >>diff --git a/drivers/platform/x86/dell-rbtn.c
> > > >>b/drivers/platform/x86/dell-rbtn.c
> > > >>index cd410e3..1d64b72 100644
> > > >>--- a/drivers/platform/x86/dell-rbtn.c
> > > >>+++ b/drivers/platform/x86/dell-rbtn.c
> > > >>@@ -28,6 +28,7 @@ struct rbtn_data {
> > > >>  	enum rbtn_type type;
> > > >>  	struct rfkill *rfkill;
> > > >>  	struct input_dev *input_dev;
> > > >>+	bool suspended;
> > > >>  };
> > > >>
> > > >>
> > > >>@@ -220,9 +221,33 @@ static const struct acpi_device_id rbtn_id=
s[] =3D {
> > > >>  	{ "", 0 },
> > > >>  };
> > > >>
> > > >>+#ifdef CONFIG_PM_SLEEP
> > > >>+static int rbtn_suspend(struct device *dev)
> > > >>+{
> > > >>+	struct acpi_device *device =3D to_acpi_device(dev);
> > > >>+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> > > >>+
> > > >>+	rbtn_data->suspended =3D true;
> > > >>+
> > > >>+	return 0;
> > > >>+}
> > > >>+
> > > >>+static int rbtn_resume(struct device *dev)
> > > >>+{
> > > >>+	struct acpi_device *device =3D to_acpi_device(dev);
> > > >>+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> > > >>+
> > > >>+	rbtn_data->suspended =3D false;
> > > >>+
> > > >>+	return 0;
> > > >>+}
> > > >>+#endif
> > > >>+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resum=
e);
> > > >>+
> > > >>  static struct acpi_driver rbtn_driver =3D {
> > > >>  	.name =3D "dell-rbtn",
> > > >>  	.ids =3D rbtn_ids,
> > > >>+	.drv.pm =3D &rbtn_pm_ops,
> > > >>  	.ops =3D {
> > > >>  		.add =3D rbtn_add,
> > > >>  		.remove =3D rbtn_remove,
> > > >>@@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi_device =
*device, u32
> > > >>event)
> > > >>  {
> > > >>  	struct rbtn_data *rbtn_data =3D device->driver_data;
> > > >>
> > > >>+	if (rbtn_data->suspended)
> > > >>+		return;
> > > >>+
> > > >>  	if (event !=3D 0x80) {
> > > >>  		dev_info(&device->dev, "Received unknown event (0x%x)\n",
> > > >>  			 event);
> > > >>
> > > >
> > > >Great, but is not there a better way to turn off .notify ACPI fu=
nction
> > > >when that ACPI device is suspended?
> > > >
> > > >Is not this ACPI device driver bug that it allows to call .notif=
y method
> > > >even if device is suspended?
> > >=20
> > > I was surprised this worked, I was assuming that nothing could ru=
n
> > > before the resume callback, but I was wrong. I think it makes sen=
se to
> > > treat ACPI devices in a special way, but I really don't know, we =
need
> > > someone more knowledgeable to answer these questions. However, wh=
ile I
> > > was trying to figure things out, I stumbled upon the following:
> > > e71eeb2a6bcc ("ACPI / button: Do not propagate wakeup-from-suspen=
d events").
> >=20
> > Gabriele, are you going to send this patch?
> >=20
> > I think that patch should be OK as it drop events when device is in
> > suspend state (when it should not receive events)...
> >=20
> > Darren, what do you think about it?
> >=20
>=20
> Sorry, this one has been difficult for me to track, but it's clearly =
an issue,
> and new systems are experiencing it as well.
>=20
> I'd like to get Rafael's opinion on disabling .notify ACPI function w=
hile
> suspended.
>=20
> +Rafael

This by far wouldn't be enough, because drivers may install ACPI notify
handlers by themselves and those are hooked up directly into the ACPICA
code.

Besides, some drivers may actually want to receive those events while
the system is suspending or resuming, so I think this has to be address=
ed
on a per-driver basis.

> Has Dell been involved here?

Not that I know of.

Thanks,
Rafael
