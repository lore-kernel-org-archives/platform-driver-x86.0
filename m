Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB32DAFA6
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690687; cv=fail; b=CunDCwbXRZzMYl70Q8QlON8RKjDpx1hfE4qFc9xEudDJbCbEhV4UTvywDHqvqmw6IBmfJ8gk3vgUf//QUuBpx9NrkaTFFzcsHWosJbXsg6uhEWT9GTe/XakU0E+cioGm5cIP365FgHkLDEOZQmQXrvU+xXtuxT7lIKDYZYVKJ/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690687; c=relaxed/simple;
	bh=kdmACCpNgBimmejj2nWizU/n7zYQzsxAOr/RlG7GbUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USWGEPpue7zVYoZjEW/Z7P4jND2yUUImZlAboiRcyakdkOLcmurUVEty8BA6QQOq/g8lismAcKlEWd/bC03YGhbEkL0LO8+v3Ba7aG8K+dLynSiB4xngxWlr9KtTSTtQP0gq5BeOzNAoFHzUq9sexwHwUMZaRhcnjDRlty/B7BM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E7WobKTW; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E7WobKTW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbZUjF6E0n8obDb1odi6ofxYoc+lYsAoIV2N7lwtxvVJdNA8GTerx49mt8ZavNY818sNoLig+EZy1FCMj+kDMkExNMhRbQuifAGD/PTjleF5tKsmb7TjF4Su+rM1bWQQ/GDMudO5X2WYsvUWPq7v/O6DIrdoHbQBJjDLiOpO/FVfJoHPdkMEUsvnN4DXfu9d49dON4wTkevi16VP0fkmWMQoP889aaJUC0BYDAu64wR+uOvsSE6P/o1C9JYzc2Gm/93OWO6tTIKRJL9hI/jMQLG6+Qq5P5K5A44uiq/fNjl2SiSLeQ5MhlJOOs3l6NBOzUr/vSMGRSqQOXsBGLPpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SObzcSGyADUqDcaiq5H3IaKEkj6i1llcRWqA/CanyFw=;
 b=c3kj4w2TVcEzzyHhiqcdY2EnrI7k9JE827D8hX+pnP5oT1vunZ7AXLJyRc1QiinNClFFDxEh8rScVAgc1SYRS/l7whardZmNg97qBZ3ZkL33+cpmfMp1Lbx13RgBE+jKBcBadLGiT1yTP+mshtnN+jnvIkK6gd0NlmTV5v+rSiMaOsvfZOBTcOjihTUzmQTOwdvdD3XlQMho5x5Y5mMY3LrTD8pTZg6Lp5nC2kBNbgIUsMtSqQvZ5Tmweszn1dceWJHugkd8RSDdvK50+nupNdzgiH4WYHn3Ex4oS0ft9ct6pEUnbpyXNXA1QXX9Mq8NmKVZaD/xzWr+D3cPRPmD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SObzcSGyADUqDcaiq5H3IaKEkj6i1llcRWqA/CanyFw=;
 b=E7WobKTWKxwnqP4INw0A1+Hi4XuDXveRaJZ6FQFw/aoP9J2zspNtBk1Bjtsuab28oBl23sZprrGLMzy6amHIuLuDMSp2BL2ik34JSISSpXLUUmgLg8hEdUwmP5bUN7/yYIOR+Xnlss7lErjxD6b6cyVRIqKnuXs3xPvSTfdj4gE=
Received: from BLAPR03CA0097.namprd03.prod.outlook.com (2603:10b6:208:32a::12)
 by CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 11:51:21 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::74) by BLAPR03CA0097.outlook.office365.com
 (2603:10b6:208:32a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 11:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:21 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:18 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 3/9] platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
