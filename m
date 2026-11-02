Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604063;
	b=0iaY2ODZ9rN+Sp5c0yUAF76FFuo9Jd7fxJwWUNCFdJhu5oSEOQdgJPsmpBap7TKikCWt
	 bNeRSfxTBb7a7rHICMmY/KcI6MNBW9zqgIN/SjuP2GNXbgLPINUwhHObEMGJknkqqffBY
	 I6IpWk7V/Tj8jx4np6MXxHfpgLA6a+G+DcnXBjEcGnLLe4Llw9ve46/nXLndstJ7UswFb
	 iIgksqiQUYhijRn22P7OdiQrg49KMmt+FGMGrMui0JVvsPen4Tuar4e7sWbQGzmceaXkc
	 hizUnmJp69DvzJ37eDsmJ3m0D5HBhaxasQ5wn6HqbdIQmndMOV+0DG31m8vqotGeStw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604063;
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
	bh=ddS/Tz4ui/XrUkczhXsYBxZQzKfVkh59rbncSAsoXas=;
	b=Hpvc4HN06gvLxt+4Ur8ZZmXL2kGuY62nvWRtywIh8tV2v1h4nNl6QeTSmCdnhE5n+q7s
	 61I1I3SX3viW5EUYGXIrdJPdO4WA+DG+aYTFjmwncqHeXPP0yVae8R2XcH0EQm9XzYHr3
	 wIgtHP820fCwytD+BW4SkI3/IkMHd7hP2X2J5iBGbTCll5asqVmHPNTIMXnG8ibF9YQoN
	 f+0+zkezdpmuUCvAEggvgSD41Dipd6Iv3jZ+5XT77OZgex/R8eouatMWidb5NZL9SqFmW
	 7sKmV0QfcePU9AUQ2rV2yMGahuws6GZFnzaoKbWd95kyFkn3vcjvr1QfcUnjqVau+AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nKoaRHCi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.49
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4892606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4892606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nKoaRHCi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDEYMwv2NN9WOpbmmuPaOVbsbIXu4vIgiHYeTrqlOoUu5M/xQWccuBwBBw8vtTov56HxmJCPGDpTz+tyHNMVK3ORwz3gbufWDMyncMU7bJBQSb3SgSlaNOukMO9S8pyFS6wNPHCXCK+0unRtR+U6agK5G3nWsdO++8jZN6OfuXW62HShH3KlksgPII5FYCR5pbM6QB+Lhzn5xYh0VjYUOOMM9KJTsDTRdsLA6lyobWhJR70pw3tUFkTXYBRZDOCfIJ4jmYK52+ICS2vLNQFNwIyTcOOAiu2L0VqMF/rmTOJ4Ldq/FYv141pImxxIbbGkNSXQ2QBr20YKWO0Bj+ev0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddS/Tz4ui/XrUkczhXsYBxZQzKfVkh59rbncSAsoXas=;
 b=N52vTYhyDgn+6FGhmn7PPHPlX/LnciMjSuaczQqGjRHWeDNLrkT/pEN6K6TW7I8wx6vfpmEkeqbPYK8rM6C3ykP1TVYLhOpzMsXG4dLb0DwVBaZq8dhJydF1XK5AcqElFlJjaBnIVFVw4mTqLqNSO7gzIS1YOHknCs2r0DZwXQF0kHvmo6Q+F72khSsg/13IQdxlGxop/YYl4RVSqohMMSMrRgj+Mj8es5HFPoUsvlBX848dfPTkS+8Rq1Ca9SkMUmCVv+wcNzRDvoWW6zg8cqwN+SRF+Z/WaAXOe5Lswhc35+KQDSIYfcwYWVt3KkEOxDK7wSsy9UQ6o2PfSSDICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddS/Tz4ui/XrUkczhXsYBxZQzKfVkh59rbncSAsoXas=;
 b=nKoaRHCikkuwrHHZIZMqfTTVofDEdiHNl18j6ERbdPMx1JiAhPeYuCLs2ZUfVfyEcI10E7j0+52FIXJbbK+HmK6+vSdCeJbHQ+nEFaFYfgH/sqVh8HvrCbGqmkg7rUzpCid3xlqKFiBLH1vC6jTXuZrmLcF47wZBGVb+hRVYiuA=
