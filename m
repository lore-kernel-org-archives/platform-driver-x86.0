From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix
 warning about deprecated hwmon_device_register
Date: Tue, 20 Jun 2017 02:16:33 -0300
Message-ID: <20170620051633.GB15974@khazad-dum.debian.net>
References: <20170620030208.15997-1-kernel@fomichev.me>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170620030208.15997-1-kernel-klOrIKU+5EClnMjI0IkVqw@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Stanislav Fomichev <kernel-klOrIKU+5EClnMjI0IkVqw@public.gmane.org>
Cc: dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 19 Jun 2017, Stanislav Fomichev wrote:
> Use hwmon_device_register_with_groups instead of deprecated
> hwmon_device_register and fix a dmesg warning.
> 
> This patch however changes the userspace API.
> hwmon_device_register_with_groups takes `hwmon' name as an argument and creates
> a name file in the `hwmon' device, not in the `platform_device'. This
> allows us to remove custom `name' device attribute, but in order to make
> lm-sensors happy we also have to move fans and thermal attributes to the
> `hwmon' device.

Can you clarify that with a ls -l of the "before" and "after"?

Also, does it change anything visible to lmsensors users (such as the
sensor/adapter name or address)? If so, please post a "before" and
"after"...

> Even though this patch changes userspace API, it's still compatible with
> the lm-sensors. Starting with lm-sensors 3.0 (circa 2007), it looks at both
> hwmon and the backing device for the name and other attributes.

I am not sure this is OK or not, it *is* an userspace ABI break.  I am
not really opposed to it, as long as it is done properly.  Let's see
what our subsystem maintainers think of it.

That said: the patch is still incomplete, because this driver has
documentation that also needs to be updated...

Please update Documentation/laptops/thinkpad-acpi.txt  with the changes
to the thinkpad_hwmon sensor interfaces.  Search for "hwmon" on that
text, that should locate everything.

Also, please bump "#define TPACPI_SYSFS_VERSION 0x020700" to 0x020800 in
drivers/platform/x86/thinkpad_acpi.c, and update the interface changelog
table at the end of Documentation/laptops/thinkpad-acpi.txt.

(that assumes the change is not a major ABI break, please reply with
that "ls -l" I asked above: we might need to bump that
TPACPI_SYSFS_VERSION to 0x030000, instead...)

