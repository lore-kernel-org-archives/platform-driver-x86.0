Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078307;
	b=uG1HdgCRE6thEDWKIwU8VueFG2wCuv4iclP9yQocjUacctGh7a820Gl/Atm0BBcwklko
	 J04gsgx0FNqIqgh6vob8tTts7gETnGtPwiFXjnhwMG20gBmYurSeYkIaA7fCz1el0ye0i
	 D3IRNxzBVw7SeEoNIaelKSE+1pslzkqNcyYpIsCTkej+iVBfr3MklrXkvlH3jAtV1Z0AF
	 /uoB9P65itEqEdYVNAldzxL4UH+ANN//gzXQMff5RH9f05o3uyj27YGGiFDlosh6iXZ/m
	 sa9amQUHywd9ADi4fJBLOcQqHB6PHRKUjhz12qMAesAYz9BT3LC2qmD69W0cm7bH5Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078307;
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
	bh=4mLA6T3MBKKV2bjEd9YbN6Gp0dNSHZQRrRXhiU1NNAw=;
	b=VIu/Wgbx0lxoN+wz+k58gsYfQHf9BlsgeH1MlBbkDtERBt/GaVJMKq/1dZpTeURfts3V
	 TlI8iV3uUbpUwl/Brs0xqot3BqeD0Tu9xe+xAY0d+sx/2/lWEO3LcMCaWwYBHV9ClNRns
	 9bNcjqlHxqaV9m0O06kImMav2ifalX7BpL/QS5RQQQ7iizx29ct9M7+kq1mCCz0szJLKv
	 hRZOZVEVB2sEY3rCAxmzAmDfuRwwDyDTt6SdB35ejRXyuoMrcDtMUxFyO7TaXaTEfZ1mP
	 9v98e0A9AMpQdMYGH6BdUEH8De5BSewB+bWkj7PzMI5ltagNCpLObJUA/Of5vneZdxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=W4Eyp89t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.52
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8668F606A325
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8668F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=W4Eyp89t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVMnH0CQ3YlgI9AERSqLGqJwX5iA83wRAEJTc3fM40IxMioNGgx0PVmWxTjY/oppTZPr3rUS2PqUgGRBJVNtMd+kav/S86YRZx0CpiRETSplyUBFEqukJ/bNPdl+4c427U/PbjQMf8b/z3YPuNocnIpZyJRP7snXBfSwX48sOKxCsU/yWghxg0dXJxUDWMl/IdsDNUBpzaYN3LWg7JF6w3fa3NQLzXcCfnNV8N3MyK0ZJt8UQnpHhZn9CTHckDTY1qEeMhQXKUS6PbjbIx52a5aqSzICzY2qMK2EFnFjL0eEa4criRtzluVqOn+k2LDmXkBmNm2FO5SnWeZ1rl9mAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mLA6T3MBKKV2bjEd9YbN6Gp0dNSHZQRrRXhiU1NNAw=;
 b=B2DabjhN7ZbOs8FaltT/ah6JaCFJc1JZTJRd1nl5Ls/lG5V+qw52gYRQ+lOtXamE3ivPgQmDQaU++MNAVva/V0F4kXGpTds+yr5zxoykRVww+G6nzq/nVAEeLwmInnNXjPQ0P0/wZ+veudFFPMIwvhO30yPPul2nMCnB93/4q/CmnqjNFDoe0G5RhR+qzYPKa+6hJXwJ+c9MnKJIYRVfu5W7lcqbJE9No2NMpNzhqFrTq793Q38Vtke6XnmjCmjokMQXEfETU7B5XKk8SyreDjOP+CpmZy0gDixogtKJitf86z2W+VZCcNs2HHI7tf2GtxwrMiBClUizOFMAuWoV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mLA6T3MBKKV2bjEd9YbN6Gp0dNSHZQRrRXhiU1NNAw=;
 b=W4Eyp89tf3C92bhac3JrWbRGlSll+JRsZYINr2MoZ+MCUUjaXQzoLVh4xiqekOK43njsdEM8oG1+wstPci17PG8d6FgD1zGPqP4S342io7JaikbOT73yEuaKOKRR0K7VSW5N4JY7OnIo4/qeCqiS8l+WExmi1qZDauJq0jOgFBs=
