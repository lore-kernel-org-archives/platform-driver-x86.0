Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E55B7DA91
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 06:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035181; cv=fail; b=hGOAOypOV3R+oxC1No7FyHKRsN3vQSBt3UAdw4OesCSNn6M6vSdrjkX8vp+R9gN3fmwbLTdpkVv1JmtYrevpH1st6SC4/8TOJa1Km1DMQWji8eT8jl8BqF8a3jP2i+W5FzS90NBBFjVB/u0YS+lX0/Oc5e+cMiKrICkJX3Xw9oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035181; c=relaxed/simple;
	bh=wxiUo7cQ9Hbm4lJei3g3RE7pDAdwlSplL/Qq1U5EGxU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VtPFVx3tMmI5SSdaxt86TephjgAsSgVXbUHw1YAABd6QuDSlS0B6ipmHLmakEQmh9lFG/vdqcGdpXoNd4FPXUfElauJIjcqLYZj/QlVWKiIwbzJDNDvm87dli8BYJ9Q9eB0Y2zN02TRP3SUFnfykVoVIlKLrASZAN6IOfQxW8tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mQBDZR42; arc=fail smtp.client-ip=40.107.95.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mQBDZR42"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNslf7oNtJEFixCRi8eqNiMtMfJJf2d1tP+TVrh76AdJB/TnzHsLaiFggv+gY0qPLEaz+KaV+mkVphFHQpNarRLmB75f4ixAY6HiiuwTkYibVYGPC84qnRYDUHVuRynNw5Th/jYRtCAQykMR249cpV1njjbEPUoZNl1zGkQ5avhJuO5bV5RfXjrdNOdnuVdpKjPF59e0HP75lwBNnELPF0z7H92OvqNtZTYsKN+D9sTKJZSWiA2dIL2XQW0/Tvv/sCW9VaKDwcsv29XjlGPq5y3FT+lTejZ6LVkdrU0lQB+QVQVawsW0rTwbySlrC+LOIuuYk6gdgu//j4pE9nK5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq+k5E0uqChfse13uQx3a0Q3MSRbsskjWwHt3tqy6Lg=;
 b=Vv0uRlw27h5AMAr9/PUnas6KPZlT6/DXlNx070xyD0+DJ1q5Obb5VriKQDFo44usEtytj1P65bP208BnQztUF6O+n517XUVnYK7sRiKU3XO9xiCPLq1vHUJ6XjNZjtEnMffnlGfoP883Nyno1PeeBkT2Il3+NwQgILE2hSS6NtrpKY59N2miM1vYEHSt82WWAuW+uoxRx+PWGv6czxDpYD3+CPkoVJbNh7HKugdZ2CPUh+r92C+2t0e5YIPZg9Ls5y80h3c2pzuRauaHkv6ADX4p9SFc6yWQ6paZ3JXf6HiCZxEb8B7mQgzitj+Fx7nIulWSDgjD9zhKq3ocOte2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yq+k5E0uqChfse13uQx3a0Q3MSRbsskjWwHt3tqy6Lg=;
 b=mQBDZR42mIEmnXdqcDkwHDzmZdABuC6TqLh4I1CKORJKXK397ZubgEkfFna/UnK2I8+F5e5jHmBUSUP2eMHn2OgmJ1+7pB557o4tuBlV/KrxGxcYAgUWmdRw7EBZONvOxthMwlHoUNnnbfyw1J1JKxFWuqBWIaZ3ePF/AgcQwl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Wed, 11 Sep
 2024 06:12:54 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 06:12:54 +0000
