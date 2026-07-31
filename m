Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3E44B690;
	Fri, 31 Jul 2026 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514553; cv=fail; b=ec2Uj2DDrFzllw5BukuFeLYszcrOxiLGbFGj8c1DpTQUlPF57NQBeiWAEKZ/8nT00Blq7TpdMjn3o+Vbbl3LsxFMHuyOuyPVaYQD5wDpSscMwBg6HzshjRt71W6sYSmFR7o+DImek635QXxYvTjwC5WGboj9hUjbl6/NTBMu8YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514553; c=relaxed/simple;
	bh=5cI0YUP4uokgiZcug1eVuBQYibvot+clXfif2VrozHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tXK/x2C9t2/Z7Y4NbtmG2qqFObD2RCZ7cL3OtlS9cChVEMLzUWGGXI+l7guIH9OL6clS4ISwk8lbTpbZCmKGizciFfdw5GzqN+7WNXaq2RcZOYH5EXumOCPLD4ph2MKfAsFxH3kxG0sHtgk2gaFmcbq4KpxHMpmaj03+XMkjoN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YEGdOmsj; arc=fail smtp.client-ip=40.107.209.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YEGdOmsj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pf3gvO1Yzt6TSj4xvd9tePXJRU+O9M3WWiS9A0R9qJdlQe3tPENwr7K54qa8ymzqHdc8hFg4hqr2Wj4sHd2lXej5pt+P2R0QubEv7Tk3CrawfDKJqNrJmnGalRM6vJlJ+W98HFjf5SV0emVKskOSmRAawl4EclvIIZk14vyZxMwW3ZIkz0/XqtMlxAWZ2ygSKBu+821UWGTVHcap5mfP/iv0YOZy25f7wkB9fI6lMzrYuyQI/l4OSTrqoLul2nU4Ysb7GfsZrZWYgRuD7Y7+p1ONGOEnunIktyPCsXdub7Y85oGoF8MqDbRT+f9GXBgla/o0suqEpTmz5AMHl1VnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xDAKirhrA880dT23D0ByzKrxvdV+Z6e2n9KGOZMfMY=;
 b=Zjcewx8TjmzXSD0anbDED79S5sqntVWNUfvW/I160Ront8y3Jskk6WggKfPfCT9oObt+NP20Btbpy6FRmU9XbFTYeBqq7q9jCjtH094nlOQVVXN1fHwzrFCMnUV5lq0J9X4IOFE+muuMzn3obK09Ypha73b5i3Uwoc8rSIQweIBl5+nvlDxxomb8WWi7MN/edCRbH+h6vrfYvbHtaGU5jqmRc1r8B777og4VUS+mA0JOIkAS0mBLQyrIcReeisujCH8BBHw/nMKCzzbbae2QGry8zt3cuPfrYqY0xMopo/HeaT/9mCd8j0ksI008CwmQ6MLs2ptZOJylkE1C8vR2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xDAKirhrA880dT23D0ByzKrxvdV+Z6e2n9KGOZMfMY=;
 b=YEGdOmsj2Nu9isiBdzl48p8jy5YvXNILWXv1XkxoMlN3VB+1cD8MrYonLC42wyZY9AwIvmzWSyZdqX/LbY0i6yG+jUXXN8KG/th/geVcCAlZ+Eea1GtMHsuQQLOjyy+G9cki5MP2eSlYeiudhv9wfTwk0HurlkUsv3OTqwM06gE=
Received: from CH0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:610:e4::35)
 by SAVPR12MB999120.namprd12.prod.outlook.com (2603:10b6:806:4e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 16:15:44 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::32) by CH0PR03CA0210.outlook.office365.com
 (2603:10b6:610:e4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 16:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 16:15:43 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:15:41 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 2/4] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Fri, 31 Jul 2026 21:45:14 +0530
