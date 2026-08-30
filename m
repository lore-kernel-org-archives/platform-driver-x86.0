Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7783B71B1;
	Sun, 30 Aug 2026 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101010; cv=fail; b=H2BzwMVvVCGRakMrpHruUaNMxuXr8SGDxMUyiefMa0R8PuPDaiLKb7V0eWXKWnQfZLvUUduxHf6kThcgMkS2Es6EjZ/PytP+UNHQsujGa2vL84KKdcPscN6dVJn0MYmDBY2jW17tpK2gqWBRCjBrEbW1azUtbCgKFE+DCCmGdSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101010; c=relaxed/simple;
	bh=xzxbCwciAV4rzb+ZTsf5yCReQy459lQp4KfNLDcxomE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsxkoYXaHuPmpbsbVUOeY3hASRDh1XooeKnZgXD3ZGF1QFZimP3DOUNbTa4h7rnntoSWpMIM2hOrt1pspRoNaq6oMfeiWSq8O8FY79iJiZ/qr9/pjqX+L6q57pL2SpXAMDXbL7CV3lE1c7EqVzo1nzzzbbq11xn6P1Ws8w20ILA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mHq+foQi; arc=fail smtp.client-ip=52.101.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mHq+foQi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnGnJZPouZAaC+t10mGG3ZVPlf2eWgMnaZbFgWD5i/S5vIdLJ1Nao6NX6jUObsjzs6Lp5JU9lkgNXHCVzYCV+ZCCM1Ba09TXseNMtXiWhL85iUP27QsP3m7eEB8mKtEAc7NuPVjeOr7GeetoGY8HgfGfUibe+1Gh3cmAn7wSi4sEjWf52ZFxrvIUFk49Sp3W5WPa40RrMYfEsZ4n0mBedHZTxMPdSeH1IQ2xeNV+70ltTVIBthvps9c7y1ShuBZYREQD6I+i6lYYDhPu942ABVRuojuNArWt4R6JQMHZ3fJqDOylbIT44KAVKXhDWj4fClSZfop/hRg43rrGV/sX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ktlIKXD/Pv6lP6r28XB9T5jXqr1yKyO+uJ1PboY1AA=;
 b=F/oQVMvQ/zAe7Ch8Zns+NHCrbfmk+QsqzCekxVSsHGLoHRnU28kI7x/sU07QsZVHimv6E4x17SpwhnU7yR1jH1eSoV5y8UD0xg6nsRwB20PO7xoPQtYzHYFvOKuW2A3goOlNwnSNlM7XmtHKl5SfeSK2ICE4dMGv/bQ/IW6AC8EHjX3EGAtlcJ4M7qURTNzXNBmG9TDW1oQ0uqjKNEZqj+SKZk6qDg5rvgP7PsoSYWNu5j4DGI7febr8qqfTr70f2cjws1HMLY7+2jRkyy4Wc6xh9ORB3Ixe+AisXLb7l4fmw0mDrnTYOzcQbdNYo2EXD1yozDqh3t4X3knJWllPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ktlIKXD/Pv6lP6r28XB9T5jXqr1yKyO+uJ1PboY1AA=;
 b=mHq+foQi+OKkfXSwPYeySQXG1YP/jV7h6fpbFcMX3yTUU0EDIKfMOOVsUFVGwxoKv1pYDq1kIAOBDLi7b4TttFfedpImvUXohpWhDo/+kDUDYIc56O5atq3qrSArdtzsY+//QsS5oCo5e/T7uCUsnMDXCp18YSndeAo8cy7W/DQ=
Received: from CH2PR14CA0019.namprd14.prod.outlook.com (2603:10b6:610:60::29)
 by DS0PR12MB7970.namprd12.prod.outlook.com (2603:10b6:8:149::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 14:43:23 +0000
Received: from LV8PEPF0000005F.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::5a) by CH2PR14CA0019.outlook.office365.com
 (2603:10b6:610:60::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 14:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005F.mail.protection.outlook.com (10.167.245.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 14:43:23 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 09:43:20 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v4 2/4] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Sun, 30 Aug 2026 20:12:54 +0530
Message-ID: <20260830144256.2113643-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830144256.2113643-1-muralidhara.mk@amd.com>
References: <20260830144256.2113643-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005F:EE_|DS0PR12MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb372a5-b75b-4cae-e21f-08df06a50acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sQywcT65ZFCBin621Kgaz/HQLGddYxrjP5SvQ0w20vZvAAWBDpRPlJ2k8FvUaG/cfU0+3S5hip3wjI6CHzAyBkQIgYNZOm5NqUEKUP81+4BtlUlc5Vv+78bSMHprhS0KxHz8+uPSa+/pysH0mxLKoUycAh+pMbolKeGbgCvA5eHqSFkxHkyXXvvfu51J1E2oxuw5E/qIS3Y827FKUWM9fmxyHEXs0F0Jk50wUS9FEtw/KamaXQMgIaYOD2iRsyYmKprQQ1UHM3XBb3HOzT8E01aZDXAd1DDNtXMQ/p4jEw8gdAIvoSgI/3Ra9yBCIN9hs/t5xmTz3bHnYSdUzQiFlst4fr//J3gpvLgDGvdQRV09BqU+a+tpLQl3rszKl/e3Gy0Bjwc4A3qWDYu8eWJuY+I/GQDBZvlookfHmx+GVpzS4FSN60OjN2hQ15jaVJlEuMbwxz4/Q5pxNUZpB+TeWVEkS9Bpx4D9uMW5ldiBQMr1SfE1Ce4/nz0Gi02V3TlhxoJjtt3E1xVx26nlN7amAJp8gB9Ae+2Sz8/0WD3aL2XZN0GV+w91dQ5urJIwYJNf8qDTJiC3X22lNfRsYpix9kdjfg6mdynVIq+tHqrsYnYDegBa0h4oUiQogGPqm5KRtOELgWx2rRcNGu114NCteRXSCppW0G7xIj/i3hm4GM7JUYOME034GiNmEtXS2Wlk/SIdch9tAdS/iRJtK1Tp/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7QzNaw8G1+uJNqQxiz2Bgh0GhIBXMuVw+UaTO6EE8RVnEbnbJNxGDHb333S4ZH8pGmyK+lKgwH4FJH8KcwFuRNKj3uyRxM0Ri6iv7CvHHe5Tqya8/3mbbjYnsbjBLXi/BsQ2A4V2CyMa5uQGZ+J+uMU8lYLXs3tSkgkSdQAgjQuavGcZJPn0loSuATkLUeMxiMcDHpImZQlFY80e92FhoG1Bfx1Om5hd93Ojgb9OPNbeTWC/5ysfPQhCATxKDHWpXIQ8mwsGs0WunjWejTIjBHNxaFI9MTNSSe0q0fq/WfCC9sYUKqURt7qQ4JH25qOYtFHqs317IMzNlrbzFGDXKWh+lmBnVCAIh8t5LlYUF1atYZxAqwCMb/RfrWfp73gmS7/T7URGmg1NKwg82M0NvFxz/ziLwN4xnGA2pQNup6fUzPVPEhDsmLj3VdzmFW2h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 14:43:23.0007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb372a5-b75b-4cae-e21f-08df06a50acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7970

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

