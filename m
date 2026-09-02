Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D18376BEA
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 19:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376743; cv=fail; b=sPCJUlCX7jBn2iq3qScV+SPxSGkVxlWBZ0Ywg7L3N2ONbbEgOm9k54uEz7zjYiKntq1zEjbRVx8VJCTo1TNy2j9+tJtDT5FlS+Oe6xrMjYJmyAzqNtKhgrSZTOPaLlylHfk7Qr91UXiTNp3LP4yryuZmdoZW7004sbpdq15ldMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376743; c=relaxed/simple;
	bh=pAF8x6VnLCah24JgDWDFhJbFnC9Gk6ZLYl/mmNZejvw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ixxVo5q9UgSRsHcIf6mnpxkc0Le+62RCFrrY9ZyGIcga8jOB3G6R2jn37XpF6WDRYB8e0C+VpDcjCtg4dnzFY9fIcdoopnoM0xb1vz/160PewL4Ji7OgBIRAR5nT88sXeYtas4otfR0QLMxX1uRgAAbFLgK7/ydVpSuvUVU8zVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9fRgNIj; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9fRgNIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788376741; x=1819912741;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=pAF8x6VnLCah24JgDWDFhJbFnC9Gk6ZLYl/mmNZejvw=;
  b=f9fRgNIjSfN5TI1T1d49AWYQLgGD0StkCtJg3uHz3pz9WWIFRs+FOlVO
   r1DKYE0xjvwTAUPWFAGTlTcnaCHaTiFHzmd2WiXwyY8C/r+aSU3k51X1R
   RiWXEnJqIWYmTjSmEr++xZGrMyO385pTkpjd8s5i29OBsUSfvDQN7dLzH
   4Cg91Vf5xVuWSDAi+nJM1UikLzRISI5qg0PrbUhEfsBs7kE5mOMgw6Yh9
   UaXVDBu31jQvEW3WOH50dmgXjGNinX+CJDz0Ld+t+T6JLNZHP7N82Z6NE
   BJl6avfqnJSW/7azvzmk4WNxEnbJZg/ZQ8Tx0VlzpnFbtoclxurtaoVs/
   g==;
