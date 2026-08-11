Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C5F2459C5;
	Tue, 11 Aug 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462681; cv=fail; b=H82U1FYlsCR69Cu3aelOnfwvezcBKCcyheWQLx5KxbaRzNUNBn4Z5V8/Rlw7ro5RtgOuOUItZSJXlcA0PzwqQ86PoBSUOG45FKV20Dzhi4w4AgEUY7OmWSUHsfrnJWVlQ2J7khAwNh0U3llYVZOgRUku5le7Hy5HVyIx2gO9ink=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462681; c=relaxed/simple;
	bh=OoyfoDE+5Byl7a/Sbu2DuNZTCdybVVs2aPasHHAESQ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oqBQ9aSWeLVrRT7NhOhvBOtCd7Hn550V2yjC3clbeNM3EIrSjHkToK8yvjsZZZ/clTqATSFCz85gFPfu09LpWzIxFEnPnJ+sO4EW0IaPAcid4VeLq/u73ilYXw2hP+UtvDm4cUTTSaTZz4iX9sa+Gl57BCXavmkWji58fqvTjGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L72PxPrC; arc=fail smtp.client-ip=40.107.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L72PxPrC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYrqlT5jP917cnch06G3Bux4nJc8YB/kdQ51Pfjre/9/QuqkY21K2PaJgK7Ust3SPwmKgKnQJfZ8NBF6h9gPhNL1+h3VA9X0CyZM98h3sdbrdxlgVlasapy76KDTEtYiyHWOugo1roYMch6jngVPXqFBYvdFw0R9XeT6QZ47gLXaWz0zsc1/Qtv5viiGXzovTyWPA5tS0k4VIwb9XQh2xENadT4alayuUM2VEXDHfqMQYxjSXBCRYm79eATZn88kp7ttM4SjU5WfGFHFBToRUWCOOyehT05Wb6OHZMpkERmRJ9tpIfzioqAeH2VfK5zNENDlAmRnsnwG8Ni/8fbWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9DhRI7omJZvfTrrLsvJ790FF6V84jukgM3KVKnu7kE=;
 b=v1LFghPXIh82HnIupkqXK5gVj2l0MXf9FROqPB6L6BuVbbn+oHZILxhFngKiW5G+zw0UtGsBesiy5VcRAotHlwdLcsN3GLD4iZyWSYjT5IeTX7I+SaCpbsfXuSZoUDTtiKNIHivfaI2FTVDythwsgc+5cgY1tfbUQqxcniD6r/oANlSZM4R78RRhze56Z1LvBbJupJ8l8nGe26TQMDUcfliJYoYQ9LwSLLTtUFrKdSnxxvOJQoN00NC5ix6TaSaqNOjJjHdfpJmVKCzKVfCtxpQuKcfQchsp5Tluvv6ywOpFlJnqYEMHfKMp/2sq7ZH8OWiDR2o2SlsAPSBO82g77w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9DhRI7omJZvfTrrLsvJ790FF6V84jukgM3KVKnu7kE=;
 b=L72PxPrCyn8FWnICjNlXbnsUmLQwrCLWuzh3s+REFYN2SN/V+Mb08tIi41j7GMUT18sxuBhZYqnUJTo3kmwBkXdRCQ5AXmTo91YHCzEMTB+kiVj4GOrESZI/yHuxSoQ9NkVD/1l0wMg7NXPha2l4eLpsrqQGuunX5MOTdt2yG9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Tue, 11 Aug 2026 15:37:54 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 15:37:54 +0000
