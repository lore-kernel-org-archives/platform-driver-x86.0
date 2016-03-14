From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Mon, 14 Mar 2016 12:45:25 +0100
Message-ID: <20160314114525.GK8413@pali>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
 <CABFtUbTpCU4XJBFBwTAHqE=eUbNgHHmCb2yrz_a1fkkNmzpHPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:34998 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965016AbcCNLp3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Mar 2016 07:45:29 -0400
Content-Disposition: inline
In-Reply-To: <CABFtUbTpCU4XJBFBwTAHqE=eUbNgHHmCb2yrz_a1fkkNmzpHPQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andrei Borzenkov <arvidjaar@gmail.com>
Cc: "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday 14 March 2016 12:34:31 Gabriele Mazzotta wrote:
> 2016-03-12 0:49 GMT+01:00 Gabriele Mazzotta <gabriele.mzt@gmail.com>:
> > Some BIOSes unconditionally send an ACPI notification to RBTN when =
the
> > system is resuming from suspend. This makes dell-rbtn send an input
> > event to userspace as if a function key was pressed. Prevent this b=
y
> > ignoring all the notifications received while the device is suspend=
ed.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> > Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > ---
> >  drivers/platform/x86/dell-rbtn.c | 41 ++++++++++++++++++++++++++++=
++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x8=
6/dell-rbtn.c
> > index cd410e3..56b0da7 100644
> > --- a/drivers/platform/x86/dell-rbtn.c
> > +++ b/drivers/platform/x86/dell-rbtn.c
> > @@ -28,6 +28,7 @@ struct rbtn_data {
> >         enum rbtn_type type;
> >         struct rfkill *rfkill;
> >         struct input_dev *input_dev;
> > +       bool suspended;
> >  };
> >
> >
> > @@ -220,9 +221,44 @@ static const struct acpi_device_id rbtn_ids[] =
=3D {
> >         { "", 0 },
> >  };
> >
> > +#ifdef CONFIG_PM_SLEEP
> > +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *context)
> > +{
> > +       struct rbtn_data *rbtn_data =3D context;
> > +
> > +       rbtn_data->suspended =3D false;
> > +}
> > +
> > +static int rbtn_suspend(struct device *dev)
> > +{
> > +       struct acpi_device *device =3D to_acpi_device(dev);
> > +       struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> > +
> > +       rbtn_data->suspended =3D true;
> > +
> > +       return 0;
> > +}
> > +
> > +static int rbtn_resume(struct device *dev)
> > +{
> > +       struct acpi_device *device =3D to_acpi_device(dev);
> > +       struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> > +       acpi_status status;
> > +
> > +       status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
> > +                        rbtn_acpi_clear_flag, rbtn_data);
> > +       if (ACPI_FAILURE(status))
> > +               rbtn_data->suspended =3D false;
> > +
> > +       return 0;
> > +}
> > +#endif
> > +static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
> > +
> >  static struct acpi_driver rbtn_driver =3D {
> >         .name =3D "dell-rbtn",
> >         .ids =3D rbtn_ids,
> > +       .drv.pm =3D &rbtn_pm_ops,
> >         .ops =3D {
> >                 .add =3D rbtn_add,
> >                 .remove =3D rbtn_remove,
> > @@ -384,6 +420,11 @@ static void rbtn_notify(struct acpi_device *de=
vice, u32 event)
> >  {
> >         struct rbtn_data *rbtn_data =3D device->driver_data;
> >
> > +       if (rbtn_data->suspended) {
> > +               dev_dbg(&device->dev, "ACPI notification ignored\n"=
);
> > +               return;
> > +       }
> > +
> >         if (event !=3D 0x80) {
> >                 dev_info(&device->dev, "Received unknown event (0x%=
x)\n",
> >                          event);
> > --
> > 2.7.0
> >
>=20
> I'm sorry, Pali, I must have missed your email address while sending
> this updated version.

=46or me patch looks OK. I would suggest to add some comment about BIOS
into code too.

Rafael, can you review that ACPI suspended/OSL_NOTIFY_HANDLER part?

Andrei, can you test if it now really fix it on your machine?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
