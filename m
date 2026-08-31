Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC62236F0;
	Mon, 31 Aug 2026 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181413; cv=none; b=BhSKqYXGcd/AGPuXN3UkWMSiyNWNTSAkxOwmihO01s4OktSNMLYAwUzftAcTLZIBGcPMuLBlr3QTieHaOFn0hSNhWo4M5p73Fopsyull0nrgdvjqrrOwLYwP7Y0+FIR0UsprBuUh9ddZEf439B/klCM9bBpa+hAkRSAJbq/rsPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181413; c=relaxed/simple;
	bh=XtUPdsYFn1mOVOjCkjRMDZ03YBjEn7c+cy9iMPCUXdE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ILZAZo1Yo9l+6ReCDlhMUqpubvTSY3jxkY9XRgRBjkk5GP1h7LsKkQKtE1kPMtdue6aJMxh5qddEQIaF0mDnU4SbJmQQwu8F3filo9blfRwRGCKaDcMKEmknRiRMMxhpg4pdS8odgjKqiqtXAJ3959TfotWQAKusCpw/A/D78vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=fGBqiDoX; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="fGBqiDoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788181408; x=1788440608;
	bh=aPwxMk2rsYBjjxhE6Y8L1nF41LH0mUhj0dLpx9uVL24=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fGBqiDoX/sxR4AlBMEwwKvEc3HNIZegtw2Uex+xtO9qSdv2vYhee1te7zsrHbbKck
	 Zo75eQUqTjI/eTRlmwOoxglSXWSQkSZnV4wSE7rvlGQpoBre0XsVERnrNlMInhPacU
	 AHSBICRW/1vY4nHsEddFMa6uuUls5690En4q1ON9DvF4LGNgMGGXCLK4vyF9EXBT6J
	 XQA+fby/ABrv5IINVHoZINUMiiQBomnE6fkKaAn2IkiRPHLtW4L3gi0nqaQItYCoOn
	 eSPWuXRm15wkj3dmsB7jONr7psSIyucm8mDb10f6nayy4pO0zYlju9p5YAOMcihURt
	 YBa97CyP+aXGQ==
Date: Mon, 31 Aug 2026 13:03:22 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Jakob Berg Jespersen <dev@berg.pm>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Message-ID: <20260831130312.26296-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 863ec5437a492b2053965f1de810d528b44bd3f9
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The driver assumes the sensor is already powered when probe() reads its chi=
p
ID. That holds where the rails and clock are ACPI power resources, but not
where an INT3472 companion device registers them as regulators, a clock and=
 a
reset GPIO for the sensor driver to consume, which this driver does not do.

Request the three supplies and the reset GPIO, and sequence them along with
the clock the driver already looks up, in runtime PM callbacks.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
Changes in v3, from Sakari Ailus's review of v2:
- wrapped the one line over 80 columns
- dropped an unrelated hunk in ov13858_id_table. It was not deliberate: v2 =
was
  regenerated against mainline from a tree based on a distribution kernel, =
and
  that difference came along with it.
Link to v2: https://patch.msgid.link/20260831124352.86935-1-lsa.uz@pm.me

Changes in v2, from the review of v1:
- commit message cut down; the detail below
- dropped the comment on the supply names; it is a KAPI with int3472
- ARRAY_SIZE() directly instead of a local macro
- fsleep() instead of usleep_range()
- one function each for power on and off, used as the PM callbacks directly=
,
  instead of a pair of wrappers
- removed the now-useless dev_err() in the probe error path
- i declared inside its loop
Link to v1: https://patch.msgid.link/20260831100404.40463-1-lsa.uz@pm.me

Without the patch the first I2C transaction fails:

  ov13858 i2c-OVTID858:00: failed to find sensor: -5

The power sequence follows ov02c10: supplies, then clock, then release rese=
t,
and the reverse on the way down.

Measured on a Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7=
),
with the parts isolated one at a time:

  supplies enabled, clock enabled   sensor identifies, driver binds
  supplies enabled, clock left off  -EIO
  supplies left off, clock enabled  -EIO

so both are needed; a longer settling delay alone is not enough. Verified
across five module unload/load cycles with no probe failure, and again afte=
r
this rework, with the sensor streaming each time.

This needs POWER1 GPIO support in int3472 to be useful on that machine: the
dvdd rail is described there as an INT3472 GPIO of type 0x08, and without t=
hat
patch the rail is never registered.
Link: https://patch.msgid.link/20260829-sp7plus-int3472-v3-1-454b50485ce2@b=
erg.pm

The same sensor on the Surface Pro 10 was made to work downstream by forcin=
g
the regulators on for the driver's lifetime, which the people who did it
called too broad for upstream. Runtime PM keeps them off while the sensor i=
s
idle instead.
Link: https://github.com/linux-surface/linux-surface/issues/2153

dovdd is not described on this machine and resolves to a dummy regulator. I=
t
is listed because it is one of the three supplies these sensors normally ta=
ke.

A working camera also needs an ipu-bridge entry for OVTID858, separately.
---
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -3,9 +3,12 @@
=20
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -1028,9 +1031,17 @@
 =09}
 };
