Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A266AD7
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716395886; cv=fail; b=C0ErnPE3C7/itI82gZMipGqttiwFOvKMb7Q3N986hEuzdOsSXs21iK0VoVDejFthRrzz5cPOD2VHE9Y8Zug3b6eaNJhgJcooAyQkhZ2S6KzN9exJ/TyU9XswHymAuChQ3+j74PHKgK57varXJa7ZXD0zKg4uDv4PjEkKE/XEFCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716395886; c=relaxed/simple;
	bh=pCP6jQ2XmPJQILKk2KOM22GzeLWuW5tmWHTnWcefCTQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ob8NIdvUjPyMwE7yljVIlh7RkiUncieeKrf9Z7LZqf9jhN+qvagLuFdJbnyuB7TMPiPpIKrqJI+PV2G/hJ1kjpcJ9RFxiBYWhuREr2iGYYsRo5Zpq1TbDcJrrO9GH70PJNerhFZfYEyGK5jpReW3VFH8UXhmbRsmzZWiImNRUUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5Qcj7ifG; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5Qcj7ifG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4Std0XHTU4EfIejTiBIdbzVjRRoH2cxEQILQZsassHfJayL5C0UdVYX5SHMIUuCsSH65FwQpLDQb6cq7iew+7PwVlbKJBhdwX2gpDJNCncTe8tSZH11UAWvE6JT442NM54qI4uwDbjzUWR1hU9Ax+xgAoqANFNK1Y2RhV8lNmuEZeKGbyH6ax/ObjpmE/zSVhox1lI4ZvrVaVMPlOFj2NS/YHHvX5zcdWgU5OKO+U0PPK1JSJ4b8KU5q2ugQ7hTTHQc9ES/Gs8xbtAUOHd97YQd9V2aL83D7KC/vuAGzNwDnl/HdteUg/vAjw+PyBRoZgLWVhHlPdH1j7EZecFq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIPkF5freUM6JMSWngTMD/PxV8/GiF2O567vHchLrE0=;
 b=SL9SkVNAMeE3/8X7csgqnjvIYt1gSBbcGMlBhKx9Ux5s6mhDE0Lh8gYzXIpCG3gBbENVTMSiVHdQzE1o7nMOLGMzLKHNF6eUWeR9/R87PBj7WWwh3Hz2ebz+sd9LpFafyGEo656S4fCc9Z4J49dcfbjbsqKLhq34SePDPYdArySCNoJo27yFCWCGYMgiwo3xzulbQNtKdUppYzvxwwIuWAgr4GGZX2Ne9Rq7vUz3kaXsDttXAAyxJHAP5mjAIpoNUo4eeM3sM28H8dwLSNNMnELRK/Dl2fWA5djhkXUPPG57j5VWdbvkIvYkE40T+jkrT6G/e/Wg28yWsdpY9vRZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIPkF5freUM6JMSWngTMD/PxV8/GiF2O567vHchLrE0=;
 b=5Qcj7ifGZXs5gLgSTOVrpsiLdU1nK5H41YSKRM8v0R9U7azSnw2ZRgzDvhayd0N+hbPVgeOFcr4v7/E4ULACVM9QSz5vWpNsf8//csBP3i0CUwb15A86obCwL3eUujbD9Lp5R4X17IxMWMRgah5PzrNg20O16mzPpG/c+PHPTGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Wed, 22 May
 2024 16:37:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:37:57 +0000
