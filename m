Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3DE34D39C
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Nov 2025 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762109194; cv=none; b=Hs9aFwAc8sLbgnf9BixUn+0mZXrjuUjIqiWvcUixBr/XB4TgeNgOfPzCnBpNMhCm2lqpQeoQyAnl4s2tbP+3SZVfuJdcK7LE2lj3q2t4srDe6dadq+bar6XFtRfreN4hli8qoRYDuWkOzROYLGmSvcRjsruvWR88zU0PqIitJRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762109194; c=relaxed/simple;
	bh=r0/zDrVbRSccubM3wNfWk9xxOqcjL68deL73qOUc0eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4zPuR/wdDk0Ymzf2LRtNmm/hCVcEQsu202C1Kg2i3gcTN8dldiJQnfSVPDxMpUYJBgd+LcoLMOP+XnZ9EESVTMnIlMAfos1v3CLbRty1ltONo0Oiw9bDaop+yeNbq7tjjmuO4Eyeud9W7hdlnAmCMV+POdIDybABg+FtV3kcRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=AtB4n4nx; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="AtB4n4nx"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 15C2CBDA41
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Nov 2025 20:46:30 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 620C9BDA6B
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Nov 2025 20:46:29 +0200 (EET)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B39D61FE109
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Nov 2025 20:46:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762109189;
	bh=DG6IjzWim5LfmOq1HhbzVZ7NPGAMuHmOdTowhSECY34=;
	h=Received:From:Subject:To;
	b=AtB4n4nxTUS3Y6Ts7yZ7dU+DTs+6669oV9HsSWXmNnnWUpkyLhPiC653d6ZjWag/z
	 ZdkVihsKKV4JU6tzm29+4P6QYmWIhXae0J2Hc3/lkQZghfrFZdDjjlT7y2QuKkG/Vz
	 vOzBB6GhsKhcWH2co/Jcdueqg/ho8avuXvnZaxVuThjT7ZzW7q1BqksxpQwCJ0NMuc
	 i/rNxJs4jvn6uWqyYyCy2ZElBdWi9YPsS4wFGkoiO2GoQPowBJbYcvZVT1QDYK33Ij
	 Y3cQU/gFhiD+vN3AuBweLSn+DcdV+MiZUsECrz5kMiDA3REP2gi+POvALQGrBNkhmj
	 TqxiQxbMM86uA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-362e291924aso32457981fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Sun, 02 Nov 2025 10:46:28 -0800 (PST)
X-Gm-Message-State: AOJu0YzibBaXU310uwWV7xoqT3sX5luP3JtrfrdkEellq1JbLI25cXm/
	VNzMz2JtAWmFAJzrTnO+FA4W1TK0jKqeC9zSeUF1I+8OMzabVmF07I3oooRicnIkQEmuZ2gkCDE
	ToKEodl55QfWevH31cUqx5U9m3ufR6X8=
X-Google-Smtp-Source: 
 AGHT+IGdsDLsNbeHnejPidq2OjBRvs02gr0Inko+9F7RnDGPN8GlnEDJ/D3HXG4ZMarMKwmfzKHuLr/cWAYdvwRmWAk=
X-Received: by 2002:a2e:b050:0:b0:378:e12f:e5ed with SMTP id
 38308e7fff4ca-37a18dd3837mr24847101fa.39.1762109188140; Sun, 02 Nov 2025
 10:46:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031163651.1465981-1-lkml@antheas.dev>
 <20251031163651.1465981-5-lkml@antheas.dev>
 <7c521e72-1b32-4172-90ec-6e793941a8ed@gmx.de>
