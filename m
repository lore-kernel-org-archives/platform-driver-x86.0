Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EFD23E22A
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739890076; cv=fail; b=A2aCVEE5KsCYRqnnuqsWRa4ubTtrsZRbOx6HJGGz/mgw5UG7ZKyi1LgcTBjmyWaLMevhLVu9vZAHyk4r5enoWlSvEkgD5A/yyOFiB6EIvZF4Aq81pNX1yHpa9pc9DRgVzfjb+1g+lODyKETaZdg3miati0ccB84wQw8M0beY9uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739890076; c=relaxed/simple;
	bh=YMZgk3V7URZswu6zCPHNxX16pHLRY4Sb1QbU7XAdibU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mYT6pWqMMtBQxr7XXGrtHotsMgFQCh3axPBZZcuGGkxeQ/NlX5NKCjzcmvJaoh4yLpaRXfCA6asRHzLQtVINI7ilYpkxvKPqmfePctCbiXuNFu/g+KK1W5lLFB6GswobmbR8nixIGeMyPWcTw/8TKw3JBHWC0Y9M+o2csHO6re0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gS226YKu; arc=fail smtp.client-ip=40.107.96.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gS226YKu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtgli9t1nYaRax5DUxexiaCe/5WWizXmjfy3pQWv5MKJChG8f1n8DSNgqgwfDQkNjuTsnbqursICB+87bVuWZJSpbzjO+G3tjtCeGXCE9Ltk86V3mT7loL+GcILv8aCQ8FC6vRgNR2Ym7SqMgXsUce9+FR99zTzqduDo7GAddcaWdayaCZENq6KFErhboYHSp0EQW0jblv2iQdhPH86bfAOb0u5+g49I1IJekfeuP0j2WXg9wnikDgedAb+zFI4ZKLtz2AIOoICxS3a2h6plIb+HY8Gif04/G9ggKn4/2n82IbMunRPG8JO71OfBlr6ZTkazS8jsd4J/ektKF/PUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFXDfzIEO7nrlAbKVyO9+IGx29bUgWPBlfoy/b4Hxn0=;
 b=TQLUGZ7IodfKPHnemeKflMnwSNRxbHlKv/BM2Y3cdXS5C6/qIRYNK9XcB05hHhBI5LXtgEIPAwPyzWz3LDDSSqFL1GRSNpPlVKDqBPh1UJHjYmvWInbJoFXBJyUSC78jYtAJhi0BiFtWF+MOZq8cQER221O/o11RlmWzc3U+IcMLBnO53AEiD3PKSvfXssal2gK0isPxKI728Kbf+ARHuIdWnbmn8fIDuEcg/1Rgd+jMuwTgRmqzgAPTIIv11n9SjQGHVnD51HjMb+/H/BoS6HpODgvF28eIpQpWQc5CaJvqaEkN1tjf3MEnOZX8kqKqVqbm+6+OBKdDW/DX68sx7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFXDfzIEO7nrlAbKVyO9+IGx29bUgWPBlfoy/b4Hxn0=;
 b=gS226YKu4RXdBqz8Y+OwzhuRljz3szPRbLda8l8i1KGPjNvohxAPnAbFDYf/UB2FPJjJsH8qxa2h5VHqQ/EjqX39z9+zDijGDzpYQ2oVLirwUs+rS1Q9wAxMU4IHNhrGer/kROezBbkJajHgwHRw6bAU69j1tKUXxIY1lkJoQEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 14:47:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 14:47:49 +0000
