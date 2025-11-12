Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6B27B50C
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762970615; cv=fail; b=s4QGiK98Rl35Znvj6GVi5Vyz+kmw1lPXL4yjJwP7sM7+4NwKHfUNEBXZIJxClVj+whMS+doyTBVzrrkOv2/cWJaUwgdjGBfSOnRNm7Hc/o/tRVJ6rm8pcz4O2N5X+k/xxqQjiFOY7a5isM1mOUrPgdyU/1DNKrPYsSEBklzZXF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762970615; c=relaxed/simple;
	bh=uuiuf7NDvfRYhx9luZxgcp9CqkMtYUpKAVHUhObHVjA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jq8jkME3N3x/GxdIt294Rh0J3T+vyTte4V2RXCCpm8ulT78YEvd6tyfGAa2kq6mkeNHrtRl7wWwJUk7g05TIPIJAQZSKMZWq8Bky3KU48IM5NpsGD+dvmJgBQuMXpXsT2wbN3fGFNqyb3InKWOiQxHM+vQ3ngzMhmqWGePTfTBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XqbCbdZs; arc=fail smtp.client-ip=52.101.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XqbCbdZs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cc1wbCv1A2ISpM+1PnnrurQ+LNwh/LF6ogVtVsytWVygmMVis5AnrpWoUYoYzLRQoJLOXrNbV5S8EWGjDs08oJSc/s2Oz+pAiZNILADVr2r4pGGwJGcAfxe/kRF/w55eymyXvGct0xYaZ8/8LlXgo2sIoGUuyr2Skt87wUidGqypY7DuEf7SyUgn5l537EeBkTYM2buimIoVq2s0NJd3mz0lfSQ/LrOZYFNhwiZ3HAH7BM6TBEhC7MJLlmHJ3OgnYzsCChz8VsqPH1wImQ+i92JqNPwAFCmpblvptqxFHrGlAEBHDG+AGHIlWpydSmfpM41H1X0lL2fzxmouT3bHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+o6JLz5/JxO+ijYUfqAMoBQcogQxyAbKL1Dg5UJg7Ko=;
 b=pGWH3TYURLucGGQ+sQrqgEYfc5zmGAwlwpNrQ9O1sIUcYR9kFCk+IGBXOh0ZUSSalCZITcrz0MWJJ+h4wusfR//p8cH+hpqAfxAoCK1mb9TuMkAK+RaHK5NZR2qeSvFbVrSPOrqg+NDW8/7EuoSeykMOCFxL5+PEUGXiGZ+POpr3zWer70jh5Ewl4lfQ+UFIip7cjA5IC2oVA3ZYj7AeBRwwXwiSMpekvFj0odjJrVu1MjyzsQL1tU/gxW6QfjYSxhm2NBYb+TcoQI5FoVmhRcPfx39K3peobpAL5+DvqaPq0dkNWaLQsgsckzfHiGb3jHrZ/xGnlNz2gd/rtAc4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o6JLz5/JxO+ijYUfqAMoBQcogQxyAbKL1Dg5UJg7Ko=;
 b=XqbCbdZs9Teyb/MdQmVlD0Hf9wTQpituHsLp1E3tM2t7IjKkzcGZDWV/KngYGrIdpXIbUZRFY+rAmGw613wGCCIRRgoHOOrtJiXxixhQk52O+kImPoWVd/TzyQug+gGZ+cA72SfRgdBb8MCtpKbPSFTg5A3PLhD+nnyqeFMZ+5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CYXPR12MB9444.namprd12.prod.outlook.com (2603:10b6:930:d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 18:03:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9298.010; Wed, 12 Nov 2025
 18:03:31 +0000
Message-ID: <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com>
Date: Wed, 12 Nov 2025 12:03:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power
 estimate via AMD PMF
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 lizhi.hou@amd.com, VinitKumar Shukla <VinitKumar.Shukla@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
 <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DSZP220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:5:280::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CYXPR12MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 124e11d8-0359-43fc-5479-08de2215c9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWVvRG0vTXorOGxEa2hEY2NEWSswZVZOTWZWYWxlSVFlUDQ0cGpQbG5LNE9w?=
 =?utf-8?B?bjRYNVYvT3dRVk80NVNlQjJWUndNSmxjbGEzMTg5R1BFVFlteGVrOEV0WHky?=
 =?utf-8?B?K2dzTytaN2VVNFhtc0pYT2x3MG9rcnVjQkp2UFphZDJMaUtUQUpUdU95K2Iz?=
 =?utf-8?B?Vlg0aGJyWXJ2RnJGZlExbmNTcjZOdURNZDhBbEFySFVvSDRUUnBmMlo0dEZZ?=
 =?utf-8?B?VDdLRmwyWTNkNnhjL1puSnR5K1hBMUNyNS9naWk0TXduR1pSNWIxY1JvYkFs?=
 =?utf-8?B?VFBTSVpkM3M2RHVJcHJ5b2FZWk5ZV2VTMmpqaEhLQTg0U2ZqOU5Yc2xqbUFU?=
 =?utf-8?B?UEZoZGhKamUyM0VJWmNDbmdTMldUU1pPdURTbnZ3YlpMSE1FQnhVNnJoVnFu?=
 =?utf-8?B?VFhoeTR3NDhpT25YY0V1cWJZQktFODVpZ1kyMjNUUGdkMW1qVlh4ZGgzN24v?=
 =?utf-8?B?MEo2eUdkaVBHMEZLLzdXZ0hjUG04VnNDUGtuYXFrWWpwQ0wyUmVJV096bUh2?=
 =?utf-8?B?ZUtic1pwRDRqSktPd1lMOFBBNHNNSmxLT3FSbW5DY1Y0QVQxeENHZlV6VHVH?=
 =?utf-8?B?cnB5aDVKUXBocGRjVHJ5RkQ3UFo5Ulhjb1BIL3djQWhLcVNlaEZNSEZET05I?=
 =?utf-8?B?Zm5iU0J2eE5JUDQxYmNFcVNWaHZteWU5MHFuRVhEazFSL2Y1U3gvRG43L1Rt?=
 =?utf-8?B?TWdpdE1KNTlwMXkzM1NIVndzbjRrVGIyK1pGRjhpenNoUGc1MkU0UzNHMW80?=
 =?utf-8?B?OFBFOEFJanFMN3NZRHZpR0RMY1lsSHdBYWNDcTRMeGFobjBsMFI0Vk1hM2tv?=
 =?utf-8?B?eHlsQzRJbU40NGN3cXJsT29zRittN0FxMGphcC9XY1ZJRXRaS09IYS90WE0z?=
 =?utf-8?B?OEE5R1hlaFozNzlKb09nc2M4ZVgvREtDUnhBSENCVUpzMnZqZ2hvOW85MXZi?=
 =?utf-8?B?TERkTlRWdFV6OXg3ZzZNTkJ1c1dkWEs4cU9JUG02YVdSeVVMWC81SUxCZDRK?=
 =?utf-8?B?N1Y3SGpBaURneGxHY1dCSlRIVjAwSExMQnFuS3pxZ3BzM0lDc2c0WXlHY1NF?=
 =?utf-8?B?ek1EVVV5RUVqVDFDV1pxSlpKdFVEVWdDSGpCVFY3UWF4Q3l1dFJKMnpFUHR0?=
 =?utf-8?B?OVM1UVNESTlKaHBCUlNGVDNNek0xM2xkOGk4cEc3YVZJNWF1MlJZdzgxTThY?=
 =?utf-8?B?eVZ1VTRXSml2Q3dad29WUHhEUnJidDJwOUU4ZGJ3TEhpalVXV0ZWUFVabDhW?=
 =?utf-8?B?UjJ4b0t2c3UvNEhsV3lxMC9relJ0UXVSSFlqNStxOWRCM3NDbDN3YjVmUEFH?=
 =?utf-8?B?R3RpQkgvMkpiVjQ4YU9mSEFINGN2Qy9tV1JzMEhuVzAvTXFOejZVSmpWb0pn?=
 =?utf-8?B?bVRuNTJxV21qS1FQUHdmUnAzTXc4UjlnYkJUS2VkNWthSC9mMlFzc0dWZ0Iy?=
 =?utf-8?B?WGxXMDZEeVVHdUlrWlJhRTI0T3o1WnBFbEh2TFZDL1hUbnc1bWs2OXhaWmpp?=
 =?utf-8?B?L3ZjUHU1VklmV1N5Sk8xeGNtREw0ak1YeEhWVWQyR0QwTTR1NWlGSEJ2aW5k?=
 =?utf-8?B?WW5qaHBRTkIyMVEwV1hQNlR5a1J2STlUcEFuU1F6Z0JwUWpOSVUwekp1MStv?=
 =?utf-8?B?eDRNay9JNjZmbDRLTjBkU2FNd2g2TjVBb3R6aERCb3o2OVVrSDFrY1h1L2tP?=
 =?utf-8?B?OGVldWlva3pBb2pXVGx6SC8ycS9DMzBpME5URkkrelk3cEo5UWFpbTcyZThR?=
 =?utf-8?B?RkRjbmdQenRSZFp5OFNXZldxYUd3TEtGZEVMTjMzRVNLekpNM3MzdlRXVk1C?=
 =?utf-8?B?aWNWdEpoWE1FM0VyL3p4UnpoTkhxSTJDdFFxTlRqMGFXSGtqU2xPK3FCNU44?=
 =?utf-8?B?VkVTMnFiVzFSQzhvWmlHL3dPVGlQUHB3U0hCVi9WVG9CWDEzWXpSdk9CY1Mv?=
 =?utf-8?Q?v00IYW/reveN8JBlEb0GUxVpC1RYcyHW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um9XcTd0eWxTV0FhTnYzN1RpODZUMkR4WmNtNDVYUUg1Qi9kSjJsTDN5YUZK?=
 =?utf-8?B?TFlDbWEzYzIyTjYxUm13WkViUUpvdVlrUTBFdEt2SlZ6RmF5aFdQemwydWJX?=
 =?utf-8?B?S1l1L1BSdlp4aXhSQytQenRmemRKNUpvWGkzUW04VUFVQ3ZkTDZFU1JKUTY2?=
 =?utf-8?B?emNzdUhPK0ZnekVMd3RyWkljWElpdExueVNEM0RkRmY5dEcwNmdpUG5tMm41?=
 =?utf-8?B?WHd6L09YTy9JYmNYd0ZVZFB6NjhQMnJhNkgyQ3RxaDI1a0NMRXNQaDVRdU4x?=
 =?utf-8?B?R2N6YUM4UGRFMzBjcGh2OVZLdVpoVnl4dGlvdDdqSWp3ZXJXVVZ4RmlIY0tB?=
 =?utf-8?B?em9wdzAyWkQxZVVYclJoWFEzcUxUUTFwcm1PMVJmd0pvdnF2VXk3OUtIT2hZ?=
 =?utf-8?B?K3UwbHdVYTV6Y0MyRzZaUWExT2J3TGhkQTgybjEwRTdlTlEvTzZNdGFFMzRJ?=
 =?utf-8?B?N0EwZ2NicG5FVFk2WVo5YXZUQ1FMRm5GQjViSFZjZkd4cDRqODZ6dTZhRDFj?=
 =?utf-8?B?TitDdlJOTXRTSWtkdTJjd1NIT01uVTVjUFM4clBPSnlXRHNQNWwwZXhwK3dx?=
 =?utf-8?B?ZjdsbWQrd0RhOVAwOVl4c0VHS0dYZVNKY0l5cGwraVF2bVRTR1JiaURNZXRO?=
 =?utf-8?B?cC9KWkltREloalN4MlhXVTNWOGNQQkw4d3pTYUxnSFJSMWc0VVRka1ZnUHh6?=
 =?utf-8?B?VzFhYlk1WFlTcnRaZ3ZLcTY0U2oxSG9RSjBTMjBkb1hrODdBeHJxTHdETVBS?=
 =?utf-8?B?ZGNrbzdrRnlTUHl1Y3JxTzIxR3ZqOXM1QWk5NmJkM0Q1S0xHR01tSDYxQTZI?=
 =?utf-8?B?WTBYVlhNd0ZnUkpMdXhaK1d1UytPaU50SGl3OVY3L1hWUzJKRXNSSVVuRWh0?=
 =?utf-8?B?a1A1VmdUWlNVZUwrcFJ1UzN2bStSQU5UWE10TVNJazRzWWJxdFRBc0FlRjdm?=
 =?utf-8?B?WmpBbUJEd0tpMitqclFDOFBWeVc5bjBBSUlnYWxIb3pYNCsrRFFzb25vcUxN?=
 =?utf-8?B?SnFhOVlMWFBLMTBPa0JQVzZ1ejA5Ujh3Qjc4VFNsZ0kyODJ6VFBSVWJXN3Jp?=
 =?utf-8?B?ZXpwVzE4TFFGZGg5SHZkNGtqQThxMjNWL0pKMUd3TCtIYXBtOVZnWnY0U3ZM?=
 =?utf-8?B?UG10d2ZwcHRTT25jdHRvd2hmMEo1ejhraldzNkUweTBGNnB2Qm5QZFpod1lK?=
 =?utf-8?B?NFZTNUN2QU1kMCtndXZzTnQ5ZEtHbHhieWhBMklzTzhiRzZacHhaa0pudUdF?=
 =?utf-8?B?ZWtrSG5pWDZodFlQZnlTMFcwanVtWWNLWitQUFFsKzFCKzB3NjlSVjBBeW9Z?=
 =?utf-8?B?R0s0T2oxaXdBdDFxb0I4clJzWEpWdXVNVmtXL1ptVmRIWDI2bjV0T0F3Z09J?=
 =?utf-8?B?MURlUGhKWFppMWJNZHhZd1RiT0c1bmNQcTNXY2h6ZW5KL0dzYmdiWFIyZWN4?=
 =?utf-8?B?QVpSQVlWbHNPd1BteE5CUTZXK1ZPVzBVV1NiaEVoeUtEVmZpL2lpRnZZMmNL?=
 =?utf-8?B?a3JFNHFacnJIbHAxaEJtNXV0T3JCVk1UUmQxWmJFRDNvRDc3RC9hbHc5V3U2?=
 =?utf-8?B?VXQvUkMyVGJkdVVra3EwdGdIajRzeU1TcnE0SXdjM2ZaajZWZlM3Z3hFaXQ5?=
 =?utf-8?B?UHNVVmVzOE1vWWVjOWZPVW1PaVNncVRpYitrMjVaOUNkRlkxamhlZDNNSGNK?=
 =?utf-8?B?K1pVdmtuelZ3M3d1M3Y1dDFnOEdVeG5OU3dEd3dDaHY4MWVaam4zdkdPZkJF?=
 =?utf-8?B?ZkNjYzRkVm80enBiMEg3QVRWTW1zTEJHYjNEempMU2xxdUlSWTdoZzFUeHpZ?=
 =?utf-8?B?S29UVkltaThxRTk5bjhnSmJNTEtBRmQ0UnVoNUYxdjN5V3NvSnhlQm1QMUFG?=
 =?utf-8?B?aC9Bb2Nta3Y3aUVMK2dVWFZvZS9ucDlMQlRJN2dma3YyY2d4c2wxZWpqUCt4?=
 =?utf-8?B?U0R1aXFvUk9MYXMvcjhGMTlNaFltaFZkRWptcmcyVEFqTDJYaG00M2krVXZW?=
 =?utf-8?B?NXcreHVoc3IxZ1E2cDFaVlFjV3k0V3FqRGE3Y1lrSmNVVEdPK3FwY3g2NHJ3?=
 =?utf-8?B?aVByM2dzd2NpN3JCalVIUXFBZE03R2crOWFlL1l4aUJyTVV3RGprNmdSQW5Q?=
 =?utf-8?Q?TqrfFV/ldr7CLCiHfsHBInusn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124e11d8-0359-43fc-5479-08de2215c9bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 18:03:30.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AgHqFMNiHbY9ywgqlS5s8sd/ZFZLk59sfTByn5QxniIlbGxpri7czlY5el3E3IhtN6sq+CBrSsx7tSmsWDscQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9444

On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
> From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
> 
> Add aie2_smu_get_power_estimate() to obtain NPU power readings from the
> AMD PMF driver. This xdna interface enables user space to reflect current
> workload power consumption in real time.

But.. it doesn't.  It just adds a new function that could potentially do 
this job.  The actual gluing it to userspace in some way to use this 
function will be another patch.

> 
> Signed-off-by: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_pci.h |  2 ++
>   drivers/accel/amdxdna/aie2_smu.c | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 91a8e948f82a..5601de841b5b 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -8,6 +8,7 @@
>   
>   #include <drm/amdxdna_accel.h>
>   #include <linux/semaphore.h>
> +#include <linux/amd-pmf-io.h>
>   
>   #include "amdxdna_mailbox.h"
>   
> @@ -240,6 +241,7 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev);
>   void aie2_smu_fini(struct amdxdna_dev_hdl *ndev);
>   int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>   int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
> +int aie2_smu_get_power_estimate(void);
>   
>   /* aie2_pm.c */
>   int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index d303701b0ded..7b5e2c383dd3 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -54,6 +54,18 @@ static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd,
>   	return 0;
>   }
>   
> +int aie2_smu_get_power_estimate(void)
> +{
> +	struct amd_pmf_npu_metrics npu_metrics;
> +	int ret;
> +
> +	ret = amd_pmf_get_npu_data(&npu_metrics);
> +	if (ret)
> +		return ret;
> +
> +	return npu_metrics.npu_power;
> +}
> +
>   int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   {
>   	u32 freq;