Message-ID: <81e937f0-df95-4e07-8d0f-3e20fce8481f@amd.com>
Date: Wed, 22 May 2024 11:37:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Dell XPS 13 9360: `slp_s0_residency_usec` stays 0
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <38fc334a-7c8c-4e43-bf63-6ac9aa882a2f@molgen.mpg.de>
 <c73a9072-27eb-4d42-b74a-52619a81837e@molgen.mpg.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <c73a9072-27eb-4d42-b74a-52619a81837e@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:5:100::41) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb39658-e739-4d8f-98bb-08dc7a7d8984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU1TcUZlVTF0OEQ2bDZYMENJbFdiclBQYTZRWlJIYU0reS9UbXNRTEppbHJt?=
 =?utf-8?B?cVZnZVo3WXluYTFzeUVSdWRDQXpOQnhLaFNFUU9VclVTb3hxTWViNGZsK3Jv?=
 =?utf-8?B?bVp3amJHbndTTFBESEZ2VjA4RkwwY3Z1T3FxVDJCRGJGd0kwcDVidXI2R3hL?=
 =?utf-8?B?S2dNT1lRQTd2NWdtVUNaVDh4MzRaSUltRUNIbDJ4UENoYlRpN3RGZkFqNE5C?=
 =?utf-8?B?VDdobThKZVRPVkpzVHFJN1ZJOFFSeDYvNitrb1g0SDdObWRMcStDVzRzUmhi?=
 =?utf-8?B?Z2NYMU04YkwyZW5aMndiWnJ4bVlqSmlOZFhXQ2lXbjJkNkhtNnBBWEF6MS82?=
 =?utf-8?B?RWxKNHZZY2FNTGkwYXRkdThXSnZtWEtEbk05TXF3c3liYXI0cGp0VnhGSHZW?=
 =?utf-8?B?U1RSc0M5Tm9xaFZMUEtNUTFxaVE3VUZaU0I0TmkyTmRvbG9PK2liY0M5eVN3?=
 =?utf-8?B?N2F4eVI0TVhVQi9VNHRRdU1Ya0VLWjQ3bE1Bc1k2SlVWNGFVdFJCTm4ySEpN?=
 =?utf-8?B?N0ZSamV5MUViMTE3NmlSU05yV2hUb0lkQW82cnVJM1hQWktXRnkwcWo1V2pT?=
 =?utf-8?B?VGpqYmdJVmFhMmh5UWlKVjdvclB5QkZVMmYwdTBGaDJNVW9SeVc0MTh2OHU5?=
 =?utf-8?B?Wmtldml3YU5TOWV4SVkxU0ZBdVh2MUxYYVNrZkFxY1VqS0JpRE4wbTdkL0Y5?=
 =?utf-8?B?dVVrRXpzMnZFZmtTVEVtWTRtaEEzN0VWOUZ3WDYvdEVkV2tqTTNVUXlMcmNt?=
 =?utf-8?B?SE5pbnVJL3ljL0s3SEZvTnRIRS84NXVzTWNLVkx6UU0vL1JDYjFMQUhrM3hK?=
 =?utf-8?B?a0VnaVQ5US9RUURsU0RVU2NMSW5QKzN3cWpvRWdKMm5Jd0UrT0Q3RkFpQURp?=
 =?utf-8?B?Uk1jejFlNldqaTQyZmdxZUIyUGJFQjBVSWxxQXRHaXovRVFWbnhDYzQvV1dx?=
 =?utf-8?B?SzE2MHRManBHNGdvYjgraDVaMkZLWjJ6RUk0SXJDMnZia2pqQ3V4S0YxS0dr?=
 =?utf-8?B?R2t3cGg0Ly9vT2tRVFZHcVRGOFhPeldNTG5ROEJ4TUFZdlFpcXh4d3U1Q1lJ?=
 =?utf-8?B?TWI3alErcmJ5WGw1ZEIvd3dBUWRpSktXMlBTS0VGblFodzhSK25jZzdlMTFX?=
 =?utf-8?B?OTA4S3Q4TENTamhPRG5OcU9zYmZkWU42RnJQUFdKalVOcXlpaVg5YTNVWUNG?=
 =?utf-8?B?VlN6TUN4Q2YwQkFXVjV0R2VNSFpDOWlsSlA0eEsxZWlpNkkxUDRValdKRWRx?=
 =?utf-8?B?cDZZSGFvK3Nqak9GLy9mQ3lwZ0MyRGNUbEdkeDQvY05mWGZyakFHSkY0M0Nz?=
 =?utf-8?B?Zi8vOGttamNQLzg3VXdjWUJqVDJGRzJ3UGpjK25BaE9LUHFiOXQvTWpXSzE0?=
 =?utf-8?B?MXErSVdlSGlGbWlIb1lsTnB1Z2p2WjZZS0J4UkJRNWtNbVNCMHRKS3JPRWox?=
 =?utf-8?B?ak41eUR5WjRUSVF1ZUl2aFhBUkhsQVhDMzF2TGFtaU43elE3T1BvcWRFTGZF?=
 =?utf-8?B?QlF6bU9OS1FORjB3Qk1Jd241MlFnTjR5ODVQWmtkd296Q1FmcGEweVRXNjRR?=
 =?utf-8?B?djM1WFhGRVlRNE5yQVEzOUMrK2pFbWpkQjhPTStOc2U3ei93bjlhMjdYZjd0?=
 =?utf-8?B?Qkx3UWlVL1hOVWpidjlnSlNVK3o3cXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTZsT3pMc0RiQk5HbG0rc05zRDdNWnJBMkdhbnNpZCtHRXNqYzVhbnBubTFN?=
 =?utf-8?B?UjRobzI0b0FHMXJsL2oyd2p0ZDNQYzZhUDJtcUZVdUdPNmU4SStkV0lRazZa?=
 =?utf-8?B?YXpMY1ZyNjU1MWQwRVhSTG5ibDhPNzRmcXlhQllpRnc4MUl5NW56c3k5c3FP?=
 =?utf-8?B?L215c1RSWGkxRy9rckNJY2VJMEhVUHJsSm5WcENuc2RvUXE5ZVdnNWkxSGVq?=
 =?utf-8?B?OVFCcmZjSFljSHhtejBDSXo1Y05SWDI2VFlHazBiWmV4V0pabjM1QzNMOXY3?=
 =?utf-8?B?MDZrdFdrM2RGYzdwdW5JTVFMamxIVFRrN2JNQVJGNzRYY0ZCbFdiT1pvQkUv?=
 =?utf-8?B?MnZvV0xJWnYzMEFkcUhQa0ZlVGZDNHhnaHJLTklTdFRGRWhoWTZSV1NsMW9I?=
 =?utf-8?B?ZDFtaTZ1NnBmckgvM0JSTlN4MHh5WU9KZ3hHS2trSXNLaWE0bFlZYVIwZHZl?=
 =?utf-8?B?bXp3MXVBeHNZUUI0cElKaTR2SHVVQ3RtYlZPK1NrbU5lWCtSb3FpYUFSOG9o?=
 =?utf-8?B?TnZIN21TQlNDZzczaVdwSFZpaHlnTnRPNjByQ21UZSt3dGRTcHZJSUVYdXo3?=
 =?utf-8?B?WDZ6Wkh0L3RsVHorRXhlK3o2YWYzaTRkZTRWUkQybkFLU3lOMFpXS09WbGxS?=
 =?utf-8?B?cm82bGwzMEVuNS9NNzZzR25kS3BiQnczNk5XSjJxdHJqejMxa005WlhuQlJY?=
 =?utf-8?B?eVlrNUdxTE9wRFYrbzVxSTkyVGxMYlVrOFZJdm9aYkYvck9LKzVnQjJkNFB0?=
 =?utf-8?B?aUR5WXJVOVhmV1NrTGZ3VWVRYzY5ZC9mcXduVHp0Z1dkcUFWZ2VETjF3TXlC?=
 =?utf-8?B?eXlYU0RrQXZQSCtjZjJ4K0ZBaExVQys2Q3NCNGR2QnV3QUliN1UvZHBmdmNR?=
 =?utf-8?B?SlBIdjk0c3dsZ3hqaVorNU8wS01HU0UvZ3BsMGlDS2JPUHFHOThHTHRSejZz?=
 =?utf-8?B?dHVwMnR3aE9uQXBaWi9zaUJNQXRGbGRBQWdyenhEa3ZBclh3b1JTNFZGaEZG?=
 =?utf-8?B?ZHJRVXpwSkpGbjhlRlpZTDJGK1BIQmREa2ZzRXo5ZlFVNC8wU2NqcFN5ZHZF?=
 =?utf-8?B?YUFlUW1URGQvQXpRZ29NU0J0WVpWRW1pNlI1bFoxOVl4M2RNMnI2V0QwTXdW?=
 =?utf-8?B?ZmNEc1dISE12MU5sZHZRbTU0YUtmQUFONDFCVEVRVW9YeFRNdmdOR2M2RlM2?=
 =?utf-8?B?dXNmTU5PTjNEZHl2dHF3WUFwbFRDWkxlSHVwcEYxbkUrNWhISnpRN3NUMi91?=
 =?utf-8?B?RjRNT1B2S1FJQlQ5SmptR2NWZnFBdUxyS2NES0Uwb2d3eGVHRzJ4VmxHSDJo?=
 =?utf-8?B?clA5UkJFcWJFa2QrUW5hRENzbDF4Tk5RNzBkYlY4QUdpYUxhaWszK2xVNnFh?=
 =?utf-8?B?OHIzRmhESEMvQkZRMzl5d0VORFc3Wnlhd0xaMlM5RTB5ZDNtTUpIR0wyRTBv?=
 =?utf-8?B?RWc0dzBXQnB6NGo4WUYwMncvck85ZWlZN0ZOUWRJYiswUlk1eFpYbkN2RHlV?=
 =?utf-8?B?YTRVZTlIVWxVa1lFazJQaU4xbGkxSE9EY21sTVhvL1FCNUVRYkdmUklNUC9B?=
 =?utf-8?B?SmVHTmNRd3NkTjV3Rlo5bVFrUjdZNUhiakJMU1JMSkxZTnZWRVVFeWZscWoz?=
 =?utf-8?B?UjRVc1pXVEZuZ0pBOXVFRVExbHhMd3ZBL0FhZURqV29UYi9BTk5vSnlReWQv?=
 =?utf-8?B?U3YwWE9aajl1MzVFMzN3RHRIZFBxZFlNOFZUSkRiNmVXemVMMnlTRjMwdUFp?=
 =?utf-8?B?OURxQ2tMbzE5UFgvbTZIZDMvRmhNS01HWmVtbVRieVQ4aDROUVJ0cGlSdm9M?=
 =?utf-8?B?M0RPTVdNeG9FNlQvYnJhZi9DRE5jZ2l4enBDMjJjYlE2Z2VLalFYdkN1YVJI?=
 =?utf-8?B?K2p3NEdia0ppOUxEWFJGMzN4OWYwVTRqanFyQ0IrSkxlalA0NXIyVnZVc0cv?=
 =?utf-8?B?bWdUSVo3aEZMVmFRWHlkMTQ3eDIwNzZ2ZkI4eWV6VE5TSm4rTUM5VGNtQ1R3?=
 =?utf-8?B?UHluSXRZWGlyVGhpN24yeDhwSTh0SmhGaVRjWTNRODIydUNMMVQvR3dFbVlo?=
 =?utf-8?B?R0kyQUl4d0R6NUtLajlWcFUveHpZRUtOakk4ZjR2RTVGNVRLOUNIQWdXd0cy?=
 =?utf-8?Q?BRxRBbWqxSU9AW5aonJdwyaC7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb39658-e739-4d8f-98bb-08dc7a7d8984
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:37:57.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGSd0Jx4UsTtSszoEki61clYYN8+zQDgnlXbmoxROSzxfWiLhlS+SkoIDftXJ/xjDT7TXs0Zqc/56HBoTkNlPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839

