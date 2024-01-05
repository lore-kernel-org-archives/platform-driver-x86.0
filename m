Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3662030C
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N87On5+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcJpRLcvWPYztvNz528VsaBw/LX6Znt1o9dbVvH3vqjCno3UX9c/7R3UNNqHChAiEMqDi44FthRVL1qQxFBU13hPj80naOaw6PBSBVMbzqlFelV3RTZoOjDTBxxuyKlRNScWIAUSjR7kiXcAZrvicIS+XwXJts4MZBegQajDqxWoQ/OKtz0Cv1ynW4onyNoUw2xVLPItR2xLIv1Z43LP7eS9d4upvhM8NO7fNRf4TZc63j21PLuReLnK8v3+qNv6RtkkqzGMtCjp7W3tIYrUEnZjafeSDr16SMTC5jxY4bFqbbjeYttSsmzjiZn7F7SpbpWufIadjfaVJFCreRf/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jogE8EFP6LOlg9hNhUJM+JIXMlYkTz+wDFdWfhEnt+o=;
 b=WHQRtDMGJ188NM3wsN8+ATmnGI7cRmnb00AgiXogKSsPjWVrXHQ9zX5i/tDXeaeL6K+Bhxf2oT6QMv7RtPAkDrIQmnoVmA2cm0CUWrSvQ/4vLGiV50Ry+pk4yq5/hDEKdgjmHENjar5+Quw/q1CdPwpIsI9sN0WRwX9uVJXG4YmEAlOvUdkRQxebao1od4Syx7PCGDDNE3GpacPZeejKK+Ar0uR2Jj02Ns2S1Omr3teJHH7zoE14CT2WipU1B/SHZmraDMLbLSCnL1mRrHoCBEwrqyVPGsXFhJlJz2jm/QfvzDHzQfkn4g/dbhWHqGShGzxq5SsTXJmJ3mgH3PufXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jogE8EFP6LOlg9hNhUJM+JIXMlYkTz+wDFdWfhEnt+o=;
 b=N87On5+PAhUcoS906uXT6NpuUMCu+h+5Xxq3gHHFzT5jGNE7t27xCRNMnL3Tunu1Ibjs5TnGMU4qW+IBIkwZEYLeeNjl4lUEo6bCPhdTyqGyqMixAiqMNz4hJPEDBd0SaEwf5D29e31KmX8JrX08U5KJgJxk2+NtgB6BEkkGtiY=
Received: from BL1PR13CA0421.namprd13.prod.outlook.com (2603:10b6:208:2c3::6)
 by SN7PR12MB6864.namprd12.prod.outlook.com (2603:10b6:806:263::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 07:46:46 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::61) by BL1PR13CA0421.outlook.office365.com
 (2603:10b6:208:2c3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13 via Frontend
 Transport; Fri, 5 Jan 2024 07:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:46:45 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:46:43 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 1/9] platform/x86/amd/hsmp: Move hsmp_test to probe
Date: Fri, 5 Jan 2024 07:46:10 +0000
Message-ID: <20240105074618.1667898-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105074618.1667898-1-suma.hegde@amd.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|SN7PR12MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 8603d067-4e93-4820-59bc-08dc0dc2776e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RtRiCa+Lid0qt5CWwaQvSQnw+WUAMv4VSOdUYTVpBJw9GMgf9P+HbRQ1J2Lnj/jC3t+1PZA/uOZzkRF8VoSMETtC89EaWjvo7GPJZBuFZ3PfQ1L58Jp2hZbKpvo6RCeIDSHZkBMwyiOY1t8ymY44SBg4HUX3SsIVOkTEUtOduVoTkDmHEWG8VOPNj6aPAN/EQ77l0cRRBC5tC/KyNuZX1itC5Agq5gAs17jsLrZqqFttJ0tNPbmig6MjrIVM8JitzEPELR2h2/S97iGAX4mZGy1xncsDdONFnTlQMI0flOXs8K2Jm3e8cTOJY+7ttvhbDwzIiS7FImeSeaaYcrPFu4ReqBIaW9xt7Iod6/4idpDTNjwAzQ0dkBh8DM8PPcbul7GVFBbkdTwpHM4uwf9ZCTFley4HBgNp9OgEQknQf8ghSVZHaUpv4d/2uzcgcj0CL88+ebma1RKYDEbkhSOAfkzDk9jK3HRdiRymSOlkHL7jV13x8004bkLj1nLKKWFeNHUzxV+66ynnbaLMEJjuxth/3XalmwHp5Q4C0DKbGi1Mxktxwo14w7mypRZ4AqCzS5VzorA0nbPtnTPNuxSTJniadauR79FQqIUFgjVmqlZGh0g7FSrMJhZYwqc6HzL3ex+1xRdLcMGFnc4DXgKblZT2pdBg4AMPiXmmLmXwMNMO1DWW32Atv/zcSeLL1HxmGBx4FCFBZQO/1ecGiNZh5EkjhD+9d26j+68FF22SfhXFlOOxZYiDYA389Pi+yZRvVkcwohBpmgHoKhLAcJh+VA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(83380400001)(66574015)(16526019)(1076003)(336012)(426003)(26005)(2616005)(82740400003)(316002)(47076005)(36860700001)(5660300002)(44832011)(8676002)(8936002)(4326008)(2906002)(6666004)(7696005)(6916009)(478600001)(54906003)(70206006)(70586007)(41300700001)(36756003)(356005)(81166007)(86362001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:46:45.7680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8603d067-4e93-4820-59bc-08dc0dc2776e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6864

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

