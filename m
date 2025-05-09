Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D1A55
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775669; cv=fail; b=TpIeqarPxF8h+Q3Lnw45cNflphlmOD7pj8jvku70S4A/n6pFD5jfH2R/Gahw+1HdlOVDK9EW/50oe8O4BidxlOTd9prWCoDnYDzM2yd3FVpjW98lce1j/HkFOJ8n++kU+mhGc1ELgH9GYeIcnEfgvDsPBx3HAdBsagw9BoFzUzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775669; c=relaxed/simple;
	bh=FbNzRVkuNqJXM2QKdqJ08pfOARjiY0Jc2BC7fXLSkzY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lu0bCktn31izhqj7LVAEzUoDNbNdJjbrzf+QEdDDb/MavscMpmw6vQPkYOCyJVgKD8BDOqEfQkFvxojz4DvNmmDkMs6jKnr/le5xkxLpJ0dbREJphN+ghBrDHn8meaqbCcZ+/Qu4dkPecH9C6/WHkD12sH+9N4K/g0LUlv/fbdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jJXJvxKI; arc=fail smtp.client-ip=40.107.92.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jJXJvxKI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iG19k8UWzFuOKyYv1mPOw/8Lv6w2wYsVLL2zy89+9d3NkJ9Skm4fOES4nXgoaEMCQJHDkClTwMtHzX4gIBJIgtOBRRWTB/gIjXlFnHVce/Zc4gH3GuaiCXk9u6ds4Tt8dfSZKp2Xbbzt1LFI4dS/pl4/nFsxPlEUDeGM7gBaUkfCQwypMlxjvRgWup1MRrbomk8Oa818R7LXb0iHF4g5FMLXx63PYFKmkjNcxx3ss858c4SngE9HsODbx+7SCNPdPTTrEKCji0SXNMxdE0vu+gSCvssxfLfOz7g2uK8yZPDJwWyu9uG074lW+USxcJti49pJfD/pJ8cUSjCtectHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zLkI+iK9bXuQIi3Ww5FLjG4CqPH1Pf5LvpNRyOrf10=;
 b=DfLTZZMEXKZ9Z9BIdGxf1S/Hg3JkiH4vcHJqdl8N8bltwTcH8n5h5WwBDCzC/HB96b0HmVPrZIDhM+5mIYewSt8iTPAcB2tlfN+Kid3RFFwq59R9JpwprSgmOqn0aUOLgssetUFJvoj1q185VFfDnJYyCts7CsrqrADWBjYrdg6KZJzqIzrJE3A9tx/rWs1wdbYG/TD3RUnJDgsmLqaFmaLYFwyGw1vIN/Y5VstgoAWBsCl9lvwudxCAHH4fwLbggr6/Gpqsc9MhYAshw1TYYKdycB7v5FwVT2N1i32Mav7Ye7qC7/ZK40acyas18CRR23n5dTEkLNTzaNtCJ3V+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zLkI+iK9bXuQIi3Ww5FLjG4CqPH1Pf5LvpNRyOrf10=;
 b=jJXJvxKIczbUJgFuGqG0aJx4QlVq38xGb7xcvb/0X4/TAKKdMbQ2N5mCk1noURrGxxfgmiaaIYjUkxaAMbV3oxGhfmbCPfA1BssgZDqd/cu2YqFhAIKh+mHTopVbCyvpjaTpTRXcBzgVWK42TvEu5mGtEHd3cJ3OybbtsDyMjGQ=
Received: from CH2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:610:4f::24)
 by SJ0PR12MB8116.namprd12.prod.outlook.com (2603:10b6:a03:4ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 07:27:42 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::a2) by CH2PR18CA0014.outlook.office365.com
 (2603:10b6:610:4f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.24 via Frontend Transport; Fri,
 9 May 2025 07:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:41 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:39 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 01/10] platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU thresholds
