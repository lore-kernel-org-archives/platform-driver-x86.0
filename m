From: Shravan Kumar Ramani <sramani@mellanox.com>
Subject: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
Date: Mon, 11 Nov 2019 09:34:38 -0500
Message-ID: <cover.1573460910.git.sramani@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>
Cc: lsun@mellanox.com, Shravan Kumar Ramani <sramani@mellanox.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This patch adds support for Mellanox BlueField TRIO PCIe host controller.
The driver supports multiple TRIO instances and provides a sysfs interface
to allow the user to read/set the L3 cache profile for transactions going
through the TRIO. It also provides an interrupt handler for the TRIO blocks.

Shravan Kumar Ramani (1):
  platform/mellanox: Add Mellanox TRIO driver

 MAINTAINERS                            |   5 +
 drivers/platform/mellanox/Kconfig      |   8 +
 drivers/platform/mellanox/Makefile     |   1 +
 drivers/platform/mellanox/mlxbf-trio.c | 624 +++++++++++++++++++++++++++++++++
 4 files changed, 638 insertions(+)
 create mode 100644 drivers/platform/mellanox/mlxbf-trio.c

-- 
2.1.2
