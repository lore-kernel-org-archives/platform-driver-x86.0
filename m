Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D5D3AC0C7;
	Mon, 27 Apr 2026 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305139; cv=fail; b=fA20FgImkDpd+1C7M0PParIOCgnlYv0gi7bm/Abt65OPfPluv83dFfAlsmUQuFK3N+365ySFc00IvFp8A8ef8NPKY44yO26gnm4ZRUNSuEV6VRsec4QQliomnKDt0Cp2i/YLsYv2hxsFN7BLd95m/1sfOmpir4vi3LHOtzErd2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305139; c=relaxed/simple;
	bh=qdThsncU3dnHZ5TnWKzS+5xbW8UuRq8rKvXmYMO6MGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NaUE0DOF9qR300KFEhlZ2Ukb69o+5JgWlPr5khoRR4wpReJuxpLpfDvQa7L9ge/qtdW6rl/a8sE9JOBQLiq7ol06TVstwlBqymNAV/IivBSPoMJTWRibIt4xWZPWGfKuKqbmq/HbFNCAtoBhPWy85UJWpW3HA54xT031mmgAdFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=loWH8HIy; arc=fail smtp.client-ip=40.93.196.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="loWH8HIy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPfvVWcu5+Nti2gbXJpjXv4kyQdiFLAW/ZmdUyC/FMMSmWhuaFC3oFQ00D+bWBfYpD/3Y7lu6I5V/NN7ARSkojJj15rG5G96onyUtqWiFucn5ajgeICxLv5leYl7cXMnL0GQTO3XEkV2xhVhraEM5KpHOnF27e3qZIAKoysYkguXVIJodRIgODewx2s4WdxQ4J8XDsTBAKW894mbdJjon0VAag40KYUL4CXTXHB1DqL6z3d3sX43MoBhWDLSLLAlmj8dX0FS79iKSCHa+GHK0LFvFCcT2OkF4mbYbES2YqpZYVefzMyrLFJ4HPutEmOJjLIl7Hph/FmU6KsCovb1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jye57UBABz4HQurWiqkiCM6y0TqHC6RW9Yn54BRGzBU=;
 b=ca4cUrbDMaZFbtM5YXpI17WGDNNJNBHxkIwBvFeq2lfL/UMtqZ2znHfML7aHRECP8bGpxGwy2/OKxxmtZ2yccoPSKCJdFI/DgdPtHQhS7UBijb3xJsIZ9yWXfOMmWGyoM8RfqLnlqdbvppnghB3nvdmnLtG67a2Yzr5xgC/oo3n40qGNn6J3ZH2AoxHXtzIy6eE4XP4Za6FpGFaXbYppVkTf6u0h0rNfGJKykpPbhaKs6YRAMOmBIuk1cgQ7KvM+6QmiPlkoyoeYALqCiZ1Ewv5BqP18WKPbpiAk/x+N1qVS6KZiin5Kc3gqPSizBXe6159ioDwtfgft6XVWR9Fyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jye57UBABz4HQurWiqkiCM6y0TqHC6RW9Yn54BRGzBU=;
 b=loWH8HIy/CZh3zFxE0LiRr9xaDfDU3EckL7HX+9GVSwBCI3/YPyh5X47o4ZeNMtNyTss9knMLpRN1XpAZKN0b49ioHUgGlRqE/X86OXeA2dlX/ljyP0GMZTd+Ip74bIPWU5cPVSlaWJYl61reYrqRT2oZ4CxGJrzz4t6MIovuJs=
Received: from BN9PR03CA0129.namprd03.prod.outlook.com (2603:10b6:408:fe::14)
 by SA6PR12MB999200.namprd12.prod.outlook.com (2603:10b6:806:450::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 15:52:14 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:fe:cafe::44) by BN9PR03CA0129.outlook.office365.com
 (2603:10b6:408:fe::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 15:52:13 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:52:08 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>, Muralidhara M K <muralidhara.mk@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v2 7/7] platform/x86/amd/hsmp: Support SYSFS_HUGE_BIN_FILE for metric table reads
