From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Mon, 28 Mar 2016 19:58:09 +0200
Message-ID: <CABFtUbSH1hm4uYGwDRNmntYc567Sh7D+TakUse=KvaqKL8sxrw@mail.gmail.com>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
	<1458341063-8753-1-git-send-email-gabriele.mzt@gmail.com>
	<20160321121736.GH8413@pali>
	<CABFtUbRxqJfd=CruaVnQPMbRo1ZaK=NX8wO7kwRh6pDN4s0t2g@mail.gmail.com>
	<20160324093915.GZ8413@pali>
	<CABFtUbTy+zWgGOk4C998yNn=A91VF5o7ye5piTN5CuSBFKW9_g@mail.gmail.com>
	<20160328173309.GA26086@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f68.google.com ([209.85.192.68]:35754 "EHLO
	mail-qg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097AbcC1R6L convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2016 13:58:11 -0400
In-Reply-To: <20160328173309.GA26086@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2016-03-28 19:33 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> On Thu, Mar 24, 2016 at 12:24:56PM +0100, Gabriele Mazzotta wrote:
>> 2016-03-24 10:39 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
>> > On Monday 21 March 2016 16:13:34 Gabriele Mazzotta wrote:
>> >> 2016-03-21 13:17 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>=
:
>> >> > On Friday 18 March 2016 23:44:23 Gabriele Mazzotta wrote:
>> >> >> +#ifdef CONFIG_PM_SLEEP
>> >> >> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *cont=
ext)
>> >> >> +{
>> >> >> +     struct rbtn_data *rbtn_data =3D context;
>> >> >> +
>> >> >> +     rbtn_data->suspended =3D false;
>> >> >> +}
>> >> >> +
>> >> >> +static int rbtn_suspend(struct device *dev)
>> >> >> +{
>> >> >> +     struct acpi_device *device =3D to_acpi_device(dev);
>> >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(device)=
;
>> >> >> +
>> >> >> +     rbtn_data->suspended =3D true;
>> >> >> +
>> >> >> +     return 0;
>> >> >> +}
>> >> >> +
>> >> >> +static int rbtn_resume(struct device *dev)
>> >> >> +{
>> >> >> +     struct acpi_device *device =3D to_acpi_device(dev);
>> >> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(device)=
;
>> >> >> +     acpi_status status;
>> >> >> +
>> >> >> +     /*
>> >> >> +      * Clear the flag only after we received the extra
>> >> >> +      * ACPI notification.
>> >> >> +      */
>> >> >> +     status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
>> >> >> +                      rbtn_acpi_clear_flag, rbtn_data);
>> >> >> +     if (ACPI_FAILURE(status))
>> >> >> +             rbtn_data->suspended =3D false;
>> >> >
>> >> > I case when acpi_os_execute success it calls rbtn_acpi_clear_fl=
ag,
>> >> > right? And that will set suspended to false. When acpi_os_execu=
te fails,
>> >> > then it set suspended too to false... Then whole acpi_os_execut=
e doing
>> >> > just "barrier" after which suspended flag can be set to false. =
So I
>> >> > think rbtn_acpi_clear_flag function is not needed here.
>> >> >
>> >> > Cannot you pass NULL or empty function pointer as callback? Or =
what was
>> >> > reason to do that flag clearing at "two places"?
>> >>
>> >> acpi_os_execute doesn't wait for the callback to be executed, so
>> >> I can't clear the flag from rbtn_resume.
>> >
>> > acpi_os_execute calls callback asynchronously later? Or what exact=
ly do it?
>>
>> In this case, it adds the callback to the kacpi_notify_wq workqueue
>> for deferred execution.
>
> +Rafael for context/advice on the use of acpi_os_execute here.
>
> This is true, but a quick scan through that call path doesn't tell me=
 why we
> would need to call it here instead of just setting rbtn_data->suspend=
ed =3D false.
> The comment suggests waiting for the event, but is that what this is =
doing? It
> appears to me to be immediately scheduling the function to a work que=
ue, not
> waiting for the event notifier.
>
> Also, since there is no indication to the user that a failure occurs,=
 this
> function is basically equivalent in the success and failure case (the=
 success
> case is just slower).
>
> Am I missing something critical here?

Maybe saying that we are waiting for the extra event is not really
correct. Since the extra ACPI notification is processed by means
of kacpi_notify_wq, or at least that's my understanding, our callback
is likely going to be executed after we received the extra ACPI
notification. This was suggested by Rafael [2].

The problem with setting the flag directly from the resume callback
is that the extra notification might arrive after we cleared the
flag, causing spurious input events [1].

[1] http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/800=
1
[2] http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/820=
1

>
>>
>> > --
>> > Pali Roh=C3=A1r
>> > pali.rohar@gmail.com
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center
