Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804213;
	b=R1d6pZ5KnjiKd+4fjJCGu2GCu2GPtgHXqcndK9XJ0fZwC6rc7VgK76S5mpSwQQNx6is/
	 RIoFqeeUkaBpkBjiBK2HIqqz7H4UjFiKvLJym5ESJNSD7aC9mjLpFX9hH/CxL0YqlItED
	 LyWgLxYU7V7ndW22MwwGE3v5boxOVMS9mrUnkeDIAbt6Q6rf/2Ztu7/WLdjhfHu7QYyhp
	 PDr7I4lw0v44k1EyfgYCecVHn5JIP+KJpUdqKB65J6EjU9TKGD2+94Po2tNPTC5kjqZOA
	 XivEVZtmqiq7MCJ96aHMPpRcrOOGGQDdnj8IqXGQiAe3umCwq/yrpl35enSogxNcg5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804213;
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
	bh=sCWJ/WBm3Ws+9K6hMN0cHFI3zu5UnxOtESN7zUpX/+U=;
	b=4jqdi3AW7KwGgBH0b9QPoLIkeAIDD/QzCaYWG9+N9mNe6PeRuzcsx7SDyjQAQmn3naXm
	 l8JD5R5lxe6TgqqlYWfg1TXGxW2eTzqqznr/uLJsNsll5WhYBDoS8SLiZuYKcJt/ND791
	 Q00MukNEVDEqN1v+Fefc6XQcpM6Lm/nyy0xb4Q2gbPlxNltcicPT9RsPcHzI/4EI7QNYW
	 w1plMkwT3O3Fy4Y4AJFavqpDmFu9Yfr/gkJt2KxzThyYvZC4sDSC6sdiindd5r5xoAhsj
	 YZyopXIzhdISSgBM2SDbxhaQDJxs+R7JZXTkXJaVc8EI+wf9+ze2vorvbeM2HMXsgNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eTvY2ugt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.40
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA44606A33A;
	Mon, 16 Nov 2026 04:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA44606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eTvY2ugt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmO8/msHbznRWs01RVWCnJ8J5MGKbDbTmGxubkQVo+uL2L+d4gdyDPGKzzMyga8alZJSWmJ7rp0/o3gZxIyAPUJCqyCC+VSNOk59s7icby3MFHVBfeKC5T4KkDVx41p9f4RdUL0FVF5VlcVAlJn9CQlZZLbfkX1Jvj38+95g+YxTtKG0cXgOFnSGrda+sDqOf1AUoSuRvtC5JJWAAqi+hhHVpFk80UZ8uydncNwYsw9/e4OcCgy8wq2GC9HPWUYpy2fgH2GaecfC2jE/poMfLA8gYuAybspP8me79n7K/C2rTzHIOfAerR/ZqPJ5zHlygsRsBGsy2kKw5fj9h/m6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCWJ/WBm3Ws+9K6hMN0cHFI3zu5UnxOtESN7zUpX/+U=;
 b=oSWt84EHmyeguWpk5XTO/oyzPvYCoMOHH6yVD8TV1TMG9kJMYz6WQA5ZSm/yzGmn+3LxCAFkXzIa6dpgVjFDJhiNSBumzTRsI+kxbjBOb5+VLRcNKDWqCk+d+qCbzcN4F0vnGNDBzfXp4f9SPKN7paKBI9BUAbZn+xM+hRrGwFCmfry2oqXPHmTXaHQxCg4O+MHpzY2OLlbfaQr6rCvlG7IVjfkAaM5ysnZaygYESZ9o2vhI5bg+48Ezoh7lilDqvHh2volDLVURgK6gwSEOmeKJujdkuWBVQXqIQmh1mwq2rFSn2eZS5zt0uTiUHJhq19hIlxqdu0EzF3v2JiZQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCWJ/WBm3Ws+9K6hMN0cHFI3zu5UnxOtESN7zUpX/+U=;
 b=eTvY2ugtGa3U61DJTmptjy096xiP65PsFL6/toh19vLRMaSgzVQCCv8kjxD+GGEmG6p4kXK/epuE3OEnnHw78Mw5Nwq/MUpkdm2J9RWEqvznYHJoMORL7jPoIwTstqx/BXBPR2uVRHrMA+WjRGBNZMxrSJc9cJVW2qNWmBU20fF+dieyPxQWU83itgx0BLhBAirAsrzuqytUG2AETWa+4FYbW93W8BSBGiDzpm+yCej2jhgkQwLB7R3qJZbqkB0rkiIkD+7L3u/ZGxcXWmk7cJ8LCaJP6KmMUNGAYxLGYb4CdmGXSnxzViYmOD7/ohnaBOVANCNRaYxcrIi/f7IgOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 04:43:29 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 04:43:29 +0000
