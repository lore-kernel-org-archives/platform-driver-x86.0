Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980822EE5
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724533; cv=fail; b=Vax+86fwP07hMaiF+HKmXKYq7VXGfntH/GhC0dV1XgmHZO0DN2HQr7WfACea/3RHO6R/D2Gzyu+CaXJNwn80z4sJRSScGjCc+V/QMRNIuNrgh8FAjG8mC4soGrrE5zI50ndATydGdIC835NkvdNSKuCaBIH8Dj6Ol6DGg6Mubek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724533; c=relaxed/simple;
	bh=P8h1kxxVlz0eTLBK4i8tSwGX7fUMzKc+6yajYN+zMFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWTLfyz/dPDpi2r7JlD9biQIeIKK9Gq/kR18Nu3ihP14YvEnfh52xykLjKP7XYO1Zma8zACpWi1PkKBI8xqPHXtn1mlo76/A84vebTx+fXbMAk9mj/xQuYqudR4eqz5k/lr0x91Alg+oFzWJJTQ7YwKv7PF+6p1DoXhGXOcBPKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=srqHSjHU; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="srqHSjHU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKw4geg3YMxH7Ckk8p0aD/SXS8nLKPSz4IFtSd6D375E+r7V5cxUSzRJMh/s5uvmKflHgfx2GoXxwGkFSsUaZPTGmybOj466ozFHo3DguXPgjXUv/y3Xgq19jG5lHDbHF2jwuvrG/C14g1pa1EE4If+o50iA/DSuiV18O4CyCk9gMjHtqq+XVYdBqEJCjq4PRFIFA2JVnKXwpAFuSjM+zV93M4MIDJwJMv9x6dFfEPW+X+jEDBRFC4od+S/ili9CEcckI/Tmy8ZqnB3NQFNqExVA0El2MbDxLjdvUETJtTANJfVt6JigRLq8HQ9S1FuZfw+5KoCDpHHaBLB8RRzqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCMEmctqrQ5+NtrEED8OIypoBg8T3jj3Go2J/Z0Wfrw=;
 b=Q+hsGH78pVd+E5iia0MvyCpMCEA2UYZB7R1Tz0oRHmhKdHywzFPKNXUH/i4gQezY71MaYonjnpQKNFb1mxuNQReCKzAnwcVZFN7RgMtT2NYIY+MICVTlWHOQi7aQwLWpbLLnixY0OKaJwvCbGy5whHS9R/wzAF8i+jzIksb2Byrl05VhaklsVsqBkLf49Di7om9OZFWA62moEF5px0xGetJQr1Nq2dkhGtdIkuHfNhvGAYig79k/T6+8c7rJ46KLzcavuOxZ02KcStULWQ/0FLYLcyLatsgZVB3T1X3MqKou70sMEC3E8/gFRS8c9H51aWXu86u/S/tyBbeOsSyfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCMEmctqrQ5+NtrEED8OIypoBg8T3jj3Go2J/Z0Wfrw=;
 b=srqHSjHU41tmy7FdWYtjoXaqqwQj1igka9ysRE/74CipAIjwmWEJYY0QG8ZhutiosyARnnib+bJVkO/s/mwMHY9eEYvD6FpxaKuUnly17XJS+hq60chAQ49oTCEZzVacjFzQRvrRQy/TehmkQUWAiP/iMuZQEZeoifQm7Bf542Q=
Received: from BN0PR04CA0090.namprd04.prod.outlook.com (2603:10b6:408:ea::35)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 11:02:09 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::13) by BN0PR04CA0090.outlook.office365.com
 (2603:10b6:408:ea::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 11:02:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:09 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:06 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 2/9] platform/x86/amd/pmf: Fix the custom bios input handling mechanism
