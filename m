Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795591411;
	b=VHOXbsPwRefKoFB9SFMS7AR6Mh+oHbjU/01h8unVOwzOtC/SSjmjhtOfw86mvoP1elzs
	 XSp6xgWbDvxtyZcEvMZkTC8UDZHOXwwYpU5GwRIH5uBP8bf2a9GkSC6ukwpiM8raGZa3A
	 M42UV+V0xq/oCH64WFLhI9+yiZNmsuzn3tjJkSOJ+8O0wzfF/qhwR04SnoTeRqTy11Uiu
	 dqmopPIhQ5xmFKXN6TxkAVL2xym7yKVfzbG2ILsLfaLvJxztg1qqCUqylcbU0UIkx8qgw
	 m2LEfI2pLuYQb6vl1/TfJ4LOdtXbT6zVJ9HGOOecKDER8B9j9bFtNBq+u7PlyD+gNZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591411;
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
	bh=hn68F3xPieK+1VqG+RmdbZ3Y5ag7xwoz4h9eyte9/Nw=;
	b=CFm3YJ/018oZUwKx52Wy0DYIa3qWC2LuMoF1CYm0z/knzU5UenZD3pcZOVLfptQ8wWCv
	 vDyLQjfThyuPpEx4PVpAYYfNmueKA/+ArYsUATDztW0nlykB+uzhLAyNbr0sXPhQLk1lT
	 Gcbut/NNK1DycNPv2s13BQJNfmT6TMDMrJ177qiEPvXzI1HsYPasx+BUmXeKVWARaRAfg
	 XztV/g0Wrvq5zPR4Ek/yGM6Z+EfyK+DWcGThyVqNvtS/TbkArme/8mtp2tYAIg3Yx9zLH
	 ne/sVAJaUJMBvbas8bDdQ9BB1FUEbPQPoOyGrI3ChWoJN7uNAU60VXB//SgYAFJGZag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tBVF9VQm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.64
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B27F606A321;
	Wed, 25 Nov 2026 07:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B27F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tBVF9VQm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzM2hHNJRBXX/6gxNzWuFmsr5lxDg1KRWBk6fAaptxc62tfAjbkdMfrhsr62XqrP2MEroiktUQJH8Tpzy/Ov42TgbkzYmfqOSj/1rDY/JfpS54hfqCXIdGihFPqzaVY9NysCkTLmGE5YUqszeJZtCPcBu89ImdnqVj8gmuxesA15XhgIYc5LSx0on6WFvZjLttIymlwiNIWMns4NsxKvF/dg2YEX9oeVAoAmsSBwH59fqJXUguqx3AlKiW/AsbNOL6IfRHlHEsBnqNDsHod2Mk0JAEpwMJp0B8ZG2Cq59qUtyYYBJK9mXcDnAQU6jx5D9gc0h9OzDeH4071ok1zHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hn68F3xPieK+1VqG+RmdbZ3Y5ag7xwoz4h9eyte9/Nw=;
 b=lTCX5sq2nrBWEv02+E2xSBgjnugevN4YBc7NuAFujQAFive7ZP5IiVVL0Sl0HRMpOyPPSZOK/+QgH/L5IyjFa1Jlb2gntb6iEEgSHEnAxuH5OmOo48x6SYaveiigED28QBmBjwNR2Ppf5PRu86J0bRC+GAgv5zr1D1sDh+X0cmDF1HBIniTaXS8fgYytGwXEdEsK2kV3p1h02lcuii8ecLwEMPKJRBpyNrd8JKvqybIXiYV5A6zIZjqztdotvyH5LVUYAAni+i5DorvEtaqAMZQn6mPPVyFlhRIRTDCw/HFzO7MmvRQHzhNAUQ+q9uQ/P8xt2xnwads+Bynv6NuPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn68F3xPieK+1VqG+RmdbZ3Y5ag7xwoz4h9eyte9/Nw=;
 b=tBVF9VQmEzYgZoYFFIAj+ujXZzgDQ+GYQvbfmwE/unhV76cXwm3MguLEEOibGsIBDv8yLINdADRNBpaRSorQNeeuvjQNsV+dFZcx9vTbIQYYEhVSiDeKGgPnqkMAZIiAVOIqwy1YSvaNQBB3DkBMhoz24LbBKhn0NvAc+R+FU10=
