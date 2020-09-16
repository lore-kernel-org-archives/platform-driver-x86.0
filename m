From: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi:
 performance mode interface
Date: Wed, 16 Sep 2020 11:31:04 +0200
Message-ID: <11594528cfb96e2eed8fe0f27a4ecc1d60803432.camel@redhat.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5800751938969711306=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200821175310.335873-1-markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Cc: mario.limonciello-8PEkshWhKlo@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

--===============5800751938969711306==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Eimsjun+JO+oL5GXfRGX"

--=-Eimsjun+JO+oL5GXfRGX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, 2020-08-21 at 13:53 -0400, Mark Pearson wrote:
> +=09=09H  - High performance mode. Maximum power and temperature availabl=
e.
> +=09=09M* - High performance mode but performance is limited to medium as=
 system is
> +=09=09     in lapmode. Power and temperature maximums reduced to a safe =
threshold.
> +=09=09M  - Medium performance mode (aka 'balance'). Lower maximum power =
and temperatures
> +=09=09     but better battery life.
> +=09=09L  - Low performance mode (aka 'quiet'). Reduced power setting giv=
es lower
> +=09=09     temperatures and extended battery life. Fans run quieter.

I tested the patch yesterday and I see some minor issues right now.

First, right now change notifications do not happen for a lapmode
change. The sysfs file will switch between "H" and "M*" without any
notification. This will be an easy fix.

Second, I personally see the current "M*" more as a degraded
performance mode rather than an effective balanced mode. For example, H
and M* match in the sense that the machine will be more noisy as fans
are turned on more aggressively.

Third, we still have a mismatch when writing the file. i.e. you write
"H" but you will read "M*".

So, I am thinking of using H* instead. That means we directly represent
the firmwares performance mode rather than making an interpretation
about an "effective" state. And with the * we continue to convey that
there is a major impact on performance due to other factors.

Benjamin

