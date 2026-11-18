Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036661;
	b=fL8gMcOG5KrPSjx8N3z0Svh//HHS0OzHU2eHBlM53biAYv/qWhtALz9h02hWfTwAYdId
	 sKcMGeTRLklP0jRSzP018VgIJTm85Oywls9JhtotZzDLpfkw8Hx7zRCCJfu6wx2I++B9/
	 NDd2JN/xvrf17BAWRILZxcxp60Sqq7vo+3SQUH24uYqbi4YXXRuIUUdJLpBhficQ3Kh4q
	 lgTZBnrer4c9DnTSEmIR0/BjCQLwwkZ9vRS+UWJRYxhP82jDRdL9YqPkWeIzmbB32JUXE
	 9qCKcW7qNNDGsU2/RecRJ0qNCS7R9xUwsdsvF5oJ9RuMzqmd/FJPwveiG3N3NdnheLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036661;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QnPKHPKTWPiAM7Inyfm4PID0cxtOM5ttpr7auZya7aA=;
	b=OJrtFK75VFgrOp8kPePn8ggHHbHLlMAucwsb5VpwCjKv0ebXc2xvLS5DBDGBK6aF+qsT
	 5ExJz11NyuVakQ44MM49DGr7menqx4G2lFvGM7Ccpr3PQgY5rixIb56gPf887XggTJz/Q
	 rpaFQAQnmoZmM2lzPL5wfkJSuzBnes6cJ8J85M72vq+4bvNQakcARzYHaj8o3vTT0xsAW
	 zTtHUNCA4s0fcRJUXvd6vndOGBFg5bCVwqxzlsHqsbD6ONqNwbChso4Udahd2ekWf/d+N
	 mkrP48ONiMcmW/1ya1jlGxCngDfmGKFGAhFlgCGBD+Qs/v7/BbNJg7T+npm9iRoGT6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VwrADqkS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.58
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012058.outbound.protection.outlook.com [40.107.200.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4CC606A31C;
	Wed, 18 Nov 2026 21:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VwrADqkS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQlTpcFoMKsemSQ0d9qYaME7f6VWRFLmMYoV++yUsr1TEoUwLv8p+LthMQKa7Q45Z0o1MvI8mocAOw1vjMW8cx6KC8WTldyx6KaTQsSRPHh46cfvWVVYNHeKcPc2sg0dr/gV7L+8Uy04KBMFzFaElj7TRfuLYZ5v0mdFBdoenAHa/7qH0SctyzKTf1WwnrH6Cgj4Bo/go7N5jCMt2v19kynFCzh0u0kv1807gj4nShBAAMVqs500KOdq1DbNEZy6+4oa3vf7PhRPqsEKU0vrxj+4l8D6Tiyf0CNNfbXb9Mqw4gfyi4o+2fAcNjWiGfQpw/BZuUVrOqLpqPMTTzxE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnPKHPKTWPiAM7Inyfm4PID0cxtOM5ttpr7auZya7aA=;
 b=r5vv2VY5PjwtQRRdaMNy6g70LQC532bI9iqfVUY/ylVF9DjMaV64aG0i1t4gHAOCluJFZx0+0I20ruXWPaXOshb+tbizz976E1JEmPay/KgCi7gTNHGR+Fc4H1X0rXhUaT4bntVl+t/hTy5GXRlk7RAVmWmPI6LPLFO4dRTf35p/RGmK2pIN6Oe7UK72qnbOBZgULtChvXiq/IXNAOoLBQwzgl4gNv9unt7GnNIPMGJk6FeWZfRh+iQUmYw3StJPf2riHdHS3Bn4j1YsJY5jj0o6qDJEHgMGl09PfGjH/kTSYGhraVW5Mt8YuOc93D4L7zy0NUYq3ZhPvue7UpE6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnPKHPKTWPiAM7Inyfm4PID0cxtOM5ttpr7auZya7aA=;
 b=VwrADqkS/xiXmFHLQv8HDhAxS81NZ8DyN+Ni8+xcHalmbtGp0fZA1o5WYqZ0Y0F1qhHeF7mz9F5BDUUERyTZNbp4xo2mrqkurVEeC3Hd7qL2L46UUBnXtp04eEpNn4stQz8va4R0MyumCFxs/sZghDqLMDziMKT50rQ93VyvlmcxtHo/Z40pLsLV4usfuo1TVMLZmNAnx3Zzr2la4cTBeUG/WmEUkJcbc4C+H5opfPuYw7vcw3WM2U96Ue6Vwjj+TBZJ9V15Ce3jM8xWMlndmt3HsojkWVzcMxRHanzptdMy8eUgTUM1+CnW1xWXsg3vF6IROFtdo/gRFUblE6eIog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SJ0PR12MB6854.namprd12.prod.outlook.com (2603:10b6:a03:47c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 21:17:30 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%4]) with mapi id 15.21.0615.012; Wed, 18 Nov 2026
 21:17:29 +0000