Received: from SJ0PR05CA0165.namprd05.prod.outlook.com (2603:10b6:a03:339::20)
 by PH7PR12MB9150.namprd12.prod.outlook.com (2603:10b6:510:2eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:59 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::7) by SJ0PR05CA0165.outlook.office365.com
 (2603:10b6:a03:339::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.6 via Frontend Transport; Mon, 2
 Nov 2026 07:20:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:56 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:54 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 21/26] platform/x86/amd/hsmp: Quiet probe-time firmware status dmesg spam
Date: Mon, 2 Nov 2026 07:19:19 +0000
Message-ID: <66f25f3031c80809f7f8a299f8508f660ccdad56.1793602634.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|PH7PR12MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c5f8650-9612-4bcd-7f38-08df38b1d68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	H9m4AUp2Wx3ke13Wm43rk2Z+Ml8vxtYoWIx6DLE1R1TKLGckQhakggHBFDZM0/F8vYHw30vM0KNnaCs//qLUXE/y68SkcppRVOOLUOLcNxrV7MUF+NgwHcdk5D/CCLp0Zwa7p44aNpRwJnJzrb6hCOJBYN3aMV9PluqedzssYE1WDTGuuaQMNEpmS5G9dDTQ6md8vXRqYz3WHnt4Po5ugJMBjMKfKYpV7ZfiQ/Ocrohxul/sn8iTI6QIDsmXClv/1vm/VzLupXVlS7nKmGg70E65z4xNlkPUOOws6zyGj535ufbWPG4RTXgp18MvveWlUTvBPfOpRJ/YBhlYDm3OmF9YfyccrXgy4JeBE6flj2fBNRB8APzfNjzx9LJjRium5+e3gRuaLfKst0hcXXugyOLkweDJyzPRfk2SCJBN76zWweY0m8ncPLTGchuHzdtV6Q+MF9TnYl/GbBs6O7K0gxVbrr5Dj2f+gMdT2Hbrsp0G3INx17go+B7vV4mI3CJPJMonUtOlhTmg2lR6GQCxiKY9AmdZd00up3SO9qusfQORrV0U7byjy9jotrBfqBYAiqROHZmw79JDtF9grDfOdd2bB9cWqFgQl9v8guktQSgTjRKR2JlauuDTcvfqYIB7SWS/2fNdg7ZPRtkVGNW+XyLOJibuSrvT6dAC/WARr5JYEqmh8mjcBfrw/X2tAgiF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JCsagyAPQcnQAqf8FOdj3RDynTBVb5fkHYxkPh6hRpb3AGmnn2KKgnwBsZ1rKgDXKrlKVvxCBjUpwXXwkMsfkpm1BXh5R7rM5d5dMta7FfvIzGk+x5ZLQBNgMYxr2hR86u7QL+d12H1HV7iCeG97DsDoNn6sPIFknffjCEYjnnjOykJYNVhDkNuo9qQM+O6/oD2m/fWJaHrH9TlxVR35yjS0kwoXi+4yx14Wiv5OAjJF9oa328YvCBWrTzXhVrDpahDIDHLPdgaD3vbF8B9uGmIDs091109lUNusx3EI22VNncsIG0zA/BYwkmHFtmTUnOkz+jFvVF+h17lVFXuni23nAatrULvKGSK4ajZGXbgM22ItvBY9o6lOSVFwQ+XbKDwyEmDMo8TKxWLwiGWIyUMNZUbaW+jd2OSw3+Hu2JPyrNCsvNnmIUEsLVEL1/vM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:56.8447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5f8650-9612-4bcd-7f38-08df38b1d68b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9150

Probing for hardware that may legitimately be absent (DIMMs, IO/xGMI
links) causes __hsmp_send_message()
to log a dev_err() for every expected miss, flooding dmesg on module
load.

Add a stateless hsmp_send_message_quiet() entry point alongside the
existing hsmp_send_message(): both funnel into a shared locked helper
that passes an explicit quiet bool into __hsmp_send_message(). Firmware
status failures then use hsmp_status_err() to pick dev_dbg() instead of
dev_err() for expected misses. hsmp_send_message()'s signature, and the
UAPI struct hsmp_message, are both unchanged.

