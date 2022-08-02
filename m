Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E30C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbiHBPOA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234720AbiHBPN6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:13:58 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7B615A3C
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhLzyt404i/hYPJr2P5jqbnseMHlsvMuOpSoo00FFwlBQ63C/TLXgi7YvUHcB60S4iJDryAotX0PZp2/jeVkYPG/C8m7JHq3G7Gtd75qWkihv5u2b1DWn3xiNfkXlx0LqYFVlu8NsMCOMJmK5uqoImZyz1S2yrowIfAEDBjCP4gO+ve45Do2syvBhj/4dRkGVvQCQpesVpiKi/v4h3NnUqT9R4XpIE0CSmAbdH7GcBa7/d3EfWXYIZEWAUpA84foH3OUXBLUwdT+g1bDNLnSDU2zgmHGl/76pO68jOPoV4MnpZmzJ3ieWSLCtQ6INDH18TsYXraVDLP81YAEBbHwsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYBcCPDCv7Qpa0lwCE3pLndlz9ZE0d9f/l2udmVSmcU=;
 b=eQWIoghhtpgBIRQv+mVktfwKVGO7IY8rTgxWcJoYwfOa/uBWkOKYrghPsAnnCG+FGPEJUjXjOZjo/1mNCuDfWBHQlg11P6ZbtZLTqB+VEMMHdRJ+O1Ad99uYQmI28qils3HJUR5Da3+JnC37M+QJbpZNA058hXSf/tCM25y3gGnjS88ibbSDrZ/GEKUy7yUXpTJknn21bkqJyTSHK20wjPXMcJO1JBg++ui89fbYZlq/PSYCgeqTDUVpHAPsI0wWwRrjBHZj0eK5NrEurvGUqooHZPGTuTt7ss9JPtQIHkAwLX+ZXH+yLCW9J+4L1fDyqvIMSPIZokTwvBb0ZN1F0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYBcCPDCv7Qpa0lwCE3pLndlz9ZE0d9f/l2udmVSmcU=;
 b=PhsfHL0r5r3pfcxZ5bjq6qnJzmSAdt9iGE09cf22zxzJOBwpsnzkSQ63zF+3SxlqMZ3HriO07IHPCA99brdHwdHFdq0pMeg44zHYQ8K6MZiJ0XdaE6vtaH0OhCEGiT0k+lG/tRD+r0Mep3uT4mM61lnycdSEzvgi8kry7WijUBU=
Received: from BN9PR03CA0855.namprd03.prod.outlook.com (2603:10b6:408:13d::20)
 by CH2PR12MB3799.namprd12.prod.outlook.com (2603:10b6:610:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Tue, 2 Aug
 2022 15:13:52 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::7e) by BN9PR03CA0855.outlook.office365.com
 (2603:10b6:408:13d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15 via Frontend
 Transport; Tue, 2 Aug 2022 15:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:13:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:13:48 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 06/11] platform/x86/amd/pmf: Add fan control support
