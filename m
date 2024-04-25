Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4A84FA9
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Apr 2024 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714039408; cv=fail; b=h5dl6DCAPbBUG8MhBPbm6Kb9KOA5n+MjAtvpEu+SrT1+eBctNawtMae2gz3IAWWAfI3++c08UK26sJe87c/UShl5ZoJbzyNHpx1eTmd2a1uymkvmz8ejKOrRpw6jtAY/0iDdHXQR5VFE70pBBmDrSvCLtJnO59PbbS5pOsxgW9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714039408; c=relaxed/simple;
	bh=URrzImL/+P7v+STE6x3wEqmuh6etKSWkKQFvkBvR8Ts=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K7oBs3eIo5EmVBBZwg3ubl3jLYN0ubxnLFQfH6DiLK2F/7jNWRKmmxFa06fn7d6a4lcDfB08Zyqeeq1ETb+3MXyv8ilRwxPT6o7HSyW8OrFnFBi1vwxumwUI2vAqKIwOsZLQZlIPxILbmSrneOTi95IixgrmkOHWKw0cCcqd/5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k9+grLqk; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k9+grLqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqNEj9mqogFoOHr1LKRiIVLLfYNqlJHaTfnFoeByTZsKhllKxwoOQerM3xs8bTRFL+sCjitwy9FA2SdbLZ1eXVEVl+vkyk9Wr8skNxVanrtVtcAUl3W5wiI6GssJh9wz1fJQQS0dXopozQa8ra5MQbKjwYaIZHeFrbdDqlynbRsYQp9hmSISkrl5PvduPd3CXE8jFsAXQAoTtcxYQtScR+f2Po67zh5NzRWJX6S22yo1jfmTl18k3psP+RduZneyVPSdqHxgZH3M+kfPif/R49sdt3q0dZXMlI3MXGJghph+edxQ4Z+XBT13k3m4FZ1NqMNdh046jnxSA884NWmLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXBvvG640N+7fMOjcaFSwFCCZ0pl5IQzVJh9zvvlUmw=;
 b=E/NnnGaqfETiCrbaDyS8NQvFa/LTzGuGrAWDiM+Oh0IDDi2tJyvgMZvkihOtaDPrXZG5sFMnGHno9pf2CxWO+Chma3NgM9A8Yr6tVr6TOh60oljYY7ze21MtWJk+APAyaWQUG6CIGJ+SY9Xa9tZ8Q1LA++OWnSihaLl9fRTTnjDoYPgN/uUPb6YUJ1CITM5OLmn8SURZ26AbcFfzGvNhzesaP7xUITSlpq6JAjog5A4nsv6jqlHvcw6JeV63GM/FUsnByc/oFlmotyGh7Ac0YMluHztX9IvNtFBlDh8bWDarU1LvxEx6Xzuzxm/5R8PoraRQNUdkxJx6VA9N1cNKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXBvvG640N+7fMOjcaFSwFCCZ0pl5IQzVJh9zvvlUmw=;
 b=k9+grLqks0xMYGZ95oLwu41MncnZwGSGFGphNxED5S3T5wdlgjr9qDgTNZjzx/w6X4PN7pTfLkOVsVCWKyWp0L/3qcGCijWSdvjTDh95+KFXci9SsjwgMEad3mktHihO8CVK3t7eZnl7i6ZRHiIt3CwDQ+m+oQ5w9JqNDDkOQHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DS0PR12MB7875.namprd12.prod.outlook.com (2603:10b6:8:14d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.48; Thu, 25 Apr
 2024 10:03:24 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::b608:279c:ed3e:b4c]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::b608:279c:ed3e:b4c%4]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 10:03:24 +0000
