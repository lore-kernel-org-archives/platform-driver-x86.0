Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ABD35AC33
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376614; cv=fail; b=JiupZRFx2ZkBO77ORhCo3zkKo6FTP+8GYy4SEXF73blLO1HTXodLzgJy8bt7VNKRHwK1cqVl1D0dGkwRisAmiFgnBBX3JdALbmBvgfg18ZbOoswUF7uP1rrjKGYyq2uEzk0vW5RLODAWtti8d9XcQIUVNoD/GKTQxWTxhZnGk9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376614; c=relaxed/simple;
	bh=Pbi37WU04YLb170WtmvMGX/b4uUWVxJkT1IEt+DQ6Lw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dR/jbQU4LidGUajtZPI6HviHGhimty1sQzDJXAqwACrMIAHQkPesyUgSwSvQcPifpHr/FKAsJ8xcwq7L2nzi5gigor9fXs2Dq7DxoavY0TI9VecQNDBDvsvfh/nvzW5cURkkUsbGrIso1UH0/iIaPcaVEIDiEQJjeZtw1qENZAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dss7Ic7o; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dss7Ic7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788376606; x=1819912606;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Pbi37WU04YLb170WtmvMGX/b4uUWVxJkT1IEt+DQ6Lw=;
  b=Dss7Ic7om6uvJZxT/N8sox5MvvvWkkiagJjDbb/odOYUYpE/r9sJ1qn8
   76yCokwq/crNkO4J+qxNFpSZr1CQte7pkRusQVRpwxNzLiTHQDJhPAXnQ
   3rtzHT6EA3Va0iNpcOX+sTHroWZszRBVCDBCb4FQwLo00wQTOp8jDamw8
   GmiVu796CoKf2pIEDYyZAloPgDUlS1gvLl0bCdYLN32cMXw1Bv65/h/58
   /3b2ZTs8S33tvdjD63e/105O1pZ1SyVNE3ViAY6SqJgDjdPDHlH4RIIzX
   IvzVglfufEiAwdHNfBFtpVR7iF3av4eo4v5a7+crNBxNatTI/59wCHDAz
   A==;
X-CSE-ConnectionGUID: Y2Fj7uZ/Tp2b2xEmIuTjOA==
X-CSE-MsgGUID: NpURofIPRB2Dc9qSUl+10w==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99509221"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="99509221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:16:42 -0700
X-CSE-ConnectionGUID: EST54OLGQ26XXQte4xMzOQ==
X-CSE-MsgGUID: pYzEmyqfQ8qOrqv6jJzwMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="270057709"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:16:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:16:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:16:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0/JFk7cq196W0BBa3nWdnYvLPD6JbBWYqvCV2CL37tp3edNTLc3lweXF2SY4G4/Ku+jX+GcU8vfVttaWfXUkmcJ0sS1BtsNSlNDvF9REqsz/Pes2P1RV7KK8P1HH52t/LylUnT1GAH1m5Yd1iBE7lGvkSOGj8nctW96YfAQ4GZZQpwuTD1PInQ1mnf93AlDalx7VLT2nTVI6UJE/O42g7UPgI8Otm1ilXC9Oz8jYkFSmrCN4a52JzGwueSBSpGy4q8/kJQ6VzJ1grL+TXwna6kVOpmTA85q9MaHNedU3opzuiDXMTf7mLVytFtJRJQxcPzEK815LT4G3GZXfChL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDZHroEJ4cGiTJH1qjgyokfEz5xXRzBq+7KlTbfVRp8=;
 b=iNc+k3dhTjPiwds/BT6QGyoVDNtSQ/Zn0rK7YV+d6bgNIf4+dYVG7lEPp9GXQB+qpTQ0Aso/mXbtyBl0RfOKXslHZTPfmXQKaGFYvxmGnC9RMd+Kjm32nJeIZ90HSijijwQfgtflgDbt1pq9fDERmMW2WL0RN5DPDUk2snJ0r+CptG8b7BIeMji+idNZ6qfLCU8/HGsaszqtjXF1lvtjyxNrSkIsFoYk72/hkNN4t6E7bRNxDuFUjMvIUcBiOOLuH+jF+TGToTjU4r4Bwbhs5ulAvHOZ6bqW10ex/ccOAKQxsYmaAnzB+Obe/t+D7I5LaXviZ5W1wNFQrf+QH0CFgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:16:34 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:16:34 +0000
