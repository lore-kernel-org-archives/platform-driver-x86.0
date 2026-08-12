Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439D36728D
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562570; cv=none; b=OV9qFlDSiNGFmXcEr8JK4OjfRbofD9BHdnzQsr2aTgqlqsX+aTePDZ/0VGzFJ5Zu90xXnqFtlYOf90ImivTSO/ke+LPGTVx+wiZnB3oImK4gYYIzq3Pt4OHJgZznuT5otx1SatZm2isKu4FqtJFXnyGYcon+Q6pGj3BaI6WxZtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562570; c=relaxed/simple;
	bh=AwZqd+EIr7nVvsuUHyDzXJv9LU5ehyqQy6JIDKJZ0JE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdSorgfMlO0KXzC/ioBJfjwcgCEO/TgsaoI14WBRwgXZAIG/fWsOEgzcgrzu5yZ1P9eYsmZEt62IkIjxNPnGb3tUhSqBNH+vOUK58xvPbG7BrVmJkbwMdCux3EeSsCWbVUqVawoBC5lDRQfpCFdBGEDi/7iJIugRqsqeaM21WM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYmlYqnq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYmlYqnq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so2035081e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 12:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786562566; x=1787167366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hojIdksFzStFsToX0W8wMxVv5U7wB36188B/Gg1EBnU=;
        b=XYmlYqnqDYLYFtqhHD2DDnufEiVVI2S4r2MhYxQVk7dNOKrz/AnbU2FMQI2uuLWyc6
         UEjvvZLe4BmnyKIA+38H9sd/75JfZafTwc/Mg0rDLGCuEdldT1L8Y32GoNVi3GEpcFwc
         Dzs3dAbsgKJSuAvGgh/1/UEBF69jDC80joB9g0XHuRlicgTnj6pJ2twut4PcX2sajLxM
         4TApubLCScRP4GuhduVLmkubwc2NrFe86nf2CnAGxJn4qKUPHaJYioDMtwv3lY2OTkIZ
         Wej+KojAhq3JD6cYSa1o+mbCdrfGtzVDSDO+AVFq4yFRp9RAASVmw1+ZFiYLygVQ5KTq
         k6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786562566; x=1787167366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hojIdksFzStFsToX0W8wMxVv5U7wB36188B/Gg1EBnU=;
        b=lY19NvDEFi4TLYTKF1RelEjpuA2w8sIjC4gH8mPfNPsXQ8o7eFR1RBTKvTpaCGM6GS
         1luVrSWHnYj4X8r3SLPakTvGGVpFadfjc6imvG+uR3SC5jJvQyDsiexCUd7sI+D9gT4m
         +w4uG/Fz6Jgy9A8MBXKhTf0rCOPI2U1CJf3rrnxOAjO5KszZvNO6urehGJb3w5ZewgdP
         T+phzX2b/GMAOC9y9c3vWMI3cNFIgCaSIXZaGffLj5HeHKGCbdpniFfkinxnl5vrerKw
         mhr7nYPNlIusGMiIlUwx75BmQk2Da1fxnXGnxgE3QsqWXB3Yp0/EQvmlg8CzXcrOO3Lb
         CMuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPkjhW9ltSOUPuWacm3yz5DCGxSOKH6h1vsUodJeENLyByWa8gnrNGv8FfEKn/aAv57qnKn60Vg5vzsdhymYLqTNlA@vger.kernel.org
X-Gm-Message-State: AOJu0YyAOyVwrN7cJR0VFfhu085QZWo1chIqAfUD1WqTol70mJu5NpPt
	QAevDBKT4j60D6V/EN46B25ilEogFAERQkz18LEtgFvhwOiYNUcAc6cj
X-Gm-Gg: AR+sD12yyRcpYwDlF3THna2RmMpGnYO1yYD9WixoQTCBJw41j8UJUPECQ7jne+YpFap
	rcG5GB3StKGk6uDhQUIESHoWvuiSardYh12h0gVW8uHjmdPIVKPyVFwfeW89L3nEZzE1tbBKv8n
	xcC6hLDy2I5wgrcs7KFxjKslCPoTGjTGG3UHEM/brtJrAitYWJsmxOjD1yKZtcp505MQ8nTCvkZ
	1yEz1c/mWYaDM/etDyfAU2+BqX7+BsUDGJFoZZarjIzU/2PEQ2mRCFw4xJyJ2rgRlYv0bw4HC8f
	NFHDKy/G9V9XLYshbGBMY4vjASKFc+qklxlVTIKouS5IGiifRibzxg1+Cog+fnyBE1v9hlYbayf
	uEO2iIU31pTmtssbPpNpyONZVSsNeOuEGBJWlExvbmOizBKQCC/Yk67fhMEMI5YKAec1Qkr1yrn
	kr6YSFrBoOLzi/KqrVuDR++r37DAVuKtIXj357vOwODZ9I4+7aJgLwUrozwIh5e0iv1cUUdmYLU
	1EsIagE
