Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078304;
	b=ryOFAo42q1qtShu2sAyHaWwhUkX3krqwndjGBwEjwUbPUJfRl5dFoFx0QykTq8bU/SxX
	 rfXFk7h4T+N9lNFaG56CLqN6sCbkNgo7e9YtxNNkA/KPc3C493Qz4Rhfta4vR8qHGeG9f
	 WcZfL5/6f9fgjLgILYKLtRXx9QvxOu9oMZFcIYD1LNJseWTYzwQd9Apg/0mcKIydk96wJ
	 d6yWzrM77uKOWDb2ujDnrgQU7od06qKXJXLVUIeN5S1E8DQhukowD6EKQzJLc5+PKcYv7
	 CketwcsbmvpB9jMkIjTqM0OtPbA7At9iWjgUa5IBW2x+59hTAgvyVtgJbTZlzwDHxJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078304;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
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
	bh=/9Pg0kJ1dxlgw8t0sJ9mgfHJyQBMv2jTebtUySWH/xg=;
	b=bF17Vo/XDq4OwKa0SYAWrcIPfMjBvl5RuPGMAsW2NHJzxc29TqV2RxN7KLpBnrH/eSIx
	 5jDCFA18V5KoNr/ygARW0Y0+2nDi7ZK8H8ZGlOCBOOTEPsI4/vtxA3LK3yU31RB9Xjktr
	 Eja677UFm6QICfFjrOnjfO7ye6PSD2pt38opMMU3DGo5bA5HF5L83iAZBnVw9UWnKYt7x
	 rsDR6+osbByTt7kQKtjU6xoXjmfcMdn4T/+h9kt6z9/r/G0EhN3JaxXvlWYL0dQVn2Njl
	 MKMk79Bo1Rekt3aCsNfDustvJvVDAlskj6G7pF3aET/+ZR0j6fsA9uofdQGAiTbenjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="W/4LB9Kl";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.24
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09EB606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F09EB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=W/4LB9Kl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D56fMq5ADgs1wNjw4UIjcDObkv9cx44/jghics6VmN330yIQcVV1e/6xby5jFnzpGbrW4gQfl2i8zzFUWUQ8BoWWKLjAn6p2yyGqgR8ep5a0YivlGTnYM93pLAgUmZ7fxrHmEYCePdPCsnXQLnHBDQbCFTlM/0VEbTsl24nodvaZaG3vKd6iObavgBJF+H1TW6rXtgJz58o8QEJHr/mEbFxINALZrQpetixB9kmJ3toE1I+8Gl4MT416AXeJpeGV9EiER7B4lY5osYAErIRfpTAJQsTJcaJxuNOKN7ZSzXysRAxK6FPlo5dsrQyRlZlunOVcAy/LtlN0olYLn41OmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9Pg0kJ1dxlgw8t0sJ9mgfHJyQBMv2jTebtUySWH/xg=;
 b=e4vC8l1UoBY92aadG4/h0vPrnTC4tSUfFUeCDTNAhtXSUFRQqgnY+TcXFfWLYQ6sDBLo8KaWKDy2j/8TNc556qX0UpmVqBe1hru9aQN+8T6HpfWYp1ywgv0bbIl4TU5MzBmeSeJJeJZxUl59JBCPiQvBZegVDx+SOSPHxE6Fy/UtJGtkegTywvn42lbG9nQhS6YjVMsNg+cUopk1Hkp4xwpwdeOfA/CqIRNI0g/LIa729A8kTX0FhjtoAlnKKXW4lJiQpkI+i91qa+uC7dCWo2v8M/yh0RYRVZTRq7G6uHeL+U8L+z2zx39bem4HEN6tbjQBBtNbgaOtFjaehqw9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9Pg0kJ1dxlgw8t0sJ9mgfHJyQBMv2jTebtUySWH/xg=;
 b=W/4LB9KlVLPO9+IWcuxMVHHlCF6yZLosW+OFAeoXsUzc7vAAsUeUCTChEJF2M9tlZzrTZ1U2EZAhbKOyU16I+4gub0YsMyLO5Gvlvzz3H+d3TQkAzgiOBb4bTlFDW2jeaIOrx89m9kGpzsfw83otW1hIAI+ny7woRvbR/NXszl0=
