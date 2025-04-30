Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4061C23C384
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016743; cv=fail; b=V3qAw6gRYbvf6MpL0kn+IefQ1oZwISPnWRDRQdbs0A3Ntg5f/00PGlYly4BHka2dfFJgZ6iUh0thtitWoA3Fn3vFslc3tH6LsOFAupq8V/adec1y1r3sthdrWpXN8Xt8CckcwRpK5jYEu+DdwUDKOBqJSSOYd8jqprno6RnaXTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016743; c=relaxed/simple;
	bh=xfVubKUC18ufG/FLzck9qpG29+0OZd+Hn398YOLXf9w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KPy4k2iz4cW7BsrVDZr2gAVKgCTkKVIGlPUYJ8KYJytcy02J62VawEMFgsCnMp76JdHsbf6BIQjnUW98VjMh0pEq0l2NRBadL4AaWZdWhLBB8jN4eI7O/H2Pto9r+hjKVRNKiAcsSNRkkXnlNLDUKKoJcAmF6g8nGcvHD1DmF8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LuIkdPv1; arc=fail smtp.client-ip=40.107.102.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LuIkdPv1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7DFu6PZ92BMh26usA1UXDMPnT9/tQ4arIuNQ7viKpBnr8z/AEcls1UYOrEl9N13ZBP6x32XBo+s9jL+Hul12wGxOTd8jkbZ8IyYWwDaZIM0OuaWH+TAeESWTuc3jTv5yuyGLDTuYXV79u5RPDuYka+5LVj/sPUDHYRF3dmZPJdvuSOOBLJldQQtQH0FewAPZowwt2hNOkH9nUVFoVlYfJgTBOCbBc+Npo8yY2fZJzqZvp+kXLyIN4+RpY3ZjVeQAwFqCyI+PwPd2663k/RBFGPgLrQtE7+FHKPASemo2Lc8vEogXXySSsCrTE4YmS0/+M5+3USSOLjPNiKuESMSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=175kZob4GRDz49fX6BgI46R6Oh3egl/7wd+ezijVs5U=;
 b=xkaJlKMlDj0eGI5Umx7xVWQ7ZOJsHTsPIDwo5XJQojtwx9nIjufYEGh57uLwvUvnJ8f/94gXUUGn7U8QJSsKefkH8oz+KzzkVRkeoG+Ie0bvME6Md4tCqtD+hcwQ+3cc5rBrqciGPnBVxbtNo9HAlN3AH/yL3fducVvNsAefroKvkGTHeYTjByznh97ZoRnNsrE/8F5Pv5INAnprEXBn66ijqd4hp84LlhK6vaPXcVYUjzJZTe/me1blRoygs5yQCGlfBC24Om1SgJ021mt1CnQ0kPfVs8Y4E+xFinMuCsEXcJLZtiFzPw+WEa7ac67kJie3YZX3M7B8JlWYEB4CWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=175kZob4GRDz49fX6BgI46R6Oh3egl/7wd+ezijVs5U=;
 b=LuIkdPv1xfKMl/vxb94ojS1EiPtZmk93c8uHQeVOUrijxXe0VwAHHpJKWeybCCcpVx+8xVtsP+PR8ooHSqkUBFlNiSIfkQLmBsmPMWJc8B0gq4VQS12cgwnL7cq2854T055aSHCMQJ2s+DuzQ5N6lSvS5fYdff0K9FtSEAq+Z5g=
Received: from IA4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::12)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 30 Apr
 2025 12:38:58 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:558::4) by IA4P220CA0003.outlook.office365.com
 (2603:10b6:208:558::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 12:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 12:38:58 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 07:38:56 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 1/3] platform/x86/amd/hsmp: Use a single DRIVER_VERSION for all hsmp modules
