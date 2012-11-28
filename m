From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH 3/6] msi-laptop: Code cleanups
Date: Wed, 28 Nov 2012 19:32:36 +0200
Message-ID: <CAKErNvozZ9GZjRUbeqiz53=5x4EMi+ST7YFfM5BQvhZPZ8P4kA@mail.gmail.com>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
 <1353796141-1470-4-git-send-email-maxtram95@gmail.com> <1354072310.21227.962.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:35096 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752645Ab2K1Rc5 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 28 Nov 2012 12:32:57 -0500
Received: by mail-ie0-f174.google.com with SMTP id k11so10504603iea.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Nov 2012 09:32:56 -0800 (PST)
In-Reply-To: <1354072310.21227.962.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

2012/11/28 joeyli <jlee@suse.com>:
> =E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:28 +0200=EF=BC=8C=
Maxim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
>> Replaced msi_init_rfkill() by msi_update_rfkill(), removed delays by
>> replacing delayed works by just works and made msi_laptop_i8042_filt=
er()
>> filter out KEY_TOUCHPAD_TOGGLE when sending KEY_TOUCHPAD_ON and
>> KEY_TOUCHPAD_OFF.
>
> Please separate to 2 patches, one for touchpad key and other one for
> rfkill.
>
> And,
> I am not agree for the clean up to msi_init_rfkill unless it causes
> problem on U90/U100. Did you find any issue on U90/U100?

In original code, we call get_wireless_state_ec_standard() in
rfkill_init() in order to get initial rfkill state from hardware and
after a second we call msi_init_rfkill() that sets rfkill state and
writes it to hardware. msi_update_rfkill() reads rfkill state from
hardware and sets it immediately. On U90/U100 writing to EC confuses
it. In patch 4 I add a quirk in set_device_state() that blocks writing
to EC so msi_init_rfkill() should not cause any issue, but we would
have unneeded 1 second delay and function calls.

> I delay 1 magic second for msi_rfkill_init because there have other M=
SI
> model need a delay time after we set SCM mode through write EC
> register.
> So, please don't change the code for msi_init_rfkill delay work, just
> keep it works with other MSI shipping machines.

What do you think if I remove delay only for U90/U100 and keep it for
other models?

