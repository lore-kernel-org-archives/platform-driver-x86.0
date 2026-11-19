Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795055251;
	b=Kr/wO128c/XvKHb156lWQQfcQGYNvqDj8pDTG66cnP+2AiqDg7gpV4px0X2ljuhjb42U
	 t7pdGNCRIRAQ7iWQ/qr3uJTFiy+aJUGPZ6tYfCjjsStLjnIolTYVHf+FM0FJ5d6+N0N0D
	 2FZuRtmFROsQ/PGMZZF3F9OEeT4/p0hZKE2308ejB/9K6SJ5LPWTL4DqIzQBVaYTJNeVF
	 LulCF7T0oFChoVnl6TOqNKNu+T6B9XJw5oKs+4Sci5M/Yr+FzOWD9mNEZk7ANvBNU91MX
	 R8FBkzEmVp/KTolAwEAtixyC/Bnx28o/WKXBfPnKKAXBUMz4EZQJEmjIKSw+Fhkvg4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055251;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=93mr43UvwtcxGjmwQsfV9sEcdR79eIZptMup2n8nuUY=;
	b=GPr9qJLWeqhy1u5m1MKPLU0Ay3biuLD6cd+seRuJ4BjzvIwgHSX95q2IjpbqWeWgUo7h
	 GtprsGKy9QvRLvwaBwJ1u8+Of5RWxXUttCAHAGc57AIog7naK/jXs83ifK0GDMNCJ6eIR
	 fTCdHioagYglctovpfclylqU8tLVI0EMFTFMv6jgCqO4ouNgmt5hginv0m0Qoxme/TPX+
	 Cc66sIch2qUh++UjUDol2pFfJ1djocB12T4HbKE2cSHGnfMvcUn0aC2hlt8kaEIjZBjv4
	 cbzOO18qfo9xAsLC5OghY0Yg8lx8OZT76J3nKvXRkoKQFgFzV3urEh7428yknK0kMfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aC41S3VJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.50
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAE9606A334;
	Thu, 19 Nov 2026 02:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EAE9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aC41S3VJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImZOAjOjpPLNTVBKclyXUSeQ33L3KJjvrTiqMVYyFw3FlPlKL3sCIyHLV/iU+5oYgC8+jAwHkUEuKt8GUvwJUYvzcl7J2w6lwmCy6l+u5cIXbUctdPwmFKVnqUlfUzexNRHvTgMzplhWkJRBKoLkRjh/UbDjBOSSNkl3bbIK/ELnZFYX5wLbGpKm8q3+XNHLt/cP4362rdV8yUZNGR/8Dsx5E5fOZ0Zn+6PHICae+nc6JajXG2RmeTmf5YFyltrwYlkO+jNoKnH5E/GQdsgH/1Z4XgUKVOxn1XvqhWU/x9sw/58+rdz1if8FYzJOEtdGgMzgQ6pEet1D8njcrhjrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93mr43UvwtcxGjmwQsfV9sEcdR79eIZptMup2n8nuUY=;
 b=ytHW387Kb9wc8dBPqkQE2pYhAIzU5jwpyPwmdcR4XUbAbPpRFnflQwy3R9EFs1FP3TSJA0yzMVRZudV2K0jqCn4aSHsCpUdPtj4Xigcg0wpqZj1W1nhDl4WRYKapDncFIc1UvzhJpV5KeaGl0+NibTB7KqE36nxbpISEe5pXljwQ+2i3CK1E3aKzFANAxXIZ8/7z+QUHwPXCYl/xlHI1ADBqKltEdLQn1/kPzZqMJNmT9tSxwXFAXI3HYzW8u+Hn3nriaYFbtV+3E5SOlAAZBkNHgfpInh5XOH4ntuvJWZeQz73JgOH1hUji/KVmB2vYFGpgKOuZPbS7Z8VHTCLbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93mr43UvwtcxGjmwQsfV9sEcdR79eIZptMup2n8nuUY=;
 b=aC41S3VJfrWj3Z3SSgVDQXbewo3X0KGeMmZHBXT64mIv5vEOD5JmX3hJoZY55xZLycuI0NatKiDyCMgK8qrpktaoSECkoedm4sBAACKEGlQJgABgNiWvybAjmtlZF+iZnfrGShs1jqALCwETworPnHjZkANECfRjoefikz3AuF9po7OYfncjmxfdJCEs4216OzcA8l3MHRJCBsiWGbrh0kadVNk8PAp2NSi456LFVJTHkLv+W0znOnUsSLKntfeRxp4a20lyKcLbsx8LHFKoOlA2wfmPY4/VwN2zoxycPcwaHQWPjMtDObitEKK4f51Wl3Ynh+aN1oViVnBo5a6Kvw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:27:28 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 02:27:28 +0000
