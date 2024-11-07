Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3335929CF4
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730993658; cv=fail; b=FJN4RMAiI+991IUapMjYNFYpqFoTOe/KnhHZZu+Bi4R2hRLpZiuB1OEpp9H8P8IcLnZB8YGCRymUQMcymjywVH57ZJS9vkE5Zk9+a9Eupdrzq8O7ZSwX9FDjC0m1Aj8E8rAimv9W4+Rv0I7lq64rr3MSiAWOHvuZAfQ8F/q8Vx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730993658; c=relaxed/simple;
	bh=ngm1S72gtOVdgZBleFUIfm/+EAJK2WXnMmz1K6iLwQs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=emIVEMQjm1WDmaxKlfRDcC77qe2ZFgaZzbPZOKh5iH74iLXva8lpruhj8A+1PNylJCh0El4VliHR98uwo7q1Ywmyel/HMwt0eZscJPS3/K5klPeOfBAEcFxDOSsBC39S8tPBa72UQl7HeiAHh98f6q1DFrr9wP1kSk87mow8bCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G3dbwfzL; arc=fail smtp.client-ip=40.107.236.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G3dbwfzL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZxBO1jigMvti8vU/quc3RpV2JJ61EqVfiRUezgTa38RB+940ha1dxzhmiXXqTsDTSuQ+s+ncpDm+A1RoqCb/9czR4upCX2jdxiFiezBYfzuGp1mzaZgjlbiwNBd4TSItmXHW6DMVg/pWXkWU389hbfb/MFJDmkUhw+/FsX+RVEM3rCBFwqZSoTFb62wEbc6dMwoWqCD88fk4nP9RlQqi+neTkTo6eDnZ2A6a/H4VM+36FFyJN1XNvyVqXiyk144Eis5E7tKZUVrPymX4SQyVZWetA2OieLoLQ5cUIF9wDMbhM0EBj1U+9/1Rdbx08cdTnad142YIWiSi2/KYptlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kQPJQdHvm00FWXKmulGYYGD+pWdYmZCpw9W7uAsU2w=;
 b=y30lDr+xy1+bOTfXvC160AcbALEJYwkUxX4heLA31783exvM/Sl88cW870Y2pjJNvi9AklCyznQ/QMzx2vLsmowoAkNGarke1fEHpktu/ycT3FJWRcY9vR52LB8TC0DBr6GpP8mLV3n5j41FZghhkUu+RFdX4F7EoKJbXaGUyGvZJCkQjmksvnTes5TZu0oXJh0SWzikyzA+w9xXMvVwjgN2P0f5gTleJ6+ZQNsUyDxO8c1o4f+QDKFAbr3DAIEE+ShTkAVqc+YXI4ssD+mcXvuP2OGC8GBdO0ckj0tvsYVhtJDyt9ZDWHaLQreh/6SgVPOdkkCuhq/oP2mDf/Ic1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kQPJQdHvm00FWXKmulGYYGD+pWdYmZCpw9W7uAsU2w=;
 b=G3dbwfzLXlIx+xAKhx4zP5rMZyLciVwR3Ziy2drbpxptYmDtcjh7pSFJavFEP8xuBFrigLDJ6tZm12VykTmzp0ks3MDZRYOXFuXANCnyZsx4U+NJjnVH3rdavM+SGtn7J3RydO6gjSXrf/mrb0O5ZUECVrPhleu7aPfda2/hZrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 15:34:13 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 15:34:13 +0000
