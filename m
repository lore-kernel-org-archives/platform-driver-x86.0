Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018B148FE6
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739806733; cv=fail; b=qlSUQrZGKJiJJwgBX43g/kj0SA3tcI1ivqNq8gCuiVmR7QbYvIW0bylstD/TLgmmfezR55/Kj8oMcUEjt773++qkw4us81sS+M2eoEVyNR7JV4wdGgGHa537uqS/iwh6ixVNbVPSQ5nReu8w7C8LImieuylAZ1NAyYQ2ncNQIGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739806733; c=relaxed/simple;
	bh=CTYk7MS2wK/DChMaWyDuKpSLa6ArmCgUIP5TK7cJBqE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C2Yy3N5GFw8meY3+Z/mTmRYiS9h98hFSQF7O+QATFlo7a5oXvvo8ee2yPs8bSML4C/5NHfUEvRhnfRaIG9HTduKQ+d5PAYsJg+kLiy3pxfZ4eeKeZaz5TEU5TAYj4y8fVnWgJ7RjsGwwvvLiZEIudsi4CR3H6GTt54pqAIhZMRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dOx6LJYs; arc=fail smtp.client-ip=40.107.92.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dOx6LJYs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBAu0ldxFnIDnb2KQY+oDHjP6DXf56/T1+lMoR2+/cUoA2bn2ebahqWBNhhDE9vZ+n9cJ1NrGFfTTPRNdZUiU+iTZ+4b36860SFF9EdwgQiMkrsEky/LI3XtnAwiOgy+8TY10i2XR8HGy42DYh1VP94RwtenjRpl/4cIfGEsIVHVYvVMWg48QfuHDaCM4Z3aCaOiJmgcjQmblS47vIQjnv4c76Hb94meHieJqsSyyi4fRQPdPkoPk/5pftbamEk4QXr8xUz68MDI9tY45/xyDzkO+RRLm/rZX1D65fPj6U3xSNRYyo1ir40kqqP9C3jBw9jiOx4J5o62k7sE+qdioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/npuobd9Pvck1/6xO/A7XsPi8yOLg3Icur6NMtChE4=;
 b=WhXRBnrmqtdWctZZz8HFIgGglB0b+9TEl2uiDq8bzqf0nCfpjTlrwb/tJcyifgdcU0Ks19GWcCCcMsCDOzJOljrf/+xyOCf/ooOTbp7HmICvzTL1/x6URQjJyn9TofIdglgsa3tARbtF/TcSXital6qiQGnX2TtWFLFfFnXWzBY83XhtQno58rBIwF+T+DUvdtP7c87KsEaFCo/35nzAPHhhO0ibgCgCXHVydmfSKFLuJeiATidjQbG192PW5XLAJp0Chvc58jYRy7kmuzMH8aNRC+goJ62w9f0TwIbPntTbRGNxjLR4yLaErb/a5K58DehDnRIB0sWoxiHyH3N43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/npuobd9Pvck1/6xO/A7XsPi8yOLg3Icur6NMtChE4=;
 b=dOx6LJYsgOkmpljd3DD75K8w1fMVUrwCUWam/yx9zIGNuIbsXSzJZ8YIGG9pzSFrxP6ZYkx4h/XNbPp+XxHMGiSlb5nNN7LkD8NE3yRcp8gwl6Q8gVj4chz1yzzBIrsZxgIAiO5gJXqKESsTM7slti9BHSSzVkzLaZoD081TEbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 15:38:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 15:38:47 +0000
