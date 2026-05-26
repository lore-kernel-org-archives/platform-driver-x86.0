Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4570E3246ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 06:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779777135; cv=fail; b=bwzLyC2x6icZ/bVYmgGka3fRCfKafytUaYfzz4iW0RN/sDUuVP+zlF+L5RgB4K4KQ9Z+ihQKu8m4V0lxMRzXMDMdNzkKM0Eb5453L6bJ2Apb2rNn0Y8P8SsC4fQM2LxtqmF0lFcnJESVN9ELFd/55r+EI15gQTF//tdMyz+CHjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779777135; c=relaxed/simple;
	bh=q4j0gmwURdt8JMBZQMM0EEhND2cCF+juSN/b3eAF9hA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OBz63iqbJiN0fxgQl1ZDS0WMgUXEcmohuxIFDjIwOA8RNEsbfEdoFtCp5tu3ZNKCCQri1VwKW/Mpy9At30WAEkbHRm0KJj1c/29q8v9wxVHusP4AwU1YcrNqtfM7zcH14yZtx8Fh3naxgE44RsVMwXxNqnXP9WsgGhxVC1YCaBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXIiz+HU; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXIiz+HU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779777133; x=1811313133;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=q4j0gmwURdt8JMBZQMM0EEhND2cCF+juSN/b3eAF9hA=;
  b=NXIiz+HUUouPoFkBdKrsfheoI8YnFrIGCX+HnV8bfRnwv3IvxYceKhf0
   c6sOBqH17e42Hhu6dmN+07keu47jLbtpGTqlCIdFkugNqqxUUYentuyMs
   +Oy4s7G7tY2F52dGGKwNOfgFbjlCPlerQ7680hF15ySZfFqi6a1gQr/Yq
   XKKDrU/y7HV5OXtNgZW8k6UwSEKBC1mA1qLBdCt/KMO6JuNfHbTcAO3BP
   9bUuHyc6JhxjZK+Lv64HbyvP+Ftx0HwDwlfCAbb+VJuDtzzjLc4AkFZPp
   sMgzBoK97OVcKyglWAkvhhhRJZfleMce3p+4svdmW3cbo8asaCSQhXKVo
   w==;
X-CSE-ConnectionGUID: Qmiwom0vQLeKzHSxcyIDzw==
X-CSE-MsgGUID: Nwl6ZWfSSJO1j3TPK8sRmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="83162274"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="83162274"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 23:32:12 -0700
X-CSE-ConnectionGUID: PSUaYrw5Q7mES34+I6FhyQ==
X-CSE-MsgGUID: ZeHMNxyIS3OSqerQ+c5Afw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="240779030"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 23:32:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 23:32:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 23:32:11 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 23:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbfbmPsWZFPQllQ6+WJvityc0LaJdoyjPaIxYXTUFQJ+/SpR2uCk9DxbAN9mAu3iTfssX3ru/40gA/LTEPT/BJujDWcc7NPNeQIv4fUQKqOq29zJfLd8jA3NSe3NHjuKj6V+XsFfvDF4hVHS7F44wulYr1Fs6rFL2BYF76ki49ZFw/C8bsGWu+GLBfCC1E7RVe5IAlU+OGAqzvvKjKuwKN9HUvvDVrrtfvU5XKhWMprDnoEvQSnkiMfDVKy9s2XXRu6z33ET63i/LIxaQuDIRNcG2cjHtizrzSVjnLuBMF378O7yAed542Ihdt20FjnkcCqzEWgNJiec0lnq2LtPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R52zZcYZZqjtkaAIGt27ZUm0AEVItx0Do8sbPBVIyE=;
 b=c+d//vxccNpes6Pb4rxqJ4pvWwHrDcgblw+o/jGMkgUwkY1FsTcmngpYTDjFu9Gawow+dNpK89mLatLYGMQTW/USeHxYvCnSMYpyV+/9mG/nFpRgE2biwEyUaHR8+5x1K3R3T8HxxP+QP+jZSNbKoJ8lLHz+78jJOp3CXc6NaB0b/5uN4dYJ7JUZIcfnExd5BzUw86H8C7JWEvEqGZSu6C+ZzFD/REgWh8Jfwt2x1PWufwODoOSHph/V0lByr5u7kC3/tSfFT/7EI2NNZOVs/o31g0WGpG6K0vR3OczLEUnB8bTMDTCigFOcOBktIbB4L6MNYkVsWgLiF8F/Mo95WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by PH0PR11MB7563.namprd11.prod.outlook.com (2603:10b6:510:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 06:32:08 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 06:32:07 +0000
