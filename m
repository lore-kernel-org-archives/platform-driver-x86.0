Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F094F882
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jan 2024 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706187297; cv=fail; b=s8Vdr+Fh4ZcK9K3vRrqX3HuB9vkvxLKzEpkqOA9UTHBak0LFLmkbVukX8/z6UwxbLRrFOY6ZGtPVGSnenWlSf4JodvHaAfeA6QvPDCP8AoRiiNGoRmiZX9ixnUIj4DPA6LM/qOXl3OJ1+leE7tJ6TWPLH8/jHgQNP1fpAd8QBLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706187297; c=relaxed/simple;
	bh=55iniLvHZfwYlo98VPxAy3gdy8WUygNVndMTkCjsYVg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LrFxnzRDUM9fXhu0V8ybIdhi68jKre/TW2i1jTYgu6hNY6u/5Xn5N77Y+14Z8H2pK39k75/NkuabzQBZ/wUgT7l9UK04eMReEpns+dvr1anfQnFrvyEy3FHvGPi10sjOMgcJo9gvBSl6t9n4BZpj2onMv1TpZgWUVT2/58u+WT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qvOz3mhu; arc=fail smtp.client-ip=40.107.95.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qvOz3mhu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju0h5W1T/X49vTT3ockHXWgqwmDaHPDUu6W5Jvh7ObaBsEX68hqheGcjjNz2Vce+iIRnF+xwgb6dp2sq33kYFyiMP6iO9kSLveTrdU9enocqtiKNqR+uSis+MiugaAOFilZiqXIb0J/AuSybdjYnJcpdYZwr7TqbqP58YblY6ORDjAkzpvbAdTBuqEdQpeMkZeJVxbcw+RJXyytZtY0lXxP75f88HcRSxwa2a2DaEAJiRjn0ZEGYrqPoT8WvPyvM3P4SZ01oPt4oYCCTPsI/hRNcr7f6HLX4xxKTWKklkbmshw3NX0MW1nf79R0I4DvmgMvVKgqAaZ2VtK0vGmjIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyb1qlfd3x59r4Parc+Gi7ml5Z6PMXp9YwE2lHkYnBI=;
 b=SQefaur0JFDiLD5Hulb7pd0ECHHcobvfDpje732psKiNjFRusnZmyGczMQCeycBV7MnEF3LpKjwqsh5RiPp74h4I2EoC2ATJoi2UsW3Y6PahJQx2BCeDG36Tybq/AT/Ti/UMBYIoo6lemZzCh1Oa6u+H9dtqZ/ZJeOTpWmMjONaSDPcELDc/w7TEQryH58OJkowl0wdaRbtZSAUq9vI0ycXO1fb3KpwRPkXvIjQ2UTkoIT8QLeF7/onYw+JpvX48jgjGMkytNaymNhRPSUBN6a6WRIOTckfQlETQdDOGJ9/+IqA2cD7y16a4MetEYCpUJetoLjQ4T3GWsQBdu4wj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyb1qlfd3x59r4Parc+Gi7ml5Z6PMXp9YwE2lHkYnBI=;
 b=qvOz3mhurVzI0OfSeqeMqJhDLHb1KTS+iEl5PtndIhVpD2osPt2nZO3EU6fS6fMZMXHnwn1nTxt87ZDgznFm9DoCy2zqRTs3xzV7oEWjkyKqKjyqC4vSC+cBlK0AU8oGkmvbEi98JKHsOB35LeQN90g3KAv4pTRvTmAAxy6KOac=
