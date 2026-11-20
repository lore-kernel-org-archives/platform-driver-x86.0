Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795202852;
	b=E7Q2Zocd3CFqB3UI4C+xBgNw2Tyht5gHahVk+OpI8xZ8TyN9Iqy7LTZgK/cH/uS+NF8b
	 qasqcVL1ZGcK+kuhhUqWkhBbZ1tMfmPv5xovkyrQadOGgf7sQVyatQw3XYuzP8bnf3E9G
	 ZL15qSoV2Hpjk9jQ/srx86PHN+zNzNh52D836MBs6LwNPQXHiFpouKHknzvaMyGgcA1WM
	 8s8f15Q2zPYlAK+H/voX4C/JjZMpeSeiY3L9eCU4m5zLNoGgMul50NCfRs4cB6EvEohL9
	 vqAyalezWDUx8Dlv4m5wrU708MJH+tzqB4+lAh/FVKXlZSVumD0gteXL07V1sDbq3dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202852;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=oSVSG/P1etn0DJiR21Gi6yjMA5skdrXqQnEcEVhykiE=;
	b=jzMGDlQFPPx3zmRcEvaRXFMpo6/aIPK1u10WpsyvbVoJUQS6nv0nxxh6DtQmQmZuiDzF
	 C9Z0F1tlhyxh27UEyJ1wKW9UViv3w9+k6OvTiIk2y4qGN6ukye7gyy5eF1OAd56w8UnFJ
	 7vjLa90Me7tV+BaIICS/F5cAp+0Elpwx25vy1YzQ1cTD2svh0h4HvrtdnCW62Hnl18y+N
	 AzKqipMeExTrRZYK0JnLC8LXHb2KSQCC+Det+KL126QsX3GeZYBHFdViF//rRPAaDZ2bD
	 gRCBkZ6/pHMim1coy0AxY6TQkJtIQ7xa9ASqWriDrQiC24m7OIlEfXbghY4BOW1Pofg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+DjIHpd;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WAsko6MF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD671606A6D5
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 19:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD671606A6D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+DjIHpd;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WAsko6MF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795202842; x=1826738842;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=P18XZWUeW6EEZag2tsU12rvWuA+bh2EDpAliE55P/I4=;
  b=H+DjIHpdsarZW/pGZT1yHSk+YREwR940De+xyThpITiT1Hrky43jLlLR
   OH8PegK5LA5eWQOULVgjspZOTIwSWIZmzp3RafVTuzp3yjDgjMwJa7Ao+
   9JTjOPWOubpLV2Na6kl0xhAaBfxn2bk9X/lspPmR0d5mKh6CJrMv3maBl
   tNW084l7zkI3AzMMaXqrtGa8dQuye7aEOOzJSpSLWt237s2QAhS12CwkJ
   xMybVgnnuxQm3/MJn/cVFYrvH35JZntB1AFfBvMJFXW16xetGgD7PrzqG
   9cf2EEVSHtyrCr8OowOQidAvges3mfFBfsta1c5uI/6gwBO+4W75rYb+6
   w==;
