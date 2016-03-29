From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Tue, 29 Mar 2016 13:13:25 +0200
Message-ID: <CABFtUbQAK0P5a+MfL1F22tqaObgMQyDoCRiaouwjJQ8Gz8bmqg@mail.gmail.com>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
	<1458341063-8753-1-git-send-email-gabriele.mzt@gmail.com>
	<20160321121736.GH8413@pali>
	<CABFtUbRxqJfd=CruaVnQPMbRo1ZaK=NX8wO7kwRh6pDN4s0t2g@mail.gmail.com>
	<20160324093915.GZ8413@pali>
	<CABFtUbTy+zWgGOk4C998yNn=A91VF5o7ye5piTN5CuSBFKW9_g@mail.gmail.com>
	<20160328173309.GA26086@dvhart-mobl5.amr.corp.intel.com>
	<CABFtUbSH1hm4uYGwDRNmntYc567Sh7D+TakUse=KvaqKL8sxrw@mail.gmail.com>
	<20160328185633.GD26086@dvhart-mobl5.amr.corp.intel.com>
	<CABFtUbR5t4-Z26ax-RzZdXPY8tYUYAN40--847ygMEFvy+fWaA@mail.gmail.com>
	<20160329052406.GB20901@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f66.google.com ([209.85.192.66]:34368 "EHLO
	mail-qg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932163AbcC2LN0 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Mar 2016 07:13:26 -0400
In-Reply-To: <20160329052406.GB20901@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2016-03-29 7:24 GMT+02:00 Darren Hart <dvhart@infradead.org>:
>
> On Mon, Mar 28, 2016 at 09:41:09PM +0200, Gabriele Mazzotta wrote:
> > 2016-03-28 20:56 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> > > On Mon, Mar 28, 2016 at 07:58:09PM +0200, Gabriele Mazzotta wrote=
:
> > >> 2016-03-28 19:33 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> > >> > On Thu, Mar 24, 2016 at 12:24:56PM +0100, Gabriele Mazzotta wr=
ote:
> > >> >> 2016-03-24 10:39 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.=
com>:
> > >> >> > On Monday 21 March 2016 16:13:34 Gabriele Mazzotta wrote:
> > >> >> >> 2016-03-21 13:17 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gma=
il.com>:
> > >> >> >> > On Friday 18 March 2016 23:44:23 Gabriele Mazzotta wrote=
:
> > >> >> >> >> +#ifdef CONFIG_PM_SLEEP
> > >> >> >> >> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(voi=
d *context)
> > >> >> >> >> +{
> > >> >> >> >> +     struct rbtn_data *rbtn_data =3D context;
> > >> >> >> >> +
> > >> >> >> >> +     rbtn_data->suspended =3D false;
> > >> >> >> >> +}
> > >> >> >> >> +
> > >> >> >> >> +static int rbtn_suspend(struct device *dev)
> > >> >> >> >> +{
> > >> >> >> >> +     struct acpi_device *device =3D to_acpi_device(dev=
);
> > >> >> >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(=
device);
> > >> >> >> >> +
> > >> >> >> >> +     rbtn_data->suspended =3D true;
> > >> >> >> >> +
> > >> >> >> >> +     return 0;
> > >> >> >> >> +}
> > >> >> >> >> +
> > >> >> >> >> +static int rbtn_resume(struct device *dev)
> > >> >> >> >> +{
> > >> >> >> >> +     struct acpi_device *device =3D to_acpi_device(dev=
);
> > >> >> >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(=
device);
> > >> >> >> >> +     acpi_status status;
> > >> >> >> >> +
> > >> >> >> >> +     /*
> > >> >> >> >> +      * Clear the flag only after we received the extr=
a
> > >> >> >> >> +      * ACPI notification.
> > >> >> >> >> +      */
> > >> >> >> >> +     status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
> > >> >> >> >> +                      rbtn_acpi_clear_flag, rbtn_data)=
;
> > >> >> >> >> +     if (ACPI_FAILURE(status))
> > >> >> >> >> +             rbtn_data->suspended =3D false;
> > >> >> >> >
> > >> >> >> > I case when acpi_os_execute success it calls rbtn_acpi_c=
lear_flag,
> > >> >> >> > right? And that will set suspended to false. When acpi_o=
s_execute fails,
> > >> >> >> > then it set suspended too to false... Then whole acpi_os=
_execute doing
> > >> >> >> > just "barrier" after which suspended flag can be set to =
false. So I
> > >> >> >> > think rbtn_acpi_clear_flag function is not needed here.
> > >> >> >> >
> > >> >> >> > Cannot you pass NULL or empty function pointer as callba=
ck? Or what was
> > >> >> >> > reason to do that flag clearing at "two places"?
> > >> >> >>
> > >> >> >> acpi_os_execute doesn't wait for the callback to be execut=
ed, so
> > >> >> >> I can't clear the flag from rbtn_resume.
> > >> >> >
> > >> >> > acpi_os_execute calls callback asynchronously later? Or wha=
t exactly do it?
> > >> >>
> > >> >> In this case, it adds the callback to the kacpi_notify_wq wor=
kqueue
> > >> >> for deferred execution.
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
> > >> >
> > >> > Also, since there is no indication to the user that a failure =
occurs, this
> > >> > function is basically equivalent in the success and failure ca=
se (the success
> > >> > case is just slower).
> > >> >
> > >> > Am I missing something critical here?
> > >>
> > >> Maybe saying that we are waiting for the extra event is not real=
ly
> > >> correct. Since the extra ACPI notification is processed by means
> > >> of kacpi_notify_wq, or at least that's my understanding, our cal=
lback
> > >> is likely going to be executed after we received the extra ACPI
> > >> notification. This was suggested by Rafael [2].
> > >
> > > I see, the workqueue is run after the event is issued. If that's =
the case, how
> > > are we ensured that it will get cleared? Isn't it only some syste=
ms that have
> > > this problem?
> > >
> > > What happens to the systems that do not send this event at resume=
? Does the
> > > suspended flag remain set?
> >
> > The callback should be executed as long as acpi_os_execute doesn't
> > return an error. If the BIOS doesn't send the extra notification,
> > we uselessly wait for whatever was queued before our callback.
> >
> > On my laptop, the interval between the call to acpi_os_execute and
> > the callback execution is ~200ms (rough existimation using a couple
> > of printks), so not really noticeable. It might be more on some oth=
er
> > systems, but I doubt anyone would notice.
>
> And what triggers the callback then? Some unrelated event triggering =
the
> workqueue I presume? I don't care to tie the masking of these events =
to
> unrelated ones. What guarantee do we have that they will fire? Is it =
possible
> for that workqueue to be otherwise empty and not get triggered, effec=
tively
> disabling our events?

acpi_os_execute creates a work item for the callback and adds it
to the kacpi_notify_wq workqueue. Nothing triggers it, it just
waits for its turn.

The BIOS sends the notification immediately at resume, so the work
item that handles it is likely going to get queued before our work
item. In my case, the notification is handled even before dell-rbtn
is resumed (and that's why the original worked fine for me).

> >
> > >>
> > >> The problem with setting the flag directly from the resume callb=
ack
> > >> is that the extra notification might arrive after we cleared the
> > >> flag, causing spurious input events [1].
> > >>
> > >> [1] http://article.gmane.org/gmane.linux.drivers.platform.x86.de=
vel/8001
> > >> [2] http://article.gmane.org/gmane.linux.drivers.platform.x86.de=
vel/8201
> > >>
>
> --
> Darren Hart
> Intel Open Source Technology Center
