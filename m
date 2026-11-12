Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517447;
	b=1PM2h46r5VqO3JpbJGYw9AZpAgbAeYfPjJNNIe99vJZgqAOMhH5XCH9recWYVov0cJNH
	 BX6eYL2/QkP1vt7h4rQL4IWMPhygGF5DUhuP3leR7FLOvNDqvbj5K12OvEnjdD27EqILm
	 cqRxAoSqGlIWRohNmrQU42JNQu0z5ywHDn4NXF/2BEW8EWhaoJhKfBLry7nfHzg47NlR7
	 NPE8q41SI6j6j4awsbLETdmfvGQ3+I/L2amXkX7gNqLXeclrM2NtqFg7N05jmvz8jcu4H
	 h+/yBYOVi3kFD0i7n6RIJpqF9DpSHwOjy3haFYabkA99U9ooAKWxlJvUPBtpn/5ZJ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517447;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Subject:Message-ID:
	 Date:From:To:Cc:Reply-To:X-WS-Location:References:In-Reply-To:
	 X-Mailer:X-WS-User-Origin:X-WS-User-Mbox:X-WS-LOCALE:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=yxolAtf7QNMOiBL160312RWUw/Z3tmCv6VZhTsBZaMg=;
	b=pb1WlUWLxYeknIOFr5w+ufXBkk8Wf/tWrHjuZt+M3Ikh4Z2ZTdF4K79qpjqF8pocXkOo
	 LYExOh94pRwYgU2ktgDZ5+ilVQguI6ZMnthASfIXvtRrDECMbe1Bf/6KVwG1C1ql2+Qqd
	 S7T8qYNBLS9opRZ8AEYNP3XhA453BjT/DjUjvXTadkRsIGf1rS0BgNvBoy4uuHO7hguSe
	 cPtROtwl1n9IbNENk4pZ4rKmbal4QBSg26qV0N0+4r4ObEN1UettoYbHC8NRai8gv1ju2
	 c67UkUlGDEb4pan20/m2dBmR+XPj4KeUNHifFt3VpnvXs273DwvO38kbmpEJaX1h2pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jler.org;
	spf=pass smtp.mailfrom=jler.org;
	dkim=pass header.d=jler.org header.i=@jler.org header.a=rsa-sha256 header.s=20250203 header.b=T5DYiI+P;
	arc=none smtp.remote-ip=185.125.25.12
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A05606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 21:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7A05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jler.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jler.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jler.org header.i=@jler.org header.a=rsa-sha256 header.s=20250203 header.b=T5DYiI+P
Received: from smtp-4-0001 (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jQXtk2G8hz9mF;
	Thu, 12 Nov 2026 22:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jler.org;
	s=20250203; t=1794517438;
	bh=yxolAtf7QNMOiBL160312RWUw/Z3tmCv6VZhTsBZaMg=;
	h=Subject:Date:From:To:Cc:Reply-To:References:In-Reply-To:From;
	b=T5DYiI+PXo4tEkDzlSeC+6PnFz403U+Gt4d16BV+g7VwVcekpS4TMciefT/vtL2xd
	 RUPjZ6L6DhugY24f1ktKge51PUKRoebIt4MGrw9jTCweQbeqljiT5CcLajTFY3goh7
	 PiP024k0S7Xr5mu7w0rmV8HCR3paowlh4yac2V0qSgoYD0J2hMXNTzbddcuJCuuk4Z
	 fKez9/6Bf7iHn7Y6Hbf7ho+P+IEDOu3+5N5LVCdXfTVfXpZ1vTIQkjQJKy7zvetg/J
	 tywVCQwjpqjprxM8a4fcClYn/ypp0cKtNRSk66svT3v5lfrHtuaA2LCIEuuDVs+0d+
	 ox+2AsjSq22xQ==
Received: from unknown by smtp-4-0001 (Postfix) with ESMTPA id 4jQXtj2xR8zyHM;
	Thu, 12 Nov 2026 22:03:57 +0100 (CET)
Subject: Re: [PATCH] platform/x86: ayaneo-ec: Restore controller power when
 the modules are refitted
Message-ID: <f995a6c7-46e6-433f-81d7-f51001d310d7@mail.infomaniak.com>
Date: Thu, 12 Nov 2026 22:03:57 +0100
From: office JLER <lily@jler.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, =?utf-8?Q?Mat=C3=ADas_Mart=C3=ADnez?=
 <hello@matias.me>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Reply-To: office JLER <lily@jler.org>
X-WS-Location: eJxzKUpMKykGAAfpAmU-
References: <20261112-ayaneo-ec-module-power-v1-1-00d42014bed3@jler.org>
 <CAGwozwEVkdSpY==gBPE4E+10Ggs3zowYGWqjw2p+z1Jh9nNi6g@mail.gmail.com>
In-Reply-To: <CAGwozwEVkdSpY==gBPE4E+10Ggs3zowYGWqjw2p+z1Jh9nNi6g@mail.gmail.com>
X-Mailer: Infomaniak Workspace (1.3.1392)
X-WS-User-Origin: eyJpdiI6ImRpeThUdHM2V1hSU0NFUUpNNG1IWGc9PSIsInZhbHVlIjoiSnpLNEYyYXZNdWZmcTNVYW0vL3BzUT09IiwibWFjIjoiNzRkOGVmMTMxZWI2Mjk0YzUzNzI5MDZiOGMzYTE3ODRlZDI3NjE3YWQxZDA4N2Q1MzZhNmQ0YzFhZTdlZTE5ZCIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6Ii9sTXRXNStQRThQcDdkWXlXamFkN2c9PSIsInZhbHVlIjoiZlBRTFlHOFo2aThnTENIU09MMHFqdz09IiwibWFjIjoiZjliZDY2YWZhYmMxZGQ5YzNmNDhiY2FhMjNlZTk4MjFiY2RmYWQzZGE1ODI0YjAyYjJkYTJiMTFjZDU3YTkyOCIsInRhZyI6IiJ9
X-WS-LOCALE: en_GB
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Infomaniak-Routing: alpha

Hi Antheas,

On Thu, 12 Nov 2026, Antheas Kapenekakis wrote:
> If this driver was the one to power off the controller this would make
> sense. But that's not the case. You used software to eject the modules
> and turn off the controller. Therefore, you should expect that
> software to decide when to turn on the controller again.

Fair enough. The case I was after was the program that powered off
the controller no longer running when the modules are refitted, but
that is for that program to handle, not something the driver should
cover for.

> In this case, you'd use something like a new abi auto, to decide to turn
> on the controller automatically. This would not interfere with current
> software that handles polling on its own, such as hhd. But it is a
> large code change compared to making the userspace software that
> initiated the ejection handle it.

Agreed, that is more than it is worth. I'll drop this patch and
handle it in userspace.

Thanks for the quick review.

Best,
lilytaylor42

On Thu, 12 Nov 2026 at 21:06, lilytaylor42 via B4 Relay
<devnull+lily.jler.org@kernel.org> wrote:

>  =20
>  From: lilytaylor42 <lily@jler.org>
>=20
>  On the AYANEO 3, releasing a Magic Module means writing the eject
>  command and then turning controller power off. Once the modules are
>  fitted again, power has to be turned back on before the controller
>  reappears. Today userspace has to watch for that. If nothing is
>  running when the modules are refitted, the controller stays off and
>  the device has no built-in input.
>=20
>  The EC raises no event when a module is attached or removed, so poll
>  the module register while controller power is off. Once a module has
>  been taken out and both are attached again for a second, turn the
>  power back on, as the vendor's Windows software does. Power turned off
>  with both modules left in place stays off. Notify controller_modules
>  and controller_power so userspace can poll() instead of re-reading.
>=20
>  The investigation, code and this changelog were produced with an AI
>  coding assistant (Claude Code). It decompiled the DSDT and traced EC
>  query events to confirm that module changes raise no event, wrote the
>  patch, and ran the tests below on my AYANEO 3 while I removed and
>  refitted the modules.
>=20
>  Signed-off-by: lilytaylor42 <lily@jler.org>
>  ---
>  Built in-tree on platform-drivers-x86 for-next (568051916) with W=3D1 an=
d
>  x86_64_defconfig plus AYANEO_EC=3Dm: no warnings before or after.
>=20
>  Tested on an AYANEO 3 (Bazzite 45, 7.3.3 kernel), built as a module
>  against the running kernel, with no userspace module handling running:
>  after eject and power off, refitting both modules turned power back on
>  1.2 s after both were seated and the controller re-enumerated. Power
>  turned off with both modules attached stayed off.
>=20
>  Independent of this patch: after power returns, the controller first
>  connects in a state that does not answer GET_DESCRIPTOR and reconnects
>  about 11 s later, so enumeration takes ~32 s with the default scheme and
>  ~12 s with the port's old_scheme quirk set. That happens with the
>  unpatched driver too.
=20
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


>    ---
>   Documentation/ABI/testing/sysfs-platform-ayaneo-ec | 10 ++-
>   drivers/platform/x86/ayaneo-ec.c                   | 90 +++++++++++++++=
+++++++
>   2 files changed, 99 insertions(+), 1 deletion(-)
>=20
>  diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Docume=
ntation/ABI/testing/sysfs-platform-ayaneo-ec
>  index 4cffbf5fc..8c70be0c3 100644
>  --- a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
>  +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
>  @@ -7,13 +7,21 @@ Description:
>                  the controller power (e.g. for power savings). Write 1 t=
o
>                  turn on, 0 to turn off. File is readable and writable.
>=20
>  +               After power is turned off, the driver turns it back on
>  +               once a module has been removed and both modules are
>  +               attached again, as the Windows software for this device
>  +               does. Power turned off with both modules left attached
>  +               stays off. Userspace can poll() this file for changes.
>  +
>   What:          /sys/devices/platform/ayaneo-ec/controller_modules
>   Date:          Nov 2025
>   KernelVersion: 6.19
>   Contact:       "Antheas Kapenekakis"  <lkml@antheas.dev>
>   Description:
>                  Shows which controller modules are currently connected t=
o
>  -               the device. Possible values are "left", "right" and "bot=
h".
>  +               the device. Possible values are "left", "right", "both"
>  +               and "none". While controller power is off, changes can b=
e
>  +               waited for with poll().
>                  File is read-only. The Windows software for this device
>                  will only set controller power to 1 if both module sides
>                  are connected (i.e. this file returns "both").
>  diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/aya=
neo-ec.c
>  index 7c6a06330..3f89f8f9d 100644
>  --- a/drivers/platform/x86/ayaneo-ec.c
>  +++ b/drivers/platform/x86/ayaneo-ec.c
>  @@ -9,6 +9,7 @@
>=20
>   #include <linux/acpi.h>
>   #include <linux/bits.h>
>  +#include <linux/devm-helpers.h>
>   #include <linux/dmi.h>
>   #include <linux/err.h>
>   #include <linux/hwmon.h>
>  @@ -19,6 +20,7 @@
>   #include <linux/pm.h>
>   #include <linux/power_supply.h>
>   #include <linux/sysfs.h>
>  +#include <linux/workqueue.h>
>   #include <acpi/battery.h>
>=20
>   #define AYANEO_PWM_ENABLE_REG   0x4A
>  @@ -43,6 +45,13 @@
>   #define AYANEO_MODULE_RIGHT    BIT(1)
>   #define AYANEO_MODULE_MASK     (AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGH=
T)
>=20
>  +/*
>  + * The EC raises no event when a module is attached or removed, so the
>  + * module register is polled, and only while controller power is off.
>  + */
>  +#define AYANEO_MODULE_POLL_MS  500
>  +#define AYANEO_MODULE_SETTLE   3       /* polls with both attached befo=
re power on */
>  +
>   struct ayaneo_ec_quirk {
>          bool has_fan_control;
>          bool has_charge_control;
>  @@ -58,6 +67,12 @@ struct ayaneo_ec_platform_data {
>          struct mutex hwmon_lock;
>          bool restore_charge_limit;
>          bool restore_pwm;
>  +
>  +       /* Turns controller power back on once the modules are refitted =
*/
>  +       struct delayed_work module_work;
>  +       bool module_removed;
>  +       unsigned int module_settle;
>  +       u8 module_state;
>   };
>=20
>   static const struct ayaneo_ec_quirk quirk_fan =3D {
>  @@ -395,11 +410,69 @@ static int ayaneo_remove_battery(struct power_supp=
ly *battery,
>          return 0;
>   }
>=20
>  +static void ayaneo_module_watch(struct ayaneo_ec_platform_data *data)
>  +{
>  +       data->module_removed =3D false;
>  +       data->module_settle =3D 0;
>  +       data->module_state =3D AYANEO_MODULE_MASK;
>  +       queue_delayed_work(system_freezable_wq, &data->module_work,
>  +                          msecs_to_jiffies(AYANEO_MODULE_POLL_MS));
>  +}
>  +
>  +/*
>  + * While controller power is off, wait for a module to be taken out and
>  + * for both modules to be attached again, then turn the power back on.
>  + * This mirrors the vendor's Windows software and means a refitted
>  + * controller works even when no userspace program is watching. Power
>  + * turned off with both modules left in place stays off.
>  + */
>  +static void ayaneo_module_work(struct work_struct *work)
>  +{
>  +       struct ayaneo_ec_platform_data *data =3D
>  +               container_of(to_delayed_work(work), struct ayaneo_ec_pla=
tform_data,
>  +                            module_work);
>  +       struct kobject *kobj =3D &data->pdev->dev.kobj;
>  +       u8 power, modules;
>  +
>  +       if (ec_read(AYANEO_POWER_REG, &power) ||
>  +           ec_read(AYANEO_MODULE_REG, &modules))
>  +               goto again;
>  +
>  +       /* Turned back on elsewhere, e.g. by userspace */
>  +       if (power =3D=3D AYANEO_POWER_ON)
>  +               return;
>  +
>  +       modules =3D ~modules & AYANEO_MODULE_MASK;
>  +       if (modules !=3D data->module_state) {
>  +               data->module_state =3D modules;
>  +               sysfs_notify(kobj, NULL, "controller_modules");
>  +       }
>  +
>  +       if (modules !=3D AYANEO_MODULE_MASK) {
>  +               data->module_removed =3D true;
>  +               data->module_settle =3D 0;
>  +               goto again;
>  +       }
>  +
>  +       if (!data->module_removed || ++data->module_settle < AYANEO_MODU=
LE_SETTLE)
>  +               goto again;
>  +
>  +       if (!ec_write(AYANEO_POWER_REG, AYANEO_POWER_ON)) {
>  +               sysfs_notify(kobj, NULL, "controller_power");
>  +               return;
>  +       }
>  +
>  +again:
>  +       queue_delayed_work(system_freezable_wq, &data->module_work,
>  +                          msecs_to_jiffies(AYANEO_MODULE_POLL_MS));
>  +}
>  +
>   static ssize_t controller_power_store(struct device *dev,
>                                        struct device_attribute *attr,
>                                        const char *buf,
>                                        size_t count)
>   {
>  +       struct ayaneo_ec_platform_data *data =3D dev_get_drvdata(dev);
>          bool value;
>          int ret;
>=20
>  @@ -407,10 +480,15 @@ static ssize_t controller_power_store(struct devic=
e *dev,
>          if (ret)
>                  return ret;
>=20
>  +       cancel_delayed_work_sync(&data->module_work);
>  +
>          ret =3D ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYA=
NEO_POWER_OFF);
>          if (ret)
>                  return ret;
>=20
>  +       if (!value)
>  +               ayaneo_module_watch(data);
>  +
>          return count;
>   }
>=20
>  @@ -518,6 +596,18 @@ static int ayaneo_ec_probe(struct platform_device *=
pdev)
>                          return PTR_ERR(hwdev);
>          }
>=20
>  +       if (data->quirks->has_magic_modules) {
>  +               u8 power;
>  +
>  +               ret =3D devm_delayed_work_autocancel(&pdev->dev, &data->=
module_work,
>  +                                                  ayaneo_module_work);
>  +               if (ret)
>  +                       return ret;
>  +
>  +               if (!ec_read(AYANEO_POWER_REG, &power) && power =3D=3D A=
YANEO_POWER_OFF)
>  +                       ayaneo_module_watch(data);
>  +       }
>  +
>          if (data->quirks->has_charge_control) {
>                  data->battery_hook.add_battery =3D ayaneo_add_battery;
>                  data->battery_hook.remove_battery =3D ayaneo_remove_batt=
ery;
>=20
>  ---
>  base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
>  change-id: 20261112-ayaneo-ec-module-power-66f183285f3e
>=20
>  Best regards,
>  --
>  lilytaylor42 <lily@jler.org>
>=20
>=20
>
