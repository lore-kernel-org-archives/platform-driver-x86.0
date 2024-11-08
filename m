Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267C91D0E2C
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049735; cv=fail; b=olDsxUVfcD8IgLJzm21J3okmnXgQz4a5h0pG1F2eKQaYfqz9steL675fEwxiukObMDkuEQ1ltXTFFDQX+k/rDijK6MoXm4iPvAEhki4SHsG3LeJsT6x3qm2wmsqZNTD4lv/A8ZApqPR5Tl/GyF27L/OhtQQGHaPo4jpMVKTV7EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049735; c=relaxed/simple;
	bh=h8h03jW7jbh9t1Xd8RfmhjUAr33pBWG32EOxhnUKTDE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GCQF2c5n1Mib7JByysReRCjpLFBhWkfQXp71HboiNNGWN6P+qINJ1ejyAip0e27zupE3mUd7OMIgbvjT3lsPo6p2DxlXXOqlGmVP5Ifc8vCdn2yd4tGJTCJS86gEiI0R7y4TCVR/uUgKyahs+LYpOnACGLR4sLPTfxjKhcYi7A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Pde1JZ8o; arc=fail smtp.client-ip=40.107.96.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pde1JZ8o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBDHO3zwpxIU+N/pMg6uFsTyyTTR8aKNKupx45C/pxICzhHoiJoL3V0I0I+ZgpGTm2atHFHacksxPi1YrQAAubF7yLV40SZ6JhIihhoCqyIAGrbmuPbkoceOsOQWngBtj5s5v7YHwWU0PDacpL7S8CP0FCXpgVgH9Z4jQ9EjUoPhR/8/58AssoscIXAHnmlZwJ6lMUpLp/O8+ruhlcfP+nmPoXdakQHepDa+l6CMOfsROzDDljL/LKhG/cr5EYJg0dY6/tiQIJ3GW9SiLIN7VzBiI3to9jiECRep/F+rhtgef6hVUTh+ID3XdVF130nY26x/JLQ8cqUvjeZcrCnXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Syuy+FrTDBFqs35ijphMVkREdfC4yv1BDhb/hm2YKGs=;
 b=RH2DlfWt4s1txeoUsAjWRSRptX+GaunmtpHDvKd2ze3mlO115x3++njcQp0PvRjT5MofaLu9rhBX9Xex4so9q6m2b7Sv/Qzd+OiXUBwF3Q+ChOBIeS/5GGextS2uUaqwc9vLRge8vrCVTM78w2/LLbq+VCcXiiHZyfmb6txoDqhbYAH7TzWGK7JLdgdCy/3M0mtqShYSbZK3Ln+ZbA5+yB4J3MO5ZpONhn7XUNKmq84ZmMsbSKIjHq/h35tYcrhJQDEJYSEVhy4sqvJX+8m//LJQvl6YfI7DQX7IpimbzrH2ET2yOdou2kGYSuWjK02Ii1KPNFHEdUZGdQ2LEOndKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Syuy+FrTDBFqs35ijphMVkREdfC4yv1BDhb/hm2YKGs=;
 b=Pde1JZ8oDg4f3fv65iLWhCt+hHBn3vwTNfojmOtQBcKqKhAupMfexIavkpEWWSujXUz3LG/uwP3uYLuXUCImIC6WIokjXl7ZCX/dXmtleTwpBAyt0mF1T0ZRasprDoUNzPT+LLv4gTS+ASWhSYnKkkHU7mV34ZmUnMWHChgGaeE=
Received: from CH2PR17CA0001.namprd17.prod.outlook.com (2603:10b6:610:53::11)
 by IA1PR12MB6211.namprd12.prod.outlook.com (2603:10b6:208:3e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 07:08:51 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::5e) by CH2PR17CA0001.outlook.office365.com
 (2603:10b6:610:53::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 07:08:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:08:50 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:08:48 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 01/10] platform/x86/amd/pmc: Move STB block into amd_pmc_s2d_init()
