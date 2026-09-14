Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED48C47140D
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402453; cv=fail; b=niF2uHCD+NX4eo9yCxtOGoLaThxnFfemrksRF94yPUYus8//oKWuh8hvaGsPeh4MYTRuJZCCKiQAaLfD8S4TthqQeGC0oB4vNXV+637c4NkUqt3Hvk5ufskNxNmZPKs3Qd03Sm6gxgsy3S0Yc+9lGWmS7pO10AJLTBQhJFupKfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402453; c=relaxed/simple;
	bh=1Ca6B3qomox9WXiP67Bn150v6eASX9hPKPVkIU9eRJ0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P0Jr7HR+kGs7KesCkZ0hZwJWybQzk4lm6NGYAsmkbuRw33j32s69rXxWJMPlfRVisR1F8eOstCSUOeReuDU10jzN0vbg3W2r763/SqAWfcqM6YtKnPPmk4qkPtenu1XmHo6vveJ8hE5WBJ7ZVgLhcxYawXl6J91Wt4LhrmNY9xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbP900Vi; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbP900Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402452; x=1820938452;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1Ca6B3qomox9WXiP67Bn150v6eASX9hPKPVkIU9eRJ0=;
  b=kbP900ViyfhXa5Qakm4aZN2KnuxmtXNPIGRwh+hhgy5vYcX5jd01uxy3
   +6pmo3hAD/bT2kt2u55TIu+J3EuuE1Rn0lqDV5XrR9vE3M8Ax0R43Eohr
   9zwCYxvQuEGmMTp5RpJmZQPh5p0Lt8kcaD1R1ZBR9fAYfQS7vdVohtZFT
   eoMErkKrNIzTMq9VFfOpojH4UWSbw74gCh1Aae3b0ENd1zQLHZfEeEZOt
   dU22mj4fABM/Jm1Dm2vIIGjU7xrW5yhNjh4BrXXkK/cMfASohkis4OXOE
   SKCsJYp7jsDiPhR4mOuB0GPuHpWNjwYv6kWGWctfE/rr9tul23xANetlD
   Q==;
X-CSE-ConnectionGUID: 8PlZennvSyOZVhatEJbYwQ==
X-CSE-MsgGUID: 8Q2xsIKITsalgAFTRynXYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89521590"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89521590"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:14:12 -0700
X-CSE-ConnectionGUID: 7wGH3SCdSdyAi2qwjRKopw==
X-CSE-MsgGUID: tVY7gOKPSv2266MVFP1tMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272653899"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:14:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:14:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:14:10 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knitSwQou7N7NRPNEokmjWqAbUMDWN0H+MOrJ4w5jqKpWQNFDzjwXtl27IIKlbRrrLOS+o6nrl8Es/FBJN2JGSI5hrrFAu4oJaNuEf7gLwUntV1ez6PXljcgsT83b5xw/L+MWYVwwKg2IllPzoLCU5io3FIM0ot/oSRcsOmdzAmAM80P2GK/FjtcTMSzmhApUzkBDqzZmlycx4E5BE+yfNPhOpTZ2p7D25wN0L4+d4aCn2bCGFauyOvAq8+wvuBvaYcbaZppTFuvB8mzKRj+7iQo/Vo2nWL7oIPQKL5IN6ADDHNzWOJUYNCS8488f9WeL7SRbHGczP+z6VeLLiPJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V80kc6WYXAczAZ/3OCjxqI+NB3xywYt81W5QU4x510k=;
 b=xFTK7+8S8vTElsSeMpA2oYgol7EYSJMfSn85M714+y8TR869NJLic+9OMe+vKmJ0K6WhzSFTEIe+fMTEzRbNxxJtPxTzN1lFXgfd+JxxYpmVJ27pX2lf16QP4O6Xsrq4TWBEig3bvhi/iwX16CNDxcVc8LTC91bx/qJ90zFtMERtiHzVAYaxHkCpp+EWf3uKjLnzsRn6H4pVj9uoHMou0CJ4OBCy6haUwko8WBlkujUqKNG0FqQQYEwqVbYDY8XSSQ1ADZzvKyWu691IMIMFpr8qSGPmk6ZE3WhuZ3G8VTezHOJSVANTGz9fwqPYYPiN+D7B9+7N23IvBTs3veHq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:14:07 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:14:07 +0000
