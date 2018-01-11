From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v8 0/3] drivers/platform: replace module x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Thu, 11 Jan 2018 08:58:40 +0000
Message-ID: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:40194 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751876AbeAKH0w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Jan 2018 02:26:52 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

The patchset:
 - replaces modules include/linux/platform_data/mlxcpld-hotplug.h and
   drivers/platform/x86/mlxcpld-hotplug.c with the modules
   include/linux/platform_data/mlxreg.h and
   drivers/platform/mellanox/mlxreg-hotplug.c;
   relevant Makefile and Kconfig are updated;
 - modifies Mellanox hotplug driver for making it architecture
   independent. Drivers has been tested for x86 and ARM based systems.
 - introduces regmap interface for mlxreg-hotplug driver to allow hotplug
   event functionality over programmable devices logic, when these devices
   can be attached to different interfaces types, like I2C, LPC, SPI;
   driver drivers/platform/x86/mlx-platform.c is updated according to new
   interface.

Vadim Pasternak (3):
  platform/x86: move Mellanox hardware platform hotplug driver to
    platform/mellanox
  platform/mellanox: mlxreg-hotplug: allow driver for ARM architecture
  platform/mellanox: mlxreg-hotplug: modify to use regmap intreface

 MAINTAINERS                                   |   7 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/mellanox/Kconfig             |  26 ++
 drivers/platform/mellanox/Makefile            |   6 +
 drivers/platform/mellanox/mlxreg-hotplug.c    | 633 ++++++++++++++++++++++++++
 drivers/platform/x86/Kconfig                  |   9 -
 drivers/platform/x86/Makefile                 |   1 -
 drivers/platform/x86/mlx-platform.c           | 237 +++++++---
 drivers/platform/x86/mlxcpld-hotplug.c        | 515 ---------------------
 include/linux/platform_data/mlxcpld-hotplug.h |  99 ----
 include/linux/platform_data/mlxreg.h          | 144 ++++++
 12 files changed, 1001 insertions(+), 679 deletions(-)
 create mode 100644 drivers/platform/mellanox/Kconfig
 create mode 100644 drivers/platform/mellanox/Makefile
 create mode 100644 drivers/platform/mellanox/mlxreg-hotplug.c
 delete mode 100644 drivers/platform/x86/mlxcpld-hotplug.c
 delete mode 100644 include/linux/platform_data/mlxcpld-hotplug.h
 create mode 100644 include/linux/platform_data/mlxreg.h

-- 
2.1.4
