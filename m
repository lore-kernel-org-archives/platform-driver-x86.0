Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D25388860
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376026; cv=fail; b=BLuwpapOlo6VVITT18XGLvOeHWn+y7+EASqucCNuqKFRECdtOi8+EZh4KdWdczj12H/TfEtu3gyD8R2oY3kCfGsOzBT6GE2gY8JZ0YwX1WUDFgKe9la6/uYvxPJBKLtSS2aGIMLvnnNHtuTnf4Sg0YVsGfu8SdV0nlaiAZdKN8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376026; c=relaxed/simple;
	bh=8BqYZ77BSGrIDwkB4zY2bzdkfeoUI+J6/zkYsTOrU7k=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RWTKseu/YIhkQ1RdYTwaf/EXPCnzgytYvoX2S5w7pBowVyd3rwrSCr+Gru1fPGS1K42igSBzcxTL9LqBUpJMG4CWYJZX2BzpU5vVpC3ZkUHucAGk02GrcMa7mc4KpBf7wn5Cv6SoX+jtPQTc/0P+SVDxIBmgTpA4glS7DxAXCSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFcQDbw1; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFcQDbw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788376024; x=1819912024;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8BqYZ77BSGrIDwkB4zY2bzdkfeoUI+J6/zkYsTOrU7k=;
  b=XFcQDbw16Ypweqqtir7LNEnnVyAnls/Wkf9tvI8qsh2VJKxVpaQoEHXw
   zU1M60GKZpLPvAsGczZJhGuUALbf9y4PLhoEMCLMpxvL+VjgbK5U1NdL1
   pXJFYSF/SIcF2u3F8mR1Pf7+lB5Z9Pl3brXnCrhzBZU/WOFOtl4rU9UWX
   MFKjxGI/9GpizY8BJosmfXSWkFduzW0b8vF4lIUEpYpll7rPPEdb+hAaQ
   qNwEHJkLz3EwvHaTO35zZverUHZ9oyVPYu91bzsc3PxEjQ3lEtMcBy3bF
   80GVQgJKsRuT3lv+exdkZexYvYe8PE9Jg4HoWSjLy4vAzSdowKQyrJMZf
   Q==;
X-CSE-ConnectionGUID: tkHJ+GxKRv+/dq0bD3jZNg==
X-CSE-MsgGUID: EtvkkSJBR1+RVuRKyBm1Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88694895"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88694895"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:07:04 -0700
X-CSE-ConnectionGUID: 9E5f1HVaQSOupvbhrYzZRg==
X-CSE-MsgGUID: veKG9wAvQUWCAfP4KjhX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263329329"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:07:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:07:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:07:02 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTrYiBtpGzlAMUPoXpfH2UsYpsa3ALPMRUZEkZMIoLmJT1Xr8A8xZuieWr5/5ySbL49dulz2jok+k3L/5tn4X3ENKtFY/ImLJWdVZ1KMXnDydj5EbpS26j/RtQq94VIIw+HIHKLueda5YnF/R+ZGKycAAtNyvnf7aCq7RC529eWQ4G5jyq/YrTtPxpaUhT200c70qexkjO663VYCRgRQMMOuK6KnKEHikgI++OHQdqpDMkoYZw/v/NhX/CT86LYf+A8dYBCBj3ipjNG75PixT5FGx8vl7nM4dM/JWu4WLwQu6S98V2mP3SBVJWjtoip6zOT5T9cXyKHKT+ImcyUalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRB7YfVde6FzPhzCzD4Wk4C6XfQpcvvHM0T7p2LjZhY=;
 b=pfXyPbixFIIaK4mBk9GEC1rciFxlys1jbME/Eqvzi/ebU81jmF88vCxZ9IO3K20nH2aMn+aFLcEAvRnIb8fca89IDXthURYLn46GUifygNK0HUhQDcRboSP9Fr99OApsg+Pnc38nbAMESmS7Ic2MwD7u0tpN2NWOXlyBkUmc1MPkzYjCgrZlvpFFTYCaCqJLssUt4tF8PhU9spV9qEDB2lg2tv+G6ZtYZ6lM1n0XMFAy0tzy3t24rJO511rgeD7ZIEs6V7785JxxpQheRmooErtyzC1N/epGwmi8Yeh0Ag7ETHafHW1Kbs6q5ODxmBH/F4ABv9GGKTrjJA2ij5wRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:06:54 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:06:54 +0000