Date: Mon, 14 Sep 2026 12:14:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 16/20] drm/xe/vsec: Crescent Island PMT callbacks
Message-ID: <aqgdSdchHKF6ME9R@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-38-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-38-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY3PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DM6PR11MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: c2023104-3c43-48f1-8f56-08df127b33ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /BjSIk3oCYbA7o9TQeg9twMzm2OTRP+InIOTXVSNpvlZoWqksa+8LGxwVgIbE1WKpNM8SxYtRV9+d21PQRgZJCCMD1hHFfIWe/BQTuZ+Qhoj67BfZz3vnjLO0/p3/7UeajL5PIZUc4VjMyA+wOb7uDpdMOMDWsJO4PfOAg+ZPfk6updncwaTyB1kwPCBb/K15+yIpSjUAqDviiFgCLtgjQ21J7ABNcrdWK+AbR69jgc49qJpq+LnyNxdzSaVx7io3+P6lGwEQAFkLUDkoJxvWekobZb1PjxqkZuwzSwClw3dNdZCVkTo2UpYg+YRghLN/vEywNu8xgS3IAm6zV6rSEyslUV14XwxGgEQO9aInUsR35dVTIVgxYsxwQwJ2UOODMkIqOZBs81G/lfC3+s1DEP2OJFZ25WAHsff3E2nQb0S8j2ww1NpSM/wR6LiUpYfXFHyEkaKJLTaIHdaGMESshvxbspGkDh/TcRh+BlVATSan4dxMALT9E1a27PegJyClLbQwcHeTaUse4xXGlrR60xT4sd4qsJcUS8v0+jd56Rr7/wpnLQ2EyUovSGnDvKoRCxC0HtK3gzVNAzvWJj9MhFCgbZz6UXA8IsEHYNepjNmTC1Cc63GMZC+S6s7iZiGRJ/h63trxS7rts+O1FqChOw2mfy5Wvt4bVpKUUwmFpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jtu/EMulwOxpBqbsysB10dhXW+5hTlj6bH3nZWOx/I23DEP9fnmoyr39Em/+?=
 =?us-ascii?Q?RY65zIeavL2OJM7ItypZH4Cw6h/rq0LTGkRe91iqOcN/xxyQGxj9ZKJy9fjZ?=
 =?us-ascii?Q?OsW+zgndWJkskKR1et2iQ1d7x4GZoQnhq8Pp+1VI8n5CN7/HCoc4iShKCs7k?=
 =?us-ascii?Q?/ijrRdy+f/BPL9ZdbIMCBqGJP/gcjEETb74p2/l8ORLaM7VWw8v9ATFq2Uaa?=
 =?us-ascii?Q?Ktbx50Npuuw70gG4oTLW8kd0nPEo9Cqu3lgtc5FVSPZGtTumdIhqYLLTtvBq?=
 =?us-ascii?Q?ieF1xPFfawB8wxcgDxODNYBWYXJCQks8vKZUX3JbI1Wwi7HVgw0CQ1204rEe?=
 =?us-ascii?Q?SYGPry/P2MuGXgilzSb3loAeDGlyis340/+PQBF3029D46Ww6DeR1thSAuQa?=
 =?us-ascii?Q?4ypcgRNFyJ1IykT/hRgO8YFFUfAjcLlLwBEFnSAZqDUo3bwRZW9Fi/LX1Uw6?=
 =?us-ascii?Q?syWSxwZDd8843QhFWRW+spVrYsoKT6ZjlflyrVr8EronbPg3fMzyUiakTXLP?=
 =?us-ascii?Q?nnBxOykLRrDxnKSa8/EgFX2P72RE1Rc1wxLciJSZCMgSc+VinK0YUs1jYvIr?=
 =?us-ascii?Q?V0hXe/XYknp15rWs5PAhjAFR5M0DlBkwhRAJcBt61Ty7QNw3t6X69NSDY+iy?=
 =?us-ascii?Q?Mns35q2pm7zr/YiTmXHqgOaur2+EseLf1el9lQkN8pou/UtgrrxO/+2OmNqW?=
 =?us-ascii?Q?dz2jFRwqd4kjI3wEEXqQyj/Hs/n2+l+XZRhK9ZZHA2NlK7NS54R4cc6F4OGD?=
 =?us-ascii?Q?orXskrVBB+0y0bnsrl0uzHXYzr4BaOosU3jyM1uMkFKRPiaOnWmAhxeBs+im?=
 =?us-ascii?Q?B3k15OywDb6X29Tsa+Ru+X9Drr0EZAzYWsFiS3MpX+knJsAybS1Sw8JKHwHv?=
 =?us-ascii?Q?MK+heK/Ai+iZQ9QEPQa2FkORE7JGjRSpSFCpHTylWdUgyN2pBbEvCFVjikoy?=
 =?us-ascii?Q?tN/Pc+CB43CZSSIoL8YYf4o0EfFdmHqCyd6kQpqMZtm4ShmqnxTuxxRVnivb?=
 =?us-ascii?Q?9pieqmYV6pq7TCifH9HZltMOAv/yz3zmajsoN9FdxTgKkb+5mJNioadO3RVm?=
 =?us-ascii?Q?plUvLTKL7JCId136b8mvCnP9KvWFeVqqRkxCdfaDiWwem7o1apRW9C9lyGuv?=
 =?us-ascii?Q?4RLuvnOlfOK6yJQOKRrp6RRR9xfbIUL2y6ePNifGbN9IkqEN3ngv0wMEhd+y?=
 =?us-ascii?Q?zsCO/jN6Yk8WbZ44vXgwq6j+cOVcR3qTWJKkhCUrXbdtU2CR3ki079nch3Tr?=
 =?us-ascii?Q?1IXg1hsjnu3zLDdcsAtGIWPg8VAgGIu9mp8KGye0++tQp2X+7qgb7wGWcxA3?=
 =?us-ascii?Q?IXYxqkuZMgkzNca0/wXXCMPqhrWLGO//9HhZzKNgKqmYbVXJQqBXL1qHzAat?=
 =?us-ascii?Q?aLdO/fdjtbKlDlt6dlV+g7dE/23rtv8rJTsqSB4vvYgjynp6Qfe2/+Jabb5B?=
 =?us-ascii?Q?OGqR/lfqHNGo/AdTj6/9BeY/6smKCRRFPpW2WWD1omXvyGZ6Hgnm7dy8iBuI?=
 =?us-ascii?Q?nLifgVFmk02/vDddrlPlY4b7aYMJx6Ps5OCa0+dNphVrEwosNN/8LEAeOtVR?=
 =?us-ascii?Q?eTu4iEiK0jfoVmP2QszrCZ3GUY2Icq8QFvzMa2+7UpAQaXok9ubmE+ZQ9COB?=
 =?us-ascii?Q?pAK7pLAyo7h8IvkLdy2k2EemStr08ixB2/l+/sY3AgXSn5otaZHCXquQ585G?=
 =?us-ascii?Q?iYUBLBnz1T7niZuR4xCzWQP9qrGHShddPnloE9XI0FEt0onVI66Gv4HtLYmp?=
 =?us-ascii?Q?PLVrH+RK8g=3D=3D?=
