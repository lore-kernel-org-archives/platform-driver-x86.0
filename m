Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010032.outbound.protection.outlook.com [52.101.193.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB816432BD6;
	Thu, 23 Jul 2026 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800054; cv=fail; b=Wyvf1wd/kL0QsA4TOeWfjFhRPYZqxR0NAXAw0D25kN62F6yT2obWImOVDT0GGBsXJz835gjrBjTnT6Q5qccGv/8bT7+dMJc/MGoLwkerUhILuwpd0NVzhL2FwojEImP4jiO2CTYAnzfybG4DJeO0uMtFL4hqRkWufKlLm4siIm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800054; c=relaxed/simple;
	bh=WB9orJ7o28uPSqNu9CE5feUdfv0mroTsZhVrzPpCGZA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6DSJpWfd9B1hWBwMTWYfWn4om7QMGfPh4CJ4IRn+NDjpYY/C6tCzBqz7wrb5coRCou413RE0L07gbMFFTKTYFi2ZLHzuQrJqIgGuARXx6I8oQxNdo1QWM7/pnlJGb9bfbSJ9UfUYPStmdWd+qJm+6yqHy6hG6N7TkxvdaiaUek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wBoFNf4q; arc=fail smtp.client-ip=52.101.193.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wBoFNf4q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXnqJwAOO/VbMENSZ/UrA8u1aZ/QVolD7eIpSZlc9mn8G6A6KxWaBPo00OwI19Qxi2arKPrUtH11DXia8VIaEoblUTaQazEU68zyHi4TlkZC//73euR8hMKh+yQjDVAB8yoUWhxcjxpGwno7+sA6EVgZSLIUg4ODaCtz+XJprI6zRxnSBxZQ7RyLUtblQNkWk/MgtLW4o1yF9HlhGPcEWUvf1rm3cWXPqoV2SUEI89yCrKMx4n/XcWDQW/KFHEs7aOeHvWT4Rl1w38DbLB+RS9tAvqryjARhfiaqvvKKdSP9eiJBO5I6a5vyj4UN1YvBhm/rwjsVEqpr+yLxYE1MhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71yqArRKSUu4XQ6cGz+RPYr55A2eFv2P/zNoEWybxKw=;
 b=vOqo4Kr2QuuSfeN4/Zbe7ry87q1ZdWuGbSD1qTBf6pT+6cC9vpnF19rARFvfjzqvQ+CkezVxVR4W1eo8DwENiPgvYjSy0mit2JWnEblkia/dvDm4+OwXXHSVkDPkMKjiNvSQ4IaJLjd7EhTALBKguo5Sxg2iqk2HTRZnpi5DvHLhlFVOZdV1A2VRNUChG+odXAL+0BwffD751qEEDUN7OUl2ixQ3vJeDaiJK4j+0N+/KFgha6YTpdx1r9rWBts72VBDFW7uJt1NEdilVB3k058MCBUWiWxkflw8cWEp0idzl692rsrOr5zCGDOFRZj8ViqwVTzJU/S7BlXSnhJmllQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71yqArRKSUu4XQ6cGz+RPYr55A2eFv2P/zNoEWybxKw=;
 b=wBoFNf4qq0PzPd9S9+6Go/JAdKyW/mVRrRjgn6F9OwHDUprP57m2ZL5jrCX6lbJMly/TM/63uVfDV1rf82K+skNvYC3sUxWAolU4SjX+CyZgvHDlQEFHrsnfZPEmnmJUmot0d30rDwVXMTakybZ4aa7jL33//RB9FZlnswOvfQo=
Received: from SA1P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::8)
 by DSWPR12MB999130.namprd12.prod.outlook.com (2603:10b6:8:36d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:47:26 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:22c:cafe::14) by SA1P222CA0016.outlook.office365.com
 (2603:10b6:806:22c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 09:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:47:25 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 04:47:23 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 6/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Thu, 23 Jul 2026 15:16:56 +0530
Message-ID: <20260723094656.3806028-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723094656.3806028-1-muralidhara.mk@amd.com>
References: <20260723094656.3806028-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DSWPR12MB999130:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6caa13-9fc1-476b-c075-08dee89f66e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|56012099006|10067099003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/KTtzslQIrcpQZu8tCVBaU5EL0B6qU5itqjP9zeec34Mrz1znskdqP/wZ9i+ejD7JCKFAHXYk5ieB+PJsDsjtZEqnbDcSxsEgRDJxZS3Km7r5WAp+yvaM4Da/PZcvqpEBnSz+5PqfMur7hLiZnm4eZVSEwplpbpedrh9PcOUVc4ZyJNSXwZjgx1D1Fo7r9eFRve3shb1zoeVfpU101Tc/sBEpUvLGRq/JWwlUjNMgEFCq6P67/WCH5Im6AyD3pgCxPWrtkeAgInfILei5jER+jwxKzR/A2b2CbBEY13LbQSDxFyKaVqwZDvfeJg0LscaoRQy/dfdw3OdTaZYSgqfqMUj0FIcP6h35AM/llAiN5M5xq7jDHCLDY/aZ4IiHb3FPr5lXWHi2LWZ30MjIiSlZnrdW+BD+p9MPW3V2UVaE2O6cXS9fJTvSyb+bEeph2OX0Z0dsB1LXZ8ap+Ywo5J97WE9DprufR46XsFoAKHgw5f10/qOh6WikwRJqWiz4okmgI7ZA8OwpGrVnqTd/bXf8g435tof7FAEeIbnEntGSfKwKuEzPg78GVr2fGkZVXYCKU/elszeExuBdAnwhyIwn9pPjXDyjA8g5c9r+24mPaEQAI5PbBLlapD/0iWYH9MQBN7nkFKFxhCKgumJvx/lCUJIUBwNlkQ7OoCO6R3gijA6SzhSTpF7lQNMfsmZQwGZ/WH4Nqe+BL2dh0Nrzq4Y9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(56012099006)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kGpKFsHDiTlVsmkIPiVZUqygMAMSFCdKkx2nPJaehxA5ogf6AkyC9R/rhD7yD+FvIV7zhYR0DWDP4jW7vFGRPi+cZuupnarB4bSW6EGuh2zocYuBQRETQT8jhSei1qlgJKTI2KA42vlCD3MxByO1yTPUDnvGJNasnONauW6v03z+WPewif59p1ZH3qog+MT/WTWRHfAdi+z+Ok5Ool/tkcIKAOojmRtL3ScMvAZWCUeHIDu+D/ZwKcMg228EaGgRw0rLyb5+FnzOMkOgQdwH6f2iPF5nEGgH0EQbqou7etlh09+DVpJMsVeYL/ABSEWAznSwPaPYi20ITpS0h0h2XLf8JmNZHnN/6tC8Ncp/yvxraKH9TzZCR2M9VeLwyqqvEgJFzLjXw6q0Sd9XRJ0SWYndVyQOZTZxcvrLfWnT3CGzXe7k06oprAyutxWqd5he
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:47:25.6193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6caa13-9fc1-476b-c075-08dee89f66e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999130

Before this change the HSMP data plane runs without any coordination with
driver teardown: open /dev/hsmp fds and hwmon sysfs reads call
hsmp_send_message() while probe and remove bring sockets up and down.
misc_deregister() does not drain already-open fds, so an in-flight message
can race a concurrent unbind and touch a freed socket array or an unmapped
mailbox.

Add the read side of hsmp_sock_rwsem to the data plane. Split the message
send into hsmp_send_message_locked(), which does the bounds check and MMIO
access and asserts the rwsem is held, and hsmp_send_message(), which wraps
it in guard(rwsem_read). Probe and remove hold the rwsem for write, so they
drain in-flight messages and keep new ones out while they tear a socket
down.

The probe-time senders run under the probe write lock and so must not take
the rwsem again: route hsmp_test(), hsmp_cache_proto_ver() and
hsmp_get_tbl_dram_base() through hsmp_send_message_locked() to avoid
recursive locking. A single rwsem therefore covers both the data plane and
the probe/remove handshake, with no separate probe lock:

 - acpi.c already holds it for write across probe for the socket-array and
   misc-registration handshake, so the mailbox handshake now nests under
   that same lock.

 - plat.c takes it for write around init_platform_device(). It is not held
   across devm_add_action_or_reset() so the release action, which also
   takes it for write, cannot deadlock if that registration fails.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 41 ++++++++++++++++++++++------
 drivers/platform/x86/amd/hsmp/hsmp.h |  4 +--
 drivers/platform/x86/amd/hsmp/plat.c | 24 +++++++++++++---
 3 files changed, 55 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 967307abe641..a457831c9c6b 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -45,9 +45,12 @@
 static struct hsmp_plat_device hsmp_pdev;
 
 /*
- * Serializes AMD HSMP socket bring-up and teardown: ACPI probe and remove take
- * it for write so concurrent per-socket probes cannot race the is_probed
- * handshake or the one-time socket-array allocation.
+ * Gates the AMD HSMP data plane against socket bring-up and teardown.
+ *
+ * hsmp_send_message() takes it for read, so open /dev/hsmp fds and hwmon reads
+ * run concurrently. Probe and remove take it for write: probe brings sockets
+ * up (running the mailbox handshake via hsmp_send_message_locked()) and remove
+ * tears them down, both excluding and draining the data plane.
  */
 DECLARE_RWSEM(hsmp_sock_rwsem);
 EXPORT_SYMBOL_NS_GPL(hsmp_sock_rwsem, "AMD_HSMP");
@@ -211,12 +214,20 @@ static int validate_message(struct hsmp_message *msg)
 	return 0;
 }
 
