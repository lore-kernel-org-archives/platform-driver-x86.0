Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4E6395AEA;
	Sat, 26 Sep 2026 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452498; cv=none; b=hT1qUt7cUXO0xw3nJJJ81YLhWWvEulzvsUdFpcUW4AwXOwjolQUN5N3vdTMgRqQ6XPYoGDKOHIBAeh+AScWz6HmTlDZcPtLEo2sNBEIB+yQyvuUwwQBkz93d5ACbekUWKYVEYVI9Lll4g77Ky+y+MmPk88u1wA6xbx3nyojiJ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452498; c=relaxed/simple;
	bh=slKTj16OVeeRK0nMEmXU9wut6ChK/Mo1HgcMP9HVEHA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pW7IbgMarRmuts9FPPJc6gHcf19ZMGFmdkqqaMfW6G4bkjh5zUrfZzRrz7Fxe0dh3K7Iz/G/8z3YCyjrpe+0XduX9/CiUhAUze445xpcjfWid4CDqpSHpkFjpTPfU93KBflBbPZNS4JidPurtC+r7uEXHa404RDvsQ1qFSDbBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=h2y12OUG; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="h2y12OUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790452492; x=1790711692;
	bh=7rNrW2C26yKb5uQdn+LwobJ24hWLXVBCvIn73xIPORc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h2y12OUG0xEWQjVVSQx9fnPi5PFEMr9g1uVDQZv3t6Ml/xMWmx1STaOSwzpt+8284
	 iJRNxcX+v+f3rqmM/mPg8S2aOcNKUP00M9eo/hL3VWOcIsZqns/LrVML2klAHMT/4I
	 o5+zo/eivOKlxPCA9Isv+UQAHb4DnQkIjGWTO6tBNA0G0sM8sHsqx7IygVtwz5QCWi
	 BiBapAf5cyDxQLMjp+igFbvqNDij6IyhUqC2SWKxjXNfJqaTzaWimpI4aGiRPL4h2V
	 BKZ2MYaFtl2kHDzOmqC7yam5wi8PVMEMu5dSU59lH5C4QVzZeO0f8o5zE3HqHX/jss
	 wdVRtZ3A9Y0oA==
Date: Sat, 26 Sep 2026 19:54:48 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Clover <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC driver
Message-ID: <20260926195415.5995-3-alex@ironrobin.net>
In-Reply-To: <20260926195415.5995-1-alex@ironrobin.net>
References: <20260926195415.5995-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: f53f8887b6782fd188e322be3c5d61fd24cc112d
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a standalone driver for the Lenovo ThinkPad X13s embedded controller,
providing keyboard-backlight control and notifications of firmware-driven
brightness changes. Keep the X13s-specific backlight, event and
power-management handling separate from the T14s driver.

Use STOP-separated command and response transfers and serialize EC
access, including keyboard-backlight read-modify-write operations.
Follow the EC command and power-state GPIO sequence described by the
X13s ACPI DSDT when entering and leaving low power.

Save the firmware-updated brightness in the EC on Fn+Space and restore
it on lid open, following the DSDT's SCMS(0x20) and SCMS(0x21) operations.
Also save software-selected brightness so lid opening does not reinstate
an older setting; this extends the DSDT's MLCS path, which does not
explicitly save it.

Defer event queries while suspended until normal resume, when the I2C
controller is usable again, and leave wake IRQ management to the I2C
core. Save the hardware backlight brightness before entering low power
and attempt to restore it on resume because the low-power transition
can reset it. Process deferred events afterwards so a lid-open restore
takes precedence over a snapshot taken after lid closure blanked the light.

This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.

Assisted-by: LLM
Signed-off-by: Clover <alex@ironrobin.net>

---
diff --git a/MAINTAINERS b/MAINTAINERS
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27177,6 +27177,12 @@ THINKPAD T14S EMBEDDED CONTROLLER DRIVER
 F:=09Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad=
-t14s-ec.yaml
 F:=09drivers/platform/arm64/lenovo-thinkpad-t14s.c
=20
+THINKPAD X13S EMBEDDED CONTROLLER DRIVER
+M:=09Clover <alex@ironrobin.net>
+S:=09Maintained
+F:=09Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad=
-x13s-ec.yaml
+F:=09drivers/platform/arm64/lenovo-thinkpad-x13s.c
+
 THINKPAD LMI DRIVER
 M:=09Mark Pearson <mpearson-lenovo@squebb.ca>
 L:=09platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfi=
