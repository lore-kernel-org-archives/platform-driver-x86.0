From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Mon, 26 Oct 2015 23:38:13 +0900
Message-ID: <20151026143813.GA27580@malice.jf.intel.com>
References: <20151022105018.GX15219@pali>
 <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7>
 <5628E812.2070708@gmail.com>
 <20151022141710.GD15219@pali>
 <56297148.6060605@gmail.com>
 <20151023090027.GG15219@pali>
 <562A022D.1020302@gmail.com>
 <20151023111445.GH15219@pali>
 <562A7667.3050208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53272 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753719AbbJZOiQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Oct 2015 10:38:16 -0400
Content-Disposition: inline
In-Reply-To: <562A7667.3050208@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Fri, Oct 23, 2015 at 08:03:19PM +0200, Gabriele Mazzotta wrote:
> On 23/10/2015 13:14, Pali Roh=E1r wrote:
> >On Friday 23 October 2015 11:47:25 Gabriele Mazzotta wrote:
> >>>In my opinion it is better to ignore user key press after resume, =
if it
> >>>fix our problem. Better as false-positive event.
> >>
> >>The following appears to work really well. The notification arrives
> >>before rbtn_resume() has been executed, so the extra event is ignor=
ed.
> >>
> >>diff --git a/drivers/platform/x86/dell-rbtn.c
> >>b/drivers/platform/x86/dell-rbtn.c
> >>index cd410e3..1d64b72 100644
> >>--- a/drivers/platform/x86/dell-rbtn.c
> >>+++ b/drivers/platform/x86/dell-rbtn.c
> >>@@ -28,6 +28,7 @@ struct rbtn_data {
> >>  	enum rbtn_type type;
> >>  	struct rfkill *rfkill;
> >>  	struct input_dev *input_dev;
> >>+	bool suspended;
> >>  };
> >>
> >>
> >>@@ -220,9 +221,33 @@ static const struct acpi_device_id rbtn_ids[] =
=3D {
> >>  	{ "", 0 },
> >>  };
> >>
> >>+#ifdef CONFIG_PM_SLEEP
> >>+static int rbtn_suspend(struct device *dev)
> >>+{
> >>+	struct acpi_device *device =3D to_acpi_device(dev);
> >>+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> >>+
> >>+	rbtn_data->suspended =3D true;
> >>+
> >>+	return 0;
> >>+}
> >>+
> >>+static int rbtn_resume(struct device *dev)
> >>+{
> >>+	struct acpi_device *device =3D to_acpi_device(dev);
> >>+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> >>+
> >>+	rbtn_data->suspended =3D false;
> >>+
> >>+	return 0;
> >>+}
> >>+#endif
> >>+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
> >>+
> >>  static struct acpi_driver rbtn_driver =3D {
> >>  	.name =3D "dell-rbtn",
> >>  	.ids =3D rbtn_ids,
> >>+	.drv.pm =3D &rbtn_pm_ops,
> >>  	.ops =3D {
> >>  		.add =3D rbtn_add,
> >>  		.remove =3D rbtn_remove,
> >>@@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi_device *dev=
ice, u32
> >>event)
> >>  {
> >>  	struct rbtn_data *rbtn_data =3D device->driver_data;
> >>
> >>+	if (rbtn_data->suspended)
> >>+		return;
> >>+
> >>  	if (event !=3D 0x80) {
> >>  		dev_info(&device->dev, "Received unknown event (0x%x)\n",
> >>  			 event);
> >>
> >
> >Great, but is not there a better way to turn off .notify ACPI functi=
on
> >when that ACPI device is suspended?
> >
> >Is not this ACPI device driver bug that it allows to call .notify me=
thod
> >even if device is suspended?
>=20
> I was surprised this worked, I was assuming that nothing could run
> before the resume callback, but I was wrong. I think it makes sense t=
o
> treat ACPI devices in a special way, but I really don't know, we need
> someone more knowledgeable to answer these questions. However, while =
I
> was trying to figure things out, I stumbled upon the following:
> e71eeb2a6bcc ("ACPI / button: Do not propagate wakeup-from-suspend ev=
ents").
>=20

My understanding here though is that laptops with a Fn+RBTN key which c=
hanges
the state of the radio in firmware should be handled via the rfkill int=
erface
rather than the inpu interface - so while this patch may appear to work=
, it's
using the input interface to copy the rfkill interface/state.

The proper solution, if I'm understanding this correctly - and apologie=
s if not,
some of this is new territory for me as well - would be for this device=
 to be
detected as firmware controlled (what we refer to as a SLIDER in the co=
de -
which needs to be renamed IMHO).

Let's sort out this point, then we can pull in Rafael to make sure this=
 is how
to best deal with the spurious event on resume.

--=20
Darren Hart
Intel Open Source Technology Center
