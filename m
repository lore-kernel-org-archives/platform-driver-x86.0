Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41DA17BEC1
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973252; cv=fail; b=dxsFm/q+mDGOXSqi34aQMbD/V48/aTbz/CJtBmwwXKFJCWD0ecInD6DatBHdQ8s3RAiPLt5/dCT5VPRCflrEG/qLYe/GtZs5RQTmsmqI3fAmWodXxaTZJ6aPNkRIYPZAdBHNR8ZbxjzkU14gKkG9QBjlkJbjFRzFxctVMsPkad4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973252; c=relaxed/simple;
	bh=pwO0WrQ+zUFqhHD6t1OQoON3XPPoZMovH8ZsQHpvdRY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rd32aELSePVHA4k/3WjQdisSSfRkpAr/NmgQoQ71DWUwnAxA3/ai71M3TL7OrY9I0Wrm/XpUGNrqUzBtpz97dt9quSQ2on3+lySCwBTe/oAkdGZWqqsZKHo6rNi8P17TKcdK3ksG6eeHvkeuzKIUlb2fNsRwBvSAPF4aNDLu354=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5Oqqi/Eb; arc=fail smtp.client-ip=40.107.102.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5Oqqi/Eb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHwNZ1N+st+KpzHgY2IkAcGwX8li6CCiWlP7YnGS2Ug3yw7CEbV5zAWNdzGcEQBVzVw59W1rj/AOCFsCpTNx0oTTFcO0BGfg47hj/rEMi0dIrJC1wMbxTgqCwscGBz/a52awNhwmLNhUQ8lhnlmLk+ctYfoOnuczfBFqbUZgmSd8ltWOozQuoa8VikxjJ6mGnUzGll7urt8TIi2bInqq14j96K0CbpAdRRAxumPbzpo89inEgcnzKRzLGbBFxmXwB+uZduuHk/5XjU7bBk6wHZmQG0glaTuY8W3U9AsIq0ZFbbzZ8fLinq3uZWOZ/9jPNk98VE/P1+FtN4RwlOc0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdgfEApyWOShEEgtAYx7fu8DS8V6bK40zPAr+My4u5c=;
 b=u7HyOvgrdx8df3HPDLdIUNS9HvFlC7INVM1f3c1lNqpvfa+jPNQIUBkMVh4f0ZKKr641sY8itM16wg93YKgeOqHM+KlD0BtClAdr91AFz0ZnbNBDadOJLv7PUJ4IUnViHNRwY0vx+wIF8fLZUsDaXxdQG8ep82oWiVuBQ65EHcl8mVJPThDx/TWHs+L7L6bn0pXEA9AIqg4rMmlCcmxKG2UoQj9xkIts45fENx//9FnSdeJCPQx0bHOEF1oJJpe9rGHQS9XK8x93dwUKYPM+U7IOW3/IXk+fqAh83D0p6Pwofa/z/N7+lLsTH6GkoR7AQGyRrPCSz7HKeS7GYv/G5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdgfEApyWOShEEgtAYx7fu8DS8V6bK40zPAr+My4u5c=;
 b=5Oqqi/EbgLeRwAQFTBCQ/zm96zntEpOfD5j+x+a+qNRloeo5BbFEKGPTQFWOHe/NVMsGj1UcgIHhUcNf386K5YxTzOZA6LdsB0mmTSlKRjQbPxdBf4fHFDLIuI9XCfLv26lnYLK+Tn5xUMgdLI8mTc3h3dQHor0NWzJ9uuL+wsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 06:20:47 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 06:20:46 +0000