Received: from SJ2P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::19)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 07:23:27 +0000
Received: from SJ1PEPF000037BA.namprd05.prod.outlook.com
 (2603:10b6:a03:5db:cafe::ac) by SJ2P221CA0010.outlook.office365.com
 (2603:10b6:a03:5db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 07:23:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037BA.mail.protection.outlook.com (10.167.244.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 07:23:27 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 01:23:25 -0600
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/hsmp: Validate num_args before the fd-mode gate in hsmp_ioctl_msg()
Date: Wed, 25 Nov 2026 12:53:05 +0530
Message-ID: <20261125072306.3458898-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072306.3458898-1-muralidhara.mk@amd.com>
References: <20261125072306.3458898-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037BA:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 7365b816-c9a5-4304-6c18-08df4ac4ffc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|56012099006|11063799006|261026140227099003|261021121427099003|261026121527099003|261028144727099003|261009223027099003|261022105027099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hifdwC9eD8r+lpbJCl7U3bS4fHUxjIb4Zqf8uG5Rte8VEs/aHwHN3knULV894SRGpBoPHYQ5dmANICxFwnTaxoeZK6w+jjqFomAnxjaOTccUuYNCIBF07AscAHX8wqAG3Ag4AUa1KQNxVRJtTPyjade82zNv4/sGKwozpaD6SLRwE1zRs8zysFo9ZMZN15CJY/XzxfZ+CdxRZs2CzIoxqUzFt7Q/mIYeXNQZ9LEm45mKCiIVuCkB1fSPhtCkV/8ajXiRDYc9JjnluZ9l5UYkVjFXlfqXLh31DIz6f5ZBiy6KOIf/CvTdUVIZI9YG+/2C1X+oKzvYawZPtyWYcri61+jYUewhrNdHTqhi+rufZrthLA5PU/1YnGVDyQJVsve8dYYcveAOgemaUAuaY7FRiN7evbnRKJrbbcR6uYyJ6+U40Myha4usq1PMKVhygFkcJY46bgCdgjWYsMYNhdBB/bTclohnL8gEuiXfIxNanjvl1D5tcae7apH44jvYGGD5j7ippRchpz3Yb6JAZm3YWIx7OnhvrySwlPFknvHouogrq4idJKDS9d6eBwa5Xni0pYezk+gadI2tYJFMzAKutS6Qhc31IySrb3xGfFqOP2Q1HNLdL3hsMTgCT8ML9gD9LebLBBQQbUkqJXKbmt0VmblttxKXYcQV2LF3+Eg81m6ygoFgSA5jocmvr8nveYK26nyfwGflXisY0tpaaaFB4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(261026140227099003)(261021121427099003)(261026121527099003)(261028144727099003)(261009223027099003)(261022105027099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RxQmAWb194nOP8ncYB15kDRFwnIwNPqKoxdwC79CewyRFyqTU1YzorBhWNhXktp/hTLIkLpuhUw5dIRvfIcDu9d8oC/cUNJWERde3BnuLb8iiTth4Dykz+NOYQdSmWb1HuHPWxlNZEPJe1PoHwMFif6M9dJSeDD9wUhLJ9eZWAxjziWPP7dawlyBe3EJ5joRnbiRSnNP+2fdibaHtTzbu3HTvTeZOTIs7woDceMEh1t0w8zDm7JSGAzTYXhF9nSbBxYotpiFiOEqs/iFoJMZuL0MTjgGkwi6FzF5M512ItVBQf2KyQiW25uAOf1plxYuUgkJSiFAl1f708HGWjwlIvBsIpiLIjVXvaIwwp48yuyebRSxfDSCMGTeBBnEeW7uwUf28oTkV0DKcKnOu73DAefWizGXhfnAelKmbWn+AGzFbaqQyxy6tLNsbbKzn/2r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 07:23:27.4504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7365b816-c9a5-4304-6c18-08df4ac4ffc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037BA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147

is_get_msg() reads msg.args[0]'s CHECK_GET_BIT to tell GET and SET apart
for HSMP_SET_GET messages, but hsmp_ioctl_msg() calls it before
validate_message() (reached later through hsmp_send_message()) checks
that msg.num_args matches desc->num_args. A request with num_args = 0
for such a message reaches is_get_msg() anyway, so args[0] is read even
though the request does not carry it.

Check msg.num_args against desc->num_args before the fd-mode switch, so
a num_args mismatch is rejected with -EINVAL before is_get_msg() reads
args[0], rather than surfacing as -EPERM from the fd-mode gate.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes:
v1->v2: None

 drivers/platform/x86/amd/hsmp/hsmp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 45d20beda946..635e6d5723ac 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -485,6 +485,16 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 		if (!desc)
 			return -ENOMSG;
 
+		/*
+		 * is_get_msg() below reads msg.args[0] for HSMP_SET_GET
+		 * messages. Reject a num_args mismatch here first, so a
+		 * malformed request fails with -EINVAL instead of letting
+		 * the fd-mode gate read an argument slot the request does
+		 * not actually carry.
+		 */
+		if (msg.num_args != desc->num_args)
+			return -EINVAL;
+
 		switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
 		case FMODE_WRITE:
 			/*
-- 
2.34.1

