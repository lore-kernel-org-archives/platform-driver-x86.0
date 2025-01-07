Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC441F8AC7;
	Tue,  7 Jan 2025 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285422; cv=fail; b=PE2lGqeBhsAJHoJtz/FZjb9zoMik2EGXFtC227BDCrRf0SLPiqMX/YC1D7/denmtdu1S2JX8xZ+l109YKel5W6LdghYzz8dQ++b16cKR5dKBsODwJ99lJPV7pDwua5LXyscGiVfa28uKt3ALEVtxrHJzxhXMbmInK+CHr7PH7J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285422; c=relaxed/simple;
	bh=JqyWA0B21QgaLRPheHdUUZU98ZBA+p+8figXHn+z+58=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CyG07JphEiRl6gM4ik6saCxiA8Usb1xVYglscweSHPae9CIQh8qz1vi5zKuvwvvNuWvQdpMs2fEHg28xoEcfC4aP/eZ1vDb9Y6MHapbU5tw9iYrtvuTtQDuZzH01h58NAjNaPQTG10Dm4yLes0hDVJYFu9K7FtjqPdnYt9Mx04Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=khZcpFxD; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="khZcpFxD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoVmlCszsl1CK3EZ4UUiCr3+naAtezfgH4sQW+VwyE50EyUGpXNN5u9gwj2MRnc/LtJmXF04Me3QiFIh0v95k9MhWZBx23HL/FwV0a5IGHY4/m85Pt+fXyuu+8lAzT3092s6K7FkTmTsU9K5QuVoeFkUIcdFmom8rLMJxxgcqNVXC9R1onV7NISIAoVgQwKUVbPldK7meknW48ZjGIBJP2P0BjhP95m2PypSQpkQ4+Nc2IN7V0F+FgoLDsNP3jnA6ioRL3nK9aEqK8Qs8OUHaAFlu2laVJToKOD1KanVmcyI4SLjWkiXr/bPckvYiVyAUaTU3cYypZ7Jxruc7OaIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp+UUkC/xUy3yGOn75OJUq9OkVX8whOKsE6UY9GwyHo=;
 b=xtIRa3V266/8MPbCC6an9dx97/FHHhsudhYeZ09Up/VaoWV+SysG2PJzOfEqtsGfPU8S3WICkFUA/+OhlQtG99dIxswtUFWhQ8gLAUAxcBRI+pEIsEpp/eUy+CsgTTY4MW/+hZ11ABeEvzcWpDgEeg1Lpcnmgh6me8m9RdGbFtzrIsKofcDkELHArDtaJBV8Djvlb59y06WaDzGR8lsA/Dq595fGY1hbxcrqkreSHPjewhuNlITuwTPSkslFiFOnTmvxN88Vbg4/+IKlQYfZtQYvYKjsYoKuk5OwonoiwPejJRZIjrN0FdQCUNEaYbLe3yGDALDw1VpXZq4HsLn2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp+UUkC/xUy3yGOn75OJUq9OkVX8whOKsE6UY9GwyHo=;
 b=khZcpFxDcTel/qooDMadqxek9rV5EbLKefrit+eqFLepaoO0SzInmekVBuKninxdeJqlUFdH1tCFu77+/iQO8wPkuEcf15jlKapLQSnKKZ4KM/hiuyatCz3RemP0Q0xvxjroYEbIKOx3ya/wZ3oZUOFpL5B4QnKebA8zxsHIQQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:30:11 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:11 +0000
