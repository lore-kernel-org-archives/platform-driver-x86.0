Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B513A265
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 05:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247606; cv=fail; b=gxlgaZVyz9EPOuIqnyD8YeK8wEjTl3sPPn1Bj/TGQFWOztDyJL4U/rcB7Ff9HxkYSvVHMe8skkSlXJWMadBwEmWrpiFMeO1mnEFBL0V7Wd5KTdnRLTSSKFge5oPtktEpD2VJdK2EE/FJTvOemm/eylmKAM4ZVBM2vxg+NlQvY5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247606; c=relaxed/simple;
	bh=Rltu1bOa7HDAY0CCOLr/WNcZgx8V/EUY0oREsWgIWGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HlnPOkPQC2NDTy5O1jl9Str/+TfgCcAN6h3SpfVvhd6iR+WVrsiCwegv0GurUDzPazqwPuIf+v/SQzgO84nwvFHxTEn2kLcB9dtC6M49zhmb38Wkj8W7o8peb5Bhp60NPTMu5zFw6bS0kGKNnRANGtjjR8kfyx322Ji7kAY/XKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZhUXrYAe; arc=fail smtp.client-ip=40.107.223.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZhUXrYAe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9sFGeYr0HdScpn+QBXhr/P/ZTq7FC14I1wmsawCOAz8Fm3LMSIOMlEVK6Az43VMprAomu2/Klcnk9xxUPwZbmAn3R+690kOi9Nu+DRsI7/Hv8/N05NGjVup2yjsjFMiZPAU8lMdYS9fpSN0Ekja4GCUXinxov3p2nG9I++kih9dVQGPTGgmwFJr/wfGxsXELz5oBq9XC56fNeKe47H+Z1zY6V0RO5QMQJtJNn/UV7TjtDFjcYaqN7m9Z12PvhZj71AYo9XB0P2c88kqvhOmUVvegvL3v2QFaRCMwvAVa5+P6RITWPoUFnyc3LIKRen5ZHoEEsHSRkR4DOhfoGSJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrjpY1o/qOACvb2SEsNRAPoljtpKKPBb0CrTdlVjrb4=;
 b=fjzg66CQ6sn7xQV2JGc6FtRNxT0ekzDFeS0oHWOC/MBpPc8dBWHJSgIUdqHtr5lfZwCWr4cWZrH9htMgBh7wAtxa1xcTPxp54sYaQz4w+mjvj/n7ZwyNWSZb1qvndPxpCyOghd2yx7q2YH0qR1HZ6yABlSvXKGWJH03+b3tngQdWvefitjhD0Vjn1uCK40jC1XtsSSB1Q8bXy8ZdGFAVDe73TsTQyaYkxoySdXEc68aDGGcLwKN+CQLIvSqB9nHRSjqB9kPYagAbIEmQvaxDKSqmg913vp8vfL11wPe0ZBJKzVivVhu+9FMarCQGR7DZIubGuB7OOsCABnlaQlzQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrjpY1o/qOACvb2SEsNRAPoljtpKKPBb0CrTdlVjrb4=;
 b=ZhUXrYAe9x0GiiqGj2irQESoREUIZ2bzJSJZ0wrHXmJ+LELxKFiPFpiqfJLIT/gVJo4t18RHNvGe8YhlOpgoplGkWypIK7efHr/O8Jy1XhTUmN9oq59dva9QIMjoBjA1vv6QBHWu1UfwsisG8T5w9+5Z6gsYG/p6K9/LjEfGF/g=
Received: from SJ0PR03CA0160.namprd03.prod.outlook.com (2603:10b6:a03:338::15)
 by SJ2PR12MB9113.namprd12.prod.outlook.com (2603:10b6:a03:560::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 05:13:21 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:a03:338:cafe::b4) by SJ0PR03CA0160.outlook.office365.com
 (2603:10b6:a03:338::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 05:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Wed, 23 Jul 2025 05:13:20 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 00:13:15 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH v2 3/4] platform/x86/amd/hsmp: Move initialization of num_sockets to hsmp_common_init()
