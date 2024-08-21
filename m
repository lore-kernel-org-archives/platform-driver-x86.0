Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D54A152199
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 17:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262011; cv=fail; b=PJSYjw+v4wqMYZ/Wg6sjqopPL+ikdgmC2+goyl3QPrPbqw4yX2OAdyY1DBwpCcs/cNd6AU/vEBD4ySzijy6cPGxXUgIARyVZonSJAMEY7LZXJ6o6VwPnncckap+8ihb9A/G+zuAk70TlY90UtevJeLxDj1Pwrda+0aYGVlSVOUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262011; c=relaxed/simple;
	bh=GwAQ260kIXIthVYte0KmBtMnbubKs+LeGi4LcBzDOws=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oeCeNUywnmTuwE4q2HHAYzvKarNTJ7xOKGXYcEJcAgQsHHeXFdpNLh/+hAYPKZwmc1Pr50eqQQAr+agqLA1gpWV+i2KUEUzXLZsK6NfU+FCdvyZgqbqgR0XY14TBylw8mrbCI/QY2vASmlG+4UbcDu6OLxTDWi3me7T99Yw9Npk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q3411ESk; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q3411ESk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dxz+DtFdp8TAxDHkBn5c11/lAMAw+df8cpVAUxa+uh3VNz9dfyxlJbFa1CTn6eTtFKvLIClicT3pM0B5raFowA/Aif765WZFIG/5AJaOci/c8T9Ebl2fOSHYww93NDnGIyNsujE9k494ae/TIyJwWOdaO47ylT7bt2LdWWugYSEfE4jolGNNn2upBzEsfst0J/3sy3xXmeoBkiZ2iBh+/yMzDhHPe71OslzwScVTnQUwrLAXKOhqLICFZAT71FoQ3bsjtS75Rq1E/TKpaUtRa5x/FFDknI4J/TsHBZVbQ8eqhoyx8G5VqA4n0DKsZDQd7/tpBd5OA8F1OV6IPncgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7IOV/uUl/N9XezMT0lfPusibk3SLkNt165qUZcuOO0=;
 b=bDVngY31IfqLOGRJvsBTYWdGWd61YtDeDk3FRdogWdjYdcVLd+V5mtvi25b2vpIfFgQXdIdFkxjLOnSU/Cd+YhfE1Wf46/zcM6UJSZC2/Pi5qdlHKfGNXBhfIxUomFdMv4xGq5Psyn13UTAmfemyz0ajxG5dCIeVrMKi/nuwglCpp4pslJeQKBN6Zy/P1CRMzvhbTXOOZufbcQCVAOFgdQq/vW1O/tZ3ip31YJ0Nw9ziHNkDO+R2mVZBvXe6dsuDIHdvOYg311xJSeHIkUgUiZ1uIjzonUGGoBoM3/daZzAgixQeXGe1OvJ9fwePOeTROy1WPzXXMbj4pIAjb7QnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7IOV/uUl/N9XezMT0lfPusibk3SLkNt165qUZcuOO0=;
 b=Q3411ESkIH1bFQSf0s1RzVfG6A72OtxTZ8K5ECpbGKXJB6+M1BEtVwRbBtJLzmlyBiPXKiI3rXD63izXHp97KkSozqC2b2bhmQdOCfgJnQIpcofOl8mfKxAfum/EP8sdTsOxddPYLJUyYeYMswC13ZnvQKREBHhL0Ajo15s06+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 17:40:08 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 17:40:08 +0000
