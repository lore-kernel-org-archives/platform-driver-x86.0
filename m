Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221396;
	b=H6Of3nFuncIOSDHWcYvI1oIKl6CkQ+U4jfGLaReRDxr7X5iunE6gX3eKhpaCVdT/7Xw3
	 +6EQF6l0qE63F0jFWyVJi0knVcIyP48I/EIHxU/KtaIF3+5QeyQWGNQE+i5JKDJ4dFMy4
	 Utv0+ex81FWY7u1N4KLXfZeE+CEcb+TCMjZEbZxmBTNzGr2941YI238Zr8qe0zsawfRkj
	 6mu8cqqJpkHKsyuevE4HlBauL5sEE1MLJ5cBF2MgitU8l/W+nmAjC4FTTIhuNKdCX99Bl
	 5clzr5afKfvP3ipUdlk/8INkono2xaAkGpwWbQEOBtwQJVy9kODKKoSMLY4sgUkiKUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NgKYqbq3f7/8t+kF9Yhdju6I9FMl4pNRxfyiV7ruPTk=;
	b=ExIXwXlzBzIU6aku60E1Zzz9oCjcRvvfRu1GUec009y3yQbH6H5DuYw6IvA6Q4JiC5HK
	 2hx3VmtUxjXxbltx0tY+WeT7NsMZGNc58rWxosQ7Gmvz1UWj8r6vFvx4d0hZx+2A9/hej
	 FShJidHoX85pz1CYbdTVECtbGqOj2nsIzbjogdgL2fm3KEAvY7rd5L9AYN97a8Jb1WOWt
	 Sa5auYVz0mxHWwZGGS5DtmwePp/Bmeb/tIjaPUDVdgyGLvi6TuozPN4udUBApU8Z6DwLN
	 qmSUwmJbNhuIYt6XRp9OX6VZpt/zTOktp9ImC/SPKRsmyGxM8ye0hxC0nN6Q1jl9RKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wnXF0tQT;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB0D606A330
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 10:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB0D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wnXF0tQT
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so250365a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 02:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221395; x=1794826195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgKYqbq3f7/8t+kF9Yhdju6I9FMl4pNRxfyiV7ruPTk=;
        b=wnXF0tQTrt5OiyPRGod5jK2ZGyS+xr0U46+pQW7tSef6aLHlpVzejbvVbf2f2tsVwH
         AfB3B9szQTSl3Qlaj4icROD2eJR2WQfJbtiD3E0BM+0OHEi8hbR63q5PZZV8qIdvn7dY
         Nhv3wVd4XbJdeeMTtDTeeb+3KzghbqAnFH6H4wihhHS6y4tAe3ADFzmwl+tpRmqOXm8X
         MqJEEI8xkiDjcmTikmUgNrJpiY4lnYn+WwdtrjhtK8MMS0EaRsr95Jf2u6atE6Mp+1AC
         HocaQJ/Tc6bFm78RcKQgRPx4wUtkLTBT8ZGPS4wBBV7RslVEC5xO9V3rGERvfB6oZ8Ng
         oNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221395; x=1794826195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgKYqbq3f7/8t+kF9Yhdju6I9FMl4pNRxfyiV7ruPTk=;
        b=ReGYrwKl//UtDixATzACz/ppBhw2r3tXwnHT81GqbfAjQ/I7y9YyXCF8VNnJQXeghj
         8VDLyvr5y7wSZdLu25KiBOSF8ltL9lPMSSmcOG8SPDGH0O5m/ZSTwY2qftLI6jXZQmoH
         hGjUQVsyz5oVJyc3Z5exhzkziWcmalQRvBOnWwUi39s9naq6Db4SPasJWJAoOcvwnAaj
         Qe7IzIiDmyAx/EryJVnzcStVbNMPal+uMHg2syqAX/0pdtNSGUcymfKLW9Wu4Plp4Aki
         Mu+ahAvqqJ7KXKNCnP/VFeOt9yp3f0pyTeadKjYBUICTHfbpYxqJAs1LFOAoJSvC5mVI
         h2Ww==
