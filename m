Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795016167;
	b=guBeAYF828ApFh42rgyk640rode0Cp8jNf9m/p/vg6fSzf7HKoZNJbNgLA/UWSLbA67P
	 vB8dhm9Y/seHfdQsbYxe9BNO0BuVt0yr6uabjpE+nx1w6BIpD6w6gcozJ125TyKKPwX6r
	 OSqThyL9+JazVbrwbmqkGaiw6Da6jLVcVFwkrMSvsYg0GiZJnwNUeoqVeM4cNQ9TvWG/R
	 aeJUksHx3ash2mFkLfD7EzNrmNAer2p8RealUO8qkwtM6MbcjEwUH7P97brYd69PzN0vV
	 j7j0GGqUFeYUo9iqJhb1M9Jw8uPRpDyspzQX6JWeXiLFcqii21VlfcOMK8Fm9qQJNfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016167;
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
	bh=kfdbb0Lq12H1RxauWT8y+qwdtuaZqWWb2KzQ3t5XEgQ=;
	b=Y3SVW1A42pNhn84uf10TQhI+8J3WewfEYQyufiiQZgZYBa2W1gHmGUI+k+ZLa0tkqpbl
	 xUfFhaPlcSq3xcsIdPZ37kIf5vubHmYAXl7ayLlFa6QEELJwsSGqhLqEAa6PLOpPYPDVg
	 91rIxNPgdXrk7q7bH01Aw4zbLQHYhCJP4QxaOm42+ZFJuPbFeCF2Wk7daH93ZLdQ+cLmO
	 8RMGHIryAJ8pruX/YJONyu6Ax/yTGXT4KzHxZyaVjVJ+ewPP8hwTYfZ5g6I72FkmwZYuf
	 QFMSgjEqOfjg++TQ0J56YBSW3SvxyUvJyK41ZAwmOgGLL+jwa7ERBLnCqqaYtKMm6tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FSJekugq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.57
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509E3606A333
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 15:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 509E3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FSJekugq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3DZxEmnOs3RAeFSdd69JIgQyQ3aMpBIAhN/0T3Enc/WSoN6zKO58k87fquuI2u6Lw2Z4se582SySjc5ZtWLM4nu/lHf5UABqf3tcxqtXab6BjwL55VdlZUvCG41Klstm83XVk6n8rQsknxVBRN7vTnes/RWJ2jGhNUH3wV0DhhXPWhRRKbPDvIvAxbMlK73AaBP+lsJZDxMPOb42cnMg330qvgGhEnjAnZGAcaaXsqhXVC2gKq1Xvb+mnUJco+FwBNQJMSbDoD0+0qN66FQ0z5y7QGE2MjkQvkwASuK5JTuBxC8xkPW8qeOOi16c81q4tRrUkupDXRK7Dd1YaPfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfdbb0Lq12H1RxauWT8y+qwdtuaZqWWb2KzQ3t5XEgQ=;
 b=wYDsiOqopj1ah9JBku9s5R0uCmb0me58OAt6TpTxadNn8zjquLO1vL/NHz+4UN76A4t/R7/VkuTJisHcpTrPBhwf5K7dbONm1N8T6rvQZCgd542Gyf3Pa/4sxYdcTJDNHVnRXdqcE3WHAqrO2lpnbgQxGt7XBFj/4XMiTuKJWEuYOp9IGCi+DNsz+rQC2wOSZo7lcSx5VooYYpNZXA3/Id6mjC0m5IRprriQgXl/MYQzuuRTJUB/x6a+OGOgS4o07jHcJDm5aibgsNgLbKedKgMezhPYZa8e39VglIizZ1sQml0c4YatB/F1gH7s2JL+JIqZvPsc5NMFPSs+DiaijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfdbb0Lq12H1RxauWT8y+qwdtuaZqWWb2KzQ3t5XEgQ=;
 b=FSJekugqv3/uSIpy65jc0g+6rWmj9xQMdUJU6dIinpmSg/K5iFvkFDW5Les0RENC7c1slPYueODC8EN90D3IyeAqlqDw4c/GQn6yKWMA/mjOnKbATOqTAWYb5lpuyQzqSHKicomqZj3Sk5qQBjPceUoaC/lseD6mWFE4MZIjyMA=
Received: from PH8PR22CA0022.namprd22.prod.outlook.com (2603:10b6:510:2d1::17)
 by CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:35:58 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:510:2d1:cafe::92) by PH8PR22CA0022.outlook.office365.com
 (2603:10b6:510:2d1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 15:35:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF00000009.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 15:35:57 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 09:35:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v2 3/3] platform/x86/amd/wmi: aod: Document the WMI interface
