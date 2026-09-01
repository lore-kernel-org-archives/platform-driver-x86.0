Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD86379C39;
	Tue,  1 Sep 2026 04:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238321; cv=fail; b=lb5qBGJ3hydER3R/O80kx7oAH3K80dGdbedVCEjKqRPvvoAkG6hz/5TxXP0Gymk1yOj+Ium87Qdk6Qe+xpXEeHMPQdixNXAZ1CiZs65YPiwWjLy74PhvXwH0MMK9SLTjDu84WYS3x959kQQZbob8LbJ4fcAUDq2BZ6XmpBKDilk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238321; c=relaxed/simple;
	bh=CQPgNRRqbbMGU70Lv3a3tXOliWSoN2S7TowoPGrmJ0o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ng4SGtvEf1s45J53i4wDDPIHy6UQHcPFH01dpTl9JBchLNiVmNzEfLyLK/7Q/jtJjAz4zfSbwLmYICg8kR5bQDGxPaboxkEZHmAvMlMGp8f/3N+1YouzPNfgJS4oxGV3242gCRgnneCW1phkokOStdTsgy5dGVSoHW+a5kxK06I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qZtDmloU; arc=fail smtp.client-ip=40.93.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qZtDmloU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwaAn91EuKQVSeqaDIcAe9zcXmi3PZZrThWuVFtmkwEyjvXENUPmAk3XLRmH/rpF89uENgXL20U9y+M4yyZtB+Iu3S3J2XjUu90MOqVeKit1kyZnP7YWnge828vgcJqALNtdV264sGilUqgb+d3S7I8DsFutxIvbpTMZUK6i0fYoe+v8s44idhdfcLUQ1tbL+sT5JL0HFhil5/QBWwaEPhZqILXUMx1e0fKzZlhorY0fEBpV8+nrLPimdo5iHdIUV2VteZdRggVa5B03Abi48Cm/tIhsB49n8LA5+/6jxVK4/Lqr8rdvGvMp+y1GyH7n7Lr/Zl8EV9FPHnA3dO31aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qIB1s/xsd1GAQNg9yXyyHHUmRC7/rhc8gSURABP+2w=;
 b=x7pIVBVMpdXGsr9H4V4e+zzHJ6u7ahGC7G9ZOG2rxjLZGFi6OrYlZd32LhvWhGnI1fltmbTVUnNdCeHhFYgGXf2cYGqkVW9LbnMiXUmH4z0V2Gyb8fD4rKUkP/gk+G6hyzrB8W4+P9iCWlo6UwRmWzvIT6AqcgbVxfCFCUmpOnPy6MiuYdj9e9KYVSFOcsnet213QZvNqQQZW+XZlCNDRjILa/1Rr8PV2Avr1g3XJI+aAFibuiTsCmd5CW93ZHCw28bvQZmqe2og7sv3WcEFS/E72AB928ojez3SXUeh64jL7igroL8dN+nthnKemiQ8M6l8hak5xGjuO1v/TZojHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qIB1s/xsd1GAQNg9yXyyHHUmRC7/rhc8gSURABP+2w=;
 b=qZtDmloUZNSWOopmJJuwzxaR1F86Vdaa20cVlKw5sPSetGV2hhBLpyjU3ovyuE8aODMUsU6742nwH8sN4ENrFtCq3PFH6e5T7ut+zUobmp/nVZ9jtsqOpbFqOwiptKcna5ot0NSVPVv2B3hPMNQsA37kL5U0716wG+zQLUGOtnA=
Received: from SA0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:806:130::25)
 by DM4PR12MB7768.namprd12.prod.outlook.com (2603:10b6:8:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 04:51:57 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:130:cafe::34) by SA0PR13CA0020.outlook.office365.com
 (2603:10b6:806:130::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 04:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 04:51:57 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 23:51:54 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v5 3/4] platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
