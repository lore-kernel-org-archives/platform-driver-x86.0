Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748101804E
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729696466; cv=fail; b=mjUSjnnop38iID+e57VDi35KxUPT4jH6qmDxrqm4E2UjbrqLRsXw9hHboMKfmwPwFgpTyJ2v6GLn5RlQcljRZRDGPNUPxRUi953pS/CePccaiVr2XePaKkESB6tVZRM3+FZ9tg0psBkuT0EVjKRd0SY77U++4+zomCyPJjY5HW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729696466; c=relaxed/simple;
	bh=v0ZXyKZFZDVZlU7+swjZSfZTA0LxJjFCXnVZ4DUDdaU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z3yk15GWRidYxDun/zj/YzalEEAFwfDmAjesTENBEox/t7eFMYdxSRGaf1pfE5EEQtSnwYTQg4q9gO8uwhq0Jbanke3ajeToLInfX0SN8qSfDwIOMsB7D3B+r0ksbwlqMD3z6tFKq2kUFjkci1DZCm6RyXJ5sHucp3OxLcaOmKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ur1Z4q0/; arc=fail smtp.client-ip=40.107.95.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ur1Z4q0/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RewYcVPEYKpPGA07IY4/cna+gCc+iZtkVIDQE0ErVJndEqWqTYz2lU+s6iS3gz4QbwIfuUuAU7RrZ8z3WMJIc+EKtKVAGZ9bGUU/ow0JQaI6noCTxjwKhnJh00OPAMZIu5USuV/I7Fhg8WE7YgTpnMNt+47DzYicAFzv6NsnstMtxhEO54z5T3se8rSPC3URlrlEubzF1ZSRG3yVzdazOffg6GkaoYHG2AOziAlGP2/flHlchs1z6AEqsL7RnN1hHRCuJb866c9dQ9U4fSNseITIobL/irnSXeMfPDe9unuWZ0wZ4YkETtiYNrKPBzT8oSUl9BwupjvAbutYGaEISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gRtsp9lM6s9wzexBv0BbPz7WiM01YLNN14ZB0466a4=;
 b=dDTwtf5p9/6HD1t/DjL3BzFK2aKwWcs0Hn8M8I3cMv9Zu3ZyKXCu77dZYyuDXWEQkkI7E/1bBVBQXbb6JdhChpj3cfcpXO92WYNfFLHZvgXiDFrV61QM1tqHb+z2n/PV14VGHCgln5tsEqoUFPisxnTwba8MS6TZWdepZ2hJYIy+zVr67LRV0MB98S5CMGh7+N79Xnyri5Yciv0qCFShXHEOhM3JqAzTgLvIKQhD+F9Y/Zp/qwdzBC9JOD5KmnY3TRO773MQ2dRPbXOCTiqjn+4pmH3EsUOFgVH/GhzNp1F4TyJUNBKwt5KfGWbvCgkX3E+Bko/iAyiTDqiLeAUFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gRtsp9lM6s9wzexBv0BbPz7WiM01YLNN14ZB0466a4=;
 b=Ur1Z4q0/gGrMIplyG5gfPUSO+Q8FRmsWj6Y8CR+3+lhzc+7SJkGaRjchEI5mol6Aj3vsgb8N54k8K3JUhwPCTl8CNGGg4LJOhUmtl8QyWtcvdi+xdlWDNG85k2HDM8O7Jjl7OZ5HOrsYX7aOZh1JJXNm9qSottdgfmP4zyfqSQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB6776.namprd12.prod.outlook.com (2603:10b6:806:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 15:14:21 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 15:14:21 +0000
Message-ID: <76c7df3c-1db2-4eb7-8156-4f13a3694168@amd.com>
Date: Wed, 23 Oct 2024 20:44:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] platform/x86/amd/pmf: Switch to
 platform_get_resource() and devm_ioremap_resource()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-5-Shyam-sundar.S-k@amd.com>
 <e4163be3-1b42-4d28-b025-91734e9bff5c@amd.com>
 <b58cf10b-e3de-489f-b5b9-fa0daa407d7b@amd.com>
 <a039c086-b733-4af7-b031-8c19cafdccb1@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <a039c086-b733-4af7-b031-8c19cafdccb1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3aa323-acc6-429f-59eb-08dcf3755ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVJCZ0E2QmxKOFRBRDJGUlBWbHpWTVBTblRGaG5oRmJlQ0pSeUxycW9CSFRB?=
 =?utf-8?B?QWpXQUpvVVlNTTVGQytOWHVoa1N0U1J3TzloNDMyNEg1WWQyVzFVMHFiL3ZE?=
 =?utf-8?B?aEpsdFdMT1JkRU40UkVYU3F6SkVzNmg0ZkVIL0JHeGdBTURzOXhIdktMdmMy?=
 =?utf-8?B?SU0wWlh5NHR5UGVXTWIvaFdXZWxxdERZbDNRWFh2dnVmTlFQMU5ScVIwWWkr?=
 =?utf-8?B?bnRiNlY2Qlgva09EQjg0ZFMrZlNlekg5MTRDNnlsUlJ1eVkwYVpFaXFtTzlO?=
 =?utf-8?B?ZmpraXUxV3pSdWsxdTZJNjJydzBRRlNMS1dEVmhBN1E4bUxBTmdXdC9FZ3I5?=
 =?utf-8?B?b0k2Y1pKNllyUU1KZDdkdkgrdUxBYmR2NFVMMGE1d1NVRHBPMEJDMk9hcVpq?=
 =?utf-8?B?WStHNFBEeEFUMEdqdkhRakxmajhnWEZEd3lDbytmWE4rOFZJd0hFSHY5RTlJ?=
 =?utf-8?B?NzZuNjlmeTNmT0dFVWJWYTdVMEQ2RzRQWnA1QXhyaUw4YmFNWUVHMm9Ub2Yz?=
 =?utf-8?B?a2wySktycHpiVWE3MXhldklpaW44cFJ1VWV4Q2pJVFJjNGZkbkdFbjhvbTFs?=
 =?utf-8?B?RXJFemNBZmswajFFSzBNSzFrQXd0MzJXM0UyU3krOHZPSzJkNWZoZmFCTHFS?=
 =?utf-8?B?QUhKYWRlNWNxekh4MElmRkkxTVYxU0JhVEJwRWo4V2hOZEFlMVFnVDFaVVda?=
 =?utf-8?B?dGRoVjJEQnlPNEZaYWpBOEtKSG9ZVW1aZUZYT3lSQXhTVzhzSTVGSUQ1aXJZ?=
 =?utf-8?B?TVVLaC9WUUM2R1JDWS9YSytLa005WE1iSExFQzN6R0UzWGdLdTJHS25oL0JG?=
 =?utf-8?B?STNqdVRNUFdUYklUVFg4WW1LR0ZrK0JGTnBZa2RTblZPT21WellLTG8raVFJ?=
 =?utf-8?B?K1pCVHcydE9TR2tpdnZFYm83Q3lSSnZtMUxTL0xwaWUxQ1JVSnRmbnZnaisw?=
 =?utf-8?B?QXRGOVRJaERpVWtkSDY4ek91VmRQbldjOWRJVDUwbkF2dVN2SDY3aXZzQno5?=
 =?utf-8?B?aU5sdFVUQVNzU2NhZDFJNkxhZXphUWlKckUxeERsb3UvYzgwVFR6T0JyeU9V?=
 =?utf-8?B?RkkzODBxakJ1enVxT2tZbVFYQVJ1TlNJVHJlUGpWc2ZsS2JCWTJPc0lyZlZ4?=
 =?utf-8?B?cG0rdW5BL0MzeXkxdkJjUE9CT0lXc2s4NHBDRnRNbDF2Q29RUFh5YU00V3NM?=
 =?utf-8?B?WkdxOWpwM21KdStNUXZ5aXAyOHpieDB0c3ZsTmxyTm80ZVZzYXAvRkErZjN0?=
 =?utf-8?B?eG1RV1c1djFZVFZhaUUxVXhra3Q2TTIzUGNBNFVUY3VkcXNOekltYkhvb2NS?=
 =?utf-8?B?VEkzNmlwdmNOeWpRL2NUWSs5VlhhdkJFcFpjZE1WeUw0emU1Y1Bxay92b3hW?=
 =?utf-8?B?SERkWDdCQUxGN2Z0aXE0RTM0aU5NMlhaSEV2TlBhUldpR243WDcxMHFDZFlu?=
 =?utf-8?B?czRzTGkvQU42NzdXMG5nR09Ga1ZQaWVPUGVKM0dkK1pjbnZrQlJPSnRCVWRZ?=
 =?utf-8?B?U1l5cG84RmtFTTlGdnYvS1AzdFl2UVovVHpqUUtFckRHVVhFNEpESDZVL2VY?=
 =?utf-8?B?UnUxSlp2dTJjWWpsdWkxSHNQellZS1pGdk4vb0F1NkFkZVAvRTQ4WnllRVJ0?=
 =?utf-8?B?YkdaVW9tZTdZcDRXTGpFVlZDeWUvUkpCRDdpaTl5MTYvb1JqaVVrd0lGZGM5?=
 =?utf-8?B?T3pLc2F5aWlWY1Vqd1Z6STFZb2lGYVFKQnVCM1hqQW40eEFLLzh5L0xkODEv?=
 =?utf-8?Q?q27Mam2REMxhFjDA06R0yse7h2toT7lIRJ+iAQU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2wxNFV1M1RrTTh2cFhpencyWnpuVVRiWEpXME5YZnRyWXdHTCswRVhhQk9t?=
 =?utf-8?B?cDIrSzFsU1V6ZlVSa3pCTjdzcXYxQnJvSXFtVnNwMTBCNkN2TEdtMDRVMDAy?=
 =?utf-8?B?Z2NtNDFTWkY2bjliQnZ4S2JLWjh5YTdZdDN0U2RyckFPSEJQdE9yb3hOenBZ?=
 =?utf-8?B?cDgvR09hMnVNWlZqemJKSC9DcHVmbWlPZ3NGbmtyQy81dm9RSXNBcWxnOS9m?=
 =?utf-8?B?RlIvclpYNWkyVWRWTUdxdVFLc0ZrcnQ3MGtuSGJSejZ6UTNsUXJxOXh6OHlq?=
 =?utf-8?B?ak5hYklNSzBYa09VaWxiUGdib3M2ODN3UWxIc0M3UWJQWjZqUXc2emdDc25k?=
 =?utf-8?B?K24vcmJHUmJsZUtYK0pTREg2SjdzeFN3Y1h5TW1tU3lTVTJ3RVVKV2NrMHRa?=
 =?utf-8?B?MDJtcUlGTnRaR29kV1V5R3dETm5Ta3RNcXFkZHpDMFhpc1V5QzlWdWY2VlZw?=
 =?utf-8?B?YWFKWVhuMFVkR1ZpanQ0Rnk0RlFrMVNDVkFQV2tXbUFZMzlHTHpsam5CNDJn?=
 =?utf-8?B?WkZDQlRVZjJGV2VVL0dRN204T0hycDNDTHdZZU9hYlpndThnWVBQeExYYVp0?=
 =?utf-8?B?Q1lrS1I2OVp0TEo5NlFlUk05TlhhVXdvZVpNVGhlZER4RWRpMy9uWTVXRkVk?=
 =?utf-8?B?cHdJT0FSNnJSM2hBUmNmMkZka20yS0MyVFU3NndIdnFhMTNvTHpLRXJ2eWRC?=
 =?utf-8?B?RjNwNmUvTTROU1hiY3lvczB2RVR6YzByQnM4d29tbEZiMkxRc0Z6a29JNDVS?=
 =?utf-8?B?ejQvU2xid3hKdjN1ZWUrSGhXUW9saWZHaWdkMUJSUktJeHJZenk0VXdPTUE4?=
 =?utf-8?B?SGF6UkpZZURNZXUrajJoU0dFQW15bEhrU2hHUEJCcmN0MEp4a2h3TlBIZ0dq?=
 =?utf-8?B?cWg0MExqVm52dEtIRXY4RHVFVmdOMzI0aWkxdDZZL3lCVDc0L2RDSmJVQ3Q5?=
 =?utf-8?B?RUVGMTlQTW9KeTlwdE1TdW5TdE9adURTY3NJbk51Yk9DT0lzdHhBSVh0OCs5?=
 =?utf-8?B?Ty9RVnBmZlpLcTZsU2FpT09URXNJUW91V3FKT2lxUTZsWkRMdS9BYVVVVEc5?=
 =?utf-8?B?M2ZwamdXU1Z1N09iSU1ablorZytFU2ozYUx3Q1hPUVVVVUJXS2FhUHdNdnBX?=
 =?utf-8?B?MDNVdGNIQmZYNHlTUWFJa1ZaSncrQXkyR3IySHBqVXh6by9MclR5aW1NR0kr?=
 =?utf-8?B?ZXBlSUFHRWlXQUdJOHdMNmtMZ0Z0UWpiQ3pIVFloN0ZwTDJxb3hxTlhDQnhG?=
 =?utf-8?B?TWtsVGUrSFJrWGJ3VmpnNkNBQ0JlMmV6WkpjZU9NaDhoQy9LWnNHWVVyS2NI?=
 =?utf-8?B?WDVxakZEV0xGLzlSUWQrMktJNGowN2JqYm9mT0g4cFNRbGVHK0xrWWNvRVQz?=
 =?utf-8?B?bFQxSERSYXVPaFNNbXZRQlk0OWd5UURlbktxY2kxM1UvQW5jV1lSSkkxR0dm?=
 =?utf-8?B?cWdtb2ZWQXZuaGdLRnRzaFB6VW1PdzNjNjBNU1czZ1RZektQdEhUNmVYOUR2?=
 =?utf-8?B?ZVBUQjVxYVZ1N0EwY2gxcDdkSllKNnEzWE1sT2l0WjkreTI4WXA3MnpMejhy?=
 =?utf-8?B?UllmN3lGWVJZRk1sc3JZT1VFbVNMeUdqYWF4Y3Era2ZHRThacmRsUHZIVXp5?=
 =?utf-8?B?K0YrcERWaUloR01wdGZaYnBNTTBZZEV5NmluckdLQnBtbTY1NGJ2Uzc0aURl?=
 =?utf-8?B?VnFZRUxVM25oQmVvKzRrbnZ1TnNMSmhNYStsdzJGaCszR1hKclBFSXhMbjhH?=
 =?utf-8?B?c2tKb2JIQUJXRkVaeG1uWStFUmRVS3MyVWNiS3FuQmI0RnRyeVNhN09YTzZ3?=
 =?utf-8?B?OUIrQUp6Z2c0RjFmNzVodktmQkUzbnZ2YTdsRUxZQ05oblVHOHZYMUpLeVQ3?=
 =?utf-8?B?OGJWMFd3NlNzMUNhdDlZTDFPMEdrdjJLSXB1RW0yM25EcmVSWGRNWHJTWXky?=
 =?utf-8?B?bmpZWit4OGk1ZnNVOEpJclN6ZWVReEFneWZzQ2tIWGZYSlY5Y01FVDZjejd2?=
 =?utf-8?B?bUIyM3ZjLzdFL2liOGx5ZjM2S2JxWnlHenB6OU8zckJITTJqNXNpcDI3djhU?=
 =?utf-8?B?OXR4NUI3QStJdXJJbDU5cC8zWWRzbmF5OHR1SFZ2Nk1BSEJhZjRxT1hOc0xG?=
 =?utf-8?Q?YB9id6DkRjcD1hAnLrTrWlUt7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3aa323-acc6-429f-59eb-08dcf3755ec5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 15:14:20.9678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxOJFW/JrPnIQRj0XUbttXA+EIpAiUwwZl3rb7ZeOd6sSllUj3TFXl922sNkZ50nexrD8Qsh3s48HZPf3VZvOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6776



