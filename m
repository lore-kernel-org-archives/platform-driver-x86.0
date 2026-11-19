Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078309;
	b=u6tiqpRRlahQ7D1xCUkbIyxbrcLGtENq3A4oQJzy4mfA/PITX65B8zPeo97xT+pnNrME
	 vBImBbmPD5XxzlyAI9sxJZQI+RWyvvJtHoew6HhX+/CMyOzHAvz+6mq43X5WESBoEqQDc
	 VYX31EAo3bSNCxRNfReGwpUfsqBev5CegACGSPApgAT9rZI3+77JAvs0L6o+CvC7YLdMw
	 dFRNaKm/LbnklCfWwpzGuYGfYPPazJOHkJpmOAfjpKXFLkT6IDOOnJPe7y0SzKg7eRaak
	 kk50ANaZGR4fOolbLSTwPpDSxov1McjtJt3mdGYz8edufYTD4YWwdVNrh6+MOGE77ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078309;
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
	bh=5Su/3NHW2D1QfsDkc3mWEWPjLu+B+lxHCf8FdSzH/B8=;
	b=Rz7HJJ4Q8zjo+gXawSrfY8Wav8n5kXZ8bVGBJ43J3JsgYEtc+ObyXfY3V8lc+kwfWAvh
	 6XJC3pLVN+qGA/1kWAHdnROp4htLSjtQ0uaXWFYRA9WlrxYBGBTnZ8uIkW8vXGuTBUEn9
	 gumjO7jimIZarPoekwD2qMch9P8xTuDI6qTZ/IlnuBGXtCe3kwN0AKlyGSLN4q/tbHulV
	 bIOXuWWZZY5j8k5r9xX+QTTZui16PNG9L5WLbgbNAWFZUuZUaxXJ173Akf0qZvfT+WNx9
	 Euxq/Hsv1Wq86o8UjJqM82HGTzR/OL/o4+kP8TsBpjBYNQ5uGxaIMzx0dTHHEydTRmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="Tp529w/5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.23
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C107606A325
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C107606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Tp529w/5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHHBC/FCguB6JsC5zhNlRA115CyHJDDaP2QWVthTrfX9/FDH3gsnYdiCpMO2EAd7ET4/MQ5L0yjN67u4clxAy3YwGOD2XUAEr+rK6hSb9PProyrI5lGA8JqORd0FdhJC216SV1wtUriOUVNEXaWlFmnRWm9TBJYJe8QV4Mnokklh9stcYqwhRlRe5snDGhjgu2YY92HMFRKcRzrwERH+Dji/LErr627XYCFGLp8isAXw6w5jZ8omqF4XbMuvqXTt62GzeQeo4ZnUZUBSdYat49B6MxU6I8bTPDyfFR2/pA2JXmjGdrcFFGcaSc6GWVcfgngDXvioDK1fo4lfKarDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Su/3NHW2D1QfsDkc3mWEWPjLu+B+lxHCf8FdSzH/B8=;
 b=aDm5HT1ccz6f3wtsoCP4zNEku7TZTAtRRKBTc9u5Bf0e6lXx3huE7VCYam/0szst+lof9ljCyafyu5+c0fAqNMhuOq3mbMsREqOFaK+zZl9SjV2LBRksfEO4rX/orSoYZbyYEmBOOZTwUIzzS5n9x9/sjI17sXhiR2ynIS6ta8HwnaAdckLUBckAfEiJUYpXzTsJS8lh7FnouhyBlHyuiYXlG9U4CyPIMFAw6ozTj7et9ieSyl2VUXN9LGIXMqm/dgqJlk/pReXW9xvhI/4A//TZIIMgWRRiu8CTJqxAVjj/+j99Zfk4gqdP+WWWuruRz20CZkCrHfEMOnLtwjHayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Su/3NHW2D1QfsDkc3mWEWPjLu+B+lxHCf8FdSzH/B8=;
 b=Tp529w/57OrOZMQKqY5Ce+WZr5NTKKiV/XU1fFsj+pH2p7bRYGID+vPXcdWv0PEnoK2KHiZlOhRVEPsuUKRz7INMY5UREBU6ZNKI0ciADq4BhN+rZVPJPQYLiyzSZFt3fE2Th1V1JgCvA7y49Zs4ZvF9RVoq3zzYlKT/1g2hgP0=
