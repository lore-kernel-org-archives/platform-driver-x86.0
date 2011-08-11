From: AceLan Kao <acelan@gmail.com>
Subject: Re: [Fwd: Re: A problem about acer-wmi]
Date: Thu, 11 Aug 2011 10:48:56 +0800
Message-ID: <CAMz9Wg_y9y4Ce_ujHCJY7ZKJVfgciY=fE==9PKnmvMmUPhr1Uw@mail.gmail.com>
References: <4E42E3BF0200002300030494@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:41403 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752749Ab1HKCs6 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 10 Aug 2011 22:48:58 -0400
Received: by qwk3 with SMTP id 3so856430qwk.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2011 19:48:57 -0700 (PDT)
In-Reply-To: <4E42E3BF0200002300030494@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: joeyli.kernel@gmail.com, platform-driver-x86@vger.kernel.org

Dear Joey,

This is the dmesg log.
[ 9010.944053] acer_wmi: Acer Laptop ACPI-WMI Extras
[ 9010.944071] acer_wmi: Function bitmap for Communication Button: 0x1
[ 9010.944075] acer_wmi: Brightness must be controlled by generic video=
 driver
[ 9010.944996] input: Acer WMI hotkeys as /devices/virtual/input/input2=
1
[ 9010.947095] acer_wmi: Set Device Status failed: 0xe2 - 0x0

And after adding my quirk, the set device status still failed, but
except that, everything works well.

The "failed" comes from acer_rfkill_init(), it'll call
acer_rfkill_register() with ACER_CAP_WIRELESS parameter without
checking the capability.
I don't know why only wifi doesn't check the capability and call
acer_rfkill_register() directly, but it doesn't hurt the system.

