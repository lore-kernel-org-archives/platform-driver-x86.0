Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3118331A4C
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 19:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787598942; cv=fail; b=fCD9fUSl68z6uW/TJa1dNJm/8PIlOY7PID5sRFKbXvvVOywCQHxfeD7jtMmnYnmLklnT4HYIaJEkL7xHCYFXUuBo6OupUNVuUO7xNFYXMhQxwtc19CoFX0ofKS8F0K/s16u7k6GcEWLouyCe5q7kPhjwqsJprHlDh+WVYKDg4sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787598942; c=relaxed/simple;
	bh=kllBOwmq2uQXfhNQN5wzyDyoazbPz2165ApPEM8s0P4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TSCV157jpbzdzPb/H71mEBldfww+uQhE4suge4ku5cdlG5efHO4sFh+j/51JpurHSS4gbjk/K0uxAitrjR5cMnZLMcgNHllh5DOof37p0MAumOPwmKQ6kfpX9kkVBtwuZwdjBcVxSaPE9pQi69Hw/nn////bhIyodEXVVVWesFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Elg4fsHw; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Elg4fsHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787598940; x=1819134940;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kllBOwmq2uQXfhNQN5wzyDyoazbPz2165ApPEM8s0P4=;
  b=Elg4fsHw34ceCMH0otr8idw5EAULRbus9KMProGqvhomDm9yTPJTnAmB
   I/Zb0DCloi1nSHzKsv7clTH9d9UWgRE8/s+9ZjRTtCs51a5luw1aXFin8
   mtGA+A7HvJFT8qvXHAUADgoPUzf6D2G0SFNpJ8mDVKaZEf0+uJEAtYr7T
   1xY8LuqbsMJ5JfUo5dp8wtJfcfaHhTgqR01FWw837JNM/q44kHhpHbHbY
   KWdkj9KBvfPFOSVkJk+ddHABUnIbnmJGAuP350k/+T2F7HYvY0D7KR76/
   3aMJ34RPcn07RFNedGv8NQ1hBH+wYnEPgYV0FdFZ7ic66Rvgue1MpgoLc
   Q==;
