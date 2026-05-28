Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DEB3AFB19;
	Thu, 28 May 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961235; cv=fail; b=oY1UZSVxxujlpnWA7xoZJX8fh/ZjgjOnp3K3/crICQNEXqi6WzWzWQLt4rEMOHHNmhC7h0nWaNKys/97JLSfOFFKF9ftrg0gItu1wm1qbpYlzXfclCMqEzZMtA5Kh1chVkoOxAdCWrEYIJyS+4KTrvtA4JWBNHtU++UXws85Dws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961235; c=relaxed/simple;
	bh=cFXmahLI4UDy1tmCkfjWYX/d2VVHJ3IcqiaJ3yNi8f4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FYTVZxbX/hk8fBnNO3cGEjorV2gG6Gve3E4ce17S8cFmMMC8LsuzGANnEd+CdVr2RZRvQwl9PRfA63T4XTlbQEUJLYFzjrPCZ/06G11MvEa/1a2ncPDsNY9V+mLxND0XjWWgAF1DSMtQv7tTdpeltbzU4EMfTsf1rppXNS1aBNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=075f5/su; arc=fail smtp.client-ip=52.101.61.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="075f5/su"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOO1aO1JiM4ZyNzRNnhypgyREkQrqG08TDYELjbjy6h+iuQEtyr3Uqgg61R1M1d/vxEhkJcbv+debvcFdO9MsrxwveBMwEgng+CyF5tIdBJEjp7zN9Pak2YecB7GAoG/ZsetfKBsK4OFjjA1fGXX5PUjrtac2fSXSaznRQzEXcYGKeAMbDiYpBQ0xpuQQBiVGvlLgWB+EauMRunslfGAASNlnPahngsXC4PYgT5r8fv/9It9hGULyPyrX1kExx7nKBh8IVv12Yz9/jlIn/TD25C/JPFg2aj+yLFrHV34j0HvPVm99AtmyRSc4Dbf9fN4P8Et3/CFqUpfPIcf4pU+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmQcyZIFV7yxsbWlMxnNVeD4jFcj7d7GGDwYbryuLy0=;
 b=fS2tbvPFBABVHsTnSp/20/b9PccVaNKQeMhpCBv+LR92IzL/p8RyF3LzZDNB5L2BZeKP3cV8ptAf7PcTRwwAakADSgrHe/gmW6ZeXHOlGd4kDFuKOlgzyE6qXaPUQzvtBB5wNo/OQfZrAbTu6DH9//ujPcDg+XTaeAbelWQR87RTYb2jpzoPfpGI6yph6n4zALUDju4DyTGPxd8eJTu45jrRNHcBX6X44Pf/7pamzRe8FP46cWK35bdePmo4IuaNoIvyA+IUiSKpGJ4L3ZhGgT4uXi+pETRrNJpGAA+F1kjDul43/CcyYDqJH9InJ0Vp0Hh4ZcerPVH85e+l7bICjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmQcyZIFV7yxsbWlMxnNVeD4jFcj7d7GGDwYbryuLy0=;
 b=075f5/su96PLmgtvZDgIj/h3OAkIDZE4OqbRSKJsWEyHiYGM6FOs2Lb48jePH0hghX6InhfW9F9PxWn/cjuhTok0MFnWnkjKkjq/R+pmrNS5KsQItqDojIn7V4p/lfWXq/fNZipEoXO/MljMa4jAglx98jPymTHR7dGwmpurCGQ=
Received: from CH2PR02CA0001.namprd02.prod.outlook.com (2603:10b6:610:4e::11)
 by CH8PR12MB9839.namprd12.prod.outlook.com (2603:10b6:610:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 09:40:30 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::68) by CH2PR02CA0001.outlook.office365.com
 (2603:10b6:610:4e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 09:40:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 09:40:29 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 04:40:27 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v4 7/7] platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)
Date: Thu, 28 May 2026 15:09:54 +0530
Message-ID: <20260528093954.2461272-8-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528093954.2461272-1-muralidhara.mk@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|CH8PR12MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 561121fb-1518-405c-381b-08debc9d27bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	p58XISyTHHwrN7xbl1rYnj4KQWN71gqLpyXxF7U+IQuSboI8kDarV33PknOO810kPv760gr1C7aWtL1eoc/TghwbvYcRtrmVtiR1oZ7dQaQWFLbRZPmT+Ps0TNoyAK+KSRUgobMvhOZYErRx7Tkip9Ms9skZPXUkyFgsCICWH0bR8x01g7zLtYifi8puHLtQI0yseYYzkjaSt/m26mcnC1oSvEaDMqernESsH+oYqVaS1gNDCHxOTOBPNyL2wiPnlIGaEMTjgNgUjXGm+VD2QCwByzSNv0tee9AEyDjzxz6OrO/FyH/AOXd4YbHyZJ8DSPksQQ/VZcYRoYDYqAbARvnHDzyXYdDHdMddJwoivZ7LdB/85NKb9CJvL82EHWa1NmC9EZNvkfI5svQE3nqq1P2XkY8S62mqyXA+MnRPUL7p0gLSMC7CvwiQGGOj1SAUHirMwYBE7l1Dxkv00wBvj/92BYTPo162mUuh/mX7OkC9lUJUseokk397Ve5w8pWAzpMMlTVGJ5c8onV/a8ncizB7SwKlZgqEKADGIsdlA5bp+g+AXIMktCG5IJnplAlaydjo6CVwNqNBKx1L31FtMCV5PxI/DDjTCoR9ZxmvdLZucKdia+GJZWhIvwbihULp+ZKDTMt7GrWBS6xuBUoqt1M5TFPfpH7+8hFeVKaY2CFbVnNbXfcKaH5zdMJQsmzP0blkZZxx3y56uA+S0R48iVinun3yDtW9qvV14aOHWXA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NaQq6WRlIjf5JBhFDvHw6OYg4CBrCiKA7akRg3ByI9ztOTkLKwhXIl8r9QKZL8Ad0Jv3ugClpQO5W7h5+C4tuR01HEIK9giyq10j/U5qpQPNiBKCofwf9t+rnufHOx4DHERiHNYqkP6ruZYKvgJpXREiMv+ULpuXYKG0IximeBnpdENxufOC9E5y5Uzfbzh+0QO0c0z0Q3S2ehRushZWlTLckyC7FPKTs7/XIaRanOh3cwHWArH7U0OwzB4dZA+neoFYHT2kHupQSRxBpmu9CW7cZN4fsrtrO0VrxKYhZpAnhhKdcFgzXXdbHbvRlhMghv+AvsuknLn59ZhpOZK+1kwNlX4PKMUc6Zge1YQfam4l9QH/2rDkhesI4caNNIgi9lKLlkT2GbDwTD5G/ejL11QM+I12JEmdr1QHGUB7Q/awvO/UM+ErOBXNpPsKp2zx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:40:29.5117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 561121fb-1518-405c-381b-08debc9d27bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9839

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

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 20 ++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 67f0074bb532..fda57225939c 100644
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
@@ -524,6 +543,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
 	}
+
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
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

