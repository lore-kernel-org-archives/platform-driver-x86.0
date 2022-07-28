Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6DEC19F29
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbiG1Rm5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbiG1Rm4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:56 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2060.outbound.protection.outlook.com [40.107.96.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69B1747BC
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXCi4XJ44lVm9o7y26wx29VL8vYpgmjEK34kddjFlyu0mCp+2UrRAUHhYXFtd/fSpNhXeQyOhM/0B6ft8AGNl8Wx/1zskRU/XdBTsylR6KurIjskiqBHPiqJImApDfj8vjFdd1dd5mwYxJezciyfpIPqBEq0JR4FTGnh6E9/EIv8/KJdPACd6uHs11wHwoAXwj+Dl3rvLDEj/SLFXOZ7EHrI1Xq3BLKMtx3aPMpJl3bkUN3dTRlWdt5G1gVoVwbbz4FgiB33BiiZUJrzv0wJ217kXvKvgWCAHhtoSfSjSUz5Z7LWonI+WU/fc8/OxQOD1VDi5CfRD49DK8V5w306FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+WOppxaX5Ryy1c5Bx0Yc9KPBvUOEsLUdEzkafI27dA=;
 b=NvlJIYpVLbxMqxI6+dyysqdeAQ1dr9DgIBZvb+107Vs5YrR8CynvLUnRiq/alJ03TRVKgYw5b5X+TUAg7RGKKzuSyqso5icJJp1qPPmuA3xJWBDxBd6/eC1DPv028tbfr9IcoH6dsPfpD88ydtkmHJNSJ8MrZ64/b9WFzIrb8UL/8LKmMMvjqG4I5ga9wzCUAjloxVkQGwWT9mOKYq8EmYQRp2DzbJ6SiTDVcDceS+0v5yVrhVJjnp9N9bLLmXIIAGm0RNz+mnDjwyBHkC0yLUQURL80jm2zpjGTC+d0/6+oSic5tBVJbZYJPzoZZGcB8WBgxG6XVE8noxkc3aCK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+WOppxaX5Ryy1c5Bx0Yc9KPBvUOEsLUdEzkafI27dA=;
 b=3wz5IOtdgbPWAOKZjvgp2dJpK7DompfNTYRw3JIXzCFRAqxMrxKmFmIF3jqBlFopLmxvy2ToG0fpFJRnqF5DwC8fLh83Slp64EJfbbU/r2qWRJnO9qds6ttCwmEf4gxkcuA3DdZ1/hEOl+DrNWQjaBhzizvg1Z3nzUYhoX90F7k=
Received: from MW4PR04CA0260.namprd04.prod.outlook.com (2603:10b6:303:88::25)
 by DM6PR12MB3305.namprd12.prod.outlook.com (2603:10b6:5:189::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 17:42:53 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::5) by MW4PR04CA0260.outlook.office365.com
 (2603:10b6:303:88::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:50 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 06/11] platform/x86/amd/pmf: Add fan control support
Date:   Thu, 28 Jul 2022 23:12:03 +0530
Message-ID: <20220728174208.2081453-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
References: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e318ff0-64f7-4fe4-3bac-08da70c0995b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3305:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLrrNwXygX446lMHcIc9iw4/rpX15dxYCkgFQB8m7Y3b73XF2igem8nosSUXUm1Z7utR63mBRUKsiF3CtkumReSzBEng5dmORFbDIhb9w2G05n9CXef7x4XY1cPJgeJFtaA8m+lIJqWYysSHTrp3aUgPiAHKpvHHx0+iWPNYX9QoSiOAgTbmBIN4DbQ+UcfaA1bel7sWnNezDPqwD/KzKjlgCUcZ1/TvxK4cTG8yb6TCV51bgXk/PsnSOzYFnHnHJ2DUx4atz6Hs0fW4bzMsr6KfwS4PbmYN6LbnNKW1h/QtHR7KN3T05lWx/xBwZLIspDiuLpWr+wrDuAUHVjnqCdBuBcMrqtg3g2NEDq46Fv4XNbJ+/nj/darq9ayVsIvaF4Bqco/AxvR3WXY2du1o831b8vDNClbd578o+PAGdW+NtkHrEAamJn+kvkADlPNeOp03Dy2oWiTEjAO8yYfsyD4J2fD+K8g1/XhiOHtN+aTUjIuSsrYS9XE2bRzsQ9Zd2Zr25BVeZt4TvSHr4n4hMo6+jx52ihWu+xXJu6Qe5ogCetEUz9Lxhg6aW7u0Xr74SAyhw5qM36HTnoUfNaw/xetwTscXSIgTu9GY/r+itiKOWU/N4h75WKCdP73z1KRkyrJpz9mzcH4/66qJsNeW152EmoOW13JKAcSKSHZV20635GyM5OK0EYXbRrKGOq5+ODOHePYfJ88xQj87mkOD5azKNJxa7+wyh4rm8a4DFLqq3Ea9/XvQB7X0hl4AZ6utnmWXt8CmMuoRvX2xATuF01stVpIjvFZ6aQIN7iz1qh5c/DT/+SXnLeGAPxftY3IFPC5EAANfAx1RtXBB7JqgJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(376002)(40470700004)(36840700001)(46966006)(2906002)(5660300002)(40460700003)(54906003)(110136005)(4326008)(70206006)(8676002)(70586007)(86362001)(82310400005)(8936002)(36756003)(316002)(40480700001)(356005)(16526019)(41300700001)(81166007)(7696005)(6666004)(478600001)(2616005)(26005)(336012)(426003)(47076005)(1076003)(186003)(83380400001)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:53.3396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e318ff0-64f7-4fe4-3bac-08da70c0995b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3305
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

