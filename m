From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH RFC] platform: hp_accel: add a i8042 filter to remove
 accelerometer data
Date: Tue, 21 Oct 2014 14:45:08 -0700
Message-ID: <20141021214508.GF20951@vmdeb7>
References: <1413665962-3830-1-git-send-email-giedriuswork@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413665962-3830-1-git-send-email-giedriuswork@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Giedrius Statkevicius <giedriuswork@gmail.com>
Cc: eric.piel@tremplin-utc.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Oct 18, 2014 at 11:59:22PM +0300, Giedrius Statkevicius wrote:
> Hello,

Hi Giedrius,

> this patch fixes bug #84941 from the kernel bugzilla. Basically, it
> seems that the accelerometer sends some signals as button presses
> through the keyboard bus. The keys in the report are 0xa5-0xa8 but in
> the filter function they are reported as 0x25-0x28. This patch adds a

Does this mean you were able to test it? On which platform did you test=
?

> i8042 filter that removes these scancodes from the keyboard stream in=
 a
> similar fashion to how idealpad_sidebar.c does this. I've done a RFC
> because I'm not sure if there is more portable way to do this and if
> these codes are the same for all machines. So could please someone
> respond who uses this driver and tell which invalid keypresses appear
> (if they do) in your `dmesg` that are reported by atkbd?
>=20
> Also, I'm not sure if there is a publicly available documentation for=
 hp
> 3d driveguard (I couldn't find it). That would definetly make it clea=
r
> if this patch is correct or not.
>=20
> Adding a signed off by line incase you find this patch good and want =
to
> apply it.
>=20
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>

As it appears this is untested and you are looking for testers, I'm goi=
ng to
wait for a Tested-by from someone with hardware. Please follow-up if th=
at fails
to happen.

More below...

> ---
>  drivers/platform/x86/hp_accel.c | 42 +++++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/h=
p_accel.c
> index 13e14ec..b1bea8c 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -38,6 +38,8 @@
>  #include <linux/atomic.h>
>  #include <linux/acpi.h>
>  #include "../../misc/lis3lv02d/lis3lv02d.h"
> +#include <linux/i8042.h>
> +#include <linux/serio.h>
> =20
>  #define DRIVER_NAME     "hp_accel"
>  #define ACPI_MDPS_CLASS "accelerometer"
> @@ -73,6 +75,13 @@ static inline void delayed_sysfs_set(struct led_cl=
assdev *led_cdev,
> =20
>  /* HP-specific accelerometer driver --------------------------------=
---- */
> =20
> +/* Codes of signals that the accelerometer sends
> + * through the keyboard bus */
> +#define ACCEL_1 0x25
> +#define ACCEL_2 0x26
> +#define ACCEL_3 0x27
> +#define ACCEL_4 0x28
> +
>  /* For automatic insertion of the module */
>  static const struct acpi_device_id lis3lv02d_device_ids[] =3D {
>  	{"HPQ0004", 0}, /* HP Mobile Data Protection System PNP */
> @@ -82,7 +91,6 @@ static const struct acpi_device_id lis3lv02d_device=
_ids[] =3D {
>  };
>  MODULE_DEVICE_TABLE(acpi, lis3lv02d_device_ids);
> =20
> -
>  /**
>   * lis3lv02d_acpi_init - ACPI _INI method: initialize the device.
>   * @lis3: pointer to the device struct
> @@ -294,6 +302,32 @@ static void lis3lv02d_enum_resources(struct acpi=
_device *device)
>  		printk(KERN_DEBUG DRIVER_NAME ": Error getting resources\n");
>  }
> =20
> +static bool hp_accel_i8042_filter(unsigned char data, unsigned char =
str,
> +				  struct serio *port)
> +{
> +	static bool extended;
> +
> +	if (str & I8042_STR_AUXDATA)
> +		return false;
> +
> +	if (data =3D=3D 0xe0) {
> +		extended =3D true;
> +		return true;

If you are going to return, why bother setting extended?

> +	}
> +
> +	if (!extended)
> +		return false;

I'm now confused :-)

> +
> +	extended =3D false;

Wait... what?

Please review the use of extended here as well as the possibility
of using it uninitialized.

> +	if (likely(data !=3D ACCEL_1) && likely(data !=3D ACCEL_2) &&
> +	    likely(data !=3D ACCEL_3) && likely(data !=3D ACCEL_4)) {
> +		serio_interrupt(port, 0xe0, 0);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int lis3lv02d_add(struct acpi_device *device)
>  {
>  	int ret;
> @@ -326,6 +360,11 @@ static int lis3lv02d_add(struct acpi_device *dev=
ice)
>  	if (ret)
>  		return ret;
> =20
> +	/* filter to remove accelerometer data from keyboard bus stream */
> +	ret =3D i8042_install_filter(hp_accel_i8042_filter);
> +	if (ret)
> +		i8042_remove_filter(hp_accel_i8042_filter);

If it failed to install, you don't need to remove it afterward. See
the implementation for i8042_install_filter().

> +
>  	INIT_WORK(&hpled_led.work, delayed_set_status_worker);
>  	ret =3D led_classdev_register(NULL, &hpled_led.led_classdev);
>  	if (ret) {
> @@ -343,6 +382,7 @@ static int lis3lv02d_remove(struct acpi_device *d=
evice)
>  	if (!device)
>  		return -EINVAL;
> =20
> +	i8042_remove_filter(hp_accel_i8042_filter);
>  	lis3lv02d_joystick_disable(&lis3_dev);
>  	lis3lv02d_poweroff(&lis3_dev);
> =20
> --=20
> 2.1.2
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
