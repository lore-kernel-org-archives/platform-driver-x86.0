From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Sat, 12 Mar 2016 00:30:37 +0100
Message-ID: <CABFtUbRudWJZfvD2d7L6XZRrQMy97foB5BaWE+PjCiBLCMewZw@mail.gmail.com>
References: <5628C069.8040902@gmail.com>
	<4630444.0gh5fv1p6X@vostro.rjw.lan>
	<CABFtUbR56RzXRyoO_WB-Td_J92VOfBxTcg8YQgZfdt8LWb0vPw@mail.gmail.com>
	<4495389.z2Ik1rf6oK@vostro.rjw.lan>
	<20160107223529.GL11364@pali>
	<20160311094506.GC8413@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:32934 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751369AbcCKXai convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Mar 2016 18:30:38 -0500
Received: by mail-qg0-f51.google.com with SMTP id t4so111486382qge.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Mar 2016 15:30:37 -0800 (PST)
In-Reply-To: <20160311094506.GC8413@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

2016-03-11 10:45 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
> On Thursday 07 January 2016 23:35:29 Pali Roh=C3=A1r wrote:
>> On Tuesday 22 December 2015 01:20:30 Rafael J. Wysocki wrote:
>> > On Monday, December 21, 2015 04:34:58 PM Gabriele Mazzotta wrote:
>> > > 2015-12-20 17:21 GMT+01:00 Rafael J. Wysocki <rjw@rjwysocki.net>=
:
>> > > > On Friday, December 18, 2015 04:12:08 PM Darren Hart wrote:
>> > > >> On Fri, Nov 20, 2015 at 03:44:25PM +0100, Pali Roh=C3=A1r wro=
te:
>> > > >> > On Friday 23 October 2015 20:03:19 Gabriele Mazzotta wrote:
>> > > >> > > On 23/10/2015 13:14, Pali Roh=C3=A1r wrote:
>> > > >> > > >On Friday 23 October 2015 11:47:25 Gabriele Mazzotta wro=
te:
>> > > >> > > >>>In my opinion it is better to ignore user key press af=
ter resume, if it
>> > > >> > > >>>fix our problem. Better as false-positive event.
>> > > >> > > >>
>> > > >> > > >>The following appears to work really well. The notifica=
tion arrives
>> > > >> > > >>before rbtn_resume() has been executed, so the extra ev=
ent is ignored.
>> > > >> > > >>
>> > > >> > > >>diff --git a/drivers/platform/x86/dell-rbtn.c
>> > > >> > > >>b/drivers/platform/x86/dell-rbtn.c
>> > > >> > > >>index cd410e3..1d64b72 100644
>> > > >> > > >>--- a/drivers/platform/x86/dell-rbtn.c
>> > > >> > > >>+++ b/drivers/platform/x86/dell-rbtn.c
>> > > >> > > >>@@ -28,6 +28,7 @@ struct rbtn_data {
>> > > >> > > >>        enum rbtn_type type;
>> > > >> > > >>        struct rfkill *rfkill;
>> > > >> > > >>        struct input_dev *input_dev;
>> > > >> > > >>+       bool suspended;
>> > > >> > > >>  };
>> > > >> > > >>
>> > > >> > > >>
>> > > >> > > >>@@ -220,9 +221,33 @@ static const struct acpi_device_id=
 rbtn_ids[] =3D {
>> > > >> > > >>        { "", 0 },
>> > > >> > > >>  };
>> > > >> > > >>
>> > > >> > > >>+#ifdef CONFIG_PM_SLEEP
>> > > >> > > >>+static int rbtn_suspend(struct device *dev)
>> > > >> > > >>+{
>> > > >> > > >>+       struct acpi_device *device =3D to_acpi_device(d=
ev);
>> > > >> > > >>+       struct rbtn_data *rbtn_data =3D acpi_driver_dat=
a(device);
>> > > >> > > >>+
>> > > >> > > >>+       rbtn_data->suspended =3D true;
>> > > >> > > >>+
>> > > >> > > >>+       return 0;
>> > > >> > > >>+}
>> > > >> > > >>+
>> > > >> > > >>+static int rbtn_resume(struct device *dev)
>> > > >> > > >>+{
>> > > >> > > >>+       struct acpi_device *device =3D to_acpi_device(d=
ev);
>> > > >> > > >>+       struct rbtn_data *rbtn_data =3D acpi_driver_dat=
a(device);
>> > > >> > > >>+
>> > > >> > > >>+       rbtn_data->suspended =3D false;
>> > > >> > > >>+
>> > > >> > > >>+       return 0;
>> > > >> > > >>+}
>> > > >> > > >>+#endif
>> > > >> > > >>+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rb=
tn_resume);
>> > > >> > > >>+
>> > > >> > > >>  static struct acpi_driver rbtn_driver =3D {
>> > > >> > > >>        .name =3D "dell-rbtn",
>> > > >> > > >>        .ids =3D rbtn_ids,
>> > > >> > > >>+       .drv.pm =3D &rbtn_pm_ops,
>> > > >> > > >>        .ops =3D {
>> > > >> > > >>                .add =3D rbtn_add,
>> > > >> > > >>                .remove =3D rbtn_remove,
>> > > >> > > >>@@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi=
_device *device, u32
>> > > >> > > >>event)
>> > > >> > > >>  {
>> > > >> > > >>        struct rbtn_data *rbtn_data =3D device->driver_=
data;
>> > > >> > > >>
>> > > >> > > >>+       if (rbtn_data->suspended)
>> > > >> > > >>+               return;
>> > > >> > > >>+
>> > > >> > > >>        if (event !=3D 0x80) {
>> > > >> > > >>                dev_info(&device->dev, "Received unknow=
n event (0x%x)\n",
>> > > >> > > >>                         event);
>> > > >> > > >>
>> > > >> > > >
>> > > >> > > >Great, but is not there a better way to turn off .notify=
 ACPI function
>> > > >> > > >when that ACPI device is suspended?
>> > > >> > > >
>> > > >> > > >Is not this ACPI device driver bug that it allows to cal=
l .notify method
>> > > >> > > >even if device is suspended?
>> > > >> > >
>> > > >> > > I was surprised this worked, I was assuming that nothing =
could run
>> > > >> > > before the resume callback, but I was wrong. I think it m=
akes sense to
>> > > >> > > treat ACPI devices in a special way, but I really don't k=
now, we need
>> > > >> > > someone more knowledgeable to answer these questions. How=
ever, while I
>> > > >> > > was trying to figure things out, I stumbled upon the foll=
owing:
>> > > >> > > e71eeb2a6bcc ("ACPI / button: Do not propagate wakeup-fro=
m-suspend events").
>> > > >> >
>> > > >> > Gabriele, are you going to send this patch?
>> > > >> >
>> > > >> > I think that patch should be OK as it drop events when devi=
ce is in
>> > > >> > suspend state (when it should not receive events)...
>> > > >> >
>> > > >> > Darren, what do you think about it?
>> > > >> >
>> > > >>
>> > > >> Sorry, this one has been difficult for me to track, but it's =
clearly an issue,
>> > > >> and new systems are experiencing it as well.
>> > > >>
>> > > >> I'd like to get Rafael's opinion on disabling .notify ACPI fu=
nction while
>> > > >> suspended.
>> > > >>
>> > > >> +Rafael
>> > > >
>> > > > This by far wouldn't be enough, because drivers may install AC=
PI notify
>> > > > handlers by themselves and those are hooked up directly into t=
he ACPICA
>> > > > code.
>> > > >
>> > > > Besides, some drivers may actually want to receive those event=
s while
>> > > > the system is suspending or resuming, so I think this has to b=
e addressed
>> > > > on a per-driver basis.
>> > >
>> > > Hi,
>> > >
>> > > sorry, but I'm not sure I understood everything, so I'll try to
>> > > briefly describe the problem and its current solution.
>> > >
>> > > Currently dell-rbtn listens for the notifications sent to an ACP=
I
>> > > device and for notification sends an input event to userspace.
>> > >
>> > > The problem we have is that some BIOSes send an extra notificati=
on
>> > > on resume and therefore we send an extra input event.
>> > >
>> > > What we want to do is to ignore this ACPI notification without
>> > > affecting the systems whose BIOS does not send this extra
>> > > notification. We know that not all of them send this notificatio=
n.
>> > >
>> > > What I noticed is that the extra notification is issued by the _=
WAK
>> > > method and always arrives before dell-rbtn has been resumed, so
>> > > what I did is to add a flag that is set by the suspend and resum=
e
>> > > callbacks of the device driver.
>> >
>> > ACPI notifications are delivered asynchronously to drivers, so you=
'd
>> > need to flush kacpi_notify_wq in .resume().  That would make the d=
river
>> > wait for things it really doesn't need to wait for, so it would no=
t be
>> > super-optimal.
>> >
>> > > What we were wondering is whether this would be enough or we
>> > > need to do something different, e.g. ignore all the notification=
s that
>> > > arrived X seconds after the execution of the resume callback.
>> >
>> > I'd try something like setting the flag from .suspend() and then a=
dding
>> > a work item to clear it to kacpi_notify_wq from .resume().  Then y=
ou'll
>> > know that all of the pending notifications have been processed bef=
ore
>> > your flag is cleared.
>> >
>> > That would require a new helper for adding work items to kacpi_not=
ify_wq
>> > from drivers, but it shouldn't be too difficult to create one.
>> >
>> > Thanks,
>> > Rafael
>> >
>>
>> Hi all! Is there any progress or new version of this patch?
>>
>
> Gabriele, Darren, Alex... was this problem fixed? Or what is current =
state?

As far as I know, there was no progress. I'm now going to try what
Rafael suggested and see what I can do.

> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
