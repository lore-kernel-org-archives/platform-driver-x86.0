Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F972DEA68;
	Mon,  6 Jul 2026 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358997; cv=fail; b=fQoGAgdwpQR2fCxRTBLFK+QCVfFYeWi+ovqciiVjXNmBhN4DaerPK/oVq1+jugp5feuAB+GAgFGM+Iwp3r/S4eIPDybATRJoWDU3krVF66l0Zz42jd5MbZIVyKI34Vsy+E9JhmeizRKSe8GBTznLPO/461ulo7PQcIT8Of8cJpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358997; c=relaxed/simple;
	bh=6iwmTluK9qkOoOJgrkM3HnJqZXiwUPHoN2oR+MGKank=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ICD3AY+e+6lcvhtcpr/XV6R/x+j0bgyYqtG4vEatGYeZYdJVGv5Sndw3nqZjhbkfAu7w9TuoVfXx3Q+YGhTJXepeoWcOY2VoKTsERzuhNZHGT4IqLgDZablWooQI9qxwJQhloubYZY9+okrvgzVU5gzMov4FQLLYEvLUyaF23FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCaTOKUz; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCaTOKUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783358996; x=1814894996;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6iwmTluK9qkOoOJgrkM3HnJqZXiwUPHoN2oR+MGKank=;
  b=oCaTOKUzvnVzy5wsdFmSXowxCRwaT3yIHtjOtvAGjMh8KniLewcep7jR
   3lYia70Wkpa+glM6BZWzJvOb4/+CcyrZQMEZZSYuy9xAxzanHdpS3iaal
   jFwjDaqZUIlmdk9OKxxd7mJLipgssNzu7gz1gtB212RGeMSQge3KUGPtc
   oWAVgA0QOYcXlaLT9yJMdXSArOLooNMEb/DgyYAIzFzguAmQAiFbddmHo
   vx40YI4RBgfkfOBpq5d3bZzkWllQxlRz8HBlw16uRvknuGTbN1DRyNZIm
   vBx7MgamwLRQp+fjGB3SG35nQr4uJHAl7+9J8tuZTnGlZS+0lllQD9oMP
   A==;
X-CSE-ConnectionGUID: 0cY5fJgNR8aHJlJXWDtcZA==
X-CSE-MsgGUID: YTuZ1VcRQ6uHXgO8Ixef6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="86549647"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="86549647"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 10:29:55 -0700
X-CSE-ConnectionGUID: FT386yCtQf6rm2lrbiRGDA==
X-CSE-MsgGUID: bPouUt12RoGJh0KhCvKtmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="252026448"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 10:29:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 10:29:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 10:29:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 10:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXJc5xnoOXeo1qUkV4d9zNSAC7RxGGVWCCVRHIBtRk5Fse5C0tNkfZrjcloRpCCBcukiUMPWJGuSjFqMqZHAaaV6t+hs+48lcUQN1gGu/29gUe41ZcPJljO5MqlJ6yPeKipXhyMjvsXVfL2UQ8e8G17OEPUyV9ZT5mlG9U9JM8PhJtmqWU/GQdTZvRdUQuSZf0vjGttkyP8wxoa605wJMNW9AjEwXSz+YjSunvs1jjjqUsTokIremiJC3a0xb+u3DhSd0DUWxGMc88Wqyv00Cw5L36eVkU3kcgVGgVuhrjryxDinAi6aosljVd3m7//o0l2GxShflrArRJqqHmSzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8wi+ymhgo1Wmt9iLiy00hg+Onk7LhJSUX4xLxAr9TI=;
 b=kvvV4AhcbpW1JySkFvfC3wQwugUytpN4cVNUmEIajCoUQPjRfgfn9iG6aqz2S/IYLlsGADGM2MgwCCvYPxq+CYfm58Q/94yoZCeIPBuRW+rQDSyD/SMTifWRpKgpHr7hdoWmwRHyvMMPml/ppJVZLXx0ufEyRLCltCb1hSofyjsNLAJbRmGwsRjQ9M+1j9OTZvTWkSjJMnurZLbi+Cc+j3Rth6piY1hopbEgmzBtpD1JnUMiAmVn5xcVjYEB/FcT3nPQDheYmES5qrheQimpBzrqUDvK0tYNIJAyeo0oocNQ5F0ioSGhOvd1Wn75Twp8ncwp3M+X+N4RJCSxMFJR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by DS4PPF1B1B74C09.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 17:29:53 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::20e8:3969:482d:76e5]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::20e8:3969:482d:76e5%8]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 17:29:53 +0000
