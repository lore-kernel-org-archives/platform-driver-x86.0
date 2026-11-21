Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795232019;
	b=rVY2gdn2DT3XnVsA/KHwIA1MN+bybGCqoW91+rp1bRsCyPoijlk943m6vGSu4M2HVjK3
	 kIE78LEdjLsLruuWF+jZa6JrNyMODoApXrRyT2cqtPvNuuIMEn1dAko9gtfWACIh7cM1u
	 0694tl2M5KptcPpyD0xUHaVBgqsoNWxYiV51GF1/uOkHTNddvZCC+BECoRJxEY8C9a1CJ
	 Ax9SuPKQLgUlVKHC+qVjb2tBZq/byp/hvxxO53e9WCJDA2/yqpqDN0L5C87L16cob7Vdj
	 UQ2JRoFexCPOqULliAXOnrJ1Nn81mXmjAWaGxwJu6jFKMdr/leadiXVGfIS/jVOKhFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232019;
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
	bh=JjNMX0g9Vr6cq9jpe3tugLTkaiKvaNMdTMU1AmAMAFk=;
	b=AX5qBhoqU+QdY7pf4l95k6AhzbTOLE/TNSY9J23Ff/lQBjTn+AX7WpG/T3WquUGE0lFk
	 zC7TkNlnyjqzZnzyIyPh2DkLrDtF13+ffwvgORUaa1gipHxYfX5q9r+K+tqcvHE+m5k65
	 lTT7uujHkdFgeXkJwjUVlcfClrydd4kHTlgkFp3Ev7KXRF5+qEfL0u5a1kopOJNuYVb25
	 DHjAhMP71YxveJhwA3PsaIQb4DhF4uRZZBIgrVLoeiOh/Dsjjw7cnv7aWIJZzOMsYurL7
	 pBNSul2q41sV2cM2EuRK7qYsxnFg6slH5jeKocjxr+iIA6XM/r5x1WsDyF55imq9Z0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=afbhtCJ5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.16
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43F606A686;
	Sat, 21 Nov 2026 03:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F43F606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=afbhtCJ5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFb7ghrtVU6vOcF+/DYbipoq7rN6TeiHf7BU732ariK3OgVfyD3ipYJovpRkFdcJ3oA7hq0kpK3suy1bkfdoZrrURtOOrYphmpFgjJ4IyB+9gH+mGJ/Erh5RvMijzEjAx4VP9rYxRudvHRiVnI8U5iYhsn/U678UMK6v/cCMbZjwWx4BdZAubKBuV+DiiXAYjV+L5CTDg2kYEqJb0gtBClmqBm924lzIujzJtX/Sem4WEftFjRVudep69q3x/7+v8eBTaxY7FE7fxSjmxEebC1NegpSnG9EMKZwyOs2uPWjn4eXR1vNJuVUETF53JK8SoTfIbnGY9FIbx6VW+1Qxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjNMX0g9Vr6cq9jpe3tugLTkaiKvaNMdTMU1AmAMAFk=;
 b=dX6fEvk+lodqTmmWm2tVlVhB8UN6lwAsOyKIwejHu2IwOBgrYE9Wc+meKXDA8Wsx/iKpm4AWLyT75B8/LmYGkR/bilE5pNNxRn7l+JZtuHJJhUCBfq+kz1c2TLbIg7sf4w+xipBjtqjWLZNrhiVby3COp9cK1X3O7BDKeqCXP/u26eRujQYEDbWlBold2VpM2lOo6ZgUSjejR1BfQceLuC/HDCiconZIU3LaKonqM+l3qhZXrySAk6hnx9eFGeY+B6HR6QUSS36iqb/C/YoUm0+TILpNW659wCeqy7NgpsOTS4xEOOTd8xZc7IZm587hlGx+EVlfn29rDG/37IAWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjNMX0g9Vr6cq9jpe3tugLTkaiKvaNMdTMU1AmAMAFk=;
 b=afbhtCJ53CuLdBRbhRz/eNag4D1pljnD73O3PPWk3JZ/T1bF/bmKmC4hA9uVsapfU7y60ziKRxh7bHLv26HXpaoI9gsrWAvMzlD4Fib1NQBmLNJZYbCSqJDqgYc5wpSBveg/AYeWo/oFU4Q/npJr/VREBhuVEeOiG2ScZLGIFXDE8SgbAqTS+QpIkXj1lOP197izLvZqVwqY/xRdvzzae6RU2J0/3Eof2ZJXo9mFn1k8jnk0sTWRzMKysWny7othU/v1UV8UObsKVvvZmro/UaZiVG9u54/0Xbidlw89FTHNSKrTuiAYX2ZOGKGgy3jF/9wazfhTkF15OBfYsEzNIg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 03:33:29 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 03:33:29 +0000
