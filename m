Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD92054EEAE
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 17:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998908; cv=fail; b=U8vXFVqbMhdnGVxPtwuj46JMsS/3p7PBdgCqxLdEvcYqni21UHn2kJhAUybScB9D5iJvzus1CNYSN0I0kdwAFkiKGfpn4pp0+B+aofRPopTyPuWZMPLwL1JPAAqdqWFFHUawWKyXWdyFtAid1r6FvwVOvZz9gzZDnPSGDDUu/Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998908; c=relaxed/simple;
	bh=1iqZUQYM9n1ka7/lDZw9phf0uQmnxY92lkA2GmTI3GQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ah+XywJG/f2bXMnDiayRo15d5fVgbvwNFV0NK/8u2BWWeVJbg8hCCwLBThA5TtQxkXWlJh9C2HVGJ+VMyTN6S/sBzUhId+ya7XcPFeBKyAt1TxE+qhnxmufdoOJBQ71BONPe3Wmo3Nfhoe5nOqRegaco3Qu1adscw8Wi8bvIeVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlGadQgo; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlGadQgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791998906; x=1823534906;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1iqZUQYM9n1ka7/lDZw9phf0uQmnxY92lkA2GmTI3GQ=;
  b=AlGadQgoQiJ396g5QeQuIHiHI3Glebejw8vJrLv84vWWTTa7x6EDpxc/
   IiSgeqAclgbj6fP8QlIdH0WoxcIa4DbdSoTQGXVJRcw1e0kxT9nuzW7AE
   MsFoQ56fNYFYiEKSU2Gj1wFUTAlO15ms9bmlADZZ+uPSDeBJ954kbF4bS
   Vs7DRBZDAAnsMnjxhD+E/0v1r+7hS18maFF/r0dE7Zx57b2wQkOGccLTv
   4cXC48zDd+trk5u1TLbLxGeRxBEDOjG87fdgjUjqSw4ICBTD1Ln02vtcW
   pBo/SVqh3AFlOo0KSon65fS2fGRbTZv1pU9D0Y0qOuuIMv3l3ajftNwz0
   A==;
X-CSE-ConnectionGUID: LPVtxQXsQaax4ukFmDsryQ==
X-CSE-MsgGUID: QwtDy6tXQ2ibid/oVRq2rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="741980"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="741980"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:28:26 -0700
X-CSE-ConnectionGUID: K5JtrYNISvWLeX3sAtE1GA==
X-CSE-MsgGUID: PbJBw/KgT+qlpSRwhnt1Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1446849"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:28:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:28:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 10:28:24 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:28:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCFOXcm/TqAJZFHFUuEG3T+prvReCCq/sAYBolofn3TdBniqotzZSFTl/Kq1V11PU9wbl7eBavaI3GhBe0/8yNH6nblskRo5P87KtpGAHp/E07L8RCFJYnnOnf/IUxgJK/22+JjC/h1jbM06Ej8hzbGUGa3/lRgSDsILyn0XWVo/0ZFpJT0f93ZdlyY6jEW1iNsQ3l478Qfbjb2OO/9a+3WY5KvOvaXJHpphQIldn4kFVi4Vc3L5TKbJty5MBJhD+u97r2DXcP3RYkuszSJ/16+e6TFYtFbVZ+O7MCaxIePcgaj0uVgEKH/T3XqT4lYFHVeHlnmmzdQGmdDElbQizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=048pt1ePC3GX1GYAQPs2/Le0V+Q+lXQKvi7qb0fTElE=;
 b=yAHY1JfaA4MGOryR/a7AaRpWIf71XVwiTUG5GjEAssUMrwdF5oCcYxb/ZQQc6uO32txF9X9r6dA8/ZqSsG1JPwUsv+zhYEsMTTZlaCY+PYvyyyLqMDDQA2WuNwbVJ8eBpgo7nMUw8F8z0gxRQOmkRxBLAWfzKhmWVjN2q3cS+kaoLlttcvSI+PR4vclXWClFWet3lmRzLOuD+WFIwuMlOWQpxdXl+WtDaxG0dSeztYrHWiw/dqqfrxkJXFHElIkNsilyRceTbD19MUeja4fc27jOICAIoEzWg6+Ze+oG2uBCLwX+uujL+TcrycPykNLYDmC8dIw4jwNQPM8VH7Ttgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 17:28:18 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 17:28:17 +0000