X-CSE-ConnectionGUID: WLF2N6OxRVe6rd5LjWTSBA==
X-CSE-MsgGUID: MXSXEyRwQaOs1nRwrKbwGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4168555"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4168555"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:27:21 -0800
X-CSE-ConnectionGUID: 1w1PhRnXQXmt1OVVMRDaIA==
X-CSE-MsgGUID: gRMRwO08TAWJuH70HU+btQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12596974"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:27:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 11:27:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 11:27:20 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 11:27:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uS2e1d/rUxCL6DUXTV0oeF7yedt9FWEmeyXXReOQ3FWZnaGxolJurHkMzNfJfYhEpG3hZUfYH/CI8I6aPdUkqcWaVZXKqRN68B6C/gBp2M8T0gmLG8xyyn4FNoPKV3elGKS72rPG+d3WMlTjpBi0wJ935Y4J3qwpAS3vGHg+exT+CebSNqYX/nC6ML7syHx2eb+oWVA31P5BMJYVi5wjzk5KxqZ3Ib9orGq4jZiRnX7vGKVaRI/sjkh7Iv+W3J33Fc/sp7CCyg42acA7pxlSRsqOF8A8cQ8uChISbiNAUSUjHS4zTEA4rrkSl10m8MRKDbBF+rtq2kAg51PEzE1deA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSVSG/P1etn0DJiR21Gi6yjMA5skdrXqQnEcEVhykiE=;
 b=qCs2D3DNr6idRFG+PdRbyvIDNcUDwwvCs3SV2B5nvm9AoH8B5x+niP3/AeH6Wm8PqKjmNe/+wL2n1eU96DirDoOln0RL0WuqA0WV/9k/3Ay7tAKCltpKSOLnoC9hySZDXJzpNv5YFy3gbXUk511b62uHFs1Bp6++i5wNWLwKHjJZCK49aVayN5Mxddyp2Iz9vOc8PuBnrkbSiODU1V36f2wIIRZfGwtdkrc1suz8rwJuBvP0SrVZr4UB1mdRjMuBoXOmC78tWFvVfdDG8aXYo3QsqtNwRgS3yuwYqTw+3iT3CtGkLCJso2mNZmlGVAVOMqA8CMXGoGrwlfmZvZU5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSVSG/P1etn0DJiR21Gi6yjMA5skdrXqQnEcEVhykiE=;
 b=WAsko6MF9WkuVGYVXDyp1xhiOtP6MGSLRN4RMDMl9v8QnPC0kNzvwp5OIskKJM3XlqYw6viDJMPI5mMik2vYXmEGsVZL1zQRfdrLCHtDYw4JK6JruTHtZXYbwvOY09FmmI0yiTbu2DrYn/Rp1bG7VWD7F6UIr0yVnfIbcPqTNtM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 19:27:09 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 19:27:09 +0000
