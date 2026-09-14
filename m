Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ECC402BB7
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402054; cv=fail; b=QEO7MSdUrRz8ak8xqOHUPBSc+ujXYuITV9apJbET0hcuFm1CweDPHuTXrR18GK+k+NQDYyUmKQotGDLJNIVdiZNXJYVr3B1533NRA8exhSzWdgBG+P2gK6EP/IVHlkvUgEORdTDtSdvE5M92FaxEf01vVNi0Hz9uoYLZwFghbzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402054; c=relaxed/simple;
	bh=igllKXdmdGmM6aSB4GUnCKASWQULsnkKuG32WCs+ADg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=teBXs5zqlgBGlidn0krIJHZY/S+7Orx1TQaoz3eGyrF3mT3qJEE0S742kDUDQmvqsfVRv6Zjs/eGMS1VWZymkDm/DHtGZMeQotq9TUN1CEbtX7fNSBa4vm0q7MrHzBtEy2equnvybiOF+TervSO1v4k9dZ6k6zrwgrmlGe/HjQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEzshuCN; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEzshuCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402052; x=1820938052;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=igllKXdmdGmM6aSB4GUnCKASWQULsnkKuG32WCs+ADg=;
  b=BEzshuCNC0gOxGdcDU0lP7lGiSZFeoGL4VEUuRd+0xxe6LxscLHzub49
   8zv5gdsOIfnxoIm6GVz1c033Pt8dStQnObb2bAqiM4ikOOGNQcPZN9GP+
   bYk9OpymNnOmuNz3SSPSwJmmIRmKssYaJp5Znv1XU5bRM72+roqxJ+k5+
   KEqNV/79dAmwD/FYx2rXt7tZkkbUQQlPCR5IIebvfoJuejOpUHM/ePEIz
   VYu5NGd/9IRvCGlQvfYkpjnk5G6ni2WOdc8YWR0y8xbsF0+xln/Yin/nz
   oKzbgxFlZFcLAHsWNLoI+tYa/+amsKbrLfrD7P66gzSBVgzUE4yVpzO6Z
   g==;
X-CSE-ConnectionGUID: i+brQXNISnWyFrTTnMg4Zw==
X-CSE-MsgGUID: nOHESTDfT7mNaYFswJrS0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77318068"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77318068"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:07:32 -0700
X-CSE-ConnectionGUID: iWOAnVYKQ0yp89EzTvYA2A==
X-CSE-MsgGUID: 2dsUkHFXRK6M7pD/1Fgu5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="892999"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:07:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:07:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:07:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKv27JhxIxlz9Xo2R1LJi3uUJMMdEfDY/TFNHMGr4mbBFc9M/oewoHdrGxKyLKVGM12nQEBWM4rulDdXXNlPWe+gxN5yh5ZG1505+8hoV2SS85B+7L9DYhY3CMjU+2B9hVFwlb4Bsv62a9qH+XoMqYFFdcGy70MA/XvIdPpbxkRqJGt7m7RqmGrQETPio/MUuyBAIj0f1S0hAdizmcKMy4cWrMSiKoVXkREoXi7TNqHzWil7z74iRueXz+yC6UnWBOHctWuAWmixokGpUtukrduIev9SVCkgZNLBlMOiwRNAKrBLavexJgA3nG4u3SymsxaZIq66m+vmm9HxPA0R1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKl0eGjV0TJeXWQFtjN/xsZcPjQ2RAowZ0X48yETI3w=;
 b=O9zkKS7Ixm0zgRHdNL5N7jTWR6YryC+71lsTjKwMJeQU6LmHA55ElX6C7bWaIf7M4k53p7iT1QOgIaZAhKJez/xnuJviccaEme2q8I3sPUIoELBwmORZghcu5pqApsr/wi8aTNRmHGEZDDXiwBnW7vDG6oQEPv/GkCqAmXLO0gGoCLvOuqyS0x6EoKN2Z2YHNc4y/N+mBop5Po/Gtlmj4GbkRnAoJahUwP2rVwOCZGe4c9IqmK0w1oqNwu5t96UOFb5iednUQ4ZlSjQrQYnppVltEJx3FezXFqBeJI0FvwCK4+XIqgZ/meNxnyGgMEaR5da/H6Bj+B3UcD86DeYu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:07:23 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:07:23 +0000
