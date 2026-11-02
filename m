Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604049;
	b=J+HB5L08TYUGZ5XUIHHKAnMvG0pKGbTiZm/yjNES8Xp/o6uKtsvlw7SHmtv4Qaz5Vq3I
	 F2JulrXIzvjzWk6jbTpwtHsQKLDlmE81QJzW0A9gHNxllnOSW+tLL4Hhre0svW0IgaGfA
	 /2BRZNvkSNVy3xkQz4kwLO+2cJGQmLKF5vcFJVT2aF/zGME1ZY5YWv8Oq6/Z+gDIhpbMC
	 xMlhklNkC1ylYPUWeJMlKJVzLkMY0/XHETZEXeEMYA/JZ55ME1+bkMke3HYd7MCZ46j0v
	 /cC4Dv6f/qGyz2D75KOIuiHLo7UTWEdMMDt/YAbugf0cW72JGcYUslFTuLjj6oC3Qjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604049;
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
	bh=W3KF9oY85q1I6mPmJEGWjgZLk3jQLIqyvSDcLAXFX6E=;
	b=qRTFpYKcQ4c87oHc6Zkq9h3xIUMtH6/Y6hYqUNaPmy70bTpVzG9rrRYx093CDqyPeux+
	 eqzSeuRMkFjRYmJTIFZAfwTD5FyJu22KZmcFuFBfgNF2312Fr6hT7uhXRz2TAWN1xTxos
	 PrriFoCWj7TaQa8zfI2139NhqJhz8j8hLQnICPNp6wptzTAKXgKhlE6l5renuIklQwb81
	 LJNhJQ0t+ceRXxw6KARV5tIq4E3laX3EW4SqzMaXtburH0aBD9z6x/hV4mJ5Gg1S81O6m
	 8yFu57xI3+5janX7hyvY4eWo+UwJObOUZ2Ru3jmeiH5Vpk4UTHRwn827DmQ5rPDX9mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=06Kxu00Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.9
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974E8606A32E
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974E8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=06Kxu00Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A38PiWFM2cUQpW5xUY+oMxKQXon+i6P6Rx1XzOfjQJ5SGSoT4aB7J9hWSsrYiBk2ZbKK3mBvKP+ODCKi2Ho8zVyunCu/d34zM+Uc59J11Hxqn+3jggUS3HoeAs4qoquKFZaUeKcWPO8jWyxY7faRae6h35jKYMFAXYupTEbdwOCK+9BMjMQ/No4+MIFkErPVyFVKrq2HIcKkMnd69vStO+TOiF2k+gTWrVQX6QcAaW1OBQTT7qeQ5SgsIcY1vjVuGAk2kFQNKlSh3MMOskw/hspOyGJBdWCWsfdTEVsZY1QykXpDe8DEEb9suMfP0IovG+gI7HrCoWKl4AQnVjpqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3KF9oY85q1I6mPmJEGWjgZLk3jQLIqyvSDcLAXFX6E=;
 b=Dv7ov539zh9buOvEam/d7H+wDu56gtFZAkoTAXlWspq8T4GECIRChYZvkYa+lHypeMJECHWuFM6i0q1rffC1M/8PK47f6kINHJ6T5UKOjtusURxKAB9WeO6cm1IXofcTWrKobEwzkamLBepfkEfL44LhWtcmEo+sytkmww4GRzSbVf28iNBehPYmL5ldvk4ZApmKhRJmCL+wuTsKWsQZFjYYh3F46+2yEbhR3hh2HXNcxq1H+uknSUIEdzRAS/lMJj20sC0R2jeH9KsdnNFYmkBuUtI3Lnflo+tOJwN6nQv12j2LNe/fbtYDgXsh0X8LeYvc30Ehij2SRl5+LClPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3KF9oY85q1I6mPmJEGWjgZLk3jQLIqyvSDcLAXFX6E=;
 b=06Kxu00QnROrdao44es4SeN9qOa6eN6tIQLBEYIuUvWiAVsFggldPxEkzCBQcN/dZV/rMTAPrbBIATt6uwD0C0CNTmklq2bo48P9/caVz3Tm1xxvRWtN3Wxwbv0pn38GnbmAVP07bwwQmHaAIAKF7JFm0MoaB5p1amI7tB30xMo=
Received: from MW3PR06CA0021.namprd06.prod.outlook.com (2603:10b6:303:2a::26)
 by IA0PR12MB8714.namprd12.prod.outlook.com (2603:10b6:208:488::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:43 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::70) by MW3PR06CA0021.outlook.office365.com
 (2603:10b6:303:2a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:41 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:39 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 14/26] platform/x86/amd/hsmp: Add per-CPU floor limit sysfs files
