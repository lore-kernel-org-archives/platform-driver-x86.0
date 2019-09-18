From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v3 0/1] intel_cht_int33fe: Split code to USB Micro-B and Type-C variants
Date: Thu, 19 Sep 2019 01:53:36 +0300
Message-ID: <20190918225337.9860-1-jekhor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Yauhen Kharuzhy <jekhor@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Patch to support INT33FE ACPI pseudo-device on hardware with USB Micro-B
connector.

v4:
- Micro-B variant: Don't print error to the kernel log if i2c_acpi_new_device()
  has returned -EPROBE_DEFER.

v3:
- Rename TypeB variant to Micro-B (we have only one such device for now and it
  has Micro-B connector)
- Rebase on current linus/master
- Remove empty lines and replace "TypeC" by "Type-C"

v2:
Instead of defining two separated modules with two separated config
options, compile {common,typeb,typec} sources into one .ko module.
Call needed variant-specific probe function based after of hardware type
detection in common code.

Yauhen Kharuzhy (1):
  platform/x86/intel_cht_int33fe: Split code to USB Micro-B and Type-C
    variants

 drivers/platform/x86/Kconfig                  |  12 +-
 drivers/platform/x86/Makefile                 |   4 +
 .../platform/x86/intel_cht_int33fe_common.c   | 147 ++++++++++++++++++
 .../platform/x86/intel_cht_int33fe_common.h   |  41 +++++
 .../platform/x86/intel_cht_int33fe_microb.c   |  67 ++++++++
 ...ht_int33fe.c => intel_cht_int33fe_typec.c} |  78 +---------
 6 files changed, 276 insertions(+), 73 deletions(-)
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.c
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.h
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_microb.c
 rename drivers/platform/x86/{intel_cht_int33fe.c => intel_cht_int33fe_typec.c} (82%)

-- 
2.23.0.rc1