X-Forwarded-Encrypted: i=1; AL+hErHiQM8xOk9wkXRTUusISYDeeceA8mVmBNjm9F4WnJMjhnBY7aSsELtxeYrmn6Re+KIPwmi6O6E7e3/tEE4nBkU+HlVp@vger.kernel.org
X-Gm-Message-State: APuU4Z8JlkNecra0+XT6P0JJ9WuNA5ryYWSYg3VoopfMe1ylccf73ZtT
	D2Bg/+v877+repUj3wDW0Au7bcL6DYG07M+qfIBLcK2HY+ybgD1Oc9O3
X-Gm-Gg: AYBFou0CJFLNYkNsgwVNeNbzpujym6gzeBp6eYgfAgYvsgh7LpsciCnm2oVYT223ihw
	tqy3va1RkXNUw8ObMWqZUjzcH8UAAfZB7Ahk10VjxbEvjm9M5OYy2S58VSg4LU8v/hFTLeBIdkS
	W7TVjo4CHquPeWRpe9u/ByWTfL+qKfH7P4fdO5qNrvZg3oK2gUsEk4EDJu8h9s0AxJipQ6ajtlU
	pywjP8Y2ZTS/WiADm2ntGxLj3DCUhX3jsKywEIMSbcCN3SvKs52ZFnPtY++AivlhTwYgdNXbcHg
	KVeZGFBy7kiPj3qNxP6oe5bTIM6ApqSFo8m4kethhC2QdI1Oij0z//5GBw/jbi1ybAx7CqVY9U4
	KRoGF8UrBZOGuVpN9iwknd8UCLZ98abN+E5Wbi/wKuK8xQebLTHtcnXW6ta+Z7LKmJfAMXAp8/X
	SrH6Z3kPwWzn65FQVmzw9f/sJDK/eC6j4tCr3DHj0Rfnx9aIiRJWzV7bXwcHNWt+sJ4T1r0GjTC
	iQg/KBUwS1N49xCXtGfpP4cL/+QDYPZzqy3ohEHSkhn+3vh7GOgRVjqR9GqEb4z5fMs9l385YTU
	USVy73EKbkCh0wwxH+G9jXD4L6B4TW+VJiX6ujsx5gSqOZW+ChacK4AMQq1ynA3ltVNt0fqZOFq
	9GkJqOd8CQzJOu1lxmSfQm2MJz3TNZyYaeE/JJ6d1Eb+DKsfexctKL+UOXcUWRJ7LwgK8S9t7gB
	9GtJj39WgTg+OY
X-Received: by 2002:a17:902:ef10:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2ed833ec899mr35607505ad.4.1794221394479;
        Mon, 09 Nov 2026 02:49:54 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:53 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform: arm64: Add HP OmniBook 5 16 embedded controller driver
Date: Mon,  9 Nov 2026 16:19:14 +0530
Message-ID: <20261109104914.1534-3-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261109104914.1534-1-theflyingrahul@gmail.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The embedded controller of the HP OmniBook 5 16 (Snapdragon X2) sits on
I2C at address 0x76 and takes commands through a mailbox: wait for an
idle status (0xef), write the command and sub-command (0xed), wait for
completion, then read the 32-byte reply (0xee). Its interrupt line
signals events, read from register 0x00 and acknowledged by writing 0
back, as HP's ACPI does.

Expose:
- the fan speed and the four thermistors HP's thermal zones use, through
  hwmon;
- the two EC LEDs HP's mute LED WMI methods drive, as the mute and mic
  mute LEDs;
- the keyboard backlight timeout (30 s, 3 min or always on) and the
  current backlight level as sysfs attributes; the EC runs the backlight
  itself, and its backlight events notify the level attribute;
- the F9 (mic mute) and F11 (programmable) hotkeys, which only the EC
  reports, as input events, using HP's WMI key codes as hp-wmi maps them.

The command codes, event codes and reply formats are the ones HP's ACPI
methods use on this laptop.

Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 .../ABI/testing/sysfs-driver-hp-omnibook-5-ec |  19 +
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  17 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/hp-omnibook-5-ec.c     | 417 ++++++++++++++++++
 5 files changed, 462 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
 create mode 100644 drivers/platform/arm64/hp-omnibook-5-ec.c

