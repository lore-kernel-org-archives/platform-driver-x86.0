Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219693;
	b=oG6uWYKynQnbgpFhyU5Ts2j7GPSISAM42fH2UbR7I19NFYosQHfyYFoB6BYZQcQmzk1t
	 UIz7/qnU0So6zy2fM7pCBGVP0yhD/ttLcbKYnyxY9wgiO7XanJ9i0v9wD2vKBdlbEPvJn
	 w60HUafiXwhOi/lZ6Yw09ST+d+SHNxSj7Z+v5ImpH6cO56CPPaPE0AqVtInvGW7Sl52Ym
	 m/yBav92lYnkmm1k1kOtfT47Vj+hcpDF5/BU6EB1iZXaOdsxSnPH2F7Fdid6xWWvUDfMw
	 wUeyi+lzs6YZsMFKJxrBP881YuES5J4UmyuyldeTWEsthtbBay7QzgaQnHv/lhMU/tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219693;
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
	bh=fa3sGmZzQ52hqrRrx8Hm2DGhUgmaaM+pwtx9KS///d8=;
	b=YbET3YfLaR23il/JkrZZcdmjsbGwVBi/nMhMKgzscRqsXAodquOyqGarVFDqy+fWngEq
	 6Yku6a54vy9dPiDdU0VvRP4HyGMt4pJeXsqMbPSMBFSpwriWSPPHvRp/oCSCCXjpXp/PF
	 LW2SGcgtHfAugEkKg449TPHDNBS0wB4fzGz7asQ0AGscz4kfDWzcW4MS1Fwc2fz1g3CWp
	 hmzmzZ1qbvqg1re1y+dssskGT2tbzl0hX3bio6H7y2dXbuD6jDhBps/Cpum2i35Zy9jeI
	 SZ4FeQt41oUArzcrYY5Y6zyS+sa2fL/yae+sITN7QNd6xOS4B7PEFEA2otCdLfrGAIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N+OnJ7FR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CEE606A6AA;
	Sat, 21 Nov 2026 00:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CEE606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N+OnJ7FR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV/x5PoDXAmETUEYpn8u9sQvGoQmJMdGXFR/tgEredQ78sqmBKawisM1QHS7jiIt8XwsxZwmlUQ6qOq7UlMww1IPIoWiyb7LtHLiJnNnKTC9QN6OWEHFeWuTVHeiFG1yhy3AAn6W6fBOCtMa9/Pgoy9oIHIIxtOjZjFRGR6U3vzHiABsNGC0EmC3aIiFFYUslqR9Din/qzBjgEYB8w49nww2goHDcCNbN9mftEEZANETkuYIxF7/2xnq+Bf9b/w4XQjcZzgJHpJnGCW+SxR3v01Li/EtMxEtUtRxM9gWAXJrDudJCb4nCEQnF2tlTQfk7tGGGAt4JgpoLrBxiqWZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa3sGmZzQ52hqrRrx8Hm2DGhUgmaaM+pwtx9KS///d8=;
 b=sAywgPINwUtGA7oIN55lG98gDEJCbmioa3/e4HHAxmglLeo0KFr+q+RlSUUWxbVguQcis/XzTetRznOoQdLt9d3cPkAxvyU1LibLes9rbmRz2X3t24zoOCVHRkrNNllln/tMf0DYIuIUM8VA2nGtNX29HqU1aYbmPg6O2dWrpgxnk/fp+mlbgcZXLb1lvgcntrVB4y3NqKJm6R7LIMPuPKUPPJ43S15kFvwcUP96ooBCeW9aO62FJhZVYf+OeHgfFf007J1+bePQ19xL7KJKTCtd9eNJpbdckY6QQ2qKI9y0oNOSHTj3wXJVEz8rj93E1N0DxDxDu7uYye5hQtgyvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa3sGmZzQ52hqrRrx8Hm2DGhUgmaaM+pwtx9KS///d8=;
 b=N+OnJ7FR0knGn2JPj6Fa0i7oflduorjzUODREiDeTCwGphrA+htwK84HqC9BItPEdgE0+Oxx9a5KC+Kdr0qWSxQbT8SgsnPRRkCdNW8P52aP1Kcs0BWHko+alnN7nYRyZxMmIlT7dyt3pZxCpGMxrcKIQ79xg3iq1CjmJQ5Eft6MVJCJZsjA2bFgJ0133QD47P/dGSURCBoVEdBOVWsorZlQeHIDv4pWHczCdU9JmGDUZIaccnz5ndvJiNK63m9mGRyZs8r76IRqrPexGWjEK3Xe/31xo7pu11Dd3OUlAnSfo2uEkVwwDspenfrm28OHBg0HlmL+S4fneeAFDVufyQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:07:53 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:07:52 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be arch-independent
