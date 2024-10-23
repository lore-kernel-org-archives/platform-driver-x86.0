Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDC71B4F04
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729692352; cv=fail; b=Ku1n4DCyKo1nmcWToVqByL5D2+9XlYk1DOdnF50mN/yCITr+89SrFsTKo3CDeLNhJkc28dVpzMmp71+TXSTSyCER0/s1pze7hL6lIuDsY7mbYZgCIBxJSEWqW1RoRohAQ4ZacQPYJq+4bOF1eY1f2ubyXpJZYO4r21Ve4Er9QS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729692352; c=relaxed/simple;
	bh=ZNVTPzj3z0i4kKgzBP2fL98mfmbz0RqKHyGFD0Fjt3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DqUJMga0YV2XnO8SOHAn24S9vgYUg0FT1OyJpYVrsD4idqE25qVmyK+bMdGtFEfDhGURpT4QP3H/A2O80gMAfV4h4HsUHEp+SE2dsbgGzOdiEqy9FOXMtfkuxLcKLrKVHmAyohZ2WpxIlTM12173Lq6lQmcNMBqjfcj+38RWFdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OAZOn2Rj; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OAZOn2Rj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0e35lbuh/y2+O2fmL71daTBJjblgTZN8R/OEiYKjxJ2VDU7sN58tUala/0ilQINsoQHQy4AhNcqPnQeGKmugm3PLy+wYD+G3lYkKtzcPbSdSw0c/ZcAxIAMR5PrNO19Tj2p5SM4wgjc8o/Uxxpgg9u0sl/GQ/hF6vdqsYZ1xPjVrkC2ksPbVwY0NzS/5fTVGdiVsmtXyKPMR523aevugPU0GX+4jg2IOMBAfWjgWk9Ql4mH8xHhouCQW1VK8VAn2w99mWcOn8wmasEj1+qec00v95/F+a5lR92JUF+7LAdCvKsKQmiADvIgnR0HiRicAERWAT5UiAr/0SMySFqdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/FKaQzY0ugzSE+HrUkdQnGQHLMztyC3xKjpSYRPiwY=;
 b=nU2WPjfrBL1naMCQs1jXV9qbQfTC3bXQLCN/Bit/g8Hqons5XmpIoxOf57uIghW1QByFhSnmE1VFr18xqADpwuGKM7ZdCNBwdWtzQh+zbPHF+sxaiCZUdXZxPBq0OXfrt+KrMkg2oW8GrjouwXMRZFpH2M3PufMJ1mVC9csLBhhsZEGGwt24GPgKZxwBnHD/ZlCr82kjGXcKjSof6uI3R5AW9mYInjea0UGf8PB52Nwfa3kCfgwOk97z53O4mI0nzzQrg5nvZlyv4K7VoQi+IKg3/mUtq0TQKQDx17Ph7UzMxdZSjgyDQpNbyQOzhjWRdnauAziJsxB6V4m4Q1J5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/FKaQzY0ugzSE+HrUkdQnGQHLMztyC3xKjpSYRPiwY=;
 b=OAZOn2RjxbZr2RWDtAI198dONWeSBtCR4nJygnaDQivfm9k+sZ8hrmExbcfzVgNkgelJwOBEKPdsJL5BGIhVVd4Hvyr74LpO8SMrrXlXMnjOQ7QJ65gk+06qh9NJBqKQn3cDI7QcAH/7ICpNRfFAUPLIi/+xW027EMy+lBqRhqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6705.namprd12.prod.outlook.com (2603:10b6:303:1e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 14:05:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 14:05:43 +0000
Message-ID: <08b77281-7e3c-440f-8f7f-9b82ea51e671@amd.com>
Date: Wed, 23 Oct 2024 09:05:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] platform/x86/amd/pmf: Use dev_err_probe() to
 simplify error handling
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241023063245.1404420-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:806:122::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: e520435a-fcf6-4bd3-4f9e-08dcf36bc8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGt4Ri9UOCtTb0RubjZNRTVacllzbVlNRHJlaHFaZE9STXRSM0hTL1prc0tB?=
 =?utf-8?B?Z0F1S1hzNUUzUW5QcHdOalFHR0lVM2xzVkU5RVRscVQwdis1VlhSY1RDaTlt?=
 =?utf-8?B?RTBMTi9ENWtqVHU4bU1wZ01DZUE0QzdFUmNJd1F0eUNpVkxPdXNuS1U4RXVH?=
 =?utf-8?B?UVJCcmFDRTJxTzBUdCtKUnJTa3JiM1VybnFJOXlNbEpiVXNPM0NORVNTZ0oy?=
 =?utf-8?B?dkp3UUVWYzZ0UUV3ci8zUm5ESHQrU1BNNWpnRWpHdWVIV1VJY0J2WjNRbW9W?=
 =?utf-8?B?ODB5eUdOZDlsdFRIMENhK3I3WGVycVlzc0FXZUhPQTdMTUwxdTNacnE4THFQ?=
 =?utf-8?B?dVZEL1g5NkVYYUZJZ0dHczhUb1p0eDJsOXZ6MnVETTNkeG9ITE9QOXJEeE9v?=
 =?utf-8?B?Z2xXTmp6YzFicEZsWXA1bkZGM043Vzk2S1V4MnkzK01KY0svK1N4M0dFRTdL?=
 =?utf-8?B?Z3p2aE9NUVBvTFNSUW1nVUkybllwVGxjUmZXdzd0bVFGM3J3WjFCdUlUZFFq?=
 =?utf-8?B?a0lzejJPb3J6UW40SlJVelJsejJ2SnZITTV1WWNZcEtyYUdRdS9YbFZRSnYv?=
 =?utf-8?B?N04vZldaVy9TeFJIYnBVYktvaWtkYTJSTzRRT0Y3TGpYd1I0Mm9QTDBRUEkr?=
 =?utf-8?B?K09FR1l0RVFaSXRHNWdrdjIyM2dPaE1Xd1FvdVJTbktzUXVnN3dsdFlpbmJH?=
 =?utf-8?B?SGRPeE5HbTFGM1ZEMFhRMXB6WTh4Q0xCNW4vMkVIWEpCNzdSZm9ESmZPazJW?=
 =?utf-8?B?Ky8yV1ZFYjJnTzlidjlmTVdKaXlRTkx5TURSeWhGT0tQTDBiZXRnQ0dsYXlU?=
 =?utf-8?B?eElRV1JnRzNnSmwwMDNUWnFqOTArOHJNYlBna3dycURlTHZtRHdOdXRSMHcr?=
 =?utf-8?B?eTVrSjEyeWNtM2NvQ1JpUmNVcXZFeW96SFpoZHJTejQxNU9MNXBWZC9RWktx?=
 =?utf-8?B?UG01VU9vbXhVSldYVWJGdEhwYUxpaC9hYTg1UDBmOENNenR6MXc4L1R1bW1E?=
 =?utf-8?B?ZmE4MVRlRE9qL2NScExEWHVDOTBGaHN6OHJaam1YRlErc2gvellpaU5md1Yr?=
 =?utf-8?B?L1JkUUVrYys4Y2NFVnVVY2s0b1EwOUY0RnFabmlKaFJzY2Q0cmZ1dFQrWE80?=
 =?utf-8?B?anNnTFBRRlZJdGFLbTVDLzhudmhjdFlFdVdnall3cXpVZGRyYysvV1MvSWxj?=
 =?utf-8?B?by94Z2F0M09oeXU0dGszQ1VlV253K1d2V2RjVjVkZkJoSzRpb0hCQVU5aEJP?=
 =?utf-8?B?QloxUUNFQ25odGMwMnFvU05TeVNjNUlaMmNrN2FzSHZPOXFtV3NuUDFWOGNj?=
 =?utf-8?B?WDgyNWNSUHRGMzRKaE54UGErTkdpeXFyczdIcllLS3B2UVdkOWZlaW16VStE?=
 =?utf-8?B?RVQ5S3NFa3IvNkxJd0FKZGZGWWNlWnl1MFJDQlJiSm1EQ3BsRkYyMmtmVWc1?=
 =?utf-8?B?UjNwcCs5bUF0a0RZMFA1SlFreTFWMXA0bUlhaGc4T1RVVGJyZ0V2alVZZzB3?=
 =?utf-8?B?cGFGd2FHUHhCdkE4ZXVETlFuRzdvK2hJaytmUHEvYitOME1RWWVRMld2RG1J?=
 =?utf-8?B?bmh1Wi9od3FWL010VFZKV3JUNkEybHVSc0g0NHI1K01LSVlmMXlWa2tOaUc0?=
 =?utf-8?B?dG05bjd0cnd6VmxHcXRwbFcwSW5ldGh2Q05lU01FQjlVc05DRGVaajRVYVow?=
 =?utf-8?B?eVAzWnhnMWFrZlR3dmVxMUZPNmpFdS9LS1Q4d0t1K0lRWkNnNHlwaTh0bEVS?=
 =?utf-8?Q?ZcE8sZOsev9JA0HaCACpAKvNtZv0/xK5DfaZ0lk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDdqLzJ4cDR0N202UTJhMVk5ajU5REF5S1BXNGEyaVF2bjY3ZmV6OXBjZk90?=
 =?utf-8?B?U0VTQlFFREgwSW0rMHdjKzkvL284VThzMVZxbzhvTFFpRklHamY3eXRsUVp3?=
 =?utf-8?B?dzg1b242NG95WmpCZHpXUytuRXloVDVxcHloQlFNeUkxZzQwSHlrOHVtanAy?=
 =?utf-8?B?ZXNEb09EMXE5SU5pNWpWL3JpOGt5bTVuaGV3Q0pPWUJRSlduMXVQbXBvVmZK?=
 =?utf-8?B?RktncStqeUFlRWt6YmduWUxYdmp3c0RPSHhVNklNVjBRb2ExcER6VS8xMUN5?=
 =?utf-8?B?a1p3NUhCb2VFZHE4SmVZcE5zNXVjeUVsVWhBWTRJVS82blJ4STBydFc1Z0VV?=
 =?utf-8?B?RVZwaDNGMUxkYWRJR0V3NlFsbmZoeTV1cDUxVTZYa1NNRkh3R1UxTzA5eElk?=
 =?utf-8?B?TWxlQTlUa21lbzFXc0kzN0F2QkJOT01MMkViaUk0VWc2cDI5TzdMM2QvRVE0?=
 =?utf-8?B?elIwZ0J2TnBlcXp5dXVpOEgxZUw3ZGVkUFRTb2JtaFUyOXVIdUcwMjJhakdD?=
 =?utf-8?B?c2xiR2VOaW9NSmZvSUIzeHQ5WkE1b1NjeWRQTUR0UHlRaFYya2VyRnlXbEkz?=
 =?utf-8?B?REJtZWxuZ0ZKOCtFd3JTc1JIaHk5aXdOT3ljVGxEeWZCUFpSZ1I5UTBtTTFX?=
 =?utf-8?B?ZUExUWFCZmh1QVlqcjRLWk15V0RwZjRBZm5XSEZKV0I2L2V0UnhVaXNIQVQ1?=
 =?utf-8?B?aEFIMGJWQnNwNkI4RU9uaTJHeElwWHJyWTF4OUFERkh6RlV2SCtyZ3RMVTNK?=
 =?utf-8?B?dmN0T0syczhwczJMWmhRWTJHaGRhZUo5bkhtTngvTnA3cXRwNmx5c1VjcWxv?=
 =?utf-8?B?ckNEQmhGZTNrNE9nSUo1dXMrVUQrUVh6bGcvbU1HMWd3S3IydjNES1BaSDRw?=
 =?utf-8?B?Q2poaUNwR1dMMzB3RW5TN29uUEFPVWhBNGFvV2RzNXJXRU9FVjZONUN1VWZV?=
 =?utf-8?B?TWNMRktvNTg0bWR4a010TDI0TERLOWlzSXE2cnQyMXdzNmthVEtqYWF3bVdJ?=
 =?utf-8?B?cllRa21KS2xoZHhoR1BXRG95UU1OcER0QnYyZHdwR3BNc05FZlZPVFFaSzR6?=
 =?utf-8?B?amtPcmlEQTBEa3YrYU5VdTVoOHR6Tmx5Z3BmYlRtRUNXbDhxTHRESGpjcWJw?=
 =?utf-8?B?eHBZTGtBWFowQjJYdThyeWdZNzZ0b0pTU0Q5MlQ0RENjbU5LMkVZdWpyTU0w?=
 =?utf-8?B?SzVPVkZrN0ZRMWhybFExOCt2eUNBQzFpUlhua1hhRUg1Qks1eUhRQ3d3YzRi?=
 =?utf-8?B?Rmtza1BpVG1weXhqaUlkYkhXbmxhcnBWRVFUd01ZQ0U5TmVuWTBYMGw0KzBl?=
 =?utf-8?B?VUdybkY1bktwMkJEelhaSUpvZ0ZXcWlKMWNISmN5NkI3Lzg5bWd6MndhTlJh?=
 =?utf-8?B?d1ljS2Z2M1NyVThJc1gzczR4aUs2cDhrQkZXdkNITDRwQ2NoSTVZVEExeWFI?=
 =?utf-8?B?bDIzSWlBS0tENWNIZVhsK25tUkNndUhsd1NERlJJSVpFVU1ieTZkOHFYeTlT?=
 =?utf-8?B?UE9TWFBwdUljcDBZNVNyTVZ2eG9nMElNUElzQks2R0wzSDVzc3QzdWxzZjFX?=
 =?utf-8?B?c2RuWFVHWmt0SDVXQ0hwR3N6S0h4NjJQYjVVMC93bTBKWkQwRU02eWN1Vk13?=
 =?utf-8?B?UDdvYkpuQjkvUTd0djhoYnlOZnpwSi9vOFNNWnBRR1p6NkdsSFFnbXZiR2Ix?=
 =?utf-8?B?YkN2SVVVcW5xVGJ5Q1VOR3VXcXByTjJzR2pHQWVEUXh4Y2hzaW1kZ2I0ZkJQ?=
 =?utf-8?B?N0lPQ0pSa2NESGMxWFpaRWtGUjVsRFoxdlNoS3VQVUR6UzBHMWNvb2pmcjVV?=
 =?utf-8?B?cXJraXBWYzd6eVd3eXJnbURPUXhwOWYyb28zMm9JTWZaZFJmczJ4NWNnaXFp?=
 =?utf-8?B?dm1hSlI0VnZsbzRhalo0L1Nmc1l2T1NUMk1ubnBHbHRhenZDNGRJaUVXUWdq?=
 =?utf-8?B?TWk3K3NqSmF0OXY2VElSWGkzOElNSHZuL01BQ3QrYXhUNFdTOElFNWdIZThN?=
 =?utf-8?B?cnQzN00rOGdGb2JBY1FpejBnZHZIMjVEREtET29XSURnUk9ZcFdKbGk0OVNY?=
 =?utf-8?B?SytMcEtYWEZQQXVPTTl5Wk9DRkU0d0prbzZwUGZpUlREOU1Zczg1WE05dmdq?=
 =?utf-8?Q?uIRI/Ke6S7XR2P47W3b6fLaXq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e520435a-fcf6-4bd3-4f9e-08dcf36bc8c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:05:43.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6R269f4Do6yYTiqsWAC+rv7X8Vt9CF5khMk8QblsiJQNH/qC2+ymFt+RG2WvsymQ7bPp23QGVEVGlsCPO3SM5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6705

On 10/23/2024 01:32, Shyam Sundar S K wrote:
> To simplify error handling in the amd_pmf probe function and reduce code
> size, dev_err() is replaced with dev_err_probe().
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/core.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 347bb43a5f2b..12c3e929fdd1 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -430,18 +430,18 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   
>   	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>   	if (err) {
> -		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
>   		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> +		return dev_err_probe(dev->dev, pcibios_err_to_errno(err),
> +				     "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_LO);
>   	}
>   
>   	base_addr_lo = val & AMD_PMF_BASE_ADDR_HI_MASK;
>   
>   	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_HI, &val);
>   	if (err) {
> -		dev_err(dev->dev, "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
>   		pci_dev_put(rdev);
> -		return pcibios_err_to_errno(err);
> +		return dev_err_probe(dev->dev, pcibios_err_to_errno(err),
> +				     "error in reading from 0x%x\n", AMD_PMF_BASE_ADDR_HI);
>   	}
>   
>   	base_addr_hi = val & AMD_PMF_BASE_ADDR_LO_MASK;