Date: Mon, 27 Apr 2026 21:21:29 +0530
Message-ID: <20260427155129.545327-8-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427155129.545327-1-muralidhara.mk@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SA6PR12MB999200:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4b1e5c-ac8a-40b3-de0b-08dea474f352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	czOz1Y6UwyMINcTIfg0oOKTM0cbmluHuScdLVTa+AtaFslXj0e4KJF26cZqta8EBBATLAFsb8dXFdLLeBvr5R32yx0TNUDqzopUHFWivPBCyztzGbsY2SNATU56BUyyKMlkE38ZkuGI8NMr7uJPZyL6ghY2OwN1uPIgriIObtt1dkg3ss4k3Ho6TmQML26dRKaTYDbSiTFC7gvhp2mAwLMlCInPojrEsmc+lc2PUXlF8hxO9KeNUwCTlbgK6hJ9AOAj0oU39nO9zy0OHVdjzdQEHbKdiHZQmsTM+GE+kxdLYKbovx86MelzPyJE79vgwVQQcHHXrFaT/4B/5SdZUX0SVSrogZrw8e+cZTASQdK2JeVbaRIT0avHMVpc6P0QqSH0D98M2upnFI68YGSXZmYcl341ng2/1x9VT5uItDxk6Cr72OYrf4C5fPQP2OyApuuk6meT0+VWOh9D3H9c6DjOKrkMxkRyT1ihnuA/qLW0T1TUi20jDazNP1Co4jyQxyzIRoTDktLpMhnIhUowROaFbMYepk5+cJt3HFfqBaUUTQJvvw0yVmSp6nwcuNz7fuCtnFX6aN8OCeNS4oxpT2Ugi/oxg9bMfYK+CeoEmk47uUQMiADayCRFBq9kMz13dPbyqDWJyRuYRpXmSUBviQc+61+rE7gu71odduSiyaVJCP9T0fRjQOc4BDW/aCa/KFrjtqEaiHZG6EgjF3N+z/d0fHmNkBPDRvs5PNhM4tpKqejb8GwiZ7wsIe/rADe3uhDld76HfjRMtnBja6unYlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2b8GxxF51IBjnERSjM85iOfW5fNwdgxSWN7sz4NpYg+NGcH+FBPTJ4nEdiBwF6sTKZQNEUD3i40tXd4sij4DQk2zWXybxkQIrbcIT8J1110cujF5KlmzEclzAgippX3t1REbnuck7NRWZ4D0cJcxLC3Jvw1cvwNTZLPTZLN14MNbP5PoFjD8KpsbCzsBMpSh5/6kzRv2zAosrMV14WBJ0OEtjS9yhnbnqmkQ1MqgV+0FF6YVXvTOYsnntJTUd19PEBXAyhAZdhWe2W3yeOKWyrc+tb1ROxsigRejtCPObTaWPny+qmZPGgX3JPNeaVc6V0xd6Eqzaylx0K6sT56w0VDZCVUj1lUKpa+kwpdLYBvUpXbAfKO73YC/5Ji4GvmIDWfdB8khZCc02XRFzJwkn5GStM8nUlzEtYoYu2giVADZ2B44pz3eOWrnL387fR6e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:52:13.8191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4b1e5c-ac8a-40b3-de0b-08dea474f352
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999200

The metric table for Family 1Ah Model 50h-5Fh (hsmp_metric_table_zen6)
is approximately 13KB, exceeding the PAGE_SIZE (4KB) cap imposed by the
standard sysfs binary attribute read path.

Set the SYSFS_HUGE_BIN_FILE flag in the bin_attribute mode for the
metric table in both acpi.c and plat.c so that reads are routed through
seq_file, which dynamically grows its buffer to accommodate the full
table.  This lets userspace read the entire table in a single read()
call.

Drop the static .size initializer from the bin_attribute since the
bin_size callback (added in the previous patch) already provides the
runtime table size at sysfs group registration time.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes v1->v2: New patch

 drivers/platform/x86/amd/hsmp/acpi.c | 3 +--
 drivers/platform/x86/amd/hsmp/plat.c | 6 ++++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index f3cfc99ef73d..ea99625d0f36 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -513,9 +513,8 @@ static int init_acpi(struct device *dev)
 }
 
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
-	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
+	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = SYSFS_HUGE_BIN_FILE | 0444},
 	.read = hsmp_metric_tbl_acpi_read,
-	.size = sizeof(struct hsmp_metric_table),
 };
 
 static const struct bin_attribute *hsmp_attr_list[] = {
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index d8dd90dfeb4e..625602a0d44c 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -97,10 +97,12 @@ static_assert(MAX_AMD_NUM_NODES == 8);
 
 #define HSMP_BIN_ATTR(index, _list)					\
 static const struct bin_attribute attr##index = {			\
-	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
+	.attr = {							\
+		.name = HSMP_METRICS_TABLE_NAME,			\
+		.mode = SYSFS_HUGE_BIN_FILE | 0444,				\
+	},								\
 	.private = (void *)index,					\
 	.read = hsmp_metric_tbl_plat_read,				\
-	.size = sizeof(struct hsmp_metric_table),			\
 };									\
 static const struct bin_attribute _list[] = {				\
 	&attr##index,							\
-- 
2.34.1

