From: "Limonciello, Mario" <Mario.Limonciello-8PEkshWhKlo@public.gmane.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi:
 performance mode interface
Date: Wed, 22 Jul 2020 18:46:15 +0000
Message-ID: <DM6PR19MB263650F7DC4B6680A5EFC5DAFA790@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200722171108.65185-1-markpearson@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200722171108.65185-1-markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Cc: "bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, "bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

> 
> Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
> firmware to provide different performance/thermal modes.
> 
> The modes can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch
> the operating mode between three different modes.
> 
> H - High performance. Maximum power is available and the temperature is
> allowed to increase to the maximum for the platform.
> M - Medium performance (aka balance). In this mode power will be limited
> and the laptop will have a lower maximum temperature.
> L - Low performance (aka quiet). In this mode power consumption is reduced
> and the device will be cooler.
> 
> High performance mode is only available when the device is in 'desk mode'.
> If the device detects that it is on a lap then it will automatically drop
> into medium mode to maintain a safer operating temperature.
> 
> This patch provides an interface to determine the current mode and to also
> allow the setting of the mode through the dytc_perfmode sysfs entry. This
> can be used by userspace for improved control.
> 
> Reviewed-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  35 +++
>  drivers/platform/x86/thinkpad_acpi.c          | 209 +++++++++++++++++-
>  2 files changed, 235 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 2e9d62903ead..d5fef0bb562b 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -52,6 +52,7 @@ detailed description):
>  	- LCD Shadow (PrivacyGuard) enable and disable
>  	- Lap mode sensor
>          - Palm sensor (aka psensor)
> +        - Thermal mode status and control
> 
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1466,6 +1467,40 @@ determine if the sensor is not installed or not. On
> these platforms the
>  psensor state will always be reported as true to avoid high power being used
>  incorrectly.
> 
> +DYTC Thermal mode status and control
> +------------------------------------
> +
> +sysfs: dytc_perfmode
> +
> +Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
> firmware to
> +provide improved performance control.
> +
> +The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch the
> +operating mode between three different modes. This sysfs node provide a
> better
> +interface for user space to use

So is userspace also notified in some way when you use the hotkey to change, or
is the event usurped by the EC?  Is this by the event TP_HKEY_EV_THM_CSM_COMPLETED?

You might consider to mention what other interfaces will conflict with this
and document them and/or artificially block them when this is loaded to prevent
such a conflict.

> +
> +The modes available are:
> +
> +H - High performance. Maximum power is available and the temperature is
> +allowed to increase to the maximum for the platform.
> +
> +M - Medium performance (aka balance). In this mode power will be limited and
> +the laptop will remain cooler.
> +
> +L - Low performance (aka quiet). In this mode power consumption is reduced
> and
> +the device will be cooler and quieter
> +
> +Note: High performance mode is only available when the device is in
> 'deskmode'. If
> +thde device detects that it is on a lap then it will automatically drop into

the

> medium
> +mode to maintain a safer operating temperature.

I don't see an explicit notification path for this, how will userspace know about it?

Doesn't it need some sort of change uevent?
Or is this implied by the event TP_HKEY_EV_THM_CSM_COMPLETED?

> +
> +The sysfs entry provides the ability to return the current status and to set
> the
> +desired mode. For example::
> +
> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode

Doesn't this need ABI documentation submitted as part of the patch?

