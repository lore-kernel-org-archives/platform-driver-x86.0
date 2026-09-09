Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012066.outbound.protection.outlook.com [52.101.43.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C89550DD2;
	Wed,  9 Sep 2026 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959994; cv=fail; b=i/8mzyM7DniPEy2MYx+4Dcj0Ay4awekFBQ7MhViijz0dqoMeJ1WwOwXnx9goOB15TKrdPkuNWKWqmtyTEz6DqvmVLktcFC5RsPQOQewX3P92uUyeH2VELjAW7NcKW/6VVgaMvtPbgDVyYJKU/p/xp5JhIV/WA6yvigNa3HBQmwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959994; c=relaxed/simple;
	bh=pej4OxAhtWJjHIWsPsq3RM1InWatH1FOjwbnYLHBdAc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oP3OkBius2hcixvYyUUvQ1c1Tq+qG1sZ+wFVXTxlVj9MVY9wN1w2vW6X+zKGOyTZTqR+XndMoSZhXfszVTUMyY/va+xkQ1pBwrupoL/gBLHd+GKMQf4WCaIB3px+mDkwMv7XszBmOOcsGLFivbKkHTcsyYMJGtc8iMqylDRm0us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ugDahyl4; arc=fail smtp.client-ip=52.101.43.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ugDahyl4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yS7iiJ2UiOR2EQhprPddGggbdEdghhL0Z6g8I2Q9RA6ZbQZ5RsffOKvnGGtkZKdrnHOvjzD/AhyItUAVdxJnptZQem9di4ysLpek4IfzqDm+ohA6hYPC4amz0CNprBd2718c8mwHW+oc5R6SkMGwaWWgenqUe6T8z4IBnh8j7LEdtFA1+emjinFIPutcUJ2yZnHEK/L9fKLtj8b+ONVQJugZki1f7IWFQN8vjHqnFnvMwv8mLtVm7/9OJa2pqDB4XFgqTrRXVGxdoCuBoDo+8fhViQ63UsM4M+L7DFmQrG0I7u9Wi+3+YDdAGK+Y+aZFFJG7WmFpB1d7PpBI2OsLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9fK8Y52YmNbST60In/SjtYpsn2eQUr8+0hX/fN9KVg=;
 b=KmCMk6jsCrKdAbiNdTi0DphnRHDvX+5fdoDemy68PEpFtZ76xvj/Yx2iRFg2MqoKAYyq1BKWw59mInXh6IVUMEOWMOMdvFrtBXNeTf2aZYrB/sEFyaWSDfBq7gmmf/Smzoe26zNTvlTI5X6tbwtfOQB5g/d/tJ8QMtkxv8PbXDvf/1KkwhbBk+otsxpBv254/HSSryHI1HJ/kpKJ+zYMs4vKaIG7sxqXt594I3KcD1G0N2l+SqhUPeH45DWN1zYyWzwP5qXX0t7f6eQlQQddoq68gKcnejo6Ss+DpNJds7jD1fC6igph0cIDKe1rMg8E3/8UMRPbu7k6rwvGdUePUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9fK8Y52YmNbST60In/SjtYpsn2eQUr8+0hX/fN9KVg=;
 b=ugDahyl4HvC44LCuo7pbGdvpICtbWEvnh+OrxFbkLqQbMVd+2uN1xW4IhSvFQeDzMulvDpex27DJLRKV6BJ9bxi/ird84AFfhocVQCQptrYykM1YALHVp9fQkV1+gmynyVrLXBf0qnWzkTgkugxF4H0NlKmhAJHYiSlUBnzRKLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:19:37 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 13:19:37 +0000
Message-ID: <76dba935-1052-4fa9-a70c-16cecdfd12c8@amd.com>
Date: Wed, 9 Sep 2026 08:19:32 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
Content-Language: en-US
To: Klaus Kusche <klaus.kusche@computerix.info>,
 Tim Chen <tim.c.chen@linux.intel.com>, "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "Badole, Vishal" <Vishal.Badole@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 platform-driver-x86@vger.kernel.org, K Prateek Nayak
 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
 <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
 <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
 <14630984-9287-4454-b52f-3a1e526e1fdf@computerix.info>
 <3cb5cbdb227bee0b822f1550e10659faadd77a3d.camel@linux.intel.com>
 <e17ef3af-c1cd-4360-ba4b-9900ccc36ef6@computerix.info>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <e17ef3af-c1cd-4360-ba4b-9900ccc36ef6@computerix.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:610:b2::7) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 893ffeb2-3648-44de-c96e-08df0e74fef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Uaz/xoOEMCUC64FEpnXLsGFCeCGDQw0duei3IZTPm1h8hpeIBsP67pCIVc7jxldpGOlkQcEFCmvvXy6elD7x+Iu0L1Dqui7SC27pTyWwBtnqfAMBshpbWXQfbCWIi5wkhNyupMKwlB3PwpG160Yi7xYg1CDZPOOtZNSm6Q4/Z8hUqgcuGCnIohkm3mmuzuuZNQxxkibQwbLsseB3CMRuZH4tfoxKInKE576Y4QVorh9vJE9O/uazi+3YiWtLwBFbCeKxeOs8sK2glpABuyhF69U6oX58t02dxbe4NiFvNWo4oGxe6u0OnmOggds5Sizz8zT+8F+inl4XDo/hiSlQ8SbtPwsXq+nF3LyX37MJgE2VIVJDAyF1/HyAvvja1HTM5tv/2nz9SRb9dKx8WjYzkO3tF8ED3FjzUueM9+m0CQoHpWBvfnI5LHkxl5/KP9Zp+OwptrPOlmVvHgcdcm3RKqAN/04v+IzWGql5S2YThUE4TJAORBJUGnEtFjsEqftnpgz5hICKTmfkicMwno1DjGI/9zk1nzUey3tw4A1HL18E/56xsC/5DcXjdwx4NT7Redr41vxgEjnl6kFE5E1F3pUxo+VNGVNWJ1V5EMX7TTUl/R2xt2UdLh72/2b9cYXJOxehLoJh4U4+9R9x2OjV2Tp3DYcjKW0FHi65Tl2x2/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGtobnRNM1dLaThCTlpxbjJ3VTByRDJQK2VzdWtYd1E5ZEdDT2FzN1ZzK0Fs?=
 =?utf-8?B?VUVVQnhuajA3TDBCb0w5L0FESUQ2cnBTM0ZzSnk1aXFGM0pDMWxodHNFc3ps?=
 =?utf-8?B?ZVBsSzNnaVNldFZ1Q0lFZ2g2M1Vkd2kwMTQ4UDMwYThacTdyWGxycTJLL1c5?=
 =?utf-8?B?YWtiWXFLUnZzQ1MwTG4rbHprUHVCSitYNnQ4UC9jdXVoTmNzdGdkcmE3Z2dp?=
 =?utf-8?B?ZGNvQmkxeGhtRXkrckZSZDdicFFLSWpwOWN0NENkOXFZT3hEMTRKcGF4TXdW?=
 =?utf-8?B?dVBZTGw5M0FwSTRTbWt6RG41bmZXRVJ5RStQM0lWVjVjc05UNktRc2paK0p0?=
 =?utf-8?B?WGYyRVE3MUFKT2lMUTN2QlRJRk9lSWVncm9Ydjh5cXM0cTgyTFNHck0yL1dY?=
 =?utf-8?B?OHVuUUhmUkVweERMQWw3NXRHY2JXWFMyNlVoU0trWmhRVlFmV25oK1lUMWsy?=
 =?utf-8?B?Y0x2UjV2Tm42dXQ5R3NqOWlzWDR6U2VIRS95R1NWc2Vya3NoanNrR0xDQUow?=
 =?utf-8?B?U0tzL2tKT0RYUnVlZEhaRitjazI1YzhCVnhwOVM0VGI0dXZUS0RHaEw5NkEz?=
 =?utf-8?B?Y0c0cDdNQzZ5YUdkaTVuMnREc2ZScVRZeWZXVEQyalZBNlpJSVloejR4UndM?=
 =?utf-8?B?ZWN6UXUrT0h0U0c1blUxWWxTdDlNUVVTWldHQnVWYkNKWVFLYzdIVStMaXBp?=
 =?utf-8?B?b09FakZkNTBqTUhwcDdmZFNwZDdoRkgrUWFQemRjdnJIQ1FmN3B1aGFJUGJ6?=
 =?utf-8?B?M3d5SEx5ZUw2d0pBbmVlTjdPOUJtSlRRbHJjZFZ6bFZyTEdOSDc5dHpWdGJT?=
 =?utf-8?B?d1BoWDd0VTN4WlZKbkh1Z2FwUnYxQVcrZUYxL1BJOFJpVXBVS0Y1eVI5enpC?=
 =?utf-8?B?V2dsWWFCeWViOGlNamloOHJ2YXluOWdhNWtXWjNnOEZwaVE2c1VMSjhKZDlF?=
 =?utf-8?B?Z1hRd21lWTBnSW5qaFZmSjErZ1RtaVFRenltazJMQU0yU3JOcUwxVkh6Z2t0?=
 =?utf-8?B?UVY3MkcxM0gxclI4d215OFBFd0E3MHFsaGJWbldURno1azZBL0U1Sms2dURP?=
 =?utf-8?B?bmYzSUdYclRwTnhpUzNlSnMzT25XS3V5UHpFTE0xTHlRYWpIT2RJallTaC9Q?=
 =?utf-8?B?RUVQMnlCYVhKOGRoVHdvRWU5YUZmWHJqOGdzZG1FUC9KZmZHZjRzOUV1cmo3?=
 =?utf-8?B?c3d1RW1kbm5zWVhZV3EzNUlIK2hkZlFVSkV0OVJHeU90c3VWOWk2RDNCL0dF?=
 =?utf-8?B?a096K3VmdE9OZGprbVcrMmpYN1FaUkpvM3Q1N2s3NWFxeXNXRmZnUWI0M1RC?=
 =?utf-8?B?ZG1xL1BqUHpLUXJPU0lnYytNUVdQdnZETGhYVkM0eERJQkVQbU9GWG4yUlBY?=
 =?utf-8?B?N1h2YmNlOTQ5M1VXQ1dzRkZlQUlOY2RIbis0NXgxU3QrME1EcmcxTWhqak5u?=
 =?utf-8?B?V3BObzhBWjBBV0QwR1BVOVF4TnMvSzZxRDcwWGNFVjFyYUh5dkVCQ1IrYWJq?=
 =?utf-8?B?Rm5ydGpOeUJ4VUhEN2diT2JJNHlpVjY1NXpaZGx2NDhPQWEyVjhXK1Jxdlk4?=
 =?utf-8?B?MzZWMUNpZUhmUzhXOG1vTDFObzVxczc1ZTV4eSs2aEt1a2FkZ0haOHp5KzY1?=
 =?utf-8?B?bTdZNFJMZmRBYlZQc0pqbzQvRFBqR0dlZ3UrQTVEbFFPL0JQdW9OUUZMUlBV?=
 =?utf-8?B?anhFNFZLUlAxWExSMDBXbDA4VGE3TXZlQVprN2R6Ykcza1IzemhhZGlWWTJr?=
 =?utf-8?B?RkR5MlFDSUFEbDlYbmlETlptZURoMk5wTWlNRm95Sk4wUlI3bExDWEkvT203?=
 =?utf-8?B?U3NiTUdrZTBtKzArdFVYLzBqMUk4UkI0ZVVBZC9HdkxSNU1JRzdJcTNPcHBp?=
 =?utf-8?B?d1M0Q281UitYVFJBY0lmbjFzU0RCZ3BXWllsRXZyNlc5bHh5OWdJNkVjdlJN?=
 =?utf-8?B?NitzYkNhM1lYMFkyZkd0WEJ1d3ZGTnNJU205ZmJtaEY4UjVISFFxMmtCTEVL?=
 =?utf-8?B?ZU1zR0pmNUp4N3dBYy85TXJvaGMzcEVlbFJZaWlBTkt3U0daOGlKc3pUVmtt?=
 =?utf-8?B?Nis2bjVZYm5kQWhiV24waGVvQUJjWUJlZ0ZyNWdqWVkrbWZSN1JSbS9PQ3p4?=
 =?utf-8?B?T0p0TWpTSUI2NERtVHcwcXU2aWFSQzFlVzRTaUVjRHJobHRnbTRQSko3dFhW?=
 =?utf-8?B?cHdzNlhJc0ZQTWY5SldPRktrdklueDhscEF3MGhINjV4YjFwUURMQ3pjTHlQ?=
 =?utf-8?B?aDg2UUFlL0dSSjMwc3liTThXcVBNOWQvK0IvSE5ocjYwWXZSa2tabzdTOUpm?=
 =?utf-8?Q?9ZINyXXMBZxaRs9v20?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893ffeb2-3648-44de-c96e-08df0e74fef8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 13:19:36.8804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SgjRrapFuoIXyE3s7f3HlV8TSfuuB2szj7KZuyaTI6fhHVddI3gCdBeM0wqucOhPgmYjrqOAcprj7BvhMKf1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233



