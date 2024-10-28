Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236231DE3D0
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134226; cv=fail; b=geXoz0H73YHI9nCAVqhyQsY8tSZpxncS2LRRLU44CIQzVl+Ma5Oy3Og6W8bzuvgW7RCeRF6hlwpHrwV1nXiFDHeK2+dUj7tyMRhi8QXGLDuFdLXDNZG5/4JEWU+DZEURRminKicW8H6sciscqQh2JL1LseCfmiVgtDE83AGMigk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134226; c=relaxed/simple;
	bh=t2pgRZaWTEga9WS/UMiOj2yxJyUorzFJrKJVWIgSh8E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CoQ39RiQc+Na8Se5kIJ+UlT7b+6PpQP12ViwX3xx64Oda076nTsZfxAVH51omgFPaiOohr6LMMwulTwM5FtSGHh+DWZ/FfF8DQvY676wX5j3/7WPHs39VkZA9MA1+RRQyq/DM2dKfBdu7GwpA78XIIfv+AZogdMOwHKvVgXJ2ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3xmnTmlu; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3xmnTmlu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipU4ntuiBqRcftK1CfQt5oDJDNxrEzOTfa7iLqVnC4DzLIYVxbZ4ioXbBMcqSAiAil5TAInDZs9Y3LJ+t/8KzQipaX7IhWLWIVBxq+DJTJJ02M2rytZxf8s30lWv1XemyBiRv8dZMPzGkRcipw11C7Dju7ZAdxFl4xNuf00/uAuxtW52xZ3e8bv5sxthUl4MxHzpcb/vqgign84WSpsPRwDXIApV7Cl+77p6n+Xs52NRZawmZza9KxhkpnQjnqwDAQaavqgtZGRhNZ3gh1losZYZHNzkciphTHRHSHXsmaTd26iMwmWigercW+uxoiLCCTBTlLpBgHaiMeTaqubtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4TPYo4HoBNGRHQm8iquGI3ZJB3fI4qzh5ZbzL/Jn4Y=;
 b=ZKdRmswmSwk8VFRN7DISrP7QR5FMkwAAU3VfLUSAmxu6PFagG2pR+S2IEEQIXOswkytrTHjsB606SRBt6YAJ4xu1ASEuonz7+YoMVDtjyY3bRhQamvMdsn5z9QEd/SdZ5y/eyKrxAJxYVYp/GZiA4abZG0EuXQMmSshhF1Jnqbvdk1CmQTSfJicsEhRf6bYxotWYiBddSjDBv6/12NwMxVjhDwpIuzhJonqhW5YD1r7+ugr0+/RyiNo4hPgT211N52lT3bJh0TQBPNgSm3CfZzkc6hEsfLM6iN5O5pyHOTNuHUjU0upqdUWdxhkgpDiLOwRuIRRN17pXdPl+igqcdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4TPYo4HoBNGRHQm8iquGI3ZJB3fI4qzh5ZbzL/Jn4Y=;
 b=3xmnTmlum6rXy0lgynWwUMLTJRLTRQ2gKjGFXMuYs022gxeir7EMqbzuT7lLlxmnow95GzmT/tffVxMzeRyOpQAXo4wOsvbY/3b9VdnIkNLQUQs03BrloNgrAyUKtW0iv13787Tu1y4KJhS3ODQPXayLDg9jcgQjXCvhQZrfOaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7451.namprd12.prod.outlook.com (2603:10b6:806:29b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 16:50:20 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 16:50:19 +0000
Message-ID: <3c823235-9fb3-42db-aed1-8494ee79504b@amd.com>
Date: Mon, 28 Oct 2024 11:50:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform/x86/amd/pmc: Define enum for S2D/PMC
 msg_port
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-4-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241028070438.1548737-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0147.namprd11.prod.outlook.com
 (2603:10b6:806:131::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: c450272e-442f-48ca-6127-08dcf7709b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEtabEpCMi8yVWNyckFZTzlDUytsNU10OEVNSzB1ZU12aWl5K2J6cndnSzE0?=
 =?utf-8?B?YUY0MGRHT0lIT3AvM2djQ3drY2M0alB5QVNHNTBZTXhtSnBvSUhzQnZiNW92?=
 =?utf-8?B?ZWRPRUY5OGtlSnh3UnRaNjR3R1htYVMzampVbkpCdmw0dVZzNjRjZjVJWi9h?=
 =?utf-8?B?anhIc1RIM05lZ2F0dnorM2Nqb2JweVRvaVdmcE54UmpCd3lVVjVXZzliMnly?=
 =?utf-8?B?emkyeGNNdlErR2hmZ09jMFlGcDRyWmR0YnQ5eE5mRGpZS200Tm5NYXlybVE4?=
 =?utf-8?B?N1MrQURQTWNWa0w2UmtaVHovbHlIcDkzTk90cHRIYXZUWW50M1dGMVNldEpy?=
 =?utf-8?B?c0tlUUJuUmV0dU8rMmM5aUUxUlBLNjZQeHdxTjlTTEdvWjdrdDdsZWExR3RC?=
 =?utf-8?B?OHVYSDV3d0FicFFqYndMNi9Ga215QUJnNWpucjRiRWc3VXVHQWNPRDQ4NU1x?=
 =?utf-8?B?RzBvRStFbFNCQXdvaEFMZUg5UDl1dGxlcWdSVUFsSVVhS2NId1pGNGZGN1Rs?=
 =?utf-8?B?UHcxSHFac2U1ZS9qbStieE1TZWVGdjgxTHY4dno1TkpqWnlSNDdvUVZ4ZFFN?=
 =?utf-8?B?YVIvRTYzOHFncld2ZSsvR2hlVVkzT2poK2hXRjBYbDBheTZialV6YUJpOWhv?=
 =?utf-8?B?MFFodjQxUE9JNkE2STF4N2dKcTl3VlhvenlUSnVGd0IzSGtyaFZjNmZkY3Yz?=
 =?utf-8?B?MjE2SUhpeGgzYmttTlhLd3JYYXRZMUsyOHB4SjdINEhOODFtcXg5OTVlc3J2?=
 =?utf-8?B?TFpaQnBsMVpMNHNidTBPcU9iTjFGVDg2UEw1MXRuM2V1U1FsblU2M2plZjdz?=
 =?utf-8?B?SGpkNEE0SEJDMVlnZG5iNVFjOEtPZFcrNEpZRXZMTWtBc1g1Tlo0cmoxWk1V?=
 =?utf-8?B?ZUdiTGVHV1FnM3I5USs0Q0d0ZG5Rd2ZNV1V2MEdYejBCNlhSODRxZlNNakpD?=
 =?utf-8?B?L0QyV2hUQVNOUHM0QzlsM2U4NkdBem9JTHRmZTRrMDZrNU9OUUZSZWRtS05w?=
 =?utf-8?B?a3o2Wm90aEVhY3pnTDVkL0R1VS9ocDRORHJ3RkFaM3dheXlnOG5JcElTSXhr?=
 =?utf-8?B?bDFBT0RCVDlzU3ZwNWllYTUvVjhXcHlwMHpwaXlsVEJFb2RWaCtuSFJ0K1dK?=
 =?utf-8?B?emZaY3o3RWtYZ1N3Q1hlejhhbS9QK0xrbWMwQlRxVHkzVGZZMHhnNEJIdDY4?=
 =?utf-8?B?dUVNOU9ldE9ick1iQWtwd1Y1YWlBSG5VNFlTSmpWVHNJdXJXSE0yM3hsNUs1?=
 =?utf-8?B?MkhEUWZOSHhtMXk3WTEzOGNnVnMxd0p5U2g5QlFGWFd2cVZ3S0tseWtUMG5C?=
 =?utf-8?B?K0daSldTV2NmOFRkaEJkN0JzYUIyN01FY0tZWDBpMEczRllWZFpiclJHTXBa?=
 =?utf-8?B?aUlrYUNaQXlBQWt6THkycy9hWXQ0OWtuL2lXUXhBVjg0dy9YMTJJT0V0ajhq?=
 =?utf-8?B?T1pPWVNpQXRKajBBNkdwUW5md2J3NGp2NENBZVJOM0VWamtnNXBvQ01BSFJu?=
 =?utf-8?B?a3NES1UzbEo0THRnZEtqZFhtTGxQNEE0SHRGSmVtSm9RWVZoSW5HOE02WUNv?=
 =?utf-8?B?MFZuUyt2aUdDNjRqemZiMzh0YS9mVDE1N1NlRTVNcUFQYzJ5K0Q3MzJ4S1Jy?=
 =?utf-8?B?dEs3VDg0R3I1RWJ2cmNVSE5vd2RBQ1A4Y25sc3loQXhjVk5KRk15VEFTSUFD?=
 =?utf-8?B?dUFYc2ZMb3FyNStrS1RzVVNON2NCcGVJaWoySEdMcjdnMk1pZGNZcHJBUjZt?=
 =?utf-8?Q?x7bzH9L/HEGHC6Ss1wJdwStnWtpyWILEs8ikpVn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnlCSXlrVmg3ZHJyNDhqc09va2VCc1ZvS243c0JaUDdXUTdYZXAvYVNMRDVl?=
 =?utf-8?B?RGd2UDNRazZtaFB3RWk4dDVJNStrdzlPT2xBQ3JEWE5lS3RIVG5jbElVUXlv?=
 =?utf-8?B?SXdJcEtMOWc4djgzRFlvZjIwVzJBbVlocmlHQk5UMWlpdkR2Z2JXR1g1RXI2?=
 =?utf-8?B?bGQ3VjM1MXNWSTcxY2t3SFQ0QWdtc0JPUGM5RWxGelRpaC9lZWhTdlRWZEZz?=
 =?utf-8?B?U2dQK1NLdFRiSDZYaFJFcGVlTlhSVVdiVFpoV0VHbFB5bXZhOUxScytzd3Q0?=
 =?utf-8?B?QU9yV2ZrdXB2ckY4V2YxcXNlLzRBVzlVSlhON0VwL1drMDY5blptZWtSbm1G?=
 =?utf-8?B?Q0prbzBCMjhuYmV3Q1VPVURJazUrMnp4alhyQ3hxUTk4OGJsMDQrRmF3Uzky?=
 =?utf-8?B?bGxaS1cwME4yajNoNmZuNnhaYXFSeEY3STN6blFJcU1VMkxFbUYya0NlYU84?=
 =?utf-8?B?UTBJV0JQUzVSYW85dEtzMHpnUGFVTjNUZk5XTmNSNXo2NUh4eTJvRm44c2cy?=
 =?utf-8?B?emFiOVF6R2tvaUliSmJFZDNJajE3c1MrakxNMUExUGV2ak50R21rQVcyNC90?=
 =?utf-8?B?eEZ4YkpHcU05MFpRbDJpWFFzb0xRRWVOQ29rVzY2UUtwM3ZvaHliZk1mdksz?=
 =?utf-8?B?cjhENTYxU1ZwRHZvb3daL283Sld4YUhndDY0d2ZCUDFnSVdVeVhXSzhDRVJ4?=
 =?utf-8?B?QWE4aEJwQ3BiVll5Y3ZQWldHMXFBOXlzdnc1Z2kyNFlBZzRXT3VOSjZiMWsz?=
 =?utf-8?B?emhBNEs4M1VHWHNuM2hHS2dPK1pUMzl3WHAzYjZqVFE5cUNCcllJV1lqZlFR?=
 =?utf-8?B?ZkZXMHNlNnRVYmtQbFJDZzhlVEl3bVBvTjY2azhraXFKSUJ1R1ZhZXMwbnFK?=
 =?utf-8?B?M1hVOEh0MThOVjVuRkFwM2lJZzg4cTF2VWtibGRBdU9nV2c0cVVlcFcyNGF6?=
 =?utf-8?B?VG1EeHVIVGtkejNZT0tlZ2ZjOHpHYXlGbWJIR3FHLzY3RVdSWlhwaDNTT1dz?=
 =?utf-8?B?alZSb0ZuNFVDNXh5RW9vOG5HTVRCOVdzV21kUWhucVEzZkxkc2hXMWRpTXpQ?=
 =?utf-8?B?WnFTOUtjY2JEVHkzYTZZQ2hMdlMvb3U2K282UmZwWlVGRFFHcnNDUmRSdUZJ?=
 =?utf-8?B?OUdKd054cTZzQjFhS2tCUDBUZm1yWDVJeDhpMzFPcGh1WlNBY291d3NYWFF2?=
 =?utf-8?B?dkJWZyt4L1VYalNyZ1J3ejZtMGJ0Z3FCeE5QdlJFWDRqVDlrZTk4S25JRUJi?=
 =?utf-8?B?VllnWEZyTEJNeXhFS0pGR1FZWXNwbVlqeEsycm1BNlBQbzNEMkwvZ29NMjZ2?=
 =?utf-8?B?eCt5ZGNQalYrRHhOdFdrcjZBTHVQWC9FNkhJRjUrSFlmZ1ZxWmhTOWRFeXNj?=
 =?utf-8?B?WFJmazBoTkVhVk1STU0raHlNRU01dytyMVlhcitMQ2V3UHRWTTRrTnNPS2ds?=
 =?utf-8?B?cGl1QWpWWWJoT29qWkdyUzVCRGd5N1F0QkdvQjBXemdRUUNGYjByN04zTVlE?=
 =?utf-8?B?eXN2VGVNMzV4MVc4R09ZNElrY2NqQWM1L05CazA0anp6K2JpN1M3QTRrTFYv?=
 =?utf-8?B?VkVvS1c4UUYzMGhzT1hVbjdVaUMwVXNZbmJZQnBUekpwelNxNVZqZU5Sckpo?=
 =?utf-8?B?MEx5U3J3NjM3bGdlSEx2RHc1Njlra1VqK0REeWNhTWFQMitDbUJVQmJQSGpj?=
 =?utf-8?B?TlFZMkRUaU9CcFZPTGJHWVhGbWx1ck02RW00Ris4QkZaNG53MFdVUkdxVDlP?=
 =?utf-8?B?S0lualJEWTBxMUNyWE5WYlIwVHVTc0pCZDNEVjFWVjdJQ0dyUVFhM3JQYUho?=
 =?utf-8?B?d1FibmtFZmw4QU1neWNyZE1MZHQ1QjdEN012MzU4MnJObDZ5SFZ3SSt4TzJa?=
 =?utf-8?B?RGFwSFBDcU04em54TXFOcktvTHZHOThOaVhRaFpEd0lRZFNZUXBsb2xsVVF0?=
 =?utf-8?B?anFLRGRCZUl0SVJLNEVMZzhweFFFMER5L3FvanBGVFRxTEs1Z2ZsNXJqYlNM?=
 =?utf-8?B?aTFMaWxSTkl3VXFZZEpqQVZCWkFUaGlpdVUvZkFyeGhkc1BNRWVteUsxdFh0?=
 =?utf-8?B?YTJOMVNiU3cwWFhOTU9vM0lkVmdTM3dTWnkrM2lwSFdGY3V3ZHVMK2VHWkZQ?=
 =?utf-8?Q?VwgpRkqEO8dt33yWwZnMPqCmt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c450272e-442f-48ca-6127-08dcf7709b71
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:50:19.7666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rqaqyDiuTSiWt6nglXzr8EqJN5o2JSdaXKqcI+sEZYcdppTFMPwP2ygS4wkF0hHhy4NshhVHlAoD5P3dZl2tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7451

On 10/28/2024 02:04, Shyam Sundar S K wrote:
> To distinguish between the PMC message port and the S2D (Spill to DRAM)
> message port, replace the use of 0 and 1 with an enum.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/mp1_stb.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 5efec020ecac..2b06861c479b 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -47,6 +47,11 @@ enum s2d_arg {
>   	S2D_DRAM_SIZE,
>   };
>   
> +enum s2d_msg_port {
> +	MSG_PORT_PMC,
> +	MSG_PORT_S2D,
> +};
> +
>   struct amd_stb_v2_data {
>   	size_t size;
>   	u8 data[] __counted_by(size);
> @@ -156,7 +161,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>   		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>   
>   	/* Spill to DRAM num_samples uses separate SMU message port */
> -	dev->msg_port = 1;
> +	dev->msg_port = MSG_PORT_S2D;
>   
>   	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>   	if (ret)
> @@ -173,7 +178,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>   	/* Get the num_samples to calculate the last push location */
>   	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>   	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> +	dev->msg_port = MSG_PORT_PMC;
>   	if (ret) {
>   		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>   		return ret;
> @@ -266,7 +271,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>   				    &amd_stb_debugfs_fops);
>   
>   	/* Spill to DRAM feature uses separate SMU message port */
> -	dev->msg_port = 1;
> +	dev->msg_port = MSG_PORT_S2D;
>   
>   	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>   	if (size != S2D_TELEMETRY_BYTES_MAX)
> @@ -284,7 +289,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>   	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>   
>   	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> +	dev->msg_port = MSG_PORT_PMC;
>   
>   	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>   	if (!dev->stb_virt_addr)