Date: Fri, 20 Nov 2026 14:27:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>
Subject: Re: [PATCH v20 19/19] drm/xe/vsec: Support survivability mode for CRI
Message-ID: <awCfCMVnFKAgmlhh@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
 <20261120021929.473553-40-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120021929.473553-40-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: c82a93c9-70e9-4170-3c27-08df473c44bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|11063799006|261026140227099003|4143699003|56012099006|261022105027099003|261028144727099003|261021121427099003|261009223027099003|261102123227099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: PhpzJTDCrLJ1LvdeQ/8AD5icmMa+1b2Awrtq9X7k9WXxsEV61D1Hf6Ouk+T7KjJSaNW9hSBe2vxyTtlT0S0KwzAeGL5TXtjG/g0u+LHC9fCWmwul0FlUsORhFaS7bECwSTpuzMATzxUGzjyqyZ0JD6P+bCpm2oa+T9M3oNXoRJyHyYLAd7tFCy2WLM5jEYMgq2rDOqCFqrmc4I6kGtBlFhsPmy7IYgfiIPa1gYgQCzNDsUvA4wBdaPXBqdLIxAoO7Bq2jtkjvi8G6vlIBDnqXfXlzGNvDKAs5L4WIjNahRTKN/YVhcm1NrWY2ZrWNwAYsJLfyhEFNgUMyEGsUwiOC0OuNOc7uGbSCvRW7Ps1S2p2HkocYC1j2jDM/eQsDQBaJGpAQDnMrGPFCoWZBqZQijx2ErnyhTSW39Eusip3yqU3CNpkhA/csyunTIl+J/icgPyGbINC2B/YSt3BKw9o7ujkl2+oFHDPfG3AD/QJSOgVScrA6WEJM2df/mXTXjVDrfdmhUPQi30WdnuHkkXz4amTFTzcr4bf/lkczDqTq8Ru8or7csgXWHOBKzBRQE472Ed7gfmGJP6N139QPkjsfaH93Kd/ROz2SzWL/bTjL4cout/QlOfXMCqvI85zl2El1lcM4iBu7sfrUux1TBrYU0LMSwaWpmajZdA3BGBOWno=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(261026140227099003)(4143699003)(56012099006)(261022105027099003)(261028144727099003)(261021121427099003)(261009223027099003)(261102123227099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XyFmNPcFb9v/oqEPGb+u+PcONoUAZ+jmEzK75i2k8SOBdwvzZbVvyrtkvqt8?=
 =?us-ascii?Q?Xru3P4ELVCt3AFtg6TDonItt0Whnf92PMMpoLnS+sAFt+lUCzxCikHUnzzzz?=
 =?us-ascii?Q?qYuKaTGeovFc3FZ0Z9Tcp8k2GH/cTghxUnaQEyaVJnjngQJgj6u1A8yAI0yr?=
 =?us-ascii?Q?+pYfceZf2ggAAV34PfuNmQFIMlwW6ZBBWwZFVedhAcztdt4GHp22rvIGBwz8?=
 =?us-ascii?Q?yggVydzTflQKgALGA3EV2SWOxTGLW6h6rXYWnuLw/6QeIquGASCyueYH7WYK?=
 =?us-ascii?Q?5j5DkZbI8mN0OX9Niga/VGGcjnIpW4LzXxLfwjz1+izFOHPNn/kQhiRaxf+j?=
 =?us-ascii?Q?aDTBs/HF+iAhWC39D3r6W9Ovw/33As2NtcGauOFqqcqDVpEm7SzSuDHTW9RU?=
 =?us-ascii?Q?YPJ2oUrrPHjB1Ypc+27m44r3ANy+TY0WlVPXKTgcPlWi7Nu1QczZ1uys+dUm?=
 =?us-ascii?Q?uHNQJ+DjrUej+ET0rWilKs8dzVZr00VJa3JQ8RKtbyDMGqvi1/hVvKZQ7pAM?=
 =?us-ascii?Q?8yrJXwWlTwCctaBBEOZorlSeTHRwtnLUwAW40JFe3FwhnZkcypcxT7xYU611?=
 =?us-ascii?Q?5QvT67vOIml5Q047lvYlmyfuskUjiyoVCrwsvHapCVCgdbvztcmiCsQZrCps?=
 =?us-ascii?Q?gnjsr+l43m8GC95XM2OFVGpN55o9peqcTqOp5dp6mAgVQNOWfRXtN3pe+OUs?=
 =?us-ascii?Q?vwwfV97J3SGJFwJvXr8TGljFH9MgNw/K4tk0aGVQOAkUKuqUldjpuyJQoWQX?=
 =?us-ascii?Q?f08LLvx2dQ90xHW5e8hWvVKCIVKE3LFpJpQ5a5Yuz555y2ryv5O0sQiHIEG4?=
 =?us-ascii?Q?wWPWM1mIPRqTY9yI8eD/fx3CuT2pvgFxFYCRJHp16Lr6IufGzxi4mRPf6I+I?=
 =?us-ascii?Q?GEvKG8I42V/loY8s8hQrmLbDGaPKmMuuWB8MD0aACiuKJ/l/LcV4tBiMfkiI?=
 =?us-ascii?Q?/FWCsxfffBMNSP3jA3bS10FpQmSNyE2ESsoae1DxAgOZJwgq44F+LrCmyJLN?=
 =?us-ascii?Q?whbueuca+2d1h5OMU4i3n7Uxzm/8eio2lNDlWtpW4zpzIacTntFwJJUIXtE0?=
 =?us-ascii?Q?VQpyXr98RL4O/tpuEzxcy7mvpfWJxfD3e+guwmUcnf8iKY0IIoCGz9lczEmq?=
 =?us-ascii?Q?/iQNHPvkKSJphiUt08H5XopH0L7KKZ7ygMlHuOguzw7DjEhEQ0YuruJyJrcp?=
 =?us-ascii?Q?+sIj2q+TrM/RH3EemTUgmstGtsUX907rdTXnCmSFPSSp1S0xY+q+MAZuVTmi?=
 =?us-ascii?Q?uzjrxyNFAH9H+TlZq7ZR8ee6iGKahrTIlbCrpZ2iUDQQbzCop7wMpuWvBTiC?=
 =?us-ascii?Q?Elz1fKjaS4x/Tlmq1pg0v8ROPisztkibXbPpU1v9cTqtxtTwLxjsFf4s5jeB?=
 =?us-ascii?Q?J2xZRg6rA8XN2t6LMpVjTHUlTIDiE+9a8iBm96jRJokBN+ULvRoxPcZJFJj/?=
 =?us-ascii?Q?MvbABlfcFsULMmHoOQBwCL6Rh72XNGGZxrmos+46pmGoaDZVfREVrNZb6QuT?=
 =?us-ascii?Q?1hQzpdi1+7fXDDslOyoaU7jiuHXaOryW3/K2V1yU2H1ucJZlf3QJLB3q5F/4?=
 =?us-ascii?Q?zGCE9H9ByCqikJ7EC0HGSvE7KGTk9sKfV3w/K2P/BwkylxjQ4GSkz/yOjtiV?=
 =?us-ascii?Q?7AHB/luB8oKGtg/jqCiFJBfumkSAOBd0fvjxCOqmLiMmUyidhD+Jfd/fUEcm?=
 =?us-ascii?Q?0G1KZShUekad/CCNV4Kx4V2VsrZnS53zqRguBCWn4Fo9qBwGJ7ofoLtb1D3W?=
 =?us-ascii?Q?tFHQ6muuuA=3D=3D?=
X-Exchange-RoutingPolicyChecked: gH+gO+uQSCZwpGlMhbDyAtSNnfshsrC1kXPLa/iEmWxRY6fcZLqrhBZLGtMdjSwHVR9gd2yZpIe5FZ9THlJPW578RyYfKAa5zuclFnux83V+NtYxnhJa49axKjAmg12T0sdnR64mN9DOnfWG/+vq4c5N59KfE95kKnAXLQFoZHStGNKfB3bevDheopTP5NJ5vAY7ke/aY4vWa3H7AK2ZRTKAt2jqu0Qmy8MgODJNjGk51K/Se9maqHqPVFz01ykZpns16EJfBfTM/0g7LwWgCXdSg/r9uE5co/Ck6UnrBHU/QifDgcBWX4o4Wcl3T1P78uFeemzkPwzT5Jr0eVrhAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c82a93c9-70e9-4170-3c27-08df473c44bb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:27:09.0025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdnRYjbzYwaqMHr7SZRI0IGU1FtkTV91tuEMzCTM5FLOkudSql1jo+A7pO8NMN5pPOyAottb4Tn8SE3xhni1BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
X-OriginatorOrg: intel.com

On Thu, Nov 19, 2026 at 06:19:49PM -0800, Michael J. Ruhl wrote:
> For survivability mode, CRI can only support access to the
> PUNIT CRASHLOG PMT function.
> 
> Create a special config to support survivability mode.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_vsec.c         | 34 +++++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index be6feaff4baa..ae5426717eb4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -494,6 +494,8 @@ struct xe_device {
>  		u32 retry_count;
>  		/** @pmt.punit_guid_cache: cache of the PUNIT GUID */
>  		u32 punit_guid_cache;
> +		/** @pmt.survivability_mode: cache of survivability mode state */
> +		bool survivability_mode;
>  	} pmt;
>  
>  	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index dacd9d271a6b..a8715057ab2f 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -20,6 +20,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_pm.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_sysctrl.h"
>  #include "xe_vsec.h"
>  
> @@ -102,10 +103,26 @@ static struct intel_vsec_header *cri_capabilities[] = {
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
> @@ -117,6 +134,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
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
> @@ -320,7 +341,7 @@ static bool wait_for_fw(struct xe_device *xe)
>  {
>  	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>  
> -	if (xe->info.platform != XE_CRESCENTISLAND)
> +	if (xe->info.platform != XE_CRESCENTISLAND || xe->pmt.survivability_mode)
>  		return true;
>  
>  	while (retries--) {
> @@ -612,6 +633,10 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
>  	     xe->info.platform == XE_CRESCENTISLAND))
>  		return XE_VSEC_UNKNOWN;
>  
> +	if (xe_survivability_mode_is_boot_enabled(xe) &&
> +	    xe->info.platform == XE_CRESCENTISLAND)
> +		return XE_VSEC_CRI_SURVIVABILITY;
> +
>  	return vsec_platforms[xe->info.platform];
>  }
>  
> @@ -733,6 +758,13 @@ void xe_vsec_init(struct xe_device *xe)
>  		}
>  		break;
>  
> +	case XE_VSEC_CRI_SURVIVABILITY:
> +		xe->pmt.base_offset = CRI_PMT_OFFSET;
> +		xe->pmt.survivability_mode = true;
> +		info->priv_data = &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;
> +
>  	default:
>  		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>  		return;
> -- 
> 2.43.0
> 
