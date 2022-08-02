Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E12EC00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236923AbiHBL2E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236922AbiHBL1y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:27:54 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A946032B9F
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwU+6TAxvwtOn8MPPzwbuJWgCGJ+1NRennTlLGAeZYw0pX5umEZA9Ybe/hQE/Nem/cib7SPjECge2OSLLzeIz2sdBNixbXrFulfwMXX4DdVOAEvfr/FOXJ4y6m7Lc/2P2K3qADjLx0UO7miKk6FZNhecTi8vsaXs/6zWFYg48A8lTQ0S5PctkgOrWP3K47h2dk3ykt6gdmJGrA/VMeFbYuOgaCx2XlrXyqT2Jdk16coZeYdL7dFJc5sqXokjQZUItevNdS2HP5Aux5qFLR6BbIiBLvGCGpOmQe0ObZBOzF/eBEuIUIlLmNsI287yJEhDeEVGMaiH5kJXtFie8j4EAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aaf67wCBPygUBUupOF/9WsrreErtsRtW87Q+AyeZ6Lw=;
 b=MKdRB9I0gCEJM12Al/HZnJ6jc7TrhfxRHMyqKBVSyipkqvhGpSxnGjTtEvSe85I7jUVOVmCbR4XnAie1ByXFaY3M6zPVuQikT5I2ic1Rr5lhbtBJmv/VVov7dz7P5oTnfpJZB8u5N7t2a57yta+lA9olU13KC3YyWU7WLzd1u5UOZooGRGsGNZei/JNwA77TQAeLv4R3KJqyy2Tf0Z+dJ+BHCu6cVn3+uBs+99+aZlKfdEpPntv54CJiKulj7qxKr1TSXzIS0eIY5oEPfNIzq+MnuKexBfILSJgZZ6Lr7bCTmVRHK2Too+CybOEFXg2am2dXX0YkCBMtaAtqonzOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aaf67wCBPygUBUupOF/9WsrreErtsRtW87Q+AyeZ6Lw=;
 b=hKugOo6rjAS636erIKDFKiN7YAO8+k5eymJBTFbXXnftA+2k6Dp6SyHP9r4F/vwGOrhed3EmIxJT3XKTQZUWhz2b8eXrLyBJaCxCfww/w6mjWXu7CoCKofpx2bk8S4Gcf0WrVkhqfZv+LO0IPUAkbt/YHMTaWBRHL0Z0AvvvCwg=
Received: from MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::16)
 by DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 11:27:52 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::f8) by MW4P221CA0011.outlook.office365.com
 (2603:10b6:303:8b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:27 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 06/11] platform/x86/amd/pmf: Add fan control support
Date:   Tue, 2 Aug 2022 16:55:40 +0530
Message-ID: <20220802112545.2118632-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3da7c03-7cea-4d96-e652-08da747a092e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5168:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dY+lcSii/764g+kiP+MG6pClJqgULlXJK+JgWgAfdlCjO4MT4FeEWfa4UroIFTCO9cB6zzPA1nm9DnGSR2gtQ1TGVGI0kbXuYI52jTOeVG6MIbj81PnB7F7sF9mpUNfL66NHZ9MKfm8+KBPJLld6kBpZgpQ4a4w1J0E+imBF37uHifprr5kgH6LqiWxVZS3rw4UEux5QcfyCwDNk5HB8F+LqcIKDqyF3ziqsey3ArUn05Y6BsY8RTEktRS7Jw6Ow4q8ue/2KXY6IK9jYypbzLhC/mxH15M+uwF5HRF+g9DFtS0I4KTnSAEh/w+4gKQSJKSbV9K1OyXfM7rvsTYa17z2AR4QmelzsmZ/SRdQt7UaLH0s/Mcx/b4FZ55+q2/fRWuIGFH3T6wHf0bhnbcsOpWYIaVoBwacz7MecYnrsIkyl6+kJaJC7jbcXViIubUFTvGStbC0eLGJWZ7MyeAsA+wVMkQTHfB3BY1qBEi6YmaiC/reExE0K0X4ggGD1zgFYAJz9G7UruLoVCjRK9Z+xtP8rucpp6/R7sYn7dFpRrkguUB9Yyfs4V1CH2dW/1W6YpXk9YCL37/WsWi2C2PzedyEb1dFB99C6wnBB2dXGpoTwVuBndQoW9WQ8lTpesZfB5akiABrrlMEys7jv7PD1LSg4koQVlO/LPaWVhz0xeEFvDHIt00IkM1tOP+9dYrtq8KnjP1LIJu9ZMNRG24r7FyViL2iRKHgG6stAJcTJPBkKXjGQSQ4rqRGJerBbQ6BOI1r9xJvtBjy3m3FJm1qFFPOIl7uujZhYsGdrXdlQHcsJUgWnCvVku9TY6WxpehqvoHQpwGXz0Ucxp0Zu5ZTCWg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(7696005)(41300700001)(26005)(6666004)(40480700001)(316002)(54906003)(110136005)(478600001)(86362001)(82310400005)(82740400003)(356005)(40460700003)(81166007)(336012)(426003)(1076003)(2616005)(16526019)(186003)(47076005)(36860700001)(83380400001)(2906002)(36756003)(8936002)(4326008)(70206006)(8676002)(5660300002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:51.3523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3da7c03-7cea-4d96-e652-08da747a092e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5168
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
index c3f87265eeae..a2246c08694e 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -124,6 +124,31 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
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

