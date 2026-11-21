Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795232024;
	b=vLHaymdojrW3YzXNPAShR/8butSWxtlaNc+5GkzMlXP7q4KmkyRHXSbnyWwZkBHiaz2a
	 EPQcs8ycpDAWIcLC6+U+MQ9xKJOEh4SkvzURjiyAQb6xYUw1DR1FgBuOPOi6YxGi4J461
	 +JS3zISQxCULsk2FT4QLJZ8SOfQxhwXj2pYJ5yvoAzPBtXT3uiGYZUgXYUUaWFCKhLF4Z
	 auKIC/0Nu7S+qm8mmks0xumntSD5c9pRdeUFs+DqO2UU3TsCn6hQJqj8dukfirtbtS95p
	 /bbTGhvah+IUduuKSMdJRC2FHQs25xyJZZPW2eCU5jxpEvDQpJqrX+Jyzz2o82pr9Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232024;
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
	bh=4eQE6j3Dm4VOInKCQlFXlsmJ+oev1CI/ox5KV0H5FmU=;
	b=LPIjpTjxK4fXyGvHMvJhZZlxrslDEN5CEmLT/uwZpDxawnjyRsYD7A53OSdz6+4u165T
	 RtRGm+PrPN/a1rkU1Z8moycvbM+gIf32dheuPdvz4yPjYfgaSdXb9m4vMhI68muyWvUXp
	 TNJ1yidFd3pbl8Yl0CJ2ImamDx+tkPQncfBV3TMXlic54EfFvZ6FHe7ze3HdI4GN0HRCn
	 nnueZxLxjtRlu+lxSPT/bN9caMLo2mw+8h8jDG3TduvevMPtE2Z+x9l46eFJ4mIseUfI3
	 DNWQnu9xyo5FoH97DqAVm4leBQaO4zv7LSuBpnP4ASXnbiOpWIUZ1M4wW75wdx6UkbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="XT8L/2SV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.16
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F627606A6A4;
	Sat, 21 Nov 2026 03:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F627606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XT8L/2SV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpgrXVjvk1/KhS2X6JIPqOCmap/87jiiFnb7uImMBg0QYyJnwwdvdL/xZuH6yt+Gg2WFbryVDc5yuAKP3Gsg1Skpi8dhdGmNf/m0lysJR65/JEjZvg07GShcxf9etcLvl8E/uvu5hC/19RGfFDvEG4yB5ZpJu6Zaw8KYAiym6j7Qt/Dn2KS3P4IvR9d/csqO94CJ1jV4QW6nNc+0C0bUrRpJekH1TMXgqipvXo2JB7sIMr3MmAvbwFu9Qg8lsOZBlTzkx2DROxshi4EymFgMI73eVOhADnSjr7rU73R8lCBLXjlLz/iRifYqIlXM16MxjMk0sltSdBhuGSi+2Jqkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eQE6j3Dm4VOInKCQlFXlsmJ+oev1CI/ox5KV0H5FmU=;
 b=q5SFn9COH//267F9HJXjLEAGnff9KOmU4ZDn58NRdMnNnPG1yG/untQm+QC0lzBDYalHDW5hzNKC6y7KHiZaphqWylA19ge0JZKKY7ac/4657fHLLLRF5gL3hxekGe7uFIopVo/5atQzyAsMQKpnzsbjlFTDHkOUZb4+vtCy1UAFuTY40TeLmxGYvrWpHuYMWUqPVc5iadI21pC+qqcDK9ALblQQcR4MMYqcougatv6nuR8EM7HOglxTdHTFfjveq6aNY1pAlvGgEakmBYplcfmMQui/Cjwgkil3GNWJViqlgEd/Wl2aBIknh/MoQO39Zan7nJAspQ7wNXB6fIo2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eQE6j3Dm4VOInKCQlFXlsmJ+oev1CI/ox5KV0H5FmU=;
 b=XT8L/2SVSWtPK6qtPrDpECpUD89q+rtcI1H0XWtsMN54aCH21X7otGiUvNPNkXzHq3WoT3fNzDunoj0akIHLBzjsUCQHngFKsFAQPUcOBNXLCvVeH+j3alIvWT1ZPtqrwiQ1uyR/zutLgpZY6j7xdX3iQrZ2NuBxPNE9d7qDDZuzDzMXlSY3bPeUMkq0bqp2M6Glh0HgD2JZDy0vH9TI6gpwsVGk62BzsKWGkhHYugqBZccdP0nLOe6KTw/uYqOt/OvPulMEbhyKS/F2qI07tm6yMHUoel2J1oOetg4WNmOsaxNMRB1sLiiulD/x+bkTr3ffbf/ZcPr2qW17WF4IcA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 03:33:32 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 03:33:32 +0000
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
Subject: [PATCH v3 3/3] platform: lenovo: wmi-fn-keys: ignore the keyboard backlight level events
Date: Fri, 20 Nov 2026 19:33:22 -0800
Message-ID: <20261121033322.974635-4-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121033322.974635-1-dcemin@nvidia.com>
References: <20261119022719.3089229-1-dcemin@nvidia.com>
 <20261121033322.974635-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
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
X-MS-Office365-Filtering-Correlation-Id: 48326d9e-0fd5-4322-263c-08df478037bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WNyWQ3J68tGaVdpm9EPDov8oiF5LqbSkzs8qebPG6mHW7ELkR6iIWiQZxjO3aQmsDVW2qt/8q04zoOKfSe5OZx5FyuplGHgDWvR4sLBM08nEfy/o8PWCcOVwmBEdYyrrZBsCeUG4zQH9kvGCsmuVeMPrn51jd7qPwYap5jwNdTeORwcHCV0pea57cd/W7mbhvGMgrYHWYNGfq/qRgvgeT5mmOhWDm7uo0/72j2ub1eOchBZer2ChIQMFKpC001H6mBD3C0sydWz3z+dQ+X+IkmOfwupuCK5QbE1cR7XeGlKZCHlc99Nh9XmmbwHQXoN3rv3mhmrWh5/4aI7F4+aBZfkpjU6yJUtGPcR/t2x9UHn+8B6lamzsZmzX4L45GodaJQLm3tCETkEBjYPdZU/8aJQzzKRw4aVTwFdUHri1gPUfwmrY2Sr43cwS7VC9sCYaPV3xHHkZb6mZwO3TK0ZiyAKDgg7Ziny/nGG3utGLQUGeY93zKVkoVa2evlgwFj6iGLCP2iq+ykhIv9EjU+jweR3Awt05IZ/9jEtMecUBQQz95fNZqQL3xZvr2ljUJSF3NV4y7Mg+Bn4pns0OhiR8Ru4BtlFPCNG1ymWSEcAKflIlp50JtdUqaoYAwkdT+k0mYcTxf5KF6JNuZS/NtNtNujZ2xVrw8EyT3OPdlOmJrjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UwK9ohHOoreS1i1lnHhHlJRllxG6HMQo711qJxZIktK/bUeeL1QB33bOs5vH?=
 =?us-ascii?Q?L8IffcSSPojdpQ7Eus2k/9hCpqmDfG/zBssgZYvv+kYK9GnAbuo0Hl/qt1XF?=
 =?us-ascii?Q?olXUD0sAGqzd2PkF0rypTwzRS5N/vjouNwCKwRphXHRuZkmQc10M1zSjBcH3?=
 =?us-ascii?Q?+v1I4LmUnRYUJMnbSDd2vlxb70fWB6EAqeotXpyIFhEW1SoM2KlvuP2qzrf6?=
 =?us-ascii?Q?Zhgx3fqcjZvcoUvYUIER4NT12XfyRQChp4nCj77cbxShYRwTBAw/TR4z6dIv?=
 =?us-ascii?Q?fV/Ni9Ti/VI8NogD0dLCiZHW/apd4k+eXYfqNYPaSt2HsyMhvW7Ps/+tI6uf?=
 =?us-ascii?Q?Qo7+IxONMa/18uRDSR4fxNncbsuR0nGaLPgpWC619oQ0ioDbjVe/LFVs3f9/?=
 =?us-ascii?Q?lR2CjMQ1qnmfcITnqN2aDNYtBlxHUPTTMCvUJY6oHFOGXWDSWW5MkOdBWyDR?=
 =?us-ascii?Q?94L3+m2dEMEz71xlc9JNPv3vVHh4N5BYhhq7FTV5qFe7w1WLjlhZTggNUdaw?=
 =?us-ascii?Q?yy458Sp1k00Sd8U30I2qOyDg3ypBMcP+30VgTieO2jh0Cc6kktaSwytu/ycJ?=
 =?us-ascii?Q?qQ9b1jTkysOzEF4Vyd0TzoeuNW8tLAqSo/QcvP7NjQBr+B+L/vLkj45s4Kth?=
 =?us-ascii?Q?G4tESyTDwZnOCCOT5zHa7xud2sWdmgOfC9jWpd34Vv0+VgtNz3q0YGUFGuHk?=
 =?us-ascii?Q?iHDg+vcmW0zKGAG72z5q89kuq9N9VjgDoPlXjPq1UUmLrPC1ePJW/Bd3KoKb?=
 =?us-ascii?Q?8t2sQIRNE5/7Tl+MYPAtJiRdpnf3Ay/9pw5PmEHJqkWWfpcgijqafwKvfahI?=
 =?us-ascii?Q?pQ7UP6UZd3tuTxyTAxsVKMNT90yJ2c6QKr/SRk7IAK5/l3UwW7elAhscKZyq?=
 =?us-ascii?Q?hPE0AdRelgzOPshLSi4FJNE8sP/K3wC4VT6GRSoa8UY/s8kB2kxQ5FLGwNDp?=
 =?us-ascii?Q?0t0OastF+FGHxMMSv70P5JBnE6tLLrJDSd/w2F8Utcc4Um9g7ue3J/Z2qHNJ?=
 =?us-ascii?Q?a9hpW5+H3oWMKQZ0NTirOZGXMaGglcFCNAYi2/iIKJeXnpS5ctdnP7cwOBpp?=
 =?us-ascii?Q?DjTypdEPg/MX0kwJdojGOg3uf94rZxjHnJge82e14IVdk4KkqMVyWZCTWqYT?=
 =?us-ascii?Q?0C3iNILDmDtQSXHNL8h7LpqOJq5sA0nafFaAm+hphapn54m8/WGam98s/xyM?=
 =?us-ascii?Q?Nb1IwNdzVv6ykPynhrCI1KaqelLNFkj3YiDFOi/SheOXnmjSnXn8hIdmdXjb?=
 =?us-ascii?Q?tOunu5XJO72LIAFXe9zrBb8UQoZfGZpsbKbEWC+Vi+vmhdBDeV4H+5aXZCIE?=
 =?us-ascii?Q?4OrnyCmhTfFDddYVo2iOY2ysCItpkyJH+xVRCKbg6/ehzb5tAg7ZckzQGFk4?=
 =?us-ascii?Q?6kCkS0mkZUz0xOEWhORirtuKTPB7a0Hobpjm2KqQM9JIyugSOzERTlA8V4us?=
 =?us-ascii?Q?md/T8Wasl4xCfxoah/MEik7xWzJpuojiYhQwR/jAtgFTcBU+AirmyQfWYZXI?=
 =?us-ascii?Q?KTAfM/z57ewwNI4Rb7R95Pnu2C7Mmnrjewj+SJ4tXR0WZ5MLIHswLO9NeDRA?=
 =?us-ascii?Q?O3aL/zQKO1lWtj/kX7+7nwhNti+CGbInoQYlCRRcyIXahpQwTibLvS63eUSZ?=
 =?us-ascii?Q?YWqqF9FJ/eiEyER0p1jw6QqnKByKFldgLdNbBAUHuq774LDBJC6LYL9hY7jL?=
 =?us-ascii?Q?bAfj4G4Yft1XIXoUIO2fBSWC/J9pKE+52X1nsU9YNWJxKT/1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48326d9e-0fd5-4322-263c-08df478037bf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 03:33:32.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lp+lIc25mABW/HlHApedFrmkVuSgP3PBVJzX8SwUrlJMszVXIVDe9tuUyOpK9gH0bl+fMer6PzRRJJdan0P0Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522