X-CSE-ConnectionGUID: jMT6lLYIRAuI/uNIwxqHOw==
X-CSE-MsgGUID: NHbKqV+lSGadJI65DGl/rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87182248"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="87182248"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:15:39 -0700
X-CSE-ConnectionGUID: +vTHWeZMT1CuMMk65ElIKQ==
X-CSE-MsgGUID: Tnf20sxbS8SLxa4ynb2Q0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="290612059"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:15:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:15:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:15:37 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBcp0ZYh78HZy3QDTVMXMlV62y+dnmL0cXgt2bBEi+QM70MyfExHcSJAqDXZ3H4qZb6qoOtabBQO9EVSqjXLOhtZeTJq97YCFuDV/cy4QfjKbAnPXdYOItBXUboQZEKT64vHTbJlruKZdjOptGnJHrcavp9w1qtqxzbLDwg6r1gr3kthM7ynneYdydgNF+PyamKj7gGxLBFIKvQF86ezDvAulm/mMYNXbHCElSxIDZ23Nz1Q/kVEaoMu//xutmz5U3bhCe9WaBOxLhrpfGI7xZHp35wEEH46si9TgOaQNTCJuAyLJ3rqAnrx24u8FL1+XJHPMiVsTarTcTb5iOz/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6NYGrM1Iwrldhx+qd5hTGan3WGEp0mWbBYSwMivew4=;
 b=ZmJdR+ycgDepcvvxyRBj2MBsY2VcjW+9cTD90x3Cpy5Zv9n+xYj9BdZzpbwOfZt1sHxAyWxpZVWmUbZERYJipYdGUAakwXHZMtzsU5637bm2AIMTOwjracnJur3ypy8UPPhn4iG0GpfWfsdlLeFg33jGijx5MP7yKg18DIWH3+PUbtkRH0fIhGsTvVs6itAbbuSCVZH+7zoB1HESVhDliGreYOc5nDPl1zJEz69glbVlSuiyxEmtLakH+VjeHH6SX7+HX7GXf3iQC0lm84YutBT3jEvNb7tTgKoYr5T64hZW8N6C7sBKB4VotTRfiSuU0skrsGBE/Pli9sUeCGBZ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by IA3PPF235E846DC.namprd11.prod.outlook.com (2603:10b6:20f:fc04::c5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 19:15:36 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:15:36 +0000
Date: Mon, 24 Aug 2026 15:15:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v3 09/10] drm/xe/vsec: Support late bind fw information
Message-ID: <aoyYUxEN4PTA0s1E@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-21-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260824162317.2450380-21-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|IA3PPF235E846DC:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc5badd-895d-45c1-0ce9-08df02141396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: fIVlSzJ2g8bg/n8dhZQ81/o+aiZUAiPCAPZ1MJ5pk93bqT8h3ujFSgeqSKJTnCNyDxjhxAvREeN1FwNDBQ0sGeuB3nBguumxw79Yp85Y81kvctlAWolpK9Q1F790MV383H1vVXnewkzuZSSi0xmSC/+f3ik9jF14YsE+94hHeQ5gLOyNNHqvS3AhCX64JWehu1LXK78Fvro4NUkEljpO2kiliVb7l8FCv4kChL7mPWigJLPvo0yh1GLRjQkRTrR2ExHMfyHbZGRHrl1YRNF88YQLP9yzu4lDOnM8ZXuUZKwKhktJWZlvfovSFj6orE3Xkc3dbMmYf9hG9SW3GZG/BgfQe8YGyE3Lq8HNcusIjOY6hfKRPRyCmCe5vzSGHC6qeOJhQMfsRYmBYJcN5UGv+kFCVHoQPkeKzgOLeaH0hthifrvD8KiCWu0407jaYTFiJeA6FsbXYeMNy3REoeo+pllXiy3ogG7+MUqNhW9tYT3dUfWXy8l6bYfJfTo7YQdLO349SIDJ9EawwKP3Tsnq7sJDohOoL8R9f5CVmkvDlov4f8uu7jjFRciwsWvrEHF7wAmZUABlYBZoMMtMM254UFIByWwmQrXCpVzufnrZgBWlhpi+ylNqZaHiLKYdbqqKYmhY4dPJOo7F6FDNrsDNkiPyvirox7DuuYtlZVRoBkU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BYSBpUwwkotigK58FdNRCulad3QgyCneFQmuirfuM0IGnUo2g+zHcZ9O8w56?=
 =?us-ascii?Q?HQ+xoqXEiknIlLsCZwjJLkuRXV6J66rx6+Djs0GtTk+PvVywozhdpc21ERvN?=
 =?us-ascii?Q?k1vh8aDrxlyUg+gXeJVmMO03xuGpr7xvxorZcieL9wNWRqumc3YHVflHOw5N?=
 =?us-ascii?Q?BdfEsgEwqpDf4KGFs2HI6wsZcPB4I0si2WQFhASc58yY6XX6Akd6G+L2Wi0D?=
 =?us-ascii?Q?+eKsRb6VK7C58qRkRaFeQcvoAibZ0uE05gc7gjvxW1duvHkKSIYT2jDLgkjQ?=
 =?us-ascii?Q?jhYpYi7HtEJjEUuFLfWGzZPu+V8GVTGkblzH4mt614+sLIVV7jeTeiL+1HVg?=
 =?us-ascii?Q?4L5of5HMMj4LIWpvi3KqhufZbMEbVBEkU7s/6vAnEHHXxJk7JcrOtA0Hn8RF?=
 =?us-ascii?Q?b9CsdtRkruN+FRqDUiEq9u3408a8YDV/LZB+YsXRpWKbQpMY+pKfIx2M7wPd?=
 =?us-ascii?Q?GKX4vNhJ5J2ujg7GGno3PfvB21NSfBQrycx4jFLTQzBdPq3wj4tsJNduUTow?=
 =?us-ascii?Q?RghKQ8QrjuzA/iq3cMOTQQADFxK9xbrdptJ/i3hOkGSutGz36RqPr9G1vN6Z?=
 =?us-ascii?Q?oSDWUE1TUyFAdmHLkAFOd+AmnY7fWeqX5jwabila0SkPOWC8P6uBJRAxQB4i?=
 =?us-ascii?Q?9V2a8tUDlByz+n/+lxWO3p9dabXACbc17aFMaEdKvKTtFXF6gJtp7Fro1h74?=
 =?us-ascii?Q?4A8hrCTfeQjh3Dyav2svrS395G9jeTetNkeK7PKj3Dq05c9e04T31tNz1a5Y?=
 =?us-ascii?Q?pRR5QkyZ+BD6kb2qbUE7ioB7FE3IYORLmutkCg7VxSCaZf79T9piTGopl82y?=
 =?us-ascii?Q?W+catD45bECyE2Ciw7YorWh+l2GDpAOQtdScaTFL8hznyM3faqzq7IlQKkSE?=
 =?us-ascii?Q?rdyPeREXKoMMplzRDhnGfGYfUovjT4aUEwKvf4uVmzD/WH5KeETTQt1MHmPy?=
 =?us-ascii?Q?Pu6wivu54o4G8p10Nq3eGWjK0rm/Wmuz513i1xcQityQhfjt9KPIA41nK9TN?=
 =?us-ascii?Q?0fbWeKMxCXLuLjzo8zxQ6hrkj+JsoV31ZdSAHXew5hw4GtCJK2dBhQHV+Snc?=
 =?us-ascii?Q?Xsxld7DNwlVjIwqu9j4AGtIynplxZCiLP95aAKdTCESel7hULnDbRv+8Zb7U?=
 =?us-ascii?Q?iGTzPmVc5rgFP5i0Av4IQz21qkxAtw4ok1eWpBgKysp3iz8l5g6Gmjl/7XK3?=
 =?us-ascii?Q?3h2R/0sv9RQ+jP56MCL13O3k+qYB8z8oM5p8mjuzE0xf7+nNDUOCTpXAc98a?=
 =?us-ascii?Q?eSGDkSaoeetSJdkstLMfR3wlJzBetCJWXWD8xPOTmygnxLdoF9yW2XxfXMIh?=
 =?us-ascii?Q?iaJDEXawogT1kHVOc/NCoJzLDCiESY9t5oRK37b+2ZGfwSj8lsoJXyRdKS2j?=
 =?us-ascii?Q?0TyrxZIMMjY1gZh83VPFsdRF1MkR5ceTcBcpZH3lKlgqYGdGB4ZLndiuxXFq?=
 =?us-ascii?Q?tsLifOMRcPkwFD8/EeOMKkLsSF5vw51LYTUMlffbfBcO5IXKTsCbwgouBqrd?=
 =?us-ascii?Q?TxGitZExQ+2dfdOulDPz9ZDIt5vpEgIQCMUJ2DnBbsb8VNFRxVGPqf6gM5m9?=
 =?us-ascii?Q?UZThgx/8iojZevZ3r2HhbE4kRwXxMQl2wpBAmf4IlqgvN3v08g/0DSG/g6QB?=
 =?us-ascii?Q?jTxN+1ipkDvmxqInzNY0QmWUHSaVsfrhuUZk68zCA+f6lkqJ6g0Na2wDWMS3?=
 =?us-ascii?Q?2nauQ7UoK+Up7mu+n/w9ReSYWe/bfHlkF9BtqkkUq1pFqVEBlppO5hNCi7No?=
 =?us-ascii?Q?ZUBp3N4YNg=3D=3D?=