g
index e32e01b2a9bdd970d6f2b2bf6b051472c9a16103..c20b2fb40962f1d46e896ea7f7d=
0b16028f92f96 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -90,6 +90,22 @@ config EC_LENOVO_THINKPAD_T14S
=20
 =09  Say M or Y here to include this support.
=20
+config EC_LENOVO_THINKPAD_X13S
+=09tristate "Lenovo ThinkPad X13s Embedded Controller driver"
+=09depends on ARCH_QCOM || COMPILE_TEST
+=09depends on I2C
+=09depends on GPIOLIB
+=09select NEW_LEDS
+=09select LEDS_CLASS
+=09select LEDS_BRIGHTNESS_HW_CHANGED
+=09help
+=09  Driver for the embedded controller in the Lenovo ThinkPad X13s.
+=09  Provides keyboard backlight control, hardware brightness change
+=09  notifications and system sleep power sequencing with wake support.
+
+=09  To compile this driver as a module, choose M here: the module will
+=09  be called lenovo-thinkpad-x13s.
+
 config EC_QCOM_HAMOA
 =09tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur referenc=
e devices"
 =09depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makef=
ile
index 7681be4a46e94e7cb80e50bcc5b724cb0961357b..23ed6eef7ce41a5f45d48f5f83b=
281ebbca94cbb 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -9,4 +9,5 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)=09+=3D acer-aspire1-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)=09+=3D huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) +=3D lenovo-thinkpad-t14s.o
+obj-$(CONFIG_EC_LENOVO_THINKPAD_X13S) +=3D lenovo-thinkpad-x13s.o
 obj-$(CONFIG_EC_QCOM_HAMOA) +=3D qcom-hamoa-ec.o
