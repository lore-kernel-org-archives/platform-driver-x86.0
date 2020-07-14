From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v2 00/11] platform/x86: Add new features for Mellanox systems
Date: Tue, 14 Jul 2020 15:01:52 +0300
Message-ID: <20200714120203.10352-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

The patchset adds new features for the existing Mellanox systems.

Patch #1 add string helpers for upper/lower conversion.
Patch #2 add tests for these helpers.
Patch #3 updates license for module 'mlxreg-hotplug'.
Patch #4 allows to configure number of hotplug 'sysfs' attributes for
		 the particular system class according to the hardware data for
		 the specific system from this class, instead of configuring it
		 up-to maximum number in the class.
Patch #5 adds environmental data to hotplug 'uevent'.
Patches #6-#7 add more definitions for system attributes.
Patch #8 extends 'mlxreg-io' driver with complex attributes support.
Patch #9 extends documentation with new attributes.
Patches #10-#11 extend FAN platform data with register presence field.

Vadim Pasternak (11):
  lib/string_helpers: Introduce string_upper() and string_lower()
    helpers
  lib/test-string_helpers.c: Add string_upper() and string_lower() tests
  platform/mellanox: mlxreg-hotplug: Modify module license
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
 drivers/platform/mellanox/mlxreg-hotplug.c      | 114 ++++++++++---------
 drivers/platform/mellanox/mlxreg-io.c           |  45 ++++++--
 drivers/platform/x86/mlx-platform.c             | 141 ++++++++++++++++++++++++
 include/linux/platform_data/mlxreg.h            |   4 +
 include/linux/string_helpers.h                  |  15 +++
 lib/test-string_helpers.c                       |  67 +++++++++++
 7 files changed, 341 insertions(+), 62 deletions(-)

-- 
2.11.0
