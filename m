Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B254207DE2
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 May 2025 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526584; cv=fail; b=LN1mYw0DmezHZOdgXiKJrSbdlyfrj7CfJbdq/SbZmkwGcHRvTsnnUFfs6egElhQstBjDq8LbgS0nF/TamuzjyMzo1yCyH7ZD1biegJjJt1u+QuNNQbLLuL5lKuiUb3DioiEImcZyLYU0I3JQ0T7YdOZ0pBgjyzOK6bK8BvXCyb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526584; c=relaxed/simple;
	bh=Vlnas/GlFc7SjiS8GJu9VPSooRkixdoayIP1xECFE0Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lRVImDtn0P2ueHq6IIvjAzW4jF8j1kq+dkkLLk//8UnQ0Z+1gC3ikLj1Zzran50eg+Bt5nqTGgMAF7hfy+/PbC2DIN/xAq/GK6+4ptkdBt2J0afPKXMXJ1s5WO74Flb5MDTqi3qENwb2L28ktth3Xxi2HFX6PgwrXRpfOwHC8m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IMtTxCun; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IMtTxCun"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2JSOzRG5Ev6VEtGaAE3rbDmLs24z0zGEgEsefwNaowtCuSSFMLwjKH3mF+RQhJPAD+QF5OFsMPruuvyn5SifolyIl9fFExRraY57folw3kWcz1dOTq+kxmGgVASAmW+Yh/Yr4NwZPmSNAjeRawvXOMV8EvdKuZEUQ8DId7DDcxRt1Huc9PgncvD8MLd7M9YcWZeIiHSnU+Xad12PGvoT/F4QWG8w4k5kYqc7LPJKO9Zyq7KoHihx4wWGV9giQm8upkFTP6IMQmyT2IvMRhTBRZkUwYCCaI6PjiVWvme8tC8gUMnlH71ZuCQjZA7W19a9MKlDbmBOq1lO4zu9tzPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCn8aP+ORIViixZ6kNyCeNbT9FEv1izvZpTOLBGAhos=;
 b=sXhn5D6gsli+MDh38YMCrnOsAKjh+Vk7QAV3VZ/+uGwRz5Mp2oN0frBTNRcpJWXfsDuGZR5MuPFhiLZIv/T+cwZ5PGIo0COH0rmxsuGiWLpF7W5D35Ss9e6VQx2oJKXF3X85lf12Zd73P93Tix5QqENWfVMo0mL43FcwS8j+rL921ZpTHLoxNqqvLQLKPUwWqZVfwl/tHmAZdWD9oAvtXxSv5m/nv8vvDMhWE/SKZlyEIVKXU6ydfeSye19DAP7yuWLStYa53wd4YGR1fnK1YcothPR6RpHrb0SqyZ1QIcb2HE/QZAjkcSBZNYKZFtZjjjYwTMv+fPqD6pdbYYwYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCn8aP+ORIViixZ6kNyCeNbT9FEv1izvZpTOLBGAhos=;
 b=IMtTxCunbKehOq589UKvikQNnuj46D1DH1rJyqy48iCAYWNV/WXfHz1w54NTSRWQUS+pxBztI4WOfd4VKsQg+NmakZ8A2CVZlZJl2GwtmDOuJrV4l21JWE0JmRF47t+1Bbx7VTznMr/F9aEMttOn3QrBxPQpk+IbwD/DjYOp+fE=
Received: from SA9PR13CA0148.namprd13.prod.outlook.com (2603:10b6:806:27::33)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Tue, 6 May
 2025 10:16:12 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::3e) by SA9PR13CA0148.outlook.office365.com
 (2603:10b6:806:27::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.16 via Frontend Transport; Tue,
 6 May 2025 10:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 10:16:11 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 05:16:09 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 1/3] platform/x86/amd/hsmp: Use a single DRIVER_VERSION for all hsmp modules