Date: Wed, 2 Sep 2026 15:06:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v4 07/18] drm/xe/vsec: Do not register BMG PMT for VF
Message-ID: <aphzx4F3CgvyXqw3@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-27-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901192736.626777-27-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 321d5dd8-e07d-4805-8111-08df092559d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lbE5WAXytUWG/R4EJWrtFTCRNfniOELHMFiLRQx4XRRoo9K6XVPddlxFQqZ2zo+LP58/pQGZfMwVzqAQYvYnCwY+5C7jbmwOoQlhQyvCa8fGCBiIIbqlOVyqsPQjbrigyUqJYYt9lGvwcXwWFqD/EBBcqmG4R3GcCM1a7XQnOMbqZXK7j3921hHPncTTbFP+qNNEsnvZI+zG3AoheWwAcIrSwR3kA9aKkiMyQwXEw8Gx25VeDj6N+mRJeAywSWkk2I6NHAyUUbqmX2mqfZhZvTJYMGNpim725HpEHyzto8I7gJjzNOu6QKj6WDfD++ryJROd4ocDRDTctFhJXZSKEzvuc/5hrIrqX+bcbXQcLAqd7gpysRf57aNHmbE03vPS1FTdQJvXYzbiZ8KhrjH77BweN4gBQR9X6/ZaQr698tyx6XuD5eu9Kf+3LleRLrJL/OnKZJ0vrT3mFWZmh5YqxNuhI+mOVCTtif0GDOm9Spilh8v4jLUvYZu3+6JhE62noJUo4OqOM5UegNT0j5zFcwKyF+DXv+wscPnyGJ0wVydDOS0RQgJtOXC+sziew5+wThPfvfNYJbcrmqfVU6C59BgSdqk+uzEICbs5yJFnumbhO4vBBdTvmBsNFDJOM9/Gm37wvJf1W+YsmNbIi0Zs6OfK9jrsm6ror1ljXYmcU/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+pmI1YfTbjy3tCUmSQeA2j7b+I4IPuwZq+lSkV1R/xrrD2mdeAhA9FIpwO1?=
 =?us-ascii?Q?jqxTakiHSos1tvbrB2UhIqelEFk/QctzJiD2XdNJVKKRXhBAGf/uCuCu8pMC?=
 =?us-ascii?Q?My4s/DlbhvkfAPp9ykZ85yWojEB/APzCxGCXsnoqQ2GLLCjAzW8phf/5adr+?=
 =?us-ascii?Q?LEWXhdwa8jiyYyald7q4rxS5nOyDhpbzu0OdUKYtFGloDu2AC0dwx7lRibo1?=
 =?us-ascii?Q?+l6gDewfYJXoEiNWi64QNqflTlwXD8BI3hyfig9cxo4UGG2HzTGVfebuTR+M?=
 =?us-ascii?Q?g2JIX1Vjl/vyMNobaRS74Qtl34svAknmEzDsQ6eio+CvbE88SlAeRNHrrdj0?=
 =?us-ascii?Q?puyvlzkfGwTNBqMiS58WoCZorkFIfz/1sPNURdIb+WqO0ozZG6m3c1+CkInq?=
 =?us-ascii?Q?FWCCBdYW/6mMQVGcUwxJHNLDlegRKJN4c1AFSGmThkOgjelpoM+nD8YU5Llt?=
 =?us-ascii?Q?ME0xQLif9ePBCTaxpBkXzgR9ZEjPTRfVWggFhdulbprX2b9VZqweH8zbOn4Q?=
 =?us-ascii?Q?0xPs9F/2wZ2dU+fEAGL70gtIT70zcb2pJevJULX9hvYKIFTDHTTU99k2CF5n?=
 =?us-ascii?Q?UrluPPR357fSFXQG8okgLvYr/yJuMVjevycPtMvLbzFjtJ0/CVju+ylGSh6t?=
 =?us-ascii?Q?csrd/RMy/jJr0BSIsjwyn3U95pp2n7WLtPGiv8fI8P3myqFiSEzn7bwh6eKn?=
 =?us-ascii?Q?8Z8zeaDR/9K2JtZZ0GUSQbykB3QneH3fVcizNvh+8gQxa4LnChWLt9W7Iw/Z?=
 =?us-ascii?Q?CqPG7gxBZmoQNqvbDUfpecT/WoC56Ewnz3R6ln8pjhpEi9nEDlcIk0sLOjTF?=
 =?us-ascii?Q?7GVCo/UncExQjr5m5ZbpidCxTFcfOtZVv6i77bf1/v5zDfA/tnnyMjMwAVRi?=
 =?us-ascii?Q?oziFD+iM6RzfENuq3ggFAH0M1LwW3HSL1oO8XrznMzDaWpJOqoGVb6L41YHc?=
 =?us-ascii?Q?ovdHY29bQsrkgx6LZ3r8gYMY/L8yl1UNvueXjK3Eapz4vl43MClJtNRN/dzL?=
 =?us-ascii?Q?F5eLiUzc1ha5kbyq+MNrGoKV5AhgT4aXLaduOXtOeKGyyOkLj9Tf8bgGjP9X?=
 =?us-ascii?Q?OAWSG2LNuQE5v9ZD+aJH2K81P55ojYCRE75b74g8JsPZ+bn93I9TUioSOLQu?=
 =?us-ascii?Q?5v6d3K23tnCndmcPoJg8wtCcxBpPo/BXZlWWxiw+oGJXZSLhSPPo92iNxCOe?=
 =?us-ascii?Q?SJPDZp6nfvEuv+hsYHmmI8k+H9hncA6J/eMf9mcvfyv002pNO1FoA3VDcXrs?=
 =?us-ascii?Q?4zpzD8dD1bVOFhvl0YsnZ8Qxkwf1EEJbQpt/W17vpDwKGHFu9h8dRnKUDho2?=
 =?us-ascii?Q?nTZMBNbvXjrzQ9k3Yt88W/RoxBUCoNjtVzPmQL35O6AuDeD/4xWnWm9gF/S2?=
 =?us-ascii?Q?TLMSBpBKA+nrNUTzmqeEiHD6ZTUYL3RNY0f5UC1KRI5DT2hSp3oj4eXMNPY8?=
 =?us-ascii?Q?jinkahE2+aG5YnbwUwTVN4BZN21gf/HCOkUcgWT49pXQcFKud/xhpkqQpCrK?=
 =?us-ascii?Q?T/pAij+JqhgosE+f+Uyjmu0kvvYF4t0pVM1r/h+VpOhEKPFrFjaseCk6XkLu?=
 =?us-ascii?Q?DH4t3EEnpU9CFZ3kBeubDnL2/vG42AJXPqAQ1cc/m8bX074xVGBdtgHcYeao?=
 =?us-ascii?Q?7g1gyE/Iur1boONYeF9X9uSKGD3qRb8XcqX+vR8l/VgAeuinr67gvez5cpDj?=
 =?us-ascii?Q?a3h1YM5zWrUsxeAd9JM4thJyaFZWwXK7TnCBm8/2wBAEaEfjZt5irtUynyum?=
 =?us-ascii?Q?PMUJlVeOYw=3D=3D?=