Message-ID: <f46f0da9-380f-4bc4-ab41-658391b7aa5c@amd.com>
Date: Tue, 7 Jan 2025 15:30:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] platform/x86: alienware-wmi: Modify parse_rgb()
 signature
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-5-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-5-kuurtb@gmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: e1e1c73c-0649-4c5f-3eab-08dd2f627781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejMzTjAzcXhPSXZ6UllTK0FUTXJ3UXBiQmhQV3VVblNXVk5EZ2I2ZlA1QXBv?=
 =?utf-8?B?THVSTVV1U1RmM3BkUFQzWFNnUlNDMGZJZlhWSkxQdFdscDN5TWtpbUptZU1u?=
 =?utf-8?B?Mmx0RkxlNURuK1RkVVRuV2dPekVKNnZvUDlkcG5ZVDUzZU5FQS84T3NTWml1?=
 =?utf-8?B?b0hDajdPRm5jTnE2dmRxcGphZzlic1ZqZHNBcC9hUFV6RXZydUx0L2hpN0p5?=
 =?utf-8?B?Vlg3TmJadVFSSXB0bWJSdGN2bmQwU0YvOWlWcXRPL0dvSXI4djEwcTczT1pi?=
 =?utf-8?B?NThUYUN0T2dXU3g2dXVxVGFoeVJUN28zbFFJaHhONzN3ajFBRmZDZjBJRGtk?=
 =?utf-8?B?cVVCeW1XR051OWxOZnlBanpHY0kwMFMycnBNcWkzQW5lSUNDcjRFZlorQm9D?=
 =?utf-8?B?amtXM081Yyt2Um1EK21OUkdNSjdLc2N3bWRFcWFud29jUk5mUTI5WmdHb2s4?=
 =?utf-8?B?am5VOE1rbkNuRTdSNEhBMTVXVXFmYjB4NEo3NXo3bXVKTm1hRTh0UlBtMmtt?=
 =?utf-8?B?eWs2Q200WnhrdnNrRVpGZXhvSTBZMEV6djJiRDloQ0dORGhsV1dkSUNWUHEv?=
 =?utf-8?B?T0V1QUs3NUhML09zOVp4VDBaUXAxMmdFYnYvZmRrcHgyc3doUG0yRE5QMHFm?=
 =?utf-8?B?bnVHLzlRK1VJUVg4NUFqNHZvTjN2SlJwUU1zbGIxTnFBNFJyZXlEMmZPT0hl?=
 =?utf-8?B?eFZXZ3VoNTI4b2pNVlczUUxFZ2VCK3pFSUJQbjJMNFBYUzVocXY3RTZ5RVho?=
 =?utf-8?B?YUVHQlZobXZ6Mm9nd29SNExXYTlocmN2REhWRDR4UytkUVpRa2dYYXNvTG5I?=
 =?utf-8?B?NDBoNEp4TldEcExqNVZHVDBYZFlRNjEvQjJ1dmFMYVZZUU1LVTJlWDFrQ3d1?=
 =?utf-8?B?bGhmbG1XRVgrUFJwVi85SStOTUNpVW94TnhZaUprcDU1SExDMkpqMTNMUnpG?=
 =?utf-8?B?VHhVSEJ6N0ZzenROK1dMb0tLaXBVa3pZc3VPT2U4S1VuaWRvOFFXb3JwK2Nk?=
 =?utf-8?B?S2FReUFPY1dXb243bjFIOHFFR1dRTUdBWFRpMGJwZGZlYm5SeHlBcDBsbmt5?=
 =?utf-8?B?NlY0dUNqYTZheTJEKzM1L1BSUDlGYU5HcUtLUVRyVC8rOVFEdnM0enRKU2dL?=
 =?utf-8?B?T1dveDk5eFZ0YnhacXZaQlJFYU5qRzZpd29JV09jbk1pWXVxbjBlZlpsVkZF?=
 =?utf-8?B?bUJvK3JXOFhWU1dQcWN0aHdHUWp3Wks1cVlmSEtJOTc5WTUrMnNSWmlNWDFi?=
 =?utf-8?B?N253Sm9iWVNQbE4xR0w4YTZEUGtiZ0k0SU1iZUM3dk4xTGVLM0pZWUFsNkFF?=
 =?utf-8?B?anF4ZXFFT1k4TnZyZVhDY1RLYTduMFFQVThvVit6djd6b1o3QWVsNjlOUHlU?=
 =?utf-8?B?dGtMZnc4eUJ5QTh5ZW4vU2NvZVZGVW9MNlU5ZGZpOGxEYVQwTWtIQVJFMktB?=
 =?utf-8?B?ejRJU2g5Q3NNMHlza2c2a2JoN3dQY1N3TGFQNVVKeE9RR2JXWUFtUnJ3K281?=
 =?utf-8?B?cGMvVlIyUVdDREpzY0szQ0VuZThON1R1WWFlbmR3K3VLS0w0eExFeUJjaHR3?=
 =?utf-8?B?Z01sWFBpY2o3TXBIYWNMQ09FZkE5OEFxc01kbDBobnB2QVdGeFV2TVBzSjhn?=
 =?utf-8?B?NkJpMXF4TXE4U2VVMEdWZ2JxazU0dDRnSU04VVN4SVd0Sm1HWVVXdVRnZlpT?=
 =?utf-8?B?dzJVWkFWNElXak12c1JFMnpHaU1DUjN6UjNNd2RhRThtRjYwNHZ3SXJpVTJ2?=
 =?utf-8?B?OHRRdUFNRExRUTIvSXd5U2pUREhDejRXenRLUVB1dWl2alNiU2ZuNjU2SFB1?=
 =?utf-8?B?bE45eExNWFA5TmZwa05pZmhSTys3V1JkR05YWHZXeDZOK2lOVFBiOUV0MHgv?=
 =?utf-8?Q?0G9Ll04wLerAp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1orQ2RFRmhiUy9mdFpvU1NVZXppUjZMa0RtQmtJKzBESUFSdU9JWHI1UEV0?=
 =?utf-8?B?SXBRUWFHdXlBWkpmbUdFbFM5T0U0ZExobVBRRjVVZW5McUpJNWJGQS9SNFU4?=
 =?utf-8?B?VWptczBybU5YanV1YytPTklrWUJoWnozQUVQMWJPYVRRVGRLbnVrWmhCQjR6?=
 =?utf-8?B?Tklyc0ZlelVKUGRyOFFJN3QzUWxmMzZ4YS94N0dlQXRmcGpqZGk2MFNxcGh0?=
 =?utf-8?B?SnJXM2ZwWWFVNFBNbnhqTzJuRkQ4RHFSVmhua3JlV3VQN2FXZWEwVHRobnc0?=
 =?utf-8?B?S3pGSFRLb1FxQ0hKWUVBQisyNEMxeitPMGtHb1l0YU16aDB6MTJvUXJIMmxL?=
 =?utf-8?B?cDVtK3Jwa2hjenFadWdCRkNEZVB3djllbFMyaGV3bVlPckhxbCtpQ29TZDZG?=
 =?utf-8?B?cnJ1cHJlSVVtTHlLbk5mQWFsN1RsbThnZVc0eGhmQ0VwSEYxMzRwNzJueEtw?=
 =?utf-8?B?NnNJSjRsZkJ6bnlxSS9LekUvSWd6QzdFUzNBRmp4UUZWZzVnZTJJdjdkQWZK?=
 =?utf-8?B?NFcxYXFZbERoTGRKNmZmeFBpc1ZXcUFtL0piWHZ0a29uZE1HMGJwT1VLTjFG?=
 =?utf-8?B?Y1o0OU1aaytaTDM2RlJpQnZpZGpiMVEyRWJJUlo5a2Z1OUJSM2hUenR6MDNG?=
 =?utf-8?B?NXJnZVd5VkxISTduQkd2UFQvVW80M3k4QTFEYWdmaDMrMnEwdEM4UlNSNHlR?=
 =?utf-8?B?WVl6UzZJTDBiN2JIVUZTM0psbzk4MTRjY2tCWHhBT2tzS3hTQ1Y3Z1ZKLzBO?=
 =?utf-8?B?NTZRaDFqckZMMUFMRGlDOWNXanVFeW1xeXFvaGVmbUV4K0RBdU4vakkyUDBN?=
 =?utf-8?B?SGhsRk9PZjMvUjI1alZiY1NubW9neWN0ZGd0SnUxUXhvWUhqMWZUY1JUcG1h?=
 =?utf-8?B?c0Z6THFuWWxsZ2ppNGEwVldZcldlL05oQjQ4dFdySitIeVFZZkJ3aVNyVUZY?=
 =?utf-8?B?b2F0R20wSzJrYndIc2svQi9EcWsyM0orNC9UekRmZmpEcmFISWw5MEFscDBN?=
 =?utf-8?B?T2lsYnZXcGtScVBwb0ZXeE1oa014UWk2dXIvbUx4U0NiYnJGY1VnejJNUkNs?=
 =?utf-8?B?enlIMmdqN1piMWZiRlk5NkJ4OGNIZk1rcDdWdmpZMXV0VEREVW5HQ3hrdG8v?=
 =?utf-8?B?Y2ZFOU5XYjI2QVd6QWZQN2FzM2lPTFJ2KzN5NGo3QTRML1NOWHR5ZFBDejln?=
 =?utf-8?B?Qm9hTytIcE1YczVIRHpiL1lxTjlnRWdYZGI1bWdXQ0hTdE1WNjN3bjZ6L2pO?=
 =?utf-8?B?QVBTZEZEclZWZlBUd3dmMU9RZW9WQ0cyaVQyZTZWM25SbnlIaGhYblp5ejBI?=
 =?utf-8?B?MnBOTEJUVytBK3QxYnpTOWp4dzA1YmxQbFYvaFZIdXpGbkcrK3RqL3dNbVQv?=
 =?utf-8?B?dU1laExtWUxseWVBUzhBblU4YmZiUDF3Q3VaZU1QT3VVamliWEcxbjFvV3hx?=
 =?utf-8?B?bit6N2FlWU51UW4wRE1KZmRoZGFWUC9pWlZKbk1wRlc0WUQzdmppSXR0OGEy?=
 =?utf-8?B?b0JJcHpwQ1dnZmFDV3E3Z0hJMVJZSjlpRzgxWDJ4Q2M3U3Y5RHVkaVBab3RD?=
 =?utf-8?B?UkVWbWdxTysxN00zNHlLeEkrcFVCTzBuQ0VDVi93SmdpblJmMkEyL1dUM0Jw?=
 =?utf-8?B?SzAzdldOK09POTlMYlRnT1ZoTGxZa1lPK2o1aXpBUHVESXRKY0hWd1RVck0w?=
 =?utf-8?B?dHQzVEF3ZzhGa3ZvTFhaY3ZIY201dk80QjRRRlBCZXo1L3N1c2tjcEd3VlVK?=
 =?utf-8?B?d2czaW9BWWIyMlFwQy90ZEgyUGVhV3k2akF0aGhEL01HZ1ZOa2w3QzdZVHk5?=
 =?utf-8?B?NkEyYnhmM3ByUnE0dGZhS3N6K2NCZTFtUXV0ZkFPa0tGK3cxQm1ycmZHbEoy?=
 =?utf-8?B?YWxvT01nRmV4RWJKaWthTFNhRFYvSEJsZUdsYTBhcUNWSDkxc0t6cUVVZUxx?=
 =?utf-8?B?djhzQVV2WllyN1RGeEhCeVRmNnNqR0E0MEt1aFdxNHVXYkVhL0hZUmwrZjc1?=
 =?utf-8?B?UHZLOUN0ejRjamtDd1J4V0ZueFVxVHVKUThabmV2MEJvR3FzdUNnSW9yUjJu?=
 =?utf-8?B?ZkpOOTdkTmUvUXpEN2NnWVdFUVJvM2M4eWhOM1U3KzlMV3haL1Nyb1dYVXZZ?=
 =?utf-8?Q?q2tvtKEwDGKHwnYO88JEMZoG3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e1c73c-0649-4c5f-3eab-08dd2f627781
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:11.5728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8NMrR4Dg99KDbO/rQKWdMojckQUyCs3hfm6CdXSV2f8KCFIOqIJjI82BGoOJu5aL2I6pdzJq5bfQoM4xPEhsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> parse_rgb() now takes struct color_platform instead of struct
> platform_zone to support upcoming refactor.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index ec64a8f22301..e54e3cc45691 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -434,7 +434,7 @@ static u8 global_brightness;
>   /*
>    * Helpers used for zone control
>    */
> -static int parse_rgb(const char *buf, struct platform_zone *zone)
> +static int parse_rgb(const char *buf, struct color_platform *colors)
>   {
>   	long unsigned int rgb;
>   	int ret;
> @@ -454,7 +454,7 @@ static int parse_rgb(const char *buf, struct platform_zone *zone)
>   	repackager.package = rgb & 0x0f0f0f0f;
>   	pr_debug("alienware-wmi: r: %d g:%d b: %d\n",
>   		 repackager.cp.red, repackager.cp.green, repackager.cp.blue);
> -	zone->colors = repackager.cp;
> +	*colors = repackager.cp;
>   	return 0;
>   }
>   
> @@ -538,7 +538,7 @@ static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
>   		pr_err("alienware-wmi: invalid target zone\n");
>   		return 1;
>   	}
> -	ret = parse_rgb(buf, target_zone);
> +	ret = parse_rgb(buf, &target_zone->colors);
>   	if (ret)
>   		return ret;
>   	ret = alienware_update_led(target_zone);

