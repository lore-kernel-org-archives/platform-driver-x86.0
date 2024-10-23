Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227171D554
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729692315; cv=fail; b=bpJvIjkA5qJ2sl+BWQpqQEQu8fdOf+IZmJBzPHD3Gfq2hQZSSIOHWc1Xs3m6yNzGZlSvsX8MprqtH0J7/PzGut28dyZCZRa2yVEvziSLYn9/5UAKEmSeNRg2MPoE7xnTy8bazqYEyn8rK9nP+m1WlIPJZ5oYqkDLNXQHGB6xxGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729692315; c=relaxed/simple;
	bh=97ic+8QxVh1LeE8lI4Xc7ECdM1TSkKxCdGpy1jPgVos=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W/AKDjGIwevnyv9omxTJ322DXk3Xj0tO6xibDMmTSVWM9UDB+5Pm/tFwg1qr8VvVXON07b2zSBj7yXU8J2ATUnPWKwNo2xDCx5r0DMxYGJ85kW1aB8IzNcLy+6I7fT5p0rqnt8ZlhniXqV9JFWSWa+hbMnQhDB/h31IR4f45I0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yt/1J+uD; arc=fail smtp.client-ip=40.107.101.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yt/1J+uD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaoWjOpDRpMO+6dzVwngUFgQ22V2QxBof45CglwDcaaikGpCdmZJubpJZB6xJ/G0MXY8jh3x9FcFRKzK4q/eOGn4wPP37x7XhsUa2RkAXQZE8UcNoL9/K4/XfTnxmeiD9ZytX//5Wd2DXBgOj3OjIPYPadq9dTjug4XDrbqxd80u0ZJZoau8c/sqc/S0HcAliJfxw9nwvHWUvVQqiBl9iZZWsMPn8VFNXIVE+rV4rvsqGZ4ZuaPoh+R/B6HeCGDBg3NBdkeVWAgaf2qjsGT1SX5f5NNIPpsH6aXHPd+EVnV1YigAwO5KUrgiG2WmDEL2rUf/QrB1vCMXxEgjVrgEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wROJyAieZKFMzDjvyIM2lT+46EsLMXTc+pi09yQK2I=;
 b=J0FemiPzZdhKy+OJxQO8EYIsMdn58TpENUi+F0oMZN0wCAO4k7cJBBYCtShzqD+ScO41u5nCJZCMKZHxSMc6MDP5Xm9r0IVR3onxZCUJSl9HxZXMed3MyTLx8x0KxUb+wqpUBQ0S/lAMcnrZEC+aCcRSz8RJW4bMtR5Z1LKh5YEPmPG0Fw1JcnGlLMZVucc4sexkE4Z50dyhnmqdcxWhkXmcO0i4Gcx9kxNSO7VWFIwu2bo0eMog030w7rZkjEGFc3UiRE7IxNVVw/qozpalRwrfO4MDJhGY1IXnu4tdtEuShezdhhMUQqX5ehLB24tBU9w+dyUCYTwCgkP2/ibBOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wROJyAieZKFMzDjvyIM2lT+46EsLMXTc+pi09yQK2I=;
 b=Yt/1J+uDV8a6P7sSEcMN7DOH4vYlRyeX6R7s89HPFeIMkYECcf43eZ0tGLMpMRizwEiPyVo3+jhvd7tcBXIEmDCcpgqvreZDt2PfS8P1rj7MZNC/RQXwZkyEcQBJb1cUIbULNXp+UJuCXlRaJlX5w+fJ9mI3EjZY4irirliMFp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 14:05:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 14:05:09 +0000
