Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5903D1EABD6
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 19:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730833212; cv=fail; b=iEMTHFwoaIdTzY3fA3LCgkB+KWATOyrwzgssrdpVAEfJ5NTbIVPHYkC9l8ZfX8Pdf/4TUguKPLSCkNuInGHMkjghJjr+9qMURn2oERm/ZOQAtL8ptKjN4h9NxJaZ5vpcv/jb237RunvFB8xF7bDLoEBnFf8tkqha3/K85mrdNLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730833212; c=relaxed/simple;
	bh=/4Ockn+gSjkPDWaoEatCnJGMoZKx3wrOQLc7IPoW8XU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TF1Yki/5y18zjyOqJbDl0Ka1f07UhMAyhZUbMD+Ge626zWV7Hr81YKE1PNNFUFogisMIMGnGsH/xgI0wVWvcAnV0etN21WjqE8V74tEzNNAVJilIsZS2NuTR0OiIyFIa0NdaiDeORmSONKNLbwmFGLyzoMEe56A9NHEwBHHEb5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hCku91e8; arc=fail smtp.client-ip=40.107.100.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hCku91e8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaNpUCVzlAJHCS0/nalYt/TUDGCZrDEj1s/aQOR7tyZ+5qrjpYotTBuht0B9OuTtctTSy34reQVKJNBrmjHVjhhKcPqifLYPFK+sGIZYj7LyObOyYKOp8NLS2vV6vcSbI+Y7gRTjLvrwNuZl+6kdtPF1jPnt6OH8r7lYXDHbK8M7MNSSgwHHN0EQCU2VsK9IKOradHYVMowGEVE5Ts+Dug8U1Q5ZC3cZEwa1SKslHhPcNUR2Re2DnI99RqwotHNVCxXEXw8U0BumW3B6yDYLPr0MXp4nCgv9OClfRzBH7TOFHfFSNT8xBBCVI+ivalVcAuIeQM+TIUt/4GLOvItOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBfbQxtWDdXfnQPiLQZ/WapBMRII1vH194W+l8S7lNc=;
 b=quitB91rv5oGpG9qqu81pe07x/ah1bkn7ARi6Ui3p9t93QZQLYH0uOzYTI4n9U54/OfuIfF/gy7ZjMt6oRBeeViooEWQb54o+l9d2Q10PNudazUfPs6WY1KfNx3QkxWoSxJZcpAWbCDwYWld1m38+sw9PL8yFHDhKYp7/uJC1X7sSHk/kzluROt9C3P2Xt8iffKO1PpB+88QKiNfG97MV1XE3E+k9A5YL7rl7de5qR0jB5XniHDwGs+yojrnYd95XFJH89GHbxSTRUXfVrcOLPiNRHny0iQ6FaCAbMfiK/TuRmCZanzDpdKVIekuxRi7lQlpyZP8YYcZiFj67MPk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBfbQxtWDdXfnQPiLQZ/WapBMRII1vH194W+l8S7lNc=;
 b=hCku91e8oVjxNNTqiIWxkMFcL/JfHyu5ZKWkPo0hby4NAm220L7d7K/51r3smBIHfTXS9mBo7fdJEE5ibaLELUfiRl03CoaXuVUzOodt4mBD3LM6leVRrT4AuTa0X4OAugWIsuONpKOdUkOoWhD/LKZMGrxgrsawlMChrjm2lcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6980.namprd12.prod.outlook.com (2603:10b6:510:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 19:00:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 19:00:06 +0000
Message-ID: <dfb986ae-3d17-4100-87b5-c928947f4c8c@amd.com>
Date: Tue, 5 Nov 2024 13:00:04 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
 <20241105173637.733589-10-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241105173637.733589-10-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe1057b-054e-4ea2-ad9c-08dcfdcc0fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0kvMnBCWlM5TFdtR0FlcWcvdFZ5ODhERkJ0a29MVkFlbHpwdkExd0dHcGdB?=
 =?utf-8?B?enA3c1lYb3BHaTRsaTlHWVVZVkNjTTVDRXdsbGtCYXQzQVJIdUVsRlpoN2Fp?=
 =?utf-8?B?c1FQZERsMEVPMzBoVCtkRmsxUFU2dzMxZHdwMTl1UmdRaHZDbjlpYTdkay9v?=
 =?utf-8?B?UlJ1aUFxOWFOemVDQmtwVWhXellUbVFUQzJQNnRQVVVUYWJwYXZKUUdEWldu?=
 =?utf-8?B?SVNxaVlzRnZLVzRQblRpUDAwV3FYUVpSZ0YyZ20vRkQwSE83K0RRWlM1cHlr?=
 =?utf-8?B?S0xJb0Z3Q2VyNktkT3ZzdlFnWWdiNVZrdHhPVGZIVTBTU1VRWmErUWhCVlkz?=
 =?utf-8?B?bHJ2bStwVTZjQ1BUZlpHWkFoYUVtSEhYVERic1FKUG5mZ2hacTEzVWgyajV1?=
 =?utf-8?B?OXZKZmJQeEdTQXNkbHFxaU1aRDdYWlZWZXkveU1qK3l1NzVrcG5jUE0rWlFx?=
 =?utf-8?B?YW5nMWhtY1R6cHMzdzUvZDlzNVZNR05PWnhpc0FIRExRcDYzTkdnQ2gzaUU5?=
 =?utf-8?B?UnJpdCt4RG5ZUlQzZkNMaWRlazE2UGF5WXdSckMxcXJtT3k4NjJMYkkrdGRT?=
 =?utf-8?B?Y0t1S0tsMGxwc05idkllSmhrOTFxY2VEbTJHakhBL1BEUldsaVZWSFpPR014?=
 =?utf-8?B?SUF0dENGemhKWXkyZGNSalBJbVlwSE9pK2NQaTdDY3hnV3RwWW1VNWVXOTJN?=
 =?utf-8?B?L1pqRmMvaVkxc2M0cUtIZUk2SmhRbExtUkN4Nk8yZFlhQ3FZU09GUHZsSHZQ?=
 =?utf-8?B?Qmtwbm9vTHk0MXZCckJEbmRjd2FPelVmUnFPSFpqWVNPbmFVMXlINkNiTHBt?=
 =?utf-8?B?cFFnSmp3ZzEvM3FPZSsyWGVXNk1XSWU1SHJ2TzdlbDVoSnU5ZmN1Q0JGdzZ4?=
 =?utf-8?B?WnhuRnJMRElJaWQ0ZXpCU1VJUjljQ0pYbnIraGw4MUZ2Ym1LWVJERE9HQjZW?=
 =?utf-8?B?VXhIWnpyaE9jZC81N25SZzlEamxqTlZOWXNWYkRQM0RaMFRYd0VPU3lua0V4?=
 =?utf-8?B?ajE1czFta1oxa1hCaWFKbW1Vam5CbURVaHIzeGhtTk5wbE8vdnh0aEJTWGV4?=
 =?utf-8?B?Z3krOTNYcXl2cG5kNXZIcmVpR0hQTXEralRNM242eDU0MDl1UVlSYXhkUWhF?=
 =?utf-8?B?Smc1dVZoSTZIbXNtRUZKUzVKZzMvUFNJQUZQRlVxRWJQSFNkNzR2Z2oyNEhF?=
 =?utf-8?B?ZG85ckI5Q1dNOEFHNG1TajZQWFBpVmwrWGthRkRWY1BUakU4Lzk3aHVuNDE2?=
 =?utf-8?B?VFRVSlZoR2RpRXY1dS9jbEJjWWcwYWxYazZmMWE4NDY3RlFlc2tWVXlta2Ev?=
 =?utf-8?B?QlFqenlFUjBveXY5UldONWcwM0ZnY1ZtM1lSc2s3RnAxNjFsOXFabGs4d3R4?=
 =?utf-8?B?MnFOb0VKL2h4UTFFZ1g1RnZlWG5WWGdxUUpZOXkrWE02Ui92eThkMEhJNkdH?=
 =?utf-8?B?djVkUjNIYnI5aE5LUU94ejlrd3krV21qNVdoY0RJQnFpK0RNcEtEejcweVhN?=
 =?utf-8?B?cS9ZZGRFSXN6K2IrTngycTBxUEQyVjhmamsxUzZNelRmOGQzNFpkY0szY1lZ?=
 =?utf-8?B?RUNoYWNqeU9NaHN6ZllicGlERHIrVHZTeFpzbHhCWHZNNDh4czNIQkphUUll?=
 =?utf-8?B?RUJuVmZoOWdPVzNsMURsOFVOTHg2TURscUJYb2tkKzN1ZnlicmV2UXJrWEht?=
 =?utf-8?B?SnVHQkNYc3FyMkRVekg4T29WZlgyMjA4bEJXR2JSaWhuN3g2d2dFdlA5ellW?=
 =?utf-8?Q?9F1yN9n+WxQbtYK8gUbX/SsS7k4whmGtiEpkbK/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dS94cDBEV3dPY0xmekVUc2EzUSt5SVFrQzVKemd2b3AvbjFhZ2NJOFdSZXBN?=
 =?utf-8?B?Z2RWSWNLWmFKcURnbm41bGNiZis4bmg4T1pqcmhiOU50RVNVTXY1aTFWajNv?=
 =?utf-8?B?K0txcHBqYTVqdUJTRzhFbG9hKzlZMEdVbnFzWjI4VDVoNmQzVkZvTHR3L0d1?=
 =?utf-8?B?K2I3UzNqRHNqRkdiczhONk1uZlJodXdGNE1uM21TS3FySDBiSTlyYUdiZzNL?=
 =?utf-8?B?bWhrRjVTMkQxWGQwT3p6d0VwOExSOVdUNXovdEY0UFM0LzBYTzI5WCtpVHYx?=
 =?utf-8?B?QVNIdmtITm4zV0VyOUV4eTBFNE9BazlDNyt6WWlpV25uZHkwelRmU2hqdmx0?=
 =?utf-8?B?SjBSajRlZll2RGYzY0hWakVwREY5V3o3TkVSMVZjUm8wY292dWx0cTJreE1o?=
 =?utf-8?B?a3VFY1VTYkV5VlFDMVM0TE44RDNXaVNwRVV3VkQxYmtLWDRUSkh0eUt4eXB1?=
 =?utf-8?B?OTNtK3JiUmV2M1Y2T3ZoaHFQR091dEdmemszYmlodGlMSXhiMkNzWU0zN1lY?=
 =?utf-8?B?M29makF0RVZ3Y0xKNGxJQVU5Nzk3WnJMYmJJZ2JRbDVDYUpIM25DaGRMMjdV?=
 =?utf-8?B?bVN1amozZGd0VVZmam81bnVFQWFwZERlZkZhaE5WdmQ4TXdNdFlhMUlwUUVN?=
 =?utf-8?B?K1B5eWZZa2F6ZXR2Mm41cllVdkg0Wnd2bHJ5clNpMTRaQ1VHVFJOVmtKOERw?=
 =?utf-8?B?MjhvL2xYdjNoeUt0SUJZRjF0c0l1L3k5OUt5VmpGbUc4UktPQTh0bDBjWCtt?=
 =?utf-8?B?TTRXdnc4UzhvWVI5TGxqVGdKUjFFT0RkUjZtVGl5WkE2RFJSYXlUSmc4dkRK?=
 =?utf-8?B?UDQwYUdYUlNXTktpN1ZPeUFSQm5TNUxzL21Xc3ZuRCtHc1RTT0U4NmZSOTl1?=
 =?utf-8?B?VFBBZXA2VmJteHJaTkRVczdyaFVJc0xIMUs3NThMWWI0VlAvTUVFdTl5L3FY?=
 =?utf-8?B?TDJUQWY0cE9GVmlraXhwa2VwZDh0dUE0NGozTjNHSDlMNURDN3hMN3JBS3h5?=
 =?utf-8?B?bjZnZFY5SEY4bmZ3UFQ2OTJtc2JKV3d1Uk1XMDkvTm9RZkt1amxDTUFGUzV6?=
 =?utf-8?B?a2Z4YUJZUlk5QW5CbC92NHJUaWRkV1ZZNjRIT1p3ck15ZEFIYTBJcjVNb1dJ?=
 =?utf-8?B?cHVxV3lYS2RONkJkalVOOTk4cDVETFdXSVFoQ2J0ckZ5NzV0UGdkcENHNEpl?=
 =?utf-8?B?NHpWWlVVNWREeWxOT1oxT0JNbUJpZzdkbzFlMUllUFBrb01qM3htYjBsV2Rt?=
 =?utf-8?B?SWVkdDlIQzFkaERvUGpUeGwwRFdHYjEvbUQwNUgyNEFBSWladDZYTUZadzRz?=
 =?utf-8?B?Z2ZVSXkrMExEL1BFZnNzSGV4QjN6R1B0Q0FLL3Vob09vZlc4ZTNtUHV1a0FF?=
 =?utf-8?B?ZzNoUGxWQzYwemNSMWtlUGkzVkovaXZEYThLSU81aUtjdDY3d01HcmRmUjVk?=
 =?utf-8?B?V2dieFYzdVhGNTFKcHlPVTZRZ3JiT1FzcW1hb0NGOEl0ajVBZ1VjRWZBUE02?=
 =?utf-8?B?eXF3ekVvRmdOQ240ZHF4c29TK2RrNFJQeTE5SmkrSGVCOWtXVFM3L3lhSVB4?=
 =?utf-8?B?Y2ZpZnZkNmdXY0VLMHg3aG5qOTFkOUVMbVlUM0ZBWXhncWdvTTJ2U29RaEsz?=
 =?utf-8?B?a05OWDNFSTliTUQ1bnFsaTdqTDdsVUUweXQ3YzYvUUdaQ0x0bkJUM1NNOVVz?=
 =?utf-8?B?TTdXTU83YWFveGNPQXoyaGpGNysxc3VDKzV0aEtxQmwzbWh5NElET2U3QmZw?=
 =?utf-8?B?RnVlYk5URksycHFkdGd0Kzk3TDh2dWExTjBWeVdMVVVGM295TnQ0U2VtTENw?=
 =?utf-8?B?VExCNHhuK2JmdDNDeU0xQVIvNFI2V2VtVHpWdzBxMXNmMUNOdmFraTJPMStF?=
 =?utf-8?B?Vi9nMkEyWmtsQmtHL05tWDZXTFpTaTBQL3ZWUXkzcC9MVXZUdE9yV0Z1cjNp?=
 =?utf-8?B?ZTk5QWhwQUQ2ZlZiQXZMSjdWbXFSeFVYTUw0Qm1INWhoL2Vwei9RdGFXUVlE?=
 =?utf-8?B?SnBORzUyaTJ3d0ViQ1BjdUQ5UVh0RjhtTTdrZkZWYnBpWUFFSFBpYkJWSFBt?=
 =?utf-8?B?aTVMcEp2YVJRZk5BQU5BSHdtdG5OMjIxL1RlSVFsdUdPd2srQWlWL2t1aWhk?=
 =?utf-8?Q?fEzvoBMevR/GhhGF49xqpYW1p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe1057b-054e-4ea2-ad9c-08dcfdcc0fe9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:00:06.8608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHSoaxjSuWPQR3G/BaJhBjUQl6EndPsiiRMCk0QJ3WcoEvf3qsaIjxjbQbGAkK3EBbNLYNiMWms8MXCRAEzu+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6980

On 11/5/2024 11:36, Shyam Sundar S K wrote:
> The latest AMD processors include additional IP blocks that must be turned
> off before transitioning to low power. PMFW provides an interface to
> retrieve debug information from each IP block, which is useful for
> diagnosing issues if the system fails to enter or exit low power states,
> or for profiling which IP block takes more time. Add support for using
> this information within the driver.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

If you end up needing to change the series for any reason I would 
re-order patches 9 and 10 to avoid the back and forth for the new line, 
but this isn't reason enough alone to respin it.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++++++++---
>   drivers/platform/x86/amd/pmc/pmc.h |  1 +
>   2 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 1f0ddf5440c3..5ca97712ef44 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -94,6 +94,35 @@ struct amd_pmc_bit_map {
>   	u32 bit_mask;
>   };
>   
> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
> +	{"DISPLAY",     BIT(0)},
> +	{"CPU",         BIT(1)},
> +	{"GFX",         BIT(2)},
> +	{"VDD",         BIT(3)},
> +	{"VDD_CCX",     BIT(4)},
> +	{"ACP",         BIT(5)},
> +	{"VCN_0",       BIT(6)},
> +	{"VCN_1",       BIT(7)},
> +	{"ISP",         BIT(8)},
> +	{"NBIO",        BIT(9)},
> +	{"DF",          BIT(10)},
> +	{"USB3_0",      BIT(11)},
> +	{"USB3_1",      BIT(12)},
> +	{"LAPIC",       BIT(13)},
> +	{"USB3_2",      BIT(14)},
> +	{"USB4_RT0",	BIT(15)},
> +	{"USB4_RT1",	BIT(16)},
> +	{"USB4_0",      BIT(17)},
> +	{"USB4_1",      BIT(18)},
> +	{"MPM",         BIT(19)},
> +	{"JPEG_0",      BIT(20)},
> +	{"JPEG_1",      BIT(21)},
> +	{"IPU",         BIT(22)},
> +	{"UMSCH",       BIT(23)},
> +	{"VPE",         BIT(24)},
> +	{}
> +};
> +
>   static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>   	{"DISPLAY",	BIT(0)},
>   	{"CPU",		BIT(1)},
> @@ -162,14 +191,22 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>   	case AMD_CPU_ID_CB:
>   		dev->num_ips = 12;
>   		dev->smu_msg = 0x538;
> +		dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
>   		break;
>   	case AMD_CPU_ID_PS:
>   		dev->num_ips = 21;
>   		dev->smu_msg = 0x538;
> +		dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		dev->num_ips = 22;
> +		if (boot_cpu_data.x86_model == 0x70) {
> +			dev->num_ips = 25;
> +			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk_v2;
> +		} else {
> +			dev->num_ips = 22;
> +			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
> +		}
>   		dev->smu_msg = 0x938;
>   		break;
>   	}
> @@ -337,8 +374,8 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>   
>   	seq_puts(s, "\n=== Active time (in us) ===\n");
>   	for (idx = 0 ; idx < dev->num_ips ; idx++) {
> -		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
> -			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
> +		if (dev->ptr[idx].bit_mask & dev->active_ips)
> +			seq_printf(s, "%-8s : %lld\n", dev->ptr[idx].name,
>   				   table.timecondition_notmet_lastcapture[idx]);
>   	}
>   
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index be3e6b35433c..32b02ba95eeb 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -57,6 +57,7 @@ struct amd_pmc_dev {
>   	bool disable_8042_wakeup;
>   	struct amd_mp2_dev *mp2;
>   	struct stb_arg stb_arg;
> +	struct amd_pmc_bit_map *ptr;
>   };
>   
>   void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);

