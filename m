Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA9DC32792
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Aug 2022 06:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiHVGaA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Aug 2022 02:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbiHVG34 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Aug 2022 02:29:56 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FBE15FC9
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Aug 2022 23:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PW/ESNvqvOLW5iWRHLYrbeTewXjv+CXcA6DPXVj3Aq5+y0qPPNHB11PD960DK/OpUgzWr4/CRWCCTbQPmSU55Frh7Wys3RrZhK84ofbhjqZspvwMg5LEXYzX7+9u6dFu3kmj+rjYvyiG3Fu/NU1IartVF1vGrdUyUhEjBArcZBIHGxstT0GguLyeJM1Hq5K18dqHq7iGsBA1HZSWEcL9C3v28qbCewyZ9TIfja5+n15kqKGoBimfngMniLBAQyTNfdMcL0HZ8zhweoAy+Bq3ckgktNptL8mBTg6FjZCnk8ZdaN4Rz/TdZMKUQ5rlSovt2HCuhako54Y9bNpmercbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWXH7d7CtBOe+tpyplKDFcheELha9Pw5p2OMsh5RvLk=;
 b=VZkWGLZgWL66lITD3uwptnPh0cK+Moo3j0w7WNhN7l/sc8WPLXbHc5k76qbK4I7Owydl08WUZgAGv1gN5D6BW643gM0BA3IjV4gJaMx+ff8MQYew7mVjRE4HRDDdf+smShAz1fJpRxd54nCXpt1HPiV6UjnI2zlKy19s7hdEGXsr/Ah0plQbQKRs8s7zwAsXdM1DbIYvW//Iu8xAinB5Qm+VB8WhRJG7AoRSXsMueLNQwGYt1M3mAUKHjtV0AeBjh27P0hNuJ5gNim519K5Qw2r9fZjuQmjZ8XOdgn61gMJ+EQ86S6y3GBdlKiToPDPEIpRwLAflD3QdhDrmHekP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWXH7d7CtBOe+tpyplKDFcheELha9Pw5p2OMsh5RvLk=;
 b=a54Yi34mINAwDKr0Qov9A8Pmr63bGAfyFrCO8yElkrWLx1eNuvHnN6PFLV6umHWKmcrgIAAzidGHX85LdqKxCJgtSJpGeslehrmGG/cy0eiVnGLcjYiaX2TMRvTj9Gwq6jJa2ccBt7Bc4T5XwHxG7MX/o23FU94HpjrlSpOc9Ns=
Received: from DS7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::10) by
 DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.22; Mon, 22 Aug 2022 06:29:52 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::d5) by DS7P222CA0030.outlook.office365.com
 (2603:10b6:8:2e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19 via Frontend
 Transport; Mon, 22 Aug 2022 06:29:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 06:29:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 22 Aug
 2022 01:29:44 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] platform/x86/amd/pmf: Fix clang unused variable warning
