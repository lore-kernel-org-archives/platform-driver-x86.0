Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A4231CA4
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728920885; cv=fail; b=uz7J6SlTPbD4g4K1C8KWuHrm9wdVQTcc4nSrFfeegVntXqocVhawlnYhRYNhuD3IRJJbsPPv12N8XYeetZtuG34UzVAeRMJaKTZKcAZv95RLulur7Q2qgzHXZfB5peyDCyRt1Ndzep2VY5R5jTF089a6gGmxVDs3VqLJ78CNaxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728920885; c=relaxed/simple;
	bh=FnObEFG7liqbJLe8OsO+qS6wXIKgEAJsy6vjSYvugB4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YzZEGwB3ylwKOE+BG7ZPUmUdLOU2e2YjCRSbrMV+ICJtLeaUjQnHHYIjQ/RLOFCDldcR1FpBAKC298vDOSM1pXpba4DqDUhwymHVKGFvsMI5UFgF3QfKyA5Ca4AWquEAyfDCZP2pbt2owHWhqEVKsYCMotQyRZl5s4p7/howGQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pQD/eclq; arc=fail smtp.client-ip=40.107.92.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pQD/eclq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5lsOUENymBIM6ITp3hqPXiKIyMf+Z7uZLAb49ak0J7QB9M6Ne5oAMXpoP9NW8XFf5rlSXbUC+ek1kbOsrrosTn59pX3qqBHrT7/KdIGYgKHy1jVzDHsIpubNZ2Z/PYVRntwFbJA8SuAR8eqCIXHYya8BWdwnZ0S2bTC/kVFTalWjUsGW97A5sLEuc/7yiMwabkQjwF7X5rBPy0OY0ZS1L5qu23S4T74YfcQUNnTRXO+ZIrzwCJL3pMEwJWScosxzS2glT/MgLtLWy7LmpMiI/KDKCNkchIK8HodcLQt+iz8qoe/AUZOdkQGkNqMJFMn1sPBAOWdlB1eIqv855qEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT5ev7GMPbgtqdJ1hvnpChxGpoCu5KnpQ/KdOLz7VHM=;
 b=vM6ebG1N27rYSUGJE3igZOMj+b4I0DMxbl6EH0ZRSOEKkBKisEET2RsbHXRpDAoPOBc2/kdG5mTPOTeQ1gGeWgf3PqrbhGxesxhxs1CUEVRepsUgv95WVQDHOS8nzdv1yrMYwZeTLljkiQNAfoAimXWLPNnNFa1T+ZmhLj9MAP1NWDrkRYDHc6F2OODE6YdlPJ7jFyKJ/866O/z5Nm+2d25evqFZQ+wYPeW67vAZwH/KNCCA9s0HFAw76fqGyKxeiJc33EmCgDtoPa3rVp7N5EWe6U/miW3BfFFq5YDS0NW9lz3osbGQzPURnz+c9xcQM0XqLELqMZt8ENPYcGabBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT5ev7GMPbgtqdJ1hvnpChxGpoCu5KnpQ/KdOLz7VHM=;
 b=pQD/eclqDZ0071fcxqbLKU3cKQdILR40+P/2qrMtnNrHdO7MjMhFzbG6GODXfonYjVPl31ocz9skM/5VPrOfIg2boJODBCAii5W3MG2/6XWasl6pBHL9pP0z+TCMmvvrKgg5oj9pCLk2t/+rDFOfihFGcnQz06lWA3HJw2UQNYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 15:48:01 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 15:48:00 +0000
