Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795016158;
	b=ry2ozEvhAp7jkGokZGaKzVkpdBV9RpwbV+vsPQwjCAa/EWmxbaPksXoFqdfoTZ0ntS2y
	 NJr62/+JpuRIg43iQBab0JpGWfw07XE9ETRDN04nOIwxa+UbN9sHsLzHoeKXeUfrVtMno
	 ZiO5H26wwT0FeppdbymDGzbJl1pkzPEmnRmC1F5HPdJeMmNOU5zLsykakOU96yML90yCo
	 bYCbWhcuK2IuQqvtyLDJV3WuycJhH4LRR9xsnLcZqgUEZWSCyHcuqfgYPYEeUcYZINOj4
	 vqUe+7522c0rqty2SAxaK5Lo8CFQIUQcXSuTdLd4Cn75QNoGKaY18kVHxMEL/uGyTwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016158;
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
	bh=0DYuDwuVWLQ3BJQsxZP5SsI1ZhGfCd6tem4YR0trADE=;
	b=r3yzCP0xODNo8xWnIa0dCU4bzcwr/zEqPQd7qn1A6nN3EcJt/x5wXakgrcpRSfakut3d
	 Q4njnj3D1qYs9Bo15f2kSfTXcQjNs/nGqd0m3J1oRRhIwIdx15ZKn0P5hHb0QEubi3MCM
	 9pWnOErAk3Non5K4NG9kHNH2lwhLLJ5ZswX4U0of1ailiJqiSS4bKi4JNrk28TSi0Mrl0
	 2kgdNE486af07JAom7tcAGCcamTU//qu4UmxbeawXQ9WOWngq6gpbRtAcrkHj6crcmquN
	 mth39QXTlFw9LDa7IsNpx5VGp72bD8JP05nmiq0ucV0D+OsUaq3enEhDGL8JxNOEHKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=If6ewvSc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.70
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A3606A335
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 15:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62A3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=If6ewvSc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fh1L3d1661Xkz7CYcwulidbU/xvRksUjKbC+9DVrlC7p0BXTh/nJ1KjKEZLdwgjWRqp0o42WL5syxyyPiR7gCVvZMLB1fnmYdX1bAwpjho44rgI9uk6pK/ejLBkySZtN2g7OBf2ZVaAZN7WbGvhblQmSg5ar4ZkAoxyvrZUPTP4eGpV+WHljz7wdLasXHPoKzFwOKp9eavMaRGvPeQixshFq7y8DZ2dA9JLH89ZAs80foXj1OR8v+ux65UJvhnaQdHV6RU+l7UYXm0lfkYiQY0fzviysIo2B9lImfadiqWib/LlLvc5YCHAjMvOo5Hp/jWGRddiUhhff2FdcYcDHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DYuDwuVWLQ3BJQsxZP5SsI1ZhGfCd6tem4YR0trADE=;
 b=xCAU4nl59jxVzgA4yNOfgzshR66qj3HZo/FNggdWCIsz32+bSerUdqrjV91fSpG5eaOz4X1FcI63ylfuifXH/Bx4FNmUss2XhiF6hvYKrmLG3idqTIj5SxZ5y6Ek4b373z0W8pWrLC8tS+bjDuyCkuPikPfh+Ep0dfU1KdtF6qtdpL9WTFJnKt9BfR6+G2iD8mMtZUjBgvQs16IRajwTlQUgDCnPSknHwp7A1tWQDzIr9kwJ53HOsaARjpmaHzelAzm0qmVtqpg8xpBdjf+icGn2CCrkBNSQtgElEZSVrYoW5vHyqT9tg1Uqwx1tOAff7OmYyMX+3MZ2925LjEIs+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DYuDwuVWLQ3BJQsxZP5SsI1ZhGfCd6tem4YR0trADE=;
 b=If6ewvScXaJ5849hFhNIWM6vf0jezoMkI/WMYCc0uomIQIPkuJqL/xTMXQPSCYEVnSndkCrfN/G3Azt4Cb1TKMPGBJbwdlexdDbHX4cAFl+nh/UQOatvzDYcn8INlSWtNZs1Zhpp+2DgphZrsmibVVRFP8LLMVEKQJbE/FZyo+w=
Received: from BY3PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:217::29)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:35:53 +0000
Received: from PH7PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::98) by BY3PR04CA0024.outlook.office365.com
 (2603:10b6:a03:217::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 15:35:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000A.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 15:35:52 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 09:35:49 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v2 1/3] platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI driver
