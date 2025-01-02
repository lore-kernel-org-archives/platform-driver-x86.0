Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DACE43173;
	Thu,  2 Jan 2025 21:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735854036; cv=fail; b=p/GD9faDgkEmo1TBZah0/65hpNlB+ZVogjh2n3aVSdoNKEJ7JOtv+d47qgzMCTPVOwl3mP+7GXMhbU8ihDUghnU1/mwX0SYv0uJTA40VwpL38Cj/4mOclSBHXv424NDYa9lN87trpPo1wp0o5JWudwDEBBeX31szHEatZxjK+u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735854036; c=relaxed/simple;
	bh=EBoCMJbUqCn5tDOBQxQQgXjCFOvaDScnzd/7R+XxL8k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QX4tukLu/Ph1r9sa9e3rRgGw8+DqrpUS4RuX8SfhUQeBKGUev3FR3xh408JyCyjbamssFsMiephmOz+JLm1XRuCSeWm2+5clRBLYHUv8OEKdsE2Cw1l5wrXeh5azMDqSz69mG74yl5NU6a52Xh+1s2beHTMlHPHQtxlu4u1mogY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pchxk5h4; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pchxk5h4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735854034; x=1767390034;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EBoCMJbUqCn5tDOBQxQQgXjCFOvaDScnzd/7R+XxL8k=;
  b=Pchxk5h4XtxmrDWndqQTTCDJV2YHgOr1beXCdud9h7YabPANAkwcXfcC
   Ld0bkjexqhfqK9n9HnG3ipeJqoY0QJPIu02Ha/wZuFk8rt8yP0oDA8c75
   4pMIgF2zPpZrb2q0RSgdyRGaTYww8u1mWsokTPjW9kY2lIO4HkiLQ8DK1
   Mwbzqs7hEy2fe2YgMptjPooUlZEHHMlWH4oRvGK/Bd+4p2ya0mxDGbRLn
   GFFgsMb+GD6wgp578ntcpKngNuHUSGo3bX//V3TOUvwEyJcEm6ZZdeCDC
   35r1XHRApobXgpMAa+h91r16DW/FqNeFEmodak7WmZr+/2vyhBy5M0abJ
   g==;
