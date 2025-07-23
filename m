Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3845D13A265
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247602; cv=fail; b=Wc6d0vbgqxVxyC60I+/TXBLr8rV9c1sqoqMUh00VXKrUdmaXmKuRHoc0hfOLOKaglJnxUjJvx4L1wkbEgc70AwskKY6NCjf27tBCJ3jtFfwQ+adzzyfsrEEkpLb21D9gNHIxIF/ScONdDYS2N8ZfOM4vzqtYdxrh23vlpXy2LN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247602; c=relaxed/simple;
	bh=L1HWq/TKq085+LWdopBmXnFXOQ47N0dztkPc+4DKlYI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LDOTpRuKrG16pAVLtw+75zFjUp1KM3klmBhQf4QfWAFR0v0ZTlquqSkDSucVcaBE0KXwdb60VreiEV5t6K8XuEdIzMzB1BEB2fIJPXhZCfFBRMt4Y6uED7orliDMLYMmnXR19C/P1FbVWNXPHHwGSN2hudMTjAeoRom6cxVouf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J1lY/xmk; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J1lY/xmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIjo2H53xdBbstjjfoimbM54y7l6DctDWxhLtoXFfQ9cvxYF70x8keSQ1eFEzbGRqAtBf4fq2TWhMs/nTfqvZ5RCVpmEvf8iKFC+VyKfpJlcOupPtEOxH3A0hRrW9Qu0cVKPHRlHAXU46AhtSB4KFEF29M6cDJVM3xxwznUwZEcj/ymtOcE4X1SYqJOmVsutzas2fhD0/mpHGRakAM5m4kH8DdqYLVAtGIwwXFZDmdRi7UP+j4eOXzkiikKSPknKir6C6KvbNr2gcWk/PBaUtBrnBBfRhXU9ppdkwBzi05OkOhAoRdWQ+7fskC17mgjQaaVFk48tReyXiH5p9OBCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsMlf3uEMCwCZAAdeNn/PhQNfwnzprFSriotVIbuBb8=;
 b=joi4kAlvM9gT0JiKaoP/q4L9+/WkedAGkekU1LtXzVsaJnYCVIoc1fBWnt+f+RAp86rTul9d5lx1lhKaEzGlCDeDeVo2k69Z4Cf6c0TCH7DmOQx7tuPmlW+kJ9+z9biey+Zsy6ciRJGwd22RQfU5hdnmW4OMK83IjXVDuDB6YwJfkGG39g3WIF6uAYIqba3O7LM5SI3iQaD2nCGhr2WJ7a2852ZVsZr73MLpVzPGGjujW4WEHa6evM9s50a7sr4Pn1YtfB5XR2aKcA5GWMEol2XQ/1NO7s7MmL8BBk+gxz3avzpHVEZ8ruRmAw+8FfHPW2bSmyvXDT48bb0yfW5uLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsMlf3uEMCwCZAAdeNn/PhQNfwnzprFSriotVIbuBb8=;
 b=J1lY/xmkJ1hnCpdmPtLXvhNf6wf77Acsms78xNR4HG6C6TAUleTj3mkUWZTWQQ6S9ZJtUgBjwAdrUYlMkN22ZCU+0qgkr2GeD0hfBXrwNIS0jdzj4UsjIM1FSQ6Xs8CitxufKChlVbNjoz7EtoTWf7sJqrTjSIyseh1er29jUoQ=
Received: from SJ0PR03CA0152.namprd03.prod.outlook.com (2603:10b6:a03:338::7)
 by SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 05:13:16 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:a03:338:cafe::3) by SJ0PR03CA0152.outlook.office365.com
 (2603:10b6:a03:338::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 05:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Wed, 23 Jul 2025 05:13:16 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 00:13:13 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH v2 2/4] platform/x86/amd/hsmp: Add reference counter to track ACPI probe and removal