Date: Wed, 23 Jul 2025 05:12:50 +0000
Message-ID: <20250723051251.3009625-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250723051251.3009625-1-suma.hegde@amd.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SJ2PR12MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: c1736ea4-2c09-4ccd-696a-08ddc9a7a45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UCaWMStKqU2IGKf3ppkqsvz8Egf0ujyA/iy1YXAW7ftR+zPAEr85FlGXiQSa?=
 =?us-ascii?Q?G2AFCSFMPIJG3Jtc8HFy5zAfDM/uVYYholzTbfz8D6nPzedlEa0dx07c/gJU?=
 =?us-ascii?Q?Jtch2qA+1sJZ09tD/mPRLwCOYitw85JSYkFr6fkHHmipjY42rtbmYyTClBWx?=
 =?us-ascii?Q?yEN2Cu6Mtj4vEkhkCjWZW3L6cy09EkutM/SFE+gYA3ZmQy3REWUlhv8sjvd/?=
 =?us-ascii?Q?QZNJA7I+ImroYn4W68loEtQUo+4uMiqTEv0AOg82kUEMH9OQVVbcwUGAVBWw?=
 =?us-ascii?Q?2aJzzMuIvbogGuWoLCJCqu9epiL68FypJ9XT1GnvgANi+inmG+cMJl+9+QtO?=
 =?us-ascii?Q?zPWc9btQXM9XAzSzBOZ/nWJ5D4k+oMyNravz6RTvCYMvPS1DPsECOzRZJlID?=
 =?us-ascii?Q?Fl5l9UF0mLH0HlJd3dmKZfIUdyBDbQ7b36J5d8p7CPHlYjPMN7Eszi24bARC?=
 =?us-ascii?Q?/CBY0sVcS09/luTEuFtd2T+XJxX9x5Dzpkj1aalEPZ0Kw1cho9MOX37o+ciZ?=
 =?us-ascii?Q?n0gDIiIKuYNTQNEbbwC5i11yQlPG0k9tgmZBvCrZ4I75cwaY3tOb9QneB1dz?=
 =?us-ascii?Q?RuHenIGrWcIpxO8s3XR8jAgarw6o0EjXXVHJvt1n2ui2HiGfUarVy1A/wjrt?=
 =?us-ascii?Q?xK5eYdYLzlg+XUJtyooxWWBUkNj8hvrxt6scZUtjJzf3yZFxbqnyNmDheukp?=
 =?us-ascii?Q?5wm5cKfgWe8a4X25SlpsdBino6kUTFakczCzE6UmASzqWfeJN37OzOTQosRl?=
 =?us-ascii?Q?HWM1Aq71zYOm9dy+xIPtBEikEO+8PZtZa8SkcNxWFnZI7t0/KJ6tZZYvUNXW?=
 =?us-ascii?Q?2aAslwgQvaFOLnh0T0QMQS2LZJLLU4zZP9lyvHW9nZMDAZGxpN8U6+fj4MUL?=
 =?us-ascii?Q?xQPO/RzQ1bd8VAe1du4xM5fmhyuZpnSt9mqYh3tPhc0IJO5MsxNINQiRTQt6?=
 =?us-ascii?Q?KyJOPhgFXV3+EAU5iFsjAE0NP2LALu1yp1+JYMQs15BcxUO8c5agOSVUaUGP?=
 =?us-ascii?Q?OCOgQh1YL7tjXH4U7uxjPlCyY10QC3X1z9knED9MHMCbpo/xPPf10oOVp7+U?=
 =?us-ascii?Q?HZi+Lk/AtUSTQ+YpzcMn7hEMg/OEcKry6oMOX33vxirtL8OaHGORw4eKYZ7q?=
 =?us-ascii?Q?ykiTjpw6ZlkyFaQbT7qbcL+0TA68kNtqULA+/DTA+Vj9uJ7Rr2Zm8ndn6mbI?=
 =?us-ascii?Q?5EJJUPgu2wfpJu/czPYCD1FjZg8uDWDBy1UayzO/sj4hK+8NaHAVSkjZqXAH?=
 =?us-ascii?Q?BXDLWoF/Ne1n0W21oVEYygBvFUDF+SUyrlSNtoMJ9FZ6Z6kgVsIkO6dh1fr9?=
 =?us-ascii?Q?h6FyGA+UGwlZJbZshavqeTUHBVIgidzXJzhLgK07jJ/pDhFrtnH6tvBR+SAO?=
 =?us-ascii?Q?mcDl1poDfeH3Co2e/0ZEGf9+nMLwoEAQ5cecPWPWducY3TQzcoTYT0AAtoYw?=
 =?us-ascii?Q?vWC691qoYiv6RLFt8hBfxiJXXDr7J06V+H9V0uEJ5AUHT5F0nSxYnTeTcBl+?=
 =?us-ascii?Q?4GQh6euCj6OrQ531Ijohs1WNCASPxCcVg+9O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 05:13:20.9452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1736ea4-2c09-4ccd-696a-08ddc9a7a45d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9113