Message-ID: <8108fabf-0a74-40d0-bf60-485e26c9065b@amd.com>
Date: Wed, 11 Sep 2024 11:42:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 08/10] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
To: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
 <20240903123830.2717196-8-suma.hegde@amd.com>
 <42307228-7871-4ced-89da-a6612db1c7e4@redhat.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <42307228-7871-4ced-89da-a6612db1c7e4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::19) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 32428b88-e4fe-4e30-631a-08dcd228c61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkpnNEgrWld6MVBEZUozMVhpYUd3RWxNeFVyRjkzK0ZOZlc3ZWd4SytYRU82?=
 =?utf-8?B?TkZENTlQLzR0Rk0xN0tWa0YwSDFlRXBMM2x2VDJWNUtGbVBNV0RRWnpjbDEv?=
 =?utf-8?B?OWlNQzY1d1Y4d1ZuK0hZVmwwTkFBUzBSYUt3eG5jalZVanh1akF5eUZyOTc5?=
 =?utf-8?B?akZ4aCtWdmtqcjZJQ2ZEN3ZRVy83aS9wWU1wVWx4UWEvY3U3N01ETjljRWVX?=
 =?utf-8?B?bG0wK3RzWFRNa29zWktyN3UvakYyKzIrVnRpeXVqZFQyREZOTHYyZ21WRUFQ?=
 =?utf-8?B?SEIzbVpXK1RxVERzS2JyS3ppMXgxR3p3Zk5DT2NNMC9CSTlvcGFQNlpYM2Ni?=
 =?utf-8?B?NFE3WHlyMTVrNFZHNE5KUmUrT2JEeU94cTRtMHlrWlRQT2FnK29zQjFWYXVl?=
 =?utf-8?B?QkxxNW5YSDV1elpnY2t5OVc2QWdNeTNMWHBicEJJaG9KdTFZRTB4Y01yOVZZ?=
 =?utf-8?B?K2tKN2N3b1R6dFFwTzR6bnJyR2Z0WXgxajBCTTZyQk54NFo0Rnp3VTVncWp4?=
 =?utf-8?B?K0NpWWZWTzcvU0MzcXlrVlE2WFYyWjJhU0l3VWg2aTdDaFh0a3Y2S1hmd3Q5?=
 =?utf-8?B?T2ZTUjZkTnU0M1gvWjhJaGsyNjBEZE05dFdXK3Bmd05vdzB5VTNWMzVDMWxS?=
 =?utf-8?B?Uzd4eXlyaENTUW1GR3R5QmtFL3k3Z3crWEdyUXAwRzUyaENISUhWWDE4OWY2?=
 =?utf-8?B?aXcvYXZVV2o5bm82Z2EvOVVnVmdsVzRKTzBZeU5OSXNlY2M2SUlQTFJNQlJV?=
 =?utf-8?B?aWZLZC9EY2lucTVsdjc4dmw5cjJzMjBTbkVtcEE4alkzWHIyakJYdU5saTdp?=
 =?utf-8?B?NFMzdHp6UitwUzBIN0FId0NKVGhVMnBoanJUZjJMMm8vUjZ1WXJ0RFFYa2Mv?=
 =?utf-8?B?VklwNUlBeEdySkxOa2toMjFmcUNhRE52Qml6cUk4aXR2dlQxMDNIUlA2QWxw?=
 =?utf-8?B?dllmWDYzSmVpNm1lb25SWjF6M0duVS9YTkY5Z1JOMkxOaWdoZjVwVy9NM25D?=
 =?utf-8?B?SjBmKys0ekpZQ21EV3FkVFpIM1hYT3BTRGpRL1duWnJyajl6ME5DWTQzQ09W?=
 =?utf-8?B?VHJSMUtVRSs2QmJ1TjVDZjhsTjdUKzJYODhCRkRQcU5sL0w5a2xhL25tTDB0?=
 =?utf-8?B?R3dSa0hSOGc2ODVwNE5xTlE1RDdmSFJ3S21Tc2wycSt3aGhPclJTR3M3MXZ1?=
 =?utf-8?B?VUtGS0svbm1aZlVaS3MvT1Q3MmxjZ3BKYTdlcGpvVVNwczdXNDNnUE5NWWI0?=
 =?utf-8?B?N0daY3BGdi9Rd0FINUd2NzNOWHBXclN0ajMxSE9xSTJJaWV3b2oxK0wvQXhV?=
 =?utf-8?B?ZVNtZ29HZzFOcW95MGNCcGtadW1FWTFUbmRnMDFPZkNXdE42VEdTZ2lHY0Q0?=
 =?utf-8?B?RUJ3WW54UjR2eXVlMzNLOGJ6cWxIMGllT3hBZURwZjhpY2ZWaWE4dzdQN3dI?=
 =?utf-8?B?RFIzWlJrK2hmSnI5cE5WeHYxVmhQSlhwVk9pSituSSt2VjRaRURmRVAra24x?=
 =?utf-8?B?MHNGMHFSTnN0QTJ4WVFFQlB1Z3hnb3ZMVGxndEVSalZPdnVncjJoNDFoeWJh?=
 =?utf-8?B?SW9JMDdhQ3RJOHBCaGg0OHlMUE1PZllSZ1JDbUx0RllzTEVoT2FJMytHanJU?=
 =?utf-8?B?cUNaZEJoZ2ZabjBoOE1WN1MzVUtvNW1ReWVWd2xIb2I1NENRbUpnOFh4YTBy?=
 =?utf-8?B?UmhUVzlHVkh0bUdaTHd5SjZBdzY5a0kxU1VQZDdmU29wQitRb1NmZS8ycXdM?=
 =?utf-8?B?WUVHRjJTV001MUI4alVnclVGbkhnOHBsRlN0T3JVZlMrVDNhSWVIMDcrc1pn?=
 =?utf-8?B?bzFqdUtmS1lDWGNHdGN6UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3V6aHlBZW5rc1FNRFVkZEFpcENTNVQ4VXlIN2J3QzYyYjBUVTBsSzBsVUd5?=
 =?utf-8?B?QStlaldmQTZHR0FFeEVmVGlydnNhbWJpOVNDd08wc1pXZGtuUnBOZ2JhNVFV?=
 =?utf-8?B?YjF0R1l5QVZZSTJiSGtZNE1WaVdZb2N0OS92YlJHbUFoYU9LL0dqSlZMSHVx?=
 =?utf-8?B?emlvdU8yN1lxTFRxLzJGNTYzTXV0Q0tCOXp4RVBIL0FyMk1LbzVLdFdoeW1o?=
 =?utf-8?B?U2k5emtzblFvWDhNUTExcHp2R1dNb0pXemRjcHQ3Z3N1Ykg1TnE0TnhVQTVO?=
 =?utf-8?B?dlZWbkhvMXJhSkNNTDhOVXJKL3dOcURVTUJqK01aaXdhU09CWGdWeU9kaWdV?=
 =?utf-8?B?cjZwQzNZZmJDT2R0aWFjNC8zQXZwVXJrbitTLzVkQ0ZocEFnbzhEUkl6QUtT?=
 =?utf-8?B?RGhlV1V2bS9KT3pkTG0rbUY4NExYSWk5YTcybFVMb2tITTNNc0RyV3dHcTZr?=
 =?utf-8?B?ZzNTQnBtL0xBUnc3UURrMmJiMTd2Y2tRenpmWjVDMG5TZ3UrWGdQY2syWFEz?=
 =?utf-8?B?TjdJcmR4ZVQvbVBJRXhsTXJFQy9ualZCRXM4OXo2dENsc2NDRzdCUlF4MXQ4?=
 =?utf-8?B?c2xWellWamJDaGRFdTBUc3I3ZytnaDNpRHBmZ2hlaTY0Z2V3SU16VFIyazFE?=
 =?utf-8?B?dFdpd3FObWk0UzBsWUxFNmhJbHBGNmFnK2NaY1JCN2NnTll0UXF2NE5LUU8y?=
 =?utf-8?B?T1lFQlBvdlNLWFZiUEZCRGdiV3dndXdFV2tqa0FXV1FPWG5HTDlTbmpwN1Q3?=
 =?utf-8?B?dDBlQnB4eWRTTXNKdDJQUm5uY1EyYzllbGxWUnZrK0tOU2s3L2UrdCt2ZXJR?=
 =?utf-8?B?eVhnUGpWdUt5dXJHUEdUNjlpd0YyNFFtSm5IbThJb0ZsZVREUVY3SXpuVnBr?=
 =?utf-8?B?VWw2bU9SRGVwdFJkY2p3U25NQnFpSVlHbFF4c2cvL25XZXJxc1g2bG1GN1Jr?=
 =?utf-8?B?S0FkemU5QlpTTWsvNGtVbkp2UEJ2VVlBQ3U1OEwvS1pqYUlJWFg4K1lWNHky?=
 =?utf-8?B?M2krcG5oSTY0amFxamhqeHdmUXRSTGIvRmhjSlU1ZXdzbWhuK2tMUW5pTk1D?=
 =?utf-8?B?b2k1eDdsUEQwclZWK2Y4WGRjZ3ROc0o5ekRUNVRnTXFMcDlodlpMclVqV1Rz?=
 =?utf-8?B?cCtSNzFqbGlrbCtVSElHY1BlcjJKaGZXYys5SzFyUUJsY09EbHhSeEFZZFU5?=
 =?utf-8?B?S1lkY2dGVXRuL0krRlAwaHpjRCtHY2Z6QWhVOWhCOURxZzUzeG9Da2phd3k2?=
 =?utf-8?B?RWd4UXcrM2RDODh5UlNDK211OEpodlJUdU43TTBla2ViYVJJN3VMdm91bXRa?=
 =?utf-8?B?UTFrZUZiU3B5YkhSeVIwWE1zdHpTeE5DTWVmRFlTYm9uY0xXelRWZDQ4cStE?=
 =?utf-8?B?WFNKbHErNStCaHgxaXVhbHFoTHF0blRlWmc5bHFZZnZta1Z5ODJyZGFCZXBp?=
 =?utf-8?B?WVg3bXUva1htdkxvTTBIRHdPbzFDbnRSNTNuYzZGeXU5cTNjMk9nRzZpOGdj?=
 =?utf-8?B?L2x0c0dwK3hQOWI0bWZzcEZoeGNIRHRCeHlIQURFY3hWWUcvcldFNEk2ZFlK?=
 =?utf-8?B?U1dqYmNjdkRCT0RwODFySmV1RlNpRWhvbHRFVTZKOUdzem5LeHlwU3F2MnRU?=
 =?utf-8?B?eUIzZkJlbFNQZjh4SEVKL2I5VGhwVFZ1NVkvcmY2ZlBzdnJsQWNSbHNRd2RY?=
 =?utf-8?B?TWFMa2Q3MnlzbzRIRkdyV2ZLMmxCS01PYnlJOGtkSEtkRDl4bnowcTU4dEZD?=
 =?utf-8?B?OEg5UVZMNGt4NjBhSEtVcThoOHlTN3ZJRlFMWFVxWi9acGVNcm9iQ3p6NEw4?=
 =?utf-8?B?Y2RiRXBMaThSS1pPcnNvTElzRVI5SkVvQlU2ZUd6VHpnUFRkRUdRczNQWTRB?=
 =?utf-8?B?ZUZEdXZURU11V05GS1ZjNmZCdERVMlBsU0VQelplK0dOanRzQ1BvZENsYjRB?=
 =?utf-8?B?ZzZDRUxmeTR1Slhwb1hRM3JrVVc3aUhaVFl5aDFTRWo4Y3RjQWNLekQyaWc2?=
 =?utf-8?B?d0ZLVXRtSmgyTW5VcGFFU3BhUENWRC9sMWhaekZ2SDhySlV5RlgycTBJdGww?=
 =?utf-8?B?aHdrVXdOTVFZaXpkQ3pnVVM5TDZNVXk5bURRd1RiQ2xUQVJWeFFSbTROb25O?=
 =?utf-8?Q?wSaQHaqVG3mk6FcEO6nud89IX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32428b88-e4fe-4e30-631a-08dcd228c61d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:12:54.8204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjS9qXltC6vRFy8oUxBynwcCwM9mCVSYoDoOUFvArJVLAiChZEs6y6V9KN2PFB5nKW4oOV3OZ/4+j7/tTsCq7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809

