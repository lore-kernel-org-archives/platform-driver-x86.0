Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7F33B8BA5;
	Sun, 17 May 2026 15:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030772; cv=fail; b=i+apHOtnk+E6BcIyC6BFhpj9e9q4GwiY0Hww6F0pZw19dVFgXmrT/UhzVZYW7r+4YSmPWRZOtw2FlpRGXjsXSp7M9gh7ykFE+wpI8n7DAnufbz2S5coeQSljqf6/59q/RsrhxwYrdNy9tucvJOIaF1+RGCEC9ayvtHQbBxoz/4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030772; c=relaxed/simple;
	bh=1GsqC3oGbTNhjp/Q0co+4N0mk3PTf63mzBL7Mpf2kzg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZdLi43dsOvYHoCv2RuGnAlVaJgLqEXy/OgYDzL8EBrPD9JOqIOBxoVeJ6OrTF7yW4QK66Iic7lT/Ss4YBodfCEtSohs4aK1ZtstCKU75o0ws/f31BY5usiyjms0kLQlAT4YOiAJp3xWi2aWwBfe8P83lxlBkoLKz0c7BQWHQqRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U/lXvzfb; arc=fail smtp.client-ip=40.93.196.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U/lXvzfb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgKPg5z9jLY0PNlvXNZf84WLaoPhoWXP7yhneAGhpMkqP6qTJNjhGwn9Fyh4fKZD3wEKVkPxQ7eYLiFR65UtrCB1afH4fwe0wFM1bfQQIt9dNLH5Rh6/CSRO++FAkzEI/6oqlvjUdHYmw4SDeBe9bPtFzgebOOMW2FBrLHwnLSdlglFPjjsop+bU5KhpcJGR9isQNkM209/whxA+B6V5fjXw8ItsILDk/m4cFqzaUjGsy2ytNdv7OWXTu1VFxb6DjnIVYvk+Sco2JAxNBIaYzvRILbxwQAZPxFRZQaQJ2QLK0AfFGEfznk6LJtPYEjGV5wo/3rBJpGj0Hcd+EGZejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJ0o0ja30RSVOfKnp8EP24zS1mekGAZvcQyCYNKC6Ns=;
 b=RgED6NIRghrIqnJKbzDTCOE5LWu2QM+0EeKbEnMNNxd/ctwQPlqPEgtlfrvHjyRr2eEuPHOuYsQG7DkS5Upx0BsJqgwOiuWRfeyQPmVD7sHlaKSpjQ85YwdDC9mAdNrhA52cz2aSFzfGZeCDtMdRuAaI2yhxiE1XSwlI4Sia36ioj7/Hxsn9riLHPZ3mfZ+m8zq1Ivu++fPMOivV4U0Zn4iXts8tzYHsQ60lQVaLTiyYHWCYgdPVYOdn8j2ljjKM+TF0Lu6NfBG+pmEZluG+SxdizgVqkRtRsvfzxhuXusAu/Ku1NwCdD7gbLwfxAfCO2lDLe91RH0jiLAhOmROJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ0o0ja30RSVOfKnp8EP24zS1mekGAZvcQyCYNKC6Ns=;
 b=U/lXvzfbT40zT7NSxHUM2xiZ7w/diW43498QlADDx1XPUb+WvtTl1XsXNJG5gor+aBhXKo+tpQrQKKSD52BUgGyqRHR9XHlRDqvTn54S13DPyzuSHNOCfJlwsXL5cTgo4onyNDknEyoGoVSEfNUXfbLQ6sapG0lY8xOI5VWudPQ=
Received: from SJ0PR05CA0126.namprd05.prod.outlook.com (2603:10b6:a03:33d::11)
 by LV2PR12MB5893.namprd12.prod.outlook.com (2603:10b6:408:175::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 15:12:46 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2c) by SJ0PR05CA0126.outlook.office365.com
 (2603:10b6:a03:33d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Sun, 17
 May 2026 15:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 15:12:45 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 17 May
 2026 10:12:43 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v3 4/7] platform/x86/amd/hsmp: Source metric-table size from firmware
