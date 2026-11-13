Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794608896;
	b=WpO6tFu4HlpW2NO/meP+CsYZhLMK+4E+liIbmrenbdO8v4IqMCjQlUToP29T+IK4jMiB
	 qrhPXslIh/ozlZaxVW50XiSbBwsVwem4oKFvSE/qcwqDghyMkQR1z91H1wt150mFdVtam
	 Qh4GiSWEkD4X7k2GzPXXTIzi2ITk5M5CXleJ3B4ZbYXSvyRMpDXLQ17qG93uyqEfEMxx0
	 PNdG6RkOREd6B1Mh+lbYiE4fYGbl87rxbhaizPulsbrLpfVOSn904jAOEmebaNKKHyeyj
	 6JJsnLrN8IQqSLltA9IKAujUuLn4oy98khb2iBSw4x06bP+A4P2cw/RlgqJFc70ek3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608896;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=nFZw1Rb7+HAz7Pu4MeDel9LsaOzm7JMqXwYdd4mUqbU=;
	b=cl0A6KDejTlM9Y63NAEsprMoSmdO5Q7CkJ0H4g0h8+uBjKDcO5sUnxBqg/4gAFN6oOCt
	 a0UwdHMltPAqQDK70Hd5WnhzYOKXY3rSYR09awzk19h6gkXiulSylMDEt8rqqE0mQvaQT
	 s8gX2awWnacddbQjT/4lOcyH24xeciURKXFx480DszL+XlalMEJNo0BADHnDwuwVhaOKY
	 /PAqqQCGJqlTS6F60xmNujF9cfaD4AqbNKtjrWZWiad5PadpyW+7T+3Dh//0IH10HDaKU
	 9AH2OzRgUk4FZGthCYy3zl2OgSKBEfYkAFn6p9GpeohoB0zGNLiRLIvxU0e8BcD7urQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M9XMQOG3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.39
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F82606A8BA;
	Fri, 13 Nov 2026 22:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F82606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M9XMQOG3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUqG26DpC2MOa8vOlEPh3RmkBwo1noE1PDu+iXP+BjfSGvyEdizuYsq3tj5Q8md068oaTAJzU703S8gZ3JFfbUMqcOC4A4D+xJguJPXEoRz+t0j39Jsy/xfIuVG29WjGiE/C3V8QdfcKgt26SQjj9QOZUOjAUksN358Lq3IBQpDhzQsUfPFXMnthPOhlb+mBWSRRENrO2Nqnbc6Rft+PjgxRvsqD4mMZPfF3T8fa2Cv0GwxiEM4yztcv3i+2FbItgCuMIYpZvLxZJajLs/XSDirByxNJ4jvlqcMnHDmRhHmFl682nMS4ErEhkQJOtaLFyr8JdE8eXQPHfixWKJI+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFZw1Rb7+HAz7Pu4MeDel9LsaOzm7JMqXwYdd4mUqbU=;
 b=yFaRHEJvnMyGfHzvSJGf5SKedUbJbafv8ARVxQ3Ph+XHGY4+XV0j/ps5bMVmI2r4PXMHE/nToy7dkb4JvdnYtLAk6axgyaAB/kqtdw8WtcuMampDI1y3/wbuQyQcdswQbfdX+kahGLk3ptC16Zed5bH1nQlLiOlYmRW7xdfLYHDEwtrC0TVrLnlt5yvzfKRlNLDnZtuv2R/ohcxyml2A1VgabUpJB+kh5vzTJaxmT8k3iU3Vh8C2BZlOHsfz61l8A5HNiC6MNBd4gEIR+fWIaJv3+4c3IJFv84oKCpE27QBdd6/aUeEJ32VwX/Kp/m4Wh7rGrc80CtjyoSdJnZl+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFZw1Rb7+HAz7Pu4MeDel9LsaOzm7JMqXwYdd4mUqbU=;
 b=M9XMQOG3Q2ULc4u9hGtqwuW2QHVIk3iM23aW9z+SjECSILq47nxSfqhhWCpCv2VnwZmvjN6Cabek+k3HEuZM6rtnEWNYdxwiixH4C9Zh9pyL6SSKMunS5APeOPR0JqIa//xtH371/f/l9iekMgxG1T6WKSj+U6cDEpFgehLltDfjm+OZ9mFeqZNvWghdkAEu9/su8Gu/BjyLq0HLCsjm6+PIjoh9elcs7rnSziCZ82CBidyT/u8FJC97GU/dqbVU/tspyio33vDv2rgfPIZFMjBv84jFayi7/M+c4DrcD7qg0/nU8XZEmwS1ZN/uhTeu+KUaip0OjvTBJjHTPqz65w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by IA3PR12MB660778.namprd12.prod.outlook.com (2603:10b6:208:61d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 22:28:04 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 22:28:04 +0000
