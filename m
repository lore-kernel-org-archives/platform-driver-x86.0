Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47012F7F07
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787598489; cv=fail; b=ebB1e9VzvAXPY25ayp1fWR2Uzy33sM4UhLBt4fIEsR0fLAtp7UXfWfMCGSP91de5H0jIKtOqIoa8zeANCQloZhYaAKPa7BEcZRBef3wNBsRM7fXDQJhHUoVpA1xWRqTTy5gSJkSDuVlTHxcF58dvPVh9veszg5/Q+ulu03lIopU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787598489; c=relaxed/simple;
	bh=W1wR3e3lqZl3HX7EHI3CNZBhcjfj5H1S/eixjZFmuTs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h4ASUtPtNukkHQ3Q4ll2TBveQbQnUXtyrvF0x95rMbr+GbnjxkVRsxCKXseHuxqZ8j6N1NM/0cFUOXhDZcFDcUgdYhNZPFVQ4jxkAkd3Yjn2yq5gY1JmSZQTmhEH2rk6zCcxfBXTGlUr+NNuEZ1ZTyeg4IbbC4ZH1BiUcaHagl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yse49UFr; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yse49UFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787598488; x=1819134488;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=W1wR3e3lqZl3HX7EHI3CNZBhcjfj5H1S/eixjZFmuTs=;
  b=Yse49UFr9IZ3UYQHaVuHZs+R4Sblw3RMgYhFAZthzwllrT/VQPdvtEIv
   QhFzj9xGXoLBFXey9EEXqLopOhUXhH3e6uJjsFWw5QigJDTQYLcLPq0L1
   lqRVmk1BmUiVnl/i4N+X9NRuVXpQ9YXYaM9mLzQY9IgolHI1cQLSM7PBS
   BcqTpbtIN0WpNqdJQLKCkhUHWBKQUyr8S4Mb5P2V2vZ9lVDnHJmMeSY+Q
   qSxtQl738u//5IAjIbT6xBaAnprbDO+LGg7kZZnr0iSEUoZCwv67g3opY
   SPBYB+e1Z720hF+akv7x/0AGS6woBTrMFjCFIj6TwDMNdBnUCAYXOXFiJ
   g==;