Message-ID: <971fe9bd-0c58-47eb-9a35-df085654df34@intel.com>
Date: Mon, 6 Jul 2026 19:29:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wireless: Check ACPI_COMPANION()
 against NULL
To: Linmao Li <lilinmao@kylinos.cn>, Corentin Chary
	<corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Denis Benato
	<denis.benato@linux.dev>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?=
	<jprvita@gmail.com>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260706024953.534671-1-lilinmao@kylinos.cn>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <20260706024953.534671-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF63A6024A9:EE_|DS4PPF1B1B74C09:EE_
X-MS-Office365-Filtering-Correlation-Id: 7065697f-02ad-401a-4fb7-08dedb843065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|22082099003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: RdvKtRMxWLo1mf34NQc51/BIXMxMMnCSuAb5lyWEICEss0aSyeVbu0QzFZXR7//pda/ZHQeitYyDkUTZTQVGhKjbshdOyCcIiyQWcKM4eUR8gnD5owH1uLVGL2h9UAO4qsoZ9dF7bpZc6j70zYFIHt++r4gXxB5bP7WXQP83x12N7mx/nFa52DFHC9aTTehOCnHCCPnFEwnbpNlAHOiA7Mea528NHVTGpG4pJhP9+YTN9Dz+yyBLNmS7ATfggENwtW2qd5oRlcfVBgB/zkipTCtjlTlcrwSH0pGHNn/TrOfsfYaQgGfy6c7Y6oXy69GxHXWRmpwq4PXoXazl7LfoS2fB/DbuSYlRnUtC9Mzf9w/9KtjhBMp60jUme1p/V2p2lTzorJ+iZwkfdLSKJq/Hrth0C+83SxRUIiGxnutTSW+sWYKD7X7b/NHnD2PXxi22s6iWHT3VXK3tin2Wy5wku61NpOatYblhgVGjpGPPDfE3SBI7mP4KnnKFSJpeEwLHA2/FCJTsBWhwC4PDD3qWF/r2HCCJYzgrFjStvAwvbV30U1K8RR7EBOrAJgTrqrTwvA31cn2DN1YO4nEAgsAd0SQf87GQq8SUr1GiVMJMFTj0pzFI8hAmOWCY0Ahzr/4BvTPJpwUxsW8LaeQgt8GPqCbh1fo8QI2M2BjvEp/qwnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(22082099003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODU2cjZGYWNrckxsYmJNNms1Z2d0NktwV2tRUmhWNnlvZDdKYUVZRVZPUkd0?=
 =?utf-8?B?WjJzaHFGMWJVZG1pZHFpNFRtY3lOUmpBTUd0TU15UFRkRUo1dXFtV0ZzTFI4?=
 =?utf-8?B?OVdod0dGbFUwenRtYTREZFhxakZyWEc2TW1oQUdWeStDc0ZUWjRHWk8vV3JY?=
 =?utf-8?B?dWRBQkF2eFRucGZEM2dUcXFwakdiR1R5ZHZkN3poUHQ4VFg1UEw0d2gySG0v?=
 =?utf-8?B?aDNLa282UnN5ZTY4K0lJLzZrSWZNZzBNZWdmdnM2UUQzaVFRcGdEbm84S3V1?=
 =?utf-8?B?NmZNUjQ5K3NmY0tGWlNiNUU4U3FESEF5WkV2YjlHMEtCd2luSmR4dnlEN1p1?=
 =?utf-8?B?TGtEYktQWkJpRFg3M25GNUU5aFIwTWJydEJteThUNE1aYWt1UHArNkxRQjNG?=
 =?utf-8?B?WGo0bmFCODhXQW9WRzgvK1FDdmRLdEVPMVcvK2QyVHR1Q3VRakt0RkhpNW5k?=
 =?utf-8?B?eHpaQ3FkbEQydFo3c0lLNDAxZklqM2pmZkhxbjJCSDM5YU90TUtjOHBFT2ZJ?=
 =?utf-8?B?eHhKZ0svb2tEdVlrbzlrdVozMEl5QTl2YzNDb1VhajYrbnpaZEUyM1lXd3Bq?=
 =?utf-8?B?VDIyamRBQk5WbFZTS1EyYi9Td05NenRXNHFQWWxtNmJ4dnY0Z0dXRDlSdStG?=
 =?utf-8?B?bE5ZQXAxdkJnYklIQmtRYjNQYjBJdUE3N3E2ejFsZWpEa0s1OE5QVTVRbUpF?=
 =?utf-8?B?cHArSTFnUThyRUVQeXloSzNBVFNpZ3E4ZWJDK052UVN4Ym8xWkk1VGFaWi9F?=
 =?utf-8?B?MTVqcTVPZnI0bUFUaVdnQll4bENXblhUU2poWnVWa1RVZU9iQmNkZGFQMXU3?=
 =?utf-8?B?NE9vQm10aUxXVE9qeHdPQmE2NW0za1hBNUVWT3Y0UVFGUDRqVU1LVSs3c2tr?=
 =?utf-8?B?VGlhZmQ4dVJyZGR3U3gyWVZuNS9WQXJGUDZ4YkQ5cWxzSndTa1ZFOHF1K3cx?=
 =?utf-8?B?blhTNE81NHNFVDQzOGxzc3cxOWFjMmNpU3BtVHA0U3Y2TFcwYmVPbkM2OUl2?=
 =?utf-8?B?NkJ3MVp6N1lnbktpeTcxcTRONXREdDNSU0hCV2ZCaUNvdjNvMmhTcWhOOCs4?=
 =?utf-8?B?RFd4S2xNejlQQXNDMExEMmZZNTg0ZFpzOXBZSGdxTG00VXgyWnM2dGx0dkM0?=
 =?utf-8?B?YjNCYXFGc2dhbEQxanpGQ2FMS1JXRjNzWlhnNGkvQlUxaW1saXRVSG0rbS8z?=
 =?utf-8?B?ZEl4Q25McUx3YXBjRVloRERzTzBlZjBwN0pZb2wyUUl5QVkvS1AvekdjTGsv?=
 =?utf-8?B?dGJ0L3RMc2pTQVVpNXRmWFVSdk92OCs0VnlCOWNPL2xqRlVnMDdlaDAzMXdO?=
 =?utf-8?B?dzFOUkMrVW12em1admxkN3NiOXNhZHVDNnNKUWh6SkdqQTd6WUR3UHh2YnNr?=
 =?utf-8?B?M1VqNUpNSitBRUh4WUw1UFF2RmptWCt0ODA2MHFFYTNFQ2hOdjhiSnJWdlVx?=
 =?utf-8?B?blZmekhMQWJLUnZnbzZvdmFiUEt6eDFQUzFkS2JrKzVSalBtbVdsSDVzbWZJ?=
 =?utf-8?B?bTdhZDhOQ0RxR3FWSkpSNlUyWGlSbk56ZGZCRGlQMm1SUjJQMUJwNXYrbzR3?=
 =?utf-8?B?TjU3R0tuSVRTVi9hOUFJWDNQbzNnTzg0STExNlZrSjgrK0VzMzZzK29FKzdT?=
 =?utf-8?B?MHB6emFKbUI5cnd1R1EwdGk1VFdyaE0vbGdNSDRudzhvOEhLT0hia0FDb05p?=
 =?utf-8?B?eUdNWnQ3RlU1aHBvRjZzT1dsZzcxcXlhOFd5VnlIbHhxWTdOdUdtekpKeEJ5?=
 =?utf-8?B?UXdmaDlhZktydFZJN3ZBRWpkL3Q3cDNqTjJzVktjdzQxMUMyeURhZ2M5bnMv?=
 =?utf-8?B?ckhoUit3K3BGOGdlalZ0ME9uakl2WU9Qck1GdFd0MUZycWxGdVFqeDZWS011?=
 =?utf-8?B?QitjWVlyUS9IUlltNDlXWWdqbGNLSDh4OElqcmVqUXo1MkRTZ0wzbm14SUNF?=
 =?utf-8?B?aDFQTHJZd1NiMk1Ib25GOGl4Q3hUTUhtUU4wQmZQNzF6bWNudzY0TW52SEUz?=
 =?utf-8?B?N3ZhSm5LemFXa3FUcitHUGtSTVFaTDFOanVydmVybTM4T1JoQVkrWkh3U1hU?=
 =?utf-8?B?aTNDbmxvdThVSHpNMWpra2NvRUtZZEtpQU9pdDlRb3JISCtnZ2tMMkZqb09t?=
 =?utf-8?B?VHJsc29TVGlBOTZjQmI3NTV4alo0VFJmMk1HYmZEQWNnRmRoUG5wbXN3eGxo?=
 =?utf-8?B?RTR1d3JuT3RQT0JVajF0U0dpTDcvYWN1MUNuSURnQUVQMmlxOTE4OGcrdXlj?=
 =?utf-8?B?ZEtrRHg3UmFUNUUzdlcrRzZiRmcvTDdGNGFHQ2xCZVhOVEEvL01FUU8zdnVX?=
 =?utf-8?B?UUp1M3dzWUhYUFBPdWgvSWxRZDYxWnpDVjROM2FLOUhxdFlZMUIrOTRCeXU3?=
 =?utf-8?Q?R+5U8hnSsqah97Dg=3D?=