>>
>> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>> ---
>>  drivers/platform/x86/msi-laptop.c | 67 ++++++++++++++--------------=
-----------
>>  1 file changed, 24 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x8=
6/msi-laptop.c
>> index 7ba107a..3b6f494 100644
>> --- a/drivers/platform/x86/msi-laptop.c
>> +++ b/drivers/platform/x86/msi-laptop.c
>> @@ -600,8 +600,23 @@ static const struct rfkill_ops rfkill_threeg_op=
s =3D {
>>       .set_block =3D rfkill_threeg_set
>>  };
>>
>> +static void msi_update_rfkill(struct work_struct *ignored)
>> +{
>> +     get_wireless_state_ec_standard();
>> +
>> +     if (rfk_wlan)
>> +             rfkill_set_sw_state(rfk_wlan, !wlan_s);
>> +     if (rfk_bluetooth)
>> +             rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
>> +     if (rfk_threeg)
>> +             rfkill_set_sw_state(rfk_threeg, !threeg_s);
>> +}
>> +static DECLARE_WORK(msi_rfkill_work, msi_update_rfkill);
>> +
>>  static void rfkill_cleanup(void)
>>  {
>> +     cancel_work_sync(&msi_rfkill_work);
>> +
>>       if (rfk_bluetooth) {
>>               rfkill_unregister(rfk_bluetooth);
>>               rfkill_destroy(rfk_bluetooth);
>> @@ -618,19 +633,6 @@ static void rfkill_cleanup(void)
>>       }
>>  }
>>
>> -static void msi_update_rfkill(struct work_struct *ignored)
>> -{
>> -     get_wireless_state_ec_standard();
>> -
>> -     if (rfk_wlan)
>> -             rfkill_set_sw_state(rfk_wlan, !wlan_s);
>> -     if (rfk_bluetooth)
>> -             rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
>> -     if (rfk_threeg)
>> -             rfkill_set_sw_state(rfk_threeg, !threeg_s);
>> -}
>> -static DECLARE_DELAYED_WORK(msi_rfkill_work, msi_update_rfkill);
>> -
>>  static void msi_send_touchpad_key(struct work_struct *ignored)
>>  {
>>       u8 rdata;
>> @@ -644,7 +646,7 @@ static void msi_send_touchpad_key(struct work_st=
ruct *ignored)
>>               (rdata & MSI_STANDARD_EC_TOUCHPAD_MASK) ?
>>               KEY_TOUCHPAD_ON : KEY_TOUCHPAD_OFF, 1, true);
>>  }
>> -static DECLARE_DELAYED_WORK(msi_touchpad_work, msi_send_touchpad_ke=
y);
>> +static DECLARE_WORK(msi_touchpad_work, msi_send_touchpad_key);
>>
>>  static bool msi_laptop_i8042_filter(unsigned char data, unsigned ch=
ar str,
>>                               struct serio *port)
>> @@ -662,14 +664,16 @@ static bool msi_laptop_i8042_filter(unsigned c=
har data, unsigned char str,
>>               extended =3D false;
>>               switch (data) {
>>               case 0xE4:
>> -                     schedule_delayed_work(&msi_touchpad_work,
>> -                             round_jiffies_relative(0.5 * HZ));
>> -                     break;
>> +                     schedule_work(&msi_touchpad_work);
>
> Don't remove the 0.5 magic delay, please! It will cause other shipped
> MSI machines got problem could not capture the real change of EC
> register.

The same question here.

>> +             case 0x64:
>> +                     /* Filter out KEY_TOUCHPAD_TOGGLE and send onl=
y
>> +                      * KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF
>> +                      */
>> +                     return true;
>
> Why this patch filter out 0x64 key? What's the scan code emitted when
> press the touchpad on/off Fn key on U100? Does it emit
> KEY_TOUCHPAD_TOGGLE and KEY_TOUCHPAD_ON/OFF at the same time?

0xE4 stands for Fn+F3 release and 0x64 stands for Fn+F3 press. So, if
we do not use msi-laptop driver, we will get KEY_TOUCHPAD_TOGGLE
(maybe from i8042 driver). If we load msi-laptop driver, it hooks
=46n+F3 release and sends KEY_TOUCHPAD_ON/OFF, so userspace will receiv=
e
KEY_TOUCHPAD_TOGGLE before KEY_TOUCHPAD_ON/OFF. So we need to filter
out both Fn+F3 press and release, so that KEY_TOUCHPAD_TOGGLE will not
be sent.

>>               case 0x54:
>>               case 0x62:
>>               case 0x76:
>> -                     schedule_delayed_work(&msi_rfkill_work,
>> -                             round_jiffies_relative(0.5 * HZ));
>> +                     schedule_work(&msi_rfkill_work);
>>                       break;
>>               }
>>       }
>> @@ -677,31 +681,11 @@ static bool msi_laptop_i8042_filter(unsigned c=
har data, unsigned char str,
>>       return false;
>>  }
>>
>> -static void msi_init_rfkill(struct work_struct *ignored)
>> -{
>> -     if (rfk_wlan) {
>> -             rfkill_set_sw_state(rfk_wlan, !wlan_s);
>> -             rfkill_wlan_set(NULL, !wlan_s);
>> -     }
>> -     if (rfk_bluetooth) {
>> -             rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
>> -             rfkill_bluetooth_set(NULL, !bluetooth_s);
>> -     }
>> -     if (rfk_threeg) {
>> -             rfkill_set_sw_state(rfk_threeg, !threeg_s);
>> -             rfkill_threeg_set(NULL, !threeg_s);
>> -     }
>> -}
>> -static DECLARE_DELAYED_WORK(msi_rfkill_init, msi_init_rfkill);
>> -
>>  static int rfkill_init(struct platform_device *sdev)
>>  {
>>       /* add rfkill */
>>       int retval;
>>
>> -     /* keep the hardware wireless state */
>> -     get_wireless_state_ec_standard();
>> -
>>       rfk_bluetooth =3D rfkill_alloc("msi-bluetooth", &sdev->dev,
>>                               RFKILL_TYPE_BLUETOOTH,
>>                               &rfkill_bluetooth_ops, NULL);
>> @@ -736,8 +720,7 @@ static int rfkill_init(struct platform_device *s=
dev)
>>       }
>>
>>       /* schedule to run rfkill state initial */
>> -     schedule_delayed_work(&msi_rfkill_init,
>> -                             round_jiffies_relative(1 * HZ));
>> +     schedule_work(&msi_rfkill_work);
>>
>>       return 0;
>>
>> @@ -951,7 +934,6 @@ fail_platform_device2:
>>
>>       if (load_scm_model) {
>>               i8042_remove_filter(msi_laptop_i8042_filter);
>> -             cancel_delayed_work_sync(&msi_rfkill_work);
>>               rfkill_cleanup();
>>       }
>>       platform_device_del(msipf_device);
>> @@ -976,7 +958,6 @@ static void __exit msi_cleanup(void)
>>       if (load_scm_model) {
>>               i8042_remove_filter(msi_laptop_i8042_filter);
>>               msi_laptop_input_destroy();
>> -             cancel_delayed_work_sync(&msi_rfkill_work);
>>               rfkill_cleanup();
>>       }
>>
>
> Thanks a lot!
> Joey Lee
>
>