Received: from BN9P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::18)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 08:51:39 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::80) by BN9P223CA0013.outlook.office365.com
 (2603:10b6:408:10b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 08:51:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:38 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:36 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 08/11] platform/x86/amd/hsmp: Populate the bitmaps dynamically on 6th Gen AMD EPYC Server
Date: Thu, 19 Nov 2026 08:50:42 +0000
Message-ID: <4a205ecc913618e00ac869a377b1fdbc665e9bc1.1795061419.git.Suma.Hegde@amd.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9276b8-4b6d-4f02-d27c-08df461a5347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|261021121427099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HcfY0L/Eu+athL+lhFYwRsXPrJw2RC5bo/MiKBQZmolgHuxwrM38i7AHAvQE0oFIy6Rm82lzP+j6MDDp0kdECRBrOCQVzt/cYotI2CovIWBCOQeWFkwhBAFSLx5ASJ/DS8xjQOBmTwt7fcRPs+WLyvVfO9BX6V02y1w9/MYAzR3M/pP2pa72t85QNcO8Up380FpI2RdJKDIq3V6Ju7OxplW8ILoXISFKCoU9vSl8j9Jq+o1AVywcZo0JTsBp7di557j4gKiaNgLa5o8ZhisywKNp4xqlmKOL2n3p/H4mMUG69W9jaPztKvrsW4H/I/kArAfljb2whcYMkvgbQOBCz1I4p5ywPGXnoGqfgp9FempUrDUFaeG4VosBigwq+Ac8NeFmx+N5gP4idzBzImQO6uNWPbKQrcw3zI+ospSQuyWdv6cZEF2UTa3PVmIF37LY7Nx13uLkleiM7Ga3MPY+xqqJ8ZK81o9DdAmscITcTivyZOZ2h0MtSE5eIISZp6cFgg0yJyX2lGT7N3pHEl3Ol8Cs+wMUjm3aLnBoEZgxIIfeXEK0f3JZv+Zs/+9j5RrWIDQSkj5BapBZ69NMRkAzHR1kf+eXQ7qOLh5ee6rYuHE9lsx3aqpa1Tcx1WBqFEU3WBnd/QjenH35jod5lkiqrMJ5JsAnftXyiW4SEExTODDX5ScR4ZWzwHnxyxXB2q1dz1P71s36ddUoc3kG+pADfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(261021121427099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HhLitwZvzrhLPWuiC8RvXHvnv9L8pemTX1D7GmfinOg7b/Y5wc+RQrXiYCSWp7fe1G2Y1Em7I30RJnnSx91gATXFXBukioqHR0/lhJeSroGdO34uYJg6L79XChmcAyk+G04rXvZhbaCwbUmtJ2uQaVYH1hmVLX2sIp/cEA856QrjICAOPDrvDtEqiuNf8PkAtW1HXwxOYpqO961B/QjQ3PyEh4FUpQxV9+Uin9CKY90FbfPkN54XLOfn7R7ZiyGffBPbq3IwVCOdf+CDs2T2EfB2KWTv6Fu6MRHIm2VH9eFfAE5Brn4lUYyn+Dotxb5u2StCPa1xdgMgTj8IjqlCC3QrS3iNX0/IsgN+KMJOPIGJt3W/U044elLsslaHarVPD8v6Ybz89T8oJTN0wnp+OJ6vr3juC26WHtsGhNUoJeDsXfQPqUMMERoE61qy2oEg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:38.9715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9276b8-4b6d-4f02-d27c-08df461a5347
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597

From: Suma Hegde <Suma.Hegde@amd.com>

HSMP_GET_ENABLED_HSMP_CMDS(0x37) returns the read/get and write/set
messages supported on the running platform, and correctly reflects
BIOS-masked messages in its bitmap.

6th Gen AMD EPYC Server supports this HSMP_GET_ENABLED_HSMP_CMDS
message. On this generation, SMU returns only BIOS-masked message
info, so AND the firmware bitmap with the static table. If the
firmware query fails, keep the static bitmap.

Use hsmp_send_message_locked() when fetching the bitmaps during probe,
as the caller already holds hsmp_sock_rwsem for write.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- Replace separate read/write fetch helpers with a single
  hsmp_fetch_enabled_msgs() helper parameterized by mask select.
- Clarify the commit message: zen6 AND-with-static workaround, and
  keep the static bitmap if the firmware query fails.

 drivers/platform/x86/amd/hsmp/hsmp.c | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 085edd2ed3d6f..ccd874334468e 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -1075,6 +1075,52 @@ static const u32 write_bitmap_zen6_variants[] = {
 #define set_write_enabled_msg_bitmap(sock, src)	\
 	bitmap_from_arr32((sock)->enabled_write_msg_ids, (src), HSMP_MAX_MSGS)
 
+#define HSMP_GET_ENABLED_CMD_READ_MASK	1
+#define HSMP_GET_ENABLED_CMD_WRITE_MASK	0
+
+static int hsmp_fetch_enabled_msgs(u16 sock_ind, u32 mask_sel, unsigned long *msg_bmap)
+{
+	struct hsmp_message msg = {};
+	int ret;
+
+	msg.msg_id      = HSMP_GET_ENABLED_HSMP_CMDS;
+	msg.num_args    = hsmp_msg_desc_table[HSMP_GET_ENABLED_HSMP_CMDS].num_args;
+	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_ENABLED_HSMP_CMDS].response_sz;
+	msg.args[0]     = mask_sel;
+	msg.sock_ind    = sock_ind;
+	ret = hsmp_send_message_locked(&msg);
+	if (!ret)
+		bitmap_from_arr32(msg_bmap, msg.args, HSMP_MAX_MSGS);
+
+	return ret;
+}
+
+static void hsmp_dynamic_bitmap_zen6(u16 sock_ind)
+{
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
+	DECLARE_BITMAP(read_msgs_bmap, HSMP_MAX_MSGS);
+	DECLARE_BITMAP(write_msgs_bmap, HSMP_MAX_MSGS);
+
+	bitmap_zero(read_msgs_bmap, HSMP_MAX_MSGS);
+	bitmap_zero(write_msgs_bmap, HSMP_MAX_MSGS);
+	/*
+	 * On 6th Gen AMD EPYC Server variants, the SMU firmware only reports
+	 * which features are disabled by BIOS — all other bits are set to 1.
+	 * Combine the static bitmap with the SMU-returned bitmap using
+	 * bitwise AND to produce the correct feature mask.
+	 */
+	if (!hsmp_fetch_enabled_msgs(sock_ind, HSMP_GET_ENABLED_CMD_READ_MASK, read_msgs_bmap)) {
+		bitmap_and(read_msgs_bmap, read_msgs_bmap,
+			   sock->enabled_read_msg_ids, HSMP_MAX_MSGS);
+		bitmap_copy(sock->enabled_read_msg_ids, read_msgs_bmap, HSMP_MAX_MSGS);
+	}
+	if (!hsmp_fetch_enabled_msgs(sock_ind, HSMP_GET_ENABLED_CMD_WRITE_MASK, write_msgs_bmap)) {
+		bitmap_and(write_msgs_bmap, write_msgs_bmap,
+			   sock->enabled_write_msg_ids, HSMP_MAX_MSGS);
+		bitmap_copy(sock->enabled_write_msg_ids, write_msgs_bmap, HSMP_MAX_MSGS);
+	}
+}
+
 int hsmp_populate_msg_bitmaps(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -1117,6 +1163,7 @@ int hsmp_populate_msg_bitmaps(u16 sock_ind)
 				clear_bit(HSMP_PC6_ENABLE, sock->enabled_read_msg_ids);
 				clear_bit(HSMP_PC6_ENABLE, sock->enabled_write_msg_ids);
 			}
+			hsmp_dynamic_bitmap_zen6(sock_ind);
 			return 0;
 		}
 	}
-- 
2.34.1

