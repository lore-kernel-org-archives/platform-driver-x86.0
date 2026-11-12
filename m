Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.46.171.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514694;
	b=XIehB8aJfAcvGqJYUU2tgQXwShVl1+vsr+1WMRZNkOiDd0r/T6saIoGyFy43o7p7EFcS
	 IM9wRVrKdlpJp/TKD1HMgQzDSQfrXrP3CYEObIKVh/nBmteJCIaHKd7dLwsWXq7sNfg7i
	 t9PeVqGjZ+qB7RNGpmdM2OtyH4jHBsKSwmlKaY+uHSdThiKd8xnrUly4v5w5JRb9XtptR
	 S0lbleJCdLU2ssiQ+AvB76D2pxtbtPmRoOjq0rAiV7hp6ACwC9KPQe2mRKctcbhjESOwI
	 Mu86bRUDu5BXdJxO3/YgsB6GzzxzxIvdo8NiS/dse5U4EouO/Sj4ZTNpu1iyIXEYwRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514694;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=oCp10RO+jykX6nh8+oWUvgkuTw62mXWM+Aa3/9kcvNA=;
	b=2yF7pEq1vfjAxErzZd+JYk4oRnjrJD5eTK04S3qofExPALLYIv+OrHO3mfizxi3QvIme
	 rsxnicWVk1AWCsLkpvbvwA4Z1wlewfNngPFZjL5e9cpuUe2YYBYdr9dlipbFv/qHJtwih
	 P7flxT4G2xeVPWQ48M67PSfyGFQes4f3mPpWkxtZEMH1dG6ejEZsYH7V64PJf+wJB+fC1
	 eeX16WFrwtoZxXfCjR6lBooL+4N1/WwpkJbB95yHiTesFRB3FzFIMEIgiYxAzcpZZAMYx
	 UVgpuRc1cgeGKPbQ3TV/XK9AUflOm0VqUfbhBU18ZTIdV5hhhkFLPwd8IEttUGR4oGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=DouRLLcr;
	arc=none smtp.remote-ip=78.46.171.57
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B42606A323
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 20:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B42606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=DouRLLcr
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 76CE1C7A32
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 22:18:05 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 4E6A5C7A30
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 22:18:04 +0200 (EET)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 770751FF200
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 22:18:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1794514683;
	bh=oCp10RO+jykX6nh8+oWUvgkuTw62mXWM+Aa3/9kcvNA=;
	h=Received:From:Subject:To;
	b=DouRLLcrVJZACRWfyUeqJDHLj50KhgXQ2o7mmy6mADxy63h8gLovXgBtvPbjKtPQD
	 AozCS4FZzumc+9oYZLVKSCdKZTRsp9Prk0syg+YI8Ds4ae5bD69QMsLD3aXYJbQ9ju
	 /uEUHYTBoOUD5xSa8992C/tU56xgvvoj/uFmWBzRsij9C+7iUQOHuVXV3JFBMPMJlq
	 gyOUAklYmisZprgXWTzqQjo7DDjt6EWmR2kBuqv5XvkPkvGTHWcI8O7/6jKVnqsF1D
	 yi1CH63Mg35aUoDyO8L1H/BIIwohYk0F2NweEHy8lXWYjoLVGiB+CjYkeSuOCVeg1F
	 iAmvRTJw2Jrsw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.41) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f41.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3b09a83d12aso164111a91.2
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 12 Nov 2026 12:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErEWPw5pynzjP42tDq0eQrQR45HAiWqqx67B6GA9QO2gpPv88hH3FrYkc2aGn+8Yd/V/wlg/6DLtqhNP1+v+eGXgrr2a@vger.kernel.org
X-Gm-Message-State: APuU4Z/y4I4zlhJFN3MTKKeLTU8fSlcVbHwr5ucRAexk17yARax/L97z
	l7pMXJ7JjTuTYSf5+GK8rGs/Q7TbiAF8qfoK10zHbHMdF+nvaaeATkk/H0FESiNMFwsaJXUSI/8
	OSg+mLNlrinEXPKQ/IfHCDB7bdecz6b0=
X-Received: by 2002:a17:90b:2543:b0:3b1:ae88:5c31 with SMTP id
 98e67ed59e1d1-3b1b0cc9714mr187431a91.43.1794514680813; Thu, 12 Nov 2026
 12:18:00 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-ayaneo-ec-module-power-v1-1-00d42014bed3@jler.org>
In-Reply-To: <20261112-ayaneo-ec-module-power-v1-1-00d42014bed3@jler.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 12 Nov 2026 21:17:49 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEVkdSpY==gBPE4E+10Ggs3zowYGWqjw2p+z1Jh9nNi6g@mail.gmail.com>
X-Gm-Features: AclHuK-BPFs-BFNAjJjl4LREkB81AzejKKi14MW70FR7X1QsXTPuVy5ZVN-Iyhk
Message-ID: 
 <CAGwozwEVkdSpY==gBPE4E+10Ggs3zowYGWqjw2p+z1Jh9nNi6g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ayaneo-ec: Restore controller power when
 the modules are refitted