On 5/22/2024 10:52, Paul Menzel wrote:
> [attached output of `dmesg`, no other changes to original message]
> 
> 
> Dear Linux folks,
> 
> 
> On the Intel Kaby Lake laptop Dell XPS 13 9360, 
> `/sys/kernel/debug/pmc_core/slp_s0_residency_usec` does stay 0 even 
> after a s2idle suspend/resume cycle.

It won't change your numbers but FWIW you can also read from

$ cat /sys/power/suspend_stats/last_hw_sleep

which is also accessible under kernel lockdown.

> 
>      $ sudo dmesg
>      […]
>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 
> 06/02/2022
>      […]
>      [10176.745124] PM: suspend entry (s2idle)
>      [10176.757275] Filesystems sync: 0.012 seconds
>      [10176.769118] Freezing user space processes
>      [10176.771693] Freezing user space processes completed (elapsed 
> 0.002 seconds)
>      [10176.771710] OOM killer disabled.
>      [10176.771714] Freezing remaining freezable tasks
>      [10176.773487] Freezing remaining freezable tasks completed 
> (elapsed 0.001 seconds)
>      [10176.773504] printk: Suspending console(s) (use 
> no_console_suspend to debug)
>      [10176.948337] ACPI: EC: interrupt blocked
>      [10176.951016] intel_pch_thermal 0000:00:14.2: CPU-PCH is cool [48C]
>      [10181.281827] ACPI: EC: interrupt unblocked
>      $ sudo more /sys/kernel/debug/pmc_core/slp_s0_residency_usec
>      0
> 
> Is that expected?

