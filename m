Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604066;
	b=NnfUUKv2JG7bxLNfeKADA/mz7aBmuYrgYcEqrDf9IAz9DEjhXvt1DilsMFv6EjRqwG7W
	 i6TjNLnvT1aHkpdpSPaM31nRQodg8CVGU84jF4qyUs9oBrw5GE0SSGVUlKWGQF6hySbHf
	 LQ5rjPRqBGuAs2DX35EODJczMJ21Bx+oOHM+LaZVJ0muBIPfl+nTx63s2+cPMA1BazsM0
	 cYGYy1SBx8HRwEPf61lecbXEYNiYTUPP4ZcViEv/KphKIXYIuDjhHzE2P8wtZ4ewwInxF
	 u0AsnkOsZ6+Fl/ccaqO3oZ22mJKNTzlAUHyWacolNiGiYsgUx4T9fpFtqqcwlGwt1hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604066;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=fUP9INumAm5Yiq7uu/qQu3um3dqr9ZKwYp3xxvMePTc=;
	b=MpOTCLULxnfgegPD2eMDnFOXLFAZZ1/KKVV6hurLaAh8p9YwfAiLrJxpGvyPuJJKmXyu
	 X3V5ruiO371mti7OdLPdb9gYRXM/wCKF16/IUuVXvSfcbqK6zg/Qo8JhAifX211yCezRS
	 HflDhybl1ScKqzawYLD2BMaVqcxmTv2Ud25byoLNlbzVT6ePJfWQW4/J4rWcC0yWOxZI6
	 raSiPkwmxL0knxi60iylFVTJ/zqrErqyNQ7stffjk9BcfQe5IOm42XTHfmZGQ3kPvuted
	 BTVyTfCaCHZnu7WZqFS3trjpRPOpO2PbcyD3aANsgloBz9Dg2vrjus2gWkqeAoUa/bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="b5qTJD/N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.26
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC5D606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC5D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=b5qTJD/N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZv47nOTyCPoKk6sqeqV7nYXLR8WyLTgIA6X64lEPXtjCbyji7Fwmml96jRTBVumOfpWfMWx+fLhfCibOmyq9gO04qNJ/Afatrb1TOvDj1kMlq3LqJJ7rnVT0frWpVuT7DXZcwfMTPHfakFi52v8tSdU3e1WSMr8bOUZdShsQlgGXJ8v8gZppQzWn2t5qEanqFb6D42m9BL18dY5UcuMmH1ZVMVEGFdGoejN/7n/rXULJojo5ZGz7746Zb2UYSmNuhGHt7MIJ+YSCOFQl2qYc4O6K1kHlW0TJMl6ML/CSoq8qmloT2B1kPxGZyDszXoni011XDq2Kk6VCsjRD4fjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUP9INumAm5Yiq7uu/qQu3um3dqr9ZKwYp3xxvMePTc=;
 b=gb01ZFIu71JITHA12ke42UySNP34TCaa2aSskyNTKB4Jtb87sRhjiZpR9uEPdHCsd5SjWxzri1NOdgrvlcXEKsbCWGuB8yMfhnoUPz7c+yiCt/4OrHzJ22NzBW/L9o6+owGpkVRzy368C/JquLpDRtqc8PoxY/kQRVTe1RsNQcOu7HqFy/7MRAZqSZiUMlkCIgiZmKrD06kgHBi1Y2G8ixWRw0sRypEdBHZ0InJAOu4Yw4IQdvLkF9NVmeWOb+Mn60j/wtjukv4v/V1+bwG3i495D5NmH5iUqEjpYsC43N0BLukJqLMiJaSBKdjRiFvWbESFyoHYdlnk9D9Jd/TDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUP9INumAm5Yiq7uu/qQu3um3dqr9ZKwYp3xxvMePTc=;
 b=b5qTJD/NaKETxuQ7Zj1W1FSGblpTssdYHlWnuMyFEAojrZs4YQWNapfRkH5zkH7EPseGR1odA2fdRLoeFMwuYrXzeBMlzv0Eqe6c0lf7BgZfjWtdPoCSxMrYjGAKs1lymnKDgeKJ1iQtEfM3JEGaDb29AiM/7ZpkAtxEKTeTX/4=
Received: from BY5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:a03:1e0::17)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:21:02 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::75) by BY5PR03CA0007.outlook.office365.com
 (2603:10b6:a03:1e0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:21:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:21:02 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:21:00 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 24/26] platform/x86/amd/hsmp: Add per-CPU ccd_power sysfs file
