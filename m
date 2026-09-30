Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A5366816
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 04:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741438; cv=fail; b=iaHo3Hni4u4UlxcuPxUkHFpVVlYDBzZOWG/RZHnJ8lm4m9moX/5zm1G/9lcHgnSY4nAYH5ru5L8T0Xzx81nBdKdX75usIiQBGYJfN5Ry8eCTxOWudY+lpGEAU0OKw3vvo6zkK7oOFmACrnxt2Zd+GVmwV237EAqg0CTS0YiDx6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741438; c=relaxed/simple;
	bh=DwQPLAMoZFMsDH2wKhSNW7d9UgyRdiyTjb+wS2zX5Ok=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MIQeUA+St9+LvrlAa1h+CiQxACFZlmEKqOeW3WUg86+WieucEA3yLDWGmbWt2MUPa088+Cs5cvBaxq8DO8eEb0Ub+v9TIfxMOxDFvqydwUCLyZg74ZW/x1qJM23T55gvIt/0zZRQAvSaiPX9xshgBz13wurW2PdA1JWya2IDBDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3mBZX4V; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3mBZX4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790741435; x=1822277435;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DwQPLAMoZFMsDH2wKhSNW7d9UgyRdiyTjb+wS2zX5Ok=;
  b=J3mBZX4V43W/xTlhPyqGUHpKxqW2YItl3B9S6qD9I00aaoyJCY8gZfex
   c4x8AlFbzlvwFzk7oZYNcfnRxdm96gwiCAScYwj/fNZNo0SBZwHCQjdor
   /A4L8yLbSdkXhN/mTostJRXvLg9iofHvsQnRUSNJvTvCeJp6B9a+SyEwE
   K/H4cxOF/NX0b5Z7dxelzgGFMcjkIZLjNmcvuX+XdnPhdb3egaTaytlHi
   LYPlEAtEDgCLojZhMtPRKCZoLomfOCVIF22kpEj2mainP6YkOVpt/XHbs
   RqEp4ZbwZsLF71SzIu5gw78rgdtW+7epFwu9WLQYANlYFycRvdghPFC46
   w==;
X-CSE-ConnectionGUID: xgh10hkMRmymOCUcfSSvTw==
X-CSE-MsgGUID: 4OZ7agFeTvq+f8eMrHQq+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90332527"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90332527"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:10:34 -0700
X-CSE-ConnectionGUID: jI9Qd6iPSJmjjY1dB6TxJw==
X-CSE-MsgGUID: HebqmRCLQXyKLsm0PJrUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274180486"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:10:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 21:10:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 21:10:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 21:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNdSbceJxdB9jbCxQX5FKclaQjcB+Lmnv4SykyFfP4pWP/5Ao6xRCLxfxw1uAHbKbHGkPvpAMpnWumko50MV85kJ+YNrMhDOSY/nkTSx2ZvmpqE5NenVPn0HhyvKKE9b9kaK35VphhCbwZhbFH0urMPer9irCj/D8DPkOcpyHailuepLd3A1riqJEg7xM8svGAg5pf4bKieCkuCE0DFQ5tBDDahYJBJn8qH6BG4TfyoSSFmr6zzKwvuN6yRs29YedppW6wx8AHX+eCwnf/csj+O0QNEmA9joVNHEC0atrs9bF9Xy0hgKgQNv2g7h1BVnikqc/ndXTc4y7TM2SIyJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxWAT7fHbpUIlVuetn+PqaJHF5bHw+B5aorRi0LxV3c=;
 b=ryoaOGDh2qmA2y8/xqqS5VqbcofX4JEa6fnYRvS+UBouL5e53SeYbn/5TMzCQSPmrFhqcv7Nq74ZqdFg0dLLD0Kf+YXShCT33EPnrGK5ERMoHGfqXTBnFZLi6NgiyFfDRpqRIxVeF5A7MoBi8Jv4o8rvSnvdrgSH0wKKgedAFGTOkEqgI/eXdAxO2dM61hnd98tcHMSjFCB6om6yPZB7I2CdUzVsfOS1tmDtb86KCNTFxBVFqZaco0JiT41hZ2Z37fbONcMt+ib2fWFzhW7V5y92qoE2rxmj2nYpxwUummy7jfIBgMhKn6WmW6iYRXF4pnuvPM/YxOCVT7z/XeJsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 04:09:43 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 04:09:37 +0000
