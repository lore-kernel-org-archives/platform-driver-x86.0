Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181BC6DCE1
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 06:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440271; cv=fail; b=DFaQqH7TdDPyub1kspEAvu/FcRi2V4XKZ0+8Nze+C2i3Eu5XDLFs4SiHDPlyrxtDQmHZP4/YXAZNXVEHhg3AhbRu1dk4AnUPNzSZPGJSELFVLC8NWi7lDpgeSQ/mNOFRU1h0lOMZh8+ZxqKDAloi4Xh3Be6INy1Xp6bxsZ2dcdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440271; c=relaxed/simple;
	bh=mte/h5Is9tinDEjOwMrBRSnvGaiaplRKPa5hTf6UG2Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A45mhCcNMqryTleUZMzS5zPZ5hiGALRqV+ACpJeTBJFSc+Qv9tG/q0KrZtqkS1omDqCCDMRi23C+GmWigXTaT8iOVeKU+pTrVmPj9eU9xvxb9tqCfQ3W/1QN89upJedToX5b7JbYpqH7IGVhUzP3rYjlgIJQQWeD/ki22ciMLkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kIHIdy6u; arc=fail smtp.client-ip=40.93.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kIHIdy6u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtiXRtbPlZsY6WzDhw4TGjiYBgaHu0CWwZ6Y7bS87MmprOBG8IXvejSKWa5rm8dAj9agOzOxC4FnPF9AVNaHrdX0G/F792cvLM3peCwNBhOuktGpKSK303U2tN0y6xZmrRSx8zFoLxIIfSyLoEwQdlNg55VaMh73TC6If6Y/sp9yGEh+lyK63u4m7SKBYaCL3keKPBGUutCA+3Y7GUPXtw7yiWYGonoIWS1uoy0GeMIoRmT+UZ3BL0GP+uEFJ+A9QyoBHdQLGLmd5E6E8wCTfv0XE5ntIbCNnM9q9jeVSSQkWCn30KVm+CwOl6kc9ctyoU/Vow+qN20YlmGjY087eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPbx2hEQl+EJICshDP0QiYTe8jtOjvUiZ3KxZbyLyD8=;
 b=xk0OalX4hLtfRpXdvqVAiefvgK5dXIqwIjwdHSb5CayaT6MTwdl63X3+IHa/TdfdotDZLP/WblFGKajYBis3kIM3YwWenY6Zu4SvqJ1iyBHl4mdHtWa2WI8uVQCiBpUTjw69pzvW86naBmiBFjouNU2P5G+DlQDj/Lsgkk8CYeHRP8dN8XOQy1of/Ie+9QaAGm2cBRHrHRp5iqIJBQ5UonHYmUwn62ysOYRLlnBa1k5RDwbHZSxW6P58P0Fja8pAZMYXQN2GOsbDHvM2l5aLTiV1ZNCdkBYv1SRve8y8EsxE0t/kKCv3WiEd4+tCU1F55DZ0jgJWVxEBxnsRF8k2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPbx2hEQl+EJICshDP0QiYTe8jtOjvUiZ3KxZbyLyD8=;
 b=kIHIdy6uPuQ3objvJqQEcOy00u3saS/a5ovrD5OkqablaD3d5qUBSPHj4S6nygxq8psKRBLzCPl+Vm3ASHppCVYYf/DgZN4x8mYBvDJEQtfUwr8tDxkxZQKEinWIfrOTnCBPFoUvfLlHWYgpzgqU0Yd4fG7fv6oNmGS94di/o/MYznN2/gCqDxAVge4PXp0kJ3jbtvwUS79CbqeEV8gw7nCbIcHoNNrlkQ8UzxAEqMW60RBiEK3ZIRF50d13uh1rRC+bkWEs5mIhKFvJ08NOQdXPmVnUTNx6qm/3WyxsE3hyA4dDc16T/GN/OKIq6PmTMWC84FjGRiIgIRSUruWPLg==
