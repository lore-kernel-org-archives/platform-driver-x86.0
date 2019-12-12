From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 0/4] drivers: Add Tiger Lake hardware IDs to support acpi,
Date: Thu, 12 Dec 2019 14:37:16 -0800
Message-ID: <cover.1576189376.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Gayatri Kammela <gayatri.kammela@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Tiger Lake supports devices whose hardware IDs are changed for various
drivers. Hence, add the new hardware IDs.

Patch 1: Add Tiger Lake support to DPTF driver
Patch 2: Add Tiger Lake support to fan driver
Patch 3: Add Tiger Lake support to Intel's HID driver
Patch 4: Add Tiger Lake support to thermal driver

Gayatri Kammela (4):
  acpi: dptf: Add new Tiger Lake hardware IDs to support DPTF drivers in
    acpi
  acpi: fan: Add new Tiger Lake hardware ID to support fan driver in
    acpi
  platform/x86: intel-hid: Add new Tiger Lake hardware ID to support HID
    driver
  thermal: int340x_thermal: Add new Tiger Lake hardware IDs to support
    thermal driver

 drivers/acpi/dptf/dptf_power.c                          | 1 +
 drivers/acpi/dptf/int340x_thermal.c                     | 4 ++++
 drivers/acpi/fan.c                                      | 1 +
 drivers/platform/x86/intel-hid.c                        | 1 +
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 1 +
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 1 +
 6 files changed, 9 insertions(+)

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
-- 
2.17.1
