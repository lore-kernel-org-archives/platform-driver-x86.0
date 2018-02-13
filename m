From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 0/4] platform/x86: mlx-platform: Add bus differed and auto detection functionalities
Date: Tue, 13 Feb 2018 22:09:32 +0000
Message-ID: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

This patchset:
- Adds define for the channels number for mux device.
- Adds differed bus functionality.
- Changes input for device create routine in mlxreg-hotplug driver.
- Adds physical bus number auto detection.

Vadim Pasternak (4):
  platform/x86: mlx-platform: Use define for the channel numbers
  platform/x86: mlx-platform: Add differed bus functionality
  platform/mellanox: mlxreg-hotplug: Change input for device create
    routine
  platform/x86: mlx-platform: Add physical bus number auto detection

 drivers/platform/mellanox/mlxreg-hotplug.c | 31 +++++++++-----
 drivers/platform/x86/mlx-platform.c        | 68 ++++++++++++++++++++++++++++--
 include/linux/platform_data/mlxreg.h       |  4 ++
 3 files changed, 90 insertions(+), 13 deletions(-)

-- 
2.1.4
