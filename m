Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924903D8122
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402371; cv=fail; b=U6y7r659X0XPlSuAZNIoWs07+2z3itYgL2MbiNN1ZSRcWuruF7j2WL+s9s986h/Uqls1+aqQLbaWIgQFxScdfY+vtAw6yIYcIqyDraEpsM6V/DN69o+7xkTfWNjPl1R9PqhPxBddZAyqJlwlBjr/pSezyrg4QtYRZzB/FdDkwP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402371; c=relaxed/simple;
	bh=UEy9NhQ6FoSH8uYoZBwFBNqgq3hhVKOnGzhiwLvYF2Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cYhlDXlRvoky5ATHQZ86iI9CmpSzl2tfRt8dJEk3IJi/hQfBNmev3d4twQIG3DP9zNiougAlln5+0mIuSuUVl5dGB79sJsJiB9bH0OmOC8dr1UID2MSOn10IhrUrMjpP5GQgvcA4mhPsoWeOFhIzuPqQF73JH095gCGhkGeOUaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnZFkvOI; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnZFkvOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402370; x=1820938370;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UEy9NhQ6FoSH8uYoZBwFBNqgq3hhVKOnGzhiwLvYF2Q=;
  b=PnZFkvOIjmam4mvyI0rJEJfMzIueOQsiZ0c5SQDmcdKFnRYqACa5IieE
   ZO65zWmT3kvXsDqY+xjcsEKBRv1QncbSHkndoGbbkpbWzFJB8mPlTa31r
   cWN9gl5+LRWzcaEaRqpZyuMzginJPkXXwfNmrCJPYQpNvCoLNOpzG4FsE
   yC+S9k3Pym9ZR6GY8C81FbsQxBp8BSnNdTRvQqWvZozV6g3f9ni1gInaX
   B96SxPMvxRQfu+7WkgygYgcp1rDC2jiMZhXoSu/TlRscVRtfF/oKwKeGU
   mYGi4jkCaIMoBTCrntKR+6rXrxarbzQbTHHbxtusB/hNO2mCpP7AXwmNd
   A==;
X-CSE-ConnectionGUID: H9MOPKr5RyKCbi2ei9h/vw==
X-CSE-MsgGUID: 5QtR0Zz5QC2Vz8yHG0QOBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93454593"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93454593"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:12:49 -0700
X-CSE-ConnectionGUID: RLEODN7jSIC6IrcDt1rNrg==
X-CSE-MsgGUID: KTvHOvCgRJyExV83937CIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1078583"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:12:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:12:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:12:48 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:12:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paOGIbzVD/lzIHYJVqftbv0G1IuuwgLf5IA9YW2Pf0/2rZPyRl2WtieYrQt9xJ+LbrMYWEABSKjSC30Z1+GCO3V/sEWI+w8+ZeFCNtdQ7l5dL/QDe/MkQuMr/Q+YhKdoUkcGP8E51dHUCj+SEeatXJI+vEN9lz3yeM4c+S4buaQBT16KuBifzJPJYCuK35PtuK4Uq82gf7S/uWCSmg2Hzu5b+LiXpRwhJLLjBbpJQfm64Jb5Q/vaj6o5v3iNHegdHDzM1VCjordE9LXmNojDDUBOjKC/W5G0D2w5h93idonKqzQYWer5aaI3SPrlfiAs5E4rlDdFoeBBy7RhuZLOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHYVvh7RZwBJHB47KXTxRG3uozv4rcrl9UnPXg9PL/4=;
 b=YM8RqWbWODpAMcFAih/3TNHMIToiBUzZ4n/0RoT6HmSo5GgzhaL8frOmhcN6tya6mWnr0oCxvtWrcFB/CtoJvL0fPXrgNXT7UYXT0YZJr7sTHsu4lSgegq7JNg/Rib3VAn91v8OLveJq50yDj02+8KiTYHd0S+0R5VsymofNJ//HQiOc+eSfj46iTakP56CPclX1vSQRamQtM6MTDQDxzi3z3Qr3FTrEdgFQQ54NFJl9/IUBKtnH2HwR7CKLSiJFG5ROd/6wE/UG3FJ/safvgwrJyUu8OFI0/aBt2ayu35YrEaSuRqczAqwoIt8Kn4gJDJeP8u70oevDoMVNc2ixJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:12:42 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:12:42 +0000
