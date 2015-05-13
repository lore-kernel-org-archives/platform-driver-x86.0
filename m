From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [RFC v4] asus-wmi: add fan control
Date: Wed, 13 May 2015 10:21:09 +0200
Message-ID: <CAHR064gu0NUW2sg8DcULu8YaDGeEDvwpv40kyY35ub2QeN3tYQ@mail.gmail.com>
References: <cover.1429653764.git.kastbernd@gmx.de>
	<20150512220927.GA27046@ASUS-Bernd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:36851 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933280AbbEMIVL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 May 2015 04:21:11 -0400
In-Reply-To: <20150512220927.GA27046@ASUS-Bernd>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kast Bernd <kastbernd@gmx.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Wed, May 13, 2015 at 12:09 AM, Kast Bernd <kastbernd@gmx.de> wrote:
> This patch is partially based on Felipe Contrera's earlier patch, that
> was discussed here: https://lkml.org/lkml/2013/10/8/800
> Some problems of that patch are solved, now:
>
> 1) The main obstacle for the earlier patch seemed to be the use of
> virt_to_phys, which is accepted, now
>
> 2) random memory corruption occurred on my notebook, thus DMA-able memory
> is allocated now, which solves this problem
>
> 3) hwmon interface is used instead of the thermal interface, as a
> hwmon device is already set up by this driver and seemed more
> appropriate than the thermal interface
>
> 4) Calling the ACPI-functions was modularized thus it's possible to call
> some multifunctions easily, now (by using
> asus_wmi_evaluate_method_agfn).
>
> Unfortunately the WMI doesn't support controlling both fans on
> a dual-fan notebook because of an restriction in the acpi-method
> "SFNS", that is callable through the wmi. If "SFNV" would be called
> directly even dual fan configurations could be controlled, but not by using
> wmi.
>
> Speed readings only work on auto-mode, thus "-1" will be reported in
> manual mode.
> Additionally the speed readings are reported as hundreds of RPM thus
> they are not too precise.
>
> This patch is tested only on one notebook (N551JK) but a similar module,
> that contained some code to try to control the second fan also, was
> reported to work on an UX32VD, at least for the first fan.
>
> As Felipe already mentioned the low-level functions are described here:
> http://forum.notebookreview.com/threads/fan-control-on-asus-prime-ux31-ux31a-ux32a-ux32vd.705656/
>
> Signed-off-by: Kast Bernd <kastbernd@gmx.de>
> Cc: Corentin Chary <corentin.chary@gmail.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> ---
> Changes for v4:
>         suggested by Darren Hart:
>                 - removed some compiler warnings
>                 - fixed last block comment
>                 - fixed variable ordering
> Changes for v3:
>         suggested by Darren Hart:
>                 - changed formating of multi-line comment blocks
>                 - changed return paths
>                 - changed confusing variable name
> Changes for v2:
>         suggested by Darren Hart:
>                 - variable ordering from longest to shortest
>                 - fail label removed in asus_wmi_evaluate_method_agfn
>                 - removed unnecessary ternary operator
>                 - used NULL instead of 0
>                 - used DEVICE_ATTR_(RO|RW)
>         suggested by Corentin Chary:
>                 - asus_hwmon_agfn_fan_speed split to two functions
>                 - added some logging
>                 - used existing function to clamp values
>         suggested by both:
>                 - updated comments
>                 - tried to return proper error codes
>                 - removed some magic numbers
> These warnings didn't show up - even when compiling with "make W=12".
> Do you use the default settings? Or do I need to change something else to
> get it more verbose?
> Thanks in advance
> Bernd
>  drivers/platform/x86/asus-wmi.c | 344 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 323 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 7543a56..85422d4 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -78,6 +78,7 @@ MODULE_LICENSE("GPL");
>  #define ASUS_WMI_METHODID_GPID         0x44495047 /* Get Panel ID?? (Resol) */
>  #define ASUS_WMI_METHODID_QMOD         0x444F4D51 /* Quiet MODe */
>  #define ASUS_WMI_METHODID_SPLV         0x4C425053 /* Set Panel Light Value */
> +#define ASUS_WMI_METHODID_AGFN         0x4E464741 /* FaN? */
>  #define ASUS_WMI_METHODID_SFUN         0x4E554653 /* FUNCtionalities */
>  #define ASUS_WMI_METHODID_SDSP         0x50534453 /* Set DiSPlay output */
>  #define ASUS_WMI_METHODID_GDSP         0x50534447 /* Get DiSPlay output */
> @@ -150,12 +151,38 @@ MODULE_LICENSE("GPL");
>  #define ASUS_WMI_DSTS_BRIGHTNESS_MASK  0x000000FF
>  #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK  0x0000FF00
>
> +#define ASUS_FAN_DESC                  "cpu_fan"
> +#define ASUS_FAN_MFUN                  0x13
> +#define ASUS_FAN_SFUN_READ             0x06
> +#define ASUS_FAN_SFUN_WRITE            0x07
> +#define ASUS_FAN_CTRL_MANUAL           1
> +#define ASUS_FAN_CTRL_AUTO             2
> +
>  struct bios_args {
>         u32 arg0;
>         u32 arg1;
>  } __packed;
>
>  /*
> + * Struct that's used for all methods called via AGFN. Naming is
> + * identically to the AML code.
> + */
> +struct agfn_args {
> +       u16 mfun; /* probably "Multi-function" to be called */
> +       u16 sfun; /* probably "Sub-function" to be called */
> +       u16 len;  /* size of the hole struct, including subfunction fields */
> +       u8 stas;  /* not used by now */
> +       u8 err;   /* zero on success */
> +} __packed;
> +
> +/* struct used for calling fan read and write methods */
> +struct fan_args {
> +       struct agfn_args agfn;  /* common fields */
> +       u8 fan;                 /* fan number: 0: set auto mode 1: 1st fan */
> +       u32 speed;              /* read: RPM/100 - write: 0-255 */
> +} __packed;
> +
> +/*
>   * <platform>/    - debugfs root directory
>   *   dev_id      - current dev_id
>   *   ctrl_param  - current ctrl_param
> @@ -204,6 +231,10 @@ struct asus_wmi {
>         struct asus_rfkill gps;
>         struct asus_rfkill uwb;
>
> +       bool asus_hwmon_fan_manual_mode;
> +       int asus_hwmon_num_fans;
> +       int asus_hwmon_pwm;
> +
>         struct hotplug_slot *hotplug_slot;
>         struct mutex hotplug_lock;
>         struct mutex wmi_lock;
> @@ -294,6 +325,36 @@ exit:
>         return 0;
>  }
>
> +static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
> +{
> +       struct acpi_buffer input;
> +       u64 phys_addr;
> +       u32 retval;
> +       u32 status = -1;
> +
> +       /*
> +        * Copy to dma capable address otherwise memory corruption occurs as
> +        * bios has to be able to access it.
> +        */
> +       input.pointer = kzalloc(args.length, GFP_DMA | GFP_KERNEL);
> +       input.length = args.length;
> +       if (!input.pointer)
> +               return -ENOMEM;
> +       phys_addr = virt_to_phys(input.pointer);
> +       memcpy(input.pointer, args.pointer, args.length);
> +
> +       status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_AGFN,
> +                                       phys_addr, 0, &retval);
> +       if (!status)
> +               memcpy(args.pointer, input.pointer, args.length);
> +
> +       kfree(input.pointer);
> +       if (status)
> +               return -ENXIO;
> +
> +       return retval;
> +}
> +
>  static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>  {
>         return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval);
> @@ -1022,35 +1083,228 @@ exit:
>  /*
>   * Hwmon device
>   */
> -static ssize_t asus_hwmon_pwm1(struct device *dev,
> -                              struct device_attribute *attr,
> -                              char *buf)
> +static int asus_hwmon_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
> +                                         int *speed)
> +{
> +       struct fan_args args = {
> +               .agfn.len = sizeof(args),
> +               .agfn.mfun = ASUS_FAN_MFUN,
> +               .agfn.sfun = ASUS_FAN_SFUN_READ,
> +               .fan = fan,
> +               .speed = 0,
> +       };
> +       struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +       int status;
> +
> +       if (fan != 1)
> +               return -EINVAL;
> +
> +       status = asus_wmi_evaluate_method_agfn(input);
> +
> +       if (status || args.agfn.err)
> +               return -ENXIO;
> +
> +       if (speed)
> +               *speed = args.speed;
> +
> +       return 0;
> +}
> +
> +static int asus_hwmon_agfn_fan_speed_write(struct asus_wmi *asus, int fan,
> +                                    int *speed)
> +{
> +       struct fan_args args = {
> +               .agfn.len = sizeof(args),
> +               .agfn.mfun = ASUS_FAN_MFUN,
> +               .agfn.sfun = ASUS_FAN_SFUN_WRITE,
> +               .fan = fan,
> +               .speed = speed ?  *speed : 0,
> +       };
> +       struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +       int status;
> +
> +       /* 1: for setting 1st fan's speed 0: setting auto mode */
> +       if (fan != 1 && fan != 0)
> +               return -EINVAL;
> +
> +       status = asus_wmi_evaluate_method_agfn(input);
> +
> +       if (status || args.agfn.err)
> +               return -ENXIO;
> +
> +       if (speed && fan == 1)
> +               asus->asus_hwmon_pwm = *speed;
> +
> +       return 0;
> +}
> +
> +/*
> + * Check if we can read the speed of one fan. If true we assume we can also
> + * control it.
> + */
> +static int asus_hwmon_get_fan_number(struct asus_wmi *asus, int *num_fans)
> +{
> +       int status;
> +       int speed = 0;
> +
> +       *num_fans = 0;
> +
> +       status = asus_hwmon_agfn_fan_speed_read(asus, 1, &speed);
> +       if (!status)
> +               *num_fans = 1;
> +
> +       return 0;
> +}
> +
> +static int asus_hwmon_fan_set_auto(struct asus_wmi *asus)
> +{
> +       int status;
> +
> +       status = asus_hwmon_agfn_fan_speed_write(asus, 0, NULL);
> +       if (status)
> +               return -ENXIO;
> +
> +       asus->asus_hwmon_fan_manual_mode = false;
> +
> +       return 0;
> +}
> +
> +static int asus_hwmon_fan_rpm_show(struct device *dev, int fan)
>  {
>         struct asus_wmi *asus = dev_get_drvdata(dev);
> -       u32 value;
> +       int value;
> +       int ret;
> +
> +       /* no speed readable on manual mode */
> +       if (asus->asus_hwmon_fan_manual_mode)
> +               return -ENXIO;
> +
> +       ret = asus_hwmon_agfn_fan_speed_read(asus, fan+1, &value);
> +       if (ret) {
> +               pr_warn("reading fan speed failed: %d\n", ret);
> +               return -ENXIO;
> +       }
> +
> +       return value;
> +}
> +
> +static void asus_hwmon_pwm_show(struct asus_wmi *asus, int fan, int *value)
> +{
>         int err;
>
> -       err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_CTRL, &value);
> +       if (asus->asus_hwmon_pwm >= 0) {
> +               *value = asus->asus_hwmon_pwm;
> +               return;
> +       }
>
> +       err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_CTRL, value);
>         if (err < 0)
> -               return err;
> +               return;
>
> -       value &= 0xFF;
> -
> -       if (value == 1) /* Low Speed */
> -               value = 85;
> -       else if (value == 2)
> -               value = 170;
> -       else if (value == 3)
> -               value = 255;
> -       else if (value != 0) {
> -               pr_err("Unknown fan speed %#x\n", value);
> -               value = -1;
> +       *value &= 0xFF;
> +
> +       if (*value == 1) /* Low Speed */
> +               *value = 85;
> +       else if (*value == 2)
> +               *value = 170;
> +       else if (*value == 3)
> +               *value = 255;
> +       else if (*value) {
> +               pr_err("Unknown fan speed %#x\n", *value);
> +               *value = -1;
>         }
> +}
> +
> +static ssize_t pwm1_show(struct device *dev,
> +                              struct device_attribute *attr,
> +                              char *buf)
> +{
> +       struct asus_wmi *asus = dev_get_drvdata(dev);
> +       int value;
> +
> +       asus_hwmon_pwm_show(asus, 0, &value);
>
>         return sprintf(buf, "%d\n", value);
>  }
>
> +static ssize_t pwm1_store(struct device *dev,
> +                                    struct device_attribute *attr,
> +                                    const char *buf, size_t count) {
> +       struct asus_wmi *asus = dev_get_drvdata(dev);
> +       int value;
> +       int state;
> +       int ret;
> +
> +       ret = kstrtouint(buf, 10, &value);
> +
> +       if(ret)
> +               return ret;
> +
> +       value = clamp(value, 0, 255);
> +
> +       state = asus_hwmon_agfn_fan_speed_write(asus, 1, &value);
> +       if (state)
> +               pr_warn("Setting fan speed failed: %d\n", state);
> +       else
> +               asus->asus_hwmon_fan_manual_mode = true;
> +
> +       return count;
> +}
> +
> +static ssize_t fan1_input_show(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       char *buf)
> +{
> +       int value = asus_hwmon_fan_rpm_show(dev, 0);
> +
> +       return sprintf(buf, "%d\n", value < 0 ? -1 : value*100);
> +
> +}
> +
> +static ssize_t pwm1_enable_show(struct device *dev,
> +                                                struct device_attribute *attr,
> +                                                char *buf)
> +{
> +       struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +       if (asus->asus_hwmon_fan_manual_mode)
> +               return sprintf(buf, "%d\n", ASUS_FAN_CTRL_MANUAL);
> +
> +       return sprintf(buf, "%d\n", ASUS_FAN_CTRL_AUTO);
> +}
> +
> +static ssize_t pwm1_enable_store(struct device *dev,
> +                                                 struct device_attribute *attr,
> +                                                 const char *buf, size_t count)
> +{
> +       struct asus_wmi *asus = dev_get_drvdata(dev);
> +       int status = 0;
> +       int state;
> +       int ret;
> +
> +       ret = kstrtouint(buf, 10, &state);
> +
> +       if(ret)
> +               return ret;
> +
> +       if (state == ASUS_FAN_CTRL_MANUAL)
> +               asus->asus_hwmon_fan_manual_mode = true;
> +       else
> +               status = asus_hwmon_fan_set_auto(asus);
> +
> +       if (status)
> +               return status;
> +
> +       return count;
> +}
> +
> +static ssize_t fan1_label_show(struct device *dev,
> +                                         struct device_attribute *attr,
> +                                         char *buf)
> +{
> +       return sprintf(buf, "%s\n", ASUS_FAN_DESC);
> +}
> +
>  static ssize_t asus_hwmon_temp1(struct device *dev,
>                                 struct device_attribute *attr,
>                                 char *buf)
> @@ -1069,11 +1323,21 @@ static ssize_t asus_hwmon_temp1(struct device *dev,
>         return sprintf(buf, "%d\n", value);
>  }
>
> -static DEVICE_ATTR(pwm1, S_IRUGO, asus_hwmon_pwm1, NULL);
> +/* Fan1 */
> +static DEVICE_ATTR_RW(pwm1);
> +static DEVICE_ATTR_RW(pwm1_enable);
> +static DEVICE_ATTR_RO(fan1_input);
> +static DEVICE_ATTR_RO(fan1_label);
> +
> +/* Temperature */
>  static DEVICE_ATTR(temp1_input, S_IRUGO, asus_hwmon_temp1, NULL);
>
>  static struct attribute *hwmon_attributes[] = {
>         &dev_attr_pwm1.attr,
> +       &dev_attr_pwm1_enable.attr,
> +       &dev_attr_fan1_input.attr,
> +       &dev_attr_fan1_label.attr,
> +
>         &dev_attr_temp1_input.attr,
>         NULL
>  };
> @@ -1084,19 +1348,28 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
>         struct device *dev = container_of(kobj, struct device, kobj);
>         struct platform_device *pdev = to_platform_device(dev->parent);
>         struct asus_wmi *asus = platform_get_drvdata(pdev);
> -       bool ok = true;
>         int dev_id = -1;
> +       int fan_attr = -1;
>         u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
> +       bool ok = true;
>
>         if (attr == &dev_attr_pwm1.attr)
>                 dev_id = ASUS_WMI_DEVID_FAN_CTRL;
>         else if (attr == &dev_attr_temp1_input.attr)
>                 dev_id = ASUS_WMI_DEVID_THERMAL_CTRL;
>
> +
> +       if (attr == &dev_attr_fan1_input.attr
> +           || attr == &dev_attr_fan1_label.attr
> +           || attr == &dev_attr_pwm1.attr
> +           || attr == &dev_attr_pwm1_enable.attr) {
> +               fan_attr = 1;
> +       }
> +
>         if (dev_id != -1) {
>                 int err = asus_wmi_get_devstate(asus, dev_id, &value);
>
> -               if (err < 0)
> +               if (err < 0 && fan_attr == -1)
>                         return 0; /* can't return negative here */
>         }
>
> @@ -1112,10 +1385,16 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
>                 if (value == ASUS_WMI_UNSUPPORTED_METHOD || value & 0xFFF80000
>                     || (!asus->sfun && !(value & ASUS_WMI_DSTS_PRESENCE_BIT)))
>                         ok = false;
> +               else
> +                       ok = fan_attr <= asus->asus_hwmon_num_fans;
>         } else if (dev_id == ASUS_WMI_DEVID_THERMAL_CTRL) {
>                 /* If value is zero, something is clearly wrong */
> -               if (value == 0)
> +               if (!value)
>                         ok = false;
> +       } else if (fan_attr <= asus->asus_hwmon_num_fans && fan_attr != -1) {
> +               ok = true;
> +       } else {
> +               ok = false;
>         }
>
>         return ok ? attr->mode : 0;
> @@ -1723,6 +2002,25 @@ error_debugfs:
>         return -ENOMEM;
>  }
>
> +static int asus_wmi_fan_init(struct asus_wmi *asus)
> +{
> +       int status;
> +
> +       asus->asus_hwmon_pwm = -1;
> +       asus->asus_hwmon_num_fans = -1;
> +       asus->asus_hwmon_fan_manual_mode = false;
> +
> +       status = asus_hwmon_get_fan_number(asus, &asus->asus_hwmon_num_fans);
> +       if (status) {
> +               asus->asus_hwmon_num_fans = 0;
> +               pr_warn("Could not determine number of fans: %d\n", status);
> +               return -ENXIO;
> +       }
> +
> +       pr_info("Number of fans: %d\n", asus->asus_hwmon_num_fans);
> +       return 0;
> +}
> +
>  /*
>   * WMI Driver
>   */
> @@ -1756,6 +2054,9 @@ static int asus_wmi_add(struct platform_device *pdev)
>         if (err)
>                 goto fail_input;
>
> +       err = asus_wmi_fan_init(asus); /* probably no problems on error */
> +       asus_hwmon_fan_set_auto(asus);
> +
>         err = asus_wmi_hwmon_init(asus);
>         if (err)
>                 goto fail_hwmon;
> @@ -1832,6 +2133,7 @@ static int asus_wmi_remove(struct platform_device *device)
>         asus_wmi_rfkill_exit(asus);
>         asus_wmi_debugfs_exit(asus);
>         asus_wmi_platform_exit(asus);
> +       asus_hwmon_fan_set_auto(asus);
>
>         kfree(asus);
>         return 0;
> --
> 2.4.0
>

The code looks good, I'm not able to test it on any on my WMI machines
right now :/

Acked-By: Corentin Chary <corentin.chary@gmail.com>


-- 
Corentin Chary
http://xf.iksaif.net
