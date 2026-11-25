Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795632467;
	b=5ZfMPhQoDNXvVBT8EmqM6Vkfzb4/j+8WvnGV5uKezhF8+ak18ZRIvEhUtHbeRYMRCiN4
	 99I2c2rSZG5S0ayanTLlQ9pJHF/qVsW5MlX3VpPlq9cvk0v1QjMULDxljjT2NrzBIPUEN
	 NfNtwoPyetUCcWmlYJQMuId6GZ3kRyQdYjESqCODFpKfgRb1UIftLxpfR7pESDCWx399+
	 +PnoIdtN6gPo7qAgDm8MMqwrOkvnNN2LXYSxQFjD6i+H48I1hxLhRBvPZCEIRcUT1s53b
	 HYX4xjYwhyYcssqOFMIdjWuoVZorc8WW77QQ6n83FNFCPLigrlowONL3Pqus4AfsNVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632467;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Dswj3lUdd/6jYFopyVHdYHuyMgNgWMrxSB0GoUHNUJg=;
	b=Hl37JaYcJ/nQrTM0iBS7rnNRTp0bJVOfSu1lrW4Sy3TNQeGZ/F+gnqgZ7aZuoBNc4S63
	 rWo+/UGnCNplVmURNPvAbC+UHzf7N605s676HnW22+P4xattlSAMP2ucjIxMNlDg/E4yC
	 W7eM4YmY+qFz2WoA+5oNgpgSzIobtKbC6oXzzRtEXMCnBLsEcn7mhYfFtI8RoT9i4rOz8
	 dah2jo4mvTKn4GwB4TbxAO38QxKHHYFn6AywuQAqyB3Bk7ULria9J+ybWMsRrEwksFibL
	 UQdcY1ZPWWospqYxt+on+lGRWHAAy8uOJFP7ZaNv7GYpzF80CPybMrfeaoQN+g5J9Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GApYZ53J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.55
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A21606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 18:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GApYZ53J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNlz9+X56YdD+x7eS3mwmO56Bj5LV+OyIeoCytvydOhpLqrqVLlSOTIrAeCcwo47K8bj2dwuh2SRppdeSZxz2L/VTq+UqwVm9dTvQIO04SRQW28AWYNlwrjOcOP+C3S+MOqUN9AdV6MD033s/2Q13phR6XMOjKLlqjhzOl6nl8D28tSDSx1uxVMwV+h0y+XZsgiuFtdxose6q3dBHiIxsigubQUTziMdznTs4LMsfJzYaU/21A3BaShM0tnx0tcVnw2JKnZJGirogQO3x2n1N3RllEilREszsnFfn8sskt7tFoJ/i38ob28uk8InPAT8qI57xeDs1Q0Mg9DnKCh4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dswj3lUdd/6jYFopyVHdYHuyMgNgWMrxSB0GoUHNUJg=;
 b=Lbg377hz2QoaFP0OdXdQb2Wsf75LEyJGFcgYuso6sMmkmfJlJByz3mHrPGp7bjjiHpZ5Su0UKWJC3p6xVGAZeXM+cBcmoEzCPZumyKSRTVqEMIYNvB2iwepgOLZuj5xVaXEHnbSfX9Y0/VBL46IpXYgHcXSkyI4BODh1vqqRsbFfkyASxIIS8GZ9ucx14HvbPHS2ayg2dZz7j6ijqg3uwKL4zRDdxdH/SBrnlztLNffF/jNPxvTpJikaGsIQpd4nzC6ceZ7fBy5G+YyfgZxMTSRN8cM7B6yVyhfH7oNCR+JMbGuikeIMBUTrnFpRReaooZd5Qg1Y3eVu8lZvKtu6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dswj3lUdd/6jYFopyVHdYHuyMgNgWMrxSB0GoUHNUJg=;
 b=GApYZ53JMvgLfjxnpntod4ueL5JHU9dAs9k3lGgR1vhWpFSfdVckSBkkrVi3XeHBgtFOlXuv0lE1jMJMNyoX/jbeo4lPDUsQPYNt+G+6+14p1RT1QcVDFT4Kxqn5SEgumji/1TmkKin84k/tH/t9KIEvWPDSQNHKL1c8l4ZEEJWjkuIOW+42Kgu8ygZWnL5D4GCO4TueyziwJeAqaTktJ+xskgdFTR1ENOIBPMw+qMKGUMJMtm+549xY87mrs0V4pszJE74/suVrge7aLy6CvZG9nYlwWv3QWQlybK0GnozsrdgHUF8sjy4fGj4BDRwFwatslkYjdNdD2Gflya1WOw==
Received: from SJ0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:a03:2ef::9)
 by MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 18:47:35 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::2a) by SJ0PR03CA0184.outlook.office365.com
 (2603:10b6:a03:2ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Wed,
 25 Nov 2026 18:47:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 18:47:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:47:02 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:46:59 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH v4 2/3] platform/mellanox: nvsw-host-spc6: Add driver for Nvidia SPC6 switches
