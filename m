Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183F2379EEF;
	Mon, 13 Jul 2026 04:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917637; cv=fail; b=kIH7qS0dilkAEXYjRvpTNG0dAoUvOyPrIvLXIlpYnMc0A/5QzMHK9ZdsGh87MgaBYeyPX6Nh6eO/dY+Db9F0PFoXP17pEE5Wn4PDOdQj/+NTmmRlgz7c4FCaSiI3KE5NfeDhFwWkY0GiKya4FkJa4WZIKlOFbxe08ZkkyArnX6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917637; c=relaxed/simple;
	bh=t6pcNxzgxUnlbOibqB4NYzZYzG/BqEyfso1F39C2H7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6LFi/EfAnfB8Ffpva9j3SA+X41n3mb26d+g5d+6KprrvJVv2gcXwqcyyJunUNNwMG/QdXyw8gZ6CjRfl140NlnbbMbPPP7YzY0kcIdxOKffeL0AITDwDCl2henucswAGQ4L4ZNDHvWwGKtvgS6XA2duNp2mRCyvR7RaTrB1jaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=efxYGroF; arc=fail smtp.client-ip=40.107.200.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="efxYGroF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcmFu1cewi/cZmjF6dD8BbVV4PghaKlKwxPq70IPomd4g42hw8pjI/6AfuM7OFifoGEOUgzDuYnjSc5SlOyFgJaiVSPglo+DUfkJ2VAR+PsFRt415dIzpj4NMEujnOlkV1SKoyt7qkuVzG5LNj9QNLvdxAo1OtvJFAYYTVRb/SlzZ//iheUsOZtfxsL1ZNkOiNkiQC10s46Qn4CffwjaWZSr9Eu30T+qDGV/yjL9BWK1JwYWIGoCFwym/AuvywKwpKaajIeAeApnkgTTjNmltDw9IMdaO+NCEmdSjfnMrZn2LoC7JvIk6U/Y1D/6y9Xk3iLX2qEDPBhVZK6jYZOvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTQqoRjCR1NTLftlLud0dF1a5y0lq6my/fM6coKXjdo=;
 b=VNc75k66bwKAeIGlgaaQry1Qttem8rl+6iYefcywWnj2m98GNgbCzIuSD4HFT6SA/flSwfv1+dpUfl4ExYnIRUu/graLDWV20BpOC8npaweG4OjK5lc1TlJdW2sEpw/2pnEbmVgafXoeQLz5P1m/Z0f1xXY/T86EdI7CBf38CWtXTYUjBn0F7awqWX6+1srKOo0HJOfRUTraUxpM0QIySFn5s7LQTcbjV19NK/pRFBI0SS+O+CWuL5KJ4xJwn7jY8itpHeFNSknhcUNXo3LnK8GfAsaNVDT/GIlmE+XGJU8or6892CgdC8aSXfpTW7Ft9uOLUTjCGe4A51HWAiThtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTQqoRjCR1NTLftlLud0dF1a5y0lq6my/fM6coKXjdo=;
 b=efxYGroFCEAZUX+C7cWRZInQKtXp12YjhhVWaXQnwCm3SXpdU8xi1gMAJsZAW8jz9Vdt5V+VOODEr/whjjHt5Q+xtWhjJA5DdLBFPjs43mh88weBW/+x8e0lTJcS66rkZ5+/qBilmAy+7rqTbHjwNpnK/iSj7OqvkzJMG+t7if4=
Received: from MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::7)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 04:40:29 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::2c) by MW4P222CA0002.outlook.office365.com
 (2603:10b6:303:114::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 04:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 04:40:29 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 23:40:27 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 3/6] platform/x86/amd/hsmp: Serialize per-socket metric table reads with a mutex
Date: Mon, 13 Jul 2026 10:10:02 +0530
Message-ID: <20260713044005.1194115-4-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e798de1-555f-460a-0c94-08dee098ddaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	j8TomYyAjOJFulNEbNOosiUNNs+Cs3CJS735V34ZT3R8lc41efrfwCFDeygB0B7dzFh1Su2hFr7qWRSkYLRNuwB831LVxPH9itT/aHS79ThQ/fj8FzCG3ASlI7Vny5So/y8ERWe9jlvVkcTWvo07s2LiihQwImIjHZCFOPYay+MflmTFuraJ1zdvsp/4sPjo4xoe/OaQ0xNIAEl9oclUVMhzVic8MqFVXrOpj9b1P0mZjZlVhauH/ExHTEdDj7eBC6/GEcxsv7t4QlxT95iibYKT2DMuBkmqX2bRoqZeovwIcNEYeKaGjN664D3FRJmMgK+ZWFa0t9FlZXh3AE0mhB0hvMD5U0THchI51CImerBrsbaDAy99ZKeleg4fyil+wf+KT2ONk+lUUWBwD3C5Ek7ewdDoybD2sl0sTwsavRKr3ZJdZ6x2onWmWgWTaYDqOrQDBfaNohAwOSNK2o2Z92n+5k212wVIc+jZcewsPf23FOFSRhESZTuiBQXCwDlqM7LtlLS+AoZA2tIT+YhViqRsAtqtm9Jq56I0xfMw8PBnoo8w+6Ydy9rl4iBoslth0y0wqzHJ1sMOQSp3fKbLyaaXS1U2xOca3L9LyQRAc6qV31Nvi3ReukHdD5ZJjvOBhuq+sgnElx67QNxaDUepfUD5w59iu/9f0WRCLQHfyFKQK8eY+hL3zP7+KBnkxDnN2aMr6QywR0KlZyqPNusubQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uo6oC0QEa+cpIm56f7Q9aj9wsCkprDYhCmiAtgo4w1p5+af8r6aTeBfW9kGd8x0rOiZA3lsfDw/N+VhgpeIbeDvcxTeiJeaPVWKX9SYXQbW07Y0bPqrAw6nosuSLBP7yiLwFPQIOElFsWKwzh6j//BMDZ/dZDCNVNVxFo/0yRWqLNaIBtZTGotwIfvubIPw1p+lEAnrOAknNK7DXNMZUAaA6O5UyXHsZ+OG22wfyOAhMCvleWfHU2kLzsZLl2OEjR1WcXydJlZmwhVp3JbQ4CrmALco7WxgXv9gQjMc1nXQZAQ1j+AKUBGR3GjRyFaDLLMZilqKxStBgcjYFG1pquewP5hg/lt59topEb7GEy6KDR9Dv7DmqJEzPEVzWRht17+Ov3roLGBssvRTDB97K4FaUnPK0hr5IpNLRz9eJdNo18Wkh9XURv3S6mPlEyMlN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:40:29.0653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e798de1-555f-460a-0c94-08dee098ddaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841