diff --git a/Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec b/Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
new file mode 100644
index 0000000000..4c6f5cb20e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
@@ -0,0 +1,19 @@
+What:		/sys/bus/i2c/devices/<bus>-0076/kbd_backlight_timeout
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Rahul Pon <theflyingrahul@gmail.com>
+Description:
+		(RW) How long the keyboard backlight of the HP OmniBook 5 16
+		stays on after the last key press, as the embedded controller
+		applies it: "30s", "3min" or "always". The Fn key still turns
+		the backlight on and off.
+
+What:		/sys/bus/i2c/devices/<bus>-0076/kbd_backlight_level
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Rahul Pon <theflyingrahul@gmail.com>
+Description:
+		(RO) The keyboard backlight level of the HP OmniBook 5 16:
+		0 (off), 1 or 2. Only the backlight key changes it, inside the
+		embedded controller. The attribute is notified when the EC
+		reports a change.
diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d37..d043a2f8f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12284,6 +12284,14 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
 F:	drivers/platform/x86/hp/tc1100-wmi.c
 
+HP OMNIBOOK 5 16 EMBEDDED CONTROLLER DRIVER
+M:	Rahul Pon <theflyingrahul@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
+F:	Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
+F:	drivers/platform/arm64/hp-omnibook-5-ec.c
+
 HP WMI HARDWARE MONITOR DRIVER
 M:	James Seo <james@equiv.tech>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 3f879410b3..2b34f5ab1b 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -48,6 +48,23 @@ config EC_ASUS_GLYMUR
 	  temperature sensors readout, fan monitoring, keyboard and EC event
 	  reporting.
 
+config EC_HP_OMNIBOOK5
+	tristate "HP OmniBook 5 16 Embedded Controller driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	depends on HWMON
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	select LEDS_CLASS
+	select NEW_LEDS
+	help
+	  Driver for the Embedded Controller in the Snapdragon X2-based HP
+	  OmniBook 5 16, which reports the fan speed, thermistor
+	  temperatures and hotkeys, and drives the mute LEDs and the
+	  keyboard backlight timeout.
+
+	  Say M or Y here to include this support.
+
 config EC_HUAWEI_GAOKUN
 	tristate "Huawei Matebook E Go Embedded Controller driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 3bc3d4669c..6c72726eae 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -7,6 +7,7 @@
 
 obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
 obj-$(CONFIG_EC_ASUS_GLYMUR) += asus-glymur-ec.o