> +
>  EXPERIMENTAL: UWB
>  -----------------
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 40f2e368fdf9..5aebaf1718b1 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9799,10 +9799,33 @@ static struct ibm_struct lcdshadow_driver_data = {
>   * DYTC subdriver, for the Lenovo lapmode feature
>   */
> 
> +#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
> +#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
>  #define DYTC_CMD_GET          2 /* To get current IC function and mode */
> -#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> +#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
> +
> +#define DYTC_QUERY_ENABLE_BIT 8  /* Bit 8 - 0 = disabled, 1 = enabled */
> +#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revisision */
> +#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> +
> +#define DYTC_GET_FUNCTION_BIT 8  /* Bits 8-11 - function setting */
> +#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
> +#define DYTC_GET_LAPMODE_BIT  17 /* Bit 17 - lapmode. Set when on lap */
> +
> +#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - funct setting */
> +#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
> +#define DYTC_SET_VALID_BIT    20 /* Bit 20 - 1 = on, 0 = off */
> +
> +#define DYTC_FUNCTION_STD     0  /* Function = 0, standard mode */
> +#define DYTC_FUNCTION_CQL     1  /* Function = 1, lap mode */
> +#define DYTC_FUNCTION_MMC     11 /* Function = 11, desk mode */
> +
> +#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
> +#define DYTC_MODE_QUIET       3  /* low power mode aka quiet */
> +#define DYTC_MODE_BALANCE   0xF  /* default mode aka balance */
> 
>  static bool dytc_lapmode;
> +static bool dytc_mode_available;
> 
>  static void dytc_lapmode_notify_change(void)
>  {
> @@ -9822,7 +9845,81 @@ static int dytc_command(int command, int *output)
>  	return 0;
>  }
> 
> +static int dytc_perfmode_get(int *perfmode, int *funcmode)
> +{
> +	int output, err;
> +
> +	if (!dytc_mode_available)
> +		return -ENODEV;
> +
> +	err = dytc_command(DYTC_CMD_GET, &output);
> +	if (err)
> +		return err;
> +	*funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +
> +	if (*funcmode == DYTC_FUNCTION_CQL) {
> +		int dummy;
> +		/* We can't get the mode when in CQL mode - so we disable CQL
> +		 * mode retrieve the mode and then enable it again.
> +		 */
> +		err = dytc_command(0x000F1001 /*Disable CQL*/, &dummy);
> +		if (err)
> +			return err;
> +		err = dytc_command(DYTC_CMD_GET, &output);
> +		if (err)
> +			return err;
> +		err = dytc_command(0x001F1001 /*Enable CQL*/, &dummy);
> +		if (err)
> +			return err;
> +	}
> +	*perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
> +	return 0;
> +}
> +
> +static int dytc_perfmode_set(int perfmode)
> +{
> +	int err, dytc_set;
> +	int output;
> +	int cur_perfmode, cur_funcmode;
> +
> +	if (!dytc_mode_available)
> +		return -ENODEV;
> +
> +	if (perfmode == DYTC_MODE_BALANCE) {
> +		/* To get back to balance mode we just issue a reset command */
> +		err = dytc_command(DYTC_CMD_RESET, &output);
> +		if (err)
> +			return err;
> +	} else {
> +		/* Determine if we are in CQL mode. This alters the commands we do
> */
> +		err = dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
> +		if (err)
> +			return err;
> +
> +		if (cur_funcmode == DYTC_FUNCTION_CQL) {
> +			/* To set the mode we need to disable CQL first*/
> +			err = dytc_command(0x000F1001 /*Disable CQL*/, &output);

Why not put 0x000F1001 and 0x001F1001 as defines at the top?

> +			if (err)
> +				return err;
> +		}
> +		dytc_set = (1 << DYTC_SET_VALID_BIT) |
> +			(DYTC_FUNCTION_MMC << DYTC_SET_FUNCTION_BIT) |
> +			(perfmode << DYTC_SET_MODE_BIT) |
> +			DYTC_CMD_SET;
> +		err = dytc_command(dytc_set, &output);
> +		if (err)
> +			return err;
> +		if (cur_funcmode == DYTC_FUNCTION_CQL) {
> +			err = dytc_command(0x001F1001 /*Enable CQL*/, &output);
> +			if (err)
> +				return err;
> +		}
> +	}
> +	return 0;
> +}
> +
>  static int dytc_lapmode_get(bool *state)
> +
>  {
>  	int output, err;
> 
> @@ -9846,6 +9943,77 @@ static void dytc_lapmode_refresh(void)
>  	dytc_lapmode_notify_change();
>  }
> 
> +/* sysfs perfmode entry */
> +static ssize_t dytc_perfmode_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	int err;
> +	int perfmode, funcmode;
> +
> +	err = dytc_perfmode_get(&perfmode, &funcmode);
> +	if (err)
> +		return err;
> +
> +	switch (perfmode) {
> +	case DYTC_MODE_PERFORM:
> +		/* High performance is only available in deskmode */
> +		if (funcmode == DYTC_FUNCTION_CQL)
> +			return snprintf(buf, PAGE_SIZE, "Medium (Reduced as lapmode
> active)\n");
> +		else
> +			return snprintf(buf, PAGE_SIZE, "High\n");
> +	case DYTC_MODE_QUIET:
> +		return snprintf(buf, PAGE_SIZE, "Low\n");
> +	case DYTC_MODE_BALANCE:
> +		return snprintf(buf, PAGE_SIZE, "Medium\n");
> +	default:
> +		return snprintf(buf, PAGE_SIZE, "Unknown (%d)\n", perfmode);
> +	}
> +}