Date: Mon, 14 Sep 2026 12:12:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 12/20] drm/xe/vsec: Update VSEC probe order
Message-ID: <aqgc9KmHblQ1Xll5@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-34-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-34-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: b62ccb4b-3daa-4d87-c45c-08df127b00ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: av7S1JG/OAwHY/Z0uuUmnyVD+MNvbzYuX+UpQuivUqTInZE/+ErDfjbS4hyFy9Hr1akFrneNRuUEMBQG/ix00+ELBFec7/bY/ejC2u7VTq6naLUGxpa891JbcMfowBHw40iu0EU3gRkqTqdub+3+E0QXhAlgwXt9uKHtsDAu4YLBGH+u4/sQiIKCb7fO+VKUdyygPZ4vQohI6JItl1GP97duDljDEH0hF6hzC5B3OxEUR485YNXkw2P0uv+IT/+w01cqjwxIhDYr7cNISn0mKaBKL3px27y40XpThQ3x2kAI8PnPqKZonDzoC/KjgktUQL9OWXgDLsRuuDtNxLYBiVNqYjCm29v6135JyWr51YDYG2hMRwVbQ/6FpZGr0PMaghVpoLSJBog62keHmBlyoLuE+zfvTFFffV4nJIJXE1rAtqfB/9puvcL8z2OZcBcAS1aCJc1I7LbXfkwW/twgow9nTHzGT1r807cgeEKI6vx5806O6tdPNImh7o8/D80pgQcWxq4v9wn2rxibk87UAMb1Aje1wmGY5/jDlWMbls4O2K0qRaNAWBMIm3BhkyGkAMZIZKznE60/qTcyWmKc989mZNucKJVcqHsHR/9Nc3gpEZjdvGl+QF2p5DkezU9XoED4LkiEyK7+z2qey6GYj3X6/aMPj3L0XtHD5AJ5qbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zXAYq9ZyrYO7Wrt3trAny3iULA6lMwSFwmRehcE0zONOO2KM7Lz3D3hkLYBQ?=
 =?us-ascii?Q?TKNBED1AFKWz2S/wvkMxg0wy7u8lkWkDoP5H0/ibb9QnNdtRRDkO6kZscVlx?=
 =?us-ascii?Q?cKV6DrmnywqhN6MmcHzIANcxre650MYWmyCzho+egxupri9Jk1bIC3iN31Cj?=
 =?us-ascii?Q?S5UIoyisCXOm28K5v5lYGt/3uH8jv6XAtsbdiXSe2871vd2GQ1ZL+4S2sJe9?=
 =?us-ascii?Q?r6YIJcEm9z67IYW7BlRb3cty+8Akkyh+v8ewM7cnSeIOUaJ/1WtpMN0Ft79f?=
 =?us-ascii?Q?fhFUrr1F8AqA1GtfJe0MNfLlMZfJP/IXHgDPr6TUXuHmRj4XDA9udabSRcHl?=
 =?us-ascii?Q?wLv0jxePBHYuPJoARHZ8+928pcXElrLJzlm7qfC0ofGZg+ZoX1Gg+CoD9Li0?=
 =?us-ascii?Q?ZOUafIgcDCdmkMztVnSNJzC1lhzXDUFZwf0jhAiDd6Ji/GLKDxLxew7Kf/7w?=
 =?us-ascii?Q?TCkFlXNO94xWaohaghR4NTOj0WkQIKYgEo4W7fdZQlJFsotMKZM2QzcFiuHP?=
 =?us-ascii?Q?HYDTINIDzLQLcYUZYQFlWFUc6rGPVASCduF05JmDMFpCJPZBVEZdfWYbZs6y?=
 =?us-ascii?Q?4DJ5bQABLzOA8jiOKL035tdiEiaNpmI2BwZsMo24DEIXuUHHFAkmKGY9Piey?=
 =?us-ascii?Q?qzbeADVz+bYmGLkGUslFWgLGPFZnE1PjqqtQXfHBld9SJS46Cq1lKeiV4vV7?=
 =?us-ascii?Q?8TYo2oKkk49loZfZFp7QmW5poQftwLw7MNYEPiJoC0vaiOiizAG4vqJN6eFx?=
 =?us-ascii?Q?f95I33HIwMZNu0Yqk2yYHyjsQDzjSwtRHhZoCaSbl7nULfrSZMfL03a39dxQ?=
 =?us-ascii?Q?ZaI0ZGAmtYHetaPk8a9UoMPv38nJJCwVip57x/CNRDIKEBoYxILSyktSDB3l?=
 =?us-ascii?Q?6K0VosbfOHxZDhwRjVqNZJ5DhOtTD6zG6+T9OGLRDrSEZ7x/paA4yAaOuw3z?=
 =?us-ascii?Q?94AAs0uKxLXNaGjllUlPspp1O1p0n7A7MLesnH0XSzaiiRh6UXad0JHIu5CS?=
 =?us-ascii?Q?xZ3S1cVMKplcPJFzrvc/tvpaiqjrpoqPEAi6P6PYWlVMbv+sAD5en/Q2g0Eo?=
 =?us-ascii?Q?3pOSJDM0xxyAXpCqilUj8uRMfTdzSTMQzAlagC+WTf1LvgH6Rkyjid5tgpvf?=
 =?us-ascii?Q?CJnnbLQY4PVYlmjk2dnzYHTpJkxMV7y6+9ZeT/o2EirHJWXuvKwyMUOU+7TX?=
 =?us-ascii?Q?/Wg4ngCM8JGjgyVYntAH3cA606+aCyzExrNpmwdjQtHD97jZ0736Cy8RW6Eo?=
 =?us-ascii?Q?JDzughfdSt810JArVWD9LyGxDP7a1cFhsbln49+spNWMWSHSMHFWTC45F9YT?=
 =?us-ascii?Q?//UL6blWY6rm2XsDXJR72bL3ChOaAcOvcOpy/X4BqzyTpdVh1n5uuMtfxvak?=
 =?us-ascii?Q?HAehWKA16BuPk80ryhDQ6OQ4vJB0U1GbCKree1xTi/8Wml0ljZ1mYRHtmxdR?=
 =?us-ascii?Q?CuGGxKqvKHn26dFACx1pkIOmuW6Qg+dpFI2lImp26GBI7vfs05kwhkmcnGzV?=
 =?us-ascii?Q?9NB/HYQ2wQk/jTW9B+YSLcPRhF/k1JNOEggt2l6xG2/V6XEn+J0NMJAuNzbx?=
 =?us-ascii?Q?Yp8N1Y+JTqZac10c+o9x+jOLglZkwCVva6FKjnwZVAOXUc5bCW4WXc2GaiF+?=
 =?us-ascii?Q?ovuEJg5fwj9C3qY1dsB2WOiXd6ulpYFY+PQ/s75okyJdd6a42H/X/bWO8LvH?=
 =?us-ascii?Q?t0NLPT8MMAYylsMsPEH7nhssAJFlY45JmDlHbf0YSKHF4N/0sOeqAXvDSEK9?=
 =?us-ascii?Q?hvAGJfRh8A=3D=3D?=
