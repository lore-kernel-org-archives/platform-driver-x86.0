Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F15D2F99B8
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757929348; cv=fail; b=sf6RDDphBJdCdwdlgt1R5v9rrKjqcheOk/A9tqUo2pGWZYZ7GuEEF5YakujfiWfpjGHSTtczE9G0HBTvZW2plSBf7FvEscLH7wDmTD5G3b/IzFiUb42xeag8b+vKMfzYpJdQTpNt71ICTKrMouqMhrIIpTvvJIHzpGFHgyUDsFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757929348; c=relaxed/simple;
	bh=q6yDTudTQRpyodWQs1OJ9m8orUGuXKDRoa9JuN6C1B0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qv/SHIC3vMjg8DLcVy5gr6v/DoWBLfTC/UQVzTrBre3SepghTLIRkzb86Unoa8TFcmibw2wrHFeD7iZgqMdspn1nvXVzwfpSk1QpA1vljHgubBbT2fiC9DN6N5mzcDZ+4FoLJ+Emh+iVr1ktGXnamzswW0jFiXvruFWnaYrqs1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L7pTxoBf; arc=fail smtp.client-ip=52.101.46.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L7pTxoBf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcWiGL1f2wjF5QUEf4ipYdC83kVFRNti2D5PvRhacBV6wDflWFJaZVRiTO0Xy+a/7RaxrcEEMAJF5UAhc43NboFrcKbY0fnZAiHz2W1xhpAON9LB1rBzZG/L3G7ooz8fcAOEmpuU4epiulIyywl5QqM+qNA9wY9lr0z3JeHL6o7/02V0uktbmuHSUI7VNfByuNO+2NuUr45rXfej7DwiS67mF77qlu2KUxEWIjquy4Hbxa5JGvdaP/5rQAcBfMOmTcrVDiA1cgK6CWKOOqAuS61p78j5RJFJtBPCj5Wtos17G1EOlMcxU78YXrgBpc3B0rx3yTwRLI3H/zO07SqWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlCb90iJXN5RdbeLko+nfaon9KP4S/HLu5V+xACEVVc=;
 b=TngH/rPY50UMS29obfw5qwQX0GSLrMNjRK96A/XwwOt2KEjy5SPOUO+HU/GnZiCPDCZSlNDXMjprdlJ3WN0IKq8Zgm8B0R/f+i8ziUmOkh/aYbe5Mf3ZMfAFQ7OKXU/eZ/i190jSITfx9G2uH0Ho5xO81P8WaKC59C4yj2cmB1cxDauObEM1ZykGHripDW+c3c5GViL4ZivzpKnI1MOYICp25/503uyscWsxNY0fT/RJwG+rTzu3vj5fEOVv6x/YO9pnExqE1X+CYWdSdXRZ3UnJXzDcJexr8h4dVdmwpnWXQn8OSevrXNpeOeGX1qs8+2vd0ULX3W+SNGGRlN4Bxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lyndeno.ca smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlCb90iJXN5RdbeLko+nfaon9KP4S/HLu5V+xACEVVc=;
 b=L7pTxoBfrsuLNlU8ltL+ZknaMQ21jZrbWCuxWl2Gqn/SxoG0IAEXu2SElkSehUl/h92HUkPRtsTh0nnOgWEN+F3zSmi68hvw5cbayjrHtZ7qdgiwpbH0dbJPjy8sFQI2/MlRC79c6bYJJC1V2xxEpC4w8iULNnVvDG6oRbz2VOs=
Received: from BL0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:91::27)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 09:42:22 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::a9) by BL0PR05CA0017.outlook.office365.com
 (2603:10b6:208:91::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Mon,
 15 Sep 2025 09:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 15 Sep 2025 09:42:22 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 02:42:19 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <lsanche@lyndeno.ca>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH] platform/x86/dell: Set USTT mode according to BIOS after reboot
