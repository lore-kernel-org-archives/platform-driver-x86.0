From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Thu, 24 Mar 2016 12:24:56 +0100
Message-ID: <CABFtUbTy+zWgGOk4C998yNn=A91VF5o7ye5piTN5CuSBFKW9_g@mail.gmail.com>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
	<1458341063-8753-1-git-send-email-gabriele.mzt@gmail.com>
	<20160321121736.GH8413@pali>
	<CABFtUbRxqJfd=CruaVnQPMbRo1ZaK=NX8wO7kwRh6pDN4s0t2g@mail.gmail.com>
	<20160324093915.GZ8413@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160324093915.GZ8413@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

2016-03-24 10:39 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
> On Monday 21 March 2016 16:13:34 Gabriele Mazzotta wrote:
>> 2016-03-21 13:17 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
>> > On Friday 18 March 2016 23:44:23 Gabriele Mazzotta wrote:
>> >> +#ifdef CONFIG_PM_SLEEP
>> >> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *context=
)
>> >> +{
>> >> +     struct rbtn_data *rbtn_data =3D context;
>> >> +
>> >> +     rbtn_data->suspended =3D false;
>> >> +}
>> >> +
>> >> +static int rbtn_suspend(struct device *dev)
>> >> +{
>> >> +     struct acpi_device *device =3D to_acpi_device(dev);
>> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
>> >> +
>> >> +     rbtn_data->suspended =3D true;
>> >> +
>> >> +     return 0;
>> >> +}
>> >> +
>> >> +static int rbtn_resume(struct device *dev)
>> >> +{
>> >> +     struct acpi_device *device =3D to_acpi_device(dev);
>> >> +     struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
>> >> +     acpi_status status;
>> >> +
>> >> +     /*
>> >> +      * Clear the flag only after we received the extra
>> >> +      * ACPI notification.
>> >> +      */
>> >> +     status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
>> >> +                      rbtn_acpi_clear_flag, rbtn_data);
>> >> +     if (ACPI_FAILURE(status))
>> >> +             rbtn_data->suspended =3D false;
>> >
>> > I case when acpi_os_execute success it calls rbtn_acpi_clear_flag,
>> > right? And that will set suspended to false. When acpi_os_execute =
fails,
>> > then it set suspended too to false... Then whole acpi_os_execute d=
oing
>> > just "barrier" after which suspended flag can be set to false. So =
I
>> > think rbtn_acpi_clear_flag function is not needed here.
>> >
>> > Cannot you pass NULL or empty function pointer as callback? Or wha=
t was
>> > reason to do that flag clearing at "two places"?
>>
>> acpi_os_execute doesn't wait for the callback to be executed, so
>> I can't clear the flag from rbtn_resume.
>
> acpi_os_execute calls callback asynchronously later? Or what exactly =
do it?

In this case, it adds the callback to the kacpi_notify_wq workqueue
for deferred execution.

> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
