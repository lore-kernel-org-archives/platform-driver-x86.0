Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795632439;
	b=Jiya8aU2jxszNyGhHuDOpY4lHO9+Kk6n9a9Ed1dcbE5GKdhjDDZJaDtKC+LQtfylIP6c
	 +AqeEuw5wdrawCpWBcT8bEijTpbcN4wpqyEjte0IkcVb/1BGUxQtH31tpYzMz6E5/8YkA
	 hcQFH/lIHLmmOu0iH2uZmL4GO2SnycIhoRKG+eUEmL1wtfIIzXT8gMMll1qzq4iUyVFOr
	 hviHRi6yxQCbHEa6Y0WIha04JCYh7RgjYbtjQ/nKfeMUUzmh/QrJdu026uZH98JURCuxp
	 Ud0NAwk6M3mB2Y+XpuQmtuyWeEEZlupeFE4AMuunRoTO67hy6RoeD38YECG1OLqwY/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632439;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7TfjaClFq6Uyv4JDoIeINRosi4DLjI7qRWi9LqCTzA4=;
	b=xqgXicIooHAUb482Fw++HJu2fI0OSXkpOdspN7YLjye7mHlXPYR+DRmmjw7NvGryTzMs
	 Mero6hd166EJcLZNkY+Kl2uSJRgR2x0ErOiGsbeFfdJCRYPSonsAbx+o4R/7sL3uK9IfE
	 hR+X/VQJu63Q3qxvALmO9k/bMGnGoxE8maUbnldrW2B/7HCLpcg15gFj98LRUbR0UHFAX
	 IB1L5K+u/h0nh4ZwiyKpRnyFyOFxvBzFK/8Bj4YxZDpDTzUG9sGkRTJXHSeqPtIU1Yrds
	 ZJ3Kqe6wQBwCsnlIWKxkpI7nRAttyNhAYV1u8VWq37YqAeNNIpxeVVvU59lWE+CkRUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XEkWY+e5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.28
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221D606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 18:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1221D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XEkWY+e5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7jVEaPCPR77mzgHbRnhEfRuskCsCrAo/a1palJOztyUXJJDhUOg9F9PHhkOHI/87fzm6D4ejhJCAi1r1vaoNgyHYGMPEyuSdBR2vU/k1NaPRTnWHY4M7ejKVFTitmx5xRMR8wFvntBSAtfxVQOjVNLPjMlHVdDc7OpYU6uAMkPn0Mtswtctjlz4IDHAr6JUH7Hpfn8tmAqmqBtmagD7tmx0EPNsSB6Zv0w8IVsAY1VG1Sm9xtmMIOlfydar2tAeSv7hzkrgYQ8lHrVYLEV2OxOwl5RIGAMJxBHcWGjEwQNZg4sm2LA2gwFQF6bWokB5tAL3h8CvUg3wElqPZhdpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TfjaClFq6Uyv4JDoIeINRosi4DLjI7qRWi9LqCTzA4=;
 b=Psp+Amm/R3Lucl9HyR0gfHqSFFcMMTe669ikbsx3er9Z+H1fez81iCigMeuAVBrqt9oKjZd0NrFlFQEO0pAuGRoosPa7AEwCSwqLf2Eu6SabrBBq9JACIzn4Pl4ZzuGNlJWDk1e7RnT7cU7Hxk6Bs2DRIRBZCTXMOju68sJfjaQFgBS+v9d1dvVxDyzLLXNnoZi/bd5PxS+feqMJsQwf4IuS3uAUNrJYWrDL9GKJeJpkfg4mye9fitoVtyKn3FXXsvCSKWdsf0T4XqFOSKGZBS1U/2BnoFayyINT6vslc+zmnIwdFMMrFeScCmTPyCf02I13VXu1hL2z8zaI2z4YYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TfjaClFq6Uyv4JDoIeINRosi4DLjI7qRWi9LqCTzA4=;
 b=XEkWY+e5nbZ1Jx0LSMxHKGK3QOPyJLANMbt9YPOrwPeRs6yzvjLTQaJtoAiwgCDGkfF88ygpMkAdTptuwalZNPFtriO/7jDBr8FbsTvfEdyqyE0yiYabVYz2EVucrEiV8EhjJ7AuPEUo40dT9E+qCtvcYewbwCyEEbAVbahwsZ4zfk33Vz2cNnNb+SHRdMdx7H54XNv0IZ6OLAAbqgvxJ38G7Pe2P87y44lLFBOnhdMqeC8do2VLfn+AmU/J8JdDwBaUEuqkrNe+pag8ECm3/BKdAfFudR6vy8sGInNM3rw5hdBnDhAgkR7vcc2zFZ5oytsrkmQT+MCMy5ZQ8LECTA==
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by SA5PPFB1A5CE29A.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8dc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 18:47:12 +0000
Received: from SJ1PEPF000037AE.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::72) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 18:47:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000037AE.mail.protection.outlook.com (10.167.244.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 18:47:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:46:54 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:46:51 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH platform-next v4 0/3] platform/mellanox: Add nvsw core and SPC6 host driver
Date: Wed, 25 Nov 2026 20:46:30 +0200
Message-ID: <20261125184633.2825486-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AE:EE_|SA5PPFB1A5CE29A:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4f4950-2675-4b6e-ddc2-08df4b248468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|261026121527099003|261102123227099003|56012099006|11063799006|5023799004|261022075727099003|261021123027099003|261022105027099003|261026140227099003|261028144727099003|261009223027099003|261021121427099003|261102130727099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ryizfp71Lwompna2T3K9+4E8cccWafCkQ8LkNKCciaQHNMeSgpe5I9tKqHXdcCU2uAcXS9L4Z+Fa+bOYzd39+6hPdznWmd6NS+FyUdxGdvOQTEVj5ef/kilgcPvTF3z7uRlqLRYQ7SgcFuGGVKLWa2UefnEr9cuDemx11tQqJqYY96anzcczWzR1e9opacj0IEJcOr3068Dn9LpZSF6CStdKSVUiq/ic6s6V+70z+UnrFwBd7gEqaR5c+Al3xXNsAmRHL1UT0PARXFtVRnaiA8Y7aSZjA7g30jGceIUHfMm4ojCkgVnmar+cXM/PMh+EpLJbeYoEsG00i2jzEEZPiSwfH2f5qIF5FO6kVJNjETBd9pYK+JAW22+Tj+J5c6hcXXtae4fuIIhFSkg92JgoMKf4jlDWcB0ZJkicA7Wap6uEVTadFIgq9LKA78mxa41VPr7lsB8oeZmtADXKLhkc6YVsq+MOjKj0j9OH0K30sU4hUxPlaT9DSrRb7e+nUBXbTQa5wo+h7wxsdYR4DIucT9HoRp/cNuKoyI+ITZAjCsarMis3NN5ynKB+gvJFXOe5sGTznKpdQJU4SzhHnGTtiPQS5a2C2dEFa3IDfZKmQUgCDczzJl0SNW8QDo7qi4ilxoFo1RefKKMl0QLpfGbDihfx19eRvO4zvSwsULHiz7uOKwWVG/OBaRAWzFMK7qVgPYgV7yEmUO2eyJHLvXDA+g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(261026121527099003)(261102123227099003)(56012099006)(11063799006)(5023799004)(261022075727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003)(261102130727099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/MtZVYrGT8rgnrjix8a6wT4U2tgvwx9o6+kgOfiXcKWrAWWvsvWy3ZdZXvGuZ1KWOZhyEN3J/gWjcZFsJKLC8sc0QYI++GocWJpq9MjnYwGH8HUf2RbEvlf/EAfpa4HLs/jhKIV1u0OCQOdv2gFLbOlP5clZQpW7f61/x3RAan2HLBoLogzU/g5WwCQuHLF93Tg3XuYDR1p+74u5oDuwPm1xFlLcwgUiguTK3maZFaAyR6FEjDZtUROSBG/yNI10sutyx1tBSeWzAZoPlaQRwbCccy7JQNLPcpDaY9F3Oe6IBc9pDClln/wf3enRvqhcNInmuXc3E2QhUyzrlPem5DbnHrhYaiZJ7kKvzUIrpgcx8HDFSbxItD+kZvbBpaik75pzQZOquilpTOdzFS7te+cm8QIgzVWOImhANuX2JLrkWLJq3jq50ikwO0S7vhEz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:47:12.1910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4f4950-2675-4b6e-ddc2-08df4b248468
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB1A5CE29A

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
the core holds the logic (391 lines) and each board driver holds only
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
of roughly 1700 lines in which two unrelated board descriptions are
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

The two drivers cannot collide at runtime: each matches DMI and returns
-ENODEV before registering anything, and their DMI tables are disjoint,
so on any given system exactly one of them instantiates.
If you would still rather the new driver used a distinct name, we can
change it, but it would mean a new sysfs path and a userspace ABI break
for the affected systems.

Symbol namespace
================

The two symbols the core exports to its board drivers are exported as
EXPORT_SYMBOL_NS_GPL() in the NVSW namespace. They are still global
exported symbols, but a module can only use them after importing the
namespace with MODULE_IMPORT_NS(), which modpost and the module loader
enforce, so the dependency is explicit in each consumer.

Testing
=======

Built on x86_64 against pdx86/for-next with gcc W=1 and with clang 17
W=1 plus CONFIG_WERROR, both warning free, at every patch in the
series. Checked with sparse v0.6.5-rc1, smatch and the coccinelle
report mode scripts, all clean. checkpatch --strict reports
no errors and no checks. Module linkage and the namespace import were
verified with modpost and modinfo.

v3->v4
Comments pointed out by Ilpo:
- Stop fanning the matched board description out into module scope.
  The per SKU data is held in struct nvsw_host_spc6_cfg and reached
  through the driver_data of the DMI entry, so nvsw_host_init() now
  matches with dmi_first_match(), hands that description to the
  platform device as its platform data, and the probe path reads it
  back from there. A single pointer is carried over instead of ten
  copies, and the DMI match callback is gone with them.
- Keep the mux parent adapter and the mux client out of module scope
  too. The client lives in struct nvsw_core, which is already the
  drvdata, and the adapter is reached through client->adapter where
  it has to be released. Together with the above this removes every
  module scope pointer in nvsw-host-spc6 except the platform device
  itself, and with them the NULL stores on the error paths that the
  v2 review had already flagged. The board tables remain static.
- Update the ABI Date and KernelVersion in patches 2 and 3, as 7.4
  was missed. They now read November 2026 and 7.5.
Issues reported by a local sashiko review:
- Correct the patch 1 commit message, which said the core implements
  the I2C mux topology. The core only runs the board's mux_init and
  mux_exit callbacks, and the message and kernel-doc now say so.
- Stop calling set_reg_default from nvsw_core_exit(). It only wrote
  the probe-time defaults again, so the callback now runs once, from
  nvsw_core_init().
- Drop the nvsw.h definitions that no driver in the series uses,
  among them CURRENT_TEMP_RO and SWITCH_IC_QTY, which were missing
  from nvsw_readable_reg(), NVSW_REG_MIN, NVSW_NR_NONE and 37 masks.
- Drop the unused ASIC2 to ASIC4 health, event and mask registers,
  which on SPC6 hold thermal and VR signals rather than ASIC health,
  and say in a comment that 0x2550 packs the health of all four ASICs.
- Drop nvsw_volatile_reg(). With no register cache since v3 it was
  never consulted, and it listed every readable register, so a cache
  would have had nothing to hold either. Behaviour is unchanged.
- Stop setting .platform_data on the mux I2C board info in patch 2.
  i2c-mux-mlxcpld is a platform driver and takes its data from the mux
  platform devices, so nothing read it. The board info is now const.
- Update the existing asic_reset and asic2_reset ABI entry. On systems
  which provide asic1_reset to asic4_reset, asic_reset resets all the
  ASICs at once and the others reset one each.
- Stop creating 32 attributes over reserved bits, or over CPLDs that
  are not fitted, on the single ASIC liquid cooled systems. They now
  sit in a table of their own, appended at init to a copy of the
  common table for the four ASIC system.
- Drop the unused linux/i2c-mux.h include from nvsw-host-spc6.
- Add only the registers patch 3 uses to the nvsw-core register map.
  Thirteen registers, among them the power supply alarm group and
  TACHO13 to TACHO20, were made accessible with nothing using them.
- Restore the CPLD fan fault override when the air cooled driver is
  removed or fails to probe, through a new restore_reg_default core
  callback paired with set_reg_default. It was cleared at probe and
  never set again, leaving the fans without fault handling.
- Correct the patch 3 commit message, which said mlx-platform clears
  the same override. mlx-platform writes a different register, and the
  override bit, bit 0 of 0x252e, exists only on the air cooled CPLD.
  The NVSW_FAN_CONTROL_EN_MASK definition now says so.
- Correct the patch 1 commit message and the cover letter, which said
  the NVSW namespace keeps the core's exports out of the global symbol
  table. They are still global symbols, and the namespace only makes
  each user import it with MODULE_IMPORT_NS().
- Shorten the patch 2 commit message on the per SKU description, and
  describe the host I2C topology the probe relies on, with the CPLD on
  bus 2 and the deferral until host bus 3 exists.
- Report the bus 3 deferral in nvsw-host-spc6 with dev_err_probe(),
  and say in the patch 2 commit message that the fixed bus numbers
  rely on the host I2C controller driver registering first.
- Say in the patch 3 ABI that a write to the psu and fan event files
  reaches every bit of the register, clearing the bits written as 0
  and leaving those written as 1 unchanged.
- Make NVSW_CORE depend on I2C, which REGMAP_I2C and the core itself
  require, rather than relying on every selecting driver to depend
  on it.
- Keep the aggregation registers and the event and mask registers of
  every status register in the nvsw-core register map when dropping
  the unused registers, since mlxreg-hotplug programs them at probe
  and would otherwise fail on any board that describes hotplug items.
Additional fixes added by Felix:
- Make the ASIC reset attributes write only in patches 2 and 3, as
  asic_reset and asic2_reset are in mlx-platform and in the ABI. They
  were exposed with mode 0644.
- Drop the HI187 SKU, an intermediate system that will not be
  manufactured.
- Drop the 69 registers that no driver in the series uses from
  nvsw.h and from the nvsw-core register map, which now holds only
  the registers the SPC6 driver accesses and those mlxreg-hotplug
  programs for its status registers.
- Drop the cpu_mctp_ready attribute and its ABI entry from both
  tables, as the CPLD signal will be removed in future CPLD releases.
- Drop asic_pg_fail from the air cooled table, which the liquid
  cooled table does not have either.
Other:
- Rebase onto the current platform-drivers-x86 for-next.

On the one finding sashiko.dev reported against v3, the fan drawer
LEDs that patch 3 describes: it is valid, and it is now fixed, in the
LED tree rather than here. The capability register of these systems
reports a count of the fan drawers present rather than a bitmap, so
the LED entries carry a slot index and leave the capability bit at
zero, which mlxreg_led_config() did not understand. The same
description style is used by mlxplat_mlxcpld_xdr_led_data in
mlx-platform.c, which has been losing all twenty of its fan LEDs
since the table was introduced in v6.16, so the gap belongs to
leds-mlxreg. Lee has applied the fix, commit 68a2bfdf7b4d ("leds:
mlxreg: Fix missing fan LEDs on systems reporting a unit count"),
currently in for-leds-next and so queued for the same merge window as
this series. There is no build or apply dependency between the two
and the LED table here is unchanged.

v2->v3
Comments pointed out by Ilpo:
- Return directly from nvsw_core_init() when
  nvsw_core_mux_topology_init() fails, instead of jumping to a label
  that only does a return.
Issues reported by the sashiko.dev review, which Ilpo asked us to
check:
- Fix the shift for asic2_health..asic4_health. The four ASIC health
  fields share one register, two bits each, but all four entries
  carried .bit = 1, so only asic_health was right aligned and the
  other three reported their field still shifted up. Set .bit to the
  one based position of each mask's least significant bit.
- Drop nvsw_core_reg_def and the register cache configuration that
  went with it. The review pointed out that the array was unsorted
  and that its entries never reached the hardware. Neither register
  is relevant on SPC6, so the array is removed rather than sorted,
  which leaves the cache with nothing to hold. This also drops
  linux/bits.h from nvsw-core.c, whose only user there was the
  GENMASK in that array. The one default SPC6 does need is written by
  the board driver instead, see patch 3.
- Make pdb1_pwr_status..pdb4_pwr_status read only. They were exposed
  with mode 0644 over a register that is not in nvsw_writeable_reg(),
  so a write returned -EIO. The ABI documentation is updated to match.
- Correct the mode of the air cooled pwr_cycle attribute, which was
  0244 instead of 0200.
- Fix the documented polarity of fan_status and psu_status. The CPLD
  reports fan drawer and power supply presence active low, so bit
  value 0 means present. For fan_status that is what
  mlxreg_fan_read() already assumes when it reads the same register
  through .reg_prsnt, so only the ABI text was wrong. psu_status
  shares a description block with psu_ac_status and psu_dc_status,
  which are active high, so the polarity is now stated per attribute.
- Drop the claim that the air cooled system exposes power supply
  alarm indications from the patch 3 commit message, since no
  attribute is described over the alarm registers.
Additional fixes added by Felix:
- Describe jtag_enable as the single bit it is. It was given a two bit
  mask, but only the lower bit is defined in the CPLD register map, so
  values 2 and 3 were accepted and wrote a reserved bit.
- Drop the aux_pwr_cycle attribute from the air cooled table, as it is
  not supported on systems with power supply units.
- Drop the shutdown_unlock attribute. It was described over bit 5 of
  the general purpose register, which the CPLD register map lists as
  reserved. Thermal shutdown unlock is handled by the BMC on SPC6, so
  the attribute is removed rather than moved to the right bit.
- Clear the CPLD fan fault override enable bit on air cooled systems,
  so that the fan speed is left to the software. This is done from the
  board driver through the set_reg_default callback, which until now
  had no user.
- Drop NVSW_REG_FU_CAP_OFFSET from nvsw_writeable_reg(). It is read
  only in hardware and the only attribute over it is 0444, so the
  entry could never be reached. Found by checking every register in
  nvsw_writeable_reg() against the CPLD register map; it is the only
  mismatch.
- Rename the last remaining *_fail label in nvsw-core to err_*, for
  consistency with the rest of the file.

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
Link to v2: https://lore.kernel.org/platform-driver-x86/20261018101156.699575-1-fradensky@nvidia.com/
Link to v3: https://lore.kernel.org/platform-driver-x86/20261020172756.4160946-1-fradensky@nvidia.com/

Felix Radensky (3):
  platform/mellanox: nvsw-core: Add core driver for Nvidia switches
  platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
  platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled
    switches

 .../ABI/stable/sysfs-driver-mlxreg-io         |  205 ++-
 drivers/platform/mellanox/Kconfig             |   20 +
 drivers/platform/mellanox/Makefile            |    2 +
 drivers/platform/mellanox/nvsw-core.c         |  391 +++++
 drivers/platform/mellanox/nvsw-host-spc6.c    | 1485 +++++++++++++++++
 drivers/platform/mellanox/nvsw.h              |  202 +++
 6 files changed, 2304 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/mellanox/nvsw-core.c
 create mode 100644 drivers/platform/mellanox/nvsw-host-spc6.c
 create mode 100644 drivers/platform/mellanox/nvsw.h


base-commit: 2268d837dea13a78639fa3dad60472bb67478709
-- 
2.34.1