Message-ID: <096d4329-fad8-4fc2-88a3-dd50869f7f19@amd.com>
Date: Tue, 11 Aug 2026 10:37:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Fix NULL deref in amd_isp_probe
Content-Language: en-US
To: "Nirujogi, Pratap" <pnirujog@amd.com>, Xueqin Luo <luoxueqin@kylinos.cn>,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: pratap.nirujogi@amd.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260810032450.692844-1-luoxueqin@kylinos.cn>
 <7ad7533f-c55c-44ec-91a1-53153d632fb3@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <7ad7533f-c55c-44ec-91a1-53153d632fb3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:610:5b::37) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa3c412-6aad-4bc2-0cf5-08def7be828c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|11063799006|3023799007|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	FsOeyL+WTZxXMD1tlqFN5jqXI4QTc12E4p73NBKYp3guG/sBmwmwG+jFb3UtPoVu6ma/SckesEn3+32gbC3Ty5QBgTTHIu99CmTGbdsmKciseKw7KP1XjLJRdjKLJgE6SSWtvJL+S/khJdN5/Bab/Xc9iJgXawZTRji2k1QDXvx4WPe1TDJnSXkJY/wbRuMe6/c/M0eRejfo/VWLVbhpdt8F5sLVPNglSvIj1O29N0eo57Dy5B7obJwFx+zqJNCsYUGvE6JSHgC29fZc17o44Bt1c2QYFBo+HEbFrt6GXoi+5TbF4u5bt9FQbSMZnm+59DlykliwB8ClMMsgrBvDWgxrWVzWrSExzt7q87jGrm+wpbj/aMPrxfeDuGhDPaXQ6H/4ww1caPrmd0G64Urk13ZZcwwKmSkVB4Ylj/KgRbV2dQgXoZtvD0j833OwZGu/zUSZZXcetG43NWDGWeozNY5nKIjyrArtipHhIlT/7QJf0lUTGdxj1gEuavSj3gCK9Zx2bhKR7mqje4iyUJQDvrkj/Bsh00wSZgBmHtKyVu2/e0/167D3u4XNzmRf5tFJQZ77rEnguEBBa8NHtPnldxj8TsMMqrBaH3hVM3nKfhVtLqypQBOlg+0ve0V7GWmLklw1HrsBZeJYKFOM6SAbeHGbN7TvL4O45AtLh+zyNi0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTVMWHBsalRKMmFrUzJhTGVOVFU2RlhRQXZKWG1DMVlpUkE4RlcxWTdmeGFv?=
 =?utf-8?B?dU1pSnFtd1l6Wms5S05rcmlXSTcxNGx2Nk5MM2k3N2lUNkJZZHkzcnMzbytF?=
 =?utf-8?B?WFR4N2EvSnBXV3dyWG41VnJlcXN2WFpuZEN5SmQxbmpkM2RFcU1RbGJEektn?=
 =?utf-8?B?RG9BdERjWjNFd1lpemFmRE5VVjJmVWZmeEUyN1RrV3kvS2x6MEtRdm5wU1Nq?=
 =?utf-8?B?dWlDTjR0QWhoTm5kS2JhdlJoeEpCRnF1Q3JFQi9iWlRQaENOeHJ6UTBsTkNv?=
 =?utf-8?B?WHdrTm5kRmRERmxVeVhPQjJaS0Rqdmpvei9aNHg3YTFyRU9FK3NJNnN5bnlT?=
 =?utf-8?B?WVZSRDNKMVFkSnBBVU0rd1oxK0hFSjhLRmNLanYrYjJUUGNUNnNvWmZaK0lU?=
 =?utf-8?B?Z3psTURVanpkY2F1eHQvWXArTzhpcTNlUVdvMmU4eFEvY2dtT1E2RUs3K1pu?=
 =?utf-8?B?ZnFpaEVsZkpvblF1bEtiQVhGbk05NERlU3pCQitROTRRQUFSc0hwRTQrWnM5?=
 =?utf-8?B?SjI2bUJsMGFkTSsyWXdzQVhoRVBuR2FqWFloVUhZZFpQRk9DcFNpUzEvVXpS?=
 =?utf-8?B?ZElVVklGSFVIU0x2UVA1ZmpVOUxlYXRQdmxoQStNUHFCeWtBL214dXFpd2xk?=
 =?utf-8?B?am41NG5STW9WWHhBMzJMdk1VS1BrTzRWV09lYVJuZ0tEcjY1K2JkTVQxZ3Rq?=
 =?utf-8?B?QncrWGdJVWdXby9BZkRiNlFLZlRtRFdWUm01aVB4OCtFTW1kVzEyZ2xoYjkz?=
 =?utf-8?B?Nkk2NytEUmpNTDAxRng5T0l1Z3VmU24waXVVcE9palB2VkZvYWx4dHVnUE1j?=
 =?utf-8?B?dVFQQXJ4d1U1cVc5N2Q5OENQTmRiKytmNWhKc0pjV3Z2Rm95cU1YMlU1d2d2?=
 =?utf-8?B?LzVHczJ2d2RoV0FEUzFoYzNLNUdsL24wcURVWmZuVUNkT2I4a1RYbXVCcUFz?=
 =?utf-8?B?U2Q2Sko1cjRZUWI2b3Q5RkFZbDNEUCtIQWREUXVSbUkyWC83bVZhODlZSTJT?=
 =?utf-8?B?VkhLSVl0cGtzano2dkF2QXRacjZpUU12Z1pCZ3UxSTNVUTRyeE9laHRjLzhX?=
 =?utf-8?B?akxpK3k0RE9qU1VvUUQ1TjZzcVVTd1M1aWx4UnhieHpBTU96UzV3RGNRT2pB?=
 =?utf-8?B?K042VFd1ZXhDZ2xBbmkya3VJZlYwOHFlQkQ2Y0RFbFUyNjJNOGhBQnNuTjJn?=
 =?utf-8?B?ajNuUWpBa3FLZzNaV3Y2bnRGZVhXaFdKTElFWWpBWlpvdndNd0NCR2I3a3Nz?=
 =?utf-8?B?Zk00RUpzY3doNWpnTkwwSmhDRFMyUzJVT25FeU1nVVd4M2Z2QVFQQy9pNXN6?=
 =?utf-8?B?Y1VrWUw5ZlZHWjYvdXdQbWpwR21jM1cxejhyeFdSaFJyM2kyVnFqTVFCRmFY?=
 =?utf-8?B?bk5Ka3lTSjRrSGZJNXNMOW82cDBxVXlGVlhsdGxWYjIwUTEwTHlNQXVPTVRJ?=
 =?utf-8?B?U09FLzFsTDVRM2c3U2ZpbDRobVRoNTJzekErSjQrMjYvQ0N1NHdDWHVOemp6?=
 =?utf-8?B?RkRpblpselo2VkZDQWM4ZkVBY2s0Yzk2cGpwNUwrZ0trUWpFOW81Q0ptZ1pH?=
 =?utf-8?B?dXllNDhuL3JWTkViMHN0QmhwSW5lby8zeWhuYTYwRlFVcUllQW41SUVXdFBZ?=
 =?utf-8?B?aXhhVWIrWDFsUXJNNHhyZ0tuKzNhaFZQc0JpRDI1Y05GTlF1blgzOU9hMmk5?=
 =?utf-8?B?d0ZSNTBjUmNyNDhZK1hiWHY5RGhYMTZydzZhc2RvbXZnTFozdE9abzBRZFlj?=
 =?utf-8?B?WHVlT0NHVzVYSXpIOWZtSjBjL29yeEtVMmlNK0E5VWFRY1VKZkJMV25MOEk1?=
 =?utf-8?B?Tzg1MUU3c2tScmQ3N0RHbitxa1FuZkVmU1ZYR2lpTXg1cnh2RTVoRi96eWtj?=
 =?utf-8?B?WlBWWUFuWnUwNjF3Skt1bVdlNUlheE9TNlNxanhYUUJvdElJZEE5a1BpNDdu?=
 =?utf-8?B?UENLTXpiTE9aUVM2NW9QU0VTUnZ1SU1WcVZzOWJUTWgwUlJadkc1ZG9jV0tZ?=
 =?utf-8?B?a1VoNlRFU3ZZbGVMN0dDM3RpVzgvdUk2cDQ3ayt5UGRIZlc1cUVkdGZ6d2Jj?=
 =?utf-8?B?bEM5NEJoWUFBWnhHNnpOaFBrMUpiVGZ6T0dDcWhFdFozV3FZcjZaRklEV2ZD?=
 =?utf-8?B?YWVYb2tJZHZ3SnJMMTcySDlScW5jMjJvaU5qWHpOeUhiNlhkcVR1VFdzUnRl?=
 =?utf-8?B?Tmd6cXRSQlVHZitQN2ZncGltMkE3RUZFaVd6MVArN2pzTmZ0b05QRTNZSmw5?=
 =?utf-8?B?Y2hwSWhZZHV1aE1pQm9PMHFKZjY1WVRPUm50Uk04MHZNQzBQQlNuWWZJQ0ky?=
 =?utf-8?Q?+WMrcWSEKrk+bXpFgn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa3c412-6aad-4bc2-0cf5-08def7be828c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:37:54.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JldqUkPGUXzyQJ4iNBT0V0xuVRlzuwzJmJ3WPl67xrB/OBGGvqs7tRqobEtVoYys558Z0/pzFPEvl+2hn1Gfow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289



