Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D015AB
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ed5aEhud"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsKWLvBx5eH0MtqmmzvzcZwUvj1Z53hAVPfcj/irPezCnTGzpDnj6b1R/Lz3v1FeRtUEcb2Na+OnvPCOInWFrHvd30g3l6UKdOf7y23lI9oM1YbdNnYDx0r9pFe1Ucx+u23rERmQKPkBIEDP5wPPWekkQgV66Rj3Fw6qD2PMcDaVX2o8sD+csmCeXRzwZ5BKEVS4ALdYvzktdREmtzWsTd0BkckQISt8xU3XQ8or0ZyxFTGfHGYb/leXoxwFVXmwy2yA6xsulgpbXhcjM6EzSCJmB96YFr+ZzY43E/Ys66WdQHrqkjgmVg9Ax5qLqNnAxM/JqQcUuMLLEzDISQ9ygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WvWvYN9ua0WI4AGxLC8lIQig9Gw3hjXmkXGsvtyXr0=;
 b=BhtI7bwb3ihPsSvKxhUXxLCwPLL1iC/hSQto3/sfq9usjN6fdXFWqjEgGmn7oN4g+OmwlRnOdqopyWq/O9OAEvSvZBcmtT27z6QkLP1fQ2vLRyr1aPgd04oAS4HHwI6KhBaEUP3U2bOkUI9neWQAk1qZA212zL2o3X/6wMOL6aAKAlmrIQgg5el6+/4g3ScG4q5C8FA4SApc9I/GZJvRc8g8RebA6xQo43Ge0EdBXhnXrGQ0kOlIgay33ZlkYwrWxPCfsLZFLdRKLn0ItIJdi8xwa0610qcoe5GPa6GkE0l+E5gB3cifi/94lsOfAl4j6fpzudFSJeUtqBPPlMIAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WvWvYN9ua0WI4AGxLC8lIQig9Gw3hjXmkXGsvtyXr0=;
 b=Ed5aEhudkn0WFrC4YI35g/HWVZABWs9u4XwVEactdRcD4BlXxyVxUWjwwU3I5nMO4CDIbfbwtHdwc1P8CSPbkHGPhiIw1EuoxeFjJarZzvNWJkkp2PqHSIl9rHjd+dsSEbKeWpZTrTgaH1/J9uqHAw5irFSza2S7lbx2WBXLcLQ=
Received: from PH8PR07CA0033.namprd07.prod.outlook.com (2603:10b6:510:2cf::20)
 by SA3PR12MB7903.namprd12.prod.outlook.com (2603:10b6:806:307::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Sat, 6 Jan
 2024 02:26:09 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::a4) by PH8PR07CA0033.outlook.office365.com
 (2603:10b6:510:2cf::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:08 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:06 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 01/11] platform/x86/amd/hsmp: Move hsmp_test to probe
Date: Sat, 6 Jan 2024 02:25:22 +0000
Message-ID: <20240106022532.1746932-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|SA3PR12MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 4feb963e-6d04-49ee-44c6-08dc0e5ed7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v6VnhDGsOwQYVM+aFeug5otmlfrQBgjUFRju5rwx7zqEu6YMFNB1nruuhHjsb1pK1o7rmng0O37wf9HCL5MN5CeyGVuPJGBZyg5Ms/lCKJm34GVUpOhUo9Kwbp2GObMN3wjKPYg+k/hIW8rWnjPLi8Idhf4y7/VArAy88u5BWDknk20jas8SKsf8fMbHhhycN/fsd9dDr3m+d51JziD2TZrM/hVlXyqQTvKoyw8QsNlkREEiiOvhv6AFjHJ1a+a96PU//7zRzwijoalas6V5+mu6PalKiSuBP1J1Rl6YPXNOabz66lRFhMsJiuzWGbgElT/wgYyito5PRWdDpYY86k/gxzAAQ/zzIyX7b/cxeQZjqmYCuYBAUeU5Gp2YBrEmM56oInpBPJASt8FXqVeI0RolmxCwt7EJHzYKVi4Jx4uGF6dpCFt5IiRe6BTYW++My2FggHh1gqiQGGElw4FnPjHOvrIZC55xGncofJLYvQiNHYUGzEIBAatFzlOUi7cmfqzpWv6k0bQz6vjN6ppvSzZip+2hbUeEJeEbV27vinikFFIPehGsyzFKerhRAAjjWmU0kPrStmk5KKO8Uz+kSJGbrATf/A8WLiPK+waBLp6HqeXQF20EFTuxtn3ZpC2tghvJAi+BJMy4gjqQehtCNEdIfDXh8OAE45f8P0/e/K2/6QJ6XvWuPGjmB0AmO3gJduBlJ1H/lsydn7OAtS/AEGKPUqLM2wkgS39Hpu7VE5gI9BflleNU0xTs9TJZEKCY7/ODwRMEkU8q2+qlqtoRKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(40470700004)(46966006)(36840700001)(83380400001)(336012)(16526019)(26005)(426003)(66574015)(1076003)(6666004)(7696005)(2616005)(47076005)(5660300002)(316002)(44832011)(8676002)(41300700001)(2906002)(4326008)(70586007)(8936002)(54906003)(36860700001)(6916009)(478600001)(70206006)(82740400003)(86362001)(356005)(36756003)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:08.9386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4feb963e-6d04-49ee-44c6-08dc0e5ed7cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7903

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
Changes since v4:
None
Changes since v3:
None
Changes since v2:
1. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
Changes since v1:
1. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

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