Received: from BYAPR06CA0040.namprd06.prod.outlook.com (2603:10b6:a03:14b::17)
 by CH3PR12MB8355.namprd12.prod.outlook.com (2603:10b6:610:131::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 12:54:54 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::57) by BYAPR06CA0040.outlook.office365.com
 (2603:10b6:a03:14b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Thu, 25 Jan 2024 12:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 25 Jan 2024 12:54:53 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 25 Jan
 2024 06:54:51 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Change devm_kzalloc() to devm_kcalloc()
Date: Thu, 25 Jan 2024 12:54:01 +0000
Message-ID: <20240125125401.597617-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d63a74-a803-4284-5246-08dc1da4d334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	euW2Kd8pK9sMfJa9mhKkyUraiOVrHeUm826zAHv+NPTqL6LYSn+IlYJYvrASMnwFaIOcGD4O1cMrLdoGEVsX15DEACAmAZm1sJBOxD5fzipMPiOCKZMPSKF4aG4p2h4/tFTMMqZvKfFVKu2q4UC3JAC8EprHj0wYU8sK78kGE3jTVXw0ior+KxDEZTrLZ7dRsIzD09Q1Qv9H1BVgUMrVS0RSlpZcQv3fDHou37ZsY3AVbc/O1nyl/LQYxGIWrrZ7y0wffvvKFwYzmOGGfWPfql1tcL+7GA5hHDSZWDATGtv+iKXxARwKjK9OX4P8nxsu9qYolHdh2d2NYzxpA/Ra9f0wWh+6yXC9oP0wPvCzSCGIN/zNiRWcx4SudXGsHaNM+JapPut4cqE28wYUFmEGJD6YI21Znveed28hYoM1lDFzkuagS7XwUbb035guSOXBrcjtNWJJFJf+4OcNRuBDwVfSJXLGxxqMz2l72JZ4c8JWQi493F5EEA+wHcb8rEfa23aUCen5e9bAkeeLunqan51KO8SYM7LvQ5wdZmeNpHpgxA+7/c8NJB8SYp9zFuRVX4SSXoTlspk0DBW8yaXLvP7AtdF5DLG8N55zvLnYQUy3NYaVn5fdH4th4K2zNs/K816t4mQ6Vb/shX5DsePHheSO54q5OqTdgmtU7nr0Z7ZUqyPbMV6rf02y8xOG0Jgs6C1LYHV79VJJX+p+dt4HVgza9F9xZW8g2Tgj34FEQHxaJIM7xkO6Y0xVsKwbGUx2RJCZ8H3+iFDEgplcv+mT2A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799012)(36840700001)(46966006)(40470700004)(83380400001)(2906002)(426003)(336012)(4326008)(5660300002)(356005)(36860700001)(44832011)(36756003)(47076005)(41300700001)(478600001)(6666004)(26005)(16526019)(81166007)(86362001)(40460700003)(40480700001)(70586007)(70206006)(2616005)(82740400003)(1076003)(54906003)(6916009)(316002)(8936002)(8676002)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 12:54:53.3781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d63a74-a803-4284-5246-08dc1da4d334
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355

Use the standard array allocation variant of devm memory allocation
APIs.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 5cd100a4f7ca..d79776d28b6a 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -657,8 +657,9 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
 	struct bin_attribute **hsmp_bin_attrs;
 
 	/* Null terminated list of attributes */
-	hsmp_bin_attrs = devm_kzalloc(dev, sizeof(struct bin_attribute *) *
-				      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
+	hsmp_bin_attrs = devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
+				      sizeof(*hsmp_bin_attrs),
+				      GFP_KERNEL);
 	if (!hsmp_bin_attrs)
 		return -ENOMEM;
 
@@ -673,8 +674,9 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 	struct attribute_group *attr_grp;
 	u16 i;
 
-	hsmp_attr_grps = devm_kzalloc(dev, sizeof(struct attribute_group *) *
-				      (plat_dev.num_sockets + 1), GFP_KERNEL);
+	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
+				      sizeof(*hsmp_attr_grps),
+				      GFP_KERNEL);
 	if (!hsmp_attr_grps)
 		return -ENOMEM;
 
@@ -804,8 +806,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	 * on each probe.
 	 */
 	if (!plat_dev.is_probed) {
-		plat_dev.sock = devm_kzalloc(&pdev->dev,
-					     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
+		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
+					     sizeof(*plat_dev.sock),
 					     GFP_KERNEL);
 		if (!plat_dev.sock)
 			return -ENOMEM;
-- 
2.25.1