Date: Wed, 2 Sep 2026 15:16:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v4 11/18] drm/xe/vsec: Support Crescent Island PMT
Message-ID: <aph2DZRfHa7xqMK5@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-31-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901192736.626777-31-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: e0575f5b-67f0-41be-6f85-08df0926b3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|4143699003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: z6lPAy2fpFSWBmRCK5BmvCsZkHVXkvcLbd2jlWDkn67F9gxJiKuy+sx1HF1Kz+VnoGCOuyFBx+IL0rkolrrFpm+viEpUPpUXyDLqiIZ95mqlr0gqbxxbkM9GjP8cMW9wIDNs0z4wO4UY5byoE9/BBfbbiotUbMAxD//bcxN8vRb5H1VHkTt60vm/zyyKChd/9YjJt0pwpn9w+UK94q0YoMm18PXmCYX4iQZSI8UK6fi4gTaWFVFVcY+zBCsxPZX1g/3iFAd+TVeAclxavFOM5O5R1ILJfFALo1YuHXPjYixdpcH+RzU+MuC9Oq7BNUahE6jMa+K721Qlt+3Xg8xHWvParf+Z+HUEGD58ZHOpDjIqEhpxYJ/cjyJ7GVdwTw0Qn0xytjr5RZG45SReR9oKPB1pg3P9sRcDPP8ASd4cs9HVZk30t4BPxBYq9GeOLCt5gm9oaa/T3Xa1553GTf3Qmq/3xBZ2JCrJQDD2HYwUJ9rIC1jEDnHUPbpGQUhIb4CvYyW5KsDheYAkZse2feaLnX1L52IU0fiwSZJZeRi4JPfpH2vsOPCKZ9A3qiOI2TZSGKwHtaEHlLxhIsGWqwVS8C5+ja2rYcOe2scULGd5/DWGbzAcp7EdGm9WwMyYnXvwGtGacQK1BFQz9C9fOMm6+RpfTtXqdGf4nmzE0OPEo5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2umt1n+bc/wfy0lC2TxDRFp/B9sItPNUIHex2LNQw7kKPwyH4WxJ2QmKMoS?=
 =?us-ascii?Q?c1y1oTdGLj0b6LrRwPL2aWZscAtn5Yh5QubTc3Pxxulv1w9RzbWvsZw5vj+1?=
 =?us-ascii?Q?hCiwE75TshaYUCn2d5uvoYw7P2+HHH6Xft3kbFpDGB0AaFf+O8zVHQ1MPH5J?=
 =?us-ascii?Q?5Iy0+4nCCBe4HTZP6lb0nB8IeN92Pl8Q9RJIGihgY77nJs+ROeyqnd03l3MB?=
 =?us-ascii?Q?Q0DJ/kBzvvfeNxO7VrUzCsT4kJTASqL1Q19ltaA9HPHKpbjpjcWGfFW+hjrG?=
 =?us-ascii?Q?lUgX5W4PWaN9DQlK/KLq8aDamXdUYFJR4wAESV/B/h5rmibR/C9sueBolCNx?=
 =?us-ascii?Q?mNq689yFPfckre+6slqob4IMbWfLpMe/baczRNFni6E7UhJkQDePVQagK6Rh?=
 =?us-ascii?Q?cIflNUPZFdwC/7eVnNuReb2GE5MNhS0FQ3ioa/cYbQg2ZAlNRbErpXxiH48d?=
 =?us-ascii?Q?BzvsEOFgb30a/Wx50gB9Afz+QYM4/qR25hJddTii8tHzvvVpbkPzJpdPSh9N?=
 =?us-ascii?Q?z1Mtj+uILxHp9MOB97WwGxvAQmdztMHPMkYlfENGxNBrKXqEPlydB2mqBTdu?=
 =?us-ascii?Q?dEhw5teM9HJRfR4MPO2PTNIIgGcoiZiulHNLyNF/qP0kGzr/ODTm1ScUn/6m?=
 =?us-ascii?Q?Yf/zkby7poCj3pjcqY1BhMzWVxFAdFnMVWsWEl1XVV1Yh5XP5uSjahG4Yrxb?=
 =?us-ascii?Q?46O9KIuG8/3b+iNF1W4fRAn9yO/Z1TuICwqKY35BVxC5AcHsM/ccHpRTed/Z?=
 =?us-ascii?Q?OZ9i9Yfocw3zlteSF1oDZEWtAMIaGx4uBFaBF52LYABr5nVm20JY1aeR6T4R?=
 =?us-ascii?Q?ruY7YhuIwcJTPx4gM+48yPuumtnzqeI3caxUZ3ebCu9bQcTHFSrGk/Ty9QxE?=
 =?us-ascii?Q?oe/5E7dY4gIAJHMnNnh0r1EiOQfGXS5OR8PD9NOWRTY6n2ph1bB7V03UIThg?=
 =?us-ascii?Q?pmFNBwgjDsUFU+xRSC9yYgdgh66PFSlbwEvp0QJsScRs7glT6/8vZ5BFSYu4?=
 =?us-ascii?Q?ReU7/swm1MNLFUuA+syYUSe4rfGFf3YRrRXMWsULyYGjQhkUUEJkCoB/Zc2v?=
 =?us-ascii?Q?7TpeLuQpqn/G0zKOt0MeP3oz+Tyh5H+iAvsPVk0qQaEzLHsDiPZrsZBmoTF8?=
 =?us-ascii?Q?KKLcojBMaZkBfV0W0GUW0czTTcFvHXLdw4B7s/iBbN6vlgGilK8ktsezlcHN?=
 =?us-ascii?Q?aHYPoW/lhRoMo3r8oPiV9jp7baLmh8fyxIkaztmRDMLcbSRE6vOBuIkYZKO1?=
 =?us-ascii?Q?NQclYpFPox/S6hozCZHNsRYKW8lgasgmowIbC07rWzv59M/kM5SqbH6Ea0Yx?=
 =?us-ascii?Q?W8QQ33++poCYja+1weyYaAfJ6nU1ojDtidXsXgXSdgCKfy/p8J3/7xL5cvka?=
 =?us-ascii?Q?8GGqMAoiYfZofUzfmBlVWM4B80aAxtgX2t1yio1SZIhl7MAUvGqbfVyNT63y?=
 =?us-ascii?Q?LNI6HgQiwQaNOmu01UypnngdsrO4nsmjVcf5QmG9LzuR3gAqQyGLxwgDynH6?=
 =?us-ascii?Q?I7UMmfpkSKAogydTzCVNzcljJo5ft2gkJ4mves+TzyhQXHsYRnUk9RCKca4e?=
 =?us-ascii?Q?asTHVueeecQeuLZd9mz6Hp0R+tv/i3vHZ0yMhUefPZAkfv8gKmho6+P3YlV1?=
 =?us-ascii?Q?8jChNKmcodEF4aAibvZdN1FI3PIQ1mjanMqsZNq9epdbE52+FEz/9GqvB3lF?=
 =?us-ascii?Q?O+SjOgMw5+Ujk+lk5tJyoDkbM81JJvQRInzY6XN9y5WE+oDj//C6K90GmSan?=
 =?us-ascii?Q?PO3lywlKuQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: UcrRg9WfEbo0r+9I5KALHRTCrat6xrd6xPVoi8JJ2x7l7yWsGcTHWZl6qxu4ZSWnp050zTL0zC1LqLpYqHaXWYn2uqEfuelCLIq4FmCpBp3LIPRMjKt0DjWNsgkPpx/4XRle/awrWGjuCPOwtJf49lfUXZ7YNXHRlt2Sh4qMgb5jkoe6hVMWHVvs7KaOMIM/iERAkktwx/WkXSKl6v0hRBW/R8QnsVW27lRBLdQtKJagCFdqX2mUF78puowia+o7MLRZ5QjPOKvKdKD/n0N7dN7ug4f5ZuEpi9oxboFcIhnlXFKSmaqWLBvgthDDbTqX+hQlTDjYosaFPa+NuhCSoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0575f5b-67f0-41be-6f85-08df0926b3e2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:16:34.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hVmZbTXQn8iTuYCH/6jvSh5feXM/zutbblQ7/kkLu00OmhBMrfRYCgPfKCG/R3QuFA8cjyt0Gb+A/LFpyg0PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
