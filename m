Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB3D468C27
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401502; cv=fail; b=kUFMzKG5w/PoMv2n9jdvyB77N1KG3UZ3MC4HFTBojDwEeLaNKnQa95yfbzTfWXsrnF5np3gfCd7QvPbgkelu8jm1Qc7vw3srQWAnGMzea8/V8f+SiXypb0jaVa4CyJcjtNUzPgRvQxTG0Rqbfs5hXCaXGdnmRlj6x8nqGrViBhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401502; c=relaxed/simple;
	bh=n0dMIcALWd2ueITVFX7yLHidvSG/kLPyud2QN2m1AhQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f3HhcGXTkSrKd5ydVuomLJUnoc0Kn+sRV/BujvgsjEYsEkjBTUeUkM7mzmXggs5QsrujzNS+dNYg0SxdEiNVga10zXXaK+6O6TrNktU6/kLoYp7T6QpdcgGcDV/zUxzdWeA0iLvtQ/7gWbV4H1R+SswMIQ/rJrZApW3iH2Bnf7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHKYQo22; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHKYQo22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789401501; x=1820937501;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=n0dMIcALWd2ueITVFX7yLHidvSG/kLPyud2QN2m1AhQ=;
  b=eHKYQo22S0tXLxAiGnnZvZMUdex1cJz06/XLTMlRz60SvOFmXf/LPCET
   5YqCotFsw0zMnHHGX4W3weebk0TZ/py+06021AM2BWSHYBM/8HfE0XUag
   A5CWLydVDfM9H+PPJR8IAjhd0oqHHRVXhm8l/Vt++boKb3k3UrYLaoIBG
   eC/i/MMrjmb6K60/rpdCdXrJmpik8mIurh9yZCk/7tqvRl8G2FwzN821s
   9LmiAd8M90y4wLOLg75/rd1pOA4WcjXxhMBdLgPbmGjS22pbIE6jUCuEU
   xvT7LJF6oMXnlSlK8cBz6S1aIpu9NJmFubr7Po20dUE7PC1FArSQzEGY8
   w==;
X-CSE-ConnectionGUID: 6iE+YlGNR5e0R18EKzfZvw==
X-CSE-MsgGUID: Y6Xk/EyYSHSpJKsjl/tBuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107127345"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107127345"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:58:20 -0700
X-CSE-ConnectionGUID: EPHB0nzFQoK3U0rOTdj/sw==
X-CSE-MsgGUID: j5TsYncWRruC+szxDL7lUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272176224"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:58:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 08:58:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 08:58:19 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 08:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxC//ujnbySKZiGFjo9I1d7WGXSP5WWXN7iqWp8wxMQlrOw0qH09ZMe7OyT8M3Rk8XqOWPm4Q+B9jtLe+fOOkekNXy+Qmpmb98yBqIWKOS5WBlGljyXt1qWsfcfhf3+PccNTpX8dXTSDm+apOJ5iq8Excz5DnbA9MHaRU8H9cd0sytl6CaB55PF2EewxEfZ4IfofpDQ3D7P8KSBWGanV5fYhbHX1sBM18PlG+jOY9fX2vweh9hR+g1RoqFuzQdeWr7Xewbn25XCg6mChz2HwJXtA7UEZuOY4jXb5Dc5ipBZ3s6yPYIrH1OaXJ2z1SoJtq/zium6bkgiQ07WP0/h2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MU07USUn6HEBQvwqwIiKMjpf8wKDRS4C6e35Jg9slUM=;
 b=aRUx6HA0gW7c9v5z3fTsi7X6QXdt5p70RsZvwHy+dyK1RXyn0k2eEh6/WMetwyG2wiVYF40Y3JSwYMarv9MQxw2cYv/qrwIoCIgpaDvIRsxEDFocLuArHlEcb5eb0Phv1MiaqqHQmAwkum+GxhtliM7lXOBwoN+kpa815fw4ZDWx21EmvoyHB2GIVohUElgFIZQzK3K5RFEVyb5+3HI13TzX8Nz8Fg7rl2qwmBKpQfMIWIJoLOSJqLaFUt0d3gCTIACLbMb673aRrMdzAuiZdL1yvnwRm5yl4UsAXG6KQOqGSPq9IHCVuBvhLEM03eT+kztwWXUGpI1nGvu8/08aSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:58:15 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:58:14 +0000
