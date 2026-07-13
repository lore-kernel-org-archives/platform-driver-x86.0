Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40737FF61;
	Mon, 13 Jul 2026 04:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917646; cv=fail; b=j9zdu4HZ/4onUOuB0lRJnEyzIlvSc6/WucPLxwceIVYGsKgzbRiSElr2w2zR3qZPQPoLKI0wdpuuOXqixcQhCI9emwfT2a3p9A9bNUQmVmyf235ki058kX/xcobZhckAghmz+cPlyQLqbj2POyflshP8wYQdggKdZMRq4h+qHzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917646; c=relaxed/simple;
	bh=dRMqgPGqwnw3CNf5Vpy6lj3qhoumSllEDko3tRGYV34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYrsr2p9D87Bl9V5TUZJjknABVga/qibIwsDxCHdv1X3p1o2fNJdklZLMjZfcPdwu4k6QrkNklSPX0RaKfYBppsy0pPwBGLgs2dEWcrgk+ZAd+Cygrbb06XTo0IpLpfXqGaazEQtPQ3hdWsgORDN2NhXd9r4+dsebkG3HnfyAeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qxwVdyaF; arc=fail smtp.client-ip=52.101.53.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qxwVdyaF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOzw1er2V8THyOyt3mZEfjXfUTvmX/9VyOm+PMQvwKdDYL7gYeZtruZBbDEmQtB37uZ/gVZ7RyxocRGAMqKr97P5F5odv8V7oD9O5BPGuYepVCzhtYF+2otpL8fpHjW1eReh3irOm5HnRjmhgF/toUYWAzOlvhFtW3P6cHkIobrJqgVtNhRyrSUbngcoODy44p1MSAIl48Y/ZhZ3QQxuCWGWtOLKaoWhOpdgcS+dCS5H8areoTVFDMdP9SH4TlfNroKvQZePfINn2W+gLHefCOQZhVqfQ1yEubyPEbTfR8FGuralo6H3MqNzig06DO10FR2dWs8tAIgN8ZLNwKKKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOf7VzH6EWlmXY/gyj70m8sf2AtZofjyd9N49/9CPVc=;
 b=I1nT+O71BzI19kAum9ybwEjZF5/cHWJk22l65SKSYhu0mGIX9iMtjkKSbvGzD/t1tAasWy71n3s0OpChKFsRsjqijlFCsz84MxvOTViiTiru5YWGvzDdSFmbDHEnE2RmLFjPDqORV3sdjD8hbf8024+oijFmIjJ/e6/wrmk+navGbHTWPeZp8jadNJcyqBDbjPLJ0E8E1Nf18PVZFUDk+5+F9flgRpJbTbcbm3vjSuUrO4ommunIjA98nVZ0iZyHyN6a6foPlUqfuuVnnOz1DoDbgZ1jGXDsQWowxFIfokmVZv1I5X9mjdwCQfrPurtzfjs4NVnpolpXhC1voDnonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOf7VzH6EWlmXY/gyj70m8sf2AtZofjyd9N49/9CPVc=;
 b=qxwVdyaFm1yMJaS8hrMEOtmDcYF71coZPfgNwJeotUZezn1xDURXg3fyjViV+TFFSYP4TWpgZBBsiCxYSzBy/qz9pOyLCZSpyI+o1+GOzzJ2fMziZRL57W0lDCbpqtCXsIJX9sKFr41HDgw3JFNnK9N2Vzbu3XLe7t0b+c5nnug=
Received: from MW4PR04CA0375.namprd04.prod.outlook.com (2603:10b6:303:81::20)
 by DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 04:40:35 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:303:81:cafe::92) by MW4PR04CA0375.outlook.office365.com
 (2603:10b6:303:81::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 04:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 04:40:35 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 23:40:33 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 6/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Mon, 13 Jul 2026 10:10:05 +0530
Message-ID: <20260713044005.1194115-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713044005.1194115-1-muralidhara.mk@amd.com>
References: <20260713044005.1194115-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f59ddd-363b-4492-c3dd-08dee098e154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|22082099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	MUkXtp9k+4o+NBJtqnaj9i89r8EYamd9StIx7rA0oygAam8V4iCnRVGz+ow/J/vxPpA2j4/pWGKXmxBHPp9skOSpNnhmAKk4B1tn6wIqTZD9oXozAy0oaCOvyzq6R6P+s2EJN9/ar6WflzcY94rFB7gkdT8vjKA2F1wG+gIOEJ0jDMs4YDPFTPWEX9dWU3Pk/hoHjVkk+c4PyuEkNGPeipswHy7lxPH1DGBzbEtjQDVnKhn4cd3K4dSrP7zoCTKFrFUVgwMQ8YPwqkfvheR1F2xR7bkam/BtZP4C3c6om3t2tfnhlhFXc5+d736+eYusKXDfebzefaFSKY6bMvFnl+moFcp1qurnrOHDGNUS4SzxGR4FrRfT2Ziq4A3jDVz8F47QkUU4DfHIPl3dgox5t105Q7gYIDxtylvrz2odAZI1VQBmKb+U5pzMLewkjDiSrFsQwglmbNbFmIRMgbgJC04RX2IDAPqiJXWxTcZXtCUsGdqBbH8AbO3+UQ3xmlfYW48WLj39KnVMfwcgCjE9QaSsPC6KZKdastQ3nHInIwN9SgJJ+wrl6TicKULwNDoZ3QZlD+5shdZDjyMWFoBZ6qV/zmcgcANsEq9e9j+Ot3anNur/WmNXvp6rU4nFdLUbMFQE88rSlAVIogpw0Tu0jLQXJK9B52L0YX5Is4coI9yP8MsTbbno4SJ91eg31Z0LSvf4lZnP/uLkcITcQeLFcg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XIiU1tRIsO/1lwxUNotajttZfNuyjFxtS2NyHzKEsql3adFy/JwfbcW30E7a4jStR16+x8zdiNT8szPNbosO8fmOBfQF31Ca6aa7NLavAnMOKgQlOJKQtOxgAQmrwpMeO0XeFkbKX4id/yK4gNoEbpBjSRLnity7Qv4z8mqGmocHBeb4ulhZPoYXAIYzbibe8j9mFenmwoG9dGWPm/eMN+BIKMnnbfrrmnkTzQJQ965rC30aIYz1qMJpimkkA6BGThMT+7E+OJn5DZrYEgquyhqlWvrzwetVL5i2g8P4TCjhjnQJI5UCfCvsEa+pe1NQMP3BpOWLq6xzQN/se0HyA9tqrgoN2pgVJrDIukguRfVfPEf5sKIGH4k7hplcbmOdNLF58tYLq/snAqHTef5QLykGvHql3NtrRvIGEZohRUfzXcyn9WKBtfcpvQEKViSm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:40:35.1955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f59ddd-363b-4492-c3dd-08dee098e154
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915

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

