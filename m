Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794608888;
	b=42Gh0NV56pE/FYGL+SjEuKn8rryqLIO2ggOxDO5IWxRWs8NHOM2Py2BU81P9i6alLf1L
	 rQqg3rFJCjGT6VKJQgbjHrNHI5+bCeBKUpURM5PtLDZwAnjr0chZdewKF9gJeI+/lzYP+
	 8IW9O/+GG0JcQTk8IpqlTwdCbk4C4hHk+hTbP7jsA8MRM57BfxVW6QQG+5LFTnxOCt4IC
	 dfMoioLSLx9Hjz9WmJ/r6Day5bPGgfrX4v2jlOguFNtBtlUMIWVSPxLkD5MN8njvbzcIO
	 LjnbrVKusuFxBrRMDNeQH5BX1EU3PlPig5HF0EMBjsH6DJs17+KhA9pL/9yF8V6v2ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608888;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=RqIEWjfG4J6PmmibRxaZso0rmJQgfGOK0OLkrIkYtvI=;
	b=CNkmlwl+VqP5c9FYS5UTNdqSyVYF83465i97ZZUN9IRpB8wgUU3E5ZyBcNBFb4U7AJa0
	 pBst1fb9cJffqq+MAzA5Ezf5/mpgExqu5M7Od6iEkwShOaJefK3cloPuplRhGUVWSUWf+
	 0PZg47PT3C89rSiwlxmWykgyeTLjrgOPb7oiu1Z8kN6UUVPAq+B48hubErOrP4ZJ4cxbk
	 brygY6nnEhm1CtexG/p2OOhkauq59eYYj9V3nD4lWIkjNoPPzAerYF5fe/vWc98UyA6U+
	 ZDl6HBcSeoSES1FzJlXLiGbBYeDIA9AX8Oa4xeaLp7yMf0+5p7YhJYOOIn4knHPl/Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HGXFYVZD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.29
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA515606A88E;
	Fri, 13 Nov 2026 22:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA515606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HGXFYVZD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOm+F2jaT3S3XnctW+dPVcuo+nB4XyL+RsHXGTzalf16LWbazw33LqbYvaHDfimk2SyZh1/erk9z/Q89pMaeBXSS5ttNIBek35Y08OV4Q2R7AxO0QYGDYe6Ra0bMTpgLuMs/r1VA4oMdAzdBhSHyt7v6CuYExgrvsZxGCNB3RrsYYBA5T1GWVn/5u4pvQWhcd/9dXqbdjHBVqJyYnCwIth3AZ44FUL3KuSmQi2xGdV1B6Lf2yyRSEdb+eer4EAOOLk09pRNdxt7ASI0Ymp4YtRALzyhoutdn5yZhW9NmG7Mh1+vHhHmJdm0Kmks98k1ET+CWvb2vywaNjddCrkPenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqIEWjfG4J6PmmibRxaZso0rmJQgfGOK0OLkrIkYtvI=;
 b=fa71gLDeARGvWw2P+7I/qAVWRTTNZaDHoP0eKcwlqjoqb/RaZecPVAVp2cTYIEs47J1md+ytFPUwZl4RqUjRxMq5mkSggmpVflWDVC/rNoJB3X12NXHbX8m0+hDThnFjLh/sOUf9VapXt1Hg05dI/Ar+gcsKd6fUB9G53kYvIpPlqYXeifK+dcMBSlqjnBiBh+UeMfZL+UMW1vmD+/14hT09ULjPTtyTLT9rf2728h3CFiGb7q6JsfUW2N6Vufm+fCL+jrt5BOcbum8ILvMG3yXjbsy7DM8LZ+mCOLtALdXR/VhOPrWcSWYJ1ARXdCUWzP2A7GUCmbxPs8vHJovARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqIEWjfG4J6PmmibRxaZso0rmJQgfGOK0OLkrIkYtvI=;
 b=HGXFYVZDWpTpYDQhsx9MJISati8Sf0cuji0+0b3YUhYkeFJMolq8wdvnaFD4ykV7sJEGyp1koBcM6W9jSx5bGi/t+SeoJoTTxZMrfJxSL511eylhrT+T7B675eupFDTfawNM9X5AYlm+Jxd5HQd9fN7JucGQTxBUMvdaN7NPUEjzLm/ms0rH1Kdwh7MlGk+nJ4hRqdhLFdyquGEBnBNhhj8gVJZ+sM4nIW+jX1HkmesTcRy7BCewY8y6HIQYhk6zKhKHXn6NNGI9/ucdWwML74xX21LHeYBEqy3Ou2mYQMofSuyBqHEO8k8xrDgQ23V4XoNtfg8/G8U0T0NU4dznew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by IA3PR12MB660778.namprd12.prod.outlook.com (2603:10b6:208:61d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 22:28:01 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 22:28:01 +0000
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
Subject: [RFC PATCH 0/3] platform: lenovo: architecture independent home for the Lenovo WMI drivers
Date: Fri, 13 Nov 2026 14:27:52 -0800
Message-ID: <20261113222755.1696567-1-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 2238761d-a862-4d03-f8a7-08df41d5606a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|6133799003|261009223027099003|11063799006|10067099003|56012099006|261022075727099003|261021123027099003|261102123227099003|261102130727099003|261028144727099003|261021121427099003|261026121527099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
 AW+C4mQoXNBYt2o7sYaKD7tCDve0EKaVdYoxY7hmU5pfX3AM68DdhGAMmgSBed0dxxMGWj7zHajSQgb/qZDI7YCFnu7Xes7Dc0tzo4XudrTmdIRRycM+myXyV3WNUT7AtrwkHn3bF9QTt7Xhljtc4dUDobmk9j6KDRaGzYb1ODqrOaqqRGOUi34xX7eQhGjyktBTyOS2771njb8wz+LGBy5ipAls9FYLXVsCxMh4giTw/wYo53ActtZOIBvStfveGM0hkk9EkrLcu7j+WxbUjN+bI5bMgHtZMBaNosE/1F4SHC0/3w6AK859ok26613tc/8Of5DmtHqwPwbUXUqF+k/EBUzCRAomfg42rcCHTD6niOwIHcaQUVCP3HhDsZfehFvCTH4B/lw7bJ2CoFw1WB/apiEBOmBsGfjVqvBYysY1eFF8AZOxOOa5ZotkBQTjALhF1kTD5SvTaAE9/grKh90QZs1639gCf64A5XFC8YrW1xz3AKUoJ7Bos2PKd1yOWhrcBuuArmQxiC3YmDsWgg0iosoNwWhOtZNIy/IJum/eEwE5e/cAcT3A/GY0Y49bVIaGC+nx5QzBtnHIvytMROMhuwL2A4SEyUkwBfkoIhPOfrnORKLF3nNTpb47fSdgoREvg+qU2bMnTjIeZc3OjC/Na8cTntHF5TmfRwR7hD8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(6133799003)(261009223027099003)(11063799006)(10067099003)(56012099006)(261022075727099003)(261021123027099003)(261102123227099003)(261102130727099003)(261028144727099003)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4ftU+UnfmgI1hIq1BeEwb0RK6Ffeh1rMbrh+XWBpxbEhL6G1DfePZ41SYk/f?=
 =?us-ascii?Q?Sxtk2VZCb8DtsnVGmJP9IcD7ax3f6U2j160e/UGe/fRg70I4yviH2Dk79uZN?=
 =?us-ascii?Q?k7WUz9cJmj5Ru85k0Wp4pzKxxiyX+L8RXWGbQB+jkA0VjwEcWXhNtR7bcCW+?=
 =?us-ascii?Q?E9nIbEW+hQWgtY50pD0wPxkUaa1/9c5QUWwd6glKKVmIfct4s9De3Y+z5x80?=
 =?us-ascii?Q?GNrMxBaT/jzxBvR/36hoegPBotCFuRsjtRvxBxEfMX6lIAiurddzZqb8E/6w?=
 =?us-ascii?Q?J+Pt3xwh4sk6hXQgK/0O34VV2vwgHoRKwnEgl2HyHYjZGGbI9DJKywQ11OIS?=
 =?us-ascii?Q?QM/cYLyK7FekD1JJ8R9nFJAPWknpKXCn708/RuddGo7Euor87UVWrbUWJZJe?=
 =?us-ascii?Q?Iu18J+zhcU3QNEdZ9UO+mBoVEvq0lTnrsYyWErlfA0X7Gp/EggGxCD7eMr4e?=
 =?us-ascii?Q?TsYz0tmx4rXqYzOH9Iz1y2gvhRqLswfvDh7YEYEGFn0pRYIj8kXhAuS7wqyZ?=
 =?us-ascii?Q?W+Kf6dSwyyWFFETbdYRcPn7J3EzspMYefYbIrnIG+sfT4EMyHYiQC7cDjS7j?=
 =?us-ascii?Q?5psvOKcAowPd4rypeuHmqjjGWgvkrmQZEmHS0+UC4KvdSAVn7klCCGBicbaF?=
 =?us-ascii?Q?ZzuR51v0MbOWr6cv4zyhuPtno53O+BbED/GI9dZKUDKG1Ef9LBRHN//vtL3a?=
 =?us-ascii?Q?09MalL7Sa+lzv/HGy32EyTKL70cKfc2dzXDHsLorCzmr3yg1yiRrTruigIQO?=
 =?us-ascii?Q?op8UFbD/Ytn0mqjIP+JlLeEJBFJ/c1VJS7xi0jaSBKtulWF1Tp9MsX5dE1TX?=
 =?us-ascii?Q?PVm6MWdfUrUwrK/a4hMvQgoyzm8hFWFj/NTwtRUBBCqMUki2tazBwx7z699n?=
 =?us-ascii?Q?TRVBIujwWMmZof2b5ZXvuReGQlShXr04B0g9lKEjx1YvPitmnONqX1pDwynA?=
 =?us-ascii?Q?ETSLPFTPTbVylz9uRHLJmhc/RiemWs2D6r4ePz25Fu3xGC9MOoPRPboQXnfg?=
 =?us-ascii?Q?9vPIiTb7VZxdo4o1uYBax9kQfzgP4AddVf+dBA9WfTG84y/nnfMANes6Gy2o?=
 =?us-ascii?Q?7DnSUiAcxLsO/XSHPA9KrC7fhTsBmBZPMpAzMXPnlNzCMRBd2Xj4RRZgu5jb?=
 =?us-ascii?Q?RaKcQABMbo8x90QCca9lD9wklgQweKD/4zK8U7YoPGbVoblVyuJb8F/UxXdm?=
 =?us-ascii?Q?/2tXLwt7LaTJEo4ibHF7msuj4hv9t3sZsc3dOgwiJB+lVTbTWkSjEV1w0YWk?=
 =?us-ascii?Q?h2F3e+YajE+187fFztG3qKvbZG6RZZEKBlpTT9wevVTNxox3ymjssIZIKPm3?=
 =?us-ascii?Q?L+tP8pBA2SXD62WNnBV+n7IhMyuW62UM6MSjnbqSOhjWq1oephzhhDWv0Brs?=
 =?us-ascii?Q?VQMAt5u6WX4f/zqYfPWMoHAPrWMXbUAljBwrGCMURRRohhrjTsnd+/91usx8?=
 =?us-ascii?Q?W3ipxAvqPOXTMBXTd4uOn6ru4D+U8mtVkOkf4zgegB+zO9W2EfA/ui2ogf3/?=
 =?us-ascii?Q?C9oBtVWZdmpH0wkRrfAgiGlqT/jmL/jHH0NYANvt9GKUOQYyzaTz1WIlAAcj?=
 =?us-ascii?Q?xwQJ465MmSTn0WPvrEEUdxdlw3hM9MjVEu88hSehXuD6mM4PWlhjV0IDcbDI?=
 =?us-ascii?Q?yC5Iosr5zyNz1yh5zOirWMMsamsocsAjgg2zpozBId+j4uN51g6QJkDtr7W0?=
 =?us-ascii?Q?gsJKtAyjoftJT3Neg7WIpBrMlOO/Wa7xh9bsIJIkBHxy87VuK2az91LypF6C?=
 =?us-ascii?Q?bd2qiDbm/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2238761d-a862-4d03-f8a7-08df41d5606a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:28:01.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPTyRlVsdoIUixk114R/LEme/OCd6Pw6I+zR6SGdVa+6d0pkP+2URyq0HiE/XzAsEmBOSmm9lQ5gAIM8KfExmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB660778
X-OriginatorOrg: Nvidia.com

Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
same ACPI-WMI interfaces as the x86 IdeaPad and Legion machines: the Fn
key event GUID consumed by ideapad-laptop, the hotkey utility GUID used
for the microphone mute LED, and the GameZone, Other Mode and capability
data GUIDs behind the thermal operation modes. Since 884d53763d30
("platform/wmi: Remove dependency on CONFIG_X86") the ACPI-WMI core
builds on arm64, but the Lenovo WMI drivers still live under
drivers/platform/x86, which is gated by X86_PLATFORM_DEVICES, so none of
that code can be used where the firmware is.

This series:
  1. moves the architecture independent Lenovo WMI drivers into a new
     drivers/platform/lenovo directory, following drivers/platform/surface
     which exists for the same reason (Surface ships x86 and arm64);
     ideapad-laptop, thinkpad_acpi, think-lmi and the Yoga tablet drivers
     stay under x86 because they need i8042, port I/O or x86 only devices;
  2. adds a small WMI hotkeys driver for the Fn key event GUID on machines
     where ideapad-laptop cannot bind;
  3. makes ideapad-laptop's own WMI event driver decline the GUIDs when
     the IdeaPad VPC device is absent, since it can never report events
     there.

Patch 2 was tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone
mute, airplane mode, the Smart Key, the Smart Connect key and the Fn+Q
operation mode key all report input events. The same key set is dead on
a Lenovo Yoga Pro 9 (arm64) today and uses the same GUID.
Patches 1 and 3 are compile tested on x86_64 and arm64 (defconfig plus
all LENOVO_WMI options as modules).

Two questions I would like the maintainers' view on before this goes
further:

  a. Is a vendor directory (drivers/platform/lenovo, like surface) the
     right home, or should the architecture independent Lenovo WMI
     drivers move under drivers/platform/wmi next to the core instead?
  b. Should the Fn key event handling stay a separate small driver, or
     be factored out of ideapad-laptop so x86 and arm64 share one path?
     ideapad-laptop handles the event only when its VPC platform driver
     is bound, and the arm64 machines expose none of the VPC interface
     it is built on (no _CFG, VPCR/VPCW, DYTC or HALS/SALS), so making
     it the single driver means gating most of its probe. Two smaller
     options: lift ideapad-laptop's own Fn key wmi_driver and keymap
     into this file and let ideapad-laptop register for the events it
     still wants (Fn lock LED, DYTC cycle), or the hid-asus/asus-wmi
     shape where a companion WMI module exports the event to a
     subsystem driver. The keymap in patch 2 duplicates entries of
     ideapad-laptop's table on purpose until that is decided.

Patch 2 declines to bind when the IdeaPad VPC device (VPC2004) is
present, so machines handled by ideapad-laptop keep it; patch 3 is the
mirror on the ideapad-laptop side. The new MAINTAINERS entry uses
platform-driver-x86, the list that already covers drivers/platform/arm64,
the ACPI-WMI core and the other Lenovo WMI drivers.


David Cemin (3):
  platform: lenovo: move the architecture independent WMI drivers out of
    x86
  platform: lenovo: add WMI hotkeys driver
  platform/x86: ideapad-laptop: do not bind the WMI event devices
    without the VPC

 MAINTAINERS                                   |   9 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/lenovo/Kconfig               | 101 ++++++++++++
 drivers/platform/lenovo/Makefile              |  23 +++
 .../platform/{x86 => }/lenovo/wmi-camera.c    |   0
 .../platform/{x86 => }/lenovo/wmi-capdata.c   |   0
 .../platform/{x86 => }/lenovo/wmi-capdata.h   |   0
 .../platform/{x86 => }/lenovo/wmi-events.c    |   0
 .../platform/{x86 => }/lenovo/wmi-events.h    |   0
 .../platform/{x86 => }/lenovo/wmi-gamezone.c  |   0
 .../platform/{x86 => }/lenovo/wmi-helpers.c   |   0
 .../platform/{x86 => }/lenovo/wmi-helpers.h   |   0
 .../{x86 => }/lenovo/wmi-hotkey-utilities.c   |   0
 drivers/platform/lenovo/wmi-hotkeys.c         | 151 ++++++++++++++++++
 drivers/platform/{x86 => }/lenovo/wmi-other.c |   0
 drivers/platform/x86/lenovo/Kconfig           |  67 --------
 drivers/platform/x86/lenovo/Makefile          |   7 -
 drivers/platform/x86/lenovo/ideapad-laptop.c  |   8 +
 19 files changed, 294 insertions(+), 75 deletions(-)
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
 create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
 rename drivers/platform/{x86 => }/lenovo/wmi-other.c (100%)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.1

