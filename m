From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v3 00/11] platform/x86: Mellanox new system classes and new features
Date: Mon, 13 Jan 2020 16:28:28 +0000
Message-ID: <20200113162839.18103-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

The patchset adds new features for the existing Mellanox systems
and introduces two new system classes.

Patch #1 contains cosmetic changes.
Patch #2 fixes wrong attribute name in documentation.
Patch #3 adds missed attribute name in documentation.
Patch #4 provides style changes in documentation.
Patch #5 adds more definitions for system attributes
Patches #6 extends documentation.
Patches #7-#8 introduce new system class for the systems equipped with
Spectrum 1 (32x100GbE Ethernet switch) device and Switch-IB/Switch-IB2
devices (36x100Gbe InfiniBand switch).
Patches #9-#10 add support for new group capability register
Patches #11 introduces new system class for the systems equipped
with new switch device Spectrum 3 (32x400GbE/64x200G/128x100G Ethernet
switch).

Vadim Pasternak (11):
  platform/x86: mlx-platform: Cosmetic changes
  Documentation/ABI: Fix documentation inconsistency for mlxreg-io sysfs
    interfaces
  Documentation/ABI: Add missed attribute for mlxreg-io sysfs interfaces
  Documentation/ABI: Style changes
  platform/x86: mlx-platform: Add more definitions for system attributes
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
  platform/x86: mlx-platform: Set system mux configuration based on
    system type
  platform/x86: mlx-platform: Add support for new system type
  platform/x86: mlx-platform: Add support for new capability register
  platform/mellanox: mlxreg-hotplug: Add support for new capability
    register
  platform/x86: mlx-platform: Add support for next generation systems

 Documentation/ABI/stable/sysfs-driver-mlxreg-io |  92 +++-
 drivers/platform/mellanox/mlxreg-hotplug.c      |  14 +
 drivers/platform/x86/mlx-platform.c             | 564 +++++++++++++++++++++++-
 include/linux/platform_data/mlxreg.h            |   2 +
 4 files changed, 641 insertions(+), 31 deletions(-)

-- 
2.11.0
