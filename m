Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155FF1E507
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730211360; cv=fail; b=SRbVVH3uZ0nhB9kF+MrXxgGf+6vdrOcbX9phCgofA2DDpSxIIQmEtX2Q8wm3MzP3os0WF29XZ7iJfJP6IhqhXXErKNuA378WeUwzEdPqxVvkDsGhjEUjMgzK8iQKMYAHtDLR/y/kVgqFyfYx4tQVf+bg9IJGaxq3rtvTOe6llU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730211360; c=relaxed/simple;
	bh=eZYl+Pkxs0Qc8HOOo9ULNRXztCRiCRGrdjOasc2LEZQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s+kU3A1GoohDbEVkYj5HRFuSLp7F3fwhj4r7EgTmT7Lradr4bwm1uXzYiwsOEYT8GKufen12vx9teo1n78TpqgwywPDcz/+SP+sFJV4Q0d5vV7QIsEitEatbNDLpHfO+3E0wrnLsE2zLivNw4u7U9sGw89JYwK37qbEyjgTbLFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PG3wYPcx; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PG3wYPcx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUlJMSyp1iP4rQZ6ytIxBgbsi2L8/eluw6fWrD9g64vw8keaM4uWIHlmeHvFyz1EiEKO3SLZa81hoFw43yrBDN4Y/VoqZdXDODexPlBG2wMeQZuAwuT/gGj88rdCgsJiucqwB6DBaoezB2ouH3ycE43mKaisWr5AmrpO46AKRZhgWlYNeGol/24ENlwBQQbEUSgsqXTcICRVaAKG+doUPsp7i1r4RfmaZPic7hOk+TkvcYIRrdzEWWJQds4oNWgRNUEkZjH0cmtpOF/3C2fyJhDXpSjgDj3ycBwzr4mbdEJ7waulihnte0enMifYoiAZdDngNNKZqTbSCBbAbcxsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbbhqL74YeyoB4Am8iwPpbL7xm/e9T4kWOzD4fnBU8U=;
 b=c1SOFHefitLTeSQ5zRbpFYaeo9UAuGTUwKQLiN5IFa6WleDN50QizK2kxu3CiF/4ONoxMY33wbA+4HnMK9icO42zC8IvefFDgB/4ITzFtM35Yn2/cFOM2Z8zfrUkKIBGBzfxIXhse0p9tFWHjnBWuq8kVftiBaxYlSTWrr78XzsYoQDlfpTRn7iKGggIK3YzC2WcfRd+q6uTdVL/KsGGYXqw/g1WCwFJDbuysGh5TJmb+6DlHuLYsxJxnGSNJHoXG4jbq7IxDq5/PNn0OkAT0gmF33M9SGQaaMjTucesM6sik0iD2fOg0Ftr64RpXwySPnf+THjnP8gJJN9gjtxlWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbbhqL74YeyoB4Am8iwPpbL7xm/e9T4kWOzD4fnBU8U=;
 b=PG3wYPcxfsddO66Z7aY+x4J5sIYcZA/016oZEEvxQaLIiqkybpZ1yAzB78UY224uHYbkOENC89JerKdETQu02RlVtY1kg+jVQVf9b75vjN2cLPxxkpFDSUrVvoQ9BnPKnX2eQD61t6OrJ84cOVuT+gRKrNqIM5YSqV+lB0EKLZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB8580.namprd12.prod.outlook.com (2603:10b6:610:192::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 14:15:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 14:15:54 +0000
Message-ID: <cd26a6d1-a9fb-405f-878d-4b47a2095fca@amd.com>
Date: Tue, 29 Oct 2024 09:15:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] platform/x86/amd/pmc: Add STB support for AMD Desktop
 variants
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-8-Shyam-sundar.S-k@amd.com>
 <b1a97ede-3201-4b04-96b0-9a5df92254f8@amd.com>
 <5b2e7143-97f3-4907-96c0-21a513058df5@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5b2e7143-97f3-4907-96c0-21a513058df5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2d9c4b-91ff-4f5b-515c-08dcf82432f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1VFUWcyemdtSm1lRVRsSWxxL3N0VTN2Tk1acGxCVlRWRy9hRWpYd0JGcWkw?=
 =?utf-8?B?aURZeWw1Sllmamp5d1l4czNFbjVTbXc1ZTBDaGNwYmIyODZaWmcrNUJFV0tD?=
 =?utf-8?B?RDByL0QwTk1temEvN1A5TXZrVjNQZTdUVU1qZDJIeXE1dFY0b1FlZjRhQ2tC?=
 =?utf-8?B?TkZEZzJnS1hUbXN1bFIrZDFYRGl0MGNUVWhKajZyazdJL2pCb0JKVzBYS29l?=
 =?utf-8?B?aCsvcmVwd2dxSDFWYkZvZkRRNHB0RmxEaGRUUzF3ekpqblRmUmpGVmtNZ1Bp?=
 =?utf-8?B?UHBqelRVOWt6NEJPRU44bE82MkpGN2NOTDBFWFhVeFFDdFcyMy9iTHIwQzJi?=
 =?utf-8?B?aU41TUVUSEtYZ2tCT2V4UDhHSmVoSTdTNmtnVWxIcWZKMXY0V3BlbG9jMzlP?=
 =?utf-8?B?Q0hjTEN2LzMxazM0ZDE2UmtCK2pUby9LUjBhbG02UWxCcVBjU050S2NRYWtU?=
 =?utf-8?B?aEtSWXJiQkZDa1ZVUE5PaU1QNUlWOHVEVldOc1M0L3c1dm5yL0U1cWJYcXEy?=
 =?utf-8?B?RmpiWTNTNFl1ZzJKUytuUU9vVTJlbTFhV0U4OXNKYVNxckxvV0oreUFkSE5a?=
 =?utf-8?B?bFo1OENSMUlmR29oVDkyWW9JQ3IzUDhNa0hlWGxJRWpJQkFZUmxhSmdRRnkv?=
 =?utf-8?B?N050Z1c0UlRDaCtSMEIvVnFmU0xvVG9nRWxlTUptTERKSUZxYjV1K1YzMzNn?=
 =?utf-8?B?ZUtKRHNkUCtUMmRWVy8xM2FBTnhnV0d6dXQ4cVo2Q25TM1BGclJsVWxUL3hV?=
 =?utf-8?B?ZVRkQzZ3aDZWZGhISTFIb005OHVTWnl6ZlhXTFVpVXdpT2N3YlZsZ01GYlJB?=
 =?utf-8?B?bzBWWmNUOURHd3REZXRZRUpnYWxiMWFKNlA5WXh1TlNHcnowRUVLaHE0RWM5?=
 =?utf-8?B?VUoveHM4YUpjcW9JRUk3WnVWcWEzTU1xaFhaOFhiRkpkVWFCaWEyaGlMRUNQ?=
 =?utf-8?B?dWtOTnZEL0ZCVjRKc3NVTFZJQUtvWFJDM1JKRDRnUVRpa2FKNkZJdkU3QTh0?=
 =?utf-8?B?YllOUEtTNUxSejNIUVV1T0NkSkdGQnZQVTB1L1ljdk9lRzRZREhUZnhZdkVT?=
 =?utf-8?B?d1BlWlJvQzltMld3UHBoS1J3aWtOUFlhbS85UzF6bk8rS1Bpc0oxYUJKbmxp?=
 =?utf-8?B?MGJya2wvK1FjYlJzeldNQzVNSDg4UGxRZnNGM0lSbnA3bityRlVyVHQreU9M?=
 =?utf-8?B?NVF3OUJ2WkY4RGMrV25acXZoVjBLK1FEeGs2dlJySTZ6YVZaZVRpSmRjOXRt?=
 =?utf-8?B?Syt1TDNYbjRDdzBJYVhIdVRiaTRwMUVvcUkrK1dWRVRMSHV4Vm5vNC9TMDcv?=
 =?utf-8?B?dDVKTTJYdExzb3JvVnlwa3RWOXZKNDQzRm02Y1pNZHdNcHkxbFhjUjI1Vi9w?=
 =?utf-8?B?VGpoYU9NM2pVUHdscVV1aDNiaWRwTnFVSmhYWDYwMzg1dU5oSEtQZnRpUGFk?=
 =?utf-8?B?eFY4R29wdE1jdWRCOE93U3pXV0RRTFVDdE10REZ2Rm42ck9qbHRpRGtXZTNp?=
 =?utf-8?B?YnBmUEJTUFg5TDlyTWpTMWpHUXVBaVBpQmd3SGNPVkhuUFBvaEJWMVNmQzJ0?=
 =?utf-8?B?VGVVUnBpTy9yTzIyU08wZWdoU3FjazM1NlU1OVZYbC9tOE92Vzgzdkc3OXg2?=
 =?utf-8?B?L1R5L1F2UHpxcVRCZGV3TWRBUXpTNDIzaVBybUttdHBmTEtvQ2FBT2xzUjJa?=
 =?utf-8?B?azVBNG5zS3NybldXVDlrS0RwN0NpdTBiWW5id1hMb084KzQram1DQTZjYzVI?=
 =?utf-8?Q?MZQw0UIb3ClWtfM9Qx1R71hTpd4vmS2jjMlOGLP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE10UU0ySXh2TlZIL24wWGJVQkhnMHN4dWlrcFdlbnd3NjMwVTM1R2ZaMVNR?=
 =?utf-8?B?Vm12ZGZoMzBmWHZocWdDZ2ZBYzhJa2tuRlgzaU5ockhNMUVMYjllb3JVNmQ4?=
 =?utf-8?B?SU1BMVBoUGlRRDQ3NjFKNFhaSzFaRmROZkdSbGVPNDdtWWtCeG9GR3djbWFj?=
 =?utf-8?B?Y0JWS2pVYk1mWGVUdm80TktLZXJvbGNJdnAzZUJIbSt0dGNaOEp3bjFabjR0?=
 =?utf-8?B?WGVOWGE0Zld3YmhrSEdxNVlieWZoVHV0a2ZGTGEzUHBqRFZzVlQ3Q3Y1SEhP?=
 =?utf-8?B?QkllRzROZGljUi9QY3ZiSkhpR3JYdE81NE1EcmcwWnVZTHRVZlAvQlZVVEM4?=
 =?utf-8?B?SVE2aCsveFU5aW5PWUk4SWlpZndMWEdLMGhKS1NsaXJuUDlOYmczQkJPTExu?=
 =?utf-8?B?VlZpdDNId1pGS0dmRHFtRXdNaEIwOVl4SGFCS0NiWC9EcG1qUjVEMnZ4WnJP?=
 =?utf-8?B?eVp4V2JSVFQzTnFvSVYwWWlTWkVrNHVlejZYbUt2a2VsRXhTTjhCTDVFWU5Y?=
 =?utf-8?B?b1QzZmIyajVXRmptYkRBRnBqS2x6Qlh1ckhkNVQ1Z1JpSzVUTW5mMmNldjdm?=
 =?utf-8?B?ZnN1Mk42aGFLYm9mZW9VV2RMSFVWbTZ5T0g3WVBZUVhFTThaODc2dWhvcXY0?=
 =?utf-8?B?RjJYS0JpMmk4aVludldUM2ZGS0R1blh3VWlScEh0NXRrVDdIYWdsd1VzaDBS?=
 =?utf-8?B?QTJDKzkzL3Y4OHRmU3dzQU5mSU14TERMaUxpeVo4Q2NNUFYrczhjaXpXVUNu?=
 =?utf-8?B?TllRYmx6U3FGUkg1TGRDNThnbXdmbVEwL010UHNuMFdkQ2xMNkZ3eTR2cjZm?=
 =?utf-8?B?QjBCMjBVd3hrNG9YUjhKYjFOeFpzZ0pYUmNpQ2Y2UzVNT0dLZFhZallLczNX?=
 =?utf-8?B?VnE4YU9uK1dxRjRyTnBVUXh0cmtVSkt3NUltMlZHTWlQTHJJLytKM29BRDUx?=
 =?utf-8?B?diszNFJoYVFGMUNWc0lvdzJBdFVDMCtGcHkrVnFHdEFGK1RwZUFhdkxkTWdz?=
 =?utf-8?B?Tmg4c2I1TUk1R3cyWllmOGQ1Y0NMUU1PYmo5Q05HRVd3eVpOcFJTa2NBaHNk?=
 =?utf-8?B?MlJmQ1JOUUVXU2ZrY0JKMGZUbm9xVXhKZFRvaURSaUhaSmlJOTNIQlNZbEZG?=
 =?utf-8?B?T1dhK2ZSOUZqcWJHaDdYRG90RER6WlF5UjFNQ0hPTStnaHptNFJjeWxSUDV5?=
 =?utf-8?B?K29Bdkl2eVVoSkx5RWM3L0w2Z01KVitkdUs1SU9uRUdIUFdldWc3VmZ4T3h1?=
 =?utf-8?B?ckdWazVpQ1RoODhWTERvV3lrdDhxSlBINzJCSGJCMnlsYXd0dC9YaFRCODJp?=
 =?utf-8?B?d3cwL3ZWU1pMcnB3UG1YWisyU1ljcDFEaXlkNXZuSXpGQzdiNGxXK2VoamZP?=
 =?utf-8?B?NWYxdE04eS9ZNHU2am1jTkcxdUpyRHpvcUJXVFdYQjlWUjhTZ2RGc29LeEFj?=
 =?utf-8?B?c3JHT1h4WmxydEU3WU14YzJLdEZJNXhkYjZoakJjUDRST0dkWkVCTFhrRVVF?=
 =?utf-8?B?bzl6UGZPRnJMaG1sU0xCdXg0d0lsMjlKZWpocmJWQytSd1Rkbnh5c1ZpcWRX?=
 =?utf-8?B?QWZScElnT0tlZFV6WDFCSEhocjJqTWh0WlVQRFppYlRNZ0tqZEtsWVlUMno3?=
 =?utf-8?B?QUtRQXBxeXJucUZBVzZUbkloejYrVm1pbTloZldibTZKSWFpbnVzS1RjbFM5?=
 =?utf-8?B?N3VHUnZ1em9kM2w3SlJXR1FFMG93QkdnOVQrWjBLelErZ2hpa2hsa3hwTmlw?=
 =?utf-8?B?WGpnYWJBanRyei9STk1tK1lnNXFLR1NLRzE5c0lTdVNlZWJHMC82d1VXNkRv?=
 =?utf-8?B?ME5jcVFXZUo5bVNzZ0pvTzFzdU9pMHNaTmZIOHVaUCs4K1JyWk11REJ3UFRm?=
 =?utf-8?B?TlNSTGFDT0ZTc2tGaFA2MlNzY2IxQTJ3d09jSm5kTm5xNVdXOTA3UGxJL1Iz?=
 =?utf-8?B?WEkvS08zU3hMNjFjTEJnckxYV1I0ZXAzR2ZNZWZZVlkxZk56UFgwUTdNVWhD?=
 =?utf-8?B?TEJqSHBza0x2T1Q5QlVHTDFCdUU1bDc1b2FIRW0rWlg0ek9wbU9ubVpaZzRo?=
 =?utf-8?B?ejZLdmNwbUthNUZ6LzBybnBDMEVuaUMrRTVFOEJPYU5mTFNqcWxtSDR2amRY?=
 =?utf-8?Q?vU0MYFHPrhw+HjIHkkm7TAGy6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2d9c4b-91ff-4f5b-515c-08dcf82432f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:15:54.0812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWDGEqW0FDmxMtviaCoe1n098fj8Z8+b4MpSkK4zcbKo2Ik/4BuCk1pw+mvM8VbTgMJo9C3RPKFeNtVoHWdEzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8580