Date: Wed, 14 Oct 2026 13:28:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v12 21/21] drm/xe/vsec: Support survivability mode for CRI
Message-ID: <as-7qpao6I_xfW6e@intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
 <20261013214655.3502964-44-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261013214655.3502964-44-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: aea507de-960e-4f06-37ca-08df2a1888ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: r+qcTqC7Dl3ePdj762oNBOW+8aKO6x2F6oH8grlfK+27axmltbggCc4LsRuokNiAkEppMtDEKPGoO7zaAJc9ZZxRoXqHijxq3sny7CwbCTrwtP9tuc4Szp2puYrBCT76C1ZNV0WptiJ/qmNuZsF2VpZS11k8R3M9uPDvjshWUBTcvP9XPQdSOMM3IMA3/UPSYSygnkntEiP+yFa517RzC37lvOVsvYEqmWiDhVbOqlLq9fBvkNe0BHo8kmUb5SnIFACXsl405Cc6D7aEksd7TOMAIGJyE6u+1LRFEZun1M96CIniwrdNpFl+L86oAsoI8suUEPr5B/8TK+D1MaiqV0ZXIY4XzChEksrIRzirgiNcVzsBJag9KogrpMyAqpZbI3pFy5s3m+bLTXy8hx5ceGP4sOCuhU2f0oQqpBIVIHlv78F7n3VJVYza/9B8SgYeIddafCEQM6chE9RQLI3Ntr4VqsCR+hhPMH+fDj34iUpw4lx3ut0eRX0lVtZLPygZl+Y/n3auqLUI8jqaEsqMPmiYFXYJReUczW8wXl0o70KSGHvCzQFcsRj6TDJBW2fpYAOegBtDqFEgcJ6zMN/FE8E7rVHfUJj5zPrDu9Ae9Re3sk7ptbGnUVT67FOs6xZBMVSibDz6bIP2CHNzDrATUBYoW7HLJ5P2JADgBW6A85s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aCvaijx7kH/IY0ceXCmqZLgCqonXjL3FQi1Wyh6J3tZhfNEgOTf/qGMf36/E?=
 =?us-ascii?Q?yQM5g9L3rUwqES6cw1OAIIN4UsgOCz3D2W4jojNUi3BPuuoloYh50iEpDkL4?=
 =?us-ascii?Q?+ab0F/u8UXhg7fWfVg3scgi0phoTDuvu4QrLE9lYfIF1a9zvSP1lQgK7lMnU?=
 =?us-ascii?Q?lGJ7JhNytOBPUZIT2rubTGl/vO2gKbmrHyylJ3/rCNl31ZOOPtQKMl+/lsBF?=
 =?us-ascii?Q?2uOu7UWNe4bZtURdEwRo2lCSZMmMZ4dpFd7b5YwEEqK57w9Pl3r93cMmPDrM?=
 =?us-ascii?Q?gUM61urwF+DFoY4uYuK8kQA4FpNQWENCVlI6Mbc8vs272nm2g+sIvMwWbeKC?=
 =?us-ascii?Q?dakdOKG8wlTcpDQAv+iEgQBYLeY+podmcsp13HYfKIxqQLYYqPgzkzx3Crqt?=
 =?us-ascii?Q?4P9gSMZnt+FC8HSX+9RlE1HaGFsSTKkmZF4PF+apdkCs1KYk0jtdwjcv8Quc?=
 =?us-ascii?Q?L6prkdvlm19PmcXdNmHunPiwo3S+ytwhuUO8jWBDq1yZ5ry1lfLvWvSbyA4i?=
 =?us-ascii?Q?ZZ4GbFWBYKbkDjQBoXdnGw6r28PiKGC+xyYGW84Z1QKfZQICnHwrnhAGZ0c6?=
 =?us-ascii?Q?76qlDt1yZd7X54N0PLmlWscP79cQmhEw/oHQ7jLg0jrEa/AaP6u4YLd6dbbE?=
 =?us-ascii?Q?ygUgFU8qKiu94Bxnwge3OUHu8J5GU1zHr2JTmP5iAU4xAL0BO2WGtrKR/4pm?=
 =?us-ascii?Q?1VmWNa2xgxb4Hlyp7rkSop2UQk0Iv1rDZ7MJHhfYlf29kgu9y0BNog/3vHMD?=
 =?us-ascii?Q?ToX15WKhlkv7z3lg589eTc0pWbSQM4DnMRvolYbqb7wM3Ay07n+JYRsIAa5M?=
 =?us-ascii?Q?bMAhiXEKdOeujSb84WIJIcpQnCo0aegA/zDMNOxGEGNU5lezPiaGMysD84NX?=
 =?us-ascii?Q?Yd3JsKxtJD2nY+YggTzQNQtgDwssZ6G0YxwaLaamBuIt59/w7cvqxAEf0sp2?=
 =?us-ascii?Q?y5dq9oZp9vZovcIoXW3tvE7/+pz6cx+EAR5Js0D5IziEtLdnrrZNS1aIm7u2?=
 =?us-ascii?Q?Wye5tQKnVbGwJgQ5BGJ12aaRK2mAIG7r4rcfD1i59Ws3nxfBYaNDaoC0pfnv?=
 =?us-ascii?Q?9PWIvr/U9UemrDK4XJWNFprkJliRE63OQEWbTVkfmET5O3zOcIP2g5HaNCmi?=
 =?us-ascii?Q?OSBKvhvW/k3/EXmq9H5L9zzpBM9EiGZIGFTMqPLGKGGEfVB7mgmUG4Ereanu?=
 =?us-ascii?Q?+jcxxuxaH1O82+pSAX2bXUAgWAOByYPIBwnj//G/bJ6MxGubn5+ZufQ3yXB2?=
 =?us-ascii?Q?Qt9n/BU8zpNEazB19RX8q7zx9Z9SL1vA3fry+rWO/Hy63TpasSEn3aBoFvQj?=
 =?us-ascii?Q?CmvMO8t5qK7thuLxqUrCvW3z/iWT5qZteEZdzphNtX9pB2UsAaA9Pj1VkHH4?=
 =?us-ascii?Q?T8m3hw+//V/FwzRKE2SLRCCvFaS4ACLgB2v4u1Xg6cXEOcopLDMbPaJqXXTe?=
 =?us-ascii?Q?PTFvbbVWzuMabqg0M+OvyIme+ylPq6oGbp2do/HkHv9MYYxPL9S5V4WaskiL?=
 =?us-ascii?Q?IxHo27/j19Cf4Qka5O72Yny/hNysrgGg36bDFZ5YUxd8GxQacu+65hRvOgri?=
 =?us-ascii?Q?gLzsBGDDQTuXbHhkcGSL6zyDIbsUFRnw9P+wsoDpnMf03Gmhnm9ZbtME3AGu?=
 =?us-ascii?Q?IbPbPs8MYMcGxAdm1aKW12SZW/OozZQSUjozthw+exkto6GrU1cVe+fi3g7B?=
 =?us-ascii?Q?S1oR3Wmu5/s2VHgOK9oDGC6psIO3qR5xq9M92/APchV86x2U7iAOApvg6/Fe?=
 =?us-ascii?Q?BtZRiiOxQg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 3mWyMn43w/+1WaNMjoXQHXsT7DpziVaxNX5Gv5NPrqKxV4xiOpgNO1CMjzUsUmIdYUx2VkDbT/Fktszyhb9fIuQRWepY8XSjtZtA+o1KwKz/zMiQCVAyW3/KCA+JjLQzYf1mr+LLTytsgNVDlOHoTcCtGexaVuE7U9bow9nDO/wTYFojxzHA56k9sVTRB4HEbNFyZGxfCIRDW8UsQq7WMS5rYknc03F4jtlia4l8a76eHODn1/3zK4tp0pvdL30y8lbUJsH2mDIEvrUXV25xxzrpu88AMGKY/saeE3XFgTy+V41cg78DOOnswjA+Z4zYgjdy0PEsRo3Q4Qjat/086w==
