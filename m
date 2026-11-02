Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604065;
	b=lKCcLLDSROqCvZOS3+CVcde0wsXxxLZwQoj+Cv9DhCvNkn7dAxAtuz1xNPGgKj2Rei+2
	 QpTEIpe4tzTPyreuVx47pqGWxDAl60cnS8hfjlmvbiC6cRhIiK35ERHHdgRI4iz9yJQH8
	 9ZXmK2fCsrY3Owji3ytMVH47hKBuJnHW/NA2DcUiZPyq1OtjS5q56Sv6fO4eOARpaQUw5
	 qPvwCwMpEmTDPkGJN+I9t0mVAv280+t2TcWNDpwjVn0N6xZIgkrwE5S0e+KUuqlSJRMaN
	 yzQ/RTyVLeKAtl+s94qnD3aJhtjUaMqBUUNq/WOftyZRt4HpXSIzrNCvd2l5iTwR7CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604065;
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
	bh=udYAEWkbFNf9HF/5va+Zh7UNfhP0kwFatNiAdXBxleM=;
	b=VPeXW08ZrQg71qUrnLrXD9KYPPd04XeecmnpOkYakhTVIHtDxsr2KU6ucqFcAA6cYbGq
	 Y47zgKakBLDWdtS0Mc/j57SB/2r+kl7kzJBq2tmfC7w5k0f4RudNlV97yAouum6RQ/agf
	 jd9dQOYxXfD2EOy5wPJXqkLxuQwNqoqMb8xEY1cZpJal7TLaJ1cEF3A4SSnnJZIrTVgzr
	 vVu2A3FocdfhFVUd5jcqQC6s6Y+CoQdhUPpKI38pt7nGjFxrMlBqskDDDzHjaz4fNnWO3
	 wutoFmgHz/HPadXJSavFeWsoi5z2h4ajGX1iaLQVW8Ycy0MqWpQHF4YTDdufhPqBHUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lwDRKKBO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.52
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B9606A32C
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943B9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lwDRKKBO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmGzXqkGZNn5wqfeWXw9k5Xbs2nmp6M0irQMBE7N0fZzQL/qb6NAx+j9gDYH8+aKy3ZTe7giGP/fD46S49vuEB8GM5LubnhtwaDxHdiwGiyb2GOCGO2ZCE0uVjACH+CPGzlH+jSl9syhW+vIs+ml7KbL/IDOW4Vmx8HGuudNZtz1jpMz5efduiAXJdzTCESLR/MhVJAPnf5E+1UFvmeQBJ5lCVfmQBUKn1VQHboCd+h1UtpJfeVX5D5kMzPKX28yV0VZ+ROhxgCBUzv9KFjONQjQSDjnYzENOEfbROuveRVJLjsV6Pc7W4SPYyvAnXuNTbCX7GZOP3Hs3UPvvITkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udYAEWkbFNf9HF/5va+Zh7UNfhP0kwFatNiAdXBxleM=;
 b=jFEqmwyJzmvwM5Is7qdygBTvmYpU4oBWemG/filnmqW3WKvJrPJOmE0U4sh+0djVR7lbNcEvDydqXl0rtFSOGY6jZ9gfiPtRkLZLP1mUnQxF0kNK0uzh63ljB7QHbXh9W/ejXkFs6bNelqnIV77PjpcwLUKP95IKfruES1hkKB1mtaY3B1B3WXok/tDvsLJOi/s6snsxd3S4lqw1f3nitW09ESe1kIrlo89fh1N9XarwmzchHo2CG0RgIrPFoCp3EdcXi4ox3U9e0EXYqJBRRelImj+pLXiAPr1hh5wOoOcKwmgqPMkVa5fSfKzExoLG8njq24Q+XWNuKQLuiarOKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udYAEWkbFNf9HF/5va+Zh7UNfhP0kwFatNiAdXBxleM=;
 b=lwDRKKBO4IbxE6bcR17h1TL+k1omD1J1K7EZpi1x05XVe4ySRMcde9IzGO2s3056MX+Pshu9GOs0SbHY8fC8FM70uChmn4pqZOwG+k9alKODVPHLij4c1hldrLmHlFLR9xecw3QcJUSCCyDDqcM38Vm4bpsIR+II025cyPKdG8k=
Received: from MW3PR06CA0021.namprd06.prod.outlook.com (2603:10b6:303:2a::26)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:48 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::f) by MW3PR06CA0021.outlook.office365.com
 (2603:10b6:303:2a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:48 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:45 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 17/26] platform/x86/amd/hsmp: Add DIMM power and temperature sysfs files
Date: Mon, 2 Nov 2026 07:19:15 +0000
Message-ID: <f81741f8163d9c88822fad2c06bf881ff8ebce61.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd16076-dc77-4a89-abe3-08df38b1d16e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|11063799006|5023799004|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NfD0StiLqCJ9C0Dch1NRA+qX3q4zi1j3+hs6eZf5x/6DSoGaFWlCERMAcsqp6Iv+ZimKX8VKNQXzcXxo+jjHhDYCsJ/8RKBtRWr6oZWgU1Qt4Vt0KDwFIA1+nBRpuED/ErP8FgzMCJ4JFyxdvlJYb9VgMJ07DdW0Rxtim4G5uz6nWIJYZ6aYm3ltfFRJPwkD/KYl6YpgwyEq/7l6GvMP+vizAAb+nqi2TTMnKOzw9+aIHiqNYXKML0b2Q2oHfJEDtbUYLTZ8GY1sEqXMK6efQJ4TcslSVJWckvFHcomyd7PnlrkBUemHPJZaQPbqwBQiKOCQORi/gF5lGvAi8LRB9kMb+BY4qnQSU4gKQGNOyr6LIZWWllCAXvgGY2jVBxtaqWT7xD5L+NwNpKYhpIyjehbBDZbr7KS/plxiEwW1nppdfmbCLJo7BXnYGbZE7sZ5p3kUaHbzxKdKVbIOi2EGz9+kHBu7l57c4YLlrlnbcGcmy+USj8FwPrL/Tld7gHtQ9zw04ZDEUkOd93Dm7JyqltzE3LNk3v1a6SN4Ww56PlxMk40B6mGRBlh2UZHl+NAYU1nJvpnuFlmt6W47c9KH1TrjGQEy9M0f6iy1CMX83yEM8ySmJ09GAflCsTNDoz2kfwkdCcSYjzg6WJNQEhxDcsM9glpSA+3k4a/4CCRbuIsd2umy783DDOee8fgUFvhCclk4yqC1H5DH1X5AsDh5cg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(11063799006)(5023799004)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bYVBR5tLac6U4u5kL1xWimeVN75ZiVxesokXPyxzTtM6hWEqfsjUempnLF89Y4TIwF9JvSYsu/RWSTTjqxo7y1Oj1bnq5X6bQiwAepMdlD2z9aWi5vzr0mumdYg+TacuGChphJDHxmBAfaVLIZpDB2hmoLCXxbcEuaN6QZX7RxRnhIUJw3VK8FM8OqyGTWVlBi/zL/iA0yy1P3/MiGZTtQyDK1vV/7CUmrTpUp1CIgJ/tMU2RjNUPEbQVp+J/SHlDI3TTQCoKWpXv2QXkpUBuJpaDEUDhh4wJ5dJH6mdOrkWzO1/TsLNHNigVvzIvKKm5BsuDBmKbXUOfVLWNz8KYKmpdKcjhSBmnLx1P3rQIJSo8uZ1Tf9UF3vMgbdds4KfjQV+lxwp+KnOmLVQBwXlI6CXjU0yVMem6UXqDpllmd7qjb7PIk3rqKc4XsLLYloH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:48.2927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd16076-dc77-4a89-abe3-08df38b1d16e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469

Expose dimm_power, dimm_temperature, and dimm_temperature_range on
both drivers. Probe records which DIMMs respond, and each directory
shows only those addresses plus the socket-wide aggregate files.

dimm_temperature/ always reports a sensor type (TS0/TS1/SPDHub). Protocol
7.2 and later supply it from firmware; older protocols derive TS0/TS1 from
address bit 6. Socket-wide max temperature falls back to SPDHub when the
protocol omits the sensor.

dimm_temperature_range/ is UMC-channel granularity only (dimm_0x80-0x8f);
unlike dimm_power/, 0x90-0x9F does not apply to HSMP_GET_DIMM_TEMP_RANGE.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   23 +
 drivers/platform/x86/amd/hsmp/acpi.c  |  297 ++++++
 drivers/platform/x86/amd/hsmp/hsmp.c  |   57 ++
 drivers/platform/x86/amd/hsmp/hsmp.h  |    5 +
 drivers/platform/x86/amd/hsmp/plat.c  | 1272 ++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/sysfs.c |  356 +++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |   17 +
 7 files changed, 1982 insertions(+), 45 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 28cdb9d9ec645..1a2fd95e21ac1 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -159,6 +159,29 @@ write-only when the platform enables only that direction of the message.
   "<dimm_addr> <lid> <reg_offset> <reg_space> <write_data>".
   write_data is 0-255. Extra arguments are rejected. Field ranges match
   dimm_sb_get.
