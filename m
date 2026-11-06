Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983595;
	b=1mZtwotEdAVbCDTFQoyBUHWJHSk+ZObzEpsfT0+AH5BNXx3+vhQvSQRjfN+aakdnPLxP
	 RxXZZzqTAsrwCfgQuyx93CmE+2nIfWQIV+fpDE2oQdcYWBu1Bftz3O52nS1/Jy+43swK4
	 13SC5w07Vuyhwu1l5Y2szzzRHvrdmxxJboTBmS0v4m5qsgsQ7UBXJ7IGBhnAWr9x4GPco
	 HZF0mims9k7fViMu7CjvXrfYm5y3u/KUWmIj3ICnZG3GPVHMhyQ4rXPIUUpMx1KEn+Jnc
	 acqbs0uiWSlq6UpiDw/NtD07cpkltABvP+bbWc1RADOfjYoCYK7sgoMABk1lCGkI5nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983595;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=k3wJe7m4nlEF3+N4DOJezsa+s94pDTIz0tgBBKZLAbc=;
	b=VYWebCF8/C6aDbNZKoNPVcs00+OSahv4IFGtOkof4YOoY1taC9GzIlNTEh+gyqmDEDM/
	 bBC6JMGfPw5lMlFZpYrz+6vd7edbCBuFaNS4ejXvrJTIZdu7T+EKSSNGs+tOB6eNaAiig
	 di/IcjKnxEHzJ+fl5eHgc9RyeLYOd++kLZi1XivbPwwL+W669QxmQoQwWFzwjFZBI8pob
	 MY90CCgWjcBJeIx/CHkFVZhwdCB7hAjQhtDN0pn8IBi45neV8vvUlUCdpJ+8PEukL0Wg7
	 IOyAy5OUkmKfhwm/MTvWC3CGeSuwhVWfLDW73M7AVCJSHpSYjuwSjY9JDibsGQzcP6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3RFmxROP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.13
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542A606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B542A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3RFmxROP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvtZIFa4tmUKWSbScGTqCWIcQEcm5iXsO1I7WBee2dJ/C4o7w609v2nhVPZv5N30s94gHRP9WYetQ0sOx0B0dkaUNUR2/Oy0j5g+Se+GBYdBNovopnf0DSNnmpxupruWtUjdpPHRoD5EK7JtN1TfAhjatUKH2BY6H91foUpMwPh4Ru+4SXZjbtnrwfmZYyaY9CCA0Vo9lZHr/RTWyvMAOSbfLqnL5h771tnsvwSyeBEmnh3b5GVaBZmysZULeggauL5wW7nHWLv9uKcoc9VWq1G9WhPTLv+dBXygghdzyuIlsxcCgFpab/xcQbrUDOcgfhDtPbNKvy7l8kW1fefetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3wJe7m4nlEF3+N4DOJezsa+s94pDTIz0tgBBKZLAbc=;
 b=Kx0ObS+Y4oMoanaKbaO0agnq0tTXWTAsyAsMu0AO8hgGTd/Ckadx0qjnFbd1p0HELhQ2a5w3Ua/T2Q8E2P/28f55mgcNbOQgRaWfdPkTy+eGi6cx4wrAUw0QZ7/lyNakjzGYNR1UPugpcfGkFjlKzJDDf7Og255JLSbSkhJxlHCCC5GZh2rAJjMsaBKCU9v6HtNAxTDhJ7TKcv2hPC++r2h82u7gybXfydSWLRU4rk3sH74sLdqkOe1o+mYgLojv58wke4Ch39Eu5H5NChtbqhkxriSSWbSrWfVJPjxRBuNwRdSbecD/pSeGcPdH/Uxal7QmaUNjN4yHnlQCicbJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3wJe7m4nlEF3+N4DOJezsa+s94pDTIz0tgBBKZLAbc=;
 b=3RFmxROP4TTfNyA4/a2gg3uBT0m8BGXvRt4Nq0DnPeQwHIufeu9/dJi0OWNR778AZuGpiQ94ZaavSAT13KOMGRzojp9tVrd5b2FF+RlbAprNV6spzi7uwBCT+dFM67gZ1VZJaR7v9mwqlBj1i4Hf6VBj8KBBegRgqxwqYtId7C4=
Received: from MW4PR04CA0362.namprd04.prod.outlook.com (2603:10b6:303:81::7)
 by IA4PR12MB749807.namprd12.prod.outlook.com (2603:10b6:207:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:46:31 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::4e) by MW4PR04CA0362.outlook.office365.com
 (2603:10b6:303:81::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:31 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:27 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 07/10] platform/x86/amd/pmf: Remap metrics table on resume for 1AH_M80H
