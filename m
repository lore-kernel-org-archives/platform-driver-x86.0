Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CD4386C36
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597831; cv=fail; b=UxISgQDB3BqhSZv83TxTT9BItJmmgG3EQxEXZQ3MKqoUUt6/6IQRdBNPh5jWAyQP2iEmwU6pRRmVuc4UehAQGrjvJzQj7iOkVz2AranVsUbuoVR1LYr4kYozhTRdxh+XWh0lViGpQnXJqIOu3fMdCdyYBhfopH/ohfwQiRdXujw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597831; c=relaxed/simple;
	bh=xN9WEvvHX6aCkyrcsZgFPjehEfIMYdjeeSV1wybVmbw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YlYpksJhGbmDALaR4KDjGh9HKS/utKiolV2Q8PcgjW93UtMMchPlQaAI7Bl2p1S/mjTg8EqCHF7AE4aXBbNyO0VwR8jummfJYZvU+G9wUpmMClmwt9h+W356FMOY5g64XdKCCafKkQCrKZ30c3Huza1xBqiLaU+EXRt+EarXvyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaKFOIcf; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaKFOIcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787597830; x=1819133830;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xN9WEvvHX6aCkyrcsZgFPjehEfIMYdjeeSV1wybVmbw=;
  b=eaKFOIcfXFG4XRNH33PZY/Aru5iGtLM2rwWEr447K5VUOsk4hiC/wlx4
   w5bswE3DcK1Rj5e5vaWicDgupKzW0pCLxCEhruEu6CdEwEPFg9cDnam6J
   AoY04wH/Sulu2u1NdT/dpM9tL8DKuWKJMH9kHdTPj0Rpktmw4wkt6q+Jw
   vMpwaMh2NJFRHp6lryT2rE2BvyCyP12BnbP8zTW6XufFFTSkGvX9s+UN+
   nb/gLH4qdva4gjMvzBw2z00PX0T8uDCZXEoaUw0BlcGnsvy7/vUO80p0I
   6lG/E2VoBcUG+62QPfeqpkYKL7kFqzlDA6XuviqWHHNvduv8BjxGRAd0X
   g==;
X-CSE-ConnectionGUID: 0y2nYcnQRZ6Bua0B9tW2YA==
X-CSE-MsgGUID: QbGTxxojSmOkNN81Fq97mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110842372"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="110842372"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:57:09 -0700
X-CSE-ConnectionGUID: L8D9BA5iT/OlkhwFs6cLIQ==
X-CSE-MsgGUID: /Ilv3T3+TEGc1t+Ct/PwMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="272298604"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:57:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:57:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:57:08 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pP3Bdfa41C5GpIkswISkQR6HDyHxFrm38zqXaJvj//LAg4u9g1SsCsKmmrAKPi2MHl5lxM6Ou9svWef0jjCi7rkdDSbtv2QMjgjh7/YnwwiApEPwEiTnAg1Fgw/R2h1PfvQj58VxRmCs8XDQVbjdoX6VDl5DzEWLvusFVoXtoU0pTS4gYpOnIdy4pADz0CHMUDnZO7gUWSiGk7eJqJWvQsp94KyKQdKrDbVyutjGCfQ+T/A0rZmyotIFZTsODnahj3m+6Cp8bjqwwRwHboEpK3gEkzhMGraF02uAQ/Hn462TQAVwza/0llxvaaG3t1iEAf4n8YMi3ElCYOO4jXiJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TT9zVMu+q9UTjm4WUM6J72ocSPMWBNVJM333YFWYw6o=;
 b=m63tk2hYFnXZlRN878AxZHfVbcf95ECk4q4sUKYeWZyxAjOPlYmM8ygpVgbaElfnWEoP9y6xPVsX3Bkcp3gxMs5I7HmZRtNqnVNdMPNCXCE41QDkuQcsDVwdqHQNf+hHXbcHs10KiE5YInMgoNeyXBVJmoqa65G/D7NiUQMg9QTRm4BrRcNvYchcWFxuTzhtM2HvLWb5hjfeuAxysPm0a+0uQ/R8FBwFfFiMLCghA0Ni1HmDaOt464oJRCf7HZ1mB/j1ugo+0HpZdTjVihN//VT/GroDz6EoHpSQydkQlh1jBsbOW0lSJcgmfYOZa7dhXWdGNMfI1vPGq+aRDwjN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:57:04 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:57:02 +0000
