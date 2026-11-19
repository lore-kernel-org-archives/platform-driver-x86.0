Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078297;
	b=VXpYeGTtYqQ9q1NZsIl1Pug2zaNcsyVGGGk/myV43UdfX53iX8VNH1lOCenybe4yn1lc
	 LIwKxPr0k1DVZdke+lnSmcJ03d+P52bCxM3KBFVtQaNyq4myRpy0KeVGzzJUI8GA4YbVM
	 BIksFvQfqB3ZRjJSMRoKjWcHQIl0PTYkxNjqnVrIcHhzAmdmNdYJ1qmqnOZLfMZPJLE0T
	 T5QUGkVbS6jE4Lav5gICIaNMBjQxliUbWZ0TxzI74QniRKzHDltsTeD1junu91lH5vnCU
	 bXEiJ3gEmZxFgDn13pBiBPoRtkkIKFtyIkwQELNIzmteuIVauwLMSx88C1129EIdEmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078297;
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
	bh=yJ+dOgW15KZcg4+N6SYKEfJ+1K7HZ9Us0o3vDXvf3Jk=;
	b=u0ay2v8SLMsADe5GdpBuTxbFuGTx/ZqQghK9SL+UaZX4PLe36OhwaELFrNqioZVl1WHr
	 HalCYkrIs8xefH4iubvqjDv5r9A898W6UhUOZ+40PeTblr+9VK4KMfTV4yYChvP4trttv
	 6Kj1iRvCqZIxpwaMIGgaExvd19ls6ACQtBNtnf8tkI6CBWMb7EraNtMz9DqPVGabRNMr1
	 Uuhaj3D19jObgveaXXtc8TY6DZS8bUWsA/ZNTXdXP7zlBTl8ydI+X7WlKvfLw9LvqKtYk
	 zHUDdeC1eHC4TYk9jJp3D0+Dy9upVS678q0qC6092gbnWPRxvCnUegIMOpr+yJYosCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5a+OJSxE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.52
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AABC606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AABC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5a+OJSxE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rc8qjccnWQwixzjMlaybsu5h2EDSMbsPbT2sC+CNlqV/YiZ8e4FfQgPGAGEXY6S62CKEFL1ftmoMKSuvZmalSFNpYz5G86eqtldfOmphh9EeYEJzw83lPRhZeLPcv/IO7ItsqAmCR3cH+Ca6S2m9tevrZIDnWIyV9Xd2CjIWuYj5E6/CGCVWpgt5zETOIChcAGz4cfBdPM4Mtt79KHv6m0FD90cDqIBw4tiGkU6tVBIRBknRMD11bjbbxQTdCHPnSzntrvEFgpND1/ACUzToFVuBx/oItc1E5HgHqsHzABK11o6xoKR7uKPTnuuKCFFWbR2HXyDwAooSgUxwkNolIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ+dOgW15KZcg4+N6SYKEfJ+1K7HZ9Us0o3vDXvf3Jk=;
 b=ubGzADsROL9iStADodj218c9Ifc5Cp1i3mtvD1Ovf5W+YU+3e4tUg7h6BHrRAp6I2IlpPYQo52X8BhtDrpE4mcaVPwgbBOGP5ORcl+aOzKM1meALXr5VKBR+VjEJ2KPbTMjB6S/nsTdoBOqPlS9y2rUKS1ICCUHKD512zSw5b8VgOvmd0W3RUtNcTbA1Xjd0w+Dk15ci020pHXbFhQfM1JXzJxbN5/wqlI7XNk9PUJfn9rUOaK679E4gptZen/QplI1OHSnD2NQa3K0nP05/WClTYwxGgo9lp4ZJZwmp6N5va7IERc9q6/AyoeJyXZA4Zmvk4W3oO7UP4rlj7OLulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ+dOgW15KZcg4+N6SYKEfJ+1K7HZ9Us0o3vDXvf3Jk=;
 b=5a+OJSxE4jvmF6/HGDeVmmoamDI2k0RK3pgTorsCTCRroQ3daYlAClYWYzDky2W2ePv+Mw40e+KJepZvTrgBQp5DhtKHH/21l1kZKIRYbyRmLBPfH1xwhUrvL+OY2uFpExLPzBCbCeHcB/tv1SpNBoMhbht36TRK6BQLg7LVzPw=
Received: from BN9P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::9)
 by DM4PR12MB8524.namprd12.prod.outlook.com (2603:10b6:8:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 08:51:33 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::65) by BN9P223CA0004.outlook.office365.com
 (2603:10b6:408:10b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 08:51:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:29 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:26 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 04/11] platform/x86/amd/hsmp: Move is_get_msg() before validate_message()