Date: Mon, 1 Sep 2025 16:31:33 +0530
Message-ID: <20250901110140.2519072-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: bfed4406-83b4-4f9b-9482-08dde946ff1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V72E9Xbpa4GKndevQfWj85TJEkR0VN2X0AzA/9Cdg/m4ADS7DaoBPYk8kS/t?=
 =?us-ascii?Q?gE9HInN3Z7Po1PZ0cSvDgO+BzooS0goInmS/zrXo0fjTJm+SwwbI9hulcWaU?=
 =?us-ascii?Q?Servoe1TX9JY8pwYoVGYeHMDX0siCn8w1AHHNWOZPaScxk+DuSZGgIxvDAri?=
 =?us-ascii?Q?UJ4h2A6bFLZoyZBheWmwVYj8l1Wy6jm2gF6EXYM1S8unWMp31JZ2w/HZKcXW?=
 =?us-ascii?Q?NAFsLsPyPgQyuXI25q3+HPb9eUGAnfqKfLJX6er9ir+TFHFV1uek4sSMGVZC?=
 =?us-ascii?Q?BORMuPQzRI2polh/1t5Z2se2IzHPV/JyAJy5cp/i16ow72XonVY9EGEDH6V2?=
 =?us-ascii?Q?d33AERgwtPUiMuHMakWsPMQBUwm0YXumOLAFZFUjN5J9/uBsq5X+s+gtHnpj?=
 =?us-ascii?Q?Zb5ItH4LxeofUvWAVH1Ky8/Nprud/wem5nV1K0mph97wbsez1sWoVAtBPJq3?=
 =?us-ascii?Q?G+sp+PzZqWeuPak38fbCZngLnqDF5KF0psB7ts7j2Z0zKR1Ng42L6vDSk7U3?=
 =?us-ascii?Q?s/9wGlNQmeaiR7lG7/K5w/nqffmTzcmNfOYPMUoyu6/fxuN/5GBK/jNKnt7T?=
 =?us-ascii?Q?ct8NXR87Cz2SHnw3k7HsIAhfqYtHNu46ej2q9bF5Fg07ZJHUWNlkR7HFNTzp?=
 =?us-ascii?Q?Bl7Zk5ete+xs0OLDWaiu23ht1QCTM+RuLGnd5gaWt590vJIAIM1MlZjuT5gI?=
 =?us-ascii?Q?09C85yJKoUGKpAvUwIFf0cyQwx4xsWZz3t36Yz0f4cxeT6M0sEii6lophRM9?=
 =?us-ascii?Q?gqsh050aDs02YGPXC8RogBEJ8kjf79ps/PB52hHmNwEPfrQlStzBqkJAwmlK?=
 =?us-ascii?Q?a1jK7BQarPCXN78/OQzNLkQ4sD5fRy6p5RlVAXHJYgVMG/DKvZasSi1RhbRI?=
 =?us-ascii?Q?TPmOBC1pw6klmbrjdEfy5roIxkP3aQguLvLZGNR7jPr6HC2tjZoai6UbYHMN?=
 =?us-ascii?Q?cYM6/WQ8AhuXxFT6TRmbuwHql/3Y8+45lbYh7m3Cl2/45ayLpFikzZTSsJTD?=
 =?us-ascii?Q?1PTMxoqypJWwxXFMBmUDGCGeS7rWlkUOKGKM8m+7fh2JC0q5FaDKf7+Ha36a?=
 =?us-ascii?Q?qiMex21wOWOkSjjjf/Kt/FGqB/KEI+NYV3H5WWVpTTdjFfaneESKTUMIbGx0?=
 =?us-ascii?Q?3aQevcPkYamO4Z1t+vgmDFmUgsVYqUF5E0vTOLB4XK7DDjfqHQJY1d6BXiQm?=
 =?us-ascii?Q?tyj3u8d47PTQNhzizbpvnuc7hjMHKSAx6bEXTklg3G9+nQpo+g4Gt5AyTpw4?=
 =?us-ascii?Q?zwX7xJ4cQHmfNrEQ57av2cBf1oX7aDdB7d+0TvvWKQT9KJayuBnprQCOA43h?=
 =?us-ascii?Q?56OluhrdB1tqA2BMPUWyLsY05EixFErZGgRTsM60GeXAtH7y9wMouqTu7/mX?=
 =?us-ascii?Q?VXtpeWwJFj518ITMD8YhgfAU1W8dHM9S7EC8H4vH0Gew2Fs/jWNbTnOnkMyx?=
 =?us-ascii?Q?bb9Q+vhNysSTRIRdACS86SET/Ms4W9hh4Gxg51MloWl3msZlOC8zf/M9JbkC?=
 =?us-ascii?Q?jYpKTdklECU9TUIjFQMsQrItvATohXKhxP7Y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:09.3299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfed4406-83b4-4f9b-9482-08dde946ff1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186

Originally, the 'amd_pmf_get_custom_bios_inputs()' function was written
under the assumption that the BIOS would only send a single pending
request for the driver to process. However, following OEM enablement, it
became clear that multiple pending requests for custom BIOS inputs might
be sent at the same time, a scenario that the current code logic does not
support when it comes to handling multiple custom BIOS inputs.

To address this, the code logic needs to be improved to not only manage
multiple simultaneous custom BIOS inputs but also to ensure it is scalable
for future additional inputs.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 15 +++++-----
 drivers/platform/x86/amd/pmf/spc.c | 48 +++++++++++++++++++++++-------
 2 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 1a5a8d70c360..79defe2c91e6 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -623,14 +623,14 @@ enum ta_slider {
 	TA_MAX,
 };
 
-enum apmf_smartpc_custom_bios_inputs {
-	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
-	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
+struct amd_pmf_pb_bitmap {
+	const char *name;
+	u32 bit_mask;
 };
 
-enum apmf_preq_smartpc {
-	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
-	NOTIFY_CUSTOM_BIOS_INPUT2,
+static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
+	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
 };
 
 enum platform_type {
@@ -690,8 +690,7 @@ struct ta_pmf_condition_info {
 	u32 power_slider;
 	u32 lid_state;
 	bool user_present;
-	u32 bios_input1;
-	u32 bios_input2;
+	u32 bios_input_1[2];
 	u32 monitor_count;
 	u32 rsvd2[2];
 	u32 bat_design;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 1d90f9382024..869b4134513f 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -70,8 +70,20 @@ static const char *ta_slider_as_str(unsigned int state)
 	}
 }
 
+static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
+{
+	switch (index) {
+	case 0 ... 1:
+		return in->ev_info.bios_input_1[index];
+	default:
+		return 0;
+	}
+}
+
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
+	int i;
+
 	dev_dbg(dev->dev, "==== TA inputs START ====\n");
 	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
 	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
@@ -90,29 +102,43 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
 		laptop_placement_as_str(in->ev_info.device_state));
-	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
-	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
+			amd_pmf_get_ta_custom_bios_inputs(in, i));
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
+/*
+ * This helper function sets the appropriate BIOS input value in the TA enact
+ * table based on the provided index. We need this approach because the custom
+ * BIOS input array is not continuous, due to the existing TA structure layout.
+ */
+static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int index, u32 value)
+{
+	switch (index) {
+	case 0 ... 1:
+		in->ev_info.bios_input_1[index] = value;
+		break;
+	default:
+		return;
+	}
+}
+
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	unsigned int i;
+
 	if (!pdev->req.pending_req)
 		return;
 
-	switch (pdev->req.pending_req) {
-	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
-		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
-		break;
-	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
-		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
-		break;
-	default:
-		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
+		if (!(pdev->req.pending_req & custom_bios_inputs[i].bit_mask))
+			continue;
+		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
 	}
 
 	/* Clear pending requests after handling */
-- 
2.34.1