X-MS-Exchange-CrossTenant-Network-Message-Id: aea507de-960e-4f06-37ca-08df2a1888ac
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:28:17.4834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTjziMfxzUfTomBeXSjtgxS4iuMw7W/i8gJKq679fyEZ549A8WB7sND4TCLPN5pabcB8Rcbt9maiw7MlHJgpKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
X-OriginatorOrg: intel.com

On Tue, Oct 13, 2026 at 02:47:14PM -0700, Michael J. Ruhl wrote:
> For survivability mode, CRI can only support access to the
> PUNIT CRASHLOG PMT function.
> 
> Create a special config to support survivability mode.
> 


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

but let's refrain for further submissions and wait the base pmt patches
to be merged to Linus tree and propagated to drm-next and drm-xe-next,
then we rebase and resubmit.

Thanks,
Rodrigo.

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  2 ++
>  drivers/gpu/drm/xe/xe_vsec.c               | 34 +++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 45d44ebe288b..f08e76d02054 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -19,6 +19,7 @@
>  #include "xe_nvm.h"
>  #include "xe_pcode_api.h"
>  #include "xe_printk.h"
> +#include "xe_soc_remapper.h"
>  #include "xe_vsec.h"
>  
>  /**
> @@ -351,6 +352,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  
>  	xe_heci_gsc_init(xe);
>  
> +	xe_soc_remapper_init(xe);
>  	xe_vsec_init(xe);
>  
>  	if (survivability->fdo_mode) {
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 1ed904ec1496..6d4ef9cb9f60 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -101,10 +101,26 @@ static struct intel_vsec_header *cri_capabilities[] = {
>  	NULL
>  };
>  
> +static struct intel_vsec_header cri_survivability_crashlog = {
> +	.rev = 1,
> +	.length = SZ_16,
> +	.id = VSEC_ID_CRASHLOG,
> +	.num_entries = 1,
> +	.entry_size = 6,
> +	.tbir = 0,
> +	.offset = CRI_PMT_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
> +};
> +
> +static struct intel_vsec_header *cri_survivability_capabilities[] = {
> +	&cri_survivability_crashlog,
> +	NULL
> +};
> +
>  enum xe_vsec {
>  	XE_VSEC_UNKNOWN = 0,
>  	XE_VSEC_BMG,
>  	XE_VSEC_CRI,
> +	XE_VSEC_CRI_SURVIVABILITY,
>  };
>  
>  static struct intel_vsec_platform_info xe_vsec_info[] = {
> @@ -116,6 +132,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
>  		.headers = cri_capabilities,
>  	},
> +	[XE_VSEC_CRI_SURVIVABILITY] = {
> +		.caps = VSEC_CAP_CRASHLOG,
> +		.headers = cri_survivability_capabilities,
> +	},
>  	{ }
>  };
>  
> @@ -316,9 +336,10 @@ static void cri_late_bind_probe_work(struct work_struct *work)
>  
>  static bool wait_for_fw(struct xe_device *xe)
>  {
> +	struct xe_survivability *survivability = &xe->survivability;
>  	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>  
> -	if (xe->info.platform != XE_CRESCENTISLAND)
> +	if (xe->info.platform != XE_CRESCENTISLAND || survivability->mode)
>  		return true;
>  
>  	while (retries--) {
> @@ -534,6 +555,8 @@ static const int vsec_platforms[] = {
>  
>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>  {
> +	struct xe_survivability *survivability = &xe->survivability;
> +
>  	if (xe->info.platform > XE_CRESCENTISLAND)
>  		return XE_VSEC_UNKNOWN;
>  
> @@ -542,6 +565,9 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
>  	     xe->info.platform == XE_CRESCENTISLAND))
>  		return XE_VSEC_UNKNOWN;
>  
> +	if (survivability->mode && xe->info.platform == XE_CRESCENTISLAND)
> +		return XE_VSEC_CRI_SURVIVABILITY;
> +
>  	return vsec_platforms[xe->info.platform];
>  }
>  
> @@ -668,6 +694,12 @@ int xe_vsec_init(struct xe_device *xe)
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  		break;
>  
> +	case XE_VSEC_CRI_SURVIVABILITY:
> +		xe->pmt.base_offset = CRI_PMT_OFFSET;
> +		info->priv_data = &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;
> +
>  	default:
>  		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>  		return 0;
> -- 
> 2.43.0
> 
