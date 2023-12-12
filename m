Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="usnKUiyv"
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51D2AB
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 02:38:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/I5sM4KimSvTq8Z9JKy23Leqw7ZZWBk5zGqq4XIJ1/7OubLqLOyCOsRbqhtg1UlMrIr4KkGbFd9Krg4MC5TELMwdqEypqmaA+MT61Q5ySWELjQUS8/0NM/RY6Y+z/Y5vFezK4ul/NqhUikEkSOBS9ulzsaKS+yGCN9V5L/p1yIWu8rXHqFYJmqtFKb2KMDK6t2r8CmbKBnUDREjepUTX6ONqePQyyiyZWupnzqSGrl45eTyr3OlrfB4iY9QngtdBSzok+E9tGJfPLTnKU0/nKtuQHDK3jm3jqds2bf8NNQOlOwCj/O4RqUo6tYuxK93A02xjXR4geIqqEbs0XqjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzMRaKwal9Y1bx2pck1Nge67ntym25TsqHqCyKbhax4=;
 b=mO2hFQlXJJEninfakp7EKpXv+ULcMYCQ9D2T6i2FEtSXPmNj3kUFu61QcRcTGORilEprPKJQ/K8JJbAHXN9St3PcUyL2SxnJoDuTvmYkyR/tzjKb4Si4OdxPT9ahVvBv8EcB9d3/4NT/YBRunBCKXRk0ESh6CnDVr9jrYsU4UUh7zOInyq1ra1VicZCKfrG2dlz+ah0pV/S/9jqlKJXjtKggvZPSU7EhM3ziMwJ6HJKjXadMDlGONp+PdJ+LP/ncCJFSgJn7UdUWlXSLhROPMcSJ7OlO1zgWtQCZxf+PuiB8MmxwSFtuRNDSjNa6uO+wjs50ClUv/gQOkrQErHQ/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzMRaKwal9Y1bx2pck1Nge67ntym25TsqHqCyKbhax4=;
 b=usnKUiyvailz0ugArKTaa1CC9V+BFTIpBI608poQD0GSREfGRLSq4KeizZe8ZQGU2X2Fu7hnild2rsvEGKVU5+h3DS1Oc7ZjSEf5FptaT0mFCs6dwZ+GcoWi0zvDwp9rjuwFN0KVH2nquzxOmwq7uqM8Rq8fgTP++OE7Yh/wS/4=
Received: from CY5PR13CA0009.namprd13.prod.outlook.com (2603:10b6:930::33) by
 SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 10:38:38 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:0:cafe::f1) by CY5PR13CA0009.outlook.office365.com
 (2603:10b6:930::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Tue, 12 Dec 2023 10:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 10:38:38 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 04:38:32 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 1/7] platform/x86: Move hsmp_test to probe
Date: Tue, 12 Dec 2023 10:36:38 +0000
Message-ID: <20231212103644.768460-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212103644.768460-1-suma.hegde@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 273e157f-581f-4e57-303d-08dbfafe8031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mIN0wjI966CnuDR9RbeKoEkXQyDZ6fBBT6sEhh0zH4acLj7bhxe1VSzG8sw91WiIe+/x6DGm4H3M+0XDnv0qIe3n4bqEMXoLWHXMVm6iOVisojzqYrdszCpuhpoORrnDPjgA2bDE9xmzzxQHrDek11td3xxsSSrNg/exvSaJFtbFBbcWmOZdVtFNCEYZDzmfYs++oF328xOyB3tpk/AuTFoX4APbO5hSOSnCDLO/Z2FAv5h69CwcrC58pVCK7DBATgt/DhvQHQpN3Ann7Q+7T2DiWOqxxOOzQt/yTZTK1WcBj9dyaBf6wWTfYLYBY/n1YX3tAEjhxTeCEp5UEO2CkoFP+hwbpG2QuR7ZHRxAP/wUtuGd4H2F3AFrRJ3babZ1I7XG3i07f1xZFU0N1QPqN/j+XSKk4jqpIdSlOULD7+W8Jvsvkmi8r8HS+xXbSsdrZUqcIvINzCenLKWXld+VjH+hhWa5fwCgDuO+RHVTG8oZU3C4glI0wypJkV5b/Rmh+Y0Xy3mKdZy6t1btoCP8oH77K1hWp+9rn05JcHKOoWtZibPFchYy//+rtO9CpQwgzbNPyLTigLNk7fx4V8cvXf1zD9zf20GAF4BruX70DLqIBx8PfjLs2rlmbHvDdv0je9ZoDT79LGgUDzqgeHk+Df3Jk1DkAEV768mH+aJE1yDba8aL71PQWNYoGrciRM0B/5eVbimmAD2JSqooApGsIWfhLA9vd6CZrRNkeOkwfBx59la/lQGQT7Tub6XQXAU+OcpQHtHyOaEkvFWSKhRqJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(40460700003)(1076003)(2616005)(26005)(336012)(16526019)(7696005)(426003)(8676002)(8936002)(4326008)(316002)(86362001)(40480700001)(44832011)(478600001)(70586007)(70206006)(6916009)(54906003)(5660300002)(36860700001)(81166007)(83380400001)(356005)(47076005)(82740400003)(2906002)(41300700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 10:38:38.1464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 273e157f-581f-4e57-303d-08dbfafe8031
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989

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
Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
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

