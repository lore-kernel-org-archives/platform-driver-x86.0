From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v1 0/8] platform/x86: Add new features for Mellanox systems
Date: Mon,  1 Jun 2020 12:18:43 +0300
Message-ID: <20200601091851.5491-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

The patchset adds new features for the existing Mellanox systems.

Patch #1 allows to configure number of hotplug 'sysfs' attributes for
		 the particular system class according to the hardware data for
		 the specific system from this class, instead of configuring it
		 up-to maximum number in the class.
Patch #2 adds environmental data to hotplug uevent.
Patches #3-#4 adds more definitions for system attributes.
Patch #5 extends 'mlxreg-io' driver with complex attributes support.
Patches #6 extends documentation with new attributes.
Patches #7-#8 extends FAN platform data with register presence field.

Vadim Pasternak (8):
  platform/mellanox: mlxreg-hotplug: Use capability register for
    attribute creation
  platform/mellanox: mlxreg-hotplug: Add environmental data to uevent
  platform_data/mlxreg: Add support for complex attributes
  platform/x86: mlx-platform: Add more definitions for system attributes
  platform/mellanox: mlxreg-io: Add support for complex attributes
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
  platform_data/mlxreg: Add presence register field for FAN devices
  platform/x86: mlx-platform: Extend FAN platform data description

 Documentation/ABI/stable/sysfs-driver-mlxreg-io |  17 +++
 drivers/platform/mellanox/mlxreg-hotplug.c      |  81 ++++++++++----
 drivers/platform/mellanox/mlxreg-io.c           |  47 ++++++--
 drivers/platform/x86/mlx-platform.c             | 141 ++++++++++++++++++++++++
 include/linux/platform_data/mlxreg.h            |   4 +
 5 files changed, 258 insertions(+), 32 deletions(-)

-- 
2.11.0
