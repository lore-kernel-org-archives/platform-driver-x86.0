Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C24B1E5B9A
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787598259; cv=fail; b=gING/Ett6oZx2Z62V4gybmQLffpv8mMIyO1ewlGeUNZKeppxDhoHwQh1qncyIsO21B3wzC9RJ8/v0GRFPXp/6BNAEdUvTLF/Hacchjde5IbaM8EadP4FyR7a20GE3QxLT1eVJBvHyCnJ7OFqeEv7Q4Wo7qvLpKtaNA+17ZJKbvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787598259; c=relaxed/simple;
	bh=o396W/+D/LCzEWMaB4JJG55UwQgw7dAAEktyje99SC4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eEN70BMfKIwbsfAN9uzL6p9rCCvyT05LqdkaUC/E0hdgaCbifNA4uD6mUDwYqfudMASAVnqvOlk68dqRpiQ/BHguOGQP600f2w2qM/O6LzkN2Tmt8MsxGglb5U88S506JE2IoYoYRokcPt2BwV74oXQin6p/yyvRR1oWOA6Lcyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaIJ5ABz; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaIJ5ABz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787598259; x=1819134259;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=o396W/+D/LCzEWMaB4JJG55UwQgw7dAAEktyje99SC4=;
  b=PaIJ5ABz/fnBKemWRMzREqQpVgUULi96qzVsJFWp6K6h9pd8Sz4M7P3S
   AMpANgUhkuyZr8S4zBQTBhL099YYu0ZZ5eNayQV2/iSe9ambcW0DcOHEN
   ojgUb9lsrCD1eYYwhGAk1gAuIVH7lHp0F8wc/PblYzJQrHbbvsarp6CWh
   Pirheyn1se5mIwVU60wAM46NeCz+qxNX9+QXVkue0au1fwMLj03hOMinj
   Rrqi+l/mbwjnbmiXPA2BULUoMDB49UpogDtloDaTWqMZl6F6YaEjmDASi
   ihQhj8BW7sUEJGMpjVELjxB2SSAvx83G7r40ytolWdtVy7NzlGmN86jF7
   g==;
