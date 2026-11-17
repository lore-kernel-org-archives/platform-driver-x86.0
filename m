Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794885012;
	b=0R6TL7OKp+oYACHwJkF6FFYJ0/qZlG4xr1wwCZdXSSzO7DkEwomaaHjUbvMzc6MtktkT
	 axeVehVEughvW3cOj7zBCMoD4185CDz5CunBLFbcvYFXn2JcxLs3rSEITt40pIbi5Nhty
	 GEOOeYuMs0xprAZPQXcdCuhekqTY0I1Zl85tpzAOrAvtIZXLKEaBz3aVV1UgztUoFWNXL
	 uX6QfvkvjEGrXP/gyuABi34kD4wkNWA1NAr1M7FgVMIgP72SAh1Cue21kJTuQ8vVBLCfL
	 3HKshXpedto3ko1yzYQU4r2UjWrR7fnjFpKHaVxG/K4Cmr2AyrmhyegvLXRIgTcwKeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885012;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Originating-IP:
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
	bh=oA7O14IM+YD2brFAcN8SRBdlXCv9bpJFILn+gKNWszQ=;
	b=VFVu1Az2RTISI3vxgGazNuetWFKGOg5dwx9adSK0m5qUyTmFKNST9iDYKWNl/vsag1DW
	 83aUghLkiNqHo3wby5QTGkz1qmBLRWaH8C68TBN3srjPR3xX9wVH56BcWTTATkYp6JBEa
	 wfJ7n1k10he7GtNH384y/fQRA4X2jblaQLD2VqPYGF4hHYo7L5rgYUCwdNN4amE55WRFo
	 nrTTh4Amty2Xg+AY6YNJjearDMY+j6kz0h2747ht2mWuTvEl6E70uWgYLuwKuCviiWo7s
	 ydX1lxFNxNHrO65MmTV1UgV8wL56r3aYSp02C20tRb+etmUkKD5cG3OvR3S+6cBwi5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dF3q7GWL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.0
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011000.outbound.protection.outlook.com [40.93.194.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AA2606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 03:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09AA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dF3q7GWL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpJIWPccbu8qsNIH+A7cEB1cEWFLisFoYGEk+HwKDpDjfqU1/kyLLagDZ8vb/SnfnO3FumVrxKHPFwiLsVD7yNUVJHUrG+rpS6Ai03w7XDXkSOdxfguzW+2NxZhQj6rEKsXwzvxYS1NSC1nSxlFevGFcYOLZVlNylmB0kYGz0CONivfnHhO6FJS2ojRj23eddySDa13PyAdimNk/9z4toLhXTWBeiXAl19swkyTMNKFsUK6jUaclHMDeFRYMj+d7bZPoW3awZAkwDHF38mcyJtkOOjGDQZwI9+gURPd7SZrlJEjwNxEzOSC3h0lI8y/3hwmQ5wJoz4yxnrN9xg2kmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA7O14IM+YD2brFAcN8SRBdlXCv9bpJFILn+gKNWszQ=;
 b=sSU2JT3vaQvsUpjKfMQKKIrN98XMVf+zJMcS3k5SXKUrEHQcfuf3uDis4xLw8Qu4bmda0y3h0D1P++ab7CWA3gvrhgfWLmE8lfH+5P5rp0IYAm3tNxgfsoNIeAQ00r0QUZsT2/+LNnKOPoZe2eQPD65vIQvbnIXlOgzWsijSBNroom863UdcTys7V2zbzxX/3kxKkRC/3lK/um0QMdMd2NGfKCBrklXwD/H8Qn1xyi6QaNPU9ItU3j8N4h8EPvAd6EVUj4g/VxdU69hP+c2sFkeXK+imoLYpPqh9lZBX9uL+7fF/S4yGInaEjKbbCPmJlZdxyeJ94FI2mIRpqqfCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA7O14IM+YD2brFAcN8SRBdlXCv9bpJFILn+gKNWszQ=;
 b=dF3q7GWLrRQDbGMxJiRxQnbWOp3RqHDhem8x7ZISQmmIFqW3gxra5WEi86+PkmB+uxpc6stSLbpz4TIEYah4WvaK1O7dTeClQcqKlZGqgyyNC21mUgabZkqhw+DSM483tW/PK9E6UpdLyKw1ee9Q6v24vdNMwVkQXh5MLYPzBUg=
Received: from MW4PR04CA0216.namprd04.prod.outlook.com (2603:10b6:303:87::11)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 03:10:07 +0000
Received: from BY1PEPF0002696B.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::83) by MW4PR04CA0216.outlook.office365.com
 (2603:10b6:303:87::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 03:10:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002696B.mail.protection.outlook.com (10.167.244.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 03:10:06 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 21:10:05 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Mon, 16 Nov 2026 21:09:52 -0600
Subject: [PATCH] platform/x86/amd/hfi: Reject zero workload classes at
 probe
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-superm1-linux-30bea57c-97e7-4889-8d3b-f6e37b4ccc48-v1-1-d16f095d56b0@amd.com>
X-B4-Tracking: v=1; b=H4sIAH/F+2oC/yXNQQ7CIBBA0as0s3YSptQCXqVxUWCqY7Q2IKZJ0
 7uLunyb/zfInIQznJoNEr8ly3OuoEMD4TrOF0aJ1dCqtieiHnNZOD0I7zKXFbXyPB5NQGfYYGe
 tQxu1x6lnbXwXQugsOjUZbal1pCLU8JJ4kvU3Hc5/5+JvHF7fE+z7B68s8/KWAAAA
X-Change-ID: 20261116-superm1-linux-30bea57c-97e7-4889-8d3b-f6e37b4ccc48-90f73812910d
To: Hans de Goede <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Sashiko <sashiko-bot@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
X-Mailer: b4 0.15.1
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696B:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae0f626-6429-4338-40fb-08df4458481a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|18002099003|261009223027099003|56012099006|11063799006|5023799004|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Q6cFP2XBnQNnsi2+pfXPj/mLK6dVs7SnXFRjy6GDAW2az+SpLxv0qKb8iftbyWIBLp+rWmFMVXJx+iAE5o3TS5jV1HIJ+p+z3gO26zjAoClOUuSCzr91uoY6xaCz0t+qs0UfyqjcLnMcbu4EPxLn06Q9Y0yJKLz2yLkDGXZeqKoDk0z07JQTDflWU3YcBr2xjsHB4ODWEVt+ru8wracxol80H5FLEu2/8GXHBLwTk0syDWyKVFkyN12vqzD5wqZo4tNw2bQqGcxmhgITYqQPSxp3gIkzvMVoV9ECJAoFi48Y6rBCVO/pZnWxi0W4HHMqFAwKE/ObFDPWU/RJcrxVJ6F6VVyyJKa9/RUjG0Ka/XGHl/pVb1uyX+WMonU5fIIxCanN1kyJenz3iNM93Ofp/c6Ga7EQjwTFpLOLwBtwpWsQPdn3xyIl5AcY8xfBG0OzhUIl7EQD784rn4XFPc7AZEJX6KYzrhbnc5nRx1abjev0KVkoPxnpT8NkdNaYCAsZFTaNL10rYUGpqHgOIfD2T6Ue2CY7Cclef5Hi+Ufm0SzaZ7zlPkA2TbjrB83GAm929Og/S600p/wvhHT7KFqK3Aj96JDbeeGpYN0N3Okj1PuUoy34c2ZVXAOtVL8UfM5/fRfKTKYUAaB/r0UaYAxKcQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(18002099003)(261009223027099003)(56012099006)(11063799006)(5023799004)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q8vpqha594jGOkxSIU9de6AqICt+eSVXMHmmyyDwUx4Rr9ee1r+4OtIkEfpZsdAKuL5+U/h+qEuiuMlXrbQVbAg7PCPAQSOB9wUViDnseZvFaVa698FOy/ANTD5HtNcwIMCZelWTAFHxp/Jve4MLotQQjU1RUlgR2IOuTIC1jB5nKZHWBGYG6SIjGKJ3hvn7qpukFgGkUBjW7s1OAYqm018J+V1yrr0fL2EYmFuyd6Bcv3jPBqOvwbGvB+b0VuMHJm19FWhur/7nfe78whk1e0FpI3lG+ZniGyq/edjXf/Gmo99Qg0k5ZoXbCTwTXT8SSuA781vzZ3LFjbD047dI/89HooRlUL6J3ZjBzn8Db60z5/KnUM3qrIcKH8worWJTZKc8SQ7YWpax8dLgkcQPWUs3HLYWI7TgTq33yfsgZgs6yprBQFc3OCpM+jCC+cwF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 03:10:06.6131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae0f626-6429-4338-40fb-08df4458481a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627

amd_hfi_alloc_class_data() reads the number of workload classes from
CPUID and only rejects values above 255. If the CPUID leaf reports 0,
devm_kzalloc_objs() returns ZERO_SIZE_PTR (non-NULL), so probe carries on.
amd_set_hfi_ipcc_score() then skips its loop but unconditionally reads
ipcc_scores[0], dereferencing ZERO_SIZE_PTR and faulting.

A device with no workload classes has nothing for the driver to do, so
fail probe with -EINVAL when the count is zero.

Fixes: 5d902ee5609a ("platform/x86: hfi: Introduce AMD Hardware Feedback Interface Driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-30bea57c-97e7-4889-8d3b-f6e37b4ccc48
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/hfi/hfi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index 86a7f4332c35a..15ab340390471 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -224,8 +224,8 @@ static int amd_hfi_alloc_class_data(struct platform_device *pdev)
 	int idx;
 
 	nr_class_id = cpuid_eax(AMD_HETERO_CPUID_27);
-	if (nr_class_id > 255) {
-		dev_err(dev, "number of supported classes too large: %d\n",
+	if (!nr_class_id || nr_class_id > 255) {
+		dev_err(dev, "invalid number of supported classes: %u\n",
 			nr_class_id);
 		return -EINVAL;
 	}

---
base-commit: 141b164bbe186423e295b139e40e8e2d11cf1341
change-id: 20261116-superm1-linux-30bea57c-97e7-4889-8d3b-f6e37b4ccc48-90f73812910d

Best regards,
--  
Mario Limonciello <mario.limonciello@amd.com>