Message-ID: <2807f106-c11c-4502-9780-ee13ef3d8fb3@amd.com>
Date: Thu, 7 Nov 2024 21:04:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
 <20241107072714.943423-9-Shyam-sundar.S-k@amd.com>
 <10edabc3-5fe0-15eb-028b-89a0a4e30cb3@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <10edabc3-5fe0-15eb-028b-89a0a4e30cb3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c3a7a8-a4d8-4121-c74b-08dcff41a1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0lvb2RsUWpyaWFsRTVRcXNRZ3hiTEQvekE5aG9kM3ovbHU0VVplN05QOXlt?=
 =?utf-8?B?YlM1QWZpYlV1L3lFd0pwc2ZncmVSYzlZM2pmM2lpVDUyOFN6aXc3Vi9ydThu?=
 =?utf-8?B?dUZVTTdlbVJxQXdBT0RINVR4eXRSUDNmR21YMTdkb25ZMDFuVERVUDVXQ0Iy?=
 =?utf-8?B?UFJoRWtMbG55ZWVIVjVOY1QzUEppMVdQSFR4b2JIOTg4dC9kK0x4WmN4bFEr?=
 =?utf-8?B?ZnYraE5TY1lOSkt2cmJGMW03SFMyVTFJQVBSWWlJOEE1Z1ZqVDZKSW00cytZ?=
 =?utf-8?B?bTlGa0E2OUJra0xMRHc1NGg1NXZFSDc2OWpPNTU3ODJ3UlowRFhCZitDRHhh?=
 =?utf-8?B?OG05eEZ0aHNmbEJuNnkyVEMwbndHdHpZWlBqeklybGl1Wk53VGxtN3k4Mk5i?=
 =?utf-8?B?RlNIZWtUc2c4dmFyVDVqTzNvNnRtdTZycklFaG5heUQzeUVCcWs2eUgrQi9K?=
 =?utf-8?B?ZjA1dndaa0VNTEk1b2ZsV0t3VlpQdDZvZnlLREphOWZOMDJjUkY1M2dVZnF5?=
 =?utf-8?B?OGMyOG9oQ2QwUHF1dHRKQXF3eXNxWVRsWDllWCtFSTc0dS90cHRJU0lGWVFv?=
 =?utf-8?B?S3JaLzAxVUgvYXg5WVBjTHJpL2x0YS9oaG1UQTZrV2s3N1J2YU4wSWJ4U0Js?=
 =?utf-8?B?VVd6T25lRmVuZXRiWTU0RFlrM3dXN3I4UHRXMTBkLzlzQ0JGTEk5VGt4OGJs?=
 =?utf-8?B?VStTSnlMVVNGSVloZzZyUTNwc0JCUUlNUGFVdEZIdWhMWXZiWEdsRHorSlNI?=
 =?utf-8?B?UmR0TEpHQXYzSXdFeUREMGtjNzJ2VlR4ZWp2ZGpIQlBFakd4M1NIOXRXQ2l2?=
 =?utf-8?B?Z0dMU3p0Qkl0SzZnWGpWaUNhME16bUpiYnJFbkIzQ2FvSXhMTEJBSWwzNjdW?=
 =?utf-8?B?TGJ4cVRwQU9HeU5sdDNQUW4vRXRERmVnYnhWR2hBd2NnUGxIMVc0d0l2cW93?=
 =?utf-8?B?Si9aVmF3K1ltRVFBVWh6UFV0djZQOTliVWViZG5qbkZpbjk1VUU2UWZDdlNX?=
 =?utf-8?B?VC9GdjZVVGtBcXM5NEVmNWtJWFRyZXFpRm5NcTdtdHhOT2tubFpXcjFrM2dO?=
 =?utf-8?B?eHBBYkV5dVo1QzRTS3drUHRaa2thSWk4NExuTkhWaGlCakNKNGZkOVpSdGt1?=
 =?utf-8?B?dERDUXFBR3N4YXd1U0VSZkNoY0tZbENGRmI5ZFBFeTFGTzNJYW1lcTZmaHdh?=
 =?utf-8?B?ZGZFQ1gxM2NIVnp0UEZLOVo2RTdKdzFwRDhTdkREOFlMRnBaMXhJSktKN1Bl?=
 =?utf-8?B?elFYeUZPb3htdlpFTW9Hb2hFT1pzOUdrdzNkenRGRTV3WEJpNTM4c2E0Wmdw?=
 =?utf-8?B?YmJqR1lwODZJUEhGL1VhNUFOc1BiZFBxQ0I3WjUrbDRBelVFcTJVVUt5cjM2?=
 =?utf-8?B?dGNhY1NHUUpVUXUwdmwreXpZZ0tjREhjVGZLcDlWYnVkYVNIUGJXU1BrU3Jl?=
 =?utf-8?B?YnJvNk93ZWxNK2NQRk02RklQQ1hlaTg1V2hZaEJjYU1POTFLY2RabnA0Q0t0?=
 =?utf-8?B?dmMya0dVc1dDTGNmZ1pxaVhseWZBaGVtRk5qZHpteDRGZmNPSzlOZVIrU3d2?=
 =?utf-8?B?OXBNMW4xT2hBRTdaWGNkL3JUNndFSUtJeVl5MU5NYit3ekJ0cDZhdEN3akpL?=
 =?utf-8?B?YjllUFR3V1c1bXJtR2p4QStkZkJaZG51QXQreEZmN3p0Tmd4MzJzTU1LdHJv?=
 =?utf-8?B?MGdabUYzYkxmVmJCT1RNZ3NTS2JyeEMvM2t3U0pDWVVWeEtlZ2txR0xLZkhV?=
 =?utf-8?Q?pWCV8ZoLJb2G2UhcA8I4covZsV9d6bnsIg1pRQN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVY2ZFRURWl4Y1EyVGRTNkZwV0ZoRGhUY0lCZ0lsQ0Q4eW1yZ1gwck1qbmJk?=
 =?utf-8?B?RktOK1BiOGFSTUpORmlrUXhEUi9XQnhPN1MwallRczUxc3B6eGVmenFrSkpq?=
 =?utf-8?B?blpHNG1HaUVmOTc1RGM1eTBXZnpFK0xHY0Z4dW0rdUhwa25qNzY2VGtVYzFW?=
 =?utf-8?B?K0o3bmFoN0JLdm5HNHRYbXdkVTZFZlZpcEpONVpzdFd4RFRsTWQvUENDUjhm?=
 =?utf-8?B?SHRMSS9lUU5NN0Q4NGc2UWlSSnpzUnVWOGZWOElPb0pOVWRoYUpkSFl6UUtJ?=
 =?utf-8?B?dHYvRjRwMkk0VjlPM3IwWE9DVk5Vd0RoZXFKd3Mvc1MyTzVrbWEwVmNiUks4?=
 =?utf-8?B?aGVsb1RmdHY0SE0yanBCUS9TNjBDMlRDSmZySktralhWRHZhNVEwYjdYUnBn?=
 =?utf-8?B?eGVRTExPU0Zzb0MxOEN4NmoyeVBJUFExdUxCeHJ4RGo0YVlrVXk0N3dlV2Zo?=
 =?utf-8?B?S2Q2L1E0bTJ0S1QzMVJYQWt0V2ZsZEs3SXpjT2VMc2tYWWtwYXhFVjNFSkk1?=
 =?utf-8?B?OEFvZW90Nys2Y1JBYzk5cmNwZjl1UUNPMmpCZlBnMUt5NmVoWnJ4NS9oYXpJ?=
 =?utf-8?B?cnJPaVBIdklJcTBmRUcvYythdWFwbzR4bDdPc1I5bzFPZnZzMzFFbmYvbjZX?=
 =?utf-8?B?MFZ5K2tZYW8zcnVzaGRQdlhqdUh0VGVrc24wVGFoR3p4SnhhSDA5eHh5YXZq?=
 =?utf-8?B?c1czdlBVWWRzN0k0SU1QNi9GQUpKYWR4TzUyVnhtcThUcFB5Zll5ODdjUGNm?=
 =?utf-8?B?QmU3S3d3Q1l2U2tYNXJTVldGTjd4NUlUWWorQ0RWQmpjbjh6RFMxQ0FHWDlC?=
 =?utf-8?B?WjRNdWQrNVJZU2cxSUQwN293MXpudFFabVNxVE5LQ25PcXdlQWhGaVhHZmU4?=
 =?utf-8?B?NE9oQU1KdkJRNWtaTURML2lxbndoMmU5UHdER1doSUpmZ2NkR0hlcklpTVFz?=
 =?utf-8?B?SURHdnJaSjUvVkplRDBMK2ZybzNXdjJmMitHdWFuU09XT1gyZ01Sa1lQRTJL?=
 =?utf-8?B?eUY4RGtLWkdsMno1M1JpWGVDR0s5ejFKaTJkNTdqYVYrTXFTcVduT1BBMXZi?=
 =?utf-8?B?RmZqaXRYYnN3T2ZsU0RHbUJLdjNtZmV2UGk4WE1kRXY1SEdHK3hNNzVtYS9r?=
 =?utf-8?B?VzRxYmhFdDdPcGp0RjdiNHBuSEFTdjFFWmVYcjRjUWRqbi84ZWh6SlJ2TUFi?=
 =?utf-8?B?a1BMTnE1MTBwY2xJV0pLN1RibFRwaEl5WmdJZHlJVDQxZzZnZjB0d0szNkU3?=
 =?utf-8?B?TVF1ZkpqdkVvMk5jUnppYTlmdkd2VkZLLzcvVzhIRzNSalFYYVVPaE5jOHFu?=
 =?utf-8?B?eG4rQ0RndmtWRW5GaWlTODlubjh1YUdyZTZqUGxXRVdBK3MzZHEwc2xUU29F?=
 =?utf-8?B?eUppeU1MdVJoNHp6S0ZlY3ZTNHU3OHVIT1FiUkUwTGd3SnZ2SnJrL0FEaDBQ?=
 =?utf-8?B?eER6SXRubmwraERHaU1abHg5U2piUWs4UmpyeFM5ZmIzdHdJWmhlUnBjdWc1?=
 =?utf-8?B?Slp2SW1BZjUxVEp3TnNNNzFPbUZoSnRJZnJOZWhZdTBxY3p5N3VobUwvZGxC?=
 =?utf-8?B?UUpuYllQRU8yZDVaZWIzbWEwenc1TnlhejczRWZJOXZuMGNrNEN2T2ZmbnFn?=
 =?utf-8?B?UXZKMlZmczgzQWYxTWlGQ0psS3E4K2hoVzN1VDdJQXViNklDVXBxZWhwVlFp?=
 =?utf-8?B?VEF1dVR1RlNuMDhsYkRUcTVCTVRlM1RyY2QzTERIS2pJSmdPWUhycENQWFZP?=
 =?utf-8?B?UW9YdzNkbnNHWmhCS1B4T3k1VzZoT0F5bVYzL1p3ZEpHaTFqcjVnWVJhMi9E?=
 =?utf-8?B?TWNLa0J4eDMzdzJSR3hIemRyYk1aT0lac0lPMWhSTTRITi9xUUFMb0NLbmhZ?=
 =?utf-8?B?TlNFaHpFbktzOStyTUtWTDg4QXlpNEdpQlBVbldNNVQ3aE9sUGd3MHIwMVF2?=
 =?utf-8?B?aHFOY0t5dExjcGZmSUN0OWN1WURNelB1Q1h4TG1jQVBMZFlCQi9qYVBuNjhl?=
 =?utf-8?B?TzZwSi9jZGJWTWJ4MTI5TmZ5ZWZQak50azZPbjFTR3lydlVPZytSTEZaN2lw?=
 =?utf-8?B?bTMwcnlwcjFvUG5kd2xaR1hxRGsrWHhVZWR4ZFo1cS83UmpVdXpBZGk0bFZ5?=
 =?utf-8?Q?tImEdD5UumWCIuDDowg4MN+T9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c3a7a8-a4d8-4121-c74b-08dcff41a1d2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 15:34:13.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fd9r8V7VaZmWzOei7sYmNRNelxZZBTsjdAF6iRGhaCG5u9+7xJVxC99o995wKUZDQ7pfRvIKzN5BDkAWRSxsbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735