Message-ID: <3f80e785-e998-4337-b00d-acf72d65524e@amd.com>
Date: Thu, 25 Apr 2024 15:33:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86/amd/hsmp: Check HSMP support on AMD
 family of processors
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
 <20240423091434.2063246-2-suma.hegde@amd.com>
 <307b0691-e4b7-470d-b4a9-3556a4269cf7@amd.com>
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <307b0691-e4b7-470d-b4a9-3556a4269cf7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::19) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DS0PR12MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 73093c6d-fde3-41d5-3eef-08dc650ef210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3lsWVhNQS9nc1h2dlFvYWRma1A4RGl5UFlsTDU2QjNER29mWFRRbDlSYlBC?=
 =?utf-8?B?aFo5NEtwbTl6b24zR1VhMCtMRHdDdE9ndllqUXdiNmFxMC94ZnZ4b1o1WVBI?=
 =?utf-8?B?ZVduSUxLeDBiU0MxdFp0OWVNeTZFLzI1QmU0a3BOSHFwaTJwRGg5aWxzT1B1?=
 =?utf-8?B?Mmt0RkFsWWQzbkZhZk52dmUxOEhMMnAzQ2xUd0dlUlo3czdac3NjS0hxQUM4?=
 =?utf-8?B?ekkwR2tKSjNha1BOalNHcWNpQ0k0NVFveEJZaERjRXRZeVJLa2d2YUVxekND?=
 =?utf-8?B?WWxWdXpSTHRpb2gxdXp0NW0yM3RUL1I0ZThiYSt0VG8xci9nVklxZmRYb3Ir?=
 =?utf-8?B?T2I0U0pQR3hEaXpNOHZEUVNnNVlkYmkyYWdxSEpjdGIxWklMYUpVQy96Wm5X?=
 =?utf-8?B?NnZXVHZLcGdoajE5VzhlakVVeDM5eS9rL3NZdnV2cEIyMEVhWVZhMjd3UzR4?=
 =?utf-8?B?S2FVMG9BKzcvY2JRWFQ3a1JSM09OTTVCMEgvTEhFbkpSZmZoMzF4T1oxK0t5?=
 =?utf-8?B?OVo5Y0JmL0pPK084eXlWZUpCVEQrcHhjN0J3TE00V2xnbVVXRjlXendYNUFO?=
 =?utf-8?B?NEdnSktuaTkvbGl2V3d0ZVF6N3crQldyVmptcHFRYmI0ZitUWGptc1R0c3c1?=
 =?utf-8?B?ZStBNFplbWNpVnpTL0NyM0Z6VCtkQ0plWitjQTU3TU9ialBOOFBGc3N5QWVj?=
 =?utf-8?B?S3djbW50TStUSnFlZHZ2ZmJhNFVwYnA1eHpWV2I1dFVXd1lHZlRqMlBwODFP?=
 =?utf-8?B?S1hEaXNSeXY3OGM1U1BuclNoVmpOL3Q2eGd5M3IzSDVyd2gyempLa3pmZkpW?=
 =?utf-8?B?VzYrQ2wyd0ZLMC9Xc2tJSkhwc3BvZFRjWnBBS29wL0x6TzIyRyt4WnhZNUFT?=
 =?utf-8?B?OHdaYmRWR2owUHpwdVg3aFp5UVdnYUZlenBmbzNRQmhjcTVUUWJWV0R0OCtr?=
 =?utf-8?B?bTJqcjExNGlKTzU0aFczSTVRQjFJMTk4RnpUUyt2YTJqTFI2RkczaFp0WHJ6?=
 =?utf-8?B?QmdOajB1dFJESDE3UjNGakRRVnZwWEVYbGpGcVFoenc4ZlFKNUtQKzZIcEVO?=
 =?utf-8?B?QTY4L2tLR01QVk1Za213clkxajYyT09OSDc0L1FVK1V1djV4UWdPRU14RnNC?=
 =?utf-8?B?VlhIcmR1eVFreEh0QVJrQ21LSjN4b0JpR044WHkzcmNmYnFYRmN3emh6WGk5?=
 =?utf-8?B?NGNJMDFTU2w5K2U4ZE1sVE93MzI1M3FZM1U1Wll3cWI1d0ZkbFllalBhUFBP?=
 =?utf-8?B?K2ZSRFIvdTZRc3l1OEVZVFNCeEphcEw0ek0yUjdaNGpRdFN2RnRIWm1TUHdy?=
 =?utf-8?B?Tk0ybDRvRE5WSFdHWVM2cVJGdkt0UG1mcUIvdE1UeS83bTRCVG5sUkRuRlI4?=
 =?utf-8?B?NXlEQ2JWVXgxZ1grRmh1bVY2UjB1WnUyTU8zMGFmNzUzQUl5SkRIVUxkdzBq?=
 =?utf-8?B?WEsxYTZjbW81bGVvRW5KM2w4MDZLTFNOQmU3T1hEZ0JnK1J5eXpsMkpuWW9y?=
 =?utf-8?B?ZGNrVjBwUytSWjEzMktTaDEyVjhLS25qNDlGNU1UaVBxOGJoZm5RZE1mQ2ts?=
 =?utf-8?B?dTFuMlZNZEYxbGZkSjhQRXMyTHhQYm9BUG1SanJzS1VZZzhYWS9Ta21DZ2lw?=
 =?utf-8?B?Q2tMbDVNWUtuZ09Xc1NCZGwrVmpwWmc4WkVabnRtaFNjdXJJVTZIQVh2MWpu?=
 =?utf-8?B?WGlrMnpja3BzbnIwQVMzTC9GOGtnc3VlV2RTMXl4c05OZVNaM2p2L2pBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K25jRUxGM0FEMVhIU2NRNnRHalBXSEUrV1Yxc0ljSUd2RnNId0N4K0R5NzlY?=
 =?utf-8?B?dHBaVmdmK3lIUENkTU5aYndQVVBXU1NFOXl6MlIyaVdHdWVIMzNlK3FSdCtE?=
 =?utf-8?B?TTJSWUdhdjMzVWZYQVI4MGJxekJLazNCWTRPRkM3N3BOeStzUlRzS2FhbUg4?=
 =?utf-8?B?NnRFRVZMTWp4dytWc1MxNUwySm9pSE4yZmhVQjd1OWRqQjRVL1o5alE3L0Jh?=
 =?utf-8?B?VDhVRUc3M1h2RndhKzU5UkpFTkkrbnV0TWFtUGdRckFGMjBRa01rRjhpZjZj?=
 =?utf-8?B?d1RRQytmVkNyOW1IVlppVUo4b2VoMy8zdEVHUXRxbS9pb1lwQ2RLMDZvaFAz?=
 =?utf-8?B?QXZMNFBLUndBSHpVTzAzbks0ZVhobDdxYnZUOGN5dmlqVDRUcldJRi9EQW1G?=
 =?utf-8?B?cEVwQk8xNXA5OWM3UWdlRDMzZUEvZFlSVTRybFN1Q3VCbVlWc2FNMU1XYmxX?=
 =?utf-8?B?SEd6ejBLaVhSRW53TTYxbGF2M3E1L2RsczZLempEQ2pFdUpIZ0ZNVFVvY0RH?=
 =?utf-8?B?aDFLZmowVmxFZElrVXlrbTVsRmRCOVVFdTFDMzJGZG5qL0tjNEVDRGtmTWF2?=
 =?utf-8?B?azdkOE15eXhsL2Rlazd1M1JvNjI4bWFIc0JoVXlhQWpRZzF6WlJlelYyZVlj?=
 =?utf-8?B?c0NPQXJha0tReVNlKzhoNGRKaEFhQmVPSDV5a0toSFJWcHJaOE1YVENpd1lx?=
 =?utf-8?B?cG9EVVB2L0FrdHk2cFZwbTNJbVZjcEpKZVBqcWQyMTNMZHM5L1RwTko4S3Mw?=
 =?utf-8?B?QStodmpyTVdsVC9GdW8wTVlETlZVY2JwVEF6Q0NuRGZLTDh0bEVIQ0paSkYv?=
 =?utf-8?B?eVJtbTN4azVDUHhyVEVTNG1EMytUdWN0MENMOGlaaDNEbGVEd3FKLzJoUkJQ?=
 =?utf-8?B?RENkSFI0THJiSVlQMnhQTldLVHFOVThCRnhyVjlRZDRDOUl5eW9ZTHpNd3o5?=
 =?utf-8?B?YWkwcFR0N1h0R2JiYmh3TVYzY2VIdFZ0TDZuRm1WdWhSV3Q0WloxbUlZTGVl?=
 =?utf-8?B?RytiUGs5ZldNL1N2VHJ3MkI5bW5BMW5DcWF2L0U4TkFWY1ZtMzNPTW5ybDhC?=
 =?utf-8?B?LzNXeTBFY3VzV2EyM3g1R0lPTDBlY2pHWCttdU5ib290MlBlM1VselRWaW0v?=
 =?utf-8?B?MVNjbTRLUDRZOXp2THhMNzhpdXFFcWQrQ05HcWU1cEVZT0lhRk1iWk1UcjN5?=
 =?utf-8?B?cmd1S21ESmRVdlB6YTJ3VDk4eGtuS2FKN1RkWitSTFRaaUwxTkFEVjQ3WXVR?=
 =?utf-8?B?WksxNFJPdG40SlhibmorWUNsRDEzaWFIRktYSm9kazV0QmIrMjZYakx1dUV0?=
 =?utf-8?B?eFh6UUc3bmRKNWJtZkFLekp1UHBPdjFsOXBhZDg1UytEQzV2a2xQOFNuYldi?=
 =?utf-8?B?Z0NralREVjVYZnM0NHQveEs2Q0RoWENKOHZDdlNVRUFqbnVBT2hpVWNaN1Za?=
 =?utf-8?B?RGxYaUk3RlpmaDFNckRHRUk4Vk1ZOXdhZURnbllUL2RlSVNZZWxRK2VwZkdW?=
 =?utf-8?B?ZGtaMkt4MUNxYUtZdlhBcm9vVXI3MmcxVWhzbCtTZXBGbWhLdkJZcklWWGZ3?=
 =?utf-8?B?YlFCR29IejNQenBoTkFvblVpQng4ZWxwUEtGWnI5Z3V1SCs2eUtXNHJkVDJT?=
 =?utf-8?B?eUc1VUdiRk95VmFMb0tQQ2Jpa0QxZjJYMEdENk9XUWRzM21WOWIrUWNTM0dz?=
 =?utf-8?B?WnZ1WUw2VXYweCtSU0xkNjg1ZHhNdERsbFNWelZselU0RzZ1MGdTT2s2R0th?=
 =?utf-8?B?Q2xOU2xxNjEyWFhPdHRDS3J4S0tOYzN5SCtmclc1VkxZTXlibXlvWHdOT2Zz?=
 =?utf-8?B?Zlkva3RtMGdQRThoU2hRR2lxOU5PMEhpVDZlK0UrUHBlWFk1RFUrZzNjbUdE?=
 =?utf-8?B?eC9OUGxLTkh1cHV5MVpJNWNKMVVXQUY2RTBaM0V6TTlvdC9QcTVBdHF2Qitn?=
 =?utf-8?B?UTAySU05RTJVa05CMnpYOGc4T0hjQlBwKzZ2V3FnN0RoYUpnMnduOWI5WkU5?=
 =?utf-8?B?K1hoZWhVdnNHVzlFRmRpRHFDWUpGaGkzUnB1SFJJQnVIamw3eENmSWNQUVlB?=
 =?utf-8?B?RU5Nc29nOVgrWXFDSk1DQUJlVFRlTmM2emprckVTVXByUnVweGxvclFHTWxU?=
 =?utf-8?Q?ark18wh7BLENSrgELctPEOHty?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73093c6d-fde3-41d5-3eef-08dc650ef210
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 10:03:24.8487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUUOaOv1DFcz0cByvXNKtsqdoYtE4xdcMCq4UDPJM5DOuxrb6bITF3aCLwoOfvlcYWS6YQ1AkevKd8LAW5h7Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7875

