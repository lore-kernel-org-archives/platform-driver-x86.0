Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97CF3D953B
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170667; cv=none; b=ercNu9ByKgxHbMqVUueRkeT6d+pmkjqmuQ3Cdw8IUAKhpzqWWPlxfb8/qu36hkuudnLzAudO1J9nABVkK6khlhTLKw49VXQRJNb4GaFtpsx8PC3AP+SXfcjKZT/SuYz0nYWGjP4E0QvkgKUwshf+n2szpGbIgTESCXFomlDRPgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170667; c=relaxed/simple;
	bh=sGemyPXXBm2FHq+9BCXB0xeIxmOj9PnmpbOQSA1awWE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hmXCbVLB5FcWjkHGuA87vQLrKvKKGjHAAkKJZWgxZBxIcNzkF6L74vc9X2vhxp345YvL1l+JKJDwkNm9pRNV9NQbghAzLlla2ZnlL5bSa75jWZv/XbVZlEwcLClRZLk83d2+hIlPBBT4CKA22P+Xx7pBDNyN7shwsk8bI4t3QBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QJECRUZG; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QJECRUZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788170657; x=1788429857;
	bh=ppDjzDf9Ff93FbB9scTpr5J69xukhr3h6UB/qk0lXRc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QJECRUZG004Ifw1rd2ADRMhNiTXpinlQyBttDIq7neCoCi09Q5XE8rqgN1C2grrda
	 QTSDhMF30DH335jEBi4LlCx8mtuUjMJnGgAyPoKj+KDzz6ro/334YKA0BUOfikKBr+
	 s7Z34owpk+JqzQzzjlaFb0ejC+3sBjmgWaaiIBrL/7xQsI+GyopY2Pq/NBgN1czNkm
	 Pe/CR59tzVXf2L2b/zpwkQZkLW+qDOjmBU70T4DJnZROixn1L+WgzMd7AcnmNgDXpS
	 3SjYwSvT4x0VRUhkwOJFtCGgVQXQwSdylCvpcL4MMiYF/prQtJLfjEzNjTusGJ8c9/
	 g6fUDrThvH5Ow==
Date: Mon, 31 Aug 2026 10:04:13 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Jakob Berg Jespersen <dev@berg.pm>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Message-ID: <20260831100404.40463-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 383b98c99eda73552f4ed70e7e7d4fc83c2e0e1d
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ov13858_probe() reads the chip ID over I2C on the assumption stated in its
own comment:

=09/*
=09 * Device is already turned on by i2c-core with ACPI domain PM.
=09 * Enable runtime PM and turn off the device.
=09 */

That holds where the sensor's rails and clock are ACPI power resources. It
does not hold where an INT3472 companion device describes them, because
INT3472 registers them as regulators, a clock and a reset GPIO for the
sensor driver to consume - and this driver consumes none of them. They stay
off, the sensor stays in reset, and the first I2C transaction fails:

  ov13858 i2c-OVTID858:00: failed to find sensor: -5

Add the three standard supplies, the reset GPIO and the clock the driver
already looks up, sequenced in runtime PM callbacks the driver did not have=
.
The shape follows ov02c10, which handles the same situation: supplies, then
clock, then release reset, and the reverse on the way down.

This depends on POWER1 GPIO support in int3472. On the Surface Pro 11 the
dvdd rail is described as an INT3472 GPIO of type 0x08, so without that pat=
ch
the rail is never registered and there is nothing here to consume:

Link: https://patch.msgid.link/20260829-sp7plus-int3472-v3-1-454b50485ce2@b=
erg.pm

The same sensor on the Surface Pro 10 was made to work downstream by adding
reset handling to ov13858_probe() and forcing the regulators on for the
lifetime of the driver; the people who did it called that second half too
broad for upstream, and it is. Driving the rails from runtime PM instead
keeps them off while the sensor is idle, which is what the companion device
registered them for:

Link: https://github.com/linux-surface/linux-surface/issues/2153

Measured on a Microsoft Surface Pro 11 for Business (Intel Lunar Lake,
IPU7), kernel 7.0.0-30, with the parts isolated one at a time:

  supplies enabled, clock enabled   sensor identifies, driver binds
  supplies enabled, clock left off  -EIO
  supplies left off, clock enabled  -EIO

so both are needed; a longer settling delay alone is not enough. Verified
across five module unload/load cycles with no probe failure, and the sensor
streams after each one.

dovdd is not described on this machine and resolves to a dummy regulator. I=
t
is listed because it is one of the three supplies these sensors normally
take, and machines that do describe it should get it.

With this patch the sensor probes on every boot and runtime PM powers it
down when idle. Producing a working camera also needs an ipu-bridge entry
for OVTID858, which is a separate patch.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
Hans suggested two patches, one for the regulators and one for the reset
GPIO. They are sent as one here because neither half leaves the sensor in a
working state on its own - with supplies but no reset handling the part sta=
ys
held in reset, and vice versa. Happy to split it if you would still prefer
that.

An earlier version of this patch released reset before starting the clock. =
It
worked on this hardware, but only because the 8192-cycle wait that follows
covered for it, and it is the wrong order. Mentioning it in case anyone is
carrying that version downstream.
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
@@ -1037,9 +1040,23 @@
 =09}
 };
