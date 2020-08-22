From: Rajmohan Mani <rajmohan.mani@intel.com>
Subject: [PATCH v2 0/3] Add Intel Input Output Manager driver
Date: Fri, 21 Aug 2020 21:05:05 -0700
Message-ID: <20200822040508.23510-1-rajmohan.mani@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Jithu Joseph <jithu.joseph@intel.com>, =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, bleung@chromium.org, Rajmohan Mani <rajmohan.mani@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

This patch series add support for Intel Input Output Manager (IOM)
driver, which is leveraged by the Intel PMC USB mux control driver.

changes from v1:
- Included device role (UFP) support patch from Heikki to this series.
- Addressed Greg's comments on v1 with below changes
- Used per-instance variable for struct intel_iom
- Removed struct device *dev inside probe function
- Removed dev_set_drvdata() inside probe function
- Added NULL pointer check on struct intel_iom * as well as members
  dev and regbar, inside intel_iom_port_status(), to protect against
  calls to this API before driver gets probed.
- Limit support to only one IOM device
- Removed intel_iom_get()/intel_iom_put() calls, as the dependency through
  Kconfig is enough to prevent the IOM driver from unloading, when used
  by callers.

Heikki Krogerus (2):
  usb: typec: intel_pmc_mux: Check the port status before connect
  usb: typec: intel_pmc_mux: Support for device role (UFP)

Rajmohan Mani (1):
  platform/x86: Add Intel Input Output Manager (IOM) driver

 drivers/platform/x86/Kconfig                |  16 +++
 drivers/platform/x86/Makefile               |   1 +
 drivers/platform/x86/intel_iom.c            |  95 +++++++++++++++
 drivers/usb/typec/mux/Kconfig               |   1 +
 drivers/usb/typec/mux/intel_pmc_mux.c       | 124 ++++++++++++++------
 include/linux/platform_data/x86/intel_iom.h |  49 ++++++++
 6 files changed, 251 insertions(+), 35 deletions(-)
 create mode 100644 drivers/platform/x86/intel_iom.c
 create mode 100644 include/linux/platform_data/x86/intel_iom.h

-- 
2.20.1
