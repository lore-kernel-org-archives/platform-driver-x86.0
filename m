From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Tue, 22 Dec 2015 17:03:24 +0800
Message-ID: <CAJ=jqubXsSpbB9R3ir7N=B4vhUANyAE=c0_-pk3EYrzzw1R=ag@mail.gmail.com>
References: <5628C069.8040902@gmail.com>
	<20151120144425.GI29966@pali>
	<20151219001208.GB7244@malice.jf.intel.com>
	<4630444.0gh5fv1p6X@vostro.rjw.lan>
	<CABFtUbR56RzXRyoO_WB-Td_J92VOfBxTcg8YQgZfdt8LWb0vPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33431 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751826AbbLVJD1 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 Dec 2015 04:03:27 -0500
Received: by mail-lf0-f53.google.com with SMTP id p203so126646256lfa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Dec 2015 01:03:26 -0800 (PST)
In-Reply-To: <CABFtUbR56RzXRyoO_WB-Td_J92VOfBxTcg8YQgZfdt8LWb0vPw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Mon, Dec 21, 2015 at 11:34 PM, Gabriele Mazzotta
<gabriele.mzt@gmail.com> wrote:
> 2015-12-20 17:21 GMT+01:00 Rafael J. Wysocki <rjw@rjwysocki.net>:
>> On Friday, December 18, 2015 04:12:08 PM Darren Hart wrote:
>>> On Fri, Nov 20, 2015 at 03:44:25PM +0100, Pali Roh=C3=A1r wrote:
>>> > On Friday 23 October 2015 20:03:19 Gabriele Mazzotta wrote:
>>> > > On 23/10/2015 13:14, Pali Roh=C3=A1r wrote:
>>> > > >On Friday 23 October 2015 11:47:25 Gabriele Mazzotta wrote:
>>> > > >>>In my opinion it is better to ignore user key press after re=
sume, if it
>>> > > >>>fix our problem. Better as false-positive event.
>>> > > >>
>>> > > >>The following appears to work really well. The notification a=
rrives
>>> > > >>before rbtn_resume() has been executed, so the extra event is=
 ignored.