Date: Wed, 30 Sep 2026 00:09:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v11 17/20] drm/xe/vsec: Support late bind fw information
Message-ID: <aryLbyn1nW5CysJC@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <20260923181115.2514193-39-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260923181115.2514193-39-michael.j.ruhl@intel.com>
X-ClientProxiedBy: JH0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 566f7a11-d004-41de-8080-08df1ea8a474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ekLAO02p7KdR1VQ2VjjpZ+zuElHO9NrAcwnJ4tor7BUWDh/Taq20gPcCIyYSmeDe3fz2+7Ll4oMX8lVAOUf4f1fVjQxUd1q3RwFtubPbF34PYMezN257XDyKyR1GBF1r9SjdQW1EiIt53SxVHQQCBdG8YsCAUcCKYpTlpx6E+uuV24PnXCQ0iQUzmPoDEe7oXVS8uVMU001mw0BwsdlwP0rLSjvP8tV14mJVOM/jqvI23ihGdos2HwSAd0iTosiHuZn6F+BczXQFeE7WHwuCWiWseIdCK0k1dgE2JiUjuPa3Hbr4oH6r56EM2WlvRabYSUOzUit7bVysKPFjUUsRWjhPjUwGa9mvvcTHO6aGO7iQcZR6KWZNxjA7TmTK+51IKJKzO+aLhjR9Pc3jC/TjiaYS6gnAOWdzl+l4ugD6MKNrBGo+WMtU/Ta/k9EXDrfbENM0C8j0nUtrlK9tsB5t7WCSJOQ3BexKQ5WSvl+de+vRB9j3w/IQJPWCGDUVaYk4Zy4o6VC5eR/OfieE0425y4Bid4ePwNEs8R2isNLf88S40XRzSNCbrBvyLgf5GnV83FyJUyLvsEHYR0H7qYdD2OjeJJa16D7lvzJwyhjCJbD3xebk2bVOwO/OnHW7GHr2YoDQgFaQ2PALiaxeowx7Z0DcpZ9amH5wCro8k2MYW9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cFTzjw0TYyhY+jyhUSjIqRUOegAH51HzqrEskbelI7XZcWZ5c3QK1obtDM6h?=
 =?us-ascii?Q?GcVycoRn9wMTildR+vUtHqnOAZP6ZvltM11iuSpfeEpDhMjy3CfMFY0MrXa0?=
 =?us-ascii?Q?z2iY63iLh6Q0w2QttFPtxZxtMut3JiNsLfql7fbV9hi8XYtgCZWsqHRObeAm?=
 =?us-ascii?Q?aggbsuoEbLxUDnCkMG96gMteci271jpQS8xxKR0mAe+hn4DV8Re8B00IMEr1?=
 =?us-ascii?Q?esquroGk90/AOxcy/LbBeI+0Uf45oTO0vsISbFEvY7vsvpziraeumyqlz/8S?=
 =?us-ascii?Q?BjzufySj+eqyHWOEXtjaH2iMPF45H4h1zrSNxFipgyhNa5/D7w1YEA8o/Ght?=
 =?us-ascii?Q?85Cla4s1BCA2uhb4N5DCPdsuHLRdvxQVILdCvtQXZ5YBIQzFxHNe7OsmQJwn?=
 =?us-ascii?Q?Qn4tGpJ/NRBbuKVptLdO7Gol2K7Ce1Aj9KFicCTW/iQiHagbDI0K4BHiGWIp?=
 =?us-ascii?Q?3H0+NHwWMXNsune2NnIUcUNN89S8TTOXr/eq7Ugy0vwgbrZw2TjjItb7pXQ4?=
 =?us-ascii?Q?/dESMfGGDCHgf/XztV5tgCVDHV2TBiIugvmqVprlk0gQ4n5WLxyNOddmHDKv?=
 =?us-ascii?Q?w/z2Vpily3TgICzjvk8auHPwChST+xbA0ErtcWN3AQFSvgtG+BfFieWt9FaM?=
 =?us-ascii?Q?93BMYHwN0lvhB4vcajBGo1axQJW11wni0aJgyNgrPJ4vrO/dOBsaGF3E8KRD?=
 =?us-ascii?Q?7aTBMeGkwEWge6iL6AvN2JgWvNmPcAQHaENGbQuvn8rkr1PoAWB8ZY0MeRkq?=
 =?us-ascii?Q?e9B2fVcKhfooNTqfCmV1QvYGsMPBopKf11vCbbP5/Y1T2RMsHEMZlQSsX6c6?=
 =?us-ascii?Q?RlOdqCzY96bb/heSb1gObFaAfMSCQhog9uThgX+1njzHiTtQMjm1WCRO6E2z?=
 =?us-ascii?Q?OpL+6ihNknkhcDDw13CsLJSiLLDM3wSb1IjbT8XD88cdmNNs74xVDN9VVrr0?=
 =?us-ascii?Q?bqm0TueoOMJH/TWSi+aWpxac6K1/NsTafNvaBzZ2FnKNJ9uPVQ0k+fqfjRUh?=
 =?us-ascii?Q?90Kc+5eJMDFHhfrCqJF4wGwMPCPIqEnSlVUYVeKDPJgcjcKIH6uHgrbscZe/?=
 =?us-ascii?Q?jqOZSLEPAs5+15/QM7O2+LUp0CrmPc/jrNFWuihD2RvguFZoSPcLhMWJpx41?=
 =?us-ascii?Q?K6Dataq8KF45SbAOEOMt+zJn4Mf/vk4x0IkWmVqEfcecj7BLLp2xqboGm8+p?=
 =?us-ascii?Q?VCH7klHaKBLdACMPhWAJFYb7fz/4JDKuX2LTmUMmuvqdyCw+dbJjNsNaH7bq?=
 =?us-ascii?Q?k1z63zi2D46hidIc3pTAik/yELQPSSZQepUtNHDneFuGo/leZzVicfB3WHcx?=
 =?us-ascii?Q?nQoSFDYq0MWkQ0h00WInGvd20ZMNUbJvR157BIYeHM8gX8Rf5yu8eCA02PeT?=
 =?us-ascii?Q?vUSHM38n1pMlallyq8TWaOzNZmv6qWrQ91Begq8PPrjoZFVV+816uOuRoDEe?=
 =?us-ascii?Q?8jLyNvjmvDmsq5tJqZhM54UPJ8k9G7fwXIect2kgGiyLDxG/Vlox/QSyjx8O?=
 =?us-ascii?Q?5hovueq/Ruybn0uzmhz6EjPdB6AZDJQXXwKgKPppgcPf6o6bmxa2H6l+P3em?=
 =?us-ascii?Q?o42jj5jsix3P4JHHZoIE4GATxYK2z1W+WxD71iZCshgc6VcdyuvcpGaWgRzA?=
 =?us-ascii?Q?J8LNNnIR7yTTIVl29OF+rx+K8ze2DB1WDjBloBCq/8SW/VvmlxMp6ikAkS/g?=
 =?us-ascii?Q?MkTlNNJlbJ3ZYwe+wxFZ4kmtCR40v9bKdAWnV1wR6IJbJMUNY1YCnSFOTyiq?=
 =?us-ascii?Q?xJhVvE5o3Zyr0mk1CDcy0Rb5difuekc=3D?=
