Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604026;
	b=xkiH7EnRbj0GRQlYc5WtZnF/p0dBUQm/bpD/cY7xtFM4dJwsfSdHpnHUZQO0MaR9en7P
	 DC34xHyhzJN1lC+JgA3kvTgrYnpbDZh/M+6Ti2FKDHt5+O7+EDx2EscA/PRA77kAnuNCc
	 XAF/MFMzA4zxryaRAvwxyEdHaMlT23Ag0FKpxlP9jy6xtO0grerbnsxtxJr9lQvsxJ3K5
	 VKUCZ3wEsQZDnZF9HKHdKUXHMHB3fRe3BWygOJj/OcaBP4h/g/e7vCCwJQiFN9BcEwNkR
	 Gusus2CbU0ad78OSC5ycu6e2C3o+VoQo18LoO3HI3LdJeE5Uy5+ppQwcgZtN5ObC5zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604026;
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
	bh=wfv2R/9uKTTvlJouDZBMYkGwEyaPTE2lfrcxnXNZBYM=;
	b=R0+QWdcwCFTp1+sZkPD6ygtjErlfCQvRkY0GMc1zxkRkyNdWGE4gsUtn2jXZArcOCPjO
	 EmQJ7gbxl86Uuxxcjku8Of++v6JgfFnMkK2Q0WQ1UtIc+/S3Ci3aA5SwuL/5GzzLl0WvL
	 R0dzeNqvNWcoCcYgh/0XvLKWtJYWjbR7Jv9CS8FRa0MkgBRhl/qKfpzskpRPXiVor+Fcm
	 iviKfDrc7/9gskjhGQLQ3uaTmR3uQfzIA9vn3K8mDE8toFWx4I63kt3ccPltu+j0w827e
	 XUJgtVoPix9NPzAWb6Z5B2YDxJkuehrgNy7buJpgbeS6xGqubPbkbLz38uDiWkHMVFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZmN4wk6P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.52
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227F8606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 227F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZmN4wk6P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP0/PViKcwtSz9FmHkUKxii5RBFFm3KAvsPw30Q/42zh2rB7bJcDd08+Ytd6Ta6I0bDPVqvmAHRSW/+HR8Qy5orUybLVwGQl2eouNcbui/qdamfv/+03tk0KCCJHKwRJBoMM496+z/Bm3tjJfYtoYE0yNDQBXFjRzet8f8ud3lLOVpu/srkXb5Qnzm2rv5XN1YgpN9vZpYZXXvI8vJESx8YRpKD2nx56wyCt0KPPuiDic0SxUMl67sQF28eUk6402HFaVv2PAkmQ8msGKOk8Tp93cE4dH8R26W6WAntPuVY+m9tYVXXTguD2dWgcai5XOsjgxfq/b/+oKerW2U2a5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfv2R/9uKTTvlJouDZBMYkGwEyaPTE2lfrcxnXNZBYM=;
 b=nZk3n7Iy6TX1p9vd4KBHMHfhyiAinz9mhaFug0XgzaNDPrBkLSeO4vdApaO3LaURu3Df9qj8jr7jk3aggqfoFkLDEIBCWK5YZBUdecIFgIka2lqpjxjrsXzVQJeWHvCOvY04IFGZot8fQXrdf051DA/0agLvoo0UrMyC8py3LnHjTHK/vCD/77NUChsj+xZp0qXlbGR7Or9CzbfZal3ky3Zn+SrAaoN0IUQnPwDwOcsnrjyc8/I5pEwUTkVH9i/rt6t4erxLE2NGXlSKa6zxoUD745TVRw3EG1CCfFESmzbVC8mqUUmZZLE+x/mIthuJ3+3YSCiVe+AdQ0HJ4TjPpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfv2R/9uKTTvlJouDZBMYkGwEyaPTE2lfrcxnXNZBYM=;
 b=ZmN4wk6P8aiCpMqSm5Zi2Trn/GWfwXeEX5rDr2Cjc3vKrkRTX3OF4jAZXnlxd7twv6uLiZO8TymnQmkOggZLxOQXGMQzhXHJniXjvJ/yX//H5NZZ29Bb6rfJSf0gJvCP4dgAm/Q6ZjIOkhFsbrnSIZouG15kCD2d2RsqGDht45s=
Received: from SJ0PR13CA0093.namprd13.prod.outlook.com (2603:10b6:a03:2c5::8)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:21 +0000
Received: from SJ1PEPF000037A2.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::15) by SJ0PR13CA0093.outlook.office365.com
 (2603:10b6:a03:2c5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 07:20:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A2.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:20 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:18 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 04/26] platform/x86/amd/hsmp: Treat socket_power_limit as firmware-clamped