X-CSE-ConnectionGUID: m9I3EWnzRIK2e7+i2LfQOg==
X-CSE-MsgGUID: Iazq9s2ORdKXAj1mTmeNhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100200222"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100200222"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:19:00 -0700
X-CSE-ConnectionGUID: HLo0dztkTKeIwTP3LZA+Rg==
X-CSE-MsgGUID: m4nToTY2T5mewaZR7gAJtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269508102"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:19:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:18:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:18:59 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:18:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcODvh732b2YQBeaHYEOzJF64C19oVcrm8wa+Up3lNEJXeTtZO3ogJ5ZHgiwPSsC9KsBue/lowbVtyHJnx0ZN7Dxk4i+O7fjvM3OZUSqqgXBrK6ClqN/ftWVeWd0iYQ3qR0i/E9ijxz/aeeWi3w4mSW7BidHc4mD+xxSc6x1/08a7dPDXbjfZseNL+9LErcPVYhj8oCaAJDtfHvSSaHtn4wU6MjgC4GBpOELSDXFejUbekFLfoEo5tYWWWBB2jBAVlSuJEphAUYeEVaOI0BnWCndNRBi4QATnk6tBZ6yRgZegz2tt7zxS9l3NsAksvaF0hqS6JQRkwZxW+EWNF9cXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scyzH2Z58W4rs+HqDjCSqOAy27VMkRpq0wbu5FoNfeg=;
 b=AibQr0ImNdTcXsRPFkoJ5IES+MRgpJhZ/zgpk36JrRlLxpbL0r3X2b5rnpN16wQrsyPnWT678IXsl3DdOFKIP3FWlHOgAjRw4PP5p+dhVZ3yns6O5xeObHl1kFeoEfc50QYbdHf1+JIOeQJJnN1hLOB04WlO8y2PPd61QqyBS2R6THe7o2jCMcXlhr2F7n6xN621AqHzn4y7wQRl2N+sS7muPJ616B0q+gZWzkX4PwiVTxFcOCJwKxha2PQ+luy95lTzIjpYlsitRxOY9SPro1+2wZvm/FOlDrW5kUV/j7dKlD3BFey1aIGgwa8Z3q3fEE01mEqCMBXqVnH2eWwZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SA2PR11MB4987.namprd11.prod.outlook.com (2603:10b6:806:113::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:18:55 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:18:55 +0000
Date: Wed, 2 Sep 2026 15:18:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v4 12/18] drm/xe/vsec: Refactor BattleMage PMT defines
Message-ID: <aph2mdLaIcPC99n0@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901192736.626777-32-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SA2PR11MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6869d6-2592-430b-f47b-08df0927079c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: H6BAQccYoG7isrzsgZP1ykjhOYGGJQOoco0V3a6rOvWfkx+9+N8O6pzLnHHbjGoJA6aMJX9nvscxb9IrAGlK8b8nfFFXwETLI26y/PgCGjtc/OpzW4UoEqrytiZ50CEPBr37YbSft6rHwRonh5mhjaZpzGnuuAjTIkcXyrPcFffv/hMyV8JrTXkBv/kVcmlYBIFNpjPlHhw2kF/CIwvOzp3Ls657nlDHu0Ljxc0ofpfVh32Gb47M3S9bPtU8vH7wmbL3B4+JAXjwPKpNPMpF8U8Bt/iuc9KvB2Yd4kjCB5gXCw9B9IYJDXb/eSvBAEnsyLGnDDYcbVNo1LVeyh8IWlXVs8fqmDb+e8toHlDbFRt1trdVrdwHxrWZWaQx73VddT/2WdUF9RTT+mhlGLSUdRZqE4FhCepZYjglQ1IOwwgLlO7Lvu5hJG9W2E82JsjuVCHVm+pGKfrl4oOYgkdGF8dqak2EpfJppT6GWNZXdeVGmij9HwXgnLDWVmJdJfqpShts5U19pllCmo1TsoNGu6WSM4waEyA1RQnXSpYkaO6u+mx/7twN/yVMSIKnfVd0hH1DixX+mbfwpsEB2gnHqikzUdC5/ZYNqN5HFIhpwUB7fiN7qY6YLU9oLXb4jA4TCxZwzxqjhxUpF322z5Wf/X8piMnfGe72t5PLHmXWLpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?izMEIlcxqhafc9Gsp0QhoxUzFU4FGdWEG97bNIJJiO4nF+6rl2XouKNoqsr4?=
 =?us-ascii?Q?Xheyi6AVUO2E4fOCmXBJrP6HXgTNz3kfubfnWhJnplbcvSfcj754Jrz6Y4wl?=
 =?us-ascii?Q?5EZWSF13xo72fhHCKrUWKd66rF14o0Fx9m3BHgtKuyGMlahsehde2lv0LlNn?=
 =?us-ascii?Q?XmxfAjiRemKRqTDTLPPNzMLWxJzGFlF8UK5GEFYRyNG0PejRb8OeeY5XgHCV?=
 =?us-ascii?Q?ZYurRoLdm63Y2ug8LUXEBbkVEz43b7ReNtT2ddFK4zlGQ+mcUQlSPi3gmxtE?=
 =?us-ascii?Q?NBALVvpkZwqbzmMP15rYkEIPwZJozvv46IWauXmHY9TZr8aQhYGMXOzhgV+Z?=
 =?us-ascii?Q?goqkuU/vcLRwEgMP8RCz44MavO6s0Y/5yb5V7LNrjT8gL0omzQ7XM02hXQrs?=
 =?us-ascii?Q?T7ff5HZ8sKnFOV0DIh/pDHIeAD1/7S4E8vVTkDjEOuDycQja2QuUxe3Gb9/d?=
 =?us-ascii?Q?x998yhK9D4do+U27MmmX+83OvrE3jXf6L6GA0Yfj/Mkg0vOxABB9beXscqqu?=
 =?us-ascii?Q?xo9KNNLBrfsQGa5MMUxT61bEuovef5HPqzb9EBNgpApMXmGFV3GQ6HGZP1lt?=
 =?us-ascii?Q?IFzIKH4q8TXeS2vxKvAHmrQYVzLoisVkXUY2FLuyYd3LbP/BKPwS05B1KS/C?=
 =?us-ascii?Q?dpJpivP2keJ5O/IQdwh3qT/5VgmJ7wPST7/jmqQMNvGipKtbBVKy/8vlif3+?=
 =?us-ascii?Q?Q9Kp+zY30f9PmK66x4BFDa5OzVRr2AkFWHUZxndegRyBsiCA79Te+NSFclfB?=
 =?us-ascii?Q?rAFN6o5HtrXdZoJxerVk9h66Q07aW3FsCioVawWst02KLYgAip6smBJnzxiT?=
 =?us-ascii?Q?APombzYoxOthQTfaPJxzexW8qp4RM//EWN7SLJKAYOeLK8URIPtQEoA1dDkj?=
 =?us-ascii?Q?lNmdexVvQ0aKu0/ab6YZ7YjSjNNxtPAHEvUoO5YX5j0XDGb3C0cHA2uVGpBt?=
 =?us-ascii?Q?U1ol7zRkJOETWbY2kyCrw9v6pcBpdY7tcZIxCHqBNjW3XpKrKrbPeCMQ/5UG?=
 =?us-ascii?Q?a9UkYJwC8tnBSQrJP72ggl31rpb5moTdlT6nWgF4Qn6k1nhtn2XmG2m0SilN?=
 =?us-ascii?Q?uqZyVrLWNDcrUzJuscy7j1VhZ7T5UBVwft1NoBrRdXYNWmSQpX0n2W5AIoJh?=
 =?us-ascii?Q?pj4SUrXjSM0u4UD9in2oCWM9IOt9SljAPCZJgbHahwZffLJOlZknm/+0Y9mv?=
 =?us-ascii?Q?yQpz9iSaQvdtT2Mah/atgpVbjM4DGI8fQBeB811zWOBMN0H2CfClAy2+yd8Z?=
 =?us-ascii?Q?pPs7tVT/hHPk8OUO/IzbemMSx9e2GBw1pNHVrqH1KuBRAyjfE/+c21nFNPLn?=
 =?us-ascii?Q?i5798l3xEgN2EXMmQCsy6rSF6mZtpXOEK0HYv2kliV3nOdwuIcYGpCtvHSqF?=
 =?us-ascii?Q?/ofjuHMwf1ta409l0jvO4jIUVUcnV6UNLIsGpr3L4H7AqUrPBg97YBpOxt6M?=
 =?us-ascii?Q?wBDtPn5XHTUVeZmHt+Qco+06tHMN1aoUiYzqkfPH2jl2Bw6unA7NK5GXonC2?=
 =?us-ascii?Q?DnmAiiKL0AtYOHqfMnxIitTYoNp8EKV0QDzHm2SMwBmt2xZYQYyuDzPshK2d?=
 =?us-ascii?Q?4W0byhTJQU4B67RaTcasAYS6zdriw7AEDEsO4XtSa+xKZyChJY+ZRHX/ouGW?=
 =?us-ascii?Q?QllnEMXeBw5wmBQP+T4rjlgtjoMpWetfN/uqsVTJUN7aBAHC3CutrgdQfPgD?=
 =?us-ascii?Q?tQIS0UP3eXF0wnHn9W6l0bqHtS6g73FxUEyVpnXGmYTVBajctvW3D/mDJ7qw?=
 =?us-ascii?Q?fhZhd+0g0g=3D=3D?=