X-CSE-ConnectionGUID: nIDO0LVCRpiuDTku9FD0xg==
X-CSE-MsgGUID: ms+GAQUmSLG7FqdDyN7f6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88263401"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88263401"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:08:08 -0700
X-CSE-ConnectionGUID: sMpQUxdmT7KOAlu8E1UcxQ==
X-CSE-MsgGUID: X3WSwdIaQhWWCiw20+XB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="264460930"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:08:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:08:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:08:06 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltc/GW9H9Qs2m70PotaRVThcqLEsI6AyjkGL3Xu8v/NWSukB4OQfQo46MIlXp4SJEVgTRUDznyWhF1SKh5Q+c7xI9eY0YLjKDZdwwTYFnvTfn9eFBjLfqoIgtMMOF7pNh8YLJdU8ofFgK+4IkP4wxPRN5g9xik4C/7l/j9JMeBw2TnGttHRJW8MxBaS9omMNOxVHB++39lkMinWlN9WNdtMVijeDeEshiPLJTbfHfsmC3RQrgCTTp0QW/jpO6OIbTQXtxqw00IvVZXUGS0hmBwoS3KabirvMhDQcQVeCmb26zpHzw0yS4KQFuQtdAkH1bUhmgoJgJmtL9jdsSt79Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeowvSlSPZRcmbx8g5H/Vbj+ZH1yJu/LCPAyMdmr13A=;
 b=YgJ8bhwHgRRtR0lA4jcGVPMjGfnAUNgNoS3lJQj3W+/o26y875qLXozZkreGqLm1Ky1BYA8skBgwIDw/y8gFxZ72xAp9TN69ltW4TumhsMez1iLf3t1Sz2n5Z82DzW7VTk90r8hhQqLacwW2+iPyRzquZ9EssQtLrXSMIT6CcuKPUrheBvEeDStQyzmR4mBDI2j11r3xB/vz3ESPSZA2A3umBdA2ngmPO5N35rn29p0Xc+hynWOoUIo7tgyEbIUvgEplvdiEgExwotQpo5lCvi4YWvgsU3049p/57tNvGmWgYk4XDHuRDcSPjdQqNrAwKDlo+OgQ+SYdcj9P/6Slrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by LVUPR11MB9810.namprd11.prod.outlook.com (2603:10b6:408:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 19:08:05 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:08:05 +0000
Date: Mon, 24 Aug 2026 15:07:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v3 05/10] drm/xe/vsec: Support possible hotplug exit
Message-ID: <aoyWjyw-LETklFfJ@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-17-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260824162317.2450380-17-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|LVUPR11MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 9464c7db-159d-43dc-0193-08df02130682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Kb/PDBpxG/ybYZQLzl9W4RFuPiwZ0/b+KGUrBOQF0xTeDpM6DDp1FdogDhPMrHJfBf6O6cNifB9wXkBQ6PkbQXqRY9O0IEBxPVMtGvAnCZQNMDNzYW8t/jTlZFyWxLluggUSKffN4diS7yVMtLYaNO+W1KRTKxpakd7mW4zmVLNASkJk0RG23q69CYfs5EWM7W+ZUgjJK3go+C5FjOupXjHyOSAic4AXmajrPVwkahD+6WG8WXfLPr/8rDlGBOqAlxuUC1RTUXwH9yeHpzfGZJgTiFZ7qiwySzQIf2Ho8MSCZKyxgd5sdryOvgm2lNol5paivOFZvdTT4e+ETdrHwTN5GXeCJntw8x/kUO+fRbFAOKealvXRxf9uQbxZgXmZUTW/GYLSv5kOXnrGx7sVXZRr4gPc0fAj8QfLEZ95IKSYC+GNqJ21fURloB4+vyTk1ekapOSfcbjpB488K6mvDrg7fILvLZJf0b3UXg/Cd0rsKEzlG9eqwMsEiA/S8qAOzcLifQ4vBDb5aF6Mv91wFC5TfLk8r5GlBgHCO0/EcOmLwiIbt4oCJI6UgopDV5Py566TvmXtz1P9IOIN/Lpr7VNodsKDpDOuKx8ihGvnls9rNBPDvUp1qu0V6RNTTGWRHVunIFFad6Zq1ZEMTAxyVTKgfeYFG1MU+ecwf2xnBoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zd7TJWGVXGGyAu08fjMcaoIGMo6jnJ8+hPmCq7W07DcV0rFJFydvchg/0hKq?=
 =?us-ascii?Q?7/PvQZvmE+xih3QcBlv8B24R8t0fINtZr/U33mpSe5emKIzi33DDrLUKb0yr?=
 =?us-ascii?Q?eQlOWUQhdVlPFSRNmoyrnUGgWxpHYuFrcTKsTbjr30VSc2quYWxrkTSSaoJi?=
 =?us-ascii?Q?NsKkwbM73HnSzfyYEYeIEUhJy96s1Aorc2RE+qvzpkDJN7xQ5XiNB72O5a7F?=
 =?us-ascii?Q?b7NMwfjdorP5x14FUreF8qWKdgPcIMPFZIv2ZOLNIboa6Xj2/dbv7tm3Hwi2?=
 =?us-ascii?Q?Bb+m9xTGCqpLfb75S8xNEPbcLEQXS7q+1hW+Pnm8GeZF4RyeUOJcYGUN2N+e?=
 =?us-ascii?Q?XssmeFEYRZSHoufBlL4M4MMc0vpK7WgANXO0mSuRnzX3yQedAsyo8qrsAHVe?=
 =?us-ascii?Q?NaxTk4dNkfc7BheMfaxORWI/cNG3eeYOzlqYnA8Maf774fsVTUkWdOCU6m2D?=
 =?us-ascii?Q?+3fkitbFsy9yyL6mhBsvBe2viJHZptt4qptNKvuYcKJ3XznpDtPh3vcCPfGN?=
 =?us-ascii?Q?nFsrmml8vYIVlbwXMGGqCwr9kLEtrj8cyawPv6La1SSkeX1kK1zn5Alq02Mp?=
 =?us-ascii?Q?De6R2a1cZvMf70c4soHdiTXK1pgKo4AFDDu4UUF4px5lj6EnKO/fPPhckjDg?=
 =?us-ascii?Q?aBnnlzFF0r60RbGlAGz78TXsfXytqCat9rnlU7fhhC7g3E3IkcjFR6A6kx7L?=
 =?us-ascii?Q?TX4xRlbl+cRb1mZ0Pi4ij2iYqHb9p5rM1oaqdLy8pSDCFIXizhdN5PjfZYKr?=
 =?us-ascii?Q?2Wkf4VE0Qr5KA+2XxQmv2CbXEofnxGXtJnGt4t7RVVchlxrO9fUbMvDrE7Zn?=
 =?us-ascii?Q?emvfZXdxR6yYPzGI7ETubBlHcq7B5xyg5n5y95J/Hwrn6hrFuUPig/dzZRxL?=
 =?us-ascii?Q?OWUbLiaeyBm1tbUXARoikTgriDkWHqIhFHxJNVApaYFlFZbmACEt0bm0b5la?=
 =?us-ascii?Q?YMZLyxN/oOi+Srqs/pOAT15TezQ/GVu55J6iei4ZHwH+T6o6HQEDT1mTkJi8?=
 =?us-ascii?Q?/WJsIw41p7B+c3wGoj4naLinCaPhE26EYARxjbWNhAVXc08W7GkNSFdyfNwD?=
 =?us-ascii?Q?cnnl+F1xn+bh1cSY+e4Kn5lAMFfyEuFQhwl4ttUvNFQXI5AAPZquSA4kQ7Bx?=
 =?us-ascii?Q?gcVRQEmQXMQP7oujZcBY5SQQCTv5bbKqYDWdDq8Cm/vuMJ/Sxl9F0pq5fd0s?=
 =?us-ascii?Q?OFlAHCdx41h0ebZeLjGVRwP/fEo+dhcy4lVxKJ9oKB0zYOj5CTSEsmekf+tF?=
 =?us-ascii?Q?yaNT24MCQSXaVXIFAgWW/fnySkMTkyr0R+M+iJoMzCKTYIpy2K6Vr3MNoO6A?=
 =?us-ascii?Q?bmT0Qz4YV63O1A4hbvHKvxA2fNgBWVs3O1gnQorZafb/Lswu8h/80VqIZzbg?=
 =?us-ascii?Q?pX5XUhkV4dtARZrRmQEeFwtfM2ZBfhIW+vW44nI3OGvY2q6IWFQsubhZMaSU?=
 =?us-ascii?Q?SYq4lir8RCCgaPUOutkUqf8YmLhQFhmoAZfVVwjpfwedaJTDVZ3E3T2R71al?=
 =?us-ascii?Q?fKo2aDwd26pLHW2/Xvb3SB6cI12o4yoawQpPYvZE0a6Hn9acDoQ6D3ErDhDe?=
 =?us-ascii?Q?Wg0Yk9/3Da9wG5DyX5XD8CdtBO6hjmaCnG0oKVxPWlwQBraDLx8JzKJM1WAm?=
 =?us-ascii?Q?qIHVXBcvPs5thNUHopGwuGoDBoLy+F4Hg9j2MHEy0GRVUGjv7mRdDX7suSOi?=
 =?us-ascii?Q?jT6s7FWT+1gilG/XFHTk5ZHy70TmHJIPxkEPGiFe0s5ukC3gwBc8iQnPAxv8?=
 =?us-ascii?Q?1wGzuqNzoQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: bjmA5DjFBU9vtfmXL0tPMYFUcbGeJDie0H1+BpndKaImNOj+eSyrLIjoAE7Z3Uqdntacw0uU14l3hINupblc2e2XPGuLiLWr73N9s615krJMV3uxaZ154/k/S83jxmvpmVuV05V6Pj0LIH5GX7ZBOOYiNodsiK98EhSqVpGXXYB4GKoxxioZt5lirtyuRl2vhcypgNTNYY3syjE+aq5iygx3auWg5if52CP5BT99CHWsiFn62VEJpenlO/uUaLo0L1uwq3O4yYLlYLKq3Db2WjpBw63KDOa483vZRA9VvKLeTDzi8JoGU0rXsWJI9qyvE917K3XVAxsQ4WdnZEbPzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9464c7db-159d-43dc-0193-08df02130682
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:08:05.0169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rVcENx5Gd2OgoNlNsBupcvqQ/+67xlygTF+YCAmcm8wBiK7imPlCx9mD0nMSb5jjby2UPmIjjGIl9rxPtia1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9810
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 09:23:21AM -0700, Michael J. Ruhl wrote:
> DRM has an API that will verify that a device is valid in
> the hotplug context.
> 
> Verify device is valid before access in the VSEC callback
> API.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8d99a3770b5a..8abe11e6312f 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -10,6 +10,8 @@
>  #include <linux/pci.h>
>  #include <linux/types.h>
>  
> +#include <drm/drm_drv.h>
> +
>  #include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_mmio.h"
> @@ -140,6 +142,11 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return 0;
>  }
>  
> +/*
> + * xe_pmt_telem_read is a callback API.  I.e this can be accessed external to
> + * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to be
> + * verified (drm_dev_enter()).
> + */
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
>  		      u32 count)
>  {
> @@ -148,14 +155,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
> -	int ret;
> +	int ret = 0;
> +	int idx;
>  
> -	if (!xe->soc_remapper.set_telem_region)
> +	if (!drm_dev_enter(&xe->drm, &idx))
>  		return -ENODEV;
>  
> +	if (!xe->soc_remapper.set_telem_region) {

a pre-existing component layer violation, but it would be good
to change this patch once you fix that in the other one,
creating the xe_soc_remapper function entry.

> +		ret = -EINVAL;

probably worth to mention the change of the return errno in the commit msg.

with these 2 changes:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +		goto dev_exit;
> +	}
> +
>  	ret = xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
> -		return ret;
> +		goto dev_exit;
>  
>  	telem_addr += offset + user_offset;
>  
> @@ -165,11 +178,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  		xe_pm_runtime_get(xe);
>  		break;
>  	case TELEMETRY:
> -		if (!xe_pm_runtime_get_if_active(xe))
> -			return -ENODATA;
> +		if (!xe_pm_runtime_get_if_active(xe)) {
> +			ret = -ENODATA;
> +			goto dev_exit;
> +		}
>  		break;
>  	case WATCHER:
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto dev_exit;
>  	}
>  
>  	mutex_lock(&xe->pmt.lock);
> @@ -183,7 +199,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	xe_pm_runtime_put(xe);
>  
> -	return count;
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret == 0 ? count : ret;
>  }
>  
>  static struct pmt_callbacks xe_pmt_cb = {
> -- 
> 2.43.0
> 
