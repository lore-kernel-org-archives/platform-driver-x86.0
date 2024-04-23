Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4A1BC23
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713892294; cv=fail; b=COwEkLI1QdmLHF4zhL2Ml5XaUKE0XRrgPFc1YJ6ZBP4c9mtsx0uUXjjZld2Nzw/PTql8Cx2PlcFWbX8bK6d4Qbg7sxxBb/YwQLZxnbJg0mqTKneB6vsj5hEgPmoxlRdjwvdpNRrgScwf7NASJfhyROFnTRyoapg9EK3iUn/BHMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713892294; c=relaxed/simple;
	bh=yV1leAd8RfOGR9z/U5KWnQ1/dCOUDGJZ20gNWSzFD8E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fu3B8MpQHQj+nKpgI9W/5LzBuLb3G8zSvLN0+GKgcMfkfz8EOtsrPVH/yJ/qEJgCfcf0stQ8vCggAShrUSmg2Fla0FYMUxW6VJJ1FvNbuKzKGPKVJUsY+GUVd86+VLtxkCqCfvH3/aPOwe6std96nak58mDzQjWMzZqYt/oSzl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bLfW7T7v; arc=fail smtp.client-ip=40.107.212.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bLfW7T7v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCAygXBWG/dyMzIw7L2tJYRrUDjA7R0S4iIGbL15Ofd/M4bYyR5Dzj9LicvxVokC7OsmYmcoQRxSKM0lmVMQvML6J5IFrQV4ZCM8xbCMLn6rOLn6270z4kqIIyS45W0cdeD0tW5GWN6SDSVSq287pgwQTyEO03BKHHlzyRrPXEiEHNz2/+F5Unee1MxXRPQ+W3dhshQu7lihHeKKFsNPOl/69r6KpeF193MGIB27ZQd16kEQsWEeKWdJtE8SWUiul2+ym3jSt3d2jX3GEAxwFmBdEl9NlYMyNb90Xnt94RD95gsH3x79wIow2r8Gs3MAUUd9YAO3iAvqnsHVq4by6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3IqsF+kMQCGsSF7XGzQZKoe0a6NGuc14BpuT9mQ0YA=;
 b=TrkbS7IDWg1XbmecaFh1BQG9z7B+6Gfl4Q3V8dDkgNsj955SS9yMgRRWt43ACOD5exATZvJwRnrhodlvfcqZ9TOh/cfxLJcD0yxiBDkjTXs4Ourn8DnBfsmnVhR2bRaLvEC/93FoTbayuJIZgnoLL6ZNdPPnZKkN4HuVe4MiYO68OxQLJW66+8v5tSn/JAbEMr/eWHrpK+Dg+WQMDMy54Bqboz6tOT3U8XDAH+FyqXCM1BHOXNUJoGLlThZIf9g3DLwbqg+5YHWw3QJpP++7/4ThzP8DO2WWxSQcmoql+JbVxLs4V4ik3LLELoZK87XWIp/KNJVUSoBb14/BpGDXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3IqsF+kMQCGsSF7XGzQZKoe0a6NGuc14BpuT9mQ0YA=;
 b=bLfW7T7v2wrYvA/Mb/23Obx2ZHrKj3IYggrR7/dKKEQNG7rbBpGTpM+ql9fTLiS6cpVOlAWU+fVevcGsJyFjZtLT4+Q98rJmta4x5gZgApKd3/PPZqw2unCNPvHfP1uxpYfPtr8qK1gBnVjN/7VybnUkupZeWiJCK6Nr8sLDe+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 17:11:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 17:11:29 +0000