X-Received: by 2002:ac2:5a02:0:b0:5b0:1879:1b9d with SMTP id 2adb3069b0e04-5b44e31a809mr798439e87.26.1786562565383;
        Wed, 12 Aug 2026 12:22:45 -0700 (PDT)
Received: from jaennil-honor.localdomain ([172.241.70.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e10f5sm25827e87.12.2026.08.12.12.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 12:22:44 -0700 (PDT)
From: Nikita Dubrovskih <testname142@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Dubrovskih <testname142@gmail.com>
Subject: [RFC PATCH] hwmon: Add fan monitoring support for HONOR FMI-XX
Date: Wed, 12 Aug 2026 22:22:42 +0300
Message-ID: <20260812192242.859307-1-testname142@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HONOR FMI-XX firmware exposes a serialized \\GFNS ACPI method.
It returns a status byte and a 16-bit fan speed in RPM for either of two
firmware channels.

Add a DMI-restricted, read-only hwmon driver using that firmware
interface. The driver deliberately exposes no fan control or direct
Embedded Controller access.

The interface was validated on firmware 1.09 with fan channel 0
reporting approximately 2500-2800 RPM. Channel 1 is readable and
remained at 0 RPM during idle and a short CPU load.

Signed-off-by: Nikita Dubrovskih <testname142@gmail.com>
---
 Documentation/hwmon/honor-fmi.rst |  32 +++++
 Documentation/hwmon/index.rst     |   1 +
 MAINTAINERS                       |   7 ++
 drivers/hwmon/Kconfig             |  10 ++
 drivers/hwmon/Makefile            |   1 +
 drivers/hwmon/honor-fmi.c         | 195 ++++++++++++++++++++++++++++++
 6 files changed, 246 insertions(+)
 create mode 100644 Documentation/hwmon/honor-fmi.rst
 create mode 100644 drivers/hwmon/honor-fmi.c

diff --git a/Documentation/hwmon/honor-fmi.rst b/Documentation/hwmon/honor-fmi.rst
new file mode 100644
index 0000000..a42a1dd
--- /dev/null
+++ b/Documentation/hwmon/honor-fmi.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver honor-fmi
+=======================
+
+Supported systems:
+
+  * HONOR FMI-XX
+
+Author: Nikita Dubrovskih <testname142@gmail.com>
+
+Description
+-----------
+
+The driver provides read-only monitoring of the fan speed on the HONOR FMI-XX.
+The system firmware implements a ``GFNS`` ACPI method which returns the speed
+of one of two firmware fan channels in RPM. Embedded Controller access and
+serialization are handled by the firmware method.
+
+The driver does not expose fan control or direct Embedded Controller access.
+
+Sysfs entries
+-------------
+
+The following attributes are supported:
+
+======================= ======= =============================================
+Name                    Perm    Description
+======================= ======= =============================================
+``fan1_input``          RO      Fan channel 0 speed in RPM
+``fan2_input``          RO      Fan channel 1 speed in RPM
+======================= ======= =============================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 29130df..91052fa 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -90,6 +90,7 @@ Hardware Monitoring Kernel Drivers
    gxp-fan-ctrl
    hac300s
    hih6130
+   honor-fmi
    hp-wmi-sensors
    hs3001
    htu31
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f..d7355db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11854,6 +11854,13 @@ F:	lib/test_hmm*
 F:	mm/hmm*
 F:	tools/testing/selftests/mm/*hmm*
 
+HONOR FMI-XX HARDWARE MONITOR DRIVER
+M:	Nikita Dubrovskih <testname142@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/honor-fmi.rst
+F:	drivers/hwmon/honor-fmi.c
+
 HONEYWELL ABP2030PA PRESSURE SENSOR SERIES IIO DRIVER
 M:	Petre Rodan <petre.rodan@subdimension.ro>
 L:	linux-iio@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2bfbcc0..8a11a30 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2785,6 +2785,16 @@ config SENSORS_ASUS_EC
 	  This driver can also be built as a module. If so, the module
 	  will be called asus_ec_sensors.
 
+config SENSORS_HONOR_FMI
+	tristate "HONOR FMI-XX fan monitor"
+	depends on X86
+	help
+	  If you say yes here, you get support for fan speed monitoring on
+	  the HONOR FMI-XX laptop through its firmware ACPI method.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called honor-fmi.
+
 config SENSORS_HP_WMI
 	tristate "HP WMI Sensors"
 	depends on ACPI_WMI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 63effc0..e098793 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
 obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
 obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
 obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
+obj-$(CONFIG_SENSORS_HONOR_FMI)	+= honor-fmi.o
 obj-$(CONFIG_SENSORS_HP_WMI)	+= hp-wmi-sensors.o
 
 # Native drivers
diff --git a/drivers/hwmon/honor-fmi.c b/drivers/hwmon/honor-fmi.c
new file mode 100644
index 0000000..225066e
--- /dev/null
+++ b/drivers/hwmon/honor-fmi.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Read-only fan monitoring for the HONOR FMI-XX.
+ *
+ * The firmware-provided \GFNS ACPI method accepts a three-byte buffer.
+ * Byte 2 selects fan 0 or 1. It returns a status byte followed by a
+ * little-endian 16-bit fan speed in RPM. The method owns all Embedded
+ * Controller access and serialization; this driver deliberately exposes no
+ * fan control interface.
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#define HONOR_FMI_FAN_COUNT 2
+#define HONOR_FMI_GFNS_RESULT_SIZE 3
+
+struct honor_fmi_data {
+	acpi_handle gfns;
+	/* Serialize firmware method evaluation. */
+	struct mutex lock;
+};
+
+static const struct dmi_system_id honor_fmi_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HONOR"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "FMI-XX"),
+		},
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, honor_fmi_dmi_table);
+
+static int honor_fmi_read_rpm(struct honor_fmi_data *data, int channel,
+			      long *rpm)
+{
+	union acpi_object input = {
+		.buffer = {
+			.type = ACPI_TYPE_BUFFER,
+			.length = 3,
+		},
+	};
+	struct acpi_object_list arguments = {
+		.count = 1,
+		.pointer = &input,
+	};
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *result;
+	u8 input_bytes[3] = { 0, 0, channel };
+	acpi_status status;
+	int ret = 0;
+
+	input.buffer.pointer = input_bytes;
+
+	guard(mutex)(&data->lock);
+	status = acpi_evaluate_object(data->gfns, NULL, &arguments, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	result = output.pointer;
+	if (!result || result->type != ACPI_TYPE_BUFFER ||
+	    result->buffer.length < HONOR_FMI_GFNS_RESULT_SIZE) {
+		ret = -EPROTO;
+		goto out_free;
+	}
+
+	if (result->buffer.pointer[0]) {
+		ret = -EIO;
+		goto out_free;
+	}
+
+	*rpm = result->buffer.pointer[1] |
+	       (result->buffer.pointer[2] << 8);
+
+out_free:
+	kfree(output.pointer);
+	return ret;
+}
+
+static umode_t honor_fmi_is_visible(const void *data,
+				    enum hwmon_sensor_types type, u32 attr,
+				    int channel)
+{
+	if (type == hwmon_fan && attr == hwmon_fan_input &&
+	    channel < HONOR_FMI_FAN_COUNT)
+		return 0444;
+
+	return 0;
+}
+
+static int honor_fmi_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *value)
+{
+	struct honor_fmi_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_fan || attr != hwmon_fan_input ||
+	    channel >= HONOR_FMI_FAN_COUNT)
+		return -EOPNOTSUPP;
+
+	return honor_fmi_read_rpm(data, channel, value);
+}
+
+static const struct hwmon_ops honor_fmi_hwmon_ops = {
+	.is_visible = honor_fmi_is_visible,
+	.read = honor_fmi_read,
+};
+
+static const struct hwmon_channel_info * const honor_fmi_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info honor_fmi_chip_info = {
+	.ops = &honor_fmi_hwmon_ops,
+	.info = honor_fmi_hwmon_info,
+};
+
+static int honor_fmi_probe(struct platform_device *pdev)
+{
+	struct honor_fmi_data *data;
+	struct device *hwmon_dev;
+	acpi_status status;
+
+	if (!dmi_check_system(honor_fmi_dmi_table))
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	status = acpi_get_handle(NULL, "\\GFNS", &data->gfns);
+	if (ACPI_FAILURE(status))
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "firmware does not provide \\GFNS\n");
+
+	mutex_init(&data->lock);
+	platform_set_drvdata(pdev, data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "honor_fmi",
+							 data,
+							 &honor_fmi_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver honor_fmi_driver = {
+	.probe = honor_fmi_probe,
+	.driver = {
+		.name = "honor-fmi-hwmon",
+	},
+};
+
+static struct platform_device *honor_fmi_device;
+
+static int __init honor_fmi_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(honor_fmi_dmi_table))
+		return -ENODEV;
+
+	ret = platform_driver_register(&honor_fmi_driver);
+	if (ret)
+		return ret;
+
+	honor_fmi_device = platform_device_register_simple("honor-fmi-hwmon",
+							   PLATFORM_DEVID_NONE,
+							   NULL, 0);
+	if (IS_ERR(honor_fmi_device)) {
+		ret = PTR_ERR(honor_fmi_device);
+		platform_driver_unregister(&honor_fmi_driver);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit honor_fmi_exit(void)
+{
+	platform_device_unregister(honor_fmi_device);
+	platform_driver_unregister(&honor_fmi_driver);
+}
+
+module_init(honor_fmi_init);
+module_exit(honor_fmi_exit);
+
+MODULE_AUTHOR("Nikita Dubrovskih <testname142@gmail.com>");
+MODULE_DESCRIPTION("HONOR FMI-XX fan speed monitor");
+MODULE_LICENSE("GPL");
-- 
2.55.0