Date: Fri, 8 Nov 2024 12:38:13 +0530
Message-ID: <20241108070822.3912689-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|IA1PR12MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e5c706-6a6c-44e1-2a1b-08dcffc432b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YM4rBQT4HrUruSGqJkv1hGAj1MlG4Yw7UM6dc/hcovg8UCTjVHJHeFzdfm1/?=
 =?us-ascii?Q?UpVbRNis1N4lTpRemD3oWDuLg94/qRoGE6Vm+eDGDGB82T0FmmuNNdtNzB9H?=
 =?us-ascii?Q?rPQ1TmM7JPFp/t9VkKOz9AKOSnDO3wVCKRE4FBnjxCiiUHcrNXGwhHP5z2pL?=
 =?us-ascii?Q?fKG+9rYZtIAsGr1XdVZQweUtzYMyKhTaHVgfjFukfHIzv1R3AHDO0rcpHBYs?=
 =?us-ascii?Q?qgeDWfbNZGrT7UEzdD0GNZLxT8idVsSZRd7XeazUYgN+6Fsjyb+aY7mlcSFl?=
 =?us-ascii?Q?1FdGHB2wBphHpjaqWz0sxCza28rOXPDXaUvubutflgOe6LssQxrtQA8nrq1K?=
 =?us-ascii?Q?RhbR7CCqx9RKOrx8O5KuNROxeafr0f/GtQpYVk9WLioJVemPOqDnFu1I58LA?=
 =?us-ascii?Q?HveX6SifecSyK6pp1exVDolhZ8JsOlQhhpiQkuq+WeOjrqvNyxyMNODA97G5?=
 =?us-ascii?Q?URh5+wkfZTI5sb6svoo2WM9if1gfmMisQYn7QFsXbb5l84HvXq6wyY98efWw?=
 =?us-ascii?Q?4l6fUTgsFWQd6fJwBFCFr6Gn0QxpL2GvEY3xPdMovjGzNrWa2ikX8qa73tI9?=
 =?us-ascii?Q?XYcbnvIDlWRcfWPCYx4O7vqRXYfkIq7SifKBd1olrXtOHUSf1F8iI7rwIO7z?=
 =?us-ascii?Q?mBHj8whN5BW8yAR0a6+2yjzys0nkhQlN5imUlutBsLWh3bo1V4kCAiByPkmP?=
 =?us-ascii?Q?Ggf05w+zpQfzQ03XSThMc7bdBq7LHSFz6m9bZZ1v8zSJoEHPD+zn2ZvQDqb3?=
 =?us-ascii?Q?nD+gKdafse+0MVee19eD+3vKb7AK0zYsOaB5wJZ6He5JIEJ8RJJYNhSBcxgP?=
 =?us-ascii?Q?aLdMYO7HV2fE8Arf/zzi46m8+TDu2cWSjpcMuPhV0o/gSVhGHtmwrAFwKWhl?=
 =?us-ascii?Q?5N1IqOUcBQo2dNDH0Jv7byPqpdCALGgOXGWVWqKRintwaLmUefe+w6Lrbq6G?=
 =?us-ascii?Q?GWdij+tYdNs9XQ5fqNOUMi6kJimfwS3YevSgg9hAa0+bvVnLzH2pxBC+xj2w?=
 =?us-ascii?Q?QfGP2NNhDGnDF80Nqkrn9rQDjQ+/FpXImA/gdgxw8OqkkJ+CloIgRkUYITlE?=
 =?us-ascii?Q?ATv0RDOxYeBfayrdkAfezH94/Ymnzq/XSKZq2YdFAZJM4K7lQqnZfI7nB1dX?=
 =?us-ascii?Q?0Pu8tIRTKAwYgIVgm3FqynlDC1j5m2xy7RoBd9GNt1+bhdE5Cn48Oa1ysBHN?=
 =?us-ascii?Q?Pwusw7X1YgvGfagvfkxEMqtlrj0HhlL5Pp3ka1ZM2D/FK/53sIrIWb0Eub2M?=
 =?us-ascii?Q?ba1/cUJojoJooBOaiRHAtoKd4yTolvoFW7tkQKGmALe4liEN/iYctp1D31n8?=
 =?us-ascii?Q?Lxz94AeR3r+tSr6wuj7GTP4IAcXz7ODJ10lEsQNfMOiTQoKusaU/51fhfIOU?=
 =?us-ascii?Q?/U6mIepwuNQTbTPAHJ/aVSTc3NJEY1VmZwPHV2T1O6qnDb1JaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:08:50.8655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e5c706-6a6c-44e1-2a1b-08dcffc432b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6211

Transfer the support for STB-related file operations to the
amd_pmc_s2d_init() function, thereby consolidating the STB and S2D
(Spill to DRAM) functionality in one location. Also, relocate the
call to amd_pmc_s2d_init() to occur after the creation of the
"amd_pmc" debugfs directory. This ensures that the driver's root debugfs
directory is established beforehand.

For older platforms that supported S2D, exit immediately after creating
debugfs. These platforms may not support the PMFW messages available on
newer platforms. This adjustment is necessary due to the relocation of
debugfs creation into amd_pmc_s2d_init().

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 31 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 5669f94c3d06..0c089174b0c8 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -648,15 +648,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &s0ix_stats_fops);
 	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
 			    &amd_pmc_idlemask_fops);
-	/* Enable STB only when the module_param is set */
-	if (enable_stb) {
-		if (amd_pmc_is_stb_supported(dev))
-			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-					    &amd_pmc_stb_debugfs_fops_v2);
-		else
-			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-					    &amd_pmc_stb_debugfs_fops);
-	}
 }
 
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
@@ -982,6 +973,18 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	u32 size = 0;
 	int ret;
 
+	if (!enable_stb)
+		return 0;
+
+	if (amd_pmc_is_stb_supported(dev)) {
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops_v2);
+	} else {
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops);
+		return 0;
+	}
+
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
@@ -1100,12 +1103,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
 
-	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
-		err = amd_pmc_s2d_init(dev);
-		if (err)
-			goto err_pci_dev_put;
-	}
-
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
 		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
@@ -1116,6 +1113,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+	err = amd_pmc_s2d_init(dev);
+	if (err)
+		goto err_pci_dev_put;
+
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_init(dev);
 	pm_report_max_hw_sleep(U64_MAX);
-- 
2.34.1

