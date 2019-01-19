From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH 0/3] platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
Date: Sat, 19 Jan 2019 12:55:52 +0100
Message-ID: <cover.1547827336.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org, mario.limonciello@dell.com, michal.lkml@markovi.net, mjg59@srcf.ucam.org, pali.rohar@gmail.com, yamada.masahiro@socionext.com
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This patchset adds WMI support to MODULE_DEVICE_TABLE().

[PATCH 1/3]: prepare struct wmi_device_id
[PATCH 2/3]: add support
[PATCH 3/3]: update existing drivers to use MODULE_DEVICE_TABLE()

Mattias Jacobsson (3):
  platform/x86: wmi: move struct wmi_device_id to mod_devicetable.h
  platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
  platform/x86: wmi: use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS()

 drivers/platform/x86/dell-smbios-wmi.c       |  2 +-
 drivers/platform/x86/dell-wmi-descriptor.c   |  2 +-
 drivers/platform/x86/dell-wmi.c              |  4 ++--
 drivers/platform/x86/huawei-wmi.c            |  3 +--
 drivers/platform/x86/intel-wmi-thunderbolt.c |  2 +-
 drivers/platform/x86/wmi-bmof.c              |  2 +-
 drivers/platform/x86/wmi.c                   |  2 +-
 include/linux/mod_devicetable.h              | 13 +++++++++++++
 include/linux/wmi.h                          |  5 +----
 scripts/mod/devicetable-offsets.c            |  3 +++
 scripts/mod/file2alias.c                     | 18 ++++++++++++++++++
 11 files changed, 43 insertions(+), 13 deletions(-)

-- 
2.20.1
