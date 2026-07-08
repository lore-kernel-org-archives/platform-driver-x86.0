Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C184C3803DE;
	Wed,  8 Jul 2026 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518102; cv=fail; b=Hn+lHx5hww/wTMzVaHEfRcJRxXV2LVsL+h+hsONfilvWyEhhomxwUDHft/wDYQAiYX3Dm+03Y5pGrFNlNhi6ZiFGq4xruz+c3+ZEV9NhEislivW0EKQMbQdLO5r9YSzDV+a+1+S+WkLLjc3GpPrYyeQyVID8jG68N+0HK0S2HAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518102; c=relaxed/simple;
	bh=XQB5EvWyaqG0NFSaKjL0vabBXHAW1VRk7J2/ZOQVd/s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ssy3tGJxtMZV+Hw8+cFSrhJmZIubhBtSqsaVhV8pICZXz99eu693eixO3eLVFzcqLC35gs4m2A3eCZShFGGzbJ16C/b6xyMhfBx7j6z1FDEagWbLMuy3BIHn22HGhYf8ZgV63W7j8LN5Gk2JapKOgnjuBtnKKBu30kNKOb7zRco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfUENwOf; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfUENwOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783518101; x=1815054101;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XQB5EvWyaqG0NFSaKjL0vabBXHAW1VRk7J2/ZOQVd/s=;
  b=HfUENwOfr3oWsl2fCzzHTFzpzTYOYlZkixJiSJtSpbwWt55Sxrjh3+eR
   OOPJEviBIa9lQUg+JgmPLfuLxDtNZ6bRbJYdr2EuEG+QGF95eQMLAKcd7
   yW48d+sfxkSQ0TPVYafvdnF37pGa3S5296++5SWdn+zZm2tW9clsAlX4/
   xVQd1/kWtIDNdRn4Jqst/jcXtohk6a2NX+h7M4UuVmB9Nl7Ls5Ja6oL9B
   wPw/a4R3O3cBPh0XNYS9VSwWfQZxo+uhcnBdFos00ZIECNO1b7+mZCDkq
   Ao/cEumA5b+7pUn48VTeIWGcsYLJrShlzeXIMy3pArINAn4EfeV09v9ch
   A==;
X-CSE-ConnectionGUID: S7C7yPVJRFi+SLDbZrZ2Og==
X-CSE-MsgGUID: 31Mvl/idR8+XkB4QMTU4kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94825219"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94825219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:41:40 -0700
X-CSE-ConnectionGUID: C3/HQhZwSOCymhTKxSMDhw==
X-CSE-MsgGUID: 6RzPl60dSPC+iPaWUtbdWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="247917860"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:41:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 06:41:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 06:41:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 06:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lil6KKBSBieSpgT3qhLzLPGZhS0SWYys4XGtm2mqQ/5CrfRlTrrNYWTfkT6pMcg+XunvvRALfm0q3peWVYsC6xdKbxuWFTuat0KCqj8ga7/AxQAYB48Cs91KENcB8pHfgEazwKINjAp3qKxoYgZjC7YxiqZPyYfqQY8mX/XczbzoLCyzswS3ji/7JAyGT4eQEtSM50YvODb52VM7BAE5X7Xt0FT14BVccBmzA0M1w8KYNpz6eLJsCl/VGYi8U3aW4ALRI0X8F4U+gVcI9nBj0fXN45xkFpr2vHsGPJIwUKgV1W+05L2D20iiQ+mu7svAzvGy5LLuDpbOlbVa3xLLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3VZZw5zWZpUdho3fqFZn6PRbCCSP2HkTjGrHJ/c4Z0=;
 b=QnlGDF3uYVee7OsNJawuyDepNwRJcqLAIe/cm5oxqFRpWMbbDBS1rQlIDKPj58BV6vbfw+PBoWzaVYT2IcPT0T4nif7hQS3iw4GhYR5o2pGbg/1Z3JcGLLSgV4F79/2yK82JMw6zTR0lU17hPCve90bRwZxlMnEt8ZTxEhhXGG/VoEiQ60rhjPgPHFNG/7NuBB2XwoaFd+UoFHuZNzBf6R2nLc1dyAVR06kv1H4FSoA1BFk50strYSyyGJkFmAU6pqbnO5yhRGgzlf5ApB2pOt0716c41Voemr3vmrE15Ss+WnhDhTQRmuuH0fuizmABDLVVHoBdERW4HbFWGGcNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by SJ0PR11MB6767.namprd11.prod.outlook.com
 (2603:10b6:a03:47e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 13:41:36 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::20e8:3969:482d:76e5]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::20e8:3969:482d:76e5%8]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 13:41:36 +0000