Message-ID: <a2033c72-0c82-4164-b538-ae4eabc5821e@amd.com>
Date: Tue, 15 Oct 2024 11:50:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] platform/x86/amd/pmf: Switch to
 platform_get_resource() and devm_ioremap_resource()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
 <20241014045759.1517226-5-Shyam-sundar.S-k@amd.com>
 <279d7dcd-2a94-1dd2-c34e-15b852dbceee@linux.intel.com>
 <d160d900-d15c-4868-8f9e-d6477abca38d@amd.com>
 <b83b67b8-e1ca-7e9a-5205-d6d69c87be6c@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <b83b67b8-e1ca-7e9a-5205-d6d69c87be6c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d4fac5-61e1-4f60-ab47-08dcece18192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVRqU2VmUW4xVTJQRERDMzN4OXh0OVVFTzd0VzRWR0NhNUozT0dQdXBiZjFN?=
 =?utf-8?B?RjljS1BqdGQ2bVlKWVFBU3k2NFF5SXl0VHU2Z1laUVNCYjFJSWJhOU5DcVRM?=
 =?utf-8?B?cGlMRXJIQXhDWUN1bFZSYmVYQXZONUNGQ2Nub0E4eG1YY0Q4NVJzOURTUEs2?=
 =?utf-8?B?VHpPaDVMbFN6c2FVYnA4WVBtRjhDaUJoNmE4UGlYUmcyOHAyMXlqNEJBWFBN?=
 =?utf-8?B?Zi9xaStGcks5ekRMcHV5RzF4TlVBUmNTK1Z5R2J6dU84d1I2Q1I2NnVnUTlk?=
 =?utf-8?B?OUI1YjdlMFpKV29JZm8rYzcvMnV3QUkzQ0dFc0oycXg5dkk2L2tabjlHdU5x?=
 =?utf-8?B?SzUxdXVuZkoxdDhTN1BDWGI0S2ZleEJxUUp1UGM3U2p0K0N1eUp6SXpFbGR6?=
 =?utf-8?B?V3QraklTV3dkdEZOaXBsRmVKWnZ6d1JrSUE4OWFLaEVLRkRGR0p2ZTcycHRG?=
 =?utf-8?B?bFlJTkxabWN2QzVqWmVhR0lHdlRhSjZQbGZEeU9LQzFUNHRPVlVGV0tGeHRQ?=
 =?utf-8?B?WFlJanFPRmVZNGJPMnd1VkxES2FSS2U0WC9kdVVXbkRSTUhRM3FpRkdwNk5i?=
 =?utf-8?B?WXEvNnVuSWlEYjBZVVpibVlkRldBTDc3REhJV2ZZQXJIc2NudERzeW8xNWl5?=
 =?utf-8?B?TWVWdTNsejE3dkdsOS9KdEtkRDRkM04yVEkveHM0c2p6NjF3YVRjVTdLcHhx?=
 =?utf-8?B?eUxITjdxRWtaYmR6U0k1dHRYd3RWUStnQXFZa2RvZXpRSnpzWTFDUW42bUZj?=
 =?utf-8?B?VUJicWx5NmY4YzRnaExOR0crYW1odjdrR1I2dG4zUGdBaDA4cDErVDVlQnRQ?=
 =?utf-8?B?cFJtSEtibkNRV0tKUXVjYkNOZ2o0OUZIZWYwVnptRUpiLzd2Um1xQ25PU0F1?=
 =?utf-8?B?bWFCSFNWM0wrZWdoN1JoSFNYb0NSQUYvOXorV1pUelFySXNiZmt0YmVNK2Q1?=
 =?utf-8?B?NTVJUnI5RDBEVEtWaXZIWlNMSUkvbGZLdHVWVmRndHBkb0IrcWdwRSsyeFNL?=
 =?utf-8?B?U2tLb2lqNnRRbC9BZlFWSGI3ek1PREpackhuK1MxWjltaHVZN3dBL3c3Vzds?=
 =?utf-8?B?cEpiNXlqSFU3dnE4ZmNzVGhDZzBZcmdkbjJtZnhWbzdlQ1lURkVVaTgzRzFN?=
 =?utf-8?B?Y09aVkVlK3plNGhVUkM3Y1VSOVptR1luN2hCTEt3YkNwWVlKT2lSN0loUTNW?=
 =?utf-8?B?Y0FpQnpNanYwNy9JaWkrVlk1eWRUb3UxeDlOYUs4bUVqN0lZaFl4aUFSalRs?=
 =?utf-8?B?YXJ6TUhRMzY2UmQ0ZWUxZHpxVWZlaFFiMExoRUx4MklUVi9qYndobzhCMUJ3?=
 =?utf-8?B?YVZhYVYwc3I5MnlrakgwRjhyZ0dDYkl2MG05azBMSFR1VnlSMWJFZTRxYmtS?=
 =?utf-8?B?cyszWEgrNlFDT3B3K1A3N3dkeE5DK2cyQ21Nb2k2cy9qSU0vT2RxdmFueUlr?=
 =?utf-8?B?TS8yeUZYbU9RWnRiVVdRaUY2dGYxRDgrcHdjU0hOVnYyeVc5TGJ0T2xoWWxw?=
 =?utf-8?B?VUlHMlprdDVWZEdlNFFlY1dvQ0NnL2RaNXAxWVFhZitUOU8wS1o0OW5MSm5t?=
 =?utf-8?B?SmxzWHk1U3REU3JFQzh5UC9iNE9NZkpPMkpMWWgzRExFTWxFQzhvM29iYnN2?=
 =?utf-8?B?dStJbk1zWEdlVjdsakRZa3hYNGZPR21WV1ZvZ0YvNnF3SmY4emN3ZUtXK1NI?=
 =?utf-8?B?WUpDUlZMd2F0Q0NKRWtmN3hyU2Npc0tEL3psYjVGc0dleUFLOUU5QUpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWlOUnN1Rml4Q205TVRsblQ5TGdFMTJZZHVlcENWTlFkWkVjM1lBTVVrMlVy?=
 =?utf-8?B?bXgybTQ0TUZnc0MwdERTUmtsNmIzSnBWQVBZVVcrL0VRLzlKWFE3bFBKSjNQ?=
 =?utf-8?B?VlM0OStuOEcxWjhsdXpWRTFWVHRiVTlpV01tNE81SFpFM0FicUNxVUh5VENK?=
 =?utf-8?B?UW9KUTdOYnlLTVBZbllpNks0Nm9VTEEvT0tZWlpDTVBxd016RDlSeXg1aFpU?=
 =?utf-8?B?NzB2N3VFMVBqM1EvNVdGWC8xN3M1THZRUE1rbFN6WnlVV2lLYTZmZmJKTnBG?=
 =?utf-8?B?bDlIcHhacitZTFp4cUo5UVFmUHFpbktIMHF0bDlSaENEak1FZVlRZEV2bFk3?=
 =?utf-8?B?djl4eXM5M0JrQkJ3djFaTWNub2JvNkh6cFRIMlJxTmFZVGJpQWhTUUg1UFhm?=
 =?utf-8?B?aVdPR2dvTmxDa3hpOWozeVI4UDFxZ2FkR3hGb0pId2VYeFFDbk1nYmtEU1lz?=
 =?utf-8?B?cGtiZkRMeXhrODhtVmNyRGd6eGIva20rbFRxcnZkb0JoZ3BhZXBGaDQzNmdt?=
 =?utf-8?B?Tm1LNW9LZStjMDg0Si9ML0xRTzlwOGpDMzBVWndPcVVGUmNGU1BrY1RvSURT?=
 =?utf-8?B?WmJ3QmRxQy9HR2VhaXV4QlB0bnAwa1NqWTdCMGlQaU93dGNHUmlTMnR2LzVz?=
 =?utf-8?B?MTlRMi90MmpHaGt5SitXNTFrZWU2cjNwck9OWkkrZ3VLV0VQMTExVGpxdjlP?=
 =?utf-8?B?eVVTcHBsZmZvUUI0djdTTU5Xbjg0RFVubUd4Y2dQYThwQWZGeUVmSWNkbTVD?=
 =?utf-8?B?cHN1WTlDOFlMNTI4N2FzQnJFeXJwa0lUVTNBMnN2L0N4OGZkMGd3enFzV2xt?=
 =?utf-8?B?aTVRSzJlZHRXTFRsUzhkK0dTbUVCQnJaOHpoaDVxNWVPbjMrTXFmNkE1OTN6?=
 =?utf-8?B?b1dBZ2JBanh2akVpTVM5RFhyallKVDJhdkV0QVpHWU51bytMc1BHWnY3aHdx?=
 =?utf-8?B?bE9xM2tWNXRrbUN3TCtxc3ZCZGR4NTMrR1dmQjRlMWdSdUZSVkNpZENxbEFn?=
 =?utf-8?B?cDRubW5DWDdLWlduRUExQ0MyTVpxMjFpUmhSUVR4V3UrV0xMZVg1NFVyZ2dG?=
 =?utf-8?B?a0haSE9kNTR3SmN5QlJZaHNZcklrdGhTanA1U3JNZDBDd25Pc0JXa2ZiVXV6?=
 =?utf-8?B?NjA2R25SUmFkR1hjaEZwZFhhYWEwRHBhbUJ5a2VjbzFZN1Z5dG5nMjdGZXlW?=
 =?utf-8?B?RFhlZWhZUGQ2Q3FOZE9YdjdLRGVYanl1NUZNSVk4V0o1azZCNU82ZGRKZkJO?=
 =?utf-8?B?Rk9oTldVZVBrM1E3RXVJaXVtV1NCWDUrVUhpL0tacS8yQlJvMGoyWkFpaG9P?=
 =?utf-8?B?NVFYck5zOGZadUF2NkZQNjVEYzlLazRqNzl3M0J2VnkvYS9OK2IzZzAyVzhz?=
 =?utf-8?B?Yi9EVURycmJlWG9oU2hVVFlkL1lDSlNWUXljNWhPMm5qVi9vNmppMTNyakE2?=
 =?utf-8?B?dkppOVlNMGRldWEyWVZGTWVLYUp6ME1XNHY2UG9xcnR0VkJwSXBlMHJxOFNC?=
 =?utf-8?B?V2VZcU8yQ05qTllZbEV1UkhFUkZuWkJWZ1JianZ6TmJYLytTL2c2amJlbUZN?=
 =?utf-8?B?Rlp4RW5LMVBoRUgxU3ZQQm4reVJZRUJoNWlsV3VFNllHdjhwVE5rVitNUjhZ?=
 =?utf-8?B?SzhtWHl2M2RKYWsyWnFta0ZzR252WE9kQTZ3cWliMDdvR3lUQlFrVFNES0xW?=
 =?utf-8?B?MlJ6S0pwa3NBMXh4L3lSb3hKQlhwdWgrc1VzVFkxM1lVOThFc1ZDNS8zOEZ0?=
 =?utf-8?B?b3UyN0NCVVltV28wS28vQmQxcmNVMzRoUUhkSzg5OGd6cmhONWk3UURkN0Nz?=
 =?utf-8?B?T2t0OHdoZTU0eC9KSjA2YzZhcXk3MitHZ2hVUUd3VzdxY1l2NkJjQmYrQk8y?=
 =?utf-8?B?R0VSVElNemorVXNZcFNqK09PUEEycnVLM0J5dFNvUGNyUERRYlpqN2I1UHFM?=
 =?utf-8?B?UTJibHVXSFR2WC9iVnNCaktoemtsams4UkJNcE52ejUwZUVoT0R2TURJTXBt?=
 =?utf-8?B?NWl2dGJEK3o5eHJYODVCMmh6UGY1aENWSmxUZVVZbklYUmpibkE1Y0NVMFNJ?=
 =?utf-8?B?S3lUU2YzZVE2aENuUWVZQ3lldnJSQUsxZmdFR1dQOUJhdkgyMjJmVElidWNV?=
 =?utf-8?Q?w+6uh44zFBxmvUZ+hA8XBPYH3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d4fac5-61e1-4f60-ab47-08dcece18192
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 06:20:46.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcFf/RfiiZ2hDmIRtWPm+KFnIuJQsti2r6TTE4T7WL8jF3QD2MSUO8VoAtixr8m/GHeRaj937XuAyxUu6Sb46g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765

