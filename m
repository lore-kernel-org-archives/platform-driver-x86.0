From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Mon, 18 Apr 2016 14:35:47 +0200
Message-ID: <20160418123547.GK29406@pali>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
 <CABFtUbTy+zWgGOk4C998yNn=A91VF5o7ye5piTN5CuSBFKW9_g@mail.gmail.com>
 <20160328173309.GA26086@dvhart-mobl5.amr.corp.intel.com>
 <4072492.lANJWhSkYa@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38115 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075AbcDRMfv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Apr 2016 08:35:51 -0400
Content-Disposition: inline
In-Reply-To: <4072492.lANJWhSkYa@vostro.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Tuesday 29 March 2016 15:11:35 Rafael J. Wysocki wrote:
> On Monday, March 28, 2016 10:33:09 AM Darren Hart wrote:
> > On Thu, Mar 24, 2016 at 12:24:56PM +0100, Gabriele Mazzotta wrote:
> > > 2016-03-24 10:39 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>=
:
> > > > On Monday 21 March 2016 16:13:34 Gabriele Mazzotta wrote:
> > > >> 2016-03-21 13:17 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.c=
om>:
> > > >> > On Friday 18 March 2016 23:44:23 Gabriele Mazzotta wrote:
> > > >> >> +#ifdef CONFIG_PM_SLEEP
> > > >> >> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *c=
ontext)
> > > >> >> +{
> > > >> >> +     struct rbtn_data *rbtn_data =3D context;
> > > >> >> +
> > > >> >> +     rbtn_data->suspended =3D false;
> > > >> >> +}
> > > >> >> +
> > > >> >> +static int rbtn_suspend(struct device *dev)
> > > >> >> +{
> > > >> >> +     struct acpi_device *device =3D to_acpi_device(dev);
> > > >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(devi=
ce);
> > > >> >> +
> > > >> >> +     rbtn_data->suspended =3D true;
> > > >> >> +
> > > >> >> +     return 0;
> > > >> >> +}
> > > >> >> +
> > > >> >> +static int rbtn_resume(struct device *dev)
> > > >> >> +{
> > > >> >> +     struct acpi_device *device =3D to_acpi_device(dev);
> > > >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(devi=
ce);
> > > >> >> +     acpi_status status;
> > > >> >> +
> > > >> >> +     /*
> > > >> >> +      * Clear the flag only after we received the extra
> > > >> >> +      * ACPI notification.
> > > >> >> +      */
> > > >> >> +     status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
> > > >> >> +                      rbtn_acpi_clear_flag, rbtn_data);
> > > >> >> +     if (ACPI_FAILURE(status))
> > > >> >> +             rbtn_data->suspended =3D false;
> > > >> >
> > > >> > I case when acpi_os_execute success it calls rbtn_acpi_clear=
_flag,
> > > >> > right? And that will set suspended to false. When acpi_os_ex=
ecute fails,
> > > >> > then it set suspended too to false... Then whole acpi_os_exe=
cute doing
> > > >> > just "barrier" after which suspended flag can be set to fals=
e. So I
> > > >> > think rbtn_acpi_clear_flag function is not needed here.
> > > >> >
> > > >> > Cannot you pass NULL or empty function pointer as callback? =
Or what was
> > > >> > reason to do that flag clearing at "two places"?
> > > >>
> > > >> acpi_os_execute doesn't wait for the callback to be executed, =
so
> > > >> I can't clear the flag from rbtn_resume.
> > > >
> > > > acpi_os_execute calls callback asynchronously later? Or what ex=
actly do it?
> > >=20
> > > In this case, it adds the callback to the kacpi_notify_wq workque=
ue
> > > for deferred execution.
> >=20
> > +Rafael for context/advice on the use of acpi_os_execute here.
> >=20
> > This is true, but a quick scan through that call path doesn't tell =
me why we
> > would need to call it here instead of just setting rbtn_data->suspe=
nded =3D false.
> > The comment suggests waiting for the event, but is that what this i=
s doing? It
> > appears to me to be immediately scheduling the function to a work q=
ueue, not
> > waiting for the event notifier.
>=20
> I think this is supposed to work as a barrier.  That is, it will only=
 run after
> all events in the queue have been processed.
>=20
> I'm not sure if that's necessary, though.
>=20
> Thanks,
> Rafael
>=20

Darren, Gabriele, what is state of this patch? Bug is not still fixed,
right?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