Date: Mon, 2 Nov 2026 07:19:12 +0000
Message-ID: <382757d4099797e00ae647d15466e448ff518e33.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|IA0PR12MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 599f715b-df81-426f-1c62-08df38b1cd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ys5x8sMUE77APWaKmZ4+G5wXWHemfQ6SRiSL4JmnuvwiOBFCT9c8raXY9ppKFY/9N+xxdYav+naa+DksmsJHkJ1xoApb2JM/KMP/K5S8iX+CC8uPSRLKue6WANEOw01Hk6aEsoFiM2Uac66qVU29Lt9oMib/9WMvpGqZDCWLnR0SCIVf9uOH5BxTY7wWoQs1arLVo1tK9DtTBpsVVJQtudCeaMkWVUTtMel1sa9i1hFKZw0khroRg8R5a8+a666yrFaNp3xLw7yqxsqRqSVcJJb8U1xB8oVYR8VJT+/EWXlYHfolYTyNFfiZIPeLxrUvQf2PLZ/hX+rNYSb6dGDgjaFfOkYAinvsK+h1ofwn4Lz7hKqkJ7Nn+Nev6lPFdtgmP+uz8j4yZo1HYwGOJ28L9pbwTX5uc/UMkjuu+bth/l/eaHjj+3lpqwz45h91E+DEwHbRE/96kvnHuxiVYxW+Nt/GV/txyRizwl51vx0tlNEt2NDakVJXva9flh1osPPXr3XoPTOLkqLqloyMVCqOCgBiVs3nMVN+itlYKeUy0repRJAW/kvtSp5G/aa81bUW+QQ5nvcaPxh6do1XQhBXIrxwqYzwdQTJvFBj31oJn8Bb1Zd1UDNkYaIyx/fDVNCS+tlHQHc2aHWB6kWsv8qMOJ7iHPU4EkjwWXpsaRhKkGSkcpjTxdYJgEXxAV8pC4XCkPSmY0eJUV55Pecv+xqXHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IhiP4liVFwDljRQrYG/HPVBmjD8MONc4ZDUlq/HRxpctHuSJDma6KVE9VlFS880Z3CHIyPPyCifcbcyv9kWhMOxu5tlwJSpmzuORADuCfM5ooVlp8bTXoZZnKRwK1hnzGTCEqYDqVCFUIoT3SJSnfyf7Ed7TFiGinwJY3keyA6MVxaubgrQct4qb9Ewg6bBE9oXs80lI7TZJpsO54zWRa4FAtqXg7iRvTqWRmBUdtBzxC4mqyP5PIrHx6AzoRvPML9qyoBVozt4xjbStGQvCf1JqoogHSemPdOxXIagfLTfpoZw52zsoJP6XDgSocKyfETWNBw16s8c6klNzjWzxMpsKCc/1jSN1HpR/lJj3ivyRkBh+/cw1w1OqGmx6/+hSQLDRbqune9Ps0fyGKWScaJ/qnPQJnVFBCLQ1lYae79mbzNLqZz1/AXaLixRXdkhy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:41.5790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599f715b-df81-426f-1c62-08df38b1cd72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8714

Expose floor_limit and floor_limit_eff under cpu/cpuX on both drivers.
floor_limit reads and sets the per-core floor frequency through
HSMP_SET_GET_FLOOR_LIMIT. floor_limit_eff returns the effective floor.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   4 +
 drivers/platform/x86/amd/hsmp/sysfs.c | 127 ++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 67f4c3b71f5e0..3cbc4bee058ec 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -174,6 +174,10 @@ drivers.
 
 * boost_limit: Get/set the per-CPU boost limit in MHz (HSMP_GET_BOOST_LIMIT /
   HSMP_SET_BOOST_LIMIT). Writable range is 100-10000 MHz.
+* floor_limit: Get/set the per-CPU floor frequency in MHz via
+  HSMP_SET_GET_FLOOR_LIMIT. Writable range is 100-10000 MHz.
+* floor_limit_eff: Read-only effective per-CPU floor frequency in MHz via
+  HSMP_SET_GET_FLOOR_LIMIT.
 
 ACPI device object format
 =========================
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index bcf1b802b3287..b0a939071b575 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -1420,6 +1420,127 @@ ssize_t hsmp_lclk_3_store(struct device *dev, struct device_attribute *attr,
 	return hsmp_lclk_nbio_store(dev, attr, 3, buf, count);
 }
 