Received: from BN9P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::14)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 08:51:43 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::44) by BN9P223CA0009.outlook.office365.com
 (2603:10b6:408:10b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 08:51:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:43 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:41 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 10/11] platform/x86/amd/hsmp: Relocate to_hsmp_sys_attr() macro
Date: Thu, 19 Nov 2026 08:50:44 +0000
Message-ID: <12961ba989a5982521dda488ee872c65bc66661f.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|MN2PR12MB4048:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd5e1b6-889b-4c07-f47f-08df461a560d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|261021123027099003|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N9IZW8vHUFDwWMtJPMhiVJcBXT7HL8krHOr7lokLmPtaP/tzHUbLiZsGDBvMZv1Q2DFjB1WZlqE58Y3VXIpXrd7PqTBEYjWEShbk7nP18cQNldPOuhc8sIUTUtH+TWXh7EU5M3b8k60yyeLSJBpFT5qVmO5KdC6/hhOV4t/FjpZjdOIs64a+gh2WALvYBuElu3zIgTVdcYkP2XN+NLAZCyKObOo9tOURtke7s62KQ2CakFaYKPGgFdW+72bUe+fHLVEwHuFQmGSfMoS8AzbrNUdL3QXIyLrFFCEN1kMtuM6NDAuzykoSS9RL1B7kQJfdr9au95OTVLLHHXIdR6j7ISSxFZdE2uohAd4OJPE3Tgy1xdAjFY6fHo7JB1xhu7yK2lMHKbmD3woS5B2gA5ilSIjoSPEfJ4t7Bg+dS3IT4a/JPVx0H+kmfxqPgQ0gW52k58M2kAuyKrye7ocL5du+MKhyRHHFFF0e/t59uKm0K+3P4K2VJYr3MwKBAbkGLy6xlgCnnup9qucqpIHer2qQ7wy9hGY9RkYxSSbOs4YH7Yco0BPvLUW7f0X52g5qVlVDYcStHhjyzH2hS3k/WA8Ro1EZWWlouVmi0tmM4TMfM4J8XuHM6BMnyhhEXmExKYqTF99hfNWyYBCppNVKfGzbIYA4q9/uZM2DuG+8NMIE6Rx4GVA03AMAhFtb8/3TZjZmpfztWjtdjq8JK7FhNp6eEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(261021123027099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V2UR8TeasazVtD7m7uRUSYylowqNzehcxMOVtVbgTCv4hH9/xbFtwoJmHydnnYyuBvPJfEF+/caGa+kNzl+hhh+klEsua8Lp/bAJc1BfSvXyLPBB/7N7LKS/UfSz6nZmT2HwhbU3rH0eKAgKwYmctLEFdVUMicBmBIq0Wz2rs5CdHUgAfgdgde66aGl2z63kxhD/MBMEwHd6Te2DDiqUv4macEAG+fDopnp7Z9JtN5wqNUNDKfX04Cg//FlNsnyYXjZdCnkgNDZWEvgr7CXgxh01k3fYzGR4jt/94L+nmPJmKsALW/IH6rT/GmdXirJYZI62lhownNPS+8vVYRRnkT/Z79+za0XkFW68y6Hi5F0FIWJ4kDj+YqrSH2JvnMCdzentEA5KD6Nkf4AqdovvSnzpfX+3JGFznFE6wmd99DBHfjcowXywYFh9N+071CEb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:43.6275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd5e1b6-889b-4c07-f47f-08df461a560d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048

From: Suma Hegde <Suma.Hegde@amd.com>

Move the to_hsmp_sys_attr() macro definition above
hsmp_is_sock_attr_visible() so it is available before its first use
in a subsequent patch that adds bitmap based visibility checks.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- None.

 drivers/platform/x86/amd/hsmp/acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 893ae7be05b4b..a9d6da5572a39 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -292,6 +292,8 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 	return hsmp_metric_tbl_read(sock, buf, count);
 }
 
+#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
+
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 const struct bin_attribute *battr, int id)
 {
@@ -335,8 +337,6 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
-
 static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
 				    char *buf)
 {
-- 
2.34.1