X-Exchange-RoutingPolicyChecked: L3VYT6gn8+jmpRj9oiEc13OG2nKyUs/bj++Hh1j156NGz3hHfy2ZAxJc5OOtFMulXwn0X9E8cK26F6hJWxehPKJiesnEvQl9/v9fJ65r4LV3p8A+T+qV0p2LXXjWU3F4sdOKPtuw/PB4+Wr8uFVP1Aypkt5CgqiklEkNZM/LPJUPljAQTlUBfLi3XJUqZVtEeyesWrh2q8xpFomaGje+QbjhhjQAdA9zPBXaqtb6gWytRTuo7iDPUmrt8W79c8N+gxwBu/OZHOPmxBM3Y2QTF9tl1JAzJQBX2a2v8DnJMBK3TBYjuoysQefbcZb9clXd9GQZZuKOkzrB5gkmQt7TEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc5badd-895d-45c1-0ce9-08df02141396
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:15:36.3611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZro4hrctYUQ3HbAtPt73rM4uHRYPTzfgmPU+rMAnPTloT98p6/msN2vRE7iJ58roRxLJcorCSyUropWLtRb6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF235E846DC
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 09:23:25AM -0700, Michael J. Ruhl wrote:
> CRI FW is loaded on power on.  Because of this, access to
> the FW cannot be done until it is running.
> 
> Update the XE PMT probe and access to check for late bind
> devices, verify, and wait for the appropriate FW state
> before probe or access.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_vsec.c         | 141 +++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
>  4 files changed, 143 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 74d566693dfd..bf02f881095f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1140,7 +1140,9 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> -	xe_vsec_init(xe);
> +	err = xe_vsec_init(xe);
> +	if (err)
> +		goto err_unregister_display;
>  
>  	err = xe_sriov_init_late(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3f1a70813a99..5d9e6e66c665 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -468,6 +468,10 @@ struct xe_device {
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
> index 578d59048b39..edc20c24137e 100644
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
> @@ -17,6 +18,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_pm.h"
> +#include "xe_sysctrl.h"
>  #include "xe_vsec.h"
>  
>  #include "regs/xe_pmt.h"
> @@ -162,6 +164,14 @@ enum capability {
>  	WATCHER,
>  };
>  
> +/*
> + * Late bind will delay 100msec for up to 20 seconds
> + */
> +#define VSEC_LATE_BIND_DELAY_MSEC	(100)
> +#define VSEC_LATE_BIND_RETRY		(200)
> +
> +static void cri_late_bind_probe(struct xe_device *xe);
> +
>  static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>  {
>  	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
> @@ -272,6 +282,56 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return -ENODEV;
>  }
>  
> +#define WAITING_FOR_SYCTLR
> +#ifdef WAITING_FOR_SYCTLR

I'm afraid you forgot to remove this before sending... or what's the goal of these?

> +static bool xe_is_oobmsm_fw_ready(struct xe_device *xe)
> +{
> +	return true;
> +}
> +#endif
> +
> +static void cri_late_bind_probe_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, pmt.work.work);
> +
> +	if (xe_is_oobmsm_fw_ready(xe)) {
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
> +		if (xe_is_oobmsm_fw_ready(xe))
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
>  /*
>   * xe_pmt_telem_read is a callback API.  I.e this can be accessed external to
>   * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to be
> @@ -318,6 +378,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  		goto dev_exit;
>  	}
>  
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
> +
>  	mutex_lock(&xe->pmt.lock);
>  
>  	/* set SoC re-mapper index register based on GUID memory region */
> @@ -327,6 +392,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	mutex_unlock(&xe->pmt.lock);
>  
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -374,6 +440,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
>  	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
>  
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
>  	mutex_lock(&xe->pmt.lock);
>  
>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -381,6 +451,8 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
>  	memcpy_fromio(reg, disc_addr, sizeof(*reg));
>  
>  	mutex_unlock(&xe->pmt.lock);
> +
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -416,6 +488,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
>  	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
>  
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
>  	mutex_lock(&xe->pmt.lock);
>  
>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -423,6 +499,8 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
>  	memcpy_toio(disc_addr, &reg, sizeof(reg));
>  
>  	mutex_unlock(&xe->pmt.lock);
> +
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -454,12 +532,44 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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
> +	 * If was work was cancelled while it was still pending, we need to
> +	 * take care of releasing the runtime reference
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
> @@ -467,30 +577,44 @@ void xe_vsec_init(struct xe_device *xe)
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
>  		if (!xe->soc_remapper.set_telem_region)
> -			return;
> +			return 0;
>  		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
>  		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
>  
>  	case XE_VSEC_CRI:
>  		if (!xe->soc_remapper.set_telem_region)
> -			return;
> +			return 0;
>  		xe->pmt.base_offset = CRI_TELEMETRY_OFFSET;
> +
> +		xe->pmt.retry_count = 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);
> +		if (!xe_is_oobmsm_fw_ready(xe)) {
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
> @@ -498,5 +622,10 @@ void xe_vsec_init(struct xe_device *xe)
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
