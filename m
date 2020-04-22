From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/1] platform/x86: Add Slim Bootloader firmware update
 signaling driver
Date: Wed, 22 Apr 2020 16:42:03 +0300
Message-ID: <CAHp75VeV+HOditUphBkFoy6LLh6QKfBoC-eLixquAHLTwaz4RQ@mail.gmail.com>
References: <20200420194405.8281-1-jithu.joseph@intel.com> <20200420194405.8281-2-jithu.joseph@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200420194405.8281-2-jithu.joseph@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jithu Joseph <jithu.joseph@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, maurice.ma@intel.com, ravi.p.rangarajan@intel.com, sean.v.kelley@intel.com, kuo-lang.tseng@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 20, 2020 at 10:50 PM Jithu Joseph <jithu.joseph@intel.com> wrote:
>
> Slim Bootloader(SBL) [1] is a small open-source boot firmware,
> designed for running on certain Intel platforms. SBL can be
> thought-of as fulfilling the role of a minimal BIOS
> implementation, i.e initializing the hardware and booting
> Operating System.
>
> Since SBL is not UEFI compliant, firmware update cannot be triggered
> using standard UEFI runtime services. Further considering performance
> impact, SBL doesn't look for a firmware update image on every reset
> and does so only when firmware update signal is asserted.
>
> SBL exposes an ACPI-WMI device which comes up in sysfs as
> /sys/bus/wmi/44FADEB1xxx and this driver adds a
> "firmware_update_request" device attribute. This attribute normally
> has a value of 0 and userspace can signal SBL to update firmware,
> on next reboot, by writing a value of 1:
>
> echo 1 > /sys/bus/wmi/devices/44FADEB1-B204-40F2-8581-394BBDC1B651/firmware_update_request
>
> This driver only implements a signaling mechanism, the actual firmware
> update process and various details like firmware update image format,
> firmware image location etc are defined by SBL [2] and are not in the
> scope of this driver.

I have noticed that it misses ABI documentation. So, please add. Also
some comments below.

...

> [1] https://slimbootloader.github.io
> [2] https://slimbootloader.github.io/security/firmware-update.html

Can you add a DocLink: tag below for the reference to the official
documentation?

...

> +SLIM BOOTLOADER (SBL) FIRMWARE UPDATE WMI DRIVER
> +M:     Jithu Joseph <jithu.joseph@intel.com>
> +R:     Maurice Ma <maurice.ma@intel.com>
> +S:     Maintained
> +W:     https://slimbootloader.github.io/security/firmware-update.html
> +F:     drivers/platform/x86/sbl_fwu_wmi.c

I hope you run latest and greatest version of checkpatch.pl and it's
okay with this section.

...

> @@ -114,6 +114,16 @@ config XIAOMI_WMI
>           To compile this driver as a module, choose M here: the module will
>           be called xiaomi-wmi.
>
> +config SBL_FWU_WMI
> +       tristate "WMI driver for Slim Bootloader firmware update signaling"
> +       depends on ACPI_WMI
> +       help
> +         Say Y here if you want to be able to use the WMI interface to signal
> +         Slim Bootloader to trigger update on next reboot.
> +
> +         To compile this driver as a module, choose M here: the module will
> +         be called sbl-fwu-wmi.

> @@ -15,6 +15,7 @@ obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)   += intel-wmi-thunderbolt.o
>  obj-$(CONFIG_MXM_WMI)                  += mxm-wmi.o
>  obj-$(CONFIG_PEAQ_WMI)                 += peaq-wmi.o
>  obj-$(CONFIG_XIAOMI_WMI)               += xiaomi-wmi.o
> +obj-$(CONFIG_SBL_FWU_WMI)              += sbl_fwu_wmi.o

I didn't get an ordering schema in above files.
Shouldn't be rather alphasort?

...

> +static ssize_t firmware_update_request_store(struct device *dev,
> +                                            struct device_attribute *attr,
> +                                            const char *buf, size_t count)
> +{
> +       bool val;
> +       int ret;
> +
> +       ret = kstrtobool(buf, &val);
> +       if (ret)
> +               return ret;
> +

> +       ret = set_fwu_request(dev, val ? 1 : 0);

Hmm... If you are going to extend this, why not to pass integer
directly? (And thus take one from user)

> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}

> +

Extra blank line.

> +static DEVICE_ATTR_RW(firmware_update_request);
> +
> +static struct attribute *firmware_update_attrs[] = {
> +       &dev_attr_firmware_update_request.attr,
> +       NULL
> +};

> +

Extra blank line.

> +ATTRIBUTE_GROUPS(firmware_update);

...

> +MODULE_DEVICE_TABLE(wmi, sbl_fwu_wmi_id_table);

Move it closer to the table structure.

-- 
With Best Regards,
Andy Shevchenko
