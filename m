From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH v4 0/8] platform/x86: wmi: add WMI support to
Date: Tue, 19 Feb 2019 20:59:48 +0100
Message-ID: <cover.1550603967.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org, mario.limonciello@dell.com, michal.lkml@markovi.net, mjg59@srcf.ucam.org, pali.rohar@gmail.com, yamada.masahiro@socionext.com
Cc: 2pi@mok.nu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The kernel provides the macro MODULE_DEVICE_TABLE() which can help
driver authors to generate the appropriate MODULE_ALIAS() output. The
WMI device type is currently not supported by MODULE_DEVICE_TABLE().

While using MODULE_DEVICE_TABLE() does increase the complexity as well
as spreading out the implementation across the kernel, it does come with
some benefits too;
* It makes different drivers look more similar; if you can specify the
  array of device_ids any device type specific input to MODULE_ALIAS()
  will automatically be generated for you.
* It helps each driver avoid keeping multiple versions of the same
  information in sync. That is, both the array of device_ids and the
  potential multitude of MODULE_ALIAS()'s.
* Other things eg. [2]

This patchset adds WMI support to MODULE_DEVICE_TABLE().

[PATCH 1/3]: prepare struct wmi_device_id
[PATCH 2/3]: add support
[PATCH 3+/3]: update existing drivers to use MODULE_DEVICE_TABLE()

Changes in v4:
* formatting(declare/assignment, line-breaks) according to comments
* split "PATCH 3/3" into one patch per driver according to comments
* depend upon patch [3] (macro ALIAS_SIZE)

Changes in v3:
* use UUID_STRING_LEN instead of self-defined
* change loop condition in wmi_dev_match() according to comments
* change the usage of snprintf return code in do_wmi_entry()

Changes in v2:
* add one Suggested-by and one Reviewed-by tag
* depend upon patch [1]
* reword commit message for [PATCH 2/3] and [PATCH 3/3] to document the
  reasoning behind the changes

[1]: https://lkml.kernel.org/r/20190122200302.19861-1-2pi@mok.nu
[2]: https://lkml.kernel.org/r/20190126210634.GB13882@wrath
[3]: https://lore.kernel.org/lkml/20190207123022.7961-1-2pi@mok.nu/

Mattias Jacobsson (8):
  platform/x86: wmi: move struct wmi_device_id to mod_devicetable.h
  platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
  platform/x86: dell-smbios-wmi: use MODULE_DEVICE_TABLE() instead of
    MODULE_ALIAS()
  platform/x86: dell-wmi-descriptor: use MODULE_DEVICE_TABLE() instead
    of MODULE_ALIAS()
  platform/x86: dell-wmi: use MODULE_DEVICE_TABLE() instead of
    MODULE_ALIAS()
  platform/x86: huawei-wmi: use MODULE_DEVICE_TABLE() instead of
    MODULE_ALIAS()
  platform/x86: intel-wmi-thunderbolt: use MODULE_DEVICE_TABLE() instead
    of MODULE_ALIAS()
  platform/x86: wmi-bmof: use MODULE_DEVICE_TABLE() instead of
    MODULE_ALIAS()

 drivers/platform/x86/dell-smbios-wmi.c       |  2 +-
 drivers/platform/x86/dell-wmi-descriptor.c   |  2 +-
 drivers/platform/x86/dell-wmi.c              |  4 ++--
 drivers/platform/x86/huawei-wmi.c            |  3 +--
 drivers/platform/x86/intel-wmi-thunderbolt.c |  2 +-
 drivers/platform/x86/wmi-bmof.c              |  2 +-
 drivers/platform/x86/wmi.c                   |  2 +-
 include/linux/mod_devicetable.h              | 12 ++++++++++
 include/linux/wmi.h                          |  5 +----
 scripts/mod/devicetable-offsets.c            |  3 +++
 scripts/mod/file2alias.c                     | 23 ++++++++++++++++++++
 11 files changed, 47 insertions(+), 13 deletions(-)

-- 
2.20.1