+* dimm_power/: Read-only DIMM power. dimm_0x80 through dimm_0x8f and
+  dimm_0x90 through dimm_0x9f are created for DIMMs that respond during
+  probe. A read returns "<power_mW> <update_rate_ms>". dimm_total_power
+  sums the present DIMMs in the same format, or fails with -ENODATA when
+  none are present. dimm_max_power returns
+  "<power_mW> <update_rate_ms> 0xAA" for the highest-power DIMM.
+* dimm_temperature/: Read-only DIMM temperature. Files are dimm_0x80
+  through dimm_0x8f, dimm_0xc0 through dimm_0xcf, dimm_0x90 through
+  dimm_0x9f, and dimm_0xd0 through dimm_0xdf. The 0xC0 and 0xD0 files
+  share presence with 0x80 and 0x90. A read returns
+  "<degrees> <update_rate_ms> <sensor>" with three fractional digits.
+  The sensor is TS0, TS1, SPDHub, or Reserved. Protocol 7.2 and later
+  reports it from firmware; older protocols derive TS0/TS1 from address
+  bit 6. dimm_max_temperature returns
+  "<degrees> <update_rate_ms> <sensor> 0xAA" for the hottest DIMM
+  (SPDHub when the protocol omits the sensor), or fails with -ENODATA
+  when none respond.
+* dimm_temperature_range/: Read-only temperature range and DDR refresh
+  mode. HSMP_GET_DIMM_TEMP_RANGE is UMC-channel granularity only, so
+  address files are dimm_0x80-0x8f (one per channel). A read returns
+  "<range> <1x|2x>". The directory is absent when no channel responds.
+  dimm_max_temperature_range returns "<range> <1x|2x> 0xAA" for the
+  hottest channel, or fails with -ENODATA when none respond.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index ee9fb3ed74dc6..2028c1e8fc1c3 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -445,6 +445,7 @@ static int init_acpi(struct device *dev)
 			return ret;
 		}
 
+		hsmp_scan_dimms(sock);
 		hsmp_scan_io_bw(sock);
 		hsmp_scan_xgmi_bw(sock);
 	}
@@ -663,6 +664,131 @@ HSMP_DEV_ATTR_RW(rail_iso_freq_policy, HSMP_CPU_RAIL_ISO_FREQ_POLICY,
 		 HSMP_CPU_RAIL_ISO_FREQ_POLICY,
 		 hsmp_rail_iso_freq_policy_show, hsmp_rail_iso_freq_policy_store, 0644);
 
+#define HSMP_DIMM_RO(_var, _name, _show, _msg, _priv)			\
+	HSMP_SYS_ATTR_PRIV(_var, _name, _show, U16_MAX, _msg, _priv)
+
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0);
+
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0);
+
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0);
+
+#undef HSMP_DIMM_RO
+
 static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_c0_residency.dattr.attr,
 	&hattr_prochot_status.dattr.attr,
@@ -826,6 +952,174 @@ static const struct attribute_group xgmi_bw_group = {
 	.is_visible = hsmp_xgmi_bw_is_visible,
 };
 