Date: Thu, 19 Nov 2026 08:50:38 +0000
Message-ID: <19ccb688de83f958afb5e11cef28d6da3903301c.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|DM4PR12MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b50123-b4ed-40a6-a03e-08df461a4d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|6133799003|22082099003|18002099003|261009223027099003|56012099006|5023799004|10067099003|261102123227099003|261026121527099003|261021123027099003|11063799006|261102130727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	KzcbE6hNNIiR8E5xQjvJcMoqTmitL/Uq3ee1rDKZn0dLWA3YY6jYQm8+NFIooaR8g6gzsp+Xqy2p3d1BD2X7Qs8V5dbJPfZ/W221R4cqXh/OfvkkvkR4SelfoAtJwpFGR5NjFsnoDt794Xi2jL5tJwLa79R5pk9kgkxoXRk6aaJ5ZU2De6sQ1TheUVsA6TkrnYrIPNPSLonSbqm5h/PIJ/SqyQAC1AAd2ddk/xvU8cycV2zzuGjyAPx5q4TTNoqSp5w/LPeb2HsWKsqG75w8W/I/S6WMUEVHCt1o8Q1KEdEvIob1Ho/mWeq8/iD227BUhcDR8f/GHpjR1cXAuNMs8LR8g4ho94EAQQ1nD2N7a7FTE/ESBkH6qF2hx0sf/VonxYqs+yyNELmpov6bvbhz99pa7EQQYEh0Ks3ULVrcu8I27tPqUUfuBEErdGwAypwzdO1XBkH1v0lsXseLBJiuP63VZhdI/tOyQQ52NDYZs5HPDT3X+z1Q9h9Dpqtia7wbBhUB6ydexIrpDQSKD3abqSOaHSgXJMPAFM9dSWKRio9nv8kE149q39ojjWVyBZ1lrQ3a1soTLxb2ykDIwOy+3csD+rLo0ihhEW2d33qmzJLLpFyKQhKV2qeCiWqfFdPfHHv6/f4Giruj2L9UVO3MEJDw6/DrC4JYz2yU+KbBOyRbYFExsZ3kK3Y6PMPi+A2rXy8WpEyqTdseDRKj543HQw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(261009223027099003)(56012099006)(5023799004)(10067099003)(261102123227099003)(261026121527099003)(261021123027099003)(11063799006)(261102130727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XcTlnlrTftwHi834VltsNM072biTtUY3GXmXJHspBkRHf1WuW6Q9CjE9sl4VrPafqRmQ4xhIc8nikYnwMmyh+Wlvh9tETO0lKCJ9UsBDxtL0WSdtnQg/FXIHQz4u1OIbcNwtaH/ftihuUwN82kj6UPsHuExhXuXa6Z8E+S7cfUlHRPcOjCKjzZdd5TvZUvnQYq0OGMaa9iRuykoTPklUEMGoVjVNcYNgR0OvlDDosiyCaNctI/KGpCcvCv6aevwTFy1eiRE9H/f7huOTeWHMTJDwX/jdOPFloSP9/8fGDPShjvOdg+iDikj64GZJNEfvBCYubUBetu9uSk7mhdbkJfIfzO2aWM7MtiilfauvyIRx78qxZPVTl7BWyy9Fi5HRrQC0XtB6p/d7B27DJuRp9vok88ewdf7unH3k+rneYMi1D7UU7q4ml3dNlxmckWH6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:29.0611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b50123-b4ed-40a6-a03e-08df461a4d5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8524

From: Suma Hegde <Suma.Hegde@amd.com>

An upcoming patch invokes is_get_msg() inside validate_message().

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- None.

 drivers/platform/x86/amd/hsmp/hsmp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 3a8b8697e62b9..ad5b3fde54caf 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -277,6 +277,17 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	return ret;
 }
 
+static bool is_get_msg(const struct hsmp_msg_desc *desc, struct hsmp_message *msg)
+{
+	if (desc->type == HSMP_GET)
+		return true;
+
+	if (desc->type == HSMP_SET_GET && (msg->args[0] & CHECK_GET_BIT))
+		return true;
+
+	return false;
+}
+
 static int validate_message(struct hsmp_message *msg)
 {
 	const struct hsmp_plat_desc *plat_desc = hsmp_desc();
@@ -449,17 +460,6 @@ int hsmp_test(u16 sock_ind, u32 value)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_test, "AMD_HSMP");
 
-static bool is_get_msg(const struct hsmp_msg_desc *desc, struct hsmp_message *msg)
-{
-	if (desc->type == HSMP_GET)
-		return true;
-
-	if (desc->type == HSMP_SET_GET && (msg->args[0] & CHECK_GET_BIT))
-		return true;
-
-	return false;
-}
-
 static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
-- 
2.34.1

