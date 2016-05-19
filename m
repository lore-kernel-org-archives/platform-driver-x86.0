From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Thu, 19 May 2016 13:18:26 -0700
Message-ID: <20160519201826.GC1872@f23x64.localdomain>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
 <CABFtUbTy+zWgGOk4C998yNn=A91VF5o7ye5piTN5CuSBFKW9_g@mail.gmail.com>
 <20160328173309.GA26086@dvhart-mobl5.amr.corp.intel.com>
 <4072492.lANJWhSkYa@vostro.rjw.lan>
 <20160418123547.GK29406@pali>
 <CABFtUbTczjpda2Ld698ZbfJmDFX_qcXVpPR_nECrj4oJxJKgJw@mail.gmail.com>
 <20160519133032.GO29844@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56329 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755113AbcESUSb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 May 2016 16:18:31 -0400
Content-Disposition: inline
In-Reply-To: <20160519133032.GO29844@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 19, 2016 at 03:30:32PM +0200, Pali Roh=E1r wrote:
> On Monday 25 April 2016 22:06:11 Gabriele Mazzotta wrote:
> > 2016-04-18 14:35 GMT+02:00 Pali Roh=E1r <pali.rohar@gmail.com>:
> > > On Tuesday 29 March 2016 15:11:35 Rafael J. Wysocki wrote:
> > >> On Monday, March 28, 2016 10:33:09 AM Darren Hart wrote:
> > >> > On Thu, Mar 24, 2016 at 12:24:56PM +0100, Gabriele Mazzotta wr=
ote:
> > >> > > 2016-03-24 10:39 GMT+01:00 Pali Roh=E1r <pali.rohar@gmail.co=
m>:
> > >> > > > On Monday 21 March 2016 16:13:34 Gabriele Mazzotta wrote:
> > >> > > >> 2016-03-21 13:17 GMT+01:00 Pali Roh=E1r <pali.rohar@gmail=
=2Ecom>:
> > >> > > >> > On Friday 18 March 2016 23:44:23 Gabriele Mazzotta wrot=
e:
> > >> > > >> >> +#ifdef CONFIG_PM_SLEEP
> > >> > > >> >> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(vo=
id *context)
> > >> > > >> >> +{
> > >> > > >> >> +     struct rbtn_data *rbtn_data =3D context;
> > >> > > >> >> +
> > >> > > >> >> +     rbtn_data->suspended =3D false;
> > >> > > >> >> +}
> > >> > > >> >> +
> > >> > > >> >> +static int rbtn_suspend(struct device *dev)
> > >> > > >> >> +{
> > >> > > >> >> +     struct acpi_device *device =3D to_acpi_device(de=
v);
> > >> > > >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data=
(device);
> > >> > > >> >> +
> > >> > > >> >> +     rbtn_data->suspended =3D true;
> > >> > > >> >> +
> > >> > > >> >> +     return 0;
> > >> > > >> >> +}
> > >> > > >> >> +
> > >> > > >> >> +static int rbtn_resume(struct device *dev)
> > >> > > >> >> +{
> > >> > > >> >> +     struct acpi_device *device =3D to_acpi_device(de=
v);
> > >> > > >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data=
(device);
> > >> > > >> >> +     acpi_status status;
> > >> > > >> >> +
> > >> > > >> >> +     /*
> > >> > > >> >> +      * Clear the flag only after we received the ext=
ra
> > >> > > >> >> +      * ACPI notification.
> > >> > > >> >> +      */
> > >> > > >> >> +     status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
> > >> > > >> >> +                      rbtn_acpi_clear_flag, rbtn_data=
);
> > >> > > >> >> +     if (ACPI_FAILURE(status))
> > >> > > >> >> +             rbtn_data->suspended =3D false;
> > >> > > >> >
> > >> > > >> > I case when acpi_os_execute success it calls rbtn_acpi_=
clear_flag,
> > >> > > >> > right? And that will set suspended to false. When acpi_=
os_execute fails,
> > >> > > >> > then it set suspended too to false... Then whole acpi_o=
s_execute doing
> > >> > > >> > just "barrier" after which suspended flag can be set to=
 false. So I
> > >> > > >> > think rbtn_acpi_clear_flag function is not needed here.
> > >> > > >> >
> > >> > > >> > Cannot you pass NULL or empty function pointer as callb=
ack? Or what was
> > >> > > >> > reason to do that flag clearing at "two places"?
> > >> > > >>
> > >> > > >> acpi_os_execute doesn't wait for the callback to be execu=
ted, so
> > >> > > >> I can't clear the flag from rbtn_resume.
> > >> > > >
> > >> > > > acpi_os_execute calls callback asynchronously later? Or wh=
at exactly do it?
> > >> > >
> > >> > > In this case, it adds the callback to the kacpi_notify_wq wo=
rkqueue
> > >> > > for deferred execution.
> > >> >
> > >> > +Rafael for context/advice on the use of acpi_os_execute here.
> > >> >
> > >> > This is true, but a quick scan through that call path doesn't =
tell me why we
> > >> > would need to call it here instead of just setting rbtn_data->=
suspended =3D false.
> > >> > The comment suggests waiting for the event, but is that what t=
his is doing? It
> > >> > appears to me to be immediately scheduling the function to a w=
ork queue, not
> > >> > waiting for the event notifier.
> > >>
> > >> I think this is supposed to work as a barrier.  That is, it will=
 only run after
> > >> all events in the queue have been processed.
> > >>
> > >> I'm not sure if that's necessary, though.
> > >>
> > >> Thanks,
> > >> Rafael
> > >>
> > >
> > > Darren, Gabriele, what is state of this patch? Bug is not still f=
ixed,
> > > right?
> >=20
> > Yes, the bug is still there and this patch fixes it.
> >=20
> > Just to make it clear, we need the barrier. Andrei could reproduce
> > the bug without it [1], but not with it, as he confirmed in this
> > thread [2].
> >=20
> > [1] http://article.gmane.org/gmane.linux.drivers.platform.x86.devel=
/8001
> > [2] http://article.gmane.org/gmane.linux.drivers.platform.x86.devel=
/8937
>=20
> Ok, so it means that somebody (who understand ACPI) should review cod=
e
> and accept it or show what is needed to fix. Plus maybe adds more
> comments how that "barrier" works as I was first confused...
>=20
> Darren, Rafael, can you do review of this patch?
>=20

Yes, working toward it.

--=20
Darren Hart
Intel Open Source Technology Center