Date: Tue, 6 May 2025 10:15:40 +0000
Message-ID: <20250506101542.200811-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SJ0PR12MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 877cc029-0987-4868-5d45-08dd8c8706ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OVTjgktDQGxcKh958aMV2qtsNJHbPz6KCBhvK3qlvg+8mSWLhLLvL3g00zAa?=
 =?us-ascii?Q?LTX5YuC2XApJCC+nhHjcyRH68Vgj1Bj5Or2XWVD2A9NA3Mb6ImD9Q6sHovUc?=
 =?us-ascii?Q?vRyAHqVyHELve+atYuk/z6uBgxSqUAzt9l/PPI9OcTwDzrya0rJjui02b9R0?=
 =?us-ascii?Q?Va4as8zj0RwzrbdC+lTTP+CkwQSEXpnfYb75zYFzThEfwC3SeBoeFWMJZ64C?=
 =?us-ascii?Q?TzH8sXdeNzTVrQfbrfs2Fi16P3q6VpWLb/+Ln4/daJwHrW6Mlm2k1Q2KwB7L?=
 =?us-ascii?Q?6MXdlN65KqS+Eh1RVfQKB+7Ft3OJnxnzHK7GxPFL/fodAy0P2XeCai5KsJIC?=
 =?us-ascii?Q?fOFq4sXZVeQ9pXyvDTbFh3sTBXBP69wHYVmcUVazVVERYVkahdKqVLuL3uDz?=
 =?us-ascii?Q?O5t3k1QUCJ8LISHzacxUalMn4FTq2KezMVQPwg3HmWd9nx4LJddVfFWBQA+2?=
 =?us-ascii?Q?cZGjjsLQ3tjzc8Z3Sm45hEBfidJ+m5edekomKslMd5a1xUIFW0eSCmp96p4V?=
 =?us-ascii?Q?77+9/pZaZ5meWjJ2bto+ubL3PD4tbT86t/Bo+2dL427TDuNyXKf+hb0jaaBg?=
 =?us-ascii?Q?A9bliN5tPQT6D9BvIJY99CoFAwaVM5pjvmjhGwm0ShQcf7XT8738DrIm3nHZ?=
 =?us-ascii?Q?fztXJREFxihhTQkD0IGgkaH7AnHP5tQm8kmSVmShvhyFvE3GV0SV62pkcW3/?=
 =?us-ascii?Q?JtRlIharzeCcAQM1UYJOEy5yhkUFqWL7BQZGo57RIrx4COpEWEGcuHfhPRnU?=
 =?us-ascii?Q?/DVXOCjBQ25sf5OzsCMtvqHQoFcnq3GOiAhTz3bjvbhAzx6WnkSmiDyThJxW?=
 =?us-ascii?Q?s8BBmbEptQUN5nBVxQt1PYxTrSQk7VwPMnhwWi4f6XMD1UYVuWC1czTylsHa?=
 =?us-ascii?Q?cu+4N748axlSLnGqfpiXpo9JVzanWTmmP7Zuia6XBOZFXc2PXmep4wTceLXh?=
 =?us-ascii?Q?zmNoyMAnynNO7pogbalRT8Id3B13vtKU/UEBDLJRJXd1N05KEIGtstcYzdh7?=
 =?us-ascii?Q?TvbmxHtVORZSSKKskBnghPyc+Oa0SYrbBNTBSnvTyD3wUBLHjVSFKTvtj4Qy?=
 =?us-ascii?Q?C5bGnh/nlC4VufCrmN1/NY1f51ft2SB9SqOwVMUm0UNRC8utO44e/YDTOlHl?=
 =?us-ascii?Q?Mq1/qeTRV7XWrWaCEJGKTAQSgeo2Ee8BOVtBntyBaFf/0JmphHpEb5Ye1PEZ?=
 =?us-ascii?Q?B+oUC8vaQNi1iac797uKZqWpSqoPxpMz2aj3q3WF229gdR0AmswYS0Nhg3K0?=
 =?us-ascii?Q?lG97fPa2NyrtUJhCYXq+EHa5rF+/Nxto103YUwVfxs9IE+cFuJFhf1w+WZH7?=
 =?us-ascii?Q?Fk4+qJYzrno3p1LdqWDQidD80x5ylJ3PLQWxa7ZZVrtuFlP7+PVK6nylEVuq?=
 =?us-ascii?Q?Fr05Zbk+z827Aq+IN4anW5I3OFNLjgwQve27AHlKygJ0lVNknFxQogS4VYWo?=
 =?us-ascii?Q?FlFtq8PKG2qc7L/c4OmabzH6sukXYj7YMsPRtOVHPDsSkBKnV/+P/rCRGZwm?=
 =?us-ascii?Q?Qaw5mhML+0NttTk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:16:11.8179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 877cc029-0987-4868-5d45-08dd8c8706ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035

Use a single DRIVER_VERSION for the plat, hsmp and acpi modules,
as all these modules are connected to a common functionality.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v3:
None

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