Date: Wed, 18 Nov 2026 21:05:23 +0530
Message-ID: <20261118153523.3627870-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bfb439-9725-4ea4-e49e-08df4589a426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|3023799007|261022075727099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ABvs43zHKmnRHqjT/VdNtgjgVOrqvPo3VqxD8h1WwI0FCtQASXBb/dOqeyV8Pu5t0SVTgORp8hUi1Czf94qUoH8AKwbsJGuPB+B1Lzd4v0BENz+nrYOqMXCdpOVD7XuG/uzVFjkwSdpkq3kKuV7K2S6sRLtT6CIeCkriWb5kMiQtQ7Thkg7ZgFpdCF1C/oscN6Z3rqejTTqzrhuI24gcUYhOJIMxjoRks+H+JLPHxQr5Jg5aeOfq2blZJA5vcaqSXUjbvOJa0lEcPtsDFm5NRawGbUWlrwbmYVSvkSKZx/EwdYpCL7JmPkublDO6pgmGdhsdw/ElsXANnun9PhgXd2Q+F40H/+M06ovq1srf46c2XaIaWq792LDVLBoXh7Fh4bX+I8YVYx1LULcn++oDX1wtheETEC+Yg0392jHKzNNQYW9oHRk9FBPWWmAwZxvcAnwCsP847pAzitS/WC+NbKFfu+X/4FRo2g7Ugfc3P545iXBZzYsqiwmQjv6jkNZsBnPWYOk2Jj6twcE+YLOoUhFKiWjDqfnUQ20lPd/n2XS8HeyhZiVTFQm/w+h17Wufnn5y4M9IDF4gynHTYR83TkLZokJSfTqUGprgmn1c4/5ApR7wY4Cslt5ThxgPAxeVr2xcCeSvv1I0MHaQdaAKJevg/aqRGG/6eKyQmaX70+96tILLVMBvVdPBswSCxlivXc4p0muB93SSmrefsuffJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261022075727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6KQ+K/USgv7+UWmNLFgKIx1hXDiPVO5ep+4uxblEJtapK/dabaufKDPatGcugiFUEWGGrHASlQWsOXDg60MJImt4zqHkyTrnLYO9L1O09PAASU9kiHAiySfKB0TGriLCLUHtr4Jq8NtDw+yknRPwS/wLUcyq63tXWeGI7f70KxFYCikRoZrnhQG34jcLXQVnr39YEQGp53dsIaXM+M4BU3Y27ixrfw7IGEtl0QNkJ+kThNUbV1gf+ktXpJE6JVgwSyRi/tY7gNZHHraVdugbo9lNSLBFlKQ+nDvGKXSiMS6iIME6v6QLfyu9y9TP47mh8CKQPUUs2cyIhhri5/nrngwgp7ZZDuokHqRcu/FrZw6VTCcT4dmh6qy/N9EMoaeodB0dVoJQGOxct63xpGOLWJvsV6iXJT7o5Og4rn5EePUxMfSkp9PsFdsG+KjjSJIj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:35:57.5849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bfb439-9725-4ea4-e49e-08df4589a426
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457

Describe the AMD Overclocking WMI interface, the commands used for the
sysfs attributes and the debugfs interface.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/wmi/devices/amd-wmi-aod.rst | 412 ++++++++++++++++++++++
 MAINTAINERS                               |   1 +
 2 files changed, 413 insertions(+)
 create mode 100644 Documentation/wmi/devices/amd-wmi-aod.rst