Hi Hans,

On 9/5/2024 12:22 AM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi,
>
> On 9/3/24 2:38 PM, Suma Hegde wrote:
>> Separate the probes for HSMP ACPI and platform device drivers.
>>
>> Provide a Kconfig option to choose between
>> ACPI or the platform device based driver.
>> The common code which is the core part of the HSMP driver
>> maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
>> these two driver configs.
> <snip>
>
>> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
>> index b55d4ed9bceb..b10ff91e9f5a 100644
>> --- a/drivers/platform/x86/amd/hsmp/Kconfig
>> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
>> @@ -4,14 +4,45 @@
>>   #
>>
>>   config AMD_HSMP
>> -     tristate "AMD HSMP Driver"
>> -     depends on AMD_NB && X86_64 && ACPI
>> +     tristate
>> +
>> +menu "AMD HSMP Driver"
>> +     depends on AMD_NB || COMPILE_TEST
>> +
>> +config AMD_HSMP_ACPI
>> +     tristate "AMD HSMP ACPI device driver"
>> +     depends on ACPI
>> +     select AMD_HSMP
>>        help
>> +       Host System Management Port (HSMP) interface is a mailbox interface
>> +       between the x86 core and the System Management Unit (SMU) firmware.
>>          The driver provides a way for user space tools to monitor and manage
>> -       system management functionality on EPYC server CPUs from AMD.
>> +       system management functionality on EPYC and MI300A server CPUs
>> +       from AMD.
>> +
>> +       This option supports ACPI based probing.
>> +       You may enable this, if your platform BIOS provides an ACPI object
>> +       as described in amd_hsmp.rst document.
>> +
>> +       If you choose to compile this driver as a module the module will be
>> +       called amd_hsmp.
>>
>> +config AMD_HSMP_PLAT
>> +     tristate "AMD HSMP platform device driver"
>> +     depends on AMD_HSMP_ACPI=n
> I was about to merge this series, but this is going to cause
> a regression for users running distro kernels which rely on
> the old legacy probing.
>
> So before this we had 1 driver which would auto-load on systems
> which have the new ACPI description of the HSMP and which could
> be manually modprobed on systems which require the legacy enumeration.
>
> But now if linux distributions enable AMD_HSMP_ACPI then there
> will be no way for users with systems which lack the ACPI description
> of the HSMP to still get HSMP support.
>
> I guess what you want here is to avoid the legacy driver loading
> on systems which do have the ACPI description. But the way to do
> that would be to do a runtime check for the ACPI description,
> not disallow building the legacy driver altogether.
>
> E.g. you could do the following in hsmp_plt_init() :
>
>          if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
>                  pr_err("The legacy HSMP driver cannot load on this system, please use hsmp_acpi instead\n");
>                  return -ENODEV;
>          }
>
> I see that you also build both drivers into a single module,
> yes then you cannot have both because you cannot have 2 init
> functions.
>
> Please split things into 3 modules, one shared hsmp_common.ko +
> a hsmp_acpi.ko + hsmp_legacy.ko

