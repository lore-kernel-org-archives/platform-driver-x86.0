Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4331C19F2D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbiHBPOG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234780AbiHBPOE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:14:04 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31F415A3C
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVx3/xpq25EuhYAnpoHUkACAM05rz6EnghthVz2OpvY86yo5JsF5MZpCkmOm68tyXH2upFUQS4ItzQyuadNwQL1SfDN99bofW/fjq3BW/HBPgljmCHIBHiacKJUylviTCgujdOWB/lp6XHX9AwGDkAbzB0YsQkAePu8kVBcTnbYoL5psnUxLBTjh/iBZQQ4WnByuicaH962yrbKSN5xVxfqhtEcRewtgIBnGTynhrRjmoznQBMiEhjcl26GfXh7pIxvcoAJdjIcdLtHwTcxFhMt9XlGJH6OuxIcgQa5MPoe0mCXXjqb9dcoaVifr3XzEyCTxTp7tzKjLrctzSfgi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smfUw0/1ajgXZd5jk6ml3rNLNmGLHg0cS4pFFjw35pw=;
 b=Xvnxj7++2waKoPMuL/8VZBwsPn1EB6svOMcbPxeemT32+3WBdeQx8tSa8uOKLHrUTpVkkZqVYZ85Zx9HqSmpgWOYnnZ0BQaje5iSmbi6gG3wt4xZqUfgMyvzi192FaBIBk/lB7HSzJhe2RWwyEnX5svfsoL+IHxDvOAa/YGM8gq/g2cFM35FJ4r5W0b2buOtQ18zS5LhSj+7oR36kwX4h0/uu1T6Ic35DRgeVO83p3Ie1yvg6XSw7jhY5RUl5gu5ObCUtU8jbygo7TV8JKX2csf7WiEzNoV6sJWlNyMd1ZUEDoDTAYiK5xqp6XG5J/40x62guqFA5PGxjSCAI0hyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smfUw0/1ajgXZd5jk6ml3rNLNmGLHg0cS4pFFjw35pw=;
 b=43997ZuMDV24e1RjvwWk3wzTRbzpKuUiwFml1HfMpQjnpzGHD92V0N+ACJnYEqQxygf9NgtSaebsmiDwIgyis+BhHyyeM1ZoLsnaAAJmXhdBHt51BsiyJo7nCayGBnPsbNWLlLhQ9nq8DQn2LRNwcKnDa/OoEguZWXF3ZxuZqtI=
Received: from BN0PR04CA0028.namprd04.prod.outlook.com (2603:10b6:408:ee::33)
 by CH0PR12MB5265.namprd12.prod.outlook.com (2603:10b6:610:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 15:14:02 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::8c) by BN0PR04CA0028.outlook.office365.com
 (2603:10b6:408:ee::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15 via Frontend
 Transport; Tue, 2 Aug 2022 15:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:14:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:13:59 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 10/11] platform/x86/amd/pmf: Force load driver on older supported platforms
Date:   Tue, 2 Aug 2022 20:41:48 +0530
Message-ID: <20220802151149.2123699-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 081fa85b-312d-4513-1e79-08da7499a1ce
X-MS-TrafficTypeDiagnostic: CH0PR12MB5265:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LCZhqGJZdVmoNlq5dg3LjVFZeHNO4C/Q2XGsakbG8QGIOECwBgSPiC7FwrJlXYLwGFv2JWMLUr+J11YjmXUp5MjaO7rhfUHe4ZFwd05hZGgQ/8VPq+IUtfv35abc/F25aPMQgcNs0UnV6o3bJfvpLSAnxHKskqrXES5ywEM/6QtE05yfwyleM8Ip/qVjZPK6LATpFzcIdvvYqLE3DdCXZM8gItAydRRjGOAGpm1opvkEd7wOkNDZvOPtNPn7/vR1gC/j8G++2CVN0nmGtVDXrkHqdIgRUjtbWS7uA7JB46PJQsd1UQB9AJ5tBUkYF86+0hHheOQojKeUfDcKSH3QfFJgjad01SRlB/ljc2dii3hococ93kNKqkJyAqw3oq7/inIxyMm11rZzmbDfnF4CINruCRo4hlDyMEw2iLOaRELmvEmztOdRJDcjOuZ/gQm8EwSDX20I5vv2f5qDj/u1tB+G2veO3R0zEtE90eQddYTcXH2ZXkQ34f90LEvo3zS8P16hpqQPj4Vp2WmcRFuZAt7qg/AaMO1hMo7GdEQ5Uvxo7PHS3F0pq8JQWkp7nieQHxhyK6KrmmLTKsIHdQLVs8SDJWDukIiyNuasgxA8UKsHbdtiqh394Gi4rw+ti6yD5M00+ZQonSaT5ysTK7qPd/CztF5+a3G0yBtPyR7na6fbuG2yQIFmw2zHyt9EL3CJrwTkBFDuBebYVrMYwfzaP9mn0XQTmGXyV2dyfAKSdO3DwE1yzxTy0h4Too7D1Xt/GY1EUk+ULNa6ku4fG5sV5QyrElS1TzGPzIyGC2CRrqotPa1NYurOh3VI0Ei0I/xH9t47Kkcsox166tDc9GLr7Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(83380400001)(81166007)(356005)(82740400003)(40460700003)(8676002)(4326008)(70206006)(70586007)(110136005)(54906003)(316002)(26005)(5660300002)(2616005)(426003)(336012)(47076005)(1076003)(186003)(16526019)(478600001)(8936002)(7696005)(6666004)(41300700001)(40480700001)(36756003)(82310400005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:14:01.9023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081fa85b-312d-4513-1e79-08da7499a1ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5265
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some of the older platforms with _HID "AMDI0100" PMF driver can be force
loaded by interested users but only for experimental purposes.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 4467d682cd11..dbca5d7c6311 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -39,6 +39,7 @@
 #define AMD_PMF_RESULT_FAILED                0xFF
 
 /* List of supported CPU ids */
+#define AMD_CPU_ID_RMB			0x14b5
 #define AMD_CPU_ID_PS			0x14e8
 
 #define PMF_MSG_DELAY_MIN_US		50
@@ -52,6 +53,11 @@ static int metrics_table_loop_ms = 1000;
 module_param(metrics_table_loop_ms, int, 0644);
 MODULE_PARM_DESC(metrics_table_loop_ms, " Metrics Table sample size time (default = 1000ms) ");
 
+/* Force load on supported older platforms */
+static bool force_load;
+module_param(force_load, bool, 0444);
+MODULE_PARM_DESC(force_load, " Force load this driver on supported older platforms (experimental) ");
+
 static int current_power_limits_show(struct seq_file *seq, void *unused)
 {
 	struct amd_pmf_dev *dev = seq->private;
@@ -208,6 +214,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 }
 
 static const struct pci_device_id pmf_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
 	{ }
 };
@@ -265,6 +272,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 }
 
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
+	{"AMDI0100", 0x100},
 	{"AMDI0102", 0},
 	{ }
 };
@@ -272,6 +280,7 @@ MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
 
 static int amd_pmf_probe(struct platform_device *pdev)
 {
+	const struct acpi_device_id *id;
 	struct amd_pmf_dev *dev;
 	struct pci_dev *rdev;
 	u32 base_addr_lo;
@@ -280,6 +289,13 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	u32 val;
 	int err;
 
+	id = acpi_match_device(amd_pmf_acpi_ids, &pdev->dev);
+	if (!id)
+		return -ENODEV;
+
+	if (id->driver_data == 0x100 && !force_load)
+		return -ENODEV;
+
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
-- 
2.25.1