Date:   Mon, 22 Aug 2022 11:59:17 +0530
Message-ID: <20220822062917.4061503-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bebaf24-ad26-4dfa-7bf1-08da8407b867
X-MS-TrafficTypeDiagnostic: DM4PR12MB6616:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3m0eALyXktoUr++QHmH7a2jXPuqe/xRpMqKn8Q8xeV3YRncL5PMIBeMHCIeIw3THxf+vE3nzUbbmGY7SwAsyx0P/0vE89ex7WuvRrpshZvgSemMAlypvVFDryuRJjWg4XbkXF8wt67TVnUdji79VqQxcYLme38J686T28afMxHMmlbC8sNyHLgl07KGYboYxg0Dopf4MvUV3D99VXV0+ty1fXgdYq+m8KEGCWIU6FvtNclq/9illlnXY6jc4wvT5Tejg93l3a30Ln0OE6oXc14A5OrD0sbotszE6yNIReTvcoLL8woVfPNZuxYr9J+Je0hqEetvUsH3efypFal6R26W0gh8v9+pHydLTRuqdOukNZVZaUBkP5AmjUjvb9RZxkOISQ+IuZhrxpOce9etjhfSY65RWLb2db7F8qX1YrN/TeKmdX9jw5ygZBTNzp9bJM1X33caKNolN3VUCkVXJAhkcfolXZEp34BdY1wtt1QoTVI5q1VFpQabNNWbrVN5hpIqXeMB2hLEaiw3kJaEoiq8v0p3rmkUGpuu+Oo3bjlx/NL+sQboKfCulzgvccYwq+4Wl5KRGhRL7v55RKtqlfQTKaofcxmKnidPA4amVwfBkVYTh11r/BQxs1K9qp/nhbTTzARoQzXUVyH06EaIhsfpm0tWkZ8GJpGxlVyVlPohKP8nLg24AkAqrOSDpT2ei/vuZ/FV8rF3NZj2X9CnYrWjEvw7kcpHfedsDNsby5BO5m31f+X9ZOrKkMgANifYGFr1oE1bGOHaV2aZEn97yZCSi2rQIQMV51UZhi+UAAMoJnrxu730mREYNOFBzhniS
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(136003)(36840700001)(46966006)(40470700004)(70206006)(8676002)(4326008)(70586007)(86362001)(110136005)(54906003)(36860700001)(36756003)(356005)(81166007)(82740400003)(2616005)(186003)(1076003)(336012)(16526019)(26005)(47076005)(426003)(7696005)(6666004)(41300700001)(478600001)(40460700003)(8936002)(316002)(40480700001)(82310400005)(83380400001)(2906002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 06:29:51.8367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bebaf24-ad26-4dfa-7bf1-08da8407b867
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

variable 'mode' is used uninitialized whenever switch default is taken
in sps.c which leads to the following clang warning.

---
drivers/platform/x86/amd/pmf/sps.c:96:2: error: variable 'mode' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
          default:
          ^~~~~~~
  drivers/platform/x86/amd/pmf/sps.c:101:9: note: uninitialized use occurs here
          return mode;
                 ^~~~
  drivers/platform/x86/amd/pmf/sps.c:84:9: note: initialize the variable 'mode' to silence this warning
          u8 mode;
                 ^
                  = '\0'
  1 error generated.
---

Fix it by returning -EOPNOTSUPP in default case and also change the return
type of the function amd_pmf_get_pprof_modes() to keep it similar like
other drivers which implement platform_profile.

Fixes: 4c71ae414474 ("platform/x86/amd/pmf: Add support SPS PMF feature")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
- Handle return codes for all amd_pmf_get_pprof_modes() callers.

 drivers/platform/x86/amd/pmf/auto-mode.c |  8 ++++++--
 drivers/platform/x86/amd/pmf/core.c      |  3 +++
 drivers/platform/x86/amd/pmf/pmf.h       |  4 ++--
 drivers/platform/x86/amd/pmf/sps.c       | 11 +++++++----
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 368964d885a2..644af42e07cf 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -264,7 +264,7 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
 	dev->socket_power_history_idx = -1;
 }
 
-void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
+int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
 {
 	/*
 	 * OEM BIOS implementation guide says that if the auto mode is enabled
@@ -275,11 +275,15 @@ void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
 	 */
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
-		u8 mode = amd_pmf_get_pprof_modes(dev);
+		int mode = amd_pmf_get_pprof_modes(dev);
+
+		if (mode < 0)
+			return mode;
 
 		dev_dbg(dev->dev, "resetting AMT thermals\n");
 		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
 	}
+	return 0;
 }
 
 void amd_pmf_handle_amt(struct amd_pmf_dev *dev)
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index e46d63aa51b8..a675ca969331 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -65,6 +65,9 @@ static int current_power_limits_show(struct seq_file *seq, void *unused)
 	int mode, src = 0;
 
 	mode = amd_pmf_get_pprof_modes(dev);
+	if (mode < 0)
+		return mode;
+
 	src = amd_pmf_get_power_source();
 	amd_pmf_update_slider(dev, SLIDER_OP_GET, mode, &table);
 	seq_printf(seq, "spl:%u fppt:%u sppt:%u sppt_apu_only:%u stt_min:%u stt[APU]:%u stt[HS2]: %u\n",
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 7613ed2ef6e3..0a72a395c2ef 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -303,7 +303,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 
 /* SPS Layer */
-u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
+int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 			   struct amd_pmf_static_slider_granular *table);
 int amd_pmf_init_sps(struct amd_pmf_dev *dev);
@@ -322,6 +322,6 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
-void amd_pmf_reset_amt(struct amd_pmf_dev *dev);
+int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
 void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 8923e29cc6ca..dba7e36962dc 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -79,9 +79,9 @@ static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
-u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
+int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
 {
-	u8 mode;
+	int mode;
 
 	switch (pmf->current_profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
@@ -95,7 +95,7 @@ u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
 		break;
 	default:
 		dev_err(pmf->dev, "Unknown Platform Profile.\n");
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return mode;
@@ -105,10 +105,13 @@ static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
 			       enum platform_profile_option profile)
 {
 	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
-	u8 mode;
+	int mode;
 
 	pmf->current_profile = profile;
 	mode = amd_pmf_get_pprof_modes(pmf);
+	if (mode < 0)
+		return mode;
+
 	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
 	return 0;
 }
-- 
2.25.1