-int hsmp_send_message(struct hsmp_message *msg)
+/*
+ * Core message send. The caller must hold hsmp_sock_rwsem: the data plane
+ * takes it for read so many messages run concurrently, while the probe-time
+ * senders run under the write lock taken by probe. Holding it here serializes
+ * every message against socket teardown, which also holds it for write.
+ */
+static int hsmp_send_message_locked(struct hsmp_message *msg)
 {
 	struct hsmp_socket *sock;
 	unsigned int sock_ind;
 	int ret;
 
+	lockdep_assert_held(&hsmp_sock_rwsem);
+
 	if (!msg)
 		return -EINVAL;
 	ret = validate_message(msg);
@@ -243,7 +254,8 @@ int hsmp_send_message(struct hsmp_message *msg)
 	 * non-NULL dev also guarantees virt_base_addr, the mailbox offsets and
 	 * the semaphore are visible.
 	 *
-	 * Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table().
+	 * Held under hsmp_sock_rwsem; pairs with smp_store_release(&sock->dev)
+	 * in hsmp_parse_acpi_table().
 	 */
 	if (!smp_load_acquire(&sock->dev))
 		return -ENODEV;
@@ -258,6 +270,19 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
+
+int hsmp_send_message(struct hsmp_message *msg)
+{
+	/*
+	 * Data-plane entry point: open /dev/hsmp fds and hwmon sysfs reads issue
+	 * messages from here. Take hsmp_sock_rwsem for read so messages run
+	 * concurrently with each other but are drained and kept out while
+	 * probe/remove hold it for write to tear a socket down.
+	 */
+	guard(rwsem_read)(&hsmp_sock_rwsem);
+
+	return hsmp_send_message_locked(msg);
+}
 EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
 
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args)
@@ -298,7 +323,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 	msg.args[0]	= value;
 	msg.sock_ind	= sock_ind;
 