Date: Sun, 17 May 2026 20:42:08 +0530
Message-ID: <20260517151211.415627-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517151211.415627-1-muralidhara.mk@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|LV2PR12MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c244b3-2d3b-4fe3-0b74-08deb426c016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|3023799003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5t7pu5XiQJnuBmG2cwnPY8N/KNqvSVWjM9M0hcfwyUIhg2pwIBqt1l68qX2fGYAGxfiXrEFT3Q/E76auMcP7xW5ujpwtjGfIXB/m4YraqpqUnSzGkVmqwnGNNi6YMHYqsr7jtjsgHVfofx5Pi5Zl5UeEB8iQMKp5mzrMYib1FRXG44qiJsR7k0a6Dveduk2PSn91fT4Ho1/E3GwZ7KYYaP4V/W901C6WGPMLuHsKAfS4xsKMATelLWXaBpFKO4pk+HdE5kf/19PWwuhpER4tRg8f6DcbTFfg30/tqG8qLCHmTbaCPxO+uvgYEaqvCQpAtYl5fw5lUiQbjF7gnW+zxiLKIMNxGb91v663R34ZhGiP+zfb7v91yOStNObQWrYrhidPLietwPgjscZxIfdAZelYz+OnNItHdcR6+pwSyCJsiuXGk5aVum7K2VE/W+lxVR9hue1xfudguRDDlweEOQ3HTK8qeggwEanqA1LT83ibIAEGME8fgKvheX1/MShIUlxo0tk02DLcM8JFG6NcXMMWDrSndDGXDdOorzUpRkjXggJJv5QHgUKI94rUTCeqElD8zyMbR6Kq12hq8MqChkj6r7ExbqZg3C4p/BRp1SU3M4Jx4rHl4LA1id5/n8d1xg3PbH5gyna982XQDb4ut3VZ0tM+oISPYDt599pwmfPLyax9+1NhxOUiTqSJRi2vM2HNsDcw/0mICLAZRoRTQYF28SGTr6zV6SJbw+pB/8o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mQ4whrIBoEvBUgstyhkFswfpDoHA322oERbzJqpJysycXgMSJyXBifmfDx7OoP4LII5VTtXh/abdYYtcM+2NoEHNGptuzEB9dxbX8oFJD+JDB9g3i2P6KqxH0/KJLR3b4AkdmcHeM9rwStFtUtDd+kRbQApOHYY4UjkCR1YjOQjaBA7OfgDMl2r/68W27ljaPCO3msB/7E4m7YfvR1O2+/eDcTq/mBmU2pwE51WgvfkLQ1y0/+RSbf45d6IRFk6Fi83qGTCSDoW1g60tzbRJ/Wp6ikQaGlJAvwYXlylBm68BBuTjIWKlbwQsRaSr4nEIbv+vtdeNxj3HH/T6dKb6OoJTjqpmqtNkrEahCrgpDvMF+TBzGhY5cuuwAA/Vh+40gll5VT9iKXGPQIULCHJzTVvdSHrjxFWqY3TGDL+lvBACBBZ0k/lXCmqazhW0bgLs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 15:12:45.6274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c244b3-2d3b-4fe3-0b74-08deb426c016
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5893

The driver currently hard-codes the metric-table region size to
sizeof(struct hsmp_metric_table) when it ioremaps the DRAM region
returned by HSMP_GET_METRIC_TABLE_DRAM_ADDR and when it validates
buffer sizes in hsmp_metric_tbl_read().  That layout is fixed for
HSMP protocol version 6, but Family 1Ah Model 50h-5Fh uses the larger
struct hsmp_metric_table_zen6 (~13 KB), and future processors are
expected to grow the table further.

Pick up the table size from firmware instead:

  - Bump the hsmp_msg_desc_table[] entry for
    HSMP_GET_METRIC_TABLE_DRAM_ADDR from response_sz = 2 to 3 so
    msg.args[2] is read back.  SMU on Family 1Ah Model 50h and
    later populates args[2] with the DRAM region size in bytes;
    older firmware leaves it as 0.

  - Add size_t hsmp_table_size to struct hsmp_plat_device, holding
    the metric-table size discovered at probe time.

  - In hsmp_get_tbl_dram_base(), set hsmp_pdev.hsmp_table_size to
    msg.args[2] when firmware reports a non-zero value, and fall
    back to sizeof(struct hsmp_metric_table) otherwise.  Use the
    same value for the devm_ioremap() of the DRAM region so the
    full firmware-reported window is mapped.

  - In hsmp_metric_tbl_read(), validate the caller-supplied buffer
    size against hsmp_pdev.hsmp_table_size instead of the
    hard-coded sizeof(struct hsmp_metric_table).

Behaviour is unchanged on existing protocol-version-6 hardware:
firmware returns 0 in args[2], the driver falls back to
sizeof(struct hsmp_metric_table), and both the ioremap and the
size check produce the same result as before.

The ioctl interface added later in this series uses
hsmp_pdev.hsmp_table_size to size its kernel buffer, validate the
userspace request, and copy out the full firmware-reported region
for protocol-version-7 (and future) layouts that exceed the
standard sysfs PAGE_SIZE read cap.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes:
v1->v2: New
v2->v3: None

 arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 11 ++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index da3e3bbfa33e..b86bbc929395 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -342,11 +342,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{0, 0, HSMP_GET},
 
 	/*
-	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
+	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 3
 	 * output: args[0] = lower 32 bits of the address
 	 * output: args[1] = upper 32 bits of the address
+	 * output: args[2] = DRAM region size in bytes
 	 */
-	{0, 2, HSMP_GET},
+	{0, 3, HSMP_GET},
 
 	/*
 	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0/1
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9bad58fef304..cf9392f99298 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -356,8 +356,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 		return -ENOMEM;
 	}
 
-	/* Do not support lseek(), also don't allow more than the size of metric table */
-	if (size != sizeof(struct hsmp_metric_table)) {
+	if (size != hsmp_pdev.hsmp_table_size) {
 		dev_err(sock->dev, "Wrong buffer size\n");
 		return -EINVAL;
 	}
@@ -398,8 +397,14 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
+	/* SMU returns table size from Family 1Ah Model 50h and forward */
+	if (msg.args[2])
+		hsmp_pdev.hsmp_table_size = msg.args[2];
+	else
+		hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
+
 	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
-					     sizeof(struct hsmp_metric_table));
+					     hsmp_pdev.hsmp_table_size);
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index b153527e0a0d..e7f051475728 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -55,6 +55,7 @@ struct hsmp_plat_device {
 	u32 proto_ver;
 	u16 num_sockets;
 	bool is_probed;
+	size_t hsmp_table_size;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
-- 
2.34.1

