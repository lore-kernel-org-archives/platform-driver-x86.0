Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E970204C35;
	Thu,  9 Jan 2025 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460503; cv=none; b=VFfPUxqCE4fvoBt1TXF87rCRqYQsxbvtkLHGyL7oigzys+tGn/SQNFNLAHG9Iv00IxcfWsQmpiJwii3LHE3XIXJQ2ImUEV4WyTxgNWyhfUfwSEhgcQG1bJdZ1gGwjDkknlLXZAU9bNvS7nKlN0P8qopgWpO4eGlAXfIbrKaZpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460503; c=relaxed/simple;
	bh=lnz2m2t+903YiONQtcd3HCVLGk0GpDs1xKM2z00G7mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qh/X+ct/EnqOxmqlhsNi8v2knqlU0GOKvzmyqifvX+Gv43Tp1Cp8pn5yDAkPlfooAxkFzKsTzfMzH0D3WuNX8roXbQJdx9wgOthrWQ2LqNZm+pJRUHAK6F4nM5LoZvSZnbokm3Aty8IdKg9nGY68lnCK7OOPOhjPQdqjVIrIAhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1580007e87.0;
        Thu, 09 Jan 2025 14:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736460497; x=1737065297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RE8vk4FCKobs8wCGTkY7GX2y3rCrZ7Kmbpjd+2HzaNs=;
        b=M05U78h75FaNzoq06ohEeJ4jko5ejGKkBWc7eJlThLvZv3/Z3C+B1MAsIaemgRhMNj
         9+twxc1UTzt7GEe25t+eoNiBSKHbvxXL0d7osbtvBBh8dytvgMwNCNxZDH7eOFhDvQj6
         1k1bZ6AZBI17pt8ebMJJyx95ooKaLL84leF6HNgJ/r8dKSlbz9KzgypGCx8w43mu1T2L
         AagmeUuVdt5xLhqke1+S1A+EIBbjsnCb2og2aIZHAQ/xAmBO4kjEnv3L8EnWsj+ABQWQ
         /9wcSFd7Z9Ib+3a2RICUUYrMAyqDy/UBXZHdxz/wO6RoIxEdOEGqeXU9mboJIHAiWCDg
         Ru/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkg/W6GuRtIUIc6oCrJFpP1U8aX2cNmMoHJlocdw3M2Y0XYsDM+uhDS9sMyWKHgTt4P4mSpn0mDoxUxrCF@vger.kernel.org, AJvYcCVvOHKvSHzwVsbBen++bpAHZSGTad8OQ2ObJQVdxuM1ZMuJIM9Is3s1q4iqwhoQPcMX6RVqGOdt538=@vger.kernel.org, AJvYcCWr/5HvtqJHhS9f+Ycpht5ORRi5t/UzN7mQwmJYeITIYncRC32doD6Az9yrwf0gQ0UoaWdTD4Iy/jSPv21nwf1cYBBQcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUVVfIl7mCRUf9PbQMAondOWqTnr0b3TpZEPaKP9Ia0X0Wul3B
	5U0UrQlqg0bkkm+UH5a9OXYTGh7WOsYsZv11Y31YzT7zreJFLvYP
X-Gm-Gg: ASbGnctbITyl8RIZOiz5G+uVj6A8w6/hQAjkSNDqC/lCJXnllo7lCoQ9JB3qe6dX/Ew
	lBdOmZ79uoMUKmarROes1zNNk9fiU5HsNpCSasDUknkyl1Ef5zQE9PYB/kJqmw2yd3SuON52NWq
	MBljQob7aUDVfRH65H8SgkhJJhACRmZkRI+WrATjYVTSfMEan/wivS4ZNTkoNx2Rsf/7Lm0LY41
	cB1rN1rzyyEENTd5qfe05RynKQovzDONvYQ2tsX5FsNxpmhK/4awaMswhxiZMOsA0ODxFa2hTLW
	2pdA8o8MUmj7pmsN7VxCSA==
X-Google-Smtp-Source: AGHT+IEhEnCGCDG7KGOg9N+4VPCCPX4y/pZiE7th5ztKiD+QUpNz53fUhtuI5p7N9fuT8JROZR4cXQ==
X-Received: by 2002:a05:6512:39ca:b0:540:16b3:3699 with SMTP id 2adb3069b0e04-5428a603e30mr1508566e87.9.1736460496794;
        Thu, 09 Jan 2025 14:08:16 -0800 (PST)
