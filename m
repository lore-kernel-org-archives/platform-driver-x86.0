Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA21FECCD;
	Mon,  5 Jan 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624087; cv=fail; b=F5Xd2umfxQsNGCbBeZO2OnJ+uZ6nrLUAgGH8BRQg30htp1Qq6i0tX/n7Ej1ZVJ1cw4BKpj37Ztm+6sbUJKs4BhDfiWp8Saeg549jZvrs091xkxOvJSuc8/tTvtG6ksNGJofE8CceomVUNIzG/g5gqpF/at5lgBaTBH2cJLJEFbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624087; c=relaxed/simple;
	bh=wMCan5/0k5J33wec2jjMAhpK72hGXTBQ34uMbAASLyQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tWLhqggoSQrERtdY2s6NeCEv42WKVPXRASquQd8oEXupDRiVXz3OmHFieRUcLj8RpyHuBLDL64TgR0KIneIpfEtd40BMXenP5e/sFUvC9jFn38ntcGUQ2OLd8L1j5Pu63uOn70ZIoKZX72D3KQhjs75/S8HLhP5qhm0fOidyBBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbNtEk3x; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbNtEk3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767624086; x=1799160086;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wMCan5/0k5J33wec2jjMAhpK72hGXTBQ34uMbAASLyQ=;
  b=KbNtEk3x1i4DJcEY133DsJ7jl/U10bBkCSjvCyiA8rfPMrxfvAfc9dHL
   f1KiRlXqiHq/CQq5Rc6u4vkSR5n6W2BIbTxtsk/AvIBVqwqaRm334s+0e
   XqpIZPhV9Ak8AZbEFLvFxd5VKKwjwDGe9mrTCK6dkkdNaKcU1AkMdBq7M
   XH/L3C0RE1pvJ06yEtF/VmPoOfPfLaRYibTfOvmfmSypD0tqOl6BppCyf
   javnSZTVnTpTT3DgrONqiKJpz5gZbQ4cBcjHDaJns6fyNH9m7bGed7l7m
   JpYx8bh970SzKxtkC7vBkYlhqm1nOSjHiNJhYN+B2tZCkDrOiOUMiyigl
   g==;
X-CSE-ConnectionGUID: 5EdzZ830RPKh0KV8kM/oXA==
X-CSE-MsgGUID: 36C0j2ZrRaGMnwOnKj6wRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72615677"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="72615677"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:41:25 -0800
X-CSE-ConnectionGUID: NwDcENItShyfPA+wWU/fHg==
X-CSE-MsgGUID: ytjHHhCdRQ6796YPEUWgoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202869866"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:41:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 06:41:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 06:41:24 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 06:41:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxzkCtd8cbsmt69kxhGDs/9AX1it21qsotlc93g41jw9dUKud3YVUDPGXda/ajkH76GeFdZ1SuU7GZkhSOhCA9O4ZGYx8Zz/Ovswbg5eKny131VYDCzx8gKcSdskSUQCA7H8oc1FyucUkhYRVCdf4Qx3NOSVofb/JT9SY9nrwtw1QiAIOIFblVUx2heXkXjUOtT4XlVhfxTWX1g8RqvcA4An0m2QPWPdVKqTF/2Du5sfRth4EvNiHzUA+wQVAJvJQeek//CmkJ/U47/P+RCwzUhgAgJOY6+NkebQNiuxA1jbyV5PO1xnuqi70LjCjOrL2xnWrL4FhPJn/B79RwRQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5JgHYVU7MByBVXVR+B5jHacQSSy6NWnUxdcQOrgA80=;
 b=eXLw1IGKOzaOfwdIq/VlzI19j0IJsNRYPMAIFEWQXBMtIALMYfcua3GbiOzbXOu/j8I3np0BvoWX8uidK06RGrtzD1JfBIs0d0EcncZjjb8QMRrpR7q1pBh8s70OAo4lxXu1uZqJJiiWO+BEs8ekE21jH8vqI0z7ruq1jT8GxINvTnYSMnrL4B57DPhSPMgSjHkB+XC/PictdDbM01s1OBLQwWgz4xLbE54810ujqaVwSUaI+EcERS1GW8U9vmmJmBlZhzXXAGlz2rJ/ULa5zUlysZooN2SAbs2lhmkucEiR79VyW5zSDShSq+yt9pzBeMmJNfLWv67EhJ2okMyvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 14:41:15 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 14:41:15 +0000