Date: Wed, 23 Jul 2025 05:12:49 +0000
Message-ID: <20250723051251.3009625-3-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: ceae64b1-557b-4b01-ca9f-08ddc9a7a19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ME5nvp7ILWDUdFzGuzHDw0LbrpnJweV7YraeduNerx6DmVdcqcW5D0KMoCar?=
 =?us-ascii?Q?7PaP2+Vvd1/ZSbvBD5DQS8ntIuRMjywiH64QKXL10wfYS7UPhnjld2U9+q/e?=
 =?us-ascii?Q?0CLMf7liQ/9uIAp00nDU2lKCYByuIRWcNdxbIRW1bwG2pUsFNirVfYVg1YSs?=
 =?us-ascii?Q?1VSjTcHtOtyhxP0+TikB3pifp9ijJvPsuhvQpN0djMGWBZgffLfl04jqlpAI?=
 =?us-ascii?Q?5PoKMqLJboeoUQvImIexV8Cd7chZIvyvPgrssqfab3fjqErDCn6+FdgSMwHc?=
 =?us-ascii?Q?IAFKhqIcllex/XwmrThn7daahHmyUb4R9RtYi+5URIxHN0fuWBbOVNNH6c6F?=
 =?us-ascii?Q?N721I0SzlgTsRQD2wyJI+b7EMIWYkaQxwRTCqiqCYRL4E7vxxpMSrs0gieMy?=
 =?us-ascii?Q?TB/WFpvtF/IiHMhjpNHOhPCJosPrn0sdt1Nf32UqsiJnOH8c2pgubZg4VC5r?=
 =?us-ascii?Q?gm3Dx3PvuFPPuMUWDkyUxvas1x05peXdb70+CnXEXRszuYLmSj3vU1S/zQp1?=
 =?us-ascii?Q?V/rWTGFJo386qJyOJPNzUB/mrparmJEp4q+vlSU4k/5d0FzlWMC/G19frXiZ?=
 =?us-ascii?Q?mWhb1QujamE+i3ZlMBhsvAkRzKi065gntENk6J0s9st02L1AKe6KyU8CuxjE?=
 =?us-ascii?Q?huVIHJUOwX85u3EL4dWzN1w/20v9zUJuqfRrxUTxa1hMnNxCEArUwvRH9scv?=
 =?us-ascii?Q?+IPtVoJUgxE9PGwCR8JbZy30w/1iolIw8GATPjMTvdAtKOzqTBL2p3sPneVA?=
 =?us-ascii?Q?kZVs6hOg4Mi5v9X+95q+92HV/ixZjf7t3Vd2BbyQ/ddem4p0rj/FkDRhPFSc?=
 =?us-ascii?Q?rML2+cc+bhv9wsU2RrouFVNGY6SrRkpYQhrzPKZA905Uh10yaCYyN4n+EJmF?=
 =?us-ascii?Q?QEPVDxNz6ITvmg/y+VBY1m5fbv3uT9frDg9ofhDbcCTZ2TewKgQctAN/i061?=
 =?us-ascii?Q?wti+/e3Nc6oABwyXp4ESnr+/PvuILH+6Q+YrgHHB9oXTe2CASRi8y0aq3dKO?=
 =?us-ascii?Q?W4LBsVad/RtjB8LtNzUlFcq358+/wPTXvlPhCh99Z8w6zktKGkm4+Bp8xqm8?=
 =?us-ascii?Q?xcj8C6cb9/nxinCYPerRxYh2hA20kp4LHLbQUkN0dgrw/+UIL8izxwSKkPJN?=
 =?us-ascii?Q?ILdRef9c4b6VRgi6QIYcYSiwH28sZrcGH8rtlh2d/ZujRkqheoJ8c7KtMGwa?=
 =?us-ascii?Q?dIBuRh3Cd6L+JqTOilzT9ZGdLNjoKzgy4wS8eriuQwkt5zIbFO8orZiWBcXv?=
 =?us-ascii?Q?FCyvdskQpqj9SKhBLVq/b2vDsKYdOh0GOv7nF55ACRZs3Hw+ow1ospukNUx1?=
 =?us-ascii?Q?QXl3pEkl0g7J4mOU0s8cDPg73kvWwY0GGamrCbZRbq0B3YDEywbVZq0hFJKE?=
 =?us-ascii?Q?krt+0wBix6WdSWX1cf5ot6BNWSVrKH7iZWigmOchcee4GFBaGoxMeOr85hYp?=
 =?us-ascii?Q?P28AoLeNr305lvB1TFH+n2N4fr3AwSrZLmvEzinflYaGCQdj+Kzf1VJ1shYG?=
 =?us-ascii?Q?xZq72rwISiIfIWWMxN6lGcZPcPMumz65Ya6C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 05:13:16.3419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceae64b1-557b-4b01-ca9f-08ddc9a7a19f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177

Implement reference counting to ensure that the memory allocated for
the hsmp_pdev->sock structure is released, and the miscellaneous device
is deregistered only after all socket's removal operations have been
completed.

Also replace hsmp_pdev->is_probed with hsmp_pdev->ref_cnt.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
New patch

 drivers/platform/x86/amd/hsmp/acpi.c | 16 ++++++++--------
 drivers/platform/x86/amd/hsmp/hsmp.c | 17 +++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  2 +-
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index b981ae3157ea..232105226407 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -23,6 +23,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
 
@@ -590,16 +591,15 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	guard(mutex)(&hsmp_lock);
 
-	if (!hsmp_pdev->is_probed) {
+	if (!hsmp_pdev->ref_cnt) {
 		hsmp_pdev->num_sockets = amd_num_nodes();
 		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
 			dev_err(&pdev->dev, "Wrong number of sockets\n");
 			return -ENODEV;
 		}
 
-		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
-					       sizeof(*hsmp_pdev->sock),
-					       GFP_KERNEL);
+		hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets, sizeof(*hsmp_pdev->sock),
+					  GFP_KERNEL);
 		if (!hsmp_pdev->sock)
 			return -ENOMEM;
 	}
@@ -610,15 +610,15 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (!hsmp_pdev->is_probed) {
+	if (!hsmp_pdev->ref_cnt) {
 		ret = hsmp_misc_register(&pdev->dev);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register misc device\n");
 			return ret;
 		}
-		hsmp_pdev->is_probed = true;
 		dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
 	}
+	hsmp_pdev->ref_cnt++;
 
 	return 0;
 }
@@ -630,9 +630,9 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 * We register only one misc_device even on multi-socket system.
 	 * So, deregister should happen only once.
 	 */
-	if (hsmp_pdev->is_probed) {
+	if (!(--hsmp_pdev->ref_cnt)) {
 		hsmp_misc_deregister();
-		hsmp_pdev->is_probed = false;
+		kfree(hsmp_pdev->sock);
 	}
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 885e2f8136fd..39804ee848ba 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,6 +12,8 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -454,6 +456,21 @@ struct hsmp_plat_device *get_hsmp_pdev(void)
 {
 	return &hsmp_pdev;
 }
+
+static int __init hsmp_common_init(void)
+{
+	hsmp_pdev.ref_cnt = 0;
+
+	return 0;
+}
+
+static void __exit hsmp_common_exit(void)
+{
+}
+
+device_initcall(hsmp_common_init);
+module_exit(hsmp_common_exit);
+
 EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
 
 MODULE_DESCRIPTION("AMD HSMP Common driver");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 0509a442eaae..1b16fd6a38e1 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -54,7 +54,7 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
-	bool is_probed;
+	int ref_cnt;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
-- 
2.25.1