X-CSE-ConnectionGUID: SBTlSwq/S/qrjaMWB8zFhQ==
X-CSE-MsgGUID: 0cdkAT8tQLe7YnklczhdRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="61479225"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="61479225"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 13:40:33 -0800
X-CSE-ConnectionGUID: 6fTvrTTIQ1Cej21MByxoiw==
X-CSE-MsgGUID: UpYtH4vcQLKuTHwppRsfAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="132469290"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2025 13:40:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 13:40:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 13:40:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 13:40:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+bjmxNcSMJ5ZXZ+seaB3e8+WwwJFkY13Y/oHw3aReSvDr25BNVbEJiMotwNA50tYJ9/Z7fGRar1JnGZWFHWwW2s2XKXpDZlRggNYBBiCa3f8Wah5PEZUQ/u5tZzFAXeUZzBSQB63zJDHiLJXh6rDVtzdjgciPHr+cnph6sXdbV7clWk+jHYTl8KTy1wAfeAVE9GfCUztr/gGj148nOfILM/5NthCVphQv+mrxl1N3Vu80g/hNAiHLamylCN9YIfHc/K8XLNRrUcciPEDAGa8BWwhAXJtJmocnPIwBn9uKAd1xIFunE9tVm1uqdY91SJmQpmAD2p3mc7rdaW2KEcTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oslvaVxountRspUxpeauEWjtqIfMzvzdVrhufG9QhUs=;
 b=aZRdjRSzkPUJ8F3HRyi29MiIqrPwJlT5TNvnYf4aHgeUg4Tj7Mb9mn2G+G9Yq75/LTYiHGwrTO/CSdLUk3sppYAu0dTFjy51CQjyS6M3D51x0SlB20YIGXRkBwpLrBakPM71gg4Uazu1dRkZ7qR0krfbjIFab5QCrGOH0iVgiG8fU1jaUhxQNO79WG3WqMYLfedTT8piq+91cL5gXgxyJoXt9SK0Bs9eAlE3gMWSF8fWeYFRTz6uqYVGURYa5Wmg2Wzl67CQL3CpW1OlHVWQZnj0rnlURuVNWl3PCzbvEsg9S+G7faCGiSrGy8vsKrXscSuzXiH16zrBen/ru6suMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5756.namprd11.prod.outlook.com (2603:10b6:610:104::23)
 by DS0PR11MB8084.namprd11.prod.outlook.com (2603:10b6:8:158::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Thu, 2 Jan
 2025 21:40:26 +0000
Received: from CH0PR11MB5756.namprd11.prod.outlook.com
 ([fe80::7c7c:a703:1c58:87b3]) by CH0PR11MB5756.namprd11.prod.outlook.com
 ([fe80::7c7c:a703:1c58:87b3%5]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 21:40:26 +0000
Message-ID: <eeb29cef-fb07-4bf9-9728-346a697ceff1@intel.com>
Date: Thu, 2 Jan 2025 13:40:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation to match
 current availability of firmware images
To: Anisse Astier <anisse@astier.eu>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Ashok Raj <ashok.raj.linux@gmail.com>, Tony Luck <tony.luck@intel.com>,
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
References: <20250102194358.33029-1-anisse@astier.eu>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
In-Reply-To: <20250102194358.33029-1-anisse@astier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To CH0PR11MB5756.namprd11.prod.outlook.com
 (2603:10b6:610:104::23)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5756:EE_|DS0PR11MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 093ee671-e43d-4f4a-c235-08dd2b761189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TldPM1pBNm5iallZc3Jnd3ptdnhVbzZKL2FEQmw1akJDNHluakU2VWlVS3U5?=
 =?utf-8?B?ekxQNXVmYzFmbTgvN1N2UHM0MnJYMzFMMEZ1TFAzVTVnS3Fqb2ZMZGtWRGFO?=
 =?utf-8?B?eUhQUUpJcEdLS1NoWnkwbCtoSGdmNVNPa2Q4UlFxTTZtai9NekU3RUUyaml4?=
 =?utf-8?B?cU9pK1FTQmpmTlpueDYzTDR5eHhLQ05mWDNPb2JxazBQTnpUeDd6OHJnUTFn?=
 =?utf-8?B?V2pPUS9pUWxUVm5tTFRoc2FURm9pdEtzTzRLeVUvWGhuWVNKK3YvQWc4Sk1w?=
 =?utf-8?B?a2I5RWRuYnk4amZpOEhDeVJYdk93OHB2dnpUMU1kbFZ5eCtYZjdlQXpTRjJD?=
 =?utf-8?B?YTM5bm5HN0o0YlkwcHhmWmk5REw3RDlka1lnL21KM1dMZG1ZaFNyWFRjS0cr?=
 =?utf-8?B?aWczRkdPVXBKZTBWdGRraU1hYVlqV2F2ZWcvbnhTTGdPTGJ6dE56bjE3NnhY?=
 =?utf-8?B?MEZDNEJ3V2w0VXZxZkcreUR6WEJvTnZLdm1TQ09FZ3pnOGlnd05EclZJYkVM?=
 =?utf-8?B?SmxhR2dLdFpjaWZhS21Zckw4b3FGVnJOeCtPdmg0S2tjTU9XcWlWMDdmOXJB?=
 =?utf-8?B?T1BFQWs0ZDg2bWxGcU1heFRGMGhOa05ub0tqMXRaRWRJWXlpWGpYQWxRd1ZF?=
 =?utf-8?B?ZGxaRGdRVnMvQlhpZmwwOWJoSG1IcUtmVGtzdm9Tbk8vQmpmYkVUN3BPaFRw?=
 =?utf-8?B?ZWU3RkJmREpJNlR3aStxN21WOS9Pa3pzVi9wM1ltd1Fiak8vU1BPZjkvVFBu?=
 =?utf-8?B?RmJCYUNIczJTL3M1ZG01akJaclp3Z1p1TmZWNnk3YnRCMGF4Q2d6QXNOUUtP?=
 =?utf-8?B?UmxuVUdqbkdiUzVET3U2bjVROERoaU11b2JQRVg1T29FbmFLa011RWR5UnR1?=
 =?utf-8?B?RzkwQVhQQmpVelBrOThPT1lKVE9hK2dBZFFyQjZrYVdVZ0FiamlvcStEVTR2?=
 =?utf-8?B?MTZoVHZuaFZEOVlDZVdScnlTU0FwWEpucTFkQWs4UEZnNUZFS2k3YitSOURI?=
 =?utf-8?B?OGZoVTZqQ2ZyNzVqZWtycTRpUzdGM2haN1ZVMWVydzBOTVFMQWxPKytKZVRq?=
 =?utf-8?B?Sks0YTR6ZE5HK2tQaTBGdDcwWDIrUUJCN1dnMnBKcUZlVlZTNXBieGRrU0Rk?=
 =?utf-8?B?S2tVRU9MQlk2VHB6RWZ5VHRKTmhsYUp4c2s3eFI1b29qMlNid2hvWjB1R3dM?=
 =?utf-8?B?MUFkcnhtM3MwaXI4S2hOa1lDWkJKU3lXcS8vNTN5SmRndGRpUloxaFZCOWY2?=
 =?utf-8?B?Mit2dEh6TkRvSXFnMDdlUTdKOGNGRjdSYW1MbEFzcE1nYXE2Vk5pT2Y2WmJl?=
 =?utf-8?B?WEJjbTFjaGFya1JUNEp1dXJ2N1BrWEJub0pUdlFQNFI2bkdReThpTS90d05B?=
 =?utf-8?B?TVgzRXR0cWFZMVh2NkpiSzU3b09UT1prb1EwQlN6N2k1OGZLTzBNUWNUT0Zo?=
 =?utf-8?B?Z0xaR1g3NldTdXlpZnc3dzBUcU12SSttSGIxSkF5eTBWb0FOSzFwTk56LzJZ?=
 =?utf-8?B?NmVTWEZLZm1acTkrM1JhOWIzVk44b3hSQSs5U2lCbFlHK0U5Z3YvZXQyaFNx?=
 =?utf-8?B?YXNWVXZCZjc2alBkWElOZm9pTkhpNktMR29xN3k2UkZQMUJlTTkyeXlJL1h3?=
 =?utf-8?B?WGlzU1FsYVhaRXgxVmxDTTdhV3Q3YWhZS3JScDNnME9iSHExQlNxUUJTd2FI?=
 =?utf-8?B?dU9LU2trWjJzcVJQVGxRbkJJR0RTOU1YYUFUd0hlZEFEWEExV0NDYzh3eW9I?=
 =?utf-8?B?NnZGL3JDV0JOK09JYTJxNCtQMjNoZHE2a2V2Z0dKS05rcnVCUlhpbUdBdTU2?=
 =?utf-8?B?MS9hVW0xVkt1QTUwcXNGWWU5YjZ4bW9adFdFQ2dPc29sRzhGUVk2K015b3lO?=
 =?utf-8?B?Ung2cldWZVJyVkFYM0dYU2N1eFdPRUpFL1Q0enhBOXN4ZGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5756.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0tWSUlMNEdlMFpOK1pPWFRHR2k0NzdKZlY5K0NjekJPSjFFWE1lcjRkNjRW?=
 =?utf-8?B?aWJ2dTVwUGYxbEpMWlNLcEU2WENReHFCNndIZ1JwRHhXdko2QUoyYnF4d2tT?=
 =?utf-8?B?SXVwUU0zVHF6Si9BMUFYNWZUZU9RT0pYenBBTmdLVmhJZ0o3MUdBMFFFZmZT?=
 =?utf-8?B?Tk5qbi93K2IwUGdQY0QvSzFvWFlOemtnVElJYTJ4N2JEcmExbWxRckpQQURq?=
 =?utf-8?B?MFRSYWQ5WS9LZjRUZ3p4UXFqMkwxNWw0Zm50VWJMaTRMREJxalFwdndnVi81?=
 =?utf-8?B?QmdWaHRaT3RQL0VhVVJ3U0YzZjk3bEhqVHZ6TjRoZThPMk9uTm5qZS81UGZO?=
 =?utf-8?B?ZGQ0Q21tTVJISW9qTEc3SXFXSG44TjZyVGRQQzErbnRNQzZwbVU4bUNhRENm?=
 =?utf-8?B?b1lmNzRVT2xxUWkvL0JiWnpZT0NERWdDL3I3S04yYWFFVzR2UkgxOTRPMzFJ?=
 =?utf-8?B?ZHBmRnlxWm0za1laR2daSkF0bUNqY3h3SUZNN3VhaW9ad3hFWU9nZ1ZzVXZN?=
 =?utf-8?B?SzJaMUFPWDVaZ3ZlU1NYQzBQQ2xKejdzeGI2NU9tVUJMellZT2hFbmVuSkMy?=
 =?utf-8?B?ZHlNUzhhTHM2MWZiMG0zcTluZHBvaW1aZEN0M1NBTWRlakNydjI4SWp3U1Ir?=
 =?utf-8?B?NHhoMzlLUEl3YkIwaUpHQ3NVQVZRTW1yV1Z0KzFmTTZ0Vkp2T25UUGZSUUJw?=
 =?utf-8?B?aDJPNWdvRnNMazYzRlV3Q3JqalVWS2RCSkRMQ2kzU2hSNEw0WDNwSldnMlYv?=
 =?utf-8?B?SlZRKzhiQnNOdUMvNkFBRTRFTkovT01VZExGL1BScHlzOTZiVzU0ZUVVU2xY?=
 =?utf-8?B?TmNkaTBvNFpMUUVPZGttc0czREY5VFdKUnBVejhPenhUUlFqa2toN3VZQ1lH?=
 =?utf-8?B?SmxERVBiZVhpRG5iRkF6UmpPQUVyaWw4M2FheDk5ckRtS2tRVnpId1ZDeTRr?=
 =?utf-8?B?QitLN1RLemUvR25hRGxhb0R4YnBNSG9DbVNtcU83eFFjUmRJZDI4cGhlbHJm?=
 =?utf-8?B?RC9SQWVLcSs5b3JkSDhudGFadGtYaC92Y3JNaWZWOXN5WXhtb3ZzM3VLNk1Z?=
 =?utf-8?B?TjZUSno1WDI2T0dyUnZqQXpqZTF3R2JZUERyQms4VG1XaDBHWHkrWWRYTldn?=
 =?utf-8?B?bDJFbVorWms1NGExZDdqREtaRklnbGhqVUdRQlBIL1hkL1FhdlF5c3ZWbXV6?=
 =?utf-8?B?VmozU2p6QmplYzM3bHQ3Sno3UWJGQnJhNUU2M3FTWVRFSkFMdUpITWttUXVw?=
 =?utf-8?B?b0JqQ1R3OURuUFRaMjk0SzlHTTdMMnRrdXpoWjhmZ3VyR1Z4Z0J6bmhKU25u?=
 =?utf-8?B?cS9pOGtjOGVnYkJFUWZaYWkydnVTMS9YVWZaVjlOTlpHNmdMNGlzdjZ4REpB?=
 =?utf-8?B?dXJFTFBSYzN6QWltUm5BVTNocW1YTGVGMU5VbnhiL2FlRFdQNG1tTjFzbzBm?=
 =?utf-8?B?cWNMT2N3ZkJDS1lKNndkYlMrY3ZIWDE5Wm9IczNManF1M2owcm1vcVJzY0x3?=
 =?utf-8?B?eVk4NVZQMjNweE5udmwyMnRhNkZYSVdZWDVlbjVVRW5ZWDJFV3A3TjVjeE1B?=
 =?utf-8?B?bXUwNGVLaEJlUmNidWlwSWJxUUNaNlliMjdSdVRmZmRnalg3alNhMndDQ0pa?=
 =?utf-8?B?MHRyRHFWRWd3S1JhWDNLRmsyRTJZSFhKNGh5eVZUS0VQQU9kTlVVc0g2MHRQ?=
 =?utf-8?B?WTc0TmpYSGx1bUgydTJ2YVFMcHRtZXQ5V3lSRkpmYUN4RWhLL2dIZEdsL3Jj?=
 =?utf-8?B?WHozY3RGbVdVSVpNZGpuRnlaZUdUNEpYZm84V3lEMnJPcDB3ZjdTMTJVbW1t?=
 =?utf-8?B?K0xmRnVRSWFzUEFDS0k2Sk9ZbVNRLzRuUXJialpwVFJWR05PSmpYTlg3M1N0?=
 =?utf-8?B?WFlsNDJCU0JSaGg3aU96M3lnWW9ydHRRSDd4WWFpTEFwSm9vc1RBb2xtTVph?=
 =?utf-8?B?bnBPcHJ4OGp3M1NiSml3OVI4YWpGSWxzZWd3WW5sRENReEMxdmFSWVdMK052?=
 =?utf-8?B?Y3VPMEdBSVJYRER4a3kwakgzZ1NVcWRzM2FqZU9qelplNlRJaU1ZM2VFMmJn?=
 =?utf-8?B?Rk1OSDJDd1pZVzMrMmRWY2NtMm9zMmEvc25HbFFET2ZmVEtNWWs4cW02UURF?=
 =?utf-8?Q?BqwcXj78IdXIwSBOOOqUsHjMX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 093ee671-e43d-4f4a-c235-08dd2b761189
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5756.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:40:25.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyQr6vFsCO0zeKeFMOVorDNg1dqNdbK/B4SpcxzgvsiTtWfiQXdTWnAwYNLMBKr/+QkCqvK1ZyvKZ+6WH37Lfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8084
X-OriginatorOrg: intel.com



On 1/2/2025 11:43 AM, Anisse Astier wrote:
> Firmware images necessary for the In-field scan[1] functionality are not
> available at the moment[2], and require having access to at least an
> Intel customer account[3].
> 
> Update documentation to match current state, it can be updated again
> when the images are finally published.
> 
> [1] https://www.intel.com/content/www/us/en/support/articles/000099537/processors/intel-xeon-processors.html
> [2] https://cdrdv2.intel.com/v1/dl/getContent/826383?explicitVersion=true
> [3] https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=815180
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
> I realize Intel had a few troubled years, and that having this feature
> in the kernel must be quite helpful to some users. But right now, it
> cannot be used unless one has a commercial relationship with Intel.
> 
> I am not advocating for the removal of this driver; this is just an
> update of the documentation to show that the publication of the firmware
> images necessary to use the driver might have fallen through the cracks,
> and might not happen soon.

Thanks for bringing this up ... apologies for the delay in making the images publicly available.
We have reached out to internal teams to speed this up.

I will update the the documentation (or respond here) when I have more info

In the meantime, I am okay with updating the documentation  to reflect the current state of image availability


Thanks
Jithu