X-CSE-ConnectionGUID: uqbe5P3zRUO7zUqQFw+yoQ==
X-CSE-MsgGUID: VO2/eAQXTtiVdTAAIB32tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91736130"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="91736130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:04:18 -0700
X-CSE-ConnectionGUID: QoSEEQBNQ5O4G6yoKc4WKQ==
X-CSE-MsgGUID: lE5e+hgHSNW2eUpITZ6W0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="263802011"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:04:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:04:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:04:17 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:04:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxMiNstVJsi+NQHxv/ESzPfEvIfxTGKltJxGuskD8Kw5iuFTKrJGV3gtxCHKctGy6PB17asP/TH8l1odw8ozSgGor6u1WiJntLgVlPgf+5ZX7h6oaWA4tAFAiBUx9QCIVWEn4pqEapxCBcPUyF1ouTGNae4AP3+7KH4kugy2CwNfuTYo4j5kYpp1tMGq9eGK7zbiJEZLU9PAQnJkhnyBHhI3bMfn979OAYcTESeaT5EdcCC1Mqy2wW83XQj5+nUfpv63loBNIPSO0I2pMHeYo1aruBtQPK0WW9PikIWgCMXAm78R7MK0OEkQ3Fmp5kk/DhrJOa3QLzY56i/CiGUf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp/dU1oA7Rsexm3LUKk48y6BBq+L+CAExlelpk/WgEk=;
 b=KOcZ5vmf4pl9uqp/EB5e8qCMgJufs7rAu/hASo7O3K8LUXxyAwwxwteBANkS/rtNVSMIKbRuQXI2xrOjhn1lOprZ5SRufWgqlusGZoWziY7jBs2+l0Nx0dc/C41ZHME+jECy5orN2muWBmhgyfdWvbgcYiOn7N36SCzbMhb5pgEsiSAXcBu6qbnuHN65uEsLuUuXE6CkEbtcY7gD4gvB+PBx3TFFmeDPZry/vTWUvF3q6VWxCzq6XeSUaintd6kT5FwUNIQUXJc4jQjvbZMOeD9RLx6czwEwa/FcBvXr6g6edfMONcerB7IoKN4OZnm7cPMlU8Rc0XwSDPc3VCFnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS4PPFCE18D981F.namprd11.prod.outlook.com (2603:10b6:f:fc02::50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 19:04:14 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:04:14 +0000
Date: Mon, 24 Aug 2026 15:04:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v3 04/10] drm/xe/vsec: Use correct pm state get
Message-ID: <aoyVqe1qgyXNraFV@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-16-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260824162317.2450380-16-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS4PPFCE18D981F:EE_
X-MS-Office365-Filtering-Correlation-Id: 9169b761-32f1-4f17-92e6-08df02127d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dYVWs1kmpYIosUi/bFPWPWJH62g735yCsXANsob5dxh3cifKocl8Q+VnzktssN7XRkHixXfp/IkiV13QoXQQGiuIsuX+lOdLxm9gmhPeH0dC+l0tdWhzHleDEi5LbLKxQPRSGzAHCiGbvG6dU7Ad6hfWjThPDixTMyZovHa7WW5x0wQ5EpKXXb9jdxx8jQJF3euEqO3ejJ9TPeR0EHaXeD00AaKvfLZWUQwj448+pQUNkwStd9nTbFhgYtLv0jYjFrzNpJGWlYkiXZNw6TnYV0gM/vJTDL3jdqwWD18+pQDYxp8mqLH2d8MKS1XPHHKC5YIYiLFi6RZ52hkdBUZ9U/3zFQjX3q8cMT1puz8GnJ9HIrDR63Ez2Kxd4xr1AZzqHfD1O0Wkg0p5UolR/j0BqZ9r7JWOqDM+n52Jbq4ABNj0vtDatuC7tHdmtpwBIJna67uTnqWyWVzjOdLZUp413kMWpHcXIZ7OPbiYwzQSi5JPnWJlHaENApLvfauk9hfAog0KWXXnnj6kmZdCxeDIY35IV1bDme4KlvSruWsOz9Vf5RfPQ3qdKMm8MBh7xiFytjaMn35XLujHBb4dQJEYH2PffOoTKjDqPgfHWm6smhBagaFFQk9d896Cn8aKQCAoRQ4umtajtAWvHvbV+N/Fxq9iOGgN6olMvNyT9fw5+iQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ugp4FDHDJ4k3v95pL2OmrNAsMh2ODQ6vat1VoL+g6hB16l9YQxVGrhT3cs0f?=
 =?us-ascii?Q?JAx7uzZF/Zo4nA9ZpjgppeSw6nyBslRPXni7tIG/NO+qJ7wEBPUPkx2/qP0o?=
 =?us-ascii?Q?m+nqSo4pc3NdImQRUaAmaE6qPxOfz/WTfEPMKfhixp1114IuGXM5JId0Lxrg?=
 =?us-ascii?Q?Of0nGEYCMEHiooG4Ca/zldAZn9IDYkZvYLXpkn8VqC1Bx3A1rw5wItcxM0ZP?=
 =?us-ascii?Q?gIkc71GjK2+YmQLLmurSN4UZT1iwrq/WHLsC868IY1G/14FSJ31xmROlLozv?=
 =?us-ascii?Q?iPTngE3kkKHGeYDdcgBnLqYwpsAf1KItqKbMrjMUCaltvgi8nZMSQAqg5CNJ?=
 =?us-ascii?Q?rsGKdkP5GgXWA0tCiNIAiLd/ZLDgVL6fMh0AC/qHvd1zW0euZAspKwmAGKgI?=
 =?us-ascii?Q?X77YXfkZ769WlPaAzJeQ1D45t4dUaUtyXueLZn47M9D8rP22Lz7YR6q5v+pU?=
 =?us-ascii?Q?W7AzWiLvp1GYsIe4lvqx5M3wi8OaRTjWN5II24oYYY7sRIshLthW/dXqVs8Q?=
 =?us-ascii?Q?PdR3NrfHJpilL/vd7myyrOQK8pclwmeIVQ3BmNnOgpf1hAUZ4bBkd+4ZlnJQ?=
 =?us-ascii?Q?GXV/+Ha3DJEbCG3BCsi8xTQxtjmugpZ1nVBVEn6JgI7QbmcD7pi89Q8u4lwZ?=
 =?us-ascii?Q?mXHapx2ul4PxxN/+etZbtFsr/TMBvAGpLGB2/6qhwFF+cfFFJRmiHSsqAXdw?=
 =?us-ascii?Q?qIEHHCKVAIzHs9Cfh4tkQRKAZRj6v0KVD3pasgF4phe+4z2+L4og6BAZVXyY?=
 =?us-ascii?Q?wsEY7linhJKCM6fryvYAXOHILH6UmSqqjJLAugch+t1gtKwGpE2ipaYWdR56?=
 =?us-ascii?Q?Ka801nlwUPuhD7yeNBzZxInc177+gTmot+OxWHRe9ZNmG0JjoLbbfWymqfeI?=
 =?us-ascii?Q?RYUhDTc/FTy8uno3tjvzDpisAMkVTmdicgma74u1AJxw7SHzWtEOXsRYnuIx?=
 =?us-ascii?Q?4UE5Iyz/YtyPfi3UJuTUVUJao9SKMNmnZwrMJZhti44xBltfBonAkPUcw+cF?=
 =?us-ascii?Q?lYFs3WDbAfkRZUH9/Zs541pmm5YmkVYoH89PZaR41ACn228rcvJ01dFdVw/o?=
 =?us-ascii?Q?7qHbkB5L3dDjZlF3/aOjo31ayV9Fj0QAemTKFI2G2/VYGtcjtSscKkQnWjX3?=
 =?us-ascii?Q?nx6P5DKH0aYQA21anuEizDV2kykcilcACLX492hMVvmAa9tRttEOwJ68i3va?=
 =?us-ascii?Q?E7mMNn4WGUFdXGWR27PHbb6WzHgRXc2mFMoK7fMYf3Foja/yIu60bYRTSIAE?=
 =?us-ascii?Q?UIzqDeUnR66oCceHOjUAvzYDpO/Z2f+HzjDqIwH/O7ypk7Bbk2vk5yV64rOT?=
 =?us-ascii?Q?m3hc0zMoT5zvgwhiWcSEEnwu+ZbN9amv5oFDR3QjXVUJKMxn6aAYNycPgcAV?=
 =?us-ascii?Q?6MboG7SFqCBrtxCXPHUdAP2urLL9xVMBumzdy+Y/uGK9jmBiVY3S4UucQ7gY?=
 =?us-ascii?Q?0NZ9aIH6OOKW/9nPVLHN4O9ezIIb0preXZ/LUepOBovAxZWYJ1JiP6NAkUGg?=
 =?us-ascii?Q?R4hKOO6QBNa8B1bqGvBFpmjigoy7xf+5cuhi4oyA7bkUikI/SPp+stQivN0S?=
 =?us-ascii?Q?ZCS0oX66Diu0uIe0pCV++8fuO1xIaClP6jrAK5f9m+quGlO2x87MkrYnSKHP?=
 =?us-ascii?Q?SpS0ziLtP0hZ1BONDV/OYpyvIN2+ilEvOGGyLBm86tG1urKS4qvxJg9SSz/S?=
 =?us-ascii?Q?zPI47bYccxNXS/n5F/LRoze6knRWx5Efv6uJg3ngswuaBn+jRskNdL6U5xqm?=
 =?us-ascii?Q?121E46m+YA=3D=3D?=