Date: Fri, 9 May 2025 12:56:45 +0530
Message-ID: <20250509072654.713629-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SJ0PR12MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ce173b-5392-4d01-4a60-08dd8ecafc02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uvqf7s3Pt9oVdUTMHHeT+gGpJt80IVlhdUebnodpG+Te0zujskJ++PEqt/jH?=
 =?us-ascii?Q?H2SQwQD/BJjaiOgUSbDkz2QGHdqKZLFiZizn/DR2frxQuyM3zbH2X9FTeASM?=
 =?us-ascii?Q?G1shp4vW/oyb729xiktdosvZN2NrSM2qcP/YL+fwOhefZHoTOgpp63vLKUib?=
 =?us-ascii?Q?VSIKdwHfcWd8hrkjS99dvRAtPEsOYDJEKlnfAFIhSvbrlMeX+4NmAadVvfrj?=
 =?us-ascii?Q?rEYFCH5Yg/HXWxv5W9X+MrSfiXkmqMD5q6ZWpQNUGfXKmjEGxl/bb6uBBgLV?=
 =?us-ascii?Q?1o4uf1MEOXk1QKGcetyrHsZW6j9VJczxh7DPC9b8hFZLADlXUUD0v/Gl9XBZ?=
 =?us-ascii?Q?gVLd2KCkWLqnQqN/L+3Ts8jX3Mu7HTBo5BPpNnznUCWIhO2wYF/lY7Fnq6Pd?=
 =?us-ascii?Q?lnRIysuz0w5Vew8oTvw7+yUPBbGuFvWJFGAVoJ589KLZMPNRh+L8zhcEmv22?=
 =?us-ascii?Q?TVatGFv3fRzEgpWIfIReW/puW/j/Xh/BpUBxilA7lhtYFRs32ic+7RE3wLrq?=
 =?us-ascii?Q?DHNhxe/MM84Nj+gUCxJrXHbmK4ynqzdYl+KPDrag6Vib8dqY9i5Fudk4H3Av?=
 =?us-ascii?Q?KGxq6e6uGRaCQbvfxDupaGz1a24RbjiqoIAm0ulzI107dOxupHs08TO7schT?=
 =?us-ascii?Q?U9bJA+ii+5SM3IRPPxEfcGUzcSuZGffpMZg4uSJ01jHnE5e7t/BG9giHYc+6?=
 =?us-ascii?Q?fOmc5JkSlKF4x3O1mIBEYgbyti6GRNyfjzXnys9/Yzez+0/Hg2PN5+8DHxya?=
 =?us-ascii?Q?6YJo2ejrGC+SdNJgr/6UFEhR3Jn21ZJ05k5jhivjm2r8e4e/UM+YX1kGQNix?=
 =?us-ascii?Q?tFfXJGYMttf+gz9xEVIvqaVp/s3/op/tCXygcT+rcihwEyENJCDLJYleHzmg?=
 =?us-ascii?Q?E1dps4mpVayTwyjN1L+IPGSTUSG3TVqEH7mikrJhJoR6pzTQKrlJ7d7Xr517?=
 =?us-ascii?Q?nimveNJ4dSff9AjKjFli7THhndSX0lgu0dBFhAy/4VR21GTCKXgRXya7A3zz?=
 =?us-ascii?Q?TIMy+7TalOGeyUuGN44SH/bIt9QMw98MvPFAgFEGTAW7mGscU46Ck/AySIek?=
 =?us-ascii?Q?0MVOLshmsBWqs55DXCxaUN+syOKVPm6flyFe5WWazvkg5X/1MFENOM6HD6HX?=
 =?us-ascii?Q?bx61MxjG0vkjRsn3y+soZ1y3CmPiDi7tg6941PybS6e80YMWR58fLh3y0Ghl?=
 =?us-ascii?Q?/eZrtbnY2hKqtij7yIgW/ZNDo2dlRRKiDCNgfbdOq+oeOlA0fDJcIHCmwxQd?=
 =?us-ascii?Q?KK8F74NMhINE+Ppm5YGUWnLwmTNnndh99vOIJIaGALKivqqoNWFcbP/HDGSc?=
 =?us-ascii?Q?4nbeMCciccbFx9XIliUedV+CkOCUfLutAyWGwuDonSWrwuuT3TLzkAch085Q?=
 =?us-ascii?Q?Qu8HwbgX8TMWVpntf76mflH8mWWiOnnyqjv1MgiJ5GRQGbj6RhZC8xyrA01E?=
 =?us-ascii?Q?v5i4Da3cLRBPmCBIrKlaiaT0fjzmue6pNN0+0hApemDWK52il82DzPURhFHS?=
 =?us-ascii?Q?OSQgbrqWj1eA7W9XBtRQfCj1hsvchrNYYEAg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:41.8472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ce173b-5392-4d01-4a60-08dd8ecafc02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8116

The most recent PMF Trusted Application includes enhanced features that
allow for modifications to PMF thermal parameters such as PPT and PPT APU.

This update introduces the necessary driver support to utilize these
capabilities.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  4 ++++
 drivers/platform/x86/amd/pmf/tee-if.c | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index e6bdee68ccf3..4665e68e5c07 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -93,6 +93,8 @@ struct cookie_header {
 #define PMF_POLICY_BIOS_OUTPUT_1				10
 #define PMF_POLICY_BIOS_OUTPUT_2				11
 #define PMF_POLICY_P3T						38
+#define PMF_POLICY_PMF_PPT					54
+#define PMF_POLICY_PMF_PPT_APU_ONLY				55
 #define PMF_POLICY_BIOS_OUTPUT_3				57
 #define PMF_POLICY_BIOS_OUTPUT_4				58
 #define PMF_POLICY_BIOS_OUTPUT_5				59
@@ -677,6 +679,8 @@ struct pmf_action_table {
 	u32 stt_skintemp_apu;	/* in C */
 	u32 stt_skintemp_hs2;	/* in C */
 	u32 p3t_limit;		/* in mW */
+	u32 pmf_ppt;		/* in mW */
+	u32 pmf_ppt_apu_only;	/* in mW */
 };
 
 /* Input conditions */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index a1e43873a07b..679c5bf5faca 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -145,6 +145,22 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			}
 			break;
 
+		case PMF_POLICY_PMF_PPT:
+			if (dev->prev_data->pmf_ppt != val) {
+				amd_pmf_send_cmd(dev, SET_PMF_PPT, false, val, NULL);
+				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
+				dev->prev_data->pmf_ppt = val;
+			}
+			break;
+
+		case PMF_POLICY_PMF_PPT_APU_ONLY:
+			if (dev->prev_data->pmf_ppt_apu_only != val) {
+				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false, val, NULL);
+				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
+				dev->prev_data->pmf_ppt_apu_only = val;
+			}
+			break;
+
 		case PMF_POLICY_SYSTEM_STATE:
 			switch (val) {
 			case 0:
-- 
2.34.1