Message-ID: <d160d900-d15c-4868-8f9e-d6477abca38d@amd.com>
Date: Mon, 14 Oct 2024 21:17:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] platform/x86/amd/pmf: Switch to
 platform_get_resource() and devm_ioremap_resource()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
 <20241014045759.1517226-5-Shyam-sundar.S-k@amd.com>
 <279d7dcd-2a94-1dd2-c34e-15b852dbceee@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <279d7dcd-2a94-1dd2-c34e-15b852dbceee@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ea2aa7-a5e3-42b4-698c-08dcec6794cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGVyK3pWaWN3UGJ3WURhQi9jd1h0M29wUm9HRlNDRkVFeFlKcXRlaElybDRD?=
 =?utf-8?B?Mm12OTFia1dsTEVFVDRMdDFaV0VTWFBoamxXOW01eDVtQmZJbGFZejZHQWp2?=
 =?utf-8?B?Nm1oNlVuRzdMQlJOOHQvdWQ5YmNsNEphMVZZK0pKLzZxdVV2SVRCa3lNMTd3?=
 =?utf-8?B?VWdmWUhIU3NnSVFqaWo2K2JqSEdCdENuVVo5VEdBS1QxTmdsSi9Dck1McmNm?=
 =?utf-8?B?R3daN294UnVGS0tPSXhsbWpnSS9TRHlpQTRTRytzSS9wd0lHS1hJRThrbTFS?=
 =?utf-8?B?eFk5NU41VFRLdk9VYWxMdFNiZHF6aHJveGJ3RTdTSk93a3haM3VpV1pKS0ov?=
 =?utf-8?B?NWlBcGdsS3ZXK2dMVWF4VGoxZWZ1WEZoam9iSzU0WENMS1VDKzBGRUd0YVZV?=
 =?utf-8?B?T0h3VGgvV0VEK1d4bWJDTkhQbW43VDJxMTFvMUphV2U2U3NKS0dWelZLTTk5?=
 =?utf-8?B?UzhKWEwvb25BbGdoYmw0UHh5SDlNeVRmaVBycVFyUkQrLzlmN25PSzl2dVhQ?=
 =?utf-8?B?a0VUUDlHZ3d5TEZBZHlHemQrb1ZlMllhSnFMVUdsa0RSMW5yeWVjZGZsS0dB?=
 =?utf-8?B?VVRBY2ZLaEdGV09oUDJFSHJXTGVVdGdHZHRSUEh1OEVlNGNZUVdXeXFVSWtu?=
 =?utf-8?B?YzVSMzZ1QzBOYWNQY3g5N01sSXFTVXg3dTRyY0syaGtGS3MveHJNVm9YV0tP?=
 =?utf-8?B?eHNkcHBvRjZwM25mVGw0TjJDT0l2a2U4SlJiMnNieWVyTDliK2syZ0NyRExI?=
 =?utf-8?B?M0kveVFKdzk1eXJhUHZONnl4NlA4M3BvbG1QSjNGYkRuMXg1dTVSb0RHV0FE?=
 =?utf-8?B?YXRvQnlGZG42OXU2aHI1MGszQ25Kdzl2WHAybGpmN3NHbkc0UitxMDdPWWx3?=
 =?utf-8?B?MWJldlZMQmxvcTR5VmtrYlphWWRNNHdVTGk3SFhDMTVQdFlZV1VRa2tJcWFB?=
 =?utf-8?B?QS9DenZ6SHBhTFZkV2dlZTR3Zk1JMjZ3eGpiaEdwMm9OVWx4S2lwNWFtNVhO?=
 =?utf-8?B?RFJMQVhydzhSNjk0MXdSaDZJcW5ja3lwV0dJMzhDdjNMNnlCWmRkVnJkcm4x?=
 =?utf-8?B?bFRoazNQN1dIYlJDMjJLbHVXM0ZpMXZnRHo0K05GOVNGU21rTk1HRUdQMzMz?=
 =?utf-8?B?Qmh0bHJjTmx2clY4R1dwUVZMQ0hZQlJNZjJTa050aTJCSHJRbm8rc0s2V1Bk?=
 =?utf-8?B?VjNKUkkzcU1YYVQwdkJnekwycGNsdUNTb3U2Mldsa2E3QnpHWHhXMkNuZGlU?=
 =?utf-8?B?dmE1UjRwSzFMUkpCYUIxYXFDUVBTTWpKMjJSUFc5anBLaEFaMTRRUzF4TTVp?=
 =?utf-8?B?Y3JLb1VNN0JVdkZXZHg0cGlVenMyVWVzQjZ6UExiN3RHY0c1RXozYjFjWWFp?=
 =?utf-8?B?OEJ5UzlrOW1vRVlKbVI1dWpSYi91eTVCamxmS1Mxb1g4NVcwa0RtU2hhRGtj?=
 =?utf-8?B?c3Zsb2FreVRINDEwS1A1NW5IdG00N2pxVXVIMmVUa3d4Yk9SOFdBVFBiNFZZ?=
 =?utf-8?B?Y3QwR3YxY045WXFqQUh6YlU3WVJTYTdLeVdEZFh1c1Q0cnRGZUJSejBXSE1W?=
 =?utf-8?B?a3R4MTg3djQwUWozSzlEMTlEaFVZRXBXWXk4MWM0V1dSazdLc1NlQW9CWjFT?=
 =?utf-8?B?cGtsVzBRUnhDbmV3VEVRcE84VGY3OTNyU2c4NlVhV3lCVzQ0bFBCNmFWSkFz?=
 =?utf-8?B?MnlCeGgxYkdvbWFhdVlCNVZTakhvdDE2N3N4b1ZjdEpzUmFQTitmVmF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkRwcWdBZlg1TGJJUUROVStCT3ZzQzY3ZkNYOE5aZFRIbzhTLy9qUURKcGhO?=
 =?utf-8?B?dUpkUUdqdUdxUzZzT01McUQ0V2x0WHRKRjViVGs3YVBtUytsQW1WWm5pc1kr?=
 =?utf-8?B?ekdONzNrbzdpazRucmtYcjcyVWRCR0tkT1lnSHJiME1PRFVLcW9pV2tlTEZE?=
 =?utf-8?B?Q1dEYy9kVEh2ZHArd3A4OVR2ek9CSjFnRWo3dTZKZEtvOW5wK1V5ZlIvaXJm?=
 =?utf-8?B?Q3JCY2Zmb2NXdnZGL1N1b3dzL29XOXI2cm84eTZwdnJ4MzVTNVZmaWxiOTJs?=
 =?utf-8?B?QVBYU1N2Y3pJRFJYODFiMzEvTkxhNUVmTFZWMzR1cWxMK0NKOE16MVRCT3V1?=
 =?utf-8?B?TklGRkpRU3dLT0dnd2RFeER3VWQyUWdvQlFnWHpHWEZYSzJ2STM5d3ZOTkRY?=
 =?utf-8?B?bURZZkk5UHRCMXpqeithSkRtMkRGdHYvUVZnVnpYQUZ6L1dzZ1dtUDVubHJT?=
 =?utf-8?B?YWlJS3ZPY2t2RG1IbUluTWFUWmxNejlNWnMyVXNVbE5zanlRc0xMckNSUWY0?=
 =?utf-8?B?blo1QTVZa3lpSEd3ODNZTTIxakM1VXVQeW9jeHVsQmJLeE1ucGcrYUo2L1F6?=
 =?utf-8?B?YkVNUDBUZVNpRjRtWEJQenJxQXdUL1dzZHRjZTlqblhzQUVIOGhUMUFXL21S?=
 =?utf-8?B?bnZmcDRjWWYzNkJEQk9kMCtTWWVWR2FYM1lFdUd2eEc5NmEvK2VudXZNQ2pu?=
 =?utf-8?B?TldHMTNoVm1Gc05xdnpGbU1ZMjJDWVlDV0h1T1d4M1NrS2w3UTZGZUVqRnlo?=
 =?utf-8?B?c2NCa0x4dmxjRXcxRnl6K3FOZkNsWUVncVhjUTJyL0RuT2VOMEtwTHlBZ2w5?=
 =?utf-8?B?d1U4Rkt1Vy9WRUpPNG5sVzBjR3gwWXNVWFVRQWlTQjVBRHBjQ3lmNFAvZk9M?=
 =?utf-8?B?NVRmRklpRmd1a1crZXphWlg0KzVWaDVkbG04WVB4QnhCRGdkYm43cGpkM1hW?=
 =?utf-8?B?a0NQOE9nT1hIZ09BSUx5MEhhRExCOCtqNVdzQTNoZUpKbWY3NTBab2FoNlJ3?=
 =?utf-8?B?bncxWEN6ZHFVR3BDUWZxak01Uk16WUxHV0FtemdoSlc3TW5HTXdhaVowRG9P?=
 =?utf-8?B?bWJLN0ZpYUlqV0pIRnpKMzVWcFhCK1NVQm96TDN4cUZlN2JEUHkxenVYVElk?=
 =?utf-8?B?dWJTWWRTcUR5QmVtcnVzMmxNc29XcXhvWURxUlRFWXJSdXRwQVFvc2JIVEYz?=
 =?utf-8?B?NSs5WWdaRWxRTDk0MzhnTmdMaU1VWW1QYmJVUzY1K0tkWTJLZnJoaFR1Ym16?=
 =?utf-8?B?Um9yVnViM2ZwQkJDQmVPN0o2SDJicFNCellMb2hJMWNmNlJlSCswTDJwVXpT?=
 =?utf-8?B?VlgwckNabUFYSktlaG91c1p0aGxhVmNja0g2cGMydWo5cmlwQ2dLQ2VWT1dj?=
 =?utf-8?B?WTFDeFpmR0g1UHkzRlY3VjQzNlJ6RXdrQVVEUnkySFdBNjQzcVJUY1o3ckxL?=
 =?utf-8?B?VEh6L0lWZ1UyaUJMM0ZRa3JKTk9pRlhVdFNwbXN2VW1rR09PZ0IrbGNsbURh?=
 =?utf-8?B?ZXlMRHhodWdBS2cvaldreFd6Z2EwckExSTZQSUdzeVVxMk8zcWliVjZTUlds?=
 =?utf-8?B?UFJBNkRzRkFNYjhHdHBKTDV0ZGVNcEhlaHdMajMveXdqald6TTEyczRmdGNI?=
 =?utf-8?B?Y0RGMFI4N3MxV0VmcHVTa3dma2VpdkdKZHVzcUkzODZZVmJzNzNjSWNEL3lN?=
 =?utf-8?B?V1NJVUh4UlNBVHhldkJNM3dMSUpsUDhreEU2QWd5WUtRQU84VWd4d0Rxc2dS?=
 =?utf-8?B?TmdJNjNJQ1U3bTVmcUwyeUZmZ3VKYmJncUtDRVdaZklSV0ZIZHl0ZkFacTBt?=
 =?utf-8?B?eHF6S3lOSHd5RW9DeVdmSXFzR2RIQnh1WENua3Zva2ZsdmZzM1lIS1Jjb3hD?=
 =?utf-8?B?RFB5SkpOS200WWF2dWR5M2Y0bFA3RytVOVZkVjg2M3NGZE9pcjREZ2x6dlNN?=
 =?utf-8?B?dWVoRGdOZmhjZXJVMGhyZGJxc2Zpa2UxdURXbjlrZk1GL29sZnQ2K0xYTDZz?=
 =?utf-8?B?eDYzT1JiZDBhVW9ydEFlcGNJNnlTeE5MSlBTQUduUUJtTjJJODFsbTFoV1Z0?=
 =?utf-8?B?RzB1TkYvQ01ybVN6TEowK1AxYkxxODhQRTRHdmVPS3lNOVAwVnMzSEtwR0Ft?=
 =?utf-8?Q?NzCTD+pSsUUNE9pRme0l9LC56?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ea2aa7-a5e3-42b4-698c-08dcec6794cd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 15:48:00.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8xHJbmhYErAYR5iuf2re+2CbepQlqStC0zQTrAFkggM/3fY2oNjKaNrKhWjKc2AP95FsdI7/ZsjTOJGkGeLqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972