Date: Mon, 24 Aug 2026 14:56:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v3 01/10] platform/x86/intel/pmt: complete pcidev to
 device update
Message-ID: <aoyT-PnfaSgo9Kp5@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-13-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260824162317.2450380-13-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 909ebb5f-4892-41cd-9dc8-08df02117b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SkJt2zJGQSVo2e4f0UgYztb8GCW1q1LqFs3HrDgR93HW3haqmUsr+qNgXwrvu+hgUY7OKzKFue3ienC9ASf0g7aVhBUvBAU7J9rBm49FFlClyL9MiPyWPYWEM3m3YKJx4mfRt33kUqOkNS88StLF/O9fhJ7qphjXAFIjSyGG2vzNBRlaeKwH+GFtJSTdAE3HIEmlVKJ4E+unGaP8ecjx4xKsWeEJd5Zvmub9/aflQtt9OmdjX03ak1Uqj5Yg1L6+thNRimjUd+aeA1pQtU02ViRWVQxTtvBte2zXXkseJZZb9FDb+5L4IW9rztxo92bTFo61/ntj22n4jBoNUa8F9NV4t320l9P4zGU66YYztQ9VmHmVmYV8vF4iQwMXnxE16oQU+mlqPpxpT+E5UlRyn8TjBATcqdn1o90LxMZ9hYTGByC4NbG8ddJwdP6wLbrdKZjcL1DgGrX3voNewde5NaRgF7nBaBuul9L6FEtMqe1hBAE1lqOvHyIttZRFZU0W4osruqK+8m8PsqPvA/CqmptYwT0RjQc/CTzcK2DX0WnOUhjmYhRWbufVmLQXZeu0EXA7aTxpirxuXj1hFkYWle58LraGo11uqTecPAXrfZalAqIOWJTp7rWvxnl2jU9uwtLiAkdFOFgSky4J2AVgekhnIK6RVBT3nVmWage08E0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BbRSNYTCTOn95cF/KRShmjvU4agthalkxDu1hAqsYEJNYFwXz3XwDKEyOQsU?=
 =?us-ascii?Q?T0WBpRSbOgVREIQdhi0mEKyG0MvTMjPZST+9tGEeq1GBjBSjm/WD9NjXM5Tl?=
 =?us-ascii?Q?yk+qLIj2RA0r7Ad2vrUOodBo35qqrnZKWF5T2ZVJjpgGdBA36vwJmdiaKPp9?=
 =?us-ascii?Q?1r+K1PVTJdBJBqQWVDIAoNwt9i0H2Nm5r0jP26jDT5iHgj/sQ56DWr3Jc2yh?=
 =?us-ascii?Q?PyzMu/GAGH0nvtqZgTzCbfoRoacVnETDvyYrbeO59Re1JsM/DE2/P27DRCXj?=
 =?us-ascii?Q?u0KfWCN7AmtkEP5ZOhq6PzQkrU/jBcqbhN/XScr811pTLoqhkoE7tK/+A2ft?=
 =?us-ascii?Q?3H2j+fF42Q43Mne0NPLhJYhP6xeHRLsVSuYcz5Wmd0jxV6lCwScDMuXTkrrz?=
 =?us-ascii?Q?PfIEweGThbDz5HarG0hME2qICxOZkP5kzRVxLCE9wfQV6zi3H7KwHpkCkxb6?=
 =?us-ascii?Q?TxgGDk4t6k/w/hghOW3ES/uAFXc8ii7TioUvjEBtl+F3uL32v5eaJyBKhBb/?=
 =?us-ascii?Q?ugbTxF+aM7+Xc9THe7qISAXvOlym9d4r04QifXYChUtm/RGty1umTEg2fuWv?=
 =?us-ascii?Q?PW3sXhSwVnPqb8dqx5yAFLUnMFbODa/Wlehp66itk2iTHtjYtwgm6R0JjZDN?=
 =?us-ascii?Q?kdQFt3WVknfmuvUWIsRjnG+/leMLnlWK7GpVXHDXFtfnYv2L1UA71fKbb/k5?=
 =?us-ascii?Q?GsKzHAeXYHDfvoPuRes19IMLBD/5VlBLwUDEseIMHGeJXw60nqsj6c30+e+I?=
 =?us-ascii?Q?6kDSEXciyfgOr5NcSs3doAuI1nraeYa2Dggbe7jUSXxd2zamsU5Zl35Z/VM5?=
 =?us-ascii?Q?w1TbO3K86EGNOYDF5epOghaq9v+1pKnClG8vXIkPo7CRZH5TwqeEj9p5nwBW?=
 =?us-ascii?Q?Q+z8LIWihEjQIMeef4LVysBA6FYkT0l5DA76MsOnakUaUnlt5mIoGhO+gDXS?=
 =?us-ascii?Q?d8O3tey+xA6Xrw2XRrEwE+xJb1YRFc7xb2PvsAi/Bu75Kd+Irow5BWhIqXYt?=
 =?us-ascii?Q?XA0FfOMpcSoGk/+grgDm6uWdH+pOuH+R3tENFPcFPu9T8z7APFbB+aHN6F8Y?=
 =?us-ascii?Q?1KRxOabYUOElR26fl7JS95Xt9pquURxJq9YCdOLqXAB5GPT1DIE4lRj7FUV+?=
 =?us-ascii?Q?kpTCOonGn/RfCo3MkfWax+Bcvuri8aNsefsNhWmAqC8X6cEZflMfi/RV5uld?=
 =?us-ascii?Q?nyykdHHofVWHO7P8DNrdO1O7r54CqnhVhhusX9A+A3tOLOuFpgZ0EjlW8kHb?=
 =?us-ascii?Q?qUWCLDJCRXbm1C2yBXgYGzVM9+XrUeDdpVIjw+H++6jAAck7TSfmRUw4H0BV?=
 =?us-ascii?Q?3PBSdIkvJC6X6NmBVU8f9b15l/XUGt5Ah7y3wq8ktduTNYJZJ/QFKCYvo8Hc?=
 =?us-ascii?Q?3g7Unk7mQwkLPtanTQ8fSnbkmVgZ92D7XiokKmpAdMXFvnkNEt5QRkxRV7Zq?=
 =?us-ascii?Q?0fL6m6d483wyAlbN5pDehL+ZMlK04vV14Uf+jiYC5BzqxnSn77ep66xB/VAH?=
 =?us-ascii?Q?Ljgr9DFF1q6qeMqzfG5SxDrtdS/o5otjk+pYjNm4Mg25ye31Wkj3nhgi00JC?=
 =?us-ascii?Q?BODJq3X3JnwTD3ez38Wyse6BtWEvSH70nhRlvAZTnCXEY42UFyNClr0vgHoI?=
 =?us-ascii?Q?OdKQOGOyiHxHnVZ0nX0gcUJJ/BZd+KMUWmoxVTJEwrdyBgRjtz3gNb5kVHYI?=
 =?us-ascii?Q?ngcHwyLewwNH4WsT1RqTyTDD4qpg06hvpdhKm8z+wAP/+7GYPsfW7KT/ldIr?=
 =?us-ascii?Q?Xh213ijQ+A=3D=3D?=
