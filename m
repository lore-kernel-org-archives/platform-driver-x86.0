From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v3 0/5] drivers: Add Tiger Lake hardware IDs to support ACPI,
Date: Mon, 16 Dec 2019 10:31:47 -0800
Message-ID: <cover.1576520244.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Gayatri Kammela <gayatri.kammela@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Tiger Lake supports devices whose hardware IDs are changed for various
drivers. Hence, add the new hardware IDs.

Patch 1: Add Tiger Lake support to DPTF driver
Patch 2: Add Tiger Lake support to fan driver
Patch 3: Add Tiger Lake support to device_pm
Patch 4: Add Tiger Lake support to Intel's HID driver
Patch 5: Add Tiger Lake support to thermal driver

Changes since v1:
1) Maintain the readability by adding hardware IDs in a sorted order

Changes since v2:
1) Added Tiger Lake support to device_pm
2) Changed acpi to ACPI in commit messages

Gayatri Kammela (5):
  acpi: dptf: Add new Tiger Lake hardware IDs to support DPTF drivers in
    ACPI
  acpi: fan: Add new Tiger Lake hardware ID to support fan driver in
    ACPI
  acpi: device_pm: Add new Tiger Lake hardware ID to support ACPI device
    power management
  platform/x86: intel-hid: Add new Tiger Lake hardware ID to support HID
    driver
  thermal: int340x_thermal: Add new Tiger Lake hardware IDs to support
    thermal driver

 drivers/acpi/device_pm.c                                | 1 +
 drivers/acpi/dptf/dptf_power.c                          | 1 +
 drivers/acpi/dptf/int340x_thermal.c                     | 4 ++++
 drivers/acpi/fan.c                                      | 1 +
 drivers/platform/x86/intel-hid.c                        | 1 +
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 1 +
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 1 +
 7 files changed, 10 insertions(+)

Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
-- 
2.17.1