With the addition of hsmp_common_init() in hsmp.c, initialize
hsmp_pdev.num_sockets within this function and remove its
initialization from both plat.c and acpi.c.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
New patch

 drivers/platform/x86/amd/hsmp/acpi.c |  8 --------
 drivers/platform/x86/amd/hsmp/hsmp.c | 13 +++++++++++++
 drivers/platform/x86/amd/hsmp/plat.c | 18 ++++--------------
 3 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 232105226407..15c4cedc2759 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -29,8 +29,6 @@
 
 #include <uapi/asm-generic/errno-base.h>
 
-#include <asm/amd/node.h>
-
 #include "hsmp.h"
 
 #define DRIVER_NAME		"hsmp_acpi"
@@ -592,12 +590,6 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	guard(mutex)(&hsmp_lock);
 
 	if (!hsmp_pdev->ref_cnt) {
-		hsmp_pdev->num_sockets = amd_num_nodes();
-		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
-			dev_err(&pdev->dev, "Wrong number of sockets\n");
-			return -ENODEV;
-		}
-
 		hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets, sizeof(*hsmp_pdev->sock),
 					  GFP_KERNEL);
 		if (!hsmp_pdev->sock)
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 39804ee848ba..e05d824045d6 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -7,7 +7,10 @@
  * This file provides a device implementation for HSMP interface
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <asm/amd/hsmp.h>
+#include <asm/amd/nb.h>
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
@@ -459,6 +462,16 @@ struct hsmp_plat_device *get_hsmp_pdev(void)
 
 static int __init hsmp_common_init(void)
 {
+	/*
+	 * amd_num_nodes() returns number of SMN/DF interfaces present in the system
+	 * if we have N SMN/DF interfaces that ideally means N sockets
+	 */
+	hsmp_pdev.num_sockets = amd_num_nodes();
+	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_NUM_NODES) {
+		pr_err("Wrong number of sockets\n");
+		return -ENODEV;
+	}
+
 	hsmp_pdev.ref_cnt = 0;
 
 	return 0;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index f8aa844d33e4..0c9f8b868bcd 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -205,6 +205,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
 
+	hsmp_pdev = get_hsmp_pdev();
+	if (!hsmp_pdev)
+		return -ENOMEM;
+
 	hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
 				       sizeof(*hsmp_pdev->sock),
 				       GFP_KERNEL);
@@ -310,20 +314,6 @@ static int __init hsmp_plt_init(void)
 		return ret;
 	}
 
-	hsmp_pdev = get_hsmp_pdev();
-	if (!hsmp_pdev)
-		return -ENOMEM;
-
-	/*
-	 * amd_num_nodes() returns number of SMN/DF interfaces present in the system
-	 * if we have N SMN/DF interfaces that ideally means N sockets
-	 */
-	hsmp_pdev->num_sockets = amd_num_nodes();
-	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
-		pr_err("Wrong number of sockets\n");
-		return ret;
-	}
-
 	ret = platform_driver_register(&amd_hsmp_driver);
 	if (ret)
 		return ret;
-- 
2.25.1

