Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1AF3EE1C0;
	Mon, 31 Aug 2026 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178256; cv=fail; b=dOduzZ17X9lgPrcL3Oz8KycHfLG8KmgYzDpgq0+rUGexXtO2ZgCtlqZS1+qsNicg4+RG00yBCEoEZ2x+7Hb3jR7zpzvn9zv4ltZOrICR9lPTr9Lg6a7929v87brKjUa5/wz3wQdDumub9MqWdQjL3J0O/vfRmE33busSREu5/A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178256; c=relaxed/simple;
	bh=DgVkdaA9M22rxVi+siJylA9bBDOejD2U7ArOVZvBAdE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ICYzMHIdmZ7OloR2TO0AqoJQ3DZiyR2P7vC2X/oYRGKlzaiapEDk9uDmeVTzKsS4BDCJqaax38eeJW6RAop6g13LIO16hmEcr2no1mkjJ4sUbbAvabFi0KSVjMAzXmDOWPV6syXeDtJ4Js1fAHZ9LG+gNCrMZLnsuehAm90i2kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHmDBa3Z; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHmDBa3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788178252; x=1819714252;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DgVkdaA9M22rxVi+siJylA9bBDOejD2U7ArOVZvBAdE=;
  b=RHmDBa3Z7+oQmflyHxILFinXh3CUT9aVa6buRcFYpbSDYGltNLqn3WY+
   fELAE6aXA12dfh38BPBVCYJDot6F8akydTvQs5Do9WHnrrb0FR+l8aUcD
   PRu+c5KROqc7W3DhLE7uQGdMSGWrL0pFYMHh8fi1yZX0C7RcjFSKbiNzc
   hRJy9RgCmMpDQe2HPJfFuXU9yP7hOBKYihrauanNStFyDAAKiMLN7aPXM
   wRaC2u+6nzucLP/K2g45Sws5Df9rZUnVZQoAzs5u2rszhNVqmd4232Esd
   RmuUG1MnCOhWio9xPqaMpCezDl0yc3SSZgu0hqrfSmOfKNBvZeychxsP1
   Q==;
X-CSE-ConnectionGUID: gjcskRnHStGdR7CdHt5ZDg==
X-CSE-MsgGUID: GhJp/OxHSN6w/Mbbg3urpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92450231"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92450231"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:10:51 -0700
X-CSE-ConnectionGUID: TbM8snLbSEufNkEvcGcZbw==
X-CSE-MsgGUID: kDS2KEsnTwWqYBEtHFGWoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="268827586"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:10:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 05:10:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 05:10:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 05:10:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6GF6Ask3CTnCOpCXO8N4Z0EhEzIhD1YFDUR235Nukeh9my1obzDd3s5XLGRGluzikXMZeSvQD02kDBW5N5qp2tYjaFbKtRYBiW4HqdCQD3TTrrCJKJy2RQLbdUV06MDNsrHzSv+rSvfPPg5zUE1I0jDSOQMl5IU6ffeYWJG3cAxVvnPaH4h8Nt3kfJKfaKdrgRwEJEWE7HENPmhg3h3esRO0cTYSL0GmHIuWhSkNtrOyjhWwDMNhD3Kb4y1Ph+NavaBgE79I5qmGVtOWelVYmnwhlGLqYCaCGE14quePYzYBdwAmhcg7X+VefrbnXZnKm4ho+db90RE1MVjzaUhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEYOKeaTic09MykWnkO9nqEZ4lKoGf0SUubQygGkfDE=;
 b=r0Vqbqg1QEREa3OTpNpjhwIwG1e6otnpabg9T7y2ezgX+QAwRiIqS+yeUd6MAKlZJjZwJeyBQWIVQYkAroZEveVPSai3XH4n2p2zPCzZhAYZbI1SLcXTKrRvQOlBMUUIBJO/ZnlbHhuVST4yP4gg1lTByYMyj+aqWtt00Ul31F0O7c0r9jh83F3akegBNOfUc/vCR5XoUqUdaTX4BosRtELdzKfT9VprFBZDqGT6fI7OJleHI6hVgR92FBgmbzoIgtfvut6rNsZDJnKM/v11kVM6iI8339buujoo5NndahiAp/7I0x1bczcotIOAqFv6YyILnNLRXKLEbV7A8eSa5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by DS4PR11MB895587.namprd11.prod.outlook.com
 (2603:10b6:8:53d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:10:46 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::ed8b:1455:8b29:144c]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::ed8b:1455:8b29:144c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 12:10:46 +0000