X-Exchange-RoutingPolicyChecked: Lqvi7QjZWJlft4XI3xxNf4atYHQU8x0bLtQXcMya+EfS28oZBhBrKYLEyvqJ/6MdHzePZ3A14/h0U8E+7I//+HnAyFAVcFduxJRnFBAccsYfWSMX9SeN7zmoCo+NXeZerF9RktK6uoGv8+bigYkbnu1LxW+dEeYkMyyHoZjmC8ovPBr4Y1BDj3c1wDw5vgYiHs+rfOoqBzUCyYx59UGVfWF22Nl/PmgTU0xAM6Q5ozwdg4V49FJRwalbN/iFRArE2OMc5KTatM7nslq7HqA+6tiaJ4tSIK2Ntf7yHqbR7DBvk1xAATAOyk8N+L53tQoE1kAlIbua5kzHSZN0/u58zA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 566f7a11-d004-41de-8080-08df1ea8a474
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 04:09:37.7243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuqJg2lSNPxZA2DxMJaZuyVASsMIX74GY4PyF4C9NwJ2q1hdQeROcu9hJk7ecy0YfXCHLGq5x7IFUvcNcaKnKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
X-OriginatorOrg: intel.com

On Wed, Sep 23, 2026 at 11:11:32AM -0700, Michael J. Ruhl wrote:
> CRI FW is loaded on power on.  Because of this, access to the FW cannot
> be done until it is running.
> 
> Update the XE PMT probe and access to check for late bind devices,
> verify, and wait for the appropriate FW state before probe or access.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

