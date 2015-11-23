From: Andrei Borzenkov <arvidjaar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Mon, 23 Nov 2015 19:23:29 +0300
Message-ID: <56533D81.7070406@gmail.com>
References: <5650BE8E.2080506@gmail.com> <201511212008.46761@pali>
 <5650D693.6050808@gmail.com> <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali> <56532D6B.8040407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:35364 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752447AbbKWQXd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 11:23:33 -0500
Received: by lbbsy6 with SMTP id sy6so98596375lbb.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2015 08:23:31 -0800 (PST)
In-Reply-To: <56532D6B.8040407@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, dvhart@infradead.org

23.11.2015 18:14, Gabriele Mazzotta =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 23/11/2015 15:50, Pali Roh=C3=A1r wrote:
>> On Sunday 22 November 2015 09:23:19 Andrei Borzenkov wrote:
>>> 21.11.2015 23:39, Andrei Borzenkov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 21.11.2015 22:08, Pali Roh=C3=A1r =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On Saturday 21 November 2015 19:57:18 Andrei Borzenkov wrote:
>>>>>> After installing 4.2 on Dell Latitude E5450 I found that wireles=
s was
>>>>>> disabled every second resume from suspend to RAM. Blacklisting
>>>>>> dell-rbtn "fixed" it.
>>>>>>
>>>>>> This is probably the same as discussed in this Arch forum and re=
lated
>>>>>> bug report: https://bbs.archlinux.org/viewtopic.php?id=3D203404.=
 I
>>>>>> myself hit it on Ubuntu.
>>>>>>
>>>>>> I am not familiar with other models, but E5450 does have DELLABC=
E and
>>>>>> so is using dell-rbtn driver.
>>>>>>
>>>>>> I am happy to test patches if need. Please let me know if formal=
 bug
>>>>>> report is required.
>>>>>>
>>>>>> -andrei
>>>>>
>>>>> Hi Andrei!
>>>>>
>>>>> About five hours ago Gabriele sent patch which fixing this proble=
m to
>>>>> LKML. You can find it on: https://lkml.org/lkml/2015/11/21/57
>>>>>
>>>>> Can you test that patch and confirm it fix also for you?
>>>>>
>>>>
>>>> Yes, it does.
>>>
>>> Unfortunately it was too early. Today after resume I again got disa=
ble
>>> radio, and also several later attempts to suspend/resume. Then last
>>> time I
>>> suddenly got radio working again after resume.
>>>
>>> Patch looks racy; there is no guarantee we get notification before
>>> resetting
>>> in suspend flag.
>>>
>>
>> Gabriele, any idea how to fix this?
>>
>
> I can't think of anything other than ignoring notifications that arri=
ves
> within X seconds after the execution of the resume callback.
> Unfortunately, we have no idea on how to detect systems that misbehav=
e
> and creating a blacklist is not a feasible solution.
>
> Something such as the following should work, but maybe it's not a nic=
e
> solution.
>

I looked at what dell-rbtn does. My system (Latitude E5450) has RBTN of=
=20
type TOGGLE. In this case both del-laptop hooks itself into i8042 and=20
dell-rbtn delivers KEY_RFKILL event to input susbsystem. IOW dell-rbtn=20
looks completely redundant in this configuration.

Can we detect that rfkill toggle is already avaiable via normal keyboar=
d=20
and not activate dell-rbtn in this case?

> ---
>   drivers/platform/x86/dell-rbtn.c | 36
> ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/drivers/platform/x86/dell-rbtn.c
> b/drivers/platform/x86/dell-rbtn.c
> index cd410e3..c03062d 100644
> --- a/drivers/platform/x86/dell-rbtn.c
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -18,6 +18,8 @@
>   #include <linux/rfkill.h>
>   #include <linux/input.h>
>
> +#define EXTRA_NOTIFICATION_TIMEOUT     (2 * HZ);
> +
>   enum rbtn_type {
>          RBTN_UNKNOWN,
>          RBTN_TOGGLE,
> @@ -28,6 +30,8 @@ struct rbtn_data {
>          enum rbtn_type type;
>          struct rfkill *rfkill;
>          struct input_dev *input_dev;
> +       bool suspended;
> +       unsigned long ignore_window;
>   };
>
>
> @@ -220,9 +224,34 @@ static const struct acpi_device_id rbtn_ids[] =3D=
 {
>          { "", 0 },
>   };
>
> +#ifdef CONFIG_PM_SLEEP
> +static int rbtn_suspend(struct device *dev)
> +{
> +       struct acpi_device *device =3D to_acpi_device(dev);
> +       struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> +
> +       rbtn_data->suspended =3D true;
> +
> +       return 0;
> +}
> +
> +static int rbtn_resume(struct device *dev)
> +{
> +       struct acpi_device *device =3D to_acpi_device(dev);
> +       struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> +
> +       rbtn_data->suspended =3D false;
> +       rbtn_data->ignore_window =3D jiffies + EXTRA_NOTIFICATION_TIM=
EOUT;
> +
> +       return 0;
> +}
> +#endif
> +static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
> +
>   static struct acpi_driver rbtn_driver =3D {
>          .name =3D "dell-rbtn",
>          .ids =3D rbtn_ids,
> +       .drv.pm =3D &rbtn_pm_ops,
>          .ops =3D {
>                  .add =3D rbtn_add,
>                  .remove =3D rbtn_remove,
> @@ -383,6 +412,13 @@ static int rbtn_remove(struct acpi_device *devic=
e)
>   static void rbtn_notify(struct acpi_device *device, u32 event)
>   {
>          struct rbtn_data *rbtn_data =3D device->driver_data;
> +       bool ignore_notification =3D rbtn_data->suspended ||
> +                       time_before(jiffies, rbtn_data->ignore_window=
);
> +
> +       if (ignore_notification) {
> +               dev_dbg(&device->dev, "ACPI notification ignored\n");
> +               return;
> +       }
>
>          if (event !=3D 0x80) {
>                  dev_info(&device->dev, "Received unknown event (0x%x=
)\n",