Message-ID: <20260731161516.2242993-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731161516.2242993-1-muralidhara.mk@amd.com>
References: <20260731161516.2242993-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|SAVPR12MB999120:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a7e89f-8717-4a70-b90f-08deef1ef8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0w7x4EWSKLkSWxka8srxRHnIbJcVPBaIvjrT0K5c8KX1JxpyqK4iRErbVfKLJKupmEAcz5r2lbJbcnQQxjEoMGWjrMydYWsVd2H2I4Fx57aXKb7YmFoMjJnGzWBa1J0edDA5z/+KiSB4kfhmm8LvcpMhl6L42d2b4Ktgjewbz8dAm0RMHF7gYQLgceo9v/VrKYddFU6V6QHmaUan+PR78Bbtct99viMOrhkXP3TKfI4KF+oJOWPjWz34sp4FNLd3NVGXMq/1E22RRNhZ4+FOVRETxqW3/muEPQtnatqY3zQ/XB+NoiSfr+n+wTu0YcGIKH/T1ZS7fu8F8H8Hz53adx0hK6OkLx1u4eZ8mQRNaHEYbtgRCHQEnRtrcl9QUSoLduwI5s9fghcxwBIdurQLqRL0EVxfoCxygbWj2/hDajio5VqRGXKBo20dGzfb3OhSQzZHfjSJE6vHSs003WaX08NBMBTnbg2Akh8TMZsDjTXn0oEQf4OsxTHFw5hPvl7UaBCLB/JKLrqiwoFKI9J/00Iw2rXTe2oOUfcbiaDyi4hQchb++t/+c3BLtL6SuGUDtRN/3wFHjsbWZoZ3YCJKZb0D9w6BGyo4WOp7xep+5Wlk9H9EEYWCXcKyXOcF6OYLFK6ahvoBL5ayceOjkPQAiJoh+spsX2rVue5r3MUktG2LOAn42W3N4hu2lGWyE5JlQuMBQGFdNoLZ/PcnlxecSg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oshn6/OrXySiwc+hkMbYh1pi+z9A1K3ON8+BXgg/JyRS0ZVh04Ss1y1HfeIx/DjKAYKq4Xs1Xrfrjn8tF8+u4mPpgXRmaspyfdAO+gmC3MnjWzUnLdBV0/O3fq5cKkyzkeKTvWfMg5atdoL/1l7VnwLnTp6G25Mw+yXfeJh0hPvtSxYlgAyc0+yC3BgMnYOsWy/AgIEtf5+d3S17NY7LJuuvwEFA+1WmqfFgEIDS8n6ABmZo4jw9uq9KnuOeiktA2nUejRL2v2Jt3YWs7JD/zdSqyT9Nrsu0RJJ2GgcAnlKMBrKwHaRafZJZc5ur1P3zNuXGQ81jzTnI3l+/84SnMi7OxC3zUIXsZCCnhQln9bqIEVY7o+MWOAP2QZhwpDFAfM/AkBUzvvUCWUEEwcigRKjU5KxCBpWjrVxfut85fiK5SjxN+8GLWJgcO1tc+otg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 16:15:43.6370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a7e89f-8717-4a70-b90f-08deef1ef8e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999120

Wire the client metric table and metrics DRAM address messages into the
metric table read path for the Family 1Ah client platforms (Models
80h-8Fh and E0h-E3h).

The client reaches its metric table through the Ryzen Master SMC message
set, so add the two message IDs to struct hsmp_plat_desc and have
hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take them
from there. Unlike the test and version queries, these two are not
numbered alike in the two sets - 24h/25h on the server against 05h/06h
on the client - which is why they have to come from the descriptor
rather than a shared constant.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 16 ++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.h |  4 ++++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 5cb2c4399043..345cc2db7f22 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -76,6 +76,10 @@ static_assert(ARRAY_SIZE(hsmp_client_msg_desc_table) == HSMP_CLIENT_MSG_ID_MAX);
  * are also the only ones the two message sets have in common.  Messages named
  * by userspace in an ioctl need no entry here, as that path already resolves
  * the ID against the running platform's table.
+ *
+ * Being common does not mean being numbered alike.  The test and version
+ * queries are 01h and 03h in both sets, but the two metric table messages are
+ * 24h/25h on the server against 05h/06h on the client.
  */
 static const struct hsmp_plat_desc hsmp_desc_server = {
 	.mbinfo			= &hsmp_mbinfo_server,
@@ -83,6 +87,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
 	.num_msgs		= HSMP_MSG_ID_MAX,
 	.test_msg		= HSMP_TEST,
 	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+	.metric_tbl_msg		= HSMP_GET_METRIC_TABLE,
+	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
 };
 
 /* The client drives a different mailbox with the Ryzen Master SMC message set */
@@ -92,6 +98,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
 	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
 	.test_msg		= HSMP_CLIENT_TEST,
 	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
+	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
 };
 
 static struct hsmp_plat_device hsmp_pdev = {
@@ -639,11 +647,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
 		return -EINVAL;
 	}
 
-	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.msg_id	= hsmp_pdev.desc->metric_tbl_msg;
 	msg.sock_ind	= sock->sock_ind;
 
 	/*
-	 * HSMP_GET_METRIC_TABLE makes firmware refill this socket's shared
+	 * The metric table message makes firmware refill this socket's shared
 	 * metric DRAM region, which is then copied out below.  Hold the
 	 * per-socket lock across the fill-and-copy so concurrent readers of the
 	 * same socket cannot return a torn snapshot.
@@ -709,8 +717,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	int ret;
 
 	msg.sock_ind	= sock_ind;
-	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
-	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
+	msg.msg_id	= hsmp_pdev.desc->metric_dram_msg;
+	msg.response_sz	= get_msg_desc(msg.msg_id)->response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (ret)
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 3e7814f26635..815804f8054f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -97,6 +97,8 @@ struct hsmp_mbaddr_info {
  * @test_msg:		no-op message used to probe the mailbox.  Also the
  *			lowest valid message ID, as ID 0 is reserved.
  * @proto_ver_msg:	returns the interface version.
+ * @metric_tbl_msg:	refills this socket's metric table in DRAM.
+ * @metric_dram_msg:	returns the DRAM address of the metric table.
  *
  * Resolved once from the running CPU and reached through hsmp_pdev->desc, so
  * neither the message plumbing nor the probe paths have to re-derive which
@@ -108,6 +110,8 @@ struct hsmp_plat_desc {
 	u32				num_msgs;
 	u32				test_msg;
 	u32				proto_ver_msg;
+	u32				metric_tbl_msg;
+	u32				metric_dram_msg;
 };
 
 struct hsmp_socket {
-- 
2.34.1