diff --git a/Documentation/wmi/devices/amd-wmi-aod.rst b/Documentation/wmi/devices/amd-wmi-aod.rst
new file mode 100644
index 000000000000..c7ab9058c9ae
--- /dev/null
+++ b/Documentation/wmi/devices/amd-wmi-aod.rst
@@ -0,0 +1,412 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=========================================
+AMD Overclocking WMI driver (amd-wmi-aod)
+=========================================
+
+Introduction
+============
+
+AMD Ryzen platforms implement the AMD Overclocking (AOD) interface
+in the platform firmware. The firmware exposes it through a WMI device with
+the GUID ``95F20B61-3D44-41F8-87E1-03CBF94C4E8F``. All platforms that
+implement the AOD interface use this GUID. On Windows this interface is
+used by AMD Ryzen Master.
+
+The interface is command based. The firmware reports a list of supported
+commands, each with a numeric command ID and a property flag. Commands with
+a linear range of values (property 1) report their minimum, maximum and step
+size, commands with discrete values (property 0) report the list of values
+they accept. A new value is applied by executing the command.
+
+The firmware stores new values in its setup variables, so they only take
+effect after a reboot. Some commands also report their current value, but
+this depends on the firmware: on the systems tested so far the memory clock
+and SMT report their current value, the PPT, TDC and EDC limits do not.
+
+The driver exposes a selected set of these commands as sysfs attributes,
+see Documentation/ABI/testing/sysfs-platform-amd-wmi-aod. An attribute is
+only created if the firmware lists the matching command. All attributes
+call into the firmware and are only accessible by root. More attributes
+can be added later as needed.
+
+WMI interface description
+=========================
+
+The WMI interface description can be decoded from the embedded binary MOF
+(bmof) data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  [WMI,
+   Locale("MS\\0x409"),
+   Description("This class contains the definition of the package used in other classes"),
+   guid("{ABBC0F58-8EA1-11d1-00A0-C90629100000}")
+  ]
+  class OIDPackage
+  {
+      [WmiDataId(1),
+       read, write,
+       Description("Number of ID")
+      ] uint8 Length;
+      [WmiDataId(2),
+       read, write,
+       Description("64*4 bytes of data")
+      ] uint32 ID[64];
+      [WmiDataId(3),
+       read, write,
+       Description("64*4 bytes of data")
+      ] uint32 property[64];
+      [WmiDataId(4),
+       read, write,
+       Description("64 strings")
+      ] string IDstring[64];
+  };
+
+  [WMI,
+   Locale("MS\\0x409"),
+   Description("This class contains the definition of the package used in other classes"),
+   guid("{ABBC0F65-8EA1-11d1-00A0-C90629100000}")
+  ]
+  class GetdValuesPackage
+  {
+   [WmiDataId(1),
+       read, write,
+       Description("ID")
+      ] uint32 ID;
+   [WmiDataId(2),
+      read, write,
+      Description("Current")
+      ] uint32 Current;
+   [WmiDataId(3),
+       read, write,
+       Description("Number of ID")
+      ] uint32 Length;
+   [WmiDataId(4),
+       read, write,
+       Description("100*4 bytes of data")
+      ] uint32 DValuesBuffer[100];
+  };
+
+  [WMI,
+   Locale("MS\\0x409"),
+   Description("This class contains the definition of the package used in other classes"),
+   guid("{7BF6AE1F-85CC-4ee5-94FD-394B5FE7E710}")
+  ]
+  class OutBuffer
+  {
+   [WmiDataId(1),
+       read, write,
+       Description("ID")
+      ] uint8 result[200];
+  };
+
+  [WMI,
+   Locale("MS\\0x409"),
+   Description("This class contains the definition of the package used in other classes"),
+   guid("{F7B20E14-30F4-41FA-BDF9-77DC09CFFFF1}")
+  ]
+  class DimmSpdBuffer
+  {
+   [WmiDataId(1),
+       read, write,
+       Description("ID")
+      ] uint8 DimmSpd[532];
+  };
+
+  [WMI,
+   Locale("MS\\0x409"),
+   Description("This class contains the definition of the package used in other classes"),
+   guid("{ABBC0F63-8EA1-11d1-00A0-C90629100000}")
+  ]
+  class GetMinMaxSteppingPackage
+  {
+      [WmiDataId(1),
+          read, write,
+          Description("ID")
+          ] uint32 Value;
+          [WmiDataId(2),
+           read, write,
+           Description("Current")
+          ] uint32 Current;
+          [WmiDataId(3),
+           read, write,
+           Description("Min")
+          ] uint32 Min;
+          [WmiDataId(4),
+           read, write,
+           Description("Max")
+          ] uint32 Max;
+          [WmiDataId(5),
+           read, write,
+           Description("Stepping")
+          ] uint32 Stepping;
+  };
+
+  [WMI,
+   Locale("MS\\0x409"),
+   Description("This class contains the definition of RMP data"),
+   guid("{ABBC0F66-8EAA-11d1-00A0-C90629100000}")
+  ]
+  class RMPPackage
+  {
+          [WmiDataId(1),
+          read, write,
+          Description("Is RMP available")
+          ] uint8 IsRmpAvailable;
+          [WmiDataId(2),
+          read, write,
+          Description("Number of RMP Profiles")
+          ] uint8 NumberOfProfiles;
+          [WmiDataId(3),
+          read, write,
+          Description("Basic Info : Profile Enable State in RMP SPD ")
+          ] uint8 IsProfileEnable[2];
+          [WmiDataId(4),
+          read, write,
+          Description("Basic Info : Profile Memory Clock units MHz")
+          ] uint16 MemoryClock[2];
+          [WmiDataId(5),
+          read, write,
+          Description("Basic Info : CAS Latency in CLK")
+          ] uint16 CASLatency[2];
+          [WmiDataId(6),
+           read, write,
+           Description("RMP SPD Data")
+          ] uint8 Data[128];
+  };
+
+  [WMI,
+   Locale("MS\\0x409"),
+   Description("This class contains the definition of OPP Profile data"),
+   guid("{CDD45862-4A60-4B6F-81CF-F9A826756408}")
+  ]
+  class OPPProfole
+  {
+      [WmiDataId(1),
+        read, write,
+        Description("Profile data")
+      ] uint8 Data[192];
+  };
+
+  [WMI,
+   Locale("MS\\0x409"),
+   Description("This class contains the definition of OPP Header"),
+   guid("{E0DB04D9-AF36-473A-85B2-AE31B851406E}")
+  ]
+  class OPPHeader
+  {
+          [WmiDataId(1),
+          read, write,
+          Description("Is OPP available")
+          ] uint8 IsOppAvailable;
+          [WmiDataId(2),
+          read, write,
+          Description("OPP Revision")
+          ] uint8 OppRevision;
+          [WmiDataId(3),
+          read, write,
+          Description("Number of OPP Profiles")
+          ] uint8 OppCount;
+  };
+
+  [WMI,
+   Dynamic,
+   Provider("WmiProv"),
+   Locale("MS\\0x409"),
+   Description("Class to Query/Set a CLKValue"),
+   guid("{95F20B61-3D44-41F8-87E1-03CBF94C4E8F}")
+  ]
+  class AMD_ACPI
+  {
+      [key, read]
+       string InstanceName;
+      [read] boolean Active;
+
+      [WmiMethodId(1),
+       Implemented,
+       read, write,
+       Description("Get version")
+      ] void QueryVersion([out,Description("version")]uint32 version);
+
+      [WmiMethodId(2),
+       Implemented,
+       read, write,
+       Description("WMI function init.")
+      ] void Init([out,Description("status")]uint8 status);
+
+      [WmiMethodId(3),
+       Implemented,
+       read, write,
+       Description("Get BIOS ACPI support function table.")
+      ] void GetObjectID([out,Description("Get BIOS support Object ID table")]OIDPackage pack);
+
+      [WmiMethodId(4),
+       Implemented,
+       read, write,
+       Description("Bios request data")
+      ] void Getdvalues([in,Description("ID used to identify")]uint32 ID,[out,Description("status")]GetdValuesPackage pack);
+
+      [WmiMethodId(5),
+       Implemented,
+       read, write,
+       Description("Command Run")
+      ] void RunCommand([in,Description("In buffer")]uint8 Inbuf[8],[out,Description("Out buffer")]OutBuffer Outbuf);
+
+      [WmiMethodId(6),
+       Implemented,
+       read, write,
+       Description("Get Min/Max/Stepping values")
+      ] void GetMinMaxSteppingValues([in,Description("ID used to identify")]uint32 ID,[out,Description("status")]GetMinMaxSteppingPackage pack);
+
+      [WmiMethodId(7),
+       Implemented,
+       read, write,
+       Description("Get DIMM SPD data")
+      ] void GetDimmSpdData([in,Description("DIMM Index")]uint32 Index,[out,Description("SPD Data Buffer")]DimmSpdBuffer DimmSpdData);
+
+       [WmiMethodId(8),
+       Implemented,
+       read, write,
+       Description("Get BIOS ACPI support function table2.")
+      ] void GetObjectID2([out,Description("Get BIOS support Object ID table2")]OIDPackage pack);
+
+       [WmiMethodId(9),
+       Implemented,
+       read, write,
+       Description("Get RMP table")
+      ] void GetRmpData([out,Description("Get RMP table")]RMPPackage pack);
+
+       [WmiMethodId(10),
+       Implemented,
+       read, write,
+       Description("Get OPP Heaer")
+      ] void GetOppTable([out,Description("Get Opp Heaer")]OPPHeader pack);
+
+       [WmiMethodId(11),
+       Implemented,
+       read, write,
+       Description("Get OPP Data")
+      ] void GetOppData([in,Description("Profile Index")]uint32 Index,[out,Description("Opp Profile")]OPPProfole pack);
+  };
+
+Newer firmware versions may implement additional WMI methods.
+
+WMI method usage
+================
+
+All WMI methods use instance 0. The firmware reads a 32-bit input argument
+even for WMI methods that take no arguments, so the driver always passes
+at least a 32-bit argument. Unless noted otherwise, all integers are 32-bit
+little-endian values.
+
+QueryVersion (method ID 1)
+--------------------------
+
+Returns the version of the AOD interface implemented by the firmware as
+a single integer. The driver reads it once during probe.
+
+Init (method ID 2)
+------------------
+
+Prepares the firmware for the other WMI methods, for example by clearing
+the buffer used to pass data to the firmware. The driver calls it once
+during probe, before any other WMI method. The returned status byte is not
+used by the driver.
+
+GetObjectID (method ID 3) and GetObjectID2 (method ID 8)
+--------------------------------------------------------
+
+Return the list of supported general (GetObjectID) and overclocking
+(GetObjectID2) commands as a package with 193 elements:
+
+- the number of valid entries
+- 64 command IDs
+- 64 property flags
+- 64 command names as strings
+
+The driver uses both lists during probe to find out which of its sysfs
+attributes are supported.
+
+Getdvalues (method ID 4)
+------------------------
+
+Takes a command ID and returns the discrete values supported by this
+command:
+
+- the command ID
+- the current value
+- the number of valid discrete values
+- 100 discrete values
+
+RunCommand (method ID 5)
+------------------------
+
+Takes a command ID and a new value, and applies the new value. The
+firmware returns a 200 byte buffer, with the 32-bit status of the
+operation (AodSmiStatus) located at offset 2. A status of 0 means
+success.
+
+GetMinMaxSteppingValues (method ID 6)
+-------------------------------------
+
+Takes a command ID and returns the range of values supported by this
+command:
+
+- the command ID
+- the current value, or 0 if the firmware does not report it
+- the minimum value
+- the maximum value
+- the step size
+
+Commands with discrete values return all fields as 0. In the same way,
+Getdvalues returns an ID and a length of 0 for commands with a linear range.
+
+The WMI methods 7 (GetDimmSpdData), 9 (GetRmpData), 10 (GetOppTable) and
+11 (GetOppData) are not used by the driver.
+
+Commands used by the driver
+===========================
+
+============	================	==============	==========
+Command ID	sysfs attribute		Firmware unit	sysfs unit
+============	================	==============	==========
+0x00050001	ppt_limit		mW		uW
+0x00050002	tdc_limit		mA		mA
+0x00050003	edc_limit		mA		mA
+0x00020001	mem_clock		MHz		MHz
+0x00020026	smt_enable		0/1		0/1
+============	================	==============	==========
+
+Debugfs interface
+=================
+
+For debugging and for tools that need access to commands without a
+dedicated sysfs attribute, the driver exposes the raw WMI methods in
+``/sys/kernel/debug/amd-wmi-aod-<device>/``. This interface is not a
+stable ABI and is only accessible by root.
+
+``query_version``
+  Reads the AOD interface version reported by the firmware during probe.
+
+``get_object_id``, ``get_object_id2``
+  Read the command lists in text form, one line per command.
+
+``get_object_id_raw``, ``get_object_id2_raw``
+  Read the command lists as a 4612 byte binary structure: the number of
+  entries (u32), 64 command IDs (u32), 64 property flags (u32) and 64
+  NUL-terminated command names of 64 bytes each. The firmware is queried
+  when the file is read.
+
+``get_dvalues``, ``get_minmax_stepping``
+  Write a command ID, then read the result of Getdvalues or
+  GetMinMaxSteppingValues for this command.
+
+``run_command``
+  Write ``"<command id> <value>"`` to execute a command. The driver does
+  not check the command ID or the value, so using this file taints the
+  kernel (``TAINT_CPU_OUT_OF_SPEC``).
+
+``run_command_status``
+  Reads the status reported by the firmware for the last command executed
+  using ``run_command``.
diff --git a/MAINTAINERS b/MAINTAINERS
index 6a5dd872fbe4..8211e904b1b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1360,6 +1360,7 @@ M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
+F:	Documentation/wmi/devices/amd-wmi-aod.rst
 F:	drivers/platform/x86/amd/wmi/
 
 AMD XDNA DRIVER
-- 
2.34.1

