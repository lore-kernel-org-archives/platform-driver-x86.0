From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 0/7] platform/x86: Mellanox add fixes and new features
Date: Tue, 27 Mar 2018 10:02:00 +0000
Message-ID: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

This patcheset includes:

Document fixes for mlxreg-hotplug driver and mlxreg header file.

Fix for the race condition in mlxreg-hotplug driver.

Adding support for ODM system types.

Activation of Mellanox LED driver from mlx-platform.

Introduction of new mlxreg-io driver.

Activation of mlxreg-io driver from mlx-platform.

Vadim Pasternak (7):
  platform_data/mlxreg: Document fixes for hotplug device
  platform/mellanox: mlxreg-hotplug: Document fixes for hotplug private
    data
  platform/mellanox: mlxreg-hotplug: add extra cycle for hotplug work
    queue
  platform: mellanox: add new ODM system types to mlx-platform
  platform/x86: mlx-platform: Add LED platform driver activation
  platform/mellanox: Introduce support for Mellanox register access
    driver
  platform/x86: mlx-platform: Add mlxreg-io platform driver activation

 drivers/platform/mellanox/Kconfig          |  11 +
 drivers/platform/mellanox/Makefile         |   1 +
 drivers/platform/mellanox/mlxreg-hotplug.c |  23 +-
 drivers/platform/mellanox/mlxreg-io.c      | 221 ++++++++++++++
 drivers/platform/x86/mlx-platform.c        | 447 +++++++++++++++++++++++++++++
 include/linux/platform_data/mlxreg.h       |  66 ++++-
 6 files changed, 765 insertions(+), 4 deletions(-)
 create mode 100644 drivers/platform/mellanox/mlxreg-io.c

-- 
2.1.4