Message-ID: <e59bfc5d-8a48-4f7b-991c-266b8fe7de3a@intel.com>
Date: Tue, 26 May 2026 12:01:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,5/5] drm/xe/vsec: Crescent Island PMT callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
	<thomas.hellstrom@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<david.e.box@linux.intel.com>
References: <20260130133639.765378-12-michael.j.ruhl@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260130133639.765378-12-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0051.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::16) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|PH0PR11MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d815bdf-5c20-46a7-f0db-08debaf08234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: sBNS0l61TJIgxKNEZtn9KoV/Fi8gwSOYKiCNl9NQ4bGObtGIkAXuYlsAX3e3mrUciZAQxOlXCP3tgnO0dPLe+ptUGJ1RlM1boc7M0wGxiaNuq7SOLZAGmCK2oZuJEUqD0GcVCI/7sbZN1KrUXA70d1+HVFtjkznFF1TuifXLE5cZIEpXJj+qBGqrZl5qSQiCHEihYbesNFB/Yws2rjuN8z4kRap7RoPKr091y1JTWNpynm2sblz5iLRyce9uudF2vxb0jbUzGYb5Y/zcRqylw4uWX8vdBhte7vHNTvyMSkStRn0FNT4pVp+cLEh+gATRW4YQB1jvXyrO/rOqii3WYvZCwD7zC67j2EubjV7FzSXJwwaVan+/ED/T3ah5hbEUvd6pIQ3JaTHQt65h9snYuhZxQes4nY+PqLiouMzSg+2H3VlQctd3/vnpLEm40bku/y3JGW0hNZBPlT3frXjGLRrK1qRWX8nZhPpJ+WLNTa5yoPtzIimCYaXCRHXRHnT21GWMfFjCRFONglWlMwgV8TesQ+hmVF62ptdiiHlxd4pHRQIUtzVemwEIIZarh6FUM/yxxke/bXuTnxJKvM9/pNapE/vAxFo2A49HfKCo7qgJDtkqyNHGoLM6GXtRtyHSSnKTFVy4H6tjomGOadCCU8wAtn65se2EcrKFfa34T7CoguYK+zOTkkVbDqOgGUVBPs506Lq24jFoUT3RlIRZOMcJl/lMI7hltZYZPeXHUJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8706.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkNzS3k4VkRjM1dLVmZVWUZqYzNVYWVzTktNdUpoMmxnNUVzdkY2aWQyV3c1?=
 =?utf-8?B?WnZOWG9IZHZ1eFlWR1BCcTFWR1BlRk1DM3hLL2NYUnlzbXhwVlMwMEllalVt?=
 =?utf-8?B?T241OHprajIrN0RPNWUzYy9KYmhCUDN6bFBJcERHemRLdjE5SUVKcmcwcmwv?=
 =?utf-8?B?dElxTm15UFVvdWowbmZhd2pFNkpjdnV1VDI0OUZRYzNQMGVRWUcrY0FCUDVE?=
 =?utf-8?B?UWIwUUxTMFF1WnVXRDduQTBGQ0RLVzVjZ3NNZ2ZYNFhsQlJYWFU2K25DQ0F3?=
 =?utf-8?B?RitlK2x1SzQ2d1BtQmxUWTZDcysxS01CeDVsOU5Wbm43b2RTbkZmNW1oUUlZ?=
 =?utf-8?B?Yk1LTnk5Njg0a21TSU83UWRpeDN6bmhsWnA0dWdZVXl5SnpQOG1Sa3NEbTFM?=
 =?utf-8?B?S1JRQW9LdVNjQktBVGZFUW9FTFprOWMxWXVXOG4rUk4xN016UHd6c3ZuaHZm?=
 =?utf-8?B?NGxnMGFyK3o4YXVLeXFMbGh4aHJoVTVYSWtLaXY2ZXgyNVNHM0lobjZlaVVN?=
 =?utf-8?B?VTlJaXk4UHd1bkw5bTVEbitCNGI4R1RPdFhScWJDc1JMWllaMEc2alFBSEhX?=
 =?utf-8?B?UXYwRW1SWjFLbXg4UzhBOW42Z3pLYWFEMVBRa2lYM0tma3ZJRlE5Y1MzWEV1?=
 =?utf-8?B?bld1NFQrWUdoVGpOd2VtYmJjQ1FIUEUwSm1oMG5hNkFsOXJVZHozSWU3SGY5?=
 =?utf-8?B?WXdaRC9UTnV0eXlvaUFNZEg2TkZwd3RGWGlVbTRmUXpaWENZVElzcDQvTk9I?=
 =?utf-8?B?dTNCZ2tzRmpHY1ZnNzBwTERhTUNVTGY4ZlNqbUZScjNXQXRFeUZIb1pNd3Zq?=
 =?utf-8?B?RnNpYlQ3NkVDVlQzY2xiOEtvQWF6VTFUSW9KSUlGM3BaZG4vSnJSSElDT1Jo?=
 =?utf-8?B?OTRuU0N4QVVkUXVFVmJpNVVMRVJES3VjaHFhWDBYQ0FnRVZSSi9NOGUyanNP?=
 =?utf-8?B?T2psbm5aN0JGTlhtVU5EN3FsQmdMQ0lPUit0UFZzMFZjdzBVakNXdkxVWGNs?=
 =?utf-8?B?NFhwdVNGZnExSml2cHBoWVJLNGptTlVQNEhwYWZRenlpVGNOMUQwRk01M0F0?=
 =?utf-8?B?cWhhdnpkUDlmWndzNmllYUd0N1NOUFYrT1RHbldPelUxVG1NUVFrcXNFMyti?=
 =?utf-8?B?YWR6OVpUdG9JdktSd2haRUlsUTgvTEJQM1dWR3d4RUE0UjlDTmVGT1Nnekt5?=
 =?utf-8?B?ZFk2eEJVUUk4ZnczZGUyRVlGaTRLcUF1R1V1Z0ljWGZaZFptbGZIUVgxNmpV?=
 =?utf-8?B?RGcrRW5HSUU2MDV3YUxQS0hzRnhBSm1mVlpwbDZUY1JqMXU3NVV0TWJWK1ZI?=
 =?utf-8?B?MzNYMzUrOTRYZ0dKdVlLSVhzMlFIZlo4bkhVK0NRMFNDV0lYOGxFdWNkSWFk?=
 =?utf-8?B?Ujc5STlBVk9QNmxVS2hkMGFnUG55Q0dsVjRzVlVkTW1tallQQ1FUOFpDeGwr?=
 =?utf-8?B?NEcwbmZCRTk3aFU1RWZQMmtma05XSE5VeXdTOExoZWRUcVBZMU1neHYzR0pE?=
 =?utf-8?B?UXZTVU45WVFQcWZZbUM2T0p5VTJadlcxOHZMWTluSEU4U1JGVGh0cUlVUXJF?=
 =?utf-8?B?QmpWWjhzVkpibGxzbW9OQWlhN3JZUzN5SlJ1bFNVVnNpQ3RSRU90TDZvQ05C?=
 =?utf-8?B?WmlSYzB4cHdTNUtTYStqNS9kVFFFM1Jzb3pzd3RrN05MQmpGcXg3TkJsOTVH?=
 =?utf-8?B?VWFyNTBXTjhjaEtOSnYxdE56Q1RkOEZVU3lqbmo2YXZkcVJPL1NOdXhsb3Q4?=
 =?utf-8?B?Vzk5MTFCTzR5YmZaOEhvaUNEWWhFQ2pGY3hMbmtlaURRUVJaS0lFVUdVWjEr?=
 =?utf-8?B?RkJXaWtuRDZVSFQxby9VOVNyOFRlVnhXM1FTMm9Pb2tudVdNRzhLMHVBUkQ1?=
 =?utf-8?B?OUZDK05HWUxKRnlDZk56T01zRFZzbkREK3FMRWREa3B6MnRsdi94ckdpRWx6?=
 =?utf-8?B?dnlwYmJTNjlWdWhXcEdkUGl6RWNCWGtUcFJ1K2p5b2FSemlKT21jVERTbUVH?=
 =?utf-8?B?aE5ubTdIcWZCcVFUSmNiOU41TzllU0NMUmdwYWZ6a0ZMMzdra01pcFh0U3Qw?=
 =?utf-8?B?Rk9weXN4SXgzUFM1SHdKc0JmdnVTU1dLcVB6L2w2MURnZ05oM0JaK2FqQUlk?=
 =?utf-8?B?MVd3T2dKT21GMnM4WGNOOUtESUpEbFhPV1RQZzY0Rm1QcDRUM25Tdnk3ZFFv?=
 =?utf-8?B?dHdMRlpkREg4NmFDemQ1N2FxRW9vZ0RMSDJyc2czcUZ5N1FPeTZ0MzUzcTFX?=
 =?utf-8?B?aGVVVExTZCtQcXVFdlJOZzNVYXJWWHpTWnNubzA4RlVxOWhSN0VxRE9FK2F2?=
 =?utf-8?B?VFBFeUJjbG1ybENuWU5lektDVnNNcmRNRGNLSUpTbS9PeHpRU0hndz09?=