Received: from galaxybook.local (82-183-24-76.customers.ownit.se. [82.183.24.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becac23sm317603e87.228.2025.01.09.14.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 14:08:14 -0800 (PST)
From: Joshua Grisham <josh@joshuagrisham.com>
To: W_Armin@gmx.de,
	thomas@t-8ch.de,
	kuurtb@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Joshua Grisham <josh@joshuagrisham.com>
Subject: [PATCH v5] platform/x86: samsung-galaxybook: Add samsung-galaxybook driver
Date: Thu,  9 Jan 2025 23:07:42 +0100
Message-ID: <20250109220745.69977-1-josh@joshuagrisham.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new driver for Samsung Galaxy Book series notebook devices with the
following features:

- Keyboard backlight control
- Battery extension with charge control end threshold
- Controller for Samsung's performance modes using the platform profile
  interface
- Adds firmware-attributes to control various system features
- Handles various hotkeys and notifications

Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>

---

v1->v2:
- Attempt to resolve all review comments from v1 as written here:
https://lore.kernel.org/platform-driver-x86/53c5075b-1967-45d0-937f-463912dd966d@gmx.de/T/#mbcbd8d5d9bc4496bac5486636c7d3b32bc3e5cd0

v2->v3:
- Tweak to battery attribute to closer match pattern in dell-wmi-ddv
- implement platform_profile_remove() change from
  9b3bb37b44a317626464e79da8b39989b421963f
- Small tweak to Documentation page

v3->v4:
- Remove custom tracepoint (can trace via existing mechanisms)
- Remove module parameters
- Move sysfs attributes from device to firmware-attributes
- Refactor "allow_recording" to "camera_lens_cover" plus other small
  renames in aim to have more standardized naming that are cross-vendor
- Attempt to improve locking mechanisms
- Tweak logic for setting and getting led brightness
- More fixes for aiming to use devres/devm pattern
- Change battery charge end threshold to use 1 to 100 instead of 0 to 99
- Add swtich input event for camera_lens_cover remove all others (they will
  be generated as ACPI netlink events instead)
- Various other small tweaks and features as requested from feedback

v4-v5:
- Prefix all locally defined symbols with "GB_" as a namespace
- Remove extra unused out_buf from galaxybook_acpi_method
- Tighten up logic flow for setting and unsetting global pointer (now it
  is done directly in association with the i8042 filter init and exit)
- Rename "camera_lens_cover" to "block_recording"
- Change input device to only apply for "Camera Lens Cover", remove sparse
  keymap and set capabilities manually as part of block_recording init,
  then notify using input_report_switch when setting block_recording
- Correct firmware-attributes enumeration implementation (adding all
  attributes) and remove erroneous ABI fw attrs docs update
- Few small tweaks to how locks are used
- Use device_unregister instead of device_destroy for firmware attributes
  device
- Tighten up and clean up performance mode to profile mapping logic; now
  the mapping is largely "fixed" apart from "Ultra" that will map to
  performance while also re-mapping "Performance" to balanced-performance
- Tighten up error handling so probe will fail in more cases where it
  should fail
- Replace platform_profile_register with devm_platform_profile_register
---
 Documentation/admin-guide/laptops/index.rst   |    1 +
 .../laptops/samsung-galaxybook.rst            |  170 ++
 MAINTAINERS                                   |    7 +
 drivers/platform/x86/Kconfig                  |   17 +
 drivers/platform/x86/Makefile                 |    5 +-
 drivers/platform/x86/samsung-galaxybook.c     | 1482 +++++++++++++++++
 6 files changed, 1680 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/laptops/samsung-galaxybook.rst
 create mode 100644 drivers/platform/x86/samsung-galaxybook.c

diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/admin-guide/laptops/index.rst
index cd9a1c2695fd..e71c8984c23e 100644
--- a/Documentation/admin-guide/laptops/index.rst
+++ b/Documentation/admin-guide/laptops/index.rst
@@ -11,6 +11,7 @@ Laptop Drivers
    disk-shock-protection
    laptop-mode
    lg-laptop
+   samsung-galaxybook
    sony-laptop
    sonypi
    thinkpad-acpi
diff --git a/Documentation/admin-guide/laptops/samsung-galaxybook.rst b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
new file mode 100644
index 000000000000..f6af0c84de2c
--- /dev/null
+++ b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
@@ -0,0 +1,170 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===================
+Samsung Galaxy Book
+===================
+
+Joshua Grisham <josh@joshuagrisham.com>
+
+This is a Linux x86 platform driver for Samsung Galaxy Book series notebook
+devices which utilizes Samsung's ``SCAI`` ACPI device in order to control
+extra features and receive various notifications.
+
+Supported devices
+=================
+
+Any device with one of the supported ACPI device IDs should be supported. This
+covers most of the "Samsung Galaxy Book" series notebooks that are currently
+available as of this writing, and could include other Samsung notebook devices
+as well.
+
+Status
+======
+
+The following features are currently supported:
+
+- :ref:`Keyboard backlight <keyboard-backlight>` control
+- :ref:`Performance mode <performance-mode>` control implemented using the
+  platform profile interface
+- :ref:`Battery charge control end threshold
+  <battery-charge-control-end-threshold>` (stop charging battery at given
+  percentage value) implemented as a battery hook
+- :ref:`Firmware Attributes <firmware-attributes>` to allow control of various
+  device settings
+- :ref:`Handling of Fn hotkeys <keyboard-hotkey-actions>` for various actions
+- :ref:`Handling of ACPI notifications and hotkeys
+  <acpi-notifications-and-hotkey-actions>`
+
+Because different models of these devices can vary in their features, there is
+logic built within the driver which attempts to test each implemented feature
+for a valid response before enabling its support (registering additional devices
+or extensions, adding sysfs attributes, etc). Therefore, it can be important to
+note that not all features may be supported for your particular device.
+
+The following features might be possible to implement but will require
+additional investigation and are therefore not supported at this time:
+
+- "Dolby Atmos" mode for the speakers
+- "Outdoor Mode" for increasing screen brightness on models with ``SAM0427``
+- "Silent Mode" on models with ``SAM0427``
+
+.. _keyboard-backlight:
+
+Keyboard backlight
+==================
+
+A new LED class named ``samsung-galaxybook::kbd_backlight`` is created which
+will then expose the device using the standard sysfs-based LED interface at
+``/sys/class/leds/samsung-galaxybook::kbd_backlight``. Brightness can be
+controlled by writing the desired value to the ``brightness`` sysfs attribute or
+with any other desired userspace utility.
+
+.. note::
+  Most of these devices have an ambient light sensor which also turns
+  off the keyboard backlight under well-lit conditions. This behavior does not
+  seem possible to control at this time, but can be good to be aware of.
+
+.. _performance-mode:
+
+Performance mode
+================
+
+This driver implements the
+Documentation/userspace-api/sysfs-platform_profile.rst interface for working
+with the "performance mode" function of the Samsung ACPI device.
+
+Mapping of each Samsung "performance mode" to its respective platform profile is
+performed dynamically by the driver, as not all models support all of the same
+performance modes. Your device might have one or more of the following mappings:
+
+- "Silent" maps to ``low-power``
+- "Quiet" maps to ``quiet``
+- "Optimized" maps to ``balanced``
+- "Performance" maps to ``performance``
+- For devices which support "Ultra", "Ultra" will map to ``performance`` and
+  "Performance" will be re-mapped to ``balanced-performance``.
+
+The result of the mapping can be printed in the kernel log when the module is
+loaded. Supported profiles can also be retrieved from
+``/sys/firmware/acpi/platform_profile_choices``, while
+``/sys/firmware/acpi/platform_profile`` can be used to read or write the
+currently selected profile.
+
+The ``balanced`` platform profile will be set during module load if no profile
+has been previously set.
+
+.. _battery-charge-control-end-threshold:
+
+Battery charge control end threshold
+====================================
+
+This platform driver will add the ability to set the battery's charge control
+end threshold, but does not have the ability to set a start threshold.
+
+This feature is typically called "Battery Saver" by the various Samsung
+applications in Windows, but in Linux we have implemented the standardized
+"charge control threshold" sysfs interface on the battery device to allow for
+controlling this functionality from the userspace.
+
+The sysfs attribute
+``/sys/class/power_supply/BAT1/charge_control_end_threshold`` can be used to
+read or set the desired charge end threshold.
+
+If you wish to maintain interoperability with Windows, then you should set the
+value to 80 to represent "on", or 100 to represent "off", as these are the
+values currently recognized by the various Windows-based Samsung applications
+and services as "on" or "off". Otherwise, the device will accept any value
+between 1 and 100 as the percentage that you wish the battery to stop charging
+at.
+
+.. _firmware-attributes:
+
+Firmware Attributes
+===================
+
+The following enumeration-typed firmware attributes are set up by this driver
+and should be accessible under
+``/sys/class/firmware-attributes/samsung-galaxybook/attributes/`` if your device
+supports them:
+
+- ``power_on_lid_open`` (device should power on when the lid is opened)
+- ``usb_charging``  (USB ports can deliver power to connected devices even when
+  the device is powered off or in a low sleep state)
+- ``block_recording`` (blocks access to camera and microphone)
+
+All of these attributes are simple boolean-like enumeration values which use 0
+to represent "off" and 1 to represent "on". Use the ``current_value`` attribute
+to get or change the setting on the device.
+
+Note that when ``block_recording`` is updated, the input device "Samsung Galaxy
+Book Lens Cover" will receive a ``SW_CAMERA_LENS_COVER`` switch event which
+reflects the current state.
+
+.. _keyboard-hotkey-actions:
+
+Keyboard hotkey actions (i8042 filter)
+======================================
+
+The i8042 filter will swallow the keyboard events for the Fn+F9 hotkey (Multi-
+level keyboard backlight toggle) and Fn+F10 hotkey (Block recording toggle)
+and instead execute their actions within the driver itself.
+
+Fn+F9 will cycle through the brightness levels of the keyboard backlight. A
+notification will be sent using ``led_classdev_notify_brightness_hw_changed``
+so that the userspace can be aware of the change. This mimics the behavior of
+other existing devices where the brightness level is cycled internally by the
+embedded controller and then reported via a notification.
+
+Fn+F10 will toggle the value of the "block recording" setting, which blocks
+or allows usage of the built-in camera and microphone.
+
+.. _acpi-notifications-and-hotkey-actions:
+
+ACPI notifications and hotkey actions
+=====================================
+
+ACPI notifications will generate ACPI netlink events and can be received using
+userspace tools such as ``acpi_listen`` and ``acpid``.
+
+The Fn+F11 Performance mode hotkey will be handled by the driver; each keypress
+will cycle to the next available platform profile.
diff --git a/MAINTAINERS b/MAINTAINERS
index 3809931b9240..e74873a1e74b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20733,6 +20733,13 @@ L:	linux-fbdev@vger.kernel.org
 S:	Maintained
 F:	drivers/video/fbdev/s3c-fb.c
 
+SAMSUNG GALAXY BOOK EXTRAS DRIVER
+M:	Joshua Grisham <josh@joshuagrisham.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/laptops/samsung-galaxybook.rst
+F:	drivers/platform/x86/samsung-galaxybook.c
+
 SAMSUNG INTERCONNECT DRIVERS
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Artur Świgoń <a.swigon@samsung.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64..c77178e2640b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -778,6 +778,23 @@ config BARCO_P50_GPIO
 	  To compile this driver as a module, choose M here: the module
 	  will be called barco-p50-gpio.
 
+config SAMSUNG_GALAXYBOOK
+	tristate "Samsung Galaxy Book driver"
+	depends on ACPI
+	depends on ACPI_BATTERY
+	depends on INPUT
+	depends on LEDS_CLASS
+	depends on SERIO_I8042
+	select ACPI_PLATFORM_PROFILE
+	select FW_ATTR_CLASS
+	help
+	  This is a driver for Samsung Galaxy Book series notebooks. It adds
+	  support for the keyboard backlight control, performance mode control,
+	  function keys, and various firmware attributes.
+
+	  For more information about this driver, see
+	  <file:Documentation/admin-guide/laptops/samsung-galaxybook.rst>.
+
 config SAMSUNG_LAPTOP
 	tristate "Samsung Laptop driver"
 	depends on RFKILL || RFKILL = n
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..32ec4cb9d902 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -95,8 +95,9 @@ obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
 obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
 
 # Samsung
-obj-$(CONFIG_SAMSUNG_LAPTOP)	+= samsung-laptop.o
-obj-$(CONFIG_SAMSUNG_Q10)	+= samsung-q10.o
+obj-$(CONFIG_SAMSUNG_GALAXYBOOK)	+= samsung-galaxybook.o
+obj-$(CONFIG_SAMSUNG_LAPTOP)		+= samsung-laptop.o
+obj-$(CONFIG_SAMSUNG_Q10)		+= samsung-q10.o
 
 # Toshiba
 obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
new file mode 100644
index 000000000000..44a96360469a
--- /dev/null
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -0,0 +1,1482 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Samsung Galaxy Book series extras driver
+ *
+ * Copyright (c) 2025 Joshua Grisham <josh@joshuagrisham.com>
+ *
+ * With contributions to the SCAI ACPI device interface:
+ * Copyright (c) 2024 Giulio Girardi <giulio.girardi@protechgroup.it>
+ *
+ * Implementation inspired by existing x86 platform drivers.
+ * Thank you to the authors!
+ */
+
+#include <linux/acpi.h>
+#include <linux/err.h>
+#include <linux/i8042.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/platform_profile.h>
+#include <linux/serio.h>
+#include <linux/sysfs.h>
+#include <linux/uuid.h>
+#include <linux/workqueue.h>
+#include <acpi/battery.h>
+#include "firmware_attributes_class.h"
+
+#define DRIVER_NAME "samsung-galaxybook"
+
+struct samsung_galaxybook {
+	struct platform_device *platform;
+	struct acpi_device *acpi;
+
+	const struct class *fw_attrs_class;
+	struct device *fw_attrs_dev;
+	struct kset *fw_attrs_kset;
+	/* block out of sync condition if firmware attributes are updated in multiple threads */
+	struct mutex fw_attr_lock;
+
+	bool has_kbd_backlight;
+	bool has_block_recording;
+	bool has_performance_mode;
+
+	struct led_classdev kbd_backlight;
+	struct work_struct kbd_backlight_hotkey_work;
+	/* block out of sync condition in hotkey action if brightness updated in another thread */
+	struct mutex kbd_backlight_lock;
+
+	void *i8042_filter_ptr;
+
+	struct work_struct block_recording_hotkey_work;
+	struct input_dev *camera_lens_cover_switch;
+
+	struct acpi_battery_hook battery_hook;
+	struct device_attribute charge_control_end_threshold_attr;
+
+	u8 profile_performance_modes[PLATFORM_PROFILE_LAST];
+	struct platform_profile_handler profile_handler;
+};
+
+static struct samsung_galaxybook *galaxybook_ptr;
+
+enum galaxybook_fw_attr_id {
+	GB_ATTR_POWER_ON_LID_OPEN,
+	GB_ATTR_USB_CHARGING,
+	GB_ATTR_BLOCK_RECORDING,
+};
+
+static const char * const galaxybook_fw_attr_name[] = {
+	[GB_ATTR_POWER_ON_LID_OPEN] = "power_on_lid_open",
+	[GB_ATTR_USB_CHARGING] = "usb_charging",
+	[GB_ATTR_BLOCK_RECORDING] = "block_recording",
+};
+
+static const char * const galaxybook_fw_attr_desc[] = {
+	[GB_ATTR_POWER_ON_LID_OPEN] = "Power On Lid Open",
+	[GB_ATTR_USB_CHARGING] = "USB Charging",
+	[GB_ATTR_BLOCK_RECORDING] = "Block Recording",
+};
+
+#define GB_ATTR_LANGUAGE_CODE "en_US.UTF-8"
+
+struct galaxybook_fw_attr {
+	struct samsung_galaxybook *galaxybook;
+	enum galaxybook_fw_attr_id fw_attr_id;
+	struct attribute_group attr_group;
+	struct kobj_attribute display_name;
+	struct kobj_attribute current_value;
+	int (*get_value)(struct samsung_galaxybook *galaxybook, bool *value);
+	int (*set_value)(struct samsung_galaxybook *galaxybook, const bool value);
+};
+
+struct sawb {
+	u16 safn;
+	u16 sasb;
+	u8 rflg;
+	union {
+		struct {
+			u8 gunm;
+			u8 guds[250];
+		} __packed;
+		struct {
+			u8 caid[16];
+			u8 fncn;
+			u8 subn;
+			u8 iob0;
+			u8 iob1;
+			u8 iob2;
+			u8 iob3;
+			u8 iob4;
+			u8 iob5;
+			u8 iob6;
+			u8 iob7;
+			u8 iob8;
+			u8 iob9;
+		} __packed;
+		struct {
+			u8 iob_prefix[18];
+			u8 iob_values[10];
+		} __packed;
+	} __packed;
+} __packed;
+
+#define GB_SAWB_LEN_SETTINGS          0x15
+#define GB_SAWB_LEN_PERFORMANCE_MODE  0x100
+
+#define GB_SAFN  0x5843
+
+#define GB_SASB_KBD_BACKLIGHT     0x78
+#define GB_SASB_POWER_MANAGEMENT  0x7a
+#define GB_SASB_USB_CHARGING_GET  0x67
+#define GB_SASB_USB_CHARGING_SET  0x68
+#define GB_SASB_NOTIFICATIONS     0x86
+#define GB_SASB_BLOCK_RECORDING   0x8a
+#define GB_SASB_PERFORMANCE_MODE  0x91
+
+#define GB_SAWB_RFLG_POS     4
+#define GB_SAWB_GB_GUNM_POS  5
+
+#define GB_RFLG_SUCCESS  0xaa
+#define GB_GUNM_FAIL     0xff
+
+#define GB_GUNM_FEATURE_ENABLE          0xbb
+#define GB_GUNM_FEATURE_ENABLE_SUCCESS  0xdd
+#define GB_GUDS_FEATURE_ENABLE          0xaa
+#define GB_GUDS_FEATURE_ENABLE_SUCCESS  0xcc
+
+#define GB_GUNM_GET  0x81
+#define GB_GUNM_SET  0x82
+
+#define GB_GUNM_POWER_MANAGEMENT  0x82
+
+#define GB_GUNM_USB_CHARGING_GET            0x80
+#define GB_GUNM_USB_CHARGING_ON             0x81
+#define GB_GUNM_USB_CHARGING_OFF            0x80
+#define GB_GUDS_POWER_ON_LID_OPEN           0xa3
+#define GB_GUDS_POWER_ON_LID_OPEN_GET       0x81
+#define GB_GUDS_POWER_ON_LID_OPEN_SET       0x80
+#define GB_GUDS_BATTERY_CHARGE_CONTROL      0xe9
+#define GB_GUDS_BATTERY_CHARGE_CONTROL_GET  0x91
+#define GB_GUDS_BATTERY_CHARGE_CONTROL_SET  0x90
+#define GB_GUNM_ACPI_NOTIFY_ENABLE          0x80
+#define GB_GUDS_ACPI_NOTIFY_ENABLE          0x02
+
+#define GB_BLOCK_RECORDING_ON   0x0
+#define GB_BLOCK_RECORDING_OFF  0x1
+
+#define GB_FNCN_PERFORMANCE_MODE       0x51
+#define GB_SUBN_PERFORMANCE_MODE_LIST  0x01
+#define GB_SUBN_PERFORMANCE_MODE_GET   0x02
+#define GB_SUBN_PERFORMANCE_MODE_SET   0x03
+
+/* guid 8246028d-8bca-4a55-ba0f-6f1e6b921b8f */
+static const guid_t performance_mode_guid =
+	GUID_INIT(0x8246028d, 0x8bca, 0x4a55, 0xba, 0x0f, 0x6f, 0x1e, 0x6b, 0x92, 0x1b, 0x8f);
+#define GB_PERFORMANCE_MODE_GUID performance_mode_guid
+
+#define GB_PERFORMANCE_MODE_ULTRA               0x16
+#define GB_PERFORMANCE_MODE_PERFORMANCE         0x15
+#define GB_PERFORMANCE_MODE_SILENT              0xb
+#define GB_PERFORMANCE_MODE_QUIET               0xa
+#define GB_PERFORMANCE_MODE_OPTIMIZED           0x2
+#define GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY  0x1
+#define GB_PERFORMANCE_MODE_OPTIMIZED_LEGACY    0x0
+#define GB_PERFORMANCE_MODE_UNKNOWN             0xff
+
+#define GB_ACPI_METHOD_ENABLE            "SDLS"
+#define GB_ACPI_METHOD_ENABLE_ON         1
+#define GB_ACPI_METHOD_ENABLE_OFF        0
+#define GB_ACPI_METHOD_SETTINGS          "CSFI"
+#define GB_ACPI_METHOD_PERFORMANCE_MODE  "CSXI"
+
+#define GB_KBD_BACKLIGHT_MAX_BRIGHTNESS  3
+
+#define GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED    0x61
+#define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
+#define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
+#define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
+
+#define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
+#define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
+#define GB_KEY_BLOCK_RECORDING_KEYDOWN  0x1f
+#define GB_KEY_BLOCK_RECORDING_KEYUP    0x9f
+#define GB_KEY_BATTERY_NOTIFY_KEYUP     0xf
+#define GB_KEY_BATTERY_NOTIFY_KEYDOWN   0x8f
+
+/*
+ * ACPI method handling
+ */
+
+static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_string method,
+				  struct sawb *buf, size_t len)
+{
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	union acpi_object in_obj, *out_obj;
+	struct acpi_object_list input;
+	acpi_status status;
+	int err;
+
+	in_obj.type = ACPI_TYPE_BUFFER;
+	in_obj.buffer.length = len;
+	in_obj.buffer.pointer = (u8 *)buf;
+
+	input.count = 1;
+	input.pointer = &in_obj;
+
+	status = acpi_evaluate_object_typed(galaxybook->acpi->handle, method, &input, &output,
+					    ACPI_TYPE_BUFFER);
+
+	if (ACPI_FAILURE(status)) {
+		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; got %s\n",
+			method, acpi_format_exception(status));
+		return -EIO;
+	}
+
+	out_obj = output.pointer;
+
+	if (out_obj->buffer.length != len || out_obj->buffer.length < GB_SAWB_GB_GUNM_POS + 1) {
+		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
+			"response length mismatch\n", method);
+		err = -EPROTO;
+		goto out_free;
+	}
+	if (out_obj->buffer.pointer[GB_SAWB_RFLG_POS] != GB_RFLG_SUCCESS) {
+		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
+			"device did not respond with success code 0x%x\n",
+			method, GB_RFLG_SUCCESS);
+		err = -ENXIO;
+		goto out_free;
+	}
+	if (out_obj->buffer.pointer[GB_SAWB_GB_GUNM_POS] == GB_GUNM_FAIL) {
+		dev_err(&galaxybook->acpi->dev,
+			"failed to execute method %s; device responded with failure code 0x%x\n",
+			method, GB_GUNM_FAIL);
+		err = -ENXIO;
+		goto out_free;
+	}
+
+	memcpy(buf, out_obj->buffer.pointer, len);
+	err = 0;
+
+out_free:
+	kfree(out_obj);
+	return err;
+}
+
+static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *galaxybook, const u16 sasb)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = sasb;
+	buf.gunm = GB_GUNM_FEATURE_ENABLE;
+	buf.guds[0] = GB_GUDS_FEATURE_ENABLE;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	if (buf.gunm != GB_GUNM_FEATURE_ENABLE_SUCCESS &&
+	    buf.guds[0] != GB_GUDS_FEATURE_ENABLE_SUCCESS)
+		return -ENODEV;
+
+	return 0;
+}
+
+/*
+ * Keyboard Backlight
+ */
+
+static int kbd_backlight_acpi_set(struct samsung_galaxybook *galaxybook,
+				  const enum led_brightness brightness)
+{
+	struct sawb buf = { 0 };
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_KBD_BACKLIGHT;
+	buf.gunm = GB_GUNM_SET;
+
+	buf.guds[0] = brightness;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+static int kbd_backlight_acpi_get(struct samsung_galaxybook *galaxybook,
+				  enum led_brightness *brightness)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_KBD_BACKLIGHT;
+	buf.gunm = GB_GUNM_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*brightness = buf.gunm;
+
+	return 0;
+}
+
+static int kbd_backlight_store(struct led_classdev *led,
+			       const enum led_brightness brightness)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of_const(led, struct samsung_galaxybook, kbd_backlight);
+
+	return kbd_backlight_acpi_set(galaxybook, brightness);
+}
+
+static enum led_brightness kbd_backlight_show(struct led_classdev *led)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(led, struct samsung_galaxybook, kbd_backlight);
+	enum led_brightness brightness;
+	int err;
+
+	err = kbd_backlight_acpi_get(galaxybook, &brightness);
+	if (err)
+		return err;
+
+	return brightness;
+}
+
+static int galaxybook_kbd_backlight_init(struct samsung_galaxybook *galaxybook)
+{
+	struct led_init_data init_data = {};
+	enum led_brightness brightness;
+	int err;
+
+	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->kbd_backlight_lock);
+	if (err)
+		return err;
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_KBD_BACKLIGHT);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to enable kbd_backlight feature, error %d\n", err);
+		return 0;
+	}
+
+	/* verify we can read the value, otherwise stop without setting has_kbd_backlight */
+	err = kbd_backlight_acpi_get(galaxybook, &brightness);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get initial kbd_backlight brightness, error %d\n", err);
+		return 0;
+	}
+
+	init_data.devicename = DRIVER_NAME;
+	init_data.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT;
+	init_data.devname_mandatory = true;
+
+	galaxybook->kbd_backlight.brightness_get = kbd_backlight_show;
+	galaxybook->kbd_backlight.brightness_set_blocking = kbd_backlight_store;
+	galaxybook->kbd_backlight.flags = LED_BRIGHT_HW_CHANGED;
+	galaxybook->kbd_backlight.max_brightness = GB_KBD_BACKLIGHT_MAX_BRIGHTNESS;
+
+	err = devm_led_classdev_register_ext(&galaxybook->platform->dev,
+					     &galaxybook->kbd_backlight, &init_data);
+	if (err)
+		return err;
+
+	galaxybook->has_kbd_backlight = true;
+
+	return 0;
+}
+
+/*
+ * Battery Extension (adds charge_control_end_threshold to the battery device)
+ */
+
+static int charge_control_end_threshold_acpi_set(struct samsung_galaxybook *galaxybook, u8 value)
+{
+	struct sawb buf = { 0 };
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_POWER_MANAGEMENT;
+	buf.gunm = GB_GUNM_POWER_MANAGEMENT;
+	buf.guds[0] = GB_GUDS_BATTERY_CHARGE_CONTROL;
+	buf.guds[1] = GB_GUDS_BATTERY_CHARGE_CONTROL_SET;
+	buf.guds[2] = value;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+static int charge_control_end_threshold_acpi_get(struct samsung_galaxybook *galaxybook, u8 *value)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_POWER_MANAGEMENT;
+	buf.gunm = GB_GUNM_POWER_MANAGEMENT;
+	buf.guds[0] = GB_GUDS_BATTERY_CHARGE_CONTROL;
+	buf.guds[1] = GB_GUDS_BATTERY_CHARGE_CONTROL_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*value = buf.guds[1];
+
+	return 0;
+}
+
+static ssize_t charge_control_end_threshold_store(struct device *dev, struct device_attribute *attr,
+						  const char *buf, size_t count)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(attr, struct samsung_galaxybook, charge_control_end_threshold_attr);
+	u8 value;
+	int err;
+
+	if (!count)
+		return -EINVAL;
+
+	err = kstrtou8(buf, 0, &value);
+	if (err)
+		return err;
+
+	if (value < 1 || value > 100)
+		return -EINVAL;
+
+	/* device stores "no end threshold" as 0 instead of 100; if setting to 100, send 0 */
+	if (value == 100)
+		value = 0;
+
+	err = charge_control_end_threshold_acpi_set(galaxybook, value);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static ssize_t charge_control_end_threshold_show(struct device *dev, struct device_attribute *attr,
+						 char *buf)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(attr, struct samsung_galaxybook, charge_control_end_threshold_attr);
+	u8 value;
+	int err;
+
+	err = charge_control_end_threshold_acpi_get(galaxybook, &value);
+	if (err)
+		return err;
+
+	/* device stores "no end threshold" as 0 instead of 100; if device has 0, report 100 */
+	if (value == 0)
+		value = 100;
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static int galaxybook_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(hook, struct samsung_galaxybook, battery_hook);
+
+	return device_create_file(&battery->dev, &galaxybook->charge_control_end_threshold_attr);
+}
+
+static int galaxybook_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(hook, struct samsung_galaxybook, battery_hook);
+
+	device_remove_file(&battery->dev, &galaxybook->charge_control_end_threshold_attr);
+	return 0;
+}
+
+static int galaxybook_battery_threshold_init(struct samsung_galaxybook *galaxybook)
+{
+	struct acpi_battery_hook *hook;
+	struct device_attribute *attr;
+	u8 value;
+	int err;
+
+	err = charge_control_end_threshold_acpi_get(galaxybook, &value);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get initial battery charge end threshold, error %d\n", err);
+		return 0;
+	}
+
+	hook = &galaxybook->battery_hook;
+	hook->add_battery = galaxybook_battery_add;
+	hook->remove_battery = galaxybook_battery_remove;
+	hook->name = "Samsung Galaxy Book Battery Extension";
+
+	attr = &galaxybook->charge_control_end_threshold_attr;
+	sysfs_attr_init(&attr->attr);
+	attr->attr.name = "charge_control_end_threshold";
+	attr->attr.mode = 0644;
+	attr->show = charge_control_end_threshold_show;
+	attr->store = charge_control_end_threshold_store;
+
+	return devm_battery_hook_register(&galaxybook->platform->dev, &galaxybook->battery_hook);
+}
+
+/*
+ * Platform Profile / Performance mode
+ */
+
+static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybook,
+				     const u8 performance_mode)
+{
+	struct sawb buf = { 0 };
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_PERFORMANCE_MODE;
+	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
+	buf.fncn = GB_FNCN_PERFORMANCE_MODE;
+	buf.subn = GB_SUBN_PERFORMANCE_MODE_SET;
+	buf.iob0 = performance_mode;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
+				      &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
+}
+
+static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybook, u8 *performance_mode)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_PERFORMANCE_MODE;
+	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
+	buf.fncn = GB_FNCN_PERFORMANCE_MODE;
+	buf.subn = GB_SUBN_PERFORMANCE_MODE_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
+				     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
+	if (err)
+		return err;
+
+	*performance_mode = buf.iob0;
+
+	return 0;
+}
+
+static int get_performance_mode_profile(struct samsung_galaxybook *galaxybook,
+					const u8 performance_mode,
+					enum platform_profile_option *profile)
+{
+	for (int i = 0; i < PLATFORM_PROFILE_LAST; i++) {
+		if (galaxybook->profile_performance_modes[i] == performance_mode) {
+			if (profile)
+				*profile = i;
+			return 0;
+		}
+	}
+
+	return -ENODATA;
+}
+
+static int galaxybook_platform_profile_set(struct platform_profile_handler *pprof,
+					   enum platform_profile_option profile)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(pprof, struct samsung_galaxybook, profile_handler);
+
+	return performance_mode_acpi_set(galaxybook,
+					 galaxybook->profile_performance_modes[profile]);
+}
+
+static int galaxybook_platform_profile_get(struct platform_profile_handler *pprof,
+					   enum platform_profile_option *profile)
+{
+	struct samsung_galaxybook *galaxybook =
+		container_of(pprof, struct samsung_galaxybook, profile_handler);
+	u8 performance_mode;
+	int err;
+
+	err = performance_mode_acpi_get(galaxybook, &performance_mode);
+	if (err)
+		return err;
+
+	return get_performance_mode_profile(galaxybook, performance_mode, profile);
+}
+
+static void galaxybook_set_profile_choice(struct samsung_galaxybook *galaxybook,
+					  enum platform_profile_option profile, const u8 value)
+{
+	galaxybook->profile_performance_modes[profile] = value;
+	set_bit(profile, galaxybook->profile_handler.choices);
+	dev_dbg(&galaxybook->platform->dev, "profile %d is now mapped to performance mode 0x%x\n",
+		profile, value);
+}
+
+static int galaxybook_profile_init(struct samsung_galaxybook *galaxybook)
+{
+	u8 init_performance_mode = GB_PERFORMANCE_MODE_UNKNOWN;
+	u8 performance_mode = GB_PERFORMANCE_MODE_UNKNOWN;
+	struct sawb buf = { 0 };
+	int num_mapped = 0;
+	int err;
+	int i;
+
+	/* fetch supported performance mode values from ACPI method */
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_PERFORMANCE_MODE;
+	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
+	buf.fncn = GB_FNCN_PERFORMANCE_MODE;
+	buf.subn = GB_SUBN_PERFORMANCE_MODE_LIST;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
+				     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get supported performance modes, error %d\n", err);
+		return 0;
+	}
+
+	/* set up profile_performance_modes with "unknown" as init value */
+	for (i = 0; i < PLATFORM_PROFILE_LAST; i++)
+		galaxybook->profile_performance_modes[i] = GB_PERFORMANCE_MODE_UNKNOWN;
+
+	/*
+	 * Value returned in iob0 will have the number of supported performance modes per device.
+	 * The performance mode values will then be given as a list after this (iob1-iobX).
+	 * Loop through the values and assign to the appropriate platform_profile_option,
+	 * overriding "legacy" values along the way if a non-legacy value exists.
+	 */
+	for (i = 1; i <= buf.iob0; i++) {
+		switch (buf.iob_values[i]) {
+		case GB_PERFORMANCE_MODE_SILENT:
+			galaxybook_set_profile_choice(galaxybook, PLATFORM_PROFILE_LOW_POWER,
+						      buf.iob_values[i]);
+			num_mapped++;
+			break;
+
+		case GB_PERFORMANCE_MODE_QUIET:
+			galaxybook_set_profile_choice(galaxybook, PLATFORM_PROFILE_QUIET,
+						      buf.iob_values[i]);
+			num_mapped++;
+			break;
+
+		case GB_PERFORMANCE_MODE_OPTIMIZED_LEGACY:
+			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_BALANCED] !=
+			    GB_PERFORMANCE_MODE_UNKNOWN)
+				break;
+			galaxybook_set_profile_choice(galaxybook, PLATFORM_PROFILE_BALANCED,
+						      buf.iob_values[i]);
+			init_performance_mode = buf.iob_values[i];
+			num_mapped++;
+			break;
+
+		case GB_PERFORMANCE_MODE_OPTIMIZED:
+			galaxybook_set_profile_choice(galaxybook, PLATFORM_PROFILE_BALANCED,
+						      buf.iob_values[i]);
+			init_performance_mode = buf.iob_values[i];
+			num_mapped++;
+			break;
+
+		case GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY:
+			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_PERFORMANCE] !=
+			    GB_PERFORMANCE_MODE_UNKNOWN)
+				break;
+			galaxybook_set_profile_choice(galaxybook, PLATFORM_PROFILE_PERFORMANCE,
+						      buf.iob_values[i]);
+			num_mapped++;
+			break;
+
+		case GB_PERFORMANCE_MODE_PERFORMANCE:
+			/* if ultra is already mapped, map to balanced-performance */
+			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_PERFORMANCE] ==
+			    GB_PERFORMANCE_MODE_ULTRA)
+				galaxybook_set_profile_choice(galaxybook,
+							      PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+							      buf.iob_values[i]);
+			else
+				galaxybook_set_profile_choice(galaxybook,
+							      PLATFORM_PROFILE_PERFORMANCE,
+							      buf.iob_values[i]);
+			num_mapped++;
+			break;
+
+		case GB_PERFORMANCE_MODE_ULTRA:
+			/* if ultra is supported, downgrade performance to balanced-performance */
+			performance_mode =
+				galaxybook->profile_performance_modes[PLATFORM_PROFILE_PERFORMANCE];
+			galaxybook_set_profile_choice(galaxybook,
+						      PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+						      performance_mode);
+			galaxybook_set_profile_choice(galaxybook, PLATFORM_PROFILE_PERFORMANCE,
+						      buf.iob_values[i]);
+			num_mapped++;
+			break;
+
+		default:
+			dev_dbg(&galaxybook->platform->dev,
+				"unmapped performance mode 0x%x will be ignored\n",
+				buf.iob_values[i]);
+			break;
+		}
+	}
+
+	if (num_mapped == 0) {
+		dev_dbg(&galaxybook->platform->dev, "failed to map any performance modes\n");
+		return 0;
+	}
+
+	err = performance_mode_acpi_get(galaxybook, &performance_mode);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get initial performance mode, error %d\n", err);
+		return 0;
+	}
+
+	/* if startup performance_mode fails to match a profile, try to set init mode */
+	err = get_performance_mode_profile(galaxybook, performance_mode, NULL);
+	if (err) {
+		if (init_performance_mode == GB_PERFORMANCE_MODE_UNKNOWN) {
+			dev_err(&galaxybook->platform->dev, "missing initial performance mode\n");
+			return -ENODATA;
+		}
+		err = performance_mode_acpi_set(galaxybook, init_performance_mode);
+		if (err) {
+			dev_err(&galaxybook->platform->dev,
+				"failed to set initial performance mode 0x%x\n",
+				init_performance_mode);
+			return err;
+		}
+	}
+
+	galaxybook->profile_handler.name = DRIVER_NAME;
+	galaxybook->profile_handler.dev = &galaxybook->platform->dev;
+	galaxybook->profile_handler.profile_get = galaxybook_platform_profile_get;
+	galaxybook->profile_handler.profile_set = galaxybook_platform_profile_set;
+
+	err = devm_platform_profile_register(&galaxybook->profile_handler);
+	if (err)
+		return err;
+
+	galaxybook->has_performance_mode = true;
+
+	return 0;
+}
+
+/*
+ * Firmware Attributes
+ */
+
+/* Power on lid open (device should power on when lid is opened) */
+
+static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
+{
+	struct sawb buf = { 0 };
+
+	lockdep_assert_held(&galaxybook->fw_attr_lock);
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_POWER_MANAGEMENT;
+	buf.gunm = GB_GUNM_POWER_MANAGEMENT;
+	buf.guds[0] = GB_GUDS_POWER_ON_LID_OPEN;
+	buf.guds[1] = GB_GUDS_POWER_ON_LID_OPEN_SET;
+	buf.guds[2] = value ? 1 : 0;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_POWER_MANAGEMENT;
+	buf.gunm = GB_GUNM_POWER_MANAGEMENT;
+	buf.guds[0] = GB_GUDS_POWER_ON_LID_OPEN;
+	buf.guds[1] = GB_GUDS_POWER_ON_LID_OPEN_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*value = buf.guds[1];
+
+	return 0;
+}
+
+/* USB Charging (USB ports can charge other devices even when device is powered off) */
+
+static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
+{
+	struct sawb buf = { 0 };
+
+	lockdep_assert_held(&galaxybook->fw_attr_lock);
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_USB_CHARGING_SET;
+	buf.gunm = value ? GB_GUNM_USB_CHARGING_ON : GB_GUNM_USB_CHARGING_OFF;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_USB_CHARGING_GET;
+	buf.gunm = GB_GUNM_USB_CHARGING_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*value = buf.gunm == 1;
+
+	return 0;
+}
+
+/* Block recording (blocks access to camera and microphone) */
+
+static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	lockdep_assert_held(&galaxybook->fw_attr_lock);
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_BLOCK_RECORDING;
+	buf.gunm = GB_GUNM_SET;
+	buf.guds[0] = value ? GB_BLOCK_RECORDING_ON : GB_BLOCK_RECORDING_OFF;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	input_report_switch(galaxybook->camera_lens_cover_switch,
+			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
+	input_sync(galaxybook->camera_lens_cover_switch);
+
+	return 0;
+}
+
+static int block_recording_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_BLOCK_RECORDING;
+	buf.gunm = GB_GUNM_GET;
+
+	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				     &buf, GB_SAWB_LEN_SETTINGS);
+	if (err)
+		return err;
+
+	*value = buf.gunm == GB_BLOCK_RECORDING_ON;
+
+	return 0;
+}
+
+static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook)
+{
+	bool value;
+	int err;
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_BLOCK_RECORDING);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to initialize block_recording, error %d\n", err);
+		return 0;
+	}
+
+	guard(mutex)(&galaxybook->fw_attr_lock);
+
+	err = block_recording_acpi_get(galaxybook, &value);
+	if (err) {
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to get initial block_recording state, error %d\n", err);
+		return 0;
+	}
+
+	galaxybook->camera_lens_cover_switch =
+		devm_input_allocate_device(&galaxybook->platform->dev);
+	if (!galaxybook->camera_lens_cover_switch)
+		return -ENOMEM;
+
+	galaxybook->camera_lens_cover_switch->name = "Samsung Galaxy Book Camera Lens Cover";
+	galaxybook->camera_lens_cover_switch->phys = DRIVER_NAME "/input0";
+	galaxybook->camera_lens_cover_switch->id.bustype = BUS_HOST;
+
+	input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW, SW_CAMERA_LENS_COVER);
+
+	err = input_register_device(galaxybook->camera_lens_cover_switch);
+	if (err)
+		return err;
+
+	input_report_switch(galaxybook->camera_lens_cover_switch,
+			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
+	input_sync(galaxybook->camera_lens_cover_switch);
+
+	galaxybook->has_block_recording = true;
+
+	return 0;
+}
+
+/* Firmware Attributes setup */
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "enumeration\n");
+}
+
+static struct kobj_attribute fw_attr_type = __ATTR_RO(type);
+
+static ssize_t default_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0\n");
+}
+
+static struct kobj_attribute fw_attr_default_value = __ATTR_RO(default_value);
+
+static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0;1\n");
+}
+
+static struct kobj_attribute fw_attr_possible_values = __ATTR_RO(possible_values);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj, struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "%s\n", GB_ATTR_LANGUAGE_CODE);
+}
+
+static struct kobj_attribute fw_attr_display_name_language_code =
+	__ATTR_RO(display_name_language_code);
+
+static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct galaxybook_fw_attr *fw_attr =
+		container_of(attr, struct galaxybook_fw_attr, display_name);
+
+	return sysfs_emit(buf, "%s\n", galaxybook_fw_attr_desc[fw_attr->fw_attr_id]);
+}
+
+static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct galaxybook_fw_attr *fw_attr =
+		container_of(attr, struct galaxybook_fw_attr, current_value);
+	struct samsung_galaxybook *galaxybook = fw_attr->galaxybook;
+
+	bool value;
+	int err;
+
+	if (!count)
+		return -EINVAL;
+
+	err = kstrtobool(buf, &value);
+	if (err)
+		return err;
+
+	guard(mutex)(&galaxybook->fw_attr_lock);
+
+	err = fw_attr->set_value(galaxybook, value);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct galaxybook_fw_attr *fw_attr =
+		container_of(attr, struct galaxybook_fw_attr, current_value);
+	bool value;
+	int err;
+
+	err = fw_attr->get_value(fw_attr->galaxybook, &value);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static void galaxybook_fw_attr_remove(void *data)
+{
+	struct galaxybook_fw_attr *fw_attr = data;
+	struct samsung_galaxybook *galaxybook = fw_attr->galaxybook;
+
+	sysfs_remove_group(&galaxybook->fw_attrs_kset->kobj, &fw_attr->attr_group);
+}
+
+#define NUM_FW_ATTR_ENUM_ATTRS  6
+
+static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
+				   const enum galaxybook_fw_attr_id fw_attr_id,
+				   int (*get_value)(struct samsung_galaxybook *galaxybook,
+						    bool *value),
+				   int (*set_value)(struct samsung_galaxybook *galaxybook,
+						    const bool value))
+{
+	struct galaxybook_fw_attr *fw_attr;
+	struct attribute **attrs;
+	int err;
+
+	fw_attr = devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_attr), GFP_KERNEL);
+	if (!fw_attr)
+		return -ENOMEM;
+
+	attrs = devm_kcalloc(&galaxybook->platform->dev, NUM_FW_ATTR_ENUM_ATTRS + 1,
+			     sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	attrs[0] = &fw_attr_type.attr;
+	attrs[1] = &fw_attr_default_value.attr;
+	attrs[2] = &fw_attr_possible_values.attr;
+	attrs[3] = &fw_attr_display_name_language_code.attr;
+
+	sysfs_attr_init(&fw_attr.display_name);
+	fw_attr->display_name.attr.name = "display_name";
+	fw_attr->display_name.attr.mode = 0444;
+	fw_attr->display_name.show = display_name_show;
+	attrs[4] = &fw_attr->display_name.attr;
+
+	sysfs_attr_init(&fw_attr.current_value);
+	fw_attr->current_value.attr.name = "current_value";
+	fw_attr->current_value.attr.mode = 0644;
+	fw_attr->current_value.show = current_value_show;
+	fw_attr->current_value.store = current_value_store;
+	attrs[5] = &fw_attr->current_value.attr;
+
+	attrs[6] = NULL;
+
+	fw_attr->galaxybook = galaxybook;
+	fw_attr->fw_attr_id = fw_attr_id;
+	fw_attr->attr_group.name = galaxybook_fw_attr_name[fw_attr_id];
+	fw_attr->attr_group.attrs = attrs;
+	fw_attr->get_value = get_value;
+	fw_attr->set_value = set_value;
+
+	err = sysfs_create_group(&galaxybook->fw_attrs_kset->kobj, &fw_attr->attr_group);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(&galaxybook->platform->dev,
+					galaxybook_fw_attr_remove, fw_attr);
+}
+
+static void galaxybook_kset_unregister(void *data)
+{
+	struct kset *kset = data;
+
+	kset_unregister(kset);
+}
+
+static void galaxybook_fw_attrs_dev_unregister(void *data)
+{
+	struct device *fw_attrs_dev = data;
+
+	device_unregister(fw_attrs_dev);
+	fw_attributes_class_put();
+}
+
+static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
+{
+	bool value;
+	int err;
+
+	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->fw_attr_lock);
+	if (err)
+		return err;
+
+	err = fw_attributes_class_get(&galaxybook->fw_attrs_class);
+	if (err)
+		return err;
+
+	galaxybook->fw_attrs_dev = device_create(galaxybook->fw_attrs_class, NULL, MKDEV(0, 0),
+						 NULL, "%s", DRIVER_NAME);
+	if (IS_ERR(galaxybook->fw_attrs_dev)) {
+		fw_attributes_class_put();
+		err = PTR_ERR(galaxybook->fw_attrs_dev);
+		return err;
+	}
+	err = devm_add_action_or_reset(&galaxybook->platform->dev,
+				       galaxybook_fw_attrs_dev_unregister,
+				       galaxybook->fw_attrs_dev);
+	if (err)
+		return err;
+
+	galaxybook->fw_attrs_kset = kset_create_and_add("attributes", NULL,
+							&galaxybook->fw_attrs_dev->kobj);
+	if (!galaxybook->fw_attrs_kset)
+		return -ENOMEM;
+	err = devm_add_action_or_reset(&galaxybook->platform->dev,
+				       galaxybook_kset_unregister, galaxybook->fw_attrs_kset);
+	if (err)
+		return err;
+
+	err = power_on_lid_open_acpi_get(galaxybook, &value);
+	if (!err) {
+		err = galaxybook_fw_attr_init(galaxybook,
+					      GB_ATTR_POWER_ON_LID_OPEN,
+					      &power_on_lid_open_acpi_get,
+					      &power_on_lid_open_acpi_set);
+		if (err)
+			return err;
+	}
+
+	err = usb_charging_acpi_get(galaxybook, &value);
+	if (!err) {
+		err = galaxybook_fw_attr_init(galaxybook,
+					      GB_ATTR_USB_CHARGING,
+					      &usb_charging_acpi_get,
+					      &usb_charging_acpi_set);
+		if (err)
+			return err;
+	}
+
+	/* block_recording requires an additional init before it can be used */
+	err = galaxybook_block_recording_init(galaxybook);
+	if (err)
+		return err;
+	if (!galaxybook->has_block_recording)
+		return 0;
+
+	err = block_recording_acpi_get(galaxybook, &value);
+	if (err) {
+		galaxybook->has_block_recording = false;
+		return 0;
+	}
+
+	return galaxybook_fw_attr_init(galaxybook,
+				       GB_ATTR_BLOCK_RECORDING,
+				       &block_recording_acpi_get,
+				       &block_recording_acpi_set);
+}
+
+/*
+ * Hotkeys and notifications
+ */
+
+static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
+{
+	struct samsung_galaxybook *galaxybook =
+		from_work(galaxybook, work, kbd_backlight_hotkey_work);
+	int brightness;
+	int err;
+
+	guard(mutex)(&galaxybook->kbd_backlight_lock);
+
+	brightness = galaxybook->kbd_backlight.brightness;
+	if (brightness < galaxybook->kbd_backlight.max_brightness)
+		brightness++;
+	else
+		brightness = 0;
+
+	err = led_set_brightness_sync(&galaxybook->kbd_backlight, brightness);
+	if (err) {
+		dev_err(&galaxybook->platform->dev,
+			"failed to set kbd_backlight brightness, error %d\n", err);
+		return;
+	}
+
+	led_classdev_notify_brightness_hw_changed(&galaxybook->kbd_backlight, brightness);
+}
+
+static void galaxybook_block_recording_hotkey_work(struct work_struct *work)
+{
+	struct samsung_galaxybook *galaxybook =
+		from_work(galaxybook, work, block_recording_hotkey_work);
+	bool value;
+	int err;
+
+	guard(mutex)(&galaxybook->fw_attr_lock);
+
+	err = block_recording_acpi_get(galaxybook, &value);
+	if (err) {
+		dev_err(&galaxybook->platform->dev,
+			"failed to get block_recording, error %d\n", err);
+		return;
+	}
+
+	err = block_recording_acpi_set(galaxybook, !value);
+	if (err)
+		dev_err(&galaxybook->platform->dev,
+			"failed to set block_recording, error %d\n", err);
+}
+
+static bool galaxybook_i8042_filter(unsigned char data, unsigned char str, struct serio *port)
+{
+	static bool extended;
+
+	if (str & I8042_STR_AUXDATA)
+		return false;
+
+	if (data == 0xe0) {
+		extended = true;
+		return true;
+	} else if (extended) {
+		extended = false;
+		switch (data) {
+		case GB_KEY_KBD_BACKLIGHT_KEYDOWN:
+			return true;
+		case GB_KEY_KBD_BACKLIGHT_KEYUP:
+			if (galaxybook_ptr->has_kbd_backlight)
+				schedule_work(&galaxybook_ptr->kbd_backlight_hotkey_work);
+			return true;
+
+		case GB_KEY_BLOCK_RECORDING_KEYDOWN:
+			return true;
+		case GB_KEY_BLOCK_RECORDING_KEYUP:
+			if (galaxybook_ptr->has_block_recording)
+				schedule_work(&galaxybook_ptr->block_recording_hotkey_work);
+			return true;
+
+		/* battery notification already sent to battery and ACPI device; ignore */
+		case GB_KEY_BATTERY_NOTIFY_KEYUP:
+		case GB_KEY_BATTERY_NOTIFY_KEYDOWN:
+			return true;
+
+		default:
+			/*
+			 * Report the previously filtered e0 before continuing
+			 * with the next non-filtered byte.
+			 */
+			serio_interrupt(port, 0xe0, 0);
+			return false;
+		}
+	}
+
+	return false;
+}
+
+static void galaxybook_i8042_filter_remove(void *data)
+{
+	struct samsung_galaxybook *galaxybook = data;
+
+	i8042_remove_filter(galaxybook_i8042_filter);
+	cancel_work_sync(&galaxybook->kbd_backlight_hotkey_work);
+	cancel_work_sync(&galaxybook->block_recording_hotkey_work);
+
+	if (galaxybook_ptr)
+		galaxybook_ptr = NULL;
+}
+
+static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
+{
+	int err;
+
+	/* global pointer is currently needed for i8042 filter */
+	if (galaxybook_ptr)
+		return -EBUSY;
+	galaxybook_ptr = galaxybook;
+
+	if (!galaxybook->has_kbd_backlight && !galaxybook->has_block_recording)
+		return 0;
+
+	INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
+		  galaxybook_kbd_backlight_hotkey_work);
+	INIT_WORK(&galaxybook->block_recording_hotkey_work,
+		  galaxybook_block_recording_hotkey_work);
+
+	err = i8042_install_filter(galaxybook_i8042_filter);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(&galaxybook->platform->dev,
+					galaxybook_i8042_filter_remove, galaxybook);
+}
+
+/*
+ * ACPI device setup
+ */
+
+static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
+{
+	struct samsung_galaxybook *galaxybook = data;
+
+	switch (event) {
+	case GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED:
+	case GB_ACPI_NOTIFY_DEVICE_ON_TABLE:
+	case GB_ACPI_NOTIFY_DEVICE_OFF_TABLE:
+		break;
+	case GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE:
+		if (galaxybook->has_performance_mode)
+			platform_profile_cycle();
+		break;
+	default:
+		dev_warn(&galaxybook->platform->dev,
+			 "unknown ACPI notification event: 0x%x\n", event);
+	}
+
+	acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(&galaxybook->platform->dev),
+					event, 1);
+}
+
+static int galaxybook_enable_acpi_notify(struct samsung_galaxybook *galaxybook)
+{
+	struct sawb buf = { 0 };
+	int err;
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_NOTIFICATIONS);
+	if (err)
+		return err;
+
+	buf.safn = GB_SAFN;
+	buf.sasb = GB_SASB_NOTIFICATIONS;
+	buf.gunm = GB_GUNM_ACPI_NOTIFY_ENABLE;
+	buf.guds[0] = GB_GUDS_ACPI_NOTIFY_ENABLE;
+
+	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
+				      &buf, GB_SAWB_LEN_SETTINGS);
+}
+
+static void galaxybook_acpi_remove_notify_handler(void *data)
+{
+	struct samsung_galaxybook *galaxybook = data;
+
+	acpi_remove_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
+				   galaxybook_acpi_notify);
+}
+
+static void galaxybook_acpi_disable(void *data)
+{
+	struct samsung_galaxybook *galaxybook = data;
+
+	acpi_execute_simple_method(galaxybook->acpi->handle,
+				   GB_ACPI_METHOD_ENABLE, GB_ACPI_METHOD_ENABLE_OFF);
+}
+
+static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
+{
+	acpi_status status;
+	int err;
+
+	status = acpi_execute_simple_method(galaxybook->acpi->handle, GB_ACPI_METHOD_ENABLE,
+					    GB_ACPI_METHOD_ENABLE_ON);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	err = devm_add_action_or_reset(&galaxybook->platform->dev,
+				       galaxybook_acpi_disable, galaxybook);
+	if (err)
+		return err;
+
+	status = acpi_install_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
+					     galaxybook_acpi_notify, galaxybook);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	err = devm_add_action_or_reset(&galaxybook->platform->dev,
+				       galaxybook_acpi_remove_notify_handler, galaxybook);
+	if (err)
+		return err;
+
+	err = galaxybook_enable_acpi_notify(galaxybook);
+	if (err)
+		dev_dbg(&galaxybook->platform->dev, "failed to enable ACPI notifications; "
+			"some hotkeys will not be supported\n");
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_POWER_MANAGEMENT);
+	if (err)
+		dev_dbg(&galaxybook->platform->dev,
+			"failed to initialize ACPI power management features; "
+			"many features of this driver will not be available\n");
+
+	return 0;
+}
+
+/*
+ * Platform driver
+ */
+
+static int galaxybook_probe(struct platform_device *pdev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
+	struct samsung_galaxybook *galaxybook;
+	int err;
+
+	if (!adev)
+		return -ENODEV;
+
+	galaxybook = devm_kzalloc(&pdev->dev, sizeof(*galaxybook), GFP_KERNEL);
+	if (!galaxybook)
+		return -ENOMEM;
+
+	galaxybook->platform = pdev;
+	galaxybook->acpi = adev;
+	galaxybook->has_kbd_backlight = false;
+	galaxybook->has_block_recording = false;
+	galaxybook->has_performance_mode = false;
+
+	err = galaxybook_acpi_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize ACPI device\n");
+
+	err = galaxybook_profile_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize platform profile\n");
+
+	err = galaxybook_battery_threshold_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize battery threshold\n");
+
+	err = galaxybook_kbd_backlight_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize kbd_backlight\n");
+
+	err = galaxybook_fw_attrs_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize firmware-attributes\n");
+
+	err = galaxybook_i8042_filter_install(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize i8042_filter\n");
+
+	return 0;
+}
+
+static const struct acpi_device_id galaxybook_device_ids[] = {
+	{ "SAM0427" },
+	{ "SAM0428" },
+	{ "SAM0429" },
+	{ "SAM0430" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
+
+static struct platform_driver galaxybook_platform_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.acpi_match_table = galaxybook_device_ids,
+	},
+	.probe = galaxybook_probe,
+};
+module_platform_driver(galaxybook_platform_driver);
+
+MODULE_AUTHOR("Joshua Grisham <josh@joshuagrisham.com>");
+MODULE_DESCRIPTION("Samsung Galaxy Book driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