> +What:=09=09/sys/devices/platform/thinkpad_acpi/dytc_lapmod
> e
> +Date:=09=09August 2020
> +Contact:=09Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
> +Description:
> +=09=09Reads returns the current value of the lapmode sensor.
> +
> +=09=090 - desk mode is detected
> +=09=091 - lap mode is detected
> +
> +What:=09=09/sys/devices/platform/thinkpad_acpi/psensor_sta
> te
> +Date:=09=09August 2020
> +Contact:=09Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
> +Description:
> +=09=09Reads returns the current value of the palm sensor.
> +
> +=09=090 - palm not detected
> +=09=091 - palm detected
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 6b57c52d8f13..b98f0de9e063 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -52,6 +52,7 @@ detailed description):
>  =09- LCD Shadow (PrivacyGuard) enable and disable
>  =09- Lap mode sensor
>          - Palm sensor (aka psensor)
> +=09- Thermal mode status and control
> =20
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1465,6 +1466,40 @@ Note - some platforms have a limitation
> whereby the EC firmware cannot
>  determine if the sensor is installed or not. On these platforms the
> psensor
>  state will always be reported as true to avoid high power being used
> incorrectly.
> =20
> +DYTC Thermal mode status and control
> +------------------------------------
> +
> +sysfs: dytc_perfmode
> +
> +Lenovo Thinkpad platforms with DYTC version 5 and newer have
> enhanced firmware to
> +provide improved performance control.
> +
> +The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to
> switch the
> +operating mode between three different modes. This sysfs node
> provides a better
> +interface for user space to use.
> +
> +The modes available are:
> +
> +H - High performance. Maximum power is available and the temperature
> is
> +allowed to increase to the maximum for the platform.
> +
> +M - Medium performance (aka balance). In this mode power will be
> limited and
> +the laptop will remain cooler.
> +
> +L - Low performance (aka quiet). In this mode power consumption is
> reduced and
> +the device will be cooler and quieter.
> +
> +Note: High performance mode is only available when the device is in
> 'deskmode'. If
> +the device detects that it is on a lap then it will automatically
> drop into medium
> +mode to maintain a safer operating temperature.
> +
> +The sysfs entry provides the ability to return the current status
> and to set the
> +desired mode. For example::
> +
> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +
>  EXPERIMENTAL: UWB
>  -----------------
> =20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 41b75dd4755c..8fcb660aa5a2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9817,18 +9817,43 @@ static struct ibm_struct
> lcdshadow_driver_data =3D {
>  };
> =20
>  /*******************************************************************
> ******
> - * DYTC subdriver, for the Lenovo lapmode feature
> + * DYTC subdriver, for the Lenovo lap and performance mode feature
>   */
> =20
> +#define DYTC_CMD_QUERY        0 /* To get DYTC status -
> enable/revision */
> +#define DYTC_CMD_SET          1 /* To enable/disable IC function
> mode */
>  #define DYTC_CMD_GET          2 /* To get current IC function and
> mode */
> -#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> +#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
> =20
> -static bool dytc_lapmode;
> +#define DYTC_QUERY_ENABLE_BIT 8  /* Bit 8 - 0 =3D disabled, 1 =3D
> enabled */
> +#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revisision */
> +#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> =20
> -static void dytc_lapmode_notify_change(void)
> -{
> -=09sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> -}
> +#define DYTC_GET_FUNCTION_BIT 8  /* Bits 8-11 - function setting */
> +#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
> +#define DYTC_GET_LAPMODE_BIT  17 /* Bit 17 - lapmode. Set when on
> lap */
> +
> +#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - funct setting */
> +#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
> +#define DYTC_SET_VALID_BIT    20 /* Bit 20 - 1 =3D on, 0 =3D off */
> +
> +#define DYTC_FUNCTION_STD     0  /* Function =3D 0, standard mode */
> +#define DYTC_FUNCTION_CQL     1  /* Function =3D 1, lap mode */
> +#define DYTC_FUNCTION_MMC     11 /* Function =3D 11, desk mode */
> +
> +#define DYTC_MODE_PERFORM     2  /* High power mode aka performance
> */
> +#define DYTC_MODE_QUIET       3  /* low power mode aka quiet */
> +#define DYTC_MODE_BALANCE   0xF  /* default mode aka balance */
> +
> +#define DYTC_DISABLE_CQL ((DYTC_MODE_BALANCE << DYTC_SET_MODE_BIT) |
> \
> +=09=09(DYTC_FUNCTION_CQL << DYTC_SET_FUNCTION_BIT) | \
> +=09=09DYTC_CMD_SET)
> +#define DYTC_ENABLE_CQL (DYTC_DISABLE_CQL | (1 <<
> DYTC_SET_VALID_BIT))
> +
> +static bool dytc_lapmode;
> +static int  dytc_perfmode;
> +static bool dytc_available;
> +static bool dytc_ignore_next_event;
> =20
>  static int dytc_command(int command, int *output)
>  {
> @@ -9843,6 +9868,87 @@ static int dytc_command(int command, int
> *output)
>  =09return 0;
>  }
> =20
> +static int dytc_perfmode_get(int *perfmode, int *funcmode)
> +{
> +=09int output, err;
> +
> +=09if (!dytc_available)
> +=09=09return -ENODEV;
> +
> +=09err =3D dytc_command(DYTC_CMD_GET, &output);
> +=09if (err)
> +=09=09return err;
> +=09*funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +
> +=09if (*funcmode =3D=3D DYTC_FUNCTION_CQL) {
> +=09=09int dummy;
> +=09=09/*
> +=09=09 * We can't get the mode when in CQL mode - so we
> disable CQL
> +=09=09 * mode retrieve the mode and then enable it again.
> +=09=09 * As disabling/enabling CQL triggers an event we set a
> flag to
> +=09=09 * ignore these events. This will be cleared by the
> event handler
> +=09=09 */
> +=09=09dytc_ignore_next_event =3D true;
> +=09=09err =3D dytc_command(DYTC_DISABLE_CQL, &dummy);
> +=09=09if (err)
> +=09=09=09return err;
> +=09=09err =3D dytc_command(DYTC_CMD_GET, &output);
> +=09=09if (err)
> +=09=09=09return err;
> +=09=09/* Again ignore this event */
> +=09=09dytc_ignore_next_event =3D true;
> +=09=09err =3D dytc_command(DYTC_ENABLE_CQL, &dummy);
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> +=09*perfmode =3D (output >> DYTC_GET_MODE_BIT) & 0xF;
> +=09return 0;
> +}
> +
> +static int dytc_perfmode_set(int perfmode)
> +{
> +=09int err, dytc_set;
> +=09int output;
> +=09int cur_perfmode, cur_funcmode;
> +
> +=09if (!dytc_available)
> +=09=09return -ENODEV;
> +
> +=09if (perfmode =3D=3D DYTC_MODE_BALANCE) {
> +=09=09/* To get back to balance mode we just issue a reset
> command */
> +=09=09err =3D dytc_command(DYTC_CMD_RESET, &output);
> +=09=09if (err)
> +=09=09=09return err;
> +=09} else {
> +=09=09/* Determine if we are in CQL mode. This alters the
> commands we do */
> +=09=09err =3D dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
> +=09=09if (err)
> +=09=09=09return err;
> +
> +=09=09if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
> +=09=09=09/* To set the mode we need to disable CQL
> first*/
> +=09=09=09dytc_ignore_next_event =3D true; /*ignore event*/
> +=09=09=09err =3D dytc_command(DYTC_DISABLE_CQL, &output);
> +=09=09=09if (err)
> +=09=09=09=09return err;
> +=09=09}
> +=09=09dytc_set =3D (1 << DYTC_SET_VALID_BIT) |
> +=09=09=09(DYTC_FUNCTION_MMC << DYTC_SET_FUNCTION_BIT) |
> +=09=09=09(perfmode << DYTC_SET_MODE_BIT) |
> +=09=09=09DYTC_CMD_SET;
> +=09=09err =3D dytc_command(dytc_set, &output);
> +=09=09if (err)
> +=09=09=09return err;
> +=09=09if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
> +=09=09=09dytc_ignore_next_event =3D true; /*ignore event*/
> +=09=09=09err =3D dytc_command(DYTC_ENABLE_CQL, &output);
> +=09=09=09if (err)
> +=09=09=09=09return err;
> +=09=09}
> +=09}
> +=09return 0;
> +}
> +
>  static int dytc_lapmode_get(bool *state)
>  {
>  =09int output, err;
> @@ -9854,45 +9960,130 @@ static int dytc_lapmode_get(bool *state)
>  =09return 0;
>  }
> =20
> -static void dytc_lapmode_refresh(void)
> +static void dytc_refresh(void)
>  {
> -=09bool new_state;
> +=09bool lapmode;
> +=09int perfmode, funcmode;
>  =09int err;
> =20
> -=09err =3D dytc_lapmode_get(&new_state);
> -=09if (err || (new_state =3D=3D dytc_lapmode))
> +=09err =3D dytc_lapmode_get(&lapmode);
> +=09if (err)
> +=09=09return;
> +=09if (dytc_ignore_next_event) {
> +=09=09dytc_ignore_next_event =3D false; /*clear setting*/
>  =09=09return;
> +=09}
> +=09if (lapmode !=3D dytc_lapmode) {
> +=09=09dytc_lapmode =3D lapmode;
> +=09=09sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> "dytc_lapmode");
> +=09}
> +=09err =3D dytc_perfmode_get(&perfmode, &funcmode);
> +=09if (err)
> +=09=09return;
> +=09if (perfmode !=3D dytc_perfmode) {
> +=09=09dytc_perfmode =3D perfmode;
> +=09=09sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> "dytc_perfmode");
> +=09}
> +}
> +
> +/* sysfs perfmode entry */
> +static ssize_t dytc_perfmode_show(struct device *dev,
> +=09=09=09=09  struct device_attribute *attr,
> +=09=09=09=09  char *buf)
> +{
> +=09int err;
> +=09int perfmode, funcmode;
> +
> +=09err =3D dytc_perfmode_get(&perfmode, &funcmode);
> +=09if (err)
> +=09=09return err;
> =20
> -=09dytc_lapmode =3D new_state;
> -=09dytc_lapmode_notify_change();
> +=09switch (perfmode) {
> +=09case DYTC_MODE_PERFORM:
> +=09=09/* High performance is only available in deskmode */
> +=09=09if (funcmode =3D=3D DYTC_FUNCTION_CQL)
> +=09=09=09return sprintf(buf, "M*\n");
> +=09=09else
> +=09=09=09return sprintf(buf, "H\n");
> +=09case DYTC_MODE_QUIET:
> +=09=09return sprintf(buf, "L\n");
> +=09case DYTC_MODE_BALANCE:
> +=09=09return sprintf(buf, "M\n");
> +=09default:
> +=09=09return sprintf(buf, "Unknown (%d)\n", perfmode);
> +=09}
>  }
> =20
> +static ssize_t dytc_perfmode_store(struct device *dev,
> +=09=09=09=09   struct device_attribute *attr,
> +=09=09=09=09   const char *buf, size_t count)
> +{
> +=09int err;
> +
> +=09switch (buf[0]) {
> +=09case 'l':
> +=09case 'L':
> +=09=09err =3D dytc_perfmode_set(DYTC_MODE_QUIET);
> +=09=09break;
> +=09case 'm':
> +=09case 'M':
> +=09=09err =3D dytc_perfmode_set(DYTC_MODE_BALANCE);
> +=09=09break;
> +=09case 'h':
> +=09case 'H':
> +=09=09err =3D dytc_perfmode_set(DYTC_MODE_PERFORM);
> +=09=09break;
> +=09default:
> +=09=09err =3D -EINVAL;
> +=09=09pr_err("Unknown operating mode. Ignoring\n");
> +=09=09break;
> +=09}
> +=09if (err)
> +=09=09return err;
> +
> +=09tpacpi_disclose_usertask(attr->attr.name,
> +=09=09=09=09"Performance mode set to %c\n",
> buf[0]);
> +=09return count;
> +}
> +
> +static DEVICE_ATTR_RW(dytc_perfmode);
> +
> +static struct attribute *dytc_perfmode_attributes[] =3D {
> +=09&dev_attr_dytc_perfmode.attr,
> +=09NULL
> +};
> +
> +static const struct attribute_group dytc_perf_attr_group =3D {
> +=09.attrs =3D dytc_perfmode_attributes
> +};
> +
>  /* sysfs lapmode entry */
>  static ssize_t dytc_lapmode_show(struct device *dev,
>  =09=09=09=09=09struct device_attribute *attr,
>  =09=09=09=09=09char *buf)
>  {
> -=09return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
> +=09return sprintf(buf, "%d\n", dytc_lapmode);
>  }
> =20
>  static DEVICE_ATTR_RO(dytc_lapmode);
> =20
> -static struct attribute *dytc_attributes[] =3D {
> +static struct attribute *dytc_lap_attributes[] =3D {
>  =09&dev_attr_dytc_lapmode.attr,
> -=09NULL,
> +=09NULL
>  };
> =20
> -static const struct attribute_group dytc_attr_group =3D {
> -=09.attrs =3D dytc_attributes,
> +static const struct attribute_group dytc_lap_attr_group =3D {
> +=09.attrs =3D dytc_lap_attributes
>  };
> =20
>  static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
>  {
> -=09int err;
> +=09int err, output;
> =20
> -=09err =3D dytc_lapmode_get(&dytc_lapmode);
> -=09/* If support isn't available (ENODEV) then don't return an
> error
> -=09 * but just don't create the sysfs group
> +=09err =3D dytc_command(DYTC_CMD_QUERY, &output);
> +=09/*
> +=09 * If support isn't available (ENODEV) then don't return an
> error
> +=09 * just don't create the sysfs group
>  =09 */
>  =09if (err =3D=3D -ENODEV)
>  =09=09return 0;
> @@ -9900,14 +10091,38 @@ static int tpacpi_dytc_init(struct
> ibm_init_struct *iibm)
>  =09if (err)
>  =09=09return err;
> =20
> -=09/* Platform supports this feature - create the group */
> -=09err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj,
> &dytc_attr_group);
> +=09/* Check DYTC is enabled and supports mode setting */
> +=09dytc_available =3D false;
> +=09dytc_ignore_next_event =3D false;
> +=09if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
> +=09=09/* Only DYTC v5.0 and later has this feature. */
> +=09=09int dytc_version;
> +
> +=09=09dytc_version =3D (output >> DYTC_QUERY_REV_BIT) & 0xF;
> +=09=09if (dytc_version >=3D 5) {
> +=09=09=09dbg_printk(TPACPI_DBG_INIT,
> +=09=09=09=09   "DYTC version %d: thermal mode
> available\n", dytc_version);
> +=09=09=09dytc_available =3D true;
> +=09=09=09/* Platform supports this feature - create the
> group */
> +=09=09=09err =3D sysfs_create_group(&tpacpi_pdev-
> >dev.kobj, &dytc_perf_attr_group);
> +=09=09=09if (err)
> +=09=09=09=09return err;
> +
> +=09=09=09err =3D dytc_lapmode_get(&dytc_lapmode);
> +=09=09=09if (err)
> +=09=09=09=09return err;
> +=09=09=09err =3D sysfs_create_group(&tpacpi_pdev-
> >dev.kobj, &dytc_lap_attr_group);
> +=09=09}
> +=09}
>  =09return err;
>  }
> =20
>  static void dytc_exit(void)
>  {
> -=09sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +=09if (dytc_available) {
> +=09=09sysfs_remove_group(&tpacpi_pdev->dev.kobj,
> &dytc_lap_attr_group);
> +=09=09sysfs_remove_group(&tpacpi_pdev->dev.kobj,
> &dytc_perf_attr_group);
> +=09}
>  }
> =20
>  static struct ibm_struct dytc_driver_data =3D {
> @@ -10057,7 +10272,7 @@ static void tpacpi_driver_event(const
> unsigned int hkey_event)
>  =09}
> =20
>  =09if (hkey_event =3D=3D TP_HKEY_EV_THM_CSM_COMPLETED)
> -=09=09dytc_lapmode_refresh();
> +=09=09dytc_refresh();
> =20
>  =09if ((hkey_event =3D=3D TP_HKEY_EV_PALM_DETECTED) ||
>  =09=09(hkey_event =3D=3D TP_HKEY_EV_PALM_UNDETECTED))

--=-Eimsjun+JO+oL5GXfRGX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl9h21gACgkQq6ZWhpmF
Y3BYNQ//f6O42u+UhtiSLSkzwLKSbRsHuL+L2XuBqej72oYc9knfz7cwwtkLb0qC
oNpTd7wknX3De/dbsNgU7ye4pacb3D2cuTvNjWalqNEfM9Can1/tw7h0hvCVk6rS
7qWDVt8UWtowkaXggz58bJFTJGlRWCrEbJGrbo51MWsCrVfUE+jjwjjZX7Ys4u55
gCV8fpN57gY4UjZ/Xk3eYek0VR670HiVqY7MNCgZ1wJJGDL4F+eOnJe4tGiAP0nM
dbj7Uo+WwZ5RBXkOl6q5mQstaK/mgehE4ILuzqtm1sB61Zfq9YUUGknw5tmCL2z2
SreYXfZE81pY+ROx9XpOIeTUn5gDGsZeEM4Hu/XglsOIbc8WJoNg6V+0+OJ9MPYh
aez4iXVOk9VzBwJM/pU0skXv+kEU6ZxMf55TZDUL3sUW/gAoFnqCDVZ150QuKn2e
u5ByGuYlLy0uPiMJwnredfjV8rwepl5d2TsH6wznXkWqwYcLJOTd2ghUduPnaqZC
a3wYcVpo9XW/BFPLB5tlYZXCo1WZafx4MGtprfohpdXv7qyfgOY0D1ho2QACzLao
AidbJyF64s6cVcFDgtYdLanzVyQI/oCO5aaxx5Zy7NNdv1P6QsxRza6FV//iVNAz
C0C/i66qSC7PoWQLATDXOVYMG/ALKrUi3NDq8AFSrhw+Vd8cefU=
=FzvG
-----END PGP SIGNATURE-----

--=-Eimsjun+JO+oL5GXfRGX--



--===============5800751938969711306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5800751938969711306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============5800751938969711306==--