On 11/7/2024 16:32, Ilpo Järvinen wrote:
> On Thu, 7 Nov 2024, Shyam Sundar S K wrote:
> 
>> The latest AMD processors include additional IP blocks that must be turned
>> off before transitioning to low power. PMFW provides an interface to
>> retrieve debug information from each IP block, which is useful for
>> diagnosing issues if the system fails to enter or exit low power states,
>> or for profiling which IP block takes more time. Add support for using
>> this information within the driver.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 42 +++++++++++++++++++++++++++---
>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>  2 files changed, 40 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 7c3204110bf8..5b99845d0914 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -95,6 +95,34 @@ struct amd_pmc_bit_map {
>>  	u32 bit_mask;
>>  };
>>  
>> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
>> +	{"DISPLAY",     BIT(0)},
>> +	{"CPU",         BIT(1)},
>> +	{"GFX",         BIT(2)},
>> +	{"VDD",         BIT(3)},
>> +	{"VDD_CCX",     BIT(4)},
>> +	{"ACP",         BIT(5)},
>> +	{"VCN_0",       BIT(6)},
>> +	{"VCN_1",       BIT(7)},
>> +	{"ISP",         BIT(8)},
>> +	{"NBIO",        BIT(9)},
>> +	{"DF",          BIT(10)},
>> +	{"USB3_0",      BIT(11)},
>> +	{"USB3_1",      BIT(12)},
>> +	{"LAPIC",       BIT(13)},
>> +	{"USB3_2",      BIT(14)},
>> +	{"USB4_RT0",	BIT(15)},
>> +	{"USB4_RT1",	BIT(16)},
>> +	{"USB4_0",      BIT(17)},
>> +	{"USB4_1",      BIT(18)},
>> +	{"MPM",         BIT(19)},
>> +	{"JPEG_0",      BIT(20)},
>> +	{"JPEG_1",      BIT(21)},
>> +	{"IPU",         BIT(22)},
>> +	{"UMSCH",       BIT(23)},
>> +	{"VPE",         BIT(24)},
>> +};
>> +
>>  static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>>  	{"DISPLAY",	BIT(0)},
>>  	{"CPU",		BIT(1)},
>> @@ -162,14 +190,22 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  	case AMD_CPU_ID_CB:
>>  		dev->num_ips = 12;
>>  		dev->smu_msg = 0x538;
>> +		dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
>>  		break;
>>  	case AMD_CPU_ID_PS:
>>  		dev->num_ips = 21;
>>  		dev->smu_msg = 0x538;
>> +		dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
> 
> Could you please put num_ips and ips_ptr lines next to each other as they 
> kind of belong together.
> 
> I'm a bit surprised you need the casts in these assignments. ...Surprised 
> enough I finally went to check what's going on.
> 
> And sadly... It turns out you needed the cast only to get rid of const 
> which is very bad practice. You really should almost never do that.
> 