Hi Mario,

On 4/23/2024 10:41 PM, Mario Limonciello wrote:
> On 4/23/2024 04:14, Suma Hegde wrote:
>> HSMP interface is supported only on few x86 processors from AMD.
>> Accessing HSMP registers on rest of the platforms might cause
>> unexpected behaviour. So add a check.
>>
>> Also unavailability of this interface on rest of the processors
>> is not an error. Hence, use pr_info() instead of the pr_err() to
>> log the message.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp.c | 54 ++++++++++++++++++++++++++++-----
>>   1 file changed, 47 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp.c 
>> b/drivers/platform/x86/amd/hsmp.c
>> index 1927be901108..807a5066dacc 100644
>> --- a/drivers/platform/x86/amd/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp.c
>> @@ -907,16 +907,48 @@ static int hsmp_plat_dev_register(void)
>>       return ret;
>>   }
>>   +/*
>> + * This check is only needed for backward compatibility of previous 
>> platforms.
>> + * All new platforms are expected to support ACPI based probing.
>> + */
>> +static bool is_hsmp_supported(void)
>
> I think it's better to use "legacy" in this function name to make it 
> clear that this isn't a requirement for newer platforms going forward. 
> Maybe like
>
> legacy_hsmp_support()?
Ok. I will rename it.
>
>> +{
>> +    bool ret = true;
>
> As this is a simple boolean return with no needing to clear memory, I 
> think you can just "return true" or "return false" everywhere in this 
> function.
Ok, I will check this.
>
>> +
>> +    if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
>> +        return false;
>> +
>> +    switch (boot_cpu_data.x86) {
>> +    case 0x19:
>> +        switch (boot_cpu_data.x86_model) {
>> +        case 0x00 ... 0x1F:
>> +        case 0x30 ... 0x3F:
>> +        case 0x90 ... 0x9F:
>> +        case 0xA0 ... 0xAF:
>> +            break;
>> +        default:
>> +            ret = false;
>> +        }
>> +        break;
>> +    case 0x1A:
>> +        switch (boot_cpu_data.x86_model) {
>> +        case 0x00 ... 0x1F:
>> +            break;
>
> There actually are going to be 0x1A platforms that don't use ACPI?
> I guess I'm surprised.
>
Model 0x00-0x1f are transitional platforms in 0x1A family, where both 
ACPI and non-ACPI is supported.
>> +        default:
>> +            ret = false;
>> +        }
>> +        break;
>> +    default:
>> +        ret = false;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   static int __init hsmp_plt_init(void)
>>   {
>>       int ret = -ENODEV;
>>   -    if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || 
>> boot_cpu_data.x86 < 0x19) {
>> -        pr_err("HSMP is not supported on Family:%x model:%x\n",
>> -               boot_cpu_data.x86, boot_cpu_data.x86_model);
>> -        return ret;
>> -    }
>> -
>>       /*
>>        * amd_nb_num() returns number of SMN/DF interfaces present in 
>> the system
>>        * if we have N SMN/DF interfaces that ideally means N sockets
>> @@ -930,7 +962,15 @@ static int __init hsmp_plt_init(void)
>>           return ret;
>>         if (!plat_dev.is_acpi_device) {
>> -        ret = hsmp_plat_dev_register();
>> +        if (is_hsmp_supported()) {
>> +            /* Not ACPI device, but supports HSMP, register a 
>> plat_dev */
>> +            ret = hsmp_plat_dev_register();
>> +        } else {
>> +            /* Not ACPI, Does not support HSMP */
>> +            pr_info("HSMP is not supported on Family:%x model:%x\n",
>> +                boot_cpu_data.x86, boot_cpu_data.x86_model);
>> +            ret = -ENODEV;
>> +        }
>>           if (ret)
>>               platform_driver_unregister(&amd_hsmp_driver);
>>       }
>
Thanks and Regards,

Suma