Message-ID: <307b0691-e4b7-470d-b4a9-3556a4269cf7@amd.com>
Date: Tue, 23 Apr 2024 12:11:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86/amd/hsmp: Check HSMP support on AMD
 family of processors
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
 <20240423091434.2063246-2-suma.hegde@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240423091434.2063246-2-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:8:55::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3f939d-7e79-4960-d5cc-08dc63b86a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGtQR2VTamJXdXhaRHU1NGd0SGFNb1lvR2dYUXJlR1EvMklUdjV5UFlTQjN5?=
 =?utf-8?B?a043aXoyd1Q1M09xbm9hcTE4cnN2bkQrZm5jaGk5MEdSaDMxUTRXc0xOV2RP?=
 =?utf-8?B?R05oY3VOVHVoTkNndFhJSUFLc0pLc2NEVWtRL3p0clg5WGNWMUVlRS8zaStS?=
 =?utf-8?B?UzYycVRDK1JrR0tNMkZHem5QZjRZU3dsR21Za3dNMWVWNk5vRzhVa0JNSS9t?=
 =?utf-8?B?VkQxcGR5M1JaR1ZLMVZ4TitlL2FnTksrVzFNVnJtL09STW1UcFc3emE5R1R5?=
 =?utf-8?B?OFBYZGphckcwYzVtaEFIM3IyYzZwZVpoNWZ4QTh4Ukg3WW93QURLaWMyaDFh?=
 =?utf-8?B?QW1QNGt3OTJ5TDV2Z1NGME9jekIwWnh4azZIZnlFQTUvWHFjUHpnMERLL2RU?=
 =?utf-8?B?aFFXQjVQZEdLS1luRHRNWjRFOUJ0K29XMzRsRlRmTnJMZ0F4NVBhL2RZM0Rk?=
 =?utf-8?B?bjJkanBDdkZuaVJmUXhBbzM1S1FFMG44aWxKY0pJSnBndEFRN29wSzZ3b044?=
 =?utf-8?B?NUQ0SzM4MHJKV1V3VUFJbDJUTWdnRHUxRDRYTlV4SVk4RVYxRnpCdlhhci9U?=
 =?utf-8?B?N09DUy84TkxTVS9semV5S3RFb1hibHArUHlrMmFkUzJGMDRsN2M5ZmRDZWlL?=
 =?utf-8?B?ZTlnTDlzdWtUbEI2TWx6ZitoMlBEdU5CenRFUVFwR2FKWHBTWElZa1Fyb2Vy?=
 =?utf-8?B?cXFXaS9CR1hyb0hQd2JCdkpGZnAxTmNhR1cxVTUzZkFUcnhTUnovSTFYcHVo?=
 =?utf-8?B?UTNjSkhWU3hqSHBPUkhHWDBJbTF1RmQ5aExNMHFxUGgxN1lJbTJKZmNNaXN6?=
 =?utf-8?B?cmtCaGRSL1pVd0I0T2VGUFlGeTc2UFRXRzNYTjg1WitnSW9oVXVnaTNaZEpW?=
 =?utf-8?B?RXB1N3hYRldTZ3ZxemIrWVJucThlT3I2dDFobW00cjVjWXcxZStCcHZIWTY3?=
 =?utf-8?B?akY3NkpHZ29NaWk3RTRJVmEzQ2g3YW1DdnN4eWtUcWpuVXRVWEVCZFdXUVhV?=
 =?utf-8?B?YWZUTldPZHplV3FrWmhPU09ReFZHRllBUjZMdjFab0tNV2paR3hwK3ZZUFRN?=
 =?utf-8?B?ZFVQR1B6OWhhcngzOEMzcUdTM0dhdDQ4RG16ZGN6SE5NT2hUeVBMVk9mQnd3?=
 =?utf-8?B?NWJjVUtzSy9jU1ljVkJSTzdSL1hMK1RuYVk3a3lwdHdSaGhaSU44SWYzRTQ2?=
 =?utf-8?B?OEFSdGszdUFnRjZVRVdqZEE3d0MyR2drVHU2ZkVQRFd1TWtNWGY2UGZRVVBp?=
 =?utf-8?B?VlU5ejAwWWkrclF0Q0lqTWMxdjJFZStiQ0hFeG9CR1JYdkRMQ2YrTDBFc25K?=
 =?utf-8?B?c1MvUXlzdElkbnJYaHRVMUlOY0J0ZFhSVDEvVGVSQzVVcUxEbTgvYjZTSmxE?=
 =?utf-8?B?QlJaQkc0NVp5QUxIUWFlNU1VVktUTkFFYTVqNG0venRoMU5EYWVuMERlSjh1?=
 =?utf-8?B?NStjL1Y5bkM3Tnljd1hZVktpeDZoMXZtb0ZMYWU2TU9NVm5MbU9tOHFhWkZP?=
 =?utf-8?B?THpyb2dCbTJlMjZDejgraFFGek5GVFdxNlNzK0tYeVJZem9lOEtYcWxVRHpo?=
 =?utf-8?B?MmlOdGdLSHdRUkZnKzlUNmlCcVRzSHVza1NyQjFZOVQ0UTNya1ZYZFJPTVJo?=
 =?utf-8?B?SHVON3lTbG1INVNEUGptVTl4VVpSZ241Z0F5RjNIZDhDVmU0MURzU3RjSXNI?=
 =?utf-8?B?MjFpQkQwU0VhWmpXa1NsZWFTRXFPaGl3TlhOM3RxbTRQM3V0R0JWenN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnMrMnh2Y3NpV2hZZnFyaG5sNVhxdFF0UXc5bUJsdmlMQ1VkY1Ywc2MyTEhX?=
 =?utf-8?B?TEJxRis0TVNvdklDZ1IyR0paRXUzanhFZlZRQ1JqVXpoTGNYbEowRFFCeFJv?=
 =?utf-8?B?cWNRYXFIREFCYXVwV05Db0R3UThreXl3NnRyRFdNWXhGbWp5eVVoRE15L2Rj?=
 =?utf-8?B?cmZrZlZXQTl2UkpBQlZoS3hydGJ4OFo2MElYSFp6ZFR3VG5HOS8xbFdwelhB?=
 =?utf-8?B?R0lsUlRNdlhVZVByUFZZcHNWdi9Gc2VMeGpEcVRIVXZJV05vSmFmbksralVn?=
 =?utf-8?B?NkxlcFY2T0c0QzBVdnB6SE1ucWVRTGZad1YwSXh4SGp1bWNQTjRRUWFhVXBx?=
 =?utf-8?B?ckZkN0FyM0oreWZxRWJuTFdZYWl2T1IzOXdHNDkremprMHRuSVNSMG9hUnZl?=
 =?utf-8?B?eXFhNmE1WFIzTzhCNXgwblhDMnFVUituRHl0cEJwSGJnb1hVcndqVVlmc0pa?=
 =?utf-8?B?SUJjZS9neG5mS1JtUmRhU01WR1pDWGJFNzhqVkhodXdXbzR4ZDJmZUJmMXFX?=
 =?utf-8?B?UFkwV1ZTcTZwUC9XazNtdVFqU0t2bVFwbUJaUjkyUzBwMng5bFJCWVBpNHFz?=
 =?utf-8?B?YW1seHhvV21KbTNrNk5iZlN3WnVYSzdSSnlMS1ZUblZaUEJVUjk5UWNJTWo2?=
 =?utf-8?B?UzlLdGxla2xHK0VLQkliM0dkY1lodUkyb2c4NlFweEtab3dKNlVvMCtSTzBP?=
 =?utf-8?B?TFFEWXNaZ1dOVHNLd1BhYnZPTzNKOXZZUWIzWmJzeGtqZ2pBc3RCNEdCSHp6?=
 =?utf-8?B?V2tUUXdhR000bW53NE9OcEE2NE0yQUx6aHVOaC9VMlZwN3N5U0k5R2NrK0RF?=
 =?utf-8?B?KzVsanYrM29La2w0TG5Gai8wbGVuWlBSM2FMaERZNnF2NHc5QlNWQXNuRlNm?=
 =?utf-8?B?MzVpclZFMXp4TVlpNlViRmJRQU5ocW5ERjhNMzNHeVhYdXZqYU1uRE1tSnBB?=
 =?utf-8?B?NngxOTIxNkVJOVZFcUZQaHlhbHNkRzdYelMwTVdLU2RRclVOMng1NGhxdWU1?=
 =?utf-8?B?SWw1NUdXTXhPYWx4blhDYkJnWlMzRXV0SkRQYWRJc0w3Qmo0c1BieEViTTFt?=
 =?utf-8?B?WXBYZVRFc3o1ME5qM3Z1SFh5M3JXOVBqR3hMWFFCM2ErL29UOGlmSU9HK1Z3?=
 =?utf-8?B?ZDduODJiaXZwZDdnUE5nVFZuYVNxTFJYYkFiYWhvaTY2Y1hDcWRVd2ZFblRP?=
 =?utf-8?B?dkpPK0VzMmQwTDRGTVM1U3I3bFkxRytaSzlHeGZnRkhNWmlLS0hCKzBMbE01?=
 =?utf-8?B?R3NIMC94dUZHRnhTb1p4TmxoY2ZpdVkrM3YvcndyLzJTL1lXVFN6clBkWmR5?=
 =?utf-8?B?Q2JydzNWR29Mb3JTSWJSNU1YQjRNN205TmxnQmhUZ3NmQWdFajl4ejNxcGdk?=
 =?utf-8?B?U1NMdklRd1ZiZk1CQmI1QjJURGg1bVEyRTRlTVo0SmMreEY3eXNMczVnNGtH?=
 =?utf-8?B?NzYvbVhMZkhtblA1enQ1WHBrUUN2azlXMUZMNk5vSHBORnd3d3diUWRtem5J?=
 =?utf-8?B?N0FabjZjVmJpUXUvWlgyM1pCbmdDeFNoTnp6WXBQc2o0a1V6ME9RTHlYMXhG?=
 =?utf-8?B?eWkxalk0c0ZsRnhLMVgzbmU2UHdMRGpacXpJb3JvOVhVMjVqem9oRmN1WnVK?=
 =?utf-8?B?RkVNYUdvbDRyKzNOYkZueTZaUkZ6YlBYWmxOZHlGc0UzNy9OVDBQVGFCbWFT?=
 =?utf-8?B?eHlrc292MWJnbnFGQlorRVVDTGxCQUgxejI5VFhJSjR4UXJvdjZFbXE5UEdv?=
 =?utf-8?B?cU5iL2dSRzNnUGFUNE1YY0dWUUxiRkJzcWdDY1NBczlyWFVublFVZjcyVTVQ?=
 =?utf-8?B?NWxiMU1VMkZreHlMUzc2MW51aWszR2dXcTJhWERjeW1JRWhyZkNCN0s1RndC?=
 =?utf-8?B?TTNlZE9ub1JnR2JHc3JTdCtTQnF3dGhQNUc0a3dlUFJOeHJLWmdVcUJxdnhp?=
 =?utf-8?B?bXpQcVBMU0JvWW4yMWNmUFdKOStobmQ3NFpXT0xycmxMdmxlazFSUXE1WW1r?=
 =?utf-8?B?cFEvaVo4VDZheWFHUHNBZW4wWDFjYnpEUlY0SlY0QnZXYmF5R2tLenVqTXIz?=
 =?utf-8?B?UHNtVHFLNzdWRy8rbDJOMDkybnBoVC9aaG80VXVsbU5sYlJUT2t0YWpoNkNK?=
 =?utf-8?Q?iaOZ1sbvriQBN8vK/7zFASRvg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3f939d-7e79-4960-d5cc-08dc63b86a6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:11:29.1868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+TOm1b+CHsq7ieN9riiZ+rwsNwHaNW3ONoeVl+ugbkNTCVDmsBcsGaIJROZKgwt9/PZ0B9ZTCAOGVVooxWC4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5614

