From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Mon, 28 Mar 2016 10:33:09 -0700
Message-ID: <20160328173309.GA26086@dvhart-mobl5.amr.corp.intel.com>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
 <1458341063-8753-1-git-send-email-gabriele.mzt@gmail.com>
 <20160321121736.GH8413@pali>
 <CABFtUbRxqJfd=CruaVnQPMbRo1ZaK=NX8wO7kwRh6pDN4s0t2g@mail.gmail.com>
 <20160324093915.GZ8413@pali>
 <CABFtUbTy+zWgGOk4C998yNn=A91VF5o7ye5piTN5CuSBFKW9_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:48596 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751212AbcC1Rfp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2016 13:35:45 -0400
Content-Disposition: inline
In-Reply-To: <CABFtUbTy+zWgGOk4C998yNn=A91VF5o7ye5piTN5CuSBFKW9_g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 24, 2016 at 12:24:56PM +0100, Gabriele Mazzotta wrote:
> 2016-03-24 10:39 GMT+01:00 Pali Roh=E1r <pali.rohar@gmail.com>:
> > On Monday 21 March 2016 16:13:34 Gabriele Mazzotta wrote:
> >> 2016-03-21 13:17 GMT+01:00 Pali Roh=E1r <pali.rohar@gmail.com>:
> >> > On Friday 18 March 2016 23:44:23 Gabriele Mazzotta wrote:
> >> >> +#ifdef CONFIG_PM_SLEEP
> >> >> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *conte=
xt)
> >> >> +{
> >> >> +     struct rbtn_data *rbtn_data =3D context;
> >> >> +
> >> >> +     rbtn_data->suspended =3D false;
> >> >> +}
> >> >> +
> >> >> +static int rbtn_suspend(struct device *dev)
> >> >> +{
> >> >> +     struct acpi_device *device =3D to_acpi_device(dev);
> >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> >> >> +
> >> >> +     rbtn_data->suspended =3D true;
> >> >> +
> >> >> +     return 0;
> >> >> +}
> >> >> +
> >> >> +static int rbtn_resume(struct device *dev)
> >> >> +{
> >> >> +     struct acpi_device *device =3D to_acpi_device(dev);
> >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> >> >> +     acpi_status status;
> >> >> +
> >> >> +     /*
> >> >> +      * Clear the flag only after we received the extra
> >> >> +      * ACPI notification.
> >> >> +      */
> >> >> +     status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
> >> >> +                      rbtn_acpi_clear_flag, rbtn_data);
> >> >> +     if (ACPI_FAILURE(status))
> >> >> +             rbtn_data->suspended =3D false;
> >> >
> >> > I case when acpi_os_execute success it calls rbtn_acpi_clear_fla=
g,
> >> > right? And that will set suspended to false. When acpi_os_execut=
e fails,
> >> > then it set suspended too to false... Then whole acpi_os_execute=
 doing
> >> > just "barrier" after which suspended flag can be set to false. S=
o I
> >> > think rbtn_acpi_clear_flag function is not needed here.
> >> >
> >> > Cannot you pass NULL or empty function pointer as callback? Or w=
hat was
> >> > reason to do that flag clearing at "two places"?
> >>
> >> acpi_os_execute doesn't wait for the callback to be executed, so
> >> I can't clear the flag from rbtn_resume.
> >
> > acpi_os_execute calls callback asynchronously later? Or what exactl=
y do it?
>=20
> In this case, it adds the callback to the kacpi_notify_wq workqueue
> for deferred execution.

+Rafael for context/advice on the use of acpi_os_execute here.

This is true, but a quick scan through that call path doesn't tell me w=
hy we
would need to call it here instead of just setting rbtn_data->suspended=
 =3D false.
The comment suggests waiting for the event, but is that what this is do=
ing? It
appears to me to be immediately scheduling the function to a work queue=
, not
waiting for the event notifier.

Also, since there is no indication to the user that a failure occurs, t=
his
function is basically equivalent in the success and failure case (the s=
uccess
case is just slower).

Am I missing something critical here?



>=20
> > --
> > Pali Roh=E1r
> > pali.rohar@gmail.com
>=20

--=20
Darren Hart
Intel Open Source Technology Center
