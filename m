From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH 4/6] msi-laptop: Add MSI Wind U90/U100 support
Date: Wed, 28 Nov 2012 19:41:23 +0200
Message-ID: <CAKErNvrSOTFLn=Q3jDH954rm7gOKGyJ7BQZH+26fr1vXvWvd+w@mail.gmail.com>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
 <1353796141-1470-5-git-send-email-maxtram95@gmail.com> <1354073572.21227.1000.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:57141 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752324Ab2K1Rlp convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 28 Nov 2012 12:41:45 -0500
Received: by mail-ia0-f174.google.com with SMTP id y25so10085486iay.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Nov 2012 09:41:45 -0800 (PST)
In-Reply-To: <1354073572.21227.1000.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

2012/11/28 joeyli <jlee@suse.com>:
> =E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:28 +0200=EF=BC=8C=
Maxim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
>> Add MSI Wind U90/U100 to separate DMI table, add U90/U100 specific
>> workarounds and add some missing EC features support such as basic f=
an
>> control, turbo and ECO modes and touchpad state.
>>
>> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>> ---
>>  drivers/platform/x86/msi-laptop.c | 199 +++++++++++++++++++++++++++=
+++++------
>>  1 file changed, 171 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x8=
6/msi-laptop.c
>> index 3b6f494..16e9863 100644
>> --- a/drivers/platform/x86/msi-laptop.c
>> +++ b/drivers/platform/x86/msi-laptop.c
>> @@ -82,8 +82,19 @@
>>  #define MSI_STANDARD_EC_SCM_LOAD_ADDRESS     0x2d
>>  #define MSI_STANDARD_EC_SCM_LOAD_MASK                (1 << 0)
>>
>> -#define MSI_STANDARD_EC_TOUCHPAD_ADDRESS     0xe4
>> +#define MSI_STANDARD_EC_POWER_ADDRESS                0xe4
>
> If 0xE4 register is not just for touchpad and power, then I suggest u=
se
> a more general name like: MSI_STANDARD_EC_FUNCTIONS_ADDRESS or other.

OK, I will rename it.

>> +/* Power LED is orange - Turbo mode */
>> +#define MSI_STANDARD_EC_TURBO_MASK           (1 << 1)
>> +/* Power LED is green - ECO mode */
>> +#define MSI_STANDARD_EC_ECO_MASK             (1 << 3)
>> +/* Touchpad is turned on */
>>  #define MSI_STANDARD_EC_TOUCHPAD_MASK                (1 << 4)
>> +/* If this bit !=3D bit 1, turbo mode can't be toggled */
>> +#define MSI_STANDARD_EC_TURBO_COOLDOWN_MASK  (1 << 7)
>> +
>> +#define MSI_STANDARD_EC_FAN_ADDRESS          0x33
>> +/* If zero, fan rotates at maximal speed */
>> +#define MSI_STANDARD_EC_AUTOFAN_MASK         (1 << 0)
>>
>>  #ifdef CONFIG_PM_SLEEP
>>  static int msi_laptop_resume(struct device *device);
>> @@ -123,6 +134,13 @@ static int threeg_exists;
>>   * e.g. MSI N034 netbook
>>   */
>>  static bool load_scm_model;
>> +
>> +/* Some MSI Wind netbooks (e.g. MSI Wind U100) need loading SCM to =
get some
>> + * features working (e.g. ECO mode), but we cannot change Wlan/Blue=
tooth state
>> + * in software and we can only read its state.
>> + */
>> +static bool ec_read_only;
>> +
>>  static struct rfkill *rfk_wlan, *rfk_bluetooth, *rfk_threeg;
>>
>>  /* Hardware access */
>> @@ -195,6 +213,9 @@ static ssize_t set_device_state(const char *buf,=
 size_t count, u8 mask)
>>       if (sscanf(buf, "%i", &status) !=3D 1 || (status < 0 || status=
 > 1))
