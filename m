Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7818223D7FB;
	Mon, 31 Aug 2026 02:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788142133; cv=fail; b=abdqO6Cm7sbMp/bGbisPwd9MDIOttQAX95+7OP7p/hyQnfjvgHTdFWfuzH0WixbqFi594Nq9EBqW9kjwwydtbkTJu2MxNU6W2PlWY65wWAWCsks+Hdguep49Q+vzw2u5fv4je7d6o25dWYwDmDcoS0reXmLf/N/u070hxCGdYEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788142133; c=relaxed/simple;
	bh=aAwM4Wij2QVqZRdAbZD7ou9931r371/tgD48FL8XoTY=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DPzV/X1WJ6QzDuvpS+NhA++JV4mUHzD5Vfk/DuUbgg2AJNr6prUF3gFuyQIs5fevDF2xWJI4IUlPxwWWyreykqOzOGUkk9Pu+58C5IPmrFluBM1dutcdhNngCYNGq1mhPQwQIAqF3O8gPmGpypfEKl56BPexCzgTkXxXF8DYY3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERcZA0If; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERcZA0If"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788142132; x=1819678132;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aAwM4Wij2QVqZRdAbZD7ou9931r371/tgD48FL8XoTY=;
  b=ERcZA0IftiTUeOq2Ijmmz4DrIw6guxg/04k2y1f6sxRJYnD3hIlcWLIt
   U+CWxCptcZHUr8EdDB6dqFcQD9gjbVWR02JbdiUdYrYN1y1HFp+DJLObf
   XrhnTOv3mcTDOjocuw+1k4Zpc6Y3OfsnjXC4Z9rSE7RRCi/Nhhw8nWEBL
   I66YQUsR/vJhPRdYc/H72I06Nuqmsxa7h9AZarsO+L6rZJgPu75jq5rUT
   +o0t4U2tcD8UFJaLiiqqusO3ClXGXND2snBLeRUsSwnt92DII374+wl1H
   Fs1IYhriu8jKG24lBzZ5m/c9ZrHWxmtZyZN66RLgs1RcaTon5ujT6q1DD
   Q==;
X-CSE-ConnectionGUID: fk6PK3RnSdyy5gp1k5HceA==
X-CSE-MsgGUID: LKjdnK+pT2CGg7UUaM3dyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88395686"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88395686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 19:08:51 -0700
X-CSE-ConnectionGUID: Je7xHZtsRN2CAtGWwpAtNA==
X-CSE-MsgGUID: 1AmAavz0ROypoCvmVzVlWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="268703591"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 19:08:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 19:08:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 19:08:50 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 19:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPUvT8SXmysiOt7vfUHeeszhHPIY0A0L4D8SKnlDDRGWwLyTZxA5DCanQKVM+65pkD54h58BAhj+HH/KFzz45O6HhOKsUU+0Xza141tdSxrkAL74V9l8WvbRZsHLmviAO0DCQEETlY+UQBV4FbbEVsxeDeN4nlJOthWE3ot3tR+WwocC/0wLIeyb0Vv2Zz3PF++PvlQEqQEAT2ToF3tPhSIIU+foEERriuMvnGUPra/F85fg1w9gNHas14jgRlE6PCQqqQp7DZCeRhea91T0E4qd+dAFwV/nugV0RNS45XoMXheECVvoFhBZ5TPqFveESZ84/LhqFtGJWuBRjQp3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCpx2y0ANrK7qQ0evtYzwJp1fje6mCb33t43dwgjKBk=;
 b=QtcHSt8YfUSN6rp6zLgHrZCrstH38XtL0M+MohXavVS6XLBGfxmbMLTOEIeztgCUVtMgQmzE909Wn1c2w16gchcBSG0WXmrUfJk6z435E3mpuK8nV5IJ7yUN8D3VIlM26fRFXg/T8EcLK0OsDo+3+2ISPeIAbrd+Qhu5tn1Ifwnr+LFqwZZiPCFNNClhD3OI+TO4CKba33VyjDvxV2rm8zPVJ79Q+L1STw5r2CFsYQC+ox5JU+ob+Z6UXu9TlnhIVTf+WwiD0qFupzw3NwHwBX/aVNRuVqo/9l5ZsaTMnEZMJbj3Rvd5GH5FcIQl+g8FT95UZba8j+9uZ8YseRsX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 02:08:47 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 02:08:47 +0000