On 10/23/2024 20:20, Mario Limonciello wrote:
> On 10/23/2024 09:37, Shyam Sundar S K wrote:
>>
>>
>> On 10/23/2024 19:35, Mario Limonciello wrote:
>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>> Use platform_get_resource() to fetch the memory resource instead of
>>>> acpi_walk_resources() and devm_ioremap_resource() for mapping the
>>>> resources.
>>>>
>>>> PS: We cannot use resource_size() here because it adds an extra byte
>>>> to round
>>>> off the size. In the case of PMF ResourceTemplate(), this rounding is
>>>> already handled within the _CRS. Using resource_size() would
>>>> increase the
>>>> resource size by 1, causing a mismatch with the length field and
>>>> leading
>>>> to issues. Therefore, simply use end-start of the ACPI resource to
>>>> obtain
>>>> the actual length.
>>>>
>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>    drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>>>>    drivers/platform/x86/amd/pmf/acpi.c   | 46
>>>> +++++++++++----------------
>>>>    drivers/platform/x86/amd/pmf/pmf.h    |  6 ++--
>>>>    drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
>>>>    4 files changed, 28 insertions(+), 33 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>>> index f4fa8bd8bda8..99d67cdbd91e 100644
>>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>>> @@ -11,6 +11,7 @@ config AMD_PMF
>>>>        select ACPI_PLATFORM_PROFILE
>>>>        depends on TEE && AMDTEE
>>>>        depends on AMD_SFH_HID
>>>> +    depends on HAS_IOMEM
>>>>        help
>>>>          This driver provides support for the AMD Platform Management
>>>> Framework.
>>>>          The goal is to enhance end user experience by making AMD PCs
>>>> smarter,
>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c
>>>> b/drivers/platform/x86/amd/pmf/acpi.c
>>>> index d5b496433d69..62f984fe40c6 100644
>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>> @@ -433,37 +433,29 @@ int apmf_install_handler(struct amd_pmf_dev
>>>> *pmf_dev)
>>>>        return 0;
>>>>    }
>>>>    -static acpi_status apmf_walk_resources(struct acpi_resource *res,
>>>> void *data)
>>>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>>>    {
>>>> -    struct amd_pmf_dev *dev = data;
>>>> +    struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>>>>    -    switch (res->type) {
>>>> -    case ACPI_RESOURCE_TYPE_ADDRESS64:
>>>> -        dev->policy_addr = res->data.address64.address.minimum;
>>>> -        dev->policy_sz = res->data.address64.address.address_length;
>>>> -        break;
>>>> -    case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>>>> -        dev->policy_addr = res->data.fixed_memory32.address;
>>>> -        dev->policy_sz = res->data.fixed_memory32.address_length;
>>>> -        break;
>>>> -    }
>>>> -
>>>> -    if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ ||
>>>> dev->policy_sz == 0) {
>>>> -        pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>>>> -        return AE_ERROR;
>>>> +    pmf_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> +    if (!pmf_dev->res) {
>>>> +        dev_err(pmf_dev->dev, "Failed to get I/O memory
>>>> resource\n");
>>
>> here        ^^^^^^^
>>
>>>> +        return -EINVAL;
>>>>        }
>>>>    -    return AE_OK;
>>>> -}
>>>> -
>>>> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>>> -{
>>>> -    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>>> -    acpi_status status;
>>>> -
>>>> -    status = acpi_walk_resources(ahandle, METHOD_NAME__CRS,
>>>> apmf_walk_resources, pmf_dev);
>>>> -    if (ACPI_FAILURE(status)) {
>>>> -        dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n",
>>>> status);
>>>> +    pmf_dev->policy_addr = pmf_dev->res->start;
>>>> +    /*
>>>> +     * We cannot use resource_size() here because it adds an extra
>>>> byte to round off the size.
>>>> +     * In the case of PMF ResourceTemplate(), this rounding is
>>>> already handled within the _CRS.
>>>> +     * Using resource_size() would increase the resource size by 1,
>>>> causing a mismatch with the
>>>> +     * length field and leading to issues. Therefore, simply use
>>>> end-start of the ACPI resource
>>>> +     * to obtain the actual length.
>>>> +     */
>>>> +    pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
>>>> +
>>>> +    if (!pmf_dev->policy_addr || pmf_dev->policy_sz >
>>>> POLICY_BUF_MAX_SZ ||
>>>> +        pmf_dev->policy_sz == 0) {
>>>> +        dev_err(pmf_dev->dev, "Incorrect policy params, possibly a
>>>> SBIOS bug\n");
>>>
>>> This upgrades the previous message from debug to error.
>>
>> It is dev_err() even before this change.
>>
>>>
>>> TL;DR I feel this error should stay as dev_dbg() if no function checks
>>> are present for Smart PC.
>>>
>>> I don't think it's necessarily an error though.
>>> Smart PC checks are a bit different than the other checks.  There
>>> isn't a check for a bit being set to indicate the function is
>>> supported.
>>>
>>> So if the BIOS has the declaration for the region but it's not
>>> populated it might not have a Smart PC policy and this shouldn't be
>>> reported as a BIOS bug.
>>
>> This should be included in the CPM package, and the BIOS team is
>> responsible for packaging a policy binary.
>>
>>  From a driver design standpoint, the absence of the policy binary
>> should be treated as an error, as there's no reason for the BIOS to
>> advertise the Smart PC bits without providing the policy binary.
>>
>> Therefore, this should trigger a `dev_err()` and be considered a
>> BIOS bug.
>>
> 
> OK I agree with this specific error, but I took a closer look at the
> bug associated with
> 03cea821b82cb ("platform/x86/amd: pmf: Decrease error message to debug")

ah! but your comment was just inline to:

dev_err(pmf_dev->dev, "Incorrect policy params, possibly a SBIOS bug\n");

So, I was thinking you are saying to downgrade this to dev_dbg() and
hence the above clarification.

if the comment is for:
dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");

then Yes, I agree we should have dev_dbg() and I will respin a new
version.

Thanks,
Shyam


> 
> As _CRS is patched out by BIOS I suspect that system will now start
> showing:
> 
> dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
> 
> So how exactly is a platform designer supposed to not advertise smart
> PC bits?  It seems the only check is the presence of that resource.
> 
>> Thanks,
>> Shyam
>>
>>>
>>>>            return -EINVAL;
>>>>        }
>>>>    diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>>> index 8ce8816da9c1..a79808fda1d8 100644
>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>> @@ -13,6 +13,7 @@
>>>>      #include <linux/acpi.h>
>>>>    #include <linux/input.h>
>>>> +#include <linux/platform_device.h>
>>>>    #include <linux/platform_profile.h>
>>>>      #define POLICY_BUF_MAX_SZ        0x4b000
>>>> @@ -355,19 +356,20 @@ struct amd_pmf_dev {
>>>>        /* Smart PC solution builder */
>>>>        struct dentry *esbin;
>>>>        unsigned char *policy_buf;
>>>> -    u32 policy_sz;
>>>> +    resource_size_t policy_sz;
>>>>        struct tee_context *tee_ctx;
>>>>        struct tee_shm *fw_shm_pool;
>>>>        u32 session_id;
>>>>        void *shbuf;
>>>>        struct delayed_work pb_work;
>>>>        struct pmf_action_table *prev_data;
>>>> -    u64 policy_addr;
>>>> +    resource_size_t policy_addr;
>>>>        void __iomem *policy_base;
>>>>        bool smart_pc_enabled;
>>>>        u16 pmf_if_version;
>>>>        struct input_dev *pmf_idev;
>>>>        size_t mtable_size;
>>>> +    struct resource *res;
>>>>    };
>>>>      struct apmf_sps_prop_granular_v2 {
>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> index 19c27b6e4666..555b8d6314e0 100644
>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> @@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct
>>>> amd_pmf_dev *dev)
>>>>            return -ENODEV;
>>>>        }
>>>>    -    dev_dbg(dev->dev, "Policy Binary size: %u bytes\n",
>>>> dev->policy_sz);
>>>> +    dev_dbg(dev->dev, "Policy Binary size: %llu bytes\n",
>>>> dev->policy_sz);
>>>>        memset(dev->shbuf, 0, dev->policy_sz);
>>>>        ta_sm = dev->shbuf;
>>>>        in = &ta_sm->pmf_input.init_table;
>>>> @@ -512,9 +512,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev
>>>> *dev)
>>>>        if (ret)
>>>>            goto error;
>>>>    -    dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr,
>>>> dev->policy_sz);
>>>> -    if (!dev->policy_base) {
>>>> -        ret = -ENOMEM;
>>>> +    dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
>>>> +    if (IS_ERR(dev->policy_base)) {
>>>> +        ret = PTR_ERR(dev->policy_base);
>>>>            goto error;
>>>>        }
>>>>    
>>>
> 
