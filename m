From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2 0/1] intel_cht_int33fe: Split code to USB TypeB and TypeC variants
Date: Tue, 17 Sep 2019 22:45:06 +0300
Message-ID: <20190917194507.14771-1-jekhor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Yauhen Kharuzhy <jekhor@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Patch to support INT33FE ACPI pseudo-device on hardware with USB Type B
connector.

v2:
Instead of defining two separated modules with two separated config
options, compile {common,typeb,typec} sources into one .ko module.
Call needed variant-specific probe function based after of hardware type
detection in common code.

Yauhen Kharuzhy (1):
  platform/x86/intel_cht_int33fe: Split code to USB TypeB and TypeC
    variants

 drivers/platform/x86/Kconfig                  |  14 +-
 drivers/platform/x86/Makefile                 |   4 +
 .../platform/x86/intel_cht_int33fe_common.c   | 148 ++++++++++++++++++
 .../platform/x86/intel_cht_int33fe_common.h   |  44 ++++++
 .../platform/x86/intel_cht_int33fe_typeb.c    |  64 ++++++++
 ...ht_int33fe.c => intel_cht_int33fe_typec.c} |  79 +---------
 6 files changed, 278 insertions(+), 75 deletions(-)
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.c
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.h
 create mode 100644 drivers/platform/x86/intel_cht_int33fe_typeb.c
 rename drivers/platform/x86/{intel_cht_int33fe.c => intel_cht_int33fe_typec.c} (83%)

-- 
2.20.1