Date: Mon, 14 Sep 2026 12:07:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Message-ID: <aqgbtrG5Lv2-ixjS@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-28-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-28-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS0PR11MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c80f04a-9231-43d3-02d9-08df127a4345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 0By322E+HDZLEsn85mEzSA2zGc9LQQmR/h5G0xcQnpsLRgcPFcVUet+0ds8FlqVsVjZrIqJMhW9Lp144PbMcHLUtD2+dQdFqF+8hsXW1yc3YHBCbdi6pn5YuV3SAZafjuAAL7eoXITAh1fsOrTYSw+nxF+JcRJGtUz86V5U5Z2eAqHkiw52kyVE1WjBdiRh+3zWmhmnfx8WiGJoYYQtED7b/t+v7dZNwHu63bex10xqUC6SCv3gcYBQg9DeWcyQYK7opUAkLackdpvME50+5GJMyWQwRNpKrYRS2loEgkqOCiFwtixXOAItiD/MGHFL/UcP41H5618a/9KznPf2DuGQAomN9CcHv/cNPOrX1vQPw5gmAhC/N2B9G2ARLcBtHmjY6LeoCh7h69k84YONSEE8/GwOvBZmaoyv6xbfbPCHeBC2QGkU0eMdSsnrZFBGbsLfOAs3/KTR58jJt3Y5QdQJUdeFevmCZ4McF4SBvHFgJVBsX8Vaq3Yprryuor65Yn4clMbc2ZmQEkPWq9SkG52VfiF+x0IrhHjPpvaNhJbSBCXx02avPjHxIp8SAZITg2n/AOY2AS+1wV37ELD28vmaXhdiGJpjrPABkAQWhfvkj5KAc0ve12jlQxKh7fpC3SdEgGnxksh2nrwj+Qx2oCmGa/KI4vAH7ogfM3ezVQLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4NU50gWKVuI9rLZDDqSoqQQoiRihxV0x14ip3be9dc3oDtUmoGbx+TM7HjtF?=
 =?us-ascii?Q?1SOhcDopXBF98O+TyGOURH5+3QlvpLDOInWwIjKBrmC2Taupc51j6/DzOUlK?=
 =?us-ascii?Q?jeyXqgpt3GkTQLGxVeCYWA4qnpR4hRQLNA5rq0gzlfUEJmjTgiGhc4nI3ci6?=
 =?us-ascii?Q?3EPyUbDAduWsbrFM/JQ7azKY4Qd2yw4qw39ZUIBTLVgD3yHJejRZW/Bj8Q7n?=
 =?us-ascii?Q?SSKktO6u5xbRHKCWQN+BJDbH9UVBwDmS5Pbyz4apC3TFNd6i4DZctGkmyDpi?=
 =?us-ascii?Q?H4PTGVjtiNjx/xwhMRp/qG8ShGbsHVbF6aK2tFbmIOVGcIQ4vRNvRESCkEjR?=
 =?us-ascii?Q?UH+TjzjU0LkZJvt//XK140dTm5kVhWM9kNf1YhEh+mGtiU2fRMqjRuWuq+Xy?=
 =?us-ascii?Q?AtSdpqWOrjL2Q1QbtQKhfN/O4cslb/kWhUgy2EqJqJ9CoDR7mmgmrlYJw0Yl?=
 =?us-ascii?Q?upquUXenquTG9W7fCqyq3plBtmeYFp/rbTkRURU+RPIS9McoGoirHbRnXk8X?=
 =?us-ascii?Q?244UrmacIr0s7EvmQovCGzQvTPPPj83Y6c7D48uXACTgM7j5wqw/jI43M7Vq?=
 =?us-ascii?Q?9yvgVtYfzBQwP/aHzfgM9yhtv4rHBnrDLhqwhpInbOHYKtrOTsRQjV3P8z3M?=
 =?us-ascii?Q?APDtEpjhx5Z1kynG59q2NGd8poX8EPMjZtmbg6V0qzlIUmVwJ4H5PnXWaTy5?=
 =?us-ascii?Q?SZIIMD5C84m40QYlbTpAPRP4fR4xcT2nnsbTDn/Z+5gmIvnU6FXxHxJ0ivVt?=
 =?us-ascii?Q?0KrH6o4GmUEbFGKA1+gN7LIceOpdxhMnSqCylwbs6sdfNtTBSYK01Qgkn5Fs?=
 =?us-ascii?Q?44boRoqEBcrxOtg2sQPMTR/CC9S7c7tEM3SQQPwAa1TxvPCsF6KoCBTsrbzo?=
 =?us-ascii?Q?iCDz9fFFVlrDQvmDYsNIes/oJn0alWMTrW9DtX0nnIM0xGzmiDbGP3hNarLo?=
 =?us-ascii?Q?XyMcZYZi2j5AIiyLEHHTo8nGInCGOsGtPcxo9012/axvd2rrL6Rsj+8Z1i0z?=
 =?us-ascii?Q?AR0gDOo5Iq+Tj9h+/wv6UTW3zHkUN8HaEzbqL+/jzk7hIPne6Qcf5KIuXPPW?=
 =?us-ascii?Q?PLqTKPHUr2MhMaC4fBhSdzAH2CKldcPEX08RKlGVTx3YeK6+AnFumU1K+Lzb?=
 =?us-ascii?Q?+H1B07tNCKygFtwkY/5sLhe/WRJVZj9UnbMtSxFNkWMF/WWDweHMWMNOQVtf?=
 =?us-ascii?Q?vhXDZ0X7ZDAJysswesQfcoYQjN0RE5uzA+q+9MUiScl9NO/Tw8Wa1+VH7Ap1?=
 =?us-ascii?Q?M9xe3QVsYVEJcPjhPrWqy+XlRawAK6cv8Rm6VrMoGBGmhAS8Ajaj2OSPleG6?=
 =?us-ascii?Q?t6eE6aJ3iRhvFbro48j2IL29yRHE4WPla3x5S+KedLi1ZJSgSQ4QPdsdVqk7?=
 =?us-ascii?Q?zlHnUxPx6xccdX9GjsibArKsV0x7TbLUY60kTqQKtb3ywo+FzarDwSkeWMyc?=
 =?us-ascii?Q?BU+lQXpmGiTQvWytnqCRSWdy8PyPp+GloNk6O1QtQmPO7TVZn/GlvrkyXXVG?=
 =?us-ascii?Q?Yg8PoDic38/+6HCFLpSsn/IjMQr5bDGlMxfJE4PSnwCUIk0AoJM/tBgF8RLl?=
 =?us-ascii?Q?lKrnOHN06dmTvKpN7AnLy7F4eav4Mb7tfEb0WzPkK06V1HbNiIo2xGaPCdN5?=
 =?us-ascii?Q?/EjDkEgrryuq2x3WRNh8qSpGjm1cPW50MajX8wH5Mr7oyiF7bBYTNu5xsnqv?=
 =?us-ascii?Q?5/0ei7E4ZD23SxVmvtTTavX1bJzBIELk6pHkIJbhtKGpLEAusFWibuO7O3v8?=
 =?us-ascii?Q?F4wJKJJeog=3D=3D?=
