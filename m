Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFACC32B108
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791659185; cv=fail; b=cAdKMrgnvirAcdhgPjDV9GTOuQVdgeA8YK8swqK3olXhHWk272a8hjNkFLVBkSK2C2xAkx/0Si6YMO0AkQ2L81kc2aGVnBoV9GTom3BS4+1Hlu8DNOmZjC9/9I+4q2SaitCy7KjUqKG4C7HFaAILvkM2Nlyh7+uSQ/+EuiFwmEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791659185; c=relaxed/simple;
	bh=F7uK3ggV1PlF1SalQYFS+Wse3vNrvoDCJ+jyxD6lsVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzYXRN97DQY676FTPYNA2Vrw4xVFCZvmRzU5ORw5homD/iFphMVRWQ3sde8qsXhEibYBjSb/1ZQ9eFsGoWCJsjYqV3/Ky2gQf+Tp13O28MFMqAYtYMPb0be1cA5L6zeGpPGxc81J4zZFPJXcjrpkrdF9JdmXSf/RjdBqWWR3voI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SHwV29CC; arc=fail smtp.client-ip=40.107.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SHwV29CC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qj4oAAbEPDEtcQUSTYQB95JIsJ7uvvEtyF7jTGDZow82a9tunz087YNFDtRL+vPBexGmtPqEH4ZXxVRUFwFbcFmmdVmvPubgLX3Cfaxq6HRiAAESO7ps3NNdKbQNbLDO8GZV3QcSMYWXk8dPSdkXd3io+zX9oJNSnzYtxXlPZ+xjg5R5M8KIT7eRCDhxvik/CXShlbmKytuQ4RwKBOkTwXtSG7xEtpLAoU/S1gpCu+DzMW8MGR/hGoZjdKKy3sFBhjGFDuP5J+pLUF1tbLfccFDWGd3VED40lDIm9FuRFC50OQSsBu3xpI6zFS2BasADjYlfpl81ZkJhPJArdYlXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fi04QdnYLeTIRpsLpYTo2Dh2+hqhFSgfr4RstnH6aw=;
 b=ECfirhfpkxQUs8xV2Lr65tyGNyv57zkH5DGCqcxJyDD74fv0BHZ0weI+wObtja/7pIGRi90XLjAtLUXZX34NzonLCKgoc5jHdqaX2TdzTioQrYrQU1W+KxpqcTG0wcAriEu/PxH/gp+QBCshqhoSSlXB/+kaT3ii1CT/3aapSVHSxooynrbCUYFd+j8eKhyhsnrdNIK32ET5HwO9/OKnclm2I7rjdYlfVaIDdcwPa+fRY121DsvncOmaXReMCIwOawCcsrPKRGAGXjb+MYmG0AWvDVLeyDq9cnFQWXdvaPIkpXm6GHhrT/F8w2LWkP1ZkibK0Tohh6L6FxdCOkDQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fi04QdnYLeTIRpsLpYTo2Dh2+hqhFSgfr4RstnH6aw=;
 b=SHwV29CCEOIazrWXFI0bCqJD30TxxcwFTfd4XuBQPUxJfJmMdCur4HDkyrX8CVBCjZo7qxAFVddcyppUszj0SSdObfwjC2OfVjCAenOj6YgyF8UEPJ9yYKU3irYNLjxPwhueq8IiLFAlAVfq9C4nB0n7kurTbq89iQnoEMC/ZFI=
Received: from MN2PR18CA0009.namprd18.prod.outlook.com (2603:10b6:208:23c::14)
 by IA0PPF89A593F05.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 19:06:16 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::7e) by MN2PR18CA0009.outlook.office365.com
 (2603:10b6:208:23c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sat, 10
 Oct 2026 19:06:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 19:06:16 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 10 Oct
 2026 14:06:09 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/3] platform/x86/amd/wmi: aod: Document the WMI interface