HSMP_GET_METRIC_TABLE makes the firmware refill a shared per-socket metric
DRAM region, which hsmp_metric_tbl_read() then copies out with
memcpy_fromio(). Two concurrent readers of the metrics_bin sysfs attribute
on the same socket can race: one can trigger a fresh fill while the other
is mid-copy and return a torn snapshot. (The hwmon path does not touch
this region; it only issues power messages via hsmp_send_message().)

Embed a struct mutex metric_read_lock in each hsmp_socket and hold it
across the fill-and-copy in hsmp_metric_tbl_read(). Add
hsmp_init_metric_read_locks() and hsmp_destroy_metric_read_locks(), which
take only struct hsmp_plat_device and iterate pdev->sock[] over
pdev->num_sockets so the caller cannot pass a count that disagrees with the
array.

Wire them into both front-ends' probe and teardown paths so the mutex is
always initialized before metrics_bin is exposed: the platform driver and
the ACPI driver both drive hsmp_metric_tbl_read() through the same 0444
metrics_bin attribute. Doing this in one patch avoids a bisection point
where an ACPI read would lock an uninitialized mutex.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c |  3 +++
 drivers/platform/x86/amd/hsmp/hsmp.c | 28 ++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  5 +++++
 drivers/platform/x86/amd/hsmp/plat.c |  3 +++
 4 files changed, 39 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index a23797bd1dd5..a092d7589bcb 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -639,6 +639,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 					       GFP_KERNEL);
 		if (!hsmp_pdev->sock)
 			return -ENOMEM;
+
+		hsmp_init_metric_read_locks(hsmp_pdev);
 	}
 
 	ret = init_acpi(&pdev->dev);
@@ -670,6 +672,7 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 */
 	if (hsmp_pdev->is_probed) {
 		hsmp_misc_deregister();
+		hsmp_destroy_metric_read_locks(hsmp_pdev);
 		hsmp_pdev->is_probed = false;
 	}
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 008f3c0b2ad7..fd36c8f142c0 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -10,9 +10,11 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mutex.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -415,6 +417,14 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
+	/*
+	 * HSMP_GET_METRIC_TABLE makes firmware refill this socket's shared
+	 * metric DRAM region, which is then copied out below.  Hold the
+	 * per-socket lock across the fill-and-copy so concurrent readers of the
+	 * same socket cannot return a torn snapshot.
+	 */
+	guard(mutex)(&sock->metric_read_lock);
+
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
@@ -424,6 +434,24 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev)
+{
+	u16 i;
+
+	for (i = 0; i < pdev->num_sockets; i++)
+		mutex_init(&pdev->sock[i].metric_read_lock);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_init_metric_read_locks, "AMD_HSMP");
+
+void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev)
+{
+	u16 i;
+
+	for (i = 0; i < pdev->num_sockets; i++)
+		mutex_destroy(&pdev->sock[i].metric_read_lock);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_destroy_metric_read_locks, "AMD_HSMP");
+
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
 {
 	struct hsmp_socket *sock;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index b0d67b93363d..ec92c2a429bb 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -15,6 +15,7 @@
 #include <linux/hwmon.h>
 #include <linux/kconfig.h>
 #include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
@@ -44,6 +45,8 @@ struct hsmp_socket {
 	void __iomem *metric_tbl_addr;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
+	/* Serializes HSMP_GET_METRIC_TABLE fill-and-copy for this socket */
+	struct mutex metric_read_lock;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	struct device *dev;
 	u16 sock_ind;
@@ -65,6 +68,8 @@ void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev);
+void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index b5f2120765c8..7a16d1ab463b 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -212,6 +212,7 @@ static int init_platform_device(struct device *dev)
 static void hsmp_pltdrv_release(void *data)
 {
 	hsmp_unmap_metric_tbls(hsmp_pdev);
+	hsmp_destroy_metric_read_locks(hsmp_pdev);
 }
 
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
@@ -224,6 +225,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
+	hsmp_init_metric_read_locks(hsmp_pdev);
+
 	ret = devm_add_action_or_reset(&pdev->dev, hsmp_pltdrv_release, NULL);
 	if (ret)
 		return ret;
-- 
2.34.1