On 4/23/2024 04:14, Suma Hegde wrote:
> HSMP interface is supported only on few x86 processors from AMD.
> Accessing HSMP registers on rest of the platforms might cause
> unexpected behaviour. So add a check.
> 
> Also unavailability of this interface on rest of the processors
> is not an error. Hence, use pr_info() instead of the pr_err() to
> log the message.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>   drivers/platform/x86/amd/hsmp.c | 54 ++++++++++++++++++++++++++++-----
>   1 file changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 1927be901108..807a5066dacc 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -907,16 +907,48 @@ static int hsmp_plat_dev_register(void)
>   	return ret;
>   }
>   
> +/*
> + * This check is only needed for backward compatibility of previous platforms.
> + * All new platforms are expected to support ACPI based probing.
> + */
> +static bool is_hsmp_supported(void)

I think it's better to use "legacy" in this function name to make it 
clear that this isn't a requirement for newer platforms going forward. 
Maybe like

legacy_hsmp_support()?

> +{
> +	bool ret = true;

As this is a simple boolean return with no needing to clear memory, I 
think you can just "return true" or "return false" everywhere in this 
function.

> +
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> +		return false;
> +
> +	switch (boot_cpu_data.x86) {
> +	case 0x19:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +		case 0x30 ... 0x3F:
> +		case 0x90 ... 0x9F:
> +		case 0xA0 ... 0xAF:
> +			break;
> +		default:
> +			ret = false;
> +		}
> +		break;
> +	case 0x1A:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +			break;

There actually are going to be 0x1A platforms that don't use ACPI?
I guess I'm surprised.

> +		default:
> +			ret = false;
> +		}
> +		break;
> +	default:
> +		ret = false;
> +	}
> +
> +	return ret;
> +}
> +
>   static int __init hsmp_plt_init(void)
>   {
>   	int ret = -ENODEV;
>   
> -	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
> -		pr_err("HSMP is not supported on Family:%x model:%x\n",
> -		       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -		return ret;
> -	}
> -
>   	/*
>   	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
>   	 * if we have N SMN/DF interfaces that ideally means N sockets
> @@ -930,7 +962,15 @@ static int __init hsmp_plt_init(void)
>   		return ret;
>   
>   	if (!plat_dev.is_acpi_device) {
> -		ret = hsmp_plat_dev_register();
> +		if (is_hsmp_supported()) {
> +			/* Not ACPI device, but supports HSMP, register a plat_dev */
> +			ret = hsmp_plat_dev_register();
> +		} else {
> +			/* Not ACPI, Does not support HSMP */
> +			pr_info("HSMP is not supported on Family:%x model:%x\n",
> +				boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			ret = -ENODEV;
> +		}
>   		if (ret)
>   			platform_driver_unregister(&amd_hsmp_driver);
>   	}