+obj-$(CONFIG_EC_HP_OMNIBOOK5)	+= hp-omnibook-5-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
diff --git a/drivers/platform/arm64/hp-omnibook-5-ec.c b/drivers/platform/arm64/hp-omnibook-5-ec.c
new file mode 100644
index 0000000000..bfe20e12aa
--- /dev/null
+++ b/drivers/platform/arm64/hp-omnibook-5-ec.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HP OmniBook 5 16 (Snapdragon X2) embedded controller
+ *
+ * The EC takes commands through a mailbox: wait for an idle status, write
+ * the command, wait for it to complete, then read the reply. Command codes
+ * are the ones HP's ACPI tables use on this laptop.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/interrupt.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/unaligned.h>
+
+/* The pending event, cleared by writing 0 (HP's IC10.INTR, field CMD5) */
+#define HPEC_EVENT		0x00
+#define HPEC_STATUS		0xef
+#define HPEC_REQUEST		0xed
+#define HPEC_REPLY		0xee
+#define HPEC_REPLY_LEN		32
+
+#define HPEC_STATUS_IDLE	0x00
+#define HPEC_STATUS_DONE	0xe0
+#define HPEC_POLL_TRIES		20
+#define HPEC_POLL_US		5000
+
+#define HPEC_OS_FLAG		0x01
+#define HPEC_OS_FLAG_LEDS	0x84
+#define HPEC_KBD		0x05
+#define HPEC_KBD_TIMEOUT_GET	0xfe
+#define HPEC_KBD_LEVEL_GET	0xff
+#define HPEC_LED		0x06
+#define HPEC_LED_GET		0xff
+#define HPEC_LED_ON		0x80
+#define HPEC_THERMISTOR		0x26
+#define HPEC_THERMISTOR_INVALID	0xff
+#define HPEC_FAN		0xbc
+#define HPEC_FAN_RPM		0x03
+
+/* The four thermistors HP's thermal zones enable, in their order */
+static const u8 hpec_thermistors[] = { 0x00, 0x07, 0x04, 0x0a };
+
+static const char * const hpec_thermistor_labels[] = {
+	"EC thermistor 1", "EC thermistor 2", "EC thermistor 3", "EC thermistor 4",
+};
+
+/* EC events, with HP's WMI hotkey codes from hp-wmi where they exist */
+#define HPEC_EVENT_HOT		0x0b
+#define HPEC_EVENT_KBD		0x0d
+#define HPEC_EVENT_KBD_KEY	0x1d
+
+static const struct key_entry hpec_keymap[] = {
+	{ KE_IGNORE, 0x0d, },			/* backlight key, run by the EC */
+	{ KE_KEY, 0x11, { KEY_MICMUTE } },	/* F9, WMI 0x270 */
+	{ KE_IGNORE, 0x1d, },			/* backlight key, run by the EC */
+	{ KE_KEY, 0x1e, { KEY_PROG2 } },	/* F11, WMI 0x21a8 */
+	{ KE_IGNORE, 0x30, },			/* fan and thermistor notices */
+	{ KE_IGNORE, 0x31, },
+	{ KE_IGNORE, 0x32, },
+	{ KE_IGNORE, 0x33, },
+	{ KE_IGNORE, 0x34, },
+	{ KE_IGNORE, 0x35, },
+	{ KE_IGNORE, 0x36, },
+	{ KE_IGNORE, 0x37, },
+	{ KE_IGNORE, 0x38, },
+	{ KE_IGNORE, 0x88, },			/* Fn lock, WMI 0x21ab */
+	{ KE_END, 0 }
+};
+
+/* Keyboard backlight timeout, in EC value order */
+static const char * const hpec_kbd_timeouts[] = { "30s", "3min", "always" };
+
+/* EC LEDs 8 and 9, which HP's mute LED WMI methods drive */
+static const struct {
+	const char *name;
+	const char *trigger;
+	u8 index;
+} hpec_leds[] = {
+	{ "platform::mute", "audio-mute", 0x08 },
+	{ "platform::micmute", "audio-micmute", 0x09 },
+};
+
+struct hpec;
+
+struct hpec_led {
+	struct led_classdev cdev;
+	struct hpec *ec;
+	u8 index;
+};
+
+struct hpec {
+	struct i2c_client *client;
+	struct mutex lock;	/* serializes mailbox commands */
+	struct hpec_led leds[ARRAY_SIZE(hpec_leds)];
+	struct input_dev *input;
+};
+
+static int hpec_wait(struct hpec *ec, u8 status)
+{
+	int i, ret;
+
+	for (i = 0; i < HPEC_POLL_TRIES; i++) {
+		ret = i2c_smbus_read_byte_data(ec->client, HPEC_STATUS);
+		if (ret < 0)
+			return ret;
+		if (ret == status)
+			return 0;
+		fsleep(HPEC_POLL_US);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int hpec_command(struct hpec *ec, u8 cmd, u8 sub, u8 reply[HPEC_REPLY_LEN])
+{
+	u8 request[] = { cmd, sub };
+	int ret;
+
+	guard(mutex)(&ec->lock);
+
+	ret = hpec_wait(ec, HPEC_STATUS_IDLE);
+	if (ret)
+		return ret;
+
+	ret = i2c_smbus_write_i2c_block_data(ec->client, HPEC_REQUEST,
+					     sizeof(request), request);
+	if (ret)
+		return ret;
+
+	ret = hpec_wait(ec, HPEC_STATUS_DONE);
+	if (ret || !reply)
+		return ret;
+
+	ret = i2c_smbus_read_i2c_block_data(ec->client, HPEC_REPLY,
+					    HPEC_REPLY_LEN, reply);
+	if (ret < 0)
+		return ret;
+
+	return ret == HPEC_REPLY_LEN ? 0 : -EIO;
+}
+
+static int hpec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct hpec *ec = dev_get_drvdata(dev);
+	u8 reply[HPEC_REPLY_LEN];
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		ret = hpec_command(ec, HPEC_FAN, HPEC_FAN_RPM, reply);
+		if (ret)
+			return ret;
+		*val = get_unaligned_le16(reply);
+		return 0;
+	case hwmon_temp:
+		ret = hpec_command(ec, HPEC_THERMISTOR, hpec_thermistors[channel], reply);
+		if (ret)
+			return ret;
+		if (reply[0] == HPEC_THERMISTOR_INVALID)
+			return -ENODATA;
+		*val = reply[0] * 1000;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int hpec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				  u32 attr, int channel, const char **str)
+{
+	if (type != hwmon_temp)
+		return -EOPNOTSUPP;
+
+	*str = hpec_thermistor_labels[channel];
+	return 0;
+}
+
+static umode_t hpec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	return 0444;
+}
+
+static const struct hwmon_ops hpec_hwmon_ops = {
+	.is_visible = hpec_hwmon_is_visible,
+	.read = hpec_hwmon_read,
+	.read_string = hpec_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info * const hpec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info hpec_hwmon_chip = {
+	.ops = &hpec_hwmon_ops,
+	.info = hpec_hwmon_info,
+};
+
+static enum led_brightness hpec_led_get(struct led_classdev *cdev)
+{
+	struct hpec_led *led = container_of(cdev, struct hpec_led, cdev);
+	u8 reply[HPEC_REPLY_LEN];
+
+	if (hpec_command(led->ec, HPEC_LED, HPEC_LED_GET, reply))
+		return LED_OFF;
+
+	return (reply[1] >> (led->index - hpec_leds[0].index)) & 1;
+}
+
+static int hpec_led_set(struct led_classdev *cdev, enum led_brightness value)
+{
+	struct hpec_led *led = container_of(cdev, struct hpec_led, cdev);
+	int ret;
+
+	/* As HP's method does before every change */
+	ret = hpec_command(led->ec, HPEC_OS_FLAG, HPEC_OS_FLAG_LEDS, NULL);
+	if (ret)
+		return ret;
+
+	return hpec_command(led->ec, HPEC_LED,
+			    led->index | (value ? HPEC_LED_ON : 0), NULL);
+}
+
+static irqreturn_t hpec_irq(int irq, void *data)
+{
+	struct hpec *ec = data;
+	struct device *dev = &ec->client->dev;
+	int event;
+
+	scoped_guard(mutex, &ec->lock) {
+		event = i2c_smbus_read_byte_data(ec->client, HPEC_EVENT);
+		if (event < 0) {
+			dev_err_ratelimited(dev, "cannot read EC event: %d\n", event);
+			return IRQ_HANDLED;
+		}
+		i2c_smbus_write_byte_data(ec->client, HPEC_EVENT, 0);
+	}
+
+	if (!event)
+		return IRQ_HANDLED;
+
+	if (event == HPEC_EVENT_KBD || event == HPEC_EVENT_KBD_KEY)
+		sysfs_notify(&dev->kobj, NULL, "kbd_backlight_level");
+
+	if (event == HPEC_EVENT_HOT) {
+		dev_crit(dev, "EC reports a critical temperature\n");
+		return IRQ_HANDLED;
+	}
+
+	if (!sparse_keymap_report_event(ec->input, event, 1, true))
+		dev_info_ratelimited(dev, "unknown EC event %#x\n", event);
+
+	return IRQ_HANDLED;
+}
+
+static ssize_t kbd_backlight_timeout_show(struct device *dev,
+					  struct device_attribute *attr, char *buf)
+{
+	struct hpec *ec = dev_get_drvdata(dev);
+	u8 reply[HPEC_REPLY_LEN];
+	int ret;
+
+	ret = hpec_command(ec, HPEC_KBD, HPEC_KBD_TIMEOUT_GET, reply);
+	if (ret)
+		return ret;
+
+	if (reply[0] >= ARRAY_SIZE(hpec_kbd_timeouts))
+		return sysfs_emit(buf, "%#x\n", reply[0]);
+
+	return sysfs_emit(buf, "%s\n", hpec_kbd_timeouts[reply[0]]);
+}
+
+static ssize_t kbd_backlight_timeout_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct hpec *ec = dev_get_drvdata(dev);
+	int i, ret;
+
+	i = sysfs_match_string(hpec_kbd_timeouts, buf);
+	if (i < 0)
+		return i;
+
+	ret = hpec_command(ec, HPEC_KBD, i, NULL);
+
+	return ret ?: count;
+}
+static DEVICE_ATTR_RW(kbd_backlight_timeout);
+
+/* The level is set only by the backlight key, inside the EC */
+static ssize_t kbd_backlight_level_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
+{
+	struct hpec *ec = dev_get_drvdata(dev);
+	u8 reply[HPEC_REPLY_LEN];
+	int ret;
+
+	ret = hpec_command(ec, HPEC_KBD, HPEC_KBD_LEVEL_GET, reply);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", reply[0]);
+}
+static DEVICE_ATTR_RO(kbd_backlight_level);
+
+static struct attribute *hpec_attrs[] = {
+	&dev_attr_kbd_backlight_level.attr,
+	&dev_attr_kbd_backlight_timeout.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(hpec);
+
+static int hpec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon;
+	u8 reply[HPEC_REPLY_LEN];
+	struct hpec *ec;
+	unsigned int i;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->client = client;
+	i2c_set_clientdata(client, ec);
+	ret = devm_mutex_init(dev, &ec->lock);
+	if (ret)
+		return ret;
+
+	ret = hpec_command(ec, HPEC_FAN, HPEC_FAN_RPM, reply);
+	if (ret)
+		return dev_err_probe(dev, ret, "EC does not answer\n");
+
+	ec->input = devm_input_allocate_device(dev);
+	if (!ec->input)
+		return -ENOMEM;
+
+	ec->input->name = "HP OmniBook 5 EC hotkeys";
+	ec->input->phys = "hp-omnibook-5-ec/input0";
+	ec->input->id.bustype = BUS_I2C;
+
+	ret = sparse_keymap_setup(ec->input, hpec_keymap, NULL);
+	if (ret)
+		return ret;
+
+	ret = input_register_device(ec->input);
+	if (ret)
+		return ret;
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "hp_omnibook_ec", ec,
+						     &hpec_hwmon_chip, NULL);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	for (i = 0; i < ARRAY_SIZE(hpec_leds); i++) {
+		struct hpec_led *led = &ec->leds[i];
+
+		led->ec = ec;
+		led->index = hpec_leds[i].index;
+		led->cdev.name = hpec_leds[i].name;
+		led->cdev.default_trigger = hpec_leds[i].trigger;
+		led->cdev.max_brightness = 1;
+		led->cdev.brightness_get = hpec_led_get;
+		led->cdev.brightness_set_blocking = hpec_led_set;
+
+		ret = devm_led_classdev_register(dev, &led->cdev);
+		if (ret)
+			return ret;
+	}
+
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(dev, client->irq, NULL, hpec_irq,
+						IRQF_ONESHOT, "hp-omnibook-5-ec", ec);
+		if (ret)
+			return dev_err_probe(dev, ret, "cannot request the EC interrupt\n");
+	}
+
+	return 0;
+}
+
+static const struct of_device_id hpec_of_match[] = {
+	{ .compatible = "hp,omnibook-5-16-bf1xxx-ec" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hpec_of_match);
+
+static struct i2c_driver hpec_driver = {
+	.driver = {
+		.name = "hp-omnibook-5-ec",
+		.of_match_table = hpec_of_match,
+		.dev_groups = hpec_groups,
+	},
+	.probe = hpec_probe,
+};
+module_i2c_driver(hpec_driver);
+
+MODULE_DESCRIPTION("HP OmniBook 5 16 embedded controller");
+MODULE_LICENSE("GPL");
-- 
2.53.0