X-Exchange-RoutingPolicyChecked: ZfjEEHJjt7QyBFrwdsgB6BcALKCFN2CBGg+KfnuFkBKoU7rTcuZfg6UgNjzIUD6poPmeeERmj89X/G4lOS+0kxsmOZ+wyitdYQ/gQO6no6COwlzBQGRHCC2wcLW2k+LPArNh2bquYobeOS0jfovoPTmqiBXTk4kSNzrPgrtuMuZJrcf5xhOhGHB4d7bhh0LIyyU1HoI6IiKjAe0j9pOLupFG+yr6W7UOVEWzoNZl1Y+o6SQJDnjcDFOnLmpuxaQN7U1At7iVwl+7DS6Ihl/YQey0DFVzM2Z2XU14+UiQaFu8ibwRlGpjjLY3XWRWw5Oifkw9RRTf3f3qWGMcrvgQIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7065697f-02ad-401a-4fb7-08dedb843065
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF63A6024A9.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 17:29:53.0023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYPB4um4eBy73bYqitTIgn+ePc8d8RG9Igf4CWFCWhpOGYwFVqmlI4DTdwGST0G8BEJhZhVK7qQxzOq3ATMTaPadtg9UJCymY08H2gH7uZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1B1B74C09
X-OriginatorOrg: intel.com

