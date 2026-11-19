Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078304;
	b=lfSf3Rf5e6qEqqUvJX5z2BGo7MMIJ9j3rwgiv7+B0XEBhfGrK+fWN1vgoAvEZ7Uj5hQo
	 zXnjJEreC4ozwEKJ/WRbvvhtHiKiZnJCFgYGAXlL25unWlsA3em+IeWvAnHhljAxxA48s
	 Qe/GVeOmxSdT4H7iF7mpKWeiR2Ut90oKkaDtyiCa3wyslO2FqUTcVvrYkrYkacUADXyPE
	 aTiqoXzyOAPADzpj8JJZI9nYjF7xUaemEhllUTnMDbKu8TOZxH5qy0wcxXzpFhZG+pFz3
	 qo4TJMp3+q0c2w8cNpt9qEZwDch1jhZ/ZLe9auPrd6Q68GuRbRAw+jqmgdMH/uUuktA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078304;
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
	bh=zR/7Mna2yh0T4NVnq4eacFX/rIzmHuo2p4iDqOiXBdo=;
	b=pSCUduWi0e+WHT60udpIoxjlu8PaQFhkovZOW+K8LrTE2L30hqd//KVh2palheiQl5+Q
	 FBjDUUCU/viIvVb3M798mvcBhUTlnlYPVdAbnOPUizfk1Yjufwm+L1Li8NRp2F2KWbYC1
	 RM7pbpytrvh58p6O58WK7oHXK9DAo9UGB4XENwk9yna/VfdveCuJoruBL6pHdAup0dCdz
	 thM//i2BSXq653oOmgg3HGLRGxeetLoZBQAyw2GdyoF9vx3SiKsYP/rxswik9p3XlN6fu
	 +SBL1sJ2IVfV3aEE3r2ycGMghNOMdV2i1KUpmN1/kKTscek0kVyBWkdzvNWknM4jp7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5m64QK00;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.5
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33165606A325
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33165606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5m64QK00
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSKxrxmb43tjvBXDVTwXBVn7lmb0wZdVqU8FowSCWkafY9yKAwqGoKkzsvC6b/beSFvMZ3f6QwIC8mx5WgQ0MHEbbgpGmdB21bELCp4YsJz/0Rcq+cyojXVXJnfkYzuM0E8fEaCkMPXx6R8JcPtFe6ToEHBJ5f3n5COF6D8MDY3hSKERBcsWk6Abj/1duAH81ekDE0VwSZSHJyaGNdhgq82BagR46YfqQXgK11aciGfPs0SH1xtl7qbmRPnmZjZgS07JRHed5hfwYBKjUS9mvlUiR6k4/1O/TkhFTKVTZYZt7INgtwdR9bmfK8l/iIU8Ow9n16jXUdocd1QAg62oFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zR/7Mna2yh0T4NVnq4eacFX/rIzmHuo2p4iDqOiXBdo=;
 b=M1ZZOSH+7qe2K4czRnBCRcPtSdR24+1Xf7yI0cLibfxFRjjiFHvQnKTDQJy5aBluC5tScm0durj1hFoVwzo1FVg2yV/AmLLVQjZma3qMai3FTQkw2vCJPVt/5DSCxcXa626LQN8nD+9YoYoDYIzjpqUpbRn28u+j3EYsuNegY4HI1dQhGeopwaS2cpALaaTD/grLQ0zkmsOSgTjoe2K822rCy4ACJLFIp0cUZlmfyOwXQeY263/628zGbHpSSnG5O9bb4r5emEmu07FgE1COOht2tPsFhPuJyuRAiMrzBkNoRe3cWsJxEHs9Qa6GFFccuufHlB5776GSBwyJbUSAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR/7Mna2yh0T4NVnq4eacFX/rIzmHuo2p4iDqOiXBdo=;
 b=5m64QK00BRAnk6Xy+7dJIF6BeEZnTX7uBini9AP7BXS3xKIruTp6ALUH6460yKRC/n7ED3ZiyWBIR926HCuVC5MNbsQn0YCuZwOrC9i/vkJbKWb5R6SQUWCJ1abBD183LWZOHBfboKDUxtdtGssPW89XOTN/z2JSinPR3D+DMWQ=
Received: from BN9P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::29)
 by IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 08:51:34 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::1) by BN9P223CA0024.outlook.office365.com
 (2603:10b6:408:10b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 08:51:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:34 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:31 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 06/11] platform/x86/amd/hsmp: Move the sock_ind bounds check before validate_message()