X-Exchange-RoutingPolicyChecked: naJls5UpZvIlra0wlqYTvNGurpW8yo97g8lxwUarjfLa8KwiWQrAShSGm2IgBoKKXsSBIS3SlRYXhmuh4vjdjtbYLY/54UBJyJ3sW2oIe74nUgeY+F613bqTE16Va7jahxy2pp9CHQV7NN+Tjj69kJV36hZSqwdxOmd41YI2T8cSn6j3myNI7wW7F39lrsezVO4Wihbe2DyamWb0STOOSt6bJUtzeYYxq9Yh+ByeVnTXDBJgn0IDsINq+d8rKpKOfMmk+v941cS19OLcp013tbVsoYiwBCKYf2Y33vaLrBEyWsZiys7PIPSNP687rYQx/D8tMa9MMNV2Ti8iDGPQCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c80f04a-9231-43d3-02d9-08df127a4345
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:07:23.6071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Djm1zUuGUQsqYqTAld3Qc3HLCsZ6vmNTWtl9I8RKqq45/wUGoBG7XEfY6pIle8Fo9VjhBI+gdbg2Hx12XqqUkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:54PM -0700, Michael J. Ruhl wrote:
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
> +

I believe this second one here is redundant.
We will never register the callback and never reach this place.

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
