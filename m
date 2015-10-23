From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Fri, 23 Oct 2015 11:47:25 +0200
Message-ID: <562A022D.1020302@gmail.com>
References: <20151022074937.GA2581@malice.jf.intel.com>
 <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
 <20151022085117.GQ15219@pali> <5628BDF8.9030506@gmail.com>
 <20151022105018.GX15219@pali> <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7> <5628E812.2070708@gmail.com>
 <20151022141710.GD15219@pali> <56297148.6060605@gmail.com>
 <20151023090027.GG15219@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:36016 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911AbbJWJr2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Oct 2015 05:47:28 -0400
Received: by wicfx6 with SMTP id fx6so23507421wic.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2015 02:47:26 -0700 (PDT)
In-Reply-To: <20151023090027.GG15219@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On 23/10/2015 11:00, Pali Roh=C3=A1r wrote:
> On Friday 23 October 2015 01:29:12 Gabriele Mazzotta wrote:
>> On 22/10/2015 16:17, Pali Roh=C3=A1r wrote:
>>> On Thursday 22 October 2015 15:43:46 Gabriele Mazzotta wrote:
>>>> It's the F2 key. Depending on the value passed to the RBTN, it act=
s as
>>>> hw slider or sw toggle.
>>>
>>> Ok, we have differences in terminology and everybody understood thi=
s
>>> problem differently.
>>>
>>>
>>> To correct this situation, first define about what we are talking a=
bout:
>>>
>>> * HW slider: It is hardware slider switch which as two positions ON=
 and
>>>               OFF. Position exactly defines hardware state of wirel=
ess
>>>               radio devices. Not possible (or should not) to remap.
>>>
>>> * SW hotkey toggle button: It is button or key, act in same way as =
any
>>>                             other key on keyboard, controlled by SW
>>>                             (if all drivers are installed, etc).
>>
>> Sorry for the confusion, I know I've been using "HW slider" improper=
ly,
>> but I thought it was clear. Although it's a button, the BIOS makes i=
t
>> behave like an hardware slider when configured to behave as such
>> through RBTN. The state of radio devices is changed by the BIOS when
>> the function key is pressed, this state is never changed until the u=
ser
>> presses the function key again (at least if we ignore the fact that =
we
>> can perform some special SMI calls), this state is saved in the EC a=
nd
>> both userspace and the kernel don't receive any event other than rfk=
ill
>> events (if we don't consider the WMI events ignored by dell-wmi).
>>
>> I think this behavior is closer to the one of an hardware slider
>> rather than the one of a software hotkey, which I can still request
>> through the RBTN method.
>>
>>> Next I think that this hypothesis is truth:
>>>
>>> * Every machine on which is binded ACPI dell-rbtn.ko driver has eit=
her
>>>    HW slider or SW toggle. Not both!
>>>
>>> Correct?
>>
>> It depends on how you classify my laptop. The behavior changes
>> completely depending on the value passed to RBTN.
>>
>> Obviously it can behave either as HW slider (again, not an actual
>> slider) or SW toggle, but I can choose between the two.
>>
>
> If it has keyboard button and not switch with visible two positions, =
it
> is "toggle button" (from HW perspective).

Yes, sorry for the confusion.

>>> Then follows my expected behaviour for HW slider:
>>>
>>> * State of HW slider position is exported by kernel as rfkill devic=
e.
>>>
>>> * In any case HW slider position (ON/OFF) match hard rfkill state d=
evice
>>>    (rfkill device state is correct also after resume, wake from hib=
ernate).
>>>
>>> * Immediately after user change position of HW slider, rfkill devic=
e
>>>    reflect it.
>>>
>>>
>>> And then expected behaviour for SW toggle button:
>>>
>>> * Every time when user press it, kernel just send input event "wire=
less
>>>    key pressed" to userspace.
>>>
>>> * Kernel does not send event "wireless key pressed" when user did n=
ot
>>>    pressed it (e.g. after resuming from suspend, waking from hibern=
ate).
>>
>> Yes, but we don't know exactly when the user pressed the button. As =
I
>> said, the BIOS might send an event that triggers an input event even=
 if
>> the user didn't press anything.
>>
>
> Ok. This is strange if BIOS send event "changed" even if it was not
> really changed.
>
> Is BIOS sending this incorrect event only after waking from suspend? =
Or
> it is also randomly at any time?

I looked at the ACPI table. It happens only on resume (or when the user
presses the function key).

> If we know that it send incorrectly only after suspend, we can drop t=
his
> event. But if it is completely randomly, we probably cannot do anythi=
ng
> (and just do not use driver in this case).
>
>>> * Kernel should provide rfkill devices to "soft" block appropriate
>>>    wireless cards.
>>>
>>> * Make sure that BIOS/firmware in any case does not change radio rf=
kill
>>>    state of any wireless card and wireless cards stay in same state=
 as
>>>    before (no enable/disable or changing hard/soft rfkill state).
>>
>> This is the problem. We can't differentiate notifications sent to
>> DELLABCE/DELLRBTN by the BIOS because it felt like it was right to d=
o so
>> (e.g. after resuming) or because the user pressed the function key.
>>
>
> In my opinion it is better to ignore user key press after resume, if =
it
> fix our problem. Better as false-positive event.

The following appears to work really well. The notification arrives
before rbtn_resume() has been executed, so the extra event is ignored.

diff --git a/drivers/platform/x86/dell-rbtn.c=20
b/drivers/platform/x86/dell-rbtn.c
index cd410e3..1d64b72 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -28,6 +28,7 @@ struct rbtn_data {
  	enum rbtn_type type;
  	struct rfkill *rfkill;
  	struct input_dev *input_dev;
+	bool suspended;
  };


@@ -220,9 +221,33 @@ static const struct acpi_device_id rbtn_ids[] =3D =
{
  	{ "", 0 },
  };

+#ifdef CONFIG_PM_SLEEP
+static int rbtn_suspend(struct device *dev)
+{
+	struct acpi_device *device =3D to_acpi_device(dev);
+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
+
+	rbtn_data->suspended =3D true;
+
+	return 0;
+}
+
+static int rbtn_resume(struct device *dev)
+{
+	struct acpi_device *device =3D to_acpi_device(dev);
+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
+
+	rbtn_data->suspended =3D false;
+
+	return 0;
+}
+#endif
+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
+
  static struct acpi_driver rbtn_driver =3D {
  	.name =3D "dell-rbtn",
  	.ids =3D rbtn_ids,
+	.drv.pm =3D &rbtn_pm_ops,
  	.ops =3D {
  		.add =3D rbtn_add,
  		.remove =3D rbtn_remove,
@@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi_device *device,=
=20
u32 event)
  {
  	struct rbtn_data *rbtn_data =3D device->driver_data;

+	if (rbtn_data->suspended)
+		return;
+
  	if (event !=3D 0x80) {
  		dev_info(&device->dev, "Received unknown event (0x%x)\n",
  			 event);

>>> If last sentence is not truth, then kernel must not send "wireless =
key
>>> pressed" event to userspace and act like "no key was pressed".
>>>
>>>
>>> Make this sense? Or are there any objections about this behaviour?
>>>
>
> So if you are OK with above my description (from previous email), the=
n
> we should fix dell-rbtn to act as it (if it is not implemented alread=
y
> and correctly).
>
> So my next question is: Does dell-rbtn behave like my description? If
> not what are differences and what needs to be fixed?

Everything works as expected. We only have to deal with this extra
notification.
