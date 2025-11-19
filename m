Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C18296BD3
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542731; cv=fail; b=pdc6ED26s/M3A94YiaSLP4WvN3KVbs44xR7ySEeT/U9ow4REEzpLaRcERlk2UARInwfAb/Dg0Soo1YEbVN92zbQ30jItNf9nNc7H/DldP5AOGQ8Ug0i3WDVzIdhTvaPyEaAht/T1Qj4OK+cjhfK3XIfso2X8qw9kx4hAmPlkvSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542731; c=relaxed/simple;
	bh=v4UAZOrMC65tZSH0tBg8rQL6ajYxqpM892AH73K3Gng=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mW73tjZQncdXkOizuj4MO9KvJ/YDzmLMos49QGoZ8arSlvhQiwBJQPCconG/B51bv9nmzW0MuEa8ZrHR6s/pxSRJu/hweIkDp/NtnP+8Z5nv5MWEqeIsTkVb05GWN4FAKk2XWP4eEH2a0yFe0UHInu+F9JiE3Mfe88HCt/IFwfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U7x2jfc5; arc=fail smtp.client-ip=40.107.200.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U7x2jfc5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUd66ENscKRsibOUo0zKkLqVRJxBx4eN/Hbi5XUUcbxaVTJiZkEeylXrlPV+WoZD749dv/Z68+woERpP75eeqi2jlYVRccmBtdQhyWwoxJx3HEPqvu2YY9ZGodt6YzeBkN5nDuB1XYNNbu7q7HjqpLNagEhoTUouhfVPyWN7Y9e3GkMCB1SSNg6wZvR9CW8z/InwB4j/rJKdhArVyOpdfsG4kB7y/O02aZXlMyNKfQevX0Po+ooMwqPyBH0p47BG3I2oS1g3SDwjkBynuaxtmj2v/EVpDi9NdCtA+Rmf1BL6yuIxkC9dROxTdVzZusw/v7DITGgpQZQ1GVNASa2/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPDhbZTz0WwInNI/kC0HQ3qr9A5oFjLN87QUYwa96vs=;
 b=EfLYGyLUyEsx7TfVwntVSNVC4qo3sCGgPlXyKWqaNBgjSZVGVJUETSvgSoH4NZZFtKqW2AFSlanaPogRaC4Yamhn9tiIzmRuXblQ/kAv0T/6c6WEChvYps3ZS2qOQdNbOsdnD3+GCVF+COJKDA0T6cc+q3zb3zV20e2DE6fwbt2e+0uNTJ/a1VyFMEuYiT73c/nX4HVE4nUz6YzLLRieRn1h6nFckA9QiQim0HuJVd7dmO2gG72WYcdOOIBMlH8M/gsJBDoBB0xUiCvx1ZP6drtxWczmFW/RcvDeWvQOwBEnRSAdm91DasEz/wSjqAMM2h/EBLVMlM/5O3teyYYZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPDhbZTz0WwInNI/kC0HQ3qr9A5oFjLN87QUYwa96vs=;
 b=U7x2jfc5xQLVv/aRcnAapPdOlqREyQvzVXpirzwbj0fmWmowpvF0ubiwcfnr0H9eZk7K29rh5NpGwFTmk1U+l1rmWKfrR6YhGou3YB9rPXrY93l0Ev4dsRVSNnnMyxLCZ/suaarqMrkRYTGEuoSZUo2cNZsZr7frTOMQcDRMKnU=
Received: from BL6PEPF00016419.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:8) by IA1PR12MB9521.namprd12.prod.outlook.com
 (2603:10b6:208:593::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:58:46 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2a01:111:f403:f902::3) by BL6PEPF00016419.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 08:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 19 Nov 2025 08:58:46 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 00:58:41 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<superm1@kernel.org>, "Yijun Shen" <Yijun.Shen@Dell.com>