From: David Cemin <dcemin@nvidia.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	xy-jackie@139.com,
	i@rong.moe,
	marco_giunta@outlook.it,
	ldemarchi@nvidia.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] platform: lenovo: move the architecture independent WMI drivers out of x86
Date: Fri, 20 Nov 2026 19:33:20 -0800
Message-ID: <20261121033322.974635-2-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121033322.974635-1-dcemin@nvidia.com>
References: <20261119022719.3089229-1-dcemin@nvidia.com>
 <20261121033322.974635-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 300d08d5-d175-42ed-e061-08df478035d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|261022105027099003|10067099003|4143699003|11063799006|56012099006|261021135927099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261026121527099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Yi/tZpbkxx6o4vXY6RAM9JmTZVOO077x9FAMS6q2BMe4YIA/WZZvoQij49MCX9LjOxvI1yKm3eU3919S2Y9+eHXmUWHYKsUJCs2L3Pk6XAsGXc4c79EW4yV3kd73SNNkFnvnsLrjqgLztCRgoddO5jBOQ2pKErOydsyujZ2xhjduIeJAD3SU3yyIW5pWO3CGNh4xyMnzW3P/r6WS66pQqbQL7OazbRVsj+c69tBp4LIeenIQKbtY80RhJlp0My+Un5Fz78HdKUELiE79p+PvKofcwLwNbMulWw4Q+wWHqFBlmSpxQD5NOt6jMfV8zwfevyWHskhinowz2LBzS/ArSZxcUn61GIHKNZDOIH+U1TKHBqNe+mlhT4nCCwnERucRb5oZ2BTM7Pf16bQGkxZCjmDdXASZ1SU8pEmqgQiIvLkFKQgrIlLI5xDgvvq0/h6YhoytaR0NrRWQaMDz/qxE/jmsSuR19k5tKgWxnpPuf6O08wMchBI4SpqCqXS8f7nRt0UdJEu+pdOSy6gdQT017rl99MwJVYxR2KHGMIUgKXUFFGJsM16U1JCYDAAM8wmNqkUG0IScDQgyXazMYkaJpnkrpaSjXPnBMQMmiNc/tXCkWaM+bSFhg6Egm6QRwMWn/cvx9WZfPMYFXVs2lBshl0cwDRgzK01NO512DluZMqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(261022105027099003)(10067099003)(4143699003)(11063799006)(56012099006)(261021135927099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026121527099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tEE9Y1XnqYlQmFODLGoCDnCGxe9Y0oRNDqM3jc/UanUP1D44c1ErhdoIZNL5?=
 =?us-ascii?Q?w4opb0hKndr+qIiO1qeJDXf/OAI3ucwEtt5eb1zJpyI0arXIdA/QE7WC7zRu?=
 =?us-ascii?Q?vdgGSa37AKI/zN1UCnapNBG5PUCTHZI3j4M74lD6OEgCqBPsaeT6SmMGLU8m?=
 =?us-ascii?Q?zusq0nMCB/chrl0Exz0wsynrW4HEEF52CC4FSJol1tO7rdzOyRINU8ctk1RB?=
 =?us-ascii?Q?NkZyzPaK8Q38hifYOOboVX6LTUKyPfgcDaV0H6Lvj+vAI9uWILdetU+0F96M?=
 =?us-ascii?Q?BoaFRtg7koBwSZ4S18EfFU0avKvyl9BnPo6D+ag0n1Q7c+AysE0Ukxwzi2Xv?=
 =?us-ascii?Q?fHsS9Wzl2oTtXIR86hXoRhvILpX9M4aHGcf22DFjJMca/JgX3+kznpRBS4BZ?=
 =?us-ascii?Q?r44aiNUkqwC3k3YiYTJPeCNNk59Z1nK+6VEHYXnHfSDEztHqk3R5vgQTlFj9?=
 =?us-ascii?Q?PrHt9i/DS5iwFfZvaPuFtIB3w/IB85ZhWawr12f6/571OzvXbco5cTUpAHit?=
 =?us-ascii?Q?zu1ymJyrCiiocPFqvYV9y47rx5we13b6+7O3ydn7KvyWyjqcFDeKPnWqHkNb?=
 =?us-ascii?Q?dNrZ6PY+8p5Ao8OuHs76GJY3jGOXE+wxdG/d05LddKfOCek2oMuGwWeM3ro4?=
 =?us-ascii?Q?awjf8tbXfXOTvgVkiqn1a5vGNvaPVjshC8qugncUxZXWRfcOy7JUTSMaBeMu?=
 =?us-ascii?Q?B9UHubmYOysCZh5A1wyS2PyhgVlcMUDJehWVGn7L8JQYF2FWsnjLo2377D9O?=
 =?us-ascii?Q?rPv4CbFRKfFjew06VDSVFHHdXc4igB8sqxrfvyQLxaO4uCEPnAZXo7ZzGOAt?=
 =?us-ascii?Q?s2qQvk6KppZ17ns4iwM5y6EptCC/YaKdTrMOOW8NtqRSw8rj2SFlZfrrDsNG?=
 =?us-ascii?Q?4l6PrixUFQd7PCrVdf+Ej4a2GQawu2rVT8s3Nk/HUThrGwB5SisPN70t76xX?=
 =?us-ascii?Q?fH75Q0OMazuYnEyJGWDcqtnOmNXVEP5h4YpQyK78EUOHLgulQ54kzkQAI0cW?=
 =?us-ascii?Q?HrS8UZOkIP2fN8UW4IiMI6PVeWYSqVFKkJ6Dhrm/4npJgKoOw+YniGtWWg2o?=
 =?us-ascii?Q?Owsap4DqKQgtHSYMpUrBu7mFj04+nAmMElYtsJIr9euqIn5p6126B/mU428D?=
 =?us-ascii?Q?ryGGw6NV04m3GLwPIbflwNZ1mTI1sOr1P2AGf9PdjYFOIgDFDXDy4EKs5VZq?=
 =?us-ascii?Q?kHS5tcW+JRJvBBgXRN4bc35JZTjXJc7/Cprgiwqkr6yJrVaCH6ETuhqi5lX0?=
 =?us-ascii?Q?YAwH/YhdobcjbcgexxOjuPHf/0JFeVWLXlBo+GWIS5MT8s1Ag+6FGSWu/1Xw?=
 =?us-ascii?Q?lWDK7OxoGkJdzIqEP/knLLICIWoof0p1zSQHI86W+i/mSyM7xiq1kG7toP0j?=
 =?us-ascii?Q?e4jWAeaEIF4Y+Q+rfjav4tVYyHObiSKTetLUrcwclyc/70aA5fstzug8Wu8V?=
 =?us-ascii?Q?4IY/9GEhz511moAWvFij1FfZ7mf3mtoau1VsUrb+OMnHqr1b/zbAsYaipvKf?=
 =?us-ascii?Q?1jObD4AM3fzEgsmyqUatAOF1iUBtXcVPTSqRxfu52zmvEnZcq+ABbBILs2eb?=
 =?us-ascii?Q?DnVSM6varLcs6ju9N4/rs2cC2HuBsVedTZQJnE/u4fQlNuUtX+fYaiKgV5q5?=
 =?us-ascii?Q?O4UNnhFJO3Wg3nAZAqbM+OlDPY9ikR6vYH+fYEIB1/bJdkJoVV+OiVI6LXuB?=
 =?us-ascii?Q?E20MPjPj4vmM0kCuttCcTuff3Gqo/JDI1amR4I3mjX+8yl5r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300d08d5-d175-42ed-e061-08df478035d8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 03:33:29.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtEJ6ZBa/q0ZY4WfEbcJzcErUBtnLt9Cz/vSl/zgHDifdWi4IUXaQ757YIkem8ppRHvYI3yQzh7BbDSZf2LqTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522

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
Reviewed-by: Rong Zhang <i@rong.moe>
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