Date: Mon, 14 Sep 2026 11:58:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 17/20] drm/xe/vsec: Support late bind fw information
Message-ID: <aqgZj4S_meH4YbMa@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-39-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-39-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d586d74-3917-4c86-7a07-08df1278fc13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: RVaNxZvR5QJFBGZUymvubFduDZ0KLh8cdrzKRABNY4uZMMPXCDe5rHgFKFbAgvAyAwhU72lX5L6rODzAaySdDeftSK5e4Ukb/cZD41q8ifN1VNkmRl8DzytaukWg8r2g1eYenogYV1zi0b47RrX48GfIux7hWQxT0uiGrW8uDbjXIokhCa1ZRUr7PHsffih7Yy7ar575cM/Cqyvein+PagJ1OysU7tsIrPs6wjg/1GXx34xmr/js0I+uQkgphO2MOL3eghQYpjmT2OL/+1XijzGow746Qqt5GPqGEtvk6GB1RzEENgt30qgnQX6g+zNqct5OupDh7OjWMy93O2x7+736XgDrddS4jxzuQ16t/+qGAKydeVz7sj/GmeyRF2eHMoP9YdDH4aimcDq75hfOI9+9Tp2nsYUVV7SH50VcFpmxzAwhoi1Gf1v0srm0MobPcCDXFo3seIgSo/j+TKQiDu6uBjaOamjPVnFQmRlXFBCXRzf/Lbl6spld4f+7p86ULU9IyGCrnlAUL7VSX9APpG4XEVDwkmzmtxAj4G1JaBItQ/40jU6dDJ+mseg+TBeRKHg0gG9kpO3+UzIWPH7UOWkHFAoJwS7Uj2wvGB5io+ttAjDf/ZqPCWO3zA3T2ny9cPoOEv+dqoET9Ny80MMNoXSerwwd2pvNpMUCAOHICDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gel9YEKfvjOVx0g4K3BE+iWRIn6NiGmA6YLMPTyve+sajFRsLYHcaa7WrLaS?=
 =?us-ascii?Q?+7Pdbw/926prDHawfvHCFHpkxYGSRm7tQdL+Zfzj8khJLbwx7/8hVVmjja6p?=
 =?us-ascii?Q?9fusaW9yUyUT09WI8e73dKwghNfbyLj6Bd24TNHYx7VyL1Lwq6UQF3p6jmxY?=
 =?us-ascii?Q?dVfIKTkJ3FNXaStiobyjhKSJGsJMnJUsi6RqzgPyEtqU1/aZG/p7TiGq8GMj?=
 =?us-ascii?Q?qe3j0du6vrV6vIdLDZAETsUwFm7+fjq8v/gjvcQtucsIu3PD6vY89TvQ/b+K?=
 =?us-ascii?Q?TIOLNDWfzn+OoXiHp1HEm6zI/UabFkQN6r1/J69PtQinB7UhrKmILiCuqxs1?=
 =?us-ascii?Q?xkyzqlElgNU1MjGBO+v4yLJ0Khg85dYbAuXrKo5E2THFVXCge2qDwQ6ceTcE?=
 =?us-ascii?Q?b6PqRDFp96mzh9bdIyDzboedW0h007xq3YS1ypmnqrMEmCEUuITMlu96nEjB?=
 =?us-ascii?Q?Tg/Qafu998UqwzU5xwnnVoN38lr8Zi3r8r906Kvgj056wdIhSpsnWRePbnDC?=
 =?us-ascii?Q?Dl1AlOhF5I7DQOyO4EkQKSjv58xd5mWND/hr5svc8GjNlSzWZSuy/DFZdoGm?=
 =?us-ascii?Q?VeDG5sqrA5VHsr/x3p/X/FdrPYgA2wvQyZPaH+Ng1hmt9Vf2cYYO7+vr5CLs?=
 =?us-ascii?Q?s7RPuq7/7Q177AMSrvaWkUWskr/FYFc8ejYquzDgqCB0o/2q9KSWrHeLiLhJ?=
 =?us-ascii?Q?2jwkD2KpMkB072pSPbvG4s8oZymYau3PeyOBoYvSmXyx62JqvzOSnN8z5Aht?=
 =?us-ascii?Q?SEvZMo/Rx3RwyNT2KuwZ4ofI2t39ozzgJBa6AZxT/NGYY0c/L1WH7OSHOtrP?=
 =?us-ascii?Q?WjktJm1GSWbu2EYWyoKrIPH8aYy3MI7DBzDpnYOS224aA/lKQUAQbGo/YrxW?=
 =?us-ascii?Q?NeejbKRZa1vuRunChQWjvhH5pnFp8WntXmHQwXcJxSByf96vSIPQBKhJHoyM?=
 =?us-ascii?Q?TmFVbX884ouv+g7DyXgsQELNoPRCbiB1HrgtaCvae8h+Id95/rTvI1XgBLwi?=
 =?us-ascii?Q?n33OfC++o08mdoKRFWsqNNVUqFZYkf7W1TCWetf7XNuT8wFZ/ssupq9BbPgh?=
 =?us-ascii?Q?pHorPMuNkjx2rSMKyZJDs7mhzBC1QpYvi3k/nAFA0eHah3N/ZLdhp7R4TFHI?=
 =?us-ascii?Q?fIrgmkf57hr5xaFickFtEOyCExc4qHFpNvBATBoRz83djTKIhkLOVJMxDbB8?=
 =?us-ascii?Q?6waAZ/o/RvXEceav3xI/FZOpHvhV4ITkoGp6FRixxVkdacdcnn+8xTEYzG8m?=
 =?us-ascii?Q?ZDLW0hp0ziA2gue69EQCnKDQy4FR29AbUbpGwTpdB5rlEkh4lQrxfNYjCbT8?=
 =?us-ascii?Q?UzdAjLAlImcL7bZ14FaEXw3dMVPqs8SFuv2tk+OOMDk9xxjKUTSPVcAXAlRy?=
 =?us-ascii?Q?JiXywpdTsaMrwlbTUX/BTtwBo7cs573Us0DbTy4iBropg+7qQGpgCOZONFz1?=
 =?us-ascii?Q?8Q/Q11X/Gk0Wqsb7wwZwiYbSwZbB3IFDY8P5NjqHfCD/iC+FYWG70PEhbaFV?=
 =?us-ascii?Q?MlOPwEPj8qHzOWeltm3kCxmoQllzYTHHHKjpYOivv+fYAEd0WzJjaos5tWCJ?=
 =?us-ascii?Q?OtNpDnzUL5EwppijatIvPlfbWkeh9at/T+vyea+h+9vNUcbeOxO0acCSrfdO?=
 =?us-ascii?Q?OAzGuLG33ZhADTdniTsyPDqoux0qGpdOTVmNsSfBX3yK6JjZ9u+vGGnhldEX?=
 =?us-ascii?Q?4HvoXMjPwcXneTlaKvcMwtx8OYSPx7FQEp5kx5olz/eRmpQvlA4ulDcnPhe2?=
 =?us-ascii?Q?d3MXTkO3hg=3D=3D?=