ah! I missed this badly.. :-( Thanks for pointing this out.

Thanks,
Shyam

> The correct solution is highlighted below.
> 
>>  		break;
>>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> -		dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
>> +		if (boot_cpu_data.x86_model == 0x70) {
>> +			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
>> +			dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk_v2;
>> +		} else {
>> +			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
>> +			dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
>> +		}
>>  		dev->smu_msg = 0x938;
>>  		break;
>>  	}
>> @@ -337,8 +373,8 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>>  
>>  	seq_puts(s, "\n=== Active time (in us) ===\n");
>>  	for (idx = 0 ; idx < dev->num_ips ; idx++) {
>> -		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
>> -			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
>> +		if (dev->ips_ptr[idx].bit_mask & dev->active_ips)
>> +			seq_printf(s, "%-8s : %lld\n", dev->ips_ptr[idx].name,
>>  				   table.timecondition_notmet_lastcapture[idx]);
>>  	}
>>  
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>> index 69870013c0fc..f6d9a7c37588 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -62,6 +62,7 @@ struct amd_pmc_dev {
>>  	bool disable_8042_wakeup;
>>  	struct amd_mp2_dev *mp2;
>>  	struct stb_arg stb_arg;
>> +	struct amd_pmc_bit_map *ips_ptr;
> 
> const struct
> 
> --
>  i.
> 
>>  };
>>  
>>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>>