Date: Mon, 15 Sep 2025 15:11:54 +0530
Message-ID: <20250915094154.2765361-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|MN2PR12MB4142:EE_
X-MS-Office365-Filtering-Correlation-Id: 51436d34-27c8-4732-f5b8-08ddf43c2b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4OY237IuOhP+lEG+Aj5s78iwGV+2JiRPEQsqCcfy1ZDEHV3+HvPL4RWh5hTX?=
 =?us-ascii?Q?mWM3QmAPAuJee82qk0ZOVd42VrYI6xJCgbsPbMUjeKC8Ykd+XAbtV2ZmcLXL?=
 =?us-ascii?Q?emoA0tosWwURZrCiU72khofhYyvG7Egq0krQvUB/kZU6NuehldMy2WHNwCbm?=
 =?us-ascii?Q?lhrjdoosmtI8Di/hSrS7FRtF09DABRekKa7wIfYif9IHTojYcGfJ6UXeWh2W?=
 =?us-ascii?Q?ZqAr5mgtgumDKTf4YypATSQUSgQ2pHW/cdCwNUTHQX/fI6Oeg6z8ZynmMQKe?=
 =?us-ascii?Q?CTypiPndL504uMySpf7kjmopq9xFI9PSdMRd7nsFJwnycjmmBjdKNrPMaOLG?=
 =?us-ascii?Q?qLm93LHKM7GEZWUuG3VRjIWoAlJNOoO/thHtL7Q9NY9vJATLcM4pXuFvnNKF?=
 =?us-ascii?Q?XR53B+aYzd5o/V31s9uroDI/85xE4iJrvZ5m3/cqKWNpcUZggRlDJtIVA65o?=
 =?us-ascii?Q?TkQ3HQ3hMitKCqtwB8rToMEKF4gl1Pjgil9yCdXIPl1bQoMiP7ab21kHVNP3?=
 =?us-ascii?Q?hETFhT3zwVLOxRn+V6B6rKpjmUX0gOkISiTm/00UZmSC7JnSnLO75mDiXGIO?=
 =?us-ascii?Q?mCxSL8gGGDMy2Lx5JODtX6LD/o2TSjEDemuNJMvcEbp5eB3fol4ZWp4vRkde?=
 =?us-ascii?Q?xiJ4BogTAXEFvZt6VL0gDgxjjKv9nrovp+c+KKxswymFTmfNKihJTnoHTlXb?=
 =?us-ascii?Q?1vlTf8AXPEC3t8i/6TIINhGny4enuVK4jjjev+IDOdHz48zIK8Yoe3DA2h5p?=
 =?us-ascii?Q?ZyhZ/bThLencFd//3pnQnrDWI9P0Uq6vvP7HyilXbzCuF2jTX4/vDY6puEvZ?=
 =?us-ascii?Q?B8/MTXYdguVGUl9cjP1vQnEAEKBnDdjxWjP7uqCQaQTHX+4ZKYa7Ez/USGg5?=
 =?us-ascii?Q?JtK0WLcugDbMU4xHw2U5/z4xu16+r83PMr2bLonzyBp5JKkd48xHsa+0fWCJ?=
 =?us-ascii?Q?1Y2xCC57gM3utpbe87DKgQt9vMr+5B3XWZ9M5Ns7gSeW4p804d5r9hZZkgl8?=
 =?us-ascii?Q?C74e+D4galAPvzqQIa0zJd+srDPMivTtZ3M2661dJpbwI4mFeTG54uK6hj9H?=
 =?us-ascii?Q?s/eEvIzRrS8OgGwMkOEEnd2vkGOMfP2a6M8amD5e/cW7laVAuQvxJcTFA+mt?=
 =?us-ascii?Q?X0q9kT36970co3Tt7T/Ct8eRC0Wh1L+EAOaLGQ3ltTwBYw6mndDB9Ym7uUr3?=
 =?us-ascii?Q?NxVl/eduZEu4EWUoHCfAiEqauf0iiFQVvqro6kpDo2/CyWU2lv3tycHF6P/m?=
 =?us-ascii?Q?C/345GdVqUjPudyjVs/Kf5ICfMobVJVL4ihM3+4UVwQfrTzxA0kc4GLkCTSw?=
 =?us-ascii?Q?/M0lwlD4CRpmqntXmg1gghmlqARvSwTMgeDu4JxJ97VVR3ErppEqw+OCox2+?=
 =?us-ascii?Q?31j47MHMsivjm/g23Jxd177vhi72gXYw/cLA4gbVS7UOqP/IrNnLfvzQcBsz?=
 =?us-ascii?Q?tspB8XyQ2+tnuHzqrFXbXx8vEDUfh0xquDwil/AMwfWUr/rNspZGOX1c+VDd?=
 =?us-ascii?Q?MjFtd+z5aEeFgKS7KKChKcWkrIaZ7TaPGCJM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 09:42:22.2864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51436d34-27c8-4732-f5b8-08ddf43c2b9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142

After a reboot, if the user changes the thermal setting in the BIOS, the
BIOS applies this change. However, the current `dell-pc` driver does not
recognize the updated USTT value, resulting in inconsistent thermal
profiles between Windows and Linux.

To ensure alignment with Windows behavior, the proposed change involves
reading the current USTT setting during driver initialization and updating
the dell-pc USTT profile accordingly whenever a change is detected.

Cc: Yijun Shen <Yijun.Shen@Dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/dell/dell-pc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
index 48cc7511905a..22248cfe21c5 100644
--- a/drivers/platform/x86/dell/dell-pc.c
+++ b/drivers/platform/x86/dell/dell-pc.c
@@ -228,6 +228,8 @@ static int thermal_platform_profile_get(struct device *dev,
 
 static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
 {
+	int current_mode;
+
 	if (supported_modes & DELL_QUIET)
 		__set_bit(PLATFORM_PROFILE_QUIET, choices);
 	if (supported_modes & DELL_COOL_BOTTOM)
@@ -237,6 +239,28 @@ static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
 	if (supported_modes & DELL_PERFORMANCE)
 		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 
+	/* Read current thermal mode from the BIOS and set the mode explicitly */
+	current_mode = thermal_get_mode();
+	if (current_mode < 0)
+		return current_mode;
+
+	switch (current_mode) {
+	case DELL_BALANCED:
+		thermal_set_mode(DELL_BALANCED);
+		break;
+	case DELL_PERFORMANCE:
+		thermal_set_mode(DELL_PERFORMANCE);
+		break;
+	case DELL_COOL_BOTTOM:
+		thermal_set_mode(DELL_COOL_BOTTOM);
+		break;
+	case DELL_QUIET:
+		thermal_set_mode(DELL_QUIET);
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

