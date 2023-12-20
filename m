Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189904645B
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R9bpHj+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yr+lrA4A4zZG8IJ7rFI2YB691gyVQbVE4JqTOaFWlz9mQaREYqvsRZL2OGX2i0cJsYyLF18FT7KEKW7XG4OgOUSRScSZvajJF3+/E0naDA/ouwDfJMgvcNUwbv5GVsQst82oer3LrP58t6d8GFEuxqFm6WN9BKtnCFo867q/niJXlRryPsLpf2Y///edOoYWEuouKEx5fewk3UNrbO4mqCTKlwOMoXz39QEVcwSrnwE+cH3Xr65Be7ZDbof+hVe/e7nC2ifw1NBdtCBSpF4GYQP0DLt7lgxlH6+dNZ9SI3P9ZExBKn7cud524Bl+JtNE6OJsUuqJ59YBZhMgf4oY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gg3Onmr0jf57XPkohHdgyA/Gg/Pcj/9XyveR1zIeFUQ=;
 b=nHHsZ+Vmu1KdSt8uh7pxT0FJ7rk13EtBBrHJt8NkWzw6f1RakOgKCXAkQwv1ILX2uTMsa8OZPJ64FMINfofWZAYvB/x18IJBzpDuqql76cf8M+LKF3piVvZUB0GKb7GT4gZHGKyQGWetsLXhbbXV/vqR2KZUpIRqMN9gMTIT0qM0rEJO4prl+cIMmV30isF9DFtSAdLzlyXwq2P5qhcua0JX3lupOFFLTcNHYGtkFQU2g3CSpr//iFZ5nZ0B2KtOh9ea1+B1zyL0CLWLeHtumjTqNo81GnFjpiC33jY9Jpr/Hx7g1sMaEMHFJNH9WOUWNFfFNIndLv424AaO982ceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gg3Onmr0jf57XPkohHdgyA/Gg/Pcj/9XyveR1zIeFUQ=;
 b=R9bpHj+P6hrmQfeZaRnIzGCMg4zG8V+jwUnxGAmxq9KFRRB0HYZZQRPWR2FH1YhoqVGMfBlULkcKq9iVseudjortO1WZRGUzfieUCzKy5ty8A3zexAhcINW3h98Ogr/01hTOvIf/Myopg3oYEe6vOSvqk21/cFI9ru1yA1Buv7s=
Received: from BLAPR03CA0133.namprd03.prod.outlook.com (2603:10b6:208:32e::18)
 by IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:55:48 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::a0) by BLAPR03CA0133.outlook.office365.com
 (2603:10b6:208:32e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.39 via Frontend
 Transport; Wed, 20 Dec 2023 16:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:55:48 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:55:46 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 1/7] platform/x86: Move hsmp_test to probe
Date: Wed, 20 Dec 2023 16:55:22 +0000
Message-ID: <20231220165528.1351200-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220165528.1351200-1-suma.hegde@amd.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 917647f1-c94d-4097-00a7-08dc017c844a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xo38+VDP3vAQvjYgtZ6I4XYI5OfPiQDLCGOT5v8T7D2jq6zSvBJZQhby1AR8VGeWbYX89gVxPw6/bCU+FutS5vgVhCeoXC7YRo0jGW3eu62hccOjM4mBdIkRA9XEqiuI4mrJaPFS535ZEg3WwaDo4LpwrG2XdGF4oMmQsvwWobMwUrOwMfTjKBvNXbzBSqwHipGWN8cpvE0HjIVos615+iP4fTbg4rCZ6YLjbEY1R59PeDE2OGXlVgkD5hpkUnikVyOSPWbyjjHTQsEFEqd5CO9PuOe1DaVRWUf+g5pOuxkCn97cA/WIbkCQnMAIZe1XRGG6/4wVvNbK/Rga8NjDNESc+nBwYD+K1B1ixaZ5UVl2BRcolSMAwSo01qOi3l5rcHtBhBZoZdYQ1qaFA9M8vl+cF8kMHh315FJH2vrkbMqmUnmBXgDmnESKtI8SYOUvyp2b+HyHxu7GP/Bo8P7cY3h4Q5RtuVAlT/qglU1opFyd8orvbYzDpIuX3mPTON+VUm3aZRwIPwYs/dtdFMMnZjnzO0qAdKlLhdf4F1Apg1//jPjMUJgqCuX/bZnIRijszXHsTwzB3YLIy/j2aVVmbs7QpA6qexsXkh+eq66p2fDdzSueX52G8gOYWZrvmQYoE7v0E/8DrWfHyin4mZxiQo0OLv5VPupP6+fTyHCqFJ2quPyK/dPPu7CrRX7FU3J3ReNjU9PeUHaLRSI+3/r4PmkZcd/p6Vt34KEfbm9cJ1ndOPeFtJDUCF8w420F1ojZNvBgWTo6qUW/x8aHzQCUxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(36840700001)(40470700004)(46966006)(36860700001)(2906002)(47076005)(41300700001)(86362001)(81166007)(36756003)(82740400003)(356005)(6666004)(54906003)(6916009)(8936002)(8676002)(70586007)(70206006)(336012)(426003)(16526019)(1076003)(4326008)(5660300002)(7696005)(26005)(83380400001)(2616005)(44832011)(316002)(478600001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:55:48.6313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 917647f1-c94d-4097-00a7-08dc017c844a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412

