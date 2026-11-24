Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506787;
	b=AaWcqTUf1oyJq+GGtEVbPU1hfCJFslT2nK3xPsM2zX2X3/+npSW9YLktockdrdiLMLHe
	 LXN8qDELRgEU2P4CaNJ0OG8XEPHy1L714r8bN0asTHYAhFZYxhCRnqsJQSyerUQlqPA14
	 wWvVaf61nKaGtYexJlwZkdCh7huYzv5kEMe86vYVO8QB/7Ru29sdM8szLkcgg1tRkQiWm
	 9VK2+qZBeHKahlAaNwka9Pb0QqzOId72OaF9mklhqA6+DR89ePDC6IBMpJiGOaUqDFjPk
	 vBNVt7p7Qs0W+G05fE2Kd6Mf8JHfCvwoLuSxujeaheK9qIoq/MjtNok58SG12LugLXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506787;
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
	bh=IqqI7TQI6Tjh6es6NgHvCgDvJvkbY5Rji5ulvTNed4w=;
	b=AC3fzFDN+yJ9RYf5FtD/Xca56eF80NlOLpyAb64haqW6xwid1+GIz4IQmO2LjoXhXFJ0
	 9h/Wqq79wz0pN8aC7lrofzTMogvL4UgpUv3iwwaMZW6z1rMKq/Mlk2sd23A95/5qPEwBv
	 x4xef5cnz7GFZpK7Ea/3qT8B80oH4jhfya1uehySHRKBLbhEltH7xS/uFkC6T/B41VLO9
	 6LBkgFO5UcX7Pp4BsFVhCa1Tgdtu19qBr7+L1tZ2o5hicqpHLTkwDq3/GAg/HvHcDn6n+
	 BzJuWLDfHNPGvnV65FyWGJg1iz9XJG7I9bBNXBJha8eMfhqwpTUy8iMBxZNsp4UQMEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xxfNGEDr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.53
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760A0606A322
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760A0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xxfNGEDr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZ8TNGh/uvuTtpBP/Sarmt6bNihGb8LMe6mPugRr+Ljpk4zOjLQEnd8sZ++SuaKwZbG8zf39hBFq23iireSqgU7tLaY/G2MIwbaVRqBkC8GVN6PDv3FzKYRRtzKtjF9nTxEvzsgIqikJXdMAcvHo9W1cmRvGAmi129KO+bjygx1ptk47Du2K6Jzpm75ufO2AltJ3XZkl3kNtgTaipzPIyNTKPLEgvyT5N+mBR5v0g7t6cJ0EOa/rzgkoCw2fr/QAxCsDvu/a9pe/26XlpfLu+I/rxGu0lOSFoTY7Lp+7LOfQ5TF/bUh58wLXsEjhicx/gXUx8CPLOD9rrpI2nKHpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqqI7TQI6Tjh6es6NgHvCgDvJvkbY5Rji5ulvTNed4w=;
 b=hh6WxMJKD/LlJFXljt2bVsr0YuqaRRyeTbQEeq/HZntoD0FAoij/cbmKDRaZ2TqvIe7zkTBa4Wonrvbv81gJaQlnWNDQWf9xH2c/IWWk5BXNGuhfZXpzcakHp1+DqdKIwIKFepOG80Mpb3PYdo/94vALUIX9hhjvZQuqLU5vuU6AckHlis/wDCGG7Pw3ue5edMW16zrfdSwJsCWXfTuXI9zAvdsaNPDkPFYhT36lKwLrKIY6fIt8jogl+XYMFparExbCR3syabzgAMduxHhfvtF7el7NPQ6Nd++urvcgo6VC81+xFXYIynq+WzEtY+kCM//pPyZ8lMpjaYU/DMfeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqqI7TQI6Tjh6es6NgHvCgDvJvkbY5Rji5ulvTNed4w=;
 b=xxfNGEDrpzACakLyp1QOchZ7q8f92Y1Lmrqi1ut1Q7lpaUB2h07ey5lGNxnr511q8t16pMyUbcOfKgueGKjjPpqIqhwQTHBYJGdM6WlNa08SrSFqzzZM1KodfKjklxkFX7t57ud8uxpEM1AcCoYq1Q3NP38ffOoyFTnJ5CAGcf4=
