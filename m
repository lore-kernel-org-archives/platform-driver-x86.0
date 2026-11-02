Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604024;
	b=RClCfvlJGiYITHPX3eq40vMI4DFWvjUYf5pdrWe5LPSPAUHfUJsFlMewiXiAZwPD4tUc
	 1RYdwru92klbVGj4YD9X6fHKUg83m0n8UYANvfnYZ/PpH5rljFJAMI3Wl+H4TqMIaGWmz
	 loP1frbUcUeAAnt8QyskuzXA2kP7cVk3WpXWB1iNRaMoXRw0swu8q4Q0VcUL0c98ZiVLB
	 ycyQmHWTDegJTuOdSa4y+HjJEOmvzZi+3ZqAltk/SVTQbd4Zzd9xa0kE0hs4bgsLupa3j
	 hSF2B6D4394plm/szOxgTfQBcQ1kJGe0U2BJedZuAQbrfwib1RpzEIb+jBt1wH/JjRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604024;
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
	bh=2w6bhfAeAAgiLBZB/Q/LUX6XpvJSGpw3H6WxlK9CPgw=;
	b=gJtcTbU8DMOjj6XNg474oai5lakWMTaDPyXQohnrUVE8KbCnprF43AaGEVYSV6pLSwfw
	 IZy/0lFUVGLsm9rwmMLFa5DybFqSUMm22fVKjGYdi7gMXL3futzhcfNUHDC0GkRKuu2o0
	 jxoA3FLdGNE46ZnwSNYavhYOZBCLk6/E36aBHMPz74HzHzCl05jc7+gIsLrFqYC36mBRW
	 fm6y6Pdo0CY3aEev4VlVzJw/2mM8hcwhoSmL6ulD4d4YnWXTR6MamSZh9n7gXurkHxQv5
	 fmgb1N9HDqrLn7mFcXUHUP1wFrRHlTvOg+51QJTuXBOuUolDWde/AWA9vQ/UE83ZZOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3Mu6tGl4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.21
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923EF606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 923EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3Mu6tGl4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzL8Nk6zCFLpIwJYoKe1LrVMahSa682QluD5D4C8Jb3QkaQvE4wn4IXF7gGwHEss/YN67lGMxPBTnjbqzZZM0+dJoVNJXogFHofbRsH3mEyxgOuvbwQvv4q5gT9mNmP2cK3sAmyNuHYlQ2Z42Pq3FsicRlvGkqowWf6C3Cns2VMiPzvO0P8xAYHNffXozHTWQVMEtYpy2Im4fjen8jIIWteIpdl/vrf5xjQYvfLvXXHqvloM8hIw5cQT7H3kdWCsGeCTi/MjNvzOZ7Wi/BdHWIb4shQ5fA0PRk3oekMkVPrcRB1+Yi9ysVmqxWsBnVLRLdYZwrWknxHkUUB2sagbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w6bhfAeAAgiLBZB/Q/LUX6XpvJSGpw3H6WxlK9CPgw=;
 b=qxOk9vTFUpEAd0hBzR4HLLOWAtJ1xMDGwSS2AJNRCci6qfAq+AFgHLbp+G727PBnT6Zb+F3qJIyCqdccY8NkzWAAFYJvTnqfwV9LIUOPyocEfL1mE1lDJ8f2tEnsC3oXjO5cKVFC7O9RSU0ECtKFd4RrMe5v8ndpUoQr9IaXkirunKW4D3iHamdNeAMo7AswuezqcV88buEiNaBzDMArCNrcJM/TdQiectReYEqon0bMW9ZvNv24yPEvNLwKI3XCwWv8gsmLp/fpv/fkK1ZC9bkRTPZZt/smgpFzRxgSoclsr3By+Dge3Al8psm2Q/HD7DvAC+vy8+ExcwUGq7y62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w6bhfAeAAgiLBZB/Q/LUX6XpvJSGpw3H6WxlK9CPgw=;
 b=3Mu6tGl4kzrAXSEAC9tT6xorv5bQ7Ul3pBkb0bfFqSItzXW3751QTjdN2JCMwSrjaUq61iJ/YP6f7Iy+cCZPQjGVzgQvWPmCqQ/ijCS2Je/YiOGg/Ao/prof76nSWaYmaSSXRyw0C/x3ETZ8Jy1SGjbOPT9mmi1O/BaHd1W3mIQ=
Received: from MW3PR06CA0002.namprd06.prod.outlook.com (2603:10b6:303:2a::7)
 by SJ1PR12MB6025.namprd12.prod.outlook.com (2603:10b6:a03:48c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:19 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::85) by MW3PR06CA0002.outlook.office365.com
 (2603:10b6:303:2a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:18 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:16 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 03/26] platform/x86/amd/hsmp: Add hsmp_err helper for parser-friendly store errors
