Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684F5339719;
	Thu, 13 Aug 2026 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786651814; cv=fail; b=uE/n/PgSxbDLNw+hi7MysEH5MBFuFtDeH3rpXUWL6Whynn425JuizFCybxv2nNdiWNnHdJz4ADo7pxBxjgfFFPKaUjLi63Vk6yoy/1DI7ccc2FngV03FrO/8fbpOERqA9jGlEEKr+zYrh8yapyt4BcJ3G3eW2Q890P/mRIPvDNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786651814; c=relaxed/simple;
	bh=2BzxOK5PdzqxptyhW9L834x0wvoFvIWrGt3jYPZaicw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bizge23YblqNSTX+IDzwF4lJVEWjX7gA/0P+pyG11+AKRnGRLjhP+eKahgxBzNFf4sOpmM/1sLmJJ+hauCq/x2YfA846sUJ/k9g2y0IBOaCLKqs8jPy8fdUM4SsJJpKNRzzPYP2uX3VOnWRco0P5+HUigPzHcc30UXh6r8jrYk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4MwLSEf; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4MwLSEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786651813; x=1818187813;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2BzxOK5PdzqxptyhW9L834x0wvoFvIWrGt3jYPZaicw=;
  b=M4MwLSEfR5fUaY/hQgtxZ79aEVrbyarPGLnBloKADA0n/abZnEvj6oIM
   LQ6st97mvEotzSyYCbZqwGipyK3r/IoZ5TYyHfM1Sko/CDJ2isrefd+bN
   NmGbmtvn85401CKKZCBRXhCaMQntTpzark0b+Vb+41V3nR7ny4yzt3YTk
   cjXOOkuipUVvpCS/FOxSDcslc8SnB/GW/+9r4cLP7/JKSwDewcKU+1diK
   HNILwgO3S3641vt46ZmQ6NSMOiZyi8bFMO+cbvC7OmIHNT5CIuItBsZBR
   z5Tl883yi8hKFE47Ebl5fQdlevMo9jukrIN6uuIbdgE2zvRAtOdaJ82dI
   w==;
X-CSE-ConnectionGUID: YhNzogBRRO+MUEziDtcIsw==
X-CSE-MsgGUID: dXqt0X5WTTipcOJUctE74A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="110020105"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="110020105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:10:11 -0700
X-CSE-ConnectionGUID: ppPoQeQcQxeWPl/BbMBaQg==
X-CSE-MsgGUID: ZG7H/8lsSJqmVerSSiXY0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="287511338"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:10:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:10:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 13:10:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:10:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o28ar0ggqOdBKdR+4XfQApvP5SGbxvWzfJ2Zxl2Acsb5vR1nBG3SpeMF1i8bilitdGnn2Jh+7g2kqk/+7f5wUBbW6A5jOBWrY+UoNlLsMdjpw4tc0i+2h3gl1p2YPYDvkv+0peI/yEDvX/qiA8oKvc6pVtXotA+7s6ON3jYdvNL8+n5GCfVquImeLAOD2g8xkqxM4oow5IO5tb3p1QkSVPKJ6gdFVkWOMbPQ2nbqiViDeFDNzLBn3IZCSyrbwNMs2amOR2hrC2IzVaqAM5wAOI2T5r6peLnLAOHn9ovZwqrFIzuiVnlFyn5VC/NbQ0eQkZHu7SVVgt2nWQMH0xUrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU0AoUykVFCwEajRAdqhMeG/pHe/mvipCNusSjYUPA0=;
 b=wHjwQwOUQeqrbTw9gHAYYVeePtb4xE2oFLe8gocxO5kKIKtblDW+DfUJqls3KuRnDp+GwefMuZLOdmjcws5bNX3IPNcMfFnBDNuoRTfg0oS5ffQPQfWQbRZBWWsgeAyAiDnv1a/85sm7M7HADqQ8i+iZmGuxBN36bNGzzdquFoCBeg1RsQ3fcQzaplC+HQqljx5fWf20U7AIyywPewMVMLzPVfCe1BaZGZyevDyhFD4VyxK8QKloNtwCLi8hqgd8KulZh+0KDdwzTi9pZHyZKZb2zG3ckJLADmPbtqs0T0eMQwnkP+DLzjasTyUHZvH2mtpZotq95rRJVAbvzJTi/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6873.namprd11.prod.outlook.com (2603:10b6:806:2a4::10)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 20:10:02 +0000
Received: from SN7PR11MB6873.namprd11.prod.outlook.com
 ([fe80::bef7:b531:5463:eb9b]) by SN7PR11MB6873.namprd11.prod.outlook.com
 ([fe80::bef7:b531:5463:eb9b%5]) with mapi id 15.21.0315.008; Thu, 13 Aug 2026
 20:10:02 +0000