Date: Wed, 18 Nov 2026 21:05:21 +0530
Message-ID: <20261118153523.3627870-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118153523.3627870-1-Shyam-sundar.S-k@amd.com>
References: <20261118153523.3627870-1-Shyam-sundar.S-k@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000A:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: c7707b16-b407-4cb3-9e41-08df4589a138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|6133799003|22082099003|18002099003|261009223027099003|3023799007|261026135527099003|56012099006|11063799006|5023799004|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261022115727099003|261021133027099003|261022105027099003|261026130827099003|261021121427099003|261021130227099003|261021135927099003|261021123027099003|261022113327099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	g33fG9KZgnbn2TQWCLSXQksFq1ClcPH1r27ZBQSh9vHPMfDgSKYVtUn9C/qYBoCBZbn+tkUxYxgD5e87sK4xhkeaxkm+jQIrSKlXQoDTmynbMlb6zjmv8qwc7oSG2wNKrXik5mtW2Fh0q/cLxNv/WOZ9Q2kVnGGlcFiHESAXOl8nlNYVarF5vhr0FKZrxJjDcmO8rbSMTozh5eE0P1pZCrN6OH4AqI96X+uaKi+V9gpGYe85ODS4iHJfQQ0z+cOZZokTkqcUEL0pg/rDyGkYL1v9s37is9F/8gl9p7hvCoC10Ca/zGW/7N78nreHlLIdR+1FrMTqKdjiyWWB8VXLO7UUyMp/IzAs1Pyiqyzivsy7WgzywOKnaKYKYPuiAh6Aj7pJHl63mxawiUiwbfTIpPzxU/NfWSgKz8ASmnjjf9jon8GbsL5LSgDw4chOzjsd2hcSooZhZsYlrJV6B6VBK1/1zcYDMa6hpD+gIuGbCnpvJpSuTf+kCMnMw59hpLKn2A9JgkOa22jjIO/vw1Rp1QsRYzOenJSGfCUktZIH51AzG6CEF3muabG4akpBX5Hl3AT2vwo+6JnVQ27fWGXYCGWaf4y10KLJQnJQOrm/3wUZK/aimCZK4EFlkAEi8hrkleEySmMP3iLb3rn1PQZfuDOAbgd2lDtF4C2XUL99RemDHs2CEauabULK0bvxbSEh/BpL8khKAsmsffFspL616Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261026135527099003)(56012099006)(11063799006)(5023799004)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022115727099003)(261021133027099003)(261022105027099003)(261026130827099003)(261021121427099003)(261021130227099003)(261021135927099003)(261021123027099003)(261022113327099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5EY1SXLw55FZduGhrXbpitXzT7fxt2Qc/NjHL0JOaFxAlWl0XtCX1c3t4MtRAVqRR+VnUkVHZiZ4WVQAQQYZb92FA92dS2VYZftHUZqDIH1XuaGMAQ54LljwxVs+MqVzndxOpToIKHbF76rs57yIhhizlrSAc1RGU0OKwlzB3yoAlLpMruxGEKWFT9bi4vPk59uo3UMMEuj9EDaTvOqSQthuhkoIy5CM8ktk7h+V9aoYFhSu6Th7dFiikljALQYHrK6NVvlXTNXyIscZC+3+lL675wVmpPOm/kGOHRkjub6JGWm/5i9opXTyWflQdqAnybZ30B2dHPs3XuEvPX9VEKK0ukvwukW0eU8/NEtaiE6+5UIEcIb+BTKDRMytoaAtoosgqstUQZ4JQ7UJFx2EmZAQ3IQ/CFoz7posJIEDX/vuarS2uAV16x2aKNuu3DZ4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:35:52.6833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7707b16-b407-4cb3-9e41-08df4589a138
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413

AMD Ryzen platforms implement the AMD Overclocking (AOD) interface in the
platform firmware and expose it through a WMI device. The interface is
command based: the firmware lists the commands it supports, and for each
command the supported range or list of values can be queried and a new
value can be applied. On Windows, this interface is used by AMD Ryzen
Master.

Add a driver for this WMI device. As a start, expose the following
settings through sysfs:
 - PPT, TDC and EDC limits (write-only) along with their supported range
   and step size
 - SMT enable
 - current memory clock (read-only)

The firmware stores new values in its setup variables and applies them
on the next reboot. It does not report the active PPT, TDC and EDC
limits, so these attributes are write-only.

During probe, the driver calls the Init() method, which the firmware
expects before any other method, and reads the list of supported
commands. The attributes are only created if the firmware lists the
matching command, and the property flag of each command is used to pick
between range and discrete value checks.

The firmware supports many more commands, more attributes can be added
later as needed.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 .../ABI/testing/sysfs-platform-amd-wmi-aod    |  99 +++
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/amd/Kconfig              |   1 +
 drivers/platform/x86/amd/Makefile             |   1 +
 drivers/platform/x86/amd/wmi/Kconfig          |  19 +
 drivers/platform/x86/amd/wmi/Makefile         |   8 +
 drivers/platform/x86/amd/wmi/aod.c            | 682 ++++++++++++++++++
 7 files changed, 817 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
 create mode 100644 drivers/platform/x86/amd/wmi/Kconfig
 create mode 100644 drivers/platform/x86/amd/wmi/Makefile
 create mode 100644 drivers/platform/x86/amd/wmi/aod.c

diff --git a/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod b/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
new file mode 100644
index 000000000000..36e998222930
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
@@ -0,0 +1,99 @@
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(WO) Package Power Tracking (PPT) limit of the CPU in
+		microwatts. This is the maximum power the CPU socket is
+		allowed to draw.
+
+		The value must be within ppt_limit_min and ppt_limit_max and
+		ppt_limit_min plus a multiple of ppt_limit_step, otherwise
+		-EINVAL is returned. The firmware stores the new value and
+		applies it on the next reboot. The firmware does not report
+		the active value, so this attribute cannot be read.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_min
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_max
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_step
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RO) Minimum, maximum and step size of the PPT limit in
+		microwatts supported by the platform.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(WO) Thermal Design Current (TDC) limit of the CPU in
+		milliamps. This is the maximum current the voltage regulators
+		can deliver over a sustained period.
+
+		The value must be within tdc_limit_min and tdc_limit_max and
+		tdc_limit_min plus a multiple of tdc_limit_step, otherwise
+		-EINVAL is returned. The firmware stores the new value and
+		applies it on the next reboot. The firmware does not report
+		the active value, so this attribute cannot be read.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_min
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_max
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_step
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RO) Minimum, maximum and step size of the TDC limit in
+		milliamps supported by the platform.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(WO) Electrical Design Current (EDC) limit of the CPU in
+		milliamps. This is the peak current the voltage regulators
+		can deliver for a short period.
+
+		The value must be within edc_limit_min and edc_limit_max and
+		edc_limit_min plus a multiple of edc_limit_step, otherwise
+		-EINVAL is returned. The firmware stores the new value and
+		applies it on the next reboot. The firmware does not report
+		the active value, so this attribute cannot be read.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_min
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_max
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_step
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RO) Minimum, maximum and step size of the EDC limit in
+		milliamps supported by the platform.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/mem_clock
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RO) Current memory clock (MEMCLK) in MHz. For DDR memory the
+		data rate in MT/s is twice this value, for example 2800 for
+		DDR5-5600.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/smt_enable
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RW) Simultaneous Multithreading (SMT) setting of the
+		platform firmware. Reading returns 1 if SMT is enabled and 0
+		otherwise.
+
+		Writing a boolean value as accepted by kstrtobool() (for
+		example 1/0, y/n or on/off) changes the setting. Other input,
+		or a value the firmware does not support, is rejected with
+		-EINVAL. The firmware stores the new value and applies it on
+		the next reboot. Depending on the platform, enabling SMT again
+		may need a power cycle instead of a reboot.
diff --git a/MAINTAINERS b/MAINTAINERS
index 748ce4d1c6a2..6a5dd872fbe4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1355,6 +1355,13 @@ F:	drivers/spi/spi-amd-pci.c
 F:	drivers/spi/spi-amd.c
 F:	drivers/spi/spi-amd.h
 