To: lily@jler.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?B?TWF0w61hcyBNYXJ0w61uZXo=?= <hello@matias.me>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179451468298.1377315.2835780817693072046@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 12 Nov 2026 at 21:06, lilytaylor42 via B4 Relay
<devnull+lily.jler.org@kernel.org> wrote:
>
> From: lilytaylor42 <lily@jler.org>
>
> On the AYANEO 3, releasing a Magic Module means writing the eject
> command and then turning controller power off. Once the modules are
> fitted again, power has to be turned back on before the controller
> reappears. Today userspace has to watch for that. If nothing is
> running when the modules are refitted, the controller stays off and
> the device has no built-in input.
>
> The EC raises no event when a module is attached or removed, so poll
> the module register while controller power is off. Once a module has
> been taken out and both are attached again for a second, turn the
> power back on, as the vendor's Windows software does. Power turned off
> with both modules left in place stays off. Notify controller_modules
> and controller_power so userspace can poll() instead of re-reading.
>
> The investigation, code and this changelog were produced with an AI
> coding assistant (Claude Code). It decompiled the DSDT and traced EC
> query events to confirm that module changes raise no event, wrote the
> patch, and ran the tests below on my AYANEO 3 while I removed and
> refitted the modules.
>
> Signed-off-by: lilytaylor42 <lily@jler.org>
> ---
> Built in-tree on platform-drivers-x86 for-next (568051916) with W=1 and
> x86_64_defconfig plus AYANEO_EC=m: no warnings before or after.
>
> Tested on an AYANEO 3 (Bazzite 45, 7.3.3 kernel), built as a module
> against the running kernel, with no userspace module handling running:
> after eject and power off, refitting both modules turned power back on
> 1.2 s after both were seated and the controller re-enumerated. Power
> turned off with both modules attached stayed off.
>
> Independent of this patch: after power returns, the controller first
> connects in a state that does not answer GET_DESCRIPTOR and reconnects
> about 11 s later, so enumeration takes ~32 s with the default scheme and
> ~12 s with the port's old_scheme quirk set. That happens with the
> unpatched driver too.

Hi,
this is the responsibility of the program that powered off the
controller. This driver contains no logic for when to power or unpower
the controller. It only provides a hook for userspace to access the EC
addresses required for it.

If this driver was the one to power off the controller this would make
sense. But that's not the case. You used software to eject the modules
and turn off the controller. Therefore, you should expect that
software to decide when to turn on the controller again.

AYANEO_MODULE_SETTLE is especially problematic since you are embedding
logic into the driver about arbitrarily turning on the controller. In
this case, you'd use something like a new abi auto, to decide to turn
on the controller automatically. This would not interfere with current
software that handles polling on its own, such as hhd. But it is a
large code change compared to making the userspace software that
initiated the ejection handle it.

Best,
Antheas

