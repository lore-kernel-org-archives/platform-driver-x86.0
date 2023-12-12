Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qoAyYLEF"
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6719FE4
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 07:13:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0ZpxCwKx7ckr16/UMj6n09FrQmU7QZ5dsWqOTPHZ4iKjKEblOkeGfDi/dSbdLO4BGKsJywGTveYPZ/e499ViDzyZdzncXGkFFL+TGPTzZM5f0SNWRRY5DR+gGuhuO+zOhcbN28gwAL0VJJ/Xzc1TK4DKbZaTZmN8fb409bBZVyE1OKKb2bBCIXQGMUEK09jF+mOCu3fl8K4bCoSWXi8Xf270xYFM1IuxtPkzyd4sijHFWcvkqYlo2R/8HfMsXfkMbyUXhAizs3Wid2v+aJl2hPiJeMFFg/8nJI5Na2b/mLwN57iInSOYceS3RBlhnzezfceSxyi+w7Q++jqqDlc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Vt15iMSlg9b0OaGoukNOy6Xo7Z5e3SBaNbei/5++90=;
 b=HxBRozkHkPr5bHgWxOzrox5IMNhYxGuoGTcwOtoDIT1pkyUZqEG1gOK2lJszVNaPbKg4Pts8ErTewwrLl3KyRYcJg/1sc53h9Mg2FyGB6GFdT13NaCqbc5yVViCfJi4eZjGygxwYayWpL84AgHlrswQXYt1af3BT9fuO2vaiocESsXC7JDpE4xICcEVt8hwb+E96RipbTYOI79dcnZWn/nK6WHd4gz8jYFRlzEIzE0k3Z7QBI35CHT2VdmcAOH6oArqk2I0RbPqTej3MzeUVcWEe8tLe2MItwNlpsAqmoLemeHE1pk8noKOMOyn2QZcnuOvNKTX4pATPttxcyjRRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Vt15iMSlg9b0OaGoukNOy6Xo7Z5e3SBaNbei/5++90=;
 b=qoAyYLEFssmTEgb6u9SJJngReOEw+rtDKEDrbwU8H0//IqSv1AXq8WIAJPQclV0HmjX1vMz0SOoT2ebzDD54FBthhFq7jb5XlOOwXPfmasB9zxtvwdWVI33+0Hf8j6v5/qM9JI9sD+hySLMSl98IxRplcPUSwu/9E7Ox3p33Mz4=
Received: from DM5PR07CA0099.namprd07.prod.outlook.com (2603:10b6:4:ae::28) by
 IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 15:13:39 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::e7) by DM5PR07CA0099.outlook.office365.com
 (2603:10b6:4:ae::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 15:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Tue, 12 Dec 2023 15:13:38 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 09:13:36 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Goswami Sanket
	<Sanket.Goswami@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 3/4] platform/x86/amd/pmc: Move keyboard wakeup disablement detection to pmc-quirks
Date: Mon, 11 Dec 2023 22:50:05 -0600
Message-ID: <20231212045006.97581-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212045006.97581-1-mario.limonciello@amd.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 09eef720-1cb4-4f02-d087-08dbfb24eb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FYGtrP36VJ501xsMY/vBAxQ0Yx4s1EhecJe/NOm65CCS368gpEQHpj3jCTv6yOEgPQpjEmLOv0hCeDS6j0/T2qeiuIDiK7N36gyN5sraXHthH0SwVJ/9eELwqj8zeYXXNqUNfpD26psGxrot/rEqHFgwACWFCc+Pkk8IUmU85sfPg582UOh629gW2/C4gm+SvA1o1bEf9yXIfdx1pflRk6h8n7QXhuLPYB+uxkuk/1i+pRlE0qtywEv5t9mZWiHXUBCE0TqrJ8iziRU8nNquZM0zNBGhYJ4SlRRvSV2pSfXmQWb4uA4Q6zfverq5SD/hi38xyrjh7wnFdVqrXV1qk6FBNowIgl35H4DEIASXAdM96ZnozVDH4Ic2n7mZuuszHkOlcYuVxL/s6b6h253UVq/AinIe6kO6z/FLmawTkBG2CmK0URPTDLeJ3nItB7epdoagB8Ioi30rwmcqZmq+wKBWrkyRRH4+odxSsKFKJjE/hwD1P2OibfbChYh6VnYBneTFt5WX/+oIwuvGLIe+FteuidoXmg3YpzVErRDdouM8Ae4grvDn1o5IZV1tZaBtYjJRVptR33fFEtT9S3KtL2xU+/JvPo2DKE7BNXR6HlcYF8boZ9aU2kl67JkO1YlcqhYnoc6Lxl+S63pNpyARKK67TzEyLgHNQszGnEuOt/anirevQpibRPtWFiKW0LwsdhJ8hFRy8aXOQNs471TsC4Sv159biiJIwoijtJOwTWSAdg4utD9mRl5EAQ/7AaF1d94ue4pHHDJOrk8a3HEJAw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(40460700003)(2906002)(41300700001)(36860700001)(110136005)(36756003)(86362001)(82740400003)(2616005)(81166007)(356005)(1076003)(336012)(426003)(26005)(16526019)(7696005)(83380400001)(47076005)(478600001)(6666004)(44832011)(4326008)(5660300002)(316002)(70586007)(8936002)(70206006)(54906003)(8676002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 15:13:38.9013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09eef720-1cb4-4f02-d087-08dbfb24eb63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311

Other platforms may need to disable keyboard wakeup besides Cezanne,
so move the detection into amd_pmc_quirks_init() where it may be applied
to multiple platforms.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 3 +++
 drivers/platform/x86/amd/pmc/pmc.c        | 2 +-
 drivers/platform/x86/amd/pmc/pmc.h        | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 6bbffb081053..c32046dfa960 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -235,6 +235,9 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
 {
 	const struct dmi_system_id *dmi_id;
 
+	if (dev->cpu_id == AMD_CPU_ID_CZN)
+		dev->disable_8042_wakeup = true;
+
 	dmi_id = dmi_first_match(fwbug_list);
 	if (!dmi_id)
 		return;
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 824673a8673e..864c8cc2f8a3 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -930,7 +930,7 @@ static int amd_pmc_suspend_handler(struct device *dev)
 {
 	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
 
-	if (pdev->cpu_id == AMD_CPU_ID_CZN && !disable_workarounds) {
+	if (pdev->disable_8042_wakeup && !disable_workarounds) {
 		int rc = amd_pmc_wa_irq1(pdev);
 
 		if (rc) {
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index a85c235247d3..b4794f118739 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -36,6 +36,7 @@ struct amd_pmc_dev {
 	struct mutex lock; /* generic mutex lock */
 	struct dentry *dbgfs_dir;
 	struct quirk_entry *quirks;
+	bool disable_8042_wakeup;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
-- 
2.34.1

