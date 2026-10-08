Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010037.outbound.protection.outlook.com [52.101.193.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D3481FCF
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451827; cv=fail; b=P4ueC7ckN+1P8uRqy5k+XtHD56BIhEBXusgMwEZ9ffnP1I50fT8uF7L+keuhvAofhw/MpV4o4ypz1kOjNh6gC6LQvUrF5p4cY948b/gEsAzZkN5KsESaws5gQwy9CVXkBAy2kiBneK5XBgppVHOFHkmk7KYmcJnsgnR9yMc+YAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451827; c=relaxed/simple;
	bh=JtLYFRtERbHTkb3mMNBXZNg2JBkFa619I5M/FwnhDDQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxs+CtMMirsNaM8lRGw6z1kQ7xJtY5NXE4Gc1RSzEspRZO9K23NQCDroa1yYhke4ew0HB+wJsVwHqL2SZcbWkqm0ahp+v2uZgFOVGtC9I2bohQ970V3qP1IUza0SHMXixou6rFuIf86XDBzUB9tWXGbwRYA2fOsjjddpEhXzTPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MQUl9IFt; arc=fail smtp.client-ip=52.101.193.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MQUl9IFt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOezfgaAxLa0zAhw2z43dcHrqrl567L2kZHoFKDLxYb9MiGwFpwI974i7NHwBno16TlgKDqxEYeFxM5db7Q9VBj/16dRmXqJkM9fffI38+Sq0b5UNNwX9rTmmkjoprzEkvRPwy/caMUGr8X6jfyMuhLm4Y7THpjbiLkUCdQ7k9ygeKiHhklY2HFw9HJAL5bSu/2VdjTABOmQX7ur6ddRc9xGp6QfuTIFU7rB3PNchr7JjxDf6uvTR1/mCnplh6v/S7zGmGaC7H/ZLYMwn3+9t6YcAMDUEqHJMtBVNadka3ooWZW6Jy46tbnFzfza7xR8LMUuhKYDTIZc0xKQsmOH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh1zzrmlbarGDg1plPtIf+XsgpAPcKDB7rOQGX4kOyg=;
 b=xEZ+spBMnOj+ER9oK5o3i3acrJI7Tkz6x+mKgj684njNYCqzc+ioHoxKt5N3/KR84Yr8tIYdBiU9C8OiMFPt3X3+J4JXyi5aKCr8suOxCYX6Kn7U4KW29UxUQspXjXBTW8tf2EY9qLK/kdZaTGpRMNRChxpoKjME3M2HdGHrNyjyd45ZkJQLRKiSbxDahc0+jOnVF62FHJbJaRQc5ss0HbM3aySMQNpPTQVMzb9e6L3z1TTz61CV2YpiV6lL+yAwTrhvupBxSqCAEDdIFKmbLcv8OSzF752GkOVngRrQsQL35XpnCkXLn/eDPN8aXXc11jByLrqfppl4c1a8yOHZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh1zzrmlbarGDg1plPtIf+XsgpAPcKDB7rOQGX4kOyg=;
 b=MQUl9IFtbtGkB1OYU2Zrk88jsnjnc8tad7VLGmeAsQbZF3kVVywDcdB/80vXlixvZmNAdUSBmsokUD9Fc9XH/G0hOLw1a9mK69C/7rXAscCTs/VuPZ48NPxqg3ea3xRgS42n7AWM2siAWxSXGQL6Ul4RATooo8mzKU9f7dcC12c=
Received: from BN9PR03CA0509.namprd03.prod.outlook.com (2603:10b6:408:130::34)
 by SA1PR12MB7320.namprd12.prod.outlook.com (2603:10b6:806:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 09:30:14 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::6) by BN9PR03CA0509.outlook.office365.com
 (2603:10b6:408:130::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 09:30:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:13 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:06 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 04/11] platform/x86/amd/hsmp: Move is_get_msg() before validate_message()
Date: Thu, 8 Oct 2026 09:29:32 +0000
Message-ID: <81f0b76b6756585befb7ed739a0b514e98f534d3.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|SA1PR12MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb0fcc3-3422-4b11-5efb-08df251ec1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|22082099003|5023799004|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	jGAYhflMmC3iCkVveM0H+GfdoAEBufG2OPkTsKXymfi9YU4LK6j0dZ1wgW342ufG6sTSSpq+gSk1yi2yY5Lpu7JNasonHdemg/B16qWc1xjs38MqoHxAd4QEn4DXqHfXiIsaHHId9Djph3C9KWAnLMptyNUg3WCk6ntwlz35Nlo6BaovalUi2GdngePXJLtgWzDgbVtAcW9EoYhiWumS9hUwjCBKwmnoLyFAa0srSnQB1O0gEe6fsIFNHDhgHnry2H//cZDvOdY0JVDQ0Bu8KRT3oPG/6wQsTzvyJRfXXzDuryeAiOHj6V+nlpSsKBFlNSY6t+0kP3KFr7HdhsShKqAnvTedH1dkTNw5dpAbs0GtYCGJqXoL9cjWyOjDYc7eEszAVobW1qSKS+EQOI6uqVqllYRK+WnX+r4CZrStrCNrPHs7GlK+P3wxK+5KTqVQ6ck49FXhkNVkvxUHiHqPvkJFGZP9moMEERUivwage2pEsuEE8HgVNSemHqEfPerc5H+xveyEWjD/ffvNFoR1pa9R0gfBodZSty6VMIDyQIxGDzrqVmREzVTIewy/xMT9KQcVBAjzvp/OloEaSDl1MY2RiaZgRLmwI2uxy0xk1aC7+Sdkr9Pt4ZfxG9QgabtJdH88mWeis227Pb4P5zkavfAtE9tElpcCI+3H/D47rPEOF1uZMoKJE+jzSgG4cedp5ZmQcVxoMcW0kKRezY9HWQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(5023799004)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UBhKbhP3wdVjYvr1JMMucMvgDD6TkPO2J/acqGBtgOLdXcY8j54hy3vZOPLM5YDzK4jghTVJAQvvuvp+1LZOflLDz/FjFdH8OQlHW+Yf5ylSFdkXPVn5tH6sTI4o0QmJCgethQmdAWx/yOV83Fc0jXEMyGEAmut3rQxU6vKJViXOygPf5xn1RtlbbxxzYAUhF4F1EnvZmoOBRPPX37Q0SLPnYudtRd5P6sNAYuumPLifdpfMQT8oJRKQKAEQ9S44g3Vw6XqSJNTkGJ3ZuexRAEREEd0vvoKk8PcVJzIrAL3YDxTIlczeoTou0T1nXaN0+GzwILS7ziPhu/w+q23mderVYMjitioeUcd2IQsY6uDVPsMBkw2zDTEsf1Ip31akGeBmwULqZG5qA8H5hNEeHWm4cjan1y5eJcNtNmYQlXoqD4f70DJO4nGNBGyAgJk5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:13.7598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb0fcc3-3422-4b11-5efb-08df251ec1a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7320

From: Suma Hegde <Suma.Hegde@amd.com>

An upcoming patch invokes is_get_msg() inside validate_message().

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 607e77350410e..788a49404875a 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -270,6 +270,17 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
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
@@ -442,17 +453,6 @@ int hsmp_test(u16 sock_ind, u32 value)
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