On 7/6/2026 4:49 AM, Linmao Li wrote:
> Every platform driver can be forced to match a device that doesn't match
> its list of device IDs because of device_match_driver_override(), so
> platform drivers that rely on the existence of a device's ACPI companion
> object need to verify its presence.
>
> asus_wireless_probe() stores the result of ACPI_COMPANION() without
> checking it and still succeeds when it is NULL, because
> acpi_match_acpi_device() handles a NULL device gracefully.  Unbinding
> the driver afterwards leads to a NULL pointer dereference when
> asus_wireless_remove() passes the stored NULL pointer to
> acpi_dev_remove_notify_handler(), which dereferences it.
>
> Accordingly, add a requisite ACPI_COMPANION() check against NULL to the
> platform/x86 asus-wireless driver.
>
> Fixes: f7e648027d7e ("platform/x86: asus-wireless: Convert ACPI driver to a platform one")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>   drivers/platform/x86/asus-wireless.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
> index 2b494bf3cba8..2a43d76a5d19 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -127,11 +127,15 @@ static void asus_wireless_notify(acpi_handle handle, u32 event, void *context)
>   
>   static int asus_wireless_probe(struct platform_device *pdev)
>   {
> -	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
>   	struct asus_wireless_data *data;
>   	const struct acpi_device_id *id;
> +	struct acpi_device *adev;
>   	int err;
>   
> +	adev = ACPI_COMPANION(&pdev->dev);
> +	if (!adev)
> +		return -ENODEV;
> +
>   	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;


I'd rather make it return an error when the acpi_match_acpi_device() 
call below fails.  It is not very useful to return success from probe if 
the driver is not going to handle the device IMV.

