Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013040.outbound.protection.outlook.com [40.107.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED24379C55;
	Tue,  1 Sep 2026 04:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238322; cv=fail; b=HR6s0P1+9BPQxruhURXAIgsEy/eN9rDNG2Q5jMOeDiQxYV6GyA7giXAUGKhCEjleRg0iynlAEyc3iXgqH0LTFnraD0JM2oLg3F/6N1zbISuoYkCtNKBjBSybn837lxEDQKyIRlROfGDRBfKGUKzVMScKtxcn3B1uUBVU0oW5dcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238322; c=relaxed/simple;
	bh=xzxbCwciAV4rzb+ZTsf5yCReQy459lQp4KfNLDcxomE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afqUZE/gA2EOdFqberuTNpoqFakZJv73B2xhc6zkOzxE+zvmGZgzmP5CA9fuhZnRfzCBQ9HkPddfIUr73Er9E3n+jxqo3SPTzB9+/6si4U52gG7ZxBJWbI5JohpbXYrLhlsC8IE0z4ocJJdOquzAB1E9EWXjCMkK1jueJY4vlZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tXLZgLfp; arc=fail smtp.client-ip=40.107.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tXLZgLfp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKxhbnYJIGcowvmLO3lnrwj/m9rayxUUeWgICHS38nuIsmpe/ZJ4Q9o9quW+4wBmtnYO3EuaoKs+VwrLFzjA1hLxZKk9z6h/7CPBpr32FtFObaPgyNvOe5zKDsl3IKIevXdFnzG+GubAYrvqDDTK3RvqfVV2R00lMO6+n2CvxCYpb5uBNjmSx6E3FxqrItRrNUIMGoQrjWX3gaBmEZGMrLRREQRP+kxMnSo5wQbT8nOfA84YBX8+6xVUbhnJc1cZAbLitiSeHN/u0Rx9Mg+/YR92yK0Vv8nCw7cW53S5HGAl0E8pA0a6T8FypzR4LbO+nmPWXmBMhfGjltsuGmmLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ktlIKXD/Pv6lP6r28XB9T5jXqr1yKyO+uJ1PboY1AA=;
 b=yPTUjj5bIwM0gyXubYrpZyoRA/xqWOVWq692hzMDczj3bq41tpz+u5hHtGWC4dwm2E55ZYoKmu/hY89QYhvmSMUva/RjYSXL6DmPUkfyDSck7RRlXqOTA4UaNdfmANTESViVyXPsXl0egFzwe0mu7IoV0XrGnHqG/p1iTaB0BCR9OgKoiKSPQLB4AFRyB0PD3QY5QM1IkgA0iwAbKU9Hq7fkfjuEHE3g9SiE1v9tLt4nnOvemP+0ht0Pxa+zo5AX0dK19wn4N027A9fjs9b4Kgx0H+9McIl2kfTgESTyd1Tv/sRWrmld0VyaecR5Dda1c60F+GG+VnuIKIDY4Vl8Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ktlIKXD/Pv6lP6r28XB9T5jXqr1yKyO+uJ1PboY1AA=;
 b=tXLZgLfpr7j3qP7NYt5Al63SN8v6bFkwTQRrZtpg3L4bbBbMp18udjC05OgYwi1wTmIrPiWUJGbaaQ+YE13RYm8J0lvsz6H/GaWebLSCQ4GxFPTGdKMFqPiddDYw2XqPo1uV79RMyL8BTYWbeb3w0UshQ3pbqDzQHnsmek3n5rc=
Received: from SA0PR13CA0016.namprd13.prod.outlook.com (2603:10b6:806:130::21)
 by MW6PR12MB8997.namprd12.prod.outlook.com (2603:10b6:303:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 04:51:55 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:130:cafe::98) by SA0PR13CA0016.outlook.office365.com
 (2603:10b6:806:130::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 04:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 04:51:55 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 23:51:52 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v5 2/4] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Tue, 1 Sep 2026 10:21:32 +0530
Message-ID: <20260901045134.2833282-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901045134.2833282-1-muralidhara.mk@amd.com>
References: <20260901045134.2833282-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|MW6PR12MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 709dd68d-1592-4a47-e600-08df07e4bf32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	XaZFdhi6vS66dYtHSJdUa7GC7LPyikpJ2ytd5AafXKXVrdC723MOZG50S3r42JTzIqeeotOYh6N1NanfWhHWYKSKx3bEoyzfaMNz6ZXD5A52F8C6R9a8MBAHGyPUQydbNJJOZ49vhutqV776wwbsiRLpCOS/V7k8kYdN4NZkPojjYbxFarzo0iNDvopdHG/SR3aXefLvfrg/ZTcTnXDBKurkjO8wZW6+cATiCi9Wz9Nf2Iw826qXw40sNzzdXTtFsMYGIl8q7GM25wHkTRarOPbLcgQF/bRa18EFxe5d1L9q2zj8S6YoFYI8e8X0kq2Dg1eY/0Y2RzYaBc/58CxDFtdf6Hd80UlreyoXwOwlUVylQybYnAcgycPztGobGJyKn+uFOHzxejoIsT/TyKwv0ERmlay+TxALLx7k95y3FkKSW7KP4Dz/nbb39HCN54IJ+1rreZu4sof2SHiTEfUJDSBAFpta1TEQ6PfgnzvCkm9ujElrJahAJT7OSb17cDcrJiGjjv+KS86OMOvcmPqyt5nRzX3dh50FsbuZ87F+vFMzVDjUxC+VfTvkhLlM2yVLnYPVtgQvHHL4dfsq3P1uVJ8Z04ON+fWDv3vb6q9bZL2pTNil+AQWpidyRuT+xBPwNS5BqVD7zUBl8NLSTqQU9rqFCWFo35ypCZTykeyBw8mQ41z9mD60b5QhV3+KP3CBQI0xZzQFCVqh/66+madZuA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jj5orIALVM6OiI+f5Ifea5GyjeIW1EYkU6G2URDqidYlCau0DLxb+UHdiywcUYmxVjRSeighSnBVt03ds5+kV2vBVgKtpY9iNvCqCgQrYW8ogGoxlMk1TspMsx5zi0anH00+zVoK0AyrBl+VMPwlLafowciOySs+oZUjZZ4nKjertnjq51Xeza8ssChBOSmQIuz08wg+Q5WvfigjnuybXLZ18dtPiOviPwL3RdiGSErxoP5KabUO56cAqQNrGSLN3jkzRg3vRLoLnZggv32iisPZ9jhtFf/nKj6rd2Oe/D2fPBLLe0jHMgIjd4REhNKuaO7qC6aXYeeBtFEG0E6z6NinfouTrnU6+FWG26MbTx0vXdU0Dud7fVMwGPQos2FO4827MUIXbWKORfh7+FE4jgnY92PSAIgV9mkPOSef9K16Q1EQRjnu4KPFpMe1+o/M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 04:51:55.0958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 709dd68d-1592-4a47-e600-08df07e4bf32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8997

Wire the client metric table and metrics DRAM address messages into the
metric table read path for the Family 1Ah client platforms.

The client reaches its metric table through the Ryzen Master SMC message
set, so add the two message IDs to struct hsmp_plat_desc and have
hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take them from
there. Unlike the test and version queries, these two are numbered
differently in the two sets (24h/25h server vs 05h/06h client), so they
must come from the descriptor rather than a shared constant.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index e8fac2d299f3..60889c1b1099 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -183,6 +183,8 @@ struct hsmp_plat_desc {
 	u32				num_msgs;
 	u32				test_msg;
 	u32				proto_ver_msg;
+	u32				metric_tbl_msg;
+	u32				metric_dram_msg;
 };
 
 static const struct hsmp_plat_desc hsmp_desc_server = {
@@ -190,6 +192,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
 	.num_msgs		= HSMP_MSG_ID_MAX,
 	.test_msg		= HSMP_TEST,
 	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+	.metric_tbl_msg		= HSMP_GET_METRIC_TABLE,
+	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
 };
 
 /* The client drives a different mailbox with the Ryzen Master SMC message set */
@@ -198,6 +202,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
 	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
 	.test_msg		= HSMP_CLIENT_TEST,
 	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
+	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
 };
 
 static struct hsmp_plat_device hsmp_pdev;
@@ -759,11 +765,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
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
@@ -829,8 +835,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	int ret;
 
 	msg.sock_ind	= sock_ind;
-	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
-	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
+	msg.msg_id	= hsmp_desc()->metric_dram_msg;
+	msg.response_sz	= get_msg_desc(msg.msg_id)->response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (ret)
-- 
2.34.1