X-Exchange-RoutingPolicyChecked: K1tGlEctV1q2OuwOqs1SWi+c3Hl/N2vvZBKpbIJKl4Bce9R4jwu34e+XOd+Wcl+zl11Q5fymHgPFma3u6mwwOEXEclo9J9K4kfxRtamv/vA338cVkhlT/7Io+opQCUlosv90zVKXpOKOSDCsYaYk2ZckoCQqgo2pDCZaEzcRHyjX5GEOVWaZc9fMr93oR2RMZCqA6cfFJfl27Zxom0IhpTJ7xHcrZkI6EnB0XGSvTercJOTShJBFd9RcUAHg/kWon0aCECEBxhQy0n/AY3/JQSRoYAU7p3cV2MdLu71LlG9KH4cyg/8lH2hU+U8RM9prxqGiAFBDzOaJVJj4jmiQTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b62ccb4b-3daa-4d87-c45c-08df127b00ea
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:12:41.8425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55v/GdwNHTFkYkYeeLjjawvY+TXOylfnX0awwePosOsuHDagx2iFnoGgBkgnfBYfrtIaOT0NHLup+6hXGMjK5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:12:00PM -0700, Michael J. Ruhl wrote:
> Both debugfs and hwmon access the PMT data area before PMT is
> initialized.
> 
> Hardwired offset usage allows this to work by accident.
> Upcoming changes will break this usage.
> 
> Re-order the probe steps to initialize VSEC before the other
> features are initialized.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(Apparently this is the cause of Sashiko's race finding on patch 17...)

> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 205cb4e7f9e8..3ec950606e67 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1053,6 +1053,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> +	xe_vsec_init(xe);
> +
>  	xe_debugfs_register(xe);
>  
>  	err = xe_hwmon_register(xe);
> @@ -1066,8 +1068,6 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> -	xe_vsec_init(xe);
> -
>  	err = xe_sriov_init_late(xe);
>  	if (err)
>  		goto err_unregister_display;
> -- 
> 2.43.0
> 