The Yoga 9 2-in-1 16 reports the keyboard backlight level selected with
Fn+Space on the Fn key event GUID: 0x40 for off, 0x41 for low, 0x42 for
high, and 0x43 was seen once while cycling. The firmware changes the
backlight itself, so these events carry no action for the OS; add them
as KE_IGNORE entries so they stop being logged as unknown key codes.

Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 drivers/platform/lenovo/wmi-fn-keys.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/lenovo/wmi-fn-keys.c b/drivers/platform/lenovo/wmi-fn-keys.c
index 330de9529a87..21d36e798ba5 100644
--- a/drivers/platform/lenovo/wmi-fn-keys.c
+++ b/drivers/platform/lenovo/wmi-fn-keys.c
@@ -108,6 +108,14 @@ static const struct key_entry lwmi_fn_keys_keymap[] = {
 	{ KE_KEY,	0x2d | LWMI_FN_KEY, { KEY_SELECTIVE_SCREENSHOT } },
 	{ KE_KEY,	0x29 | LWMI_FN_KEY, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_KEY,	0x2a | LWMI_FN_KEY, { KEY_ROOT_MENU } },
+	/*
+	 * Keyboard backlight level after Fn+Space, handled by the firmware:
+	 * 0x40 off, 0x41 low, 0x42 high
+	 */
+	{ KE_IGNORE,	0x40 | LWMI_FN_KEY },
+	{ KE_IGNORE,	0x41 | LWMI_FN_KEY },
+	{ KE_IGNORE,	0x42 | LWMI_FN_KEY },
+	{ KE_IGNORE,	0x43 | LWMI_FN_KEY },
 
 	/*
 	 * WMI switches
-- 
2.56.1

