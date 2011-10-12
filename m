From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] dell-laptop: support Synaptics/Alps touchpad led
Date: Wed, 12 Oct 2011 16:04:30 +0800
Message-ID: <CAMz9Wg93NB7j8FNxphBVLcin3rSetNQvAj810XSVpPD9F5nirg@mail.gmail.com>
References: <1317706110-7199-1-git-send-email-acelan.kao@canonical.com>
	<CAMz9Wg__EA02WBjoamO148a-4Vkyw7cZBYOEsJEVKbFJtO5MjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:37846 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752511Ab1JLIEb convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 12 Oct 2011 04:04:31 -0400
Received: by qyk7 with SMTP id 7so445885qyk.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2011 01:04:31 -0700 (PDT)
In-Reply-To: <CAMz9Wg__EA02WBjoamO148a-4Vkyw7cZBYOEsJEVKbFJtO5MjA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

Dear Matthew,

Could you give me some recommends?
Thanks.

Best regards,
AceLan Kao.

2011/10/4 AceLan Kao <acelan.kao@canonical.com>:
> Sorry, I forgot to checkout the format.
> Please review the new one in this email.
> Thanks.
>
> 2011/10/4 AceLan Kao <acelan.kao@canonical.com>:
>> This patch supports Dell laptop with Synaptics and Alps touchpad chi=
p
>> that with LED to indicate the functionality of touchpad is disabled =
or
>> enabled.
>>
>> The command for touchpad LED is 0x97, and the data 1 means turn on t=
he
>> touchpad LED, 2 means turn it off.
>>
>> BTW, I add dell_quirks to white list those machines that supports th=
is
>> behavior, so that the code won't affect those who don't have a touch=
pad LED
>> machine.
>>
>> We can easily to turn it on/off by
>> =A0 echo 1 > /sys/class/leds/dell-laptop::touchpad/brightness
>> =A0 echo 0 > /sys/class/leds/dell-laptop::touchpad/brightness
>>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>> =A0drivers/platform/x86/dell-laptop.c | =A0 82 +++++++++++++++++++++=
+++++++++++++++
>> =A01 files changed, 82 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x=
86/dell-laptop.c
>> index f31fa4e..e40da74 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -60,6 +60,22 @@ struct calling_interface_structure {
>> =A0 =A0 =A0 =A0struct calling_interface_token tokens[];
>> =A0} __packed;
>>
>> +struct quirk_entry {
>> + =A0 =A0 =A0 u8 touchpad_led;
>> +};
>> +
>> +static struct quirk_entry *quirks;
>> +
>> +static struct quirk_entry quirk_dell_vostro_v130=3D {
>> + =A0 =A0 =A0 .touchpad_led=3D 1,
>> +};
>> +
>> +static int dmi_matched(const struct dmi_system_id *dmi)
>> +{
>> + =A0 =A0 =A0 quirks =3D dmi->driver_data;
>> + =A0 =A0 =A0 return 1;
>> +}
>> +
>> =A0static int da_command_address;
>> =A0static int da_command_code;
>> =A0static int da_num_tokens;
>> @@ -149,6 +165,27 @@ static struct dmi_system_id __devinitdata dell_=
blacklist[] =3D {
>> =A0 =A0 =A0 =A0{}
>> =A0};
>>
>> +static struct dmi_system_id __devinitdata dell_quirks[] =3D {
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "Dell Vostro V130",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VEND=
OR, "Dell Inc."),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_=
NAME, "Vostro V130"),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_dell_vostro_v1=
30,
>> + =A0 =A0 =A0 },
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "Dell Vostro V131",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VEND=
OR, "Dell Inc."),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_=
NAME, "Vostro V131"),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_dell_vostro_v1=
30,
>> + =A0 =A0 =A0 },
>> +};
>> +
>> =A0static struct calling_interface_buffer *buffer;
>> =A0static struct page *bufferpage;
>> =A0static DEFINE_MUTEX(buffer_mutex);
>> @@ -552,6 +589,44 @@ static const struct backlight_ops dell_ops =3D =
{
>> =A0 =A0 =A0 =A0.update_status =A0=3D dell_send_intensity,
>> =A0};
>>
>> +static void touchpad_led_on()
>> +{
>> + =A0 =A0 =A0 int command=3D 0x97;
>> + =A0 =A0 =A0 char data=3D 1;
>> + =A0 =A0 =A0 i8042_command ( &data, command | 1 << 12);
>> +}
>> +
>> +static void touchpad_led_off()
>> +{
>> + =A0 =A0 =A0 int command=3D 0x97;
>> + =A0 =A0 =A0 char data=3D 2;
>> + =A0 =A0 =A0 i8042_command ( &data, command | 1 << 12);
>> +}
>> +
>> +static void touchpad_led_set(struct led_classdev *led_cdev,
>> + =A0 =A0 =A0 enum led_brightness value)
>> +{
>> + =A0 =A0 =A0 if (value > 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 touchpad_led_on();
>> + =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 touchpad_led_off();
>> +}
>> +
>> +static struct led_classdev touchpad_led =3D {
>> + =A0 =A0 =A0 .name =3D "dell-laptop::touchpad",
>> + =A0 =A0 =A0 .brightness_set =3D touchpad_led_set,
>> +};
>> +
>> +static int __devinit touchpad_led_init(struct device *dev)
>> +{
>> + =A0 =A0 =A0 return led_classdev_register(dev, &touchpad_led);
>> +}
>> +
>> +static void touchpad_led_exit(void)
>> +{
>> + =A0 =A0 =A0 led_classdev_unregister(&touchpad_led);
>> +}
>> +
>> =A0static bool dell_laptop_i8042_filter(unsigned char data, unsigned=
 char str,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct se=
rio *port)
>> =A0{
>> @@ -584,6 +659,9 @@ static int __init dell_init(void)
>> =A0 =A0 =A0 =A0if (!dmi_check_system(dell_device_table))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
>>
>> + =A0 =A0 =A0 quirks =3D NULL;
>> + =A0 =A0 =A0 dmi_check_system(dell_quirks); /* find if this machine=
 support other functions */
>> +
>> =A0 =A0 =A0 =A0dmi_walk(find_tokens, NULL);
>>
>> =A0 =A0 =A0 =A0if (!da_tokens) =A0{
>> @@ -626,6 +704,9 @@ static int __init dell_init(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_filter;
>> =A0 =A0 =A0 =A0}
>>
>> + =A0 =A0 =A0 if(quirks && quirks->touchpad_led)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 touchpad_led_init(&platform_device->de=
v);
>> +
>> =A0 =A0 =A0 =A0dell_laptop_dir =3D debugfs_create_dir("dell_laptop",=
 NULL);
>> =A0 =A0 =A0 =A0if (dell_laptop_dir !=3D NULL)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0debugfs_create_file("rfkill", 0444, d=
ell_laptop_dir, NULL,
>> @@ -692,6 +773,7 @@ fail_platform_driver:
>> =A0static void __exit dell_exit(void)
>> =A0{
>> =A0 =A0 =A0 =A0debugfs_remove_recursive(dell_laptop_dir);
>> + =A0 =A0 =A0 touchpad_led_exit();
>> =A0 =A0 =A0 =A0i8042_remove_filter(dell_laptop_i8042_filter);
>> =A0 =A0 =A0 =A0cancel_delayed_work_sync(&dell_rfkill_work);
>> =A0 =A0 =A0 =A0backlight_device_unregister(dell_backlight_device);
>> --
>> 1.7.5.4
>>
>>
>
>
>
> --
> Chia-Lin Kao(AceLan)
> http://blog.acelan.idv.tw/
> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
>



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