diff --git a/drivers/platform/arm64/lenovo-thinkpad-x13s.c b/drivers/platfo=
rm/arm64/lenovo-thinkpad-x13s.c
new file mode 100644
index 0000000000000000000000000000000000000000..708f909f787805d9832c2ff4aac=
29a8d8d52d0bb
--- /dev/null
+++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Lenovo ThinkPad X13s embedded controller */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/leds.h>
+#include <linux/lockdep.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+
+#define X13S_EC_CMD_READ=09=090x02
+#define X13S_EC_CMD_WRITE=09=090x03
+#define X13S_EC_CMD_EVENT=09=090xf0
+#define X13S_EC_REG_POWER_STATE=090x80
+#define X13S_EC_POWER_STATE_ENTER=090x55
+#define X13S_EC_POWER_STATE_EXIT=090xaa
+#define X13S_EC_REG_KBD_BACKLIGHT=090xc0
+#define X13S_EC_BACKLIGHT_MASK=09GENMASK(5, 4)
+#define X13S_EC_REG_KBD_BACKLIGHT_SAVED=090x15
+#define X13S_EC_BACKLIGHT_SAVED_MASK=09GENMASK(2, 1)
+#define X13S_EC_EVENT_FN_SPACE=090x1f
+#define X13S_EC_EVENT_LID_OPEN=090x52
+
+struct x13s_ec {
+=09struct i2c_client *client;
+=09struct gpio_desc *power_state;
+=09/* Serializes EC transactions, backlight RMW and suspend/event state. *=
/
+=09struct mutex lock;
+=09struct led_classdev led;
+=09enum led_brightness saved_brightness;
+=09bool suspended;
+=09bool event_pending;
+};
+
+/*
+ * Each single-message transfer ends in STOP. Hold the bus segment across
+ * both halves so another client cannot interleave them. Keep the 10 ms
+ * post-command settling delay, including on failure.
+ */
+static int x13s_read(struct x13s_ec *ec, u8 cmd, u8 reg, u8 *value)
+{
+=09struct i2c_client *client =3D ec->client;
+=09u8 buf[] =3D { cmd, reg, 0, 1 };
+=09struct i2c_msg request =3D {
+=09=09.addr =3D client->addr,
+=09=09.flags =3D I2C_M_STOP,
+=09=09.len =3D sizeof(buf),
+=09=09.buf =3D buf,
+=09};
+=09struct i2c_msg response =3D {
+=09=09.addr =3D client->addr,
+=09=09.flags =3D I2C_M_RD,
+=09=09.len =3D 1,
+=09=09.buf =3D value,
+=09};
+=09int ret;
+
+=09lockdep_assert_held(&ec->lock);
+=09if (ec->suspended)
+=09=09return -EBUSY;
+
+=09i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
+=09ret =3D __i2c_transfer(client->adapter, &request, 1);
+=09if (ret =3D=3D 1)
+=09=09ret =3D __i2c_transfer(client->adapter, &response, 1);
+=09ret =3D ret =3D=3D 1 ? 0 : (ret < 0 ? ret : -EIO);
+=09i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
+=09fsleep(10000);
+=09return ret;
+}
+
+/* Also used by normal PM callbacks while ordinary EC access is blocked. *=
/
+static int x13s_write(struct x13s_ec *ec, u8 reg, u8 value)
+{
+=09u8 buf[] =3D { X13S_EC_CMD_WRITE, reg, 0, 1, value };
+=09int ret;
+
+=09lockdep_assert_held(&ec->lock);
+
+=09ret =3D i2c_master_send(ec->client, buf, sizeof(buf));
+=09ret =3D ret =3D=3D sizeof(buf) ? 0 : (ret < 0 ? ret : -EIO);
+=09fsleep(10000);
+=09return ret;
+}
+
+static int x13s_brightness(struct x13s_ec *ec)
+{
+=09u8 value;
+=09int ret;
+
+=09ret =3D x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT, &val=
ue);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D FIELD_GET(X13S_EC_BACKLIGHT_MASK, value);
+=09return ret =3D=3D 3 ? -EINVAL : ret;
+}
+
+static enum led_brightness x13s_brightness_get(struct led_classdev *led)
+{
+=09struct x13s_ec *ec =3D container_of(led, struct x13s_ec, led);
+=09int ret;
+
+=09mutex_lock(&ec->lock);
+=09ret =3D x13s_brightness(ec);
+=09mutex_unlock(&ec->lock);
+=09return ret;
+}
+
+static int x13s_set_brightness_locked(struct x13s_ec *ec,
+=09=09=09=09      enum led_brightness brightness)
+{
+=09u8 old, new;
+=09int ret;
+
+=09lockdep_assert_held(&ec->lock);
+=09if (brightness > 2)
+=09=09return -EINVAL;
+
+=09ret =3D x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT, &old=
);
+=09if (ret)
+=09=09return ret;
+=09/* Never interpret or overwrite a reserved current brightness. */
+=09if (FIELD_GET(X13S_EC_BACKLIGHT_MASK, old) =3D=3D 3)
+=09=09return -EINVAL;
+=09new =3D (old & ~X13S_EC_BACKLIGHT_MASK) |
+=09=09FIELD_PREP(X13S_EC_BACKLIGHT_MASK, brightness);
+=09return x13s_write(ec, X13S_EC_REG_KBD_BACKLIGHT, new);
+}
+
+/* SCMS(0x20): save the brightness obtained from C0 in the EC. */
+static int x13s_save_brightness_locked(struct x13s_ec *ec,
+=09=09=09=09       enum led_brightness brightness)
+{
+=09u8 value;
+=09int ret;
+
+=09lockdep_assert_held(&ec->lock);
+=09ret =3D x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT_SAVED=
,
+=09=09=09&value);
+=09if (ret)
+=09=09return ret;
+
+=09value &=3D ~X13S_EC_BACKLIGHT_SAVED_MASK;
+=09value |=3D FIELD_PREP(X13S_EC_BACKLIGHT_SAVED_MASK, brightness);
+=09return x13s_write(ec, X13S_EC_REG_KBD_BACKLIGHT_SAVED, value);
+}
+
+/* SCMS(0x21): restore C0 from the EC's saved brightness. */
+static int x13s_restore_brightness_locked(struct x13s_ec *ec)
+{
+=09u8 value;
+=09int brightness, ret;
+
+=09lockdep_assert_held(&ec->lock);
+=09ret =3D x13s_read(ec, X13S_EC_CMD_READ, X13S_EC_REG_KBD_BACKLIGHT_SAVED=
,
+=09=09=09&value);
+=09if (ret)
+=09=09return ret;
+
+=09brightness =3D FIELD_GET(X13S_EC_BACKLIGHT_SAVED_MASK, value);
+=09ret =3D x13s_set_brightness_locked(ec, brightness);
+=09return ret ? ret : brightness;
+}
+
+static int x13s_brightness_set(struct led_classdev *led,
+=09=09=09       enum led_brightness brightness)
+{
+=09struct x13s_ec *ec =3D container_of(led, struct x13s_ec, led);
+=09int ret;
+
+=09mutex_lock(&ec->lock);
+=09ret =3D x13s_set_brightness_locked(ec, brightness);
+=09/* Keep software selections across the EC's lid blank/restore cycle. */
+=09if (!ret)
+=09=09ret =3D x13s_save_brightness_locked(ec, brightness);
+=09mutex_unlock(&ec->lock);
+=09return ret;
+}
+
+static void x13s_refresh_brightness(struct x13s_ec *ec)
+{
+=09int brightness, ret;
+
+=09lockdep_assert_held(&ec->lock);
+=09/* Firmware owns the transition; save its result as _Q1F does. */
+=09brightness =3D x13s_brightness(ec);
+=09if (brightness < 0) {
+=09=09dev_err_ratelimited(&ec->client->dev,
+=09=09=09=09    "Backlight refresh failed: %d\n", brightness);
+=09=09return;
+=09}
+=09ret =3D x13s_save_brightness_locked(ec, brightness);
+=09if (ret)
+=09=09dev_err_ratelimited(&ec->client->dev,
+=09=09=09=09    "Backlight save failed: %d\n", ret);
+=09led_classdev_notify_brightness_hw_changed(&ec->led, brightness);
+}
+
+static void x13s_query_event(struct x13s_ec *ec)
+{
+=09u8 event;
+=09int ret;
+
+=09lockdep_assert_held(&ec->lock);
+=09/* One query per interrupt, with no event-draining loop or retry. */
+=09ret =3D x13s_read(ec, X13S_EC_CMD_EVENT, 0, &event);
+=09if (ret) {
+=09=09dev_err_ratelimited(&ec->client->dev, "Event query failed: %d\n", re=
t);
+=09=09return;
+=09}
+=09if (event =3D=3D X13S_EC_EVENT_FN_SPACE) {
+=09=09x13s_refresh_brightness(ec);
+=09} else if (event =3D=3D X13S_EC_EVENT_LID_OPEN) {
+=09=09ret =3D x13s_restore_brightness_locked(ec);
+=09=09if (ret < 0) {
+=09=09=09dev_err_ratelimited(&ec->client->dev,
+=09=09=09=09=09    "Backlight lid restore failed: %d\n", ret);
+=09=09=09return;
+=09=09}
+=09=09ec->led.brightness =3D ret;
+=09=09led_classdev_notify_brightness_hw_changed(&ec->led, ret);
+=09}
+}
+
+static void x13s_process_pending_event(struct x13s_ec *ec)
+{
+=09lockdep_assert_held(&ec->lock);
+=09if (ec->event_pending) {
+=09=09ec->event_pending =3D false;
+=09=09x13s_query_event(ec);
+=09}
+}
+
+static irqreturn_t x13s_irq(int irq, void *data)
+{
+=09struct x13s_ec *ec =3D data;
+
+=09mutex_lock(&ec->lock);
+=09/* Coalesce suspended IRQs into one query; never access I2C here. */
+=09if (ec->suspended)
+=09=09ec->event_pending =3D true;
+=09else
+=09=09x13s_query_event(ec);
+=09mutex_unlock(&ec->lock);
+=09return IRQ_HANDLED;
+}
+
+static int x13s_probe(struct i2c_client *client)
+{
+=09struct device *dev =3D &client->dev;
+=09struct x13s_ec *ec;
+=09int ret;
+
+=09if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+=09=09return -EOPNOTSUPP;
+=09if (client->irq <=3D 0)
+=09=09return dev_err_probe(dev, -EINVAL, "Missing event IRQ\n");
+=09if (irq_get_trigger_type(client->irq) !=3D IRQ_TYPE_EDGE_FALLING)
+=09=09return dev_err_probe(dev, -EINVAL, "Expected falling-edge IRQ\n");
+
+=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+=09if (!ec)
+=09=09return -ENOMEM;
+=09ec->client =3D client;
+=09ret =3D devm_mutex_init(dev, &ec->lock);
+=09if (ret)
+=09=09return ret;
+=09i2c_set_clientdata(client, ec);
+
+=09ec->power_state =3D devm_gpiod_get(dev, "power-state", GPIOD_OUT_HIGH);
+=09if (IS_ERR(ec->power_state))
+=09=09return dev_err_probe(dev, PTR_ERR(ec->power_state),
+=09=09=09=09     "Failed to acquire power-state GPIO high\n");
+
+=09ec->led.name =3D "platform::kbd_backlight";
+=09ec->led.max_brightness =3D 2;
+=09ec->led.flags =3D LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
+=09ec->led.brightness_get =3D x13s_brightness_get;
+=09ec->led.brightness_set_blocking =3D x13s_brightness_set;
+=09ret =3D devm_led_classdev_register(dev, &ec->led);
+=09if (ret)
+=09=09return dev_err_probe(dev, ret, "Failed to register keyboard backligh=
t\n");
+
+=09/* Devres synchronizes the IRQ before unregistering the LED. */
+=09ret =3D devm_request_threaded_irq(dev, client->irq, NULL, x13s_irq,
+=09=09=09=09=09IRQF_ONESHOT, dev_name(dev), ec);
+=09if (ret)
+=09=09return dev_err_probe(dev, ret, "Failed to request event IRQ\n");
+
+=09/* The I2C core manages the wake IRQ described by wakeup-source. */
+=09return 0;
+}
+
+static int x13s_power_gpio(struct x13s_ec *ec, int value)
+{
+=09int ret;
+
+=09lockdep_assert_held(&ec->lock);
+=09ret =3D gpiod_set_value_cansleep(ec->power_state, value);
+=09if (ret)
+=09=09dev_err(&ec->client->dev, "Failed to set power-state GPIO to %d: %d\=
n",
+=09=09=09value, ret);
+=09return ret;
+}
+
+static void x13s_exit_low_power(struct x13s_ec *ec)
+{
+=09int ret;
+
+=09lockdep_assert_held(&ec->lock);
+=09x13s_power_gpio(ec, 1);
+=09/* DSDT: GPIO176 high, Sleep(10), then register 0x80 <- 0xaa. */
+=09fsleep(10000);
+=09ret =3D x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_EXI=
T);
+=09if (ret)
+=09=09dev_err(&ec->client->dev, "Failed to exit low power: %d\n", ret);
+
+=09/* Resume ordinary access even if the EC exit attempt failed. */
+=09ec->suspended =3D false;
+}
+
+static int x13s_suspend(struct device *dev)
+{
+=09struct x13s_ec *ec =3D dev_get_drvdata(dev);
+=09int ret;
+
+=09/* Finish in-flight access while the GENI parent is still usable. */
+=09mutex_lock(&ec->lock);
+=09if (ec->suspended)
+=09=09goto out;
+=09/* Keep the previous snapshot if reading the hardware fails. */
+=09ret =3D x13s_brightness(ec);
+=09if (ret < 0)
+=09=09dev_err(dev, "Failed to save backlight brightness: %d\n", ret);
+=09else
+=09=09ec->saved_brightness =3D ret;
+
+=09/* DSDT: register 0x80 <- 0x55, then GPIO176 low. */
+=09ret =3D x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_ENT=
ER);
+=09if (ret)
+=09=09dev_err(dev, "Failed to enter low power: %d\n", ret);
+=09else
+=09=09x13s_power_gpio(ec, 0);
+=09/* Defer event queries throughout host suspend, even on EC failure. */
+=09ec->suspended =3D true;
+out:
+=09mutex_unlock(&ec->lock);
+=09return 0;
+}
+
+static int x13s_resume(struct device *dev)
+{
+=09struct x13s_ec *ec =3D dev_get_drvdata(dev);
+=09int ret;
+
+=09/*
+=09 * Normal resume runs after the adapter and its GENI parent. In
+=09 * particular, device_resume_early() has re-enabled runtime PM:
+=09 * GENI's resume_noirq() alone is not sufficient for I2C transfers.
+=09 * Consume the pending query under the IRQ thread's mutex, without
+=09 * a worker that could race a new IRQ or the next suspend.
+=09 */
+=09mutex_lock(&ec->lock);
+=09x13s_exit_low_power(ec);
+=09ret =3D x13s_set_brightness_locked(ec, ec->saved_brightness);
+=09if (ret)
+=09=09dev_err(dev, "Failed to restore backlight brightness: %d\n", ret);
+=09else
+=09=09/* A software restore is not a hardware brightness change. */
+=09=09ec->led.brightness =3D ec->saved_brightness;
+
+=09/* A deferred lid-open restore must supersede the PM snapshot. */
+=09x13s_process_pending_event(ec);
+=09mutex_unlock(&ec->lock);
+=09return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(x13s_pm_ops, x13s_suspend, x13s_resume);
+
+static const struct of_device_id x13s_of_match[] =3D {
+=09{ .compatible =3D "lenovo,thinkpad-x13s-ec" },
+=09{ }
+};
+MODULE_DEVICE_TABLE(of, x13s_of_match);
+
+static struct i2c_driver x13s_driver =3D {
+=09.probe =3D x13s_probe,
+=09.driver =3D {
+=09=09.name =3D "thinkpad-x13s-ec",
+=09=09.of_match_table =3D x13s_of_match,
+=09=09.pm =3D pm_sleep_ptr(&x13s_pm_ops),
+=09},
+};
+module_i2c_driver(x13s_driver);
+
+MODULE_DESCRIPTION("Lenovo ThinkPad X13s Embedded Controller");
+MODULE_LICENSE("GPL");

