Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012065.outbound.protection.outlook.com [40.107.209.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD831175A95
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318357; cv=fail; b=UbxMIF9pcquy0fEBi9RhbRTAEJw+5XqsW9ORBBOz8eof5o2PlI9kOJ7mu1r4oPe3GX+u2MLn/mF3X8UF4VPk68vS2V4GIJ7G3b5CnCwiVHngz6FVzKmZWBW9/3A6Vw+3E8KrmAnQf1RJIno/kH7Lort29I7LHMqVXmpw+tao56M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318357; c=relaxed/simple;
	bh=YMLSdWb7a0skqNXLYcgWCT1y/jss7fxcayRdGi94nOM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vulu0tW7jq/E55s+wpSDj6ABN9w8trHkObWmXe0NFJ4T5E29eJgIX5Q8DWFebPLjRyu2eLfVLjxqWzFPHGD10e60B8cvzE/D4+dEgrVDiP3tliLPeLdqWQbqIFgldfAPSRpDyr9V3jjNjIcxIsVAo5fwVp8FKQbB8/Ebpc3a5ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FrS3lBO7; arc=fail smtp.client-ip=40.107.209.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FrS3lBO7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dj3lvcApeDZWoyB75UsmrS2sptKVW6TvQzBqXqfrZIdStWlBXrIQtUgEso9Dk+L5ozavpiqwEySxl/D9LwYcanHFpvoylIsuOZE9rm3HuFjAs/zREFZWv9r+ARreDKlJq74HwKk5OMU/PQsNG1NNqLrq2WRMYrcLtLY8A+ImU6aHNDM2Imp/Goh2dNoHfMeiff81JV/HHPFzKtTwf/9yTOnSs0djyNBkJaCwDD/+PJTHlYOoeJwKLZjkW949BstAYSHEkNzuylI43ANWB4H5TqVp9auffsdqlyJjwhdVqh2L1D+hAck3UnkYqn86VvgUY/ig8cEPai4kJyNCzuxnaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za6IIIyVMVMFALHEwPQX5r2FHzqxIcOk4BoZjGWVVRQ=;
 b=YJtzwKqVGTsK6Tw2DNAOuNhCKkxraTVr9FUSVRHb6yuKggl3O3IcQa8YkUnDUSXj7JDvt/djNOa/nTqc1NXJmdTuGqZklM+eDuL6nV9oM5qo32zkj1ppaHZe5hS9t5t4Fw+gY/fFhQmemb/mUkDkB1lV6KOR6rI3KxiKfF5Vs0q9lB+bH/UkaspDLs2mgdx1y3WBjyJgspDT4XNJ/LWdc/LOpuZw7Dvs1iNddL979rcKJm5DYeNgD2ZIijMlg07aROoMI60A9k/bVO74ruJ5siUXVN2ac245LVCfCxw/lHX2kElB2QN8V4CtnKhLMLZycQaWG6dAq4+y16q4tNTx7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za6IIIyVMVMFALHEwPQX5r2FHzqxIcOk4BoZjGWVVRQ=;
 b=FrS3lBO7YgAbHKBU/S013ip8IeOKomxrFnkegq7cW+XGEmUOKtNyVXwYuRu6SU16eqSAKX0cqgqqdDySe/LhoISs2diQmueCRsvqy0MXNYlA5ph/egH5npVMqH2cugu/dMiLydmeTGUyvURtKEoffEMRcd2W1EPlMuyaeftktmlPJs+N+KiNjaauNgC+UUhmPZrMCfpUgIFcpiRcDYKBOF/ELPpaTQ+prRE51JxAz5EDka+ehV38A5zX0x3LxkYKl2XY3xZnKP/oNIENycAxSxx35MYhy8RTjh4MXLMqvaut6a0JOLDcZeToky609t4RbFpWE7XJx0R2sHNNQbSxkg==
Received: from BN0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:408:ee::31)
 by SN7PR12MB7977.namprd12.prod.outlook.com (2603:10b6:806:340::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Sun, 18 Oct
 2026 10:12:27 +0000
Received: from BN2PEPF0000A7FE.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::77) by BN0PR04CA0026.outlook.office365.com
 (2603:10b6:408:ee::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Sun,
 18 Oct 2026 10:12:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000A7FE.mail.protection.outlook.com (10.167.245.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 18 Oct 2026 10:12:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 18 Oct
 2026 03:12:13 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 03:12:11 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH platform-next v2 0/3] platform/mellanox: Add nvsw core and SPC6 host driver
Date: Sun, 18 Oct 2026 13:11:53 +0300
Message-ID: <20261018101156.699575-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FE:EE_|SN7PR12MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 874c3f55-e36f-4ce0-55da-08df2d004f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|30052699003|36860700016|82310400026|56012099006|5023799004|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	b/h74FzL6W/U6fcs8hc548oEGkf2f+zacojGr4IsOKFYnBrRa88lvbRCdVnbFEujjBB3ae9L/lGH+/KWmC+l4ozi9c+IxEZOWnkYjIyvsNYwyVssWUVK7zjMJaEPvsDHjDMaD9gboJmQA2mIOM7BVl5dX4Ql1piTuAlBcJBWuhZPVqM5Q5rLxCaPLdjDWF7D2Bv435Jn6N06me/+UYn1QXe91xAD/oZxJ7xd69htcG5Q+zYyaCNtf2f2VKKnmLKB4mqqY+ly7bbUhMuPrA7fCl2uQHOtnsUyNrkGup0w/6t1dTbVCfPdvs47tMXF/zQwnsGH5AmOBjRyb4LTCYa1hXyNii+zG3GH/UVNlXwX69WDmBRmNjPuykp+uktGWRRUQMZU1Uo0Xy9q7GUCrK3gofr4ZTbk9fHG0JXRWWSkPClc39LgJ6q4iO0avzsdmDfbAOomMLT1dotqQRC75ylnDWL+ee+uV0xHiKRzge9M9y9MdgkSN0Mmu/PDjVZOImJop5Yy/9r023soZEv+DeqofHVNPt2qXA3LN891qQPQjjIVNOQKt2LPvsO7Kcf+AUVEcu51/mV02BGvEHEUm3QlPSmje3J8UYjJ8U6WQTtgJJnG6LwwsT7Tn6XCiMJZauJJxAY6kwbtQ9qd5eqIwZYJcTl04sZrYfdgbPt0gbMQzL3LxoEK172RxGgRUsV1eE685COZxyQ9ffHmp7VlCV3IIA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(30052699003)(36860700016)(82310400026)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0bh10LbfDzOFv4MgdfkOvViSFk+YKklrJRcMrMF/s5IKI/1Q4N7t85LR8877D+peOdMIiNTJCzcKBTNHScfTyV43nSsjlAA/Kt8fZ+/gLlgv3fKEsxXs2byyNdazaRTIc0BZUfvBj40s06H2tUKEGF8SYL3IWqizM16xC2NOPm+XSj1JhVO8hPlXCQfTPyu9kEufNMp1B4BVqlkvNmXPqD4G/HhJs+HM0nXargpoM/5KNowr1Y2IpgllCBpKkDcLBmqv/nvSwnSacJ72eq3V86jOKeCpeY7D8sGwUFdT5yDruRDH17MdL0WRnqKehNQq8ZXJ0e3jL8HaGcI4tcJxuuPJ2M/Z2AW/NxWTGu7/MqFAr2GddvkqLmRr8icHBgLF38AgJKkqFaZ0XJDSXsskqeVokIyQWDOMQHhKvV47PzJKH6NsbSerZvUJVmep6lAb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 10:12:26.1922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 874c3f55-e36f-4ce0-55da-08df2d004f4e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A7FE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7977

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

v1->v2
Comments pointed out by Ilpo:
- Add the direct includes for the macros the two drivers use rather
  than relying on them arriving transitively: linux/array_size.h for
  ARRAY_SIZE, linux/bits.h for BIT and GENMASK, linux/err.h for IS_ERR
  and PTR_ERR and linux/dev_printk.h for the dev_*() helpers, plus
  linux/export.h and linux/types.h in the core.
- Remove the redundant NULL assignments from the error paths. The
  registration helpers now return into a local variable, so a struct
  nvsw_core field is only ever assigned a valid pointer and never an
  ERR_PTR, which is what the NULL stores were papering over. 19 of the
  23 assignments are gone; the 4 that remain are on the two module
  scope pointers in nvsw-host-spc6, which outlive a failed probe.
- Rework the rollback in nvsw_core_platform_init() and
  nvsw_host_spc6_mux_topology_init() to be positional, and drop the
  defensive pointer tests from the matching exit paths, which can no
  longer see a partially initialised state.
Additional fixes added by Felix:
- Sort the include blocks in both drivers.
Link to v1: https://lore.kernel.org/platform-driver-x86/20261008061704.794379-1-fradensky@nvidia.com/

Felix Radensky (3):
  platform/mellanox: nvsw-core: Add core driver for Nvidia switches
  platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
  platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled
    switches

 .../ABI/stable/sysfs-driver-mlxreg-io         |  197 +++
 drivers/platform/mellanox/Kconfig             |   19 +
 drivers/platform/mellanox/Makefile            |    2 +
 drivers/platform/mellanox/nvsw-core.c         |  739 ++++++++
 drivers/platform/mellanox/nvsw-host-spc6.c    | 1500 +++++++++++++++++
 drivers/platform/mellanox/nvsw.h              |  317 ++++
 6 files changed, 2774 insertions(+)
 create mode 100644 drivers/platform/mellanox/nvsw-core.c
 create mode 100644 drivers/platform/mellanox/nvsw-host-spc6.c
 create mode 100644 drivers/platform/mellanox/nvsw.h


base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
-- 
2.34.1

Recipients (scripts/get_maintainer.pl):
  To:  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
       Hans de Goede <hansg@kernel.org>
       Vadim Pasternak <vadimp@nvidia.com>
  Cc:  platform-driver-x86@vger.kernel.org
       linux-kernel@vger.kernel.org
