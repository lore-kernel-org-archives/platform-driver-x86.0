Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC62142FCCC;
	Thu, 23 Jul 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800047; cv=fail; b=o2KDva4iNf1p3tVgxnzuX3FhVFvyN6iGWt464EZFwwZqjHjO1wZoSj3t5JOXBtnffb7/ukX+UER1jSheo9qDzLrO5JTg+33nz5GnQ4PtdfAeS66JT+8SOVe+1IECGhnmNaFG9dRMHIi3+ewUscHp71XEkKFAr6UTUyFbTQAoEWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800047; c=relaxed/simple;
	bh=9KWKZzZGuWBWH/h+cSYBAWf9dJ/sAcuRy03LTHEJMqk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tlxNVUOCkHSIV2wTqu42vLnKWLQCDr1mAXvIdKpJjP8m3HD8QIOF5mVeAqskPhOGOgsPnMW+d73QD7cJLb1FfmKXw4tNEdIQcMxQqD3cEAoZ5ywmyXxyBhC2SIYyAVb56NcKUCpcjrMuh3DHRUa+aozSeuluTfH9myKXpCCYHFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5D8jr7Pb; arc=fail smtp.client-ip=40.93.196.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5D8jr7Pb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy5U7EzsV6M99Sz3eHa9NsMO5ZoNnZTsoWOQgCx/jlLA+cr5oBxsPPMXdO0m1NhKdiG5lVl0bvb5O+lcOW9aL6aq0CQFbBsN5oGGxFEqR3ISp+K+hdHsUY44MHxCEMwFJh5XUM2ICkmjFWf6vIJ/I0fOFw0FZItje/DMHY1ZcnggY13ipfULad6cOGnQhw4c6r8snjrw7XWha8p4XKmPdeMINJrEAYDkEFvMauUZ68qnkvWQNeqjhopv16TFWRT7CfW8Siv9lGC2pbNxWd5woiuT4P6vc7LbljDMDr5ZHmh7Nb6zelLyhZx/PpTUv5KyfBNnORMy3xpqSef2PgMoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyWGPWrrB9mFsyaDZ9ijrgy5YkVtj1mSwJzz5noEpz4=;
 b=JomvhGZ/W573E0PgNNhHWoOQKtNb5Iwyz6hquX9dvejjQun/CJWAvCwVbM5UroDvbfGYxSUXNc16kXREyscISh1o9LvPpm3/8afCKHeDGU3n3xCfzqF8cwp+u89PMQv9QHW0dT45Xn8FntdGlGT5UnxEyvRhTAlq4aj3F39IfFW3zLquIyALeE3NuY/OBGMd1wdjcam3XFbs/+yQDHZ+LoXbRXXKLyZvYqLJ6ReeJenj8bFL/wxbLHmTGIw6DEzFykZpDKkX5oxQJ5+i+hiE0odyVN+UOzbt+A/oJzcx0BgIzFTMzcK1yPyVoLQdezo25wn+bJgqn0zork1TW55uKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyWGPWrrB9mFsyaDZ9ijrgy5YkVtj1mSwJzz5noEpz4=;
 b=5D8jr7PbIwLEP5W8vs4UHp7WzoGRRc8NdVu8QNnko1jWSNuqIfaDNUymTw9TeGWXEDfrgs3+2N+Xrrpw6CYaTClWK62rTsGprBbagF1gRUbeVDrQ+RmRAjDCtXXQe2A8QuibYpQy3f2T7L1Ss8mOnwU89vIBlhuEyyJ/7M3nJHg=
Received: from SA1PR04CA0013.namprd04.prod.outlook.com (2603:10b6:806:2ce::19)
 by IA1PR12MB8468.namprd12.prod.outlook.com (2603:10b6:208:445::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 09:47:22 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::3) by SA1PR04CA0013.outlook.office365.com
 (2603:10b6:806:2ce::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:47:22 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 04:47:19 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 4/6] platform/x86/amd/hsmp: Clear mdev.this_device on deregister