DIMM, io_bw, and xgmi_bw probe paths use the quiet locked send.
Transport-level register errors stay as unconditional dev_err().

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 arch/x86/include/asm/amd/hsmp.h      |  7 +++
 drivers/platform/x86/amd/hsmp/hsmp.c | 85 +++++++++++++++++++++-------
 2 files changed, 72 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/amd/hsmp.h b/arch/x86/include/asm/amd/hsmp.h
index 2137f62853ed2..b867130e6a8a9 100644
--- a/arch/x86/include/asm/amd/hsmp.h
+++ b/arch/x86/include/asm/amd/hsmp.h
@@ -6,11 +6,18 @@
 
 #if IS_ENABLED(CONFIG_AMD_HSMP)
 int hsmp_send_message(struct hsmp_message *msg);
+/* Same as hsmp_send_message(), but logs probe/discovery misses at dev_dbg(). */
+int hsmp_send_message_quiet(struct hsmp_message *msg);
 #else
 static inline int hsmp_send_message(struct hsmp_message *msg)
 {
 	return -ENODEV;
 }
+
+static inline int hsmp_send_message_quiet(struct hsmp_message *msg)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index d6a4a79118e80..86961fe06ea56 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -159,7 +159,24 @@ EXPORT_SYMBOL_NS_GPL(hsmp_sock_rwsem, "AMD_HSMP");
  * Returns 0 for success and populates the requested number of arguments.
  * Returns a negative error code for failure.
  */
-static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *msg)
+
+/*
+ * Many of these firmware status codes just mean "not applicable here"
+ * (e.g. probing for an absent DIMM/link). hsmp_send_message_quiet() /
+ * locked quiet callers doing that kind of discovery get the miss logged
+ * at dev_dbg() instead of dev_err(), avoiding dmesg spam for an expected
+ * outcome.
+ */
+#define hsmp_status_err(sock, quiet, fmt, ...)				\
+	do {								\
+		if (quiet)						\
+			dev_dbg((sock)->dev, fmt, ##__VA_ARGS__);	\
+		else							\
+			dev_err((sock)->dev, fmt, ##__VA_ARGS__);	\
+	} while (0)
+
+static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *msg,
+			       bool quiet)
 {
 	struct hsmp_mbaddr_info *mbinfo;
 	unsigned long timeout, short_sleep;
@@ -226,28 +243,34 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
-		dev_err(sock->dev, "Message ID 0x%X failure : SMU timeout (status = 0x%X)\n",
-			msg->msg_id, mbox_status);
+		hsmp_status_err(sock, quiet,
+				"Message ID 0x%X failure : SMU timeout (status = 0x%X)\n",
+				msg->msg_id, mbox_status);
 		return -ETIMEDOUT;
 	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
-		dev_err(sock->dev, "Message ID 0x%X failure : Invalid message (status = 0x%X)\n",
-			msg->msg_id, mbox_status);
+		hsmp_status_err(sock, quiet,
+				"Message ID 0x%X failure : Invalid message (status = 0x%X)\n",
+				msg->msg_id, mbox_status);
 		return -ENOMSG;
 	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_INPUT)) {
-		dev_err(sock->dev, "Message ID 0x%X failure : Invalid arguments (status = 0x%X)\n",
-			msg->msg_id, mbox_status);
+		hsmp_status_err(sock, quiet,
+				"Message ID 0x%X failure : Invalid arguments (status = 0x%X)\n",
+				msg->msg_id, mbox_status);
 		return -EINVAL;
 	} else if (unlikely(mbox_status == HSMP_ERR_PREREQ_NOT_SATISFIED)) {
-		dev_err(sock->dev, "Message ID 0x%X failure : Prerequisite not satisfied (status = 0x%X)\n",
-			msg->msg_id, mbox_status);
+		hsmp_status_err(sock, quiet,
+				"Message ID 0x%X failure : Prerequisite not satisfied (status = 0x%X)\n",
+				msg->msg_id, mbox_status);
 		return -EREMOTEIO;
 	} else if (unlikely(mbox_status == HSMP_ERR_SMU_BUSY)) {
-		dev_err(sock->dev, "Message ID 0x%X failure : SMU BUSY (status = 0x%X)\n",
-			msg->msg_id, mbox_status);
+		hsmp_status_err(sock, quiet,
+				"Message ID 0x%X failure : SMU BUSY (status = 0x%X)\n",
+				msg->msg_id, mbox_status);
 		return -EBUSY;
 	} else if (unlikely(mbox_status != HSMP_STATUS_OK)) {
-		dev_err(sock->dev, "Message ID 0x%X unknown failure (status = 0x%X)\n",
-			msg->msg_id, mbox_status);
+		hsmp_status_err(sock, quiet,
+				"Message ID 0x%X unknown failure (status = 0x%X)\n",
+				msg->msg_id, mbox_status);
 		return -EIO;
 	}
 
