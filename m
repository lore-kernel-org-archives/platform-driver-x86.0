Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D95CCA47F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:03:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiGLPDi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbiGLPDC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:03:02 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2060.outbound.protection.outlook.com [40.107.102.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6DA7C1647
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 07:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJxbm/AXmxybYPRmCPWOMc5GwCUCU9idPG25uLE9nlOcuHWE0Ja63m0cDQTSym2PVl3we9/O3Jpf81DVfi4BXYq0rliO31DvCZyGWGFZNykcU0ZDh8zlyHGoftzKbxe4B35IBvXWufaW9QelzcQHLlj3cdTuCrPD4wOfRqdjDeWDjpBgESxEsdCVX8r1RjKWFhNzxyEh0WpyQxjQs9eZfDwLCN6nozNMZDlbrYhTlH5u+Jiuy2Ety8TvSVkddOgF/GnFHC7cSW/uD4gvyeQRJeKKHmRxP8rsxaBofzbQY0g0yBHghHzuXW+fg0e3JntdqeIKzK2OuYBYWBU84CtLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1MCDjK1aBghNsFClQHItRu2Z3CdEosv8nrOboO7TIc=;
 b=HibX4MibBP5oLqCFAYRhdHUVHyvh886Uaucfah388xANeFYJpZOJjKAQqK6h/T9bVoB/WLQNFbH/un9123neI/X3oDcbZz8O6O12hADyeb8/0a7JKaJ+7rBN78RM9SqoBgXWYTXjW65xYKgBV6a7VtAOC1JQu7GzueiuoV/zxmXmQ1de0QEQfRUeZ1uM4j1ao5HI96l9dQNy6noIshNi8nSXcU78N/mdGaB1ukh/7aAUR4IG3iYSUWQaMncAOfcHloCX/Pl3cSJqDXVl/AeKa69tq+dYyTW7qrhvv1EVtM7gzn4WES+eI3EeSj1VxqVKgqX1OtaAXvUOUO1J3/pRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1MCDjK1aBghNsFClQHItRu2Z3CdEosv8nrOboO7TIc=;
 b=LgEtQL+xS3lgWzlrLtDGdgYX3KmYc67IyXMvrU8Pmw0nc709/49iT/ZGRHaHaSx/kITyyzrloa4DgCiUoH0Lg83iMgXgxtVwL3kGOoD1ovkt2oEXMzJTvMup5T2KU7cS5NsoA7TP0eX1j+VCj9xxX0xz9uJOC5RMKCB4+g+Rl2o=
Received: from BN8PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:d4::28)
 by BN9PR12MB5178.namprd12.prod.outlook.com (2603:10b6:408:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 14:59:45 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::eb) by BN8PR04CA0054.outlook.office365.com
 (2603:10b6:408:d4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.19 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:41 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 07/15] platform/x86/amd/pmf: Add fan control support
Date:   Tue, 12 Jul 2022 20:28:39 +0530
Message-ID: <20220712145847.3438544-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ba9c432-500a-414b-b761-08da641728bf
X-MS-TrafficTypeDiagnostic: BN9PR12MB5178:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PtHhpb3UaEWwxjxjNC0IckV2ue20w/Z+VDnkDrDhhJSqfaHKpTTkRClwRXHDZ/HQTNin7+3Q34AXdp4beUIZnxxxjao9KNwcvvO+gByvWklnE283nS4/YhJJFkmTXgJoUciQJEGD+tcaYFyk296Ujn10Et5hGgQs9QfE1ZZcTd5NOuR79CM9z72DYYaUKK0clafj4UTiPaDkoW4c5D3K7fQnba2Ad9tczQ0Fud5INzpa/3WjI6XqRZzOlR7bsWZ2ZeI3dVTMCCHOCj2fKJv9RF8gClMPnrDUAYoya4z65kDKqbpmPmQp7Ehm9Ndo2ZodqIlBzcLUm+aNoJiHOp+J32Zv2cmu5wIjlRZZpE7dgiZ8zCSPgoUWpQwCkMFolRbGYxRILoUQxZG4RrYq0Jj1rtQaY857QQbcZOWGKIcFisYi4KdwFizL2hpF/yZThsEVekE7E4YHM4Kwh37rdvoq4dYn8fByRGA7qLvXk3ktFi/a3jteaKNtaExlloVccdKOcVeSzggzlGAZr2JbPcjcBaOp0vHmhzLBA+m7uuQ0vp2gqX5JY/7azT5VtslnUrd5jUnD1drRU36g38ivV1hyDnex2JuPOLN8IQ0J8J36F+KSEUfI6p5/1ZPHsdl79REI1y9bHzA0ey6MRrPlgz+3CXVzfNS5xTM3CQ7HeG+cocPQDMyQpCqkUB3qN4PPAqssO1Da/DvrfthEcoE6C7pjbmTbH0gsGg+fg+PZmb1j66EhfrLbkw2QwG7RFzS6Nzyuw9NVMSCUQVolDZ6zcjpCF0O04IYvbNEoWkWpKcZC18mqH60wxJCn1c9Xr1E8Xg3jnD3agpuwZYI8Wq4PDZtu+fkKk2LqnbfQIME3wDPz3Ag=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(40470700004)(46966006)(36840700001)(4326008)(356005)(81166007)(336012)(70586007)(82740400003)(36756003)(316002)(70206006)(426003)(110136005)(54906003)(36860700001)(47076005)(82310400005)(8676002)(2616005)(40480700001)(1076003)(16526019)(5660300002)(86362001)(8936002)(41300700001)(26005)(2906002)(7696005)(186003)(40460700003)(83380400001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:45.6399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba9c432-500a-414b-b761-08da641728bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5178
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

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 26 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 17 +++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 60ffc9ba4adc..e4822c6f4259 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -55,6 +55,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
 	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
+	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
 }
 
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ampf_if)
@@ -182,6 +183,31 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
 	kfree(info);
 }
 
+int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx)
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
+	info = apmf_if_call(ampf_if, APMF_FUNC_SET_FAN_IDX, &params);
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
 static acpi_handle apmf_if_probe_handle(void)
 {
 	acpi_handle handle = NULL;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 504e1ae79706..1e9e2e498d15 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -18,6 +18,7 @@
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
 #define APMF_FUNC_SBIOS_HEARTBEAT			4
+#define APMF_FUNC_SET_FAN_IDX				7
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
 
 /* Message Definitions */
@@ -39,12 +40,16 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 
+/* Fan Index for Auto Mode */
+#define FAN_INDEX_AUTO 0xFFFFFFFF
+
 #define ARG_NONE 0
 
 /* AMD PMF BIOS interfaces */
 struct apmf_if_functions {
 	bool system_params;
 	bool sbios_heartbeat;
+	bool fan_table_idx;
 	bool static_slider_granular;
 };
 
@@ -73,6 +78,12 @@ struct apmf_system_params {
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
@@ -137,6 +148,11 @@ struct amd_pmf_static_slider_granular {
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
@@ -154,4 +170,5 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
 				    struct apmf_static_slider_granular_output *output);
 void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
+int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
 #endif /* PMF_H */
-- 
2.25.1

