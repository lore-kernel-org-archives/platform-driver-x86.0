From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/3] ideapad: add hotkey support
Date: Thu, 18 Nov 2010 08:35:58 +0100
Message-ID: <AANLkTim1DKZkCqB1mLg5=7UTd2szCoSS_DSO8v3jHTmy@mail.gmail.com>
References: <1289977165-14802-1-git-send-email-ike.pan@canonical.com>
	<1289977238-15113-1-git-send-email-ike.pan@canonical.com>
	<20101117212943.GA6661@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:62328 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975Ab0KRHf7 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Nov 2010 02:35:59 -0500
In-Reply-To: <20101117212943.GA6661@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ike Panhc <ike.pan@canonical.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, David Woodhouse <dwmw2@infradead.org>

On Wed, Nov 17, 2010 at 10:29 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Wed, Nov 17, 2010 at 03:00:38PM +0800, Ike Panhc wrote:
>> Hotkey enabled by this patch:
>> =C2=A0 Fn+F3: Video mode switch
>> =C2=A0 Fn+F5: software rfkill for wifi
>>
>> For some ideapad when push Fn+F3, hardware generates Super-P keys, t=
hose key
>> will not be enabled by this patch.
>>
>> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
>> ---
>> =C2=A0drivers/platform/x86/ideapad-laptop.c | =C2=A0 74 ++++++++++++=
+++++++++++++++++++++
>> =C2=A01 files changed, 74 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platfor=
m/x86/ideapad-laptop.c
>> index d75c21f..d397034 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -28,6 +28,8 @@
>> =C2=A0#include <acpi/acpi_drivers.h>
>> =C2=A0#include <linux/rfkill.h>
>> =C2=A0#include <linux/platform_device.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>>
>> =C2=A0#define IDEAPAD_DEV_CAMERA =C2=A0 0
>> =C2=A0#define IDEAPAD_DEV_WLAN =C2=A0 =C2=A0 1
>> @@ -39,6 +41,7 @@ struct ideapad_private {
>> =C2=A0 =C2=A0 =C2=A0 acpi_handle handle;
>> =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfk[5];
>> =C2=A0 =C2=A0 =C2=A0 struct platform_device *platform_device;
>> + =C2=A0 =C2=A0 struct input_dev *inputdev;
>> =C2=A0} *ideapad_priv;
>>
>> =C2=A0static struct {
>> @@ -325,6 +328,68 @@ static void ideapad_platform_exit(void)
>> =C2=A0}
>> =C2=A0/* the above is platform device */
>>
>> +/*
>> + * input device
>> + */
>> +static const struct key_entry ideapad_keymap[] =3D {
>> + =C2=A0 =C2=A0 { KE_KEY, 0x06, { KEY_SWITCHVIDEOMODE } },
>> + =C2=A0 =C2=A0 { KE_KEY, 0x0D, { KEY_WLAN } },
>> + =C2=A0 =C2=A0 { KE_END, 0 },
>> +};
>> +
>> +static int ideapad_input_init(void)
>
> __devinit?
>
>> +{
>> + =C2=A0 =C2=A0 struct input_dev *inputdev;
>> + =C2=A0 =C2=A0 int error;
>> +
>> + =C2=A0 =C2=A0 inputdev =3D input_allocate_device();
>> + =C2=A0 =C2=A0 if (!inputdev) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("Unable to alloc=
ate input device\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 inputdev->name =3D "Ideapad extra buttons";
>> + =C2=A0 =C2=A0 inputdev->phys =3D "ideapad/input0";
>> + =C2=A0 =C2=A0 inputdev->id.bustype =3D BUS_HOST;
>> + =C2=A0 =C2=A0 inputdev->dev.parent =3D &ideapad_priv->platform_dev=
ice->dev;
>> +
>> + =C2=A0 =C2=A0 error =3D sparse_keymap_setup(inputdev, ideapad_keym=
ap, NULL);
>> + =C2=A0 =C2=A0 if (error) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Unable to setup =
input device keymap\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_free_dev;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 error =3D input_register_device(inputdev);
>> + =C2=A0 =C2=A0 if (error) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Unable to regist=
er input device\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_free_keymap;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 ideapad_priv->inputdev =3D inputdev;
>
> Why don't you pass ideapad_priv in as an argument instead of relying =
on
> global. I know that there can only be one, but then why do you have a
> structure?

That may allow to remove the global later, like we did on
eeepc-laptop/asus-laptop.

>> + =C2=A0 =C2=A0 return 0;
>> +
>> +err_free_keymap:
>> + =C2=A0 =C2=A0 sparse_keymap_free(inputdev);
>> +err_free_dev:
>> + =C2=A0 =C2=A0 input_free_device(inputdev);
>> + =C2=A0 =C2=A0 return error;
>> +}
>> +
>> +static void ideapad_input_exit(void)
>
> __devexit? The rest of the driver might user these markups as well.
>
>> +{
>> + =C2=A0 =C2=A0 if (ideapad_priv->inputdev) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sparse_keymap_free(ideap=
ad_priv->inputdev);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input_unregister_device(=
ideapad_priv->inputdev);
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 ideapad_priv->inputdev =3D NULL;
>
> You fail driver initialization when ideapad_input_init() fails so the=
re
> is no point in checking whether ideapad_priv->inputdev is null or not=
=2E
>
> Otherwise looks good from input POV.
>
> Thanks.



--=20
Corentin Chary
http://xf.iksaif.net