Date: Wed, 18 Nov 2026 16:17:26 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 0/2] platform/x86: dell-laptop: rework
 kbd_led_level_{get,set}()
Message-ID: <av4V5sNfXGEaoKKD@yury>
References: <20260925193239.248779-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925193239.248779-1-ynorov@nvidia.com>
X-ClientProxiedBy: BN0PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:408:ec::17) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
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
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SJ0PR12MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b2d55d-b812-4d6e-92a4-08df45b95a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|23010399003|10067099003|56012099006|11063799006|261021123027099003|261022113327099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2w9Ml0dzvVPTITiWf1KdwN9PRjPf4M0qsL9Z7nRHpI8obQrco39qHuIDi0qMacmB+rzTz2vJmJImw4lsxn5Aixlzr0oJxH/y2owZ8aYtchZKhaHEzHf8mhsOB3xfwTbgbr5N7WASqGxZLd6ZOQsNrN8Pb4cgYDANXT5JaB82YPuKtggc6a5vb4eqCsRjBZ89yZvA5as7QCEzjjs94ekoqYyyieknO8PX/XgNxQnWuq/USnvSoguYusebqKN/MEgOx2lAltkAbVJNN/HNV9jmcyP0RRKz1zo4BNR6n/xLG70m3TG1TK/wfGHuqxq0drVWcglexvJySEzHN44YcVPD8HjUvLDG/I3rlSxZN7hETQbFPME5aJbzHTEhCBzR7UeTYEnBVIE+Hz1c4UuTnGI4Fi7lKQoraRYkOMR8zpUEwEFSrBgd8T68z1H9fuRFp5xArcLfuZFEVHAcdA23WdmdLGbRgcIlG5dHBOKziHg994MeeTNaZLLQpC06/5jItBbN50ZmgtQps8sWdMGzru9UIa0JEgBdFQyP06ZnHhuDfFbzbKEFq/nRiPMpAnnNcw+ry84ZTiZWL5RoZSZ7UNAHFMmw9SyLzuwEUigS+KnOMqDClmfNjBAQElEXQSZ54sQhFrii2vqxOSYZLM3mDueUfg9JyDIJqtI9HXOGUJHeMhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(261021123027099003)(261022113327099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SSSBsPeIH29jlCIYGiI5kFzhg/2inevq5ikDdI4mkhUAOqioKZMqc8Rn6k+n?=
 =?us-ascii?Q?tL4igRm084HIPBLdL/4tf9Hf/fgd6LSebgZkWwdudiYFQvxfnu6IyEc8+GH4?=
 =?us-ascii?Q?c4WSPGEEVfMJM+vS4RuEQXrM1xl2zvbA7DDDKrDNW/VU343dEiiVedAbOYMH?=
 =?us-ascii?Q?41/149kT5lXPJjVVzVykbodS3KZZMC9TGA4rwP/wVBHh1BWoQql+Bu40F0+q?=
 =?us-ascii?Q?hObjixc7DUhorUTjY0ea+2id/kQpa5SmXWhrSWv2/IZBlOSfcXy8yV2TV+GS?=
 =?us-ascii?Q?cK+8X9hoFd6M+6pFCu6+lGLmbqHimdezggBXDutrwzLq1RYn6AIu6vJoHGR6?=
 =?us-ascii?Q?SkfjGStjytmYXHSgYDJQaWP4zUYsw+Zh7bML2jhUPWmlQ9CMb1G6Twm3HAoA?=
 =?us-ascii?Q?utky4ZDx4ltxEtS9zWdI/kwUDpD2ooWVOw6ZwTC9o82jLUFMYtlXgabHMHub?=
 =?us-ascii?Q?U9tsJ4+griIsaS7vdMgkYBMxqYjfV10VflR1tiSD5GcCqD/y76pMoblQvrct?=
 =?us-ascii?Q?cH0wZ0/2s3CObqLdNqQIrxHzZsjY3mvlAjJqCJbd3xex3+tZs4zeglCU7tdf?=
 =?us-ascii?Q?NK3OQ1uyCruk1QqfKt+sHLoQfsXI9oikKx3D3eXCUcLJdkW6IveiOA7JOAKq?=
 =?us-ascii?Q?uWcigHsZz5cgQGAHJoPXURcWfMUXN918Hpy8DD2JdfEEw29inpJ/njYO9pjV?=
 =?us-ascii?Q?xC8HO/9u0EiCYJcCppQAVTTNo8G8SCK6Ov03bLKYNY6bWZdLPwG2V5kwufHs?=
 =?us-ascii?Q?J0HUW7tlMUi3lWp2HdxPlJ772/Itct4H7sBjvn1kTGD4W/++CvNXv7t04qRR?=
 =?us-ascii?Q?gRV25f5jCSm3OHMY6q9ANI853ZSOAoIkGf4Adhf0lk8qlcsWUQjK20KCp81w?=
 =?us-ascii?Q?NfWnlIENWFHEXG1TChhwmWWeojqplMj62/gmSMrZr3GhdyR2KHuqxaRVVESV?=
 =?us-ascii?Q?ViaVph0jRKPjZILuGl504Y/BrhlNA5T/+ybo+coopaUGcepZA5iVapC+knxw?=
 =?us-ascii?Q?Uduw6rrok3M1eOVr5l0nZnnTAVAJSQdC9ckUA+tzf5LXxjhTe5ssX8fx9i23?=
 =?us-ascii?Q?moCoth9trAVGD7XhUsW5X91IqOuUXH+hKY3nDAV6uyI636bgBnRTlPr0/UOA?=
 =?us-ascii?Q?XfL1GYBgGtSQLgSmzfIWKWcGFEav8rGEgRtC+VgXscUA07YKF/BdHMnal5dw?=
 =?us-ascii?Q?v75hr82il/+TXqbrcNKegG60oBbYbgmlfXARbTD6ALTKyo2E9y4vV/U26q+i?=
 =?us-ascii?Q?40oiE5m7PNJ6w8auwor71GKNgRT03GiTJ4pcMj8oNQAeMrks2qO5A85p4EwK?=
 =?us-ascii?Q?cfTX4XdyC08d/Oc6MeNcrvvnkcSJTJwmEgArger6ZjP5740oM8h13XAml5sJ?=
 =?us-ascii?Q?5+Fdsy3qFIq8ax79j4aQNVb7+CBpaeJ0oP41b5ujUBwAzNRxn/ujp2SrmI0Z?=
 =?us-ascii?Q?Xz0ocec3Rrrap24ivheMKUHjyPYFx5CDE5EP9P8yzGWHBV8r3rOtjcigvCOd?=
 =?us-ascii?Q?F17fptyiIao0lYzdF1mjlzUA/MiTFs8HxEzkzJLn8UyEh+N8SYT0h1Tb8zaX?=
 =?us-ascii?Q?Jzfi5LEm9zvWkJYzwBAth8r3mjgILZLjoA1vwbCJ+ktXK83jaswgApGopQpD?=
 =?us-ascii?Q?snKGmlg8pGoW4JIjftpDcTLY3thmwVIK44CKA6ANHwbtkFT7RfXl/6s11t3S?=
 =?us-ascii?Q?SglxWb4DAo2EHTjnzoISvTtgAiNbs9Y5vTNbhweFsNxpOZFQueYDQpFpaFQ7?=
 =?us-ascii?Q?E8tWhaMooft+HrzQ60vaB98rh6v77/1yVfj5uB8hXdtnbo+IUR8H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b2d55d-b812-4d6e-92a4-08df45b95a2e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 21:17:29.8781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FKEsp+Ap5GTigQ6UHLz1zm9W3M7azN9OqPbokytB2qfs1kXY2/EQQTGemCb/yGKAz599OTsSho3ESuApe7KoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6854

Ping?

On Fri, Sep 25, 2026 at 03:32:37PM -0400, Yury Norov wrote:
> Simplify both functions by replacing open-coded loops and fix
> brightness readback for sparse token masks.
> 
> Yury Norov (2):
>   platform/x86: dell-laptop: Use fns() in kbd_led_level_set()
>   platform/x86: dell-laptop: Fix token-based keyboard brightness
>     readback
> 
>  drivers/platform/x86/dell/dell-laptop.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> -- 
> 2.53.0