Hi Ilpo,

On 10/14/2024 13:26, Ilpo Järvinen wrote:
> On Mon, 14 Oct 2024, Shyam Sundar S K wrote:
> 
>> Use platform_get_resource() to fetch the memory resource instead of
>> acpi_walk_resources() and devm_ioremap_resource() for mapping the
>> resources.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>>  drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++-------------------
>>  drivers/platform/x86/amd/pmf/pmf.h    |  6 +++--
>>  drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
>>  4 files changed, 20 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
>> index f4fa8bd8bda8..99d67cdbd91e 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -11,6 +11,7 @@ config AMD_PMF
>>  	select ACPI_PLATFORM_PROFILE
>>  	depends on TEE && AMDTEE
>>  	depends on AMD_SFH_HID
>> +	depends on HAS_IOMEM
>>  	help
>>  	  This driver provides support for the AMD Platform Management Framework.
>>  	  The goal is to enhance end user experience by making AMD PCs smarter,
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index d5b496433d69..40f1c0e9ec6d 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -433,37 +433,22 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>>  	return 0;
>>  }
>>  
>> -static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>  {
>> -	struct amd_pmf_dev *dev = data;
>> +	struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>>  
>> -	switch (res->type) {
>> -	case ACPI_RESOURCE_TYPE_ADDRESS64:
>> -		dev->policy_addr = res->data.address64.address.minimum;
>> -		dev->policy_sz = res->data.address64.address.address_length;
>> -		break;
>> -	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>> -		dev->policy_addr = res->data.fixed_memory32.address;
>> -		dev->policy_sz = res->data.fixed_memory32.address_length;
>> -		break;
>> -	}
>> -
>> -	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
>> -		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>> -		return AE_ERROR;
>> +	pmf_dev->res =  platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 
> Extra space.
> 
>> +	if (!pmf_dev->res) {
>> +		dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
>> +		return -EINVAL;
>>  	}
>>  
>> -	return AE_OK;
>> -}
>> +	pmf_dev->policy_addr = pmf_dev->res->start;
>> +	pmf_dev->policy_sz = resource_size(pmf_dev->res) - 1;
> 
> If you have a resource, why you convert it into something custom like 
> this?
> 