Subject: [PATCH v4 1/3] platform/x86/amd/pmf: Add BIOS_INPUTS_MAX macro to replace hardcoded array size
Date: Wed, 19 Nov 2025 14:28:11 +0530
Message-ID: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|IA1PR12MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1e3d66-a893-40e8-1a0a-08de2749d90d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NV9j4VGwLi9FAtRE6xjfpph2Mz13Rw3c1at1F5hyyM5uM6+38aWVw9nhl/8a?=
 =?us-ascii?Q?E407UPeeE8u74GoPbGm3htakuevlWskligWHYXPGE+2u80J3aL687dEqonFW?=
 =?us-ascii?Q?CDu73ir4ghM7c3DlMWNRUuzurRWzlP26EdbE7MQUtCySjIRklbbi4HImIQol?=
 =?us-ascii?Q?/E5G9+Gb17sjYAheRh9ErlbFK91O81vSqSIgSfOw8Iy3aYwnsCTFkFO/lO2F?=
 =?us-ascii?Q?z1cJeszvAK/UMoJ7/TnnFxM9a3JpTgxrJjTRupdn2PzaByheGkRRoQ51OemD?=
 =?us-ascii?Q?vFP1GQ0b4iHBc8EGU4cMHWeKw5Z7nePtGryaiEB93OMzDn5WxeQ5rD4a+dWq?=
 =?us-ascii?Q?cVC49GSPglShGFByjsMJJiQPHdT+l7dbbVnHN9dfDfKkpuErYj2UWcjvfAZ+?=
 =?us-ascii?Q?K56/VdSCArwHX97RUmk6qvJv/foKGtAb90uK1SPcrAN4ZIpJ7Nli4qJo6n8Y?=
 =?us-ascii?Q?o8pYXCj9DOP/Jn9U8KIiaUhnv9K2ATS1rn8cE6g0XaVOx4aLnC9yRMoza3mL?=
 =?us-ascii?Q?BVblJrCwjb9ThLFM+xSPo+zaNudNLyAnS73rrVBon1ZYK3iCUtuFfqghpj2m?=
 =?us-ascii?Q?GPTahsZLky9zBaWjqiiwaZ2uG2FJMSuyTHgacdA2Qr7svddHJUDT4a+IhXjM?=
 =?us-ascii?Q?zDoI9h07dG0ljxFIxfcdRLwPdVoMkHS7QBeuWTe2jY1O+V1csHvO6nkFHv6S?=
 =?us-ascii?Q?2Gxm1JQs3wMusWHpJRPNp8PFcAswvwz5HCoHdnbCVdk3QKneNr8A2vlLBLbV?=
 =?us-ascii?Q?BjNpHgperH8uYmWxBDDBiSMiXwmzPL33WlM4cwwnDIwJogdsDAuuXWGCDOS1?=
 =?us-ascii?Q?h9jlF+TK0lK6AEHZWS9mesNCrxBUcLfiXl1qbTnRswBl+o4OXjZdJtFn+XXU?=
 =?us-ascii?Q?YMtl9yFUvl5ozGo24PlAwTrGJCVR9SVtfd8LZiO51hg7snvewIGFzYiGQS+D?=
 =?us-ascii?Q?yfZIkXsegJsssgAprVp7UblZs9mwJyBVG3FYh33t9VBJth7XGLHhtpkadwIf?=
 =?us-ascii?Q?R+rVS8eWm61ayxqJjkcOkELx7lPCVsZAW3vv9tYU6ECv+SixgFbEknO+FBl+?=
 =?us-ascii?Q?etjnFM2nfwu36Wte5KRupPK6h/wDVNMmrwk06EuUwrmsoRWFsYUqVzHih4tq?=
 =?us-ascii?Q?PzjoErAYLrNi48m+B/je8kjpxsleNRNrv7mPJefU1TS+TdBxmF+KdnKyhZI1?=
 =?us-ascii?Q?uDLMEvdxi1NXxghpN+yaOgw1Bl8ZzgDzVv3Q9oivsKejBgFszLvXfXYUqNS4?=
 =?us-ascii?Q?JHiQQCjXCbK+dADAAcVf4nQ5PfhWCfDT8Q/RgXPQUHT10nBF3rFtEAZBSlSJ?=
 =?us-ascii?Q?EEUxUBtT530T/FtUhOio521aaQab/nJMYDMQADrORyEUG4XiMab2RDNdayZL?=
 =?us-ascii?Q?SXUBY4UUqj0r+ny2j4v/5+CPLhjD3rWeEhDKOZbkXi67geqqXUGhKfev+AcK?=
 =?us-ascii?Q?HmlWMEq3Eg99iD/9i/oxXQaISxUMxW4Qyah0RY04D0awovesQzPw38r3nie3?=
 =?us-ascii?Q?S8FAEKkOMA9iXt3EGMYugEZ7TQwZEG72WJeagGudd6rfpBf3/MiRpIizcALW?=
 =?us-ascii?Q?uMmZmvIKNf1bvsgleQU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:58:46.0361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1e3d66-a893-40e8-1a0a-08de2749d90d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9521

Define a new macro BIOS_INPUTS_MAX, to represent the maximum number of
BIOS input values. Replace hardcoded array sizes in relevant structures
with this macro to improve readability and maintainability.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v4:
 - No Change

v3:
 - No change

v2:
 - New patch spinned from v1
 - Add new BIOS_INPUTS_MAX macro and replace hardcoded values

 drivers/platform/x86/amd/pmf/pmf.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index bd19f2a6bc78..2145df4128cd 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -119,6 +119,7 @@ struct cookie_header {
 
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
+#define BIOS_INPUTS_MAX		10
 
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
@@ -204,7 +205,7 @@ struct apmf_sbios_req_v1 {
 	u8 skin_temp_apu;
 	u8 skin_temp_hs2;
 	u8 enable_cnqf;
-	u32 custom_policy[10];
+	u32 custom_policy[BIOS_INPUTS_MAX];
 } __packed;
 
 struct apmf_sbios_req_v2 {
@@ -216,7 +217,7 @@ struct apmf_sbios_req_v2 {
 	u32 stt_min_limit;
 	u8 skin_temp_apu;
 	u8 skin_temp_hs2;
-	u32 custom_policy[10];
+	u32 custom_policy[BIOS_INPUTS_MAX];
 } __packed;
 
 struct apmf_fan_idx {
@@ -355,7 +356,7 @@ enum power_modes_v2 {
 };
 
 struct pmf_bios_inputs_prev {
-	u32 custom_bios_inputs[10];
+	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
 };
 
 struct amd_pmf_dev {
@@ -451,7 +452,7 @@ struct os_power_slider {
 struct amd_pmf_notify_smart_pc_update {
 	u16 size;
 	u32 pending_req;
-	u32 custom_bios[10];
+	u32 custom_bios[BIOS_INPUTS_MAX];
 } __packed;
 
 struct fan_table_control {
-- 
2.34.1