Message-ID: <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
Date: Mon, 31 Aug 2026 10:08:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
To: Mario Limonciello <mario.limonciello@amd.com>, Klaus Kusche
	<klaus.kusche@computerix.info>
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
Content-Language: en-US
CC: "Badole, Vishal" <Vishal.Badole@amd.com>, <tim.c.chen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, <linux-kernel@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	<platform-driver-x86@vger.kernel.org>, K Prateek Nayak
	<KPrateek.Nayak@amd.com>, <ricardo.neri@intel.com>
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0058.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::17) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CY8PR11MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 7799ebcd-7d20-4f74-ab69-08df0704caee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LIwMt9fI82uUpa65pIZ7XCMJuWq8iBx0/n23G/3e0fIinpsCvQn18rciQV8yImFzYC6F3WUBHKt2HnEAMHaDePcw7eOqnJqGLvFkOu6/6omHJBn1BTy6j2RE1RxTBRsNnMKonHl6U5R93VvVC6ZW5Wcp5M1luGJ/fJeWGOD9kVZhBrG0bWCDTO/2gPyGqVb+9ckOIgz2cE7Ab7DEkEOUfnSbFrt+4X0MLQHSJExyzItrV6uWvCS8JVkt6R1sjqqqilx6PYiN+glfk20gZsBV89FvZyrfwkJDK5z1WIoYVcXorwDewPvS0dI9r7fsHbM/FF5s1nA8YfLmTYLMIomJ9nt8j2k/D70v7Ca5JBHdamiP1Np2AGvMYsbXFW+m2gf6nPzLuii2rirN9sjkHXNS9h2N4G+MJC/t+ETv9HJX/FPCI9Ja5mhSZhUSN3qZ8iMhnx2AWYF1HFpFXPNHJsF1n9Trm0nTDj2B5BDfcL0vd26qoZsaVGidDUYXYmvFovdhjc1IXsLJXY61iQpNHYR0HF2Bpn+wy2TvO3lggjiGzYzYyKSzfAD/KrpQY7PrVJDrS09oxjX2uD9yT8MTwBCqiPkuHppVBNUc47MNfJTDrzoPIsw1qRF+jFqd3AoL+2tEpdMKckwrIqt2g2JM14ZrkbkaKHMR+rE2dUZ0nsDUA4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWszelRNN3hNVWRTUUxyazZkcitWblIxZTJpQXN4S0dTVEVraVdnTUFJWU9D?=
 =?utf-8?B?cGlGa0ptYjA0dzZGTEZyV3o1MUlod0NKNS9RZW5oc3VLQzcwOGx0SlNydzcv?=
 =?utf-8?B?Wkd3VHRFTDV0RDhod0ZtQnUwQWwwNjl4d0VyK0JhNWtYZDM4QmpiMWo5OFNy?=
 =?utf-8?B?ZDdiK3Qyb0taYjNid0F6d0wydnhKbHRldHMzZ2JoekhvU09sM3ZNdmV1bHlI?=
 =?utf-8?B?Z3BpOFZjOVZzWlovU2I4U3dKWXZVazIyYkZwY0ZPU2VocTVHV3l4cGdaTWpN?=
 =?utf-8?B?ays5V2pYcjZUaytCRkViSzJycTV1N3lTT09DWG9Oa2pPQ0dpUXhWSlAxODln?=
 =?utf-8?B?Wnp5WmVWbVJMR3ZPS2IzVlJNTDkxVWFXemQ2U2FneTErbi84SHZOYzlDWTd3?=
 =?utf-8?B?NDZrRzJwK2tYcWZpRUhFVngrWFFrSmpUQnlmbS80UmtFWC9HN25GVStJS29I?=
 =?utf-8?B?c0lZU085RGlNblhtZUtZN0JkV2VYWElPa1c3SE9uanNTZTdNYnMveEZvMko1?=
 =?utf-8?B?Zy8wSlRva09NUXFVWXpZWUUwVFpZa3ZkWU42dzBab2Z6MmdGSnlDS0VYNDI0?=
 =?utf-8?B?V1FuK0xMQjJrWGNGajE4T1JHVmxyRUwwc3MwZ3VRYmZNYVhYQkdPVWVFZWpt?=
 =?utf-8?B?NEpKOFlwdE9qZUo2MGFLUFdBd2ZxeDBqTEkvaEdIZnNvYitYQ0RkYTFiOFVL?=
 =?utf-8?B?ZHFuR0xRUEVVbXowNXZGMm5XQndaa0hUS25vUGQ5a1hHdk5jTW9EOWI5REZa?=
 =?utf-8?B?bDRZamRic1FYcEdZRHJKWlBKSW9WbmV5NlZEY0gvVjBEa2tMT2k3Um50TkZJ?=
 =?utf-8?B?Nk1xeWRxTVhPNlVpUHcvbmU5bC9oaWpoakk2ZjdkdVd5S25hQm94SnlBS2JM?=
 =?utf-8?B?cWhCM29Ra2hFdDNtTmU5dmFHMnB5aTV3VkNWeW45ZnpDMlZhZzdzdy81TEpj?=
 =?utf-8?B?TU5TaWVObVplSy9hdzdFZENZNm5IVzlVLzNoNU1iaUcvaU55dkIrYlR0UU1k?=
 =?utf-8?B?RXA0eHZyZi82cHhzQStRN2FhWnpyckM5M3F2Kyt0R0dSaXRvQlZQbVNuR3Zz?=
 =?utf-8?B?aHNiWS9EQWUwYzBRVVo2N1dsbUsrb1dxbUFBTXhZV2xGdFU4d3ZwNnRKQlJ5?=
 =?utf-8?B?SDdXcGxxVGNrSDlSdDIxRmpWWkpYSnVtQ3ErdHhXUi96OGFjWUdkcDcwS2ts?=
 =?utf-8?B?QmtLZTZMaWJUOUI1SEc3QkhpcFl5RkZQc3hReVVaRU9ndG9qNE9RRE1kOUVT?=
 =?utf-8?B?VFdVUC9MMkovSHhleDZ6WHIrNGxsMDlLV3h3NjVXV1hjY0dXSUFkOVM3d091?=
 =?utf-8?B?T0JrUURHd2JCVEFTeDFXR0ttYmcxMFJhRGhHQXRIM21aKzVvdEtGazhrSlJR?=
 =?utf-8?B?R3NRQXRRelpKRHRmNk1HQ2FsZUlmRGExTkNyRDl1VllBek91eGNUeGloSlF4?=
 =?utf-8?B?cVNlSjRQRkZTSVQwR1lEZXhlU09URWt0aFkrdS93bEY4eTUxUmxyUzlESmtG?=
 =?utf-8?B?SWxWWEdlWDB6djZSV09HK2pST1BTSEdId2hDb1NSUDhRdWlNbjJ6RHExZzJo?=
 =?utf-8?B?V3ZPWEVkRTExRTUyOEI3anVHUm02L0c2OFEvSGxxRjA2VTU1S3VsTS9SVzFu?=
 =?utf-8?B?T1NxZmtna1BqbldtYW5tZkV4N09lQWVRaVVndWY5b1p1RGZzckVwR283ZXE3?=
 =?utf-8?B?ekU4UWR6WXhhVEJDamgraXAyeFRxNWVNV0JROWt5T0srakxuekk1am5UR29D?=
 =?utf-8?B?V0ZXMUN0dGlheExvVHl6QytaeDdpa2c3bC9PZHQwNjZDWmVoNC9kb1JlSGR5?=
 =?utf-8?B?TGxFTDc2YSs4SEZ3eVFJZ3FxZXlGVC9WeVMzTVVHVmFSOThBV2FESHdXVWcw?=
 =?utf-8?B?bUJRaUtKQzJmZmhha1QvWFYzazVXNzN0aVhVVjdMbUFKSUlVdlN1ejFKTnU2?=
 =?utf-8?B?MzYxYUorSVRGN1R1ckh5WEdtdC9wZkliNVErZ1ZpSTdUM3VLSzF0VkZ4UU9K?=
 =?utf-8?B?ZzVGeVg5eW5TMEJheldCeWx3T0x1V3VQTG5jbWtjd3ZOUXRKTkliWkNhRmhx?=
 =?utf-8?B?Q1VSd0VlVTdKOWFIV1V0SkcxYnY2RGlaVXVKNDdsc3NTblhENVJ3RjlGQk0v?=
 =?utf-8?B?VjN4ZmN2RFhzN0RRcFB6WTI0NDJwZkpWZUd6aEsyUWI2NnJHMEFHZTZuOThC?=
 =?utf-8?B?bTh6aVdBK1pFZS94SnZFVHBxdm1VZzRpbEx1cDAyaVdDMnNZRC9NRHlQMUVC?=
 =?utf-8?B?NkJjaXNiQjJpcldxeXZDNG5hRmN1aDhOb3J3akhtejhHTGdDUHVxaTludjBS?=
 =?utf-8?B?dUZmZXJySVhuMG5xbFF4NElxZFRIeEdHRmZBQkpmaWwrT0hRWk1mQT09?=
