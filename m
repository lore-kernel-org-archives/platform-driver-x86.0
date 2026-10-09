Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C1E3DCDBC;
	Fri,  9 Oct 2026 06:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526467; cv=fail; b=Y1Ale2vENk0B4mmy3eqoLYUQgMWVPYGyC19FuZIiIREqlftF4K3rCCsFHeQhpOqf11uloWaks5n6mVIpUfkQjCOKtfYv8r/giQ7qJ9YWvhjjkFZiaanQitJvQW8VzDfebqUPJKzFc+CibBOtMkteNAQEbzWd6p54ciD5rg625f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526467; c=relaxed/simple;
	bh=sIciFpPxfBuRptSvkUS1HTy85qajjVGR2QH1Mb6BNMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bUAO6ubdMOCKB/Ir+4NInvPV2zVDzdZkasHmB9JW/k/EPlyicb+hpwG4UB/gmBbkd1oe9TRwTVHONFTNonC8YXykLVQAYvAixAwZ7boAZlf2jAukm74r1TJyOWOYupNiYQQYdHdThgoZ+gL5QmgABNlgpVO4SzGWuaOzs0cCnUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OUQ/v83T; arc=fail smtp.client-ip=52.101.56.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OUQ/v83T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF8npfgV+QPTtErFI+HhRtBK5zMwmdOsAKBjSdhgkbs0DIi7uA2ZfqRrQWXLrGU3GPnuNv+0VrvrVgoD+QsydMe7kDR1MCEH0BnvhFKO8C9+h9lrbU6ExbAQ37ZxFMokyj7tV7nJx7P2xvB4eUf8EuaHKcaKuySpnJfZ+IfhJBYLBpwU+Z1cZt2UTliv5+Bgbjzb8mit1etXpl83Anu5b738QmYbL5ZUPhwWVXZk8F5v/v2leffGHggy+7bbJnU7BAeepxgzyT/dUYW09LwmSpEcsGPWxWEjrOc9Ao/v+sf/PeBlo41beVFleIGQ87V+FkvU+foiBxHsVF6Dq6AZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tD0nslwvTGDk7tq8N3ZfgE3KxVqauhNsr3rDECtNd0E=;
 b=NhuEOBNNzujBdzaZcLfcaDJaB5RNjB1avk4a67nUgcLKfD/Y3XIBZw7r3qkQY/pAF7Cw9l1YDFiVlW8TUctKYVb2TIXxuTjnzbkiE2foY2ShXqAYGNZyXAnjhYse4clJeH2US24xspfFN9LdVY4MAFEM2hIms9YCEd6Gv7TqbXzVhfuzduurFES8LO/4X56uigVPTWebXKznfhIGFp1xiLNsRKqUC/ykupRE4SMhj4z5MfrqXjoPblDi5D/xrHtJG2ED2ijMnPpE7D0f7OXcQeOPZO7NEHTqIqPE2jTWBy/877R0X2BrzeqBNsp37rjCJJfQK1lbE6NgfuB1qSm99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD0nslwvTGDk7tq8N3ZfgE3KxVqauhNsr3rDECtNd0E=;
 b=OUQ/v83TVqyHNdi59Xh85Q2831QaYDAsVLQPZhbIAVkR/pzfjbfwoD9w/qYgJcnIvVSnTyZ82foVNu8FGuhpXDvCxgphjzJOGHiqI5JL6/lUkBcHFx3EJ32wLLEyGDYzYipn4P8Ite18hvI+EavH6MViftb5VTuGEnGg4WADAmU=
Received: from SJ0PR03CA0172.namprd03.prod.outlook.com (2603:10b6:a03:338::27)
 by BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 9 Oct
 2026 06:14:21 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::32) by SJ0PR03CA0172.outlook.office365.com
 (2603:10b6:a03:338::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 06:14:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 06:14:21 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 9 Oct
 2026 01:14:11 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v8 3/4] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Fri, 9 Oct 2026 11:43:55 +0530
Message-ID: <20261009061356.3234513-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009061356.3234513-1-muralidhara.mk@amd.com>
References: <20261009061356.3234513-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|BL3PR12MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c6a3c9-b3a3-41f3-2e47-08df25cc8efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1yW4rlCUQP3cARDE/z/iv6FZOX3Ru3ce3bqZHQbkZywbzZJniHpweWJAFNAVRkT62jgKuKXcWz6cOOaeHDQD5bqsuJIy2ys3EbOs6ie00HvmWIz8opxCUg/fO/tOAJ1ct/P5gbjeWWWWVB2uXyNz/zM9sJ4QJS7XplUj39FLyV8xzZMaWeZHGzWzKmB/6lGS+dosAORaWMexO6SEIuPWS3JYv6MA81CFAseXs49Q48zXKpjAOQtzOl39aS9bMW5sVSU2ShzncTBNBTy6M1Um4sW3UqR2mNsmBYZ7p3Qmct/SlI38844tT/P7sI2feqVTARrMPiInlaiBO8DS5Byo5Y1LZa2D21jqgG/IsDSI6udbuUd1qi2GJM0Kubc1wmaNYSAeGgf+ayW/fohRZTsjOrdUVNQ7vVsay/LpT4EKLgK0amqUTPkufGP4OZXq/sQ9SJ9WUWhtZOQoimxmqRRfzf1ItCev1mVBELXXEKSD6475HshYrKrJK++1AvyM1LSuGdPEZeGLCOuT83MWXgymK7wgeK5LNzYRusrAW5T6Ceqmt2Z3FXVOXbNYLHxtwE0SjSW/LrcF1DG0WM3l9WPL1pnUmgACb3a5gHsVWspFnBLhLjbLXVqSPU9T5AmDVtzxEtWGdmvJ1y1+1dpnaFnDgZ3H80MiWqXq/HkxOlacdd9ZldEEInGCyK1CXXzMfs0IFxJkFBPA52qmQ/cKqm3wrw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NcPqEEAxPga1hPM2P5OoUA7UleYOZYXjpldmV00XuZqSTOx1qN8pVorSa+RGhVZXM7+r4mGZfP128VyyKhnWSYFTR9SLcu3b0O1rhK65ixwMYYzAAxvXji18CGAQvgaW0nSi9aGh5XYUl5BiyIQNvU9HRpJwJCce3Ia63ilw6bn0sPgqTb4E4Z32fCB5LMci+cfVe5qTRCynbyJTGkzuVLT6FLTiOLFpFWRkOXoqDWuMxot5IE4NPORc9CVHtkPFBrwJvQUgBwGHRum39m6r1nF5/G9h/XbL85cqUgZMP5pvbUN/eqG9KcLXNABtX+lVypuQvuvrn7+mzPwMY5KLZCcZRYImCyUBAXytJb+VNCvC8LsObW6HWxuODT7ifcKkNyp8ieZK6NN699Urcq2ho1ibbOwEVU5laUS/I+aNWHQEBSdbxaRecGEdlGgi9yqF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:14:21.0938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c6a3c9-b3a3-41f3-2e47-08df25cc8efa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6571