> ---
>  Documentation/ABI/testing/sysfs-platform-ayaneo-ec | 10 ++-
>  drivers/platform/x86/ayaneo-ec.c                   | 90 ++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> index 4cffbf5fc..8c70be0c3 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> @@ -7,13 +7,21 @@ Description:
>                 the controller power (e.g. for power savings). Write 1 to
>                 turn on, 0 to turn off. File is readable and writable.
>
> +               After power is turned off, the driver turns it back on
> +               once a module has been removed and both modules are
> +               attached again, as the Windows software for this device
> +               does. Power turned off with both modules left attached
> +               stays off. Userspace can poll() this file for changes.
> +
>  What:          /sys/devices/platform/ayaneo-ec/controller_modules
>  Date:          Nov 2025
>  KernelVersion: 6.19
>  Contact:       "Antheas Kapenekakis"  <lkml@antheas.dev>
>  Description:
>                 Shows which controller modules are currently connected to
> -               the device. Possible values are "left", "right" and "both".
> +               the device. Possible values are "left", "right", "both"
> +               and "none". While controller power is off, changes can be
> +               waited for with poll().
>                 File is read-only. The Windows software for this device
>                 will only set controller power to 1 if both module sides
>                 are connected (i.e. this file returns "both").
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> index 7c6a06330..3f89f8f9d 100644
> --- a/drivers/platform/x86/ayaneo-ec.c
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -9,6 +9,7 @@
>
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
> @@ -19,6 +20,7 @@
>  #include <linux/pm.h>
>  #include <linux/power_supply.h>
>  #include <linux/sysfs.h>
> +#include <linux/workqueue.h>
>  #include <acpi/battery.h>
>
>  #define AYANEO_PWM_ENABLE_REG   0x4A
> @@ -43,6 +45,13 @@
>  #define AYANEO_MODULE_RIGHT    BIT(1)
>  #define AYANEO_MODULE_MASK     (AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)
>
> +/*
> + * The EC raises no event when a module is attached or removed, so the
> + * module register is polled, and only while controller power is off.
> + */
> +#define AYANEO_MODULE_POLL_MS  500
> +#define AYANEO_MODULE_SETTLE   3       /* polls with both attached before power on */
> +
>  struct ayaneo_ec_quirk {
>         bool has_fan_control;
>         bool has_charge_control;
> @@ -58,6 +67,12 @@ struct ayaneo_ec_platform_data {
>         struct mutex hwmon_lock;
>         bool restore_charge_limit;
>         bool restore_pwm;
> +
> +       /* Turns controller power back on once the modules are refitted */
> +       struct delayed_work module_work;
> +       bool module_removed;
> +       unsigned int module_settle;
> +       u8 module_state;
>  };
>
>  static const struct ayaneo_ec_quirk quirk_fan = {
> @@ -395,11 +410,69 @@ static int ayaneo_remove_battery(struct power_supply *battery,
>         return 0;
>  }
>
> +static void ayaneo_module_watch(struct ayaneo_ec_platform_data *data)
> +{
> +       data->module_removed = false;
> +       data->module_settle = 0;
> +       data->module_state = AYANEO_MODULE_MASK;
> +       queue_delayed_work(system_freezable_wq, &data->module_work,
> +                          msecs_to_jiffies(AYANEO_MODULE_POLL_MS));
> +}
> +
> +/*
> + * While controller power is off, wait for a module to be taken out and
> + * for both modules to be attached again, then turn the power back on.
> + * This mirrors the vendor's Windows software and means a refitted
> + * controller works even when no userspace program is watching. Power
> + * turned off with both modules left in place stays off.
> + */
> +static void ayaneo_module_work(struct work_struct *work)
> +{
> +       struct ayaneo_ec_platform_data *data =
> +               container_of(to_delayed_work(work), struct ayaneo_ec_platform_data,
> +                            module_work);
> +       struct kobject *kobj = &data->pdev->dev.kobj;
> +       u8 power, modules;
> +
> +       if (ec_read(AYANEO_POWER_REG, &power) ||
> +           ec_read(AYANEO_MODULE_REG, &modules))
> +               goto again;
> +
> +       /* Turned back on elsewhere, e.g. by userspace */
> +       if (power == AYANEO_POWER_ON)
> +               return;
> +
> +       modules = ~modules & AYANEO_MODULE_MASK;
> +       if (modules != data->module_state) {
> +               data->module_state = modules;
> +               sysfs_notify(kobj, NULL, "controller_modules");
> +       }
> +
> +       if (modules != AYANEO_MODULE_MASK) {
> +               data->module_removed = true;
> +               data->module_settle = 0;
> +               goto again;
> +       }
> +
> +       if (!data->module_removed || ++data->module_settle < AYANEO_MODULE_SETTLE)
> +               goto again;
> +
> +       if (!ec_write(AYANEO_POWER_REG, AYANEO_POWER_ON)) {
> +               sysfs_notify(kobj, NULL, "controller_power");
> +               return;
> +       }
> +
> +again:
> +       queue_delayed_work(system_freezable_wq, &data->module_work,
> +                          msecs_to_jiffies(AYANEO_MODULE_POLL_MS));
> +}
> +
>  static ssize_t controller_power_store(struct device *dev,
>                                       struct device_attribute *attr,
>                                       const char *buf,
>                                       size_t count)
>  {
> +       struct ayaneo_ec_platform_data *data = dev_get_drvdata(dev);
>         bool value;
>         int ret;
>
> @@ -407,10 +480,15 @@ static ssize_t controller_power_store(struct device *dev,
>         if (ret)
>                 return ret;
>
> +       cancel_delayed_work_sync(&data->module_work);
> +
>         ret = ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYANEO_POWER_OFF);
>         if (ret)
>                 return ret;
>
> +       if (!value)
> +               ayaneo_module_watch(data);
> +
>         return count;
>  }
>
> @@ -518,6 +596,18 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
>                         return PTR_ERR(hwdev);
>         }
>
> +       if (data->quirks->has_magic_modules) {
> +               u8 power;
> +
> +               ret = devm_delayed_work_autocancel(&pdev->dev, &data->module_work,
> +                                                  ayaneo_module_work);
> +               if (ret)
> +                       return ret;
> +
> +               if (!ec_read(AYANEO_POWER_REG, &power) && power == AYANEO_POWER_OFF)
> +                       ayaneo_module_watch(data);
> +       }
> +
>         if (data->quirks->has_charge_control) {
>                 data->battery_hook.add_battery = ayaneo_add_battery;
>                 data->battery_hook.remove_battery = ayaneo_remove_battery;
>
> ---
> base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
> change-id: 20261112-ayaneo-ec-module-power-66f183285f3e
>
> Best regards,
> --
> lilytaylor42 <lily@jler.org>
>
>
>