This is in advance to supporting ACPI based probe.

In case of non-ACPI driver, hsmp_test() can be
performed either in plat init() or in probe().

however, in case of ACPI probing, hsmp_test() cannot
be called in init(), as the mailbox reg offsets and
base addresses are read from ACPI table in the probe().

Hence, move hsmp_test() to probe as preparation for
ACPI support.

Also use hsmp_send_message() directly in hsmp_test()
as the semaphore is already initialized in probe.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Changed since v1:
1. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

---
 drivers/platform/x86/amd/hsmp.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index b55d80e29139..3c17b488f4f8 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -244,12 +244,7 @@ EXPORT_SYMBOL_GPL(hsmp_send_message);
 static int hsmp_test(u16 sock_ind, u32 value)
 {
 	struct hsmp_message msg = { 0 };
-	struct amd_northbridge *nb;
-	int ret = -ENODEV;
-
-	nb = node_to_amd_nb(sock_ind);
-	if (!nb || !nb->root)
-		return ret;
+	int ret;
 
 	/*
 	 * Test the hsmp port by performing TEST command. The test message
@@ -261,7 +256,7 @@ static int hsmp_test(u16 sock_ind, u32 value)
 	msg.args[0]	= value;
 	msg.sock_ind	= sock_ind;
 
-	ret = __hsmp_send_message(nb->root, &msg);
+	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
 
@@ -504,6 +499,15 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	for (i = 0; i < plat_dev.num_sockets; i++) {
 		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
 		plat_dev.sock[i].sock_ind = i;
+
+		/* Test the hsmp interface on each socket */
+		ret = hsmp_test(i, 0xDEADBEEF);
+		if (ret) {
+			pr_err("HSMP test message failed on Fam:%x model:%x\n",
+			       boot_cpu_data.x86, boot_cpu_data.x86_model);
+			pr_err("Is HSMP disabled in BIOS ?\n");
+			return ret;
+		}
 	}
 
 	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
@@ -544,7 +548,6 @@ static struct platform_device *amd_hsmp_platdev;
 static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
-	int i;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
 		pr_err("HSMP is not supported on Family:%x model:%x\n",
@@ -560,17 +563,6 @@ static int __init hsmp_plt_init(void)
 	if (plat_dev.num_sockets == 0)
 		return ret;
 
-	/* Test the hsmp interface on each socket */
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		ret = hsmp_test(i, 0xDEADBEEF);
-		if (ret) {
-			pr_err("HSMP test message failed on Fam:%x model:%x\n",
-			       boot_cpu_data.x86, boot_cpu_data.x86_model);
-			pr_err("Is HSMP disabled in BIOS ?\n");
-			return ret;
-		}
-	}
-
 	ret = platform_driver_register(&amd_hsmp_driver);
 	if (ret)
 		return ret;
-- 
2.25.1