Received: from PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::28)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 06:17:45 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::8a) by PH7P222CA0015.outlook.office365.com
 (2603:10b6:510:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 06:17:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 06:17:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 23:17:24 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:17:22 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<vadimp@nvidia.com>
CC: <platform-driver-x86@vger.kernel.org>, <fradensky@nvidia.com>
Subject: [PATCH platform-next 0/3] platform/mellanox: Add nvsw core and SPC6 host driver
Date: Thu, 8 Oct 2026 09:17:01 +0300
Message-ID: <20261008061704.794379-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e8ffda-9ffe-4026-9e8e-08df2503de09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|30052699003|1800799024|376014|23010399003|18002099003|5023799004|11063799006|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	v55wV3FKsskZLBHEluOgoRBD2etfL0Uw4WWcpJF0i8h8mlKfjzWwU1pUPH+xrrWkqaYNdJ2001yi5SNF7vh/tmLld1R01DEX0Y446UYo2085hJ4lnJUJdQ+gmN6ToX9khLed0oY2VVhfLbBKQK9dEt9KdfmPuFm9tYtVponbjp0ubIIKZNJoNOx4BXsaemV1KNdI8SFrmzpYvnh2z0WOaQyzrjdJcURA1iUGBuXnLBisHt2uX+rkPaeVhE3PU2NPGwpYW/fRJyD3O658Cbd1fjpvX9rwWs6gNE16p8snBeZhTIXqRS16+F+QqD96+9GzmAcmO7AvxEXYS24B5tClH0gNUWkJ7i9hJVWMA2HPfwAY75n1DmnE7KYL/CgCaQ7sehMpHlnpDIi7Nc+8dmMdj2tsQ0YK7DEtWgbLT/vspsrOQ4yD85KvqRb21O2z4JHptnVb5IeuOv8EsY8aw1TFO6DoHLHlgr2cXdDmFjiwZo5up+kHMJvqDVMwbCyYDcWfQXUz4fC/Pm5d6ebjb+CGe9yzgy90oQcCtlQyDqYVdQ3Nn5LG2omidrYYVpP63c6b8XdyJqk/k9SpIyVFxZjt2+q6niUJRTfSdISFCzKoCvDMFIyc16BsPPKBtLXHLZ+yODjB7OKAdlwNYi1nAjd9ATbvjP59uXqj06iz+LDiTFteRkV3i92I9wGDYhmtlFN2Fqf+5T7j3gf/TgFHMDyjIQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(30052699003)(1800799024)(376014)(23010399003)(18002099003)(5023799004)(11063799006)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uwUQ463+pPViYhdQSehZt5qvEbNivfzLWX56wn9esfSk9Gno4MFlyWA2UAP6oRj7FVs6j+8BTzBj4z4DOon5AoLwqskbFH506J7znW7bLXHZAab1OZaBBkRZ0ptYBB68ZGwj52XyZfINIOe+LpjJiY/MbTHtrQMOUzyvu2B7BLBtrK7o535Cgqs7/JNfF2LD6sNdVcFSHOWCvoV3GfmX8B3AQRufgNWe8NDolck5MK/dsBb3hVvMUrK65e4LXmxze/XrvR/NGukxbFU9rh0EkVA94E7RxFo4RLYdn/gnLsZgWb1z/Pt6cq5O4hv+LwiO+O0Jnc3gkZFWsUOVyBFrriLBIItxC5NaGv37FWlMKYUJ5KvZCNYsgbkN7sx5VQ2x0i5ENbHohWXrrU1+jAZnR0OS+o4wy3IJ4NUxTFUw8wOJvqVnmPGuZaw5Szbf1A9G
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 06:17:44.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e8ffda-9ffe-4026-9e8e-08df2503de09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330

This series adds support for system control and monitoring on Nvidia
SPC6 based switches, through the CPLD/FPGA devices attached to the host
CPU.

Patch 1 adds nvsw-core, which implements the register map setup, the I2C
mux topology and the creation of the mlxreg-* platform devices shared by
all Nvidia switch board drivers. Patch 2 adds nvsw-host-spc6, the first
user of that core, covering the liquid cooled systems, along with
documentation for the register access attributes it exposes. Patch 3
adds the air cooled SPC6 systems, which unlike the liquid cooled ones
carry their own power supplies and fan drawers.

The functionality covered is component resets and reset cause
reporting, mux selection for hardware components, general purpose
registers, LED control, watchdog control, and fan control on the
systems that have fans. The core also creates an mlxreg-hotplug device
for boards that describe one; no SPC6 system does, and that path comes
into use with the BMC driver mentioned below.

Why a new core instead of extending mlx-platform
================================================

The obvious question is why this does not go into mlx-platform.c, which
already serves the existing Mellanox switch generations. There are two
reasons.

The first is that mlx-platform.c cannot reach this hardware. It is
built around a single memory mapped LPC window: it calls
devm_ioport_map() once, hands the resulting base to devm_regmap_init()
with its own ioread8()/iowrite8() callbacks, and every system it
supports is described in terms of offsets into that window. On SPC6 the
CPLD is not on the LPC bus at all, it is an I2C device, and the driver
reaches it with devm_regmap_init_i2c() through a client on the host I2C
tree. Supporting SPC6 in mlx-platform.c would mean giving it a second,
parallel register access path and making its register map setup
conditional, which is a larger and more invasive change than adding a
separate driver.

The same applies beyond SPC6. The identical CPLD register layout is
also managed from an ARM Baseboard Management Controller, where the
device is reached over I2C in the same way but is described in device
tree rather than discovered through DMI. nvsw-core holds only the parts
that do not depend on how the board was found, so the register
definitions and the mlxreg-* device descriptions are shared, and each
board driver supplies its own instantiation. mlx-platform.c is
inherently x86 and DMI bound and cannot serve the BMC side.

The second reason is structural. mlx-platform.c has grown to roughly
8600 lines covering 49 DMI matches, with the per-system description
data and the device creation logic interleaved in a single translation
unit. Adding another switch generation to it makes the file harder to
review and makes it impossible to build support for one system without
carrying the tables for all the others. nvsw splits the two concerns:
the core holds the logic (760 lines) and each board driver holds only
its own description data, so a kernel can be built with just the boards
it needs.

The core is not speculative generality. The SPC6 host driver in this
series is its first user, and we intend to submit a BMC driver and an
NVL7 host driver on top of it once the core has been reviewed.

Why the SPC6 driver is split over two patches
=============================================

Patches 2 and 3 add a single driver, split along a hardware line
rather than chopped into arbitrary pieces. Patch 2 is complete and
useful on its own: it covers the liquid cooled SPC6 systems, which
shipped first. Patch 3 adds the air cooled systems, which arrived
later and expose a different set of CPLD attributes because they carry
their own power supplies and fan drawers.

Most of both patches is register description data, and the two sets
are largely disjoint. Folding them together would give a single patch
of roughly 1800 lines in which two unrelated board descriptions are
interleaved, with nothing in the diff to indicate which attribute
belongs to which system.

Patch 3 is purely additive: it does not modify or remove a single line
introduced by patch 2. The per SKU description struct and the
driver_data based DMI dispatch are introduced in patch 2, so patch 3
adds only the new register definitions, the new board description and
the DMI entry that selects it.

On the shared "mlxplat" platform device name
============================================

nvsw-host-spc6 registers its platform device as "mlxplat", the same
name used by mlx-platform.c. This is deliberate. The mlxreg-io
attributes are a long standing userspace ABI documented in
Documentation/ABI/stable/sysfs-driver-mlxreg-io, and the management
software reads them from
/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/. Keeping the name
keeps those paths stable across switch generations, so existing tooling
works unchanged on SPC6.

The two drivers cannot collide at runtime: each calls dmi_check_system()
and returns -ENODEV before registering anything, and their DMI tables
are disjoint, so on any given system exactly one of them instantiates.
If you would still rather the new driver used a distinct name, we can
change it, but it would mean a new sysfs path and a userspace ABI break
for the affected systems.

Symbol namespace
================

The two symbols the core exports to its board drivers are exported as
EXPORT_SYMBOL_NS_GPL() in the NVSW namespace, so that the core does not
add anything to the global symbol table and the dependency is explicit
in each consumer via MODULE_IMPORT_NS().

Testing
=======

Built on x86_64 against pdx86/for-next with gcc W=1 and with clang 17
W=1 plus CONFIG_WERROR, both warning free, at every patch in the
series. Checked with sparse v0.6.5-rc1, smatch and the coccinelle
report mode scripts, all clean. checkpatch --strict reports
no errors and no checks. Module linkage and the namespace import were
verified with modpost and modinfo.

Felix Radensky (3):
  platform/mellanox: nvsw-core: Add core driver for Nvidia switches
  platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
  platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled
    switches

 .../ABI/stable/sysfs-driver-mlxreg-io         |  197 +++
 drivers/platform/mellanox/Kconfig             |   19 +
 drivers/platform/mellanox/Makefile            |    2 +
 drivers/platform/mellanox/nvsw-core.c         |  760 +++++++++
 drivers/platform/mellanox/nvsw-host-spc6.c    | 1496 +++++++++++++++++
 drivers/platform/mellanox/nvsw.h              |  317 ++++
 6 files changed, 2791 insertions(+)
 create mode 100644 drivers/platform/mellanox/nvsw-core.c
 create mode 100644 drivers/platform/mellanox/nvsw-host-spc6.c
 create mode 100644 drivers/platform/mellanox/nvsw.h


base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
-- 
2.34.1

Recipients (scripts/get_maintainer.pl):
  To:  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
       Hans de Goede <hansg@kernel.org>
       Vadim Pasternak <vadimp@nvidia.com>
  Cc:  platform-driver-x86@vger.kernel.org
       linux-kernel@vger.kernel.org