X-Exchange-RoutingPolicyChecked: AvDklTnvdcKt5xqIKzSgCESEc5Ppasnksx69Xkbqk9Fq+QNncRjJpX2SJhtVqnM2KZKhWB5wfqMqbl7jL8rqHObNXOWc7yC4OZAHChINdcCkX4/8GAQJLu0WqLgsG9tQ5HRlrdqRUrHQe73fFS1JrLovb3mCo0BbJiWD5UpbJx6nPSkktgunWAv/WjOcsBc6fM2zc0u5kKvmBAuEIOMKfqAncV8MFRZ7FvVnkXIQPek/n4jkHflbPBBU58pd8yaKnScVkz3YhoxbTFCYrv4HcS9edVmD4t2HvWds279EObSVz5yOqdjkFxD9Z2NKyHk3jrVjl5MOw/YIzlRd/ZjTcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d586d74-3917-4c86-7a07-08df1278fc13
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:58:14.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSuHrWLhZYVX8iM2UAYGNEGCOQa54Qcv6oilPqdVNQZQZpaQn/8WCTVABPUUGV7gcvdUZximPfcCs2UU3UaQnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:12:05PM -0700, Michael J. Ruhl wrote:
> CRI FW is loaded on power on.  Because of this, access to the FW cannot
> be done until it is running.
> 
> Update the XE PMT probe and access to check for late bind devices,
> verify, and wait for the appropriate FW state before probe or access.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_vsec.c         | 134 +++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
>  4 files changed, 137 insertions(+), 8 deletions(-)
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
> index ebdc271ebeae..67dd786e202b 100644
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
> @@ -475,6 +476,10 @@ struct xe_device {
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
> index cb3d9142346c..c2f527e7894a 100644
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
> +	if (xe_is_oobmsm_fw_ready(xe)) {

ditto

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

ditto

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
> @@ -345,6 +397,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
> @@ -354,6 +411,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	mutex_unlock(&xe->pmt.lock);
>  
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -396,6 +454,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
>  	disc_addr += inst + offset;
>  
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
>  	mutex_lock(&xe->pmt.lock);
>  
>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -403,6 +465,8 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
>  	*reg = readl(disc_addr);
>  
>  	mutex_unlock(&xe->pmt.lock);
> +
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -433,6 +497,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
>  	disc_addr += inst + offset;
>  
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
>  	mutex_lock(&xe->pmt.lock);
>  
>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -440,6 +508,8 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
>  	writel(reg, disc_addr);
>  
>  	mutex_unlock(&xe->pmt.lock);
> +
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -471,12 +541,44 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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

don't we need to wrap this around the xe->pmt.lock?

> +
> +	intel_vsec_register(dev, info);
> +}

yet on the probe, please address Sashiko's race.

Although ulikely we should protect here...
probably adding a devmanaged removal with the work cancellation

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
> @@ -484,30 +586,45 @@ void xe_vsec_init(struct xe_device *xe)
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
>  		if (IS_SRIOV_VF(xe))
> -			return;
> +			return 0;
>  		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
>  		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
>  
>  	case XE_VSEC_CRI:
>  		if (IS_SRIOV_VF(xe))
> -			return;
> +			return 0;
> +
>  		xe->pmt.base_offset = CRI_PMT_OFFSET;
> +
> +		xe->pmt.retry_count = 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);

why get_noresume? I believe here we are in the outter bound callers, hence
the regular get seems better, no?!

> +		if (!xe_is_oobmsm_fw_ready(xe)) {

xe_sysctrl_is_oobmsm_fw_ready ?!

Please ensure that all patches compile individually so don't break bisect flows.

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
> @@ -515,5 +632,10 @@ void xe_vsec_init(struct xe_device *xe)
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
