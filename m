Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F86416CE1;
	Mon, 29 Jun 2026 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748620; cv=fail; b=MxjLR+bZdqvIKR8yXckNKvUrrJVTTB8LTW3BwVD0X0y+bgKdWiZeIF/ZHqR5x2VEl9d3Rf68B3UmWyPl30bKpfKJZK/YDBksWnHWIdl5AhaEBRHkrVlclrKDgwjo23KhXDBIToveu6IZYrfUdi9BT+Yhyr/XeutryTBc9kb5UgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748620; c=relaxed/simple;
	bh=F2my0p33VuuNKtyPOjhV1ZOcVSdLf4ARgV0xcGeKOJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/Pcm3s0VRJCc5KrtQZxegImsix1jWa+IWSaNeWNzykNqOJFM7ryzwq1WFOYSjzmkGCFIjGRivZFMKoz0aQZmdN63BQ4gjhgW7fxZ2mXBNf26yOlyS72Guaf+nJnlnAEszno9/CV/8XQjwaONlAbh+H9ootA22xeEUlmL8X8DvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DxmZM8pP; arc=fail smtp.client-ip=40.107.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DxmZM8pP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gm4tlhNb9Gy8roxJfBPDPPKIZK7Ovnj8M3L+msQlblVP/WKg+l17yvZl41TyST9/LYXJekhHEL4VKcHsmrl5i0TrbyHS7sCoD7auVeCYwkUbfrH8e7DyNvXJkm9IQE7OCQHvy/ItEqnd0pPctsexE/dwqES2I+fe+ZS/NT6SYh2ThRfqseWmaud8CYThPgunrHHjVvWjvORIJIGQS8uVC/IqXI8ThDQFEzWwVtJba/Af/QTbxZIkiwUF3ifQ3NWHcC0YHepUyH25k10TGoajNHKgybIrj3aO6crOa834VP/7nzviKLxUWQCo0lpYHiFhOKrJ+pRKs5Xzwl/OCh+4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGjO3LFuTvulAsDOktYSgyUIjoPKqXTMcMVwbHrF6GA=;
 b=NLqEu004frpypKp71CzgitKd/KeXvmpZrKok0vSkqRimKZD9TbLGUHxQUDme4CLHQeQn8YPaVxRm+IgkFSUcx3PPHfZtxUM0nNUXyuREQCAf8qWX8YdTo8J2Dl89ccLYnxyEmqTq1ucNklPy7dY43r0aQTEasT4LRVv75n+rE5XkKxSDxHWH9DeQ3dUV7zbYiTR63xVvfFVE+ehjSuFSGBrZ98LulelMp9bMSiebWc17GPiDCKVupv4p7H7KNKGPBEMQVXUNxufZHR/jYogpnstrs/skedSygvmF5UAxLMvvRrlTiY+48ddD8fUooUdWYn/0CF2wEI+nsdJ+DQi5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGjO3LFuTvulAsDOktYSgyUIjoPKqXTMcMVwbHrF6GA=;
 b=DxmZM8pP4nazQnAaoO8ya7jpqhsQPqB88yARLPhAo0wFWxBXam/+BN63DHkQjHJS64Uin7erqdRJ9X7lf4WidZut/JFad+/TQEeG3ve9uQwAjZCQGRq4lyNjF8kc32O2AHLqRqtnW29q1leE1TA9OXDXWJUC4lhGJ7sSxwPqnAI=
Received: from BN0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:408:e8::24)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:56:55 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::f) by BN0PR04CA0049.outlook.office365.com
 (2603:10b6:408:e8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Mon, 29 Jun 2026 15:56:55 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:56:52 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 1/4] platform/x86/amd/hsmp: Validate ACPI UID before parsing socket index
Date: Mon, 29 Jun 2026 21:26:31 +0530
Message-ID: <20260629155634.1807598-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629155634.1807598-1-muralidhara.mk@amd.com>
References: <20260629155634.1807598-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DM6PR12MB4042:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9128fb-4f3e-4253-9b7c-08ded5f70b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ggddWaFXqGy1pJTjOZg8PWnk5khqYS5/MmoaGsbEXcM+2Jbyq7+YDAoEWyEHJLMFXecR4Sn53V3cK8JqmBFjs6SdeNBUpIeiNXsrMXM2cNINcE2+cf5+8tlEit6Vx1X8/QwxctT9vZgW1s1px8wIXsRo8YVqwddykSDEOZUpUc8Y9c+GiYqopBs18SVt4Q6V3sEiVa/WVEdqOOWYanLB9IPpZ91LYDlr+nJ09RXxWZVdGJkKDSySqP3t03kjUCmQ/1ssftZvjBwCU2JjtlSOuyPIJ5Ecdam++qv9wmHx810FElUAYua8avozV7W4jt7nkU5xhJ0Q75sHTU9YIsAaavBPGJf0P6QC93fJDucxeH8oZ3S40/PxbfN7StPIEM2m3v7hozkx/XJq/nL+sweYZrguJE+Ucm/YHyhXt8W+FDeGlBgfTBI6OI7bj4U+DI0jTHYQJVwgSEc1tEruQy5oHshnKs1aAZtG0yvdQMOtBGThn65uB7oJWcnFkKs/PPTPi9GVCkekqp5xvTX9n/lurzraylpiQGo10goSwBTEEO66NL5GMaNlQE8426wXhhAdqGhplKBzb/kRCiKAidYOvBP5QgUm6HEZ+beP2yBsQzEsfdWAEXTi2SEqlD1rtexjzsLNXX29D1YgZO3nZmJFrn6fCrF7V7elL1tqzPVUJR0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wba3CwVi0Hiy3sGrvIkhpGtpyAN7amic7KsWWmqQ0KinvZMnwCMU0sMciS6eww4gONLxgxDij5UeSjuftfNSSR8/6gxjQzYn6qrk7bYmyk8e9dS/ENIQjGO14vvMWCnTMaV5Dr3ncgQKYOW64aNtBWrY7xrySNJK/bUeeQnjcDMK8Q8yTQqpeMXzcPMxGf5CL7hZ6KmfbrUmnRtgLlkHowpiBxk4zr0ENS9hoxiRWmkXAapY5On58/76OeBpNybGRae/tbewzgDsKEU4cUmEsVVuvAUD6zC16qToaIokdDMBFCVBm1ZiPMsqGKLF80zECzqOYifA3lkZiZFefPt/bnJlfh07X+bDPC2MCIwqrNgNDiQvVKAZtwC5eZJ75Z6eFqpjOzuxCjWSS/+ruaJRlXS7T/IdL3AELRbuumE+K8pIXzq5aAQaRywPU63e7LwA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:56:55.6491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9128fb-4f3e-4253-9b7c-08ded5f70b54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042

hsmp_get_uid() passed the device UID directly to kstrtou16(uid + 2)
without checking it.  A NULL UID or one shorter than three characters
would dereference a NULL pointer or read past the end of the string.

Reject such UIDs with -EINVAL before stripping the "ID" prefix.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://patch.msgid.link/20260625123337.886435-3-muralidhara.mk@amd.com
---
 drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 97ed71593bdf..4a1ce4cb25e7 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -21,6 +21,7 @@
 #include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
 #include <linux/uuid.h>
@@ -77,6 +78,8 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
 	 * bytes to integer.
 	 */
 	uid = acpi_device_uid(ACPI_COMPANION(dev));
+	if (!uid || strlen(uid) < 3)
+		return -EINVAL;
 
 	return kstrtou16(uid + 2, 10, sock_ind);
 }
-- 
2.43.0