We do need this patch. One potential but unlikely corner case is the suspend
while this worker is waiting... might be worth investigating, but I'm not
holding/blocking on that:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>  drivers/gpu/drm/xe/xe_device_types.h |   5 ++
>  drivers/gpu/drm/xe/xe_vsec.c         | 129 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
>  4 files changed, 134 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3ec950606e67..a2c8c7909688 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1053,7 +1053,9 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> -	xe_vsec_init(xe);
> +	err = xe_vsec_init(xe);
> +	if (err)
> +		goto err_unregister_display;
>  
>  	xe_debugfs_register(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index e08348a95b28..8f5cc5d65419 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_DEVICE_TYPES_H_
>  
>  #include <linux/pci.h>
> +#include <linux/workqueue.h>
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> @@ -488,6 +489,10 @@ struct xe_device {
>  		struct mutex lock;
>  		/** @pmt.base_offset: device specific base offset */
>  		u64 base_offset;
> +		/** @pmt.work: support late-bind probe */
> +		struct delayed_work work;
> +		/** @pmt.retry_count: late-bind probe retry */
> +		u32 retry_count;
>  	} pmt;
>  
>  	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 0f6e3be520c0..5384fef5e5ac 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -3,6 +3,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
> +#include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/module.h>
> @@ -18,6 +19,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_pm.h"
> +#include "xe_sysctrl.h"
>  #include "xe_vsec.h"
>  
>  #include "regs/xe_pmt.h"
> @@ -173,6 +175,14 @@ enum capability {
>  	WATCHER,
>  };
>  
> +/*
> + * Late bind will delay 100msec for up to 20 seconds
> + */
> +#define VSEC_LATE_BIND_DELAY_MSEC	100
> +#define VSEC_LATE_BIND_RETRY		200
> +
> +static void cri_late_bind_probe(struct xe_device *xe);
> +
>  static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>  {
>  	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
> @@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return -ENODEV;
>  }
>  
> +static void cri_late_bind_probe_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, pmt.work.work);
> +
> +	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +		cri_late_bind_probe(xe);
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	xe->pmt.retry_count++;
> +
> +	/* wait up to 20 seconds */
> +	if (xe->pmt.retry_count == VSEC_LATE_BIND_RETRY) {
> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to complete\n");
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	if (!schedule_delayed_work(&xe->pmt.work, msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
> +		xe_pm_runtime_put(xe);
> +}
> +
> +static bool wait_for_fw(struct xe_device *xe)
> +{
> +	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
> +
> +	if (xe->info.platform != XE_CRESCENTISLAND)
> +		return true;
> +
> +	while (retries--) {
> +		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
> +			return true;
> +
> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
> +	}
> +
> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
> +
> +	return false;
> +}
> +
>  /**
>   * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
>   * @dev: valid Xe device
> @@ -343,6 +395,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  		goto dev_exit;
>  	}
>  
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
> +
>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		/* set SoC re-mapper index register based on GUID memory region */
>  		xe->soc_remapper.set_telem_region(xe, mem_region);
> @@ -350,6 +407,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  		memcpy_fromio(data, telem_addr, count);
>  	}
>  
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -397,6 +455,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
>  	disc_addr += inst + offset;
>  
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
>  
>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -404,6 +466,7 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
>  		*reg = readl(disc_addr);
>  	}
>  
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -434,6 +497,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
>  	disc_addr += inst + offset;
>  
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
>  
>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -441,6 +508,7 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
>  		writel(reg, disc_addr);
>  	}
>  
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -477,12 +545,46 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
>  	return vsec_platforms[xe->info.platform];
>  }
>  
> +static void cri_late_bind_probe(struct xe_device *xe)
> +{
> +	struct intel_vsec_platform_info *info;
> +	struct device *dev = xe->drm.dev;
> +	enum xe_vsec platform;
> +
> +	platform = get_platform_info(xe);
> +	if (platform != XE_VSEC_CRI)
> +		return;
> +
> +	info = &xe_vsec_info[platform];
> +	if (!info->headers)
> +		return;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	info->priv_data = &xe_cri_pmt_cb;
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	intel_vsec_register(dev, info);
> +}
> +
> +static void vsec_disable_late_bind_work(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	/*
> +	 * If the queued work is canceled, the runtime reference needs to be
> +	 * released here.
> +	 */
> +	if (disable_delayed_work_sync(&xe->pmt.work))
> +		xe_pm_runtime_put(xe);
> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
>   * @xe: valid xe instance
>   */
> -void xe_vsec_init(struct xe_device *xe)
> +int xe_vsec_init(struct xe_device *xe)
>  {
>  	struct intel_vsec_platform_info *info;
>  	struct device *dev = xe->drm.dev;
> @@ -490,11 +592,11 @@ void xe_vsec_init(struct xe_device *xe)
>  
>  	platform = get_platform_info(xe);
>  	if (platform == XE_VSEC_UNKNOWN)
> -		return;
> +		return 0;
>  
>  	info = &xe_vsec_info[platform];
>  	if (!info->headers)
> -		return;
> +		return 0;
>  
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> @@ -504,12 +606,26 @@ void xe_vsec_init(struct xe_device *xe)
>  
>  	case XE_VSEC_CRI:
>  		xe->pmt.base_offset = CRI_PMT_OFFSET;
> +
> +		xe->pmt.retry_count = 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);
> +		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +			schedule_delayed_work(&xe->pmt.work,
> +					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
> +			return devm_add_action_or_reset(xe->drm.dev,
> +							vsec_disable_late_bind_work,
> +							xe);
> +		}
> +
>  		info->priv_data = &xe_cri_pmt_cb;
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  		break;
>  
>  	default:
> -		break;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
> +		return 0;
>  	}
>  
>  	/*
> @@ -517,5 +633,10 @@ void xe_vsec_init(struct xe_device *xe)
>  	 * resources.
>  	 */
>  	intel_vsec_register(dev, info);
> +
> +	if (platform == XE_VSEC_CRI)
> +		xe_pm_runtime_put(xe);
> +
> +	return 0;
>  }
>  MODULE_IMPORT_NS("INTEL_VSEC");
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index a25b4e6e681b..c4a1e2fc67d8 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -9,7 +9,7 @@
>  struct device;
>  struct xe_device;
>  
> -void xe_vsec_init(struct xe_device *xe);
> +int xe_vsec_init(struct xe_device *xe);
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>  
>  #endif
> -- 
> 2.43.0
> 