Date: Fri, 20 Nov 2026 16:05:50 -0800
Message-ID: <20261121000556.173028-5-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121000556.173028-1-bmak@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 886d842d-8b18-4391-8d99-08df47637c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|22082099003|261009223027099003|261021121427099003|11063799006|56012099006|261022075727099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	+8difEgrqHZes3uI+Jq+OFOyLAnvb+Seiaqfdv7EqxTzGpN+/q5wOP/97sBG4E3OOcfe2jmNY+7LE+JUnVaAbsyfxFZPYklOVKUpO4lwY/5D5x5zr25rUtE9ZC+Mk1lJyT4Qt8XjlyJBMYBwjd42NuA6pU5ZN+Dm9qnPGSK9Mo2AaKybj/I6Opf7jcwPSvdjO63coA+JaHF+yZRVooir2ehjJ9nmnpvN/gMyx+WwNs4QkP1MlLxsJ05KycrCV0QA7NUpcpwbGFV6WBHe+cs0wjAxJYaFiuZwqaS9nASRUXJGrq+UqGUYg78idZB9y1Qo1+Kru5CQOJbCZjsAtqUEr70Z5RQHoE1iqASJBmazYOEWy5JcSMqABbP4rICx3VI2NxCMozBjwFL5gtmNPPG6edV2D0Iy19mdWdWGrtZADaHAC7oqhzV4LCkFVU8Nl3kgaX6BAmRXQP8h0AXeMm8TVcaz7dHERPxBilpBLdY2zABStR6wbUiI64Fr3QJVQPf60RfK4pjD0rGSW7FROq4lr3LweLVuau3pgriOGHMBEwmRsGF9d69o9JXWRaOL60kbMSGWdfICNIIqhJ7B2aQDno6SMgYMNV3WsAYQ5EuVly1+sLDfnCQVTHlAx6ft1es2DLGAYlQk/b+lUapDPE7sx/vyjafpbyYVQkVmiRdByDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(11063799006)(56012099006)(261022075727099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZmY6SoIjNNgAoqBpfGeq8V5npOTNhQoaHVrXafQLZ79ZyzylFxyugfkJmI52?=
 =?us-ascii?Q?5cY93tB91XSuj5+rcCmZNa7FxkfuRIw0B8wP1ArNIwZr6gb6OfUA1Z/ZYg9I?=
 =?us-ascii?Q?/V3TXy8O6uNoU56v6bhXKFjyH0JxR2yildlCswtmBRvW32LardzHaUnTWLHx?=
 =?us-ascii?Q?sIZ6htmLNH6AHOgHaycQl/h1jNm1Cegkrp/uE/+frcHBkyVhdwBJgkg9gNFK?=
 =?us-ascii?Q?P6iTYV+UpxwIO30As1olF8fSAn3yKE0cS79MUiDG1jC/sAGTB3gAPtEnL8Eh?=
 =?us-ascii?Q?flDaW91oBSDOJGjL9ooBTpnU7BHIyUYHhVDQ/1sStRAB+kjMtqGyJU+ZNGlL?=
 =?us-ascii?Q?2NjdCv2eMs1WTpS/LpCECfc92f7H6a/dYm3FTTQ8JDaBHdNb0iGR8dGfUn9Y?=
 =?us-ascii?Q?27BKvWg8BwdSwjbs+ESPmIcEDnU7TeJP60SfT3I0WmK+ak4xdFAQ+Un/gJRH?=
 =?us-ascii?Q?aY7l7VRj4vGgWwvdgnfubT8jGh9VkVD3538j2UrsOgt6jQghM3g+cGqdKGn+?=
 =?us-ascii?Q?9nKk03ifd/nBIfeF1aKB6nublQA+wVVKXYuaUlAlJfEBVtjVjoRA29OqnQZ3?=
 =?us-ascii?Q?7wXAJM4r+1T9hU+DMHxkylt/vNBfbTBxfDOGovR13v2M+Ec5rU0iOxVmtKRg?=
 =?us-ascii?Q?qtD70YIiE5qBDCdx/+GiKe183YkEXr/ZDTzIHUHhAb7rBa6B40jUOVZMBRL+?=
 =?us-ascii?Q?oKNc8ZSTgs7BtQ1pGWqjrP5QLMSadd0sVOUFlESgtvp8ihRSP8N9rBl+8EtZ?=
 =?us-ascii?Q?EBv4DxaLcjZRLv4sVedIjvZFneESF7izS+aKblscTnYQF4iKKJddSqpqXpM0?=
 =?us-ascii?Q?AD5ALYJQnTxyXfnwgAddh6dETcKBhsbc742XIeLUFD+DeGHqLb/o6+5Qj6BS?=
 =?us-ascii?Q?BU4x8pOJi0zXvyLCjdeKHBsNhOn0S779JOgG22y2t35ugvHw+yUfzXfAhdq4?=
 =?us-ascii?Q?KeepovB7UUOVsQE2KguaEpCHkcYlfpvPQtkRs7dCYIq960TO/faehulPd69S?=
 =?us-ascii?Q?M7brvE4qQ+FMpoIOhZjSVVByF+4MKBmxtB9yFkdinPk3eFXZSMD17tkL0wgI?=
 =?us-ascii?Q?1KYIJxYHemQOmdZPWOqCosvpICon1h48V+Xqg0VOzFIFAloKXU5i8CtKLKZ3?=
 =?us-ascii?Q?yTfDQzqwTZWn1PBS8IzNKcr2VJFJ0Lo7yvPoMwGBjlr/4jT28CsDKekRCcjY?=
 =?us-ascii?Q?rbSy2CBhqticaKmPNDjtitERy8MI7ThBOFNuMkBi0ceKIFUgzmsJzo8HgWfm?=
 =?us-ascii?Q?Cd9U/qUqsxYJRV9EFZM3s0MlHU1Ox+9m2zmTCxXoKXJqugxOXAPcK4SgCu4z?=
 =?us-ascii?Q?nubr2pY4MNWfKirNDDEWUf5RfeBAPhGhZ3eMganLp4vbpqUqmkIwCpwWTOpi?=
 =?us-ascii?Q?RWJZx58ApEPTJ88zwrUIhz9wlorjWPsxUtnNwkhM7A0h6Pn3+JYvo8XqwNPo?=
 =?us-ascii?Q?PIFdfbftR+b0wCcf2wZV6epuZKwGC91OxH4onR3hb+Z16bjNTMaha0SJLUvI?=
 =?us-ascii?Q?8rtqVFtDvnh3w9BYUltOZCsYJiMD7wkjwkm/sMPllHgkB1HlmPBOa1dijazS?=
 =?us-ascii?Q?kacHb0zpquFarcFm3Bnw97bnjGhGIxCCiDWFdNT625dRx2bZDk4SPT6FZQL5?=
 =?us-ascii?Q?wytnyLXzACQ+8osw8eekdIxRJdbV/rBBV5lS0IZI+my313TUHyHNbb0xc02t?=
 =?us-ascii?Q?e9PAwPfRwfHHRRR9V5DtnolModYqmucM/CazIkY0nTO95dvhxRsvSfdjygBs?=
 =?us-ascii?Q?/epqfRzKxg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886d842d-8b18-4391-8d99-08df47637c16
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:07:52.2484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1ybrkJVzq7ZHA9BVo+weBhL+VRWMVHJgpySOOF+gahPaV0px+itnv+cQCCq43kT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

CONFIG_DELL_LAPTOP is currently not available on ARM64, due to a
dependency on CONFIG_SERIO_I8042. This dependency is actually not
necessary, as there is a fallback. Make it optional.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/dell/Kconfig b/drivers/platform/dell/Kconfig
index 7030f817b6af..0223e2373508 100644
--- a/drivers/platform/dell/Kconfig
+++ b/drivers/platform/dell/Kconfig
@@ -77,7 +77,7 @@ config DELL_LAPTOP
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on RFKILL || RFKILL = n
 	depends on DELL_WMI || DELL_WMI = n
-	depends on SERIO_I8042
+	depends on SERIO_I8042 || SERIO_I8042 = n
 	depends on DELL_SMBIOS
 	select POWER_SUPPLY
 	select LEDS_CLASS
-- 
2.53.0