Message-ID: <8ac2bf78-a139-4ce6-818e-fc0cd218f71e@intel.com>
Date: Wed, 8 Jul 2026 15:41:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: asus-wireless: Fail probe when there is
 no ACPI match
To: Linmao Li <lilinmao@kylinos.cn>, Corentin Chary
	<corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Denis Benato
	<denis.benato@linux.dev>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?=
	<jprvita@gmail.com>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260706024953.534671-1-lilinmao@kylinos.cn>
 <20260708010706.718190-1-lilinmao@kylinos.cn>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <20260708010706.718190-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::23) To DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF63A6024A9:EE_|SJ0PR11MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f96c819-7a98-4d58-8b00-08dedcf6a145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|3023799007|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +JK3SnrOt7/xHYPERo81xZe5hROPZ92pYptCKTTDG+Kph700RaUAFUjoDcrqGsjkelIOMZ9vLNYfgrV6JN2/+mHqH8Ns0NZjyYRUt77i44BmwUh5WYqGXz1vKw0XwqiGBFAF3+WNoopG+Zp2ec0jtC8cqd5IkTkBK8KVCx0dR+nnnIt+W4YNo1QG04A/lEuS1/B0qw04MIHNsSGIVeN/457LcM3G42+hy7ErSNLEv4s75ccdw212vsobnGxevlPuDWT6b9ZuQLwlScHp/FBSew50m5n3am8kGOkGTXZqI/h20hEPiauB5TAO/zu/QUSg4t7AlxeRfYFAuSqklOcUdo+YLYI6LIOoWyXzJe+kkYSbsYABmM6fiwjbTtbV+1RYnOYCUTbe2x8DmtFOsMmOVAFqETGgdBYrfR3AzCEAz/+dtCTebNTTX8h6IPAYfid6iU0B2T8FwyGAxEqUDKFlJK2z+QpugzZN+sbMJo4WLSYHQhEiBN2QPhh4q/WDaD4LZhYntjpzHVzI36aNmGTgP11yfCKfaRcjsxWuxE+yIHTGywN4p4XHsMP8MeRpZEDEfDVnuNW3aG3gePYk4XsfLxMQmljMcnrFJ1WhA0L5am9sEvKgxCT63xY3LmCsu9w04NUEW2Fxt098WFjr1Ng4ecI7p+zynO7c6PZWIXIMy0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(3023799007)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxwZGlMWFlTRFRFVjhtdjR3VEc2enMySTBkZU5uelhLc1o4ZC9XM2puejh6?=
 =?utf-8?B?bkFTS2JuRm91SHE2RndPYVBmOWkxOWRsRzgxMHF1VXJ0SGdyays5bjlmcUFE?=
 =?utf-8?B?cVNmWDZrWnRDZTVWbndZd1ZBcDZEN21FR2t4aStwRkkwU2htMnB5aEQrcVl3?=
 =?utf-8?B?ZHlieXhPcGtWWlZzM2JqVm00aTQrU2lwSG5Bc0twSHVHS1RrRFlhTzhCRWM5?=
 =?utf-8?B?TWorV29NZytSWXYxOVNTK3NFSjErV2xHdFFvcmFGYTJUTFB2WkdNVC9WRzNq?=
 =?utf-8?B?V3BpaEVkUTJ3ekoyamgwa2ZHaWVNTm9hcXR6aTdZOG85VzVxeno0RTRpSFNF?=
 =?utf-8?B?aVlIY3BtSW51ZlBBcEFUNWp1TTdZQTdSZndVcjVSU2pua0V2Q05WazNycnBt?=
 =?utf-8?B?c0ZwNjdEMzlFMWlBcjU5SExoMEk5OTVISk5vejJMN1BDdHpCampWUnViaEpv?=
 =?utf-8?B?b1cwZEFtZGt0RFQ4WFhBYXRHOGVRYVNMQzlITjBtTWtKV29tOTlpQkdtenVK?=
 =?utf-8?B?UEd2Q3ZFQmZncnRUM0VYQ3VRWHliTm05L0NRMUhDSTNsZWdhYnNQV3JoZmtX?=
 =?utf-8?B?U3Y1aHFKRmVZYXg0K2dMT0Rpa2ZxVDNuOVJtSndoRFFYRGdhUnhiUW1lNTFp?=
 =?utf-8?B?bFVEME5rOEdONG5DTjNtbDFWMVVNN0htS09oT3lVL21jSFZGQ3FMRjNmcXlL?=
 =?utf-8?B?Q1htdTdVcnVjeTYrR3h0ZkdaWUJWK1g4RFNjOGJPUnU2M3lJc2VjeExJK0dp?=
 =?utf-8?B?dFY5SEJYMTNUb0p0TWkxVGFQeFVZTFNZY3J1SjBUVjYvWWp0dmU2aThtTzFV?=
 =?utf-8?B?ZjUwdzl5YXdmNitYZW91Y2ZHRisyaG5lbzErUWM4U0pCZk1tV2o2NkhpbEFh?=
 =?utf-8?B?SFJONEw0NDRlbVlvL3JhU2hnVjJVYW02TE5vMHhMaWUvTHo4OVpEblZVZTA2?=
 =?utf-8?B?cnlUWis5OGFSNnhWaGdCQ0UwQVJQNkY3TmZxR25jR0FrMGdCM2RReVZIK2lL?=
 =?utf-8?B?aXRGSmYxc2orcXRoT1dYWWRPWVJhajNnZ2pBYlNwamtsamNqaE1MOC90MDVN?=
 =?utf-8?B?OHBpZE5xMFd2dVF1K1ZyaEVxMy9DNlhwRTVnUFJBbThWTFZYYVZtOWpqcTBY?=
 =?utf-8?B?YS94YWtVUTlqcmxFcXNpaHoxRlo4YksrbnhFZ053dThlMThubUo2SXY0NGdR?=
 =?utf-8?B?blo0Q2NBTVFOc0p6Q1JHbEh4SVo5aFBZQktVNTFEWEhFN254MlcyK3JvOFVP?=
 =?utf-8?B?Q0VtK3QrQTJpdEw4WjN0NHNrVkNrZnd5Q25sRnkvYWF5SE1hc0dicEI0ZDhy?=
 =?utf-8?B?R1BibUtmaXAxN2VEMVEvMi9nenJxWDFkcGc5elljamEwMUp3aWswVVFvREI4?=
 =?utf-8?B?cHc5NkMyaG1nT1YvKzhHUFdIMmpjWm9hc0t5QmFkZnZ3L2w4OUErT3lNT1Zx?=
 =?utf-8?B?cXFJNlh2ck5NcWxreW5PNGNmZzFnYlJwSUVWYzB4WW9TRFpWeXNTOUIxTzUz?=
 =?utf-8?B?Zjh0bmNCenVXK21xREVhdDFicVdiN2p6eXlweEllbmhQUzVDajhBQ1JBaEhx?=
 =?utf-8?B?SHVsVXNCQzdlYWVUcHVRNG8rbU1jVy85N0RvSGNMYzFqbEhBdXhGNkRWOFZ1?=
 =?utf-8?B?bys5Zmd0azRQNEFIc0xJb1djTHFHQXJBbkYvelZvYmZldFgvMGJCYndJZHQ4?=
 =?utf-8?B?YisxOFdiSGFlNUZIZkx5Um9lL0x2Y2F1d3RoQTdlZzgyMHlpZDBReDIwdmZ2?=
 =?utf-8?B?eEFLSUord3VPRTJrYzZwSG1xL0EwSjlWUk9MTXR2Rkw5TWFwQnlkdVRRVFds?=
 =?utf-8?B?WnorZUc4ZzFWeXpZZTdibCtSSFVWSk9DcTFXeHh6dVNSaCs5SDYrRHcwQkY3?=
 =?utf-8?B?MXV6NU9DWmZ5cmEzVGprVnJ3V0h1dG5neCswUUZBRm9BU1EyVHFOc1JVTHdF?=
 =?utf-8?B?VGhtYWxES3dtZHljaEZ3THdNWXFYWFhkekZORzJ5ZjU4cDlGTy9laHlLd1Uv?=
 =?utf-8?B?dkdYV05lNHNPajhiTGRPanV3UVkvdVQvUVhhckhnUGdiOG5EMWFUOGZudnJY?=
 =?utf-8?B?ZnZOOE9KcUgwSHA2ZlMzVXVFYURvbS8wVTZCbml4REs4SXRENitXTEdKV1Bj?=
 =?utf-8?B?NHJXSVJvbGh6VXd3Q3VyS2tXUGNjMWhiaFVGb1k1WllvcXY0Yi9hZkN4K1Mv?=
 =?utf-8?B?QXNwOEoxNkI1MEltN1JlUnlFRVNxVVA3TVBMeUJxbm9ZcWlRMkVRT2w3OVhh?=
 =?utf-8?B?NmFzZkh0ODhYQk4wQ1N5K1ZZcUNlejh1b2RKd1IrbzNKdjBGMzQwVE52UjlE?=
 =?utf-8?B?ci9mblk2bTl5cUZId0Q0aERkTzZqMDZ2RjIrMkxQZmFEWjg0bFZQU0Rlblc5?=
 =?utf-8?Q?usl1Ls/JvnpmM/UE=3D?=
