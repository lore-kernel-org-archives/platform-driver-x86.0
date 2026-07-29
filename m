Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74B54CA29D;
	Wed, 29 Jul 2026 16:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343268; cv=fail; b=cIZS112DJQqqXKEzV3rJNpUzVHTbZAOuqOaxNiDbTihgfN58EukxOQOLLygDoXNKrJiOjA4BsfNsYmzLHzI6zUIDu0MIhiM/BtIte8MUGOwGfLqTZ8e/IRiQNSflND3htx8mXc+QsWjkfXVpx+U00GzIqxwTVMdzkGYZW/mBTc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343268; c=relaxed/simple;
	bh=Eg7hcRr+Zn0u/fwec47xWatWqIg2QWJ2ADg1Hggv0VU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lw5003wbGvtiTSlZwEit6uNn/jNCEPmhXrxXUrlk2Fu2ao9N6Rr/hBicqJER8tAl364ghmAF7CN40HdaqcjbdXXbTL0TBUVfMZySiYYyK8TG6hLRBmaE4lVpaTbqOxEfCgElbK8GIoWTAccE1fCMtTZuajkcFJffV33VtGEjFJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1GzoOt7p; arc=fail smtp.client-ip=52.101.43.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1GzoOt7p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gmh7KGuG0rw/ay7gmRUHB+4DZjHK039mXOzjO4y2qAWCKPLchexpLcFjQ/YouHbX5PADBh2splUBa5FhbJRfY1qQrcqCcTVeE0YFvGRWzRvrJkye0JAzn2rEzZmtMR+jbPsxxf/H+Q26X7Bn734aCgpr6+G9e1pQZoV2wiuWTKWymq+VLpvz6UhRMVq4Ufy4AG1U3YHdKh175ttTGX5wuIbeqIiKyEWk1eLTSh8hDam4FeqzVgyOEnwFqqOJwH14ic45E7sXz1/EpdN+QIT7e7DTwujfhe63MsAusfHVmw4QjPtZf4R8f93Q/gUQCJxeQh1S9+BIK//sGClCJN6+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=holR11yWEyid+eLuS7tD2u6E42BQhUqD7BDQoXuFbxE=;
 b=ktv5/6jgqLR/Tnpd533G+G3fytu1ZXGRa2Joj3KcRaVtDxQSaFhSiIMrrN3fPCkLtyieOs4XKOsf0XjDQQlhtM2kZ8h0LDVQVamvYTtlkjZTR9WVwxY2LvONrBmvhCKw4UqGfqSF6RB4RTq2X96XcQV+B4oDiXj1MKFLuoODsjMubxZ+2aQtc20gpBg201/g2sC/D7wSP/reWOXEfmElbNYxRVUTXpL5Jkg854CjdTcorzzl5MHevGsCcZDtDGCa1fFMtGYIVQh+/PIfwpCa4zrZsblIztTZsuY7ShmF6aiiRxhZFEXMW0eu/a8RNqrymyAlNvweBI1YkSF6QqKQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=holR11yWEyid+eLuS7tD2u6E42BQhUqD7BDQoXuFbxE=;
 b=1GzoOt7pbn2dQD/DTz6zr5wWLv2ArFo/timKRbXSdbgpuIpWfDc+RveYZgv+S83jjsF5Cq/aWK4dJcnRdg5XP0cyqIpjHYA0Y13oBDGbF2WjkJzqpTPbI4haHwhNDLNsfqsVm7rNCRnDczkP5mEeOYZD8AqpgzJG6pSC2Yzy6uA=
Received: from SA9PR10CA0028.namprd10.prod.outlook.com (2603:10b6:806:a7::33)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 16:41:00 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com (2603:10b6:806:a7::4)
 by SA9PR10CA0028.outlook.office365.com (2603:10b6:806:a7::33) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13
 via Frontend Transport; Wed, 29 Jul 2026 16:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 16:41:00 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 11:40:57 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 2/7] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Wed, 29 Jul 2026 22:10:29 +0530