X-Exchange-RoutingPolicyChecked: zS2UCP3gcRmulBrCQeBuh8jBKJgD56jGGSXb4yp28oRqsqD1dIAMV3kvcIrHi0KoIHvG4OWVTZ/mB8Uj/OZhQ6cOnKSg+Tw7J7Gqi/Nw8+Ehqjqej/6UZ9hKhkd/AblaXGpj+18TNl8ekRTeJuYiGcAK7DCisFXuLgczztro6DwRyyxqm2hUJZ9VnAMejybHIXSmUXUyC+obzib+xy3izS/B4puLxzgP2zhPUZ8+VcZncaOQAVmyQfmAOm2n4DZ4N1yGZ/TTAIAFyMUrUhj4q3/HpUwyFWdW3ooMQ/gEsI+W4YBFXA+rH8/zcr964AcUTLEl94QM6FHeQFPY4orj2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 909ebb5f-4892-41cd-9dc8-08df02117b46
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 18:57:01.9458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTOXiWZYsSNa6HUNF4B8D9gfVptPZ1/bmZcU2nr7tfPBKI8fza+cyOhbeZlk9UrLpqdEd2UJfU+uGV+BBN46XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 09:23:17AM -0700, Michael J. Ruhl wrote:
> Previously the pcidev usage was moved to the struct device.
> The struct device is set for only the telemetry endpoints.
> 
> This usage prevents other PMT features (crashlog) from using
> the callback mechanism.
> 
> Use struct device in the intel_pmt_entry.
> Update callback usage to os the pmt entry rather than the
> telemetry endpoint.
> 
> Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from pci_dev to device")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Dave, Hans, Ilpo, ack on getting this through the drm-xe-next tree?

