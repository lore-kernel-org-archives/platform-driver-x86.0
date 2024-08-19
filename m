Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED794148856
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 06:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724048222; cv=fail; b=cAHx328on/E+JKs75GR79nJJkSSFUeDcJOLXVs0HZrhpaaii5XkUTgYtOgvUt2wSdaxdRfh284NzUhaaoKGCilTYRGFXUt7y+mMvwzhndpyeisrJc/zSjn63VHK0E02HbD4N1+Q1dGv3XwpMAAkZgeuPQeEIXVSqdKnEDbKAPtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724048222; c=relaxed/simple;
	bh=hcO6F1UW6JAoTy4lxOfNxrn0UcXCdFIDQPwBGJlZjgs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dOO5pBEU0AHS4rPuY2l2tVB7kNXwlfpD2BoWlDkIUfAM6UDhOwF7xSSh/rrQjIKH99JHqdAf3XY/xN/Mk7sdReUcRI6pp0IHujAaIVp4R4kS+aA3T3iq15ms7RskzfbmNqL5u7s/5IEYisTiN1i5SupUPBsmdKkK6cVmPkwceIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NfIEUP7g; arc=fail smtp.client-ip=40.107.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NfIEUP7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+2B6xjrK/IthYsA8Rx+ljCv1Nvyipv7I8+4wBz1jfIUiYmqiWABPPNcLVf406pqPeuXSsJJJi9Ktp44FRHCRhlY97IQUZWldoE5Q5hJsgMF8CkPxtfwbBNU7iRo8C4a+ksCJCZT13qk7bmkwsok03lA90Iah0f8lysO/7siX618VsxuxuCC6P5KRKdPkh7ger93nucFnsSM+Dbl64zXDtyS80dgtt4dUQBWmIeoVassUHrjHjyduVm+3/Vlts8gmesv1BUNhDgb3DayR3ZD7jpaX6tCbThjmm8AzwHV19Tm35X8WTVSRLozXfJ7rA7KmAe8Mmt8F/usW1ON0VPHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB1tixJeuL4XAtWz/nLxHL30saNZo91phhW2iAgyH98=;
 b=oym/76aU8cZ1OEoisfuLKH0H8BZe0lZkUAE1XmmwiDHfZwfQijwOJheYaIyEw1Qv9fLveEeF/Wbxn+bbAKR3/UdMXkxxLR3FAIsxq2XsDiNmt/ePPoto4pbwNHVfG74aH40Nk+UELkeFAt2n/J2uAIFd3d3+yoE1v1639in+PYfQtV/tx4bpkSzpOCus1D91d3+cTVGwmxRndEfGXHPYKpj5SznPj37q1qqBkqyhkTWQV0/4KBZ37wjCfqd7QVWOtRSzBDdunheia1AAuOTmyfPpFzalLCOf/DM2/osJ8EYZeLHSTFKqE8wLj7R15HefPM6FfRqozCvqUqVLkwHVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB1tixJeuL4XAtWz/nLxHL30saNZo91phhW2iAgyH98=;
 b=NfIEUP7gMzPcCNSjv7VayOvsn7wfwlVNoTm5PGVCTiJKj2OA/Qc7HRxxt7ln3YECSYvKs0LriG6sbsuA1Jm0756ravXfSVqBq1ULYzLCqr2oH0ha4G7gxQKgM5HDxwV21soDHaw2prSH660IsfyvqEgXMl5xm8iZ4jVyr28eF3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS0PR12MB7606.namprd12.prod.outlook.com (2603:10b6:8:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 06:16:58 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 06:16:58 +0000
Message-ID: <dd2494ca-cbda-42ff-a577-b69080658979@amd.com>
Date: Mon, 19 Aug 2024 11:46:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmf: Update SMU metrics table for
 1AH family series
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20240813133540.367384-1-Shyam-sundar.S-k@amd.com>
 <20240813133540.367384-2-Shyam-sundar.S-k@amd.com>
 <005740e9-3a9a-6df7-8ed7-96452d541169@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <005740e9-3a9a-6df7-8ed7-96452d541169@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS0PR12MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a7158b8-ec99-41c2-09ff-08dcc016879b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2ltSzkxRm1Lb3B5NCsyd0QxdjhhK1BzWFd0QlhWMmVVVkRyTkR6dmdxeDJD?=
 =?utf-8?B?MmtlNVRHc0dtbWM2OHIwMm1FYVUzYzdJNWxGQjg3a0xsMHZHbjEzOHljQmdC?=
 =?utf-8?B?dkxjR1pmRVd6UWVWalJtTzNkRFNNYzdVSE9HMFdNSXh4T1YxdnF0UWMxbTY2?=
 =?utf-8?B?bllXb2VrbU5QRjB2czQyWHZ5RTE4Nk5qWDNaY3hmZkNZZ0lmL054YVVBdysz?=
 =?utf-8?B?bmN4NDh5TG8wSzdmOS9mWjl3QjYyOFl2SGVjd3pqeURGMENqUXl0ZVJmSmls?=
 =?utf-8?B?eVpiekRQVVdBQ0RFWnNOaDlxV0d6NzBRMzJJMzdrMFBud00wVGxFWGd1MGJH?=
 =?utf-8?B?NTNzQ2F6c2tRZHV3Y2dwaUl2THJVekpheXJZeldLTVg0YjZzSTBWbHd4M2tU?=
 =?utf-8?B?VmNJZWRLOGQwL25ORzltZ280Q0Z2S09xK3ZWUHN1a1hTbGNvU25weUFyMWFa?=
 =?utf-8?B?VFFlOVdmdXZTMmovS2ZwL2NLVUt5WlA1NWZKd3ViVmdXOGlOekYxMkVNOXlL?=
 =?utf-8?B?NzBaTXVyNm1jL2ZseEk1Qy9oYUhZekRudTVURGZOZEJCRjI3NFBnRlNqc3Ir?=
 =?utf-8?B?UTlwZEZKYzVsV0l4U0VJMjdyMW9zOURRYTdQdHdTOUlIb00rWWp1K1ZOcnhK?=
 =?utf-8?B?VXBoOVhvNWs5SGhSTlhkNk9jZXp0OTlyb2laREdvL1cvRU5ncG5TVkF6cHBi?=
 =?utf-8?B?QkhOalhBY2xKMFF0VVlFQkx5L2JJVEdxN1VRQlJiSFJaclM0bmdZVVIzWkJJ?=
 =?utf-8?B?WU9NTVR2UkROQnM1dTc1cFNud3huVFJBcjNvU2Z6ZVNWWmFMdk1vaG1KZ0VO?=
 =?utf-8?B?SlZtZldvaVpGYmxTbkhmeXNZbzYyTjUrcm5lS3NkRUdrNDRwNU90VUcvcUxG?=
 =?utf-8?B?WUh0R084L2gzVnhPZlJiNENLeTBFb2ZvclFMQStaRDhpUkRYYlptNGV5bWlE?=
 =?utf-8?B?ZUVMVGlDQmZzR0RGbU11TkRqNE1iM2VTV1gwNXIyVUFoTjdGcGxxK3B4a01H?=
 =?utf-8?B?Q29adXhQYnduRnF5YUVReklvTnVnSVJTUCt4VUdKSGcrNkVENFFGSDFydnBR?=
 =?utf-8?B?ZVlHTHlEK09IZWFjQ242ZUlOMzN4MkVYWlZMUzlVbGs4Ry9DL0x5UXNvenV5?=
 =?utf-8?B?WlJmbzVrd1Q1SENaTXBoMGgzZ2pVR2lmdmovWUYvQUowNHBFSzRyRzQ0bUhM?=
 =?utf-8?B?TTVBbnloRU13SGx1Ykh1THpvZVplbW52WGFlN1BraS9KM3Q3aVhGMVlVL0JY?=
 =?utf-8?B?Z0szeTUyVW15eWQ2THlvQ21PUjAvOURmQmdtR1pTaXBVeUU0QmJEMU1DdU9r?=
 =?utf-8?B?TzRITHF0cDNJRVVzRFI5WVJRQk5SWmFyRUZxQkI1b1BCK3BkTm5IV0JXZllU?=
 =?utf-8?B?NkUwanNERGZrSDVSUDFFOVA3OTZpUDRjVFF6R3V4MCt2MnFNUDZUV0cyYWtC?=
 =?utf-8?B?UlNzVy9YcVFITHpJY0UrS1Jqem1jemhaNTdsVnFDajlNN0hPSmRiQUtFQjBZ?=
 =?utf-8?B?S2JBa2VNeVEvT1oyQ1MxV3RmNmpWTkpmZHRHd2hvREtOaTJrYTVQQTNDS0ZG?=
 =?utf-8?B?M3QzOFJJNGxOMXRMR3k2WXJYd0dIU3phV2pad1dwNUp1dWY5dDE1YU0rdVFu?=
 =?utf-8?B?N2F5RTFLTklnSTM5R0F3MEhsVDJaaU9vcjFTbUF6bk9ReGJkRTRkREFYa1VI?=
 =?utf-8?B?MXZLeXNUOEpZdHdmNktlOEJPRG1pcUpuYVpXVi9ZaEUyVnJFT2hvN01ZN0I2?=
 =?utf-8?B?bWtkV0xxclJkQngvTXpQUFFRMnM1anRpWDIzclNUaVVrVkt5RytwZFNIcmw1?=
 =?utf-8?B?VC9OakJCVHNLTEJrc3BFQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1R4d2pqZ09EemNPWk1IOXlYWkFONW56R0ZYRkk5M1FqVFBYbHBobDNaUUlO?=
 =?utf-8?B?VTVPdHIvZFRaclFZODZLcEdiSGVyemNVTWUwcXRHN0lWa2ZCc3ExbGVsMFpl?=
 =?utf-8?B?ZnZiVmVBL0FyNVR4TTNJQlp4dW92VTNDQkp1bjlYNk50eFpUUE4raloyYURJ?=
 =?utf-8?B?LzhjYnBHRk1DZjlmVHNzanpVZE9WY1MrWE42S2NiV0ZQKzdZdTZYTks5UjQ2?=
 =?utf-8?B?U2R4RHpTNm5mMlkrUHZXTzArekRnYWx6NkhEUktSRGlCM2NrTW9NTEhYRFRv?=
 =?utf-8?B?SHNtT0NTMlArWHJsV2JjZXQ0NUlJL1RPQmMvTFFRUTZvdGo2ZVNqdklnOXhU?=
 =?utf-8?B?Mlg0WUF4MXd2L2piNzJYZHg4Nk5OQUhuZnlBaDA0SWovUVRubGYwYVBJOTFP?=
 =?utf-8?B?c2RxN0F0Z21NRTdXQzd0ZjZHajVNVWtFd3NPVTBBSndTZnNRYjhRSkxxeDF3?=
 =?utf-8?B?NEpRcTFiYTRqeXdUQVZpQ3hSUTlFT1NXVnh0TjQ3WjkwV1Y0RlNlRXZYQ1lW?=
 =?utf-8?B?TzdydlhIekNkdmtjS3pPS3pOSGJoV1BOcktFQXpJSEx3Ukl1Wjd4dXJnRVJn?=
 =?utf-8?B?cTBwMW4wd21FWFJEZSs3c2tBbU1BckRhSzJFODQrWkw4dkZmR3lrVnNuUFUv?=
 =?utf-8?B?QnVLR0J0YWxmTUFSdjVLaVFZQjloeTB4WTVUWlhLNkg1NjY5YlhhbmNIVlFi?=
 =?utf-8?B?dVBLK1lzL2FvdC9kN3VIeXVBY1N4Z2dEVFFJUXNWY1E2aUkvQ0x2YUl1SERo?=
 =?utf-8?B?ZDcrZ3BZOVBuVGZCSkZzdVB4ZGpyWktXcGE0UExzTHRKT3ZyeUVyVFRvdG94?=
 =?utf-8?B?ZVppR042cDRQMkpoOXZENnVwUE1ocTkvOHkwYUZEMGJmRlBUb2hUL1NESTgz?=
 =?utf-8?B?a1I4Y21RdXBiWFhXYU5IdTBNZHFEL2twWnpVUlJycTZDV01ZL3EvWHp4cDhV?=
 =?utf-8?B?ZFpKdUI5MFJBNmczaW4wL3g5K2hvVFNQR3ZtRlN5NFdtMnpxMU9RYytnTzEz?=
 =?utf-8?B?MG54TXpMbzR5ZE1DU3VtYWpIZ3I3VE5JbGpXR1N1dE1oOVhHeGdaSUhSbEph?=
 =?utf-8?B?SHNEN0F1d0k3S3RobEtQU2VyYk1oOURaQi81TC9lOTVwTGE2NE9xdTBISjhS?=
 =?utf-8?B?QllhLzRONzRmalNtOTcrb2E0UUFYalNJN1MwN1Z5T1ZYRHdTTmN0K0pCeDFY?=
 =?utf-8?B?TFUyYWF4ZW9hVkpheXd2VGZKeGpGOUxSNnFHZHFTZHdSbFNaR2FncHd3RnFZ?=
 =?utf-8?B?bGJTVXU2eSttMFZDUUhkb0k3emplWnZ1MWcrRlZhSVRlV1hxWHp6MSs1cUo4?=
 =?utf-8?B?SFM0cktGdmV2N2FZT0d0QlZCOHhDdGVTQ242cDNtQUlRVkJDYnF5eUxMb3hh?=
 =?utf-8?B?aDExUE1CVmVEK05tNUZQSGptWGpFN21RZ1MvMTNrbm1UQkZXUW9tNFU2Nkpm?=
 =?utf-8?B?ejl2dm43SG9SVjR5cFZ6MUNPZEpyYXAxSGtOeUEwTms0c2tWNmhGUmU1T2F2?=
 =?utf-8?B?TEkrZGVhTVZEQ25FZlBhaDZDTmhQMTh6VHByL2JkZlZ5dDBvUzQxYStQWGdl?=
 =?utf-8?B?QnNhZ2RxZzVSYnRHSVR1NXp1Vm1PNHhrQ3hGNEI1VjVGN0c1WXNLZjd1SHFR?=
 =?utf-8?B?OFRGcU0vc01rK0s4dzRKS2VZZTA1QVpmdTZZMHZhczgyRzMrOWNPT09ja2Jl?=
 =?utf-8?B?Rm1Bdy9OTWJzRjU2Y2I3MVB6UjB2RUllaUtWK3I0cWpFUnJMcG84QmdwVnZa?=
 =?utf-8?B?bEQ5eWZiMXg1dlJ6ZnVaaU50LzIxVy9lWlpvNWxQV05VUndtWHE3Y2RycGtq?=
 =?utf-8?B?akV5TSs1ZUI0dHRIdCt0dEgwRFpSNUxqRDltdEJheW5DY20wVU80bHZzTXpJ?=
 =?utf-8?B?aC83eFpBcm1ZamU2VlljbFNDQ0dsQ2xwOVMrR0xlOEVKcHFrNFJJSFhVbHYx?=
 =?utf-8?B?YlZ2MnIyelZvemN6WmNBbGtmNStqOUMyQjJoMW1yeElsUytkZVRHNFh0UHdF?=
 =?utf-8?B?L3VDeHBxVUpnTnpOTkVsMVpuSnU0U1pkYnA5T0RucUh0NE9GaDNOdldZUUhj?=
 =?utf-8?B?dEJjZ01jVkZiUWVaYmhRK2ZEanVsNHE2LzBkLzJ3MVl4MWphcC9OMnp6cHFv?=
 =?utf-8?Q?kuC1A0IrT5COSNdUtK2KxUfCf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7158b8-ec99-41c2-09ff-08dcc016879b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 06:16:58.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8MVSCUHpte2jexfXlXaDduQjo/7HDPfkKVP+PCXLDrw7T4TEZueP4DfXXq4pA1Ly9WRcBcun3etsrjiBDki3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7606



On 8/14/2024 16:30, Ilpo Järvinen wrote:
> On Tue, 13 Aug 2024, Shyam Sundar S K wrote:
> 
>> The SMU metrics table has been revised for the 1AH family series.
>> Introduce a new metrics table structure to retrieve comprehensive metrics
>> information from the PMFW. This information will be utilized by the PMF
>> driver to adjust system thermals.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v3:
>>  - Address remarks from Ilpo on the helper for C0 residency calculation
>>
>> v2:
>>  - Align comments
>>  - add helper for max and avg calculation of C0 residency
>>
>>  drivers/platform/x86/amd/pmf/core.c | 14 +++++++-
>>  drivers/platform/x86/amd/pmf/pmf.h  | 49 ++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/spc.c  | 53 ++++++++++++++++++++---------
>>  3 files changed, 99 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 88314b0277a3..0ba9045224d9 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -255,7 +255,19 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>>  
>>  	/* Get Metrics Table Address */
>>  	if (alloc_buffer) {
>> -		dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>> +		switch (dev->cpu_id) {
>> +		case AMD_CPU_ID_PS:
>> +		case AMD_CPU_ID_RMB:
>> +			dev->mtable_size = sizeof(dev->m_table);
>> +			break;
>> +		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +			dev->mtable_size = sizeof(dev->m_table_v2);
>> +			break;
>> +		default:
>> +			dev_err(dev->dev, "Invalid cpu id: 0x%x", dev->cpu_id);
> 
> CPU
> 
>> +		}
>> +
>> +		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
>>  		if (!dev->buf)
>>  			return -ENOMEM;
>>  	}
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 9fc26f672f12..8ce8816da9c1 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -198,6 +198,53 @@ struct apmf_fan_idx {
>>  	u32 fan_ctl_idx;
>>  } __packed;
>>  
>> +struct smu_pmf_metrics_v2 {
>> +	u16 core_frequency[16];		/* MHz */
>> +	u16 core_power[16];		/* mW */
>> +	u16 core_temp[16];		/* centi-C */
>> +	u16 gfx_temp;			/* centi-C */
>> +	u16 soc_temp;			/* centi-C */
>> +	u16 stapm_opn_limit;		/* mW */
>> +	u16 stapm_cur_limit;		/* mW */
>> +	u16 infra_cpu_maxfreq;		/* MHz */
>> +	u16 infra_gfx_maxfreq;		/* MHz */
>> +	u16 skin_temp;			/* centi-C */
>> +	u16 gfxclk_freq;		/* MHz */
>> +	u16 fclk_freq;			/* MHz */
>> +	u16 gfx_activity;		/* GFX busy % [0-100] */
>> +	u16 socclk_freq;		/* MHz */
>> +	u16 vclk_freq;			/* MHz */
>> +	u16 vcn_activity;		/* VCN busy % [0-100] */
>> +	u16 vpeclk_freq;		/* MHz */
>> +	u16 ipuclk_freq;		/* MHz */
>> +	u16 ipu_busy[8];		/* NPU busy % [0-100] */
>> +	u16 dram_reads;			/* MB/sec */
>> +	u16 dram_writes;		/* MB/sec */
>> +	u16 core_c0residency[16];	/* C0 residency % [0-100] */
>> +	u16 ipu_power;			/* mW */
>> +	u32 apu_power;			/* mW */
>> +	u32 gfx_power;			/* mW */
>> +	u32 dgpu_power;			/* mW */
>> +	u32 socket_power;		/* mW */
>> +	u32 all_core_power;		/* mW */
>> +	u32 filter_alpha_value;		/* time constant [us] */
>> +	u32 metrics_counter;
>> +	u16 memclk_freq;		/* MHz */
>> +	u16 mpipuclk_freq;		/* MHz */
>> +	u16 ipu_reads;			/* MB/sec */
>> +	u16 ipu_writes;			/* MB/sec */
>> +	u32 throttle_residency_prochot;
>> +	u32 throttle_residency_spl;
>> +	u32 throttle_residency_fppt;
>> +	u32 throttle_residency_sppt;
>> +	u32 throttle_residency_thm_core;
>> +	u32 throttle_residency_thm_gfx;
>> +	u32 throttle_residency_thm_soc;
>> +	u16 psys;
>> +	u16 spare1;
>> +	u32 spare[6];
>> +} __packed;
>> +
>>  struct smu_pmf_metrics {
>>  	u16 gfxclk_freq; /* in MHz */
>>  	u16 socclk_freq; /* in MHz */
>> @@ -295,6 +342,7 @@ struct amd_pmf_dev {
>>  	int hb_interval; /* SBIOS heartbeat interval */
>>  	struct delayed_work heart_beat;
>>  	struct smu_pmf_metrics m_table;
>> +	struct smu_pmf_metrics_v2 m_table_v2;
>>  	struct delayed_work work_buffer;
>>  	ktime_t start_time;
>>  	int socket_power_history[AVG_SAMPLE_SIZE];
>> @@ -319,6 +367,7 @@ struct amd_pmf_dev {
>>  	bool smart_pc_enabled;
>>  	u16 pmf_if_version;
>>  	struct input_dev *pmf_idev;
>> +	size_t mtable_size;
>>  };
>>  
>>  struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 3c153fb1425e..74a5e325b6c3 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -53,30 +53,51 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
>>  #endif
>>  
>> -static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +static void amd_pmf_get_c0_residency(u16 *core_residency, u16 size, struct ta_pmf_enact_table *in)
>>  {
>>  	u16 max, avg = 0;
>>  	int i;
>>  
>> -	memset(dev->buf, 0, sizeof(dev->m_table));
>> -	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> -	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
>> -
>> -	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>> -	in->ev_info.skin_temperature = dev->m_table.skin_temp;
>> -
>>  	/* Get the avg and max C0 residency of all the cores */
>> -	max = dev->m_table.avg_core_c0residency[0];
>> -	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
>> -		avg += dev->m_table.avg_core_c0residency[i];
>> -		if (dev->m_table.avg_core_c0residency[i] > max)
>> -			max = dev->m_table.avg_core_c0residency[i];
>> +	max = *core_residency;
>> +	for (i = 0; i < size; i++) {
>> +		avg += core_residency[i];
> 
> IIRC, we already talked earlier about the possibility of overflow when 
> summing n u16 into one u16 and you said it was not possible. I hope that 
> hasn't changed with v2?

Yes. That's right.

> 
>> +		if (core_residency[i] > max)
>> +			max = core_residency[i];
>>  	}
>> -
>> -	avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
>> +	avg = DIV_ROUND_CLOSEST(avg, size);
>>  	in->ev_info.avg_c0residency = avg;
>>  	in->ev_info.max_c0residency = max;
>> -	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
>> +}
>> +
>> +static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +{
>> +	u16 size;
>> +
>> +	/* Get the updated metrics table data */
>> +	memset(dev->buf, 0, dev->mtable_size);
>> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> +
>> +	switch (dev->cpu_id) {
>> +	case AMD_CPU_ID_PS:
>> +		memcpy(&dev->m_table, dev->buf, dev->mtable_size);
>> +		in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>> +		in->ev_info.skin_temperature = dev->m_table.skin_temp;
>> +		in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
>> +		size = ARRAY_SIZE(dev->m_table.avg_core_c0residency);
>> +		amd_pmf_get_c0_residency(dev->m_table.avg_core_c0residency, size, in);
>> +		break;
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>> +		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
>> +		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;
>> +		in->ev_info.gfx_busy = dev->m_table_v2.gfx_activity;
>> +		size = ARRAY_SIZE(dev->m_table_v2.core_c0residency);
>> +		amd_pmf_get_c0_residency(dev->m_table_v2.core_c0residency, size, in);
> 
> Thanks, looks much cleaner now!
> 
> I don't think there's any reason for size to be u16 though (I'd have 
> expected the size parameter type to be either size_t or unsigned int).
> 
> I also don't find the extra local variable for size very useful but it's 
> up to you if you want to do that in two steps or directly within the call 
> (it's quite normal pattern to pass the "ptr, ARRAY_SIZE(ptr)" pair to a 
> function).
> 

Other remarks have been addressed in the next revision.

Thanks,
Shyam

> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> 
>> +		break;
>> +	default:
>> +		dev_err(dev->dev, "Unsupported cpuid: 0x%x", dev->cpu_id);
>> +	}
>>  }
>>  
>>  static const char * const pmf_battery_supply_name[] = {
>>
> 
