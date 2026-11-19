Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078286;
	b=x5Dz9S7JSzsn7kuyn+nkKruw18wf1G3VHwtz2cYYNEfg2+Hqo2tFlpGN+Q7wx6U33pQk
	 cw1K6U+YI223R7SJYFdeDI1HOj3vDvmqG+3eJqfz/LSiOnx6BabR9Vup8q0vOhItIVZVx
	 ieePQTU8FvFBKAHygy0Qwa4kbz7PLqUkl7mMq0BKWZC8nd0g122uVObPWsJdP2DtRi/za
	 vwrx+Iq0YjGuE3mC0DcBVvV+QELc7gq3gYhqnv0VrmQwtYYPHDOO8xHbjOSpitfyH32gG
	 iY4Y1JQCD24S4YTU4YNaxnPYwoebtSQBlaPI3XjavZ6bUrVRhSsl1AZgr6xEBrm6RcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078286;
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
	bh=IRgLfR505dC/7jLqmhXvSKxmqCK337sSIfWOhbat6m0=;
	b=NCLJ0Crd43YzQhX21917fFa7i9i8Ec+mYX2aJsW6nVAC4ibbuU0cVy3YdgwwCw9V+Cwn
	 l6GiLgGOWSHgN2cQ+Ha0Guh40ExOu2UGSmecSN0rCOL9p4Y3BDeEYLEy9sft8rL3zkE+1
	 Cl1+YiVANXqcdtbBBA2hEUlay95FMuxz1iky8MS+J7BU5I/FrZ10TTfF6zwyFnLzpKxQw
	 yhV9NC0CxxRlbyuz23qxHjBGmHyJ8Zq339WNirkv41bBrHo9srchuQIsGw8NiAPdsU2ol
	 L+/yMRBNrtgY1rZzNubjY1zAZYgaJQEycU8zoHLXNKEYNl7B3kZuUV6Blw1z/Ms6HYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GtkZIu18;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.33
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011033.outbound.protection.outlook.com [52.101.57.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C27606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C27606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GtkZIu18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFdmp094ls7WG+K84GqJS56kfNuA5T8ubypDHOzL/j5ExxC4cumsS8eeBf8KVFIm3TyPri0jaWQcjwkBjYk4/kdjTe69zoqJk3Xr/I97mNnK0Jtey0XjaojTz+s1WoiaWjQaxyvFFaGC7LN2uOEUV9diS9dBscrzm7g9dblWHY1u1BLVK9giWx40FlB7I36Vk1BPCPS/MfOsLqXNj2H0Cs5WxHL62ZpQc+PZNt+J3iTftGsUlbYmvzMt4zbe0zBl4/Kl3kcedO8XJD9o7BRS8dH1GNB0RCfOXsasDjJraVzXek+0fX9NTzdIVDrIvrvPQWQYGKHZevOWfUzdCfvAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRgLfR505dC/7jLqmhXvSKxmqCK337sSIfWOhbat6m0=;
 b=VRKzvnX/+NwAcdXIcAzpmCmTQqJok6zUhtFvyjrcn39DGr06y+HNojGPmwLiwLplVZy/m5isJtZIAieV2Ttatyt7f8NiT5CLwKFfzHoCpuLrMaC7eDq+ZNCwfc4urSnhAuWdS7bzWWfUL2M8wIL1ExUbYKQuZdNwvlgCMc/d1trzmZf0e5L9F9QgJ8uN7vfXd12aYN0MiaI6Owu943WVXZTRDBplzwMbmm1BSTbdJWanUQxPr9g16UBEZcQHmd+Fdrclby5ouVOSC1Z9fZ3O/fJ9ebs9hfRBoJun6SIHZLjadICGp/15VAsyQ8qNFP7eDC4xn0Wo790G/6JMStXr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRgLfR505dC/7jLqmhXvSKxmqCK337sSIfWOhbat6m0=;
 b=GtkZIu18ZPXThBDOh1gpvb3d57k2w8k59+qtyF+hiuSSXBeApFncpr4lfnoJSUlh7Yz97i/g5B7I4ehK8jgIDh5jtNSoaqPH9Oi6LNrvaO9Izx8EmyLSBxb/Y3sZTh0/1rLb+sFG+mZhPlPGM9z2NPnUhihm8tiqDmM7J7j7g50=
Received: from CH0PR03CA0430.namprd03.prod.outlook.com (2603:10b6:610:10e::15)
 by MN0PR12MB6004.namprd12.prod.outlook.com (2603:10b6:208:380::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 08:51:22 +0000
Received: from MN1PEPF000793FE.namprd05.prod.outlook.com
 (2603:10b6:610:10e:cafe::8) by CH0PR03CA0430.outlook.office365.com
 (2603:10b6:610:10e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 08:51:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FE.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:22 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:19 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 01/11] platform/x86/amd/hsmp: Fix sock_ind bounds check in hsmp_is_sock_attr_visible()
Date: Thu, 19 Nov 2026 08:50:35 +0000
Message-ID: <c9d9f0594eeed2c860be7d3354eab8f38bb7a1d5.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FE:EE_|MN0PR12MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: aa409ef6-e51e-423b-7d47-08df461a492a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261021123027099003|10067099003|56012099006|11063799006|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	27HDmvoapDQYuDXlApbgzEQRQT/IRc8C8uaeX92j6RQ+VRSrzhxays4vls4W6qink8IF6XRNyYN3t93mzb3YmTlhr5MDdg8GfRTSQw3hZLXrqqML27w4nkmPZblwnKA9cBaLc5tsu+twoMoqWuZgsDJVEqwfZKjilZS3My+qx+OBjCDDWIbQ7xVgSOMBHJy8EPODip837Ey8Zrr0oUtk1Q7A4jpexPvU0kCBDyZEdBVvqIG6TF8Mc0jzmu6SYHHRBCKxe630io9UkBHXjb11MX0122ngq6vuB/4YZWMooF9ALGb42UCkrzdX6n4UPN4mV8wYSwpn8PYQe50Cs18FlLsi9dTyrJY6ltuure/f47ITTL28aLhROWK2lzZTCKj0/0AQSlA1Wr4rw8YnNi2RZHYHZqfXmRW3P5K8DaUL5WPpLrG4cj2cbrMb36ZszHxKzwlxQvHsYbXBOVMqv43iA+ECYETdb/d1LXKHEEizsK0tdApvs1mfYfE1qGDbaDcCja9D5nhSAzaj+RsPbQefyTB7bZAzSHpGTL70EwyxnGcWWhAr4rRBlmesJub6aCUsBta2iiR0Q6J4hN5EhS8O6wmtXyYI5nhLanQL+p6U6cUTLvkJcQo+Cr3zA0H5nXBHYAfzXMdG9tHY5IF3nyWn3lfLXfLkllUYq8rXDiW0YV2LLdzeSPPJbsIEepjbQMdh9OlWyOwwRl24jvWANUYFrg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261021123027099003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j5eCvRwjYt9eS1NwdUjngIoKYhAfXRhgd2nNK1Qargh/UUIeaC+eYZN6SU1sXewZTRFsWyOLmq2XSAgITAgIKTFzKVa43sAq71kh8lw4JyzqkMZ2lMR3VN3+dLNvBkv6yKYPPRq/85MUWa7bOSH4iH1/YuhFQrPmjMiSQuGksmOK7J4oyUSHvO/immMVnb9p9lcKNUM6o4M30hArlYCq/VlHB/cFosHY3L/+Wv+uEmD1GqGL1fplBXqmhToZYaa6y/O86GHAECLfj54uCJ2yKGfOKG+j0snRAQhCaVXfkqzNYCRDD6oePt8h/YuV8D0tZuVjgOuQY3K6QPNf9nDT0GuSQPqud1zFRmtXecPE3dyOEg8x2tyrgim8NplpMGtnvtzB0kf1Pif84Ja0c09QY0GhzGk7p4SLOXBgSbfXuzx4OAMqGfxvZZwnBs4xee2j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:22.0084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa409ef6-e51e-423b-7d47-08df461a492a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6004

From: Suma Hegde <Suma.Hegde@amd.com>

The bounds check in hsmp_is_sock_attr_visible() only ran when id == 0.
SYSFS_GROUP_INVISIBLE is only valid for the group-visibility call
(id == 0), but sock_ind must still be validated for every attribute
so a later bin attribute cannot use an out-of-range socket index.

Always bounds-check sock_ind first; return SYSFS_GROUP_INVISIBLE for
id == 0 and 0 otherwise.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- Update subject with name hsmp_is_sock_attr_visible() instead of
  is_bin_visible.

 drivers/platform/x86/amd/hsmp/plat.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e9b2b809c0f52..af8aee1fb22ba 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -71,8 +71,13 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 
 	sock_ind = (uintptr_t)battr->private;
 
-	if (id == 0 && sock_ind >= hsmp_pdev->num_sockets)
-		return SYSFS_GROUP_INVISIBLE;
+	/*
+	 * Always bounds-check sock_ind. SYSFS_GROUP_INVISIBLE is only
+	 * meaningful for id == 0 (group visibility); for later attributes
+	 * just hide the file.
+	 */
+	if (sock_ind >= hsmp_pdev->num_sockets)
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
 
 	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
-- 
2.34.1