X-Exchange-RoutingPolicyChecked: ArHyQVbmmKVMcqDg4GNfObyHDzLNNKhiyOyjpXu6J4TJYmZr7Ch42glVXJq4P+PjprU//Aq0zGxW9f/9909FB7nAnqoRVCcdXNYeQlDBbFUHsjCjaifZry1+NJqOgHY/TUVO1cYfiDyTHyIoowh2czNz19/9GuNA2uSFbV3QtYjntMBYvShWXLqbGRX4C5IJdeJqTk0eK9sj/J03LdMkV58SSDS4hxdf4ke9Oi3qjBrbI5Z87l84wlEZ+2P8ut2HnzBIO0VDXp5mTQ8aO9Pp320liDbYmq1nix+6XK1bw9SJAC25hUaS33zl04a2M3aZFTvcAmNoElBZsB7+TemEHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2023104-3c43-48f1-8f56-08df127b33ac
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:14:07.0354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWAE15dqylh7DsQok6sjSR5aLymkLqBgUKhuv8mT5XvYeb0v661t2Q7wh8sIgBuPq2q5Lbp1eO1Fms+kiNcNZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:12:04PM -0700, Michael J. Ruhl wrote:
> CRI PMT support requires callbacks to access the discovery status and
> control areas. Access is a common MMIO area that requires an index to
> be set before access is allowed.
> 
> Introduce the necessary callbacks to get the status and control
> information for CRI PMT usage.
> 
> Add the glue logic to register the CRI PMT functionality.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 108 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 105 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 9f00ae58b921..cb3d9142346c 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -362,17 +362,110 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	return ret == 0 ? count : ret;
>  }
>  
> -static struct pmt_callbacks xe_pmt_cb = {
> +/**
> + * xe_pmt_read_reg() - read a crashlog register
> + * @dev: the xe device that registered the callback
> + * @guid: PMT guid of the crashlog instance
> + * @reg: data read from the PMT data structure
> + * @offset: which data to read from the PMT data structure
> + *
> + * Read the requested PMT register based on the pcie device and guid.  The
> + * supported struct is the Crashlog Type1 Version2.
> + *
> + * Currently this is for CRI only.
> + */
> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
> +	int ret = 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG) {
> +		ret = -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr += inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(&xe->pmt.lock);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	*reg = readl(disc_addr);
> +
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
> +	int ret = 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG) {
> +		ret = -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr += inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(&xe->pmt.lock);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	writel(reg, disc_addr);
> +
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static struct pmt_callbacks xe_bmg_pmt_cb = {
>  	.read_telem = xe_pmt_telem_read,
>  };
>  
> +static struct pmt_callbacks xe_cri_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +	.read_reg = xe_pmt_read_reg,
> +	.write_reg = xe_pmt_write_reg,
> +};
> +
>  static const int vsec_platforms[] = {
>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
>  };
>  
>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>  {
> -	if (xe->info.platform > XE_BATTLEMAGE)
> +	if (xe->info.platform > XE_CRESCENTISLAND)
>  		return XE_VSEC_UNKNOWN;
>  
>  	return vsec_platforms[xe->info.platform];
> @@ -402,8 +495,17 @@ void xe_vsec_init(struct xe_device *xe)
>  		if (IS_SRIOV_VF(xe))
>  			return;
>  		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
> -		info->priv_data = &xe_pmt_cb;
> +		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
> +
> +	case XE_VSEC_CRI:
> +		if (IS_SRIOV_VF(xe))
> +			return;
> +		xe->pmt.base_offset = CRI_PMT_OFFSET;
> +		info->priv_data = &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;
> +
>  	default:
>  		break;
>  	}
> -- 
> 2.43.0
> 