Is it a regression?  If so; probably it's worth bisecting.

If it's not a regression IIUC you should probably run 
https://github.com/intel/S0ixSelftestTool for assistance in next steps 
on debugging why this is happening.

> 
> 
> Kind regards,
> 
> Paul
> 
> 
> PS: Some system details:
> 
> ```
> $ LANG= lspci -nn
> 00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen 
> Core Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
> 00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 
> 620 [8086:5916] (rev 02)
> 00:04.0 Signal processing controller [1180]: Intel Corporation Xeon 
> E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem 
> [8086:1903] (rev 02)
> 00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 
> 3.0 xHCI Controller [8086:9d2f] (rev 21)
> 00:14.2 Signal processing controller [1180]: Intel Corporation Sunrise 
> Point-LP Thermal subsystem [8086:9d31] (rev 21)
> 00:15.0 Signal processing controller [1180]: Intel Corporation Sunrise 
> Point-LP Serial IO I2C Controller #0 [8086:9d60] (rev 21)
> 00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise 
> Point-LP Serial IO I2C Controller #1 [8086:9d61] (rev 21)
> 00:16.0 Communication controller [0780]: Intel Corporation Sunrise 
> Point-LP CSME HECI #1 [8086:9d3a] (rev 21)
> 00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
> Express Root Port #1 [8086:9d10] (rev f1)
> 00:1c.4 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
> Express Root Port #5 [8086:9d14] (rev f1)
> 00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
> Express Root Port #9 [8086:9d18] (rev f1)
> 00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point-LP LPC 
> Controller [8086:9d58] (rev 21)
> 00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-LP PMC 
> [8086:9d21] (rev 21)
> 00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD Audio 
> [8086:9d71] (rev 21)
> 00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-LP SMBus 
> [8086:9d23] (rev 21)
> 01:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
> Bridge [Alpine Ridge 2C 2015] [8086:1576]
> 02:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
> Bridge [Alpine Ridge 2C 2015] [8086:1576]
> 02:01.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
> Bridge [Alpine Ridge 2C 2015] [8086:1576]
> 02:02.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
> Bridge [Alpine Ridge 2C 2015] [8086:1576]
> 39:00.0 USB controller [0c03]: Intel Corporation DSL6340 USB 3.1 
> Controller [Alpine Ridge] [8086:15b5]
> 3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac 
> Wireless Network Adapter [168c:003e] (rev 32)
> 3b:00.0 Non-Volatile memory controller [0108]: SK hynix PC300 NVMe Solid 
> State Drive 512GB [1c5c:1284]
> $ LANG= lscpu
> Architecture:             x86_64
>    CPU op-mode(s):         32-bit, 64-bit
>    Address sizes:          39 bits physical, 48 bits virtual
>    Byte Order:             Little Endian
> CPU(s):                   4
>    On-line CPU(s) list:    0-3
> Vendor ID:                GenuineIntel
>    Model name:             Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz
>      CPU family:           6
>      Model:                142
>      Thread(s) per core:   2
>      Core(s) per socket:   2
>      Socket(s):            1
>      Stepping:             9
>      CPU(s) scaling MHz:   14%
>      CPU max MHz:          3500.0000
>      CPU min MHz:          400.0000
>      BogoMIPS:             5799.77
>      Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep 
> mtrr pge mca cmov
>                             pat pse36 clflush dts acpi mmx fxsr sse sse2 
> ss ht tm pbe sy
>                            scall nx pdpe1gb rdtscp lm constant_tsc art 
> arch_perfmon pebs
>                             bts rep_good nopl xtopology nonstop_tsc 
> cpuid aperfmperf pni
>                             pclmulqdq dtes64 monitor ds_cpl vmx est tm2 
> ssse3 sdbg fma c
>                            x16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe 
> popcnt tsc_dead
>                            line_timer aes xsave avx f16c rdrand lahf_lm 
> abm 3dnowprefetc
>                            h cpuid_fault epb ssbd ibrs ibpb stibp 
> tpr_shadow flexpriorit
>                            y ept vpid ept_ad fsgsbase tsc_adjust sgx 
> bmi1 avx2 smep bmi2
>                             erms invpcid mpx rdseed adx smap clflushopt 
> intel_pt xsaveop
>                            t xsavec xgetbv1 xsaves dtherm ida arat pln 
> pts hwp hwp_notif
>                            y hwp_act_window hwp_epp vnmi md_clear 
> flush_l1d arch_capabil
>                            ities
> Virtualization features:
>    Virtualization:         VT-x
> Caches (sum of all):
>    L1d:                    64 KiB (2 instances)
>    L1i:                    64 KiB (2 instances)
>    L2:                     512 KiB (2 instances)
>    L3:                     4 MiB (1 instance)
> NUMA:
>    NUMA node(s):           1
>    NUMA node0 CPU(s):      0-3
> Vulnerabilities:
>    Gather data sampling:   Vulnerable
>    Itlb multihit:          KVM: Mitigation: VMX disabled
>    L1tf:                   Mitigation; PTE Inversion; VMX vulnerable
>    Mds:                    Vulnerable; SMT vulnerable
>    Meltdown:               Vulnerable
>    Mmio stale data:        Vulnerable
>    Reg file data sampling: Not affected
>    Retbleed:               Vulnerable
>    Spec rstack overflow:   Not affected
>    Spec store bypass:      Vulnerable
>    Spectre v1:             Vulnerable: __user pointer sanitization and 
> usercopy barriers
>                             only; no swapgs barriers
>    Spectre v2:             Vulnerable; IBPB: disabled; STIBP: disabled; 
> PBRSB-eIBRS: Not
>                             affected; BHI: Not affected
>    Srbds:                  Vulnerable
>    Tsx async abort:        Not affected
> ```