Hi Ilpo,

On 10/14/2024 23:24, Ilpo Järvinen wrote:
> On Mon, 14 Oct 2024, Shyam Sundar S K wrote:
> 
>> Hi Ilpo,
>>
>> On 10/14/2024 13:26, Ilpo Järvinen wrote:
>>> On Mon, 14 Oct 2024, Shyam Sundar S K wrote:
>>>
>>>> Use platform_get_resource() to fetch the memory resource instead of
>>>> acpi_walk_resources() and devm_ioremap_resource() for mapping the
>>>> resources.
>>>>
>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>  drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>>>>  drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++-------------------
>>>>  drivers/platform/x86/amd/pmf/pmf.h    |  6 +++--
>>>>  drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
>>>>  4 files changed, 20 insertions(+), 32 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
>>>> index f4fa8bd8bda8..99d67cdbd91e 100644
>>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>>> @@ -11,6 +11,7 @@ config AMD_PMF
>>>>  	select ACPI_PLATFORM_PROFILE
>>>>  	depends on TEE && AMDTEE
>>>>  	depends on AMD_SFH_HID
>>>> +	depends on HAS_IOMEM
>>>>  	help
>>>>  	  This driver provides support for the AMD Platform Management Framework.
>>>>  	  The goal is to enhance end user experience by making AMD PCs smarter,
>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>>> index d5b496433d69..40f1c0e9ec6d 100644
>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>> @@ -433,37 +433,22 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
>>>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>>>  {
>>>> -	struct amd_pmf_dev *dev = data;
>>>> +	struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>>>>  
>>>> -	switch (res->type) {
>>>> -	case ACPI_RESOURCE_TYPE_ADDRESS64:
>>>> -		dev->policy_addr = res->data.address64.address.minimum;
>>>> -		dev->policy_sz = res->data.address64.address.address_length;
>>>> -		break;
>>>> -	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>>>> -		dev->policy_addr = res->data.fixed_memory32.address;
>>>> -		dev->policy_sz = res->data.fixed_memory32.address_length;
>>>> -		break;
>>>> -	}
>>>> -
>>>> -	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
>>>> -		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>>>> -		return AE_ERROR;
>>>> +	pmf_dev->res =  platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>
>>> Extra space.
>>>
>>>> +	if (!pmf_dev->res) {
>>>> +		dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
>>>> +		return -EINVAL;
>>>>  	}
>>>>  
>>>> -	return AE_OK;
>>>> -}
>>>> +	pmf_dev->policy_addr = pmf_dev->res->start;
>>>> +	pmf_dev->policy_sz = resource_size(pmf_dev->res) - 1;
>>>
>>> If you have a resource, why you convert it into something custom like 
>>> this?
>>>
>>
>> I will address your comments in v2. But for this specific comment:
>>
>> the DSDT looks like this:
>>
>> Device (PMF)
>> {
>> 	...
>>
>> 	Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>> 	{
>> 		Name (RBUF, ResourceTemplate ()
>> 		{
>> 			QWordMemory (ResourceConsumer, PosDecode, MinNotFixed, MaxNotFixed,
>> NonCacheable, ReadOnly,
>> 				0x0000000000000000, // Granularity
>> 				0x000000FD00BC1000, // Range Minimum
>> 				0x000000FD00C0C000, // Range Maximum
>> 				0x0000000000000000, // Translation Offset
>> 				0x000000000004B000, // Length	
>> 				,, , AddressRangeMemory, TypeStatic)
>> 		}
>>
>> 		...
>> 	}
>> }
>>
>> But, resource_size() will do 'res->end - res->start + 1;'
>>
>> So, that will become 0x4B000 + 1 = 0x4B001 which will exceed
>> POLICY_BUF_MAX_SZ.
> 
> That +1 is there to counter the -1 done on the set side. res->end is 
> supposed to point last valid address of the resource, not the address 
> after it. With round sizes, the end address is expected to end with lots 
> of Fs (hex) but in your example it ends into zeros (if I interpret your 
> numbers right)?
> 

Yes, that's right.


Couple of more examples, where resource_size() will fit correctly.


Example #1:
WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, , TypeStatic, DenseTranslation)

resource_size() will do 'res->end - res->start + 1;'
So,
0xFFF-0xD00 = 0x2FF
0x2FF + 1 = 0x300 (which matches the length field)

Example #2:
DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed,
NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED45000,         // Range Minimum
                    0xFED811FF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0003C200,         // Length
                    ,, , AddressRangeMemory, TypeStatic)

Here,
0xFED811FF - 0xFED45000 = 0x3C1FF
0x3C1FF + 1 = 0x3C200 (which again matches the length field)

But the same resource_size() will not help in case of PMF _CRS
ResourceTemplate(). Hence I had to make a custom change like doing "-1".

So, in the current change proposed here, we can have two options:

1) just use:
pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;

2) use resource_size() with -1 and leave a note on why "-1" is required
pmf_dev->policy_sz = resource_size(pmf_dev->res) - 1;

Let me know your thoughts.

Thanks,
Shyam
