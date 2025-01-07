Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118551F8AE5;
	Tue,  7 Jan 2025 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285425; cv=fail; b=rF+4Ff+P4U6AHpcU7EBUZD94Si/4H+jHzhJPOwADyxftRBCKCpzgKoPd+0ci7TWDsCYS3skQkBTX1FD0QoyDddLdjiGovdXA06/t3z+6+hKhj1LE3LILHJ9xhnB6K04yTfCR//u5URsLAflw7ovOnJFSsx1uWUFLIb8ecekUEtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285425; c=relaxed/simple;
	bh=/pgPTjdOYbBxj5GLsVR4V1oG2dLYzdRA6WKpQ8zNKsQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PDZT+JMpxVl9wubewNiCVbSho61H/cMjU01Px4XKgVVS7LrTNPp4Eqki2hCt1LDAMMdM0WPh0DTqKxHHasV0hhxOReEaq/RAmQZrsEeuWaaav3EMKl0WTD7qgdoK8qeC91W9/T73tGmB1eP58+Fsey0TxelDhq2eQ+5xbHCa0xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zpDsx71J; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zpDsx71J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzGzST1fXM9kbnPKYexBp771ptkcgCTIi1nubbwPFBYp3l69KV6keQAAKAvSvAcDlspl+51dp1PH7ZJS4aWW+xZmFRfjchADzArvaWsPWqPsQH156hPsEfSji1dKxHJj5wzUTOBi9EleD0BU4jhI4qIqHZU8DTYhOrtj5cw9q60zTIe9q25DGgk2ezFHGmSaqkLfVSs5EAsTfNXxXzrI2ajhEl+OZVu7Km+X/4e3pkLISgvgu7c2alKMWRReUm2lPYQFImmmg9dLTz4QemE83f1OeleHCp1H+5CXTXWpJspeynxHiGePjkrdLV+MwBDk9HnjU10N9VQ1q5jdtt0v3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYrHhWv0Gtb2FHZYUHNBz48A0OBxY7xhVgksxEh0Mvw=;
 b=HXpqCYd+5IcEBg86yRtbOzMvFuq14PwsWaUR8ormLvPboST9EGg1mu4oKM1NBwrFeggYm7Yxa5uB9tPm1AeaYSKXmJsJ9r2FvL2SBrFwJGYZpqkF3nQ/Llf3X0xYqP15v+ec+OY5iiv53vLUD9v8Eu4RcUw0bnfCcrfgyieJ91LbBc6OA0937FwesVmX6ThRaJIOzkKl+VmKoS/qOaYQGpV14+GPm9TpzTt3sow6WO4bsy7ijI8DK9JEc+IKVDtz6UYoWJUzz+DYSy0hnti4RLmCxJKfw5XN5rUdpuXol4UmOYUFXcXKn99ULvqKvFqAFhtBz/icDWjkdDJ8bMR+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYrHhWv0Gtb2FHZYUHNBz48A0OBxY7xhVgksxEh0Mvw=;
 b=zpDsx71JVCuelbIO20B3A5EsMMCo8dvVSQaxiNKi1oVU1QjRVlwEYxx+jCPHnNIiZVq7iCEdzeoZaYdkDEXZn/xgoF5R5dT80iBiUPuJXR6Hi1Y00uDb6HEkqqRRjlPVuVxPFClC0Mld7FE9uL6EAamIKwbMSK8FbRvr7lDMec8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:30:15 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:15 +0000