X-OriginatorOrg: intel.com

On Tue, Sep 01, 2026 at 12:27:46PM -0700, Michael J. Ruhl wrote:
> Crescent Island (CRI) supports PMT telemetry and crashlog.
> 
> Add Crescent Island (CRI) discovery structure (DVSEC)
> information to allow for Xe registration.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h |  8 +++--
>  drivers/gpu/drm/xe/xe_vsec.c     | 51 +++++++++++++++++++++++++++++---
>  2 files changed, 53 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index a62ab05c6b4c..2f6658395587 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -17,8 +17,12 @@
>  
>  #define PUNIT_VERSION_OFFSET		0xA0
>  
> -#define BMG_TELEMETRY_BASE_OFFSET	0xE0000
> -#define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
> +#define XE_PMT_BASE_OFFSET		0xE0000
> +
> +#define BMG_TELEMETRY_OFFSET		(SOC_BASE + XE_PMT_BASE_OFFSET)
> +
> +/* for CRI discovery and telemetry are in an indexed window */
> +#define CRI_PMT_OFFSET			(SOC_BASE + XE_PMT_BASE_OFFSET)
>  
>  #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>  #define BMG_G2_RESIDENCY_OFFSET		(0x530)
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index c6299629dc27..0604e65d10a0 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -8,6 +8,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/pci.h>
> +#include <linux/sizes.h>
>  #include <linux/types.h>
>  
>  #include <drm/drm_drv.h>
> @@ -21,12 +22,23 @@
>  
>  #include "regs/xe_pmt.h"
>  
> -/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
> +/* PMT GUID value for BMG and CRI devices.  NOTE: this is NOT a PCI id */
>  #define BMG_DEVICE_ID 0xE2F8
> +#define CRI_DEVICE_ID 0xE2FA
> +
> +/*
> + * sizeof(Crashlog Type1 Version2) = 0x18 (24) bytes
> + * For BMG and CRI PUNIT and OOBMSMS crashlogs are consecutive.
> + */
> +#define BMG_CRASHLOG_PUNIT_DISC_OFFSET (0x60)
> +#define BMG_CRASHLOG_OOBMSM_DISC_OFFSET (BMG_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
> +
> +#define CRI_CRASHLOG_PUNIT_DISC_OFFSET (0x80)
> +#define CRI_CRASHLOG_OOBMSM_DISC_OFFSET (CRI_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
>  
>  static struct intel_vsec_header bmg_telemetry = {
>  	.rev = 1,
> -	.length = 0x10,
> +	.length = SZ_16,
>  	.id = VSEC_ID_TELEMETRY,
>  	.num_entries = 2,
>  	.entry_size = 4,
> @@ -36,12 +48,12 @@ static struct intel_vsec_header bmg_telemetry = {
>  
>  static struct intel_vsec_header bmg_crashlog = {
>  	.rev = 1,
> -	.length = 0x10,
> +	.length = SZ_16,
>  	.id = VSEC_ID_CRASHLOG,
>  	.num_entries = 2,
>  	.entry_size = 6,
>  	.tbir = 0,
> -	.offset = BMG_DISCOVERY_OFFSET + 0x60,
> +	.offset = BMG_DISCOVERY_OFFSET + BMG_CRASHLOG_PUNIT_DISC_OFFSET,
>  };
>  
>  static struct intel_vsec_header *bmg_capabilities[] = {
> @@ -50,9 +62,36 @@ static struct intel_vsec_header *bmg_capabilities[] = {
>  	NULL
>  };
>  
> +static struct intel_vsec_header cri_telemetry = {
> +	.rev = 1,
> +	.length = SZ_16,
> +	.id = VSEC_ID_TELEMETRY,
> +	.num_entries = 3,
> +	.entry_size = 4,
> +	.tbir = 0,
> +	.offset = CRI_PMT_OFFSET,
> +};
> +
> +static struct intel_vsec_header cri_crashlog = {
> +	.rev = 1,
> +	.length = SZ_16,
> +	.id = VSEC_ID_CRASHLOG,
> +	.num_entries = 2,
> +	.entry_size = 6,
> +	.tbir = 0,
> +	.offset = CRI_PMT_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
> +};
> +
> +static struct intel_vsec_header *cri_capabilities[] = {
> +	&cri_telemetry,
> +	&cri_crashlog,
> +	NULL
> +};
> +
>  enum xe_vsec {
>  	XE_VSEC_UNKNOWN = 0,
>  	XE_VSEC_BMG,
> +	XE_VSEC_CRI,
>  };
>  
>  static struct intel_vsec_platform_info xe_vsec_info[] = {
> @@ -60,6 +99,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
>  		.headers = bmg_capabilities,
>  	},
> +	[XE_VSEC_CRI] = {
> +		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
> +		.headers = cri_capabilities,
> +	},
>  	{ }
>  };
>  
> -- 
> 2.43.0
> 