On 9/9/26 03:59, Klaus Kusche wrote:
> 
> Hello,
> 
> On 08/09/2026 23:54, Tim Chen wrote:
>>> I did some quick testing (no perfect benchmark environment,
>>> just checking runtime and CPU consumption with "time").
>>>
>>> I timed a kernel build (-j 24 and full lto, my own .config)
>>> and an application build (also with a lot of parallelism)
>>> with three different kernels:
>>>
>>> a) Cache aware scheduling completely configured off
>>>
>>> b) Cache aware scheduling turned on, but without patch
>>>
>>> c) Cache aware scheduling turned on, with patch
>>>
>>> Big/little scheduling was always on,
>>> Mario's patch was always applied
>>> (without it, results are significantly worse,
>>
>> Sorry, I am a bit confused.  You mentioned later the result for (b)
>> and (c) are about the same with or without the patch
>> exposing debugfs (commit c1e7fe5e75ed11fa85368e5a186472afd3858f3a
>> Mario mentioned in another mail).
>> But here you say the result is much worse without Mario's patch.
>> Is Mario's patch the one above or some other patch?
> 
> The with/without patch in (b) and (c)
> refers to the patch you sent on 31/08/2026
> ( https://lore.kernel.org/lkml/20260825174112.2580942-1-tim.c.chen@linux.intel.com/ ),
> not to Mario's patch.
> 

Just to clarify Mario's patch in this context refers to the fix to 
ITMT/debugfs fixes as Klaus doesn't nominally enable debugfs in Kconfig:

eaece4849991d62fcd6f46637c55dcce00e25d70

>>> because I use kernels without debugfs,
>>> so big/little scheduling is off without the patch).
>>>
>>> Results:
>>>
>>> There is no significant difference between b) and c)
>>> (<= 1 % wallclock time)
>>
>> Yes, I don't expect difference between (b) and (c).  My
>> understanding is the patch in question is to only
>> expose the default cache aware parameters via debugfs
>> but don't acutally change them.
>>
>>> Sometimes b) is better, sometimes c) is better,
>>> I'd say the differences are below the accuracy of my tests.
>>>
>>> But a) was reproducibly better than b) and c)
>>> w.r.t. wallclock time: 2-2.6 %
>>> It was also very slightly better w.r.t. total kernel CPU seconds.
>>> The results w.r.t. total usermode CPU seconds varied too much.
>>> (I always ran the application build twice,
>>> and for all a), b) and c), the second run consumed
>>> significantly more usermode CPU seconds,
>>> but took a little less wallclock time - I don't know why).
>>
>> Will have to look around to see if we have some similar CPUs
>> as HX-370.  My understanding is that the 4 big cores are in
>> one L3 and the 8 small cores are in another L3.
> 
> Yes, as far as I know, it has 16 MB L3 cache for the 4 big cores
> and 8 MB L3 cache for the 8 little cores.
> 
>> BTW, we have also found two issues with the active load balance
>> paths for CAS that need fixes.  You may want to add those patches
>> and see if they are helpful to improve things.
> 
> Most likely not within the next few days.
> I'm still on holiday and quite busy:
> Ars Electronica Festival in Linz.
> 
>> Active load balance fixes:
>> https://lore.kernel.org/lkml/20260903020656.3793626-1-wanglu.priv@gmail.com/
>> https://lore.kernel.org/lkml/2b0a35122ee615c6fa51076e5d79330e633755ac.camel@linux.intel.com/
> 

