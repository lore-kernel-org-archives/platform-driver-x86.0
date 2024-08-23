Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25744188586
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724423368; cv=fail; b=f1LL0qbqqj7OftkO6tdWPrmlZPELFOqC9VDpoLT9gH4D4H0EjhJOP0dopWIWBnKcw84aMgfLjP6LCftaMF6rR1bzr4E54raVjulKkF3jOwv7ea8M1D4izk7/Xtfw3yww/9CDXGElPC9efSwbFYHy0+RFPLIbapQhOZiXm8FckwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724423368; c=relaxed/simple;
	bh=f5tvVjk7I/zuaw0EdbuQCHFAP2j66kk6A1ZWPP74kCw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FDmmsAREZKZSbItPJQsxqJIVkfkYJQ0iC0IsrSL1pPLXGEW7Ld0kkn1xhpoQPgHSS7mOe9glGq1hX4K1MJawFny+uFeTw+zj44KE57lGOb1LHIfFsa5Jfp9141V50nmAqKwGEuQfWCfPCncoTVC5DQdrdfZPSk5FXtTi0dg4U+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5egxFYTN; arc=fail smtp.client-ip=40.107.244.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5egxFYTN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxZ33ywzCFo6fsBWzqUuR2vOuLFnYZsMgj5aprcROe61pzmWpKJkgirw3xNbc/rbls8C6A/sfGs7lWdlkSKsL2GAN3BR2RoRcQ3Pb0nXyW61f+1aBerzRAiagMSv7Y0laZwzwjE2subT8eDjAHLZSj7K68HhrEEjBD9i/2mFh91vnS64wWWQRNDlzWDSjVZUQXbe9y4K0g4ItQ7zYTtXQjTOnM45fRRljfgDSf0Xv/OKJgg9DVObgn7R/TQ/6PrEXjBP3GWnoOfzYsUna2bemsmeXYYCEtH4TdckHCgXt2MGFn2y+wUtvk6V0aTAUhbt2ulbW5tXQOA61dyT8pSIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nmy6lS3xNU4R1MtCkafZNQgw7tIcgliP1UQNaD3eRv0=;
 b=LJZeDLxrLddFvCgY4ncIl+njl6CdvxaI1FclOFfd0hRTxnfY/V9WTFDImGbrYUVX7NCkTN6+q6GkTBscuZ9FT/OM+IyrsbBCj8XRz5VtvSdQVcV2jjIyllowPClEIRvd6O7thkhhwmGa2QTxUxj2DSpNbRO8oxwZdbrdPKORS6wlD9D+zawMp5cJxxXZdkuM2XbgFemrXFRlfjeBFdAKJXXmszFZJrSB116bad+N/Y6f4FXK1H/9j/bpO4SdADc6E3ph9uLcgdrekcAftesKdTbxvsZ9IiMAEbVNUoWp46UGmEBhvY5BX+FqW38iahTOfYGpkyt4O+a+XjZzd/boNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nmy6lS3xNU4R1MtCkafZNQgw7tIcgliP1UQNaD3eRv0=;
 b=5egxFYTN4hVvKtY8UPiUim9TBrhJVXPOK0zD+g359gbNxwm5lEefKN1vtSBcfqo6UdNWb1z1fmiaQcX+nLcL5NxvloIpurhtIJ62o6U/NCKrznr3I38cKGwslybaj7dw55+Vnp/kQh1NRhujvGUgkVlkKUamrMJVsGRQ3E1tvmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 14:29:24 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 14:29:20 +0000