In-Reply-To: <7c521e72-1b32-4172-90ec-6e793941a8ed@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 2 Nov 2025 19:46:16 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFRF11dH02SRRNCyiYW7dNuoYoGWfPdEWPoim2r-KoZ0g@mail.gmail.com>
X-Gm-Features: AWmQ_blC-EtmU16ailXtQLIdZ7cMoZmtleYvZfMH9MLu3V1CIJ8yh8dA6hYDegc
Message-ID: 
 <CAGwozwFRF11dH02SRRNCyiYW7dNuoYoGWfPdEWPoim2r-KoZ0g@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] platform/x86: ayaneo-ec: Add controller power and
 modules attributes
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176210918901.1966167.3381131227835020263@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 2 Nov 2025 at 19:30, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 31.10.25 um 17:36 schrieb Antheas Kapenekakis:
>
> > The Ayaneo 3 features hot-swappable controller modules. The ejection
> > and management is done through HID. However, after ejecting the modules,
> > the controller needs to be power cycled via the EC to re-initialize.
> >
> > For this, the EC provides a variable that holds whether the left or
> > right modules are connected, and a power control register to turn
> > the controller on or off. After ejecting the modules, the controller
> > should be turned off. Then, after both modules are reinserted,
> > the controller may be powered on again to re-initialize.
> >
> > This patch introduces two new sysfs attributes:
> >   - `controller_modules`: a read-only attribute that indicates whether
> >     the left and right modules are connected (none, left, right, both).
> >   - `controller_power`: a read-write attribute that allows the user
> >     to turn the controller on or off (with '1'/'0').
> >
> > Therefore, after ejection is complete, userspace can power off the
> > controller, then wait until both modules have been reinserted
> > (`controller_modules` will return 'both') to turn on the controller.
> >
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 ++++
> >   MAINTAINERS                                   |   1 +
> >   drivers/platform/x86/ayaneo-ec.c              | 106 ++++++++++++++++++
> >   3 files changed, 126 insertions(+)
> >   create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> >
> > diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> > new file mode 100644
> > index 000000000000..3c9c3580c685
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> > @@ -0,0 +1,19 @@
> > +What:                /sys/devices/platform/ayaneo-ec/controller_power
> > +Date:                Oct 2025
>
> I think you need to update those dates.
>
> > +KernelVersion:       6.19
> > +Contact:     "Antheas Kapenekakis" <lkml@antheas.dev>
> > +Description:
> > +             Current controller power state. Allows turning on and off
> > +             the controller power (e.g. for power savings). Write 1 to
> > +             turn on, 0 to turn off. File is readable and writable.
> > +
> > +What:                /sys/devices/platform/ayaneo-ec/controller_modules
> > +Date:                Oct 2025
> > +KernelVersion:       6.19
> > +Contact:     "Antheas Kapenekakis"  <lkml@antheas.dev>
> > +Description:
> > +             Shows which controller modules are currently connected to
> > +             the device. Possible values are "left", "right" and "both".
> > +             File is read-only. The Windows software for this device
> > +             will only set controller power to 1 if both module sides
> > +             are connected (i.e. this file returns "both").
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index da9498d8cc89..b4d62ea9a926 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4191,6 +4191,7 @@ AYANEO PLATFORM EC DRIVER
> >   M:  Antheas Kapenekakis <lkml@antheas.dev>
> >   L:  platform-driver-x86@vger.kernel.org
> >   S:  Maintained
> > +F:   Documentation/ABI/testing/sysfs-platform-ayaneo
> >   F:  drivers/platform/x86/ayaneo-ec.c
> >
> >   AZ6007 DVB DRIVER
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > index 697bb053a7d6..0652c044ad76 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -8,6 +8,7 @@
> >    */
> >
> >   #include <linux/acpi.h>
> > +#include <linux/bits.h>
> >   #include <linux/dmi.h>
> >   #include <linux/err.h>
> >   #include <linux/hwmon.h>
> > @@ -16,6 +17,7 @@
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/power_supply.h>
> > +#include <linux/sysfs.h>
> >   #include <acpi/battery.h>
> >
> >   #define AYANEO_PWM_ENABLE_REG        0x4A
> > @@ -32,9 +34,17 @@
> >   #define AYANEO_CHARGE_VAL_AUTO              0xaa
> >   #define AYANEO_CHARGE_VAL_INHIBIT   0x55
> >
> > +#define AYANEO_POWER_REG     0x2d
> > +#define AYANEO_POWER_OFF     0xfe
> > +#define AYANEO_POWER_ON              0xff
> > +#define AYANEO_MODULE_REG    0x2f
> > +#define AYANEO_MODULE_LEFT   BIT(0)
> > +#define AYANEO_MODULE_RIGHT  BIT(1)
>
> Using GENMASK() would make sense here.