I think it's pretty confusing that you write "H/M/L" into this file, but you
get back a full string.

> +
> +static ssize_t dytc_perfmode_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	int err;
> +
> +	switch (buf[0]) {
> +	case 'l':
> +	case 'L':
> +		err = dytc_perfmode_set(DYTC_MODE_QUIET);
> +		break;
> +	case 'm':
> +	case 'M':
> +		err = dytc_perfmode_set(DYTC_MODE_BALANCE);
> +		break;
> +	case 'h':
> +	case 'H':
> +		err = dytc_perfmode_set(DYTC_MODE_PERFORM);
> +		break;
> +	default:
> +		err = -EINVAL;
> +		pr_err("Unknown operating mode. Ignoring\n");

Shouldn't this be dev_err?

> +		break;
> +	}
> +	if (err)
> +		return err;
> +
> +	tpacpi_disclose_usertask(attr->attr.name,
> +				"Performance mode set to %c\n", buf[0]);
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dytc_perfmode);
> +
> +static struct attribute *dytc_perfmode_attributes[] = {
> +	&dev_attr_dytc_perfmode.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group dytc_perf_attr_group = {
> +	.attrs = dytc_perfmode_attributes,
> +};
> +
>  /* sysfs lapmode entry */
>  static ssize_t dytc_lapmode_show(struct device *dev,
>  					struct device_attribute *attr,
> @@ -9856,22 +10024,22 @@ static ssize_t dytc_lapmode_show(struct device *dev,
> 
>  static DEVICE_ATTR_RO(dytc_lapmode);
> 
> -static struct attribute *dytc_attributes[] = {
> +static struct attribute *dytc_lap_attributes[] = {
>  	&dev_attr_dytc_lapmode.attr,
>  	NULL,
>  };
> 
> -static const struct attribute_group dytc_attr_group = {
> -	.attrs = dytc_attributes,
> +static const struct attribute_group dytc_lap_attr_group = {
> +	.attrs = dytc_lap_attributes,
>  };
> 
>  static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
>  {
> -	int err;
> +	int err, output;
> 
> -	err = dytc_lapmode_get(&dytc_lapmode);
> +	err = dytc_command(DYTC_CMD_QUERY, &output);
>  	/* If support isn't available (ENODEV) then don't return an error
> -	 * but just don't create the sysfs group
> +	 * just don't create the sysfs group
>  	 */
>  	if (err == -ENODEV)
>  		return 0;
> @@ -9879,14 +10047,37 @@ static int tpacpi_dytc_init(struct ibm_init_struct
> *iibm)
>  	if (err)
>  		return err;
> 
> +	/* Check DYTC is enabled and supports mode setting */
> +	dytc_mode_available = false;
> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
> +		/* Only DYTC v5.0 and later has this feature. */
> +		int dytc_version;
> +
> +		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
> +		if (dytc_version >= 5) {
> +			pr_info("DYTC thermal mode configuration available\n");

I would argue this isn't useful to most people.
1) You should decrease this to debug for use with dynamic debugging
2) Output in the log what integer value you returned back in case of a need
to identify future firmware bugs.

> +			dytc_mode_available = true;

I think you shouldn't set this flag until after the group is actually created.

> +			/* Platform supports this feature - create the group */
> +			err = sysfs_create_group(&tpacpi_pdev->dev.kobj,
> &dytc_perf_attr_group);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	err = dytc_lapmode_get(&dytc_lapmode);
> +	if (err)
> +		return err;
> +
>  	/* Platform supports this feature - create the group */
> -	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
>  	return err;
>  }
> 
>  static void dytc_exit(void)
>  {
> -	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
> +	if (dytc_mode_available)
> +		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
>  }
> 
>  static struct ibm_struct dytc_driver_data = {
> --
> 2.26.2
