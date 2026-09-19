Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2536223A564;
	Sat, 19 Sep 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804134; cv=fail; b=RHGujX8wuGE5Wzw1i2vcfmbfzHe187HHjKomd6+9gwwEzkwPLjfn+GUQbb8GOTXGuP3NH1/ROzl5EYbmh2kd7ElObry5SwyMXb94NNOwsvIdQrhtGJ7FXWtZCNVs906ZfZ6M2uzUs6/A25ONuYwVX0uKd7RJHZsxg1A4SxZLIbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804134; c=relaxed/simple;
	bh=mKqZCQ3ZFmbDG3b04lEP4Jn+0DmWqFoO7Oo3miHiwyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZ9gJGS1A2eOmxbcNePEDeBZDIDbUXnKFX4lzRfDulOjGz3fWFTel2JqIK7nlvzl8ruyyc+3QNoEwkRLHMxHHUu1TnDHqaF3s2Y4LEypJjBqYEGwrU7C4Bit6VDx6V+8D45REpCHbG4fbkFmgA9Bp568QtNf2juSLp3+QREhAZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=blJZpsZC; arc=fail smtp.client-ip=52.101.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="blJZpsZC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMV/xxJ1PwV/YOaXnpW/D18/1rhDlbP8IibxihpInh833ruk/McTY5y/B5l7IbFo5ArNDWJ6Rkz+4ztuPtwjuTe0uFnRkkLdOmCGCG/XtORESqONkIy7kRfXoqte2y/ZFT49DKF9pgpKrBWTGBDSbpmLjb5iQ4P9GMPw6KJslFFTOz2XjLf9pt7nLM1zqVBigMmcmrl0Ii45oLzUQokz+Yn2FVbTeyKNQXpB64ulcUERP/7dn7a9eSGsy8mFakemKt2q5uf2Ea/G1AA5dhN83R+S3qrD03LS+SBcAV6Y633n7Yx6io2nyxie2B0x50lD4udozWz/ULKuOuj/Itzg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5152M9GpK9Z5j/YuGvDbyaAZTQibJSpiohO4e/mOME=;
 b=a0tNf73qv+rAnqNTTU5E1ZcF77Odb5f4F0DkbvSBferkeE6mdRs8WPE/bmRCo3IS+kc/xYzlYKwvsF2OVtMexKAdYtX4zBMfLTIICepbLMFG6xY2sc1fXEYBc17tHYcUv2E6M+xfbAzbdUiFIc62Tgg1bXO8nMkmDkIcbErBU/nkJy1aA9ttow6XxQ4pzgvbplTDxtAQVnd7nuuICnuHpv3wiGyvbDfc5Fol2oGxpjnQzruQc1fj2zFbYwA9p81+U2pxM032q4qiujxfQFz4n3QOq9C+cAqen+7HSNiasoOWKewk1QKmKfTBeLVNgs2jElAF4UpshTBBBa+1AmLWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5152M9GpK9Z5j/YuGvDbyaAZTQibJSpiohO4e/mOME=;
 b=blJZpsZChL4d74WrJ6dvw2k4Oqd54oDGR+FL4HpEW8FrLIEx9HSgY17v63cz2yNQ4eDPgWNtE7JKV/Hu87Wxc4Fr3rfFMLaI4fwoEgUk4h7eHFr6uV69ohhwPIvCvub8u0YwZ1G9YO98y6OCSz9JmoG5x7YJ22XhK/IKXuer7DA=
Received: from PH7PR17CA0064.namprd17.prod.outlook.com (2603:10b6:510:325::21)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sat, 19 Sep
 2026 07:48:49 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:510:325:cafe::a) by PH7PR17CA0064.outlook.office365.com
 (2603:10b6:510:325::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Sat, 19
 Sep 2026 07:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sat, 19 Sep 2026 07:48:48 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sat, 19 Sep
 2026 02:48:46 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v6 2/3] platform/x86/amd/hsmp: Route metric table through the client messages