Date: Mon, 2 Nov 2026 07:19:01 +0000
Message-ID: <9120b2df7326bb11a8a25b162e0c0435c010c7cc.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|SJ1PR12MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: a01d4dd4-eb16-475a-69ba-08df38b1bfca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261021121427099003|261022075727099003|261022113327099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xGKHzzKpzAgKa7A+lk562nYl217fR9F81exl4D3tkTnx8s/LCYjfrPAtY+ji0js7UXISHNpPWls8f8G7XmPHXoURNIRKGJ+Ec/nUgIN6yU7uwrUEdk1WymYrrMwW4IZb6KKa3QfVUMyLoVqi2XWaR5LsXGOESysxHQm7nJjKpin4rbs0GNW2LOqYqAVFhCCCW89tEMBpYgOM2j4+PgrAar9kGOY7wo7f774FXOMMXX6opgDvfybIzFtAzWA7RoejOjaXVb6pnzPqhetd0LZFD846zY9IWAAnBj50LDm4gJCxyogJjKdz5omJoqYa9kxAUQV79XnvLXNFxy8RtdG7ReiUuOwlefGXK3sz2JBAXb4t5gXuZ3L4l5Z8dLV5AdU+7EMcYD6gZsnuXr/gYCxduL57KMbl/ZGu2U5W6EMKrzjLKkOAxiWvC4EpG+nv/namRj0TR125y8lMteTlVcPvxj20pi8YZQZnN89a8N9R2d+gNAVLexOOR9CKyNTHjdSNR3GiSzHKX5Br8tL3ddoTdphzV1R6BlQeuR0sTPARAMmG5E8Fwo6i78BsLD4QgsJzTahp/Gx2iqGTAwb6F3ZHlpDoewq9naXptAsJEhX5p8tFHTuaolzbTqjxqfsdEwuaHiYsyNFDHqRBZVo0bL05tsYIFpYXSVSEHjXSbVOWx4rWxG8/ZAoUzRBayid2fAUn6bouSsEkl8uGAIB8fztOZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(261022113327099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KCPSQHOwSCvUfxe6YofnL8f4CKx1/z/FcC2rwJ7ExwcOkVDK8Oa5uzwp9p65lfacEwIln2H32yTk0s8jLK1AILvTCkaNlZjZnWvZTg94K+Do+NrbiQvY/qwDxLzY/f08ZU9JUM/liLENIxJ6VGIoNPlOF74KRu7GvKGAYz+CCJvWDo060faNIxm7p7Z11ZHbv3n2supDnbVOv+V0/G/82d17OKtSqe0hmfV5EaAO66DnxX7CQeeXeTZ5mwmZSG7o+GXXR8IOQ85bkqXRgkrcTV2ySNK9vNw5y3qg9vwqIyqSTDPMW/nNDw4ftOoSZ85a95cA+xGzqoNjXqUgkAmxcCehWIpu76Z6Y07iPreA54KJy+5MwyB4iOw8MO6JQ68cJ9ALUTgvXf3vV9gq/V/1x/NabXFzX7mZ73SQ77rp4AJnytIZFAbQ2MD891vxyHN+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:18.6917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a01d4dd4-eb16-475a-69ba-08df38b1bfca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025

Introduce hsmp_err() and the closed reason-code set (parse, argc, range,
order, hw) used by sysfs store handlers to log stable, tokenizable errors.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 drivers/platform/x86/amd/hsmp/sysfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 1f6448380214a..243acb9e37252 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -29,6 +29,21 @@ struct hsmp_cpu_info {
 
 static struct hsmp_cpu_info cpu_kobj_info[NR_CPUS];
 
+/*
+ * Parser-friendly sysfs store error, logged as:
+ *   "<attr>: err=<reason> <key=value ...>"
+ * reason is one of: parse, argc, range, order, hw.
+ */
+#define hsmp_err(dev, attr, reason, fmt, ...) \
+	dev_err(dev, "%s: err=%s " fmt "\n", attr, reason, ##__VA_ARGS__)
+
+/* hsmp_err() reason codes - keep in sync with the comment above */
+#define HSMP_ERR_PARSE	"parse"
+#define HSMP_ERR_ARGC	"argc"
+#define HSMP_ERR_RANGE	"range"
+#define HSMP_ERR_ORDER	"order"
+#define HSMP_ERR_HW	"hw"
+
 static const char * const freqlimit_srcnames[] = {
 	"cHTC-Active",
 	"PROCHOT",
-- 
2.34.1