Message-ID: <0ebc889d-766f-4bf0-b590-51be61cc9a8d@intel.com>
Date: Mon, 31 Aug 2026 14:10:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-laptop: Fix ACPI event handling
To: Armin Wolf <W_Armin@gmx.de>, <corentin.chary@gmail.com>,
	<luke@ljones.dev>, <denis.benato@linux.dev>
CC: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<royclark086@gmail.com>
References: <20260830235058.324140-1-W_Armin@gmx.de>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <20260830235058.324140-1-W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::16) To DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF63A6024A9:EE_|DS4PR11MB895587:EE_
X-MS-Office365-Filtering-Correlation-Id: ff4a14b0-53da-46e7-2085-08df0758e35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: d/DGtBawXms/orppuXTQG/VBP2SmDNJOu4q7FUhgaSBW2BgGp2wETx8Lvg/QORag3nGxQKCyfwaI+upTJ2g0P75aFa8gJc9CQWFlw6NAGQ9El5ptJsZYhAQjCVeGb+251Cm07GmS/APIXkzkLDowHtHYNQKekkLSBi+Cvt6ikZoG19ejHxKPymUHi5o6AvWrwEN4Co5VwNrt7rPNqanAvKsBJmCevlX3ti5PEo4f1tEvEZMCkGtC1aY7M/+qrk4smL55GspmoxMSzs9GlgM4cuTupzN2FNQLIGkhuZebzL3ZkoZdOxkxje6RQVpnZhQ5eWyC0YI8fzVc6UQwo2WfkfrbjNV/QlV0hW5Lw/4J+U0nUSlFrIbVKRt9wnG2qW5d8rucZkQNts6foovRJHvWxnotn67neTubo0fwkgDaPe5rQjENla+jy++000rm87kKE3+48mFPaF9cGJfjePYCaiJfpQeOO+hsdh0b7WOvxFtcP/4JuwHIXaznHDse8W1InwqAjktO3qMhYDzSr9YXi0Yfkx3ep1sJ13x8kCkLeTnLCeOb78AAUtjb40vI664fPw3Pf66/HzY04R6NFLCd+9UfllTNYBrXukWtl/bNm7tpdRRFdWmcxuTyfX2OFtTXgXDeJ1qzVx/WfNESxK8BN3YlMFpQjquYnOg0fOZpyqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWNQZW0zaUVIZjM0N2RCZUh2R09MeFI0YnhNR1lnYnFYUlV3dk9WdGdXMUor?=
 =?utf-8?B?TjRyME55Q1ZPS0tsdU5CV2NHK3FTVXV1aytRdXBaOHk4aURTd04xSnY3NnVy?=
 =?utf-8?B?RVB6UkJBU2NOR29GTG9lOEkyWmhUUnpEZDZ0UXZpcGlaaXBPeVJLT1RoZkEw?=
 =?utf-8?B?WjJIQ2xJZUJVelVZMnBCcnAxTDJaS1BkOE12M0RpZWpmVXVoZUhnSHQzUExJ?=
 =?utf-8?B?TittYTZrSmVvcmo4ZEhXcVMwdloySDBQbmlOQ01qdzNnV1kzaTNONjN0Uy9p?=
 =?utf-8?B?aTNZaGhUNG12Y1luMG1naVRkVm1pWGR6WDNwQjczbTVMdndiUXh1WSs2L2Ix?=
 =?utf-8?B?VEYrejFReVlwMTI4ZFJqSjRKVjdOL1h4ZDZHZHFkOVR2dFVEZml5SzFmYTU4?=
 =?utf-8?B?ZUJWMnBGZ3JKK1hUc2doem8yeE1rTHA3c1lKc1k3UmFpaUFHTWxUcEJPTXpt?=
 =?utf-8?B?ZGpuQ3VEQURGc2VLNmZpaHpYdzNZQVF4M2JLaURUM0lwamlOZ0h3SUVyYnhx?=
 =?utf-8?B?dk1YTXljZFJGbytoaFlFczR2dlMyRUtBN2lyRFVQVjkxa0NFZFBhQVc1K2wz?=
 =?utf-8?B?eW4zZCsxNmRYclJzVmxzaUhNTnZOVUg5Y3lKMGFsTDBocXQ1R3N4WEozY3Z5?=
 =?utf-8?B?ODJsSXdGanNmNDhZYktyWXJQczlQU3F6VTIyeWVvK2lrb1JqdFdvZDk1OGdC?=
 =?utf-8?B?aG41Y2FxVlRYTTRSTnlUbFlTRS9CMnB4elRmUTM2OWlCSjVwVk54bk9namhs?=
 =?utf-8?B?dGxpTW9RbWRtd25GeHE2RURJRXU0QVBDZW80TmtBaGZxUlpOOVRRZU0rOTRi?=
 =?utf-8?B?dHRNSkQvVk9SUFE4emNqMHI3ZDVuQ2JPelBVMFNUNHpwcm5jU2hjSnd0Zzkr?=
 =?utf-8?B?dEs0RnRRTFF5eGQ3WEl1SzJTTVdVckRBUnlYeTVXdmRkYmRYRDZFMXpDNlhM?=
 =?utf-8?B?dGppUTN3R0Jaa2tubEZCTjljdzNkRmltdnl2L3VxbXVtTDBOWHF6UG9zMHhS?=
 =?utf-8?B?Zkcxc2xaZmZUNW4vK3hSdTNuZTBjblFlVEFoQTJ1aDVUQWMwQjdhVlhybTE1?=
 =?utf-8?B?QVE4NWRUYVNLN3JtbmtDTkhOT3QrdFVWcFdaOExLaEphMExWcWhpSDlLTHZ5?=
 =?utf-8?B?ZExrcDdOYzJ2a2xGci9LOTdRbzlpTXorNkthcmVuSjhZNGZlaFdJdG9tbk1C?=
 =?utf-8?B?Z29WVnJMUHlQaGlDV0o2Skk4US8xWFdPeHJRc0lHanI5WURoaElITEVEV2t4?=
 =?utf-8?B?dmF6eGZoUlViSWdaU3VFSElrNnMzbkQ5SDNSQlhxUmwvcXg0emRCNE1QTnR1?=
 =?utf-8?B?NzBzdVFXUEVPRHpROGJHSEtCa1J3L3hwamJrdEhjdUJKSWdHYkQ1Qm8zencx?=
 =?utf-8?B?cTcyL1RVR0tQWEdSY0hrLy9MVFlld3BBTEI0Vk9iRnpIcERkcXRJODhyRkpJ?=
 =?utf-8?B?RldiVGxLWjBFN2t4NDBsbklDbVdjK24xNXFiMDdXSlR0Nk9ITjJKaCs4TG9m?=
 =?utf-8?B?OHFNUTIyK1ZsaUo4UFlmckdiYnMvTlduY2liNlBTdVpIenIrSXBaUWx2aDdt?=
 =?utf-8?B?d2kzZWRUNVhkOVplQnU0bjBrb2lONWY2WERwVWpNRDNiL0JoOGxiTzNKZ3V4?=
 =?utf-8?B?ZUoxQjkxSTgyN2Iyekh6RXFtU0QyY1Z2Z3hOLzVqQU1sVitHU3RjbzRmQVJv?=
 =?utf-8?B?MUc5RzVNWHpPd2FEbDdLYnRUMGViK2pZQWVsR2E1UkU0VGJ0S00rWStFMlh6?=
 =?utf-8?B?LzB5UVdZMUJzUVlEV3F1akRhc01zeWlyMUVDcWgvMEd4bm1MNzdKMmY3S1F6?=
 =?utf-8?B?cnlXdDV5NmtFekJtb2xib3VDM2thdThOcGlpRUFVaTk1TzhYb3dCZlRMcHgr?=
 =?utf-8?B?NWN4aGJrb0JGVVFYSnhUeUl2aldlUWJtRjl6VEFNTWdhdlNwRzRneWt3UFVv?=
 =?utf-8?B?QnJwSkdSMVZPMjBhcWZVOVVnVUxWczlKWHRjQjFUMXIzenlPT2laVDQ5alpz?=
 =?utf-8?B?cHBJYVRpMFR2OGsydHFwRWNZd2JQMG5zR093L0RLQzhzQ3psQjcwWWo1RUxW?=
 =?utf-8?B?aTVVVjVqbXFLbGdGTlhmM0pJRzlVdWxaZnRIOG5FckFERDlqWUV1TWFDWk4v?=
 =?utf-8?B?c2V5a3BKdEFiRDYyT1M3NGIwSEpXOGJDdEpPMnNWOWt0ejhCOGxqdGg0MGpl?=
 =?utf-8?B?Mlp3OGY3M1o2Q0NSeVJGU1pNR3dyZ285TjF6Lzc3TEpzdGFjb2VlNmluc05q?=
 =?utf-8?B?WFpIK1owTHV0aDdvclpxamRKaVNhRmhIMzVaMG50ekJic1lNdWJxYm0wUXNZ?=
 =?utf-8?B?YjllaDFaaDhpTnkwOG9qdEVvUzRuN05GbFNqNVFaYVkvOGUzQ3NDOUhpKzJw?=
 =?utf-8?Q?ESUo6ly9Zasow5O4=3D?=