From: David Cemin <dcemin@nvidia.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	xy-jackie@139.com,
	ikepanhc@gmail.com,
	i@rong.moe,
	marco_giunta@outlook.it,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldemarchi@nvidia.com
Subject: [PATCH v2 1/3] platform: lenovo: move the architecture independent WMI drivers out of x86
Date: Wed, 18 Nov 2026 18:27:17 -0800
Message-ID: <20261119022719.3089229-2-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119022719.3089229-1-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <20261119022719.3089229-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To CH0PR12MB5089.namprd12.prod.outlook.com
 (2603:10b6:610:bc::8)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bda78ff-7fa1-4eb5-ad8f-08df45e4a7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022075727099003|261021135927099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	EVLDQLcP3uSY/hvIv2t5pZdc/hlWVocEpfC3AYUBz7y+i/8NVMspjCGqFDODcCZoR3g6X6uWQOda+630PzXt6oJWm7MDigPeYd96AeT71Kc0yQKG9aAUba1nfrt+WWrbWaQMQ1g9m+Q8qJYwT6rwQ5tazlovIkTNVgD2xp75tt7Y0UXIbYuehG+QQS+ZpFtbfkc9ano+DHIOcGVMDLvDbVeZGijFakoYEHXrZo7LAVxFB1YAY9t3uZ8cDWYJ6ycDAhTYgEqedLvcH8Jci0gy83D3XAGMDn/vBnASHE/vtzy8g5rPEtZNwZGjTDnoZyQ1tqjUYrhuyUBhSFKKNi42vNUVSa/+ISifD3NqDz+WvNfi647CXBXG0ZG5jGPxzgozC6O6Hi4bYETGvURA7mvyaKvrqNtc/iOK0HOB+RBCf9KobyeghMd7GOMO482deevy+rpAHNA660JbZQ0hpQA3NZFu7ahwxRPKNRCsUwCOSdZk8XuVGx9oRgy0ntfKkMCPjO69+GBRc8IHYPxEKQsbmoVAIUd/lcqznB09ELe6k18SIMPr4NkdKzTu7ccBVTf6+dO837UOTxbCiIr35QiCrSPTV+YsHuXzvR10+iRgyN3iouoJIqch3o8B5KOX7U+DDkDcB4LznJXBK5bvmODtIXED0/VQsSNiwSuIbWl5wRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022075727099003)(261021135927099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SCd6hjZe/KDh4Y/gC7vb9E40+edBmO9E/Os2uxL3IWyqZA57KFis6eorDrSB?=
 =?us-ascii?Q?OSi1GO86H6Qdt62tYGB44nn1ru4rHDdvupOylZzW5HvTU6KMgO+SqtuqVZOP?=
 =?us-ascii?Q?yeIEQhoxyYI3DJq/YXqoyx2XeBzOu4vUop3vQe6h81iLnIlL8ncj+38Zp2fI?=
 =?us-ascii?Q?jSYWDCXldbReAWg9+83ttVutsZMYh1R9rkFEHeQpoVafh6nUy8IL8WsoT3aY?=
 =?us-ascii?Q?056mORh6c8IllSx3pHcfrwrD5Ha3ybcXS5MxdE3+2RqqIjRTQwcsWPjP99OQ?=
 =?us-ascii?Q?0ikyBWOCqwcfJhCl9gOBMWW09IWd7DF9kKq0MOx4WUpPiwVimlzxOWORohGb?=
 =?us-ascii?Q?UncyvMMLU/oQwPUie1j4eAdVblG1YG4zelNLcqIpCU/aZ0K+tLdsuld2sklH?=
 =?us-ascii?Q?BLfCfvpVvGRxlROqglFwD/9WgNoIQari3GV2RW890J17j/mQzS4bjixHGWuw?=
 =?us-ascii?Q?lQuA6eJTNdCF70qmEnsjFigzM9RMPRy+C2czErPTulxzGWXcnBYccyg0cD87?=
 =?us-ascii?Q?QRMrkork6nKLZ+zrY8OGVasUsHWyka86n/uvbGfHXv9rhBOqNzvjqF6BfvlM?=
 =?us-ascii?Q?81oEEM288PhOQz16Hpw+t/va+tmiPLnxohDh4LjOhjEb9+k3CE7y+LfExuS7?=
 =?us-ascii?Q?HgB6MHBxM7wcWCPz7t2Y5mhXI8Pa8EeblDoLcQGz2eE5ojGw/yD0kx0+Hatv?=
 =?us-ascii?Q?VJC8Q7kRp6YujlWyVVo8LFKUeFK5Db04iVAtOZ8gDdZACDBURxOSnBUUCgbS?=
 =?us-ascii?Q?i8cHdq51mXE2lgym8UD3FM8yxjFtuU/vEFNfpacIP1If9el7W6XH8svJXSV0?=
 =?us-ascii?Q?o6LAQULDt9Vt3TfDseL904np3pP/k34rMwDcD45NroYADXo89S7rXcaus3rX?=
 =?us-ascii?Q?DDImsSQq9DVqxWMRrirRjXdd1a/n+9p2wj0SSgt0LPYZTWyJZgIa0ap5Zdmw?=
 =?us-ascii?Q?6Sjj+2IP4sD1CDXKDV2FIE859NUyWPGyvjrj1wScv1TJJ6dZwvs6cFhiP2lA?=
 =?us-ascii?Q?Kt42K8EpPJvTvSdTKW7Q/8glI0va29wFk2Ix4iiB6x28an57UnXR5s+Xg/GG?=
 =?us-ascii?Q?PeEZK6H1rdpKfI05ZP6xlMNIXiXtUWgCgCGzbwPQnuPacX7vHj8C9BTya7gh?=
 =?us-ascii?Q?KWk2PUyQM1CDLag2IvwOgGb77oOLe2AdGL66DALs8qIara1fHLLXKBv0OjwA?=
 =?us-ascii?Q?yUCkFMIku9tC6wsZb3e2fsfaYAaonu6PX9WCvW6XvSIkxNC0I67k+/xA+MZQ?=
 =?us-ascii?Q?pfQt4uVw7evmp2eEnjzj1t8x/cHC1grLO4HybihiMfp7IpxPnae9HnNqLdb1?=
 =?us-ascii?Q?LYLOaVNUyk6lJJeBOhlZL6mHVEJxNzAggEo8JMUAdQXzvLDCy0Duo20moVB9?=
 =?us-ascii?Q?MZvvDsWZ4NQZjP4TL+xqGtrrxQQiWn+tGnL3jlB3l1rwWGovb+YM9z1NCJZI?=
 =?us-ascii?Q?CgoA9UWUEtwFioZiFoyxK2huNIoa0hCwrtqCwY5m01B+kZSjptrYC8c+y1kl?=
 =?us-ascii?Q?TKhLKjPcrYV4NsQUjpbz3ekotD90d1fGTnyg6tyNG/xZepftGi9YZOxBsidR?=
 =?us-ascii?Q?4CYiGZGGtVUgf2TAtattK6qok0lwgoRA7dUYfG6eb9lv8eILpsPuLLl4FvNF?=
 =?us-ascii?Q?O8a0qlAfonGObyfrSNNay3bRM5X6ty17VuMXCw55mbC/f45CXXxLB9BrYb1t?=
 =?us-ascii?Q?cfYzJP0NGCOpsT3ch2YHKBggPMoYln12Y2IVvBefwsmtuqHlxsNfxZvOWIsO?=
 =?us-ascii?Q?BpBTeu0ssQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bda78ff-7fa1-4eb5-ad8f-08df45e4a7c9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:27:28.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95eurNdG/SlT5TDCsx/VAOKX81mwDG0R7uuIK8Krw+AC1WHJJrfzmR4bmk0QG3/5HPQU+TjZd78nnikyYSgIZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174

The Lenovo WMI drivers (events, helpers, capability data, GameZone,
Other Mode, hotkey utilities and camera button) contain no x86 specific
code: they talk to firmware through the ACPI-WMI core only. They live
under drivers/platform/x86 because that is where Lenovo drivers were
collected, and X86_PLATFORM_DEVICES keeps them off every other
architecture.

Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
same WMI GUIDs (the Fn key events, the mic mute LED method, GameZone and
Other Mode). Give these drivers an architecture independent home,
drivers/platform/lenovo, following the layout of drivers/platform/surface
which exists for the same reason, so they can be built wherever the WMI
core is available. ideapad-laptop, thinkpad_acpi, think-lmi, yogabook and
the Yoga Tablet drivers stay under x86: they depend on i8042, port I/O or
x86 only ACPI devices.

Pure code motion: the files, their Kconfig entries and the module naming
scheme are unchanged. MAINTAINERS entries are updated for the new paths.

Signed-off-by: David Cemin <dcemin@nvidia.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Jackie Dong <xy-jackie@139.com>
---
 MAINTAINERS                                   |  3 +-
 drivers/platform/Kconfig                      |  2 +
 drivers/platform/Makefile                     |  1 +
 drivers/platform/lenovo/Kconfig               | 87 +++++++++++++++++++
 drivers/platform/lenovo/Makefile              | 22 +++++
 .../platform/{x86 => }/lenovo/wmi-camera.c    |  0
 .../platform/{x86 => }/lenovo/wmi-capdata.c   |  0
 .../platform/{x86 => }/lenovo/wmi-capdata.h   |  0
 .../platform/{x86 => }/lenovo/wmi-events.c    |  0
 .../platform/{x86 => }/lenovo/wmi-events.h    |  0
 .../platform/{x86 => }/lenovo/wmi-gamezone.c  |  0
 .../platform/{x86 => }/lenovo/wmi-helpers.c   |  0
 .../platform/{x86 => }/lenovo/wmi-helpers.h   |  0
 .../{x86 => }/lenovo/wmi-hotkey-utilities.c   |  0
 drivers/platform/{x86 => }/lenovo/wmi-other.c |  0
 drivers/platform/x86/lenovo/Kconfig           | 67 --------------
 drivers/platform/x86/lenovo/Makefile          |  7 --
 17 files changed, 114 insertions(+), 75 deletions(-)
 create mode 100644 drivers/platform/lenovo/Kconfig
 create mode 100644 drivers/platform/lenovo/Makefile
 rename drivers/platform/{x86 => }/lenovo/wmi-camera.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-capdata.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-capdata.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-events.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-events.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-gamezone.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-helpers.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-helpers.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-hotkey-utilities.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-other.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 056408bc086e..3b0ad5a3debe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15170,13 +15170,14 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+F:	drivers/platform/lenovo/
 F:	drivers/platform/x86/lenovo/*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
+F:	drivers/platform/lenovo/wmi-hotkey-utilities.c
 
 LENOVO HID drivers
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..80b2b83b69e5 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -15,6 +15,8 @@ source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
 
+source "drivers/platform/lenovo/Kconfig"
+
 source "drivers/platform/x86/Kconfig"
 
 source "drivers/platform/arm64/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..0144f88ff6db 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
+obj-$(CONFIG_LENOVO_PLATFORMS)	+= lenovo/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
 obj-$(CONFIG_ACPI_WMI)		+= wmi/
diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/Kconfig
new file mode 100644
index 000000000000..8222322ca671
--- /dev/null
+++ b/drivers/platform/lenovo/Kconfig
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Lenovo Platform-Specific Drivers
+#
+
+menuconfig LENOVO_PLATFORMS
+	bool "Lenovo Platform-Specific Device Drivers"
+	depends on ARM64 || X86 || COMPILE_TEST
+	default y if ARM64 || X86
+	help
+	  Say Y here to get to see options for platform-specific device drivers
+	  for Lenovo devices that do not depend on the CPU architecture, such
+	  as the ACPI-WMI based drivers used on both x86 and arm64 laptops.
+	  This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if LENOVO_PLATFORMS
+
+config LENOVO_WMI_HELPERS
+	tristate
+	depends on ACPI_WMI
+
+config LENOVO_WMI_EVENTS
+	tristate
+	depends on ACPI_WMI
+
+config LENOVO_WMI_CAPDATA
+	tristate
+	depends on ACPI_WMI
+	depends on LENOVO_WMI_HELPERS
+
+config LENOVO_WMI_HOTKEY_UTILITIES
+	tristate "Lenovo Hotkey Utility WMI extras driver"
+	depends on ACPI_WMI
+	select NEW_LEDS
+	select LEDS_CLASS
+	imply IDEAPAD_LAPTOP
+	help
+	  This driver provides WMI support for Lenovo customized hotkeys function,
+	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
+	  Gaming, ThinkBook and so on.
+
+config LENOVO_WMI_CAMERA
+	tristate "Lenovo WMI Camera Button driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	help
+	  This driver provides support for Lenovo camera button. The Camera
+	  button is a GPIO device. This driver receives ACPI notifications when
+	  the camera button is switched on/off.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called lenovo-wmi-camera.
+
+config LENOVO_WMI_GAMEZONE
+	tristate "Lenovo GameZone WMI Driver"
+	depends on ACPI_WMI
+	depends on DMI
+	select ACPI_PLATFORM_PROFILE
+	select LENOVO_WMI_EVENTS
+	select LENOVO_WMI_HELPERS
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  platform-profile firmware interface to manage power usage.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-gamezone.
+
+config LENOVO_WMI_TUNING
+	tristate "Lenovo Other Mode WMI Driver"
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	select HWMON
+	select FW_ATTR_CLASS
+	select LENOVO_WMI_CAPDATA
+	select LENOVO_WMI_EVENTS
+	select LENOVO_WMI_HELPERS
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  firmware_attributes API to control various tunable settings typically exposed by
+	  Lenovo software in Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-other.
+
+endif # LENOVO_PLATFORMS
diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/Makefile
new file mode 100644
index 000000000000..1cac115dd735
--- /dev/null
+++ b/drivers/platform/lenovo/Makefile
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/lenovo
+# Lenovo Platform Specific Drivers (architecture independent)
+#
+
+lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
+lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
+lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
+lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
+lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
+lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
+lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
+
+# Add 'lenovo' prefix to each module listed in lenovo-target-*
+define LENOVO_OBJ_TARGET
+lenovo-$(1)-y := $(1).o
+obj-$(2) += lenovo-$(1).o
+endef
+
+$(foreach target, $(basename $(lenovo-target-y)), $(eval $(call LENOVO_OBJ_TARGET,$(target),y)))
+$(foreach target, $(basename $(lenovo-target-m)), $(eval $(call LENOVO_OBJ_TARGET,$(target),m)))
diff --git a/drivers/platform/x86/lenovo/wmi-camera.c b/drivers/platform/lenovo/wmi-camera.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-camera.c
rename to drivers/platform/lenovo/wmi-camera.c
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/lenovo/wmi-capdata.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-capdata.c
rename to drivers/platform/lenovo/wmi-capdata.c
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/lenovo/wmi-capdata.h
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-capdata.h
rename to drivers/platform/lenovo/wmi-capdata.h
diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/lenovo/wmi-events.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-events.c
rename to drivers/platform/lenovo/wmi-events.c
diff --git a/drivers/platform/x86/lenovo/wmi-events.h b/drivers/platform/lenovo/wmi-events.h
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-events.h
rename to drivers/platform/lenovo/wmi-events.h
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/lenovo/wmi-gamezone.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-gamezone.c
rename to drivers/platform/lenovo/wmi-gamezone.c
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/lenovo/wmi-helpers.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-helpers.c
rename to drivers/platform/lenovo/wmi-helpers.c
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform/lenovo/wmi-helpers.h
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-helpers.h
rename to drivers/platform/lenovo/wmi-helpers.h
diff --git a/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c b/drivers/platform/lenovo/wmi-hotkey-utilities.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
rename to drivers/platform/lenovo/wmi-hotkey-utilities.c
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/lenovo/wmi-other.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-other.c
rename to drivers/platform/lenovo/wmi-other.c
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index f16b09bab082..4d9a25d0e3b5 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -20,29 +20,6 @@ config IDEAPAD_LAPTOP
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
 
-config LENOVO_WMI_HOTKEY_UTILITIES
-	tristate "Lenovo Hotkey Utility WMI extras driver"
-	depends on ACPI_WMI
-	select NEW_LEDS
-	select LEDS_CLASS
-	imply IDEAPAD_LAPTOP
-	help
-	  This driver provides WMI support for Lenovo customized hotkeys function,
-	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
-	  Gaming, ThinkBook and so on.
-
-config LENOVO_WMI_CAMERA
-	tristate "Lenovo WMI Camera Button driver"
-	depends on ACPI_WMI
-	depends on INPUT
-	help
-	  This driver provides support for Lenovo camera button. The Camera
-	  button is a GPIO device. This driver receives ACPI notifications when
-	  the camera button is switched on/off.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called lenovo-wmi-camera.
-
 config LENOVO_YB9_KBDOCK
 	tristate "Lenovo Yoga Book 9 keyboard dock detection"
 	depends on ACPI_WMI
@@ -248,47 +225,3 @@ config YT2_1380
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-yogabook.
-
-config LENOVO_WMI_CAPDATA
-	tristate
-	depends on ACPI_WMI
-	depends on LENOVO_WMI_HELPERS
-
-config LENOVO_WMI_EVENTS
-	tristate
-	depends on ACPI_WMI
-
-config LENOVO_WMI_HELPERS
-	tristate
-	depends on ACPI_WMI
-
-config LENOVO_WMI_GAMEZONE
-	tristate "Lenovo GameZone WMI Driver"
-	depends on ACPI_WMI
-	depends on DMI
-	select ACPI_PLATFORM_PROFILE
-	select LENOVO_WMI_EVENTS
-	select LENOVO_WMI_HELPERS
-	help
-	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
-	  platform-profile firmware interface to manage power usage.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called lenovo-wmi-gamezone.
-
-config LENOVO_WMI_TUNING
-	tristate "Lenovo Other Mode WMI Driver"
-	depends on ACPI_WMI
-	depends on ACPI_BATTERY
-	select HWMON
-	select FW_ATTR_CLASS
-	select LENOVO_WMI_CAPDATA
-	select LENOVO_WMI_EVENTS
-	select LENOVO_WMI_HELPERS
-	help
-	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
-	  firmware_attributes API to control various tunable settings typically exposed by
-	  Lenovo software in Windows.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called lenovo-wmi-other.
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index 12816d8d5e24..758c36cedee8 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -7,17 +7,10 @@ obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
 obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 
-lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
 lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+= yb9-kbdock.o
 lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
 lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
 lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
-lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
-lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
-lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
-lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
-lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
-lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
 
 # Add 'lenovo' prefix to each module listed in lenovo-target-*
 define LENOVO_OBJ_TARGET
-- 
2.56.1

