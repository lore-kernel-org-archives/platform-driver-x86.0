From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Mon, 28 Mar 2016 11:56:33 -0700
Message-ID: <20160328185633.GD26086@dvhart-mobl5.amr.corp.intel.com>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
 <1458341063-8753-1-git-send-email-gabriele.mzt@gmail.com>
 <20160321121736.GH8413@pali>
 <CABFtUbRxqJfd=CruaVnQPMbRo1ZaK=NX8wO7kwRh6pDN4s0t2g@mail.gmail.com>
 <20160324093915.GZ8413@pali>
 <CABFtUbTy+zWgGOk4C998yNn=A91VF5o7ye5piTN5CuSBFKW9_g@mail.gmail.com>
 <20160328173309.GA26086@dvhart-mobl5.amr.corp.intel.com>
 <CABFtUbSH1hm4uYGwDRNmntYc567Sh7D+TakUse=KvaqKL8sxrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:59654 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751164AbcC1S7a (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2016 14:59:30 -0400
Content-Disposition: inline
In-Reply-To: <CABFtUbSH1hm4uYGwDRNmntYc567Sh7D+TakUse=KvaqKL8sxrw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 28, 2016 at 07:58:09PM +0200, Gabriele Mazzotta wrote:
> 2016-03-28 19:33 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> > On Thu, Mar 24, 2016 at 12:24:56PM +0100, Gabriele Mazzotta wrote:
> >> 2016-03-24 10:39 GMT+01:00 Pali Roh=E1r <pali.rohar@gmail.com>:
> >> > On Monday 21 March 2016 16:13:34 Gabriele Mazzotta wrote:
> >> >> 2016-03-21 13:17 GMT+01:00 Pali Roh=E1r <pali.rohar@gmail.com>:
> >> >> > On Friday 18 March 2016 23:44:23 Gabriele Mazzotta wrote:
> >> >> >> +#ifdef CONFIG_PM_SLEEP
> >> >> >> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *co=
ntext)
> >> >> >> +{
> >> >> >> +     struct rbtn_data *rbtn_data =3D context;
> >> >> >> +
> >> >> >> +     rbtn_data->suspended =3D false;
> >> >> >> +}
> >> >> >> +
> >> >> >> +static int rbtn_suspend(struct device *dev)
> >> >> >> +{
> >> >> >> +     struct acpi_device *device =3D to_acpi_device(dev);
> >> >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(devic=
e);
> >> >> >> +
> >> >> >> +     rbtn_data->suspended =3D true;
> >> >> >> +
> >> >> >> +     return 0;
> >> >> >> +}
> >> >> >> +
> >> >> >> +static int rbtn_resume(struct device *dev)
> >> >> >> +{
> >> >> >> +     struct acpi_device *device =3D to_acpi_device(dev);
> >> >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(devic=
e);
> >> >> >> +     acpi_status status;
> >> >> >> +
> >> >> >> +     /*
> >> >> >> +      * Clear the flag only after we received the extra
> >> >> >> +      * ACPI notification.
> >> >> >> +      */
> >> >> >> +     status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
> >> >> >> +                      rbtn_acpi_clear_flag, rbtn_data);
> >> >> >> +     if (ACPI_FAILURE(status))
> >> >> >> +             rbtn_data->suspended =3D false;
> >> >> >
> >> >> > I case when acpi_os_execute success it calls rbtn_acpi_clear_=
flag,
> >> >> > right? And that will set suspended to false. When acpi_os_exe=
cute fails,
> >> >> > then it set suspended too to false... Then whole acpi_os_exec=
ute doing
> >> >> > just "barrier" after which suspended flag can be set to false=
=2E So I
> >> >> > think rbtn_acpi_clear_flag function is not needed here.
> >> >> >
> >> >> > Cannot you pass NULL or empty function pointer as callback? O=
r what was
> >> >> > reason to do that flag clearing at "two places"?
> >> >>
> >> >> acpi_os_execute doesn't wait for the callback to be executed, s=
o
> >> >> I can't clear the flag from rbtn_resume.
> >> >
> >> > acpi_os_execute calls callback asynchronously later? Or what exa=
ctly do it?
> >>
> >> In this case, it adds the callback to the kacpi_notify_wq workqueu=
e
> >> for deferred execution.
> >
> > +Rafael for context/advice on the use of acpi_os_execute here.
> >
> > This is true, but a quick scan through that call path doesn't tell =
me why we
> > would need to call it here instead of just setting rbtn_data->suspe=
nded =3D false.
> > The comment suggests waiting for the event, but is that what this i=
s doing? It
> > appears to me to be immediately scheduling the function to a work q=
ueue, not
> > waiting for the event notifier.
> >
> > Also, since there is no indication to the user that a failure occur=
s, this
> > function is basically equivalent in the success and failure case (t=
he success
> > case is just slower).
> >
> > Am I missing something critical here?
>=20
> Maybe saying that we are waiting for the extra event is not really
> correct. Since the extra ACPI notification is processed by means
> of kacpi_notify_wq, or at least that's my understanding, our callback
> is likely going to be executed after we received the extra ACPI
> notification. This was suggested by Rafael [2].

I see, the workqueue is run after the event is issued. If that's the ca=
se, how
are we ensured that it will get cleared? Isn't it only some systems tha=
t have
this problem?

What happens to the systems that do not send this event at resume? Does=
 the
suspended flag remain set?

>=20
> The problem with setting the flag directly from the resume callback
> is that the extra notification might arrive after we cleared the
> flag, causing spurious input events [1].
>=20
> [1] http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/8=
001
> [2] http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/8=
201
>=20
> >
> >>
> >> > --
> >> > Pali Roh=E1r
> >> > pali.rohar@gmail.com
> >>
> >
> > --
> > Darren Hart
> > Intel Open Source Technology Center
>=20

--=20
Darren Hart
Intel Open Source Technology Center
