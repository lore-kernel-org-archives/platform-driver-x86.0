Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2072.outbound.protection.outlook.com [40.107.212.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161B35991F
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 17:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5NnNjnP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ehc4A8AhS+bojuUoslPz4bk+vkw09Ao0/kG/3ibrKNqsGehhmCVIjGr3GpD8okrVcd71WyRP/nWV7EUGb+tF2m7/H6G7iuacGy9/VTS5bEOhCG6XEJfMCmrDlNgMhSdfM1NuTxvNxbsx4pW3WXU9+9l17X8P8GnlFX8Fr0eN3inO8R0BMTWZpoQMOmp3Q91JHXTG3bzIbxHw//C+4qlb5pqXOkNwrs14nPfh+0fxa51YGiUpo1RO7768qqSIRfsmZieUkSjc7cgj1YnTBNyIe+6+I4c5UeVchkcF5gm8+JPUOZYOmOInMT3DGox0GJ0QoZmrkrOdW84tFMuip2N2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kozrjh9DWxMDmk/hgTkBybT0QD+y4GLrqbG3aNz8WFA=;
 b=jWkb9rHdDAYZwvq0hUfS04HZB9fbyDEUhUn+MHLhi3IgYOhSf5d3v174542XpLz70nshgSvnWLNpzXx9WvpxNMKwEZZ6pUWKBEuvvK3EohqmU5UW8Y4upTVK8/czc7v/gkI4P5ls2OfivBEYn0pUhHSKpMIX3h7LhuA+gun7WGa/zeRjg8ysucNz9x3cvoOMtCO51pQFaS9Plktzt9ohuOaiAHoQxdGxggR9Oe7qj3Em+qm9m7FB67nVT7m47JbvnH5SbPdAOlffRkPJ3LBf5Qq4rooHLkIvCl4PLY5PCb7+qv1ntDiE29Ky67GngW6FkcMGTedhoNez+1jmy950lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kozrjh9DWxMDmk/hgTkBybT0QD+y4GLrqbG3aNz8WFA=;
 b=5NnNjnP5cxzx1MGIiyhBKFNheHEOqc3HBmALxkUFoUwQuSdg47UxgVM2ZKSyLmRMNCyOTj2WdjV+HmXSthLYtm4dOmR+gohe8fdkRr7dEVcWCEMLIOmlqyaV22DfNz/xO6g1UxMobD0oV8+2F2Gt2865W5rFIUcIUZYttZD0qJA=
Received: from MN2PR15CA0051.namprd15.prod.outlook.com (2603:10b6:208:237::20)
 by DM8PR12MB5463.namprd12.prod.outlook.com (2603:10b6:8:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 17:21:38 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:237:cafe::2c) by MN2PR15CA0051.outlook.office365.com
 (2603:10b6:208:237::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Thu, 21 Dec 2023 17:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 17:21:38 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 11:21:36 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 1/7] platform/x86: Move hsmp_test to probe
Date: Thu, 21 Dec 2023 17:21:08 +0000
Message-ID: <20231221172114.1569559-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DM8PR12MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6f8436-874e-43cb-8ea1-08dc02494a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MaVbNzEdKUVtMLwzBO+2DqWne+8Jp3srdwvw3vgtQydEVkw8Lwo7AlQNalnrtePgtzSDt1y6jpbZXFxZt/d9hIKj8BiL2Vbhva5m1b9/ghqSoyPIapWCBpddBx70dxFjSCXgqTSh/ECnRG04nHkM0SOHpnbgH/o9y1REQcs29cxqpbGv6B6Lr337BVpxXDhzhLK99YpS+Y2+zT9f9ZAOVQ1BGcQQ25kz6kxAhlpTkWwPJx3QDUenU0gXJKJmyzFxH/JUaLzOlPE8Yhyi2xri/APwzF2yCrLGmu2zg6pQU8s5uaBAqHqvXA54FzVMliaX3gIO88WPxQeffT5kN/6nxxuRetJwhQcjy3/oYi8NkglhLW0LoTArT1GJ6z5BZ4CQDYZRqK2y5bfx68q2axKKr4v51E0FdmETZhjQK59rUhRrmzsQ+pnB6cyszNPF9N/HbLmCyqVFL9OdkuKBHDEYLDxMcs662k1yR/ByelNnjDlaq0HRJb6nG+2CKAD+YBntMApUgXkEx1+g0m8be2CtXyrNka0EgbF8lOwmAW1Jo5vHiY8xwK+rXqTyr43UDcO9iGRWi7hKBInDVjH9dKFCBKT3dXMIrffJAhwa91j4LG2OyZl9/MqBv655wucjqB21zCYA0eHGWkjpCEyRf/ibO1Iv7ek6Td/x2bIFwjo63w4ungPzNjQAx8BfGaUu2WPV2H8DPji0YVmfg4oxlD9C1+sEh6MgLe3Oz6VtIHab4T9M8RTLDqc6RSMiAk3a/p6y0gebvdDKbC6ALdc+gIybvg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(336012)(26005)(1076003)(16526019)(426003)(6666004)(7696005)(40460700003)(66574015)(2616005)(36756003)(82740400003)(86362001)(81166007)(356005)(83380400001)(4326008)(8936002)(8676002)(41300700001)(44832011)(47076005)(36860700001)(54906003)(6916009)(70206006)(70586007)(5660300002)(2906002)(316002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 17:21:38.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6f8436-874e-43cb-8ea1-08dc02494a6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5463

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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v1:
1. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
Changes since v2:
1. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

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