Message-ID: <aca8d8cd-0e71-4544-9e04-5144dc8a6c42@intel.com>
Date: Mon, 5 Jan 2026 22:41:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/surface: Replace deprecated strcpy in
 surface_button_add
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Maximilian Luz
	<luzmaximilian@gmail.com>, <platform-driver-x86@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>
References: <20260105121802.1947-2-thorsten.blum@linux.dev>
 <4cadf166-2693-489e-a6f7-ae986694fd88@intel.com>
 <BAED6C05-841E-4BEB-878F-6049D20669FE@linux.dev>
 <57bc8c7b-72c6-e9a2-f03c-c840be6c9c35@linux.intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <57bc8c7b-72c6-e9a2-f03c-c840be6c9c35@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU1PR03CA0042.apcprd03.prod.outlook.com
 (2603:1096:802:19::30) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 742d4575-0e43-4d55-2987-08de4c687ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3FHbDVhOE90aS9SQVdZUExMaXE5d3d1T3RDSmhYK2pEUm9ib1dtU2daL1VM?=
 =?utf-8?B?eVRuS0xrSEtuWVFLU1l2ZnZLV2ZPRldVbFBRN1haWDVseUc1NDdSUDNVNXlI?=
 =?utf-8?B?bU5xdHk4U3h1TUxPakwrY3V3clBZb2dBaUtrSUVldG9zY2FpYk8vZ1JQazBk?=
 =?utf-8?B?aUcrNTQwdTlqcit4TVd6bXg2K09EQmFwTTMrNW5PYWc2MTBVNzBRaGFpTjlk?=
 =?utf-8?B?SnNqQ2hGRkFxeUF0dVFYYnB0TmYyQlBBeHpPRmR0N05Rc3NCOFpaRG5CamMz?=
 =?utf-8?B?RG9DYkZmcmgyQVpwWW11ajI4d0dlVFJtL2JMVDVOVEtLRFFtalJkblJSK0gx?=
 =?utf-8?B?UzlhRDUwNllocysrek9xTVZBb0ZuZUlMZndPd1VBNnNXZVZMeGhGQmdDQzhn?=
 =?utf-8?B?SmVUQjJnVE9Wek9kU1p2NkkyQTdlaHkrZUpiN2pvMk5GR0czNzcyZHRPMU0x?=
 =?utf-8?B?QWJsd3ZRY0Vlc2dRYzVXSERSSk15YkZGdmdDc3lxZmsxQnlsWXJIN215K2tZ?=
 =?utf-8?B?cTBWTnlmbmdHaGw2WUNDMHkwRVFnZzVLMm1pclB3SWx2dWM3NkFsR3JQS1c2?=
 =?utf-8?B?MldDMmY5dFBEckJLZThtY2lFV1VCZURHUm9KVHdSV1AvSExMQTRvaDZremRz?=
 =?utf-8?B?a01ma1lweXdZNWJ5UkwzTlFvUkJKUmN1S3cyRmJ2VGV2TjhoMzhJUzRpYXB2?=
 =?utf-8?B?OHBvZm9TUVg2RlFSMmhLOVM4NXhraTIyTERSbTRLY3Rvc3dYa0sxYkduekdE?=
 =?utf-8?B?cjFXWGI1aS9TWFJQMndTQVlYdit5aU10U1dXRkpCQjh2NGRtYlJvQTNpR3VR?=
 =?utf-8?B?NUUvT0N0Y2JUME1WWElIb0pCSXc5L2R6NFZ1ZTVjeWxlS3FoZUJxbGdqZU4v?=
 =?utf-8?B?alIwZkdRZjhnelZ6K1JFQ0NvTW5TZzVCRU1qbzI3amUyd1RnVXdvVGMzYS83?=
 =?utf-8?B?VzRuS3hvWVFCYlFkNk5hZzZtRjU3TUxBTFZQN1g5NnZnRGxkQXdVVVp4M0cv?=
 =?utf-8?B?RHQxSEFHdkUvd25wQ1dEeXl5SmJ2SW9pcDZYSG45OWphVXB0ckNTOHRjRFBY?=
 =?utf-8?B?dTM0RE5keDNsK3ZNRFBFeGxrb2VxMkR3SW8zYWNCbnZXZ2JUNkJ5Q3RxSG9W?=
 =?utf-8?B?TkhuWjE2aFNMVjdZOFp0SmxFb1JqT3hIdk1HaEE1S0NTSFZQSUt0TjUwWEk3?=
 =?utf-8?B?MW05WEtnczd1NE9HenQrZFBCbUIvN0FRNDk3YlBSTHQvY2QvOGxnTENiaU9G?=
 =?utf-8?B?US9LTGRNVyt2clB3TDdhNTRub1pDcjRrR3liRE1qVFNyZVNqTXl1Qk9ZNFZs?=
 =?utf-8?B?K2Zia3c1WWpycS8zYkNWWkRRZEpLUlY4MzFkcHRndHd4UGN4ODRGbWwyT2FO?=
 =?utf-8?B?eWNGZHYzaWY5MEdwRHpPME1CZUpEbFJwWVduaWZFdlVjZmZ4NERMclBPa09z?=
 =?utf-8?B?MnlLVExHcHJhOG91amZHUlZkdHppVTVodXZyL1AzaWU2WWwwSU5ldWMvQ0Fs?=
 =?utf-8?B?cEFRVEMzWG9XMkNleHMzcFIvcFF6ODR2ZUp6aS9DcnVSUzl2VEwxMFJTVHRj?=
 =?utf-8?B?L1A3M25nblZZUzVTUmhNZWFxZENRSXhYdVY5OW9zdEZVUnVQaWNYQWt0NDBV?=
 =?utf-8?B?UHBVNVE5aUk4LytzYmQ0YzNpandNdnc5VkVoMFNqbklwWmhpQnArTm44NDgr?=
 =?utf-8?B?cy9CKzZ1WVh3VXNpTGdGUVhvb05qZmVPTEtvWkJWdXpWRVdNbHBWeDl5UUVy?=
 =?utf-8?B?LzNjbS9zeHgwSEp2SFJKUm9paXVVR3NxT0VhcTFlS2s2a2JhSTVpRTZVdHFt?=
 =?utf-8?B?bktRZ0xyakdxNW5BR0c0TVJDaEN3SHRRY25oZzBYbFFzdVBSMEFXUG81SlBv?=
 =?utf-8?B?cDFjM3psR2RsRS9KdzRwRENzUFRTNmIrdEhEdHJnMytMemkrMENSMlo0Yk5a?=
 =?utf-8?Q?+fggDiJs8DvkVtDYzRTayAeZNzOmRUYV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5xMFZuQy8xVkx0V2Q4azVUaFlwZjB0ZHJJTlpWR1hKTy9xWjk1RXQ2S3px?=
 =?utf-8?B?U3pIWEoxOWpwUnVHSGY3Zk13Tk9BMHAwemg0bDVNTWhmT0hGM2Q3Zmg3RkM4?=
 =?utf-8?B?VldrVzk2ZTdYdlZrcEYxcW04VWFqQnhIa1grSVVMUWhkNXZmbXpQSTZvbWdO?=
 =?utf-8?B?MEVaRkFKY3FOWFZKS3d0bVp2M0s1UGRkTWlTaEhHSG1WU0pCbDJYajd2c2ZR?=
 =?utf-8?B?SXpSZitCVFdZUE40Y2ZaT3ZmMTEydWNnbWZrbm1pdkxBZEdCbUJ1NHlNaEZH?=
 =?utf-8?B?NGhhbU5KOUErS1VhUjlXTVpqbXVXN2lQdEEwUkxnYmcwcE16ZkZNVEhwOUIy?=
 =?utf-8?B?NDUyTHpPZER1NXdaUmVNRzFMNTlubno2OXc2UEFiMURHWDV6bTdocHhST1ND?=
 =?utf-8?B?OXJVN2p5TlNCbzZLYmUwWDN0Q3RkTzFCTk0zSGtNaVFHcmQra3BvZHpFK0s0?=
 =?utf-8?B?UzBJa0o1NEo3M1FuR1VnSytycytqWlBFa2NVbTN4dU5HL3VIcTExbmN6VUlM?=
 =?utf-8?B?MWxzR0ErbE1tci9Hcy9Oci85aUlCUHZ4eG5OR1NmMFpJSnpNdXRya1NIa2s4?=
 =?utf-8?B?VDc1a0hUTDhETEJaRXJJR3J0NW5VMEYrbjRLOGE1U1VrRTVRYythYzRWUWRY?=
 =?utf-8?B?OXh1Rk16QVBwTXpOdjBkS3UzK0FiOFFNSkRkQWtiaGV3NDBaZ1dkZ1M4RkxZ?=
 =?utf-8?B?dHcyMitXYVZtVm5FNTd2UDJQWjVNcGFFUzR0Vk9wOG43SUE0Uk9xRFdzaWtT?=
 =?utf-8?B?NnFHcnFZZ2hMS1EwK0FRMXlGME1LcUwzZTZrRS9qYS9WR3hHK0xaTjFpZ3pM?=
 =?utf-8?B?djh1ZTNYRkI4ekk3ck5CTXJleE9nOGNnZW5jTk1RMTZleFM4VUZvM1QwMU5q?=
 =?utf-8?B?VTZlZUJsdkpUcCthb3QwWlc0NUNzR2ZaU0RuQTg1SFlGU0lrN1FtZHU0Zm5h?=
 =?utf-8?B?UXNVWmg1VmZ3T0xQMmdLQUQ1TnhmZVBzZi9MVkRyUHd0emtLMW9xb090cVIv?=
 =?utf-8?B?Rm9CaDd2MkhDeFZ1dVZXa0xXQ2NINEN4RGZVQ2x5NVRIV3dTdDlzWUNRc3JC?=
 =?utf-8?B?eXlzTlVKNmljQytOSHR6MGl5aW1wZjdnNk9PMHVzSTZtV0Fsdk9qUmNzbGc5?=
 =?utf-8?B?ZldXS2VxYklWeGR3ZGw1N2RXbzJxeDdteHZQOHJ5YnplREdtRTFxUm5FUlRW?=
 =?utf-8?B?UWorb09mc2orMEZwSWFJOThCRG41NnBiU24zQm1mamYwbTdnWTZ6dkpzdUI1?=
 =?utf-8?B?b0V1eGxhZS9EOW9uZ2FqVmJYd3MxZm42Qksrd01Qa2ZDYzMwOHd6MGZ6RXNJ?=
 =?utf-8?B?ZXZXUnMrc3RRV21aMkRFU1VTbkJCVW8xWXMzMlVmbEViVy9QVEI3SGRjRUFv?=
 =?utf-8?B?bk1jUkw0bWwvNm41WElzYmkzMjdOWnpEN0F2UVJyb1FaaWY3ZUZnL2NJOFpD?=
 =?utf-8?B?M1NyQUovaXg4MlplcmNLRGhMU1hZNTQwM243Q3V6SDJGMmZUNGZYZmV5bC9k?=
 =?utf-8?B?eHVIbE9xTHI5ZUhJWWUyVlhiU3lrWjVIS05sWUlVRW1pUG1wZFNpSSszMzBB?=
 =?utf-8?B?MGFWZFNWemZMREdheEVRcnVSRGtER2lVWWV6MEZEUkRCQTQvNUE1NzVIdmI1?=
 =?utf-8?B?Mnd1TU5OeHF5amo4Y1BGaVc1WUdlcTFNVWhPaVJpZXFibmRVRnNyNktDQm5C?=
 =?utf-8?B?ekhFWTVwR09uNGVCaVY3cDFQYkNIRGZ2ZHBSaW1iSDFjdXRZeGY5ais5d2hp?=
 =?utf-8?B?WXU2VVFzNXNTK2tOdG5yQmRNY1FFcTYyQ3NzWFZxZVEyNzNxSzB0OGNmT1pp?=
 =?utf-8?B?L2xyNUZiVC9adFJGTjZSZC9hTFRMMW1MSHdBWHlkNFc2ZVFQQ3MvMGc4TUg0?=
 =?utf-8?B?Uy9IM1g4bjM0NEx0c2g1UTJETW1Ubkt1ZFlqZnhCTWNvdnpwZldGL3dEOVhJ?=
 =?utf-8?B?dms0OXFYNGVCZmIwYUFVdVplVFNrQzZxZmNLb0xYd0hNZ081YkRsVnN2Z1Rj?=
 =?utf-8?B?bW56cE5sYVJra3Bzci92aGF2UUxvYXllQ0Q5TG5SeTUzUlBlYTBxVkpVVGpS?=
 =?utf-8?B?aGg4WmoyaUxaK2NuWlRabU53R1RKVllNSHF5SG5GcDYrd0pNZTJDdCt4R0Vx?=
 =?utf-8?B?eFk3dEVkVkRIVUI0UGVzTkd0OGhGT1pMa0FHZmNWcEZyanJ6Q3RNMHh3eW1Y?=
 =?utf-8?B?Y0pOUzN0N1drb2hKSmhXcXJPbzdOWW9zaGs2TUhRdFZJcDQvVHJDMHVSaHVN?=
 =?utf-8?B?akROQk9aa21jNDF3aWw5bzFMSlVCbjRLUzVTcXhPUU5QQkFhVTlaMlNiUUtr?=
 =?utf-8?B?ZW91VzhWeU93OTcvMXM4VzhlSENKU3F3MTNQT0ZycDQ0OUo4dHBEdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 742d4575-0e43-4d55-2987-08de4c687ac4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 14:41:15.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oNH78U4Oe7jwkjdYWmsL3BwkH9EcMNqLYyDjRf4j0hr6IJaST6ggQFxB6aPcOPHAYcPHXok4r8Q1hF7HKHD8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
X-OriginatorOrg: intel.com

On 1/5/2026 10:21 PM, Ilpo Järvinen wrote:
> On Mon, 5 Jan 2026, Thorsten Blum wrote:
> 
>> On 5. Jan 2026, at 13:52, Chen, Yu C wrote:
>>>> -	strcpy(name, SURFACE_BUTTON_DEVICE_NAME);
>>>> +	strscpy(acpi_device_name(device), SURFACE_BUTTON_DEVICE_NAME);
>>>
>>> Thanks for the fix, a minor question might be why we do not reuse
>>> name by strscpy(name, SURFACE_BUTTON_DEVICE_NAME) ?
>>
>> Because 'name' is a 'char *' from which the size of the destination
>> buffer cannot be inferred by the 2-argument version of strscpy().
>>
>> Using 'name' would force us to use strscpy() with 3 arguments:
>>
>> strscpy(name, SURFACE_BUTTON_DEVICE_NAME, MAX_ACPI_DEVICE_NAME_LEN);
> 
> I suggest you just remove 'name' instead. It seems pretty useless to begin
> with but especially after your patch. :-)

It was still used by other places.

thanks,
Chenyu
> 
> Please also add () to the subject line after function names.
> 
