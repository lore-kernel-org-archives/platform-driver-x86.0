From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v3 00/11] asus-wmi: Support of ASUS TUF Gaming series laptops
Date: Fri, 19 Apr 2019 11:57:20 +0200
Message-ID: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

this is the third version of the patch series. 

Changelog:
v3: 
  * Use devm_* function in patch 01
  * Detect DSTS/DCTS using _UID in patch 04
  * Detect event queue by _UID as well in patch 05
  * Rename poll function in patch 05
  * Fix terminology in patches 09 and 10
  * Correct commit messages
v2:
  * Fix logging

INTRODUCTION
The support for this laptop series is currently non-existent, as the
asus-nb-wmi driver (which is essentially configuration for asus-wmi) fails
to load and multiple ACPI errors are logged in dmesg. This patch series
adds pretty comprehensive support for these relatively new laptops, adds
some code organization, and fixes a couple of bugs in the asus-wmi module.

Original message from V1/V2:
https://lkml.org/lkml/2019/4/10/973

It is really long, so I will not copy it completely here, please refer
to the original for notes on design decisions and existing minor issues
(other than quirks, which should be hopefully solved now).

Yurii Pavlovskyi (11):
  platform/x86: asus-wmi: Fix hwmon device cleanup
  platform/x86: asus-wmi: Fix preserving keyboard backlight intensity on
    load
  platform/x86: asus-wmi: Increase the input buffer size of WMI methods
  platform/x86: asus-wmi: Improve DSTS WMI method ID detection
  platform/x86: asus-wmi: Support WMI event queue
  platform/x86: asus-nb-wmi: Add microphone mute key code
  platform/x86: asus-wmi: Organize code into sections
  platform/x86: asus-wmi: Enhance detection of thermal data
  platform/x86: asus-wmi: Control RGB keyboard backlight
  platform/x86: asus-wmi: Switch fan boost mode
  platform/x86: asus-wmi: Do not disable keyboard backlight on unloading

 .../ABI/testing/sysfs-platform-asus-wmi       |  71 ++
 drivers/platform/x86/asus-nb-wmi.c            |   3 +-
 drivers/platform/x86/asus-wmi.c               | 797 +++++++++++++++---
 drivers/platform/x86/wmi.c                    |  19 +
 include/linux/acpi.h                          |   1 +
 include/linux/platform_data/x86/asus-wmi.h    |   7 +-
 6 files changed, 797 insertions(+), 101 deletions(-)

-- 
2.17.1