Date:   Tue, 2 Aug 2022 20:41:44 +0530
Message-ID: <20220802151149.2123699-7-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: e4c69c97-b980-4f10-ce7d-08da74999bfa
X-MS-TrafficTypeDiagnostic: CH2PR12MB3799:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZE7pQdcraxEM4rFMcFVjO9bYNIoxbo5YusBVqnVW+XF+eV9DKnn4dtlpFilcrYflA+Ns7chnYsRoygpQbQChFzYN+OwvZV8+qeX0ICG0ozDpNC3UbNPwJFdOY39bZg8t9b6foEgIeVPWi4iNqxz0KZpSOJIs5EmU+N5lcqXrbmd8HDpMAttjiuE5FKLkgzF9CRN7Ac7/SKIqMat89DKfWH8WY4B+Z8uwbFiKc2HPw+/kATeq9irhvPJAylnP0o+KEN0ZHnrRCL/DiQl+FrlP/TUR4rbBnMnQImah6PLDuPGafYPAVNaq6dX25VPodIgAwXPQGIH3YuBW7ejJXsQbxib97SWkT6dzGix+uIUmrPI1Me9QsBGSkSRiCgLFKU2yhD8j326dchTHrig1E1O0SVW87wcJhws5JsHeF27o2M8lrBnNXDrQXivhJUIdjH041lXxyZ2Fi9okMHn5T5dDAePLRFSR/AdEp7uoGXWtYGPMFtXaVfMHOe2v0Y+C35KQMek+r/MpOExi/InXsXbH1vvgxKBz4oy3++8mjmyPHhMW64cqRpKViE1/+JPulKBBOD8XQEye9MWu5jgg83J4Z1OKZqT069DQJ4JJT3+DCbLekyG1gJmy967dM809vvD9S3K0HpjAdGiKoQaRcnrv5ifst7iXIFy7CqF1NnaT/EeLynQdErAM6s7+EkD3yHTFZyq30QXOEQIm696ZVihZjKBtniX1IMIZEAK5gGoZ0OiOQxKZ9iiI4h9Ul+op7ORCeL1UEwet+xPx3LAQz/E7p9omBx9gcKKsKCiG/EnjzoMl46/I+W8GwwrSO90zsX+Y5XNB2a4nqyr8qVbTiUbCMg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966006)(36840700001)(40470700004)(82310400005)(82740400003)(7696005)(26005)(6666004)(41300700001)(478600001)(356005)(70586007)(81166007)(4326008)(5660300002)(2906002)(8936002)(40460700003)(86362001)(8676002)(83380400001)(36756003)(40480700001)(54906003)(316002)(70206006)(47076005)(110136005)(186003)(16526019)(2616005)(1076003)(426003)(336012)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:13:52.1288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c69c97-b980-4f10-ce7d-08da74999bfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3799
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF has a generic interface defined via PMF ACPI fn9 for influencing fan
policy during mode switch.

PMF ACPI fn9 will normally be invoked when AMDPMF needs to change the fan
table index for the EC. When AMDPMF is loaded this function will be invoked
to change fan speed. OEM can also choose to report the actual fan table
index and fan RPM to PMF through OEM structure.

This information will be communicated by PMF driver to customer BIOS.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 25 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 16 ++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 6af0e23257ea..1fc4d1400364 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -119,6 +119,31 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
 	kfree(info);
 }
 
+int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
+{
+	union acpi_object *info;
+	struct apmf_fan_idx args;
+	struct acpi_buffer params;
+	int err = 0;
+
+	args.size = sizeof(args);
+	args.fan_ctl_mode = manual;
+	args.fan_ctl_idx = idx;
+
+	params.length = sizeof(args);
+	params.pointer = (void *)&args;
+
+	info = apmf_if_call(pdev, APMF_FUNC_SET_FAN_IDX, &params);
+	if (!info) {
+		err = -EIO;
+		goto out;
+	}
+
+out:
+	kfree(info);
+	return err;
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 {
 	struct apmf_verify_interface output;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 5b85a7fe0f38..d40613a30ed7 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -18,6 +18,7 @@
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
 #define APMF_FUNC_SBIOS_HEARTBEAT			4
+#define APMF_FUNC_SET_FAN_IDX				7
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 
 /* Message Definitions */
@@ -39,6 +40,9 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 
+/* Fan Index for Auto Mode */
+#define FAN_INDEX_AUTO		0xFFFFFFFF
+
 #define ARG_NONE 0
 
 /* AMD PMF BIOS interfaces */
@@ -57,6 +61,12 @@ struct apmf_system_params {
 	u32 heartbeat_int;
 } __packed;
 
+struct apmf_fan_idx {
+	u16 size;
+	u8 fan_ctl_mode;
+	u32 fan_ctl_idx;
+} __packed;
+
 enum amd_stt_skin_temp {
 	STT_TEMP_APU,
 	STT_TEMP_HS2,
@@ -118,6 +128,11 @@ struct amd_pmf_static_slider_granular {
 	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
 };
 
+struct fan_table_control {
+	bool manual;
+	unsigned long fan_id;
+};
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
@@ -136,4 +151,5 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
 
+int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 #endif /* PMF_H */
-- 
2.25.1