Date: Wed, 25 Nov 2026 20:46:32 +0200
Message-ID: <20261125184633.2825486-3-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125184633.2825486-1-fradensky@nvidia.com>
References: <20261125184633.2825486-1-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca1c4fe-b730-4ead-f907-08df4b249162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|261021123027099003|261028144727099003|261102123227099003|261021121427099003|261021135927099003|261021130227099003|261021133027099003|261026135527099003|261026130827099003|261026121527099003|261026140227099003|261022115727099003|5023799004|11063799006|261022105027099003|56012099006|261022075727099003|10067099003|18002099003|22082099003|261009223027099003|6133799003|261022113327099003;
X-Microsoft-Antispam-Message-Info:
	0WUeaEQFD1LU8/+pW6qxG8wlg1yxtWBG23nclHPiBs+ftg1pUT5gI0YEMuno0A46m/UHpSJPbsiaiKacmWMlOk+wqBGa1CTkJUOSzFzbdZPGyp70gcnhFzQJoLjDuXxbd2KdKH9afQJjsH3KxAwBu5FupOmWA/WFfvfTu5dwxZ5DO7gTybiFoDnbgSCQrw0ECrJYXJNPkhwxV6czxpkjw2k5ZFRrRzQgZXyVBX/TBq/ht873PGNGxeSdvuxdisoibEj5m9SYfkJhzOQbAqkveqrIYt+lTNJbtlTb+6kfsu9/wrH0zbFrqYTn45frF5E4E2Adc1T0opiEAoflpecNntFw3l6CbTGLMuJ/pIdtmlLdfh93DUwh20GVHM9LLDBlIFfrQuvNYZneyohb7yy0Y/8pBTs4z78QFdFsDwMSh79M6JWra1wtYG+JIv055mJR50U5dTbTo5qjUAV3pjuNjQvsNhBWjHV9KDc6DxjJKYIxKnoDgHFzu+l+wJLTtzxKp5iB9dD1xV6HY3EK4OWnyNr8LCJdQwA8sMtI3CvJLaShRr4eGes5w/cmbP/4M1TLy2LLs0HwLloOhzzbAsb7RHaDyEMnrCkYMv7+KIpxQYjVwB4kFIu3ZdZ/phuf4QCtDlb7RsWihxORimSe9Ut4wQ43Vuj+PvGAiGM0rrt5iGKGxmTD2D575ktBynRy7s3JUTqU8+tGOCJ9+YfDLOw3xw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(261021123027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021135927099003)(261021130227099003)(261021133027099003)(261026135527099003)(261026130827099003)(261026121527099003)(261026140227099003)(261022115727099003)(5023799004)(11063799006)(261022105027099003)(56012099006)(261022075727099003)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003)(261022113327099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w5P+nUoafBb9NLu46Tz01tptLT/U8rDW2uEe+y7nCX7bOxKxNw0CjHWvsRvSstp5QkNWJSC/wW/yTYTzkAIQRM2hWB9SM5NN9Rz2x28S0kzY0Eb0IHAU+cL27Vw16ORe0FCXQ7wz7FMHm5y28O/2xyUUKjK1nFYG/Ha279b4K06eEmA1pEYUS9G4zDSTy/2sGfiFmWuYrURSqf2g9SM5gwk4cvtBeSwGqIFL5e6wEaoega2nS794cjN5LRNwo56nvsjfNQVP+bmnnAw+Zucq9D3aoSeH2NLHg+ZuJf/ge0TymRiaDo+GGce4kXlF9IioTUQYLyv2AXjQER5NvAmwOzEVzgDjO0cKhnw7Yegk2sbRRTdGYG/sYtLa3z2gHz5WGxFekPDv2GiQe6vFM2/JkR8ztSK7owHAbNGLeB4XtSz6l7yXJHQsdxcVHQwh0oy1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:47:33.9564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca1c4fe-b730-4ead-f907-08df4b249162
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343

The driver allows system control and monitoring of Nvidia liquid
cooled Ethernet switches based on the SPC6 ASIC through CPLD/FPGA
devices from the host CPU.

This control includes:
- Various resets handling through sysfs attributes.
- Reset cause reports through sysfs attributes.
- Mux attributes for hw components selection.
- General purpose registers attributes.
- LED control.
- Watchdog control.

These systems carry no power supplies or fan drawers of their own, so
the board description covers coolant leakage detection and power
distribution board status instead of power supply and fan control.

The driver describes the SPC6 hardware and leaves the register map and
platform device creation to nvsw-core.

The per SKU description is taken from the driver_data of the matching
DMI entry and passed to the platform device as its platform data.

The driver relies on the host I2C topology of these systems. The host
has four I2C controllers, which provide buses 0 to 3, and the CPLD that
implements the mux sits at address 0x33 on bus 2. The host buses and the
mux channels are both numbered dynamically, so whichever adapter
registers first takes the lowest free number. The probe therefore
returns -EPROBE_DEFER until bus 3 exists, since a mux channel registered
before the last host controller would take bus 3, and the host bus and
the mux channels would be numbered differently from boot to boot. The
reason for the deferral is reported through dev_err_probe(). The fixed
numbers rely on the host controller driver registering its buses before
any other I2C bus driver, which the system software of these switches
ensures, in the same way as nvsw-sn2201 relies on a fixed main mux bus
number.

The four ASIC system, HI188, has CPLDs, ASICs, leakage sensors and power
distribution board status bits that the single ASIC HI183 and HI193
lack, where the same registers are reserved or hold other signals. The
register access entries for them are kept in a table of their own, which
nvsw_host_init() appends to a copy of the common liquid cooled table for
the four ASIC system. The single ASIC systems use the common table
alone, so they get no attribute over a reserved bit or a CPLD that is
not fitted, the common entries are not duplicated, and both counts come
from ARRAY_SIZE().

Document the register access attributes which are not yet covered by
Documentation/ABI/stable/sysfs-driver-mlxreg-io. Update the existing
asic_reset and asic2_reset entry as well: on these systems asic_reset
resets all the ASICs at once while asic1_reset to asic4_reset reset the
individual ones. The ASIC reset files are write only, as on the other
systems.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---

Notes:
    v3->v4
    Comments pointed out by Ilpo:
    - Carry the matched board description over as a single pointer. The
      per SKU data is held in struct nvsw_host_spc6_cfg and reached
      through the driver_data of the DMI entry, so nvsw_host_init() now
      matches with dmi_first_match(), hands that description to the
      platform device as its platform data, and the probe path reads it
      back from there. The eight module scope variables it used to be
      copied into are gone, and so is the DMI match callback.
    - Keep the mux parent adapter and the mux client out of module scope
      as well. The client is stored in struct nvsw_core, which is already
      the drvdata, and the adapter is reached through client->adapter
      where it has to be released, so neither needs a module scope
      pointer and neither has to be cleared on the error paths. Apart from
      the static board tables, the only module scope variable left is the
      platform device itself.
    - Update the ABI Date and KernelVersion, as 7.4 was missed. They now
      read November 2026 and 7.5.
    Issues reported by a local sashiko review:
    - Stop setting .platform_data on the mux board info in probe, and make
      nvsw_host_spc6_mux_brdinfo const. i2c-mux-mlxcpld is a platform
      driver and takes its data from the mux platform devices, which
      already carry it, so nothing read the I2C client's copy.
    - Update the existing asic_reset and asic2_reset ABI entry, which left
      open which file resets the first ASIC. On systems which provide
      asic1_reset to asic4_reset, asic_reset resets all the ASICs at once
      and the others reset one each. The asic1_reset, asic3_reset and
      asic4_reset entry now says the same, and no longer describes
      writing 0 as releasing the reset, since the CPLD generates the reset
      as a pulse.
    - Stop creating attributes over reserved bits on the single ASIC
      systems. HI183 and HI193 shared the liquid cooled table with the
      four ASIC HI188, so they got asic1_reset to asic4_reset,
      asic2_health to asic4_health, pdb1_pwr_status to pdb4_pwr_status
      and leakage3 to leakage5 over bits their CPLD reserves, and cpld5 to
      cpld10 version and part number files for CPLDs they do not have,
      some over registers holding watchdog and presence signals. These 32
      entries are now in a table of their own, which nvsw_host_init()
      appends to a copy of the common liquid cooled table for the four
      ASIC system, and the single ASIC systems use the common table
      alone. Both counts come from ARRAY_SIZE(), so no split point is
      maintained by hand. The ABI text says
      asic1_reset, asic3_reset and asic4_reset are not present on single
      ASIC systems, instead of describing their bits as reserved.
    - Shorten the commit message paragraph on the per SKU board
      description, which repeated what the code shows and claimed that no
      board state is kept at module scope, while the board tables are
      static and nvsw-core stores the register map into them. Describe the
      host I2C topology the probe relies on: the CPLD at 0x33 on bus 2,
      and the deferral until bus 3 exists, which keeps a dynamically
      numbered mux channel from taking that bus number before the last
      host controller registers.
    - Report the deferral until bus 3 exists with dev_err_probe(), so
      that the reason is recorded in devices_deferred rather than only in
      a debug message, and say in the commit message that the fixed bus
      numbers rely on the host controller driver registering its buses
      before any other I2C bus driver.
    - Drop the linux/i2c-mux.h include. The mux is created as an
      i2c-mux-mlxcpld platform device, and nothing declared in that header
      is used here.
    Additional fixes added by Felix:
    - Make asic_reset and asic1_reset to asic4_reset write only. They
      were exposed with mode 0644, while asic_reset and asic2_reset are
      write only in mlx-platform and documented as such, so the same
      attribute would have behaved differently depending on the driver
      providing it.
    - Drop the HI187 DMI entry. HI187 is an intermediate system that will
      not be manufactured.
    - Drop the cpu_mctp_ready attribute and its ABI entry. The CPLD
      signal behind it is deprecated and will be removed in future CPLD
      releases.
    
    v2->v3
    Additional fixes added by Felix:
    - Describe jtag_enable as the single bit it is. It was given a two
      bit mask, but only the lower bit is defined in the CPLD register
      map, so values 2 and 3 were accepted and wrote a reserved bit.
    - Drop the shutdown_unlock attribute. It was described over bit 5 of
      the general purpose register, which the CPLD register map lists as
      reserved. Thermal shutdown unlock is handled by the BMC on SPC6, so
      the attribute is removed rather than moved.
    
    Issues reported by the sashiko.dev review:
    - Fix the shift for asic2_health, asic3_health and asic4_health. The
      four health fields share ASIC_HEALTH_INT_Stat_REG1, two bits each,
      but all four entries carried .bit = 1, so only asic_health was
      right-aligned. The other three reported their field still shifted
      up, giving 0, 8 or 12 for asic2_health instead of the documented 0,
      2 or 3, and likewise for asic3_health and asic4_health. Set .bit to
      the one-based position of each mask's least significant bit.
    - Make pdb1_pwr_status..pdb4_pwr_status read only. They were exposed
      with mode 0644 over NVSW_REG_PS_DC_OK_OFFSET, which is not listed in
      nvsw_writeable_reg(), so any write returned -EIO. The ABI
      documentation is updated to match the description, which only
      defines read semantics.
    
    v1->v2
    Comments pointed out by Ilpo:
    - Add the direct includes for the macros this file uses instead of
      relying on them arriving transitively: linux/array_size.h,
      linux/bits.h, linux/dev_printk.h and linux/err.h.
    - Register into a local in nvsw_host_spc6_mux_topology_init() and in
      the probe path, publishing the pointer only once it is known good,
      so the NULL assignments that were hiding an ERR_PTR are gone. The
      only ones left are on nvsw_host_mux_i2c_client and
      nvsw_host_mux_i2c_adapter, which are module scope and so outlive a
      failed probe.
    - Drop the per-entry pointer tests from
      nvsw_host_spc6_mux_topology_exit(), since init now rolls back fully
      on failure.
    Additional fixes added by Felix:
    - Sort the include block.

 .../ABI/stable/sysfs-driver-mlxreg-io         | 159 +++-
 drivers/platform/mellanox/Kconfig             |  10 +
 drivers/platform/mellanox/Makefile            |   1 +
 drivers/platform/mellanox/nvsw-host-spc6.c    | 885 ++++++++++++++++++
 4 files changed, 1054 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/mellanox/nvsw-host-spc6.c

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index f59461111221..8d59181d7196 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -518,7 +518,13 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic2_reset
 Date:		July 2022
 KernelVersion:	5.20
 Contact:	Vadim Pasternak <vadimp@nvidia.com>
-Description:	These files allow to each of ASICs by writing 1.
+Description:	These files allow to reset the ASICs by writing 1.
+
+		On systems which do not provide asic1_reset, asic_reset
+		resets the first ASIC and asic2_reset resets the second
+		one. On systems which provide asic1_reset, asic3_reset and
+		asic4_reset, asic_reset resets all the ASICs at once, and
+		asic1_reset to asic4_reset reset the individual ASICs.
 
 		The files are write only.
 
@@ -813,3 +819,154 @@ Description:	These files show status of Unified Fabric Manager upgrade.
 		state. 0 - means upgrade is done, 1 - otherwise.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld6_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld7_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld8_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld9_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld10_version_min
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show with which CPLD part numbers, version and minor
+		versions have been burned the 6-th to the 10-th CPLD devices
+		equipped on a system.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic1_reset
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic3_reset
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic4_reset
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files allow to reset the first, the third and the fourth
+		ASIC individually on a multi-ASIC system, while asic2_reset
+		resets the second one and asic_reset resets all of them at
+		once. They are not present on systems with a single ASIC,
+		where asic_reset resets that ASIC.
+
+		The files are write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic3_health
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic4_health
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show health status of the third and the fourth ASIC
+		on a multi-ASIC system. The possible values are:
+		0 - health failed, 2 - health OK, 3 - ASIC in booting state.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage1
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage2
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage3
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage4
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/leakage5
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the status of the liquid leakage sensors
+		equipped on a liquid cooled system. Value 1 means that a leak
+		has been detected by the related sensor, 0 - otherwise. The
+		number of sensors, and so of these files, depends on the
+		system type.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb1_pwr_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb2_pwr_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb3_pwr_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pdb4_pwr_status
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the power status of the power distribution
+		boards equipped on a system. Value 1 means that the related
+		board is powered and operational, 0 - otherwise.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/graceful_pwr_off
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file allows to initiate a graceful power off sequence and
+		shows whether such a sequence is in progress. Writing 1 starts
+		the sequence.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpu_shutdown_req
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file shows a shutdown request raised towards the CPU.
+		Value 1 means that a shutdown of the system has been
+		requested, 0 - otherwise.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpu_power_off_ready
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file allows the CPU to report that it has completed its
+		shutdown procedures and that the system can be powered down.
+		Writing 1 signals readiness for power off.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bmc_to_cpu_ctrl
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file selects the owner of the shared I2C bus between the
+		Board Management Controller and the CPU. Value 0 selects the
+		CPU as the owner, 1 selects the Board Management Controller.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/uart_sel
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file selects which of the system consumers is connected to
+		the shared UART console.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/aux_pwr_cycle
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file allows to power cycle the auxiliary power domain of
+		the system. Writing 1 performs the power cycle.
+
+		The file is write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_aux_pwr_or_reload
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_cpu_thermal
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_main_51v
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_mgmt_pwr
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the system reset cause. Respectively:
+		auxiliary power failure or CPLD field upgrade, CPU thermal
+		shutdown, management board 5.1V rail failure and management
+		board power failure. Value 1 means the related event caused
+		the last reset.
+
+		The files are read only.
diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index 34deba4670c2..f17497ca86f9 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -115,6 +115,16 @@ config NVSW_CORE
 	  selected by the drivers that need it, which are built as separate
 	  modules against it.
 
+config NVSW_HOST_SPC6
+	tristate "Nvidia SPC6 host CPLD/FPGA Hardware Control and Monitoring"
+	depends on DMI && HWMON && I2C
+	select NVSW_CORE
+	help
+	  Say Y here to include support for the FPGA/CPLD logic by host CPU
+	  equipped on Nvidia SPC6 ethernet switches.
+	  This driver can also be built as a module. If so the module
+	  will be called nvsw-host-spc6.
+
 config NVSW_SN2201
 	tristate "Nvidia SN2201 platform driver support"
 	depends on HWMON && I2C
diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
index 22e40759dd49..a959d07f1787 100644
--- a/drivers/platform/mellanox/Makefile
+++ b/drivers/platform/mellanox/Makefile
@@ -12,4 +12,5 @@ obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
 obj-$(CONFIG_MLXREG_IO) += mlxreg-io.o
 obj-$(CONFIG_MLXREG_LC) += mlxreg-lc.o
 obj-$(CONFIG_NVSW_CORE) += nvsw-core.o
+obj-$(CONFIG_NVSW_HOST_SPC6) += nvsw-host-spc6.o
 obj-$(CONFIG_NVSW_SN2201) += nvsw-sn2201.o
diff --git a/drivers/platform/mellanox/nvsw-host-spc6.c b/drivers/platform/mellanox/nvsw-host-spc6.c
new file mode 100644
index 000000000000..a3ed8dde9403
--- /dev/null
+++ b/drivers/platform/mellanox/nvsw-host-spc6.c
@@ -0,0 +1,885 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Nvidia SPC6 host platform driver
+ *
+ * Copyright (C) 2025-2026 Nvidia Technologies Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_data/mlxcpld.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+
+#include "nvsw.h"
+
+#define NVSW_HOST_DEVICE_NAME	"mlxplat"
+
+/* Bus number of mux parent device */
+#define NVSW_I2C_MUX_PARENT_BUS_NR	2
+
+/* Bus number of the last host I2C bus */
+#define NVSW_I2C_LAST_HOST_BUS_NR	3
+
+/**
+ * struct nvsw_host_spc6_cfg - per SKU board description
+ * @regs_io: register access platform data;
+ * @led: led platform data;
+ */
+struct nvsw_host_spc6_cfg {
+	struct mlxreg_core_platform_data *regs_io;
+	struct mlxreg_core_platform_data *led;
+};
+
+/* Platform mux channels */
+static int nvsw_host_spc6_mux_channels[] = {
+	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
+	18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
+	33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+	48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62,
+	63, 64, 65, 66, 67,
+};
+
+/* Platform mux data */
+static struct mlxcpld_mux_plat_data nvsw_host_spc6_mux_data[] = {
+	{
+		.chan_ids = nvsw_host_spc6_mux_channels,
+		.num_adaps = ARRAY_SIZE(nvsw_host_spc6_mux_channels),
+		.sel_reg_addr = NVSW_REG_MUX1_OFFSET,
+		.reg_size = 2,
+	},
+};
+
+/* Platform mux board info */
+static const struct i2c_board_info nvsw_host_spc6_mux_brdinfo = {
+	I2C_BOARD_INFO("i2c-mux-mlxcpld", 0x33),
+};
+
+static struct platform_device *nvsw_host_dev;
+
+/* Platform register access data for liquid cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_lc_regs_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = NVSW_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version",
+		.reg = NVSW_REG_CPLD2_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version",
+		.reg = NVSW_REG_CPLD3_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version",
+		.reg = NVSW_REG_CPLD4_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = NVSW_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld2_pn",
+		.reg = NVSW_REG_CPLD2_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld3_pn",
+		.reg = NVSW_REG_CPLD3_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld4_pn",
+		.reg = NVSW_REG_CPLD4_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = NVSW_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version_min",
+		.reg = NVSW_REG_CPLD2_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version_min",
+		.reg = NVSW_REG_CPLD3_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version_min",
+		.reg = NVSW_REG_CPLD4_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "pwr_converter_prog_en",
+		.reg = NVSW_REG_GP7_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "graceful_pwr_off",
+		.reg = NVSW_REG_GP7_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "cpu_shutdown_req",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "cpu_power_off_ready",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "pwr_cycle",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_down",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "aux_pwr_cycle",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0200,
+	},
+	{
+		.label = "bmc_to_cpu_ctrl",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "uart_sel",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = NVSW_UART_SEL_MASK,
+		.bit = 7,
+		.mode = 0644,
+	},
+	{
+		.label = "leakage1",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "leakage2",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "asic_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "reset_long_pb",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_short_pb",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_reload",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_platform",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_wd",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_asic_thermal",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_soc",
+		.reg = NVSW_REG_RESET_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_system",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_pwr_off",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_cpu_thermal",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_pwr_converter_fail",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_main_51v",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_mgmt_pwr",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "jtag_cap",
+		.reg = NVSW_REG_FU_CAP_OFFSET,
+		.mask = NVSW_FU_CAP_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "jtag_enable",
+		.reg = NVSW_REG_FIELD_UPGRADE,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "asic_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "spi_chnl_select",
+		.reg = NVSW_REG_SPI_CHNL_SELECT,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+};
+
+/*
+ * Register access data that exists on the liquid cooled four ASIC systems
+ * only, following nvsw_host_spc6_lc_regs_io_data. On the single ASIC ones
+ * the CPLDs it reports are not fitted, and the bits it accesses are reserved
+ * or hold other signals.
+ */
+static const struct mlxreg_core_data nvsw_host_spc6_lc_4asic_only_regs_io_data[] __initconst = {
+	{
+		.label = "cpld5_version",
+		.reg = NVSW_REG_CPLD5_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld6_version",
+		.reg = NVSW_REG_CPLD6_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld7_version",
+		.reg = NVSW_REG_CPLD7_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld8_version",
+		.reg = NVSW_REG_CPLD8_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld9_version",
+		.reg = NVSW_REG_CPLD9_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld10_version",
+		.reg = NVSW_REG_CPLD10_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld5_pn",
+		.reg = NVSW_REG_CPLD5_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld6_pn",
+		.reg = NVSW_REG_CPLD6_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld7_pn",
+		.reg = NVSW_REG_CPLD7_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld8_pn",
+		.reg = NVSW_REG_CPLD8_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld9_pn",
+		.reg = NVSW_REG_CPLD9_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld10_pn",
+		.reg = NVSW_REG_CPLD10_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld5_version_min",
+		.reg = NVSW_REG_CPLD5_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld6_version_min",
+		.reg = NVSW_REG_CPLD6_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld7_version_min",
+		.reg = NVSW_REG_CPLD7_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld8_version_min",
+		.reg = NVSW_REG_CPLD8_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld9_version_min",
+		.reg = NVSW_REG_CPLD9_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld10_version_min",
+		.reg = NVSW_REG_CPLD10_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "leakage3",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "leakage4",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "leakage5",
+		.reg = NVSW_REG_LEAK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "asic1_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "asic2_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "asic3_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0200,
+	},
+	{
+		.label = "asic4_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0200,
+	},
+	{
+		.label = "asic2_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC2_MASK,
+		.bit = 3,
+		.mode = 0444,
+	},
+	{
+		.label = "asic3_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC3_MASK,
+		.bit = 5,
+		.mode = 0444,
+	},
+	{
+		.label = "asic4_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC4_MASK,
+		.bit = 7,
+		.mode = 0444,
+	},
+	{
+		.label = "pdb1_pwr_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "pdb2_pwr_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "pdb3_pwr_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "pdb4_pwr_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_lc_regs_io = {
+	.data = nvsw_host_spc6_lc_regs_io_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_regs_io_data),
+};
+
+/* Filled by nvsw_host_init() from the two tables above, in that order */
+static struct mlxreg_core_data
+nvsw_host_spc6_lc_4asic_regs_io_data[ARRAY_SIZE(nvsw_host_spc6_lc_regs_io_data) +
+				     ARRAY_SIZE(nvsw_host_spc6_lc_4asic_only_regs_io_data)];
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_lc_4asic_regs_io = {
+	.data = nvsw_host_spc6_lc_4asic_regs_io_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_4asic_regs_io_data),
+};
+
+/* Platform led data for liquid cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_lc_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:amber",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "power:green",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "power:amber",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "uid:blue",
+		.reg = NVSW_REG_LED5_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_lc_led = {
+	.data = nvsw_host_spc6_lc_led_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_led_data),
+};
+
+/* Watchdog platform data */
+static struct mlxreg_core_data nvsw_host_spc6_wd_main_regs[] = {
+	{
+		.label = "action",
+		.reg = NVSW_REG_WD2_ACT_OFFSET,
+		.mask = NVSW_WD_RESET_ACT_MASK,
+		.bit = 0,
+	},
+	{
+		.label = "timeout",
+		.reg = NVSW_REG_WD2_TMR_OFFSET,
+		.mask = NVSW_WD_TYPE2_TO_MASK,
+		.health_cntr = NVSW_WD3_DFLT_TIMEOUT,
+	},
+	{
+		.label = "timeleft",
+		.reg = NVSW_REG_WD2_TMR_OFFSET,
+		.mask = NVSW_WD_TYPE2_TO_MASK,
+	},
+	{
+		.label = "ping",
+		.reg = NVSW_REG_WD2_ACT_OFFSET,
+		.mask = NVSW_WD_RESET_ACT_MASK,
+		.bit = 0,
+	},
+	{
+		.label = "reset",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.bit = 6,
+	},
+};
+
+static struct mlxreg_core_data nvsw_host_spc6_wd_aux_regs[] = {
+	{
+		.label = "action",
+		.reg = NVSW_REG_WD3_ACT_OFFSET,
+		.mask = NVSW_WD_FAN_ACT_MASK,
+		.bit = 4,
+	},
+	{
+		.label = "timeout",
+		.reg = NVSW_REG_WD3_TMR_OFFSET,
+		.mask = NVSW_WD_TYPE2_TO_MASK,
+		.health_cntr = NVSW_WD3_DFLT_TIMEOUT,
+	},
+	{
+		.label = "timeleft",
+		.reg = NVSW_REG_WD3_TMR_OFFSET,
+		.mask = NVSW_WD_TYPE2_TO_MASK,
+	},
+	{
+		.label = "ping",
+		.reg = NVSW_REG_WD3_ACT_OFFSET,
+		.mask = NVSW_WD_FAN_ACT_MASK,
+		.bit = 4,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_wd_set[] = {
+	{
+		.data = nvsw_host_spc6_wd_main_regs,
+		.counter = ARRAY_SIZE(nvsw_host_spc6_wd_main_regs),
+		.version = MLX_WDT_TYPE3,
+		.identity = "mlx-wdt-main",
+	},
+	{
+		.data = nvsw_host_spc6_wd_aux_regs,
+		.counter = ARRAY_SIZE(nvsw_host_spc6_wd_aux_regs),
+		.version = MLX_WDT_TYPE3,
+		.identity = "mlx-wdt-aux",
+	},
+};
+
+/* Mux init/exit callbacks. */
+static int nvsw_host_spc6_mux_topology_init(struct nvsw_core *nvsw_core)
+{
+	struct platform_device *pdev;
+	int i, err;
+
+	/* Create mux infrastructure. */
+	for (i = 0; i < nvsw_core->mux_num; i++) {
+		pdev = platform_device_register_resndata(&nvsw_core->client->dev,
+							 "i2c-mux-mlxcpld", i, NULL,
+							 0, &nvsw_host_spc6_mux_data[i],
+							 sizeof(nvsw_host_spc6_mux_data[i]));
+		if (IS_ERR(pdev)) {
+			dev_err(nvsw_core->dev, "Failed to create mux infra\n");
+			err = PTR_ERR(pdev);
+			goto err_unregister_mux;
+		}
+		nvsw_core->mux[i] = pdev;
+	}
+
+	return 0;
+
+err_unregister_mux:
+	while (i--)
+		platform_device_unregister(nvsw_core->mux[i]);
+
+	return err;
+}
+
+static void nvsw_host_spc6_mux_topology_exit(struct nvsw_core *nvsw_core)
+{
+	int i;
+
+	for (i = nvsw_core->mux_num - 1; i >= 0; i--)
+		platform_device_unregister(nvsw_core->mux[i]);
+}
+
+/* Liquid cooled single ASIC systems, without power supplies and fans. */
+static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc = {
+	.regs_io = &nvsw_host_spc6_lc_regs_io,
+	.led = &nvsw_host_spc6_lc_led,
+};
+
+/* Liquid cooled four ASIC systems, without power supplies and fans. */
+static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc_4asic = {
+	.regs_io = &nvsw_host_spc6_lc_4asic_regs_io,
+	.led = &nvsw_host_spc6_lc_led,
+};
+
+static const struct dmi_system_id nvsw_host_dmi_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0025"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI193"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0027"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI183"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_lc,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0027"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI188"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_lc_4asic,
+	},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(dmi, nvsw_host_dmi_table);
+
+static int nvsw_host_probe(struct platform_device *pdev)
+{
+	const struct nvsw_host_spc6_cfg *cfg = dev_get_platdata(&pdev->dev);
+	struct i2c_adapter *last_host_adapter;
+	struct i2c_adapter *adapter;
+	struct nvsw_core *nvsw_core;
+	struct i2c_client *client;
+	int i, err;
+
+	/*
+	 * Ensure the I2C host driver has finished registering all 4 buses
+	 * (0-3) to prevent the mux from stealing bus 3.
+	 */
+	last_host_adapter = i2c_get_adapter(NVSW_I2C_LAST_HOST_BUS_NR);
+	if (!last_host_adapter)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "I2C adapter for bus %d is not ready\n",
+				     NVSW_I2C_LAST_HOST_BUS_NR);
+	i2c_put_adapter(last_host_adapter);
+
+	nvsw_core = devm_kzalloc(&pdev->dev, sizeof(*nvsw_core), GFP_KERNEL);
+	if (!nvsw_core)
+		return -ENOMEM;
+
+	/* Get I2C mux parent adapter */
+	adapter = i2c_get_adapter(NVSW_I2C_MUX_PARENT_BUS_NR);
+	if (!adapter) {
+		dev_err(&pdev->dev,
+			"I2C adapter for bus %d is not available\n",
+			NVSW_I2C_MUX_PARENT_BUS_NR);
+		return -ENODEV;
+	}
+
+	/* Create device at the top of host I2C tree */
+	client = i2c_new_client_device(adapter, &nvsw_host_spc6_mux_brdinfo);
+	if (IS_ERR(client)) {
+		dev_err(&pdev->dev,
+			"Failed to create client %s at bus %d at addr 0x%02x\n",
+			nvsw_host_spc6_mux_brdinfo.type, NVSW_I2C_MUX_PARENT_BUS_NR,
+			nvsw_host_spc6_mux_brdinfo.addr);
+		err = PTR_ERR(client);
+		goto err_put_adapter;
+	}
+
+	/* Set system configuration. */
+	nvsw_core->dev = &pdev->dev;
+	nvsw_core->client = client;
+	nvsw_core->mux_num = ARRAY_SIZE(nvsw_host_spc6_mux_data);
+	for (i = 0; i < ARRAY_SIZE(nvsw_host_spc6_wd_set); i++)
+		nvsw_core->wd_data[i] = &nvsw_host_spc6_wd_set[i];
+	nvsw_core->regio_data = cfg->regs_io;
+	nvsw_core->led_data = cfg->led;
+	nvsw_core->mux_init = nvsw_host_spc6_mux_topology_init;
+	nvsw_core->mux_exit = nvsw_host_spc6_mux_topology_exit;
+	platform_set_drvdata(pdev, nvsw_core);
+
+	err = nvsw_core_init(nvsw_core);
+	if (err)
+		goto err_unregister_client;
+
+	return 0;
+
+err_unregister_client:
+	i2c_unregister_device(client);
+err_put_adapter:
+	i2c_put_adapter(adapter);
+
+	return err;
+}
+
+static void nvsw_host_remove(struct platform_device *pdev)
+{
+	struct nvsw_core *nvsw_core = platform_get_drvdata(pdev);
+	struct i2c_adapter *adapter = nvsw_core->client->adapter;
+
+	nvsw_core_exit(nvsw_core);
+	i2c_unregister_device(nvsw_core->client);
+	i2c_put_adapter(adapter);
+}
+
+static struct platform_driver nvsw_host_driver = {
+	.driver		= {
+		.name	= NVSW_HOST_DEVICE_NAME,
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
+	},
+	.probe		= nvsw_host_probe,
+	.remove		= nvsw_host_remove,
+};
+
+static int __init nvsw_host_init(void)
+{
+	const struct nvsw_host_spc6_cfg *cfg;
+	const struct dmi_system_id *dmi;
+	int err;
+
+	/* The matched entry carries the board description of this SKU. */
+	dmi = dmi_first_match(nvsw_host_dmi_table);
+	if (!dmi)
+		return -ENODEV;
+	cfg = dmi->driver_data;
+
+	memcpy(nvsw_host_spc6_lc_4asic_regs_io_data, nvsw_host_spc6_lc_regs_io_data,
+	       sizeof(nvsw_host_spc6_lc_regs_io_data));
+	memcpy(&nvsw_host_spc6_lc_4asic_regs_io_data[ARRAY_SIZE(nvsw_host_spc6_lc_regs_io_data)],
+	       nvsw_host_spc6_lc_4asic_only_regs_io_data,
+	       sizeof(nvsw_host_spc6_lc_4asic_only_regs_io_data));
+
+	nvsw_host_dev = platform_device_register_data(NULL, NVSW_HOST_DEVICE_NAME,
+						      PLATFORM_DEVID_NONE, cfg,
+						      sizeof(*cfg));
+	if (IS_ERR(nvsw_host_dev))
+		return PTR_ERR(nvsw_host_dev);
+
+	err = platform_driver_register(&nvsw_host_driver);
+	if (err)
+		platform_device_unregister(nvsw_host_dev);
+
+	return err;
+}
+module_init(nvsw_host_init);
+
+static void __exit nvsw_host_exit(void)
+{
+	platform_driver_unregister(&nvsw_host_driver);
+	platform_device_unregister(nvsw_host_dev);
+}
+module_exit(nvsw_host_exit);
+
+MODULE_AUTHOR("Felix Radensky <fradensky@nvidia.com>");
+MODULE_DESCRIPTION("Nvidia platform SPC6 driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS("NVSW");
-- 
2.34.1