Message-ID: <e2105771-ddcd-4e7e-bfc4-a656b6d56b58@amd.com>
Date: Wed, 21 Aug 2024 23:10:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Extend support for PMC features on
 new AMD platform
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20240821150446.392726-1-Shyam-sundar.S-k@amd.com>
 <ed50679e-114f-4e7b-8465-1b8d4e0622d9@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ed50679e-114f-4e7b-8465-1b8d4e0622d9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0222.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ca6031-0cac-4bac-bd12-08dcc2084c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eURwNUg4ZGZCRk9XY2RBT0ZJYUp0WGVhOW56TmdlcTZEb2hnUVB5RWhBblh4?=
 =?utf-8?B?TmpHSTluclFUYnBsOTV1c2MzVGZPY0FBR094KyszWlpvaHJiTkZoNWNKSUpD?=
 =?utf-8?B?OVZmSy9acUJ0cVRFeExObm11MVpQWjliVk1XdFFETEpxNnF5U3FkUitVMjlq?=
 =?utf-8?B?WGdIZ2VNWmxIb0dvdXJQQUI0dm5UUitTcFF4VEloM3ZtajAxdldkbzd2Mmsz?=
 =?utf-8?B?amxEbkFmakRoUXhKREdienZTblJuYWlkc3JpZFVoT3ZyVFJIOHZSNjFTckJT?=
 =?utf-8?B?cExKL05UNTIyV1JqN3ZFUUFlMkRnQ3N2bWJ6MEJ2WDNRQjQ3QTFZQTZkYUsx?=
 =?utf-8?B?MTBkRUZlbjJNaGhLUmoyUit1aDBibzdpUjQvWmxBUGNCRUM1T2pHSDhoSVN3?=
 =?utf-8?B?Qi82T0lvOHZ0MVNYaG9QV1ZwMUZjS2puS0lib2cyem9TUHRLUTV4anczREFP?=
 =?utf-8?B?MWprYjdpQmFVdnRtdG9ETWsyanR6U2NvOVRWd3o5N2krR05aSk12aG84dk1w?=
 =?utf-8?B?eFZlUDJtSjF2eDdSTHpvdjNwZWgxMS9Bdm1uNFJnd29VajJxdWV1bDd2aEY1?=
 =?utf-8?B?aDJUK0hHeXlhVlNEd0I5UG1HL0NLMDNzT2l4KzZ5STdPRFJRSjdHc1BEQmlj?=
 =?utf-8?B?ZzRHMEdjMWF2WFJUSXNnNUM3THRXVEErb1JRS2srL1MwOUU1QS8ycTkrcmNE?=
 =?utf-8?B?TnVDb05abGhRU3kweWMyTEpLdUdsNlBnb2xiWDlaMU9XNkRweUJDVWFJMHBY?=
 =?utf-8?B?eThDNHBqNjlIMUdXNkFiS0JMcGxWbjhTZU9QbGZhRHU4b0xpdUNuTVBlc0lN?=
 =?utf-8?B?SWxxbVBtOTB5Y3U0cGJ1QmpPbnRxNDBkSUJldUVienh3UWhUc3daMmgvL203?=
 =?utf-8?B?NElGSTYrbXNUa0FEM05keVh3K3V3Z2o3TGtOWVBaMTJwVElZeDBqWVh0Vkox?=
 =?utf-8?B?enE3Qi9VbDRVUklQQkZZR0IvdFdOak1SS2NtcW9YZDA5OFU2dVNsYVBhZ0hZ?=
 =?utf-8?B?MUdPS1RFaGJmakY5SWcxYmlIZ0UycHZya1R0bG9pOHJUbDlPR1FOQVRuYUI4?=
 =?utf-8?B?SGNsRmt3VG5WNWFRZjNPVytGNitITXllOTlEMGt0dU9GTTB6bTN5M2FzV3Q0?=
 =?utf-8?B?YlRpdXB5aFk3VmNIOFVFT1JxUGd0MkZIK2tEZEUyYTlYVTE1TU1yME14cGRa?=
 =?utf-8?B?NWhPazBNNTQ2SmVsNWZYUWdtRS9jMDRtVmFMMGFSejh6UURPWG1FeEFETjh0?=
 =?utf-8?B?Rmt3ZTRoR1FSbzBKS1NFUWpXZm14ZlR4STZ5UU9RQ1puRXFoc2RDNFlYa0xJ?=
 =?utf-8?B?ZGgvek1CNkJyMlZKUjl6eml0NGtQSDBaSlBzSVhucjFucWdTWWlKVE5aUTdk?=
 =?utf-8?B?OG4vVGNFRTVyZzMwY29JdVF5K2paNDJRWnNuK3NrYldWVG1ZVmRIa3VmUzBa?=
 =?utf-8?B?aFZZS3UvY2t1L1I1b0xxNWg0aDdRTVRtQjhwOWRROW5PR0RaZmVjdGJQdThK?=
 =?utf-8?B?T1pIQWF6QlM1TXU5ZW1PZEgvRnJNdlhUZlNLYlUxSkd1SURtTWZ6NS9CYk0w?=
 =?utf-8?B?VmgwWVN5UVZDaDF5TzI2VTFzNXl4cldlb0NvU2Q0TXdWZ2NxNWltVzFiWUhI?=
 =?utf-8?B?cnl0K2hBemMwVGluMGlTYzhMbjQ2clJONDB6dzhKcVJoa2xpSFl5d2RXRSt1?=
 =?utf-8?B?bzBSd0YvTmRJWXhnVnVBWnNoZ09WRFBoaG9XN0pPY3UreVVNRVlNL0V1NTZw?=
 =?utf-8?B?SWJOdXhCYStaSk9icCtVcDk3RDRpdmZPdjg0RktoVVZDZDZVYlVoemI1UEJY?=
 =?utf-8?B?TE5aaUpiOHpWRFFhTC9wQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFRDVDBPWUxhK21PZDkybXlzc1dGc1BnREpPZ3Nmblh4V1k4ZmlnQWZUbWNF?=
 =?utf-8?B?RDl2Mm51N0o4MDEwNWdoWVoxeU16QkRteWNFdkF1RFdLNzF3bDU5Nkc5MUUy?=
 =?utf-8?B?VG9TenRJdytVQXUyUGY3VjN6UklHOE4rUDA2YS9wQmJ4emdncWtCcG5tUS9K?=
 =?utf-8?B?V1hwMTA0Wm0wanlkemVVcjBiaXlJQzlTenoxWFVWY1A4bGtlbmttajNzYlJp?=
 =?utf-8?B?dkpNTzBMQ1NDQW9ITE1PSUJ1ak90RDJNUk1DTUpDWDE5YVBUdnpwRVdac2Jo?=
 =?utf-8?B?cnVsU2pOWnRpdkd5d3J2aXloUHVzak15RUJUemdtVDFmelFkeitKK1dibjVW?=
 =?utf-8?B?WlZ0bG83bkZUZ0hSR2JIYzBUczRxcTNzL090T2dvWnlmS3ZRdkZIWHBiNXBt?=
 =?utf-8?B?aGwvbThEd3pKbHpRMzFMMklsa2hoNmJRSUhyZXVTdUxwU3ZMVzQzU0VwU2VO?=
 =?utf-8?B?RElnV0NIY0hHTGs3VTltVzI1ZU05Qm9kRGlFRVVoOXpGTk0xK1ZYSngyUTV0?=
 =?utf-8?B?QXJRQWxnSzhXSzRFRFVPSmw5c3VFRmNVRXYzRDVKZlA4b0lsdldETHppODl1?=
 =?utf-8?B?bWtjWEtFQXU5ZldYYU93L3FNQWhXSVFiWWozWXBqeHZsR05vMFRHTkVQQ0p1?=
 =?utf-8?B?ZEZiQ29EeDVxamxiTHB0MW13RHREUHZFV1c0S0kxME9XWGFQQnU2Y1dOT1hm?=
 =?utf-8?B?b0RvSkw5czZBVnF4K1oyYkN4WlM1NlBUUHRubDYya1dpb0ZIdVhlOU8yMUV5?=
 =?utf-8?B?WFVFTEZaRXhQKzRqeUlhRGo2VVVGVjlHUUxad29EV0FGcWh4QWh3QjlJaXNq?=
 =?utf-8?B?UVVlbFZreWdtUUNmSjlNVmpqMEZCT2IvcFQ5YjkrU015M3J0MXVxWVlIdmRG?=
 =?utf-8?B?aEh2YkVER2huWVZuRzltbWRSc25VRG0vQTFEUXd6OUcxbmZLMmNEdWN0MTMv?=
 =?utf-8?B?aSswQ0pVbVkvcFVEdHFDNWQ1eGsyRGpJWks1M291YWxRNGxYRU4zK3BOK20y?=
 =?utf-8?B?WW1NbnN2U2xNN2hqb1owd3NiZFFpODFKU2d3ek1tOERYUTMrM3QwRjZKc1k2?=
 =?utf-8?B?eDVUTHdqUlpaeEUvaHVHRUVYcjJURGhtRHRKWjNIVFBOQXhCcTJ2Vk9LbXhi?=
 =?utf-8?B?TlBjM05JdlNCV3lrcmJGV3d6cXpudFRodFQ3SEZkem9KY0V0SXRGUDUwR0FS?=
 =?utf-8?B?QjIrRVhvSzVNT2hEeElRcUwvVVNEa1pnRElxYTZVVlpmaXB0UDNaTmUrMlBC?=
 =?utf-8?B?MHhNWkY1TjVEcW1ZTGJ3RVc4MVhvckppUXVWb2ZsMVk3Qm1TZkxGempkSldp?=
 =?utf-8?B?TU9ReGxnVEd1S2pYcnAwcXpZSEFRek9mQTFHR3NYMnpGeWZCNUthTzgvS1E5?=
 =?utf-8?B?cGtLYit5SzJ3MFdlVXRKTXF3YUtQOGcvSkUwTSswdzdqZy9aSE1ESkdvRExv?=
 =?utf-8?B?SzdSMGNGRGdDRXFiNGpQSXhzR3I4N3d2bzA5dU1nYzZxNENwQUxwV2gvODV6?=
 =?utf-8?B?QTFQYmNvS0NITEt4U2JLL3ZtYngwYW9LQ1FERnV6YnJvTkh5YUlYT1ZTNmJ4?=
 =?utf-8?B?SHZxTXM4eExNaExQbDdNRVVQNUhMKzFpd3dmSHNVZkM1Tm9RZzRzamZMTFo2?=
 =?utf-8?B?WVNsUWtuNkpUNllEWFFSTkFRNjlPZVJ6bHBxc1NHOEw1WXR0d25zZ1ozZXQx?=
 =?utf-8?B?bVBCTUlSajFJMTN6cDBvNHhBWitXQlJFMC90ZURxSGlFa3hqNm1jaHFLVEN5?=
 =?utf-8?B?MHdjcU01RWFDL0JHaDdkVXFPVVlVRTluWWtFQVV0ei9iVFZQZXV4WGRpQnhz?=
 =?utf-8?B?dlIwdUJtMDZlQjhFN1ZXbHhLd1NhbE9obEwrL0NiQnMxQTk5M1p6S245d3l3?=
 =?utf-8?B?S1pyN1BGMEQ5d0hhaktKRU9ENUJwc2V5cHNiOFJqZEgyR2ZaQkpSVDJPZjNN?=
 =?utf-8?B?VXlwLzlSdnNCK09rNDdFYm1pLzFaUUNBOFZqbzVXeGF3WjQzT1V4dy94OUta?=
 =?utf-8?B?YTlYY0wrTFB2NGFMMExCdFFyRDQ0clA3TmZteEFldXIyQkk1a0x2emFzQzJC?=
 =?utf-8?B?ZEk0TGxyeFgycW1PMlh6N3UxSXhPYU5JaXIzRHBwYi93Y3l6Sm12QUNtb0Uw?=
 =?utf-8?Q?Biby/VmVVoNqn4ByBYKA3o065?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ca6031-0cac-4bac-bd12-08dcc2084c80
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:40:08.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HovG8orVS4Xaib2ZR8N/9D9Jfa19I6nMgj+kIFWrbanjgE6hYDMjwQ40kb4K3brEo5+qNbNDmxlpR1ryitYbZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527