Date: Thu, 23 Jul 2026 15:16:54 +0530
Message-ID: <20260723094656.3806028-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723094656.3806028-1-muralidhara.mk@amd.com>
References: <20260723094656.3806028-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cd03a8-7b2a-4e7d-e0b6-08dee89f64b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	68oU41SoWd2PlfinRGzLgMp98mgbmS/XvXoIQbn5x7Skpv3NmVblffFFJ4zWhjmcLgSBkUm8D+Jr6VMAOKfRDAsWefKvEuoqnHfBsFcLZBYueIE6PEHbuO+UmJFoxb/y+bzutPENrXPQxzQizG1iNXiVq9iUQylMzjDA84fXsJPnkRu61QtYRNI7Xv4Ovst09p2di01uRyuOAheZliXQtmm5GGnGgtOur5KGPcnah4BWYms1EVB5GCNc7pb1FkMEmrMrtx3JddB/qgTlyJ+cx8OtND3oI3CJ2mFHmMsw11DZUYPYMLMOG42Zz223Y9FmLkI+7/7kSY3j0OehI8zdPEaFdI+AgPz6tmGfL0D8a7e2eFHCucBMqxZq+lUkoSgNyX1L4BQW1CsbHPlPH6Dzo4qieXBcXGrlJkfpJryvthDcVPsBPJ+UQAgH/xPrU6mXrsBtHIMRhkakmT307U1tRvqAa/7/nhAmr9lmTBVBkAawvfo7JvWDfwJuMhMpfwAkjI3q+NeFwhBTKGuMCaRxlHTDRbZkqvbyNQlq4mOMCJHNnKVWjpRvQZ5rUSkYtnB5BrvdzRMmSTbAXqPSgred0ush8V4iczV/pMi9vWEB+/0WXkYF7+XjehVUVO9eDzyz8lLqn13peZuWB7Xx/W1YRwAjVj1FkjG2lvVPvpVEnTNgDQn7X+tjCv4+U8hzdaPf5BBL3ZtTc/kj9BAhK+j2eQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0c7Igq3ecRj9YzYKtzqEHDBvXnFR/HInvH73SvNdgvMbDJHeQ688ynFegjMwFvrjNonBcSDwQXNqqmY4D3Z19EpoKDJrK55ogpvo86O9QLmwyDqa+0cQ7Qf53BPsYMUgC/6y5li9VNJf6KEDCK3AVUYMz63sXtCo4ch3eAdmxEv9S0nAi2ADZYGlR11Ne0Fu6mZldoTM/QW9AuR4N2UstAUeePEFp87ldRt2Ft2qIKcZGtb4YloHbpDnqLlm+qS0KAd7l9my+biKkIQSD13htcRYPpwJLCaz8mSpeItB5wuAyH3kpd5cj4ZrjMa5UtAv72CnlGyUYQstm+tqWt5W0vqKQt3tfj0c9ljgnIzG2J5ZJiLx3QGerFbVDN0EivdrARV+iUu883RdlHIG2pgW3T5jp2n+oIh47BNh1RGZhDe6VMmw2CgVFDGMqO7tjo+L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:47:22.0133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cd03a8-7b2a-4e7d-e0b6-08dee89f64b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468

misc_deregister() destroys the device but leaves miscdevice.this_device
pointing at the freed struct device. Clear it so any later check of
this_device, and a subsequent re-register, does not observe a stale
pointer. An upcoming change uses this_device to track whether /dev/hsmp is
registered across the shared ACPI sockets and relies on it being NULL after
deregister.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index fd36c8f142c0..584fd9b1d31f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -539,6 +539,7 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, "AMD_HSMP");
 void hsmp_misc_deregister(void)
 {
 	misc_deregister(&hsmp_pdev.mdev);
+	hsmp_pdev.mdev.this_device = NULL;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSMP");
 
-- 
2.34.1

