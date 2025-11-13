Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20C32939A
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763019462; cv=fail; b=JSGmErRwm+Dpu+/jVK94Oqbqf7sych4yrDv65+W9pOlgXN4UYQQxsgiBuD0hdMSMlse1aYLbuHOmQ04UcM/ST/BPyu6kbIABbYyYddEvmwlXB6JEwRu9LntqkzPTIWSj6489wakVRrkxPYXisbmDEOEcrzGTsiszZP+IB9Po1KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763019462; c=relaxed/simple;
	bh=fjVUxfHOq1hH3o7wC0s4zHtb8s6lpa09dUZicD4a6tk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kJjjIy3i8aWig+ZVMfm/bsusHFDpq4aogRRQADVCY8tXSvlqRT4EgjtOxNTq7iwQJgv6Ep6pomMeefLDk7TlKWE2A758VVpT7l7QRXA/fGwq4qZqGbBkpQEfMIh5pV4M3qUZH0pIAJCk2cPzlfcOBlm//1/nOrlfBQ6ZHTaY7Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4tmrvM+q; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4tmrvM+q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyDfAqxsqWHFifhUHPCqSThMU4Akj8cHPjD7V6smRZWiwtzLyIY8isBXvPtN0nmAx1VOrC3aGZrf+Yyp2r2jGPMndImaIVbcbguIQETzPlJoKIZZex8BNR2WpQwTF1SmqT6IdxChVnJERxLWyBaILttMIj3kqHYHrPjIq3mMlTwLHssJvP6HoqH9Yg1vKva79plAmN9gZrWsRwtS9G3pQO6nrSKkqFTc9tBFJ/bUIadjUR4jCLot/R5Ww21rzIbFPaozAOi6wvhvr2ZHOqb9rqPTbgrFwpSxqpqBBlS0I3vqXMcxMjSYox5Wy0JaxWFAi+1x0O+OE1vbqdOw6DrqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXjyUmQxz2xH7yJkZzuWKistYkBvDlAGyznaHlBkwDg=;
 b=JIkiFcswRPMXQ4knA8YHOq3cDKjfwD3PtYZRjPEL9lCsgbHqU//Tu8mweYX414HA3tgGZ6U3+m84Gj1Se8Eq9s5dQX88JLrmivCQHc1b7UhmjvVet8dCsGgtz0tawGRlIRF2sAoHHirG5oS6+ySFw2jj22I5mKPee8cewXiZR8igBhCUqwN6PUa1atXX+pevlh0xcOJqAcxE/N3g6nWXjKWqmwT7+Eklv7mK82fkp2+bvdeqopPYJpkW940tfGmCShT2NW/fDixLJqwHTNUn6ivz2v4Bd3qwztUcj/2Y/6meK9M93U9mC5EhscbnckCzV4HGQAGmPdT4bfFNjQDtow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXjyUmQxz2xH7yJkZzuWKistYkBvDlAGyznaHlBkwDg=;
 b=4tmrvM+qm+2hao3T8dXPLoE64bxWooVHoBhNjBFaOUCSizTeTOIFfdvTEQtMDKtIeQaXFBa4HXEDZnp8dM3Ya+65SL2I2RMprIs62XRkvUP1qe8C+5d2b58hqBZWPpaDfqV7CzeTzZrSghVAKWd5LcyLAPSeHQeu6FUrH9X5uV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 13 Nov
 2025 07:37:28 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:37:28 +0000
Message-ID: <fe736663-0d7a-49da-ba8b-c4a5df8fb38e@amd.com>
Date: Thu, 13 Nov 2025 13:07:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PMF NPU metrics cleanup, command flag cleanup, and
 amdxdna integration
