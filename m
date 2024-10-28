Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401C18FDA9
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099118; cv=fail; b=P4e8komjMhS7kYSKjWeyGGprO2LWDUY1imCbdFmGh8np5jR7lJOVqlLFQwxSYJ0YH4f1+gM+5hr1VATQSeVP3rs2Wkt7AaZhOgNc9sdR6g3NIUNKNjDZMVf5BjSftuTIJlPaH0hDRM95/LMuXjzVyEmANj/DM3KZGW+72AItmk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099118; c=relaxed/simple;
	bh=CSBAXidFgMOCvEEUtdfATHeu2eGvy8A4XS0DZ1Hw4Io=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdLIGYJxA8m5/IJQ+PuOMO1YejFBtNZNblTGi5YmeWsahvkJpdTaro5KVCEx0YsyyPhPInIa84QfN3e2f9oIbJb31BXIJwdrqE9HEXAxOJ7I2UIroFfUbZTrK4V0iqAlHlM9GFmpmoQ2zIQb/DAey3Kfrpr/6nNi32RVFbzin3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1Pgrc79B; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1Pgrc79B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHfDAawU4NOlq5n4S7hT/baqmEmDxQ9U4Xjt8EJJ8nQJh1qrjsq8X3iI3R3phAbjeoLCCBP5cPDWKMn8a3+3lYizNBAkMQnmfsBiraCLVB7ix54/tAnHdMtmFCC0SwfWoJw5twdMe5r+etNg3m8zTZmidpVrOInmgAX4bmyL04/RJof+ysllQQxwwb4JYMUsNGYUaq85rPqgpr2kdbB4JlRGOjAGSwvOSyKH3zLOLp48/OiDi8sncSCmESTkw04u007YnAfhJPy8L+qK+mcmx3dnUWMih3kfQY+Oqtatq7TDdarxi/PnwM3+r0eMJcDCQFcmUd91VWVa+PHmyA0Jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2VVgrnDR/J+lx+trSxoDgKMPvQ7821oEf1GiG/5vUQ=;
 b=lbJ0Jfc8shZ5pui1uiXVlTVjPRpLTPxdd0D1ByC8yfCL7dwDV5+gKiet9HH07j6ZC2YAvtLgabn/ztx4XrHrJdts1kuVuzqTNfo/fdTZU56WWhZpVlRXEBFtZIAHyn3Nk98UQwlpvngoZIPHD8HSXin/5I6F7qXkgiE3pcj6t0RuAwGsjDVc+bcfZ78OR4M8OPJlgqbp0t7sMwpyurdCXJiiNxxtz9gBhlom8xbWBbW2IWzl1TG5D4TcLyJg5O4IJE18VP4VElKNqk4CkgYauuH6iZhogMeOp4vjj0NNEI9Vlgsbn+hBs3ajxOPApxwi/vkYC9D75ykrJWj/batmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2VVgrnDR/J+lx+trSxoDgKMPvQ7821oEf1GiG/5vUQ=;
 b=1Pgrc79By/vgs8HEOd4eOcaVH+gs3hx7bI0/gL3AA0I/0T2FefHkMrBKphbQtqBPNPO+60a3VgTYtINRRBbvwapaiFQrW/xG1l8cawC+3xWXjbo1eWCtm3cm1J8gb0LIZ4Ol2GHKgCDdJLUV++Ekc2leCkneyAOpOh5zcxpeHww=
Received: from SJ0PR03CA0132.namprd03.prod.outlook.com (2603:10b6:a03:33c::17)
 by CH2PR12MB4214.namprd12.prod.outlook.com (2603:10b6:610:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 07:05:13 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::9d) by SJ0PR03CA0132.outlook.office365.com
 (2603:10b6:a03:33c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 28 Oct 2024 07:05:12 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:10 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/8] platform/x86/amd/pmc: Update IP information structure for newer SoCs