Thanks,
Rodrigo.

> ---
>  drivers/platform/x86/intel/pmt/class.c     | 5 ++---
>  drivers/platform/x86/intel/pmt/class.h     | 3 +--
>  drivers/platform/x86/intel/pmt/discovery.c | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index d0ab8e33c62a..402d51df834a 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -100,7 +100,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  	if (count > entry->size - off)
>  		count = entry->size - off;
>  
> -	count = pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.guid, buf,
> +	count = pmt_telem_read_mmio(entry->dev, entry->cb, entry->header.guid, buf,
>  				    entry->base, off, count);
>  
>  	return count;
> @@ -286,8 +286,6 @@ static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
>  		return -EINVAL;
>  	}
>  
> -	entry->pcidev = pci_dev;
> -
>  	return 0;
>  }
>  
> @@ -365,6 +363,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  	entry->guid = header->guid;
>  	entry->size = header->size;
>  	entry->cb = ivdev->priv_data;
> +	entry->dev = ivdev->dev;
>  
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index a0ece4fc3837..258cb460e61c 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -20,7 +20,6 @@
>  #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
>  
>  struct device;
> -struct pci_dev;
>  extern struct class intel_pmt_class;
>  
>  struct telem_endpoint {
> @@ -42,7 +41,7 @@ struct intel_pmt_header {
>  
>  struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
> -	struct pci_dev		*pcidev;
> +	struct device		*dev;
>  	struct intel_pmt_header	header;
>  	u32			disc_header[PMT_DISC_DWORDS];
>  	struct bin_attribute	pmt_bin_attr;
> diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
> index c482368bfaae..f4203d240f54 100644
> --- a/drivers/platform/x86/intel/pmt/discovery.c
> +++ b/drivers/platform/x86/intel/pmt/discovery.c
> @@ -609,7 +609,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *entry)
>  
>  	mutex_lock(&feature_list_lock);
>  	list_for_each_entry(feature, &pmt_feature_list, list) {
> -		if (feature->priv->parent != entry->ep->dev)
> +		if (feature->priv->parent != entry->dev)
>  			continue;
>  
>  		pmt_get_features(entry, feature);
> -- 
> 2.43.0
> 