Date: Tue, 1 Sep 2026 10:21:33 +0530
Message-ID: <20260901045134.2833282-4-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DM4PR12MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ddb8cd3-7ea8-4985-993a-08df07e4c0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r3IMvR7d5aEQeSml5gshajyri7lBFkwWiJLy3nDvg8UVW/HuCj/EMqG7G/F4+iEmKDlbfQri9x1QyWhRi+vOCEp1EIgYhPbdQZj2j8U+4ZPd2d1ejXlbofjtcRzqP9jJTt/ag1ys2Ep22m6EtMogW5uljpO83yFmHHNW5FI77iZk6AIIKi2yB6WjMQIfzSUSdhN1nlmaYUArhrjAav8NZJdja09bsf9UINcXu07Eu6LDkEPQCcFUSTyFd2oR4P6no20nLQpxp6n3c0JWdn0DRcnNsj0DePNOlx596THA0FCz8MZAw4UuVV/mS7M/pOIuk1fXka4ot7gRtwQ/fUZFDuoKSM2f5/XTUbbFihkrSL5Nwh2tRQA5UBG4UBIWWPIE1GGTuYHP0lFqxqSszgn+j5uWeSCufgkHzlQhZfQVipD8xLc30O/ljnXY5NYAqTtZwMKIaOc5cTGCMdI0NhmXEAbAwYIUkG1k1Rmj0vVHF8UvWvF3jtuqvpAjVeULv5TyPxOFuIZCY3oQLUPqBsqYWQUtgs/YPilXujB818al7Ex4FakWVVvQDsLGrMNyjmq0YDTZAl4c6QbotFWWJeyP2JoP4khZBwddC7RjujX+uxIc+iB3928VOrbaYN2hQgJQAE2pXh848L0WjSKNJIJevY/tfLAZf7NVU95TAOf/3qaBGiIoW+NVdhXHvWMZfn+cClsT71kxVS769TR0sAw+5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VgQ88m/unJ0e5f+/nCtc6FuIN+EDLWqsL9iw4zB5aFknk108WBW54edXmTea8vLuzC1QyI8ntviOQCz/9/lAn9QVVVfsJtmYJG/QX9KH3Vlge8+pWHCpoHqhzc3qoCjl6pNR3pM67f/ELTD6Xa+ZGhhOD492Tsxk8825wlOF15lsKGtlkXbtfufvOzqfgT6wJevR5ZAFCK/AhWrKSe5qmCBTxNDpUJhKIb+Ij9VtKG2jF4rfF/wG0Zu0APapM7n29IFXAP7L75d4LGcm1/qEsWqiIxuP8k07wpEcjZN69MPfBHMApkquxQudpWcuOv5RBcIlS32bpQpS8zN2ZE9f41iFpjiVZRVechEGxO7pa5Xw7zysb0gkvIrCz8c1+XMRpa8lpVBh0WLXl+WsxvwIlfhvGu40umks61qL7jnfxXBTirMw6CJnBNVCIVKXpLWu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 04:51:57.4921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddb8cd3-7ea8-4985-993a-08df07e4c0a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7768

The ACPI HSMP device (HID AMDI0097) on the Family 1Ah client platforms
(Models 80h-8Fh and E0h-E3h) describes its mailbox the same way server
platforms already do, via _CRS/_DSD, so hsmp_parse_acpi_table() and
hsmp_get_uid() need no client-specific handling.

Client platforms don't report a server protocol version, so also gate
the metric table DRAM base lookup on is_client_platform() alongside
the existing proto_ver check, so client platforms get their metric
table base initialized too.

hsmp_pdev->proto_ver holds the Ryzen Master SMC interface version on
client platforms, a separate numbering space from the server protocol
versions in enum hsmp_proto_versions, so gate on it using its own
RYZEN_MASTER_PROTO_VER1 rather than assuming every client platform is
ready for the metric table lookup regardless of interface version.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 9 +++++++++
 drivers/platform/x86/amd/hsmp/acpi.c | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 00ca7855ca00..3e1b7cbe0f04 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -95,6 +95,15 @@ enum hsmp_proto_versions {
 	HSMP_PROTO_VER7
 };
 
+/*
+ * The Ryzen Master SMC interface versions its own way, reported by
+ * HSMP_CLIENT_GET_INTERFACE_VER. It is a separate numbering space from
+ * enum hsmp_proto_versions above, which only applies to the server set.
+ */
+enum ryzen_master_proto_versions {
+	RYZEN_MASTER_PROTO_VER1 = 1,
+};
+
 struct hsmp_msg_desc {
 	int num_args;
 	int response_sz;
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8257cd1da48e..43d746546536 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -557,7 +557,8 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	    hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

