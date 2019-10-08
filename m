From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86: peaq-wmi: switch to using polled mode of
 input devices
Date: Tue, 8 Oct 2019 15:03:12 +0200
Message-ID: <bb766307-2d9c-fc6d-588a-9394a2b852e8@redhat.com>
References: <20191001185822.GA48020@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001185822.GA48020@dtor-ws>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 01-10-2019 20:58, Dmitry Torokhov wrote:
> We have added polled mode to the normal input devices with the intent of
> retiring input_polled_dev. This converts peaq-wmi driver to use the
> polling mode of standard input devices and removes dependency on
> INPUT_POLLDEV.
>=20
> Because the new polling coded does not allow peeking inside the poller
> structure to get the poll interval, we change the "debounce" process to
> operate on the time basis, instead of counting events.
>=20
> We also fix error handling during initialization, as previously we leaked
> input device structure when we failed to register it.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Patch looks good to me and I've also given this a test-run on the
hw which uses this driver:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>=20
> v2: include input.h instead of input-polldev.h
>=20
>   drivers/platform/x86/Kconfig    |  1 -
>   drivers/platform/x86/peaq-wmi.c | 66 +++++++++++++++++++++------------
>   2 files changed, 42 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f0a93f630455..c703c78c59f3 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -804,7 +804,6 @@ config PEAQ_WMI
>   =09tristate "PEAQ 2-in-1 WMI hotkey driver"
>   =09depends on ACPI_WMI
>   =09depends on INPUT
> -=09select INPUT_POLLDEV
>   =09help
>   =09 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s=
.
>  =20
> diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-=
wmi.c
> index fdeb3624c529..cf9c44c20a82 100644
> --- a/drivers/platform/x86/peaq-wmi.c
> +++ b/drivers/platform/x86/peaq-wmi.c
> @@ -6,7 +6,7 @@
>  =20
>   #include <linux/acpi.h>
>   #include <linux/dmi.h>
> -#include <linux/input-polldev.h>
> +#include <linux/input.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>  =20
> @@ -18,8 +18,7 @@
>  =20
>   MODULE_ALIAS("wmi:"PEAQ_DOLBY_BUTTON_GUID);
>  =20
> -static unsigned int peaq_ignore_events_counter;
> -static struct input_polled_dev *peaq_poll_dev;
> +static struct input_dev *peaq_poll_dev;
>  =20
>   /*
>    * The Dolby button (yes really a Dolby button) causes an ACPI variable=
 to get
> @@ -28,8 +27,10 @@ static struct input_polled_dev *peaq_poll_dev;
>    * (if polling after the release) or twice (polling between press and r=
elease).
>    * We ignore events for 0.5s after the first event to avoid reporting 2=
 presses.
>    */
> -static void peaq_wmi_poll(struct input_polled_dev *dev)
> +static void peaq_wmi_poll(struct input_dev *input_dev)
>   {
> +=09static unsigned long last_event_time;
> +=09static bool had_events;
>   =09union acpi_object obj;
>   =09acpi_status status;
>   =09u32 dummy =3D 0;
> @@ -44,22 +45,25 @@ static void peaq_wmi_poll(struct input_polled_dev *de=
v)
>   =09=09return;
>  =20
>   =09if (obj.type !=3D ACPI_TYPE_INTEGER) {
> -=09=09dev_err(&peaq_poll_dev->input->dev,
> +=09=09dev_err(&input_dev->dev,
>   =09=09=09"Error WMBC did not return an integer\n");
>   =09=09return;
>   =09}
>  =20
> -=09if (peaq_ignore_events_counter && peaq_ignore_events_counter--)
> +=09if (!obj.integer.value)
>   =09=09return;
>  =20
> -=09if (obj.integer.value) {
> -=09=09input_event(peaq_poll_dev->input, EV_KEY, KEY_SOUND, 1);
> -=09=09input_sync(peaq_poll_dev->input);
> -=09=09input_event(peaq_poll_dev->input, EV_KEY, KEY_SOUND, 0);
> -=09=09input_sync(peaq_poll_dev->input);
> -=09=09peaq_ignore_events_counter =3D max(1u,
> -=09=09=09PEAQ_POLL_IGNORE_MS / peaq_poll_dev->poll_interval);
> -=09}
> +=09if (had_events && time_before(jiffies, last_event_time +
> +=09=09=09=09=09msecs_to_jiffies(PEAQ_POLL_IGNORE_MS)))
> +=09=09return;
> +
> +=09input_event(input_dev, EV_KEY, KEY_SOUND, 1);
> +=09input_sync(input_dev);
> +=09input_event(input_dev, EV_KEY, KEY_SOUND, 0);
> +=09input_sync(input_dev);
> +
> +=09last_event_time =3D jiffies;
> +=09had_events =3D true;
>   }
>  =20
>   /* Some other devices (Shuttle XS35) use the same WMI GUID for other pu=
rposes */
> @@ -75,6 +79,8 @@ static const struct dmi_system_id peaq_dmi_table[] __in=
itconst =3D {
>  =20
>   static int __init peaq_wmi_init(void)
>   {
> +=09int err;
> +
>   =09/* WMI GUID is not unique, also check for a DMI match */
>   =09if (!dmi_check_system(peaq_dmi_table))
>   =09=09return -ENODEV;
> @@ -82,24 +88,36 @@ static int __init peaq_wmi_init(void)
>   =09if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
>   =09=09return -ENODEV;
>  =20
> -=09peaq_poll_dev =3D input_allocate_polled_device();
> +=09peaq_poll_dev =3D input_allocate_device();
>   =09if (!peaq_poll_dev)
>   =09=09return -ENOMEM;
>  =20
> -=09peaq_poll_dev->poll =3D peaq_wmi_poll;
> -=09peaq_poll_dev->poll_interval =3D PEAQ_POLL_INTERVAL_MS;
> -=09peaq_poll_dev->poll_interval_max =3D PEAQ_POLL_MAX_MS;
> -=09peaq_poll_dev->input->name =3D "PEAQ WMI hotkeys";
> -=09peaq_poll_dev->input->phys =3D "wmi/input0";
> -=09peaq_poll_dev->input->id.bustype =3D BUS_HOST;
> -=09input_set_capability(peaq_poll_dev->input, EV_KEY, KEY_SOUND);
> +=09peaq_poll_dev->name =3D "PEAQ WMI hotkeys";
> +=09peaq_poll_dev->phys =3D "wmi/input0";
> +=09peaq_poll_dev->id.bustype =3D BUS_HOST;
> +=09input_set_capability(peaq_poll_dev, EV_KEY, KEY_SOUND);
> +
> +=09err =3D input_setup_polling(peaq_poll_dev, peaq_wmi_poll);
> +=09if (err)
> +=09=09goto err_out;
> +
> +=09input_set_poll_interval(peaq_poll_dev, PEAQ_POLL_INTERVAL_MS);
> +=09input_set_max_poll_interval(peaq_poll_dev, PEAQ_POLL_MAX_MS);
> +
> +=09err =3D input_register_device(peaq_poll_dev);
> +=09if (err)
> +=09=09goto err_out;
> +
> +=09return 0;
>  =20
> -=09return input_register_polled_device(peaq_poll_dev);
> +err_out:
> +=09input_free_device(peaq_poll_dev);
> +=09return err;
>   }
>  =20
>   static void __exit peaq_wmi_exit(void)
>   {
> -=09input_unregister_polled_device(peaq_poll_dev);
> +=09input_unregister_device(peaq_poll_dev);
>   }
>  =20
>   module_init(peaq_wmi_init);
>=20