From: David Cemin <dcemin@nvidia.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	xy-jackie@139.com,
	ikepanhc@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldemarchi@nvidia.com
Subject: [RFC PATCH 2/3] platform: lenovo: add WMI hotkeys driver
Date: Fri, 13 Nov 2026 14:27:54 -0800
Message-ID: <20261113222755.1696567-3-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113222755.1696567-1-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:a03:333::9) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|IA3PR12MB660778:EE_
X-MS-Office365-Filtering-Correlation-Id: 972588c4-3a9c-4b26-921c-08df41d5625c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|261009223027099003|11063799006|10067099003|56012099006|261022075727099003|261021123027099003|261102123227099003|261028144727099003|261021121427099003|261022113327099003|261026121527099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
 0o+OGWnO98oXV5kaOw6bwNnurd034Yra6+dWRZHsekqbkPvLBLRqHyuk2RU2IYK1rQg8QGUPJyURQ5vkr1h+I2ejnYzCmqtM5Y0HFlMEsJASq0EWh9kGjWdNVb9gjrF1tLZWpeVCwCtANBGrseu90QmS4f/tAoweQflJ7IHHPwrUAC1BKlXMyTmcmMfWvf13AZ43qOZ5zGX1sgcSoQhFy3NvtCVO4YhEOx8EbjlrvFRa8YFY40EKyPaANHbq3V52OUEq6QlqVa8RqUuAhQsUX3V6nqzPwiw+YkHutyifFczzuirYOh+SQLA9pgeulg8+Cipj1ri/LIxRjfC9qmQlKWa6oVHlPlNi2vF1HHCwAFf/vtdHSY6FfVouasJNw8ZA6U5Ve0MmRmDlllFdipf51pFKCWZtktrymMm4m19tL+akY/1cecKQJySG7Mvd/yBxTEibSrW8pbQKMvp6eRBFQnCE5RmMsHwKQBZ2tcNrdMrVj/FJgpqokpgDLqkBL86T6tIdSMuIcwLIZmoiuPrTzI1LE9kP0MRoL0e9TXydHVH76vCHQLR5c4tvql37vsLYRJKWB06q+fRIpoY+fGTLLaSeH2AVKjkJNrIiJEpgfS4dIJl9KizWTN7jJA/JSZ05EUv20IhTGBUljtjT4yIxLLVFckX1TuOSC9F3g1uAXF0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(10067099003)(56012099006)(261022075727099003)(261021123027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022113327099003)(261026121527099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?sM7z3cirvb6NE9cJ4fhn07ZOSQnUsbBnCd4UK8UIRyVEyAuKWsutmplpjHq+?=
 =?us-ascii?Q?4YvUAtlGjVTiZu646ZUDDAcI5093xpH4wrV3RCo21FvXAV3iQX4mqCWQVBeX?=
 =?us-ascii?Q?+IgxTVx8RZRJGiR6u8fXQwL7LKcwKJvzpB7xj/fsLFoNFGBxWrnofJz2Ve/V?=
 =?us-ascii?Q?WFCXMro42w2+VnbeJPh3ssDOOK7MlrzHOfBzJuf2YoPFYAz4C6qTSpUoZipo?=
 =?us-ascii?Q?EJ9B4s8FSdVUFynwLcKi1WaEvY8n8qI71Cfi+NfIIh5r9YF9jGIgshJ6yXXO?=
 =?us-ascii?Q?vXGcPnrRWaiMQQEYRyu3Z2aR6f2N/VjikuNEkNcOAnYeMNl0eplYPLc828Ui?=
 =?us-ascii?Q?OXMFI+81xrXAqrGU+LTnw3Fik6FSbwxCUdBQ/HkAQpVKSi0kqqxj63Tq+FGd?=
 =?us-ascii?Q?+V/tGqY/EpmH03M+ifrmPMUQ91R9ZTBQq1F26Cko89v0vT2vQieDQPBShBrH?=
 =?us-ascii?Q?6LP1/CuecXLgvpIC/z48PEJl9pWDrG3DsIswhPN/M2FHXplaHjeZMmsuxQ7j?=
 =?us-ascii?Q?B954VKxmXkhmonhn5X7hqSv0kjh2xyxcO98GbNJCzv+bwPj0VnZq+okJbslN?=
 =?us-ascii?Q?kXXOUt3RcFHKhAqvyG2PLrBUwYfCHafQKGJn5swQ7K6Q4/rI7FGtJ46zBXaA?=
 =?us-ascii?Q?Eh998+eJ49UJLtyxwiIyKyoZvYVrFeVOcr6hHwea7xU85amcADUFKnZgoXl/?=
 =?us-ascii?Q?p+Ktm6WvJ04+0SRMpfJcUVTmltTHUL3bNHNvkU6uTaWbhIy7HY+XbEplk8q+?=
 =?us-ascii?Q?91K5y6iwxl1VMvZTd0TmQRQZo07Q/UcSR1aFa6P/o+qRPStaqvaPeSbjZUD6?=
 =?us-ascii?Q?9lf99u3wqpfGg5Gko0VlhNrJkkaHzTIRotdEw2dkStXxumRtvSpaS4pAYufR?=
 =?us-ascii?Q?/M8R+A6rG35OIgbWaYuT2/MXoQibsEa8Q//AwIK6c2EVFfifBer7S92n0phG?=
 =?us-ascii?Q?OxQn4IYcpgx+s5Ukh1hEGJyljI9fRn3Rml9AVxTw77Omuh6+SJ9vgkIjPZhF?=
 =?us-ascii?Q?lHt36tA/DnLZqfTvvY7/MvASFgTVAqzXXHEy5HYtJI/k7fSVlUKD61sZsiJ1?=
 =?us-ascii?Q?HBApaXtjx5bkbUGSF9tEeASCJXvK3jSn7eaMLheYY33H1HoA8mWH9IhzGbKl?=
 =?us-ascii?Q?FWM+3pAPLUngV/Ytbmj5I7/0pFN0Z0OEkEJkxf9S8oh+o8nYvZgVdAa9DRAk?=
 =?us-ascii?Q?hF1/UbL19r9WzikXmRHZsHJohdJj8BTIijLfWjY23cy6vrXQe3BOwSGJ+RWM?=
 =?us-ascii?Q?KkXPBdDhLOyyJfRBhxYxVXExPrH8XljdbyQ1IW76PKf7e4slGNLVI+LbH2+L?=
 =?us-ascii?Q?9QiCnKj7RLFP/oUMW3z6jaKJ5M6JGvt8Ih9UIu/mfConPVy7oQTbZxGg1S7i?=
 =?us-ascii?Q?yvlwuLovnmSnCPf9gUso/Pnw5y+glXW970Zl4aY4fxP8oJ9DSLH9/dL1bayp?=
 =?us-ascii?Q?01O2k4S/XfqblKPbUtkC7NpLOVEC5dMMz38UsrDGGWhQG7Pb2/6xUq3H/9sI?=
 =?us-ascii?Q?mhQaBn/vZLYlrG3sUdd39CyeKJpeAD3w6+e4ZbMIYxVnwuXJT2shoUn1oknt?=
 =?us-ascii?Q?KvVVYZD24qKFFyAHwCiyhU4xeC7r+hvKUy3LOWEfAhr+XUPj9SBraBNbnM8F?=
 =?us-ascii?Q?iUyOTKA0YiUNc9BJBzPwCxsUVHBgmX6QD4a/VcdGnkf1zHSqdqsyWsUF+7iY?=
 =?us-ascii?Q?80b1voLWLIcL0VZHQsqEgEhooQMY8iLWXlKs2YGclB+E9ABG5eYbtKvg5cQe?=
 =?us-ascii?Q?HD9J/JqkkA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 972588c4-3a9c-4b26-921c-08df41d5625c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:28:04.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbKElaP3KeYO4TehXe2ZuA6lCCHeiQeT3fUUWtULJBPxGG2LlYoA8DvyH502T5O4azdU0dpPqCWOz/gBewxZVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB660778
X-OriginatorOrg: Nvidia.com

Lenovo consumer laptops deliver their vendor specific Fn keys (microphone
mute, airplane mode, performance mode, the Smart Key and Smart Connect
keys) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 instead
of keyboard usages. On x86, ideapad-laptop consumes these events, but it
depends on i8042 and on the IdeaPad VPC ACPI device, neither of which
exist on the ACPI based arm64 models. Add a small WMI driver that reports
the same key codes through a sparse keymap, so desktops see the generic
input events.

The key map follows ideapad-laptop. One code seen on the Yoga 9 2-in-1
16 (arm64) is new: 0x48 for the Smart Connect key.

Both drivers match the same GUID. The probe declines when the IdeaPad
VPC device (VPC2004) is present, so machines handled by ideapad-laptop,
including its Fn lock LED and DYTC performance mode handling, keep that
driver.

Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 MAINTAINERS                           |   6 +
 drivers/platform/lenovo/Kconfig       |  14 +++
 drivers/platform/lenovo/Makefile      |   1 +
 drivers/platform/lenovo/wmi-hotkeys.c | 151 ++++++++++++++++++++++++++
 4 files changed, 172 insertions(+)
 create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b0ad5a3debe..207684aeaf69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15173,6 +15173,12 @@ F:	Documentation/wmi/devices/lenovo-wmi-other.rst
 F:	drivers/platform/lenovo/
 F:	drivers/platform/x86/lenovo/*
 
+LENOVO WMI HOTKEYS DRIVER
+M:	David Cemin <dcemin@nvidia.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/lenovo/wmi-hotkeys.c
+
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/Kconfig
index 8222322ca671..ba4248d56e5f 100644
--- a/drivers/platform/lenovo/Kconfig
+++ b/drivers/platform/lenovo/Kconfig
@@ -41,6 +41,20 @@ config LENOVO_WMI_HOTKEY_UTILITIES
 	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
 	  Gaming, ThinkBook and so on.
 
+config LENOVO_WMI_HOTKEYS
+	tristate "Lenovo WMI hotkeys driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  Say Y or M here to enable the vendor specific Fn keys (microphone
+	  mute, airplane mode, performance mode, star key) on Lenovo laptops
+	  that deliver them as WMI events and are not handled by the
+	  ideapad-laptop driver, such as the ACPI based arm64 models.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-hotkeys.
+
 config LENOVO_WMI_CAMERA
 	tristate "Lenovo WMI Camera Button driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/Makefile
index 1cac115dd735..d3f5e3ac14c2 100644
--- a/drivers/platform/lenovo/Makefile
+++ b/drivers/platform/lenovo/Makefile
@@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
 lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
 lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
+lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEYS)	+= wmi-hotkeys.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
 lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
 lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
diff --git a/drivers/platform/lenovo/wmi-hotkeys.c b/drivers/platform/lenovo/wmi-hotkeys.c
new file mode 100644
index 000000000000..fc18867d8144
--- /dev/null
+++ b/drivers/platform/lenovo/wmi-hotkeys.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Lenovo WMI hotkey driver
+ *
+ * Lenovo consumer laptops deliver their vendor specific Fn keys (microphone
+ * mute, airplane mode, performance mode, the star key and others) as WMI
+ * events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 instead of keyboard
+ * usages.  On x86 ideapad-laptop consumes these events; that driver depends
+ * on i8042 and the IdeaPad VPC device, neither of which exist on the arm64
+ * platforms.  This driver consumes the same event and reports the keys the
+ * same way, so desktops see the usual generic key codes.
+ *
+ * The key codes follow the mapping used by ideapad-laptop.
+ */
+
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#define LENOVO_FN_KEYS_WMI_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
+
+static const struct key_entry lenovo_wmi_hotkeys_keymap[] = {
+	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
+	{ KE_KEY, 0x01, { KEY_FAVORITES } },
+	/* Fn lock toggled on / off, firmware handles the LED */
+	{ KE_IGNORE, 0x02 },
+	{ KE_IGNORE, 0x03 },
+	{ KE_KEY, 0x04, { KEY_SELECTIVE_SCREENSHOT } },
+	/* Lenovo Support */
+	{ KE_KEY, 0x07, { KEY_HELP } },
+	{ KE_KEY, 0x0a, { KEY_REFRESH_RATE_TOGGLE } },
+	{ KE_KEY, 0x0e, { KEY_PICKUP_PHONE } },
+	{ KE_KEY, 0x0f, { KEY_HANGUP_PHONE } },
+	{ KE_KEY, 0x10, { KEY_REFRESH_RATE_TOGGLE } },
+	/* Sound profile switch */
+	{ KE_KEY, 0x12, { KEY_PROG2 } },
+	/* Dark mode toggle */
+	{ KE_KEY, 0x13, { KEY_PROG1 } },
+	/* Lenovo Support */
+	{ KE_KEY, 0x27, { KEY_HELP } },
+	/* Lenovo Virtual Background application */
+	{ KE_KEY, 0x28, { KEY_PROG3 } },
+	{ KE_KEY, 0x29, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY, 0x2a, { KEY_ROOT_MENU } },
+	/* Shift + PrtSc */
+	{ KE_KEY, 0x2d, { KEY_SELECTIVE_SCREENSHOT } },
+	/* Performance mode, Fn+Q */
+	{ KE_KEY, 0x3d, { KEY_PROG4 } },
+	{ KE_KEY, 0x3e, { KEY_MICMUTE } },
+	{ KE_KEY, 0x3f, { KEY_RFKILL } },
+	/*
+	 * Keyboard backlight level after Fn+Space, handled by the firmware:
+	 * 0x40 off, 0x41 low, 0x42 high, 0x43 also seen
+	 */
+	{ KE_IGNORE, 0x40 },
+	{ KE_IGNORE, 0x41 },
+	{ KE_IGNORE, 0x42 },
+	{ KE_IGNORE, 0x43 },
+	/* Star, user assignable key */
+	{ KE_KEY, 0x44, { KEY_PROG1 } },
+	/* Eye care */
+	{ KE_KEY, 0x45, { KEY_PROG3 } },
+	/* Smart Connect, phone to PC link */
+	{ KE_KEY, 0x48, { KEY_PROG2 } },
+	{ KE_END },
+};
+
+struct lenovo_wmi_hotkeys {
+	struct input_dev *input;
+};
+
+static int lenovo_wmi_hotkeys_probe(struct wmi_device *wdev, const void *context)
+{
+	struct lenovo_wmi_hotkeys *priv;
+	int ret;
+
+	/*
+	 * ideapad-laptop binds the same GUID and handles these events together
+	 * with the IdeaPad VPC device (Fn lock LED, DYTC performance mode
+	 * cycling).  Leave those machines to it.
+	 */
+	if (acpi_dev_found("VPC2004")) {
+		dev_dbg(&wdev->dev, "IdeaPad VPC present, deferring to ideapad-laptop\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->input = devm_input_allocate_device(&wdev->dev);
+	if (!priv->input)
+		return -ENOMEM;
+
+	priv->input->name = "Lenovo WMI hotkeys";
+	priv->input->phys = "wmi/input0";
+	priv->input->id.bustype = BUS_HOST;
+	priv->input->dev.parent = &wdev->dev;
+
+	ret = sparse_keymap_setup(priv->input, lenovo_wmi_hotkeys_keymap, NULL);
+	if (ret)
+		return ret;
+
+	ret = input_register_device(priv->input);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(&wdev->dev, priv);
+
+	return 0;
+}
+
+static void lenovo_wmi_hotkeys_notify(struct wmi_device *wdev, union acpi_object *data)
+{
+	struct lenovo_wmi_hotkeys *priv = dev_get_drvdata(&wdev->dev);
+	u32 code;
+
+	if (!data || data->type != ACPI_TYPE_INTEGER) {
+		dev_dbg(&wdev->dev, "event data is not an integer\n");
+		return;
+	}
+
+	code = data->integer.value;
+	dev_dbg(&wdev->dev, "hotkey event 0x%x\n", code);
+
+	if (!sparse_keymap_report_event(priv->input, code, 1, true))
+		dev_info_ratelimited(&wdev->dev, "unknown hotkey event 0x%x\n", code);
+}
+
+static const struct wmi_device_id lenovo_wmi_hotkeys_id_table[] = {
+	{ LENOVO_FN_KEYS_WMI_GUID, NULL },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, lenovo_wmi_hotkeys_id_table);
+
+static struct wmi_driver lenovo_wmi_hotkeys_driver = {
+	.driver = {
+		.name = "lenovo-wmi-hotkeys",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = lenovo_wmi_hotkeys_id_table,
+	.probe = lenovo_wmi_hotkeys_probe,
+	.notify = lenovo_wmi_hotkeys_notify,
+	.no_singleton = true,
+};
+module_wmi_driver(lenovo_wmi_hotkeys_driver);
+
+MODULE_DESCRIPTION("Lenovo WMI hotkey driver");
+MODULE_LICENSE("GPL");
-- 
2.56.1

