From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Mon, 21 Dec 2015 16:34:58 +0100
Message-ID: <CABFtUbR56RzXRyoO_WB-Td_J92VOfBxTcg8YQgZfdt8LWb0vPw@mail.gmail.com>
References: <5628C069.8040902@gmail.com>
	<20151120144425.GI29966@pali>
	<20151219001208.GB7244@malice.jf.intel.com>
	<4630444.0gh5fv1p6X@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:35543 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751009AbbLUPe7 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Dec 2015 10:34:59 -0500
Received: by mail-qg0-f49.google.com with SMTP id o11so32273501qge.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Dec 2015 07:34:59 -0800 (PST)
In-Reply-To: <4630444.0gh5fv1p6X@vostro.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

2015-12-20 17:21 GMT+01:00 Rafael J. Wysocki <rjw@rjwysocki.net>:
> On Friday, December 18, 2015 04:12:08 PM Darren Hart wrote:
>> On Fri, Nov 20, 2015 at 03:44:25PM +0100, Pali Roh=C3=A1r wrote:
>> > On Friday 23 October 2015 20:03:19 Gabriele Mazzotta wrote:
>> > > On 23/10/2015 13:14, Pali Roh=C3=A1r wrote:
>> > > >On Friday 23 October 2015 11:47:25 Gabriele Mazzotta wrote:
>> > > >>>In my opinion it is better to ignore user key press after res=
ume, if it
>> > > >>>fix our problem. Better as false-positive event.
>> > > >>
>> > > >>The following appears to work really well. The notification ar=
rives
>> > > >>before rbtn_resume() has been executed, so the extra event is =
ignored.
>> > > >>
>> > > >>diff --git a/drivers/platform/x86/dell-rbtn.c
>> > > >>b/drivers/platform/x86/dell-rbtn.c
>> > > >>index cd410e3..1d64b72 100644
>> > > >>--- a/drivers/platform/x86/dell-rbtn.c
>> > > >>+++ b/drivers/platform/x86/dell-rbtn.c
>> > > >>@@ -28,6 +28,7 @@ struct rbtn_data {
>> > > >>        enum rbtn_type type;
>> > > >>        struct rfkill *rfkill;
>> > > >>        struct input_dev *input_dev;
>> > > >>+       bool suspended;
>> > > >>  };
>> > > >>
>> > > >>
>> > > >>@@ -220,9 +221,33 @@ static const struct acpi_device_id rbtn_i=
ds[] =3D {
>> > > >>        { "", 0 },
>> > > >>  };
>> > > >>
>> > > >>+#ifdef CONFIG_PM_SLEEP
>> > > >>+static int rbtn_suspend(struct device *dev)
>> > > >>+{
>> > > >>+       struct acpi_device *device =3D to_acpi_device(dev);
>> > > >>+       struct rbtn_data *rbtn_data =3D acpi_driver_data(devic=
e);
>> > > >>+
>> > > >>+       rbtn_data->suspended =3D true;
>> > > >>+
>> > > >>+       return 0;
>> > > >>+}
>> > > >>+
>> > > >>+static int rbtn_resume(struct device *dev)
>> > > >>+{
>> > > >>+       struct acpi_device *device =3D to_acpi_device(dev);
>> > > >>+       struct rbtn_data *rbtn_data =3D acpi_driver_data(devic=
e);
>> > > >>+
>> > > >>+       rbtn_data->suspended =3D false;
>> > > >>+
>> > > >>+       return 0;
>> > > >>+}
>> > > >>+#endif
>> > > >>+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resu=
me);
>> > > >>+
>> > > >>  static struct acpi_driver rbtn_driver =3D {
>> > > >>        .name =3D "dell-rbtn",
>> > > >>        .ids =3D rbtn_ids,
>> > > >>+       .drv.pm =3D &rbtn_pm_ops,
>> > > >>        .ops =3D {
>> > > >>                .add =3D rbtn_add,
>> > > >>                .remove =3D rbtn_remove,
>> > > >>@@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi_device=
 *device, u32
>> > > >>event)
>> > > >>  {
>> > > >>        struct rbtn_data *rbtn_data =3D device->driver_data;
>> > > >>
>> > > >>+       if (rbtn_data->suspended)
>> > > >>+               return;
>> > > >>+
>> > > >>        if (event !=3D 0x80) {
>> > > >>                dev_info(&device->dev, "Received unknown event=
 (0x%x)\n",
>> > > >>                         event);
>> > > >>
>> > > >
>> > > >Great, but is not there a better way to turn off .notify ACPI f=
unction
>> > > >when that ACPI device is suspended?
>> > > >
>> > > >Is not this ACPI device driver bug that it allows to call .noti=
fy method
>> > > >even if device is suspended?
>> > >
>> > > I was surprised this worked, I was assuming that nothing could r=
un
>> > > before the resume callback, but I was wrong. I think it makes se=
nse to
>> > > treat ACPI devices in a special way, but I really don't know, we=
 need
>> > > someone more knowledgeable to answer these questions. However, w=
hile I
>> > > was trying to figure things out, I stumbled upon the following:
>> > > e71eeb2a6bcc ("ACPI / button: Do not propagate wakeup-from-suspe=
nd events").
>> >
>> > Gabriele, are you going to send this patch?
>> >
>> > I think that patch should be OK as it drop events when device is i=
n
>> > suspend state (when it should not receive events)...
>> >
>> > Darren, what do you think about it?
>> >
>>
>> Sorry, this one has been difficult for me to track, but it's clearly=
 an issue,
>> and new systems are experiencing it as well.
>>
>> I'd like to get Rafael's opinion on disabling .notify ACPI function =
while
>> suspended.
>>
>> +Rafael
>
> This by far wouldn't be enough, because drivers may install ACPI noti=
fy
> handlers by themselves and those are hooked up directly into the ACPI=
CA
> code.
>
> Besides, some drivers may actually want to receive those events while
> the system is suspending or resuming, so I think this has to be addre=
ssed
> on a per-driver basis.

Hi,

sorry, but I'm not sure I understood everything, so I'll try to
briefly describe the problem and its current solution.

Currently dell-rbtn listens for the notifications sent to an ACPI
device and for notification sends an input event to userspace.

The problem we have is that some BIOSes send an extra notification
on resume and therefore we send an extra input event.

What we want to do is to ignore this ACPI notification without
affecting the systems whose BIOS does not send this extra
notification. We know that not all of them send this notification.

What I noticed is that the extra notification is issued by the _WAK
method and always arrives before dell-rbtn has been resumed, so
what I did is to add a flag that is set by the suspend and resume
callbacks of the device driver.

What we were wondering is whether this would be enough or we
need to do something different, e.g. ignore all the notifications that
arrived X seconds after the execution of the resume callback.

Thanks,
Gabriele

>> Has Dell been involved here?
>
> Not that I know of.
>
> Thanks,
> Rafael
>