Date: Sun, 11 Oct 2026 00:35:43 +0530
Message-ID: <20261010190543.563161-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|IA0PPF89A593F05:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f3c197-fc25-4117-8306-08df27018f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6jWGewiWCpWR657IGhuJqAPXQS2FLhugMbsibg081KlpNEsqQ/Gzc6eQhHubtPjagHtfHxHYxlD9rx1/Ag0sxni2kjNShzgq+TBmfykj40/QGOJAKYBATVzt3UIzRLll6ghbUkCugMK/1NUFMgfl0YKhFjM+8Bxy90i68WX+0IHa3QVLzqBoCiV0WywQJ1ehlNdQmDrinvzipdnzV36vPglx0cjxIlXVian68BBTb7f72HSNDTMjhrId96e8xhYlwgAr+Fqj6sq5+S+vIKrH6xvPa0MEDJBoBNClnIq8/ed5y5+lToOC+dtbxDmUds3AGzGH354LxQzWLKxpxXk87EBaIJDvdPOnB67U7io4K5arsT9qAJAEppa6Az7xsxot9mlS0HxhvXf8uRJ1wbDARgEJVnvMkCXv+Nk3KDmr9GswQCwgGoZ5O1zLpHwWThWjCMlpKM8OeZ8y52vwVi6USkT1KIg3UQ2kTrUHT/lAaSFm3r05oOogtppFkvMpmReSCznfFK6EkDiReJhBYfU3+HETM/3xKSwFhWiC5WorAoDTyjeXgL7dtqCifiA79NGzDyHwmtnAXW5rxW9+IhPMKbu6TuWVpc67unBE9jxeloo66H2Tz6FWBPEHaGf0HFFn/cEefJ00rAltNZdKJ9sdTBheMmxaEfBf0kVWe7PrBJuS8833gHcR6wj2dklinsdEcerTemiTQjh5TFd7zKa3Zw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hg1xVvVXhwGoi+oqh9VaLDP6gCRQRRU+bJqTbimX2+vQvucMFBjt/4TUC9ir5KS4OnSGNbFxPhQUPy2+Fs8oPqwqyMXhsu194RIJ1ingcT41GWtD5F/n6kJaQrchwrbXhRdKcgr3xX0YCMXXuBSMiMSj3w5FgaeB1T1lD7/cv1WStK7/8SvOyV0lV75YaS295LhY9gSA10GEI7Lc6DD2GWeYhTUrM2CLnMamoHtCbsmK3VKNqdJHREySwr4b27+PjJ/c6ehwttebByPsS+6K2cUFD6NndC8scv933Z4Zpf7QYayUifbIUYngoCOE8fOP0c4psACP3s2nsYKnwYDy9Gb6LBemwxuaukiHAaob3wMikjkkbqEcL8pvI1fIT2mCEr33LnjJ7uZuQpuLBpkdAdX5m4rL3Qgz3/8XwoDwRZjk8mFjQADnlyNVUiJo+aOd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 19:06:16.4323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f3c197-fc25-4117-8306-08df27018f6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF89A593F05

Describe the AMD Overclocking WMI interface, the commands used for the
sysfs attributes and the debugfs interface.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/wmi/devices/amd-wmi-aod.rst | 291 ++++++++++++++++++++++
 MAINTAINERS                               |   1 +
 2 files changed, 292 insertions(+)
 create mode 100644 Documentation/wmi/devices/amd-wmi-aod.rst

diff --git a/Documentation/wmi/devices/amd-wmi-aod.rst b/Documentation/wmi/devices/amd-wmi-aod.rst
new file mode 100644
index 000000000000..c75a8d11d8c9
--- /dev/null
+++ b/Documentation/wmi/devices/amd-wmi-aod.rst
@@ -0,0 +1,291 @@
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
+(bmof) data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility.
+Only the WMI methods and data classes used by the driver are shown here:
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
+       [WmiMethodId(8),
+       Implemented,
+       read, write,
+       Description("Get BIOS ACPI support function table2.")
+      ] void GetObjectID2([out,Description("Get BIOS support Object ID table2")]OIDPackage pack);
+  };
+
+WMI method usage
+================
+
+All WMI methods use instance 0. The firmware reads a 32-bit input argument
+even for WMI methods that take no arguments, so the driver always passes
+at least a 32-bit argument. All integers are 32-bit little-endian values.
+
+QueryVersion (method ID 1)
+--------------------------
+
+Returns the version of the AOD interface implemented by the firmware as
+a single integer.
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
+The WMI methods 2 (Init), 7 (GetDimmSpdData), 9 (GetRmpData),
+10 (GetOppTable), 11 (GetOppData) and 12 (GetMemoryProfile) are not used
+by the driver.
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
+  Reads the AOD interface version.
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
+  Write ``"<command id> <value>"`` to execute a command.
+
+``run_command_status``
+  Reads the status reported by the firmware for the last command executed
+  using ``run_command``.
diff --git a/MAINTAINERS b/MAINTAINERS
index d069d02665e2..0a3b81e59142 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1340,6 +1340,7 @@ M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
+F:	Documentation/wmi/devices/amd-wmi-aod.rst
 F:	drivers/platform/x86/amd/wmi/
 
 AMD XDNA DRIVER
-- 
2.34.1

