Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F7433BBE;
	Fri, 10 Jul 2026 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694847; cv=fail; b=epdqovt+noOoU3zKJ0WMvMqxiIgMA+FZkrDjb4RhM4rhf6llXMw3d1SvmQLYsExqGs6LqBMEIPDdlcLiVhBXldlmY5yOOKtNzXYq00DM1m+nLVwb4WYC+Kb2A6YIcQnu2InEtNlQ71LclOy1SyHZEybtinpG2gC+CydEqpaWYhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694847; c=relaxed/simple;
	bh=dRMqgPGqwnw3CNf5Vpy6lj3qhoumSllEDko3tRGYV34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=axzNFG0vHgA+upfbDbPoLjkCcx9tBQTVVdPji4l8MRTI4VQsoLiv8sndv4Zr4wiIycCC8pQrYwNs0vuB8ZXbAaNfFpehTCLDtAhz6clfnGDVPmhe2bORIE9BHqOeZ2QelpiWvoZgjjvkJEocTG9YXYNZrpsm+5fZ0WkF/t/dQ9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L4KkuQlR; arc=fail smtp.client-ip=52.101.46.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L4KkuQlR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiPpus9ufSuOBe4Et/QNvW69Ha1Z9Jt4ndLS5dsN+hX9LNNdokJ4i6uph3W2UztpUZXr1Ctd1z9yipXwEIiR3AI26gjUBAWqltDT/+0feP0lHm+Q/9vrHGW22nYFU3VHXeDFzTC5xYPx1tu32WKj1fAq6zW7cFGpkUunyvYm/mG6kQu8vPybQwre+7m2Q5KoOiPJmSpPyeI/0Jss9oA20Ui/SUFTIrjR7ZPL9sPTpRRTPpN0y/79vldTBurd5FgePnpWJ8uNz+636tPY9C4nNZ3QACc2aEanp43XReF4pwzJ8glNeY36hcgi846s2aChF8RXnNJd1foeMYKHoQSdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOf7VzH6EWlmXY/gyj70m8sf2AtZofjyd9N49/9CPVc=;
 b=lJIu89VSfFJ3BdGlPdWJocGbPt1o2xmR+hVhpGHgL9kALR8HO87egm4e52E9HDLdlukmFgMKXs8BuJjv//bPquxPhS9uN5NiXTQbSYS/rtwGQB1oG8uf/WDsg3jsAINLFxon6LVVqCmCpfLjd0rMe7dMh19SP6DjobC/3iuXIdf7pe5GW8qFx1HAyfCA5X1lZPuobN6gR+8vhjuJVwZXPUt9DxrPmsGgg+y03ARFlcQNSvo5AfDS9SEwapSQfWiVaEnOsUV5f+98AQQQf/5nwf8JQTRw02JRhfubd6/+QGxGjNlW3thyMly5JboGQtofKBaLOiQ2kTu2JCkHmnxTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOf7VzH6EWlmXY/gyj70m8sf2AtZofjyd9N49/9CPVc=;
 b=L4KkuQlRHm2BouwhBmGDpum3kd4J3jIz/98vHfWFI98Egd+L/6yAjQvMZunW4aSLM8B0ExAtGM7QcOGDWlPPniUD7HKV5EKqZC6zV/FyLb6HcEqYNQBne+E2Opvo1I4JgTG79T/hHOF0iEM5G5uOGxeZYwW6Tscy1L7kIDqeXy0=