I will address your comments in v2. But for this specific comment:

the DSDT looks like this:

Device (PMF)
{
	...

	Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
	{
		Name (RBUF, ResourceTemplate ()
		{
			QWordMemory (ResourceConsumer, PosDecode, MinNotFixed, MaxNotFixed,
NonCacheable, ReadOnly,
				0x0000000000000000, // Granularity
				0x000000FD00BC1000, // Range Minimum
				0x000000FD00C0C000, // Range Maximum
				0x0000000000000000, // Translation Offset
				0x000000000004B000, // Length	
				,, , AddressRangeMemory, TypeStatic)
		}

		...
	}
}

But, resource_size() will do 'res->end - res->start + 1;'

So, that will become 0x4B000 + 1 = 0x4B001 which will exceed
POLICY_BUF_MAX_SZ.

defined as:
#define POLICY_BUF_MAX_SZ		0x4b000

Now, because of this, it would hit the failure case:

if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ ||
dev->policy_sz == 0) {
		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
		return AE_ERROR;
	}


Would you like me to leave a note before using resource_size() on why
"-1" is being done?

Let me know your thoughts?

Thanks,
Shyam

>> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>> -{
>> -	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>> -	acpi_status status;
>> -
>> -	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
>> -	if (ACPI_FAILURE(status)) {
>> -		dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
>> +	if (!pmf_dev->policy_addr || pmf_dev->policy_sz > POLICY_BUF_MAX_SZ ||
>> +	    pmf_dev->policy_sz == 0) {
>> +		dev_err(pmf_dev->dev, "Incorrect policy params, possibly a SBIOS bug\n");
>>  		return -EINVAL;
>>  	}
>>  
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 8ce8816da9c1..a79808fda1d8 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -13,6 +13,7 @@
>>  
>>  #include <linux/acpi.h>
>>  #include <linux/input.h>
>> +#include <linux/platform_device.h>
>>  #include <linux/platform_profile.h>
>>  
>>  #define POLICY_BUF_MAX_SZ		0x4b000
>> @@ -355,19 +356,20 @@ struct amd_pmf_dev {
>>  	/* Smart PC solution builder */
>>  	struct dentry *esbin;
>>  	unsigned char *policy_buf;
>> -	u32 policy_sz;
>> +	resource_size_t policy_sz;
>>  	struct tee_context *tee_ctx;
>>  	struct tee_shm *fw_shm_pool;
>>  	u32 session_id;
>>  	void *shbuf;
>>  	struct delayed_work pb_work;
>>  	struct pmf_action_table *prev_data;
>> -	u64 policy_addr;
>> +	resource_size_t policy_addr;
>>  	void __iomem *policy_base;
>>  	bool smart_pc_enabled;
>>  	u16 pmf_if_version;
>>  	struct input_dev *pmf_idev;
>>  	size_t mtable_size;
>> +	struct resource *res;
>>  };
>>  
>>  struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 19c27b6e4666..544c5ce08ff0 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>>  		return -ENODEV;
>>  	}
>>  
>> -	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
>> +	dev_dbg(dev->dev, "Policy Binary size: %lld bytes\n", dev->policy_sz);
> 
> resource_size_t is unsigned type. However, it's not unsigned long long 
> either so this will trigger a warning without cast which is unacceptable.
> 
