Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA6194AD1
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218471; cv=fail; b=Txivh3XdPSCV0Grw60ht/eDliNmSKE/CZD/bq8mlXLb5hSUz3FwkERr9f+Gyh37Df8tOYTw/9LaV+PpM+4+S0yORWY8cIInSqUckQlVw1Yrxm7yd55k46KvGLDQohFmCkNjJCCiLc6L/UOYN93vQDfdFoNJWEf4L/XJkf8olhXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218471; c=relaxed/simple;
	bh=3F3Kz2aNv1saF6LnkcihTB+449g/BZ0Bug29insQh+A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E8Ul6X3PbC9a/rwf7ji0C5bZJn4m78G5Pr8YuWAImZ02vttkYw35i+WMeE4pydDzt2JsDg1WbAVX5kRevDtS6ON+MbZRC87G4gOXcyFO9HloXwnacg+jejJ8MB/mIPVib9MEEPpxTgLe4cuVZEWVyVg49zgP9IrkBYURFjfwbUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pMFgx8n5; arc=fail smtp.client-ip=40.107.244.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pMFgx8n5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTkgPHcBid96Dac2zSD6xpg+CK2GmqfCWDrckUXcQGjEA1hIndYZCnN+yp/SxupuO/0mnK8mYDLoFfOBR+f4kwo/5+fMsdiQLyzpHC2FGSR1grsLigDI+KDe2nA7Qjutd6hhY04wQEyKLWCiuOqF+vrSNPP0MvTtBGw263GnS0IMH5Y5VgQowK+dKwgqUJwvJlNftQAXox0dXrV1gihqLFcFWDPCutIRVV3ISz6wJ9E/490AHn1/8WhRdGidwSuBHM+RH8SCwN/QhY/XOrQng3GWH6gqG2bo1GQF6YYMSpZ7lvtw8MIu+/wssOZ0tBbFFPykXKq9qEJDXAKkybGJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=griTtDCecnZ4cIkmYWpUOJpFG0t8C+0e+X0A+0j5OGI=;
 b=CrROz/xvFl2qMbsL4quOq17EpEL65y3fE2QqlPsYR/lHx30BfAf1Po4Wv/05HMuDwRgblZjp9gghnyfdED4Xp570qhe/Kuq9zSrdKc8jOj9HGu6pczWchZQHYljt8FFxf2z0/7k3nncPn+m+OAMdcd18yQ4LdzCgBqvD8aRtOnRzmsY1n96BsvKi/S9uLxeZ7BvfANiANCEcvDpniBqBDuaeLGnc5acF9AvlFP0QjUPiG2lucMAf3IZSJgeUDpusO84h2SnOO12wtG/5VYcl2o0eT55yurtgAOTUcEJJqeQy+YSNNQk5vlJV0iZ8l+4wQ/demr2+VzqLQs4bWNFHag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=griTtDCecnZ4cIkmYWpUOJpFG0t8C+0e+X0A+0j5OGI=;
 b=pMFgx8n5AfThEmkKCsOO1FWUA6nHsbBuh2pxtVFjhgnJNcvDpNuh5dxU56ByFAAlGhznjXyJWlHE8NIL2J3eKpQ3fwzZTz/YibPMq2CNY1TaqgGPBkKHrm7sXbfU8r7Y88PzZJIbGGF00UOD82hToSX706NjAq5gSRCGhwov5Fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8110.namprd12.prod.outlook.com (2603:10b6:a03:4fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 16:14:26 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 16:14:26 +0000
Message-ID: <c76b944d-f33b-472a-8fc7-a307deaa3713@amd.com>
Date: Tue, 29 Oct 2024 11:14:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] platform/x86/amd/pmc: Add STB support for AMD
 Desktop variants
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
 <20241029155440.3499273-8-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241029155440.3499273-8-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0031.namprd11.prod.outlook.com
 (2603:10b6:806:d0::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: 56312736-3ea5-4bca-0659-08dcf834c272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1NiNFRkN01HaEVWZ1pSTTl6TFE0c0trKzNkdUg5VUlPOENlTnBoWU8vQmM3?=
 =?utf-8?B?NnZiMGMvb3FvZy9MUkVaUGJiQ3d5V3poSFdZa0R3a3VCR0JkN3BxVFNIMXh3?=
 =?utf-8?B?aVljalZDMUxnaEJaMkR4K0Rhb0FBemtSNTJFbGYyTlhyWjJ4SEd0R2xUTWhx?=
 =?utf-8?B?dUNsTTNEN2pzZ0hYOENtMGM3SUxFWEhhWitKL0RzMnhyTUdRTUlZcEJocUUy?=
 =?utf-8?B?UkxsSklYd0d4SUFzM1c1ci9ncnYxRHAwM21LMmNhYWdsSWJYZGpITnFMa2RI?=
 =?utf-8?B?Y2xKSU1LYjk3M3ExS0VMY3hSblAwRXlKTXFMOElrT3UwaGVwZkpRQy9LeGlk?=
 =?utf-8?B?YjVkQW1OeVM0TEEwUElSK2k2a2hmNDVvckMzQmRzeWdkTG9Qc01BY0JxM2lT?=
 =?utf-8?B?M3JKNy9wSmFwYlFsT2FSUk4zY3JyVzY5VDl1ZVAwMk40QnAwaUtRdzBYRWlu?=
 =?utf-8?B?aUxlTnFzaWlUa25mMXZQVDRDWGNkRTVUcFgwdmpxVmVudGp3TC81eFJRbk9l?=
 =?utf-8?B?NXhkenprc2VHT1RHZ0hySmlwdzBnM2ZXc0NwZWw4bGlNMGJ6a1RjYzlRS2hi?=
 =?utf-8?B?SWp0YXNJQy95L013RFRVbTk4KzBlM0FrUnJOVjhYQy92UXJiajRnWXdvTlo0?=
 =?utf-8?B?VGNFN1lBN1NMZUt4VVl2bVJ5WWkzVEwwcnBiZ3VSekxVWHl6NUl3ckZpckgr?=
 =?utf-8?B?NzBJU2VIRk9aUWpJTXRzOGZjRlN2TGhpOHQ0UUNpajg2YTB1TWpBdnExM1ha?=
 =?utf-8?B?Uk5MS21Fb1dtWVhrMHVUT0cyQjNIVUFRSnpPclN2aEVpcGRWT2sySDhRdXM1?=
 =?utf-8?B?MTJaUERKNnptTUJ5RmZDSVdFR1Z2L3JJNkpkaG82dU5vK2ZlTUpPZW1CNDBI?=
 =?utf-8?B?TDlCZjRBVkJIell0SDNHNXg3NUlmb29lUzU5eUhodDd3UnNuMEZkdmRTUHdz?=
 =?utf-8?B?eWQrSExyRGh1Wmg4elIxL29oajJjcGtZZVQ5QytRSVdFYSt6Zms4U1Vndk8y?=
 =?utf-8?B?WTFTZGMxMVZGMHFCY1c2amd6c1BCcyt0UGlhUFJDMEJGRzkxQjRRdk5TenFF?=
 =?utf-8?B?RVNaekxRRENyVEpzV3dOTEw0N3NpQk56V3VzcWNZeXptUUd1VTJhSnlXZG5G?=
 =?utf-8?B?Yit6UExhSDlBSDRFZWkzQURUZ1g4NTdsbGRLUkVFMW90cjBMNko4N3N1NElu?=
 =?utf-8?B?eDJzM0ZZTDU3aHE3VTdsUDNFZGxyT2txYlg5dXV2NWtxRFRtdkpManU3Kyt5?=
 =?utf-8?B?RENSRVRzcldpZzhWejNidER6SVYzZ1lHSXdPYkhLWUQrRWFNbUJKMGc0UDdm?=
 =?utf-8?B?UjNoMlF5TnVpMEZHMGxqTy9NV0d3elpHVzBKVlVOMmp3L3BIRGZzcmc1dUVJ?=
 =?utf-8?B?alAvMkRHZjhWSCtpd0JScXNRTmI2L1d4RE9mTkc2NFIwSUtjMUZvUldjc3ha?=
 =?utf-8?B?RkttM0d6Mjk0dVc5dXFLWG84UEhyRGZuRDJKZDFDSEk0cmVpelEzUkdVMTM2?=
 =?utf-8?B?TGtNUVZLTVZtRDlNNmdTb0NqVDdsVmlyejVtbVdHczZNVmNzRnJEd0o3UUU2?=
 =?utf-8?B?dHhubHdNUTBpTldPSzRyYUlDTENmMzJqK1pJYVdtY1ZpRHlrVFQyV1RkZ3pq?=
 =?utf-8?B?ekhVbzRwZjlpOVB1UU11OFBCa2tRSCtJRFpZbXRyTkFaTnhTR01nQmQ2cWRK?=
 =?utf-8?B?cDhOaUdJWkVMQk1iOExYOGVKZCtLcG5KUUs0TFJmQnVtWE1JbHh0TVZBbFRU?=
 =?utf-8?Q?irws/3hJd8yE27y1330R6+/BQBb5oxpQY9gumyS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWM4L0RqQitIUy8ydFBOaVNDeFhmNER5R3JtTG5yMW5sM3B0SksxTFRtYis3?=
 =?utf-8?B?dWV5c0wzMk1qZEpXM3pwUTdOOGcyMXhqVTFOMExJTkRXZk5mNnBCYVlOWkp6?=
 =?utf-8?B?c0s4Zy9jTHdqRFhScmUrcHBHV3lvc1FkTGVUNUVqY29sK1Y4aVpmRGJIYWJF?=
 =?utf-8?B?TUFxekFSNjhNcWtjTDJKZFB1QXE3T1Q0c0RxLzNsQm1UWlBWaHBCbG1jYVM5?=
 =?utf-8?B?NTl6N1BRUE9SRS9wb1lYWm8xQzlpYm5mUzA2bUM3dWRQQ0d0bHI4TlRpSEtG?=
 =?utf-8?B?dmh0dHpFWUQvUkRJN0p2QTVaOHAvUTdYdzhNZitIWFhjdU9JRjJJNE1sanR2?=
 =?utf-8?B?MDFhMXF1SlYvUWNGQ0xoTWFSSzBEalpyUHZtZXEvYVlKVFIyZElTOC9ZdWxy?=
 =?utf-8?B?RDNvRjNoZmFvYnlxRUVSb1AwdFFISUlrRHdkTndXQ0IwQlFrS1Q0R3VhVUNp?=
 =?utf-8?B?MTdUUXNscHBLK0dUeWw5UDlodUZDSGJXeWExNnpyOGRhUVNnNVIzeHlJUDZ6?=
 =?utf-8?B?cGJXUStuYTk5UUNlTEJjdUtVUnZFaldiazQxaFJXaVBKNUZoK000NUZoVDNM?=
 =?utf-8?B?UHZKSzNLOHF6OFdsNXZsV2FDL1U0RUJqdUIxSUtzZWVyZGY3azcyNE1DRkdN?=
 =?utf-8?B?Z2IrQzYyeEloUndya1B1N0k2d3AwNUtFMHFKdnIwQ2RDVzAzUmlJWWs2dFdp?=
 =?utf-8?B?RUNYNVBVZjVNR3ByUG41ZlBEZGc1eFNUM1p6eDd0UHZzc0czM1l3cUVxeHRj?=
 =?utf-8?B?RHpWUjY2TktGRklXN1pSbzRidlIvWHJpamZ4Z3lKR2QybHN3WWFrbTRRZUlJ?=
 =?utf-8?B?Ry8wSVhCcHRHMTV6SytFQ2VnVzY3WVdrTSttMDdkNkZJVnpTUDhPa2NQU3dw?=
 =?utf-8?B?YUNad1F6Qk1yYnhhZGcvNmVsdE5udmlHakhFSDZGdGlHMUR5QldScDFsajc3?=
 =?utf-8?B?ZC9YWEJsNXZXeTFjRUtRRUNpOU9WbnFFbDBscFRQbVZjWW5BSmlDQnpQbUZa?=
 =?utf-8?B?WXNMSVArd3N1dWRMT0MycFFCZmJTUW1tOHozcXp4U1RaTXN5MWppTWhLSkcx?=
 =?utf-8?B?VzhyWDFmdVNOck9JVjdmSVU5em5ucDBXZUhSYjNBZjVyNVdBQWN3NXF2akNV?=
 =?utf-8?B?TU5QcnV0eEttcXA3VlYrYWVDUm5vT0RrY0FGeDBaRCtYcEVhMjgwV1o4Wkhp?=
 =?utf-8?B?UTc4dWxhMWpRdVNvYWlCUmVtb0NrNTM5M0cyOGY4UEVOZkxkVkhUdy8wTWh5?=
 =?utf-8?B?NjJubXJwWHJSUGZTTUhxTmFjY2dMVk0yRmxiTUYvQmFOQkNINXFpNnNuQXJN?=
 =?utf-8?B?di84blhueUtzNGUwVXdBNXNvZExsaHdjM3BWRXAvdDBTZnBNcnJSTlI4WC94?=
 =?utf-8?B?QmdCMkRENnBuQ1JDOEFpVm5WWnNUY0ZtcU1DUlNzMHh2VlF0NjlGV1Q1N3k3?=
 =?utf-8?B?N3cxMDFVdUJRcWNFVnB4a3R1OWJmQ1E0MElibXpQYnIxTmQxY2YxV3B0Wmkx?=
 =?utf-8?B?b2hkaDRHV3cxNzhSZkFrUnFjTENwY3pHTGVGaldBZUN0Wm5OSCtkRGcvYTla?=
 =?utf-8?B?bUlWTE5INmRZWUR5bjJVNWdkbTl3UC9JeFV1bXNsWWg2ejltek45elVxWGpj?=
 =?utf-8?B?RGJoK3djWGMrQVZwS2NUS2RTS0xySW5iOUk4eldtVFluQ2pXQS8rY1l2Q3dH?=
 =?utf-8?B?MVRnVXJDdDJtUVFIZHVLaklvZXA1Q2xnRzVlem5rdGFaalFRV3dLWmhmWjhh?=
 =?utf-8?B?N2tjcXdpbFUydFoxTTZXcWFwMDc4RjNLN0RTeTQ2Uzl0SWo0ckZRcWMzb1dL?=
 =?utf-8?B?bE9JTmw5RVBjVWNlVVh0bzN4RERDeEN0S1BZMFpDOGh6ei9CK3c2dEZvNHdJ?=
 =?utf-8?B?U2QyMVZ5QXFSV1JpV1l6MEt3Z1lWd2xGQkhvcFhFYk1WQkFCUXlZWEkweU0z?=
 =?utf-8?B?Mkh5aTZLWHI3SFZWOVhFd1AyaGl4bm5TM1FOQnhXQ21oOU4rcThnbDY3K0hR?=
 =?utf-8?B?c2VRbThyRkNBZnFSN2kwNktUekpBRXcxZ2VhVGdPTkY0MllCdFp2WXRiZnlx?=
 =?utf-8?B?ZzRIWFg2ZGVxNUt1N0R0dnJoeGZ4OWN6TnJkSHRiWlUzaE1MSlpaT2JLTnZ2?=
 =?utf-8?Q?IPFkmedHrf4l4Bp7FgpvSJuat?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56312736-3ea5-4bca-0659-08dcf834c272
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:14:26.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKgnzI/gUe/73RSHTYJRDE8UQRmrNWgepVOiQimfUruQBDETdsECdyBWe0TSK/WVsmg6xR4tZkv7XLDO4a6rlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8110

On 10/29/2024 10:54, Shyam Sundar S K wrote:
> Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
> However, to accommodate this recent change, PMFW has implemented a new
> message port pair mechanism for handling messages, arguments, and
> responses, specifically designed for distinguishing from Mobile SoCs.
> Therefore, it is necessary to update the driver to properly handle this
> incoming change.
> 
> Add a new function amd_stb_update_args() to simply the arguments that
> needs to be passed between S2D supported Mobile SoCs vs Desktop SoCs.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/mp1_stb.c | 31 +++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 917c111b31c9..6a3cfcbb614e 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -36,6 +36,11 @@
>   #define AMD_S2D_REGISTER_RESPONSE	0xA80
>   #define AMD_S2D_REGISTER_ARGUMENT	0xA88
>   
> +/* STB S2D(Spill to DRAM) message port offset for 44h model */
> +#define AMD_GNR_REGISTER_MESSAGE	0x524
> +#define AMD_GNR_REGISTER_RESPONSE	0x570
> +#define AMD_GNR_REGISTER_ARGUMENT	0xA40
> +
>   static bool enable_stb;
>   module_param(enable_stb, bool, 0644);
>   MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> @@ -239,12 +244,31 @@ static const struct file_operations amd_stb_debugfs_fops_v2 = {
>   	.release = amd_stb_debugfs_release_v2,
>   };
>   
> +static void amd_stb_update_args(struct amd_pmc_dev *dev)
> +{
> +	if (cpu_feature_enabled(X86_FEATURE_ZEN5))
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x44:
> +			dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
> +			dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
> +			dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
> +			return;
> +	}
> +
> +	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
> +	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
> +	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
> +}
> +
>   static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>   {
>   	switch (dev->cpu_id) {
>   	case AMD_CPU_ID_YC:
>   	case AMD_CPU_ID_CB:
> -		dev->stb_arg.s2d_msg_id = 0xBE;
> +		if (boot_cpu_data.x86_model == 0x44)
> +			dev->stb_arg.s2d_msg_id = 0x9B;
> +		else
> +			dev->stb_arg.s2d_msg_id = 0xBE;
>   		break;
>   	case AMD_CPU_ID_PS:
>   		dev->stb_arg.s2d_msg_id = 0x85;
> @@ -260,10 +284,7 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>   		return false;
>   	}
>   
> -	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
> -	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
> -	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
> -
> +	amd_stb_update_args(dev);
>   	return true;
>   }
>   

