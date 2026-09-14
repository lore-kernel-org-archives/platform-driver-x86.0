Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F49431E4A
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402092; cv=fail; b=o/p5cu6w2kqgC2f8tm5X0B2iH91IxtYA+38GkmrlPmlf+boAtW5f4srAIK/rW5Hl97e5NFKMX7eRjXOapNX2FdXKxCmCDtfgp9ndZs5Lkim3900MX+KkXAgCE3FkRkaOnw5KZDhqgZor3Jr3CUOgOojXDUQZhNQdMCLNYdYQvEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402092; c=relaxed/simple;
	bh=dqkT4RFcB0ldxi2ksvp4xnQ9TN8HwCAx1PoJzllot1Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hii/GTHwpZL+KC5u0O3DVReitpUCBskvNN6lOXaykMANXGvWb9fnVuAxpjzkQmWP3aPRderPBwoUKOHh3gO5eRgoB/ovz56CY3sGuUhD41WFoVn+rUQ9b92jkdQQcS8nda+1+Asvpr9Xt0Rdux4cvdoInWhq/WmSIRc95jbLb/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjImaU4X; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjImaU4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402092; x=1820938092;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dqkT4RFcB0ldxi2ksvp4xnQ9TN8HwCAx1PoJzllot1Y=;
  b=WjImaU4XBcs82SCcqi4I+hkNx3fH0/l2AXyiYe6w7gbKKQ0DihDsIdOS
   IDBVivcaRVw6dGjHgm8/Wcz3Bv1Scv22i9CVQ4Ec2ISMw1MawGwytABQS
   Zcj6EG9CGZ1te0S9/c+YCDKzJgbLNFRtoQXUV7gpFPxNzZr5bk3wUcVz0
   dR0arZd6XJjmTozjFDPcBc0dCfQaemMhY0i5aAAVHKCuH8g4s2siN8H+K
   ldJmDA6mhRPTOF3o5UZXEvFfdiZopmUof55xyhbOAtXu54NAivC2A+wbj
   kDor9tUySIp+JobPPV2bjGISkzvMtzQnomQ34Oze/6EHeBY64F4JVsgQa
   A==;
X-CSE-ConnectionGUID: MsOANsLbQaeoE5NQgZSQ8g==
X-CSE-MsgGUID: vSI96apbRIq5OdOKI7hO7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89697503"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89697503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:08:11 -0700
X-CSE-ConnectionGUID: eO3l6zHDTa+YwsO7toKUPQ==
X-CSE-MsgGUID: feE+wMMbT7u0jQ78rfqcBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268999136"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:08:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:08:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:08:09 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrjQwZduL3t+ue1AH3zP5CARo71a6iCQ/2kc5wNQUK9+c+/nvoH7qJ8XMRSPKYwog3XgieR0IVrUJUrNCke1dUx0PQEIsSHEbe7HyTM/+aZze3QEmz9JRJgpmNhP2I2V/q4v8pqgCgIbnKw+p9vYhEqzRtlFKSJLHAYcVmbli0s3x9Zmu6ic7KiOojoGBBci1Y7/a8SaVcc2OkqEU1i/DIcFErfmyHe02bQ/swF7OLsBLe7YjGHS2gBRiTfqd+GJylsQLFqld9LM0huqd842nXVOQnZrPTWdEeVQoyqyXI+QOkZfUJDyrdtnBBMUwcMx0orYcS5R9hqupZlEg6YYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oEPIHQxWUA2IWU+hmbRblsRSH/XQ22csfATvOP39Kc=;
 b=CC93kaPnxvo+WgsBnhN0xyzJj1mlO2RZf9jIVsFpz3ppkHZYn/7DRe/3iPxR0MYrCT1KpBaPflnDR8WHpxJoWOULcPpOXt8ZbTyNMCnnIVQpH0cWLprSq8KgbhNE0GCOUceZ9w1xzaiX8AFSDLihjhPWybclhJcxz/g2m3XGDGeG1BenKBGDBBOwSPdr6aNIIHHg69WveLnUc8tG11tk9CVjLghrPXNlhE4yQmtm9G4G/ziD/iKAznO4PlKcpcYVMB9BaHRRxiZ6ObiSYX4Rk54cLioNbSUI0/XK1GmutJSR+YIcC9EybbtpLBuv7feUsmmS2OEjNrldEQORbxyadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:08:05 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:08:04 +0000
