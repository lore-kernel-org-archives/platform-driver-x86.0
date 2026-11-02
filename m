Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604069;
	b=jcx0E7rW0KoIoy+15n4iIOv6nfqHowYuTY21LpQPZa+QFy8gnPBHaBTT6aPpEeognE2g
	 GOU5TR88qerJdO2/6NX9vFxCsKMpZGNd7HWsEQcon7pMt99iMTUcbLS+Oki75JeCsGwOO
	 dk8QT8p9XKmPozYziHS+fI1BhbBq9OyTWEIiTCugErcSKp123O/ezmH2Ze0KO7rSGKnec
	 l2nlrUiQavWfozBBmdrmEG/K35arJEGjHfXHledJOpuACz38sYGwZA7XDcmqPGG4UeMxM
	 eepRzVeAMm6Pq7msxOvUb3CFBZKjqqcEN/AFwzch6hMmvBVlbHqgPhITtRPHR5ivZ+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604069;
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
	bh=2x1wjGmc2LH5QRKn/RyNrH6TdGMgDStBnJV452kY0PM=;
	b=AzebiKvBCHASw/qS7aYVL9s5hsNJxb04s05ujFyaXV0RPlvmqbyIpsGAmhonLVYbsMwi
	 WsEujwaBSc/F3stW1ssB/2n5YfesxpmmZLBjVQ0tLIgKO3TNTt3Cep8IOu0FcY4z4tFNi
	 Fz1yyE0kKnJLQIK1J3sUiZH0Cc67l8X6hvg4vsJuHPeSi9P0CkqYFDdx4qfSggkPGYoy2
	 pMpoMeKllA39rEF7XDPhhYtNK39Rnm9i+jOIwo2pJ9qsLk/I4gbclqqwWEmBxXjvduya2
	 uE1u07OSHvMH2Em4DLKPyf+b1T5yg0K3yMPG0++fv0f/LRrIgipwL2/h0ev3asdMA2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LFPEKM4s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.16
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD20606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD20606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LFPEKM4s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uA9t9WaDcyBdmBOy4sl1m26yuuyMuo+EjPqeYD0pRGkyifHFh4Bn0R84slK+l/AkZdOjJOU/JDyt+Re/NKmOJbYMx5VfsvH8mY5MFayrzQvR4KWj/V8ymfixW3WeUT2pisOKbV7yST3J8ludFggx9ueApiuQd8e4OHlvIiP22DznhRcWP5oGAXg/gXHkqJ2r+l0iLvkC7hCf530yZRB4rM3Tg2zkftymo5mqownhj2YdPhdffheI+Uvd+BF4jXN78oJ0w7xfEN9M08+Q3xVmPYBNArK6S1RY5/ciVKrrbiqLnK3/YsFHwk1p9nhCEeqsLP8mPzp8Bu7N3XJCh0gxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x1wjGmc2LH5QRKn/RyNrH6TdGMgDStBnJV452kY0PM=;
 b=Ug/xPYAg+RppWIXSbIBAITiFV5xlQSnPw9LRh1KWUHn3yEaYxrqOIrTpb5yJA+29yE1QMrdN9+PdVA5MxoF5b0SJIH60FWNPPxBuIYdF/mewSNZ8eOTnHLUe6QstmLcFI+1cKIBNx9djjYQK2PLPysVtnJ8LUzxewIZTeUQf9yJ4t00jvxu2sAMNKKn1zMKojOatz8rvt77oiar6g+b/ud9WJMHJiDlPOsd+URvsUkKmJCn3YWxpsdT50D0hBX25SVqlgLVS6e3DTNvS7jD3pbqRJdFj8CkjjL5KwxeLhHZm4SrrLm4kSmN+nYrpxy83GH5eExQDLzZLWgVbZ5WH9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x1wjGmc2LH5QRKn/RyNrH6TdGMgDStBnJV452kY0PM=;
 b=LFPEKM4sPgjWAmu/56CD3WvpPL6jxKUngNvA6hhChsD3H6M3s8jFNHvYR68VlvxaGpVKsBHlQmnZsDmfWrH3NxRDj3rZr9DZ32LBxQK7r5CUVo4WA9Qx5wFHsdcAEUqtgQgO+5MEukS/IaUsEBo65uYnuvYUrhkkTjv6CQzOvLM=
Received: from BY5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:1e0::20)
 by DS0PR12MB9397.namprd12.prod.outlook.com (2603:10b6:8:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:21:04 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::5b) by BY5PR03CA0010.outlook.office365.com
 (2603:10b6:a03:1e0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Mon, 2
 Nov 2026 07:21:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:21:04 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:21:02 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 25/26] platform/x86/amd/hsmp: Add per-CPU freq_limit sysfs file
