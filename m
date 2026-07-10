Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D71642B31A;
	Fri, 10 Jul 2026 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694834; cv=fail; b=FbmtCgi/bHwm76TN+fV7Z90pHLU3GhJmLJuG2KWyRnKOygtmLj0eQR2Zl0v4spgrWCp2qrRn5/VwP4mraHgVZGWUGs7y4r7HXQiQLE59o7skNegzFPEPcGmIPvs0DkVekk4NN4HZ2uvZxJyJY9TjzmN4DIPHTG42gmI3hjb0BXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694834; c=relaxed/simple;
	bh=t6pcNxzgxUnlbOibqB4NYzZYzG/BqEyfso1F39C2H7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ROmYIKN0WhlcjwZeQ+ALCjwnajyuNGV+dlOfbp3VsqSujM/KcdxDonM5yX+1TvE8QPC4zOQORVGjn4tBOPFl3Q/TFCpnoZ4FcRvSBOMFTkMn7jXAowr42REMOnaZ+6d7fTCDkZoVbjMp5sc8N4l6ZOIgu0TKNNluGVHqYBbcPEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KCMAL8B+; arc=fail smtp.client-ip=40.107.208.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KCMAL8B+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shRP/g2AZBzAtXs5YYBAnjWkFzSA1iPfSjL0+dVuMhJl38gf3abzurGeZ4Mu1GyBV86kblSTYZvkOtn+wkEdNHxR/YX9EkAjGQz/xLrGvHxj3HGMgEdK81rD5mywC7luK+9tAFB3V61NmusXJOmJhFzzqD+F2BHVk3Bw+wCm5oLgPSQBaDfdDD4nk2Uyylzn9TbuinIWRkU9j3qWm7MR71+75l5UjCMHWxs6SRrGHBvJ0vZx1tuT9/isvKAs/Dy6XivkY5hPTC5XOh+y/h04Y8dEhyixanzFm4NpZmpsp8owvOrK/tl0bsuSJdntpEN2HNJEe1DY1CSu30V4baLjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTQqoRjCR1NTLftlLud0dF1a5y0lq6my/fM6coKXjdo=;
 b=qVZCgaAtY44UGBfUAG6FFNDB6c/ydq9NLMcFbqmkgCVv5QvwO3LVzQNYmGHYGLGIchzxbwIPqx5q/8lRHMyFKDX2Wluhz/FPqR7GXYFQYTuTbFqGhJOAYvaOsCYylVcNQ1JVaWkhqeI1umF1N01HUo6C9VHuXDK0Nm27hCy3FOiDJpZ3gh6HKTKciHhuZhuCVKSU3DLmLsS7uxgInxiyk1x6emOJwNwicPOcy7gwSwe+o7UCLnlKO04WgsMs09+voZTTh1jXjPtXfXdgUcmP33p+9q2FsQuZfC4hXdhv+bKJQJ01zcPA5mA6OsxLwahaudfBXwzsqM5W5+gpOZVBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTQqoRjCR1NTLftlLud0dF1a5y0lq6my/fM6coKXjdo=;
 b=KCMAL8B+AJ0mx/JTpuwU99c4A1GfR4ZJkoQHCvsKqUrQ7RXtHMLiHiVtMxYWuxwvulrQoYbGTgvNI1M+PbT1V6kf6VeZiI56j3M5CxTJ2uNTy5n4MtbTPtjiKBY9XrvB84ceDDdie9h7LawwtxuD0HEe4UtkGmTH00T4JLRkI1M=
Received: from BN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:e4::12)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 14:47:07 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::15) by BN0PR02CA0007.outlook.office365.com
 (2603:10b6:408:e4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 14:47:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 14:47:07 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 09:46:55 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 3/6] platform/x86/amd/hsmp: Serialize per-socket metric table reads with a mutex
Date: Fri, 10 Jul 2026 20:16:30 +0530
Message-ID: <20260710144633.879018-4-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: dde929d6-cb6b-4322-5640-08dede921d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NU+vBHjJIIG4bwpad0/r+MJ72myxKQgJ95zzGXgBSMu7KtXLXUfNl2MIYBErdKXwnZ+KdC6JW4hNkoLXLQW8QdwuGVQlo9TCr9D72bd+Hrfk0XaVHQvGiPowBPrV4Npa9e33dkSxJV38TUgLO/F2rA1Dh9ic4i6Itb1GQDRsRiHlbLGxTulL3PNhOfak/5vErzIe6Yk06wzxrWYZVsjSgh0vwiizp/yJFNMUi7ebPQIg7rEJ9ydUJKBSBzneNIavwm+HkxafvfcFY7kugZ6rJyXqCuIy+xYLJA9UH2X6vPwISCM1xWC2wO/FGOb+DBIWu6sjF0O159ndSV5HkDd1noszBG38WlcLWmZYL4lzDyAV6AH7vvbf0VtrWMzeB4nri+ZGMUbEP+5gtwLhOx8DHhgIZL7ZMjV+WqONTUYwjF4COtUiHxePD+hSKs69k2XFvpPs0gtHRFOkPSmeHMFE/c5a0Dhd1imkU5sW4/we8lRfRdLC5FkGm95/Bk8KN1vEE9Irl44Pi83gyziit8lOGbMD2CK0T+nuADq2/hqkOgHu3ZV/ACSWebq6EB53EnoLVMsK97ZlZRwzkObtSgHJrCLUudZKAJ4qGoTQzo2jyUx8mS0woaol9gSi9i4XWoTYGyqHgpVa78w34lQTypphClSTtXSYDqPWxlreOGl+dn/RKOy2fZbPpNFMcl5ddHNFaFJ1vqNOJ3gNYs8sEG5FNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SNS918ydmDooEDeWasTih4fMju5PstNNy4ZFx0T0NKytoKee1E3DmEbYnav0cJoSTQ+Y5piRX/c2tbiiZHs55jhs3ZEnhSDtb7IgDgDy894yZQ30iq53jv5ByT/f97jCoVjt1W5TPNl4x1ocFCIfZP+7kG8YrX1o48mj5tgTgYLTAFBnBr6LhgZ/Y7HrRh7HUiELuC/PzcYXhVZUijjU8CE+A1f/3n+a5C9AeC2fUOV24Rr7Mx0SInXepjZKrU8p9l32uDHe1dWaiYZDNkM7T8hyqx/xbFBoRU5JNHrZTodoHC8Z7dtHqylrifJFqb2HJx+/g3+PepymHM1yM6OSYeo1qpp80cuILhA2+jSYRwOoaq3HJm3GjzBeKsIOwNtV0ksZ5IEZfc5RZNpbAwba8KUnTa2uaPJjQyAqu8aj29G3Zpti+O5aka1nyBU8buKE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:47:07.2722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde929d6-cb6b-4322-5640-08dede921d68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600

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