> Signed-off-by: Stanislav Fomichev <kernel-klOrIKU+5EClnMjI0IkVqw@public.gmane.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 36 ++++++++++--------------------------
>  1 file changed, 10 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7b6cb0c69b02..0e0a1616f273 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6401,7 +6401,7 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
>  
>  	switch (thermal_read_mode) {
>  	case TPACPI_THERMAL_TPEC_16:
> -		res = sysfs_create_group(&tpacpi_sensors_pdev->dev.kobj,
> +		res = sysfs_create_group(&tpacpi_hwmon->kobj,
>  				&thermal_temp_input16_group);
>  		if (res)
>  			return res;
> @@ -6409,7 +6409,7 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
>  	case TPACPI_THERMAL_TPEC_8:
>  	case TPACPI_THERMAL_ACPI_TMP07:
>  	case TPACPI_THERMAL_ACPI_UPDT:
> -		res = sysfs_create_group(&tpacpi_sensors_pdev->dev.kobj,
> +		res = sysfs_create_group(&tpacpi_hwmon->kobj,
>  				&thermal_temp_input8_group);
>  		if (res)
>  			return res;
> @@ -6426,13 +6426,13 @@ static void thermal_exit(void)
>  {
>  	switch (thermal_read_mode) {
>  	case TPACPI_THERMAL_TPEC_16:
> -		sysfs_remove_group(&tpacpi_sensors_pdev->dev.kobj,
> +		sysfs_remove_group(&tpacpi_hwmon->kobj,
>  				   &thermal_temp_input16_group);
>  		break;
>  	case TPACPI_THERMAL_TPEC_8:
>  	case TPACPI_THERMAL_ACPI_TMP07:
>  	case TPACPI_THERMAL_ACPI_UPDT:
> -		sysfs_remove_group(&tpacpi_sensors_pdev->dev.kobj,
> +		sysfs_remove_group(&tpacpi_hwmon->kobj,
>  				   &thermal_temp_input8_group);
>  		break;
>  	case TPACPI_THERMAL_NONE:
> @@ -8773,7 +8773,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  			fan_attributes[ARRAY_SIZE(fan_attributes)-2] =
>  					&dev_attr_fan2_input.attr;
>  		}
> -		rc = sysfs_create_group(&tpacpi_sensors_pdev->dev.kobj,
> +		rc = sysfs_create_group(&tpacpi_hwmon->kobj,
>  					 &fan_attr_group);
>  		if (rc < 0)
>  			return rc;
> @@ -8781,7 +8781,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  		rc = driver_create_file(&tpacpi_hwmon_pdriver.driver,
>  					&driver_attr_fan_watchdog);
>  		if (rc < 0) {
> -			sysfs_remove_group(&tpacpi_sensors_pdev->dev.kobj,
> +			sysfs_remove_group(&tpacpi_hwmon->kobj,
>  					&fan_attr_group);
>  			return rc;
>  		}
> @@ -8796,7 +8796,7 @@ static void fan_exit(void)
>  		    "cancelling any pending fan watchdog tasks\n");
>  
>  	/* FIXME: can we really do this unconditionally? */
> -	sysfs_remove_group(&tpacpi_sensors_pdev->dev.kobj, &fan_attr_group);
> +	sysfs_remove_group(&tpacpi_hwmon->kobj, &fan_attr_group);
>  	driver_remove_file(&tpacpi_hwmon_pdriver.driver,
>  			   &driver_attr_fan_watchdog);
>  
> @@ -9229,16 +9229,6 @@ static void hotkey_driver_event(const unsigned int scancode)
>  	tpacpi_driver_event(TP_HKEY_EV_HOTKEY_BASE + scancode);
>  }
>  
> -/* sysfs name ---------------------------------------------------------- */
> -static ssize_t thinkpad_acpi_pdev_name_show(struct device *dev,
> -			   struct device_attribute *attr,
> -			   char *buf)
> -{
> -	return snprintf(buf, PAGE_SIZE, "%s\n", TPACPI_NAME);
> -}
> -
> -static DEVICE_ATTR(name, S_IRUGO, thinkpad_acpi_pdev_name_show, NULL);
> -
>  /* --------------------------------------------------------------------- */
>  
>  /* /proc support */
> @@ -9782,8 +9772,6 @@ static void thinkpad_acpi_module_exit(void)
>  	if (tpacpi_hwmon)
>  		hwmon_device_unregister(tpacpi_hwmon);
>  
> -	if (tp_features.sensors_pdev_attrs_registered)
> -		device_remove_file(&tpacpi_sensors_pdev->dev, &dev_attr_name);
>  	if (tpacpi_sensors_pdev)
>  		platform_device_unregister(tpacpi_sensors_pdev);
>  	if (tpacpi_pdev)
> @@ -9904,14 +9892,10 @@ static int __init thinkpad_acpi_module_init(void)
>  		thinkpad_acpi_module_exit();
>  		return ret;
>  	}
> -	ret = device_create_file(&tpacpi_sensors_pdev->dev, &dev_attr_name);
> -	if (ret) {
> -		pr_err("unable to create sysfs hwmon device attributes\n");
> -		thinkpad_acpi_module_exit();
> -		return ret;
> -	}
>  	tp_features.sensors_pdev_attrs_registered = 1;
> -	tpacpi_hwmon = hwmon_device_register(&tpacpi_sensors_pdev->dev);
> +	tpacpi_hwmon = hwmon_device_register_with_groups(
> +		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, NULL);
> +
>  	if (IS_ERR(tpacpi_hwmon)) {
>  		ret = PTR_ERR(tpacpi_hwmon);
>  		tpacpi_hwmon = NULL;

-- 
  Henrique Holschuh

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
