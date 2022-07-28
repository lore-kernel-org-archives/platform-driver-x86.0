Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88033C19F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiG1SVK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbiG1SVJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:09 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4DE5A8A3
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k22Ze6mgAxUUI+cDzqKLGtQpUO6NF/qoj8UEWR9xKXt6kselbfp/Hgl+o/Sgk/DrQEf70C6ZoU+BQ71OO4CwdBFcNtIJcyQb/Cn+MwiE/l/GD0BINwdCQfJ6ED5XCE0AYUVgj6PHMyNEdU0qMCETNZMFdr4tbh4KbT4mSvM6mUKLZy+I+4oHnhNTugQhd4i7mhL1uiQAX8fEAtp2pK6UPxQZonqBJJR4Fw/kRG6MZE3PI3Sd8o7K+HZZ5lFmDcl64v+xdgctObwVH9d84JHnS+XXaKVVJaY2edAMcNXTaTM4HDlb+5PjC1Jb5q3RPPu11joMTMRJ69LaEpWaz1IAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+WOppxaX5Ryy1c5Bx0Yc9KPBvUOEsLUdEzkafI27dA=;
 b=ToPGo6/oLjC7/ymHtqOAruAJjUZt97eOpMCOFLuNiEeocOGJcD2W4KsOu/bIsLShuvticDkaOe34BWliS7sNNm1BZmPEFwNGFCYmiVH45GvgH+rZM18k1ApN6JhjyiolAzN0PaFbZ/uThaznw4hWxAt0psMQ5AD8E81l2UZJbqvUbVHAm/yt/MCtqqHqCYwcr9lyP6Dl+k8mOo249bC/s4cKsAjhULNV3J7X0jRnNr89jIl70LED56WqNPUeAty160bjIzaWOU5E8ZIzFCDEtaXU0QBXYarqKgVpyy5T/B990xnq207QJb2cTJUvO3jpnU0/8IBnheHiqqd+swoxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+WOppxaX5Ryy1c5Bx0Yc9KPBvUOEsLUdEzkafI27dA=;
 b=IWUET+w2EfWy6NoYvLrnFRV+m7Te3uwDfc9nPtb2dqPWujzSWQNlvt6W5PpUBFDYqqCZ8oVrDG2DoJ4D/tTwNCHSDZ5Gv8pziZWNcrtVGRN4fB8lp/7MrxTvUWVmVpxsd/F2VeZm6/0Har8wX9ooxqjtUi3rrWstWEqYsTJ6W0w=
Received: from BN9P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::6)
 by MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 18:21:06 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::4f) by BN9P222CA0001.outlook.office365.com
 (2603:10b6:408:10c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 18:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:21:06 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:21:03 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 06/11] platform/x86/amd/pmf: Add fan control support
Date:   Thu, 28 Jul 2022 23:50:23 +0530
Message-ID: <20220728182028.2082096-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed26c07a-922d-41b6-0168-08da70c5efed
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTtxBecXIyacrFSfPx4zqzLvLWcNCRisUHsSC7VNIfiXr7fRRV3bZTphYzSpWZ7UbsbXWPseaFvn19vhTW8X26cocULtmIdSx5eXm4YurkvLlLQnD161WZtLHPYN4AJBI7NkscTt/McQT4KCDGyTI0K7/KHHENBz0Cn65FPtI2msSzjXVGasinv/eXD8GnbT6IvSsr7kbcgfastTNvo/M+AhFb1gQ66Y8RD3flTuFSXfEhdUfWZOI7LnEgxgEE3tNFlRAgMiX9Mbvh1PxYWetJYYexUOtVXVxbAUDYlChy3OhY/ykfW3FG016EfKkbWGEo/ugJA1M4vjnOpI1uNk4iMHFc/tXmht1n3hQJ/cajGUS2Ev5zPJv537ZqiE7JrWDWChOCXpCxgaMN6rv0wQqXeuj5NnJk+BRKIuZXgCOdp3wnvzBKh4J9VOaNrpBIRlNaZC02UuYnr729ouwXxNfF5z2hTW20gQwqioKigzCN/Gw6FLcf4vxyT5HUn2grrYFWanQM36P+394XrrGGJfOAXE/eebNUEOomU41yWOR4EsVMtbQpwbdNwZJf+GkKIkFbzlTfx+UMsGRBnv8EIWpzALbuO/kt9G+PipKv3PMsN9zO2SGhe4mfcucRd+B+2n8TKxl8VAlu3WmB+vlGzzqbZOCRo486IukOzOrisS/JQW0vtNl4GRAhcGnVCkwmaplqT9R0Bx1K0iIw5jPmyAHMfffH5n0quZsNAJ9PzhYLSj9i8NAUdGdBqm+lDBYl1iWwTKS9VP0UpqXTSqETU3ZuFuwnbqmWrEOdg0Yo7dot7qM3ScDzkcf7bvhxA27gPYNMNPXHMD8cft0nkTv/cJpA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(40470700004)(36840700001)(186003)(1076003)(426003)(336012)(36756003)(2616005)(7696005)(110136005)(83380400001)(54906003)(47076005)(6666004)(41300700001)(2906002)(82310400005)(26005)(16526019)(81166007)(70586007)(36860700001)(86362001)(82740400003)(356005)(40480700001)(478600001)(70206006)(316002)(4326008)(8936002)(5660300002)(8676002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:06.1720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed26c07a-922d-41b6-0168-08da70c5efed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4553
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
 drivers/platform/x86/amd/pmf/acpi.c | 26 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 17 +++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 58e4893edea2..1814d48f8e44 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -99,6 +99,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
 	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
+	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
 }
 
 int is_apmf_func_supported(unsigned long index)
@@ -134,6 +135,31 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
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
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
 {
 	struct apmf_verify_interface output;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index f546062a10a7..b6501a68aa4e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -18,6 +18,7 @@
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
 #define APMF_FUNC_SBIOS_HEARTBEAT			4
+#define APMF_FUNC_SET_FAN_IDX				7
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 
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
@@ -133,6 +144,11 @@ struct amd_pmf_static_slider_granular {
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
@@ -150,4 +166,5 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
 				    struct apmf_static_slider_granular_output *output);
 void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
+int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
 #endif /* PMF_H */
-- 
2.25.1