Date: Wed, 30 Apr 2025 12:38:17 +0000
Message-ID: <20250430123819.1289068-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f8c26a-55dc-4f58-cf79-08dd87e3fa90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o61SPu1ju4i8ShA95Ckaz78lDvbf9zMxFNXsS3aOdlX/t+Y2v1E2bmENJY1+?=
 =?us-ascii?Q?HydQXb8ATDq8sMyhXk2sDsl1U7QKE/txDcx/Cda8uQvVH+1vwmK8s66eP9gz?=
 =?us-ascii?Q?oIpM8kZoGqoqjniqNA/SMmVjFA4/mqeLF9EOx/uqD9db1qNpBsQRthO3HyeE?=
 =?us-ascii?Q?riYtpyVjxI3OZ8xDwzqYr812bk6iCCwurW6UFxbRFBK2QtbBGSUMhm5FsbAX?=
 =?us-ascii?Q?eTzPwYcNYz1R+qpOUQCBXGPW7Uk2orb+OFrmtEJ5TK13PGwWY9EJ1357WTIx?=
 =?us-ascii?Q?JN1sGw5Uv5fwfy+jxe1AKVOJm+6/A8vj3I4exb31u9G6rkv2JQSdtBUiVi/v?=
 =?us-ascii?Q?vg//mLqVFF1EiVwAqGLvEBWD7Zjxaz68mqWRqZvisgTuOFtyz7/bswQf2fzI?=
 =?us-ascii?Q?SJipKn+YbnaStlYdqllg3QgZ/lHrnaku3nskg7lmZmIfZ4GqEgAh+dWs7AmD?=
 =?us-ascii?Q?Q38GtYOvuZsGn/TgAzLRdUdaARJrRQ8Q0oRrvE9xgNDor2OrHqdkSJJrvFXo?=
 =?us-ascii?Q?czQK/McPQks5UjUEwlmLk95hEgrx31e513s3cBjCw9wCLmgCuMNxrpBGT+in?=
 =?us-ascii?Q?U908NyYWV8zhfyIb120KRLy36LarXSs/Kd0THqujNNA8uSs/Zdw69BtQXo2n?=
 =?us-ascii?Q?7DMERgoiaEI+XmsqpcTcxhRdQjN5Xwm6InFURWrYbTUYtctkmoZSSMNOYqrl?=
 =?us-ascii?Q?D88Bq5DjEaGQnQ/tbS01pOb/zzMAF5xC2/VrRyOBM9WWPv7vqHvYSp47RNJD?=
 =?us-ascii?Q?kK/fcvy1XHSv1r9tI+KrBXZrHGNR/iZyDm86wrVDFFoOzRCJev5jVBiPRdNu?=
 =?us-ascii?Q?gnTkqJt4LZ7bsKo5RERfE0x4TEHx0A051rabvU4pFTALvw6eRjjqkL+YpPHR?=
 =?us-ascii?Q?RPxrEJudNwasrJrkhAA4ac59ah1/OjJ5b5HTdceqVQkKYewR7VFUO2x3pp4x?=
 =?us-ascii?Q?JkyxMc21iPaS2Ew7B5NMUGsUqivTUzZDxMkgCFMpqgZV6JwSl+mUyYoTD7w2?=
 =?us-ascii?Q?Ccy2lkwlt/RS2TdbQnHljib4DbjH3ce3Td4SrX5pdP8zGQawAER4P9joE/gw?=
 =?us-ascii?Q?m5NwdcLQdjiMOIpFlt+nGY+P8B+fAOc3pcIwXI18yuwVGQejpVjdO7KcuuBB?=
 =?us-ascii?Q?FkxSjnlI+lpNuAVX8+zFmoRbfncptABXeDuCCdyCgOZtmxYCIBI6f6poW7D8?=
 =?us-ascii?Q?YeqoGsFtCzzRbCblt7wAdyfIa0p+MUOz0sSb9HIpRknvawMZf+AH57RRpeZ0?=
 =?us-ascii?Q?ENceNA5HL0gTkvHeQHVHTLgJcxCZHsBivSyQ/PDSIqWMy+/ebWlKG74J0Lu4?=
 =?us-ascii?Q?7O0oex6E+YWGyj18v+Pv9/tBlE6EUAbUjUFTfSpXIlKIG2hYybBsyxeYtMax?=
 =?us-ascii?Q?7M1/F1bhC21RLavY0TMciaLIufxN9ltYrSf0Ar83DkQdZNQFAOOqegNI9rvB?=
 =?us-ascii?Q?/mnZCkxoXYMh6TAdmPpKD1FSZ8PGwS4MyzJN4q1NRLdFAFpPBWk/4C58XPto?=
 =?us-ascii?Q?WdRzTO5XVNyvvC4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:38:58.7169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f8c26a-55dc-4f58-cf79-08dd87e3fa90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326

Use a single DRIVER_VERSION for the plat, hsmp and acpi modules,
as all these modules are connected to a common functionality.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
This patch is rebased on https://lore.kernel.org/platform-driver-x86/20250425102357.266790-1-suma.hegde@amd.com/T/#u

Changes since v2:
Update the commit message and description

Changes since v1:
None

 drivers/platform/x86/amd/hsmp/acpi.c | 1 -
 drivers/platform/x86/amd/hsmp/hsmp.c | 2 --
 drivers/platform/x86/amd/hsmp/hsmp.h | 2 ++
 drivers/platform/x86/amd/hsmp/plat.c | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index eaae044e4f82..12f4950afcd9 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -28,7 +28,6 @@
 #include "hsmp.h"
 
 #define DRIVER_NAME		"hsmp_acpi"
-#define DRIVER_VERSION		"2.3"
 
 /* These are the strings specified in ACPI table */
 #define MSG_IDOFF_STR		"MsgIdOffset"
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index a3ac09a90de4..3df34d7436a9 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -32,8 +32,6 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-#define DRIVER_VERSION		"2.4"
-
 /*
  * When same message numbers are used for both GET and SET operation,
  * bit:31 indicates whether its SET or GET operation.
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index d58d4f0c20d5..7877cb97993b 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -25,6 +25,8 @@
 #define HSMP_DEVNODE_NAME	"hsmp"
 #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
 
+#define DRIVER_VERSION		"2.4"
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 81931e808bbc..4f03fdf988c1 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -24,7 +24,6 @@
 #include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.3"
 
 /*
  * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
-- 
2.25.1