Message-ID: <20260729164034.1331375-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729164034.1331375-1-muralidhara.mk@amd.com>
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6ce69f-e63a-4534-9f5f-08deed902bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9x0pu8D10rn/+rcde+s+b3AqRSU20eLP2RlDWWq5OjlWWZ5aU6Mkn04RAeA/DxuM6Nh61T0JltuijtpPNvZYKZ1qNdDAXK9+KrnYlrCsO5d/ALz8UmahifET7j3wASdPD33TW/g6BeArfRheWMWtpTbedIgwHMVBHCS/+0+q0O5RmuRnsP2wtwqluPqageKjpbDpChk1GRX/ziDG4rUceVP1KexWngVAcRHLv6ZIykCHSdgVGy6vAjbDKh9sBpcALMMGCRwhQ4TAFezC5ks7jbMPI/iZ51t9PCEhKqokGH9m7qF19uoHH2Dg3Gfqe86Li5/kt72ftyNpGWd/pH6n94q8ONb34UkIqRuaPwPPKAkXw9VVA6szbghb+8enpjepDNOmzi8D7E2l2Ns19ieJ0sHaEkaXlWLwZB5R1L4RXAhYIqNubgmTn3tvTb5cPNOdNyrdFwKmTOKHc0jYD9/dv0gi6XIsdR+jbt3WuAXG4KK/RZwqQxZlBTuFDEk9RfR1DlUayJg5lgmmNEhZ7EwPM+3c1yv8vglXZvKX+TgznuCJXrPrLNwqU08Tsq5PVd1vImYiKcomvo5RmJVQEYlMiZzABxLFfNQUOX6/q2rBokSBR6Vc+or8umKt61+ibUB0C2zmIhf7eoWzb0eys09PBZqZBL1hgDfuY+4Bkgl79l7Qt/QJSu5YuaUInoiLIJHU8YfSx7Ey2ZZPdUpxdlS81g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kzE00fyrlX6wOJOq6EIYxzhzhDt2aQH6L0e4Tjvybph6SoIVY4W6SzWDLhaaYCZ5q9wj1I6tomVTVKEeWzNO6Icw0LL0IT2z6kVerIx9juS4Dg5t1gUiLmj99+AQIeqYPFG8Ng1fMkSn9QiQ17faArOhxS9FVS4Z4oxoMgbzWVqzP5zQgptVYWOI5dleYh30OsSX2tfrRoC8209K2h278tLloNrHDTeIJOHfeaBOkEjIyOV+mXGhVkYHE0DqofNpUSAkOXh6qI9sgL+11TwK+ZfNa/w1VnGRIAyOUuQ8wGS608Ke/s0cDj8cuXcIR6kiDEuaZR+u91BAfXcJaWAKlB9fOc+eCNdpalzaSGBnMV7ESe5/VSOVR6P1NjLHB7iTIcWZYpcULLKmb9ZGmFDZ/PUWtgPyOnx7A9CsVA5AoUV5t/gA4gOEzre4/phiKCTO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:41:00.1484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6ce69f-e63a-4534-9f5f-08deed902bfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258

Wire the client metric table and metrics DRAM address messages into the
metric table read path for the Family 1Ah client platforms (Models
80h-8Fh and E0h-E3h), and initialise the metric table on the platform
driver probe.

The client reaches its metric table through the Ryzen Master SMC message
set, so add the two message IDs to struct hsmp_plat_desc and have
hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take them
from there. Unlike the test and version queries, these two are not
numbered alike in the two sets - 24h/25h on the server against 05h/06h
on the client - which is why they have to come from the descriptor
rather than a shared constant.

Fetch the metric table on the client whatever interface version was
reported. That query is already non-fatal there, since some client SMU
builds reject it while the mailbox works, so hsmp_pdev->proto_ver cannot
gate the client metric table the way HSMP_PROTO_VER6 gates it on the
server.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 16 ++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.h |  4 ++++
 drivers/platform/x86/amd/hsmp/plat.c |  7 ++++++-
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9b65dbd47965..2326506929a4 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -65,6 +65,10 @@ static const struct hsmp_mbaddr_info hsmp_mbinfo_client = {
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
@@ -72,6 +76,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
 	.num_msgs		= HSMP_MSG_ID_MAX,
 	.test_msg		= HSMP_TEST,
 	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+	.metric_tbl_msg		= HSMP_GET_METRIC_TABLE,
+	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
 };
 
 /* The client drives a different mailbox with the Ryzen Master SMC message set */
@@ -81,6 +87,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
 	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
 	.test_msg		= HSMP_CLIENT_TEST,
 	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
+	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
 };
 
 static struct hsmp_plat_device hsmp_pdev = {
@@ -643,11 +651,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
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
@@ -713,8 +721,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	int ret;
 
 	msg.sock_ind	= sock_ind;
-	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
-	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
+	msg.msg_id	= hsmp_pdev.desc->metric_dram_msg;
+	msg.response_sz	= get_msg_desc(msg.msg_id)->response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (ret)
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index b4bd9800dee1..c46d53dbcd43 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -103,6 +103,8 @@ struct hsmp_mbaddr_info {
  * @test_msg:		no-op message used to probe the mailbox.  Also the
  *			lowest valid message ID, as ID 0 is reserved.
  * @proto_ver_msg:	returns the interface version.
+ * @metric_tbl_msg:	refills this socket's metric table in DRAM.
+ * @metric_dram_msg:	returns the DRAM address of the metric table.
  */
 struct hsmp_plat_desc {
 	const struct hsmp_mbaddr_info	*mbinfo;
@@ -110,6 +112,8 @@ struct hsmp_plat_desc {
 	u32				num_msgs;
 	u32				test_msg;
 	u32				proto_ver_msg;
+	u32				metric_tbl_msg;
+	u32				metric_dram_msg;
 };
 
 struct hsmp_socket {
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 7423c98a7b3e..bc29b0ec18f7 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -185,7 +185,12 @@ static int init_platform_device(struct device *dev)
 			dev_warn(dev, "Interface version query unsupported on client SMU; continuing\n");
 		}
 
-		if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
+		/*
+		 * On the client the metric table is fetched with
+		 * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR whatever interface
+		 * version was reported, since that query may be unsupported.
+		 */
+		if (is_client_platform() || hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
 			ret = hsmp_get_tbl_dram_base(i);
 			if (ret)
 				dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

