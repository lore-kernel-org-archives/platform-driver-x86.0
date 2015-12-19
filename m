From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Fri, 18 Dec 2015 16:12:08 -0800
Message-ID: <20151219001208.GB7244@malice.jf.intel.com>
References: <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7>
 <5628E812.2070708@gmail.com>
 <20151022141710.GD15219@pali>
 <56297148.6060605@gmail.com>
 <20151023090027.GG15219@pali>
 <562A022D.1020302@gmail.com>
 <20151023111445.GH15219@pali>
 <562A7667.3050208@gmail.com>
 <20151120144425.GI29966@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34122 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751422AbbLSAMM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Dec 2015 19:12:12 -0500
Content-Disposition: inline
In-Reply-To: <20151120144425.GI29966@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Rafael Wysocki <rjw@rjwysocki.net>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Fri, Nov 20, 2015 at 03:44:25PM +0100, Pali Roh=E1r wrote:
> On Friday 23 October 2015 20:03:19 Gabriele Mazzotta wrote:
> > On 23/10/2015 13:14, Pali Roh=E1r wrote:
> > >On Friday 23 October 2015 11:47:25 Gabriele Mazzotta wrote:
> > >>>In my opinion it is better to ignore user key press after resume=
, if it
> > >>>fix our problem. Better as false-positive event.
> > >>
> > >>The following appears to work really well. The notification arriv=
es
> > >>before rbtn_resume() has been executed, so the extra event is ign=
ored.
> > >>
> > >>diff --git a/drivers/platform/x86/dell-rbtn.c
> > >>b/drivers/platform/x86/dell-rbtn.c
> > >>index cd410e3..1d64b72 100644
> > >>--- a/drivers/platform/x86/dell-rbtn.c
> > >>+++ b/drivers/platform/x86/dell-rbtn.c
> > >>@@ -28,6 +28,7 @@ struct rbtn_data {
> > >>  	enum rbtn_type type;
> > >>  	struct rfkill *rfkill;
> > >>  	struct input_dev *input_dev;
> > >>+	bool suspended;
> > >>  };
> > >>
> > >>
> > >>@@ -220,9 +221,33 @@ static const struct acpi_device_id rbtn_ids[=
] =3D {
> > >>  	{ "", 0 },
> > >>  };
> > >>
> > >>+#ifdef CONFIG_PM_SLEEP
> > >>+static int rbtn_suspend(struct device *dev)
> > >>+{
> > >>+	struct acpi_device *device =3D to_acpi_device(dev);
> > >>+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> > >>+
> > >>+	rbtn_data->suspended =3D true;
> > >>+
> > >>+	return 0;
> > >>+}
> > >>+
> > >>+static int rbtn_resume(struct device *dev)
> > >>+{
> > >>+	struct acpi_device *device =3D to_acpi_device(dev);
> > >>+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> > >>+
> > >>+	rbtn_data->suspended =3D false;
> > >>+
> > >>+	return 0;
> > >>+}
> > >>+#endif
> > >>+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume)=
;
> > >>+
> > >>  static struct acpi_driver rbtn_driver =3D {
> > >>  	.name =3D "dell-rbtn",
> > >>  	.ids =3D rbtn_ids,
> > >>+	.drv.pm =3D &rbtn_pm_ops,
> > >>  	.ops =3D {
> > >>  		.add =3D rbtn_add,
> > >>  		.remove =3D rbtn_remove,
> > >>@@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi_device *d=
evice, u32
> > >>event)
> > >>  {
> > >>  	struct rbtn_data *rbtn_data =3D device->driver_data;
> > >>
> > >>+	if (rbtn_data->suspended)
> > >>+		return;
> > >>+
> > >>  	if (event !=3D 0x80) {
> > >>  		dev_info(&device->dev, "Received unknown event (0x%x)\n",
> > >>  			 event);
> > >>
> > >
> > >Great, but is not there a better way to turn off .notify ACPI func=
tion
> > >when that ACPI device is suspended?
> > >
> > >Is not this ACPI device driver bug that it allows to call .notify =
method
> > >even if device is suspended?
> >=20
> > I was surprised this worked, I was assuming that nothing could run
> > before the resume callback, but I was wrong. I think it makes sense=
 to
> > treat ACPI devices in a special way, but I really don't know, we ne=
ed
> > someone more knowledgeable to answer these questions. However, whil=
e I
> > was trying to figure things out, I stumbled upon the following:
> > e71eeb2a6bcc ("ACPI / button: Do not propagate wakeup-from-suspend =
events").
>=20
> Gabriele, are you going to send this patch?
>=20
> I think that patch should be OK as it drop events when device is in
> suspend state (when it should not receive events)...
>=20
> Darren, what do you think about it?
>=20

Sorry, this one has been difficult for me to track, but it's clearly an=
 issue,
and new systems are experiencing it as well.

I'd like to get Rafael's opinion on disabling .notify ACPI function whi=
le
suspended.

+Rafael

Has Dell been involved here?

+Jared


--=20
Darren Hart
Intel Open Source Technology Center