On 8/10/26 16:52, Nirujogi, Pratap wrote:
> 
> 
> On 8/9/2026 11:24 PM, Xueqin Luo wrote:
>> [You don't often get email from luoxueqin@kylinos.cn. Learn why this 
>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This message originated from an External Source. Use proper 
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> amd_isp_probe() uses ACPI_COMPANION() without NULL check. Add it to
>> prevent crash when driver_override matches a device without ACPI
>> companion.
>>
>> Fixes: e1af6f0146d6 ("platform/x86: Update swnode graph for amd isp4")
>> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
>> ---
>>   drivers/platform/x86/amd/amd_isp4.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/ 
>> x86/amd/amd_isp4.c
>> index 0d494899502c..0026d6663c5c 100644
>> --- a/drivers/platform/x86/amd/amd_isp4.c
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -379,6 +379,11 @@ static int amd_isp_probe(struct platform_device 
>> *pdev)
>>                  goto error_unregister_sw_node;
>>
>>          adev = ACPI_COMPANION(&pdev->dev);
>> +       if (!adev) {
>> +               ret = -ENODEV;
>> +               goto error_unregister_notifier;
>> +       }
>> +
>>          /* initialize root amd_camera_node */
>>          adev->driver_data = (void *)pinfo->swnodes[0];
>>
>> @@ -388,6 +393,8 @@ static int amd_isp_probe(struct platform_device 
>> *pdev)
>>          platform_set_drvdata(pdev, isp4_platform);
>>          return 0;
>>
>> +error_unregister_notifier:
>> +       bus_unregister_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
>>   error_unregister_sw_node:
>>          software_node_unregister_node_group(isp4_platform->pinfo- 
>> >swnodes);
>>          return ret;
> LGTM. I agree that adding the NULL check is good practice. That said, I 
> believe it's not strictly needed as the device_get_match_data() in 
> line#366 is expected to fail if there is no ACPI companion.

It sounds like it's essentially dead code then.

> 
> https://github.com/torvalds/linux/blob/master/drivers/platform/x86/amd/ 
> amd_isp4.c#L366
> 
> Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
>> -- 
>> 2.43.0
>>
> 