Ok, I will keep Kconfig as is with 3 config symbols, but will remove 
"depends on AMD_HSMP_ACPI=n" and modify the Makefile to build 3 modules.

hsmp_common.ko, + amd_hsmp.ko (instead of hsmp_legacy.ko, keeping name 
as amd_hsmp.ko to keep legacy name for the legacy module).

+ hsmp_acpi.ko.

Also will add a check acpi_dev_present() as mentioned above in 
hsmp_plt_init().

Because of the change in config symbols, Linux distributions have to 
enable either AMD_HSMP_ACPI or AMD_HSMP_PLAT or both to get HSMP modules 
compiled.

> Regards,
>
> Hans

Thanks and Regards,

Suma

>
>
>
>
>> +     select AMD_HSMP
>> +     help
>>          Host System Management Port (HSMP) interface is a mailbox interface
>>          between the x86 core and the System Management Unit (SMU) firmware.
>> +       The driver provides a way for user space tools to monitor and manage
>> +       system management functionality on EPYC and MI300A server CPUs
>> +       from AMD.
>> +
>> +       This option supports platform device based probing.
>> +       You may enable this, if your platform BIOS does not provide
>> +       HSMP ACPI object.
>>
>>          If you choose to compile this driver as a module the module will be
>>          called amd_hsmp.
>> +
>> +endmenu
>> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
>> index 0cc92865c0a2..18d9a0d1e8c5 100644
>> --- a/drivers/platform/x86/amd/hsmp/Makefile
>> +++ b/drivers/platform/x86/amd/hsmp/Makefile
>> @@ -4,5 +4,7 @@
>>   # AMD HSMP Driver
>>   #
>>
>> -obj-$(CONFIG_AMD_HSMP)               += amd_hsmp.o
>> -amd_hsmp-objs                        := hsmp.o plat.o acpi.o
>> +obj-$(CONFIG_AMD_HSMP)                       += amd_hsmp.o
>> +amd_hsmp-objs                                := hsmp.o
>> +amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)     += plat.o
>> +amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)     += acpi.o
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 6f8e7962266a..766617e6adc7 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -9,11 +9,15 @@
>>
>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>
>> +#include <asm/amd_nb.h>
>> +
>>   #include <linux/acpi.h>
>>   #include <linux/device.h>
>>   #include <linux/dev_printk.h>
>>   #include <linux/ioport.h>
>>   #include <linux/kstrtox.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/uuid.h>
>>
>> @@ -21,6 +25,10 @@
>>
>>   #include "hsmp.h"
>>
>> +#define DRIVER_NAME          "amd_hsmp"
>> +#define DRIVER_VERSION               "2.3"
>> +#define ACPI_HSMP_DEVICE_HID "AMDI0097"
>> +
>>   /* These are the strings specified in ACPI table */
>>   #define MSG_IDOFF_STR                "MsgIdOffset"
>>   #define MSG_ARGOFF_STR               "MsgArgOffset"
>> @@ -200,7 +208,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>>        sock->sock_ind          = sock_ind;
>>        sock->dev               = dev;
>>        sock->amd_hsmp_rdwr     = amd_hsmp_acpi_rdwr;
>> -     hsmp_pdev.is_acpi_device        = true;
>>
>>        sema_init(&sock->hsmp_sem, 1);
>>
>> @@ -213,7 +220,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>>        return hsmp_read_acpi_dsd(sock);
>>   }
>>
>> -int hsmp_create_acpi_sysfs_if(struct device *dev)
>> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>>   {
>>        struct attribute_group *attr_grp;
>>        u16 sock_ind;
>> @@ -236,7 +243,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>>        return devm_device_add_group(dev, attr_grp);
>>   }
>>
>> -int init_acpi(struct device *dev)
>> +static int init_acpi(struct device *dev)
>>   {
>>        u16 sock_ind;
>>        int ret;
>> @@ -270,3 +277,72 @@ int init_acpi(struct device *dev)
>>
>>        return ret;
>>   }
>> +
>> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>> +     {ACPI_HSMP_DEVICE_HID, 0},
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>> +
>> +static int hsmp_acpi_probe(struct platform_device *pdev)
>> +{
>> +     int ret;
>> +
>> +     if (!hsmp_pdev.is_probed) {
>> +             hsmp_pdev.num_sockets = amd_nb_num();
>> +             if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
>> +                     return -ENODEV;
>> +
>> +             hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
>> +                                           sizeof(*hsmp_pdev.sock),
>> +                                           GFP_KERNEL);
>> +             if (!hsmp_pdev.sock)
>> +                     return -ENOMEM;
>> +     }
>> +
>> +     ret = init_acpi(&pdev->dev);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>> +             return ret;
>> +     }
>> +
>> +     ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
>> +     if (ret)
>> +             dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>> +
>> +     if (!hsmp_pdev.is_probed) {
>> +             ret = hsmp_misc_register(&pdev->dev);
>> +             if (ret)
>> +                     return ret;
>> +             hsmp_pdev.is_probed = true;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static void hsmp_acpi_remove(struct platform_device *pdev)
>> +{
>> +     /*
>> +      * We register only one misc_device even on multi-socket system.
>> +      * So, deregister should happen only once.
>> +      */
>> +     if (hsmp_pdev.is_probed) {
>> +             hsmp_misc_deregister();
>> +             hsmp_pdev.is_probed = false;
>> +     }
>> +}
>> +
>> +static struct platform_driver amd_hsmp_driver = {
>> +     .probe          = hsmp_acpi_probe,
>> +     .remove_new     = hsmp_acpi_remove,
>> +     .driver         = {
>> +             .name   = DRIVER_NAME,
>> +             .acpi_match_table = amd_hsmp_acpi_ids,
>> +     },
>> +};
>> +
>> +module_platform_driver(amd_hsmp_driver);
>> +
>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>> +MODULE_VERSION(DRIVER_VERSION);
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 78945750d590..5e0c9c36f435 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -15,17 +15,11 @@
>>   #include <linux/acpi.h>
>>   #include <linux/delay.h>
>>   #include <linux/device.h>
>> -#include <linux/module.h>
>> -#include <linux/platform_device.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>>
>>   #include "hsmp.h"
>>
>> -#define DRIVER_NAME          "amd_hsmp"
>> -#define DRIVER_VERSION               "2.2"
>> -#define ACPI_HSMP_DEVICE_HID "AMDI0097"
>> -
>>   /* HSMP Status / Error codes */
>>   #define HSMP_STATUS_NOT_READY        0x00
>>   #define HSMP_STATUS_OK               0x01
>> @@ -228,7 +222,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>>        return ret;
>>   }
>>
>> -static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>   {
>>        int __user *arguser = (int  __user *)arg;
>>        struct hsmp_message msg = { 0 };
>> @@ -284,12 +278,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>        return 0;
>>   }
>>
>> -static const struct file_operations hsmp_fops = {
>> -     .owner          = THIS_MODULE,
>> -     .unlocked_ioctl = hsmp_ioctl,
>> -     .compat_ioctl   = hsmp_ioctl,
>> -};
>> -
>>   ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>>                             struct bin_attribute *bin_attr, char *buf,
>>                             loff_t off, size_t count)
>> @@ -414,193 +402,25 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>>        return ret;
>>   }
>>
>> -static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>> -     {ACPI_HSMP_DEVICE_HID, 0},
>> -     {}
>> -};
>> -MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>> -
>> -static bool check_acpi_support(struct device *dev)
>> -{
>> -     struct acpi_device *adev = ACPI_COMPANION(dev);
>> -
>> -     if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
>> -             return true;
>> -
>> -     return false;
>> -}
>> -
>> -static int hsmp_pltdrv_probe(struct platform_device *pdev)
>> -{
>> -     int ret;
>> -
>> -     /*
>> -      * On ACPI supported BIOS, there is an ACPI HSMP device added for
>> -      * each socket, so the per socket probing, but the memory allocated for
>> -      * sockets should be contiguous to access it as an array,
>> -      * Hence allocate memory for all the sockets at once instead of allocating
>> -      * on each probe.
>> -      */
>> -     if (!hsmp_pdev.is_probed) {
>> -             hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
>> -                                           sizeof(*hsmp_pdev.sock),
>> -                                           GFP_KERNEL);
>> -             if (!hsmp_pdev.sock)
>> -                     return -ENOMEM;
>> -     }
>> -     if (check_acpi_support(&pdev->dev)) {
>> -             ret = init_acpi(&pdev->dev);
>> -             if (ret) {
>> -                     dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>> -                     return ret;
>> -             }
>> -             ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
>> -             if (ret)
>> -                     dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>> -     } else {
>> -             ret = init_platform_device(&pdev->dev);
>> -             if (ret) {
>> -                     dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>> -                     return ret;
>> -             }
>> -             ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
>> -             if (ret)
>> -                     dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>> -     }
>> -
>> -     if (!hsmp_pdev.is_probed) {
>> -             hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>> -             hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>> -             hsmp_pdev.mdev.fops     = &hsmp_fops;
>> -             hsmp_pdev.mdev.parent   = &pdev->dev;
>> -             hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>> -             hsmp_pdev.mdev.mode     = 0644;
>> -
>> -             ret = misc_register(&hsmp_pdev.mdev);
>> -             if (ret)
>> -                     return ret;
>> -
>> -             hsmp_pdev.is_probed = true;
>> -     }
>> -
>> -     return 0;
>> -
>> -}
>> -
>> -static void hsmp_pltdrv_remove(struct platform_device *pdev)
>> -{
>> -     /*
>> -      * We register only one misc_device even on multi socket system.
>> -      * So, deregister should happen only once.
>> -      */
>> -     if (hsmp_pdev.is_probed) {
>> -             misc_deregister(&hsmp_pdev.mdev);
>> -             hsmp_pdev.is_probed = false;
>> -     }
>> -}
>> -
>> -static struct platform_driver amd_hsmp_driver = {
>> -     .probe          = hsmp_pltdrv_probe,
>> -     .remove_new     = hsmp_pltdrv_remove,
>> -     .driver         = {
>> -             .name   = DRIVER_NAME,
>> -             .acpi_match_table = amd_hsmp_acpi_ids,
>> -     },
>> +static const struct file_operations hsmp_fops = {
>> +     .owner          = THIS_MODULE,
>> +     .unlocked_ioctl = hsmp_ioctl,
>> +     .compat_ioctl   = hsmp_ioctl,
>>   };
>>
>> -static struct platform_device *amd_hsmp_platdev;
>> -
>> -static int hsmp_plat_dev_register(void)
>> +int hsmp_misc_register(struct device *dev)
>>   {
>> -     int ret;
>> -
>> -     amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
>> -     if (!amd_hsmp_platdev)
>> -             return -ENOMEM;
>> -
>> -     ret = platform_device_add(amd_hsmp_platdev);
>> -     if (ret)
>> -             platform_device_put(amd_hsmp_platdev);
>> -
>> -     return ret;
>> +     hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>> +     hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>> +     hsmp_pdev.mdev.fops     = &hsmp_fops;
>> +     hsmp_pdev.mdev.parent   = dev;
>> +     hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>> +     hsmp_pdev.mdev.mode     = 0644;
>> +
>> +     return misc_register(&hsmp_pdev.mdev);
>>   }
>>
>> -/*
>> - * This check is only needed for backward compatibility of previous platforms.
>> - * All new platforms are expected to support ACPI based probing.
>> - */
>> -static bool legacy_hsmp_support(void)
>> +void hsmp_misc_deregister(void)
>>   {
>> -     if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
>> -             return false;
>> -
>> -     switch (boot_cpu_data.x86) {
>> -     case 0x19:
>> -             switch (boot_cpu_data.x86_model) {
>> -             case 0x00 ... 0x1F:
>> -             case 0x30 ... 0x3F:
>> -             case 0x90 ... 0x9F:
>> -             case 0xA0 ... 0xAF:
>> -                     return true;
>> -             default:
>> -                     return false;
>> -             }
>> -     case 0x1A:
>> -             switch (boot_cpu_data.x86_model) {
>> -             case 0x00 ... 0x1F:
>> -                     return true;
>> -             default:
>> -                     return false;
>> -             }
>> -     default:
>> -             return false;
>> -     }
>> -
>> -     return false;
>> +     misc_deregister(&hsmp_pdev.mdev);
>>   }
>> -
>> -static int __init hsmp_plt_init(void)
>> -{
>> -     int ret = -ENODEV;
>> -
>> -     /*
>> -      * amd_nb_num() returns number of SMN/DF interfaces present in the system
>> -      * if we have N SMN/DF interfaces that ideally means N sockets
>> -      */
>> -     hsmp_pdev.num_sockets = amd_nb_num();
>> -     if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
>> -             return ret;
>> -
>> -     ret = platform_driver_register(&amd_hsmp_driver);
>> -     if (ret)
>> -             return ret;
>> -
>> -     if (!hsmp_pdev.is_acpi_device) {
>> -             if (legacy_hsmp_support()) {
>> -                     /* Not ACPI device, but supports HSMP, register a plat_dev */
>> -                     ret = hsmp_plat_dev_register();
>> -             } else {
>> -                     /* Not ACPI, Does not support HSMP */
>> -                     pr_info("HSMP is not supported on Family:%x model:%x\n",
>> -                             boot_cpu_data.x86, boot_cpu_data.x86_model);
>> -                     ret = -ENODEV;
>> -             }
>> -             if (ret)
>> -                     platform_driver_unregister(&amd_hsmp_driver);
>> -     }
>> -
>> -     return ret;
>> -}
>> -
>> -static void __exit hsmp_plt_exit(void)
>> -{
>> -     platform_device_unregister(amd_hsmp_platdev);
>> -     platform_driver_unregister(&amd_hsmp_driver);
>> -}
>> -
>> -device_initcall(hsmp_plt_init);
>> -module_exit(hsmp_plt_exit);
>> -
>> -MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>> -MODULE_VERSION(DRIVER_VERSION);
>> -MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 9c5b9c263fc1..9ab50bc74676 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -52,7 +52,6 @@ struct hsmp_plat_device {
>>        struct hsmp_socket *sock;
>>        u32 proto_ver;
>>        u16 num_sockets;
>> -     bool is_acpi_device;
>>        bool is_probed;
>>   };
>>
>> @@ -61,14 +60,13 @@ extern struct hsmp_plat_device hsmp_pdev;
>>   ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>>                             struct bin_attribute *bin_attr, char *buf,
>>                             loff_t off, size_t count);
>> -int hsmp_create_non_acpi_sysfs_if(struct device *dev);
>> -int hsmp_create_acpi_sysfs_if(struct device *dev);
>>   int hsmp_cache_proto_ver(u16 sock_ind);
>>   umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>                                  struct bin_attribute *battr, int id);
>>   int hsmp_create_attr_list(struct attribute_group *attr_grp,
>>                          struct device *dev, u16 sock_ind);
>>   int hsmp_test(u16 sock_ind, u32 value);
>> -int init_platform_device(struct device *dev);
>> -int init_acpi(struct device *dev);
>> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>> +void hsmp_misc_deregister(void);
>> +int hsmp_misc_register(struct device *dev);
>>   #endif /* HSMP_H */
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index e18cf82478a0..e49b53f8c5e3 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -12,11 +12,16 @@
>>   #include <asm/amd_nb.h>
>>
>>   #include <linux/device.h>
>> +#include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/platform_device.h>
>>   #include <linux/sysfs.h>
>>
>>   #include "hsmp.h"
>>
>> +#define DRIVER_NAME          "amd_hsmp"
>> +#define DRIVER_VERSION               "2.3"
>> +
>>   /*
>>    * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>>    * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
>> @@ -50,7 +55,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>>        return ret;
>>   }
>>
>> -int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>> +static const struct file_operations hsmp_fops = {
>> +     .owner          = THIS_MODULE,
>> +     .unlocked_ioctl = hsmp_ioctl,
>> +     .compat_ioctl   = hsmp_ioctl,
>> +};
>> +
>> +static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>>   {
>>        const struct attribute_group **hsmp_attr_grps;
>>        struct attribute_group *attr_grp;
>> @@ -88,7 +99,7 @@ static inline bool is_f1a_m0h(void)
>>        return false;
>>   }
>>
>> -int init_platform_device(struct device *dev)
>> +static int init_platform_device(struct device *dev)
>>   {
>>        struct hsmp_socket *sock;
>>        int ret, i;
>> @@ -134,3 +145,132 @@ int init_platform_device(struct device *dev)
>>
>>        return 0;
>>   }
>> +
>> +static int hsmp_pltdrv_probe(struct platform_device *pdev)
>> +{
>> +     int ret;
>> +
>> +     hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
>> +                                   sizeof(*hsmp_pdev.sock),
>> +                                   GFP_KERNEL);
>> +     if (!hsmp_pdev.sock)
>> +             return -ENOMEM;
>> +
>> +     ret = init_platform_device(&pdev->dev);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>> +             return ret;
>> +     }
>> +
>> +     ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
>> +     if (ret)
>> +             dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>> +
>> +     return hsmp_misc_register(&pdev->dev);
>> +}
>> +
>> +static void hsmp_pltdrv_remove(struct platform_device *pdev)
>> +{
>> +     hsmp_misc_deregister();
>> +}
>> +
>> +static struct platform_driver amd_hsmp_driver = {
>> +     .probe          = hsmp_pltdrv_probe,
>> +     .remove_new     = hsmp_pltdrv_remove,
>> +     .driver         = {
>> +             .name   = DRIVER_NAME,
>> +     },
>> +};
>> +
>> +static struct platform_device *amd_hsmp_platdev;
>> +
>> +static int hsmp_plat_dev_register(void)
>> +{
>> +     int ret;
>> +
>> +     amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
>> +     if (!amd_hsmp_platdev)
>> +             return -ENOMEM;
>> +
>> +     ret = platform_device_add(amd_hsmp_platdev);
>> +     if (ret)
>> +             platform_device_put(amd_hsmp_platdev);
>> +
>> +     return ret;
>> +}
>> +
>> +/*
>> + * This check is only needed for backward compatibility of previous platforms.
>> + * All new platforms are expected to support ACPI based probing.
>> + */
>> +static bool legacy_hsmp_support(void)
>> +{
>> +     if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
>> +             return false;
>> +
>> +     switch (boot_cpu_data.x86) {
>> +     case 0x19:
>> +             switch (boot_cpu_data.x86_model) {
>> +             case 0x00 ... 0x1F:
>> +             case 0x30 ... 0x3F:
>> +             case 0x90 ... 0x9F:
>> +             case 0xA0 ... 0xAF:
>> +                     return true;
>> +             default:
>> +                     return false;
>> +             }
>> +     case 0x1A:
>> +             switch (boot_cpu_data.x86_model) {
>> +             case 0x00 ... 0x1F:
>> +                     return true;
>> +             default:
>> +                     return false;
>> +             }
>> +     default:
>> +             return false;
>> +     }
>> +
>> +     return false;
>> +}
>> +
>> +static int __init hsmp_plt_init(void)
>> +{
>> +     int ret = -ENODEV;
>> +
>> +     if (!legacy_hsmp_support()) {
>> +             pr_info("HSMP is not supported on Family:%x model:%x\n",
>> +                     boot_cpu_data.x86, boot_cpu_data.x86_model);
>> +             return ret;
>> +     }
>> +
>> +     /*
>> +      * amd_nb_num() returns number of SMN/DF interfaces present in the system
>> +      * if we have N SMN/DF interfaces that ideally means N sockets
>> +      */
>> +     hsmp_pdev.num_sockets = amd_nb_num();
>> +     if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
>> +             return ret;
>> +
>> +     ret = platform_driver_register(&amd_hsmp_driver);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = hsmp_plat_dev_register();
>> +     if (ret)
>> +             platform_driver_unregister(&amd_hsmp_driver);
>> +
>> +     return ret;
>> +}
>> +
>> +static void __exit hsmp_plt_exit(void)
>> +{
>> +     platform_device_unregister(amd_hsmp_platdev);
>> +     platform_driver_unregister(&amd_hsmp_driver);
>> +}
>> +
>> +device_initcall(hsmp_plt_init);
>> +module_exit(hsmp_plt_exit);
>> +
>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>> +MODULE_VERSION(DRIVER_VERSION);
>> +MODULE_LICENSE("GPL");