=20
+/*
+ * The sensor's rails are described by an INT3472 companion device on ACPI
+ * platforms; the names match the con_ids that driver registers.
+ */
+static const char * const ov13858_supply_names[] =3D {
+=09"dovdd",=09/* Digital I/O power */
+=09"avdd",=09=09/* Analog power */
+=09"dvdd",=09=09/* Digital core power */
+};
+
+#define OV13858_NUM_SUPPLIES ARRAY_SIZE(ov13858_supply_names)
+
 struct ov13858 {
 =09struct device *dev;
 =09struct clk *clk;
+=09struct regulator_bulk_data supplies[OV13858_NUM_SUPPLIES];
+=09struct gpio_desc *reset_gpio;
=20
 =09struct v4l2_subdev sd;
 =09struct media_pad pad;
@@ -1699,10 +1716,66 @@
 =09mutex_destroy(&ov13858->mutex);
 }
=20
+static int ov13858_power_on(struct ov13858 *ov13858)
+{
+=09int ret;
+
+=09ret =3D regulator_bulk_enable(OV13858_NUM_SUPPLIES, ov13858->supplies);
+=09if (ret) {
+=09=09dev_err(ov13858->dev, "failed to enable regulators: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ret =3D clk_prepare_enable(ov13858->clk);
+=09if (ret) {
+=09=09dev_err(ov13858->dev, "failed to enable clock: %d\n", ret);
+=09=09regulator_bulk_disable(OV13858_NUM_SUPPLIES, ov13858->supplies);
+=09=09return ret;
+=09}
+
+=09if (ov13858->reset_gpio) {
+=09=09/* Hold reset for at least 1 ms on a back to back off-on */
+=09=09usleep_range(1000, 1500);
+=09=09gpiod_set_value_cansleep(ov13858->reset_gpio, 0);
+=09}
+
+=09/* t4: 8192 XVCLK cycles after reset is released, before the first I2C =
*/
+=09usleep_range(5000, 6000);
+
+=09return 0;
+}
+
+static void ov13858_power_off(struct ov13858 *ov13858)
+{
+=09gpiod_set_value_cansleep(ov13858->reset_gpio, 1);
+=09regulator_bulk_disable(OV13858_NUM_SUPPLIES, ov13858->supplies);
+=09clk_disable_unprepare(ov13858->clk);
+}
+
+static int ov13858_runtime_resume(struct device *dev)
+{
+=09struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
+
+=09return ov13858_power_on(to_ov13858(sd));
+}
+
+static int ov13858_runtime_suspend(struct device *dev)
+{
+=09struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
+
+=09ov13858_power_off(to_ov13858(sd));
+
+=09return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ov13858_pm_ops, ov13858_runtime_suspend,
+=09=09=09=09 ov13858_runtime_resume, NULL);
+
 static int ov13858_probe(struct i2c_client *client)
 {
 =09struct ov13858 *ov13858;
 =09unsigned long freq;
+=09unsigned int i;
 =09int ret;
=20
 =09ov13858 =3D devm_kzalloc(&client->dev, sizeof(*ov13858), GFP_KERNEL);
@@ -1722,14 +1795,34 @@
 =09=09=09=09     "external clock %lu is not supported\n",
 =09=09=09=09     freq);
=20
+=09for (i =3D 0; i < OV13858_NUM_SUPPLIES; i++)
+=09=09ov13858->supplies[i].supply =3D ov13858_supply_names[i];
+
+=09ret =3D devm_regulator_bulk_get(ov13858->dev, OV13858_NUM_SUPPLIES,
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
+=09ret =3D ov13858_power_on(ov13858);
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
@@ -1737,7 +1830,7 @@
=20
 =09ret =3D ov13858_init_controls(ov13858);
 =09if (ret)
-=09=09return ret;
+=09=09goto error_power_off;
=20
 =09/* Initialize subdev */
 =09ov13858->sd.internal_ops =3D &ov13858_internal_ops;
@@ -1773,6 +1866,9 @@
=20
 error_handler_free:
 =09ov13858_free_controls(ov13858);
+
+error_power_off:
+=09ov13858_power_off(ov13858);
 =09dev_err(ov13858->dev, "%s failed:%d\n", __func__, ret);
=20
 =09return ret;
@@ -1788,6 +1884,9 @@
 =09ov13858_free_controls(ov13858);
=20
 =09pm_runtime_disable(ov13858->dev);
+=09if (!pm_runtime_status_suspended(ov13858->dev))
+=09=09ov13858_power_off(ov13858);
+=09pm_runtime_set_suspended(ov13858->dev);
 }
=20
 static const struct i2c_device_id ov13858_id_table[] =3D {
@@ -1810,6 +1909,7 @@
 =09.driver =3D {
 =09=09.name =3D "ov13858",
 =09=09.acpi_match_table =3D ACPI_PTR(ov13858_acpi_ids),
+=09=09.pm =3D pm_ptr(&ov13858_pm_ops),
 =09},
 =09.probe =3D ov13858_probe,
 =09.remove =3D ov13858_remove,