On 8/21/2024 22:18, Mario Limonciello wrote:
> On 8/21/2024 10:04, Shyam Sundar S K wrote:
>> PMC driver has capability to get the IP information, idle mask
>> values and
>> STB data from the PMFW. Extend this support to the platforms that
>> belong
>> to family 1Ah model 60h series.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> This is actually a fix for another commit in 6.11.  Hans, Ilpo, can
> you please take it in fixes?
> 
> Fixes: 426463d94d45d ("platform/x86/amd/pmc: Send OS_HINT command for
> new AMD platform")
> 

I'm not certain how this commit addresses the existing issue. Last
week, when I sent out commit 426463d94d45d, I tested the changes on my
test bed, and everything seemed to work fine.

If this new commit is indeed resolving an existing problem, I shall
amend the commit message to make it more meaningful.

Thanks,
Shyam

>> ---
>>   drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>> b/drivers/platform/x86/amd/pmc/pmc.c
>> index c3e51f0a5c33..bbb8edb62e00 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct
>> amd_pmc_dev *dev)
>>           dev->smu_msg = 0x538;
>>           break;
>>       case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>           dev->num_ips = 22;
>>           dev->s2d_msg_id = 0xDE;
>>           dev->smu_msg = 0x938;
>> @@ -597,6 +598,7 @@ static int amd_pmc_idlemask_read(struct
>> amd_pmc_dev *pdev, struct device *dev,
>>           val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>>           break;
>>       case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>           val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
>>           break;
>>       default:
>> @@ -630,6 +632,7 @@ static bool amd_pmc_is_stb_supported(struct
>> amd_pmc_dev *dev)
>>       case AMD_CPU_ID_CB:
>>       case AMD_CPU_ID_PS:
>>       case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>           return true;
>>       default:
>>           return false;
> 
