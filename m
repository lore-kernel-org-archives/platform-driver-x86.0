Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448532C94A;
	Thu, 11 Jun 2026 05:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155805; cv=fail; b=Y2imu1vkhgdYK102T2Rt8Byh353nUJg4/4lnnIG8mNZjRzynaABIoAL+pw1J6Pcuow6pFnBLk9r9qr4JvmPEbTPVE9HLoiwr2+846crN5LfzzeC8QAPFFS6T7kXhbOhNry8m/hA3DbBBGAo2fp7cCH9bChl4MGSY5x0vOyI1oko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155805; c=relaxed/simple;
	bh=8j0rDyn9miuqupyDjUmK1/HnOxxLtkNQVZfKme5Gbxw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Etd4MNtQsiJLFvxEOcz5uLlXUBMxZSq9eDoN9982HSa76AeUXVq0kMfFhfqHe8kq+LjAj6WTDSGj38I1vUWia9FoIFNhHcRfF3ZmI9hODcsUKDd3f8G4lXsUFr06gCzd3Q61OAZj5SSNX0lu4dofrtPQ7ZtxcBjaZBgDcmyiukE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qOgSfDJy; arc=fail smtp.client-ip=52.101.52.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qOgSfDJy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHFd0OcaOZgWl0zMEwHeOoKwTw0dlR/otoe9NMYZyfnrINtTIIH5yo+AcXE3c+VlHpDZ00K3hkIwx7n5mQdakvURxgZoE1frdVpTy/jgNzqy2u76g9yfm7l0ARodxDxMkroWy1n+owSrPA92cQRpauOmdZ85rbzt7jIR6jYOoo+8TPLhMUFL0Aqib/ayoBBRxt2q3xRTEmcME6maDHkPzxuoPb1Vs1Jn+nKgzhfzGlkhERTJT+k92HR6D/+YHUYfIu3tF4Z3+izU/iLMNIjlEAev/tTo+Kaj87z0JAbGODOqpd3eK8o1DK2y1FCTJlkP4phoWvBmjYemfmf8IthPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ilU4FAJhWhcud2wqN5cYS+IrlNzMq7rjOebwRi9/Yw=;
 b=vxNLXnRiWHYL8/eNRNXblsehl01miK9ga+anPrf/fdwFccTi3DRzX4298E4dsQCVMJS8Pe+1ZmIF5d6PG5q6vhLgkt2t5xZxxiByAsI7vT3ovNVWP+p80gop6luv7QYTFPDtnGPI+sjciIeeos4aCb6fiPzFtxr2pWnOnD0Ytsh7uKLEprdKi871GWFS6VKxS7C/dqkfi5idds/l7YoncyRny8RZ+zIC7muo7gYcFvsIv1mPB79cQIXzI43MD1yGFYzU0TqQIk9FScm1PmROcZdWEeNeN6u/u7b8fdJGfNGwXvp+yayleQly9xy6FWYsPL442ZcrEW1CWv+VuLkUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ilU4FAJhWhcud2wqN5cYS+IrlNzMq7rjOebwRi9/Yw=;
 b=qOgSfDJyenRJ0GDYMHcdtALyZfXDFlQNPcUZCkmE8DORiINcMdDXbbKU1C1L+vz/G4sQFEL8UXrqBSYlcLdmXYHb8d+hW+D969Uw3GM7cfeqvyDGWyBmhXY9mLK5k6imJB/a0oZAEeAsHLRxVvv9ipxNJ6Xfw7UtnEM3dizpeTQ=
Received: from CYXPR02CA0072.namprd02.prod.outlook.com (2603:10b6:930:cd::13)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 05:29:55 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:930:cd:cafe::6c) by CYXPR02CA0072.outlook.office365.com
 (2603:10b6:930:cd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 05:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:29:54 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:29:52 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v5 8/8] platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)