>>> > > >>
>>> > > >>diff --git a/drivers/platform/x86/dell-rbtn.c
>>> > > >>b/drivers/platform/x86/dell-rbtn.c
>>> > > >>index cd410e3..1d64b72 100644
>>> > > >>--- a/drivers/platform/x86/dell-rbtn.c
>>> > > >>+++ b/drivers/platform/x86/dell-rbtn.c
>>> > > >>@@ -28,6 +28,7 @@ struct rbtn_data {
>>> > > >>        enum rbtn_type type;
>>> > > >>        struct rfkill *rfkill;
>>> > > >>        struct input_dev *input_dev;
>>> > > >>+       bool suspended;
>>> > > >>  };
>>> > > >>
>>> > > >>
>>> > > >>@@ -220,9 +221,33 @@ static const struct acpi_device_id rbtn_=
ids[] =3D {
>>> > > >>        { "", 0 },
>>> > > >>  };
>>> > > >>
>>> > > >>+#ifdef CONFIG_PM_SLEEP
>>> > > >>+static int rbtn_suspend(struct device *dev)
>>> > > >>+{
>>> > > >>+       struct acpi_device *device =3D to_acpi_device(dev);
>>> > > >>+       struct rbtn_data *rbtn_data =3D acpi_driver_data(devi=
ce);
>>> > > >>+
>>> > > >>+       rbtn_data->suspended =3D true;
>>> > > >>+
>>> > > >>+       return 0;
>>> > > >>+}
>>> > > >>+
>>> > > >>+static int rbtn_resume(struct device *dev)
>>> > > >>+{
>>> > > >>+       struct acpi_device *device =3D to_acpi_device(dev);
>>> > > >>+       struct rbtn_data *rbtn_data =3D acpi_driver_data(devi=
ce);
>>> > > >>+
>>> > > >>+       rbtn_data->suspended =3D false;
>>> > > >>+
>>> > > >>+       return 0;
>>> > > >>+}
>>> > > >>+#endif
>>> > > >>+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_res=
ume);
>>> > > >>+
>>> > > >>  static struct acpi_driver rbtn_driver =3D {
>>> > > >>        .name =3D "dell-rbtn",
>>> > > >>        .ids =3D rbtn_ids,
>>> > > >>+       .drv.pm =3D &rbtn_pm_ops,
>>> > > >>        .ops =3D {
>>> > > >>                .add =3D rbtn_add,
>>> > > >>                .remove =3D rbtn_remove,
>>> > > >>@@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi_devic=
e *device, u32
>>> > > >>event)
>>> > > >>  {
>>> > > >>        struct rbtn_data *rbtn_data =3D device->driver_data;
>>> > > >>
>>> > > >>+       if (rbtn_data->suspended)
>>> > > >>+               return;
>>> > > >>+
>>> > > >>        if (event !=3D 0x80) {
>>> > > >>                dev_info(&device->dev, "Received unknown even=
t (0x%x)\n",
>>> > > >>                         event);
>>> > > >>
>>> > > >
>>> > > >Great, but is not there a better way to turn off .notify ACPI =
function
>>> > > >when that ACPI device is suspended?
>>> > > >
>>> > > >Is not this ACPI device driver bug that it allows to call .not=
ify method
>>> > > >even if device is suspended?
>>> > >
>>> > > I was surprised this worked, I was assuming that nothing could =
run
>>> > > before the resume callback, but I was wrong. I think it makes s=
ense to
>>> > > treat ACPI devices in a special way, but I really don't know, w=
e need
>>> > > someone more knowledgeable to answer these questions. However, =
while I
>>> > > was trying to figure things out, I stumbled upon the following:
>>> > > e71eeb2a6bcc ("ACPI / button: Do not propagate wakeup-from-susp=
end events").
>>> >
>>> > Gabriele, are you going to send this patch?
>>> >
>>> > I think that patch should be OK as it drop events when device is =
in
>>> > suspend state (when it should not receive events)...
>>> >
>>> > Darren, what do you think about it?
>>> >
>>>
>>> Sorry, this one has been difficult for me to track, but it's clearl=
y an issue,
>>> and new systems are experiencing it as well.
>>>
>>> I'd like to get Rafael's opinion on disabling .notify ACPI function=
 while
>>> suspended.
>>>
>>> +Rafael
>>
>> This by far wouldn't be enough, because drivers may install ACPI not=
ify
>> handlers by themselves and those are hooked up directly into the ACP=
ICA
>> code.
>>
>> Besides, some drivers may actually want to receive those events whil=
e
>> the system is suspending or resuming, so I think this has to be addr=
essed
>> on a per-driver basis.
>
> Hi,
>
> sorry, but I'm not sure I understood everything, so I'll try to
> briefly describe the problem and its current solution.
>
> Currently dell-rbtn listens for the notifications sent to an ACPI
> device and for notification sends an input event to userspace.
>
> The problem we have is that some BIOSes send an extra notification
> on resume and therefore we send an extra input event.
>
> What we want to do is to ignore this ACPI notification without
> affecting the systems whose BIOS does not send this extra
> notification. We know that not all of them send this notification.
>
> What I noticed is that the extra notification is issued by the _WAK
> method and always arrives before dell-rbtn has been resumed, so
> what I did is to add a flag that is set by the suspend and resume
> callbacks of the device driver.

Sorry I screw up my mail filter and I wasn't aware of this thread until=
 now.

BIOS sends this additional ACPI event for the systems with hardware
switch so a driver can update its state; therefore this is done only
once and therefore ignoring the ACPI event sent to dell rbtn once
after resume is sufficient.

I actually tried a solution similar to Gabriele's patch above (one
with rbtn_suspend and rbtn_resume) a while ago and it works fine.

If there is a conclusion and there is a patch to be tested, I am happy
to test it on wider range (I should be able to find 5+ Dell systems
that runs on dell-rbtn).

>
> What we were wondering is whether this would be enough or we
> need to do something different, e.g. ignore all the notifications tha=
t
> arrived X seconds after the execution of the resume callback.
>
> Thanks,
> Gabriele
>
>>> Has Dell been involved here?
>>
>> Not that I know of.
>>
>> Thanks,
>> Rafael
>>



--=20
Cheers,
Alex Hung