+static struct hsmp_cpu_info *hsmp_cpu_from_kobj(struct kobject *kobj)
+{
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu) {
+		if (cpu_kobj_info[cpu].kobj == kobj)
+			return &cpu_kobj_info[cpu];
+	}
+
+	return NULL;
+}
+
+/*
+ * HSMP_SET_GET_FLOOR_LIMIT args[0]:
+ * op[31:30] + apic id[27:16] + floor frequency MHz[15:0].
+ * op 0 sets the per-core floor, op 2 reads it, op 3 reads the
+ * effective floor. The frequency field is reserved on a get.
+ */
+static u32 hsmp_floor_arg(u32 op, u32 apic_id, u32 mhz)
+{
+	return (op << 30) | ((apic_id & 0xfff) << 16) | (mhz & 0xffff);
+}
+
+static ssize_t floor_limit_show(struct kobject *kobj, struct kobj_attribute *attr,
+				char *buf)
+{
+	struct hsmp_cpu_info *cpu_info = hsmp_cpu_from_kobj(kobj);
+	struct hsmp_message msg = {};
+	int ret;
+
+	if (!cpu_info)
+		return -ENODEV;
+
+	msg.msg_id = HSMP_SET_GET_FLOOR_LIMIT;
+	msg.sock_ind = cpu_info->socket_id;
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = hsmp_floor_arg(2, cpu_info->apic_id, 0);
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", msg.args[0] & 0xffff);
+}
+
+static struct device *hsmp_cpu_sock_dev(const struct hsmp_cpu_info *cpu_info)
+{
+	struct hsmp_plat_device *pdev = get_hsmp_pdev();
+
+	if (!cpu_info || !pdev || cpu_info->socket_id >= pdev->num_sockets)
+		return NULL;
+
+	return pdev->sock[cpu_info->socket_id].dev;
+}
+
+static ssize_t floor_limit_store(struct kobject *kobj, struct kobj_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct hsmp_cpu_info *cpu_info;
+	struct hsmp_message msg = {};
+	struct device *dev;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	cpu_info = hsmp_cpu_from_kobj(kobj);
+	if (!cpu_info)
+		return -ENODEV;
+
+	dev = hsmp_cpu_sock_dev(cpu_info);
+	if (val < 100 || val > 10000) {
+		if (dev)
+			hsmp_err(dev, "floor_limit", HSMP_ERR_RANGE,
+				 "got=%lu valid=100-10000 unit=MHz", val);
+		return -EINVAL;
+	}
+
+	msg.msg_id = HSMP_SET_GET_FLOOR_LIMIT;
+	msg.sock_ind = cpu_info->socket_id;
+	msg.num_args = 1;
+	msg.response_sz = 0;
+	msg.args[0] = hsmp_floor_arg(0, cpu_info->apic_id, val);
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		if (dev)
+			hsmp_err(dev, "floor_limit", HSMP_ERR_HW,
+				 "val=%lu unit=MHz rc=%d", val, ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static ssize_t floor_limit_eff_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct hsmp_cpu_info *cpu_info = hsmp_cpu_from_kobj(kobj);
+	struct hsmp_message msg = {};
+	int ret;
+
+	if (!cpu_info)
+		return -ENODEV;
+
+	msg.msg_id = HSMP_SET_GET_FLOOR_LIMIT;
+	msg.sock_ind = cpu_info->socket_id;
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = hsmp_floor_arg(3, cpu_info->apic_id, 0);
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", msg.args[0] & 0xffff);
+}
+
 static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct hsmp_cpu_info *cpu_info = NULL;
@@ -1508,9 +1629,15 @@ static umode_t cpu_kobj_is_visible(struct kobject *kobj, struct attribute *attr,
 
 static struct kobj_attribute boost_limit_kattr =
 	__ATTR(boost_limit, 0644, boost_limit_show, boost_limit_store);
+static struct kobj_attribute floor_limit_kattr =
+	__ATTR(floor_limit, 0644, floor_limit_show, floor_limit_store);
+static struct kobj_attribute floor_limit_eff_kattr =
+	__ATTR(floor_limit_eff, 0444, floor_limit_eff_show, NULL);
 
 static struct attribute *cpu_kobj_attrs[] = {
 	&boost_limit_kattr.attr,
+	&floor_limit_kattr.attr,
+	&floor_limit_eff_kattr.attr,
 	NULL,
 };
 
-- 
2.34.1