=3D=3D=3D
static int acer_rfkill_init(struct device *dev)
{
        wireless_rfkill =3D acer_rfkill_register(dev, RFKILL_TYPE_WLAN,
                "acer-wireless", ACER_CAP_WIRELESS);
        if (IS_ERR(wireless_rfkill))
                return PTR_ERR(wireless_rfkill);
=3D=3D=3D

Best regards,
AceLan Kao.

2011/8/10 Joey Lee <jlee@novell.com>:
> Hi AceLan,
>
> =A9=F3 =A4T=A1A2011-08-10 =A9=F3 10:13 +0800=A1Ajoeyli =B4=A3=A8=EC=A1=
G
>> =A9=F3 =A4G=A1A2011-08-09 =A9=F3 14:33 +0800=A1AAceLan Kao =B4=A3=A8=
=EC=A1G
>> > Dear Joey,
>> >
>> > The current project we have right now have to follow the Acer WMI =
to
>> > handle the key events, that means no EC key event.
>> > And we have 3 keys that are not working now, they are touchpad
> toggle,
>> > brightness up, and brightness down.
>> > The touchpad toggle function is a Hotkey Break Event(function numb=
er
>> > 0x2), and brightness key events are Brightness Change Event(functi=
on
>> > number 0x4). But now acer-wmi driver only handles General Hotkey
>> > Event(function number 0x1).
>> >
>>
>> Yes, current acer-wmi only capture the event function number 0x1, yo=
u
>> can add those new function to acer_wmi_notify().
>>
>> > I just implemented those 3 key events, so I think maybe we don't
> have
>> > to create a new acer-wmi driver.
>>
>> Great! Welcome for you patches, I will also test it.
>>
>> > I'm longing for your work to clear up the acer-wmi driver, so that=
 I
>> > can add the new machine id and send you the patch.
>> > Thanks.
>> >
>> > BTW, I'm available to help if you are too busy to do that.
>> >
>> > Best regards,
>> > AceLan Kao.
>> >
>>
>> I am doing the clear up, now, will send out patch (I hope today).
>>
>>
>> Thank's
>> Joey Lee
>>
>
> I add a new ACER_WMID_v2 interface flag and do some clear up in acer-=
wmi
> initial function and get_u32 functions.
>
> Please kindly test this patch:
>
>
> Thank's
> Joey Lee
>
> >From 28b2e2ebaa230d339d5749b581c667ed074bb7ea Mon Sep 17 00:00:00 20=
01
> From: Lee, Chun-Yi <jlee@suse.com>
> Date: Wed, 10 Aug 2011 16:36:02 +0800
> Subject: [PATCH] acer-wmi: add ACER_WMID_v2 interface flag to represe=
nt new notebooks
>
> There have new acer notebooks' BIOS provide new WMID_GUID3 and
> ACERWMID_EVENT_GUID methods.
>
> Some of machines still keep the old WMID_GUID1 method but more and
> more machines were already removed old wmi methods from DSDT.
>
> So, this patch add a new ACER_WMID_v2 interface flag to represent
> new acer notebooks, the following is definition:
>
>  + ACER_WMID:
>        It means this machine only provides WMID_GUID1/2 methods.
>
>  + ACER_WMID_v2:
>        It means this machine provide new WMID_GUID3 and WMID_EVENT_GU=
ID
>        methods.
>        Some ACER_WMID_v2 machines also provide old WMID_GUID1/2 metho=
ds,
>        but we still query/set communication device's state by new
>        WMID_GUID3 method.
>
> Tested on Acer Travelmate 8572
>
> Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> ---
>  drivers/platform/x86/acer-wmi.c |  409 ++++++++++++++++++++---------=
----------
>  1 files changed, 211 insertions(+), 198 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index af2bb20..712a505 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -190,6 +190,7 @@ enum interface_flags {
>        ACER_AMW0,
>        ACER_AMW0_V2,
>        ACER_WMID,
> +       ACER_WMID_v2,
>  };
>
>  #define ACER_DEFAULT_WIRELESS  0
> @@ -868,6 +869,176 @@ static acpi_status WMID_set_u32(u32 value, u32 =
cap, struct wmi_interface *iface)
>        return WMI_execute_u32(method_id, (u32)value, NULL);
>  }
>
> +static acpi_status wmid3_get_device_status(u32 *value, u16 device)
> +{
> +       struct wmid3_gds_return_value return_value;
> +       acpi_status status;
> +       union acpi_object *obj;
> +       struct wmid3_gds_input_param params =3D {
> +               .function_num =3D 0x1,
> +               .hotkey_number =3D 0x01,
> +               .devices =3D device,
> +       };
> +       struct acpi_buffer input =3D {
> +               sizeof(struct wmid3_gds_input_param),
> +               &params
> +       };
> +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +
> +       status =3D wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &o=
utput);
> +       if (ACPI_FAILURE(status))
> +               return status;
> +
> +       obj =3D output.pointer;
> +
> +       if (!obj)
> +               return AE_ERROR;
> +       else if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +               kfree(obj);
> +               return AE_ERROR;
> +       }
> +       if (obj->buffer.length !=3D 8) {
> +               pr_warn("Unknown buffer length %d\n", obj->buffer.len=
gth);
> +               kfree(obj);
> +               return AE_ERROR;
> +       }
> +
> +       return_value =3D *((struct wmid3_gds_return_value *)obj->buff=
er.pointer);
> +       kfree(obj);
> +
> +       if (return_value.error_code || return_value.ec_return_value)
> +               pr_warn("Get Device Status failed: 0x%x - 0x%x\n",
> +                       return_value.error_code,
> +                       return_value.ec_return_value);
> +       else
> +               *value =3D !!(return_value.devices & device);
> +
> +       return status;
> +}
> +
> +static acpi_status wmid_v2_get_u32(u32 *value, u32 cap)
> +{
> +       u16 device;
> +
> +       switch (cap) {
> +       case ACER_CAP_WIRELESS:
> +               device =3D ACER_WMID3_GDS_WIRELESS;
> +               break;
> +       case ACER_CAP_BLUETOOTH:
> +               device =3D ACER_WMID3_GDS_BLUETOOTH;
> +               break;
> +       case ACER_CAP_THREEG:
> +               device =3D ACER_WMID3_GDS_THREEG;
> +               break;
> +       default:
> +               return AE_ERROR;
> +       }
> +       return wmid3_get_device_status(value, device);
> +}
> +
> +static acpi_status wmid3_set_device_status(u32 value, u16 device)
> +{
> +       struct wmid3_gds_return_value return_value;
> +       acpi_status status;
> +       union acpi_object *obj;
> +       u16 devices;
> +       struct wmid3_gds_input_param params =3D {
> +               .function_num =3D 0x1,
> +               .hotkey_number =3D 0x01,
> +               .devices =3D ACER_WMID3_GDS_WIRELESS |
> +                               ACER_WMID3_GDS_THREEG |
> +                               ACER_WMID3_GDS_WIMAX |
> +                               ACER_WMID3_GDS_BLUETOOTH,
> +       };
> +       struct acpi_buffer input =3D {
> +               sizeof(struct wmid3_gds_input_param),
> +               &params
> +       };
> +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +       struct acpi_buffer output2 =3D { ACPI_ALLOCATE_BUFFER, NULL }=
;
> +
> +       status =3D wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &o=
utput);
> +       if (ACPI_FAILURE(status))
> +               return status;
> +
> +       obj =3D output.pointer;
> +
> +       if (!obj)
> +               return AE_ERROR;
> +       else if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +               kfree(obj);
> +               return AE_ERROR;
> +       }
> +       if (obj->buffer.length !=3D 8) {
> +               pr_warning("Unknown buffer length %d\n", obj->buffer.=
length);
> +               kfree(obj);
> +               return AE_ERROR;
> +       }
> +
> +       return_value =3D *((struct wmid3_gds_return_value *)obj->buff=
er.pointer);
> +       kfree(obj);
> +
> +       if (return_value.error_code || return_value.ec_return_value) =
{
> +               pr_warning("Get Current Device Status failed: "
> +                       "0x%x - 0x%x\n", return_value.error_code,
> +                       return_value.ec_return_value);
> +               return status;
> +       }
> +
> +       devices =3D return_value.devices;
> +       params.function_num =3D 0x2;
> +       params.hotkey_number =3D 0x01;
> +       params.devices =3D (value) ? (devices | device) : (devices & =
~device);
> +
> +       status =3D wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &o=
utput2);
> +       if (ACPI_FAILURE(status))
> +               return status;
> +
> +       obj =3D output2.pointer;
> +
> +       if (!obj)
> +               return AE_ERROR;
> +       else if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +               kfree(obj);
> +               return AE_ERROR;
> +       }
> +       if (obj->buffer.length !=3D 4) {
> +               pr_warning("Unknown buffer length %d\n", obj->buffer.=
length);
> +               kfree(obj);
> +               return AE_ERROR;
> +       }
> +
> +       return_value =3D *((struct wmid3_gds_return_value *)obj->buff=
er.pointer);
> +       kfree(obj);
> +
> +       if (return_value.error_code || return_value.ec_return_value)
> +               pr_warning("Set Device Status failed: "
> +                       "0x%x - 0x%x\n", return_value.error_code,
> +                       return_value.ec_return_value);
> +
> +       return status;
> +}
> +
> +static acpi_status wmid_v2_set_u32(u32 value, u32 cap)
> +{
> +       u16 device;
> +
> +       switch (cap) {
> +       case ACER_CAP_WIRELESS:
> +               device =3D ACER_WMID3_GDS_WIRELESS;
> +               break;
> +       case ACER_CAP_BLUETOOTH:
> +               device =3D ACER_WMID3_GDS_BLUETOOTH;
> +               break;
> +       case ACER_CAP_THREEG:
> +               device =3D ACER_WMID3_GDS_THREEG;
> +               break;
> +       default:
> +               return AE_ERROR;
> +       }
> +       return wmid3_set_device_status(value, device);
> +}
> +
>  static void type_aa_dmi_decode(const struct dmi_header *header, void=
 *dummy)