Date: Fri, 6 Nov 2026 22:14:26 +0530
Message-ID: <20261106164429.30738-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|IA4PR12MB749807:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a39b442-fcdd-49c2-9317-08df3c2582be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261021123027099003|56012099006|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	30eLp1QSnxFqlFmdCt8NFhCzxW0K9vw+1zqzOiXJWq2OCm6MEgKn7OGzDwbzZmGBpBrDLLR701X6cyiL+3LwWg2h+KO09cX4NQSz7MnyjDB/fSIuiudqSfBtvnOs2oaqfgp3ywO0NZ6Xt20MI+7Sstxt1cKJ0c5jJ4eF25Ckmehxl+v58nRhzasg0dUP2hqr6cKMeFg5BJLuRM6xs38Plo/bw7y35FCNjHiPdC5UyS//7HsAOvgYbrjRmVV6dUANIDChyrafgFiP11zOxvHlqWalPSGgnjXoElLJU4Sb1gaJ4z+3zN4Wppl5R5nTDXitSBGSjfJg3KzqeE0umIwF9VNxwb03l1K6NZK7kxN4+z3NgEpwvliF4iX0XSDOicM+xzyE5XLCNmGlNleQUredwT+9Pb/0m3I0BMfjWYqxc/ikMD4KEw/nq/0vqVCoWAIzusi81217CJ8sIlpZR4u8Q6JAVhom24C+5JSXG69bFq55jcjIAWxbC7wXV8+5UjErA6TRF2u3i3YLCl9taVm83CpkKdu6oYGOhj1vJZs/riEzaay8kWcgn0h/iqvI02QMYLaLv5/lAo1Q8JTBdm+IwXIhr8K6Bixe6KuBgbH4HIj35g0LUY8RdC9DzazIKcgtJrQmPPfzxqatmeHxgLoF8bldxiNYaWDg6P+XMD2tYFdG6StwFLuEI8J/VjaR3jkhmSi5cvDbm0rbFO4DofIZ9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261021123027099003)(56012099006)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FJ7wV8JNUGjCXJh4H8vVZxIrkPr+XZP19teBMzPiCwWqpChiDODZbvySAmJAZCqz62kAGI5dqRpSxSyXjCAlCfCISusNmYChioSlH8MwGiNpOUTclnyaFNJeT2+Om7dKU84U9QeCJGqhECoY+J4S6GvcyPMj55hnXvBbDZBNyxKWZzsaugL7BUYtu2GtxhblMvtAhY6j6JRmxw0nb0bKdIhzy25D3qC0aPXBCMy9/e0TKwhHFoc7CXn22Gn/lNK57YmjohlsddhtGfGi9Ia4C6EjM1qx1dUJcerh625hek2UHK5tvNASeSqTE7EbtsqWncsuCUWevcAeCv/YKXMJlD2w+z4CNcUAZoXXQiY4SWH8n5MEdFmom9m/XwJG4hj5fC63N1hDa5C/xA55pCXpQ94fwG3VZ3bi1ctMHH3hb9QB3nGh6nyT13uDFt+gy6Wz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:31.3609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a39b442-fcdd-49c2-9317-08df3c2582be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB749807

On 1AH_M80H the metrics table address is provided by PMFW, and PMFW may
place the table at a different address after a suspend/resume or
hibernate cycle. Reading through the old mapping then returns wrong
accumulator values, which end up as wrong inputs to the TA and the NPU
metrics interface.

Add amd_pmf_remap_metrics_table() and call it from the resume and
restore handlers. It gets the table address from PMFW again and maps
it under metrics_mutex. The previous samples of Smart PC and NPU
metrics are dropped, so that the first sample after resume starts a
new baseline.

A failure to get the new address is logged and does not fail the
resume, so that Smart PC keeps running with the other inputs.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index e6aff9071d07..4e56769f4d55 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -12,6 +12,7 @@
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
+#include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -277,6 +278,25 @@ static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
 	return 0;
 }
 
+static void amd_pmf_remap_metrics_table(struct amd_pmf_dev *pdev)
+{
+	if (!amd_pmf_supports_accumulator_metrics(pdev))
+		return;
+
+	guard(mutex)(&pdev->metrics_mutex);
+
+	if (pdev->metrics_table_virt) {
+		devm_iounmap(pdev->dev, pdev->metrics_table_virt);
+		pdev->metrics_table_virt = NULL;
+	}
+
+	pdev->smartpc_metrics_have_prev = false;
+	pdev->npu_metrics_have_prev = false;
+
+	/* On failure, metrics stay unavailable until the next resume */
+	amd_pmf_get_tbl_dram_addr(pdev);
+}
+
 static int amd_pmf_restore_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
@@ -288,6 +308,8 @@ static int amd_pmf_restore_handler(struct device *dev)
 			return ret;
 	}
 
+	amd_pmf_remap_metrics_table(pdev);
+
 	if (pdev->smart_pc_enabled)
 		amd_pmf_reinit_ta(pdev);
 
@@ -336,6 +358,8 @@ static int amd_pmf_resume_handler(struct device *dev)
 	if (is_apmf_func_supported(pdev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(pdev, ON_RESUME);
 
+	amd_pmf_remap_metrics_table(pdev);
+
 	if (pdev->smart_pc_enabled)
 		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
 
-- 
2.34.1