Message-ID: <6d27a65c-3834-4f75-a356-a003bc3557f1@intel.com>
Date: Thu, 13 Aug 2026 13:10:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/vsec: reset state before
 re-enumerating
To: David Box <david.e.box@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
CC: Guangshuo Li <lgs201920130244@gmail.com>, Hans de Goede
	<hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260708032647.712412-1-lgs201920130244@gmail.com>
 <ak4ZUw92pn_F7Z4u@wunner.de>
 <6m7fuh2na53vrylsnq52qyxzcwnnoszxtl5kvza55ayoxsojyt@g65savkjqb4e>
Content-Language: en-US
From: Michael Bottini <michael.a.bottini@intel.com>
In-Reply-To: <6m7fuh2na53vrylsnq52qyxzcwnnoszxtl5kvza55ayoxsojyt@g65savkjqb4e>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To SN7PR11MB6873.namprd11.prod.outlook.com
 (2603:10b6:806:2a4::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6873:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a2ef81-1e45-4a80-76fa-08def976dbd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|11063799006|10067099003|4143699003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 3z0cMA9w/Mc3O6K1FrElRbzA3zzFidHtn2Qp17g+2qWLfx+X1n4T8tzGiSOX8wq+9T4p5kVHAWj4u3AcWPCJoNECIXHPSa6y8idihT7du7e5kZ2PWL2Pn5J7ojPKevyGMaxEVwgfK+gAdDLzoXVCtIOcHycsvNm9NjsMQCzPM2dK7SjyzdkZBxOhIQlNyEqTLdTgALr9vzhbrRTJdGn8KlWKKw/nB9yYPiNPaaUOaqbw0RAXV56BGHr+VgBlPLtp1zsWV6UWHGDDjTNs1u82lLUUg7tonBQTivPWMMT9vxq6u4MxGgUSkwlWqsffI9VkPYnVAln4t3rZIf9sdy80L3spGbxU+s6f8pbNaAiepk2WLiTXk+UeQXb1ZMoDtn85DAfB7f1qF7K3MnO21SQdCD3NHOpLfNfH/I7g753HKA3FZMCQnvUFFn00hf3Hu2qfwbBWrUauBUr+NJzOT7nrdvEyLz9iJJgtqkHSqwqynFnKA6keY0yrs2kEJHxNX+RerwfHXDcpeA6W0jGiUoa4HQfuSrWO/OVicmIimUhuepSdL4sbdxuNaG0rO/zix2Bu7HRrQOsYywNn5OLdTAm4yEp8d1ousDvTOBrpFdCtu/mLl2CTvLZ7kGAV+X4QksGiPD1/WOIuTrYnsYvBhi9PFYhbguJAZu7822AaApZBUi8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6873.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(10067099003)(4143699003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pVT29aWmtZc2Y5VjQ3cmxYSEJ6N0Y3N2U4dndjTmNTWFc5dzYwSU1rM1hv?=
 =?utf-8?B?SnZyb0lFY1RoQjA0cXovK2hiWSswRmRsdWNsNFk1OFpXZzJObSsvU1J0UXBs?=
 =?utf-8?B?V0hnOHYrUTB4bU5wN2FqaXpFa1dlV3U5K041ajZRNmJ5L1RteGVYRUxhRDJO?=
 =?utf-8?B?WXhaa2VVWTJzMWprdWExQlpFZEhhRXB2eU5YdmN6VDU2elFvOFF4UUo1ejB3?=
 =?utf-8?B?Q2hGMGx1eVlmTFZUY0hjcncyVG9pVmpxWXlOZ2NtOGlzeFFwRFBQaXpRaDVU?=
 =?utf-8?B?Y2FHL3psekFBSnRQb2czekE4Y3dNUDl5QUhWNFhVenNtZHVTUUNDcmtvWEFS?=
 =?utf-8?B?TDBkb21KWmRnYTNpcVZHZ3FmUXRaK2YwZlJ4U0F6c3dUalk4YzVXOVJFVHpn?=
 =?utf-8?B?QndRaExDV0p3ZnFHR2xjZ3NUOXVhZlVqa0wrWnRWMEgydy9ObHQ3aDhNS1dK?=
 =?utf-8?B?WkRyU3hCTTg4QzEvK0YyR1FyNERWbUh4S1FQZnk4Q0l6VTRLTlJoYU5xTkh5?=
 =?utf-8?B?TE10dW1MVkxXNDRiUDB4dklPdVo0R1NucXlKUUF2RFdwV2RuMzlDSE81WnVG?=
 =?utf-8?B?bjdsdFMvcHJBbVhIeUd3Z3E3Z1BSSVhFZVdvek9pMzJmTW1JOTM3WXcvU1JV?=
 =?utf-8?B?MkFraHdoQiswMEI3bjNWMHFSOVdqb3dyOW4zYkd6aEQ3aTNadVlBYm9sMk5S?=
 =?utf-8?B?Tno5c0xUUi9ySFJ2N3Vtc3lnbDNKRGhqdGw5OUJWcDZFMmhDNm1FMGg1TlV1?=
 =?utf-8?B?SERQNHh2dEo4TGZqSWd0dUwvcnlNVDhIRXNqVUlPRXpZKzZJMm9iRDFtL3JV?=
 =?utf-8?B?QTRQcDV4RkxSeVp2Sjlzc0dlakRZcFBOeGVRakpkZGZ2RHA0WVRyMmRHZWhU?=
 =?utf-8?B?ZitocGFMNGZMb2tJQUFscWdiQ3RDTHAra1RIZkZMekF3TllCMDFpbHJsaTJa?=
 =?utf-8?B?K3NybGI0OS9qRElra3BoUGJTOWZCNTFlVEpoZjBSWng4ZHd2TVVKQmNNNGNZ?=
 =?utf-8?B?ZWJqT2pEVW1ReVhVMVNKMVhDUUl0NFJ5bU8ySXZldUFkVExwT3RPd1FNdTlB?=
 =?utf-8?B?WGpva2szWitnME9tN3BvQzc1N0NBN01jS0Fmc1J1WEd1T3hEaVIzaEJRdy9k?=
 =?utf-8?B?cW1xTVoyOFFrazh3NzhGcmRMMVI1MVdaME1KbWk3b1ZxOUJGbTYyYWI0S28v?=
 =?utf-8?B?T1NIRFM2MGY3eG1lKy8xOXRvNlp5VEJGb0c2cmlwUnhvcEYyMm5CNzBtYkhD?=
 =?utf-8?B?ZzZxUEJkdGlTRi9QTzFDSGJiVVlCUzV2RWxueWJYWnUzMVpsMEQ1bEgrZGNX?=
 =?utf-8?B?WGJZb2NNbzkxbU14R1FoL0U0NDM1M1dyeVV0RmxzTTJaZnlrT2tDTjJkckI1?=
 =?utf-8?B?ZW1ISGZZRmRKWUQ3NEM3cy9iRHBwM1dFWTBpdW9uMFlUTjM0US9aL2lHNVNC?=
 =?utf-8?B?UUpBVTFhaWNkMGtDQzdUQmsvVFMzaDBacnNpU3BXOWZ4QUtXTFkrTEtYc1RY?=
 =?utf-8?B?L3AySTBhQUNZcjZQbUFteHNheTFvWnRyRnI5Vlg5Y0pVVnp2clE4bGxna1Ro?=
 =?utf-8?B?Q3BJN0tQSmRocVMyLzdKaFY3SGNHSzZjdU90YURIZEFVTjl6RkJFbjQzUzRX?=
 =?utf-8?B?QjF1aC9xeE9INDNBakt0N2hQTEZNdFhHcU1CL2VabEd4Yjl4NGRoUld6WGdG?=
 =?utf-8?B?L3NyZndVdzQwUmFwb0VnU0srWndZVUk5b0NQRWNZRHJEQVNzQk5xMGpReUNK?=
 =?utf-8?B?QWgxRVcvazJDR1YxQzN4Y2tFbkc3MjgvSHovSFNLdjF0SmoyL3ZXaDMyOU52?=
 =?utf-8?B?ZXRrdnBWRVhZU0lEQk5JdlVMVUZUVFg4ekZvbXpiYmNxdnVNSlZqZHVNYzR4?=
 =?utf-8?B?RlB0UlN3L1NNQUVqVmtValc4dkw1RWpZc0RHRjlCMDNwcnB6UVpKc1RNS214?=
 =?utf-8?B?dS92aGZOZ21QTGdVaklUQkQ4MGpFLzR4bmJYZ1VscWdWNnpXbkFJMkhweWtF?=
 =?utf-8?B?YmQwbkFVbmIwUzZpdEphWGNxYkc1eHZwZEEvNjRDNTgzNWNNRTZHdFY3TXVS?=
 =?utf-8?B?ZzB5VWRDTTN3aDNGNnlYT0RBWlVQTmQyVWVkSXlUTmg3UkdvQUsrUnk2QUg1?=
 =?utf-8?B?RjRBVng4M2NYdENpdGE3UmZIbDBqS1Z5ZzZpYSsyV3c1R3RybkxLb3Z3OCtq?=
 =?utf-8?B?L2xkblFmWDh4L2owR1V0YXppWjhJRStZWXc3SUg5U1dHTmsvVTlLb3Q3QUZW?=
 =?utf-8?B?Z2VhL0djRWdKODcvRnI2QkY3QlNTOEx5S3NuaUJtMkZtSG1KYUZxREl1U1ZP?=
 =?utf-8?B?bys1M3RZeVJRSnJ1VlJUSnNuRkcrN0poc1c2MjJreFVKa0RZVXhsR0hUeEZX?=
 =?utf-8?Q?kSjlLissVaQqBRSc=3D?=
X-Exchange-RoutingPolicyChecked: TgK8TbTBTSr0rm9NtcFmwUaPszkUeD4PYdo0CwKWBjxOSecwi2P526gQldwPKvmVE90brXJ0yPzHhHzniQ//2De7wDNCj16RQCQEcHhvhkAjUYjnahh6XZSDK6qmJ70FS4lFUPEmAnbsBNuQAhqWnwZ1jeHkk/h37/ahq+G7IO6id9xeBTaHcQx3atNT8dCWb3t+J59SmYek6EhhUjLXhiYBZGBFzdP9s5LmhaK+91x/x2Z3A15FjlXePV0zDBLGZJByBCIOJIb2U2+tDvO8kw2MbPV8IzRXtZk6sO26/YjijB7vZ2yR7EK53y3uqploK+HKRkVyVEUdJi0LYvPINQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a2ef81-1e45-4a80-76fa-08def976dbd2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:10:02.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWItyOQc5SxzQw51IlH215OA3hmYEW0JTMA7gyB/UypvXk8y+tf+S/OQCqCURjkq9gNU+G8mDvO+J1rKLjxJVPLdj8imqHaae1moq8t4aEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
X-OriginatorOrg: intel.com

Hi Lukas,

I've performed a reset recovery test on an Intel Ponte Vecchio machine 
with an OOBMSM PCIe function that vsec binds to.
I injected the following unrecoverable error into the bus with `aer-inject`:

   # fatal.aer
   AER
   DOMAIN 0x0
   BUS 0x84
   DEV 0x0
   FN 0
   UNCOR_STATUS MALF_TLP
   HEADER_LOG 0 0 0 0

Running in Bash:

gta@DUT10580PVC:~$ sudo ./aer-inject/aer-inject -s 0000:82:02.0 fatal.aer

Without the patch, the associated PMT telemetry endpoints don't come back.

   gta@DUT10580PVC:~$ ls -l /sys/class/intel_pmt/ | grep -E 'telem[456]'
   gta@DUT10580PVC:~$ # no output

With the patch that adds a `intel_vsec_reset_state` call, they do come 
back after injecting the error:

   gta@DUT10580PVC:~$ ls -l /sys/class/intel_pmt/ | grep -E 'telem[456]'
   lrwxrwxrwx 1 root root 0 Aug  3 21:32 telem4 -> 
../../devices/pci0000:80/0000:80:05.0/0000:81:00.0/0000:82:02.0/0000:84:00.1/intel_vsec.telemetry.1/intel_pmt/telem4

   lrwxrwxrwx 1 root root 0 Aug  3 21:32 telem5 -> 
../../devices/pci0000:80/0000:80:05.0/0000:81:00.0/0000:82:02.0/0000:84:00.1/intel_vsec.telemetry.1/intel_pmt/telem5

   lrwxrwxrwx 1 root root 0 Aug  3 21:32 telem6 -> 
../../devices/pci0000:80/0000:80:05.0/0000:81:00.0/0000:82:02.0/0000:84:00.1/intel_vsec.telemetry.1/intel_pmt/telem6

Best,
Mike Bottini

On 7/9/26 10:57, David Box wrote:
> On Wed, Jul 08, 2026 at 11:33:07AM +0200, Lukas Wunner wrote:
>> On Wed, Jul 08, 2026 at 11:26:47AM +0800, Guangshuo Li wrote:
>>> +++ b/drivers/platform/x86/intel/vsec.c
>>> @@ -51,6 +51,13 @@ struct vsec_priv {
>>>   	unsigned long found_caps;
>>>   };
>>>   
>>> +static void intel_vsec_reset_state(struct vsec_priv *priv)
>>> +{
>>> +	memset(priv->suppliers, 0, sizeof(priv->suppliers));
>>> +	memset(priv->state, 0, sizeof(priv->state));
>>> +	priv->found_caps = 0;
>>> +}
>> Seems fragile to selectively zero only portions of struct vsec_priv.
>> If the struct is amended later on with additional fields, it's quite
>> possible that nobody thinks about zeroing them here.
>>
>> It's probably more robust to zero the entire struct and re-populate
>> the info field.
>>
>> I also don't think a separate function to reset the struct is necessary
>> as I don't expect additional callers down the road.  So I suggest
>> zeroing the struct inline in intel_vsec_pci_slot_reset().
>>
>> @David Box:  I've asked off-list for reset recovery to be tested,
>> I'm hereby renewing that request.  See section "Software error injection"
>> in: Documentation/PCI/pcieaer-howto.rst
> We'll do the test and let you know. Thanks.
>
> David