>>               return -EINVAL;
>>
>> +     if (ec_read_only)
>> +             return -EOPNOTSUPP;
>> +
>>       /* read current device state */
>>       result =3D ec_read(MSI_STANDARD_EC_COMMAND_ADDRESS, &rdata);
>>       if (result < 0)
>> @@ -417,18 +438,115 @@ static ssize_t store_auto_brightness(struct d=
evice *dev,
>>       return count;
>>  }
>>
>> +static ssize_t show_touchpad(struct device *dev,
>> +     struct device_attribute *attr, char *buf)
>> +{
>> +
>> +     u8 rdata;
>> +     int result;
>> +
>> +     result =3D ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
>> +     if (result < 0)
>> +             return result;
>> +
>> +     return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TOUCHPA=
D_MASK));
>> +}
>
> I don't think we need create a touchpad attribute interface because
> there already have key code raise the change to user space.

Key codes only indicate touchpad state change. We cannot determine
initial touchpad state on boot using only key codes. I think, it might
be useful to have a file in sysfs that always keeps actual touchpad
state, so that we can get initial touchpad state on boot. Do you
disagree with that?

>> +
>> +static ssize_t show_turbo(struct device *dev,
>> +     struct device_attribute *attr, char *buf)
>> +{
>> +
>> +     u8 rdata;
>> +     int result;
>> +
>> +     result =3D ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
>> +     if (result < 0)
>> +             return result;
>> +
>> +     return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TURBO_M=
ASK));
>> +}
>> +
>> +static ssize_t show_eco(struct device *dev,
>> +     struct device_attribute *attr, char *buf)
>> +{
>> +
>> +     u8 rdata;
>> +     int result;
>> +
>> +     result =3D ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
>> +     if (result < 0)
>> +             return result;
>> +
>> +     return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_ECO_MAS=
K));
>> +}
>> +
>> +static ssize_t show_turbo_cooldown(struct device *dev,
>> +     struct device_attribute *attr, char *buf)
>> +{
>> +
>> +     u8 rdata;
>> +     int result;
>> +
>> +     result =3D ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
>> +     if (result < 0)
>> +             return result;
>> +
>> +     return sprintf(buf, "%i\n", (!!(rdata & MSI_STANDARD_EC_TURBO_=
MASK)) |
>> +             (!!(rdata & MSI_STANDARD_EC_TURBO_COOLDOWN_MASK) << 1)=
);
>> +}
>> +
>> +static ssize_t show_auto_fan(struct device *dev,
>> +     struct device_attribute *attr, char *buf)
>> +{
>> +
>> +     u8 rdata;
>> +     int result;
>> +
>> +     result =3D ec_read(MSI_STANDARD_EC_FAN_ADDRESS, &rdata);
>> +     if (result < 0)
>> +             return result;
>> +
>> +     return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_AUTOFAN=
_MASK));
>> +}
>> +
>> +static ssize_t store_auto_fan(struct device *dev,
>> +     struct device_attribute *attr, const char *buf, size_t count)
>> +{
>> +
>> +     int enable, result;
>> +
>> +     if (sscanf(buf, "%i", &enable) !=3D 1 || (enable !=3D (enable =
& 1)))
>> +             return -EINVAL;
>> +
>> +     result =3D ec_write(MSI_STANDARD_EC_FAN_ADDRESS, enable);
>> +     if (result < 0)
>> +             return result;
>> +
>> +     return count;
>> +}
>> +
>>  static DEVICE_ATTR(lcd_level, 0644, show_lcd_level, store_lcd_level=
);
>>  static DEVICE_ATTR(auto_brightness, 0644, show_auto_brightness,
>>                  store_auto_brightness);
>>  static DEVICE_ATTR(bluetooth, 0444, show_bluetooth, NULL);
>>  static DEVICE_ATTR(wlan, 0444, show_wlan, NULL);
>>  static DEVICE_ATTR(threeg, 0444, show_threeg, NULL);
>> +static DEVICE_ATTR(touchpad, 0444, show_touchpad, NULL);
>> +static DEVICE_ATTR(turbo_mode, 0444, show_turbo, NULL);
>> +static DEVICE_ATTR(eco_mode, 0444, show_eco, NULL);
>> +static DEVICE_ATTR(turbo_cooldown, 0444, show_turbo_cooldown, NULL)=
;
>> +static DEVICE_ATTR(auto_fan, 0644, show_auto_fan, store_auto_fan);
>>
>>  static struct attribute *msipf_attributes[] =3D {
>>       &dev_attr_lcd_level.attr,
>>       &dev_attr_auto_brightness.attr,
>>       &dev_attr_bluetooth.attr,
>>       &dev_attr_wlan.attr,
>> +     &dev_attr_touchpad.attr,
>> +     &dev_attr_turbo_mode.attr,
>> +     &dev_attr_eco_mode.attr,
>> +     &dev_attr_turbo_cooldown.attr,
>> +     &dev_attr_auto_fan.attr,
>>       NULL
>>  };
>>
>> @@ -553,6 +671,19 @@ static struct dmi_system_id __initdata msi_load=
_scm_models_dmi_table[] =3D {
>>       { }
>>  };
>>
>> +static struct dmi_system_id __initdata msi_load_scm_ro_models_dmi_t=
able[] =3D {
>> +     {
>> +             .ident =3D "MSI U90/U100",
>> +             .matches =3D {
>> +                     DMI_MATCH(DMI_SYS_VENDOR,
>> +                             "MICRO-STAR INTERNATIONAL CO., LTD"),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "U90/U100"),
>> +             },
>> +             .callback =3D dmi_check_cb
>> +     },
>> +     { }
>> +};
>> +
>>  static int rfkill_bluetooth_set(void *data, bool blocked)
>>  {
>>       /* Do something with blocked...*/
>> @@ -560,32 +691,26 @@ static int rfkill_bluetooth_set(void *data, bo=
ol blocked)
>>        * blocked =3D=3D false is on
>>        * blocked =3D=3D true is off
>>        */
>> -     if (blocked)
>> -             set_device_state("0", 0, MSI_STANDARD_EC_BLUETOOTH_MAS=
K);
>> -     else
>> -             set_device_state("1", 0, MSI_STANDARD_EC_BLUETOOTH_MAS=
K);
>> +     int result =3D set_device_state(blocked ? "0" : "1", 0,
>> +             MSI_STANDARD_EC_BLUETOOTH_MASK);
>>
>> -     return 0;
>> +     return result < 0 ? result : 0;
>>  }
>>
>>  static int rfkill_wlan_set(void *data, bool blocked)
>>  {
>> -     if (blocked)
>> -             set_device_state("0", 0, MSI_STANDARD_EC_WLAN_MASK);
>> -     else
>> -             set_device_state("1", 0, MSI_STANDARD_EC_WLAN_MASK);
>> +     int result =3D set_device_state(blocked ? "0" : "1", 0,
>> +             MSI_STANDARD_EC_WLAN_MASK);
>>
>> -     return 0;
>> +     return result < 0 ? result : 0;
>>  }
>>
>>  static int rfkill_threeg_set(void *data, bool blocked)
>>  {
>> -     if (blocked)
>> -             set_device_state("0", 0, MSI_STANDARD_EC_3G_MASK);
>> -     else
>> -             set_device_state("1", 0, MSI_STANDARD_EC_3G_MASK);
>> +     int result =3D set_device_state(blocked ? "0" : "1", 0,
>> +             MSI_STANDARD_EC_3G_MASK);
>>
>> -     return 0;
>> +     return result < 0 ? result : 0;
>>  }
>>
>>  static const struct rfkill_ops rfkill_bluetooth_ops =3D {
>> @@ -600,16 +725,24 @@ static const struct rfkill_ops rfkill_threeg_o=
ps =3D {
>>       .set_block =3D rfkill_threeg_set
>>  };
>>
>> +static bool msi_rfkill_set_state(struct rfkill *rfkill, bool blocke=
d)
>> +{
>> +     if (ec_read_only)
>> +             return rfkill_set_hw_state(rfkill, blocked);
>> +     else
>> +             return rfkill_set_sw_state(rfkill, blocked);
>> +}
>> +
>>  static void msi_update_rfkill(struct work_struct *ignored)
>>  {
>>       get_wireless_state_ec_standard();
>>
>>       if (rfk_wlan)
>> -             rfkill_set_sw_state(rfk_wlan, !wlan_s);
>> +             msi_rfkill_set_state(rfk_wlan, !wlan_s);
>>       if (rfk_bluetooth)
>> -             rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
>> +             msi_rfkill_set_state(rfk_bluetooth, !bluetooth_s);
>>       if (rfk_threeg)
>> -             rfkill_set_sw_state(rfk_threeg, !threeg_s);
>> +             msi_rfkill_set_state(rfk_threeg, !threeg_s);
>>  }
>>  static DECLARE_WORK(msi_rfkill_work, msi_update_rfkill);
>>
>> @@ -638,7 +771,7 @@ static void msi_send_touchpad_key(struct work_st=
ruct *ignored)
>>       u8 rdata;
>>       int result;
>>
>> -     result =3D ec_read(MSI_STANDARD_EC_TOUCHPAD_ADDRESS, &rdata);
>> +     result =3D ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
>>       if (result < 0)
>>               return;
>>
>> @@ -802,13 +935,15 @@ static int __init load_scm_model_init(struct p=
latform_device *sdev)
>>       u8 data;
>>       int result;
>>
>> -     /* allow userland write sysfs file  */
>> -     dev_attr_bluetooth.store =3D store_bluetooth;
>> -     dev_attr_wlan.store =3D store_wlan;
>> -     dev_attr_threeg.store =3D store_threeg;
>> -     dev_attr_bluetooth.attr.mode |=3D S_IWUSR;
>> -     dev_attr_wlan.attr.mode |=3D S_IWUSR;
>> -     dev_attr_threeg.attr.mode |=3D S_IWUSR;
>> +     if (!ec_read_only) {
>> +             /* allow userland write sysfs file  */
>> +             dev_attr_bluetooth.store =3D store_bluetooth;
>> +             dev_attr_wlan.store =3D store_wlan;
>> +             dev_attr_threeg.store =3D store_threeg;
>> +             dev_attr_bluetooth.attr.mode |=3D S_IWUSR;
>> +             dev_attr_wlan.attr.mode |=3D S_IWUSR;
>> +             dev_attr_threeg.attr.mode |=3D S_IWUSR;
>> +     }
>>
>>       /* disable hardware control by fn key */
>>       result =3D ec_read(MSI_STANDARD_EC_SCM_LOAD_ADDRESS, &data);
>> @@ -860,8 +995,15 @@ static int __init msi_init(void)
>>       if (force || dmi_check_system(msi_dmi_table))
>>               old_ec_model =3D 1;
>>
>> -     if (!old_ec_model)
>> +     if (!old_ec_model) {
>>               get_threeg_exists();
>> +             if (dmi_check_system(msi_load_scm_models_dmi_table))
>> +                     load_scm_model =3D 1;
>> +             else if (dmi_check_system(msi_load_scm_ro_models_dmi_t=
able)) {
>> +                     load_scm_model =3D 1;
>> +                     ec_read_only =3D 1;
>> +             }
>> +     }
>>
>>       if (!old_ec_model && dmi_check_system(msi_load_scm_models_dmi_=
table))
>>               load_scm_model =3D 1;
>
> hmm... the load_scm_model dmi table check 2 times? I think you can ju=
st
> remove the duplicate code.

Oops, I forgot to remove the last two lines when I were preparing patch=
es.

Do I need to resend all patches after doing all needed fixes?

>> @@ -992,3 +1134,4 @@ MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*=
:pnMS-N051:*");
>>  MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N014:*");
>>  MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnCR620:*");
>>  MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnU270series:*");
>> +MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnU90/U100:*");
>
>
> Thanks a lot!
> Joey Lee
>
>