Message-ID: <14d745cd-6c36-4db1-8605-5bb169f8dd80@amd.com>
Date: Mon, 17 Feb 2025 09:38:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86/amd/pmc: Remove unnecessary line breaks
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
 <20250217081720.107719-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250217081720.107719-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0188.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca5fe4e-40c2-4373-9b76-08dd4f692b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXB0dHZmdGxOZHRlL2pMTFYrT3JrcEtqenBiNUpIVW40WDIzbm5PQkJJR0Zu?=
 =?utf-8?B?ZkJLQWx0WDdhQVR1QWNOeFRISCt6Tk9pRU5lbDVMem5ZejdoTkZIWEJWczNa?=
 =?utf-8?B?OTZLNTd5STVwWmYyVWlTby9JWXlPb3J4UWZJQnBGcW9Xb3IxdVNJMUZkOFY5?=
 =?utf-8?B?eFNEczU3SHVZdUh2Zno0VDNsT0xqUWNJYjBLOG5GQldmTk5sZzBWL3FPRWd3?=
 =?utf-8?B?RkNvNy9SSlFQcWVyZ3l0MU9JN3crREhGZm50MWdhVjRsUXl0aWE1aXRJdXFm?=
 =?utf-8?B?TkwwWDhQaUQvczlPV0tqcmNUSWlTSXRsb3pKWHRjWGpRQVNOcFNHWXVqdWZS?=
 =?utf-8?B?Y1FyVUwrVXhZZlpLc2t4RWVSZ2JmOG9DVXprbWhtWXgyc0VMWGRJbmJqblRC?=
 =?utf-8?B?MDZ6SGlqTDhnSUludXFCQzNSL1BzaU5nRjYyNmluT0I1d2wxVzZlY2ZJUUFV?=
 =?utf-8?B?dVd5WXFiTnEvYktkZlFDTWJjbk9wR21OdDlEazlHQTNRWGkzTnY1dysvajZy?=
 =?utf-8?B?NVR6a1g1NGJ1dzJ0NDIzaXp4bjlOeXdxaC9uMTNjVWJNYTZJajEzRkQ0U1I0?=
 =?utf-8?B?RTc4cTg1NFdRNjZCQWJiZDhjb2dGMmlDRjh5cS9MUFhaV1d0VXIrS0dCM3Vp?=
 =?utf-8?B?QXlTZHBiUzBoL2p4OW5WMVZmWGlDSEV1Nm5UR0JHWkh4SXRZQlA5TDBicWV6?=
 =?utf-8?B?aDhwNnBmOFhkQ29MZklQZ0VGcXYyYVFoeUN4ZnoxRnJGQmhJUkt0SXJId3JT?=
 =?utf-8?B?RjBxL3pCbUVyUFFPM1hIWnhBcUZueWFvNFRVQUJvbHpPR0t6aUxnTDZFOWtk?=
 =?utf-8?B?NUtpUTVFU0ZIUGQ2S0EwTXlsanlkWEpsWnhyYXBJeUdJYXEyLzMxMngzcitC?=
 =?utf-8?B?anBzYkRWQUtVOTdJOFQyTnRSTitCbG9scHg4R3BiSlY0K2xIV2t3aHdpQnpr?=
 =?utf-8?B?cVIvOURvSUc3OHJrWW9XeTR1aGRSaS9iaFlNTWN1ZDRDNldIekQ2aFROOWJv?=
 =?utf-8?B?bTdoRitPTlB0cjdQRFphY2pxSi9OOU5zTU84TFYwY29lczZkSUpQR1VrcUFC?=
 =?utf-8?B?Z2h5R1FkbXhjb2lIZFJUQ2t2Nlh2d1ZLVHY5VEowWTI3SHc3TDFoVkhleks1?=
 =?utf-8?B?bUxkc1NHRFFTRFhmZEhnajRmN3JUUlI5QU1vNC9aWVVEOE9KcjhHWHdBVVpW?=
 =?utf-8?B?K2QxaE5ndW51NjUxMlpRNXMvU0dhdmFnVU1DaTNSZGZxa0NSOHVlNlU0NjZK?=
 =?utf-8?B?aVNRcDJ5WGZQYys2WGhlclJ1ODIyZkpyRkFUMGpjYzh5b0JKVTNBdU5ESHZI?=
 =?utf-8?B?alhzN1JHSWN0YUdQUFZ2TjdrT01VNFBmbDNWMWdYaUVmN2VZSlhQUkxLaThC?=
 =?utf-8?B?bjdFNzJhUzdpcXBjejlnR2h6eHpJOVlucldJdlBLWG1oSWJhbWZoUlpYNnRD?=
 =?utf-8?B?YThidkNkQndOOHVCUm5XTnhpaWZnUzhVMGVVcmpMMnkyTHdFWk83T3ptTGRI?=
 =?utf-8?B?c3NyVER1TTRJelVleWk4MzBUNmROY0laT1czaG9MVjBzOWpobUtjOG5kQlda?=
 =?utf-8?B?K1hNdFc5endYdFNmejBPY053Wkg5OGtZVnY2Tk8xbkxrWFlScWtPWXNFOGxW?=
 =?utf-8?B?NHZ6d1FUMnI5VzREQ3VTRS9QbnovUkhaZU54NkVRc3dPSlU0Wm5LVjB4L0U4?=
 =?utf-8?B?NlRwUzBuaW5UeHhVcXdDZGdWelFWbGZEYVdQcStQNFJyblhTWm5pakMyMmpP?=
 =?utf-8?B?TEpPeDlBaitVUU5JTjB0dm40amFCUk9iWVdNODBUL1pKNzlMVnNvOW9iNkFk?=
 =?utf-8?B?bVpXSlBYckhZRXE3M0FvZENUcWNNRXJpejhnNE9FRGxJQWxvZytEOXZTTHRO?=
 =?utf-8?Q?vovT6iVjqNh5z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktpR29Za2dUSlhYRndVaXk4UE82NzdaTE9Pa3BueDhFK3h3T2dxTnlGSXcx?=
 =?utf-8?B?NU1nNWFJZFZLKzFVTWZTZVRjVFlNbDl4anRFNm0wdE5WVWNWRU1UWlFFclZI?=
 =?utf-8?B?TkRmNUFjeE5HTDhpN3FrNzhUOUl5RDYzWDVmY29ocGQ2c0YvaUtyRDRyN01S?=
 =?utf-8?B?SmhVNjBpTEwrVE1BUVJvODdOYnVGY1ZpUENSMTRWTWkwZlpKMVdoM1dRMHcy?=
 =?utf-8?B?WHBET3hxODliVkRqbWI3UEpheGlWaVFxK1NLRkkyazJudFlmOE5NeUpMc0h2?=
 =?utf-8?B?Nm1PV3V2S29BelBEaXR5cUNZVWRidTRoM1JaUTY4WjF1VjhLZktCa1ZnR0tU?=
 =?utf-8?B?R3BwRVkxb2NIUmFDSzJPdlZqRXhMRE14NlViMW9ERWhsL25DcW5EcWxpUmtP?=
 =?utf-8?B?N2FVdEwvRzdneU5jRHVVenMvcnR2dE1CeTRhcG9mdHlGS1dlVEExQ1FkcFp1?=
 =?utf-8?B?UWg4anZXdEdJQTBzWks2eWNLcGt2THUweDYwR1J6aGxmOFd2NmQxclpXVElQ?=
 =?utf-8?B?cnZkV21sMXNJKzRuY1duM05NeUJ2ZVB1WWtZbHJaWktBUHhPZGtmaVB5WmVJ?=
 =?utf-8?B?bFlQaEJ4K2UrSFB0MGNKTEZEOTk3VUgwbHU0cmMzalltSkNGdnNlUm1uVVA1?=
 =?utf-8?B?R09obXJFNWZ5c1doMVNmMGI4WmExeHFycjJTRldNREpYMFlNNFF5d2pJY0Rm?=
 =?utf-8?B?VkRJWHR2R0Rwc1V6VDZNOTlidTIwcytnR3JFUEFrQ1IxdEljV010WnVRcFIv?=
 =?utf-8?B?UnpZRStqcWxSSzNxTFZRNXBsZnFuelNYdjF3YVNjRVlQbmNOWk5wR0U2QWU3?=
 =?utf-8?B?N3NRTWlOcnZSMDZYVkwrSGsyMlpBZG9ySEF1dG5tUVFTdjlIY1Z2OWRxRFJX?=
 =?utf-8?B?REl5UEJIWlNTS2FTYzRCeTVodUk1Yk1jNWc4MHh3c0ZUWndSZGp0bURrZlUx?=
 =?utf-8?B?K2RDUjdxQmMvOXYzeXBHYTlNTE1xdnc2TjgxbVNZSmQxNFg1dStqclZYUmpY?=
 =?utf-8?B?TkhSVGJ0SWZsWkFqVHlYczR1cUpVbk5rMjROTUJNSk95UXYvcjlWS1k0VlUz?=
 =?utf-8?B?SUl6cWVqc2NvUHp4Wlg1MUtNOTc3eFBkNm9PL3crSldmL0o5a1M0aWp6U2R4?=
 =?utf-8?B?ZnByMUI4Z3ZhMWpoSy96ZnRuYlA2OHk5UWRnc0w1NXFqNVkwVUNXb2VGYnV2?=
 =?utf-8?B?NjEwTW5tUDlLaC82TDdQZkRiMUkxNzZDZ2tLZ1VxNkxLLzNTeHJvMjhJK0VB?=
 =?utf-8?B?ZVBXN2ZxbndYa0dQbDR6Z3BVSCtDK1Jkamp5bjdkYWVqY2NiR2FGVk1LaDBt?=
 =?utf-8?B?TGY0NmxrVkxOVWE2ckxuSDhFN3NsTzkrTXlvbGhFNE5pWEZJNk5HU0I0S1Jv?=
 =?utf-8?B?dDRBUnRUSUdzcHdDTS83QXAwYTBrbmtDZTAxMitBcXZqeWlWaDJaNUY4Wm9W?=
 =?utf-8?B?bGd1d0UyMVdjcE54U1FsdzVkcm5KZkw1eGExQlE2bVhSQnk5akV3bHdKc0JU?=
 =?utf-8?B?MUdMSUJxR3plWDdyc0Ixdm5IQzJ2MUVDU3Nrcmg2Vk9DVGd3eG5ncCtKZndN?=
 =?utf-8?B?N3BuZi9HazNtRGJLRm5sakVBU0JSSmJHYytJb3pmdlZQY1lzZDNzSXdVV2R5?=
 =?utf-8?B?QkJlSFJ0MzdHeWVrY3hpQ3FuQ21zaHRUSTl4VFRzMkpLL3hFSlNNSnQ5RHdU?=
 =?utf-8?B?aGphQjQ0OXlBMVNvVWxBMHdTdU8yODJoSXdEZDVyVDNTb3V0dVQ0THppV0Vs?=
 =?utf-8?B?L0kzMVRDUzV0SlQxdStIRkN3RmNiU2dSM0Vsd2RVY1R4SEZHUkZ2NEd4T1Bj?=
 =?utf-8?B?ZVVxWklWUDN4ZFBuUVBnOVVRNEptenZTK3FiNHBuRHhwejlxaW9EY3FHQ0I5?=
 =?utf-8?B?aVAra3BWQTJ6V01CbUVkTWJ3d3gvdWlPb2t5QUVWZ3VrQm5sNFRFMnI1aTJt?=
 =?utf-8?B?a285OHdSVzVFaVkxeGxyemdtOEJXWTdFa2JRZlo5Mi90WW1maDdOdjRyMXo4?=
 =?utf-8?B?eTVJaXRWZm14VjVjS3ZyME1oWWc1MFVFL0xBQzc4WmhnWEUrYkRPNlowMjB4?=
 =?utf-8?B?bUJZWXVDQ0gvclgvK1FSWTE5ZERLbW5KK2d5d2NQQ2JtMFNoQnNqaGNlSk1a?=
 =?utf-8?Q?+As1CIgfBvGwHpvlfCrhM8sWJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca5fe4e-40c2-4373-9b76-08dd4f692b31
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 15:38:47.3292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+eO5zvqeyrWmEAxFmWMHztAikTR8R4q3HdQ6ebgGaVPxhK9R5gH7V4vwlAwMn4bn335anPRas+SRiGIlGvHPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6455

