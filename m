Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012052.outbound.protection.outlook.com [52.101.43.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06762324707
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763019045; cv=fail; b=g3GBBf+y+U7197zDpPXa6ohXY5Bd3+4nqbJF6xujid5zsQ4lczTb8RqnWSO8+w0fifQY/WAlHwd0amS8hPgkrcZ/FLwmgZ/f/1JVQjy2HkPVSW1Zi3RuZyKzlJFuCJGJ1K23WR5xTdst8iGoOTvA9H0425ZD7qDDoAibGA3AJjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763019045; c=relaxed/simple;
	bh=cVcAEfEe3nxPTA8TUqBHC5kkjOrKk9RP22ukz6AKFYM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nEKNhPiNnbgdj0mzAZ+zn97ogSdEj6Q7c+1+uzhYSfDn39OW5vFJirN5yJmqEQKV3tuVN1qMiYnm0yxLXo3foD88ABqp7o61dP206it04UTp9sifx+6VPVpt9ERV4Iw8cWR2Mnt1+u2RrGyhbXGM+FD7/obSwgrCm6KXoWs8sqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lVFS6uB4; arc=fail smtp.client-ip=52.101.43.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lVFS6uB4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJBymFb+Ol/UBACWGV7l5KjRxqgTmWAgGPlXvrUGO9xyY4HuikzvB7j1hyde4ELkPKLT6/5f8e+X4+12ErW/xROOjTEs5eaVXqDkmQT0+2rJMEBW6n5MyyraQIayZHQhoUhzgg9c4FZOgX5msac+Pv9FbFzSNPjoxaRXTu6ptn8lZe02/Lus5Vj3HWj6EARZ82RNA9vNnN+hHy7cWWR6+LAUxK6FEOKzun0GE1LoGN3FzOYIegc5nj5K+rAKrLRnyDjbCq2qvohfA4L9Yhd32KHKvXfCcTzw7311sUn1H8xI/wW8zC/5TXVpMJrKJv08M1HaShIcDT6pb1zqQnfBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxRXBS5g67sU3oyrzqhAq6sVyMXEV6vuZZTtrZzmZuk=;
 b=R37dznt0wpstZ20X/0Ot/7gd66P2qFiRfymNZS0geisqImQPy074ezlYcx+7vWHFT0tABoID+iVPCqYXv+UI7+jJoAoPxgg6Gd7CtUrefcYQnKiYGgHF8dUZLabBQPOfCSLlDDp+uDoKIwO9Y7yKEy+EMhsE5loD4F16wUYaqiL9nfk0UzgFabg8JbnyfiXuf5jr2qYjuiVNic/jegqJD58Uo+cTrQC8EDX6C6ZrFyvmKypOVHPxICA/EEnag6rrQr5JjwfBHKuIB5wrMKlOoQJOdaxclEI9c7bFEuUXW5YFxs9ztQfXi90YtkjvBDWls6nJDO6HXqck9cElQEur4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxRXBS5g67sU3oyrzqhAq6sVyMXEV6vuZZTtrZzmZuk=;
 b=lVFS6uB4mn0JTVBJ83JDbjS1UZJ7FhtoRp7XW9SBx2cQJG3C2+IFjveZ8id3Q6eXg2GlzRdsvnOhEeMtPkinTVSvijvh19IGxRkC6dna1l9272gAMXasqcJhJGbWhgYNyEi7MdVwfuJnTaUhKMG5CD8v4xeITPSNlBDbeFVe6A8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA3PR12MB8440.namprd12.prod.outlook.com (2603:10b6:806:2f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 07:30:34 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:30:34 +0000
Message-ID: <4adc1ae4-c5a3-4206-bc5d-2415308b3909@amd.com>
Date: Thu, 13 Nov 2025 13:00:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce AMD PMF util layer and user-space
 interface for SystemDeck
To: Mario Limonciello <superm1@kernel.org>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
 <5856f9f1-1737-46e3-9063-536f4cf2f66c@kernel.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <5856f9f1-1737-46e3-9063-536f4cf2f66c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA3PR12MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: d09affc3-e431-42ca-4745-08de22868807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXFxbGlqVG1XMktkaXdjWGZLL25yeHF3K2xnMVRlRmZrMllYK2MyYlByZC9U?=
 =?utf-8?B?OFB3amo5ZitMc3BFMUtualVYS1REVnFISi9Salh5UmdVOHdCTU5uNzBBdzN0?=
 =?utf-8?B?MFBTZUZuT1VMT1lSQ0wvQU93QnFLRmF0MlNON1dReFJDL0tsclBOdnZLRGRW?=
 =?utf-8?B?bjZFeTdROE5xRGZyeXhEZ1hLbCtraS9vdWs2TkxnZWxNc1pZdUtJUk5lR054?=
 =?utf-8?B?bVArN3pleHo4N0FLbHNoUm5MdzJWaExJK1hwM1JoS1l6OUN1NzRBWlJuUDdP?=
 =?utf-8?B?M0tUdldYVzNhNFFCckF4TkZDVVRyYng4a0xHb0FINTFTeVlnaExwQUI4ZGk2?=
 =?utf-8?B?bnZrdll2UjdwbDlTMFdnYXZZS3grMk04K09RaFBOanpNR2Q3NW5VOTdTK2Jp?=
 =?utf-8?B?K1FrL2NnOUVIOThvWFNYeHVrYVZINzN0YnJWWDYxSWF1aFc1S2ZFVDgxRjdT?=
 =?utf-8?B?a20rZ2N1NXpWYTdzTzNjdEZNb1pMOVpUS3RTRnNyLzRmU0JaZUU0TnQ5ajRG?=
 =?utf-8?B?aDZRWkhlTEg5U3ZVaWVUMWdSenFubytKYnNJN3E4YlRFSTYrWUZpTVhtRkRQ?=
 =?utf-8?B?Vkd1Sk5wZjR3WkFiYk5vTVR1NFpCZlBXMmduMm9lZGdmdnV5NXo3WDhEci93?=
 =?utf-8?B?RGZRK0NYMkFpcHFZa1JZNEdKR3NLb1BxTHRvakg0ZmhQNTUyR1loRWp0YU9i?=
 =?utf-8?B?NjZDR1NhRjdHNXhwb3JmeERpb3p6S2Q1Um1qNTNIZm84WU55ZHJ3VjNJR0RU?=
 =?utf-8?B?TzBiQ3RKNjF2ZzBSOENyYTJ5OTYvaHlIRjVLY01rRU8zQlpnMVZ1VTVpcGtm?=
 =?utf-8?B?R3VidWJ5VEcwYWxlR01pblphaVpuNVdML3ZtUzJaU1dtQ0x5d1ZSeHdkRVpj?=
 =?utf-8?B?QitBb1lsQU5QbWxYaWZKcUU1SVk2blc2QUxPS3pKZkpzOE0yVVphc1dUV1A5?=
 =?utf-8?B?elZqQ1RGQmdoQ3duTWI0YkRaT2lIc2hWR1lyUnMxbmdZM3JqdDI3QnliaTgw?=
 =?utf-8?B?OVJyWUJBWllMTjRqUUpiZ1E5dGFrT29Hb1h0dTYxYUpqTmtZZm1ocUJVajl4?=
 =?utf-8?B?cXdYWU5yRmlwV3dIRkxubFFPSjZreVB4SWRLNWJTWk1KeitlMzRrN043QmNw?=
 =?utf-8?B?R3ZRYjRFQkFVNXRxeXc4VkIvVndPK2ZlVHNEMEdWYkUvejhDSThkYXhHT2lu?=
 =?utf-8?B?Q2Z3M1Ayd1hzcVFUSVNMem9KbHU3blJnSWphTjhxeUhxNXljMjFxSnhIaWll?=
 =?utf-8?B?V2o5MnFqcG9IMGhCRmRmVVJhY0IxZTFEd2VzbWF1eHRMdG1xVUZzWkI1T3Y4?=
 =?utf-8?B?OGxoc3ZXK1BNeFlLMUVqVTBRcCtkREw0L0x3cDNlanZ1Q3ZmZXJNVXArTmI4?=
 =?utf-8?B?K24xdFdxTkNmUjZyeEgrUGpacnBLckxOZ1VXRWFPWVdhVUZEdDRQTTBpVGxj?=
 =?utf-8?B?bUc3eU9INklNbEJ2cmpFVWtrZ2hpcnpDMlJ3UGVCTDBzZ001YnJKZHhBS1pz?=
 =?utf-8?B?Y0xBeVQzSnBUYmtYb1lMeVFGRFJnUTJ2Ky9YWHI4WFowMWUwcXVUQXhqOFVz?=
 =?utf-8?B?a3FVaEdaeDlIQW9SQjhpaWVRL1RXZEJoYXQwOWJ3Wkx5dVVXSHpGSWhqb2pU?=
 =?utf-8?B?dlh4QjM2YU9MSVJ5WHRMSkQ1MmNMWW1OOFdwNE1kcEE5SytJWnp0QUYwdW5T?=
 =?utf-8?B?dVh6Nlp2S3hpeXVFcFFWMERIME5ZNDhqNUdBdE1ZRC9DS0g1a3BtdE1DRGpI?=
 =?utf-8?B?akl6RlNOT0ZZRzRqbnU4YkhoUXlsd3pHVGVFa0pqKy9tQlZ5aU55cER0VXZX?=
 =?utf-8?B?UGlvWVVmYzVsWjNXUEVoU2dzZmQ5S1B5OTdUcHR4WFV5N3ZDaXdoL2pIK2dE?=
 =?utf-8?B?SkxIMjl5RWs5UTE2a1BrM09Vd2llN1JMcXVHanRSZkpHSWFRMmNMcmtwNmpl?=
 =?utf-8?Q?cm7Iim80SgGaKD9Pz1/U+azb3+Lt/gq1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFNzWWYvdS9FNkFGOU4rWFhXaVVrWjNEU0lLL1VUbnZUZmxQTkFpRHNhbTE5?=
 =?utf-8?B?bE1GRFo3MCsvVHhVMkd4aTdCRUl3dXpRRnBZSllmcFJYUkovQUlNWHJRTHNo?=
 =?utf-8?B?MjR5QTZJb2pHZUxlUzlYWUh2N0VicFJ6eWkzcFBHTTRmaVdITjZJWkZ0WWcy?=
 =?utf-8?B?RExvSFhibnJLR3dYTGxVTmpwNkh6My9zdUwyODJSemF0UWx5Tld6TEtHVCtB?=
 =?utf-8?B?WnNSdDZNdGxxeUFyNjk2R2hkWnNVblRjMVFDYTlYWENGRlNyNmtGalZ5ajlv?=
 =?utf-8?B?UURYMm1HNTBvVXQ0Q2dMZzFCS1hMZ1BuZFkwZW10M2FoMThOQkkxMEhxL0k1?=
 =?utf-8?B?eGxZZU1WT3RiSjZQc09palZPVE1ZeTJ0VTlhb0YxaUMwYmVXcUhDWWdOMlZW?=
 =?utf-8?B?aDFIVG5OclhwWTk1akZVQkFhalArcXBBSkNaT2Y1Y1daZFprQ005MmFyZG16?=
 =?utf-8?B?RGwxT2ZUSkJ0S05TaC9LcG5tekdrQ0gxRnY2N2JPS3ZkcnFWT24wcElMcDVh?=
 =?utf-8?B?aThnTWl0OHdwdUxOZjVJdkRENGw1RmVDRHdadDBxSC91R1FENXEyK1Q5Vktj?=
 =?utf-8?B?OW9BVkJUUnJGRkI2MDJ3RURiZU1PcjJ0VjJnL016YkRCUWNFQjVQemlORTZQ?=
 =?utf-8?B?aVgxZHhBUjBOZ25aQXBmam03MHE0dzlRNFJzaGRLWWJUSFB6YkRtaklSUHl2?=
 =?utf-8?B?U0hqTGRVcFZQamRvQWlZcWJ0YXR5UXlRT0E0SVpqVG0rZUhlaXBFeCtnbE5W?=
 =?utf-8?B?b2RzT2dnQVRpL0VxQW1XcVQxTy9yZUs1VDF6cVNVQlQyR1kxZzJRSEtCalRU?=
 =?utf-8?B?eEszdXh3VHN4V1YxQkQ3eDFUQUpmVEY5M2w2N2JDbFpjVEdzZGVZRjR2UTNu?=
 =?utf-8?B?eTlXS0l3aG1hMDVqblBuSkdqVWR1WHBxQ3JMNEZKQVZWK3kzY3Zta0lKaGk4?=
 =?utf-8?B?UnFsejc1SGd5Q0NoTGVQRVlad1NvdHdzVjhsWml1b0dFeC9MMnZMWUhSWG5k?=
 =?utf-8?B?RnhyQVRzaHhDNVFRWk1IT0RMOUVIa0g5RmtndlI3Tm5aK1gzSWdlRU1aN1pk?=
 =?utf-8?B?UklUc0l5QUJYQmgvczg5SmZSYzNhSnJDVWR3dWpPRkdZRHorYm1ReW15aHhy?=
 =?utf-8?B?dmU5VUVPdnFGNUJpZ3F2ZmZTRndlK0dKRlNlM2pNZ2MxZHlTQTdORFJJVW51?=
 =?utf-8?B?S2kwMW9MWFQrWlpVTFJnelFCVEhTSmVkcTRQQ3N6bzRRTkRoSiswUTlrYnUv?=
 =?utf-8?B?R095eU82UTJjWDVPMjJFSm1OZjFzWTlCZWJmamw5STFJWFJubU0vbUw5NCtW?=
 =?utf-8?B?YTRlamM2MHU2RjRxN3B1UGR1bHNyLzg4SVhGTTZmR0NtelYzNGRteldWdHQz?=
 =?utf-8?B?Unh1Sm9kblM1a0tSNHVSTVdBMlNyZzNoM1AzakxlcktBS2J3ZDdBUStqNjNZ?=
 =?utf-8?B?Y2dQSDdjMkIwcWFFSGg4cTZ1bUluRlRmNnBCL3dNZ21YR0xzZUJjeHVHSHBG?=
 =?utf-8?B?WTdQZ2tYMjBlRGI3T0MzYnE0T3hWZ0tvYUU2QU4zc3lEYTVyMU02Wk9TUTh0?=
 =?utf-8?B?bFE0R2JzcTRGVlF0UDg5d1AxbnExUnp0RCtHcU1qakNHYThaVncyTlhySjhP?=
 =?utf-8?B?bHJEckdEQVRJVVpLaG54Z1dZeUlDa0dIdFZLd2hOck5OSzBsQlU3c0dNYy9p?=
 =?utf-8?B?NzJ6b0s5dkF3NGo3d2hQWk1LckZLcTdmUjFmY1kxbklhNlE2aUhHQ29RR3hS?=
 =?utf-8?B?ZzN4ME9sVmlPNUliZzQvRGNTTU5QS0VtMEZxdzZKKzVVWEJrYmJmQXo1Zy82?=
 =?utf-8?B?K0pKaWtZNTdLakxGOGd1UkZ3dXVKYUJSbWhURzVnVkJsamlsRWRFU2dPbHdN?=
 =?utf-8?B?dWZBUXpuWEorcHk5TkhPdXdteG1xR21UQldFWUFGZVpEcmVhY1pZODNxZmY4?=
 =?utf-8?B?WEJUaWlRWWo2bXAvOHhtZEtudkR6eEpid2hqbEFFQUgyRGdUeFNRK2pGZkF2?=
 =?utf-8?B?L3RZRjY0NngrclRUaC9BSDdOWUl2NE1EVzZTckY5N09Na2twRENaYzZYT1Av?=
 =?utf-8?B?ZEQrdDJ6b1RvMUhQdno4YUZaV1p6c0ZzNkdxSWJWUzB3dlNzcXkxZjhzU0dI?=
 =?utf-8?Q?h1qRKHshwmZLd7jqyyGBtPPhm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09affc3-e431-42ca-4745-08de22868807
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 07:30:34.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otZu5oaPMMjbn54OJIFPbLeKO7BQD2nTu5ksMJp3/zqGDcaTl/Ig3Yics/zj+KHMbK2yDEUtgEg58ZyEO8nLkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8440



On 11/12/2025 23:38, Mario Limonciello wrote:
> On 11/11/25 1:10 AM, Shyam Sundar S K wrote:
>> This series introduces a util layer to the AMD Platform Management
>> Framework (PMF) and a minimal user-space interface via a misc character
>> device, enabling feature discovery and smoother integration with
>> user-space tools. It also adds caching of BIOS output policy values to
>> prepare for user-space telemetry reporting via IOCTLs.
>>
>> The motivation is to provide a stable interface for user-space tools to
>> discover PMF features and consume selected metrics. Enable smoother
>> integration with AMD SystemDeck, a widely used tool for monitoring and
>> controlling power and thermal behavior, helping designers keep
>> components
>> within thermal limits to ensure proper operation and improve system
>> stability and reliability.
>>
>> This series also adds a small, dependable userspace utility that
>> leverages
>> the new IOCTLs to query live power and thermal telemetry. Exposing this
>> data in a scriptable interface helps users and tooling make informed,
>> workload-aware decisions and supports validation and debugging.
>>
>> v2:
>> ----
>>   - address remarks from v1
>>   - add a new tool that exercises the IOCTLs from PMF interface
>>
>> Shyam Sundar S K (5):
>>    platform/x86/amd/pmf: add util layer and user-space misc device
>>      interface
>>    platform/x86/amd/pmf: cache BIOS output values for user-space
>>      telemetry via util IOCTL
>>    Documentation/ABI: add testing entry for AMD PMF misc device
>> interface
>>    platform/x86/amd/pmf: Store commonly used enums in the header file
>>    platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>>      metrics and features
>>
>>   .../ABI/testing/misc-amdpmf_interface         |  49 +++
>>   MAINTAINERS                                   |   1 +
>>   drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>>   drivers/platform/x86/amd/pmf/Makefile         |   2 +
>>   drivers/platform/x86/amd/pmf/core.c           |  19 +
>>   drivers/platform/x86/amd/pmf/pmf.h            |  33 +-
>>   drivers/platform/x86/amd/pmf/spc.c            |   1 +
>>   drivers/platform/x86/amd/pmf/tee-if.c         |  10 +
>>   drivers/platform/x86/amd/pmf/util.c           | 236 +++++++++++
>>   include/uapi/linux/amd-pmf.h                  |  96 +++++
>>   tools/testing/selftests/Makefile              |   1 +
>>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++
>> ++++
>>   13 files changed, 832 insertions(+), 22 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>>   create mode 100644 include/uapi/linux/amd-pmf.h
>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/
>> amd/pmf/Makefile
>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/
>> amd/pmf/test_pmf.c
>>
> 
> Series looks good to me now, minus one nit on the last patch.
> Thanks for including an open source consumer of the new IOCTL.

Thanks for the review! Sure. Would like to see some more feedback
coming in before I respin a new one.

> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> The documentation (in patch 4/5) says 6.20, but if Ilpo agrees to take
> this for 6.19 that may get updated when committing.
> 

Let's hear from Ilpo on his thoughts.

Thanks,
Shyam