+AMD WMI AOD DRIVER
+M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
+F:	drivers/platform/x86/amd/wmi/
+
 AMD XDNA DRIVER
 M:	Min Ma <mamin506@gmail.com>
 M:	Lizhi Hou <lizhi.hou@amd.com>
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index a1a74ef6c859..8f51901f98ca 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -7,6 +7,7 @@ source "drivers/platform/x86/amd/hsmp/Kconfig"
 source "drivers/platform/x86/amd/pmf/Kconfig"
 source "drivers/platform/x86/amd/pmc/Kconfig"
 source "drivers/platform/x86/amd/hfi/Kconfig"
+source "drivers/platform/x86/amd/wmi/Kconfig"
 
 config AMD_3D_VCACHE
 	tristate "AMD 3D V-Cache Performance Optimizer Driver"
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index 2f467dbbfc8a..a3415f83cf03 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
 obj-$(CONFIG_AMD_HALO_LED)	+= amd_halo_led.o
 obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
 obj-$(CONFIG_AMD_HFI)		+= hfi/
+obj-y				+= wmi/
diff --git a/drivers/platform/x86/amd/wmi/Kconfig b/drivers/platform/x86/amd/wmi/Kconfig
new file mode 100644
index 000000000000..a8d2c35ef919
--- /dev/null
+++ b/drivers/platform/x86/amd/wmi/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# AMD WMI drivers
+#
+
+config AMD_WMI_AOD
+	tristate "AMD Overclocking (AOD) WMI driver"
+	depends on ACPI_WMI
+	help
+	  This driver adds support for the AMD Overclocking (AOD) WMI
+	  interface found on AMD Ryzen platforms. It allows to change the
+	  PPT, TDC and EDC limits and the SMT setting of the firmware, and
+	  to read the current memory clock through sysfs.
+
+	  Changing these settings can make the system unstable or damage
+	  the hardware. If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called amd-wmi-aod.
diff --git a/drivers/platform/x86/amd/wmi/Makefile b/drivers/platform/x86/amd/wmi/Makefile
new file mode 100644
index 000000000000..4848193aff88
--- /dev/null
+++ b/drivers/platform/x86/amd/wmi/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/amd/wmi
+# AMD WMI drivers
+#
+
+obj-$(CONFIG_AMD_WMI_AOD)	+= amd-wmi-aod.o
+amd-wmi-aod-y			:= aod.o
diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/amd/wmi/aod.c
new file mode 100644
index 000000000000..d92d073a27d5
--- /dev/null
+++ b/drivers/platform/x86/amd/wmi/aod.c
@@ -0,0 +1,682 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Overclocking (AOD) WMI driver
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/align.h>
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/kobject.h>
+#include <linux/kstrtox.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/units.h>
+#include <linux/wmi.h>
+
+#include <linux/byteorder/generic.h>
+
+#define DRIVER_NAME			"amd-wmi-aod"
+#define AMD_AOD_WMI_GUID		"95F20B61-3D44-41F8-87E1-03CBF94C4E8F"
+
+/* WMI method IDs */
+#define AOD_QUERY_VERSION		1
+#define AOD_INIT			2
+#define AOD_GET_OBJECT_ID		3
+#define AOD_GET_DVALUES			4
+#define AOD_RUN_COMMAND			5
+#define AOD_GET_MINMAX_STEPPING		6
+#define AOD_GET_DIMM_SPD_DATA		7
+#define AOD_GET_OBJECT_ID2		8
+#define AOD_GET_RMP_DATA		9
+#define AOD_GET_OPP_TABLE		10
+#define AOD_GET_OPP_DATA		11
+
+#define AOD_MAX_OID_COUNT		64
+#define AOD_OID_STRING_LEN		64
+#define AOD_DVALUES_COUNT		100
+
+/* Property flag of a command: discrete values or a linear range */
+#define AOD_PROPERTY_LINEAR		1
+
+/* WMI strings are aligned on a 2-byte boundary inside WMI buffers */
+#define AOD_WMI_STRING_ALIGN		2
+
+#define to_amd_aod_attr(_attr)	container_of_const(_attr, struct amd_aod_attr, dev_attr)
+
+#define AMD_AOD_ATTR(_name, _mode, _show, _store, _setting, _field, _scale)	\
+	static const struct amd_aod_attr amd_aod_attr_##_name = {		\
+		.dev_attr = __ATTR(_name, _mode, _show, _store),		\
+		.setting = _setting,						\
+		.field = _field,						\
+		.scale = _scale,						\
+	}
+
+/*
+ * GetObjectID/GetObjectID2 result: the length, followed by the ID and the
+ * property arrays, followed by AOD_MAX_OID_COUNT WMI strings.
+ *
+ * The MOF defines fixed-size arrays for all results, so shorter buffers
+ * are rejected.
+ */
+struct amd_aod_oid_result {
+	__le32 length;
+	__le32 id[AOD_MAX_OID_COUNT];
+	__le32 property[AOD_MAX_OID_COUNT];
+} __packed;
+
+struct amd_aod_dvalues_result {
+	__le32 id;
+	__le32 current_value;
+	__le32 length;
+	__le32 dvalues[AOD_DVALUES_COUNT];
+} __packed;
+
+struct amd_aod_minmax_result {
+	__le32 id;
+	__le32 current_value;
+	__le32 min;
+	__le32 max;
+	__le32 stepping;
+} __packed;
+
+/* Start of the RunCommand result buffer */
+struct amd_aod_run_command_result {
+	__le16 smi_cmd;
+	__le32 smi_status;
+} __packed;
+
+/* Command list returned by GetObjectID/GetObjectID2 */
+struct amd_aod_oid_package {
+	u32 length;
+	u32 id[AOD_MAX_OID_COUNT];
+	u32 property[AOD_MAX_OID_COUNT];
+	char id_string[AOD_MAX_OID_COUNT][AOD_OID_STRING_LEN];
+};
+
+enum amd_aod_cmd {
+	AOD_CMD_MEM_CLOCK	= 0x00020001,
+	AOD_CMD_SMT_ENABLE	= 0x00020026,
+	AOD_CMD_PPT_LIMIT	= 0x00050001,
+	AOD_CMD_TDC_LIMIT	= 0x00050002,
+	AOD_CMD_EDC_LIMIT	= 0x00050003,
+};
+
+enum amd_aod_setting {
+	AOD_SETTING_PPT,
+	AOD_SETTING_TDC,
+	AOD_SETTING_EDC,
+	AOD_SETTING_MEM_CLOCK,
+	AOD_SETTING_SMT,
+	AOD_SETTING_MAX,
+};
+
+enum amd_aod_field {
+	AOD_FIELD_CURRENT,
+	AOD_FIELD_MIN,
+	AOD_FIELD_MAX,
+	AOD_FIELD_STEP,
+};
+
+/*
+ * The Getdvalues and GetMinMaxSteppingValues results are kept here instead
+ * of on the stack because of their size. Like all WMI calls they are
+ * protected by the lock.
+ */
+struct amd_aod_data {
+	struct wmi_device *wdev;
+	u32 version;
+	struct mutex lock;	/* Serializes WMI calls and protects the fields below */
+	struct amd_aod_dvalues_result dvalues;
+	struct amd_aod_minmax_result minmax;
+	bool supported[AOD_SETTING_MAX];
+	bool linear[AOD_SETTING_MAX];
+};
+
+struct amd_aod_attr {
+	struct device_attribute dev_attr;
+	enum amd_aod_setting setting;
+	enum amd_aod_field field;
+	u32 scale;	/* sysfs units per firmware unit */
+};
+
+static const enum amd_aod_cmd amd_aod_setting_cmd[AOD_SETTING_MAX] = {
+	[AOD_SETTING_PPT] = AOD_CMD_PPT_LIMIT,
+	[AOD_SETTING_TDC] = AOD_CMD_TDC_LIMIT,
+	[AOD_SETTING_EDC] = AOD_CMD_EDC_LIMIT,
+	[AOD_SETTING_MEM_CLOCK] = AOD_CMD_MEM_CLOCK,
+	[AOD_SETTING_SMT] = AOD_CMD_SMT_ENABLE,
+};
+
+static bool amd_aod_is_limit(enum amd_aod_setting setting)
+{
+	switch (setting) {
+	case AOD_SETTING_PPT:
+	case AOD_SETTING_TDC:
+	case AOD_SETTING_EDC:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/*
+ * The firmware reads the input buffer even for methods that take no
+ * arguments, so a dummy 32-bit argument is passed to those methods.
+ */
+static int amd_aod_call(struct amd_aod_data *data, u32 method_id, u32 arg,
+			struct wmi_buffer *out, size_t min_size)
+{
+	__le32 in_arg = cpu_to_le32(arg);
+	const struct wmi_buffer in = {
+		.length = sizeof(in_arg),
+		.data = &in_arg,
+	};
+
+	return wmidev_invoke_method(data->wdev, 0, method_id, &in, out, min_size);
+}
+
+static int amd_aod_init(struct amd_aod_data *data)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, AOD_INIT, 0, &out, sizeof(u8));
+	if (ret)
+		return ret;
+
+	dev_dbg(&data->wdev->dev, "Init status: %u\n", *(u8 *)out.data);
+	kfree(out.data);
+
+	return 0;
+}
+
+static int amd_aod_query_version(struct amd_aod_data *data)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, AOD_QUERY_VERSION, 0, &out, sizeof(__le32));
+	if (ret)
+		return ret;
+
+	data->version = le32_to_cpup(out.data);
+	kfree(out.data);
+
+	return 0;
+}
+
+static void amd_aod_parse_object_id(const struct amd_aod_oid_result *res,
+				    struct amd_aod_oid_package *pkg)
+{
+	int i;
+
+	pkg->length = min(le32_to_cpu(res->length), AOD_MAX_OID_COUNT);
+	for (i = 0; i < AOD_MAX_OID_COUNT; i++) {
+		pkg->id[i] = le32_to_cpu(res->id[i]);
+		pkg->property[i] = le32_to_cpu(res->property[i]);
+	}
+}
+
+static int amd_aod_parse_names(const struct wmi_buffer *out, struct amd_aod_oid_package *pkg)
+{
+	const struct wmi_string *str;
+	size_t offset;
+	int ret, i;
+
+	offset = sizeof(struct amd_aod_oid_result);
+	for (i = 0; i < pkg->length; i++) {
+		offset = ALIGN(offset, AOD_WMI_STRING_ALIGN);
+		if (out->length < offset + sizeof(*str))
+			return -EPROTO;
+
+		str = out->data + offset;
+		offset += sizeof(*str) + le16_to_cpu(str->length);
+		if (out->length < offset)
+			return -EPROTO;
+
+		ret = wmi_string_to_utf8s(str, (u8 *)pkg->id_string[i],
+					  sizeof(pkg->id_string[i]));
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * The command names are not used by the driver, but they are always parsed
+ * because firmware may signal errors by returning a truncated buffer.
+ */
+static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
+				 struct amd_aod_oid_package *pkg)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, method_id, 0, &out, sizeof(struct amd_aod_oid_result));
+	if (ret)
+		return ret;
+
+	struct amd_aod_oid_result *res __free(kfree) = out.data;
+
+	amd_aod_parse_object_id(res, pkg);
+
+	return amd_aod_parse_names(&out, pkg);
+}
+
+static int amd_aod_get_dvalues(struct amd_aod_data *data, u32 cmd_id)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, AOD_GET_DVALUES, cmd_id, &out, sizeof(data->dvalues));
+	if (ret)
+		return ret;
+
+	memcpy(&data->dvalues, out.data, sizeof(data->dvalues));
+	kfree(out.data);
+
+	return 0;
+}
+
+static int amd_aod_get_minmax_stepping(struct amd_aod_data *data, u32 cmd_id)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, AOD_GET_MINMAX_STEPPING, cmd_id, &out, sizeof(data->minmax));
+	if (ret)
+		return ret;
+
+	memcpy(&data->minmax, out.data, sizeof(data->minmax));
+	kfree(out.data);
+
+	return 0;
+}
+
+static int amd_aod_run_command(struct amd_aod_data *data, u32 cmd_id, u32 value, u32 *status)
+{
+	__le32 args[2] = { cpu_to_le32(cmd_id), cpu_to_le32(value) };
+	const struct wmi_buffer in = {
+		.length = sizeof(args),
+		.data = args,
+	};
+	const struct amd_aod_run_command_result *res;
+	struct wmi_buffer out;
+	int ret;
+
+	ret = wmidev_invoke_method(data->wdev, 0, AOD_RUN_COMMAND, &in, &out, sizeof(*res));
+	if (ret)
+		return ret;
+
+	res = out.data;
+	*status = le32_to_cpu(res->smi_status);
+	kfree(out.data);
+
+	return 0;
+}
+
+static int amd_aod_set_value(struct amd_aod_data *data, u32 cmd_id, u32 value)
+{
+	u32 status;
+	int ret;
+
+	ret = amd_aod_run_command(data, cmd_id, value, &status);
+	if (ret)
+		return ret;
+
+	return status ? -EIO : 0;
+}
+
+/* Read the current value, using the method that matches the command property */
+static int amd_aod_get_current(struct amd_aod_data *data, enum amd_aod_setting setting,
+			       u64 *value)
+{
+	u32 cmd_id = amd_aod_setting_cmd[setting];
+	int ret;
+
+	if (data->linear[setting]) {
+		ret = amd_aod_get_minmax_stepping(data, cmd_id);
+		if (ret)
+			return ret;
+
+		if (le32_to_cpu(data->minmax.id) != cmd_id)
+			return -EPROTO;
+
+		*value = le32_to_cpu(data->minmax.current_value);
+		return 0;
+	}
+
+	ret = amd_aod_get_dvalues(data, cmd_id);
+	if (ret)
+		return ret;
+
+	if (le32_to_cpu(data->dvalues.id) != cmd_id)
+		return -EPROTO;
+
+	*value = le32_to_cpu(data->dvalues.current_value);
+
+	return 0;
+}
+
+/*
+ * Linear commands accept values within the min/max range in multiples of
+ * the step size, discrete commands only accept the values listed by the
+ * firmware.
+ */
+static int amd_aod_check_value(struct amd_aod_data *data, enum amd_aod_setting setting,
+			       u32 value)
+{
+	u32 cmd_id = amd_aod_setting_cmd[setting];
+	u32 min, max, step, count, i;
+	int ret;
+
+	if (data->linear[setting]) {
+		ret = amd_aod_get_minmax_stepping(data, cmd_id);
+		if (ret)
+			return ret;
+
+		min = le32_to_cpu(data->minmax.min);
+		max = le32_to_cpu(data->minmax.max);
+		step = le32_to_cpu(data->minmax.stepping);
+
+		if (value < min || value > max)
+			return -EINVAL;
+
+		if (step && (value - min) % step)
+			return -EINVAL;
+
+		return 0;
+	}
+
+	ret = amd_aod_get_dvalues(data, cmd_id);
+	if (ret)
+		return ret;
+
+	count = min(le32_to_cpu(data->dvalues.length), AOD_DVALUES_COUNT);
+	for (i = 0; i < count; i++) {
+		if (le32_to_cpu(data->dvalues.dvalues[i]) == value)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
+static ssize_t amd_aod_value_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	const struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
+	struct amd_aod_data *data = dev_get_drvdata(dev);
+	u64 value;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_get_current(data, aod_attr->setting, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%llu\n", value * aod_attr->scale);
+}
+
+static ssize_t amd_aod_range_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	const struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
+	struct amd_aod_data *data = dev_get_drvdata(dev);
+	u32 cmd_id = amd_aod_setting_cmd[aod_attr->setting];
+	u64 value;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_get_minmax_stepping(data, cmd_id);
+	if (ret)
+		return ret;
+
+	switch (aod_attr->field) {
+	case AOD_FIELD_MIN:
+		value = le32_to_cpu(data->minmax.min);
+		break;
+	case AOD_FIELD_MAX:
+		value = le32_to_cpu(data->minmax.max);
+		break;
+	default:
+		value = le32_to_cpu(data->minmax.stepping);
+		break;
+	}
+
+	return sysfs_emit(buf, "%llu\n", value * aod_attr->scale);
+}
+
+static int amd_aod_store(struct amd_aod_data *data, enum amd_aod_setting setting, u32 value)
+{
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_check_value(data, setting, value);
+	if (ret)
+		return ret;
+
+	return amd_aod_set_value(data, amd_aod_setting_cmd[setting], value);
+}
+
+static ssize_t amd_aod_value_store(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	const struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
+	struct amd_aod_data *data = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	ret = kstrtou32(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	if (value % aod_attr->scale)
+		return -EINVAL;
+
+	ret = amd_aod_store(data, aod_attr->setting, value / aod_attr->scale);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t amd_aod_smt_store(struct device *dev, struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct amd_aod_data *data = dev_get_drvdata(dev);
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	ret = amd_aod_store(data, AOD_SETTING_SMT, enable);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+AMD_AOD_ATTR(ppt_limit, 0200, NULL, amd_aod_value_store,
+	     AOD_SETTING_PPT, AOD_FIELD_CURRENT, MICROWATT_PER_MILLIWATT);
+AMD_AOD_ATTR(ppt_limit_min, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_PPT, AOD_FIELD_MIN, MICROWATT_PER_MILLIWATT);
+AMD_AOD_ATTR(ppt_limit_max, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_PPT, AOD_FIELD_MAX, MICROWATT_PER_MILLIWATT);
+AMD_AOD_ATTR(ppt_limit_step, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_PPT, AOD_FIELD_STEP, MICROWATT_PER_MILLIWATT);
+AMD_AOD_ATTR(tdc_limit, 0200, NULL, amd_aod_value_store,
+	     AOD_SETTING_TDC, AOD_FIELD_CURRENT, 1);
+AMD_AOD_ATTR(tdc_limit_min, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_TDC, AOD_FIELD_MIN, 1);
+AMD_AOD_ATTR(tdc_limit_max, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_TDC, AOD_FIELD_MAX, 1);
+AMD_AOD_ATTR(tdc_limit_step, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_TDC, AOD_FIELD_STEP, 1);
+AMD_AOD_ATTR(edc_limit, 0200, NULL, amd_aod_value_store,
+	     AOD_SETTING_EDC, AOD_FIELD_CURRENT, 1);
+AMD_AOD_ATTR(edc_limit_min, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_EDC, AOD_FIELD_MIN, 1);
+AMD_AOD_ATTR(edc_limit_max, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_EDC, AOD_FIELD_MAX, 1);
+AMD_AOD_ATTR(edc_limit_step, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_EDC, AOD_FIELD_STEP, 1);
+AMD_AOD_ATTR(mem_clock, 0400, amd_aod_value_show, NULL,
+	     AOD_SETTING_MEM_CLOCK, AOD_FIELD_CURRENT, 1);
+AMD_AOD_ATTR(smt_enable, 0600, amd_aod_value_show, amd_aod_smt_store,
+	     AOD_SETTING_SMT, AOD_FIELD_CURRENT, 1);
+
+static const struct attribute *const amd_aod_attrs[] = {
+	&amd_aod_attr_ppt_limit.dev_attr.attr,
+	&amd_aod_attr_ppt_limit_min.dev_attr.attr,
+	&amd_aod_attr_ppt_limit_max.dev_attr.attr,
+	&amd_aod_attr_ppt_limit_step.dev_attr.attr,
+	&amd_aod_attr_tdc_limit.dev_attr.attr,
+	&amd_aod_attr_tdc_limit_min.dev_attr.attr,
+	&amd_aod_attr_tdc_limit_max.dev_attr.attr,
+	&amd_aod_attr_tdc_limit_step.dev_attr.attr,
+	&amd_aod_attr_edc_limit.dev_attr.attr,
+	&amd_aod_attr_edc_limit_min.dev_attr.attr,
+	&amd_aod_attr_edc_limit_max.dev_attr.attr,
+	&amd_aod_attr_edc_limit_step.dev_attr.attr,
+	&amd_aod_attr_mem_clock.dev_attr.attr,
+	&amd_aod_attr_smt_enable.dev_attr.attr,
+	NULL
+};
+
+static umode_t amd_aod_attr_is_visible(struct kobject *kobj, const struct attribute *attr, int n)
+{
+	struct amd_aod_data *data = dev_get_drvdata(kobj_to_dev(kobj));
+	const struct device_attribute *dev_attr = container_of_const(attr, struct device_attribute,
+								     attr);
+	enum amd_aod_setting setting = to_amd_aod_attr(dev_attr)->setting;
+
+	if (!data->supported[setting])
+		return 0;
+
+	/* The limits and their range are only supported for linear commands */
+	if (amd_aod_is_limit(setting) && !data->linear[setting])
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group amd_aod_group = {
+	.attrs_const = amd_aod_attrs,
+	.is_visible_const = amd_aod_attr_is_visible,
+};
+__ATTRIBUTE_GROUPS(amd_aod);
+
+static void amd_aod_scan_settings(struct amd_aod_data *data,
+				  const struct amd_aod_oid_package *pkg)
+{
+	int i, j;
+
+	for (i = 0; i < pkg->length; i++) {
+		for (j = 0; j < AOD_SETTING_MAX; j++) {
+			if (pkg->id[i] != amd_aod_setting_cmd[j])
+				continue;
+
+			data->supported[j] = true;
+			data->linear[j] = pkg->property[i] == AOD_PROPERTY_LINEAR;
+		}
+	}
+}
+
+static int amd_aod_detect_settings(struct amd_aod_data *data)
+{
+	struct amd_aod_oid_package *pkg __free(kfree) = kzalloc_obj(*pkg);
+	int ret;
+
+	if (!pkg)
+		return -ENOMEM;
+
+	ret = amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg);
+	if (ret)
+		return ret;
+
+	amd_aod_scan_settings(data, pkg);
+
+	/* GetObjectID2 might not be implemented by all firmware versions */
+	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg))
+		dev_dbg(&data->wdev->dev, "GetObjectID2 not available\n");
+	else
+		amd_aod_scan_settings(data, pkg);
+
+	return 0;
+}
+
+static int amd_aod_probe(struct wmi_device *wdev, const void *context)
+{
+	struct device *dev = &wdev->dev;
+	struct amd_aod_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->wdev = wdev;
+
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(dev, data);
+
+	/* The firmware expects Init() to be called before any other method */
+	ret = amd_aod_init(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize the AOD interface\n");
+
+	/* Make sure that the firmware interface is functional */
+	ret = amd_aod_query_version(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to query AOD interface version\n");
+
+	ret = amd_aod_detect_settings(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get the list of supported commands\n");
+
+	return 0;
+}
+
+static const struct wmi_device_id amd_aod_id_table[] = {
+	{ AMD_AOD_WMI_GUID, NULL },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, amd_aod_id_table);
+
+static struct wmi_driver amd_aod_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.dev_groups = amd_aod_groups,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = amd_aod_id_table,
+	.probe = amd_aod_probe,
+	.no_singleton = true,
+};
+module_wmi_driver(amd_aod_driver);
+
+MODULE_DESCRIPTION("AMD Overclocking (AOD) WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

