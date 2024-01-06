Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328B15AC
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u39JD7NI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmZAmdqcxUzck5etPUMtBz6wu9jekNxol7i/kiW5Ie48HnLbx4CXCZoDSRdn9oWW7a9gt9fhiwcAXMc2yBzWqHJQ4PANkCYMSnLwKglPfzSdtI60ozoiHtptFBxxm4F1g2V64v2XfAnqS5ULqrYGsWc1N01weXWkpkxuu9XnNX042icBIqvtuHxqD8MMg7AU9YzlYZH9Qwm9rSpo+gjxo4qD/DT1hk3Pd5DSRqX2YZd/51m3YyUxMa/HlsIoEha6g8jQ5HWbI7SX5uzAp0nyK+NeuGMLmxT06gHaK0lMQvAEiZDMgDgVIMEOBK6/twdigYn7euMPHI1mWGcRGMmaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXWxTO79mGGb3y2ub16HhYUqVZkHS/sX+T+fM9Xd2O4=;
 b=CW636xtNjXZ6aSiw5OyGgiDCYgKqivjBkzK+IhbGhBVof0PlEndM/E4u0R4/pKVumd9ecGvDsRTaIFILEnXmeXEjcJ5f6UbiHgAuAGICkgiL8RyVXlLEgrd6o3jewfJGf9f6ShrFiyfqQGYOIQ0gqmFx0J7c2u7xZJAQ5617JZPZrH0jSjHg8KY3qrxzW2GoA2rAYkcOlJXSVIbP/HQmXsaLxzjytILWTWd8+W3rlrdETjsqJT0LDlwAWpSlobLoe1yCxRj+TzeoewExSbf+eYyR0yYKPY04S5qgINUWNhbcQxCD1wZYvxKQMxWNbvQI5Xx4H9UjmUjD38kX0QC9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXWxTO79mGGb3y2ub16HhYUqVZkHS/sX+T+fM9Xd2O4=;
 b=u39JD7NI+l2iLkQ9Gbn3SqaD1ouqPl/nP1Q0/hNsh2XdF/vvqHiTtCZICqITTqgH8ESzAriGHx44kJL8kvGtSwVP5MWKO2e6luguzLhI1mO0tfCy+6IY9n7wmj+SCRl/M4Ps3zjH3uR94lK7XoZDJqzFJqW9EIfprthmWMf7Iho=
Received: from PH8PR07CA0010.namprd07.prod.outlook.com (2603:10b6:510:2cd::22)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Sat, 6 Jan
 2024 02:26:26 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::7d) by PH8PR07CA0010.outlook.office365.com
 (2603:10b6:510:2cd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:26 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:24 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc() to devm_kcalloc()
Date: Sat, 6 Jan 2024 02:25:31 +0000
Message-ID: <20240106022532.1746932-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240106022532.1746932-1-suma.hegde@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|IA1PR12MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a2fbef-848a-4e61-6517-08dc0e5ee203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xocVcUM+/vMWapa8kqKMrdSl61MF4740jfCcSZ1Jqt3XiXfQb9Otljl4gxBbgeJ2aPqb/r4k0Nu5U0jIzWmQX0SeTJgHtQ3ZtumJQK48vGEmz1qI23RQCMkGIIq5laDqpe3aS92KjVbiNNj8mz7VUifY4e8TG/twR1KHR5Xy8prgz7ajmus09cCbo20lhxIKBh/x9nR/I3l2ABdiYioPY6DmGPc3D1wBfyT9+52+HQM8e7/MbiSTSyj3JujHGFte409xVwqrzyARY/OUlwGnpB6zeqfhsc7C4V6KiuZEthgHgY17gZPkRh2f6Zx+TGhfjo4Pi1EqsrphloFe05/9F8rQPKLzZHb2VM5jRYoGIzoeLEjzTuVbkFJiE3F+qFw0abqEjq5IQzhVlv/CwvjITYI8kI0rD1X8yag8wjA0Ym4glVtlt1PK1FnjOjqeWFB1f8cjCz0vbHIz4pYyEJdwJMWISy/mEPrp9/ljr+3lSz/xHYEBZd5NqOc6201hTdqUvaj7sDoW2B7yQ1bsMumaFyfDNqQHfWEo1Del0zMjiMiRHntplLmx1zKJsCX5JS/6mqdK6sgjSMwAcfpBu48skDbUnrN1i5dTIHvLCWI4UiJtXZ27kMyStauf+0RmR3AJctLQu9dTEl8Stghs2K8ITCTY2ruhyTSRRZAdB4WNWGRPTS/yfkqGYhhI54qHkK5hvg2HFLWcD0M2ZfDZEPQ2ermEgP7FvfrNuKHRi8hKdsYYw2EBDZM/713Qg0sYfxu4ahNNKZ/tBknoD5yvZVvamA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82310400011)(46966006)(40470700004)(36840700001)(47076005)(1076003)(6666004)(336012)(26005)(426003)(478600001)(7696005)(70586007)(83380400001)(2906002)(16526019)(41300700001)(70206006)(54906003)(8936002)(4326008)(8676002)(6916009)(44832011)(5660300002)(316002)(2616005)(82740400003)(36860700001)(36756003)(356005)(86362001)(81166007)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:26.0574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a2fbef-848a-4e61-6517-08dc0e5ee203
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539

Use the standard array allocation variant of devm memory allocation
APIs.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v4:
1. Change sizeof(struct bin_attribute *) to sizeof(*hsmp_bin_attrs)
2. Change sizeof(struct attribute_group *) to sizeof(*hsmp_attr_grps)
3. Split some of the changes to 11th patch in this v5 series

Changes since v3:
New patch, based on Ilpos review comments and additional cosmetic changes.
 drivers/platform/x86/amd/hsmp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 99bebb0ca5a9..ccf7cd8f98f6 100644
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
+					     sizeof(struct hsmp_socket),
 					     GFP_KERNEL);
 		if (!plat_dev.sock)
 			return -ENOMEM;
-- 
2.25.1