+static struct attribute *dimm_power_attrs[] = {
+	&hattr_dpwr_80.dattr.attr,
+	&hattr_dpwr_81.dattr.attr,
+	&hattr_dpwr_82.dattr.attr,
+	&hattr_dpwr_83.dattr.attr,
+	&hattr_dpwr_84.dattr.attr,
+	&hattr_dpwr_85.dattr.attr,
+	&hattr_dpwr_86.dattr.attr,
+	&hattr_dpwr_87.dattr.attr,
+	&hattr_dpwr_88.dattr.attr,
+	&hattr_dpwr_89.dattr.attr,
+	&hattr_dpwr_8a.dattr.attr,
+	&hattr_dpwr_8b.dattr.attr,
+	&hattr_dpwr_8c.dattr.attr,
+	&hattr_dpwr_8d.dattr.attr,
+	&hattr_dpwr_8e.dattr.attr,
+	&hattr_dpwr_8f.dattr.attr,
+	&hattr_dpwr_90.dattr.attr,
+	&hattr_dpwr_91.dattr.attr,
+	&hattr_dpwr_92.dattr.attr,
+	&hattr_dpwr_93.dattr.attr,
+	&hattr_dpwr_94.dattr.attr,
+	&hattr_dpwr_95.dattr.attr,
+	&hattr_dpwr_96.dattr.attr,
+	&hattr_dpwr_97.dattr.attr,
+	&hattr_dpwr_98.dattr.attr,
+	&hattr_dpwr_99.dattr.attr,
+	&hattr_dpwr_9a.dattr.attr,
+	&hattr_dpwr_9b.dattr.attr,
+	&hattr_dpwr_9c.dattr.attr,
+	&hattr_dpwr_9d.dattr.attr,
+	&hattr_dpwr_9e.dattr.attr,
+	&hattr_dpwr_9f.dattr.attr,
+	&hattr_dpwr_total.dattr.attr,
+	&hattr_dpwr_max.dattr.attr,
+	NULL
+};
+
+static struct attribute *dimm_temperature_attrs[] = {
+	&hattr_dt_80.dattr.attr,
+	&hattr_dt_81.dattr.attr,
+	&hattr_dt_82.dattr.attr,
+	&hattr_dt_83.dattr.attr,
+	&hattr_dt_84.dattr.attr,
+	&hattr_dt_85.dattr.attr,
+	&hattr_dt_86.dattr.attr,
+	&hattr_dt_87.dattr.attr,
+	&hattr_dt_88.dattr.attr,
+	&hattr_dt_89.dattr.attr,
+	&hattr_dt_8a.dattr.attr,
+	&hattr_dt_8b.dattr.attr,
+	&hattr_dt_8c.dattr.attr,
+	&hattr_dt_8d.dattr.attr,
+	&hattr_dt_8e.dattr.attr,
+	&hattr_dt_8f.dattr.attr,
+	&hattr_dt_c0.dattr.attr,
+	&hattr_dt_c1.dattr.attr,
+	&hattr_dt_c2.dattr.attr,
+	&hattr_dt_c3.dattr.attr,
+	&hattr_dt_c4.dattr.attr,
+	&hattr_dt_c5.dattr.attr,
+	&hattr_dt_c6.dattr.attr,
+	&hattr_dt_c7.dattr.attr,
+	&hattr_dt_c8.dattr.attr,
+	&hattr_dt_c9.dattr.attr,
+	&hattr_dt_ca.dattr.attr,
+	&hattr_dt_cb.dattr.attr,
+	&hattr_dt_cc.dattr.attr,
+	&hattr_dt_cd.dattr.attr,
+	&hattr_dt_ce.dattr.attr,
+	&hattr_dt_cf.dattr.attr,
+	&hattr_dt_90.dattr.attr,
+	&hattr_dt_91.dattr.attr,
+	&hattr_dt_92.dattr.attr,
+	&hattr_dt_93.dattr.attr,
+	&hattr_dt_94.dattr.attr,
+	&hattr_dt_95.dattr.attr,
+	&hattr_dt_96.dattr.attr,
+	&hattr_dt_97.dattr.attr,
+	&hattr_dt_98.dattr.attr,
+	&hattr_dt_99.dattr.attr,
+	&hattr_dt_9a.dattr.attr,
+	&hattr_dt_9b.dattr.attr,
+	&hattr_dt_9c.dattr.attr,
+	&hattr_dt_9d.dattr.attr,
+	&hattr_dt_9e.dattr.attr,
+	&hattr_dt_9f.dattr.attr,
+	&hattr_dt_d0.dattr.attr,
+	&hattr_dt_d1.dattr.attr,
+	&hattr_dt_d2.dattr.attr,
+	&hattr_dt_d3.dattr.attr,
+	&hattr_dt_d4.dattr.attr,
+	&hattr_dt_d5.dattr.attr,
+	&hattr_dt_d6.dattr.attr,
+	&hattr_dt_d7.dattr.attr,
+	&hattr_dt_d8.dattr.attr,
+	&hattr_dt_d9.dattr.attr,
+	&hattr_dt_da.dattr.attr,
+	&hattr_dt_db.dattr.attr,
+	&hattr_dt_dc.dattr.attr,
+	&hattr_dt_dd.dattr.attr,
+	&hattr_dt_de.dattr.attr,
+	&hattr_dt_df.dattr.attr,
+	&hattr_dt_max.dattr.attr,
+	NULL
+};
+
+static struct attribute *dimm_temperature_range_attrs[] = {
+	&hattr_dtr_80.dattr.attr,
+	&hattr_dtr_81.dattr.attr,
+	&hattr_dtr_82.dattr.attr,
+	&hattr_dtr_83.dattr.attr,
+	&hattr_dtr_84.dattr.attr,
+	&hattr_dtr_85.dattr.attr,
+	&hattr_dtr_86.dattr.attr,
+	&hattr_dtr_87.dattr.attr,
+	&hattr_dtr_88.dattr.attr,
+	&hattr_dtr_89.dattr.attr,
+	&hattr_dtr_8a.dattr.attr,
+	&hattr_dtr_8b.dattr.attr,
+	&hattr_dtr_8c.dattr.attr,
+	&hattr_dtr_8d.dattr.attr,
+	&hattr_dtr_8e.dattr.attr,
+	&hattr_dtr_8f.dattr.attr,
+	&hattr_dtr_max.dattr.attr,
+	NULL
+};
+
+static umode_t hsmp_dimm_power_is_visible(struct kobject *kobj,
+					  struct attribute *attr __always_unused,
+					  int id)
+{
+	return hsmp_dimm_power_file_visible(dev_get_drvdata(kobj_to_dev(kobj)), id);
+}
+
+static umode_t hsmp_dimm_temp_is_visible(struct kobject *kobj,
+					 struct attribute *attr __always_unused,
+					 int id)
+{
+	return hsmp_dimm_temp_file_visible(dev_get_drvdata(kobj_to_dev(kobj)), id);
+}
+
+static umode_t hsmp_dimm_temp_range_is_visible(struct kobject *kobj,
+					       struct attribute *attr __always_unused,
+					       int id)
+{
+	return hsmp_dimm_temp_range_file_visible(dev_get_drvdata(kobj_to_dev(kobj)),
+						 id);
+}
+
+static const struct attribute_group dimm_power_group = {
+	.name = "dimm_power",
+	.attrs = dimm_power_attrs,
+	.is_visible = hsmp_dimm_power_is_visible,
+};
+
+static const struct attribute_group dimm_temperature_group = {
+	.name = "dimm_temperature",
+	.attrs = dimm_temperature_attrs,
+	.is_visible = hsmp_dimm_temp_is_visible,
+};
+
+static const struct attribute_group dimm_temperature_range_group = {
+	.name = "dimm_temperature_range",
+	.attrs = dimm_temperature_range_attrs,
+	.is_visible = hsmp_dimm_temp_range_is_visible,
+};
+
 static const struct attribute_group hsmp_attr_grp = {
 	.bin_attrs = hsmp_attr_list,
 	.attrs = hsmp_dev_attr_list,
@@ -838,6 +1132,9 @@ static const struct attribute_group *hsmp_groups[] = {
 	&lclk_group,
 	&io_bw_group,
 	&xgmi_bw_group,
+	&dimm_power_group,
+	&dimm_temperature_group,
+	&dimm_temperature_range_group,
 	NULL
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index c690234a25426..d6a4a79118e80 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -903,6 +903,63 @@ static int hsmp_fetch_write_enabled_msgs(u16 sock_ind, unsigned long *write_msg_
 	return ret;
 }
 
+static void hsmp_scan_dimm_range(struct hsmp_socket *sock, u32 msg_id, u32 *mask,
+				 bool scan_9x)
+{
+	u32 addr;
+
+	*mask = 0;
+	if (!is_read_msg_enabled(sock, msg_id))
+		return;
+
+	for (addr = 0x80; addr <= 0x8F; addr++) {
+		struct hsmp_message msg = {};
+
+		msg.msg_id = msg_id;
+		msg.sock_ind = sock->sock_ind;
+		msg.num_args = 1;
+		msg.response_sz = 1;
+		msg.args[0] = addr;
+		if (!hsmp_send_message_locked(&msg))
+			*mask |= BIT(addr - 0x80);
+	}
+
+	if (!scan_9x)
+		return;
+
+	for (addr = 0x90; addr <= 0x9F; addr++) {
+		struct hsmp_message msg = {};
+
+		msg.msg_id = msg_id;
+		msg.sock_ind = sock->sock_ind;
+		msg.num_args = 1;
+		msg.response_sz = 1;
+		msg.args[0] = addr;
+		if (!hsmp_send_message_locked(&msg))
+			*mask |= BIT(addr - 0x90 + 16);
+	}
+}
+
+/*
+ * Probe DIMM power/thermal at 0x80-0x8F and 0x90-0x9F. dimm_temperature/
+ * 0xC0 and 0xD0 aliases share the thermal validity bits. HSMP_GET_DIMM_TEMP_RANGE
+ * is UMC-channel granularity only (0x80-0x8F); 0x90-0x9F does not apply.
+ * Caller holds hsmp_sock_rwsem for write.
+ */
+void hsmp_scan_dimms(struct hsmp_socket *sock)
+{
+	if (!sock || is_client_platform())
+		return;
+
+	hsmp_scan_dimm_range(sock, HSMP_GET_DIMM_POWER, &sock->dimm_power_valid,
+			     true);
+	hsmp_scan_dimm_range(sock, HSMP_GET_DIMM_THERMAL, &sock->dimm_temp_valid,
+			     true);
+	hsmp_scan_dimm_range(sock, HSMP_GET_DIMM_TEMP_RANGE,
+			     &sock->dimm_temp_range_valid, false);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_scan_dimms, "AMD_HSMP");
+
 static int hsmp_set_default_msg_bitmap(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 582913812e060..ce54170ab3b75 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -87,6 +87,10 @@ struct hsmp_socket {
 	u32 proto_ver;
 	DECLARE_BITMAP(enabled_read_msg_ids, HSMP_MAX_MSGS);
 	DECLARE_BITMAP(enabled_write_msg_ids, HSMP_MAX_MSGS);
+	/* Bits 0-15: addresses 0x80-0x8F. Bits 16-31: addresses 0x90-0x9F. */
+	u32 dimm_power_valid;
+	u32 dimm_temp_valid;
+	u32 dimm_temp_range_valid;
 	/*
 	 * Links that answered HSMP_GET_IOLINK_BANDWITH at probe.
 	 * Bit index matches io_bw/io_p0 .. io_g7 attribute order.
@@ -156,6 +160,7 @@ void hsmp_scan_io_bw(struct hsmp_socket *sock);
 #define HSMP_XGMI_BW_COUNT	(HSMP_IO_LINK_COUNT * HSMP_XGMI_BW_TYPES)
 int hsmp_xgmi_bw_arg(unsigned int id, u32 *arg);
 void hsmp_scan_xgmi_bw(struct hsmp_socket *sock);
+void hsmp_scan_dimms(struct hsmp_socket *sock);
 
 /*
  * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 61f7747c782ea..809dd2cbb9948 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -12,6 +12,7 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/build_bug.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
@@ -877,6 +878,949 @@ HSMP_XGMI_WR(g7, 39, 7);
 #undef HSMP_XGMI_AGG
 #undef HSMP_XGMI_RD
 #undef HSMP_XGMI_WR
+#define HSMP_DIMM_RO(_var, _name, _show, _msg, _priv, _sock)		\
+	HSMP_SYS_ATTR_PRIV(_var##_##_sock, _name, _show, _sock, _msg, _priv)
+
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80, 0);
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80, 1);
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80, 2);
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80, 3);
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80, 4);
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80, 5);
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80, 6);
+HSMP_DIMM_RO(dpwr_80, dimm_0x80, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x80, 7);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81, 0);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81, 1);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81, 2);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81, 3);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81, 4);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81, 5);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81, 6);
+HSMP_DIMM_RO(dpwr_81, dimm_0x81, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x81, 7);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82, 0);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82, 1);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82, 2);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82, 3);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82, 4);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82, 5);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82, 6);
+HSMP_DIMM_RO(dpwr_82, dimm_0x82, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x82, 7);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83, 0);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83, 1);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83, 2);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83, 3);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83, 4);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83, 5);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83, 6);
+HSMP_DIMM_RO(dpwr_83, dimm_0x83, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x83, 7);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84, 0);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84, 1);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84, 2);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84, 3);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84, 4);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84, 5);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84, 6);
+HSMP_DIMM_RO(dpwr_84, dimm_0x84, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x84, 7);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85, 0);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85, 1);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85, 2);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85, 3);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85, 4);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85, 5);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85, 6);
+HSMP_DIMM_RO(dpwr_85, dimm_0x85, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x85, 7);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86, 0);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86, 1);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86, 2);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86, 3);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86, 4);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86, 5);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86, 6);
+HSMP_DIMM_RO(dpwr_86, dimm_0x86, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x86, 7);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87, 0);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87, 1);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87, 2);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87, 3);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87, 4);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87, 5);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87, 6);
+HSMP_DIMM_RO(dpwr_87, dimm_0x87, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x87, 7);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88, 0);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88, 1);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88, 2);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88, 3);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88, 4);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88, 5);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88, 6);
+HSMP_DIMM_RO(dpwr_88, dimm_0x88, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x88, 7);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89, 0);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89, 1);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89, 2);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89, 3);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89, 4);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89, 5);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89, 6);
+HSMP_DIMM_RO(dpwr_89, dimm_0x89, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x89, 7);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a, 0);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a, 1);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a, 2);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a, 3);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a, 4);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a, 5);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a, 6);
+HSMP_DIMM_RO(dpwr_8a, dimm_0x8a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8a, 7);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b, 0);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b, 1);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b, 2);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b, 3);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b, 4);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b, 5);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b, 6);
+HSMP_DIMM_RO(dpwr_8b, dimm_0x8b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8b, 7);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c, 0);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c, 1);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c, 2);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c, 3);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c, 4);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c, 5);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c, 6);
+HSMP_DIMM_RO(dpwr_8c, dimm_0x8c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8c, 7);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d, 0);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d, 1);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d, 2);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d, 3);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d, 4);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d, 5);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d, 6);
+HSMP_DIMM_RO(dpwr_8d, dimm_0x8d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8d, 7);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e, 0);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e, 1);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e, 2);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e, 3);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e, 4);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e, 5);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e, 6);
+HSMP_DIMM_RO(dpwr_8e, dimm_0x8e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8e, 7);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f, 0);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f, 1);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f, 2);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f, 3);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f, 4);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f, 5);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f, 6);
+HSMP_DIMM_RO(dpwr_8f, dimm_0x8f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x8f, 7);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90, 0);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90, 1);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90, 2);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90, 3);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90, 4);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90, 5);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90, 6);
+HSMP_DIMM_RO(dpwr_90, dimm_0x90, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x90, 7);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91, 0);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91, 1);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91, 2);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91, 3);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91, 4);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91, 5);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91, 6);
+HSMP_DIMM_RO(dpwr_91, dimm_0x91, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x91, 7);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92, 0);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92, 1);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92, 2);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92, 3);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92, 4);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92, 5);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92, 6);
+HSMP_DIMM_RO(dpwr_92, dimm_0x92, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x92, 7);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93, 0);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93, 1);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93, 2);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93, 3);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93, 4);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93, 5);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93, 6);
+HSMP_DIMM_RO(dpwr_93, dimm_0x93, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x93, 7);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94, 0);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94, 1);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94, 2);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94, 3);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94, 4);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94, 5);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94, 6);
+HSMP_DIMM_RO(dpwr_94, dimm_0x94, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x94, 7);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95, 0);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95, 1);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95, 2);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95, 3);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95, 4);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95, 5);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95, 6);
+HSMP_DIMM_RO(dpwr_95, dimm_0x95, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x95, 7);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96, 0);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96, 1);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96, 2);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96, 3);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96, 4);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96, 5);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96, 6);
+HSMP_DIMM_RO(dpwr_96, dimm_0x96, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x96, 7);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97, 0);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97, 1);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97, 2);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97, 3);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97, 4);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97, 5);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97, 6);
+HSMP_DIMM_RO(dpwr_97, dimm_0x97, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x97, 7);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98, 0);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98, 1);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98, 2);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98, 3);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98, 4);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98, 5);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98, 6);
+HSMP_DIMM_RO(dpwr_98, dimm_0x98, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x98, 7);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99, 0);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99, 1);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99, 2);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99, 3);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99, 4);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99, 5);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99, 6);
+HSMP_DIMM_RO(dpwr_99, dimm_0x99, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x99, 7);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a, 0);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a, 1);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a, 2);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a, 3);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a, 4);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a, 5);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a, 6);
+HSMP_DIMM_RO(dpwr_9a, dimm_0x9a, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9a, 7);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b, 0);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b, 1);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b, 2);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b, 3);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b, 4);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b, 5);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b, 6);
+HSMP_DIMM_RO(dpwr_9b, dimm_0x9b, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9b, 7);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c, 0);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c, 1);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c, 2);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c, 3);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c, 4);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c, 5);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c, 6);
+HSMP_DIMM_RO(dpwr_9c, dimm_0x9c, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9c, 7);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d, 0);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d, 1);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d, 2);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d, 3);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d, 4);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d, 5);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d, 6);
+HSMP_DIMM_RO(dpwr_9d, dimm_0x9d, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9d, 7);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e, 0);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e, 1);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e, 2);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e, 3);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e, 4);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e, 5);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e, 6);
+HSMP_DIMM_RO(dpwr_9e, dimm_0x9e, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9e, 7);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f, 0);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f, 1);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f, 2);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f, 3);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f, 4);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f, 5);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f, 6);
+HSMP_DIMM_RO(dpwr_9f, dimm_0x9f, hsmp_dimm_power_show, HSMP_GET_DIMM_POWER, 0x9f, 7);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0, 0);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0, 1);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0, 2);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0, 3);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0, 4);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0, 5);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0, 6);
+HSMP_DIMM_RO(dpwr_total, dimm_total_power, hsmp_dimm_total_power_show, HSMP_GET_DIMM_POWER, 0, 7);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0, 0);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0, 1);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0, 2);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0, 3);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0, 4);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0, 5);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0, 6);
+HSMP_DIMM_RO(dpwr_max, dimm_max_power, hsmp_dimm_max_power_show, HSMP_GET_DIMM_POWER, 0, 7);
+
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80, 0);
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80, 1);
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80, 2);
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80, 3);
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80, 4);
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80, 5);
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80, 6);
+HSMP_DIMM_RO(dt_80, dimm_0x80, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x80, 7);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81, 0);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81, 1);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81, 2);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81, 3);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81, 4);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81, 5);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81, 6);
+HSMP_DIMM_RO(dt_81, dimm_0x81, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x81, 7);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82, 0);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82, 1);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82, 2);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82, 3);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82, 4);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82, 5);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82, 6);
+HSMP_DIMM_RO(dt_82, dimm_0x82, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x82, 7);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83, 0);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83, 1);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83, 2);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83, 3);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83, 4);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83, 5);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83, 6);
+HSMP_DIMM_RO(dt_83, dimm_0x83, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x83, 7);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84, 0);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84, 1);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84, 2);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84, 3);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84, 4);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84, 5);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84, 6);
+HSMP_DIMM_RO(dt_84, dimm_0x84, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x84, 7);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85, 0);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85, 1);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85, 2);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85, 3);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85, 4);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85, 5);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85, 6);
+HSMP_DIMM_RO(dt_85, dimm_0x85, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x85, 7);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86, 0);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86, 1);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86, 2);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86, 3);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86, 4);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86, 5);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86, 6);
+HSMP_DIMM_RO(dt_86, dimm_0x86, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x86, 7);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87, 0);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87, 1);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87, 2);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87, 3);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87, 4);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87, 5);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87, 6);
+HSMP_DIMM_RO(dt_87, dimm_0x87, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x87, 7);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88, 0);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88, 1);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88, 2);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88, 3);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88, 4);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88, 5);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88, 6);
+HSMP_DIMM_RO(dt_88, dimm_0x88, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x88, 7);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89, 0);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89, 1);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89, 2);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89, 3);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89, 4);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89, 5);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89, 6);
+HSMP_DIMM_RO(dt_89, dimm_0x89, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x89, 7);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a, 0);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a, 1);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a, 2);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a, 3);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a, 4);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a, 5);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a, 6);
+HSMP_DIMM_RO(dt_8a, dimm_0x8a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8a, 7);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b, 0);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b, 1);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b, 2);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b, 3);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b, 4);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b, 5);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b, 6);
+HSMP_DIMM_RO(dt_8b, dimm_0x8b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8b, 7);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c, 0);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c, 1);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c, 2);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c, 3);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c, 4);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c, 5);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c, 6);
+HSMP_DIMM_RO(dt_8c, dimm_0x8c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8c, 7);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d, 0);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d, 1);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d, 2);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d, 3);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d, 4);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d, 5);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d, 6);
+HSMP_DIMM_RO(dt_8d, dimm_0x8d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8d, 7);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e, 0);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e, 1);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e, 2);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e, 3);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e, 4);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e, 5);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e, 6);
+HSMP_DIMM_RO(dt_8e, dimm_0x8e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8e, 7);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f, 0);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f, 1);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f, 2);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f, 3);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f, 4);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f, 5);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f, 6);
+HSMP_DIMM_RO(dt_8f, dimm_0x8f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x8f, 7);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0, 0);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0, 1);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0, 2);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0, 3);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0, 4);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0, 5);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0, 6);
+HSMP_DIMM_RO(dt_c0, dimm_0xc0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc0, 7);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1, 0);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1, 1);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1, 2);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1, 3);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1, 4);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1, 5);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1, 6);
+HSMP_DIMM_RO(dt_c1, dimm_0xc1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc1, 7);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2, 0);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2, 1);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2, 2);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2, 3);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2, 4);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2, 5);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2, 6);
+HSMP_DIMM_RO(dt_c2, dimm_0xc2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc2, 7);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3, 0);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3, 1);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3, 2);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3, 3);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3, 4);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3, 5);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3, 6);
+HSMP_DIMM_RO(dt_c3, dimm_0xc3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc3, 7);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4, 0);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4, 1);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4, 2);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4, 3);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4, 4);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4, 5);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4, 6);
+HSMP_DIMM_RO(dt_c4, dimm_0xc4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc4, 7);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5, 0);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5, 1);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5, 2);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5, 3);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5, 4);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5, 5);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5, 6);
+HSMP_DIMM_RO(dt_c5, dimm_0xc5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc5, 7);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6, 0);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6, 1);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6, 2);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6, 3);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6, 4);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6, 5);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6, 6);
+HSMP_DIMM_RO(dt_c6, dimm_0xc6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc6, 7);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7, 0);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7, 1);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7, 2);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7, 3);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7, 4);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7, 5);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7, 6);
+HSMP_DIMM_RO(dt_c7, dimm_0xc7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc7, 7);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8, 0);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8, 1);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8, 2);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8, 3);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8, 4);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8, 5);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8, 6);
+HSMP_DIMM_RO(dt_c8, dimm_0xc8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc8, 7);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9, 0);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9, 1);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9, 2);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9, 3);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9, 4);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9, 5);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9, 6);
+HSMP_DIMM_RO(dt_c9, dimm_0xc9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xc9, 7);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca, 0);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca, 1);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca, 2);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca, 3);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca, 4);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca, 5);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca, 6);
+HSMP_DIMM_RO(dt_ca, dimm_0xca, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xca, 7);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb, 0);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb, 1);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb, 2);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb, 3);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb, 4);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb, 5);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb, 6);
+HSMP_DIMM_RO(dt_cb, dimm_0xcb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcb, 7);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc, 0);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc, 1);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc, 2);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc, 3);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc, 4);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc, 5);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc, 6);
+HSMP_DIMM_RO(dt_cc, dimm_0xcc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcc, 7);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd, 0);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd, 1);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd, 2);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd, 3);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd, 4);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd, 5);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd, 6);
+HSMP_DIMM_RO(dt_cd, dimm_0xcd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcd, 7);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce, 0);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce, 1);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce, 2);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce, 3);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce, 4);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce, 5);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce, 6);
+HSMP_DIMM_RO(dt_ce, dimm_0xce, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xce, 7);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf, 0);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf, 1);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf, 2);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf, 3);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf, 4);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf, 5);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf, 6);
+HSMP_DIMM_RO(dt_cf, dimm_0xcf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xcf, 7);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90, 0);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90, 1);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90, 2);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90, 3);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90, 4);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90, 5);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90, 6);
+HSMP_DIMM_RO(dt_90, dimm_0x90, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x90, 7);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91, 0);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91, 1);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91, 2);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91, 3);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91, 4);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91, 5);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91, 6);
+HSMP_DIMM_RO(dt_91, dimm_0x91, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x91, 7);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92, 0);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92, 1);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92, 2);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92, 3);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92, 4);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92, 5);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92, 6);
+HSMP_DIMM_RO(dt_92, dimm_0x92, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x92, 7);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93, 0);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93, 1);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93, 2);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93, 3);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93, 4);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93, 5);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93, 6);
+HSMP_DIMM_RO(dt_93, dimm_0x93, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x93, 7);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94, 0);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94, 1);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94, 2);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94, 3);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94, 4);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94, 5);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94, 6);
+HSMP_DIMM_RO(dt_94, dimm_0x94, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x94, 7);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95, 0);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95, 1);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95, 2);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95, 3);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95, 4);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95, 5);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95, 6);
+HSMP_DIMM_RO(dt_95, dimm_0x95, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x95, 7);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96, 0);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96, 1);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96, 2);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96, 3);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96, 4);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96, 5);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96, 6);
+HSMP_DIMM_RO(dt_96, dimm_0x96, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x96, 7);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97, 0);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97, 1);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97, 2);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97, 3);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97, 4);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97, 5);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97, 6);
+HSMP_DIMM_RO(dt_97, dimm_0x97, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x97, 7);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98, 0);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98, 1);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98, 2);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98, 3);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98, 4);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98, 5);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98, 6);
+HSMP_DIMM_RO(dt_98, dimm_0x98, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x98, 7);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99, 0);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99, 1);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99, 2);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99, 3);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99, 4);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99, 5);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99, 6);
+HSMP_DIMM_RO(dt_99, dimm_0x99, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x99, 7);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a, 0);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a, 1);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a, 2);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a, 3);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a, 4);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a, 5);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a, 6);
+HSMP_DIMM_RO(dt_9a, dimm_0x9a, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9a, 7);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b, 0);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b, 1);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b, 2);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b, 3);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b, 4);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b, 5);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b, 6);
+HSMP_DIMM_RO(dt_9b, dimm_0x9b, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9b, 7);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c, 0);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c, 1);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c, 2);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c, 3);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c, 4);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c, 5);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c, 6);
+HSMP_DIMM_RO(dt_9c, dimm_0x9c, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9c, 7);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d, 0);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d, 1);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d, 2);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d, 3);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d, 4);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d, 5);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d, 6);
+HSMP_DIMM_RO(dt_9d, dimm_0x9d, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9d, 7);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e, 0);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e, 1);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e, 2);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e, 3);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e, 4);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e, 5);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e, 6);
+HSMP_DIMM_RO(dt_9e, dimm_0x9e, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9e, 7);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f, 0);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f, 1);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f, 2);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f, 3);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f, 4);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f, 5);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f, 6);
+HSMP_DIMM_RO(dt_9f, dimm_0x9f, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0x9f, 7);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0, 0);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0, 1);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0, 2);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0, 3);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0, 4);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0, 5);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0, 6);
+HSMP_DIMM_RO(dt_d0, dimm_0xd0, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd0, 7);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1, 0);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1, 1);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1, 2);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1, 3);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1, 4);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1, 5);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1, 6);
+HSMP_DIMM_RO(dt_d1, dimm_0xd1, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd1, 7);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2, 0);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2, 1);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2, 2);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2, 3);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2, 4);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2, 5);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2, 6);
+HSMP_DIMM_RO(dt_d2, dimm_0xd2, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd2, 7);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3, 0);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3, 1);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3, 2);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3, 3);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3, 4);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3, 5);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3, 6);
+HSMP_DIMM_RO(dt_d3, dimm_0xd3, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd3, 7);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4, 0);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4, 1);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4, 2);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4, 3);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4, 4);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4, 5);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4, 6);
+HSMP_DIMM_RO(dt_d4, dimm_0xd4, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd4, 7);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5, 0);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5, 1);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5, 2);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5, 3);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5, 4);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5, 5);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5, 6);
+HSMP_DIMM_RO(dt_d5, dimm_0xd5, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd5, 7);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6, 0);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6, 1);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6, 2);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6, 3);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6, 4);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6, 5);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6, 6);
+HSMP_DIMM_RO(dt_d6, dimm_0xd6, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd6, 7);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7, 0);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7, 1);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7, 2);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7, 3);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7, 4);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7, 5);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7, 6);
+HSMP_DIMM_RO(dt_d7, dimm_0xd7, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd7, 7);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8, 0);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8, 1);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8, 2);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8, 3);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8, 4);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8, 5);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8, 6);
+HSMP_DIMM_RO(dt_d8, dimm_0xd8, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd8, 7);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9, 0);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9, 1);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9, 2);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9, 3);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9, 4);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9, 5);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9, 6);
+HSMP_DIMM_RO(dt_d9, dimm_0xd9, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xd9, 7);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda, 0);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda, 1);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda, 2);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda, 3);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda, 4);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda, 5);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda, 6);
+HSMP_DIMM_RO(dt_da, dimm_0xda, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xda, 7);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb, 0);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb, 1);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb, 2);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb, 3);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb, 4);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb, 5);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb, 6);
+HSMP_DIMM_RO(dt_db, dimm_0xdb, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdb, 7);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc, 0);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc, 1);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc, 2);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc, 3);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc, 4);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc, 5);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc, 6);
+HSMP_DIMM_RO(dt_dc, dimm_0xdc, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdc, 7);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd, 0);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd, 1);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd, 2);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd, 3);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd, 4);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd, 5);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd, 6);
+HSMP_DIMM_RO(dt_dd, dimm_0xdd, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdd, 7);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde, 0);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde, 1);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde, 2);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde, 3);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde, 4);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde, 5);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde, 6);
+HSMP_DIMM_RO(dt_de, dimm_0xde, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xde, 7);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf, 0);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf, 1);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf, 2);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf, 3);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf, 4);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf, 5);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf, 6);
+HSMP_DIMM_RO(dt_df, dimm_0xdf, hsmp_dimm_temp_show, HSMP_GET_DIMM_THERMAL, 0xdf, 7);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0, 0);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0, 1);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0, 2);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0, 3);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0, 4);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0, 5);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0, 6);
+HSMP_DIMM_RO(dt_max, dimm_max_temperature, hsmp_dimm_max_temp_show, HSMP_GET_DIMM_THERMAL, 0, 7);
+
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80, 0);
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80, 1);
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80, 2);
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80, 3);
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80, 4);
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80, 5);
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80, 6);
+HSMP_DIMM_RO(dtr_80, dimm_0x80, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x80, 7);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81, 0);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81, 1);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81, 2);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81, 3);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81, 4);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81, 5);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81, 6);
+HSMP_DIMM_RO(dtr_81, dimm_0x81, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x81, 7);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82, 0);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82, 1);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82, 2);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82, 3);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82, 4);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82, 5);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82, 6);
+HSMP_DIMM_RO(dtr_82, dimm_0x82, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x82, 7);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83, 0);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83, 1);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83, 2);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83, 3);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83, 4);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83, 5);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83, 6);
+HSMP_DIMM_RO(dtr_83, dimm_0x83, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x83, 7);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84, 0);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84, 1);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84, 2);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84, 3);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84, 4);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84, 5);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84, 6);
+HSMP_DIMM_RO(dtr_84, dimm_0x84, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x84, 7);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85, 0);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85, 1);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85, 2);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85, 3);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85, 4);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85, 5);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85, 6);
+HSMP_DIMM_RO(dtr_85, dimm_0x85, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x85, 7);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86, 0);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86, 1);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86, 2);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86, 3);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86, 4);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86, 5);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86, 6);
+HSMP_DIMM_RO(dtr_86, dimm_0x86, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x86, 7);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87, 0);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87, 1);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87, 2);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87, 3);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87, 4);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87, 5);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87, 6);
+HSMP_DIMM_RO(dtr_87, dimm_0x87, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x87, 7);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88, 0);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88, 1);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88, 2);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88, 3);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88, 4);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88, 5);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88, 6);
+HSMP_DIMM_RO(dtr_88, dimm_0x88, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x88, 7);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89, 0);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89, 1);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89, 2);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89, 3);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89, 4);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89, 5);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89, 6);
+HSMP_DIMM_RO(dtr_89, dimm_0x89, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x89, 7);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a, 0);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a, 1);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a, 2);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a, 3);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a, 4);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a, 5);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a, 6);
+HSMP_DIMM_RO(dtr_8a, dimm_0x8a, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8a, 7);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b, 0);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b, 1);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b, 2);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b, 3);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b, 4);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b, 5);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b, 6);
+HSMP_DIMM_RO(dtr_8b, dimm_0x8b, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8b, 7);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c, 0);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c, 1);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c, 2);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c, 3);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c, 4);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c, 5);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c, 6);
+HSMP_DIMM_RO(dtr_8c, dimm_0x8c, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8c, 7);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d, 0);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d, 1);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d, 2);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d, 3);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d, 4);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d, 5);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d, 6);
+HSMP_DIMM_RO(dtr_8d, dimm_0x8d, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8d, 7);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e, 0);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e, 1);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e, 2);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e, 3);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e, 4);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e, 5);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e, 6);
+HSMP_DIMM_RO(dtr_8e, dimm_0x8e, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8e, 7);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f, 0);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f, 1);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f, 2);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f, 3);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f, 4);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f, 5);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f, 6);
+HSMP_DIMM_RO(dtr_8f, dimm_0x8f, hsmp_dimm_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0x8f, 7);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0, 0);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0, 1);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0, 2);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0, 3);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0, 4);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0, 5);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0, 6);
+HSMP_DIMM_RO(dtr_max, dimm_max_temperature_range,
+	     hsmp_dimm_max_temp_range_show, HSMP_GET_DIMM_TEMP_RANGE, 0, 7);
+
+#undef HSMP_DIMM_RO
 HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
 		 0444);
 HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
@@ -1201,6 +2145,263 @@ static const struct attribute_group *hsmp_sock_xgmibw_grps[] = {
 	&sock7_xgmibw_grp,
 };
 
+#define HSMP_DIMM_PWR_LIST(_s)						\
+static struct attribute *sock##_s##_dpwr_attrs[] = {		\
+	&hattr_dpwr_80_##_s.dattr.attr,				\
+	&hattr_dpwr_81_##_s.dattr.attr,				\
+	&hattr_dpwr_82_##_s.dattr.attr,				\
+	&hattr_dpwr_83_##_s.dattr.attr,				\
+	&hattr_dpwr_84_##_s.dattr.attr,				\
+	&hattr_dpwr_85_##_s.dattr.attr,				\
+	&hattr_dpwr_86_##_s.dattr.attr,				\
+	&hattr_dpwr_87_##_s.dattr.attr,				\
+	&hattr_dpwr_88_##_s.dattr.attr,				\
+	&hattr_dpwr_89_##_s.dattr.attr,				\
+	&hattr_dpwr_8a_##_s.dattr.attr,				\
+	&hattr_dpwr_8b_##_s.dattr.attr,				\
+	&hattr_dpwr_8c_##_s.dattr.attr,				\
+	&hattr_dpwr_8d_##_s.dattr.attr,				\
+	&hattr_dpwr_8e_##_s.dattr.attr,				\
+	&hattr_dpwr_8f_##_s.dattr.attr,				\
+	&hattr_dpwr_90_##_s.dattr.attr,				\
+	&hattr_dpwr_91_##_s.dattr.attr,				\
+	&hattr_dpwr_92_##_s.dattr.attr,				\
+	&hattr_dpwr_93_##_s.dattr.attr,				\
+	&hattr_dpwr_94_##_s.dattr.attr,				\
+	&hattr_dpwr_95_##_s.dattr.attr,				\
+	&hattr_dpwr_96_##_s.dattr.attr,				\
+	&hattr_dpwr_97_##_s.dattr.attr,				\
+	&hattr_dpwr_98_##_s.dattr.attr,				\
+	&hattr_dpwr_99_##_s.dattr.attr,				\
+	&hattr_dpwr_9a_##_s.dattr.attr,				\
+	&hattr_dpwr_9b_##_s.dattr.attr,				\
+	&hattr_dpwr_9c_##_s.dattr.attr,				\
+	&hattr_dpwr_9d_##_s.dattr.attr,				\
+	&hattr_dpwr_9e_##_s.dattr.attr,				\
+	&hattr_dpwr_9f_##_s.dattr.attr,				\
+	&hattr_dpwr_total_##_s.dattr.attr,				\
+	&hattr_dpwr_max_##_s.dattr.attr,				\
+	NULL							\
+}
+
+#define HSMP_DIMM_TEMP_LIST(_s)						\
+static struct attribute *sock##_s##_dtemp_attrs[] = {		\
+	&hattr_dt_80_##_s.dattr.attr,				\
+	&hattr_dt_81_##_s.dattr.attr,				\
+	&hattr_dt_82_##_s.dattr.attr,				\
+	&hattr_dt_83_##_s.dattr.attr,				\
+	&hattr_dt_84_##_s.dattr.attr,				\
+	&hattr_dt_85_##_s.dattr.attr,				\
+	&hattr_dt_86_##_s.dattr.attr,				\
+	&hattr_dt_87_##_s.dattr.attr,				\
+	&hattr_dt_88_##_s.dattr.attr,				\
+	&hattr_dt_89_##_s.dattr.attr,				\
+	&hattr_dt_8a_##_s.dattr.attr,				\
+	&hattr_dt_8b_##_s.dattr.attr,				\
+	&hattr_dt_8c_##_s.dattr.attr,				\
+	&hattr_dt_8d_##_s.dattr.attr,				\
+	&hattr_dt_8e_##_s.dattr.attr,				\
+	&hattr_dt_8f_##_s.dattr.attr,				\
+	&hattr_dt_c0_##_s.dattr.attr,				\
+	&hattr_dt_c1_##_s.dattr.attr,				\
+	&hattr_dt_c2_##_s.dattr.attr,				\
+	&hattr_dt_c3_##_s.dattr.attr,				\
+	&hattr_dt_c4_##_s.dattr.attr,				\
+	&hattr_dt_c5_##_s.dattr.attr,				\
+	&hattr_dt_c6_##_s.dattr.attr,				\
+	&hattr_dt_c7_##_s.dattr.attr,				\
+	&hattr_dt_c8_##_s.dattr.attr,				\
+	&hattr_dt_c9_##_s.dattr.attr,				\
+	&hattr_dt_ca_##_s.dattr.attr,				\
+	&hattr_dt_cb_##_s.dattr.attr,				\
+	&hattr_dt_cc_##_s.dattr.attr,				\
+	&hattr_dt_cd_##_s.dattr.attr,				\
+	&hattr_dt_ce_##_s.dattr.attr,				\
+	&hattr_dt_cf_##_s.dattr.attr,				\
+	&hattr_dt_90_##_s.dattr.attr,				\
+	&hattr_dt_91_##_s.dattr.attr,				\
+	&hattr_dt_92_##_s.dattr.attr,				\
+	&hattr_dt_93_##_s.dattr.attr,				\
+	&hattr_dt_94_##_s.dattr.attr,				\
+	&hattr_dt_95_##_s.dattr.attr,				\
+	&hattr_dt_96_##_s.dattr.attr,				\
+	&hattr_dt_97_##_s.dattr.attr,				\
+	&hattr_dt_98_##_s.dattr.attr,				\
+	&hattr_dt_99_##_s.dattr.attr,				\
+	&hattr_dt_9a_##_s.dattr.attr,				\
+	&hattr_dt_9b_##_s.dattr.attr,				\
+	&hattr_dt_9c_##_s.dattr.attr,				\
+	&hattr_dt_9d_##_s.dattr.attr,				\
+	&hattr_dt_9e_##_s.dattr.attr,				\
+	&hattr_dt_9f_##_s.dattr.attr,				\
+	&hattr_dt_d0_##_s.dattr.attr,				\
+	&hattr_dt_d1_##_s.dattr.attr,				\
+	&hattr_dt_d2_##_s.dattr.attr,				\
+	&hattr_dt_d3_##_s.dattr.attr,				\
+	&hattr_dt_d4_##_s.dattr.attr,				\
+	&hattr_dt_d5_##_s.dattr.attr,				\
+	&hattr_dt_d6_##_s.dattr.attr,				\
+	&hattr_dt_d7_##_s.dattr.attr,				\
+	&hattr_dt_d8_##_s.dattr.attr,				\
+	&hattr_dt_d9_##_s.dattr.attr,				\
+	&hattr_dt_da_##_s.dattr.attr,				\
+	&hattr_dt_db_##_s.dattr.attr,				\
+	&hattr_dt_dc_##_s.dattr.attr,				\
+	&hattr_dt_dd_##_s.dattr.attr,				\
+	&hattr_dt_de_##_s.dattr.attr,				\
+	&hattr_dt_df_##_s.dattr.attr,				\
+	&hattr_dt_max_##_s.dattr.attr,				\
+	NULL							\
+}
+
+#define HSMP_DIMM_RANGE_LIST(_s)						\
+static struct attribute *sock##_s##_drange_attrs[] = {		\
+	&hattr_dtr_80_##_s.dattr.attr,				\
+	&hattr_dtr_81_##_s.dattr.attr,				\
+	&hattr_dtr_82_##_s.dattr.attr,				\
+	&hattr_dtr_83_##_s.dattr.attr,				\
+	&hattr_dtr_84_##_s.dattr.attr,				\
+	&hattr_dtr_85_##_s.dattr.attr,				\
+	&hattr_dtr_86_##_s.dattr.attr,				\
+	&hattr_dtr_87_##_s.dattr.attr,				\
+	&hattr_dtr_88_##_s.dattr.attr,				\
+	&hattr_dtr_89_##_s.dattr.attr,				\
+	&hattr_dtr_8a_##_s.dattr.attr,				\
+	&hattr_dtr_8b_##_s.dattr.attr,				\
+	&hattr_dtr_8c_##_s.dattr.attr,				\
+	&hattr_dtr_8d_##_s.dattr.attr,				\
+	&hattr_dtr_8e_##_s.dattr.attr,				\
+	&hattr_dtr_8f_##_s.dattr.attr,				\
+	&hattr_dtr_max_##_s.dattr.attr,				\
+	NULL							\
+}
+
+HSMP_DIMM_PWR_LIST(0);
+HSMP_DIMM_PWR_LIST(1);
+HSMP_DIMM_PWR_LIST(2);
+HSMP_DIMM_PWR_LIST(3);
+HSMP_DIMM_PWR_LIST(4);
+HSMP_DIMM_PWR_LIST(5);
+HSMP_DIMM_PWR_LIST(6);
+HSMP_DIMM_PWR_LIST(7);
+
+HSMP_DIMM_TEMP_LIST(0);
+HSMP_DIMM_TEMP_LIST(1);
+HSMP_DIMM_TEMP_LIST(2);
+HSMP_DIMM_TEMP_LIST(3);
+HSMP_DIMM_TEMP_LIST(4);
+HSMP_DIMM_TEMP_LIST(5);
+HSMP_DIMM_TEMP_LIST(6);
+HSMP_DIMM_TEMP_LIST(7);
+
+HSMP_DIMM_RANGE_LIST(0);
+HSMP_DIMM_RANGE_LIST(1);
+HSMP_DIMM_RANGE_LIST(2);
+HSMP_DIMM_RANGE_LIST(3);
+HSMP_DIMM_RANGE_LIST(4);
+HSMP_DIMM_RANGE_LIST(5);
+HSMP_DIMM_RANGE_LIST(6);
+HSMP_DIMM_RANGE_LIST(7);
+
+#undef HSMP_DIMM_PWR_LIST
+#undef HSMP_DIMM_TEMP_LIST
+#undef HSMP_DIMM_RANGE_LIST
+
+static umode_t hsmp_plat_dimm_visible(struct attribute *attr, int id,
+				      umode_t (*file_visible)(const struct hsmp_socket *sock,
+							      int id))
+{
+	struct device_attribute *dattr;
+	struct hsmp_sys_attr *hattr;
+	struct hsmp_socket *sock = NULL;
+
+	dattr = container_of(attr, struct device_attribute, attr);
+	hattr = to_hsmp_sys_attr(dattr);
+	if (hsmp_pdev && hattr->sock_ind < hsmp_pdev->num_sockets)
+		sock = &hsmp_pdev->sock[hattr->sock_ind];
+
+	return file_visible(sock, id);
+}
+
+static umode_t hsmp_plat_dimm_power_is_visible(struct kobject *kobj __always_unused,
+					       struct attribute *attr, int id)
+{
+	return hsmp_plat_dimm_visible(attr, id, hsmp_dimm_power_file_visible);
+}
+
+static umode_t hsmp_plat_dimm_temp_is_visible(struct kobject *kobj __always_unused,
+					      struct attribute *attr, int id)
+{
+	return hsmp_plat_dimm_visible(attr, id, hsmp_dimm_temp_file_visible);
+}
+
+static umode_t
+hsmp_plat_dimm_temp_range_is_visible(struct kobject *kobj __always_unused,
+				     struct attribute *attr, int id)
+{
+	return hsmp_plat_dimm_visible(attr, id, hsmp_dimm_temp_range_file_visible);
+}
+
+#define HSMP_DIMM_GRP(_idx)						\
+static const struct attribute_group sock##_idx##_dpwr_grp = {	\
+	.name = "dimm_power",					\
+	.attrs = sock##_idx##_dpwr_attrs,			\
+	.is_visible = hsmp_plat_dimm_power_is_visible,		\
+};								\
+static const struct attribute_group sock##_idx##_dtemp_grp = {\
+	.name = "dimm_temperature",				\
+	.attrs = sock##_idx##_dtemp_attrs,			\
+	.is_visible = hsmp_plat_dimm_temp_is_visible,	\
+};								\
+static const struct attribute_group sock##_idx##_drange_grp = {\
+	.name = "dimm_temperature_range",			\
+	.attrs = sock##_idx##_drange_attrs,			\
+	.is_visible = hsmp_plat_dimm_temp_range_is_visible,\
+}
+
+HSMP_DIMM_GRP(0);
+HSMP_DIMM_GRP(1);
+HSMP_DIMM_GRP(2);
+HSMP_DIMM_GRP(3);
+HSMP_DIMM_GRP(4);
+HSMP_DIMM_GRP(5);
+HSMP_DIMM_GRP(6);
+HSMP_DIMM_GRP(7);
+
+#undef HSMP_DIMM_GRP
+
+static const struct attribute_group *hsmp_sock_dpwr_grps[] = {
+	&sock0_dpwr_grp,
+	&sock1_dpwr_grp,
+	&sock2_dpwr_grp,
+	&sock3_dpwr_grp,
+	&sock4_dpwr_grp,
+	&sock5_dpwr_grp,
+	&sock6_dpwr_grp,
+	&sock7_dpwr_grp,
+};
+
+static const struct attribute_group *hsmp_sock_dtemp_grps[] = {
+	&sock0_dtemp_grp,
+	&sock1_dtemp_grp,
+	&sock2_dtemp_grp,
+	&sock3_dtemp_grp,
+	&sock4_dtemp_grp,
+	&sock5_dtemp_grp,
+	&sock6_dtemp_grp,
+	&sock7_dtemp_grp,
+};
+
+static const struct attribute_group *hsmp_sock_drange_grps[] = {
+	&sock0_drange_grp,
+	&sock1_drange_grp,
+	&sock2_drange_grp,
+	&sock3_drange_grp,
+	&sock4_drange_grp,
+	&sock5_drange_grp,
+	&sock6_drange_grp,
+	&sock7_drange_grp,
+};
 static inline bool is_f1a_m0h(void)
 {
 	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
@@ -1261,6 +2462,7 @@ static int init_platform_device(struct device *dev)
 				return ret;
 			}
 
+			hsmp_scan_dimms(sock);
 			hsmp_scan_io_bw(sock);
 			hsmp_scan_xgmi_bw(sock);
 		}
@@ -1341,6 +2543,9 @@ static void hsmp_remove_plat_sock_kobjs(void)
 		if (!hsmp_plat_sock_kobj[i])
 			continue;
 
+		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_drange_grps[i]);
+		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_dtemp_grps[i]);
+		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_dpwr_grps[i]);
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_xgmibw_grps[i]);
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_iobw_grps[i]);
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_lclk_grps[i]);
@@ -1363,10 +2568,21 @@ static int hsmp_create_socket_sysfs(struct device *dev)
 
 	/*
 	 * socketN is a kobject so it can hold the socket attributes and the
-	 * nested lclk_dpm_range, io_bw, and xgmi_bw directories. Attribute
-	 * groups add one directory level under that kobject.
+	 * nested lclk_dpm_range, io_bw, xgmi_bw, and DIMM directories.
+	 * Attribute groups add one directory level under that kobject.
 	 */
 	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
+		const struct attribute_group *grps[] = {
+			hsmp_sock_attr_grps[i],
+			hsmp_sock_lclk_grps[i],
+			hsmp_sock_iobw_grps[i],
+			hsmp_sock_xgmibw_grps[i],
+			hsmp_sock_dpwr_grps[i],
+			hsmp_sock_dtemp_grps[i],
+			hsmp_sock_drange_grps[i],
+		};
+		unsigned int g, created = 0;
+
 		hsmp_plat_sock_kobj[i] = kobject_create_and_add(hsmp_plat_sock_names[i],
 								hsmp_sock_kobj);
 		if (!hsmp_plat_sock_kobj[i]) {
@@ -1376,52 +2592,18 @@ static int hsmp_create_socket_sysfs(struct device *dev)
 			goto err;
 		}
 
-		ret = sysfs_create_group(hsmp_plat_sock_kobj[i],
-					 hsmp_sock_attr_grps[i]);
-		if (ret) {
-			dev_err(dev, "Failed to create %s attributes\n",
-				hsmp_plat_sock_names[i]);
-			kobject_put(hsmp_plat_sock_kobj[i]);
-			hsmp_plat_sock_kobj[i] = NULL;
-			goto err;
-		}
-
-		ret = sysfs_create_group(hsmp_plat_sock_kobj[i],
-					 hsmp_sock_lclk_grps[i]);
-		if (ret) {
-			dev_err(dev, "Failed to create %s lclk attributes\n",
-				hsmp_plat_sock_names[i]);
-			sysfs_remove_group(hsmp_plat_sock_kobj[i],
-					   hsmp_sock_attr_grps[i]);
-			kobject_put(hsmp_plat_sock_kobj[i]);
-			hsmp_plat_sock_kobj[i] = NULL;
-			goto err;
-		}
-
-		ret = sysfs_create_group(hsmp_plat_sock_kobj[i],
-					 hsmp_sock_iobw_grps[i]);
-		if (ret) {
-			dev_err(dev, "Failed to create %s io_bw attributes\n",
-				hsmp_plat_sock_names[i]);
-			sysfs_remove_group(hsmp_plat_sock_kobj[i],
-					   hsmp_sock_lclk_grps[i]);
-			sysfs_remove_group(hsmp_plat_sock_kobj[i],
-					   hsmp_sock_attr_grps[i]);
-			kobject_put(hsmp_plat_sock_kobj[i]);
-			hsmp_plat_sock_kobj[i] = NULL;
-			goto err;
+		for (g = 0; g < ARRAY_SIZE(grps); g++) {
+			ret = sysfs_create_group(hsmp_plat_sock_kobj[i], grps[g]);
+			if (ret)
+				break;
+			created++;
 		}
-		ret = sysfs_create_group(hsmp_plat_sock_kobj[i],
-					 hsmp_sock_xgmibw_grps[i]);
 		if (ret) {
-			dev_err(dev, "Failed to create %s xgmi_bw attributes\n",
+			dev_err(dev, "Failed to create %s attributes\n",
 				hsmp_plat_sock_names[i]);
-			sysfs_remove_group(hsmp_plat_sock_kobj[i],
-					   hsmp_sock_iobw_grps[i]);
-			sysfs_remove_group(hsmp_plat_sock_kobj[i],
-					   hsmp_sock_lclk_grps[i]);
-			sysfs_remove_group(hsmp_plat_sock_kobj[i],
-					   hsmp_sock_attr_grps[i]);
+			while (created--)
+				sysfs_remove_group(hsmp_plat_sock_kobj[i],
+						   grps[created]);
 			kobject_put(hsmp_plat_sock_kobj[i]);
 			hsmp_plat_sock_kobj[i] = NULL;
 			goto err;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 62d5b6c90ea47..5a2e79a574022 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -1313,6 +1313,362 @@ ssize_t hsmp_dimm_sb_set_store(struct device *dev, struct device_attribute *attr
 	return count;
 }
 
+static struct hsmp_socket *hsmp_sysfs_socket(struct device *dev,
+					     const struct hsmp_sys_attr *hattr)
+{
+	struct hsmp_plat_device *pdev = get_hsmp_pdev();
+	u16 sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+
+	if (!pdev || sock_ind >= pdev->num_sockets)
+		return NULL;
+
+	return &pdev->sock[sock_ind];
+}
+
+static int hsmp_dimm_query(u16 sock_ind, u32 msg_id, u32 arg, u32 *out)
+{
+	struct hsmp_message msg = {};
+	int ret;
+
+	msg.msg_id = msg_id;
+	msg.sock_ind = sock_ind;
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = arg;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	*out = msg.args[0];
+	return 0;
+}
+
+static u32 hsmp_dimm_addr_from_bit(u32 bit)
+{
+	if (bit < 16)
+		return 0x80 + bit;
+
+	return 0x90 + (bit - 16);
+}
+
+static void hsmp_dimm_temp_addrs(u32 bit, u32 addr[2])
+{
+	if (bit < 16) {
+		addr[0] = 0x80 + bit;
+		addr[1] = 0xc0 + bit;
+		return;
+	}
+
+	addr[0] = 0x90 + (bit - 16);
+	addr[1] = 0xd0 + (bit - 16);
+}
+
+ssize_t hsmp_dimm_power_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = hsmp_sysfs_socket(dev, hattr);
+	u32 raw, power, update_rate;
+	int ret;
+
+	if (!sock)
+		return -ENODEV;
+
+	ret = hsmp_dimm_query(sock->sock_ind, HSMP_GET_DIMM_POWER, hattr->priv,
+			      &raw);
+	if (ret)
+		return ret;
+
+	power = (raw >> 17) & 0x7fff;
+	update_rate = (raw >> 8) & 0x1ff;
+
+	return sysfs_emit(buf, "%u %u\n", power, update_rate);
+}
+
+ssize_t hsmp_dimm_total_power_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = hsmp_sysfs_socket(dev, hattr);
+	u32 total_mw = 0, last_update = 0;
+	u32 valid, bit;
+
+	if (!sock)
+		return -ENODEV;
+
+	valid = sock->dimm_power_valid;
+	if (!valid)
+		return -ENODATA;
+
+	for (bit = 0; bit < 32; bit++) {
+		u32 raw;
+		int ret;
+
+		if (!(valid & BIT(bit)))
+			continue;
+
+		ret = hsmp_dimm_query(sock->sock_ind, HSMP_GET_DIMM_POWER,
+				      hsmp_dimm_addr_from_bit(bit), &raw);
+		if (ret)
+			continue;
+
+		total_mw += (raw >> 17) & 0x7fff;
+		last_update = (raw >> 8) & 0x1ff;
+	}
+
+	return sysfs_emit(buf, "%u %u\n", total_mw, last_update);
+}
+
+ssize_t hsmp_dimm_max_power_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = hsmp_sysfs_socket(dev, hattr);
+	u32 raw, power, update_rate, addr;
+	int ret;
+
+	if (!sock)
+		return -ENODEV;
+
+	ret = hsmp_dimm_query(sock->sock_ind, HSMP_GET_DIMM_POWER, BIT(30),
+			      &raw);
+	if (ret)
+		return ret;
+
+	power = (raw >> 17) & 0x7fff;
+	update_rate = (raw >> 8) & 0x1ff;
+	addr = raw & 0xff;
+
+	return sysfs_emit(buf, "%u %u 0x%02X\n", power, update_rate, addr);
+}
+
+#define HSMP_PROTO_VER_7_2		0x00070002U
+
+/* Indices into dimm_sensor_type_str[], also used as address-bit-6 fallback. */
+#define DIMM_SENSOR_TS0		0
+#define DIMM_SENSOR_TS1		1
+#define DIMM_SENSOR_SPDHUB	2
+
+static const char * const dimm_sensor_type_str[] = {
+	"TS0", "TS1", "SPDHub", "Reserved",
+};
+
+static s32 hsmp_dimm_temp_milli(u32 raw)
+{
+	u16 temp_raw = (raw >> 21) & 0x7ff;
+
+	if (temp_raw <= 0x3ff)
+		return (s32)temp_raw * 250;
+
+	return ((s32)temp_raw - 0x800) * 250;
+}
+
+/*
+ * Sensor type (TS0/TS1/SPDHub) is only valid on HSMP protocol >= 7.2.
+ * Older protocols omit it; sensor_fallback supplies TS0/TS1 from address
+ * bit 6 for per-DIMM reads, or SPDHub for the socket-wide max.
+ */
+static ssize_t hsmp_emit_dimm_temp(char *buf, u32 raw, u32 proto, bool with_addr,
+				   u32 sensor_fallback)
+{
+	u32 update_rate = (raw >> 8) & 0x1ff;
+	u32 sensor_type;
+	u32 addr = raw & 0xff;
+	s32 milli = hsmp_dimm_temp_milli(raw);
+	bool neg = milli < 0;
+	u32 abs_milli = neg ? (u32)(-milli) : (u32)milli;
+	u32 whole = abs_milli / 1000;
+	u32 frac = abs_milli % 1000;
+
+	if (proto >= HSMP_PROTO_VER_7_2)
+		sensor_type = (raw >> 17) & 0x3;
+	else
+		sensor_type = sensor_fallback;
+
+	if (with_addr && neg)
+		return sysfs_emit(buf, "-%u.%03u %u %s 0x%02X\n",
+				  whole, frac, update_rate,
+				  dimm_sensor_type_str[sensor_type], addr);
+	if (with_addr)
+		return sysfs_emit(buf, "%u.%03u %u %s 0x%02X\n",
+				  whole, frac, update_rate,
+				  dimm_sensor_type_str[sensor_type], addr);
+	if (neg)
+		return sysfs_emit(buf, "-%u.%03u %u %s\n", whole, frac,
+				  update_rate, dimm_sensor_type_str[sensor_type]);
+
+	return sysfs_emit(buf, "%u.%03u %u %s\n", whole, frac, update_rate,
+			  dimm_sensor_type_str[sensor_type]);
+}
+
+ssize_t hsmp_dimm_temp_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = hsmp_sysfs_socket(dev, hattr);
+	u32 addr = hattr->priv;
+	u32 raw;
+	int ret;
+
+	if (!sock)
+		return -ENODEV;
+
+	ret = hsmp_dimm_query(sock->sock_ind, HSMP_GET_DIMM_THERMAL, addr,
+			      &raw);
+	if (ret)
+		return ret;
+
+	/* 0x80/0x90 = TS0, 0xC0/0xD0 = TS1 when protocol omits sensor type. */
+	return hsmp_emit_dimm_temp(buf, raw, sock->proto_ver, false,
+				   (addr & BIT(6)) ? DIMM_SENSOR_TS1 :
+						     DIMM_SENSOR_TS0);
+}
+
+ssize_t hsmp_dimm_max_temp_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = hsmp_sysfs_socket(dev, hattr);
+	s32 max_milli = -257000;
+	u32 max_raw = 0;
+	u32 valid, bit;
+
+	if (!sock)
+		return -ENODEV;
+
+	valid = sock->dimm_temp_valid;
+	if (!valid)
+		return -ENODATA;
+
+	for (bit = 0; bit < 32; bit++) {
+		u32 addr[2];
+		int i;
+
+		if (!(valid & BIT(bit)))
+			continue;
+
+		hsmp_dimm_temp_addrs(bit, addr);
+		for (i = 0; i < 2; i++) {
+			s32 milli;
+			u32 raw;
+			int ret;
+
+			ret = hsmp_dimm_query(sock->sock_ind, HSMP_GET_DIMM_THERMAL,
+					      addr[i], &raw);
+			if (ret)
+				continue;
+
+			milli = hsmp_dimm_temp_milli(raw);
+			if (milli > max_milli) {
+				max_milli = milli;
+				max_raw = raw;
+			}
+		}
+	}
+
+	if (max_milli == -257000)
+		return -ENODATA;
+
+	/* Aggregate max cannot derive TS0/TS1 reliably on older protocols. */
+	return hsmp_emit_dimm_temp(buf, max_raw, sock->proto_ver, true,
+				   DIMM_SENSOR_SPDHUB);
+}
+
+ssize_t hsmp_dimm_temp_range_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = hsmp_sysfs_socket(dev, hattr);
+	u32 raw, temp_range;
+	int ret;
+
+	if (!sock)
+		return -ENODEV;
+
+	ret = hsmp_dimm_query(sock->sock_ind, HSMP_GET_DIMM_TEMP_RANGE,
+			      hattr->priv, &raw);
+	if (ret)
+		return ret;
+
+	temp_range = raw & 0x7;
+
+	return sysfs_emit(buf, "%u %s\n", temp_range,
+			   (raw & BIT(3)) ? "2x" : "1x");
+}
+
+ssize_t hsmp_dimm_max_temp_range_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = hsmp_sysfs_socket(dev, hattr);
+	u32 raw, temp_range, addr;
+	int ret;
+
+	if (!sock)
+		return -ENODEV;
+
+	if (!sock->dimm_temp_range_valid)
+		return -ENODATA;
+
+	ret = hsmp_dimm_query(sock->sock_ind, HSMP_GET_DIMM_TEMP_RANGE, BIT(31),
+			      &raw);
+	if (ret)
+		return ret;
+
+	temp_range = raw & 0x7;
+	addr = (raw >> 24) & 0xff;
+
+	return sysfs_emit(buf, "%u %s 0x%02X\n", temp_range,
+			   (raw & BIT(3)) ? "2x" : "1x", addr);
+}
+
+static bool hsmp_dimm_group_hidden(const struct hsmp_socket *sock, u32 msg_id)
+{
+	return !sock || is_client_platform() ||
+	       !is_read_msg_enabled(sock, msg_id);
+}
+
+umode_t hsmp_dimm_power_file_visible(const struct hsmp_socket *sock, int id)
+{
+	if (hsmp_dimm_group_hidden(sock, HSMP_GET_DIMM_POWER))
+		return id ? 0 : SYSFS_GROUP_INVISIBLE;
+
+	if (id >= 32)
+		return 0444;
+
+	return (sock->dimm_power_valid & BIT(id)) ? 0444 : 0;
+}
+
+static int hsmp_dimm_temp_bit(int id)
+{
+	return (id & 0xf) + (id >= 32 ? 16 : 0);
+}
+
+umode_t hsmp_dimm_temp_file_visible(const struct hsmp_socket *sock, int id)
+{
+	if (hsmp_dimm_group_hidden(sock, HSMP_GET_DIMM_THERMAL))
+		return id ? 0 : SYSFS_GROUP_INVISIBLE;
+
+	if (id >= 64)
+		return 0444;
+
+	return (sock->dimm_temp_valid & BIT(hsmp_dimm_temp_bit(id))) ? 0444 : 0;
+}
+
+umode_t hsmp_dimm_temp_range_file_visible(const struct hsmp_socket *sock, int id)
+{
+	if (!sock || !sock->dimm_temp_range_valid ||
+	    hsmp_dimm_group_hidden(sock, HSMP_GET_DIMM_TEMP_RANGE))
+		return id ? 0 : SYSFS_GROUP_INVISIBLE;
+
+	/* id 0..15 = 8x (UMC channel); id >= 16 = max. */
+	if (id >= 16)
+		return 0444;
+
+	return (sock->dimm_temp_range_valid & BIT(id)) ? 0444 : 0;
+}
+
 static ssize_t hsmp_lclk_nbio_show(struct device *dev,
 				   struct device_attribute *attr,
 				   u8 nbio_id, char *buf)
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 2b14c4135212d..f620a58683904 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -168,6 +168,23 @@ ssize_t hsmp_dimm_sb_get_store(struct device *dev, struct device_attribute *attr
 			       const char *buf, size_t count);
 ssize_t hsmp_dimm_sb_set_store(struct device *dev, struct device_attribute *attr,
 			       const char *buf, size_t count);
+ssize_t hsmp_dimm_power_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_dimm_total_power_show(struct device *dev,
+				   struct device_attribute *attr, char *buf);
+ssize_t hsmp_dimm_max_power_show(struct device *dev,
+				 struct device_attribute *attr, char *buf);
+ssize_t hsmp_dimm_temp_show(struct device *dev, struct device_attribute *attr,
+			    char *buf);
+ssize_t hsmp_dimm_max_temp_show(struct device *dev, struct device_attribute *attr,
+				char *buf);
+ssize_t hsmp_dimm_temp_range_show(struct device *dev,
+				  struct device_attribute *attr, char *buf);
+ssize_t hsmp_dimm_max_temp_range_show(struct device *dev,
+				      struct device_attribute *attr, char *buf);
+umode_t hsmp_dimm_power_file_visible(const struct hsmp_socket *sock, int id);
+umode_t hsmp_dimm_temp_file_visible(const struct hsmp_socket *sock, int id);
+umode_t hsmp_dimm_temp_range_file_visible(const struct hsmp_socket *sock, int id);
 
 /*
  * True when the attribute store issues a GET, or only records state for
-- 
2.34.1