Received: from BN0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:e4::14)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 14:47:18 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::6b) by BN0PR02CA0009.outlook.office365.com
 (2603:10b6:408:e4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 14:47:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 14:47:10 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 09:47:01 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 6/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Fri, 10 Jul 2026 20:16:33 +0530
Message-ID: <20260710144633.879018-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710144633.879018-1-muralidhara.mk@amd.com>
References: <20260710144633.879018-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a45639d-f71a-4f2f-f400-08dede921f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|18002099003|22082099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	GXe6pswMteB/HKSi8P/9sml94anCEwIlEMPiOcQAaltJz62z0LxpZ+3rUJCgXakEUOJPI+s+FOXv6Jenl5bXmmZRuv8k0433xGlLgN2UNF7CvSMh/0FBt0mSdaopvW3G/TIDoEGopPThoDjM2RvcgVrFGnP83MkTPU0MwBLWGIZAXXywquJz6hge2MniBWhdS058bVBLqquM+j6b3qDqEGD47pLVJAiCV+0VKmRWuNZaz/kHI4GboZHbFO1nXQKLDLounh64Vb63N6W0TpB/Ds57qBmxEMiSN6r25x/5IuBRdD/4BOhJ4uLv5SAdgYYxElJdvtoY4sZWv/QKzOhZCRc10ARSlxzqbUd3tmTIqpNQFk61T1yhFXXzgtKvFd2pi+dZ5CbJwfP9XPL9dHEVljE8bhIs3IKN6fbT0kk8EDXAOYiJ8+jnzCChN5emhN1qRW08gtWumy0SrJd7xbzQYlKsOAKKQyFkU7bRjo2tioXoQrfXEdNB3Wt2qiqB87YRrLRnDDvMjy8RFa0Gf//mN6awbCBE7vsAn+06Qivksx/OH6Qh5Oz6excrDB9bX/4TTa8pZNgulWh8LH0bVpSMp0Dmf9dOVDfioP9eNxutJVMhp3ULWxXHmnA2AyJ8v8BSxBjRFzhiMXqxJjlGftkCS6HHG+od5X63wmaZ+RYwzIp6JxLq7OkWU3tEJ4kxrScbj9UDW0JKbD+ppbl0A9ssnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	twpKqt2YNDKFSC4KJtrXu4WOCQLPA0sdQZbVVQ5S5Bn5PqDVB+Ot02Zp574jpqwOVeI7eqZGSOPzL5PRvYhtjvvWrEHgsJwstNe2Dxst3C1Q3PP42OflwqRVTJH5U0AAnMCiJuNatNPush4RlK6b1wnFC5yImDNb1lgJGRn40FLVwsMRBQsPaqzT+tV1uKr32T0hg2OUM4LkSCGGtK4i6kCz32yP51ymBbV7mz0s4Ypt8VsuuV6D8FwvMLQB4Mk0B0vT1gpjZLUX0gatfbKTVnvMFxZy1wJAIQ3jvGR5RmOaCcBcUzU+e7xa0ZBV82xiXmB6KRx6I7xPzG6F3MwY/fXYowcVILQcpCbimmD+hbWQbYjfIT4AlDTSXkLTRmiRg3jDzKaKa8rnEjuujhTjpwddPBdSP+Xe4BKf0qapc/a9sjHwXKHAVOvot2thoz4A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:47:10.9199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a45639d-f71a-4f2f-f400-08dede921f94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780

The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs reads
call hsmp_send_message() without any coordination with driver teardown.
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
 drivers/platform/x86/amd/hsmp/hsmp.c | 42 ++++++++++++++++++++++------
 drivers/platform/x86/amd/hsmp/hsmp.h |  4 +--
 drivers/platform/x86/amd/hsmp/plat.c | 24 +++++++++++++---
 3 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 967307abe641..11206138a15c 100644
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
@@ -258,6 +270,20 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
+
+int hsmp_send_message(struct hsmp_message *msg)
+{
+	/*
+	 * The data plane is lock-free: open /dev/hsmp fds and hwmon sysfs reads
+	 * issue messages without coordinating with driver teardown. Take
+	 * hsmp_sock_rwsem for read so messages run concurrently with each other
+	 * but are drained and kept out while probe/remove hold it for write to
+	 * tear a socket down.
+	 */
+	guard(rwsem_read)(&hsmp_sock_rwsem);
+
+	return hsmp_send_message_locked(msg);
+}
 EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
 
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args)
@@ -298,7 +324,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 	msg.args[0]	= value;
 	msg.sock_ind	= sock_ind;
 
-	ret = hsmp_send_message(&msg);
+	ret = hsmp_send_message_locked(&msg);
 	if (ret)
 		return ret;
 
@@ -478,7 +504,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
 	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
 
-	ret = hsmp_send_message(&msg);
+	ret = hsmp_send_message_locked(&msg);
 	if (ret)
 		return ret;
 
@@ -521,7 +547,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
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