Only a single bit is being used though? GENMASK is used for a contiguous series?

> With those issues being fixed:
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
> > +
> >   struct ayaneo_ec_quirk {
> >       bool has_fan_control;
> >       bool has_charge_control;
> > +     bool has_magic_modules;
> >   };
> >
> >   struct ayaneo_ec_platform_data {
> > @@ -46,6 +56,7 @@ struct ayaneo_ec_platform_data {
> >   static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
> >       .has_fan_control = true,
> >       .has_charge_control = true,
> > +     .has_magic_modules = true,
> >   };
> >
> >   static const struct dmi_system_id dmi_table[] = {
> > @@ -266,6 +277,100 @@ static int ayaneo_remove_battery(struct power_supply *battery,
> >       return 0;
> >   }
> >
> > +static ssize_t controller_power_store(struct device *dev,
> > +                                   struct device_attribute *attr,
> > +                                   const char *buf,
> > +                                   size_t count)
> > +{
> > +     bool value;
> > +     int ret;
> > +
> > +     ret = kstrtobool(buf, &value);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYANEO_POWER_OFF);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return count;
> > +}
> > +
> > +static ssize_t controller_power_show(struct device *dev,
> > +                                  struct device_attribute *attr,
> > +                                  char *buf)
> > +{
> > +     int ret;
> > +     u8 val;
> > +
> > +     ret = ec_read(AYANEO_POWER_REG, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return sysfs_emit(buf, "%d\n", val == AYANEO_POWER_ON);
> > +}
> > +
> > +static DEVICE_ATTR_RW(controller_power);
> > +
> > +static ssize_t controller_modules_show(struct device *dev,
> > +                                    struct device_attribute *attr, char *buf)
> > +{
> > +     char *out;
> > +     int ret;
> > +     u8 val;
> > +
> > +     ret = ec_read(AYANEO_MODULE_REG, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (~val & (AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)) {
> > +     case AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT:
> > +             out = "both";
> > +             break;
> > +     case AYANEO_MODULE_LEFT:
> > +             out = "left";
> > +             break;
> > +     case AYANEO_MODULE_RIGHT:
> > +             out = "right";
> > +             break;
> > +     default:
> > +             out = "none";
> > +             break;
> > +     }
> > +
> > +     return sysfs_emit(buf, "%s\n", out);
> > +}
> > +
> > +static DEVICE_ATTR_RO(controller_modules);
> > +
> > +static struct attribute *aya_mm_attrs[] = {
> > +     &dev_attr_controller_power.attr,
> > +     &dev_attr_controller_modules.attr,
> > +     NULL
> > +};
> > +
> > +static umode_t aya_mm_is_visible(struct kobject *kobj,
> > +                              struct attribute *attr, int n)
> > +{
> > +     struct device *dev = kobj_to_dev(kobj);
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +
> > +     if (data->quirks->has_magic_modules)
> > +             return attr->mode;
> > +     return 0;
> > +}
> > +
> > +static const struct attribute_group aya_mm_attribute_group = {
> > +     .is_visible = aya_mm_is_visible,
> > +     .attrs = aya_mm_attrs,
> > +};
> > +
> > +static const struct attribute_group *ayaneo_ec_groups[] = {
> > +     &aya_mm_attribute_group,
> > +     NULL
> > +};
> > +
> >   static int ayaneo_ec_probe(struct platform_device *pdev)
> >   {
> >       const struct dmi_system_id *dmi_entry;
> > @@ -307,6 +412,7 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> >   static struct platform_driver ayaneo_platform_driver = {
> >       .driver = {
> >               .name = "ayaneo-ec",
> > +             .dev_groups = ayaneo_ec_groups,
> >       },
> >       .probe = ayaneo_ec_probe,
> >   };
>