-	ret = hsmp_send_message(&msg);
+	ret = hsmp_send_message_locked(&msg);
 	if (ret)
 		return ret;
 
@@ -478,7 +503,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
 	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
 
-	ret = hsmp_send_message(&msg);
+	ret = hsmp_send_message_locked(&msg);
 	if (ret)
 		return ret;
 
@@ -521,7 +546,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 	msg.sock_ind	= sock_ind;
 	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
 
-	ret = hsmp_send_message(&msg);
+	ret = hsmp_send_message_locked(&msg);
 	if (!ret)
 		hsmp_pdev.proto_ver = msg.args[0];
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 45dab9253c13..cfd1a8cbd459 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -79,8 +79,8 @@ static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
 
 /*
- * Serializes HSMP socket bring-up and teardown. ACPI probe and remove take it
- * for write.
+ * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
+ * remove take it for write to bring sockets up and tear them down.
  */
 extern struct rw_semaphore hsmp_sock_rwsem;
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 7a16d1ab463b..e9b2b809c0f5 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -13,12 +13,14 @@
 
 #include <linux/acpi.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/kconfig.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/rwsem.h>
 #include <linux/sysfs.h>
 
 #include <asm/amd/node.h>
@@ -204,15 +206,20 @@ static int init_platform_device(struct device *dev)
 /*
  * The socket array is devm-managed and freed by the driver core, but the
  * metric-table DRAM regions are mapped with plain ioremap() during probe and
- * are therefore not covered by devres.
+ * the per-socket mutexes need an explicit mutex_destroy(), neither of which
+ * devres covers.
  *
- * Drop those mappings from a devres action so both remove and probe failure
- * unmap them exactly once, before the socket array they refer to is freed.
+ * Take the data-plane rwsem for write to drain any in-flight
+ * hsmp_send_message(), unmap the metric tables, destroy the mutexes and drop
+ * the global socket pointer, all before devres frees the array. Registered as
+ * a devres action so it runs on both remove and probe failure.
  */
 static void hsmp_pltdrv_release(void *data)
 {
+	guard(rwsem_write)(&hsmp_sock_rwsem);
 	hsmp_unmap_metric_tbls(hsmp_pdev);
 	hsmp_destroy_metric_read_locks(hsmp_pdev);
+	hsmp_pdev->sock = NULL;
 }
 
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
@@ -231,7 +238,16 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = init_platform_device(&pdev->dev);
+	/*
+	 * init_platform_device() runs the mailbox handshake via the probe-only
+	 * senders, which issue messages through hsmp_send_message_locked() and
+	 * so require hsmp_sock_rwsem held. Hold it for write, matching probe's
+	 * role as a socket bring-up path. The lock is not held across
+	 * devm_add_action_or_reset() above so the release action, which also
+	 * takes it for write, does not deadlock if that registration fails.
+	 */
+	scoped_guard(rwsem_write, &hsmp_sock_rwsem)
+		ret = init_platform_device(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
 		return ret;
-- 
2.34.1