>  {
>        struct hotkey_function_type_aa *type_aa;
> @@ -913,17 +1084,11 @@ static acpi_status WMID_set_capabilities(void)
>                return AE_ERROR;
>        }
>
> -       dmi_walk(type_aa_dmi_decode, NULL);
> -       if (!has_type_aa) {
> -               interface->capability |=3D ACER_CAP_WIRELESS;
> -               if (devices & 0x40)
> -                       interface->capability |=3D ACER_CAP_THREEG;
> -               if (devices & 0x10)
> -                       interface->capability |=3D ACER_CAP_BLUETOOTH=
;
> -       }
> -
> -       /* WMID always provides brightness methods */
> -       interface->capability |=3D ACER_CAP_BRIGHTNESS;
> +       interface->capability |=3D ACER_CAP_WIRELESS;
> +       if (devices & 0x40)
> +               interface->capability |=3D ACER_CAP_THREEG;
> +       if (devices & 0x10)
> +               interface->capability |=3D ACER_CAP_BLUETOOTH;
>
>        if (!(devices & 0x20))
>                max_brightness =3D 0x9;
> @@ -936,6 +1101,10 @@ static struct wmi_interface wmid_interface =3D =
{
>        .type =3D ACER_WMID,
>  };
>
> +static struct wmi_interface wmid_v2_interface =3D {
> +       .type =3D ACER_WMID_v2,
> +};
> +
>  /*
>  * Generic Device (interface-independent)
>  */
> @@ -956,6 +1125,14 @@ static acpi_status get_u32(u32 *value, u32 cap)
>        case ACER_WMID:
>                status =3D WMID_get_u32(value, cap, interface);
>                break;
> +       case ACER_WMID_v2:
> +               if (cap & (ACER_CAP_WIRELESS |
> +                          ACER_CAP_BLUETOOTH |
> +                          ACER_CAP_THREEG))
> +                       status =3D wmid_v2_get_u32(value, cap);
> +               else if (wmi_has_guid(WMID_GUID2))
> +                       status =3D WMID_get_u32(value, cap, interface=
);
> +               break;
>        }
>
>        return status;
> @@ -989,6 +1166,13 @@ static acpi_status set_u32(u32 value, u32 cap)
>                        }
>                case ACER_WMID:
>                        return WMID_set_u32(value, cap, interface);
> +               case ACER_WMID_v2:
> +                       if (cap & (ACER_CAP_WIRELESS |
> +                                  ACER_CAP_BLUETOOTH |
> +                                  ACER_CAP_THREEG))
> +                               return wmid_v2_set_u32(value, cap);
> +                       else if (wmi_has_guid(WMID_GUID2))
> +                               return WMID_set_u32(value, cap, inter=
face);
>                default:
>                        return AE_BAD_PARAMETER;
>                }
> @@ -1095,186 +1279,6 @@ static void acer_backlight_exit(void)
>        backlight_device_unregister(acer_backlight_device);
>  }
>
> -static acpi_status wmid3_get_device_status(u32 *value, u16 device)
> -{
> -       struct wmid3_gds_return_value return_value;
> -       acpi_status status;
> -       union acpi_object *obj;
> -       struct wmid3_gds_input_param params =3D {
> -               .function_num =3D 0x1,
> -               .hotkey_number =3D 0x01,
> -               .devices =3D device,
> -       };
> -       struct acpi_buffer input =3D {
> -               sizeof(struct wmid3_gds_input_param),
> -               &params
> -       };
> -       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> -
> -       status =3D wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &o=
utput);
> -       if (ACPI_FAILURE(status))
> -               return status;
> -
> -       obj =3D output.pointer;
> -
> -       if (!obj)
> -               return AE_ERROR;
> -       else if (obj->type !=3D ACPI_TYPE_BUFFER) {
> -               kfree(obj);
> -               return AE_ERROR;
> -       }
> -       if (obj->buffer.length !=3D 8) {
> -               pr_warn("Unknown buffer length %d\n", obj->buffer.len=
gth);
> -               kfree(obj);
> -               return AE_ERROR;
> -       }
> -
> -       return_value =3D *((struct wmid3_gds_return_value *)obj->buff=
er.pointer);
> -       kfree(obj);
> -
> -       if (return_value.error_code || return_value.ec_return_value)
> -               pr_warn("Get Device Status failed: 0x%x - 0x%x\n",
> -                       return_value.error_code,
> -                       return_value.ec_return_value);
> -       else
> -               *value =3D !!(return_value.devices & device);
> -
> -       return status;
> -}
> -
> -static acpi_status get_device_status(u32 *value, u32 cap)
> -{
> -       if (wmi_has_guid(WMID_GUID3)) {
> -               u16 device;
> -
> -               switch (cap) {
> -               case ACER_CAP_WIRELESS:
> -                       device =3D ACER_WMID3_GDS_WIRELESS;
> -                       break;
> -               case ACER_CAP_BLUETOOTH:
> -                       device =3D ACER_WMID3_GDS_BLUETOOTH;
> -                       break;
> -               case ACER_CAP_THREEG:
> -                       device =3D ACER_WMID3_GDS_THREEG;
> -                       break;
> -               default:
> -                       return AE_ERROR;
> -               }
> -               return wmid3_get_device_status(value, device);
> -
> -       } else {
> -               return get_u32(value, cap);
> -       }
> -}
> -
> -static acpi_status wmid3_set_device_status(u32 value, u16 device)
> -{
> -       struct wmid3_gds_return_value return_value;
> -       acpi_status status;
> -       union acpi_object *obj;
> -       u16 devices;
> -       struct wmid3_gds_input_param params =3D {
> -               .function_num =3D 0x1,
> -               .hotkey_number =3D 0x01,
> -               .devices =3D ACER_WMID3_GDS_WIRELESS |
> -                               ACER_WMID3_GDS_THREEG |
> -                               ACER_WMID3_GDS_WIMAX |
> -                               ACER_WMID3_GDS_BLUETOOTH,
> -       };
> -       struct acpi_buffer input =3D {
> -               sizeof(struct wmid3_gds_input_param),
> -               &params
> -       };
> -       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> -       struct acpi_buffer output2 =3D { ACPI_ALLOCATE_BUFFER, NULL }=
;
> -
> -       status =3D wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &o=
utput);
> -       if (ACPI_FAILURE(status))
> -               return status;
> -
> -       obj =3D output.pointer;
> -
> -       if (!obj)
> -               return AE_ERROR;
> -       else if (obj->type !=3D ACPI_TYPE_BUFFER) {
> -               kfree(obj);
> -               return AE_ERROR;
> -       }
> -       if (obj->buffer.length !=3D 8) {
> -               pr_warning("Unknown buffer length %d\n", obj->buffer.=
length);
> -               kfree(obj);
> -               return AE_ERROR;
> -       }
> -
> -       return_value =3D *((struct wmid3_gds_return_value *)obj->buff=
er.pointer);
> -       kfree(obj);
> -
> -       if (return_value.error_code || return_value.ec_return_value) =
{
> -               pr_warning("Get Current Device Status failed: "
> -                       "0x%x - 0x%x\n", return_value.error_code,
> -                       return_value.ec_return_value);
> -               return status;
> -       }
> -
> -       devices =3D return_value.devices;
> -       params.function_num =3D 0x2;
> -       params.hotkey_number =3D 0x01;
> -       params.devices =3D (value) ? (devices | device) : (devices & =
~device);
> -
> -       status =3D wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &o=
utput2);
> -       if (ACPI_FAILURE(status))
> -               return status;
> -
> -       obj =3D output2.pointer;
> -
> -       if (!obj)
> -               return AE_ERROR;
> -       else if (obj->type !=3D ACPI_TYPE_BUFFER) {
> -               kfree(obj);
> -               return AE_ERROR;
> -       }
> -       if (obj->buffer.length !=3D 4) {
> -               pr_warning("Unknown buffer length %d\n", obj->buffer.=
length);
> -               kfree(obj);
> -               return AE_ERROR;
> -       }
> -
> -       return_value =3D *((struct wmid3_gds_return_value *)obj->buff=
er.pointer);
> -       kfree(obj);
> -
> -       if (return_value.error_code || return_value.ec_return_value)
> -               pr_warning("Set Device Status failed: "
> -                       "0x%x - 0x%x\n", return_value.error_code,
> -                       return_value.ec_return_value);
> -
> -       return status;
> -}
> -
> -static acpi_status set_device_status(u32 value, u32 cap)
> -{
> -       if (wmi_has_guid(WMID_GUID3)) {
> -               u16 device;
> -
> -               switch (cap) {
> -               case ACER_CAP_WIRELESS:
> -                       device =3D ACER_WMID3_GDS_WIRELESS;
> -                       break;
> -               case ACER_CAP_BLUETOOTH:
> -                       device =3D ACER_WMID3_GDS_BLUETOOTH;
> -                       break;
> -               case ACER_CAP_THREEG:
> -                       device =3D ACER_WMID3_GDS_THREEG;
> -                       break;
> -               default:
> -                       return AE_ERROR;
> -               }
> -               return wmid3_set_device_status(value, device);
> -
> -       } else {
> -               return set_u32(value, cap);
> -       }
> -}
> -
>  /*
>  * Rfkill devices
>  */
> @@ -1301,8 +1305,7 @@ static void acer_rfkill_update(struct work_stru=
ct *ignored)
>        }
>
>        if (has_cap(ACER_CAP_THREEG) && wmi_has_guid(WMID_GUID3)) {
> -               status =3D wmid3_get_device_status(&state,
> -                               ACER_WMID3_GDS_THREEG);
> +               status =3D get_u32(&state, ACER_WMID3_GDS_THREEG);
>                if (ACPI_SUCCESS(status))
>                        rfkill_set_sw_state(threeg_rfkill, !state);
>        }
> @@ -1316,7 +1319,7 @@ static int acer_rfkill_set(void *data, bool blo=
cked)
>        u32 cap =3D (unsigned long)data;
>
>        if (rfkill_inited) {
> -               status =3D set_device_status(!blocked, cap);
> +               status =3D set_u32(!blocked, cap);
>                if (ACPI_FAILURE(status))
>                        return -ENODEV;
>        }
> @@ -1343,7 +1346,7 @@ static struct rfkill *acer_rfkill_register(stru=
ct device *dev,
>        if (!rfkill_dev)
>                return ERR_PTR(-ENOMEM);
>
> -       status =3D get_device_status(&state, cap);
> +       status =3D get_u32(&state, cap);
>
>        err =3D rfkill_register(rfkill_dev);
>        if (err) {
> @@ -1464,6 +1467,8 @@ static ssize_t show_interface(struct device *de=
v, struct device_attribute *attr,
>                return sprintf(buf, "AMW0 v2\n");
>        case ACER_WMID:
>                return sprintf(buf, "WMID\n");
> +       case ACER_WMID_v2:
> +               return sprintf(buf, "WMID v2\n");
>        default:
>                return sprintf(buf, "Error!\n");
>        }
> @@ -1883,12 +1888,20 @@ static int __init acer_wmi_init(void)
>        if (!wmi_has_guid(AMW0_GUID1) && wmi_has_guid(WMID_GUID1))
>                interface =3D &wmid_interface;
>
> +       if (wmi_has_guid(WMID_GUID3))
> +               interface =3D &wmid_v2_interface;
> +
> +       if (interface)
> +               dmi_walk(type_aa_dmi_decode, NULL);
> +
>        if (wmi_has_guid(WMID_GUID2) && interface) {
> -               if (ACPI_FAILURE(WMID_set_capabilities())) {
> +               if (!has_type_aa && ACPI_FAILURE(WMID_set_capabilitie=
s())) {
>                        pr_err("Unable to detect available WMID device=
s\n");
>                        return -ENODEV;
>                }
> -       } else if (!wmi_has_guid(WMID_GUID2) && interface) {
> +               /* WMID always provides brightness methods */
> +               interface->capability |=3D ACER_CAP_BRIGHTNESS;
> +       } else if (!wmi_has_guid(WMID_GUID2) && interface && !has_typ=
e_aa) {
>                pr_err("No WMID device detection method found\n");
>                return -ENODEV;
>        }
> @@ -1912,7 +1925,7 @@ static int __init acer_wmi_init(void)
>
>        set_quirks();
>
> -       if (acpi_video_backlight_support() && has_cap(ACER_CAP_BRIGHT=
NESS)) {
> +       if (acpi_video_backlight_support()) {
>                interface->capability &=3D ~ACER_CAP_BRIGHTNESS;
>                pr_info("Brightness must be controlled by "
>                       "generic video driver\n");
> --
> 1.6.0.2
>
>
>
>



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