Date: Mon, 2 Nov 2026 07:19:02 +0000
Message-ID: <9aa236c65a2bcd8ab1507138f9205a280e7457ed.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A2:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 123ce5fb-3552-4eb2-1ed3-08df38b1c11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|260925022911599003|260925021311599003|22082099003|18002099003|10067099003|56012099006|261009223027099003|261021123027099003|261021121427099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	F0dlmrr5FV9vXSoFKwEV+iQ4aA818kU+FdcGoobZsFZseaQQeAS3lgzJbkqgm+nPFO4q1KEyk+o2A6KW96BoId2o9DS2mPbowcqFeKcWdlIKQ9hjht/gh8lNdACMGZTYhbZrjg4za8GQrO8PLs6ma+YfDiZr9zQr6hXLU7NnZIIepTq4VBx8Hnn78KilkPF2S6BRbDMF6Ve/oS+BPqJXco/9WKv4ziWLEHmXSqwYwTLpPotNvQCsfLlVOeMecioIlAc8HGMgQO0a15/b30Z/9dLxkRP1+IlBkMJe20uSIgPYV2ZiayqQedgCm/Jtn9cXAYVYZhVvZWKezTbImGyCWHmQp3p9IjnrXvVHdDC+5NVDhGRvSLFGoRmBJSbTWuKewV1FuOw23OtpdpfTXXiICcdIsvScW7AA7GUR+HtM5bOvY9wEIOkCrQGAfmh9S1IQgQ9f6iyq4WzfP1878aSBaSmr2/IHpxvY3lCYHfvQmU/TbxsY8NuBAQbsN+lbEk8zX2zT2c6PLA1Obn3ZvdRlMbzzAy/6Zi2XqjwqcQfAF4f8tCc6P6VN8plpkB0iiU2S5Hgkullof6Fem4CxRiN2bp82KSTomlK2N0pvSipzJESfM3OutVodQ3ICoox8zy/g/pHHwvDz2b4ew/g2XIzLvlxn5wf72QVavmXoSX5BW5BjzI/Gm3qhMpFv/cfzH0w4CsAD1gpioiLiEKKCvNBC/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(260925022911599003)(260925021311599003)(22082099003)(18002099003)(10067099003)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3xuTkuDTI/6DyaQ+m2uP0gGaNJuQuEHsX2lNOhe/AU6wqf5Jr1vRu//m0vJoJ6hxmoNiXmCPl9fc5k5kXT99Q3P3/ML9vUdZLskopGBb7IreCZb+nFtlZm9nytzkBmSNosJZ4lFyVy+Ci9pHSuUnpKXMt6gbyvYDww7YOrAm2yhT5pjUj0/n2oIQFhtg+tVdYmQ/bcdGDwjTwgzTssCX8p1WLoEPpM1YE7OEbRgFyamlnPscIQXmxr7VVF3ixtNiqSjt79bkHOemuHcGYE8yR8gwj7kDF2TX7/jhA/KWFuNNwgwQSNT25mkprNmFfjQ9E4e9o5PW9EgdppLj2QMHW5S3aXtIW/As7EAvv6R2tyRQtT4SgtCESM9xPYaKgM/TyqpArsViL/4ehgkLjIsmE/Uc01KLP6RI+QfHdoxgvOANXCWD1u/t4qoPQVAC/cRf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:20.8709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 123ce5fb-3552-4eb2-1ed3-08df38b1c11a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949

Stop rejecting writes outside 1000-1000000 mW; the field is 32-bit and
firmware clamps to the platform range. Wire hsmp_err() into
hsmp_socket_power_limit_store() and update the documentation.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  4 ++--
 drivers/platform/x86/amd/hsmp/sysfs.c | 19 +++++++++++++++----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index a1964c5f12023..e14925896a3e9 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -115,8 +115,8 @@ write-only when the platform enables only that direction of the message.
 * pwr_current_active_freq_limit_source: Source of current active frequency
   limit.
 * socket_power: Average package power in mWatts (read only).
-* socket_power_limit: Current socket power limit in mWatts. Write accepts
-  1000-1000000 mWatts.
+* socket_power_limit: Current socket power limit in mWatts. A write is a
+  32-bit value. Firmware clamps it to the platform range.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 243acb9e37252..f7c90680a4ff6 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -582,12 +582,20 @@ ssize_t hsmp_socket_power_limit_store(struct device *dev,
 	int ret;
 
 	ret = kstrtoul(buf, 10, &val);
-	if (ret)
+	if (ret) {
+		hsmp_err(dev, "socket_power_limit", HSMP_ERR_PARSE, "unit=mW");
 		return ret;
+	}
 
-	/* Validate input: power limit should be reasonable (1W to 1000W in mWatts) */
-	if (val < 1000 || val > 1000000)
+	/*
+	 * Power limit is a 32-bit mW field; firmware clamps to the platform
+	 * min/max, so only reject values that overflow the field.
+	 */
+	if (val > U32_MAX) {
+		hsmp_err(dev, "socket_power_limit", HSMP_ERR_RANGE,
+			 "got=%lu valid=0-%u unit=mW", val, U32_MAX);
 		return -EINVAL;
+	}
 
 	/* Set socket power limit using HSMP_SET_SOCKET_POWER_LIMIT */
 	msg.msg_id = HSMP_SET_SOCKET_POWER_LIMIT;
@@ -597,8 +605,11 @@ ssize_t hsmp_socket_power_limit_store(struct device *dev,
 	msg.args[0] = val;  /* power limit value in mWatts */
 
 	ret = hsmp_send_message(&msg);
-	if (ret)
+	if (ret) {
+		hsmp_err(dev, "socket_power_limit", HSMP_ERR_HW,
+			 "val=%lu unit=mW rc=%d", val, ret);
 		return ret;
+	}
 
 	return count;
 }
-- 
2.34.1