Message-ID: <7adaddbb-ca46-4374-b0f6-55522676389b@amd.com>
Date: Fri, 23 Aug 2024 19:59:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmc: Fix SMU command submission
 path on new AMD platform
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
 <f81c0083-b096-cfe5-9137-46a3674bf3d7@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <f81c0083-b096-cfe5-9137-46a3674bf3d7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|LV2PR12MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 33370e62-b2e5-40d3-b83d-08dcc37ff9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUsxWEp6U09MTlEwSE5ldWlGTDFaNzlEY3ZENEZKSi9TdHpFbWFvT3JsNXIz?=
 =?utf-8?B?SVhaYW1VZXF2ZnA3TGNCM3RDUnJ1WUhYWTExQ1VmYlFETjl4ZzZ2a1NySXgz?=
 =?utf-8?B?cnEwV3B0ODgybGt3QmRsRURiWjQwVUxlZ1l4c3Y1dGpBUDhHV0VDWllMTXE4?=
 =?utf-8?B?clMrRlZXeFFGb2xTMDJoWUo1ZThIMzJ6aGJDNVF0RDgyVC92VHljbHBBcWli?=
 =?utf-8?B?VUhRNFZVQlB2RWozWU9sWUhNc3hwU0dEZ01TaUlHOEFoaGZLV1hGTE04RlJY?=
 =?utf-8?B?UHZ5d1JqQVByVTM3bWd3dzFGTS9uZWVXYlp6c1hIcGlKQkU3UzRDWjhMK2I5?=
 =?utf-8?B?a29LWE02N1FzZEhBbkJoKzZmZFpQK0Q4RzN3NTFJQjJaMTVod3hjYnNjNjFY?=
 =?utf-8?B?MlFhN1pZMVk4cWlYV0VoY01RMmo4RERwT3ZoSUxPU1ExRXY2NzZJT3FTa1kr?=
 =?utf-8?B?NHhCS0NXQnBnclBwTjN5aXBWWm15bW9Qek9HaXBHUE1kN3J2OGlIWEsvUVFI?=
 =?utf-8?B?SG54TXg3cStWUVlCQXYxdnhWT2ZhbTkzZTlPZ04zNGJJYTFnQlJ2Q0hRb2lp?=
 =?utf-8?B?bVNheEN2TnBFMVcwS3ZUNldhYzVVVVNTcXZjNTA0ZHhtYUc1dm15ejNNZ3Qr?=
 =?utf-8?B?TkRNNGJCZHFWRUp2TE41VHJiMStadDhmWHF1RzZiUHB2bGJ4dEVDQ3EzdDBk?=
 =?utf-8?B?ZTBkZjV5d2dNSnJyREpoaCtaUGlEdzg0Mmw3M0hrSzAvYktaZ1lTT1ZlZjQ5?=
 =?utf-8?B?SERienlZc0x5ODdNdEprOU84aGtjelA2NWRXemhuVzlVSG51bzdLUW5sSHlB?=
 =?utf-8?B?TU43bCtFZWFzV203N055cjVKZ0pBN2JDMjR4azNLelBCSGNBNE9hUVp3T201?=
 =?utf-8?B?WkFBR0FvRUVTU1l1Y1dPaXJMdi9TNTdrZ3BUMVpRclQ1Y1ZBVlUzZ3VUQ2dk?=
 =?utf-8?B?cmJMeEhUYzFJQVk5OHBac3VhRHdtR0dCb1J6ajdNb092OGRQNit2S291YzR0?=
 =?utf-8?B?NHF5QWRRekdpeVhXaHdzVjQvTitpSkpFVnhSb3FEWEw5TXQ2MmV1bVlEd2lN?=
 =?utf-8?B?MDdPTzBGK20xVDMySXQ4SjJDWjJkUnY4Uk1Ua29iZzRaSHdZYVoza1RELzVF?=
 =?utf-8?B?ZWtWRGliU2pGNnNCZ1h6dW9jRnBWbERJOXRyTWp1NWVnN3g1K0Exd0dyK1lQ?=
 =?utf-8?B?Q2JJV2lWYzliWUtqT1R5WlpCeTdoc3BEZ3psdG0yemNKc3RTWE1hVlN3eUlu?=
 =?utf-8?B?STFqMXUvdlZsM0ZxWFE1eGl2NHhjWkQ1MzhvNmpxNGVtV0s1UUZjczRWTmxk?=
 =?utf-8?B?VkJRek1xcnkzbFczQ2hoWnNKbC9PaFF5cXZPcHV5d0M2NjBLaXhnY213SnpS?=
 =?utf-8?B?aFVKVllmSmtQVVlSS0lsWUcyMEdGSGROcVFMNzhvRkxiQzdLWDlFMU5rSkx3?=
 =?utf-8?B?eVJoeHcxR3htc0VoN0Y3Uks5WFF6dEd5L2cxdnpRaHN1amlSWC9JVkxzUTBR?=
 =?utf-8?B?aUpFRHZWaEhqeGtScnVaaE9jaWYrdFBENWNOd0M1bEx1NkNSZWdxNmJzVklC?=
 =?utf-8?B?eTUxWlI1eFhLNlZrcmp2cmlIQ3NzN3ZVTjUwSFFPVFRkMnpNUC9KSEdaSlIz?=
 =?utf-8?B?ZmZaVjZlYlNNSVN4enpMZnhVT2RxK1lFQXU4eDlJNXQrWGNlTGNBZ1ZDdXh2?=
 =?utf-8?B?UTZ5SHRkVnRNRm1iTVl4WXBlSk8xeFJxRCthU3IrdVVwOFNqeW85U3U0cE9D?=
 =?utf-8?B?MG42UjVuNCs4cXNiRWcyTHUrVUgwbGZoK0pqK3h2dUtqMDRNeVNHcTZXOFRN?=
 =?utf-8?B?dHdNck1BdEFPTHhldHVqdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1FweXFpK25YanBlamJGbm5vbnFDNlNCaStHQ01lMkZFWVhaNEJEbUY2eG95?=
 =?utf-8?B?K0owNGdUSWlPQTVXVFRqdTFscjkyRFhZMHVFN3dvL21VRkkrZ3NUMTZFMC8x?=
 =?utf-8?B?NE1IS05xdWI5SGxidnVXbHZGWFVySmx3YlhoWTNNS2NvdHRaeUl4SklYZHVy?=
 =?utf-8?B?Q3hmQTI0eHp4Vk4zRUpFcXZsY3Ewa01uQmRic2p0SXJxTTVvKyt0ZmM5RDRR?=
 =?utf-8?B?S0hGcGRFSTI4Y3BCTDBwQVhFYXdET09ibldDNDl4M2FuZTYxYjhCYjRnbXlW?=
 =?utf-8?B?NHRTM2RpYjF4d2tIcHdlbmI4aHBlRmRwRmVaSTRHNEo0SlRyam9KMHg5cm00?=
 =?utf-8?B?dVhHQlhEd3JaRmdyYWZDVkd5Q0oxMTNWaCswcVRTMGloNU1nemY0OGRaRnBY?=
 =?utf-8?B?YWhtL1RLYklKbjVOaFIxeXB3ZytpbTJGMjdnT21wa2VRZnVpb2NERm1hdzZk?=
 =?utf-8?B?dlNaSmo0OEJ6UkFiZXA5YW5kelhKZ3gxaVY1ZjhObTUydk9ERHRuTk9jMml6?=
 =?utf-8?B?ZVAzOHR4QUFsUkJmSjh1MkVVZjdXek9HMzlmZ2QydFM4Ymx3U1paRTRIUWV6?=
 =?utf-8?B?NjlxUWFKSDNCK2tibWNwdUtucWJmZmFCZVlWajFQK3U3a2svb244TGZHL1ZO?=
 =?utf-8?B?aytzUFpDTysyOS9sSWNHZXlBb2dFbVRJbXBadExRbklLMWNCNmdrSU5lZU5u?=
 =?utf-8?B?Um9icys2Nmp6bllQaVVhdi9aVkc2WmsrU1lDb0tNNEdNdlJBOWFDTFp5RlVB?=
 =?utf-8?B?QjVMUVhMN3gxWEE3WDAvTWplSkNmcXJxTVgrTXRuMXE1c0RGb3Q3Q0lvMU54?=
 =?utf-8?B?bXpmZC9wRXFEYnI5S0t4aktETG5mZW1mY1NPOVp0OFY2Yk9teERMb0laUlQv?=
 =?utf-8?B?OXV2MjZMM2I5SSt5ZnE0a3hKTjRHSSsvMEk1bHlrMG9vQ3pNZ3VocjMrQVlu?=
 =?utf-8?B?blhzUC9TcGcyTExHK0ZOekhEZHFXL1hmMUZpdzlqMXh5MDBUOEpOR3d4UkRi?=
 =?utf-8?B?OGtHazhiWHJJZEd5bklmVVBVT3pQVS9KNXlBN2I0L1ViTDJLMHdzaU1QZDFE?=
 =?utf-8?B?Y2c5UUNjWTE4MGdCY3luYUFlb09Vd2J1Zit6SEQ1VDMzcFZjZWtyMk1KZ1R0?=
 =?utf-8?B?RDhVcDRta2FSSm5tUUlPb09QS3dCSEFQMkt4aWYyODJHbmRpMEFoV25YRWUx?=
 =?utf-8?B?MWlmSjc3U2FJVnNWeGRNZGM1MnBXSkFTRDVwV2FucStiV0l1V2o3RUNUaDQr?=
 =?utf-8?B?NkJwenZ5ZXdweGlnM0hVUjRvOTRNb1Z3SFdrR2dSL05rVWRMTE1SeUwzeElr?=
 =?utf-8?B?TkFCekdMTzJiM052KzRKazZtRzRselNCS1lOU21RcWRxN3RWOEd5aTFWQnlM?=
 =?utf-8?B?b1lwYXA4eGxLL1M5SnBxLzFaVVA3c1dMSkZxY0dGUFJyR1FvRUo5RURFWk1Q?=
 =?utf-8?B?b0xYK29ZY0wxcldodUdCaEFNd0ZlbmxKcDRITnA4R2d3ZjJCUThLOUU5WVYw?=
 =?utf-8?B?R0xCOW1rajA4WS96RXpMWUI5T0dYM0cwbnJNWGlNb2dYR3VNaHpvSWI0QnhD?=
 =?utf-8?B?UG9wRGdkcHRXVjlZdzVPYm16bWJvU2FlaUxqVVhUYi9hQ2RMUDFMZkJxQktW?=
 =?utf-8?B?M0xoVjUxcmJnNmh2NUo1TlpZQ1pZOHhxRWZZNVViMXNsNGRiMzhsVFcxUXFs?=
 =?utf-8?B?Nm91cWpTZEdFeFFZdnJKMHFIU3o4NEFoVWRBOFRZNk5EaC9iQlRyblo1Y2w1?=
 =?utf-8?B?Y3BIRWk2NHRpN2kyMm5SSjV0NWN0UW5CbjhZTDgvMnRSM0VWQzdKYTRkdkdQ?=
 =?utf-8?B?VVoxaWlCNzRlY1VFK2p0SFlma2pLRHhEWG9CQkRqSFl1MjJPL1R2eE1Ia0sz?=
 =?utf-8?B?V1pZOFFSWXYvMG1MSXBlaUNaRFMrVkIydUIxY0Z4aHdoL2U1QlNGMHIzZTNT?=
 =?utf-8?B?UGloeFYvdVlYYXkxQmNlVGlzYkcyKzdldDI2blJWRGJhc0tlUDBRV0hLdUNY?=
 =?utf-8?B?Vlg5bkNpcS9NQjVEcjZZTFB4RVE0ajJ6MVpKVk1PK1ZjZ05uRnRUODBvQWlS?=
 =?utf-8?B?WU8vUEwySG9XalZQR3BNQXZvY29mcDIwNnBNcUo1Ylh2NEZHWWthY3ZoVVRV?=
 =?utf-8?Q?gpDLrg27BjuExFLkjW0MOFZZe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33370e62-b2e5-40d3-b83d-08dcc37ff9fd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:29:20.5166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyEAqY//wJUEHfiXeoroyWtzfclpF9F7VCrBQVlpNn8YQZwEIbV60ZPkGbLdkNinutAhlpB7FmovUi3DG73OMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991



On 8/23/2024 19:49, Ilpo Järvinen wrote:
> On Thu, 22 Aug 2024, Shyam Sundar S K wrote:
> 
>> The commit 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for
>> new AMD platform") was introduced to enable sending mailbox commands to
>> PMFW on newer platforms. However, it was later discovered that the commit
>> did not configure the correct message port ID (i.e., S2D or PMC). Without
>> this configuration, all command submissions to PMFW are treated as
>> invalid, leading to command failures.
>>
>> To address this issue, the CPU ID association for the new platform needs
>> to be added in amd_pmc_get_ip_info(). This ensures that the correct SMU
>> port IDs are selected.
>>
>> Fixes: 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for new AMD platform")
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
> 
> Hi,
> 
> I've applied both of these patches to review-ilpo now. The above doesn't 
> inspire much confidence though as that sounded like nothing worked with 
> 426463d94d45 so it probably wasn't tested at all before sending. :-(
> 

Hi Ilpo,

I apologize for the oversight. The SMU message ID was hardcoded in my
bring-up environment during testing, which is why I didn't consider
adding the CPU ID check in amd_pmc_get_ip_info().

But surely will take of this in future.

Thanks,
Shyam