@@ -353,7 +376,7 @@ static int validate_message(struct hsmp_message *msg)
  * senders run under the write lock taken by probe. Holding it here serializes
  * every message against socket teardown, which also holds it for write.
  */
-static int hsmp_send_message_locked(struct hsmp_message *msg)
+static int hsmp_send_message_common_locked(struct hsmp_message *msg, bool quiet)
 {
 	struct hsmp_socket *sock;
 	unsigned int sock_ind;
@@ -398,13 +421,23 @@ static int hsmp_send_message_locked(struct hsmp_message *msg)
 	if (ret < 0)
 		return ret;
 
-	ret = __hsmp_send_message(sock, msg);
+	ret = __hsmp_send_message(sock, msg, quiet);
 
 	up(&sock->hsmp_sem);
 
 	return ret;
 }
 
+static int hsmp_send_message_locked(struct hsmp_message *msg)
+{
+	return hsmp_send_message_common_locked(msg, false);
+}
+
+static int hsmp_send_message_locked_quiet(struct hsmp_message *msg)
+{
+	return hsmp_send_message_common_locked(msg, true);
+}
+
 int hsmp_send_message(struct hsmp_message *msg)
 {
 	/*
@@ -415,10 +448,22 @@ int hsmp_send_message(struct hsmp_message *msg)
 	 */
 	guard(rwsem_read)(&hsmp_sock_rwsem);
 
-	return hsmp_send_message_locked(msg);
+	return hsmp_send_message_common_locked(msg, false);
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
 
+/*
+ * Same as hsmp_send_message(), but used by in-driver probe/discovery
+ * callers so expected misses are logged at dev_dbg() instead of dev_err().
+ */
+int hsmp_send_message_quiet(struct hsmp_message *msg)
+{
+	guard(rwsem_read)(&hsmp_sock_rwsem);
+
+	return hsmp_send_message_common_locked(msg, true);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message_quiet, "AMD_HSMP");
+
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args)
 {
 	struct hsmp_message msg = {};
@@ -920,7 +965,7 @@ static void hsmp_scan_dimm_range(struct hsmp_socket *sock, u32 msg_id, u32 *mask
 		msg.num_args = 1;
 		msg.response_sz = 1;
 		msg.args[0] = addr;
-		if (!hsmp_send_message_locked(&msg))
+		if (!hsmp_send_message_locked_quiet(&msg))
 			*mask |= BIT(addr - 0x80);
 	}
 
@@ -935,7 +980,7 @@ static void hsmp_scan_dimm_range(struct hsmp_socket *sock, u32 msg_id, u32 *mask
 		msg.num_args = 1;
 		msg.response_sz = 1;
 		msg.args[0] = addr;
-		if (!hsmp_send_message_locked(&msg))
+		if (!hsmp_send_message_locked_quiet(&msg))
 			*mask |= BIT(addr - 0x90 + 16);
 	}
 }
@@ -1066,7 +1111,7 @@ void hsmp_scan_io_bw(struct hsmp_socket *sock)
 		msg.response_sz = 1;
 		/* Aggregate bandwidth type in [2:0], link encoding in [15:8]. */
 		msg.args[0] = 1 | ((u32)enc << 8);
-		if (!hsmp_send_message_locked(&msg))
+		if (!hsmp_send_message_locked_quiet(&msg))
 			sock->io_bw_valid |= BIT(i);
 	}
 }
@@ -1127,7 +1172,7 @@ void hsmp_scan_xgmi_bw(struct hsmp_socket *sock)
 		msg.sock_ind = sock->sock_ind;
 		msg.num_args = 1;
 		msg.response_sz = 1;
-		if (!hsmp_send_message_locked(&msg))
+		if (!hsmp_send_message_locked_quiet(&msg))
 			sock->xgmi_bw_valid |= BIT_ULL(i);
 	}
 }
-- 
2.34.1