Date: Mon, 28 Oct 2024 12:34:35 +0530
Message-ID: <20241028070438.1548737-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CH2PR12MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d6b0b1-95b2-4ff7-4a25-08dcf71ede52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?imNYkDumhJm+RfC2t7EBWNXORMKFtQpHMQJTsIXRc3oGnd59r0ETALnChwOk?=
 =?us-ascii?Q?Nekuac8vwf8Yy0dgEqG9EHacQm5IdCj6pDX1SaUkSfb9iEI7pLZLPrDQNNmr?=
 =?us-ascii?Q?cZzTw0jSY9bBiTbeHv9TfRPnr189GrfVgneeGnlFL8E16PKTp3OClI68VLZO?=
 =?us-ascii?Q?qOo9E0+Op7VdLMnY8ummQmjOLHNFqtlt0b6tUlmYXVoAe6aCb09l6fDMZjXB?=
 =?us-ascii?Q?YO5nOfIjX8cFekNXbL2NSFjSnsoKJERzwLpIyOkBvJi3MakHTPn89pD/1a4R?=
 =?us-ascii?Q?qSsmYbbLZU/tvojvXWK9Xkdyxn8bOOVAqE+XofZ7+U6mVPngm99bmSpd5pWR?=
 =?us-ascii?Q?s7etPXOC9Rk6th3ZmUnZXY8fpYpM2JHxTWKCk3JFVsroTNe2HQI1LMFkQxb5?=
 =?us-ascii?Q?fW/jnUa7Hid6+w5QjD4SLb+mm6aoEXMEgpZK87q5jHcNeCcao//4UAb+kt5e?=
 =?us-ascii?Q?RpudpH1rnHUvhyRJMQ7bTHs9BIEqTp1Vi7o9WUIfEyXxsGlgy4FradASBVcy?=
 =?us-ascii?Q?O7i/aN4yzAk0uJqkwXNaR4g7ocRpKXDrssX8xs7R2vPjl7ecah1feHbQPuzJ?=
 =?us-ascii?Q?t8h1Rm12eScYFShaSjE7SnbIufsmsJc5lLA7zyowsCTOdg60RYlPM8/Z8J40?=
 =?us-ascii?Q?9+e4iRwkx7Br+HqMnBWsSeMXFlkFCLDSGDAwcLgLi7cMOLJ/6bikJjO6LfnQ?=
 =?us-ascii?Q?uAYZWE9ESWVGvhgS8XqgteQX41nPiVNIEQP5awR0FcVOPNe5IxjJeYY+aSjs?=
 =?us-ascii?Q?JgRFs0QSFbWEVZvSSrGkTw2KmsBTgFpzZFAV7s2RlQoG1fFqgr7CEdvzU3iq?=
 =?us-ascii?Q?RJWAvez/TEyblK+Wjp1KJKXxnEjd047M9APt0ne4j5yEnakp376kAs6DjVXv?=
 =?us-ascii?Q?rqreqxnpMHpLpSEMsKzEh1uM3VZsy8qKLxgvgdfhWQq56T6x9GqavsJqDBxt?=
 =?us-ascii?Q?whil5lJDor2tV7OCm1NPX8dk5l+RZcW8BSpV+INHs693icfxbxPYvmta01LP?=
 =?us-ascii?Q?PVNdpW747jnkpbrfU8rHqUvUhvyCUDiSMEh+bNPOHfrTTNjDGhY5nIdyjbjs?=
 =?us-ascii?Q?KF2X+KqGjxfmz9jHDdh0hZdOezd+KB8qP95Wjsm7hb/yTYzYIGjxjsXgF6hL?=
 =?us-ascii?Q?lIo6un9L9l7vQMI1mP9ZwBXGkZA87UuMp/ldtILn1d5qtSdPpzHN4G7KI9Y0?=
 =?us-ascii?Q?y462uhMhPCh4Pyhm1xyvVuL5EWqc7moqfIFzx77WNmt2cD5PZRAPreKkglUW?=
 =?us-ascii?Q?5hgPnroR0+kAqUix86KCh15QzF+JqBScCtTi5KkXvgH8vLoer0LGcFE3GIwn?=
 =?us-ascii?Q?/nSpd2HCM1CcFn3ShjfLLqLnTI0PDZlcBkNDL3LWviU2NDx9VTDPd6BWejYn?=
 =?us-ascii?Q?juQHQPXCQKVDTZT+OOgwovlSJIVH/zSXXJC7zSAfFGWhCzGU6Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:12.9844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d6b0b1-95b2-4ff7-4a25-08dcf71ede52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214

The latest AMD processors include additional IP blocks that must be turned
off before transitioning to low power. PMFW provides an interface to
retrieve debug information from each IP block, which is useful for
diagnosing issues if the system fails to enter or exit low power states,
or for profiling which IP block takes more time. Add support for using
this information within the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 42 ++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index f9900a03391a..0bf4065153da 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -95,6 +95,35 @@ struct amd_pmc_bit_map {
 	u32 bit_mask;
 };
 
+static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
+	{"DISPLAY",     BIT(0)},
+	{"CPU",         BIT(1)},
+	{"GFX",         BIT(2)},
+	{"VDD",         BIT(3)},
+	{"VDD_CCX",     BIT(4)},
+	{"ACP",         BIT(5)},
+	{"VCN_0",       BIT(6)},
+	{"VCN_1",       BIT(7)},
+	{"ISP",         BIT(8)},
+	{"NBIO",        BIT(9)},
+	{"DF",          BIT(10)},
+	{"USB3_0",      BIT(11)},
+	{"USB3_1",      BIT(12)},
+	{"LAPIC",       BIT(13)},
+	{"USB3_2",      BIT(14)},
+	{"USB4_RT0",	BIT(15)},
+	{"USB4_RT1",	BIT(16)},
+	{"USB4_0",      BIT(17)},
+	{"USB4_1",      BIT(18)},
+	{"MPM",         BIT(19)},
+	{"JPEG_0",      BIT(20)},
+	{"JPEG_1",      BIT(21)},
+	{"IPU",         BIT(22)},
+	{"UMSCH",       BIT(23)},
+	{"VPE",         BIT(24)},
+	{}
+};
+
 static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"DISPLAY",	BIT(0)},
 	{"CPU",		BIT(1)},
@@ -170,7 +199,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->num_ips = 22;
+		if (boot_cpu_data.x86_model == 0x70)
+			dev->num_ips = 25;
+		else
+			dev->num_ips = 22;
 		dev->smu_msg = 0x938;
 		break;
 	}
@@ -338,9 +370,15 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 
 	seq_puts(s, "\n=== Active time (in us) ===\n");
 	for (idx = 0 ; idx < dev->num_ips ; idx++) {
-		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
+		if (dev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M20H_ROOT &&
+		    boot_cpu_data.x86_model == 0x70) {
+			if (soc15_ip_blk_v2[idx].bit_mask & dev->active_ips)
+				seq_printf(s, "%-8s : %lld\n", soc15_ip_blk_v2[idx].name,
+					   table.timecondition_notmet_lastcapture[idx]);
+		} else if (soc15_ip_blk[idx].bit_mask & dev->active_ips) {
 			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
 				   table.timecondition_notmet_lastcapture[idx]);
+		}
 	}
 
 	return 0;
-- 
2.34.1

