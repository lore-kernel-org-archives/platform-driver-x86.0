Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C1363135
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706534702; cv=fail; b=Oz/0W8Avu1lNYwa2iBXWSOzKttdRwrQVjJ3N4XsEhNVXkBW5FMiFUJNp6UAvLbQyx7RYH4lGHVCWWV+/DdHJQxxzL2J2gJu6O0fK8x9640IIMCxXVSR4qvOCVpOnJprzA2NxLsZXfLTlla2XdVAvOh7KD3XXqQEfZSz5Eqwd5A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706534702; c=relaxed/simple;
	bh=Th/ZvxT4tbfvCPBPhe2XlptCEiGElfGqLGyXhaxhPWo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m/PYWHIefnudQ6w+hkWagbPJvjxZYP2Fhr4gTuZsQpQuplIk5QfsQ1t3ap+MBrXOiLSGCMDh8BSqJi1TpzO13IPlTOFowq5JtYezwMDNLWZX8WTv8XCHUOgg4OBuKj6MqS8PzdjdBKFsLYPupiiXCeH1AWqND5/AT2vh5IXU41Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VryRekd3; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VryRekd3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaZTEMjxbU1OSqOWs9Xyt5d6bW5nXZ8j0IDiJvQk3eoyPNOW9RmDiX4w7bDD/3voccS2DV6VknEyELZr24tOrGdjt0RJZSWMD2i18hIU5MWTL2ux42Wcea8Gc8fupSiok8fBQTKwZhaHON5ICSJfjdL2Wo20OGU6HRs8try/f6oRmS+jTj/MmympiWByqkXaY8vlAf3qb3BA9uG0yhDNtZdebuOKuj6FoI+YyvR/h6IIHmndvsh+56wG4muSnSLxhX9LtOxwdpr8gMuOgcoBVP2V0ks0C7oTQhBEHHPD663H+PfeAG7jvu8WrUG/CSrKYx6Ru8wLNS7Z7mO2zhIh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUEGVRlwoOzqnVlCuHIqgORrEwCoFAMa87CFc/+UdwQ=;
 b=LQr4lQNMJbyTMJJEvTDPYZQs/+ZJO1o8PgJy2DrDog7r8wIvRz48YjF1Ja1dq9aNZnlR0f1I//3F2UU5unf9BqUzVcFXdDxCXlhi6Lm/wuDmVZGJUiDF6xQAxJB54ufjLGmBx+X4G8Vh6K6DFk7dBSSRz0FoJ3YTLE4PECsboyHcgh9JLsrSJP39mE1JvD6XJNhzfKpby9FLGEf+4rxewl4hJpmlZzkmgVdB6Pqj/NPXsvgwNO1Jnv9T/R//+gCbdt0yUIAMofUmD/KJYfLO5qbOkiTBh2q8scnjVcSkUNMrTMVqtJDxX8MFNM6t634E4TkZi7AyKHWhVJTTSvKU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUEGVRlwoOzqnVlCuHIqgORrEwCoFAMa87CFc/+UdwQ=;
 b=VryRekd3jZNs65krO/ie3lFOSb4xjeQ45Zpon22DcWE1aYpVHCVUS6Pib3NyvwR++L7bDw0uDwDGfIRszdqpJaEXYVgiQMLyN8bwLBByfb6PnrN9d0wNzX25ZUspe6dPRLQIrOKetKpA4el4COJQFZQehkVrxColGpTzAZk44jU=
Received: from SN7PR18CA0025.namprd18.prod.outlook.com (2603:10b6:806:f3::29)
 by BY5PR12MB4853.namprd12.prod.outlook.com (2603:10b6:a03:1da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 13:24:56 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::cc) by SN7PR18CA0025.outlook.office365.com
 (2603:10b6:806:f3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 13:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 13:24:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 29 Jan
 2024 07:24:52 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, kernel test robot <lkp@intel.com>, "Naveen Krishna
 Chatradhi" <naveen.krishna@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: add CONFIG_ACPI dependency
Date: Mon, 29 Jan 2024 13:24:32 +0000
Message-ID: <20240129132433.2087490-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|BY5PR12MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a56b279-2f04-42b8-62d0-08dc20cdaf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OMLXTbJOOGYykH4D6txQ92X/UxIwrBhtR3uhiAtnVZXGQoH1ZRbZXACaPtLAL/AEZeA8kIgY2Qcni1S2sAdNOCQ3lADiIx/DBN1D13IpRvB/6gdg10dB6n1kBqv7x95uNyf4iAt1rrzQdmv0L8zkknSNboYrjTFDkdJMJAlisC1m9kdRzNGrpX5hveQNlhNNHcF5Zk6ejMh8qCBwHg945Er3FKZ/eyqbRspPiGrnNWv4fxx0P7RznBejuFqbpylauG0Lf2QrH79mf1wku0GxuHqTlDz9kiLZgMhgYK6s/m2isgFBUx/A6sPBKUyA5OnYE3mnnr1hcTAIQehtSYwOFwK9nAJUHzJnxoNgwdEi5katultL1zAiV6hb600hwrlkcTZS4pdvTiiU5kK+4EjwaXbCsdt+W5FU6Ewf4CUcwipSQ+2/1Ki0CLZzlUeMoKvhXifti4wMMNNvo0yCNQ0l3c7zVwSnc6+GXWYQ01Yl3CySaN1f929gPStLveoNw1H2p1D7783u+oxMJh+Y5aPXXH/Sw9nTpn6+oRQnnFmMSPEUMYADfV2AJ9xdb8O0/eVlV+uU4odgl1VPEPEo6uFReAPFdDLct6zx+5wCslMteCjjirL2CaXZY6Nzu4VSUwgE/pD+NFB9dP2haHQohTaW1gnwZICLd5tbvBZy+lzswi1OUzlgTFE1f1SKz7f3RP7cyjgYcgKZL4FR7XSg1mTtdJQrpO1EkAOuTY1HG5MwnVJywVN/eD7Zueo+2m3JHIaT1+pSAzshmthw+0A1SNVtrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39850400004)(376002)(230922051799003)(186009)(451199024)(1800799012)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(1076003)(16526019)(2906002)(4744005)(7696005)(6666004)(5660300002)(2616005)(70586007)(966005)(70206006)(316002)(4326008)(44832011)(6916009)(426003)(336012)(26005)(54906003)(8676002)(36860700001)(83380400001)(47076005)(82740400003)(81166007)(356005)(478600001)(8936002)(86362001)(41300700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:24:56.1589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a56b279-2f04-42b8-62d0-08dc20cdaf6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4853

HSMP interface is only supported on x86 based AMD EPYC line of
processors. Driver uses ACPI APIs, so make it dependent on CONFIG_ACPI.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401281437.aus91srb-lkp@intel.com/
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveen.krishna@amd.com>
---

 drivers/platform/x86/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index 54753213cc61..f88682d36447 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -8,7 +8,7 @@ source "drivers/platform/x86/amd/pmc/Kconfig"
 
 config AMD_HSMP
 	tristate "AMD HSMP Driver"
-	depends on AMD_NB && X86_64
+	depends on AMD_NB && X86_64 && ACPI
 	help
 	  The driver provides a way for user space tools to monitor and manage
 	  system management functionality on EPYC server CPUs from AMD.
-- 
2.25.1