Date: Wed, 20 Aug 2025 17:20:05 +0530
Message-ID: <20250820115011.1448026-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: d45e2f71-a291-49ba-09c4-08dddfdfe1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FS0wPCadz5u5FNbrNMj/JpVFmURhisWn+sODy3YyKRK4Z/CNCdMcGHkBWLGk?=
 =?us-ascii?Q?BRKfZVrMrKBjHx3RGYQXai1QpmiO7FZRrcZA82BA1N19gP+Zvd0JjVHuolQQ?=
 =?us-ascii?Q?oqN/+F3qclkdAsVvbqjwHYpz0FBAkkdELJTVwpRju1P1miUxrYW8qnWZCy8Y?=
 =?us-ascii?Q?IrgMwq83Wjc8oqUi9Bo6CjUKNnvtHkDIB4pECv9Y0/LAyYZuBFHwGZqMYS7K?=
 =?us-ascii?Q?GfaUdYCrmBdK0Kswp7SreOZbWj1oJj1Q+W70Hvv96DuKLzIvaMRZRFgwx/XV?=
 =?us-ascii?Q?aJocAUY8/0Veumr6CnZzpP+pbnBV+mgTbsk0fJTN7vEAhXl8085evkPQ9Ub6?=
 =?us-ascii?Q?cqIB9P0aFKUtF2M2++WzSYCGZzcBwTR76pxeWyddmJbo/n6/f6FAF5WxvhcN?=
 =?us-ascii?Q?Nnw+S1MIIDIS9c+9u613ixe8wAqHuJNQsxeumKzs3Xq374ute+QtMfxrKIdn?=
 =?us-ascii?Q?AanVmDb3g12yGhkvYBRQcuIlKFzPQKca0MQYdzzoyVv5E7EPD8iTBOle+W5b?=
 =?us-ascii?Q?i7CLH13HqAdhWuhCtTKeEKSaHOLfbVEk8gagx8MD9sPqcl0g5XB/ueMFbfxC?=
 =?us-ascii?Q?QIde4tAp3YOI7d/wGINHGvgfDcsgusraROm0MuoNHSnWsP5rh6yZSXo151rb?=
 =?us-ascii?Q?zCtFqQk2tHijUhFD3gF6fuzvvQZepSOdmxOvVZ3Gj1gGd19k+l85b3VCmzxP?=
 =?us-ascii?Q?f1ovp52RqW3dZPg3W7B4T727rnPB32kJzdhTXeI7kmeLVQRJxradY0f0p6QI?=
 =?us-ascii?Q?MQCiNwkxvKF+GoSP1pu6SYk4l4BCr5shrC8ynf/leYbSBfKOwm/+XkwF0Lqg?=
 =?us-ascii?Q?UcjBEnHhDDqUkWc2VIrwhe1kOAcmEayHpj1p6qjnHI/MF+KHNS+ufDDtk3BV?=
 =?us-ascii?Q?iSKpKyRBg1t4rNj/yiEwTCdybnQ9PLxK0BEISFt0GXHD/TczZd4EV4rtGNIi?=
 =?us-ascii?Q?+sYtjSaY+F+ZbF8GXCUtsgYfIQsmtOJwcQGNZEid9eA36hyAD5OJggQng5/4?=
 =?us-ascii?Q?4ScmNyq4jR7zmisoJ2aQfIegKLidpRSs3yPNM6iEXhgmUaeyBVoskc2ydNOE?=
 =?us-ascii?Q?xsVA0pF1AxYWI4T2ES0irPt09ycqGDbiiWtu4QlOS32ZXisjd2aACiRgZMa9?=
 =?us-ascii?Q?1PJgVa86nMbjJOO1a+ZPd0tlF3bUIqgdQSvuhpXNDg7DbR/HWyFIBnF/U0xs?=
 =?us-ascii?Q?ZpYiJjH2R91Ix8oE4c55RuemrNphwBhDAMMGaJJgWdBO4IvlVrrVo+NrCuwq?=
 =?us-ascii?Q?5VX69iFzCFGM8Jy/+qSeY01ttlNzuqYzK0r4jcxuo/P5MXiS5iDCpwlYMIdL?=
 =?us-ascii?Q?009HRY0YHTyKWPKiGOc38ddaQxDfL36k26UJ63kF44BBHep2ZIFumgeZwSrG?=
 =?us-ascii?Q?XW8IrN3qVNZHkff8PvWIc/IqXOCury/aMri5CDN7JRALf3i/2d5SShmaewRY?=
 =?us-ascii?Q?X7NxJrX20WTNh6k/9kRHLjaojPQZNwp2/UgLHSJSxJveYiTGEtlMC/NfyH4J?=
 =?us-ascii?Q?xkXlOLziU211de0KLoZLhR+PI8R+6kKg65TN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:21.6104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d45e2f71-a291-49ba-09c4-08dddfdfe1dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234

The existing amd_pmf driver is limited to supporting just two custom BIOS
inputs. However, with the updates to the latest PMF TA, there's a
requirement to broaden this capacity to handle 10 inputs, aligning with
the TA firmware's capabilities.

The necessary logic should be implemented to facilitate this expansion of
functionality.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 12 +++++++++++-
 drivers/platform/x86/amd/pmf/spc.c |  5 +++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 79defe2c91e6..2fcdc2493552 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -631,6 +631,14 @@ struct amd_pmf_pb_bitmap {
 static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
 	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(7)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(8)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(9)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(10)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(11)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(12)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(13)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
 };
 
 enum platform_type {
@@ -714,7 +722,9 @@ struct ta_pmf_condition_info {
 	u32 workload_type;
 	u32 display_type;
 	u32 display_state;
-	u32 rsvd5[150];
+	u32 rsvd5_1[17];
+	u32 bios_input_2[8];
+	u32 rsvd5[125];
 };
 
 struct ta_pmf_load_policy_table {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 869b4134513f..06b7760b2a8b 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -75,6 +75,8 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int
 	switch (index) {
 	case 0 ... 1:
 		return in->ev_info.bios_input_1[index];
+	case 2 ... 9:
+		return in->ev_info.bios_input_2[index - 2];
 	default:
 		return 0;
 	}
@@ -122,6 +124,9 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	case 0 ... 1:
 		in->ev_info.bios_input_1[index] = value;
 		break;
+	case 2 ... 9:
+		in->ev_info.bios_input_2[index - 2] = value;
+		break;
 	default:
 		return;
 	}
-- 
2.34.1