Date: Thu, 19 Nov 2026 08:50:40 +0000
Message-ID: <7e9bf754f27d3e5b9a3b17b95de6e08a6f8da03a.1795061419.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795061419.git.Suma.Hegde@amd.com>
References: <cover.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 74311287-4480-44bb-37fd-08df461a50c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|11063799006|56012099006|261026121527099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	kcW6H9UIIFUN7wWhCpb4gYbNsWxLbM37LgUPdIMRYqCp7As6auETJh3Vl0j0eIRlabYABlfAD7nl0j3hhiFaBhSISoXgTzvjOjBI6bkhpoiHvp3Bn6NW56qMxz/qW7TOT6a3/9dFvQfocT5KBz4Lk8a+d5lw7J4NgC8SILzAM0iKcOCQwbG49WzHi27adMCYXRrCiDbM8w0sQicNgqqlIsgNDzNqVcE4SiBGow85rQRoe+s7h69nqnJ2oIPcF4ocK70sDM+MLvPDTGQ8Dgtn4zeAUfOo7419ypPJr9vDnYcZHJ+BOUzUo3I5qOnL1nTWPAY6um10tXRkkCWh/rLDtB0YUpwfte2BMUvsM0rFRoXKYzzlvvbNHQkRNHIV2up0DOuy+qR19TpLZCFVQxJpe58RdcjmwRvZd61FtlPs5Mw+panoGhOlO/B5YCnr0qx8lxc1dObWqiZDC0uegSz8I7vsJJvOdylgBhnBrYS8Lkx7NUOjpGodOJfSuj5vF8bUGmtd9TZ6mkLU9y883bbK1HWIiO+P7DiQiBeEGETl5Kf9fBf+d1X8jrbCr4UzHSQgr+Df9hsvGvhiaSXp65Sy2uPhgi+XfhQrplS1lLt292ZcNGce95Wg+zgcJqWvCsysZcac20uahyWdgFbUYX3XPWEBIhUvfefMSeRPF2d9HwaP5a0aeXCqt1FLocZRxaiy6KTmkCQYHzIHTkDMmpYvKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e/S3GwxaPwUs4jbqHXX6a29u/aMkXUiTRY97OaX05JNu9pdtOUolXYsEGniU+b7jRdNAzq2li5Jz8Y5VByIkzCSycNu/+RM3hXCw8wlikN4x8JocvTUVfzX6Y/nucbUSLyejLFMjXJktVFPNHU23ehKT8TZHra2sv4xyYdzXLR2xTGqmoSk3Xh9wyb/j9vae05rFBoHIqnTnnkIRrY8smfvtpEAzzXMuGz/3TQ/mitgxPyj0W27cdyctdn/tUqm4Z5eut+ya+khFz7ydL4DGLAO7WaxLfXip0pfzlQ0Lfa7V12ACPsZUCdUiphDJXedDubzQJfxc3J8Oz6Ahn1+XQ+SsxjsASjxWxdkqBr1+ViBU7ccC/naZyqwr2+TNPEW6/V2netCtMAzWKDUmbmv+2Sg5X6oXE6QRfHfx65Ny7SS8nxLAaVuFDHZwHxFsG/vD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:34.7742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74311287-4480-44bb-37fd-08df461a50c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541

From: Suma Hegde <Suma.Hegde@amd.com>

Move validate_message() in hsmp_send_message_locked() to after the
socket index / hsmp_pdev.sock NULL checks and the existing sock->dev
readiness check, so an out-of-range or unready socket is rejected with
-ENODEV before validation runs.

The subsequent patch uses sock_ind inside validate_message().

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- Run validate_message() after the existing sock->dev readiness
  check, so an unready socket is rejected with -ENODEV before
  validation.
- Clarify the commit message accordingly; fix "bound" -> "bounds" in
  the subject.

 drivers/platform/x86/amd/hsmp/hsmp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index ad5b3fde54caf..9516cf182917b 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -351,9 +351,6 @@ static int hsmp_send_message_locked(struct hsmp_message *msg)
 
 	if (!msg)
 		return -EINVAL;
-	ret = validate_message(msg);
-	if (ret)
-		return ret;
 
 	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
 		return -ENODEV;
@@ -381,6 +378,10 @@ static int hsmp_send_message_locked(struct hsmp_message *msg)
 	if (!smp_load_acquire(&sock->dev))
 		return -ENODEV;
 
+	ret = validate_message(msg);
+	if (ret)
+		return ret;
+
 	ret = down_interruptible(&sock->hsmp_sem);
 	if (ret < 0)
 		return ret;
-- 
2.34.1

