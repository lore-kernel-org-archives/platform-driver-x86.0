Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792517332;
	b=GfCuBTrCxtYaoHl3B+BbLOuTq7CelStNpDNKk2JSIZPB3tbjpFI3/J/g97dXoNl+YThG
	 v1BhrbXJLEwZ6aTRXGN6qzYaT+FcGMEh46DKfFugZkFZJWZKtkJfPvH68Q9I+kSgI8ddj
	 Z4lt4uzl+YO2MKbRcnzCTd8g0RVg2jtIEG6Gsq40wuyPyjzH8oBVILhp6dOs6gT9Cnpwf
	 F1feHo2H0JTNyqStSo/IcRpkBuy+InEDglxL17R58YcUlWB3HqIjL86k74PDWqmpTls6T
	 eRywB46Jec5nQJRV0xux1ScF/RpEWh0ngnt/q5uT9ixCvxPVe6K7hSaVr0dOeinQhJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517332;
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
	bh=tucnhCjpYJywgMWxKxsSy+/8UTsWV+6/s6K5rTryn1c=;
	b=zt7lLDcv+7lq3nL6QUCi6xOOXuP/+PoA5VAXBQng2GCsgQllMX26nNsZwQPAHf8mkpmH
	 PiwTqK5O47obQn/0kwFCujQYasfzg2JyFPHH+LYuE/P3wvldVygMWKOwJdTBwknQmsP12
	 Wrz9IuXxQ/HdWxIcLgd4hrw4kZuU6VuCqLy/awEh9bk4xZgMWbeEUzTLXNUym/JzfKsJq
	 IjvyVmbOsA7ATH+3zS9qlAjU5t0DdF455m4uT4xH2qNPnl1dCpATVMdHReXcgQSPgUl8v
	 TARG+DIWJ9XhRVA3xNTUzQGZD5O53C1sW1J/3J8NQT00QrJoB/WlBfm2hjoHCtmxrQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nwRaRWPy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.39
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F6606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 17:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945F6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nwRaRWPy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1T9DTELO0Y0e6uHkx0d9O2BIiyw4XTyrMDxeZjQdU1yivUX1trx4LO9tcEZaQwpd+hv5Uo3K/DHOUl4t8eTmuZ+rtjAr1IZ0WldHg/r20iqdk/Vdt+meNjy3gGR+3KTq3RmI17iwW/oaypC0UUARraUc/cdnCqvAT1cj7f2clqJ8zS+baISkUu4ePUzIbXrSkXb8+PxwHjAl2pW3lBFKHEVT243W04CR/JrcrlYSkLyNT9YDYiS0jQIQw1xSVH4urpBeBCNU9icOaglyjKQEEYoU74yYQFFCidhzGVn2xdhZSPo9hzMrsN/fjjkzH4Lgl2nvoCjeUc75EZT4qh51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tucnhCjpYJywgMWxKxsSy+/8UTsWV+6/s6K5rTryn1c=;
 b=UVsXk6tSd+ouzAMESrPjFtDCdtpVcDCgJgqiABbnKM2OEGP4WibUznyfcFatXJqcPNUUDAHafkMT/JRtUtnrl6KC721Wye4FFr8cDnbkw09b/cYysAL7ttnNRplBlBKtWolWioVydqfgiLw6FrVZi1ThZ8R9FMBVv5S7nvigd9USQxmhVs7te34OmW/x766wMTqeu8mpiDJieGXjMc0DtqM9il1tAJ3uIu0yHeEpc9oqSC1RzaW7/hAB59JBA6JpxEE1ltSYFRLYh0OSl6pq8ZvjJA+EMDSP9eNgg40vPTyVu60ozy6ve4lwzlBhCytjzCpZGMBoNSG227TQ7+n9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tucnhCjpYJywgMWxKxsSy+/8UTsWV+6/s6K5rTryn1c=;
 b=nwRaRWPyccuq5lrSUuAqS6G6Dh/zxwRr1SPbAeABUcz0CSAQ4OGB12T5GYdJrBL4DbWmkHCKtAM8UtqHWCjbVyu4VUMm/7x4dHt09VAGGGoxNr9gcKnca6QveTZiXZ1ojYolDE5Cy4n7x1xSnPtYqnVhVuD9OytUMullRbDLbaUB7wH63vRa9ZXWxosGt0r3IXbyU9zt3GxkkItNSsJH7AJ1TLDOzce516PwHAg7qpx+SgEgmFvZMX1Of4womy3nhldM2xsP+RmfKcxOoEUsc423QRrU8DMW7AQqpoLfSJOEgyy38EaIWOwSr0k/+LVj6bL18afr42/uCeTfVWzLLw==
Received: from CH5P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::17)
 by IA3PR12MB861212.namprd12.prod.outlook.com (2603:10b6:208:628::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 17:28:46 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::4f) by CH5P223CA0005.outlook.office365.com
 (2603:10b6:610:1f3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Tue,
 20 Oct 2026 17:28:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 17:28:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 10:28:18 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 10:28:16 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH platform-next v3 0/3] platform/mellanox: Add nvsw core and SPC6 host driver