X-Exchange-RoutingPolicyChecked: PeA/CWZ8dluV5cE5OkoKLLAz1vH8uYxa0FXcy/8v20lfz1Gx5aDqMzfs4m1YzxFumov2vTd9x0Q7oC5xE1FSUgnUF1Ai53ZjLiabVTfd+xC4jTGpTE/l8KjMnvOJt0G8H2RXxlXwh0YLAot7YWatHxiNq3/dDB0SzeLDl1eHR4lBAht7IT0u8fD3xsT3xEhzhBvmoBqBpn9ZyMOKhj1nLky3W5H0YCNtg9+bedvuiaQGnmIHT6HIvv70v7t84ctUXpLfmDzVTpd5JhqUlO/54LStdCdFHxY68GtFqMjfWjtcqy/Dxs6teKrWKwgbVSKlb9otxcMj+Cy6tLFBrdNmVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 321d5dd8-e07d-4805-8111-08df092559d9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:06:53.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StUlMNqGCatx/wAzp3KnfFjWfOjc/QZbrxCQOt6kaw0hZbZMGuXaC2ZtrTM6wCqGjXr/+iQ1BHcGAt+ZLCt8iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-OriginatorOrg: intel.com

On Tue, Sep 01, 2026 at 12:27:42PM -0700, Michael J. Ruhl wrote:
> BMG PMT is not supported for VF nodes.
> 
> If IS_SRIOV_VF() is true, do NOT register with PMT.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a9baf0bfe572..71bc359b2ad1 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	u32 offset;
>  	int ret;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return -EINVAL;

you are not registering, this callback will never be called.
This is not needed here.

> +
>  	ret = xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
>  		return ret;
> @@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	guard(mutex)(&xe->pmt.lock);
>  
> -	if (!xe->soc_remapper.set_telem_region)
> -		return -ENODEV;
> -
>  	/* indicate that we are not at an appropriate power level */
>  	if (!xe_pm_runtime_get_if_active(xe))
>  		return -ENODATA;
> @@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
>  
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> +		if (IS_SRIOV_VF(xe))
> +			return;
>  		info->priv_data = &xe_pmt_cb;
>  		break;
>  	default:
> -- 
> 2.43.0
> 