Date: Mon, 14 Sep 2026 12:07:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 07/20] drm/xe/vsec: Correct locking order
Message-ID: <aqgb3tuSZIayYv6u@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-29-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-29-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::6) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS0PR11MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c695ea-c978-4678-82a3-08df127a5b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: f3189x1V1pXtyy/yC+9M9tSrzVmSAIJqylBBdsG1Ov6PjPw9ULw7rwBDc1ggMdzRy4V1XmcDcqEUWtpJQHjf+UfhrYiRlnl7IDdwNq5R0yH5q/jAkamFkK4+fvlS7Uj1hL89bGwT5+ebsQMfgwnSsK9m3Drvr0vsi/0f2L7x5f0uUJnHZuA7rgNNc9rsrsOAuoDiTvzIyW5rxwBmucX+JKusnYoP0tfiEuT0/vF4A1pEHEk9RDzoOetJKeteqJiXWDLTpQz7RLRuzj5LShHAzrlqQ4sHjNEgI+QnKs7ululLagalejqvlnSLJwMkM0a7o9fCv/CvVLUMk8iXqTNuGM8vs7zURsitubK/ENuWmLKHYAPwig2BtFmpXCt5ujyDLN9EeIi7qoGhG/EOKxQeIosChCCDc0xC56pMoNYo4qGddbtDu1ytbnG4xq0E0sQSlhAJfB0Y/V/09ZPo7YIisbV/E5ZuaBHz/D5grAYDr983jrsXoq6HJ4BVWa/7CV01DPDyhiVCvPkXzoZuJ8cp/RH53Nk+gONOGZRKG+4vhkkFD211fRbd1kZ37oqQ3nnAGPirfPw6lZwlwzUYLtTLYvuoWSvC+nkJggbGGE+0IaeylBr9dBquVJ4jJsgaxnizAWwNfiPdbi3TharN03vH6KbfKAcyJfvkZHIcPvGdO54=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JaEUf1ktO1SG7uUq3U968wV36QBFno994G0AuKqxv/JBWXO6HstG7A9lLT3C?=
 =?us-ascii?Q?VCfX7qSR0V4pGiwpB9BUJC71ymiB3gYSg3BqY3L3Ne4+Ua8O5WBUdrtn9O0Q?=
 =?us-ascii?Q?oJotdERXyII91v3SyvbrdIx88WnR4Sz6TqzOBHw3DTuSvmx32NVdOdVBArCL?=
 =?us-ascii?Q?r+3I6+gy//ojfPTSFUG5uGN7z8OnB3wc+kdHg5USM42+JhFSDqH8EGebWGBD?=
 =?us-ascii?Q?xFLoM25V+LZ21hiIKZmM7fEwKErbBZggdHL3s2iMNgEDNDdBf3ODaCoXRZK1?=
 =?us-ascii?Q?GD4LFAzbPPm4XdPlMBHdZdDQ40G4Ck4ZJBUXXkExXKjMq4U3iv3/hZ+aDOql?=
 =?us-ascii?Q?x/9HMj/O+FF0o9NY42OK57iWxayLWuEh/MWY5bkcb6Y20btvyg9jE17iP3Nj?=
 =?us-ascii?Q?elGpJ/qXlVCOCaLBtbEy62I42IJE6eWmOd76aYNhqjXbvV03i5+mmjlirLOm?=
 =?us-ascii?Q?8v/0mhfF9a6PjAlB4qhotSwxy1MKvWsfKydKWiDjqBfmWZmb3LZm2l092uA4?=
 =?us-ascii?Q?w8zoKAw/gS4AHk2Ophhau0j9Q7Snems+H3VcZbe7njRq224MYG6o2iq9boTQ?=
 =?us-ascii?Q?qgtV34Ub1BzKnya1L6+OzYMcYDwrFe7d2d4xQdbVYIRbVFbIZXCQ8cNd9n42?=
 =?us-ascii?Q?3QOfPndih+Sgj+q6jKwRooqXH3N+LDmZM5gWEz81+hRqtT+GV/MAsYD2Qbq1?=
 =?us-ascii?Q?X9gFLGa2yTI8pMAe4ZCvxVA4HXZgAd1FWaWGCwbhN32HqkBzzueO8qscM+Pd?=
 =?us-ascii?Q?iKRW3+0718AXHoNgCCUqgPp7+KZL9F5hTThkmxUGVL4MCf+tPZnKTKUJBRjv?=
 =?us-ascii?Q?c10Ngb1wleNg0kBiq1QmXgIFRcnUyEX3vR9ZKo59nK0IcchBhLdWdgq3Ol39?=
 =?us-ascii?Q?CJEp182ZAnys9oWiTDCdg+/yVMcZ2Wa3GLIMtOfytFO7DwVAb8Yg8fzp4Z+V?=
 =?us-ascii?Q?ES5PumE3i3D+tvwEBEqG4nb0tEwVBTKcWqozxnP8/jsOn7o7wPKnnu8NPoiZ?=
 =?us-ascii?Q?waqWmOjBDhFVLeTFT6RICaicWzvYGLOe53LjuJ/WOpJnhUnU5WXThcPgMrP6?=
 =?us-ascii?Q?VkkfiTDYoy47Cd+C5kIzSy/7dEYidd1Sb7fIVk7IODw3NT11kU2FxlFofJNC?=
 =?us-ascii?Q?oH9kG7GjlgakqXhVpiezUSvIWiqikK1nOnoIA1dW4yRFfb6VFgwrMCD49LGy?=
 =?us-ascii?Q?qJpTtji+bjSKCRESrFhNyL0G50jDcR9Cu/keZdO9wQUYySCuT+UGhKyCSTzC?=
 =?us-ascii?Q?/BnG9nrqPzCb+RpkJ7xWDHG5Z1ViEQY4iI1N+D24B7XAIaBRkh9WW1juBnD4?=
 =?us-ascii?Q?z/XRZiActsGC2YUY/3oZlfN/6t78X+Lw2mPC5TSzNO/GlqfYNxK6s7n2/I1A?=
 =?us-ascii?Q?uGn767uerLflzqaCvbKInBYxMGZM8cHH60uq6/pwnJQqdNhA8Nquq9i8PiJN?=
 =?us-ascii?Q?iIist1D6ZXUQpcj2awVL01hHS5DjlwcyHoDnuEHpjekEPspshMZcyLzPZ94m?=
 =?us-ascii?Q?WtAjIR91D3IPpzcwOH6wIUirPHggs/ZafmxBhNNyz/JH4cJQ8V7K2ptgx/hN?=
 =?us-ascii?Q?D+J3r/wX0oCifR0niifWnTTACUlwl5pBncTZdjkHIhr1E1dBPfiiFXQR9bln?=
 =?us-ascii?Q?U9qbkL12C/qNVTy9eRxfuqk7uJ+4iFony4y6tnZC+XE0jfq8euDhBUKUFyZt?=
 =?us-ascii?Q?J5CKxX6m02mqKEHDetLoai1xJkgq9OP4pcQV9hZlsw5f7wsw+hihHcsFNw4V?=
 =?us-ascii?Q?PHWbTqFIsg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 3bQWtAhgBmS0z78CK0xGiLRPGM+AVcLgdfcsCdTi7oKEiOKDihN8Hft5WlcN4GbwKuRtDgaOBxvJwhEgU11Ct8mAnmvFSlXCqEe3wWEdwxBmZA8cjyMJF1fhzXz7a7vDnaJkyxZcZLgNKlo/H2BRG1QRkzvG61UXSpb0pYCytNWhEU0gyLXOZkK5rkjxa4KO1rDI8tsGItbA2S8iNiYs49i3HCEYW3TMW3BydT40E6w+n1N/cdoyGTbtNGh3eOMR+DwIOMWaGUSV7Kv3/1jr54b2johveawwT2+xRSv9a3mcHXemijvtMjR/ca3OEoAbQiLbI7AstRm28ZaDKmfdTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c695ea-c978-4678-82a3-08df127a5b7f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:08:04.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWF8MpWAwfj+DwNbW3HEObXtMgyCSn6/JHyF+lMQSjigfztVtXTiudeJtz44bnWX3FW+Zp7bsXDr8nPakyMJ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:55PM -0700, Michael J. Ruhl wrote:
> Xe locking order is power state first, and then local locks.
> 
> Reorder locking to correct usage.
> Use explicit functions because of multiple locks.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 71bc359b2ad1..dd7723ba6c1c 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -158,16 +158,19 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	telem_addr += offset + user_offset;
>  
> -	guard(mutex)(&xe->pmt.lock);

please use the scope_guard like others have already suggested.
> -
>  	/* indicate that we are not at an appropriate power level */
>  	if (!xe_pm_runtime_get_if_active(xe))
>  		return -ENODATA;
>  
> +	mutex_lock(&xe->pmt.lock);
> +
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