Wire the client metric table and metric table DRAM address messages
into the metric table read path for the Family 1Ah client platforms,
and fetch the DRAM base for them during ACPI probe, lifting the
defensive client exclusion placed on that call several commits ago.

Add metric_tbl_msg and metric_dram_msg to struct hsmp_plat_desc, and
have hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take
the message ID from there instead of a shared constant, since the
client set numbers these messages differently from the server set
(05h/06h vs 24h/25h). Have hsmp_get_tbl_dram_base() take response_sz
from hsmp_msg_response_sz() too, since the client set has no
descriptor table to take it from directly.

Add enum ryzen_master_proto_versions, and replace the single
!is_client_platform() exclusion guarding the hsmp_get_tbl_dram_base()
call in init_acpi() with a RYZEN_MASTER_PROTO_VER1 clause for client
platforms alongside the existing HSMP_PROTO_VER6 clause for server.
proto_ver holds the Ryzen Master interface version on client
platforms, a separate numbering space from enum hsmp_proto_versions;
gating the two platforms on their own version enum avoids relying on
numeric coincidence between the two, and lets a client interface
version bump be reasoned about independently of the server protocol
version.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 arch/x86/include/uapi/asm/amd_hsmp.h |  9 +++++++++
 drivers/platform/x86/amd/hsmp/acpi.c | 11 +++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 14 ++++++++++----
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 7274cf040a66..b4f64b2407b6 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -106,6 +106,15 @@ enum hsmp_proto_versions {
 	HSMP_PROTO_VER7
 };
 
+/*
+ * Ryzen Master SMC interface version, reported by
+ * HSMP_CLIENT_GET_INTERFACE_VER. Separate numbering space from enum
+ * hsmp_proto_versions, which applies to the server set only.
+ */
+enum ryzen_master_proto_versions {
+	RYZEN_MASTER_PROTO_VER1 = 1,
+};
+
 struct hsmp_msg_desc {
 	int num_args;
 	int response_sz;
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 1e5028aea54b..167c76c13ad0 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -567,8 +567,15 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	/* Exclude client platforms from the metric table DRAM base lookup */
-	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	/*
+	 * proto_ver holds the Ryzen Master interface version on client
+	 * platforms, a separate numbering space from enum
+	 * hsmp_proto_versions; gate the two platforms on their own
+	 * version enum rather than relying on numeric coincidence
+	 * between the two.
+	 */
+	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	    (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 87765116952a..84022a7f47a5 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -57,6 +57,8 @@ struct hsmp_plat_desc {
 	u32				num_msgs;
 	u32				test_msg;
 	u32				proto_ver_msg;
+	u32				metric_tbl_msg;
+	u32				metric_dram_msg;
 };
 
 static const struct hsmp_plat_desc hsmp_desc_server = {
@@ -64,6 +66,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
 	.num_msgs		= HSMP_MSG_ID_MAX,
 	.test_msg		= HSMP_TEST,
 	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+	.metric_tbl_msg		= HSMP_GET_METRIC_TABLE,
+	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
 };
 
 /*
@@ -77,6 +81,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
 	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
 	.test_msg		= HSMP_CLIENT_TEST,
 	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
+	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
 };
 
 static struct hsmp_plat_device hsmp_pdev;
@@ -681,11 +687,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
 		return -EINVAL;
 	}
 
-	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.msg_id	= hsmp_desc()->metric_tbl_msg;
 	msg.sock_ind	= sock->sock_ind;
 
 	/*
-	 * HSMP_GET_METRIC_TABLE makes firmware refill this socket's shared
+	 * The metric table message makes firmware refill this socket's shared
 	 * metric DRAM region, which is then copied out below.  Hold the
 	 * per-socket lock across the fill-and-copy so concurrent readers of the
 	 * same socket cannot return a torn snapshot.
@@ -751,8 +757,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	int ret;
 
 	msg.sock_ind	= sock_ind;
-	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
-	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
+	msg.msg_id	= hsmp_desc()->metric_dram_msg;
+	msg.response_sz	= hsmp_msg_response_sz(msg.msg_id);
 
 	ret = hsmp_send_message_locked(&msg);
 	if (ret)
-- 
2.34.1