Received: from BN9P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::33)
 by CY1PR12MB9603.namprd12.prod.outlook.com (2603:10b6:930:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 08:51:42 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::99) by BN9P223CA0028.outlook.office365.com
 (2603:10b6:408:10b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 08:51:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:41 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:38 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 09/11] platform/x86/amd/hsmp: Populate the bitmaps dynamically for future platforms
Date: Thu, 19 Nov 2026 08:50:43 +0000
Message-ID: <965e6877565f8cf4c6b96910a8150667111a5898.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|CY1PR12MB9603:EE_
X-MS-Office365-Filtering-Correlation-Id: a2eb4c5b-94d5-4ea9-c775-08df461a54d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|261102123227099003|261102130727099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261028144727099003|11063799006|261026140227099003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	+FK5RNCNWdmvKjAOzxvw+jkc0t5qIlcDDQfNX6tLLZSDKtJ8B3Wpcdjj1LSVXvIcY/lhWZsPTv09Dirm4WzThbuES+UFtReUNCPVUu+czfEvTelE9EL18gy54SAB6cAm5AvMw8QRdyNwIltyqYvBKVF2Ah1iia6sRai8ZA69weuQMmG1g5bH0mnXdZZ/XjIam2VZesMPhPK5+OHFGMb74GhdjFVds4SuXTu9EgjSeYdf3bRBHUww6A09bDIVPvzqpcytLSZjOsiB0zkDMGHQUXMxZLMFHgkWAD7JVH2MIv4MMRnRvNO5fLPrK6wE64rDdArLx55T8w7pCtg8lgxGveRf0bM2UCovx3exqCsRhaCaT+n+92va0YJJe2crxvmZonF4RHum1mCOkzjTHiz1hTIi3rI+kzmtmDqp/+VhgZKPao/YKzWpGr4C7KkBNaHIAaV1mZidgqohklQlUdOXggnek+GWssRYWDLI/spp3mxw21C/xNaUi5kxT/1QJGBxCYLwH78LEx8DuHadd/5Owc0S2rUoZdZcZAGyWiW5a0TWgDxWiCSeSz17YZ2owhSNqF4e8SQpT+83+RYptlaueuoJam8G4lmtJbH2oLcGKzDdiHjtF4op2vPJQC7YNfGbBX5VrvAjPaT6w8hLv3Ju3SmWasQ9mSIGDzwdO22p2DJQ78rMed0Jq5IOYqTyPYRLs8SW92k1bLcs66K6Zzp6Nw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(261102123227099003)(261102130727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261028144727099003)(11063799006)(261026140227099003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dxmq2twdtUxRIFW5aO9pYYMQa8slaiFUWsh9F5mtssXCtAMgq1kzrP1qZzg0kan3UY38WxsWStb7cfyD2b+PoRzypZjxy77QU2IkvM5kgnoeGcEwQ8tZ6oJh7+vNYyGnRv9frKhVZvZo1fDKa5foplg7xrFOUPKwlBZKzOV59ygjFuFG9yPebVQ967iT5N6aU8a24I4STPw3JAyfJLmow0XKyJfq/KkMsOL5AVCPiWsY/xZq1gyNT07lu0brppAb08q0OOpqeGl/bOqJRtdYhvcQ5VbtTfLv5zwm5+y4m+W57D5jgQSL7FnItvGecOvFSvM5UqOKhCgJi944ADjA8LdU1GonPaN9YegUYt+yM50AUP3w3MDHAwA+1dsU5kd1c/qBGGlI4xak//3yQcbU9APd5Gpx2IKqWn/+Oo/CnXGw7s+fUW0iua5YtiXXZiuX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:41.6058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2eb4c5b-94d5-4ea9-c775-08df461a54d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9603

From: Suma Hegde <Suma.Hegde@amd.com>

Future AMD server platforms are expected to support the
HSMP_GET_ENABLED_HSMP_CMDS (0x37) message for reporting
which HSMP messages are available. This also handles
detection of BIOS-enabled and BIOS-disabled messages.
Instead of returning -ENODEV when no static bitmap
matches the running CPU family/model, fall back to
dynamically querying the enabled read and write message
bitmaps via 0x37.

Add hsmp_set_default_msg_bitmap() which temporarily enables the
HSMP_GET_ENABLED_HSMP_CMDS bit so that validate_message() allows
the query, then fetches the read and write bitmaps from the
firmware.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- In hsmp_set_default_msg_bitmap(), fetch data into temporary
  bitmaps, query the write mask before committing the read mask, and
  force-enable HSMP_TEST / PROTO_VER / SMU_VER / GET_ENABLED_HSMP_CMDS.

 drivers/platform/x86/amd/hsmp/hsmp.c | 51 +++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index ccd874334468e..937e7168adef9 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -833,9 +833,8 @@ EXPORT_SYMBOL_NS_GPL(hsmp_cache_proto_ver, "AMD_HSMP");
  * HSMP_MSG_BIT(msg_id) for a supported message in that direction.
  *
  * Newer and future platforms that implement 37h do not need new entries
- * here. Unknown family/model currently returns -ENODEV from
- * hsmp_populate_msg_bitmaps(); a later patch adds a firmware query
- * fallback for those platforms.
+ * here: hsmp_populate_msg_bitmaps() falls back to querying the firmware
+ * via hsmp_set_default_msg_bitmap() when no static table matches.
  */
 #define HSMP_MSG_BIT(id)	BIT((unsigned int)(id) % 32)
 
@@ -1095,6 +1094,50 @@ static int hsmp_fetch_enabled_msgs(u16 sock_ind, u32 mask_sel, unsigned long *ms
 	return ret;
 }
 
+static int hsmp_set_default_msg_bitmap(u16 sock_ind)
+{
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
+	DECLARE_BITMAP(read_msgs_bmap, HSMP_MAX_MSGS);
+	DECLARE_BITMAP(write_msgs_bmap, HSMP_MAX_MSGS);
+	int ret;
+
+	/* Set HSMP_GET_ENABLED_HSMP_CMDS bit to ensure validate_message() doesn't fail */
+	bitmap_set(sock->enabled_read_msg_ids, HSMP_GET_ENABLED_HSMP_CMDS, 1);
+
+	ret = hsmp_fetch_enabled_msgs(sock_ind, HSMP_GET_ENABLED_CMD_READ_MASK, read_msgs_bmap);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fetch the write mask before committing the read mask to
+	 * sock->enabled_read_msg_ids: both queries use
+	 * HSMP_GET_ENABLED_HSMP_CMDS, so if the fetched read mask happened
+	 * to clear that message's own bit, committing it early would make
+	 * validate_message() reject this write query.
+	 */
+	ret = hsmp_fetch_enabled_msgs(sock_ind, HSMP_GET_ENABLED_CMD_WRITE_MASK, write_msgs_bmap);
+	if (ret)
+		return ret;
+
+	/*
+	 * HSMP_TEST, HSMP_GET_PROTO_VER and HSMP_GET_SMU_VER can't be masked
+	 * by BIOS (see init_read_enabled_msg_bitmap()), and this function
+	 * itself depends on HSMP_GET_ENABLED_HSMP_CMDS being read-enabled.
+	 * Keep all four set regardless of what firmware's reply says, so a
+	 * firmware that omits them from its reply doesn't break later
+	 * users of these messages.
+	 */
+	bitmap_set(read_msgs_bmap, HSMP_TEST, 1);
+	bitmap_set(read_msgs_bmap, HSMP_GET_PROTO_VER, 1);
+	bitmap_set(read_msgs_bmap, HSMP_GET_SMU_VER, 1);
+	bitmap_set(read_msgs_bmap, HSMP_GET_ENABLED_HSMP_CMDS, 1);
+
+	bitmap_copy(sock->enabled_read_msg_ids, read_msgs_bmap, HSMP_MAX_MSGS);
+	bitmap_copy(sock->enabled_write_msg_ids, write_msgs_bmap, HSMP_MAX_MSGS);
+
+	return 0;
+}
+
 static void hsmp_dynamic_bitmap_zen6(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -1167,7 +1210,7 @@ int hsmp_populate_msg_bitmaps(u16 sock_ind)
 			return 0;
 		}
 	}
-	return -ENODEV;
+	return hsmp_set_default_msg_bitmap(sock_ind);
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_populate_msg_bitmaps, "AMD_HSMP");
 
-- 
2.34.1