Message-ID: <e4163be3-1b42-4d28-b025-91734e9bff5c@amd.com>
Date: Wed, 23 Oct 2024 09:05:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] platform/x86/amd/pmf: Switch to
 platform_get_resource() and devm_ioremap_resource()
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-5-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241023063245.1404420-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: 5abc2f18-747e-4e6c-97d7-08dcf36bb466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkZFTW5NK0p1dHVPbStSbEhwUkx4M0tQazgxK0xsaENYK1dVcmhTNGpOdkk5?=
 =?utf-8?B?T3ZEQmpaV3JBeENySkVodHUrRmk0K21sK1lVRjF5R2htRmRBN3B6RGlxRzVI?=
 =?utf-8?B?bFJSNVVGN2dQRjArMmRnQTFXb2U0SFlFbWRXMGdPZFBPakFYaTF6R05EVHNH?=
 =?utf-8?B?OHNLd0VaNG90TUVHRGY1Y0h0UkJHcXlXa3c0OVA1ZHRGUG9udmFGV3RGMDVH?=
 =?utf-8?B?UlIrSkNlQTJVZGsxTndwVGNaZFpvcWJFQ2lZaDJ4Mm5kSHNKUnBrKzlEdkR4?=
 =?utf-8?B?QnBLdFBsSjBIcEp0QUlYZ1J6TTBkbVowb3VxT1JtSE9vb2VORWZHZEVsNEty?=
 =?utf-8?B?bjdUVWwwckZYdUdoMkhCUEhCR05rcDkwc2dkdGVHc0lYLzlCdG13Uk91N043?=
 =?utf-8?B?VDZTUG9FeXhYMDJLU3AweFdMY0t4Zk53b3kyaHpsZDJxNm8rWExtRkovdHds?=
 =?utf-8?B?OUNQUWhxK0txd0o5b1NiVzZpME9DZGZpYld4NSt5QUR3YkUzOWRTS3hoaTN5?=
 =?utf-8?B?YjhiQVUrZXVhZzVyNXRCaDZ4Z3BrR0I3b04rZ1JadVpFVGJkWlJqYXM3ZU1U?=
 =?utf-8?B?U3dSbmd3UGpTS25sMEI4ejAyN1kzME9ZTEpMM1pydzMzWHlXY2cxVHJpOTND?=
 =?utf-8?B?RnlYSlZDR01VTWNtNkZwYUxxdnFSRUlQdUxaNzZmdk1HU1N0b210ZkpMQWk5?=
 =?utf-8?B?czZkak9aSi81NE1xRGVoVE55bDFKUmI1TTdmcWVYd2hPOUpPMVd3YW9UcmhF?=
 =?utf-8?B?ZFVlYkxsWVpWWk9HVTdMNTlQcUZKb3BuTlBMaFlUdEYwMm1NM1AwUnY3YWM4?=
 =?utf-8?B?WGNHT3gvVW9SZnNmMndYMmR6WTdUNEpPbGQ4NS9WcGkyeVJiTnBKZVdSbndW?=
 =?utf-8?B?NDZObUxMeWJMdW9rbm5PcU1Od2ZaUkVaVnhvcEFNU3hBVmZ4WHRGU1lZYWdR?=
 =?utf-8?B?MGZ6UWRFTENHTUE5akdncHNOYlVERktHb1dESmZTMnlxV21nU3hXZXJmYTc4?=
 =?utf-8?B?SVJrTlJrZndBbGwwcFpZb1ZMQmVwY1h4bFlJVUZnYS83S3FzWHRrdWdudDFk?=
 =?utf-8?B?S2RiM2l4RG1ZWG9Vc0NGQ2hGOTdVQndFaGEvZkl6RkFZdUU3YTF1M1ArdEtB?=
 =?utf-8?B?bkE4eFNjRmFFTVY1ZEFSYURVc3JwQk5iWkR4bVhZcmdmbCtkNGZKZzFibXAr?=
 =?utf-8?B?emMyYmZzWXgyS0daRXZubFRWbFE2bzdsdjJmRVgrZFliVFJrWWVjbXlQWlVB?=
 =?utf-8?B?ZjQ5SjVEZGRwR0o0YzI3QTZnKzFhS3hHTXhUcmhnNVVoTTQrWjJFZTMxdlQ1?=
 =?utf-8?B?RTlrbnVkblV3MmwvUG50OXVCQzIrbEo1TlBBQlV4aDdqSmxYNWxxalJPKzV6?=
 =?utf-8?B?azUzM0dIMHZhWGVieU9QN2lsRDI3Y2FQaWdXNG9yY3NmS0hrSUpBWXVJNDk1?=
 =?utf-8?B?d3p4cWFHa0xVc3RpN29PRUxSdk9DTTkyV3R0SG9YaXF2dW9vMG1zVTZOQ0tq?=
 =?utf-8?B?SGQ1amRIWnVHMGh2YlVLUGNrS2tOZnl3RTJNeTM3SzNDa3gwS2VUN0Q1dlI3?=
 =?utf-8?B?bTkvU1duTGJuZHNlUFVoSk5rd0tKUldDTitNb0tWWVgwREhPRGk1MjdKRU9J?=
 =?utf-8?B?N05CcEwvMXViYmNVc1psZFczenl1b1NsTE1LSC9vYXdoOHlwNkNmcGtSRk5k?=
 =?utf-8?B?UWh4bGhDejgraVJMek1jK0hieHhRUG5lbFkzWk1vZFJMK1JGSWswWGozcmNL?=
 =?utf-8?Q?xl5HGPQmTshzRO4lvmx0nY65CTnQnSfbPpO74bI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC9OTmR4QUl5KzNIK3hFYVE5czNmc2dFRUZaR2hjZzZ6UldKelJna1N1d2Vo?=
 =?utf-8?B?S0FJeHZnNnpqYWNhVEcxT3JlM3JtN0kwTEdWY1Q5ZEkzMlA1UDB4UVhkWDhu?=
 =?utf-8?B?cFNsSldFb3l3ZkVqajFZaSt6S0JCd2Y5OWVGbU9kNkpSS2t6YUVJSTl0blBx?=
 =?utf-8?B?dk54bHJONzYvdG5tSHNCcjJZbHFkY0YvRWFaamR1K1p2U1psSkJFMG4vVnZp?=
 =?utf-8?B?clphTUlMK1dRcGJ5QlBZbFIzVFducU44MTNDQnMvN203YzNPaHgrdUluMDhw?=
 =?utf-8?B?S3Iza1FpSW9SMFRvS2tBNE9sVFBGbCs5bHdnbWxEdWEvcy9FWmwyaW9KSG9X?=
 =?utf-8?B?bU03YkthOVlIcTczZ2JGTDNYa2tuZUNNeHhhTkRCUVJINDNCaDFWZzNWMFdm?=
 =?utf-8?B?THRVZVdiSkZtZDFoMXM3OXVKMkd4K2I3RHMwUms4WDVjcVo5QVJFRWRqY2hx?=
 =?utf-8?B?Mmt0TDhIWWJpYTN0TVFmUnZYS21tTDFRRWMvZ1VIdk4vYldzZU1WZ09CZ1NM?=
 =?utf-8?B?TTNkR2FXYzdEcENCSWNGN3h6YU53bER3SXpZZmVvcThZNEpXVVF5TCtFTkl0?=
 =?utf-8?B?clc4ZzB2ZjlHMFFNN2ZuMTMzNGc0UjhBbXovZzZxWHluTGJzVGlWWjRkR2RI?=
 =?utf-8?B?RzB6aXBKVXMwaTFVWFJxaXFMczRxM0pnNEdNSm5WMmQrUXlqL2dIQkJaVWhJ?=
 =?utf-8?B?T2NFc3ovejFIRnBRZEl1aXRVazJITHlmb2p1TzVza0ZSNElRYVBFMnVCRVhx?=
 =?utf-8?B?LzM0LytWclcvaGU5QWRaUXNIV3UxUkttRVBZeVNNc0tIOHJrR2prejN5Z3hl?=
 =?utf-8?B?a21oNCtGUkxWV0dEVmh0N0l1QkdhUWhCcGJHUm1VVzdWU2JWa3JjeWFsTHps?=
 =?utf-8?B?ZDBQYWRNRUhDY0dQWTZFSHpremZhY3NSY2dYcFhCeVJJVVdyTExCS3pkVTds?=
 =?utf-8?B?Qk9KbC9RdERSVGJSYi9Wa1VZbU5IdWNyUWhwWGxodWluR1NublU2ZmZvclU5?=
 =?utf-8?B?NUlFRzlpZFByYXZzbXJMNTNaQXVCUEQ0aTI0bTk3T25XNnJmQVJFYmJZSDJS?=
 =?utf-8?B?c241V01kRDdEQ3ZjT3labzFVUUFaUTdxOXZJd1V0RVVWQXJBbjRqMEZMNVcx?=
 =?utf-8?B?SVZEcHJ2WnVWdFhBZ2cxbTZjK2g4NzhHdEFhSDR4L2l1LzRERkVxOGNnb0dO?=
 =?utf-8?B?NTRRNnRDNkxBb3JydS8rUTNuV2k5dXd6bFVmNXdQcEE0c2k5US8vV1lsU2JS?=
 =?utf-8?B?NGJuSFNzelhqTVM5MFFLTkpGcGtmUmtXQ21CNUI4M3YvWHd2M1NJT3NLYktk?=
 =?utf-8?B?VTR2amFvZUdOczkwRXdYcUJFOHBNblY5bDBUa0g1VitCcnBiQmltQVdmUHNm?=
 =?utf-8?B?eTNBUkx1L0tCOXljb1NXK1hvSlRWUnl3YlViemVsaEpDejJ0ZGNyeTJSVnR3?=
 =?utf-8?B?SUtFZVBUSHVSNm1KMEsyc2xLeDc4VFFOQU13TVpIV25Vbng3WDB3Ulk5T2dO?=
 =?utf-8?B?M1dSY2V1UnNsYWRBcnpVanZIL1JHOXhtaGdwbFVuQ2tyM0JPUnB6UlNKM3dM?=
 =?utf-8?B?L1dpdTJYaVkxb0UyOWVhSFQ0em8vdmFMbnNaWGk1Zjd6WFNLWlJYdERRNUF1?=
 =?utf-8?B?bExBVHM0SUhrMTc2SXpkRS9tb3cvQmlxTEJDL3U5YTFSNm00VmJXeWJzR1ZK?=
 =?utf-8?B?Y2o2UGZ1OVBNZ2dUUXB3dVJYdDRxbDBNVXI5OUx4a3F4c25aODBEOHRQeUhI?=
 =?utf-8?B?UFZtRnd0ZE5zL1AyVHNOQzk4T1BsZWVVVUE4WUdlYkQ2VUdDOTRLZm92cHcr?=
 =?utf-8?B?NUZqbUV2b0IxcHBEV1pBUzA5YmVLS2tVWEJIWW92cm4zQm96Mkk4ZzlOcEhM?=
 =?utf-8?B?blMwWjB1dnJTZFZBMUFpMnR2WFd4eTZjUmFldWFYdFNHcVJTQ1BwaVdDZzJh?=
 =?utf-8?B?eEJHN1lTM0J1aWh1TVk1NXFyb0VsNGJUSWgwSFVOUS9oTnNxdW5uNzhLRm9F?=
 =?utf-8?B?bmNyV2FtOER5OUFPdHpQeFlXU1pEVTc0WHBCY2pWWG1hSzNMTFFlczNXeDc0?=
 =?utf-8?B?NWRLYW41M3J1eDZ3aWJ1cXRmaTlwWmh1QjIzdFpmdzU3Z2s2QlB1Z3Zrd21B?=
 =?utf-8?Q?j5h9ZjIFUdIlm+T3OVIsoA0oH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abc2f18-747e-4e6c-97d7-08dcf36bb466
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:05:09.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QikMh6XNvFdrsCDSIhVW83NF1xtT8ucb1FW1U4BUQfdr4G9E6rVo2a4j9m75Ju6clxMCTaG/wG3QeOhUm7Nyeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148