Date: Mon, 2 Nov 2026 07:19:23 +0000
Message-ID: <8245d21194477a90e2348ef0a77eadf435a22788.1793602634.git.Muthusamy.Ramalingam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|DS0PR12MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 6393b137-7253-400f-bd66-08df38b1daf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	fBeDYZqCMs/oYwhTJ6QZqKYM1UORnZ6BKr/vAxZyAhRTGB6FaeXo5bG0TzoOkHHK0U8wGmKDJRUTfKD/6No6/nydSCmHRU0wG6eXCkTu8GXRR1rnDRwGKNtNTaPcG/Qi5+HSMUWjNfPQRUf6UBGcYjPCaNhGPXQzz+ovJlSQrUszRmxIM+jAb3QoHg/keqqMVi4pwqwi8AfirpRF4+vYBNUXG5nIDU7CTGItqkMXqHvLjFULtuCNuMmpgzIpJs2Pg6WscnArHRJvWka1XilYmS1prSd7rno2q9bP+q4EuREEq+0IS3cFA2dbTQrFMu3qO965D99h5/MGGXhgHAgITfHBH2u+Kup9rjhsTkx2UXYG8IDkzdBIF78RlMUOkgvhn1DBgEsqCLlFU9Q4jRwZlT6+58Qx5U8SAm1CGd/22j5pgxRL9anCGTcuJ2yyTXD1BrjImW/FM95wA5b6gWSWtnYj+psdtov+KsvDcZ+YGIvbeWLlSKh1kHMXTkA4WA1mD6GxmdqyX09W112BWcrorSakKoABcfsoFUgzJJmJYweBAWI5fORpjqO+HykGxFE+th+pwdHeg+CgKTyF/jRyrgl1dVcmxQ5Y2hbyAbS1lgIwRi4BxkNoxihR7rfolkqOpB2GsmFhR6ncZRZNr3zyw6gTM1L43AkIRRQrGWP+FjHlZ+1RqVG4qGUzM72naDSpqzabVJkh+VzDNk61vHx7Xw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nI3/jUPeweH7erH6WxnIuxbPv3ljXviM/1hz5/Cy6ecDWg16YfQLnOtCXK0w/r5nWeU7RQmaflQsJetyBpj39saA8UsyR9ZG3JswJULFznN56QawA36nM9EQMo3YeGWV20od7GuqmhXCDp/6sTX/To4NHC9fCUQERKmgrh2jjHzq1jwGiqruC7khM1w/ZzeKRFwzGIvQDtRHJWN8tUBFCpbwcm4liKtBVNRP5P+LB71/t11lMe48KWEzhpubfuzcoZQtF8k4QNQM6sRDB5OtxNcwb14iKPfcwEGPRBEWOSR+D1DW4U7LNquKKF22z68Cvyu6JEuUNZNWdA79Q7/BqKyUcuMXfUb1jIwUrBdg39zeJQyk9WOlDA5kN83tfiQ0ojI79DPYXJxpBMpuN1Sh/AZVMgjaBGuNnI8fqUOg6Ia0knqeZLTPq1o8vlxHFHX1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:21:04.2958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6393b137-7253-400f-bd66-08df38b1daf8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9397

Expose read-only freq_limit under cpu/cpuX on both drivers. It reports the
per-core CCLK frequency limit in MHz via HSMP_GET_CCLK_CORE_LIMIT.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  2 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 02df9882c0fc4..03c04ff23b1c9 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -220,6 +220,8 @@ drivers.
 
 * ccd_power: Read-only average CCD power in milliwatts
   (HSMP_READ_CCD_POWER). The CPU's APIC id selects the CCD.
+* freq_limit: Read-only per-core CCLK frequency limit in MHz
+  (HSMP_GET_CCLK_CORE_LIMIT).
 * boost_limit: Get/set the per-CPU boost limit in MHz (HSMP_GET_BOOST_LIMIT /
   HSMP_SET_BOOST_LIMIT). Writable range is 100-10000 MHz.
 * floor_limit: Get/set the per-CPU floor frequency in MHz via
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 709bfa494cd64..e30830c52ea32 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -2282,6 +2282,29 @@ static ssize_t ccd_power_show(struct kobject *kobj, struct kobj_attribute *attr,
 	return sysfs_emit(buf, "%u\n", msg.args[0]);
 }
 
+static ssize_t freq_limit_show(struct kobject *kobj, struct kobj_attribute *attr,
+			       char *buf)
+{
+	struct hsmp_cpu_info *cpu_info = hsmp_cpu_from_kobj(kobj);
+	struct hsmp_message msg = {};
+	int ret;
+
+	if (!cpu_info)
+		return -ENODEV;
+
+	msg.msg_id = HSMP_GET_CCLK_CORE_LIMIT;
+	msg.sock_ind = cpu_info->socket_id;
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = cpu_info->apic_id;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", msg.args[0]);
+}
+
 static ssize_t floor_limit_show(struct kobject *kobj, struct kobj_attribute *attr,
 				char *buf)
 {
@@ -2468,6 +2491,8 @@ static umode_t cpu_kobj_is_visible(struct kobject *kobj, struct attribute *attr,
 
 static struct kobj_attribute ccd_power_kattr =
 	__ATTR(ccd_power, 0444, ccd_power_show, NULL);
+static struct kobj_attribute freq_limit_kattr =
+	__ATTR(freq_limit, 0444, freq_limit_show, NULL);
 static struct kobj_attribute boost_limit_kattr =
 	__ATTR(boost_limit, 0644, boost_limit_show, boost_limit_store);
 static struct kobj_attribute floor_limit_kattr =
@@ -2477,6 +2502,7 @@ static struct kobj_attribute floor_limit_eff_kattr =
 
 static struct attribute *cpu_kobj_attrs[] = {
 	&ccd_power_kattr.attr,
+	&freq_limit_kattr.attr,
 	&boost_limit_kattr.attr,
 	&floor_limit_kattr.attr,
 	&floor_limit_eff_kattr.attr,
-- 
2.34.1