X-Exchange-RoutingPolicyChecked: NMDvQ1nSMxpeYKr7iVPdCiswRp7a9TPPnRdkJ/UUTB/pzadsFhLJmfbZW/s/oaa8zB5eLOzEkwjmg6Lea8gUJo21ndIhPPZC98fj9pKLbH+KEM1scxajTrITaSM0WPXyaQ8Sgm4pVFUrAeXvFRhcSdI203sBHpnmk4Iy6gbjy+dHcwhgpfEdiNai4jwOFUsk+LRa0HK67Z5mhnWgBwOubrwFwThVAf2z2ibrE5ngiybgFd30jRcbxrtcWUDMZuK5/dBJbMBGOMQvr8go6OnrEzX897N1zm9ovmNTKLFmzixguBllSBMPKrMxGGGdxniU+h8WwFP0KPzvRtapJQk61A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f96c819-7a98-4d58-8b00-08dedcf6a145
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF63A6024A9.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:41:36.0391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tk+rmTGm17R5PH/oAL6+sFkGtY6vCMANTSxlQkUl0i9+i5sTptPfKvrJgtA9lVI6V4n8wpSYQIGAucMEZjZ6KsTbVE5dsGXyb1zkaPVuBPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
X-OriginatorOrg: intel.com

On 7/8/2026 3:07 AM, Linmao Li wrote:
> Every platform driver can be forced to match a device that doesn't match
> its list of device IDs because of device_match_driver_override(), so
> platform drivers that rely on the existence of a device's ACPI companion
> object need to verify its presence.
>
> asus_wireless_probe() returns success when acpi_match_acpi_device()
> finds no match, leaving behind an input device that never reports
> anything because the notify handler is not installed.  Worse, when the
> driver is force-bound to a device without an ACPI companion, probe
> still succeeds and stores a NULL companion pointer, which
> asus_wireless_remove() later passes to acpi_dev_remove_notify_handler(),
> leading to a NULL pointer dereference on unbind.
>
> Return -ENODEV when the device does not match the ID table.  This also
> covers the missing-companion case, because acpi_match_acpi_device()
> rejects a NULL device.
>
> Fixes: f7e648027d7e ("platform/x86: asus-wireless: Convert ACPI driver to a platform one")
> Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

(no issues found)

> ---
> v2: Fail probe when the ACPI ID match fails instead of adding a
>      separate ACPI companion check at the top of probe (Rafael).
>
>   drivers/platform/x86/asus-wireless.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
> index 2b494bf3cba8..d33853a1baf3 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -155,7 +155,7 @@ static int asus_wireless_probe(struct platform_device *pdev)
>   
>   	id = acpi_match_acpi_device(device_ids, adev);
>   	if (!id)
> -		return 0;
> +		return -ENODEV;
>   
>   	data->hswc_params = (const struct hswc_params *)id->driver_data;
>   