Date: Sat, 19 Sep 2026 13:18:17 +0530
Message-ID: <20260919074818.2541775-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919074818.2541775-1-muralidhara.mk@amd.com>
References: <20260919074818.2541775-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 46300f44-d8dc-4795-d4f2-08df162270f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OLLJOfj+g+aDiPOGWHc6KSfiFPycdRg5YOB5I2ojY48j76uuLpKAdIkFSkJ1TyQJCj8pWX5EQszDBTdbl40GbaMlX8F8GanAeNX6I0VuA/ndY+HBufGgBqre+PY276PY9I0lUBF0QHEkFD1DnN7CSfu0VSlET3+fCMw7QJ7M36hO+iOnkO6GqQNZbwebsQa1TxxmJf13e1x8O4STFR9knTTCTZZgtOz5tCZ7vv3pV+jCwZTCf3/xevjtQOMWN1bJ3Orrhk4dUn3dhRUKcirgDwTlQA9Mw3pW5j7i1FO2O/xKEq89i8ZmAc5zypmhyVBu6RVGYORo5t6ou51HZ6U8DVQlrDuAjCnXP5unA1bo6p8fTs6mRClp7nddZHvaNFZZBYA4i5mMhBbx7rsNMofyMgNmjcWF/0McePMLfHyiwse1JuX6+/7Cp2CUCw+SgPYepeknGmBzjFVSsB1d5C/1yUNAB4/PpaZDg9lEVh2MHwiyJF1ro5iCC2CGiYgmUTyF3idlpS5EM2EOHBCq4WnOmqoLp0/yd1SvnSsQfgAluyTsOR1bVgw32jFsbbYonbA12MxqNnLbMxOEmDsdesiFWwyWekJCJQwZgwBN2kmnq6b6SiAAE2wciS75pSgjRcEU7GrtLG00nk0TMQS/WG3/JR3ZLz0vTYSa9E4Rklab1Cw0K/zTx1iX4p3vZIlsEGjj4IdmNlb2KqgXteWVr4olMA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KhVHQi61EZib0ZTiEwWXYCw81DPrRAoT15nBj6y23V/vrakr7avi7TrmtfSzD4Hk21cmeqPSXyOPCACKoMGMLKwne9OvAOkvY762WPb8Ps7Zq8u0sJ1yBaDKlkn6hQtvJq3g1JbrCCLdnfrW0FN22UHr2yPEifk/LSSQuACQskk9zZPSSvG4HrJT3sQlKMdzsO5Sn1idiEE7y79tE5blR31pxu/g6XJv5R2w31XX6JemEJmoRcxuCk3RWAR78T193TkWqoci6hu8MF2Ljqxoku/lyBqW3YRQpkfMMgSNE0GRQjZYmhh3aNZwc/T4HLA3MrLA1TRffFuxaDm0Ek0V9Ui1/Z+COjn+1eaIM6V594Sfe3EiXLk3i8thwtD9SJuCWU5WOr17q4yf+8RT26uc5WlWZfTYaO0ZdjG3XNQ1DX0kxIKikm7/rCaXT+DgLYD7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 07:48:48.9305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46300f44-d8dc-4795-d4f2-08df162270f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241

Wire the client metric table and metric table DRAM address messages
into the metric table read path for the Family 1Ah client platforms,
and fetch the DRAM base for them during ACPI probe.

Add metric_tbl_msg and metric_dram_msg to struct hsmp_plat_desc, and
have hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take
the message ID from there instead of a shared constant, since the
client set numbers these messages differently from the server set
(05h/06h vs 24h/25h).

Add enum ryzen_master_proto_versions, and gate the
hsmp_get_tbl_dram_base() call in init_acpi() on
RYZEN_MASTER_PROTO_VER1 for client platforms, guarding the existing
HSMP_PROTO_VER6 clause with !is_client_platform(). proto_ver holds
the Ryzen Master interface version on client platforms, a separate
numbering space from enum hsmp_proto_versions, so an unguarded
HSMP_PROTO_VER6 check could misread a future client interface
version as a server protocol version.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 arch/x86/include/uapi/asm/amd_hsmp.h |  9 +++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |  3 ++-
 drivers/platform/x86/amd/hsmp/hsmp.c | 14 ++++++++++----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 56317e9298b8..9641e5977c2e 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -95,6 +95,15 @@ enum hsmp_proto_versions {
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
index 8257cd1da48e..8b4bf57c3485 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -557,7 +557,8 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	    (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 3e27287c0517..bb1f130806ad 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -184,6 +184,8 @@ struct hsmp_plat_desc {
 	u32				num_msgs;
 	u32				test_msg;
 	u32				proto_ver_msg;
+	u32				metric_tbl_msg;
+	u32				metric_dram_msg;
 };
 
 static const struct hsmp_plat_desc hsmp_desc_server = {
@@ -191,6 +193,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
 	.num_msgs		= HSMP_MSG_ID_MAX,
 	.test_msg		= HSMP_TEST,
 	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+	.metric_tbl_msg		= HSMP_GET_METRIC_TABLE,
+	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
 };
 
 /* The client drives a different mailbox with the Ryzen Master SMC message set */
@@ -199,6 +203,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
 	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
 	.test_msg		= HSMP_CLIENT_TEST,
 	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
+	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
 };
 
 static struct hsmp_plat_device hsmp_pdev;
@@ -753,11 +759,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
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
@@ -823,8 +829,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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