Message-ID: <c6570b1c-5ced-4de2-aab2-bd7a1ee1214b@amd.com>
Date: Tue, 7 Jan 2025 15:30:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-16-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-16-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:806:22::29) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b62585-6dda-4467-528b-08dd2f627994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXJPN0lwMUk1cUlsdzJJVTZGcm9uU1pKR1czQWQ4R3FYck13Z0daQ2pnakZ0?=
 =?utf-8?B?cnJIc29hWDZPSEhZbHg0bjBOaktKdnlzdzJ2V2RvSEo4U1NJS1ozZ1JPWXg0?=
 =?utf-8?B?NEVSckxqd3h0Vlo2eTdWVzdZQnlyTWVrWUt4RjBIWDVEWGJjM3loQUZvdWtX?=
 =?utf-8?B?eE9ZN3NKelQzZm9SMmlVdzJFZGJIMW4yMzNkUWV2ZjU0Z0pGeWlEK2NsVDZ1?=
 =?utf-8?B?R0FiMU1UVllIRXZ5KzJKNGtZdmlEb091YkhJbFhjOUtYRHNHU1NxTjJQd0hp?=
 =?utf-8?B?VVFSbjQ2U3QyUnBVSEVxT04ySkR5SnlIRWhjWXhqUHM1VTVMVUpPS3k1K3FH?=
 =?utf-8?B?cDJZQUFyc0RRZFdLTUxiSHBXdDVJSEZFbXpHUTRieTRUOTZHSmczN1J0UnVC?=
 =?utf-8?B?NzVCZXdncEhvTmVOajFwVDlBU2dzY1pxdFVCRWcza2FlQUJGV29rOHdCV1Q5?=
 =?utf-8?B?dWtZZ01lTEJVemRwV3pyNDc1OTVpdDR2ZGN4MjZhSENLTGVFbjBCbmFJZWpZ?=
 =?utf-8?B?T3I4M3FXMUFyZWJEelhjVERMVDlOUk5VZzVkL1hwVXltd0wrbTIzMjJGSDBV?=
 =?utf-8?B?WmZlZXBVL1I5UndEenB5SnZrKytOUnZoRnpoemlsV01KM1ZJTm5sT2MycnRQ?=
 =?utf-8?B?L1p6eWgxbEZjQ3FjMEFwSm9kZExISUVldUdNY3FqZm1OODJ5Sm5Ic2lxVXo4?=
 =?utf-8?B?VG5rdTA5T0I5OEZXVG83ZFVoaTJOT243L1ROVEgzZlBIWHBTVFV1NnB5SXlL?=
 =?utf-8?B?TnRacTlBQ0dWQ1hocldUQ0FybCt1b2FtL1c2eEZLVDhuVk5yU0pxU0V3Z2pW?=
 =?utf-8?B?NGVBWEZXSVE2VDN6cndUZ2Q3aExtQnNrTjZoWUdVZndFMWxxSDVjRnJLTnJ0?=
 =?utf-8?B?cXpQdEdlb3BzWXBVS3h5Y1NRZGpObittWERDbWZJckM2aGFPSkVVc3Z4QzYy?=
 =?utf-8?B?aHRvZ2RPSzdEYStPVkNNcmtDQnF0YWJJZ2RrbDdobklhL1ZZVTR2OHNCM0FU?=
 =?utf-8?B?cmFXNGM2elFzSC9SUzlSMkk5a3VQenBkTDF1R0dJRytXOXFNMkFMbnlKT0JQ?=
 =?utf-8?B?WDN6Z2pVdjhNcHgvUkpTM2hqZWNMTFY1Ull6YlU5T1BGWDk4cXE2RE1rY1JF?=
 =?utf-8?B?c1F3VzRXT0YxZkorOWg5OFhBNU9CWWdYVjI5aHFGSXp4RVFqT3dTMEJpUVNj?=
 =?utf-8?B?OWRBNHFwMFVsOUxZdDNvSVdsMTFCM3hObEprQ2RTb0ZIbDdQcmU1NElnYXpP?=
 =?utf-8?B?T05ic1Q1eE1NVFh0aUhhMkR2eDRCSzRTdFIwa1B3WkNoNm1rUDhSSmlDTWtI?=
 =?utf-8?B?amkycW5rUkRTU1h0UXJ3dW96alI1czNxb1lVMHVSNkFCQUNsU3JSTUpZVEhK?=
 =?utf-8?B?ZTBBdm1qRmlDQ0duTjB4c0pMWkhMelQ5Q0JlNWhJOTVFcVI3dmdGTkNQcWJo?=
 =?utf-8?B?UUxOaFAwZ3IyN3VrdXNoWUhRcUNDeDdGK2ZrbTJsMHVxMStpT0JVNy9zaWNW?=
 =?utf-8?B?djdveCtTTXl0UDR3UGd1akt2WUZCeEswM0VReXdZYzY1aGZKVjFNdGVYWUlL?=
 =?utf-8?B?TWtmQkFISVkyeDB6dGtqbmIrcENxSU9VSTVnR3ZjbG1qbFFWNTE0UEkzckVk?=
 =?utf-8?B?ZzRLb2thcTBDTkZaVmVqUlJuNnhJQjdlWk14STZQcmprR3pIWFhKN05QdFQ3?=
 =?utf-8?B?V1BhcXJIU044cFdEUDA1YmkrZktxTCtVSjM2NWZ3aC9UNy9lTGtBN3g2bndJ?=
 =?utf-8?B?V0hIYlNaZ3B0cWk4a3lLa2xNaWlyVE1FcVpib2NrdGJHSmRkRTF6NTZzT1VY?=
 =?utf-8?B?TG5GWW5XQW9lQXV5cTMxbGtNU1FBaUtDZ3h6NXlpR2c1cFlpN1Blb3dyWEQ3?=
 =?utf-8?Q?66nL+8TDDaULu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHNEMUhyVUorejVFT3kyaFZiS0VnUEtNQlY4VWRNZVpLK1daYm5GbjROcDFM?=
 =?utf-8?B?dko4anhGREZDNmhGT2VJNVNOQW5MdDh3Vnp0QTBHa0ljRjNUQXFIbkhiR1Nh?=
 =?utf-8?B?bHY4TDExRVVyNDQ2N0wvdUptOFd4N29lMFZsUlo2M21VY1dDaDBFb3FRTm1C?=
 =?utf-8?B?K0grOGxFcDJFOWxmWW8yeXBIdUMvdWlKZWJwaGdsSktZWmlTTlVWMzFlOUto?=
 =?utf-8?B?MXZJV05OcG9SZ3FhWXI1c3ExZEdKSFNpaWt3K1M1VDM5NFF6a3NrdWh2Ulpr?=
 =?utf-8?B?STkzODFUUW5FRDBxNGViTEovQkdQcnBxZng3Myt3K2RDMzFxK1VSd2tCTGJl?=
 =?utf-8?B?d2dDWXBPcmg3YVVGN0xvMUVsUjVPR1JaUEdFc3ZuYXNuWWpqOUZZOGRhZ0VW?=
 =?utf-8?B?M0pKTDNZdk8weTRGSkliK3hqTjhtRDJXYjJ1MjVocXlQQndvd0hUR3o0eTIz?=
 =?utf-8?B?M1haWFNjMnpmY2hpUGRvNlJZNmhXcFMwbEtOUE9mRCs4UndFKzNRRDdldmtY?=
 =?utf-8?B?VUdtS1pCdXhEWXo1ek1ZUVZER2Q5SnhudHRtL3BPY0o4cUN5SFdITTFDT0hQ?=
 =?utf-8?B?ejhCNHQyTkZhbG1saEE2cW80RkZQNTZKT0lTSnVzSWFDQVVXQkYvN1pNb3FE?=
 =?utf-8?B?ckhsMzlhMUowOUpmeG9BQkdBZEpEZHE3RXFhYU50NWs2eFlIUzAwNzBWNHF6?=
 =?utf-8?B?WXZhNGFBU09YSDJyM0NZaDd5YWFaVmJyRUhMZzdVUnJXWG91Z3NLWTVrL2pB?=
 =?utf-8?B?bXIzb3FJRkpPcktsRk1rQlFJb1k1K3RxSlZxeEs2Y3hqMFVPM2tmSGMrbmY4?=
 =?utf-8?B?Q3dBcTFzSi9KeUZ5bCsxTjRCTlExSFhNekN2SFlyb1lVVU92ZVVNTnozTCtE?=
 =?utf-8?B?R0tLdk0za3FFTmZDRDgxcUg1YlRINnVWdUorNWExOFRWc0wxRnk1ZGllNjBM?=
 =?utf-8?B?RjRSNjI4MWQ1OVdrZW82Z05DaHoyNS9CbVZrMElHR1cxU09valQwb2tYMWl5?=
 =?utf-8?B?dTFIZjZlZTZZR2VnOUN4M1dvNXg4enhJdGxTQUtwTjNJdGZXWWFwNWUrSkow?=
 =?utf-8?B?OHo1ZE1NcTVsVCtwcGx4a1ppTDdyUGZRczlRNFRzUk5oTSsybmlWb3p1dTI0?=
 =?utf-8?B?N3BaR2NyM0ZqNGw4dHNVRnFkM0laTDEvd3NtcE5pSXljdE5TMmRrS0Zjanpl?=
 =?utf-8?B?T2pVcDdibUc0MDQ1QmV3RHJrWUtTVkl0L3FmUTZpY1p2aDN2S2NIRHJpZTZo?=
 =?utf-8?B?SVJqNmQ5cnNVYkZZRk96ZzZuMG95REMyTzZUWGlINnZtaTBrS0pVUW5zVzAw?=
 =?utf-8?B?T1R1WlpxV3hHSzJrclFBWGZmM1paTkRCdVF6N2VMZ3BNMjBSSnpxVlFRYVAr?=
 =?utf-8?B?WHJFTyt3Rll0bThSSlZ0VHgrTTNBQUU2T3JCTEhDcHdreW5hSzgxNE82dlN0?=
 =?utf-8?B?WHp3SG55b0NBcE52eTZ1Yy9jK1V6Ymp1TUFVZ1MvWVdmNUtwWWhrR0xmc3VV?=
 =?utf-8?B?SkFXdEFUN0xKVzcraXA4REozUVZLOVA4dlN4OW12bWUwRmRmNjQwakd2UGFR?=
 =?utf-8?B?WVJLclJVQ0xKRW5xOXZ6bzZWTTlneEx4dHpuOGR4THpBRWpoZ1F0ZHJZbHc5?=
 =?utf-8?B?cGh0SExtQVFJb2QzRFc4QVM1bzlwNkZGZlhVd0J0TVdWV2V6bjE5WVFZbEJj?=
 =?utf-8?B?anlpdGljTitFdkh0ekt6cnZOWmZYY0VaQmUzemV1cDA5OFpXQW03eDNEdGJ0?=
 =?utf-8?B?NXlRSmNvVFlkSTkxUkV3R0dTTGhqRDhFZmxRbkx1NC9aZTN4TmVuUkJLT0li?=
 =?utf-8?B?UzJuazluNmEvOXltYXR4bHRUQ2Y4M2R0MXdHTTlXc3RsYkdqSlk4QzdWUy82?=
 =?utf-8?B?YlN3ZzY1aFc2ME92YjAxV1huRWcxNTErdzVIVlJ3a0FLRXdsODk3MjB3a2JP?=
 =?utf-8?B?bWhGY2w0dE5wenZBSnZMZ1YyVThXTGZkdXpEaG8xa2Y0UXd5Ump1RWdzdVIr?=
 =?utf-8?B?NWk0NDR5TDFTWmNjMmRrTUsxRWhiOWFnWitWK2JzRktkWXRqNCs5N0xER2Rs?=
 =?utf-8?B?dmIveWdGajYzdzJBV0VYOHlwSDdHYkFvVmRLT2NOZlZ1ZkxLSWNUbWtGS1ZV?=
 =?utf-8?Q?ZngQ3+zs9QHIaByaQNLGtfDjT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b62585-6dda-4467-528b-08dd2f627994
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:15.0848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEN6Y48RDefSykIbKvADol9PS7XX+ahSWjWNe4lipcR2XMtT1ZUINZ9CmCgGK+i9gb9mxoBI0rfJvtypy0aCTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Dell has been inactive in its maintainership role of this driver since
> around 2021. Due to this, add myself as a maintainer and update path
> to support upcoming changes.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   MAINTAINERS | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3809931b9240..596c6a46478c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -784,10 +784,12 @@ F:	Documentation/admin-guide/perf/alibaba_pmu.rst
>   F:	drivers/perf/alibaba_uncore_drw_pmu.c
>   
>   ALIENWARE WMI DRIVER
> +M:	Kurt Borja <kuurtb@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
>   L:	Dell.Client.Kernel@dell.com
>   S:	Maintained
>   F:	Documentation/wmi/devices/alienware-wmi.rst
> -F:	drivers/platform/x86/dell/alienware-wmi.c
> +F:	drivers/platform/x86/dell/alienware-wmi*
>   
>   ALLEGRO DVT VIDEO IP CORE DRIVER
>   M:	Michael Tretter <m.tretter@pengutronix.de>