X-Exchange-RoutingPolicyChecked: d9KwomzH9CIzaIHKlQMzKvWHSJ/kpOtdU0b9oE1mMm7886JfLrpCegyZ+NZkmm2fZjvcfKWX+ZhVv8HINenlLssn7ihb3od2KMRXpG3stLS1qf4x5hnJ6Kf4Sen28D8VzisiBPhGpT/27ukdfNMJRPK3xO45tbginvASGfeKemcdPoIPEy6/2xpMksxQAr/7gibvPr9EbD1QovOMjy6ejVbRhoUP/racwJonPGwVrAgv0azgpY7Wbil+3hflF6wzeQdTM6dHenhEL/TGE2+7kwKFEsIzyNRzFQBq4Bj3L9GtbMRx3Q4gF8FQhDXHeY1wDNWprUDQZqjePMTEOX9GxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6869d6-2592-430b-f47b-08df0927079c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:18:55.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwKGnSKRgUK/0Cu+9bWKwNEYNfJL4jp7hAo8edDVu1VlugxmBoT09IxZjAB357eBCt9EKqeuqj2KIt7gBxTFlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4987
X-OriginatorOrg: intel.com

On Tue, Sep 01, 2026 at 12:27:47PM -0700, Michael J. Ruhl wrote:
> Rename generic defines to be BMG specific.
> Define several magic numbers.
> Add a base offset for more flexibility.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