X-Exchange-RoutingPolicyChecked: BEohzy77cIFdXrVRdWx9HMuJ8qzeJA0p2X0/FHPMu5og3q2EgrZAqUZlKMlMyhcLMyRSZvwyKeX4Le3ulzFrZKeuY8+hBpXRR7ib92L1uf3rkzDTY1pGV5iNK/TcPxiL1UcyL5ceih6gkqiYjj5I1tkwae0+oLP6lka0kaWF65jlgKhIzdOKQWmYi6mv9T4Tw16EURCquTCSfdL+/MU05U2FcqR6y9UCNrYJMKAHz8SUgeMXiftvjqzmJB9xGsVX1PXRqq8z3venQecMaYgmsViwuwPJ6yXFYcH868GSQT35HKlmBG50gv54+shM0x8r5SC2O3My4Fp7Sosh+SQ3HQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9169b761-32f1-4f17-92e6-08df02127d39
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:04:14.5763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxKz+7mLWkLZ3FGOIZWgWxNaqfLVOzL9SFDZyTfi1w4KQsLCNEpjoGBGXwyPRT2pgUag5rHx7BbhooCplml8Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCE18D981F
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 09:23:20AM -0700, Michael J. Ruhl wrote:
> Crashlog needs to be collected at all times.  The current pm
> check assumes telemetry only.
> 
> Update read path to enable device for crashlog instances.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")

I have the feeling that this patch should be split into 2.
1. with the lock fix and another one that would be the feature
scope increase for the crashlog and watcher, no?!

Or at least mention the mutex in the commit message?

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index bd83a33aef6c..8d99a3770b5a 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  {
>  	struct xe_device *xe = kdev_to_xe_device(dev);
>  	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
>  	int ret;
> @@ -158,16 +159,28 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	telem_addr += offset + user_offset;
>  
> -	guard(mutex)(&xe->pmt.lock);
> +	/* Always allow crashlog. Telemetry, only when powered */
> +	switch (cap_type) {
> +	case CRASHLOG:
> +		xe_pm_runtime_get(xe);
> +		break;
> +	case TELEMETRY:
> +		if (!xe_pm_runtime_get_if_active(xe))
> +			return -ENODATA;
> +		break;
> +	case WATCHER:
> +		return -EINVAL;
> +	}
>  
> -	/* indicate that we are not at an appropriate power level */
> -	if (!xe_pm_runtime_get_if_active(xe))
> -		return -ENODATA;
> +	mutex_lock(&xe->pmt.lock);
>  
>  	/* set SoC re-mapper index register based on GUID memory region */
>  	xe->soc_remapper.set_telem_region(xe, mem_region);
>  
>  	memcpy_fromio(data, telem_addr, count);
> +
> +	mutex_unlock(&xe->pmt.lock);
> +
>  	xe_pm_runtime_put(xe);
>  
>  	return count;
> -- 
> 2.43.0
> 