Received: from MW4PR04CA0342.namprd04.prod.outlook.com (2603:10b6:303:8a::17)
 by CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 07:52:57 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::2c) by MW4PR04CA0342.outlook.office365.com
 (2603:10b6:303:8a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 07:52:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:57 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:54 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 08/11] platform/x86/amd/pmf: Remap metrics table on resume for 1AH_M80H
Date: Tue, 24 Nov 2026 13:22:10 +0530
Message-ID: <20261124075213.2317127-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
References: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|CY5PR12MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: be421e6a-cf76-4e05-6193-08df49fff457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|56012099006|11063799006|261026121527099003|261102123227099003|261028144727099003|261021123027099003|261009223027099003|261022075727099003|261021121427099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Hxh62ArMg5I0r9Q4ybV5v/9wnTCvWE3vF5QL6uSjVZO7M1m9N/wD4b0kz8ksJZYn1k9qr4hhpL2x6gEJi5RZGbxNlmdT+YZEJ0tHsSaD3P4YDzCt8vXK2Gq4sDYS3NPbRvRXQuF4CnzUBD63Rh3mZTpkprQsM8TzfJjQ4ftlJABTpkfOVvvhHsNGutR+c1s10RMJ4++EUSg2Zalp3qHljn5zmjf1KUhmJMoqKtN2xsBeKdRjEzCDGGFFy5608dE1lgboSJCLfJ5J3dR5nrdxeBqkM9+8KGBM9+br7xJIfqPIxvrB9v/m9vFkoDEvmoiesmz8nvJcwIQzrfynZ1zyBO7aXoS1EJR/JouR1g2QZHk0P/zQa94C0zvdTmnBZWcFQQXKBmGJW0iPy9sfpXEGv3xZFeTPnzgynR/izLLCykcFKQrGDks3rT6/7IS/juKHKuND6MOXc6xyCSrdpqbO1Y2wbbWrjHGMWX93ZAYwXXnf5PZvojFjltFq9df6UeuQFCWXISflKlICer3vIN9hL8+DlPukaebdmsv2msQAdX8J2D2YONwikDy+rDKLNtYPlo2Ja/E4OT4SToCQb9TClhoXVYR32erirUNUQNGcfoV0WjpQb4aqgnt0CfY+SE925yToduujl0AgZk2qSzpVDL8ofjOjwhI29fbRvgIgVszp//wZQuWCy7jK3OERqSFcvaDG9MZb2HfrSowt2ZUv6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261028144727099003)(261021123027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3JAi/G/+MFJbIDSe9kbILdppE/ln1Q0PMGNZ58Aqp8Oy91p0zuZc9SmDbcawjRcCLwYedTh457BPms1O2IO4Ap678g24RqQ+5ExUFtDdv0CTPa2EgOLyDk5PDHSyF3d0LVE9CIvl9x/U5o96KIkEjM+ty4U0PEVKX5+CpUJQrowoQAmKjTbsCNI1riHNsIWq9zUKgnNCIm8k+FeIsM74LXA4dUvxWs62mnE9yJk5Kun1AdcvuUggFh+ZNA5P7UtZ7vY94tKG1GlaMQd+LR5NHQp+/psUaQZbFs69/0Cb6IpIWRvL2qXewJGY6VCx3uLQol+3g0o3ZAqmkX2eKjjDB+Vr0ior0KZaX9iOihVZwE9/RAwfmA7j8wePLakwI6JQlMvOH6qwA2rAWQBMw3YoCn0vlrbpB+e5WRo9ZNiM0g9J+23mxuXLuq1SYY0x4x/u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:57.3471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be421e6a-cf76-4e05-6193-08df49fff457
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408

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
index 55c893552050..26ce4132b809 100644
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

