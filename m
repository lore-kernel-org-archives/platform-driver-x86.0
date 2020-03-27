From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 0/3] Fixes: update Tiger Lake ACPI device IDs
Date: Fri, 27 Mar 2020 14:28:18 -0700
Message-ID: <cover.1585343507.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, lenb@kernel.org, dvhart@infradead.org, alex.hung@canonical.com, rui.zhang@intel.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

The hardware IDs for devices supported by Tiger Lake for various drivers
such as DPTF, fan, Intel thermal and intel-hid are added with missing 'C'
which makes them invalid. Hence fix these IDs by updating.

For instance, the updated ID now looks like
INT1047 --> INTC1047

Patch 1: Update Tiger Lake ACPI device IDs for DPTF and fan drivers
Patch 2: Update Tiger Lake ACPI device ID for intel-hid driver
Patch 3: Update Tiger Lake ACPI device IDs for thermal driver

Changes since v1:
1) Added fixes tag to each patch

Gayatri Kammela (3):
  ACPI: fix: Update Tiger Lake ACPI device IDs
  platform/x86: intel-hid: fix: Update Tiger Lake ACPI device ID
  thermal: int340x_thermal: fix: Update Tiger Lake ACPI device IDs

 drivers/acpi/device_pm.c                                | 2 +-
 drivers/acpi/dptf/dptf_power.c                          | 2 +-
 drivers/acpi/dptf/int340x_thermal.c                     | 8 ++++----
 drivers/platform/x86/intel-hid.c                        | 2 +-
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 2 +-
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
-- 
2.17.1
