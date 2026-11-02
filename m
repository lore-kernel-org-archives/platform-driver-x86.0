Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604071;
	b=T4YGQ5aSG+fOZ6lvv/L7ArvFOoiny1b4lSbPHmtZDVjXeGYA7G0G0zuYX1ZKbYMy77Gh
	 b4b2/AGJ9rUscbF/tX+4dYlW8SxbCWIw4l61QoMIz81znJ+bpQgtlXlBGlmWaNWMJEvn+
	 NQ++8A+8vdoEVIeca3v+yAVCF1RiuoWjbfhr/3zzR+TAX6Q56hVRjf6x/K9Afv010hnfA
	 MK0MfYwKWLnEl7ik7mVhYeFOJt0OXdtXyaxebl5F/VsSjgvQQVwG5cFdQDLtWRf8lLlgN
	 QV+8DvDiyjWZ9G1AFgQCp4OfJyA+5FAviB4WdTwAtRArksE2Zu4+xGk8kABunNMQ7yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604071;
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
	bh=dMSFP8U/1o0T9H8s2jWwhBjRRVOB987uKMBrOjwSeiE=;
	b=0bkF7Ugs1HOU2K3/EHRRgxA6+GvjSF8rVM/u6lwQZhjyQaPyR9x0dM/+At78wb4KZQrU
	 mdTTzjkqEwzKIbyWyQ1RvaGyQtw3ZLYz0v46r18pxX7xpEHRU9DpMZEgNEu/JE9IbDU6+
	 5+nTTbCNsaHO9GfA0Ys74vzq5ydXdnacZchUx9VL3+yQm89+7ftmun5MUYlPoqsr/Z2it
	 dd/4KmqOI9zbeiKxwfEIseuGeEVJrs9eubkttSbjLBK7kBWbqqUEYfa5R2jDe9vjtYPBD
	 qd571PoMvcMjWsZY+SJFbr10naouz6Fcsw2/wql2YFy0GRugj9UQVzLGvz4uJUDbnqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Z7AgzXE+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.62
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013062.outbound.protection.outlook.com [40.93.196.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913BC606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 913BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Z7AgzXE+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEej/DWf670amBLMQkCn6AsGBr1oc6gSRTVpzK9fE6lrwddJy9pbm6npfUFaocnUVHySQdUH4J/NApsMO6PM21Q3zPtEkK5uxnC6NF4FlXzCuQXMmXTjDZ0fI+mPiPquYVn9mcQVt13mkrGcM9MYPVNaklJ2AqrwXdAeqzkGg7GyXpkSlfKbwowDfZ/cQh2MgGAGgCw3T7l3YvNHzp3ihJAlJSa04ugWIkR1Gva42DKmOYuCmD/ePfqN2Gz5sk/R78GZUeQojd1894alXu1QeEb5XnJsU9flrh5ZDPg4sQBG9Fgd0slgHNnFi6A27joDT+BRk7qntM4vm8kJGNSgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMSFP8U/1o0T9H8s2jWwhBjRRVOB987uKMBrOjwSeiE=;
 b=HCcUbx7QBFPydekGTvHdN7p8KTIJ7goBdwtKoPqZo8aJrml49hmSN5UVaZiH1AD5tk8cKp0qgnEo6THg0WCgFHypjaauJtrT9JJIdexdXDcICAf/KJhuZ7AOpzsLNfI5ftUntOMxlQks74gof/h+nu+RM8iZS2POMkQVZ4Ca7rOnPJCx43EbEgARZW30Nj/x75L47kDPZGhUCbgXNlhnAG1geo6JHLt5tym9TKePPSgnBRhi8fErfds8O58/dqGoXp9n1755+uj+WmrAC8Db4O30yA3tiW/qRbVe+bTrFAmVWjQQdPmvpZ13h/5ieNbgcTSu5XrQwVUWf2M8eUvCQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMSFP8U/1o0T9H8s2jWwhBjRRVOB987uKMBrOjwSeiE=;
 b=Z7AgzXE+40SpeB9d1SCu9sBD82BQcIsthyD56/SdsDlWzWwIb2gutov6PqL5sm1mXtTX0Dn6+m2UnRS03jbfCe+w5epP9WKieC3Cf+t1R4q/qQLxSGzMQoPWV4Tyo++QFRudEqLaZuK/dPtS1kjzw1/dy5OSsru1YNs/9ik9Wow=
Received: from SJ0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:a03:39c::21)
 by SA3PR12MB9197.namprd12.prod.outlook.com (2603:10b6:806:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:21:07 +0000
Received: from SJ1PEPF000037A6.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::81) by SJ0PR03CA0346.outlook.office365.com
 (2603:10b6:a03:39c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:21:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A6.mail.protection.outlook.com (10.167.244.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:21:06 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:21:04 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 26/26] platform/x86/amd/hsmp: Add socket_temperature sysfs file
Date: Mon, 2 Nov 2026 07:19:24 +0000
Message-ID: <609f986f15d11e0d28d036033983ecedd6e39b50.1793602634.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A6:EE_|SA3PR12MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6f472f-94c2-45a1-b204-08df38b1dc86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|3023799007|56012099006|11063799006|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	NeTqTi2Q2968w5+to16ZlBtswjENgmHDZ0AgYGaJvEB4CNhccib+o6LZlW4Tp4bZO2eVgSXDYmAwG2VJqJLizP5XCXHygTPdxnN4MpjHLeiFqPa2EoBRyEpKyHKddstTuCMti9j7KOADIuesfdiZs6jeqPrfLHKuoAUD4Fp2M5/f9Djjw0w+cUX3wjXIPWRQrbHoQQhDxlgocOlQvNLrcxpspf3V+BPNsZ2C+30a484vFlD2HlXh1TF+P1RIpZ5FzfaGGMvxJ7tZ0zqpxSSThfnmkAH7ExXZUT6wfC5itDJZ5W7CfcdUd0pddTwA52fGy19B7BmMzhiQXSR0DsCc5oICD9NGCAdza17oKIO7LNXrIlWrVSYXOA+mRU1xFoJOqXXjNajboXcJtnrY/Sb14h6SDvmy77buNbOw1RJl2MCS0t441l30t/IGQzeiH4/vV7w9EhsNnAv9dwx5FH7IX6QhEuK9NPQehyTC/zqV/7U3wBM1boo1qbtNhvpKN5GxEFNL5B0VfYpkIKr0ELMGQ4VuJPkI0AGYEb+i9vezndLrrI2U9A5rhCpiMFul/Irdx2wcbf8RujDRCa1X37YF85y8JvCTOrLYyzoczSRhl5bN5xhDH21QXfohtQhroUIJxEKNTx4yAhEjBJfJ7iRvYoFqK8w6pGyXgVrjjecFsIXJBwLXn+Hyg2XScGRKD9zX0Kxr2VzAEc/DtdO+eoO5Kg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rZvAG1VprkCyigt6NIjG4SfxUSmAemh9UmK+4pMo5vT/FkgtxhI7j6jwU86mArHlylsix0xh31rUcIe2nVSSW5ribjq6gMbkKqeeaUaJ2VVlhZr6gU+sN2VEY4FEA+h67gSe5LIyjL3KGjE5kYp+OVve8kl9J9SSI2h1tK4ELUgf4W/qOOpUXliXBeIThN3LJYbdZYcwzqrGEA7pSy81Gr42pEXuNW3jJHrLc0pBlUJqjcLhcG6OZPJCBMhrI/B+agMhUDxJmGqyQOK2RxQD3MqsV9j8mj3UUWU+V9m356xsoSa+Z0Xk71EIaSE+VLq+hRKfi1Mz0oNL1KV+1wt7L4MBH6gp8tKcejl4K1E4vtbawq4eMt7Mx44cEtN7oL5jOYb6GFJLX9NFceIeKLxQoXny4uOI60uzC56SzHX6vaoTFwvWNi6xz2bgzLF9zwBw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:21:06.8800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6f472f-94c2-45a1-b204-08df38b1dc86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9197

Expose HSMP_GET_TEMP_MONITOR as a read-only socket file on both the
ACPI and platform drivers. Integer degrees are in bits [15:8] and
0.125 C steps in bits [7:5], printed as <int>.<frac> C.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  2 ++
 drivers/platform/x86/amd/hsmp/acpi.c  |  3 +++
 drivers/platform/x86/amd/hsmp/plat.c  |  3 +++
 drivers/platform/x86/amd/hsmp/sysfs.c | 17 +++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  4 ++++
 5 files changed, 29 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 03c04ff23b1c9..7c8568e2b7298 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -204,6 +204,8 @@ write-only when the platform enables only that direction of the message.
   later.
 * svi_power: SVI-based power telemetry for all rails, in milliwatts (read
   only). Supported on HSMP protocol versions 5 and 7.
+* socket_temperature: Socket temperature in degrees Celsius with three
+  decimals (0.125 C resolution), from HSMP_GET_TEMP_MONITOR (read only).
 * tdelta: Socket thermal behaviour (read only).
 * apb_disable: Read/write. 1 disables APB, 0 enables it.
 * dfc_enable: Read/write DF C-state enable. 1 enables, 0 disables.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index bb46676b1f6fa..85b1b6819f44c 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -547,6 +547,8 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 HSMP_DEV_ATTR(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(socket_power_limit_max, HSMP_GET_SOCKET_POWER_LIMIT_MAX, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(svi_power, HSMP_GET_RAILS_SVI, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(socket_temperature, HSMP_GET_TEMP_MONITOR,
+	      hsmp_socket_temperature_show, 0444);
 HSMP_DEV_ATTR(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR_RW(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
 		 HSMP_SET_SOCKET_POWER_LIMIT,
@@ -844,6 +846,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_cclk_floor_limit.dattr.attr,
 	&hattr_powereff_mode.dattr.attr,
 	&hattr_svi_power.dattr.attr,
+	&hattr_socket_temperature.dattr.attr,
 	&hattr_tdelta.dattr.attr,
 	&hattr_apb_disable.dattr.attr,
 	&hattr_cc6_enable.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 54806c0f759c1..5ec5bf945b914 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -381,6 +381,8 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 HSMP_DEV_ATTR_X8(socket_power_limit_max, HSMP_GET_SOCKET_POWER_LIMIT_MAX,
 		 hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR_X8(svi_power, HSMP_GET_RAILS_SVI, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR_X8(socket_temperature, HSMP_GET_TEMP_MONITOR,
+		 hsmp_socket_temperature_show, 0444);
 HSMP_DEV_ATTR_RW_X8(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
 		    HSMP_SET_SOCKET_POWER_LIMIT,
 		    hsmp_socket_power_limit_show,
@@ -1919,6 +1921,7 @@ static struct attribute _name[] = {					       \
 	&hattr_cclk_floor_limit##_sock_ind.dattr.attr,		       \
 	&hattr_powereff_mode##_sock_ind.dattr.attr,			       \
 	&hattr_svi_power##_sock_ind.dattr.attr,			       \
+	&hattr_socket_temperature##_sock_ind.dattr.attr,		       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
 	&hattr_apb_disable##_sock_ind.dattr.attr,			       \
 	&hattr_cc6_enable##_sock_ind.dattr.attr,			       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index e30830c52ea32..58def5cc7bd76 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -305,6 +305,23 @@ ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute
 	return len;
 }
 
+/* Socket temperature in degrees C: integer part [15:8], 0.125 C steps in [7:5]. */
+ssize_t hsmp_socket_temperature_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id,
+				 &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu.%03lu\n", FIELD_GET(TEMP_MON_INT_MASK, data),
+			  FIELD_GET(TEMP_MON_FRAC_MASK, data) * 125);
+}
+
 /* DFC enable show function - reads current DF C-state enable status */
 ssize_t hsmp_dfc_enable_show(struct device *dev,
 			     struct device_attribute *attr,
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index f4cec7459aac2..9628eb6f322ab 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -36,6 +36,8 @@ struct hsmp_sys_attr {
 #define FMIN_MASK		GENMASK(15, 0)
 #define FREQ_LIMIT_MASK		GENMASK(31, 16)
 #define FREQ_SRC_IND_MASK	GENMASK(15, 0)
+#define TEMP_MON_INT_MASK	GENMASK(15, 8)
+#define TEMP_MON_FRAC_MASK	GENMASK(7, 5)
 
 #define to_hsmp_sys_attr(_dev_attr) \
 	container_of(_dev_attr, struct hsmp_sys_attr, dattr)
@@ -91,6 +93,8 @@ ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
 				    char *buf);
+ssize_t hsmp_socket_temperature_show(struct device *dev,
+				     struct device_attribute *attr, char *buf);
 
 ssize_t hsmp_dfc_enable_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
-- 
2.34.1