On 10/29/2024 09:09, Shyam Sundar S K wrote:
> 
> 
> On 10/28/2024 22:18, Mario Limonciello wrote:
>> On 10/28/2024 02:04, Shyam Sundar S K wrote:
>>> Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
>>> However, to accommodate this recent change, PMFW has implemented a new
>>> message port pair mechanism for handling messages, arguments, and
>>> responses, specifically designed for distinguishing from Mobile SoCs.
>>> Therefore, it is necessary to update the driver to properly handle this
>>> incoming change.
>>>
>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>    drivers/platform/x86/amd/pmc/mp1_stb.c | 12 ++++++++++++
>>>    1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c
>>> b/drivers/platform/x86/amd/pmc/mp1_stb.c
>>> index 917c111b31c9..bafc07556283 100644
>>> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
>>> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
>>> @@ -36,6 +36,11 @@
>>>    #define AMD_S2D_REGISTER_RESPONSE    0xA80
>>>    #define AMD_S2D_REGISTER_ARGUMENT    0xA88
>>>    +/* STB S2D(Spill to DRAM) message port offset for 44h model */
>>> +#define AMD_GNR_REGISTER_MESSAGE    0x524
>>> +#define AMD_GNR_REGISTER_RESPONSE    0x570
>>> +#define AMD_GNR_REGISTER_ARGUMENT    0xA40
>>> +
>>>    static bool enable_stb;
>>>    module_param(enable_stb, bool, 0644);
>>>    MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>>> @@ -244,6 +249,13 @@ static bool amd_is_stb_supported(struct
>>> amd_pmc_dev *dev)
>>>        switch (dev->cpu_id) {
>>>        case AMD_CPU_ID_YC:
>>>        case AMD_CPU_ID_CB:
>>> +        if (boot_cpu_data.x86_model == 0x44) {
>>
>> It's unfortunate that this information can't be discovered from the
>> F/W, because this code is now turning into:
>>
> 
> That's true.
> 
>> switch(dev->cpu_id)
>> case FOO:
>>      if (boot_cpu_data.x86_model == BAR)
>>
>> That's pretty ugly IMO.
>>
>> If you're doing to have a check like that, I think it's better to just
>> ditch the cpu_id (root port PCI ID detection) and go all in on x86
>> checks like this instead:
>>
>> if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
>>      switch (boot_cpu_data.x86_model)
>>      case 0x60 .. 0x6f:
>>          //set up args
>>          break;
>>      default:
>>          break;
>> } else if (cpu_feature_enabled(X86_FEATURE_ZEN5)) {
>>      switch (boot_cpu_data.x86_model)
>>      case 0x40 .. 0x44:
>>          //set up args
>>          break;
>>      default:
>>          break;
>> }
> 
> The only benefit I see is instead of using cpu_id, using
> cpu_feature_enabled() to know the underlying generation.
> 
> We have to update two things with the evolution of family, i.e.
> s2d_msg_id that is changed (and getting changed..) from each
> generation/family/model and next is the passing the right arguments to
> PMFW (i.e. msg/arg/resp).
> 
> But the catch is, the s2d_msg_id is tied to the model, for which we
> will still have to depend of boot_cpu_data.x86_model() to get to know
> the information.
> 
> So, the code will turn something like this:
> 
> {
> if (cpu_feature_enabled(X86_FEATURE_ZEN2)) {
> 		dev->stb_arg.s2d_msg_id = 0xBE;
> } else if (cpu_feature_enabled(X86_FEATURE_ZEN3)) {
> 		dev->stb_arg.s2d_msg_id = 0xBE;
> } else if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
> 		switch (boot_cpu_data.x86_model) {
> 		case 0x60:
> 				dev->stb_arg.s2d_msg_id = 0xBE;
> 				break;
> 		default:
> 				dev->stb_arg.s2d_msg_id = 0x85;
> 				break;
> 		}
> } else if (cpu_feature_enabled(X86_FEATURE_ZEN5)) {
> 		switch (boot_cpu_data.x86_model) {
> 		case 0x24:
> 				dev->stb_arg.s2d_msg_id = 0xDE;
> 				break;
> 		case 0x70:

Can you double check hardware documentation?  I believe these should 
generally be ranges, IE:

case 0x70 .. 0x7f:

> 				dev->stb_arg.s2d_msg_id = 0xF1;
> 				break;
> 		case 0x44:
> 				dev->stb_arg.s2d_msg_id = 0x9B;
> 				//update stb args
> 				break;
> 		default:
> 				break;
> 		}
> }
> 
> //update stb args
> }
> 
> IMO, this still looks clumsy. 

Yeah but it is closer to how all the arch/x86 code works too and at 
least logical to a bystander.

> So, I will take your input of using
> cpu_feature_enabled() and drop cpu_id from root port..
> 
> but, I have a code simplification that will be addressed in v2.

Great thanks!

> 
>>
>> if (!dev->stb_arg.s2d_msg_id) {
>>      pr_warn("unsupported platform");
>>      return false;
>> }
>>
> 
> This is not required, as we will end up having unnecessary spew when
> this function gets triggered on platforms that wont support Spill to
> DRAM, i.e Cezzane or lower.
> 
> I have looked your comments on 6/8. Will address them with
> cpu_feature_enabled() + code simplification.
> 
> Thanks,
> Shyam
> 
>> return true;
>>
>> Then each time a new one is added it's a lot easier to follow what
>> it's really matching.
>>
>>> +            dev->stb_arg.s2d_msg_id = 0x9B;
>>> +            dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
>>> +            dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
>>> +            dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
>>> +            return true;
>>> +        }
>>>            dev->stb_arg.s2d_msg_id = 0xBE;
>>>            break;
>>>        case AMD_CPU_ID_PS:
>>