=20
+static const char * const ov13858_supply_names[] =3D {
+=09"dovdd",=09/* Digital I/O power */
+=09"avdd",=09=09/* Analog power */
+=09"dvdd",=09=09/* Digital core power */
+};
+
 struct ov13858 {
 =09struct device *dev;
 =09struct clk *clk;
+=09struct regulator_bulk_data supplies[ARRAY_SIZE(ov13858_supply_names)];
+=09struct gpio_desc *reset_gpio;
=20
 =09struct v4l2_subdev sd;
 =09struct media_pad pad;
@@ -1653,8 +1664,55 @@
 {
 =09v4l2_ctrl_handler_free(ov13858->sd.ctrl_handler);
 =09mutex_destroy(&ov13858->mutex);
+}
+
+static int ov13858_power_on(struct device *dev)
+{
+=09struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
+=09struct ov13858 *ov13858 =3D to_ov13858(sd);
+=09int ret;
+
+=09ret =3D regulator_bulk_enable(ARRAY_SIZE(ov13858_supply_names),
+=09=09=09=09    ov13858->supplies);
+=09if (ret) {
+=09=09dev_err(ov13858->dev, "failed to enable regulators: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ret =3D clk_prepare_enable(ov13858->clk);
+=09if (ret) {
+=09=09dev_err(ov13858->dev, "failed to enable clock: %d\n", ret);
+=09=09regulator_bulk_disable(ARRAY_SIZE(ov13858_supply_names), ov13858->su=
pplies);
+=09=09return ret;
+=09}
+
+=09if (ov13858->reset_gpio) {
+=09=09/* Hold reset for at least 1 ms on a back to back off-on */
+=09=09fsleep(1000);
+=09=09gpiod_set_value_cansleep(ov13858->reset_gpio, 0);
+=09}
+
+=09/* t4: 8192 XVCLK cycles after reset is released, before the first I2C =
*/
+=09fsleep(5000);
+
+=09return 0;
 }
=20
+static int ov13858_power_off(struct device *dev)
+{
+=09struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
+=09struct ov13858 *ov13858 =3D to_ov13858(sd);
+
+=09gpiod_set_value_cansleep(ov13858->reset_gpio, 1);
+=09regulator_bulk_disable(ARRAY_SIZE(ov13858_supply_names), ov13858->suppl=
ies);
+=09clk_disable_unprepare(ov13858->clk);
+
+=09return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ov13858_pm_ops, ov13858_power_off,
+=09=09=09=09 ov13858_power_on, NULL);
+
 static int ov13858_probe(struct i2c_client *client)
 {
 =09struct ov13858 *ov13858;
@@ -1678,14 +1736,34 @@
 =09=09=09=09     "external clock %lu is not supported\n",
 =09=09=09=09     freq);
=20
+=09for (unsigned int i =3D 0; i < ARRAY_SIZE(ov13858_supply_names); i++)
+=09=09ov13858->supplies[i].supply =3D ov13858_supply_names[i];
+
+=09ret =3D devm_regulator_bulk_get(ov13858->dev, ARRAY_SIZE(ov13858_supply=
_names),
+=09=09=09=09      ov13858->supplies);
+=09if (ret)
+=09=09return dev_err_probe(ov13858->dev, ret,
+=09=09=09=09     "failed to get regulators\n");
+
+=09ov13858->reset_gpio =3D devm_gpiod_get_optional(ov13858->dev, "reset",
+=09=09=09=09=09=09      GPIOD_OUT_HIGH);
+=09if (IS_ERR(ov13858->reset_gpio))
+=09=09return dev_err_probe(ov13858->dev,
+=09=09=09=09     PTR_ERR(ov13858->reset_gpio),
+=09=09=09=09     "failed to get reset GPIO\n");
+
 =09/* Initialize subdev */
 =09v4l2_i2c_subdev_init(&ov13858->sd, client, &ov13858_subdev_ops);
=20
+=09ret =3D ov13858_power_on(ov13858->dev);
+=09if (ret)
+=09=09return ret;
+
 =09/* Check module identity */
 =09ret =3D ov13858_identify_module(ov13858);
 =09if (ret) {
 =09=09dev_err(ov13858->dev, "failed to find sensor: %d\n", ret);
-=09=09return ret;
+=09=09goto error_power_off;
 =09}
=20
 =09/* Set default mode to max resolution */
@@ -1693,7 +1771,7 @@
=20
 =09ret =3D ov13858_init_controls(ov13858);
 =09if (ret)
-=09=09return ret;
+=09=09goto error_power_off;
=20
 =09/* Initialize subdev */
 =09ov13858->sd.internal_ops =3D &ov13858_internal_ops;
@@ -1729,8 +1807,10 @@
=20
 error_handler_free:
 =09ov13858_free_controls(ov13858);
-=09dev_err(ov13858->dev, "%s failed:%d\n", __func__, ret);
=20
+error_power_off:
+=09ov13858_power_off(ov13858->dev);
+
 =09return ret;
 }
=20
@@ -1744,11 +1824,14 @@
 =09ov13858_free_controls(ov13858);
=20
 =09pm_runtime_disable(ov13858->dev);
+=09if (!pm_runtime_status_suspended(ov13858->dev))
+=09=09ov13858_power_off(ov13858->dev);
+=09pm_runtime_set_suspended(ov13858->dev);
 }
=20
 static const struct i2c_device_id ov13858_id_table[] =3D {
 =09{ .name =3D "ov13858" },
 =09{ }
 };
=20
 MODULE_DEVICE_TABLE(i2c, ov13858_id_table);
@@ -1766,6 +1849,7 @@
 =09.driver =3D {
 =09=09.name =3D "ov13858",
 =09=09.acpi_match_table =3D ACPI_PTR(ov13858_acpi_ids),
+=09=09.pm =3D pm_ptr(&ov13858_pm_ops),
 =09},
 =09.probe =3D ov13858_probe,
 =09.remove =3D ov13858_remove,