X-Exchange-RoutingPolicyChecked: p/Lwl8Xkc0gaOqOhme1tfvPLKQLBUSUbDOeWDWhfcOiZhf5jmskmGstdwsOsPb3pF0gVFoGojYOxVHBSfPBSA4db49H9faYs+y8EwZFu5tzMhK3O3bBgfSybGt60WY+/T7yooJrt/0xE2NePHUoCho8fRkkWt669pKjBJXiMRBzmJy1na19ubBu0VEjg69YOfJwTD6V7mF0zXAtIOnXOVxx1S//+JCM/L0nyMjrohr2lVJWHE9vA/MwcUQGWpUe0TTzepR5TlbtFIU0Tuzr/oK+x2/NdbKl8OrckjTaBEJu5TuKLNQNe+jNO/28g/DKffclkq3vpmVex6FgzgV4Rjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d815bdf-5c20-46a7-f0db-08debaf08234
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 06:32:07.6659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+RyyIvW2xshvGwamtc0IGNZzgPe72FjzfTsa8qkUkzZ4MYlVsBur43kdNqk9qaLppGvuDlJ2NHYSKDBQJlW+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7563
X-OriginatorOrg: intel.com

Hi Ruhl,
On 30-01-2026 19:06, Michael J. Ruhl wrote:
> CRI PMT support requires callbacks to access the discovery status
> and control areas.  Access is a common MMIO area that requires an
> index to be set before access is allowed.
>
> Introduce the necessary callbacks to get the status and control
> information for CRI PMT usage.
>
> Add the glue logic to register the CRI PMT functionality.
>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vsec.c | 83 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 80 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index c43b0d554ead..f55d9a292818 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -299,17 +299,88 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>   	return count;
>   }
>   
> -static struct pmt_callbacks xe_pmt_cb = {
> +/**
> + * xe_pmt_read_reg() - read a crashlog register
> + * @pdev: the pcie device that register the callback
> + * @guid: PMT guid of the crashlog instance
> + * @reg: data read from the PMT data structure
> + * @offset: which data to read from the PMT data structure
> + *
> + * Read the requested PMT register based on the pcie device and guid.  The
> + * supported struct is the Crashlog Type1 Version2.
> + *
> + * Currently this is for CRI only.
> + */
> +static int xe_pmt_read_reg(struct pci_dev *pdev, u32 guid, u32 *reg, u32 offset)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	u32 inst;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	xe_pm_runtime_get(xe);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_fromio(reg, disc_addr, sizeof(*reg));
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +static int xe_pmt_write_reg(struct pci_dev *pdev, u32 guid, u32 reg, u32 offset)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	u32 inst;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	xe_pm_runtime_get(xe);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_toio(disc_addr, &reg, sizeof(reg));
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +static struct pmt_callbacks xe_bmg_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +};
> +
> +static struct pmt_callbacks xe_cri_pmt_cb = {
>   	.read_telem = xe_pmt_telem_read,
> +	.read_reg = xe_pmt_read_reg,
> +	.write_reg = xe_pmt_write_reg,
>   };
>   
>   static const int vsec_platforms[] = {
>   	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
>   };
>   
>   static enum xe_vsec get_platform_info(struct xe_device *xe)
>   {
> -	if (xe->info.platform > XE_BATTLEMAGE)
> +	if (xe->info.platform > XE_CRESCENTISLAND)
>   		return XE_VSEC_UNKNOWN;
>   
>   	return vsec_platforms[xe->info.platform];
> @@ -337,8 +408,14 @@ void xe_vsec_init(struct xe_device *xe)
>   
>   	switch (platform) {
>   	case XE_VSEC_BMG:
> -		info->priv_data = &xe_pmt_cb;
> +		info->priv_data = &xe_bmg_pmt_cb;
>   		break;
> +
> +	case XE_VSEC_CRI:
> +		info->priv_data = &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
Please make sure soc_remapper is initialized before this call. As 
xe_vsec_init() is also called during boot_survivability mode which runs 
during xe_device_probe_early().
Thanks,
Soham
> +		break;
> +
>   	default:
>   		break;
>   	}
