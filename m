From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCHv2] platform/x86: asus-wireless: Use per-HID HSWC parameters
Date: Tue, 14 Feb 2017 00:09:36 +0200
Message-ID: <CAHp75VcATi-m5C5mMLCR=2dNL9md5GF4JGvsrktVRm_oaQNH1A@mail.gmail.com>
References: <CA+A7VXXM+n-=FCYXiL-nn_CgeRRr5XOC66f8+e4MFYpcO345AA@mail.gmail.com>
 <20170207214510.23367-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170207214510.23367-1-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 7, 2017 at 11:45 PM, Jo=C3=A3o Paulo Rechi Vita
<jprvita@gmail.com> wrote:
> Some Asus machines use 0x4/0x5 as their LED on/off values, while others
> use 0x0/0x1, as shown in the DSDT excerpts below. Luckily it seems this
> behavior is tied to different HIDs, after looking at 44 DSDTs from
> different Asus models.
>
> Another small difference is that a few of them call GWBL instead of
> OWGS, and SWBL instead of OWGD. That does not seem to make a difference
> for asus-wireless, and is additional reasoning to not try to call these
> methods directly.
>
> Device (ASHS)                       | Device (ASHS)
> {                                   | {
>     Name (_HID, "ATK4002")          |     Name (_HID, "ATK4001")
>     Method (HSWC, 1, Serialized)    |     Method (HSWC, 1, Serialized)
>     {                               |     {
>         If ((Arg0 < 0x02))          |         If ((Arg0 < 0x02))
>         {                           |         {
>             OWGD (Arg0)             |             OWGD (Arg0)
>             Return (One)            |             Return (One)
>         }                           |         }
>         If ((Arg0 =3D=3D 0x02))         |
>         {                           |         If ((Arg0 =3D=3D 0x02))
>             Local0 =3D OWGS ()        |         {
>             If (Local0)             |             Return (OWGS ())
>             {                       |         }
>                     Return (0x05)   |
>             }                       |         If ((Arg0 =3D=3D 0x03))
>             Else                    |         {
>             {                       |             Return (0xFF)
>                     Return (0x04)   |         }
>             }                       |
>         }                           |         If ((Arg0 =3D=3D 0x80))
>         If ((Arg0 =3D=3D 0x03))         |         {
>         {                           |            Return (One)
>             Return (0xFF)           |         }
>         }                           |     }
>         If ((Arg0 =3D=3D 0x04))         |     Method (_STA, 0, NotSeriali=
zed)
>         {                           |     {
>             OWGD (Zero)             |         If ((MSOS () >=3D OSW8))
>             Return (One)            |         {
>         }                           |             Return (0x0F)
>         If ((Arg0 =3D=3D 0x05))         |         }
>         {                           |         Else
>             OWGD (One)              |         {
>             Return (One)            |             Return (Zero)
>         }                           |         }
>         If ((Arg0 =3D=3D 0x80))         |     }
>         {                           | }
>             Return (One)            |
>         }                           |
>     }                               |
>     Method (_STA, 0, NotSerialized) |
>     {                               |
>         If ((MSOS () >=3D OSW8))      |
>         {                           |
>             Return (0x0F)           |
>         }                           |
>         Else                        |
>         {                           |
>             Return (Zero)           |
>         }                           |
>     }                               |
> }                                   |
>

Thanks, applied to testing.

> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  drivers/platform/x86/asus-wireless.c | 57 ++++++++++++++++++++++++++----=
------
>  1 file changed, 42 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/=
asus-wireless.c
> index a7ee18383146..f3796164329e 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -17,19 +17,41 @@
>  #include <linux/pci_ids.h>
>  #include <linux/leds.h>
>
> -#define ASUS_WIRELESS_LED_STATUS 0x2
> -#define ASUS_WIRELESS_LED_OFF 0x4
> -#define ASUS_WIRELESS_LED_ON 0x5
> +struct hswc_params {
> +       u8 on;
> +       u8 off;
> +       u8 status;
> +};
>
>  struct asus_wireless_data {
>         struct input_dev *idev;
>         struct acpi_device *adev;
> +       const struct hswc_params *hswc_params;
>         struct workqueue_struct *wq;
>         struct work_struct led_work;
>         struct led_classdev led;
>         int led_state;
>  };
>
> +static const struct hswc_params atk4001_id_params =3D {
> +       .on =3D 0x0,
> +       .off =3D 0x1,
> +       .status =3D 0x2,
> +};
> +
> +static const struct hswc_params atk4002_id_params =3D {
> +       .on =3D 0x5,
> +       .off =3D 0x4,
> +       .status =3D 0x2,
> +};
> +
> +static const struct acpi_device_id device_ids[] =3D {
> +       {"ATK4001", (kernel_ulong_t)&atk4001_id_params},
> +       {"ATK4002", (kernel_ulong_t)&atk4002_id_params},
> +       {"", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, device_ids);
> +
>  static u64 asus_wireless_method(acpi_handle handle, const char *method,
>                                 int param)
>  {
> @@ -61,8 +83,8 @@ static enum led_brightness led_state_get(struct led_cla=
ssdev *led)
>
>         data =3D container_of(led, struct asus_wireless_data, led);
>         s =3D asus_wireless_method(acpi_device_handle(data->adev), "HSWC"=
,
> -                                ASUS_WIRELESS_LED_STATUS);
> -       if (s =3D=3D ASUS_WIRELESS_LED_ON)
> +                                data->hswc_params->status);
> +       if (s =3D=3D data->hswc_params->on)
>                 return LED_FULL;
>         return LED_OFF;
>  }
> @@ -81,8 +103,8 @@ static void led_state_set(struct led_classdev *led, en=
um led_brightness value)
>         struct asus_wireless_data *data;
>
>         data =3D container_of(led, struct asus_wireless_data, led);
> -       data->led_state =3D value =3D=3D LED_OFF ? ASUS_WIRELESS_LED_OFF =
:
> -                                            ASUS_WIRELESS_LED_ON;
> +       data->led_state =3D value =3D=3D LED_OFF ? data->hswc_params->off=
 :
> +                                            data->hswc_params->on;
>         queue_work(data->wq, &data->led_work);
>  }
>
> @@ -103,12 +125,14 @@ static void asus_wireless_notify(struct acpi_device=
 *adev, u32 event)
>  static int asus_wireless_add(struct acpi_device *adev)
>  {
>         struct asus_wireless_data *data;
> +       const struct acpi_device_id *id;
>         int err;
>
>         data =3D devm_kzalloc(&adev->dev, sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 return -ENOMEM;
>         adev->driver_data =3D data;
> +       data->adev =3D adev;
>
>         data->idev =3D devm_input_allocate_device(&adev->dev);
>         if (!data->idev)
> @@ -123,7 +147,16 @@ static int asus_wireless_add(struct acpi_device *ade=
v)
>         if (err)
>                 return err;
>
> -       data->adev =3D adev;
> +       for (id =3D device_ids; id->id[0]; id++) {
> +               if (!strcmp((char *) id->id, acpi_device_hid(adev))) {
> +                       data->hswc_params =3D
> +                               (const struct hswc_params *)id->driver_da=
ta;
> +                       break;
> +               }
> +       }
> +       if (!data->hswc_params)
> +               return 0;
> +
>         data->wq =3D create_singlethread_workqueue("asus_wireless_workque=
ue");
>         if (!data->wq)
>                 return -ENOMEM;
> @@ -136,6 +169,7 @@ static int asus_wireless_add(struct acpi_device *adev=
)
>         err =3D devm_led_classdev_register(&adev->dev, &data->led);
>         if (err)
>                 destroy_workqueue(data->wq);
> +
>         return err;
>  }
>
> @@ -148,13 +182,6 @@ static int asus_wireless_remove(struct acpi_device *=
adev)
>         return 0;
>  }
>
> -static const struct acpi_device_id device_ids[] =3D {
> -       {"ATK4001", 0},
> -       {"ATK4002", 0},
> -       {"", 0},
> -};
> -MODULE_DEVICE_TABLE(acpi, device_ids);
> -
>  static struct acpi_driver asus_wireless_driver =3D {
>         .name =3D "Asus Wireless Radio Control Driver",
>         .class =3D "hotkey",
> --
> 2.11.0
>



--=20
With Best Regards,
Andy Shevchenko