On 2/17/2025 02:17, Shyam Sundar S K wrote:
> Enhance code readability by fixing line break and blank line
> inconsistencies.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 742920530987..d80a5b899a1d 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -168,7 +168,6 @@ static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table
>   {
>   	if (!pdev->smu_virt_addr) {
>   		int ret = amd_pmc_setup_smu_logging(pdev);
> -
>   		if (ret)

Does checkpatch like this?

I thought it has checks explicitly for
"Missing a blank line after declarations"

>   			return ret;
>   	}
> @@ -222,7 +221,6 @@ static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *at
>   
>   	if (!dev->major) {
>   		int rc = amd_pmc_get_smu_version(dev);
> -
>   		if (rc)
>   			return rc;
>   	}
> @@ -236,7 +234,6 @@ static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
>   
>   	if (!dev->major) {
>   		int rc = amd_pmc_get_smu_version(dev);
> -
>   		if (rc)
>   			return rc;
>   	}
> @@ -704,7 +701,6 @@ static int amd_pmc_suspend_handler(struct device *dev)
>   	 */
>   	if (pdev->disable_8042_wakeup && !disable_workarounds) {
>   		int rc = amd_pmc_wa_irq1(pdev);
> -
>   		if (rc) {
>   			dev_err(pdev->dev, "failed to adjust keyboard wakeup: %d\n", rc);
>   			return rc;
> @@ -743,7 +739,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	u32 val;
>   
>   	dev->dev = &pdev->dev;
> -
>   	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>   	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
>   		err = -ENODEV;
> @@ -751,7 +746,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	}
>   
>   	dev->cpu_id = rdev->device;
> -
>   	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
>   		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
>   		err = -ENODEV;
> @@ -767,7 +761,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	}
>   
>   	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
> -
>   	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_HI, &val);
>   	if (err) {
>   		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_HI);