Date: Mon, 2 Nov 2026 07:19:22 +0000
Message-ID: <7948dc621d0c02b61b3cfb7eae2087ffa4c299a5.1793602634.git.Muthusamy.Ramalingam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b98d9ff-1109-4ce6-8674-08df38b1d9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	P+FCwqv3hSCi0Hq6GltEUJjGzcUeiRg4zUqtR4vLqTX1IxNi7iIv9jxtVs9ZrH4uFQVPtNLuyJSjLl8QtwdLBausI7LIuvouDQSysL97pKI63o36euolZvdRtN5XaDeouWCZnsL0Pvi5mMRXnB09j0jYubt9X7amE907AL10RZGqTqSrB66gn5/cgyphhkK6fU6kmzyzm1PRonFkqgmjrDxkIANIiSXXzfqRevilRP3h8YXtyl8z5wOieVq3RsZbAJ0oGPFZPoDwnFSJHOxkLWvNF8o3Cs7/h0Ukg9gT0D00cdGeSd18NOOOEhfwLqClz26fD4ftfSwyhW69GUrVMA/+ECYHzkvLCUU+B4Cp4g401p2CWkQo7NwFsTmBpcuF1GPO2RPqrR0YQ90qPO5DUMxPiMRhwIxWMJYsLXKas97xLoNrdp0edA74OnSz8lLRjAc+84RcanBcgtBWbf3/tiPEi4XTXy0Wz3PxJFQWss+WbEjWzw2opWRpYq33N59N7DqBnnAQ6ZxwCWc3tWgT8+59iGG0pxlfYQrhczF6N6R7EuHg8umfG9kgOZTHbwNlqqktJec0Uy/QegYXQnCVaVnQMMuReGO7fyIPTl8uIVGe54NEbEZEWggFGTNMsbvVxQTjGG/PvmIGynwskwDOadHoZcqkxxCjrECwDOsVkyk+wcBH+9HMvGydbHjrQUvnLY9Od9CfhscGvUZreLmImQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uTiJDJUFXrpnIyPpmbxrP0w8YSUwgpHKtqrkb8z/dkhhChIKe0GVHEc5NgFzU3Tbd3tWjbIEIjriY8twuFwSTj6X3io5aKVcVHh/PmiC/B1mjOwNlE5ejPkas8huoZ/q5O6AC1GU0rx24xv6qMMBSzYtf6IHrMlyzg19EJWa/b32RNDtkvMPe8sbLpgPgHs5vgTxuIrtwKrd/+Bi+YzLbpMG8sRoTDKUX/x5lSPCXrkndrus9toF04yjr+S045KEHY+aoZknd043kzUfXwY1gLuJKT806PiFqBdMZieHtORi3R/a7v5172CMVnLeDQEeqXdBJ5jjQfuACuo6DUjCD0znylhLLjv81tiKlHQ5OUaq1oGqk+NF9r9LLse9Yoa+WBgb0iTeOeZtrgpFzf6mNPGcPFIfFk6JPpC0qrXWkND1dzLalXMqLd4EEo6JhonJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:21:02.5331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b98d9ff-1109-4ce6-8674-08df38b1d9ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304

Expose read-only ccd_power under cpu/cpuX on both drivers. It reports
average CCD power in milliwatts via HSMP_READ_CCD_POWER, using the CPU's
APIC id to select the CCD.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  2 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 6ff2c154e9958..02df9882c0fc4 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -218,6 +218,8 @@ Per-CPU attributes are available under
 /sys/devices/platform/amd_hsmp/cpu/cpuX/ for both the ACPI and platform
 drivers.
 
+* ccd_power: Read-only average CCD power in milliwatts
+  (HSMP_READ_CCD_POWER). The CPU's APIC id selects the CCD.
 * boost_limit: Get/set the per-CPU boost limit in MHz (HSMP_GET_BOOST_LIMIT /
   HSMP_SET_BOOST_LIMIT). Writable range is 100-10000 MHz.
 * floor_limit: Get/set the per-CPU floor frequency in MHz via
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 254ba586da861..709bfa494cd64 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -2258,6 +2258,30 @@ static u32 hsmp_floor_arg(u32 op, u32 apic_id, u32 mhz)
 	return (op << 30) | ((apic_id & 0xfff) << 16) | (mhz & 0xffff);
 }
 
+static ssize_t ccd_power_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_cpu_info *cpu_info = hsmp_cpu_from_kobj(kobj);
+	struct hsmp_message msg = {};
+	int ret;
+
+	if (!cpu_info)
+		return -ENODEV;
+
+	msg.msg_id = HSMP_READ_CCD_POWER;
+	msg.sock_ind = cpu_info->socket_id;
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	/* ApicId of a core in the CCD, bits [15:0] */
+	msg.args[0] = cpu_info->apic_id & 0xffff;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", msg.args[0]);
+}
+
 static ssize_t floor_limit_show(struct kobject *kobj, struct kobj_attribute *attr,
 				char *buf)
 {
@@ -2442,6 +2466,8 @@ static umode_t cpu_kobj_is_visible(struct kobject *kobj, struct attribute *attr,
 	return cpu_info ? attr->mode : 0;
 }
 
+static struct kobj_attribute ccd_power_kattr =
+	__ATTR(ccd_power, 0444, ccd_power_show, NULL);
 static struct kobj_attribute boost_limit_kattr =
 	__ATTR(boost_limit, 0644, boost_limit_show, boost_limit_store);
 static struct kobj_attribute floor_limit_kattr =
@@ -2450,6 +2476,7 @@ static struct kobj_attribute floor_limit_eff_kattr =
 	__ATTR(floor_limit_eff, 0444, floor_limit_eff_show, NULL);
 
 static struct attribute *cpu_kobj_attrs[] = {
+	&ccd_power_kattr.attr,
 	&boost_limit_kattr.attr,
 	&floor_limit_kattr.attr,
 	&floor_limit_eff_kattr.attr,
-- 
2.34.1