To: Mario Limonciello <mario.limonciello@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 lizhi.hou@amd.com
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
 <e451a128-cd81-4ec9-909a-47b960f3946c@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <e451a128-cd81-4ec9-909a-47b960f3946c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: e33f8e24-2db1-474a-f2f7-08de22877f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHNRTkhzZnppSXBUVEZHRllmaTB0MStJejNHWTU2UytKTDV6SStwcXNGQVRI?=
 =?utf-8?B?OUNiZHE4RUFpaXl4b2JMOVJjZ0tUQVV1NUZXalJZMzgzNlo5RDhSUlVlOGQ4?=
 =?utf-8?B?Y3B6a1B5UllNUGl6Qm9yY0dDRUJuZkJYUythVWFSdy9DanZ5RzNicER1cUVY?=
 =?utf-8?B?UEc4VEN5dmFqNTJubDA5ZVFRY2x2enNxWDhqcHJpWjd3ckNQQS9qcnVTcitq?=
 =?utf-8?B?Q1VJTjZqSWgrcU00MmRuQUVrSnZBbVV2MkJHdC9oZFQ1MUlnaUVINDIrYzJu?=
 =?utf-8?B?eVdSbzJmQlZsaGwzVHpHb1ZDZ0EyYWduNmp2VWMxRnBEWm5HcWNCaUpTRCtN?=
 =?utf-8?B?VldibEQwaU00SWpHL0pmcmVaOVptVEZENkRPTGFsRSt6cHY5V3p5UXVWbk00?=
 =?utf-8?B?ZkJRWm10NGRXaU5nc0tzK1BUWjIwWFl4REZMcW1iZVpoaGM0bGFrT01ieU81?=
 =?utf-8?B?VEVpbUU2My9JbGJEUzg4Qnp6MkhieUkyN2owOE9ZRXNza1RDS2hlbk1oRER5?=
 =?utf-8?B?d0Q4NW5GdFd6Z1docHJLaGpWWmF6RVlMNyt2QytkZDdjSjRzZU1DdlBOUFlO?=
 =?utf-8?B?ZFQ3YkxyZEpYRzVSMVFKWmliaGdxQm5paWtUMDA5ZjhsdnVObi9tSVdNOHl2?=
 =?utf-8?B?dUdKa29ZS2gzaEZJRnUwdlh4cGlyeG0xbGgxYnc1RWFiaDk5ZFFYaFJVb2E0?=
 =?utf-8?B?dVNobGc2eEpSWTYrTHZmSEZJemJaS3hnMEFSUUI4RXJhdzU5YklycU9pcFdY?=
 =?utf-8?B?ZXBsV2xaZ1NEYnE0cGRKcnc2S0x5SiswSUl4enhSM2Y5RjFVei9QaEZGN3pM?=
 =?utf-8?B?VDQyZ1VHemhjU2dPWC9hRG9FMXkvMUZNQ1lESm5rQ20zR0JOcnlmYVAwQzZ6?=
 =?utf-8?B?Z1orSWZwLzMyWFVWa2haUHVHbEYzdWJFRElBdnVIZk8waGg0cmtYNW9KRUVG?=
 =?utf-8?B?TDlibXdlSnR6TzNsUmkxMFloWEl5Z1ByQ1J4bGJtNXVhVk5ocm9nWmRGOWdr?=
 =?utf-8?B?VnRkU2tabUFzdlRtRlhxMDNuTllua0c3UlNTbnRXU3ZWVXNxYUd1NlRiT25N?=
 =?utf-8?B?dng0TlJGZnJZSWpydmpTMUswbVJ0b2tRUnJvMjQxQXQxZzB1T0ZXMVBQNGdm?=
 =?utf-8?B?MFVWQjJLMFRqMTV4OG9zTmgyc0lmTXoza3BSa3pWYTgzQmxoQUlVYnZsR2Nr?=
 =?utf-8?B?enhIVEhRN1lGbVowTnlwVEdnVldnTDlLQ1FxNjFXSExlazNjcDdTS1VTZkVy?=
 =?utf-8?B?WEFnMjVjQ2h1ekxMbWd0VDgvUTQ5T2hMR21VR2M0TmtZKytRS3hWVzNtVmNR?=
 =?utf-8?B?TVk0eEdsdjY3MitPem54bUgxZ01tWVplTE5neUVrUkp6a0xBY0NLSnMwSTR3?=
 =?utf-8?B?cHoxd1VSN3cwa0E3N0hvTUVwaGZqQUNVOEhlVnJ0UWVRQmVkRUJDQmRLSkNI?=
 =?utf-8?B?aVB4Y1NKTHlRemFPU2VsNTZZTEFJLzhjYTVrdjZOdkFnYzJORzhCWlBjOThx?=
 =?utf-8?B?V3ZvN0ovK0pjSWFoZEowRHJKWDBld3EwdlBDZ0NFR1Nkck1BU3Jxak5uOWxB?=
 =?utf-8?B?d1hLRytsbWo2RU4zaUNCbU1MeEhMRHpvaGowb1hSSnNPV0hRQXIyYzA5UlNy?=
 =?utf-8?B?azFCaEZRYVlPMm10QnZndWtXYjlBazNtMzg0dkhxNjN1VmxkS2JwUHhEYVZB?=
 =?utf-8?B?ZmtJUTdpWDRnU1lQZ04vNWZxRWxvU2NZVjZwMVk2Y3NMRHowOTQ5V3VrNEJV?=
 =?utf-8?B?NmpKVVRWVDdyS21UQ0JWNThFTXZBeElLeTlwSzcyUEVVb29Pc0tOWUxuT3Np?=
 =?utf-8?B?ak1qQ2xBN20xSDk4V2g2ejh4ZFpXaUV1cDAyOVJuZFBXY3dFeFphc1dUM2wx?=
 =?utf-8?B?c0cxV1VYcGtWdHdwSWZaa1A2Wm5EWHBrZENDYWVqRFhGVkRDSzMzQk1seGp3?=
 =?utf-8?Q?N6Yus0Qq+CaWquDsIf1Vk1gefXzVuYZW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lsaTJvZkhqS3VQV1liYWhQU0g0S3R5S0dla25ITjQrMWQzM3htNEZsMGQx?=
 =?utf-8?B?eFJOb0NWV0ZsaEJUdmNWNUlOUlI0SHg4T0FXTTVDODUxZk1FR3NuaXo1aHFp?=
 =?utf-8?B?Q20vZmRQZkpQUk8vdXRYcW1FTTR3cWZQQit6SXljcWRNajJ5Qk1PS3E2QkZG?=
 =?utf-8?B?TnNnaHhoSkd5Zmk5NEVCaVFZSVFnbjU4ckdES0pqVUg5SjZsdGZKdTBuM0Y5?=
 =?utf-8?B?eU8vMFkyQlBUWnhiNXNnNGx3ejIyeTN4alVtc05NRldMZ1RIRGJsaWszN0sx?=
 =?utf-8?B?NTVqYm82Q3ZwYS9VY3RENmhpSWkyUC8rc0FHZE5hNW81SXR4d1pBT3VJNTRC?=
 =?utf-8?B?WnoyM2VJNThwcWpjMnFQRnZ2QVJQM3NxTkxBdFo2NzVod3pmcDhPYUJ4Yklv?=
 =?utf-8?B?R001cjJ0MC9PWTNwZG8rVWxON1dza1Q0TGhGaFByRWhGSWhKYW94LzMyZXNp?=
 =?utf-8?B?YUdJclpEQk9XVldFelY1RlhueFlBTUh2VllDcjFneW1qTDgrMW93REpGZS9o?=
 =?utf-8?B?QVNlelRIdDVJZ1hrOUt2K1FmRG1DWFhYcHBXY0hHMStQc2lFejF0dFlrWXBh?=
 =?utf-8?B?TjdkQXdzdjJkOXBIOEloZGROb3dTalNpUWZRT0dnMDF1VGJtQ3RwRjJrMVhH?=
 =?utf-8?B?aXd5TERRRmlQWWhCVEx1TWVzZjFHcGxQQWk5TnRNc2FzSHhzYXMwSFQzaU1F?=
 =?utf-8?B?dlhuQjQxckU4Tnl4TjRIbnlJMVp2aWZqTWdPYzdYd3dueGxVVFZ5ZHk0Nld3?=
 =?utf-8?B?Zjg1bkpUOGpJVDFkWGUzaVcxZVZ4QkllRTc3SXhaMlVOYkZLUVhWWFl2eGF3?=
 =?utf-8?B?eEhjUzZ6Q0c5aVR5WWhFaXIwZGNrZ1MrSHJHUyt4eDZ3VE1PWDRJeEk4UFhw?=
 =?utf-8?B?T3MxRWcwT0szUEJhRmd6UHRvWXEwYXhEbEZ1eStQbitaZXVJSlVnS3FCWjcw?=
 =?utf-8?B?TmJMWmdkVFh2MTk5WS9EQkx1cWdZTWQvZFdzZ3djZTV2cEgybnlGU0ZSNVhO?=
 =?utf-8?B?L0krVXZYZm1wRE9BNUlnaTJLRmduWUpOaE50V1RONzZlT1VZcUJsb2VkUk1w?=
 =?utf-8?B?V0hCMzdWYndpaFpKUDdiYWw1T0NaNGxjSEd2Sy91S1lUbGZhNm1JZ00yam9v?=
 =?utf-8?B?a2oydVAvbTFEMDVGQ0pnZVEzaGlRM3ZPcC8yQzY1R01XeTRFRVdXV2JoenF1?=
 =?utf-8?B?WnVxLzJsUDVzcnR0TUZQRS95VzhsR0Vsb0htVUF4eG9LOTF5MnlZTEppc2RC?=
 =?utf-8?B?alZqMWwzYnpJT0lnV2VGK2E4RFpXVTE1RkZRcDMwUWlCWTJqd09kOWhmY2Fa?=
 =?utf-8?B?SnFnVlVma3ZGd2tPN1BlMmZEU2tMblhaUnV2OVFvbGRWOGJMOVIxQnQyVStJ?=
 =?utf-8?B?OE1YVjRleG9lMUp0MlRsbkxCOWhIWEN4MytERnlrdHRtbEtqRktFWGxlK28z?=
 =?utf-8?B?WTh6SWtFNGdHTWx2RFVVdDh0MlYwOWMrVnpXSU82R1M3UTRiN1hzdmFHZ3RX?=
 =?utf-8?B?aTFxazNsMzVHWXFHVUYyZXpIM21JcjFFSzlrZWdpUkx0WVdJYms2bTZaN1FS?=
 =?utf-8?B?VVp5bm8ybTNIUmZsMEZpcytIMnhCcXl3YzZTK3YrS0s3Nnl5c2RIakJxWW9i?=
 =?utf-8?B?emc2RVZXK2pldHJROEJXYjZsckZNUFd3VVRJMjFFeEtId0pKZjFBZ2ErWVd2?=
 =?utf-8?B?eTJpM1QzL1hwZC9saGhUYlQ4ZEpvWldSaVJIUE9LMmlFQUl5Z0o1bjdBQlhD?=
 =?utf-8?B?MzdadEtmbC9CakVueGJoampFSXAwU2JCanhsMkl3dTkyNGZaL3Q0THRucXFD?=
 =?utf-8?B?clhCWjgxb1ZkMjRlSWRsWk4vTXdPUExaVkVSaHhnSWoySjBpRnFJZUQwUnE5?=
 =?utf-8?B?VlpMNmFRUDB2dlQ1ZXJGaFp4cDFldDh2VHB4MkJ5L1REcWZneVJTcVFxaE0y?=
 =?utf-8?B?R3VYMDU1Uks0dDNFZEVWUHFuRGV1bGZZZERjbE5MZE5vTUszUzU0cHFreGNQ?=
 =?utf-8?B?ZnRzblM1MFFqWnZTdkxxVU4vQVJoU0hheXNPZ2JoR1p0OTdqN1pMWXg1TTFk?=
 =?utf-8?B?ZUJ6MjI1RlM5NHZRbDEwL1IzazcyUm9xakdTQWd6SU9XSytoT1ZZYmo4ZWRq?=
 =?utf-8?Q?Vn90vWQoAqzUJ9oUgbdPrXGfM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33f8e24-2db1-474a-f2f7-08de22877f0c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 07:37:28.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkzayi1yN78ig8LaXt4WtCnyYa4xP4CapqylggCtAW6SmLELM2jJClLYrJvd8pWbU4Rs7SCMf/GPOpVWaklyfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119