X-Exchange-RoutingPolicyChecked: FrRkIN/CdYgHY1F65ltYmslLybGVs8AiNfESBT8GWo/ULm4SUw6IsGx+Hdh0nEl3RO/0/Ax7u7zE88uhe4hDKDeEI6xke7UexbE2G/oLUYCHoUODxZUrxHWVZpNx5Ydsm9FFEtZtOl8AQT2F4qpjUtB5fkqebxve9wkxVN4CFCcQFqu3WrN7AICtPUcGFeIrgeTe+ra82AlBVG/CZP3T0LEqR+u+pPaPizVzRG7iOJRZkUi6+o5wDNR0CPzL61hkOnmj35/4ymJHgE0rDBc7WbpFDDmfNtlsJhnGccS1JvFZPdELjroQvoy2XlCqpa2eO1XyqRhQ/9mnXOYNzizkQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4a14b0-53da-46e7-2085-08df0758e35a
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF63A6024A9.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:10:46.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0T54hutQml7FC7LNdXqdRN86VgNzXwoKw7/6OYk4jGAHIO+5VUwUc5RMWSbujRoQnmzSyXSANQowyUoGnBKnVcITDqds/4JpxLXPqSek8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB895587
X-OriginatorOrg: intel.com


On 8/31/2026 1:50 AM, Armin Wolf wrote:
> The event codes inside asus_keymap[] span a wide range from 0x02
> till 0xC5, but using ACPI_DEVICE_NOTIFY prevents us from receiving
> event codes below 0x80.
>
> Fix this by using ACPI_ALL_NOTIFY instead.
>
> Fixes: 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler directly")
> Reported-by: Mo Jun <royclark086@gmail.com>
> Closes: https://bugs.debian.org/1146124
> Tested-by: Mo Jun <royclark086@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks for taking care of this!

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>


> ---
>   drivers/platform/x86/asus-laptop.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index 449addd1ac7a..79a575d0f5b4 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -1882,7 +1882,7 @@ static int asus_acpi_probe(struct platform_device *pdev)
>   	if (result && result != -ENODEV)
>   		goto fail_pega_rfkill;
>   
> -	result = acpi_dev_install_notify_handler(device, ACPI_DEVICE_NOTIFY,
> +	result = acpi_dev_install_notify_handler(device, ACPI_ALL_NOTIFY,
>   						 asus_acpi_notify, asus);
>   	if (result)
>   		goto fail_pega_rfkill;
> @@ -1912,7 +1912,7 @@ static void asus_acpi_remove(struct platform_device *pdev)
>   {
>   	struct asus_laptop *asus = platform_get_drvdata(pdev);
>   
> -	acpi_dev_remove_notify_handler(asus->device, ACPI_DEVICE_NOTIFY,
> +	acpi_dev_remove_notify_handler(asus->device, ACPI_ALL_NOTIFY,
>   				       asus_acpi_notify);
>   	asus_backlight_exit(asus);
>   	asus_rfkill_exit(asus);