Date: Thu, 11 Jun 2026 10:59:19 +0530
Message-ID: <20260611052919.1095549-9-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611052919.1095549-1-muralidhara.mk@amd.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a727644-7cd1-4df2-a99f-08dec77a7817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Nck5yqy2Rgxo1lEqqJeiWM5BP3WgDccLDS8dgJNQFd3sbNZPNBHx/qx+GnqKy1DSMeiDjP/vU8AYybPg2iVDr2l2mrP6rf5W34Fx398cshZPG8L8pZToIq86L+AlJdh/vwddqaSRt9axO11/XD0VIpQGAlKnKoArKpxqHCuzQFiDkrMJBG8t3qyHlEocvqS3jv+htZMC1HGCoXcESc3s/OtQ1ZBVM+d4zHoeWMLli/+AV7t7vq2vXvjajAZlTiegHXz5eE/icRVzwoYAn4jrhxnklYXtBakwUxv6Ml9HwA4UoWfFttFxieapAk0IomOi1u6y0iN2R5DBtZgDxuNMaPDkwqYteqf5Pf+AygDcV6DWoLoP4ApKgkhrWbLioUSgXaNRlawg8o38lwgzoM1Mv4vK5+ERlahuU0UyIIqVq0qVzzTYwWn309glChtiBdQiPVASxuSyt/mNWJ00aPS7tmhwBmo6E6L5IbwFvb4PrihzTtYVuALtKI3IfpkqlLbCQcE/4mdyFQSoOuIaohCKD2jL0ZqQaQyAJoPuFervEimoRbp7yukTK6VDd6djgrCU2I+XsnD4nCsubC5qqeu+whGQcEmD0g2dhV9KcyFiDrL/6zESLpnFbF8I+OMb5sqML64r5qwev3cmKFXkEYYfC6vRjrxMGiBv+YtIrGLnRV/hTJF36VKdf2M73gg6hyMQx+ZxqKLZg78Mejn2+Bx4GB6jBhYXLw3/VGzlphSAY+I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	juGSDKORnSdoEbraKXJGMxBGQmTTQeS5VFR9uwhSvWA8vAJ/QR+dEEuK91VGpCT9Qtwt33ie4a5mfhoN8Zw5/4an5xSx75yXIdKfg6P1pWjRAscTzZKwAGq4Adq7Rj4Yiv5z2K0UUetrgXR91Gim/7pnUns+t9pmPW7PCqhbUaYfns34JLnEHNM9EU5SrMO/E5gTBBDkEOeCRR2RQMxvppzsE+oKCyvWPTzbTNMcBqniiMCCAmkvIbHBzAwuTLREK7Mh+iW0WC9IlrmqBJc+gQgf5bEbJOpkEwOagABaJf0fm+Ve+d5LNM0ETvTH3kdC2KCf6BXS6932dd2MX/JiP8vbqxiTOtgINAB1lF4su6OI2l1NqDVFOFstmqsB8UNMauR8BBJJVzBsLLOUu1hvQyjrNKC3bXEc/gmuJwAnfQbrMVd5uxKHXydWaUPs8JWt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:29:54.7236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a727644-7cd1-4df2-a99f-08dec77a7817
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470

hsmp_metric_tbl_read() refreshes the SMU-side metric table and then
memcpy_fromio()'s the result. Without serialization, two parallel
readers can interleave the refresh and the copy and the caller
observes a torn (mixed old/new) snapshot. Add a per-socket
metric_tbl_lock so the refresh-and-copy sequence is atomic from
userspace's point of view.

Use scoped guard(mutex) so the lock is released on every return
path without hand-written goto chains, and initialize the mutex
with devm_mutex_init() so no explicit mutex_destroy() cleanup is
required.

Initialize the mutex before devm_ioremap() so the invariant
"sock->metric_tbl_addr != NULL implies metric_tbl_lock is usable"
holds on every error exit. Both callers of hsmp_get_tbl_dram_base()
(init_acpi() and init_platform_device()) intentionally only log a
failure and continue probing, so initializing the mutex after a
successful ioremap would leave sock->metric_tbl_addr populated with
an uninitialized lock, and the next hsmp_metric_tbl_read() would
take guard(mutex)() on garbage memory. With the order swapped, a
devm_mutex_init() failure returns early before metric_tbl_addr is
ever set, and the existing NULL check in hsmp_metric_tbl_read()
keeps rejecting the read with -ENOMEM as before.

Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 19 +++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index a9dca97568b8..46e8dc7cfb60 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -479,6 +479,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
+	guard(mutex)(&sock->metric_tbl_lock);
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
@@ -495,6 +496,24 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	phys_addr_t dram_addr;
 	int ret;
 
+	/*
+	 * Initialize the per-socket lock before anything that can set
+	 * sock->metric_tbl_addr to a non-NULL value.  hsmp_metric_tbl_read()
+	 * gates on sock->metric_tbl_addr being non-NULL and then takes
+	 * metric_tbl_lock unconditionally; both callers of this function
+	 * (init_acpi() and init_platform_device()) intentionally only log
+	 * a failure here and continue probing, so an init order that left
+	 * metric_tbl_addr populated while devm_mutex_init() failed would
+	 * leave the read path locking an uninitialized mutex.  Doing the
+	 * mutex init first preserves the invariant "metric_tbl_addr !=
+	 * NULL implies the lock is usable" on every error exit.
+	 */
+	ret = devm_mutex_init(sock->dev, &sock->metric_tbl_lock);
+	if (ret) {
+		dev_err(sock->dev, "Failed to initialize metric table lock\n");
+		return ret;
+	}
+
 	msg.sock_ind	= sock_ind;
 	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
 	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index e7f051475728..f7b1cbf19932 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -15,6 +15,7 @@
 #include <linux/hwmon.h>
 #include <linux/kconfig.h>
 #include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -41,6 +42,8 @@ struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
 	struct hsmp_mbaddr_info mbinfo;
 	void __iomem *metric_tbl_addr;
+	/* Serializes concurrent metric table refreshes from the sysfs path */
+	struct mutex metric_tbl_lock;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
-- 
2.34.1