On 11/12/2025 22:51, Mario Limonciello wrote:
> On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
>> This series streamlines NPU-related handling in AMD PMF, adds a
>> lightweight in-kernel interface for fetching NPU metrics from PMF, and
>> hooks AMD XDNA to that interface to expose real-time NPU power data to
>> user space.
>>
>> Changes include renaming legacy IPU fields to NPU in the metrics
>> structure
>> replacing ambiguous booleans and magic values with explicit
>> SET_CMD/GET_CMD and METRICS_TABLE_ID constants, introducing an exported
>> amd_pmf_get_npu_data() API (guarded by a mutex and platform checks) to
>> pull NPU metrics from the SMU, and wiring those metrics into the
>> amdxdna
>> driver.
>>
>> v2:
>> ----
>>   - Split the series into multiple patches per v1 feedback
>>   - Added preliminary PMF driver cleanups as preparatory patches
>>   - Introduced an initial amd_xdna patch that consumes PMF-provided
>> data to
>>     establish the plumbing; additional logic can be layered on in
>> future
>>     patches as more PMF metrics are utilized.
>>
>> Shyam Sundar S K (4):
>>    platform/x86/amd/pmf: Rename IPU metrics fields to NPU for
>> consistency
>>    platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD flags in
>>      amd_pmf_send_cmd()
>>    platform/x86/amd/pmf: replace magic table id with METRICS_TABLE_ID
>>    platform/x86/amd/pmf: Introduce new interface to export NPU metrics
>>
>> VinitKumar Shukla (1):
>>    accel/amdxdna: Provide real-time NPU power estimate via AMD PMF
>>
>>   drivers/accel/amdxdna/aie2_pci.h         |  2 +
>>   drivers/accel/amdxdna/aie2_smu.c         | 12 ++++
>>   drivers/platform/x86/amd/pmf/auto-mode.c | 14 ++---
>>   drivers/platform/x86/amd/pmf/cnqf.c      | 14 ++---
>>   drivers/platform/x86/amd/pmf/core.c      | 71 ++++++++++++++++++++
>> +++-
>>   drivers/platform/x86/amd/pmf/pmf.h       | 18 ++++--
>>   drivers/platform/x86/amd/pmf/spc.c       |  2 +-
>>   drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++-------
>>   drivers/platform/x86/amd/pmf/tee-if.c    | 20 +++----
>>   include/linux/amd-pmf-io.h               | 21 +++++++
>>   10 files changed, 159 insertions(+), 53 deletions(-)
>>
> 
> Which tree do you think this should merge through?
> drm-misc or platform-x86?
> 
> I tried and the series cleanly applies to both and compiles on both. 
> So I think it can go either way.

this series can apply on the latest mainline 6.18-rc5 with
4a0c9b339199 commit as the tip.

there are 3 series out from me on the pdx86 tree, and since I am not
sure which one will go first, all of them are based on the
4a0c9b339199 commit as the tip. So, I can rebase and respin based on
what goes in first.

w.r.t to this series, would like Ilpo's help to take via pdx86 if he
is comfortable (as the last patch in xdna has very minimal changes)

Thanks,
Shyam
