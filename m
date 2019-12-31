From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v1 0/9] platform/x86: Mellanox new system classes and new features
Date: Tue, 31 Dec 2019 10:29:08 +0000
Message-ID: <20191231102917.24181-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

The patchset adds new features for the existing Mellanox systems
and introduces two new system classes.

Patch #1 adds new attributes.
Patches #2-#3 extend documentation.
Patches #4 contains cosmetic changes.
Patches #5-#6 introduce new system class for the systems equipped with
Spectrum 1 (32x100GbE Ethernet switch) device and Switch-IB/Switch-IB2
devices (36x100Gbe InfiniBand switch).
Patches #7-#8 add support for new group capability register
Patch #9 introduces new system class for the systems equipped
with new switch device Spectrum 3 (32x400GbE/64x200G/128x100G Ethernet
switch).

Vadim Pasternak (9):
  platform/x86: mlx-platform: Add more definitions for system attributes
  Documentation/ABI: Fix attributes for mlxreg-io sysfs interfaces
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
  platform/x86: mlx-platform: Cosmetic changes
  platform/x86: mlx-platform: Set system mux configuration based on
    system type
  platform/x86: mlx-platform: Add support for new system type
  platform/x86: mlx-platform: Add support for new capability register
  platform/mellanox: mlxreg-hotplug: Add support for new capability
    register
  platform/x86: mlx-platform: Add support for next generation systems

 Documentation/ABI/stable/sysfs-driver-mlxreg-io |  83 +++-
 drivers/platform/mellanox/mlxreg-hotplug.c      |  14 +
 drivers/platform/x86/mlx-platform.c             | 564 +++++++++++++++++++++++-
 include/linux/platform_data/mlxreg.h            |   2 +
 4 files changed, 643 insertions(+), 20 deletions(-)

-- 
2.11.0
