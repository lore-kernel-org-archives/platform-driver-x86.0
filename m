From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v2 0/5] Update and move Dell drivers dell_rbu and dcdbas
Date: Wed, 26 Sep 2018 16:50:16 -0500
Message-ID: <20180926215021.30471-1-stuart.w.hayes@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Doug Warzecha <Douglas_Warzecha@dell.com>, Stuart Hayes <stuart.w.hayes@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The dell_rbu and dcdbas drivers need some changes, and should be moved to
drivers/platform/x86.  Additionally, dell_rbu needs a maintainer, and the
listed maintainer for dcdbas is inactive and needs to be changed.

v2 changes:
 - add commit messages to patches that move dcdbas and dell_rbu
 - remove extra whitespace in MAINTAINERS
 - add acked-by from (previous) maintainer of dcdbas

Stuart Hayes (5):
  firmware: dell_rbu: Make payload memory uncachable
  firmware: dcdbas: Add support for WSMT ACPI table
  firmware: dell_rbu: Move dell_rbu to drivers/platform/x86
  firmware: dcdbas: Move dcdbas to drivers/platform/x86
  MAINTAINERS: Update maintainer for dcdbas and dell_rbu

 MAINTAINERS                                   |  11 +-
 drivers/firmware/Kconfig                      |  28 ----
 drivers/firmware/Makefile                     |   2 -
 drivers/platform/x86/Kconfig                  |  28 ++++
 drivers/platform/x86/Makefile                 |   2 +
 drivers/{firmware => platform/x86}/dcdbas.c   | 123 +++++++++++++++++-
 drivers/{firmware => platform/x86}/dcdbas.h   |  10 ++
 drivers/platform/x86/dell-smbios-smm.c        |   2 +-
 drivers/{firmware => platform/x86}/dell_rbu.c |   8 ++
 9 files changed, 175 insertions(+), 39 deletions(-)
 rename drivers/{firmware => platform/x86}/dcdbas.c (82%)
 rename drivers/{firmware => platform/x86}/dcdbas.h (93%)
 rename drivers/{firmware => platform/x86}/dell_rbu.c (98%)

-- 
2.19.0.221.g150f307af
