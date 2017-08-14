From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: Expose conservation mode switch
Date: Mon, 14 Aug 2017 23:30:51 +0300
Message-ID: <CAHp75Vdy39u7UdtWZtbox90Tgo5CuyBZBwUh6rZT80GuZByAQA@mail.gmail.com>
References: <cd64f959-5fa0-50e2-183a-70c28aa121d9@in04.sg> <83ebbe48-1b85-e42b-4470-3b1be3450323@in04.sg>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:33251 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752092AbdHNUaw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2017 16:30:52 -0400
In-Reply-To: <83ebbe48-1b85-e42b-4470-3b1be3450323@in04.sg>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hao Wei Tee <angelsl@in04.sg>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Mon, Aug 14, 2017 at 7:13 PM, Hao Wei Tee <angelsl@in04.sg> wrote:
> This exposes the battery conservation mode present on some (?) IdeaPads.
> The mode is set by calling ACPI method SBMC with argument 3 (on) or
> 5 (off). Status is reported in bit 5 of the return value of ACPI method
> GBMD.
>

Pushed to testing, thanks!

> Signed-off-by: Hao Wei Tee <angelsl@in04.sg>
> ---
> v3: Stylistic changes
>
>  drivers/platform/x86/ideapad-laptop.c | 69 +++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 603fc6050971..fe98d4ac0df3 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -42,6 +42,8 @@
>
>  #define IDEAPAD_RFKILL_DEV_NUM (3)
>
> +#define BM_CONSERVATION_BIT (5)
> +
>  #define CFG_BT_BIT     (16)
>  #define CFG_3G_BIT     (17)
>  #define CFG_WIFI_BIT   (18)
> @@ -54,6 +56,11 @@ static const char *const ideapad_wmi_fnesc_events[] = {
>  };
>  #endif
>
> +enum {
> +       BMCMD_CONSERVATION_ON = 3,
> +       BMCMD_CONSERVATION_OFF = 5,
> +};
> +
>  enum {
>         VPCCMD_R_VPC1 = 0x10,
>         VPCCMD_R_BL_MAX,
> @@ -123,6 +130,23 @@ static int read_method_int(acpi_handle handle, const char *method, int *val)
>         }
>  }
>
> +static int method_gbmd(acpi_handle handle, unsigned long *ret)
> +{
> +       int result, val;
> +
> +       result = read_method_int(handle, "GBMD", &val);
> +       *ret = val;
> +       return result;
> +}
> +
> +static int method_sbmc(acpi_handle handle, int cmd)
> +{
> +       acpi_status status;
> +
> +       status = acpi_execute_simple_method(handle, "SBMC", cmd);
> +       return ACPI_FAILURE(status) ? -1 : 0;
> +}
> +
>  static int method_vpcr(acpi_handle handle, int cmd, int *ret)
>  {
>         acpi_status status;
> @@ -250,6 +274,13 @@ static int debugfs_status_show(struct seq_file *s, void *data)
>         if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
>                 seq_printf(s, "Camera status:\t%s(%lu)\n",
>                            value ? "On" : "Off", value);
> +       seq_puts(s, "=====================\n");
> +
> +       if (!method_gbmd(priv->adev->handle, &value)) {
> +               seq_printf(s, "Conservation mode:\t%s(%lu)\n",
> +                          test_bit(BM_CONSERVATION_BIT, &value) ? "On" : "Off",
> +                          value);
> +       }
>
>         return 0;
>  }
> @@ -456,10 +487,45 @@ static ssize_t __maybe_unused touchpad_store(struct device *dev,
>
>  static DEVICE_ATTR_RO(touchpad);
>
> +static ssize_t conservation_mode_show(struct device *dev,
> +                               struct device_attribute *attr,
> +                               char *buf)
> +{
> +       struct ideapad_private *priv = dev_get_drvdata(dev);
> +       unsigned long result;
> +
> +       if (method_gbmd(priv->adev->handle, &result))
> +               return sprintf(buf, "-1\n");
> +       return sprintf(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
> +}
> +
> +static ssize_t conservation_mode_store(struct device *dev,
> +                                struct device_attribute *attr,
> +                                const char *buf, size_t count)
> +{
> +       struct ideapad_private *priv = dev_get_drvdata(dev);
> +       bool state;
> +       int ret;
> +
> +       ret = kstrtobool(buf, &state);
> +       if (ret)
> +               return ret;
> +
> +       ret = method_sbmc(priv->adev->handle, state ?
> +                                             BMCMD_CONSERVATION_ON :
> +                                             BMCMD_CONSERVATION_OFF);
> +       if (ret < 0)
> +               return -EIO;
> +       return count;
> +}
> +
> +static DEVICE_ATTR_RW(conservation_mode);
> +
>  static struct attribute *ideapad_attributes[] = {
>         &dev_attr_camera_power.attr,
>         &dev_attr_fan_mode.attr,
>         &dev_attr_touchpad.attr,
> +       &dev_attr_conservation_mode.attr,
>         NULL
>  };
>
> @@ -477,6 +543,9 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
>                 unsigned long value;
>                 supported = !read_ec_data(priv->adev->handle, VPCCMD_R_FAN,
>                                           &value);
> +       } else if (attr == &dev_attr_conservation_mode.attr) {
> +               supported = acpi_has_method(priv->adev->handle, "GBMD") &&
> +                           acpi_has_method(priv->adev->handle, "SBMC");
>         } else
>                 supported = true;
>
> --
> 2.14.1
>



-- 
With Best Regards,
Andy Shevchenko