nice

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_vsec.c         | 32 +++++++++++++++++-----------
>  2 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..3f1a70813a99 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -466,6 +466,8 @@ struct xe_device {
>  	struct {
>  		/** @pmt.lock: protect access for telemetry data */
>  		struct mutex lock;
> +		/** @pmt.base_offset: device specific base offset */
> +		u64 base_offset;
>  	} pmt;
>  
>  	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 0604e65d10a0..c109fc2d13b9 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -122,10 +122,15 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  #define GUID_CAP_TYPE		GENMASK(29, 28)
>  #define GUID_RECORD_ID		GENMASK(31, 30)
>  
> -#define PUNIT_TELEMETRY_OFFSET		0x0200
> -#define PUNIT_WATCHER_OFFSET		0x14A0
> -#define OOBMSM_0_WATCHER_OFFSET		0x18D8
> -#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
> +#define BMG_IDX_TELEM_PUNIT		0x00
> +#define BMG_IDX_TELEM_OOBMSM		0x01
> +#define BMG_IDX_CRASHLOG_PUNIT		0x02
> +#define BMG_IDX_CRASHLOG_OOBMSM		0x04
> +
> +#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
> +#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
> +#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
> +#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
>  
>  enum record_id {
>  	PUNIT,
> @@ -154,29 +159,29 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	*offset = 0;
>  
>  	if (cap_type == CRASHLOG) {
> -		*index = record_id == PUNIT ? 2 : 4;
> +		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
>  		return 0;
>  	}
>  
>  	switch (record_id) {
>  	case PUNIT:
> -		*index = 0;
> +		*index = BMG_IDX_TELEM_PUNIT;
>  		if (cap_type == TELEMETRY)
> -			*offset = PUNIT_TELEMETRY_OFFSET;
> +			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
>  		else
> -			*offset = PUNIT_WATCHER_OFFSET;
> +			*offset = BMG_PUNIT_WATCHER_OFFSET;
>  		break;
>  
>  	case OOBMSM_0:
> -		*index = 1;
> +		*index = BMG_IDX_TELEM_OOBMSM;
>  		if (cap_type == WATCHER)
> -			*offset = OOBMSM_0_WATCHER_OFFSET;
> +			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
>  		break;
>  
>  	case OOBMSM_1:
> -		*index = 1;
> +		*index = BMG_IDX_TELEM_OOBMSM;
>  		if (cap_type == TELEMETRY)
> -			*offset = OOBMSM_1_TELEMETRY_OFFSET;
> +			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -194,8 +199,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  		      u32 count)
>  {
>  	struct xe_device *xe = kdev_to_xe_device(dev);
> -	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
>  	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
> +	void __iomem *telem_addr = xe->mmio.regs + xe->pmt.base_offset;
>  	u32 mem_region;
>  	u32 offset;
>  	int ret = 0;
> @@ -287,6 +292,7 @@ void xe_vsec_init(struct xe_device *xe)
>  	case XE_VSEC_BMG:
>  		if (IS_SRIOV_VF(xe))
>  			return;
> +		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
>  		info->priv_data = &xe_pmt_cb;
>  		break;
>  	default:
> -- 
> 2.43.0
> 
