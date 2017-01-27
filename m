From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/1] asus-wireless: Use the correct HSWC parameter for
 each HID
Date: Fri, 27 Jan 2017 17:26:51 +0200
Message-ID: <CAHp75VfFGziE4iENsJqy8-HESK=HA8EYdGqQQ26EBqC3yv0KFg@mail.gmail.com>
References: <20170126150031.11840-1-jprvita@endlessm.com> <20170126150031.11840-2-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126150031.11840-2-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 26, 2017 at 5:00 PM, Jo=C3=A3o Paulo Rechi Vita
<jprvita@gmail.com> wrote:
> Some Asus machines use 0x4/0x5 as their LED on/off values, while others u=
se
> 0x0/0x1, as shown in the DSDT exerpts below (note "Arg0 =3D=3D 0x02", use=
d to get

excerpts

> the LED status). Luckly it seems this behavior is tied to different HIDs,=
 after

Luckily

> looking at 44 DSDTs from different Asus models.



>
> Another small difference (not shown here) is that a few machines call GWB=
L
> instead of OWGS, and SWBL instead of OWGD. That does not seem to make a
> difference for asus-wireless, and is a reason to not try to call these me=
thods
> directly.
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
> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  drivers/platform/x86/asus-wireless.c | 46 ++++++++++++++++++++++++++----=
------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/=
asus-wireless.c
> index c9b5ac152cf1..5a238fad35fb 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -18,18 +18,35 @@
>  #include <linux/leds.h>
>
>  #define ASUS_WIRELESS_LED_STATUS 0x2
> -#define ASUS_WIRELESS_LED_OFF 0x4
> -#define ASUS_WIRELESS_LED_ON 0x5
> +
> +struct hswc_params {
> +       u8 on;
> +       u8 off;
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
> +/* LED ON/OFF values for different HIDs. Please update when adding new H=
IDs. */
> +static const struct hswc_params id_params[] =3D {
> +       { 0x0, 0x1 },
> +       { 0x5, 0x4 },
> +};

Add status here as well.
Split to one struct per set.

> +
> +static const struct acpi_device_id device_ids[] =3D {
> +       {"ATK4001", 0},
> +       {"ATK4002", 0},

...and use it as a parameter here.

> +       {"", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, device_ids);
> +
>  static u64 asus_wireless_method(acpi_handle handle, const char *method,
>                                 int param)
>  {
> @@ -62,7 +79,7 @@ static enum led_brightness led_state_get(struct led_cla=
ssdev *led)
>         data =3D container_of(led, struct asus_wireless_data, led);
>         s =3D asus_wireless_method(acpi_device_handle(data->adev), "HSWC"=
,
>                                  ASUS_WIRELESS_LED_STATUS);
> -       if (s =3D=3D ASUS_WIRELESS_LED_ON)
> +       if (s =3D=3D data->hswc_params->on)
>                 return LED_FULL;
>         return LED_OFF;
>  }
> @@ -82,8 +99,8 @@ static void led_state_set(struct led_classdev *led,
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
> @@ -104,13 +121,22 @@ static void asus_wireless_notify(struct acpi_device=
 *adev, u32 event)
>  static int asus_wireless_add(struct acpi_device *adev)
>  {
>         struct asus_wireless_data *data;
> -       int err;
> +       const char *hid;
> +       int err, i;
>
>         data =3D devm_kzalloc(&adev->dev, sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 return -ENOMEM;
>         adev->driver_data =3D data;
>

> +       hid =3D acpi_device_hid(adev);
> +       for (i =3D 0; strcmp(device_ids[i].id, ""); i++) {
> +               if (!strcmp(device_ids[i].id, hid)) {
> +                       data->hswc_params =3D &id_params[i];
> +                       break;
> +               }
> +       }
> +

No, see above.

>         data->idev =3D devm_input_allocate_device(&adev->dev);
>         if (!data->idev)
>                 return -ENOMEM;
> @@ -137,6 +163,7 @@ static int asus_wireless_add(struct acpi_device *adev=
)
>         err =3D devm_led_classdev_register(&adev->dev, &data->led);
>         if (err)
>                 destroy_workqueue(data->wq);
> +
>         return err;
>  }
>
> @@ -149,13 +176,6 @@ static int asus_wireless_remove(struct acpi_device *=
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