On 10/23/2024 01:32, Shyam Sundar S K wrote:
> Use platform_get_resource() to fetch the memory resource instead of
> acpi_walk_resources() and devm_ioremap_resource() for mapping the
> resources.
> 
> PS: We cannot use resource_size() here because it adds an extra byte to round
> off the size. In the case of PMF ResourceTemplate(), this rounding is
> already handled within the _CRS. Using resource_size() would increase the
> resource size by 1, causing a mismatch with the length field and leading
> to issues. Therefore, simply use end-start of the ACPI resource to obtain
> the actual length.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>   drivers/platform/x86/amd/pmf/acpi.c   | 46 +++++++++++----------------
>   drivers/platform/x86/amd/pmf/pmf.h    |  6 ++--
>   drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
>   4 files changed, 28 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f4fa8bd8bda8..99d67cdbd91e 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -11,6 +11,7 @@ config AMD_PMF
>   	select ACPI_PLATFORM_PROFILE
>   	depends on TEE && AMDTEE
>   	depends on AMD_SFH_HID
> +	depends on HAS_IOMEM
>   	help
>   	  This driver provides support for the AMD Platform Management Framework.
>   	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index d5b496433d69..62f984fe40c6 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -433,37 +433,29 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>   	return 0;
>   }
>   
> -static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>   {
> -	struct amd_pmf_dev *dev = data;
> +	struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>   
> -	switch (res->type) {
> -	case ACPI_RESOURCE_TYPE_ADDRESS64:
> -		dev->policy_addr = res->data.address64.address.minimum;
> -		dev->policy_sz = res->data.address64.address.address_length;
> -		break;
> -	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> -		dev->policy_addr = res->data.fixed_memory32.address;
> -		dev->policy_sz = res->data.fixed_memory32.address_length;
> -		break;
> -	}
> -
> -	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
> -		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
> -		return AE_ERROR;
> +	pmf_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!pmf_dev->res) {
> +		dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
> +		return -EINVAL;
>   	}
>   
> -	return AE_OK;
> -}
> -
> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> -{
> -	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> -	acpi_status status;
> -
> -	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
> -	if (ACPI_FAILURE(status)) {
> -		dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
> +	pmf_dev->policy_addr = pmf_dev->res->start;
> +	/*
> +	 * We cannot use resource_size() here because it adds an extra byte to round off the size.
> +	 * In the case of PMF ResourceTemplate(), this rounding is already handled within the _CRS.
> +	 * Using resource_size() would increase the resource size by 1, causing a mismatch with the
> +	 * length field and leading to issues. Therefore, simply use end-start of the ACPI resource
> +	 * to obtain the actual length.
> +	 */
> +	pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
> +
> +	if (!pmf_dev->policy_addr || pmf_dev->policy_sz > POLICY_BUF_MAX_SZ ||
> +	    pmf_dev->policy_sz == 0) {
> +		dev_err(pmf_dev->dev, "Incorrect policy params, possibly a SBIOS bug\n");

This upgrades the previous message from debug to error.

TL;DR I feel this error should stay as dev_dbg() if no function checks 
are present for Smart PC.

I don't think it's necessarily an error though.
Smart PC checks are a bit different than the other checks.  There isn't 
a check for a bit being set to indicate the function is supported.

So if the BIOS has the declaration for the region but it's not populated 
it might not have a Smart PC policy and this shouldn't be reported as a 
BIOS bug.

>   		return -EINVAL;
>   	}
>   
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 8ce8816da9c1..a79808fda1d8 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -13,6 +13,7 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/input.h>
> +#include <linux/platform_device.h>
>   #include <linux/platform_profile.h>
>   
>   #define POLICY_BUF_MAX_SZ		0x4b000
> @@ -355,19 +356,20 @@ struct amd_pmf_dev {
>   	/* Smart PC solution builder */
>   	struct dentry *esbin;
>   	unsigned char *policy_buf;
> -	u32 policy_sz;
> +	resource_size_t policy_sz;
>   	struct tee_context *tee_ctx;
>   	struct tee_shm *fw_shm_pool;
>   	u32 session_id;
>   	void *shbuf;
>   	struct delayed_work pb_work;
>   	struct pmf_action_table *prev_data;
> -	u64 policy_addr;
> +	resource_size_t policy_addr;
>   	void __iomem *policy_base;
>   	bool smart_pc_enabled;
>   	u16 pmf_if_version;
>   	struct input_dev *pmf_idev;
>   	size_t mtable_size;
> +	struct resource *res;
>   };
>   
>   struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 19c27b6e4666..555b8d6314e0 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>   		return -ENODEV;
>   	}
>   
> -	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
> +	dev_dbg(dev->dev, "Policy Binary size: %llu bytes\n", dev->policy_sz);
>   	memset(dev->shbuf, 0, dev->policy_sz);
>   	ta_sm = dev->shbuf;
>   	in = &ta_sm->pmf_input.init_table;
> @@ -512,9 +512,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   	if (ret)
>   		goto error;
>   
> -	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
> -	if (!dev->policy_base) {
> -		ret = -ENOMEM;
> +	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
> +	if (IS_ERR(dev->policy_base)) {
> +		ret = PTR_ERR(dev->policy_base);
>   		goto error;
>   	}
>   