From: David Cemin <dcemin@nvidia.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jackie Dong <xy-jackie@139.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas De Marchi <ldemarchi@nvidia.com>
Subject: Re: [RFC PATCH 1/3] platform: lenovo: move the architecture independent WMI drivers out of x86
Date: Sun, 15 Nov 2026 20:42:33 -0800
Message-ID: <20261116044237.3760227-3-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cbaf1595-05e3-46cd-b2aa-7bec1315cf8f@app.fastmail.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com> <cbaf1595-05e3-46cd-b2aa-7bec1315cf8f@app.fastmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4dd431-2a8f-4f69-d319-08df439c2920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5k0aA1LpeLAaZr/3G+O2BrPvznSLjiS3OEuRydBOGYxnhUmZ1alFcC2jbj73J8coPoEa1u2L+01U4yYiflHRzPdpVUQq33+TZF+vcurMd10PhYxDcheCzg09DTdRWbqsb49NQvtHaWGa6FRMvpcJPkKSTChBonPx17Els9fAMCCtmiMiuNV001huaHQtgozzG5ooO2eC/UhLG5WHMmZX61iMR2igWSBUFSETpRiXmUGLUdRvpqACbGKbenVeCJo/3h1v+XTFOPvQYebbZuCjOoYSUrlBPAkhK6JGKf0vFfq9yyv7JvolzWRfZlrfEIRI+MvWi/aPqCltXneZRbraBr+fkO9buIS6VqkZQEHr5Ciw5jM6pONQ+6ymku7QpW8W+3wTjIeXp+8yZC5G8kjZh8f2OCbZBGErUtF+6uwfxgirfRAMhd2x4okE4T2dSCWmmK8u/0uACkTP0YnjJy/VHMid21SEh9GzaufIxrRtKDCNmHIdlBH64CprF2MpnXFWZ4eujsqVWeL3AbUtswMW3FM+e81DDh3zWii/p4qMPFAE4m/HrtZj2A/3WxIdpdECTr3Lrgyl53gRMeIwh/1P+MXPbN9itc/uRcWJ/wq1MkReyTn2EQAj/Tv6Hq4IByyZF8XFNgvEZjcix41WoAArXG6d0ODpbP511IxEaawg6lQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BzCycHAiN9WieD5Ec942fCfvrr1c5rXNmdPLYMGfiKn9uD9akyCXo4C5JM1X?=
 =?us-ascii?Q?4d6+Q+/EUS+uZuannZ/kAmWEoipmVJOP60f7wxwXUrzxPABOZaTJS/WLDwyS?=
 =?us-ascii?Q?za88QBBws+z4ivuUBagKKqBhNTto0hA+0h4vp9JtDVyJRSJrSlPwGHgyyG19?=
 =?us-ascii?Q?5JqpebloIuckradW0ydVlOnssdAh+HGgsVn3ctneOxK0iHRni32pq0EdSGQW?=
 =?us-ascii?Q?khcPg0dqtvAzMRXMjOw046okCrAwNkgzhfBB0WhvoQnzv+zjemOBaVANwIP2?=
 =?us-ascii?Q?wDRuF49vxDbIrrcOBKFo3Iq68zZA8UmHVSNLIF5fcsJd94fj8qa4qrt2ZNHq?=
 =?us-ascii?Q?Vq/095rgLeX+11eWn5O78PgJkAVy/W6b+dwgheyuaQd0upVh+H8ZVRfgDvOU?=
 =?us-ascii?Q?qpIXuf/5eo6JadzejMpcedCVGbCuUY8NM/MMSnMvCEOF4F2lhOr+vx7jo9YE?=
 =?us-ascii?Q?irdHsn6YI8JQUV6t6wrneg1g2dVvbTQzCAW95ZdoqNv4L2Z9BGG9hBBc30bU?=
 =?us-ascii?Q?kiv8DLUF1li9fybwR0pzAgHXePC+lYQvwO6dBvF5bgHQFI5wMLC7oZrrC0es?=
 =?us-ascii?Q?yKYWYD2hsw8db6rM75sBvVH1DR0+TB3ID9T0RLICGO7+fiP1XZHkWqUwpWfh?=
 =?us-ascii?Q?Z2mNfRB9kC0v5of6W2iArSHtQTtKd0ws0BT8PbarKh458ahKD/W8qAwKYn/v?=
 =?us-ascii?Q?fmrAnt65O0CPzCVI6Ep9wd3TY5CFFAZfCz9fQjEW71lEhHVQZ2QXylu8fBvb?=
 =?us-ascii?Q?EkxkCs2/vPCwB72tXeujLGqnGiTPtlFO0LIe6lK/Cz2m3lpT8+fg7Ka8hx8A?=
 =?us-ascii?Q?VsdQ5NjdSUyRUz/4Oe2Ni2NqpQczjbfcWYd/5ADBKyn3DC1UL6r2+prGxizr?=
 =?us-ascii?Q?f2rlNJIp99UAKKo6AZYPglaPMqrVvaQIdZkaEB1piGVfur4eHoHVhti9DaV+?=
 =?us-ascii?Q?yBgJG9pTqBDjO7m3TISm6gQDHPx4E5Lx2X9YN5Lg91T0S4NUU4ETD4Ryv1j/?=
 =?us-ascii?Q?WaQzla7u1pVeh7sF8sCcl3jGSP+J+TIPOqponE6xgkGfm6RY2w2G5aAKaRK1?=
 =?us-ascii?Q?dlAVh39JVl2t44bhd1RSWpNz2KiVKK2VdCczqg0cmutckElLdyaVjDHXO5Dg?=
 =?us-ascii?Q?PYeuMfOeiA9LmlN1Abt800Cmcvm2lng/v/2m1bevsMn4bDWCp0FMbx+BWpHf?=
 =?us-ascii?Q?JtDtUssaVXjppbqzGCHlC1P6viQ2cUAXTKZYar8dbofIB2kUT2j4hG+yn74o?=
 =?us-ascii?Q?uHqct2poioE2thaD1Qv/EJFxF9r/GB0I2r529X3WWTinSYtBBNSwrzQCBhOO?=
 =?us-ascii?Q?onj7lglWAi2yWvsQeHCd/L/rxM0GeUuIK6YEF777+9OiASJtzH69vAj/qgNF?=
 =?us-ascii?Q?zj2Q9idDXoZZBmUbwG+x9d0y0ViLb3OsTaxUTHcjGN9b/yPorm3oNXSOoOmL?=
 =?us-ascii?Q?AqZPvPyZx0CcwtYV1IQj7M/yQFuVifVaxgNTW9dzGP2I8w4IO+uBbUMgyupD?=
 =?us-ascii?Q?CJ0Z4vfxqT37u6pMRdaEnlYzsODprWQq1kPVIJ1fbmX/LY6egaMC0+WMW9W/?=
 =?us-ascii?Q?ixmT/IynrByks9gnnNq3U4UPTx+fUaBotga8a4sGO9hVM5cnDEa6VRro0ydY?=
 =?us-ascii?Q?eKmHU7EJyCDvp6kje/uvfDfT5TcgILi2VWDYttRguAT8DGsNNzvvKxCj6t9L?=
 =?us-ascii?Q?Kr4ZzuF4o3Yu47yYdI9L0Dy33A6Jb0icupDoNC66r+cnejWqq0rzADdvLche?=
 =?us-ascii?Q?NaPVxWRCIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4dd431-2a8f-4f69-d319-08df439c2920
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 04:43:29.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEsmfRE1bZY7ap/ET/6z2Wa/8htQJnoqoJne4C4SIksAx/rOgLrc9yeQ8/D/D91igN/e/8R+EX99cJgFKqGczw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Hi Mark,

Thanks for the review. Patch 1 moves the MAINTAINERS paths for the moved
files and adds the new entry; I will double check the entries for the
files you listed in v2. Happy to see think-lmi follow once your tlmi
series is out.

Thanks,
David