Message-ID: <eee57549-c324-4b00-abe9-dc2ae67e129b@amd.com>
Date: Tue, 18 Feb 2025 08:47:49 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Update PMF Driver for
 Compatibility with new PMF-TA
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com>
 <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0063.namprd04.prod.outlook.com
 (2603:10b6:806:121::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b64e3e-8b39-45a3-7838-08dd502b36ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0NjeExaUWtNdUgydUZwaTJMejBLcHkyUjdPOW9pcXNmVUpycVdYc25nRjk2?=
 =?utf-8?B?aXJlV2R2UmZoZkhlKzkxaENBenh0QWhhVDdURkdBWWpDRFJkdDM5TWFRdU5L?=
 =?utf-8?B?aXVCOFQwNU12dy8zek5EVG9FMnFnbmNqcWhTNlJSSGhPczlYYXdHK01udFRP?=
 =?utf-8?B?VC95T2tpVk1YOTN4eXhVSklzaGlxeXRRYy9DVEwwRTVGNkxKSmR2Y3IyVFJt?=
 =?utf-8?B?d3liWHV3dHRwbWJ5bzFTYy9Wd0JaV2pTOVMzbDEwaG8rQ3R0OUowSGc2MGxi?=
 =?utf-8?B?NHBlSUNoWmlCNGxlNlBqRWRTK3JST2ZYN255SE12YzJXZXJRb1o0dW02b2k3?=
 =?utf-8?B?SDIxS2lRY3MxbkZPcGZoS1JmOS85TWI4ajhpQUpyamg0aklRWWtTbURUYlk4?=
 =?utf-8?B?SEZwNWJJajk0MmpNT2dxRElzeUFUKzVZRkZEeS9uRFRzVVhzODJsbXR0dHAy?=
 =?utf-8?B?SlhWQkcwblVsc2s3aVZWYWM3OGNlREdBNmwweHF2bElLbWIrbGdFaXJuTnU1?=
 =?utf-8?B?M25pTDhkSVd0YnJIWmczZlNIenBzaTZsSzJmcjdZQ2pFbE5lTHB1M2haazJQ?=
 =?utf-8?B?Sy9hWDRaSUg4UWRGQkduWXR6R3dVTGNMWVg3TXduM0h0VUQ0TXV3Ykw2dWgv?=
 =?utf-8?B?Z1RVMmhxOGlKVXp3UXBSZ05pVkxrMURjN3dqdHdOckZ4bHVBQzFiWk9sMyt5?=
 =?utf-8?B?TkVFTE9ZSEtiNDF1QUgrNFNnM2pVck54d3p1dVZjYk5tNzBoQ0d6VS9nTGJu?=
 =?utf-8?B?TXIwMExLaWRvTVZ0UkNWZGQyeU5CQk9LUE5vZEJ6ZEw4TjJ3a3dzM3JrQlFN?=
 =?utf-8?B?SDdQWXhaWGovRTNYbzRVYTl4cGhRN3RPeTFSdXBtN2x4cEZWK3N4UVNhWDBa?=
 =?utf-8?B?bjhCbnpROURHR0ZRT1QvZzhhUUxHSVQ5aEtrT0RTcnBBam5jd3BjUDR1WjlJ?=
 =?utf-8?B?VDlRWnkzZEIxTEh0cVFZMFFYaGI3Vm1CNkhZU3RZUHFQUjUxV3RvdlowL3lH?=
 =?utf-8?B?TTVYZDMxYWl6T3RhKzhNdk05MnRhZHZQQU9oK0NsamZTZmdLNTNrQWJraG1Y?=
 =?utf-8?B?TXlHNVFmRWNka2pXby9vVXMyNDQ3MHNxZ0dwbjFrTmxQZ2hDdUU5ZndvK3dN?=
 =?utf-8?B?QUcydHNIYUlIYXI3NHZVYk91dUpmVmxod2p0RkFybnpNZnBqUGZZSlJPellQ?=
 =?utf-8?B?MGlYSmEvMEYvU2szRmUzTlRDd0RBTEZpN0JhY3JMN25hZ0xjWnJOZEx4dFpJ?=
 =?utf-8?B?YUI3NmovK3U0Mm8rL1BKY0c4M0E0MEhGNTU4SFVudGhNMEV3d3A4M1dqM1Fr?=
 =?utf-8?B?ZSsvRExVSlg3MUw1cGdqVHhDR2pkVDlseitYdU1jeU5wSDBwRkdUTC9BdW1M?=
 =?utf-8?B?L3VDZ2gxU3hXeDRqcXY4d0x2T2oycVhtOVpDU1p1RVk3RWtOQ3d0VXNmbDZh?=
 =?utf-8?B?OXVza1dyVTFtVmxZTG0zTTloRnJuV0t5N2QrWEp0bncrSmlUbmZqa3BKTlJO?=
 =?utf-8?B?eWUvRjl3YUpzcVRWVmJ5ZkFXN1h0eTRuZVhpYjNkblJFUFo0UlFFWERVUXRx?=
 =?utf-8?B?QlEyUzFnY3prZVdBM1Y0K2YrcEpjQTlaczMzQ0ZQRHFTSGV5NjA5UFZBcDlG?=
 =?utf-8?B?VU80SEFEb0pDazJxcE9EWUdwSldzNktZWmhrUW5MVndzbmhFTkZid2ZSQkJz?=
 =?utf-8?B?U1llbGh2dEFlNnl3bmZFTnZrZUIzMzFmSGtkUkNndURyZmVyNWxEVjV3NXFX?=
 =?utf-8?B?WXNTM0M4NTU0QmJiV1lqSUh3clZYeUpJQXNTSFJRdU1tWmJsdG9TQnRvYkcz?=
 =?utf-8?B?Y0NlalV2UHNNcmdKNStyU01sWEtEbElVTmhENDJNbkdJbjBreVlnNXhOb3pH?=
 =?utf-8?Q?edF7VgxXdl6X0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3lyRjhuRnhEazRnNU9zVS9MUGl1VDdBZmpTNWR0L01tMmNLQksrM0JTOGpS?=
 =?utf-8?B?YWZQL3J4T3BqZlBBNFBmTWFvdE55d1RpYmhqMUxsWnJUaU1WbktmTm00NGpS?=
 =?utf-8?B?enJ2RFpRQXJRZ0N1VytsRk5iRjY4V2RIV0pHb0RNazdiK1EwRithcFNZaFVY?=
 =?utf-8?B?N3dKSDk0MWhaVkRlZ0JEaXhqMjQ0eDZ2VjhSN25kQURmbW4zaWJVU1F4OTJB?=
 =?utf-8?B?QS9OZ3FReGViWWQzSk01NlV2SzhDSWppOFJJTVZSVWJWOElFdmRLdFlDTjdU?=
 =?utf-8?B?c0xReCtwWE9ldHZFYnZsR0RTZXhMMkNycWQ4TkE5TlU4N3l3NzRGa0xTZ1JL?=
 =?utf-8?B?UWoydFBrandSNU0wekJXUEFTYnAyV1dWaUt0N1FlMmI1WHZCMk9GbEVvZWox?=
 =?utf-8?B?MjFGZEVMR0h0RWQ1bU9JNm11T0xSbzdiS3FLN0dNNjIzeExPQzRnaitlVEN6?=
 =?utf-8?B?bWVTdHZNUk9ScFRhbWtYeHc0Vm9kc2FlK0VGZ0k2M2RyZFFVMFVuTE5ORzlz?=
 =?utf-8?B?QlpmRXJMMXFWVmQwai9iZnh0RE9NUjE5MUVpUEx3cTBnOXIrdWFqTFdPUmc2?=
 =?utf-8?B?Uk1TbU43TFFpQmVZRk1EaWVOVklqNnlNZ2F5UUVhVlQ3NGtSTXFkd3ZtMVc3?=
 =?utf-8?B?Ykdsb0pSRHJsMHp3bGE2ZnpYdVNlUWRCMkQ4YkRXUDdVQnhFWEpjZUJvN2l4?=
 =?utf-8?B?ZHFsRTk5ZVBabWlhQVI2dFQzU1BLaW8rWmRERGU0VVMyckJKOEZkWUFSTHMv?=
 =?utf-8?B?alQ5eVlpeXh3dVJzaVNpTjNGN1VNaGhvSFVPWHdTZ0RyMXNaTS84dTc2SXJk?=
 =?utf-8?B?YSt5Ty92YkVCZXlvMERCSW9wZjV6Q0ljNHlSaDlhYU50RmxPTWRrWDExMzJV?=
 =?utf-8?B?SjYvSEVlUjV0bTlzNENXZkpLRVJsLzZNN1V6QTF4bXRVaCtoSlVoQjBoZGRx?=
 =?utf-8?B?Q09odmI2dGJMTys1cE52ZEE2akJ3clkzSUV4Nkp0VytxM0hrRyt4aTkyeUNy?=
 =?utf-8?B?N3QxV2FhSGJhQWV6Y3pnZjF1clJtVllGYVZHVHlTWUtWak1wZFdVOXFWbDl4?=
 =?utf-8?B?MDR4emVJdWV4eEhlcWRqMG9kOHhUdUhIWkpmakJuRjIvb3o0UnZOUEFJVnBH?=
 =?utf-8?B?ZHBuU2hrSFlmeGpGZUw2Qmw2a1UyZ2hXU0lTM29WZlNIaGRmcDVNYkpEUG5O?=
 =?utf-8?B?bHNPM08zeUN5TjR3YzB3a0taam04cWhVNEVOdFZwcHRGTTVzRVRCSDVETzFV?=
 =?utf-8?B?RjVQaHJ2ZVRTb3Fyc2VBZFZ5dVlFVGUxQ1dLeWpOalk1QUFRQWV0RkE3Rm15?=
 =?utf-8?B?U0NCVHFYSWpZTDlFd3VXRkNFalZ0aG5zdHpNa0FjTHlYY2hxM3VMeW5kam50?=
 =?utf-8?B?aEFKUmFEZUx4TVk3Tkh0d0Ntdnh1Q1JJYTlMajdnbktsUWUzMHRxVk13QXpD?=
 =?utf-8?B?cU9hb2dxeG9ad2dRZ0t4dEVGckxEd2F4OEVtWjJmQVF2Vm5nYStFZXZNcjky?=
 =?utf-8?B?Z3BvNVZlNG9iZSttT05BbHN3cHh3eVN4bHc5dnpGV29SQTZ1Z0hiemE0OG1t?=
 =?utf-8?B?L1RaNlhOeDVjc3llc2dUeFFsZnFGS01GQVlKc1lrQjg5Y2NZMlNtMjNORVVP?=
 =?utf-8?B?QUxiREh2UUM4TjJXL0hxaXA0OW0zamMybVZNS3QrOWQySUhIRkg4UXhiTnk1?=
 =?utf-8?B?QzFmU3J5UC9WbzVuVjk3RGNRTHRrUDRDNlZ6OTQrMjdBVjUwVXNVcUNRVE1u?=
 =?utf-8?B?Z3NSd3N0NTZud1dadTJZRFVuZGNrQXZEcncrdk0yWFV5V0E1UjZ1aGpCdGZ1?=
 =?utf-8?B?RUhBVllLazc0RUNteE9UMUljMm1ITTNWVUpzTTVEbUFka1lzZ2N1QnB4N3I4?=
 =?utf-8?B?cjk3ZmU4MXNhY1ZYQUV0YjF4SFppV0J3N0gyZjBjcWhTdXBocU9FamxDc1pX?=
 =?utf-8?B?MHVRdkZSbFA2Vjd3NndsUE1VUUczWUlYNGhwOWR3YmNpcmZLcUwwblY1Mndq?=
 =?utf-8?B?MmY3ZUtrYnFTdzl6VFdXWXVsWk0yUmk0cGcyQ2h5YUZsNlRNTm0zWVg1UnVM?=
 =?utf-8?B?Vk9uZW96T0Z2bFlieGVuZktlazE5VUV0S0JESkt5WHhIbEpCOUI1S010eVlq?=
 =?utf-8?Q?Asqe13I+I2QpVPg6DzA7CfPGc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b64e3e-8b39-45a3-7838-08dd502b36ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 14:47:49.0745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: en3CNwkfmsbV6/hqKH/YZGfsokbVELUwtS28QbE2NqQu5GPNVgyshb8hthWhB00ldPivBcmRSWHQQDxatXvshw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263

On 2/18/2025 06:06, Shyam Sundar S K wrote:
> The PMF driver allocates a shared memory buffer using
> tee_shm_alloc_kernel_buf() for communication with the PMF-TA.
> 
> The latest PMF-TA version introduces new structures with OEM debug
> information and additional policy input conditions for evaluating the
> policy binary. Consequently, the shared memory size must be increased to
> ensure compatibility between the PMF driver and the updated PMF-TA.
> 
> To do so, introduce the new PMF-TA UUID and update the PMF shared memory
> configuration to ensure compatibility with the latest PMF-TA version.
> Additionally, export the TA UUID.
> 
> These updates will result in modifications to the prototypes of
> amd_pmf_tee_init() and amd_pmf_ta_open_session().
> 
> Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-d211c7963e7e@linux.intel.com/
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Ilpo, Hans,

As you can tell this adds compatibility for both old TA and new TA.  But 
new TA won't work with older kernel.

So if you're amenable would you mind if this went to current 6.14-rc 
cycle and added stable tag?  I think it would be better to spread this 
widely to LTS kernel so that the new TA or old TA can both work on many 
kernels.

Thx,

> ---
>   drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
>   drivers/platform/x86/amd/pmf/tee-if.c | 50 +++++++++++++++++++--------
>   2 files changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 41b2b91b8fdc..e6bdee68ccf3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -106,9 +106,12 @@ struct cookie_header {
>   #define PMF_TA_IF_VERSION_MAJOR				1
>   #define TA_PMF_ACTION_MAX					32
>   #define TA_PMF_UNDO_MAX						8
> -#define TA_OUTPUT_RESERVED_MEM				906
> +#define TA_OUTPUT_RESERVED_MEM				922
>   #define MAX_OPERATION_PARAMS					4
>   
> +#define TA_ERROR_CRYPTO_INVALID_PARAM				0x20002
> +#define TA_ERROR_CRYPTO_BIN_TOO_LARGE				0x2000d
> +
>   #define PMF_IF_V1		1
>   #define PMF_IF_V2		2
>   
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index b404764550c4..a81c661abd7e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
>   MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
>   #endif
>   
> -static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
> -						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
> +static const uuid_t amd_pmf_ta_uuid[] = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8, 0x8a,
> +						    0xcc, 0x2b, 0x2b, 0x60, 0xd6),
> +					  UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1, 0x2d, 0xc5,
> +						    0x29, 0xb1, 0x3d, 0x85, 0x43),
> +					};
>   
>   static const char *amd_pmf_uevent_as_str(unsigned int state)
>   {
> @@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   		 */
>   		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>   	} else {
> -		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> +		dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>   		dev->smart_pc_enabled = false;
>   		return res;
>   	}
> @@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const voi
>   	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>   }
>   
> -static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, int index)
>   {
>   	struct tee_ioctl_open_session_arg sess_arg = {};
>   	int rc;
>   
> -	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
> +	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
>   	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>   	sess_arg.num_params = 0;
>   
> @@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
>   	return 0;
>   }
>   
> -static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
>   {
>   	u32 size;
>   	int ret;
> @@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>   		return PTR_ERR(dev->tee_ctx);
>   	}
>   
> -	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
> +	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, index);
>   	if (ret) {
>   		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
>   		ret = -EINVAL;
> @@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>   
>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   {
> -	int ret;
> +	bool status;
> +	int ret, i;
>   
>   	ret = apmf_check_smart_pc(dev);
>   	if (ret) {
> @@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   		return -ENODEV;
>   	}
>   
> -	ret = amd_pmf_tee_init(dev);
> -	if (ret)
> -		return ret;
> -
>   	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>   
>   	ret = amd_pmf_set_dram_addr(dev, true);
> @@ -534,8 +534,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   		goto error;
>   	}
>   
> -	ret = amd_pmf_start_policy_engine(dev);
> -	if (ret)
> +	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
> +		ret = amd_pmf_tee_init(dev, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = amd_pmf_start_policy_engine(dev);
> +		switch (ret) {
> +		case TA_PMF_TYPE_SUCCESS:
> +			status = true;
> +			break;
> +		case TA_ERROR_CRYPTO_INVALID_PARAM:
> +		case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
> +			amd_pmf_tee_deinit(dev);
> +			status = false;
> +			break;
> +		default:
> +			goto error;
> +		}
> +
> +		if (status)
> +			break;
> +	}
> +
> +	if (!status && !pb_side_load)
>   		goto error;
>   
>   	if (pb_side_load)