X-Exchange-RoutingPolicyChecked: MU75jRhlBzVsysT5CJ25tSvNlTD0MbQJzglutsz/ygsFUWNWrlU+IMWxmL1UotZUWIhpH3ElbyEtivwn9843cSvvx5CzE3fT7GS5ZU88EUkxyoxXuLlWRg0qgIdoRzRnZQkw3cF5r/uzLPsHOVXyBiIIYTarmRWGsbe2LlIKoBDqPf08JCWx7AMRKrqY4r2MFmgIrD2/Z8A27JQdwHAnAN2dfR8AMYMBDmVarytXo1WfXZBjqV1HsoUZWa7lOAN6s3ryRnJ5QKn1mf1/QFbL35cr8ZC/yy+j7I5Dmt4/bbP4Zjn6V5jB8puJNINzVOg+RHxnC/pQIrt4B8iB9bMuow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7799ebcd-7d20-4f74-ab69-08df0704caee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 02:08:47.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpLWC9VQuuvwTkfZCi3MkdcQr+zaNDDs0zell1dF6Djl5pU49cx9C8IBAVUPux2Wi3uK+6pJk0Rh7ERZdunBPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7730
X-OriginatorOrg: intel.com

Hi,

On 8/31/2026 9:53 AM, Mario Limonciello wrote:
> Add a few others who have worked on CAS.
> 
> On 8/29/26 10:42, Klaus Kusche wrote:
>>
>> Hello,
>>
>> I'm running linux on an AMD Ryzen HX 370.
>> I use Gentoo and compile a lot of things (including the kernel)
>> with Clang using full LTO, which results in a single LTO process
>> running for minutes on an otherwise idle processor.
>>
>> Before Cache-aware scheduling was introduced,
>> AMD's pstate driver informed the scheduler about big and little cores,
>> and the scheduler always moved those LTO processes to a big/fast core.
>>
>> Now, the cache-aware scheduling takes precedence over big/little
>> scheduling: All big cores form one L3 cache domain,
>> and all little cores form the other L3 cache domain.
>>
>> When a process is started on a little core (and LTO is in most cases),
>> it will no longer be moved to a big core,
>> even if it runs for minutes and all big cores are idle.
>>
>> In case of LTO this hurts twice and badly
>> (slows down LTO not just noticeably, but dramatically:
>> In total, any compilation with LTO-linking takes much longer
>> compared to earlier kernels without cache-aware scheduling):
>>
>> * The little cores run slower (3.3 GHz instead of 5.1 GHz).
>>
>> * LTO linking is very cache intensive,
>> and the L3 cache of the little cores is only half the size (8 MB)
>> of the L3 cache of the big cores (16 MB).
>>
>>
>> So if a big core is idling, and a process on a little core
>> is long-running, big/little scheduling should overrule
>> cache-aware scheduling and move that process to a big core,
>> even if this moves the process to another cache domain.
>>
>> Greetings
>>
> 
> Not so sure if it would help this case but I will note there is a 
> debugfs knob you might be able to use called aggr_tolerance (it was 
> introduced in c1e7fe5e75ed11fa85368e5a186472afd3858f3a if you want to 
> read more about it's background).

Thanks Mario and Kusche for bringing this issue up. Yes, we can tune Cache
Aware scheduling via debugfs or even turn it off. The issue in current code
is that the cache aware scheduling overwrites the strategy of asymmetric 
scheduling,
and Ricardo also found this issue previous and there is a patch to address
that, by honoring CPU capacity during cache aware scheduling, for the 
**misfit**
task. It would be helpful to see if this patch makes things better:
https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/

thanks,
Chenyu