Date: Tue, 20 Oct 2026 20:27:53 +0300
Message-ID: <20261020172756.4160946-1-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|IA3PR12MB861212:EE_
X-MS-Office365-Filtering-Correlation-Id: 004e79e1-f069-4a87-d44e-08df2ecf9823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|56012099006|11063799006|5023799004|261009223027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	P+uBxolg3KPyuZGxeYKeq0weLszcmS0QVt14c37XY9PpRLDvkj36lmaZH0RVqzkWH7Xjv/Y5XdP1A77BxanYzdmdac84GNvr26AaTf+NyhPqYNMTd9VoSnynLe1erpIEwwwGCbSH40ZLTLb2pHjrVrq4ypFc2S2Cygg7lBd5f1rjEmeeGaHcEpghZD9za+lg68cncXlW7ZdP3h1eqhb/Ov2xqZrM87X2rOSnDcyXMrDPVOLqoQ6FLK7TqEh2A7RQd86aiJvqHHqIxw7qXJvKq43vJxWlo9uUzSkDHVNdgLPI/OOPhZkjOEsc1BFLFkS3sfR6OYwT5vElexHy+sRTQw0ZL7nbdGUqTGvqOOKya7WNx5O6eXRyYrczeD9YbznJVDb1WXT7R7dViGrRVZLRqd7QYPr5UbIFN1/TzmedjLCL8YAztD76ldz6S0kPHbl51g6Wq4qnWc1JLK/QfOxpUu68QUDKMAVF3Oc3cDPIddY37HAX5pqPB2GMLXzf9lNQrJXVWjQi1QqqLwLajt/ODaC5NF5Di36gBU06fiTUO1+K0QjusHziwGERRxE4C5+vmV8ewG7sXz4PQHnSj8AHS/ehlUcw/Sw1zX/I3iLNBVADOdT8dcaSlMINjxy7FRaAlxdM6iDkw1dYWRXyFqOlw0S3RXzquv7qXEZzTKslOCgZYAnxsxDJrH9X1tpwt+How7EM4LscF1ge0Oij8Fqqaw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	deZdJBkRIejFbWY9cGeUOM9Wk0Cn8dQUxtpg7pDxtAEPAibWmkVtACtdrdesTHkfCzHiSVyV4jPzTWzaxfNiGP4zjWqHBB+6LSUZUuCni3P4mSSNljy0qVEOK8MPuyl1SxTNIucKU8C7T0ZegnZfqOH7Bp83rMO/gvDk9btqAHXmnaYlbFi1o5HiXZafjxHhRMAyySFU8o/S9EDsy2twr9oVx1ZTRgMgB9RHbDz0+SNvQ+r+gzUReA+lvD8KyTJyI3ckMFCpCn2zYU9WOBvdKut2X1Esu//sk+y93uU8gme8Ix/0yi5eqTg8+p5bDu22GgRYo/elOgRmxhxlhPDNXNWodzP+kDHNJHvSkbbvRoL03DPtvKOuMGflMRlXOtYexGCh1oaCKWSzznQguXCeHZkpXolc2LZTJGgVq299lu/lcXq2BlviB+rUZ9mtTKow
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 17:28:45.3539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 004e79e1-f069-4a87-d44e-08df2ecf9823
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB861212

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
  so that the fan speed is left to the software, as mlx-platform does
  for the earlier generations. This is done from the board driver
  through the set_reg_default callback, which until now had no user.
- Drop NVSW_REG_FU_CAP_OFFSET from nvsw_writeable_reg(). It is read
  only in hardware and the only attribute over it is 0444, so the
  entry could never be reached. Found by checking every register in
  nvsw_writeable_reg() against the CPLD register map; it is the only
  mismatch.
- Rename the last remaining *_fail label in nvsw-core to err_*, for
  consistency with the rest of the file.

That review also reports that the fan drawer LEDs on air cooled
systems are never registered, because mlxreg_led_config() gates a
capability backed LED on data->bit and does not look at data->slot.
That is correct against mainline leds-mlxreg. These systems report the
number of equipped fan drawers as a counter rather than as a bitmask,
which is why the LED description uses .slot, and honouring it needs a
small leds-mlxreg extension that we will submit separately. The same
description style is already used by mlxplat_mlxcpld_xdr_led_data in
mlx-platform.c. The LED table is therefore left unchanged here.

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

Felix Radensky (3):
  platform/mellanox: nvsw-core: Add core driver for Nvidia switches
  platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
  platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled
    switches

 .../ABI/stable/sysfs-driver-mlxreg-io         |  197 +++
 drivers/platform/mellanox/Kconfig             |   19 +
 drivers/platform/mellanox/Makefile            |    2 +
 drivers/platform/mellanox/nvsw-core.c         |  740 ++++++++
 drivers/platform/mellanox/nvsw-host-spc6.c    | 1500 +++++++++++++++++
 drivers/platform/mellanox/nvsw.h              |  317 ++++
 6 files changed, 2775 insertions(+)
 create mode 100644 drivers/platform/mellanox/nvsw-core.c
 create mode 100644 drivers/platform/mellanox/nvsw-host-spc6.c
 create mode 100644 drivers/platform/mellanox/nvsw.h


base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
-- 
2.34.1

