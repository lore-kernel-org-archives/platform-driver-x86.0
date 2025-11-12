Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D4833B97B
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762970837; cv=fail; b=JLGwDYr+WL01f6c1a8pdCFItkl3KZg59R7kQJYAcm6dhUq4x7rY0SnngeKjdKH2LfE2mnDhuhs5Gec7LkPgd63Xv1NZr0oXYAu/EmVwMqMpYEutVs2+bfi+CeIYJW3kqTxkc4Ne0XkFjeA0g/Z4QIrWfY956ja/vx9HtnzuVD5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762970837; c=relaxed/simple;
	bh=Mirc10wLSSpJfz2k3lt1xCYvQkIg9FuSj3eDTKWrruw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Latbj6u+gwACCQroBrSDYKJ5XwJwykVukFLJeBb1Q3umsEMTI9z1azhCEhXX44gz+destPQYP4nrIwNZcUkskyKe5BU4dfeGNSH9LyzK5aAK9Jn8CCPy6nKmisvZ5FJ1SihpgS/+WFiFlfgNmEmUnsVw3fWCySMaFmGjWxxANLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WPhHGpWe; arc=fail smtp.client-ip=52.101.43.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WPhHGpWe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRBC6w+Oxo2LkLsWCHwKVHhQTcYnlIG2r7qDUgOPQ1UwC3HfDosGKpThpTQC96tsb9sCnw7frp6OYBBeUFglHdqKp+wv7ZuD13/Fnb64Agwjmfak0zoAVh3gGnQ7Ky9xoLuR4cmMSndUWThCIsDxb47rnhqhTFACpktdV8hgoGrD/YLV+gBWsorx2jLIp2F52gKuViLGjpBx53hisjbcOTE2MH/vY6ALh9hkH4kd1K4Bzl+0jxINAe0Zr/RTF7I9vpjxHQt/NMV0YXGWE6jBjPZkF7xWV4ufjK6yYVsTOj0YeOqUb6IWzpJAtqTVsI+H+3bSiel8cBVCpFfGCoyVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkqPZXT1nb0gdnXI1OmhgMRdc8b/1wbUEpiNrGqPLNE=;
 b=ZjDPJ1TxykLrseCtvKjBmmV+XueLvni/uERnvhBduhcYls5OxEWaY+13Qu7dPwhF/dWONUcqg7zI3YfTqULqZdVFGvDnpJxB59JascU2iLNrxBuH5Hpl0XrenfwFcO48E0zza1X9r2IprqkqC83xonBw57onAcQ95DIpvUrnRNBLVL03ZOjz9uQAkT59f9YEZnK6M0bZpQYHzUlHMcOlU5twyqmJVDEFLLs4d7dlBBrQFgGnBLX1SWmyZ8G8pG847y4og4JtLv0pdCnR/3E2DK5rcwYgjubSxkorHcejTfpyRHc0oecyxXt8F4HEdPclOqPQ23xeO9K4Ura1Pao44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkqPZXT1nb0gdnXI1OmhgMRdc8b/1wbUEpiNrGqPLNE=;
 b=WPhHGpWehDh8H7L/UrXAWeaWPlrogvAMwd4sozVgjdu0Qcgfsi9rTS1ztxA5sdbUc1404kDOKiuleMkxvtxIF3fUWms9vI9wB1QYxsmw4zYNZKUEHvm7vnaAVhtzjnsk7DPHYo/FR5dW2eUhk3Yq0NsifG+12L0VRvOUKVruf08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 18:07:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9298.010; Wed, 12 Nov 2025
 18:07:10 +0000
Message-ID: <be3da5a3-c4a5-40e1-8509-f1c47f90cc02@amd.com>
Date: Wed, 12 Nov 2025 12:07:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] platform/x86/amd/pmf: Introduce AMD PMF testing
 tool for driver metrics and features
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
 <20251111071010.4179492-6-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251111071010.4179492-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DSZP220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::8)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa3b82a-399c-4614-add4-08de22164c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ui9xMXA4N1Q1THdpelZxK2NmS3FuMklEbzNsV0ZJSjROaDMvcHRNR3I3WVlO?=
 =?utf-8?B?d0pZOHRpMURPc1R1R1J1L0prdFE2SWFwU3F5NEVDSFlEZHhkbVd3ZnZXb1lo?=
 =?utf-8?B?bTRkZWlxdEMwWWJPdzAzdUo3T2hWbU05K1Q2Rit4ZXhkZkxOVVZpZUk2STJU?=
 =?utf-8?B?Q2trcnUyZ0RLMmIyZFFpNnRJRlVKdUxOVTJGN255ZFJnT3VscFdvU3Q2TEhD?=
 =?utf-8?B?K3cwbWFSdk91TENMa0NDWGZtNjFCWUp5UmFpL1lQWXpqNmJCNXl4dGFlU203?=
 =?utf-8?B?WUdNOGlFa0R2NStmWUFtWGM5NE9BejdzcVNpNFM1MGVYeG56YlVTYjFNV01R?=
 =?utf-8?B?aTFsMXhCUnNRWXU0VEVSOFA1clZHMjB4M0xpV1ZTbHRrL3p5WHd2VEF5NWZC?=
 =?utf-8?B?cnVJeENNN2ZnZS95STllOStNNlVHR2FyZU5oWGFlOW5LaDV2NzdHUnFnY3Mw?=
 =?utf-8?B?akljbk1rVlorU1pWL3h3dHBmS2YwN29FMktZbzNGb0dKTkw3OHB3b0tpVWcy?=
 =?utf-8?B?aDQ5YWdoNHc3N3ZIWlg1UDFCdWZMbGQrdEtaK2NTTkZxdXhGZERWV3RGUkJ6?=
 =?utf-8?B?bFNueHRyclFzSnRTdm5SSncwYlVsTzlNdm0zTUlNRjRnbjh5Mk9SVlhjdWts?=
 =?utf-8?B?M0xmUVNKRzBzTXBjMTlod2xwdDN3YmxXSzZTeTRrd3pDT0FoUGNsaS9qN0M3?=
 =?utf-8?B?ZDRIcFRXV2wrY0ZMTmQ4T091WWtYVENzbE5Ea1h2TWQwSzIvUlVkYmE0WnVw?=
 =?utf-8?B?SzAzWVBKOHdtQTlIdndZVW0zK1N5S0Fmb29oSVhOZ0xhSHdNWXBVbU5XZVp0?=
 =?utf-8?B?c2VZa1pYNTlSTUJhUlE5UjZnMlhocG5mRlpBZ0hSSy9ZZ3FtZmhFUlhqd3ly?=
 =?utf-8?B?bXVYMWhjN1BuY2tMYVcrYS9Ya1o5bnhKcFQrZG1KVm9lZlBKRUV1UGJMZFY4?=
 =?utf-8?B?Y3pIZUFIdUZnQXoxcDVtWVV4ZjV5R2hkSDljWEVGMDYxbDlHYkNmTG9UQnE3?=
 =?utf-8?B?akpsVGgwUjNwOHlyUW53OEQzeHMzQ2xoVDN6clQwL0dlZ2xZdzNJMmdPL2ph?=
 =?utf-8?B?SGxsZjVGMG04MkxoOFhPWTd2akhESStnb0l2WTBkTDZlV1VUd1g5cDBiZm9E?=
 =?utf-8?B?aDViUGRLT0VxYW1zUVErdnV2UHZkNldFbFFiN2VycmZhenZ0Z2tWWlJFWnNB?=
 =?utf-8?B?eWdKc2RJZ1RuaEd1dkpST1U1UDlGWDRDMjZ1dkhDK1B5Z3ZqczBBMWdXRGpw?=
 =?utf-8?B?T0ZDNWNqVVdjQVA1UUFNejNEUEMxSzU4SmsxVzlGSHBpenNRV09QYzZkSkUy?=
 =?utf-8?B?Zmcyc1FqWnV3Y0Nlc0U2VmhQRVpveUVhRHU4b2xodk0yNk93ZjFSbXhVZHZZ?=
 =?utf-8?B?MHRwaW5DajFTeVNLRDFLRTYvbU9qcTJlY1hwTWJyc3Y3QnlnbjNpQWpjTXBY?=
 =?utf-8?B?TC8wOXNMR0V2MllvMUh0eEdhdFBXYzhsRGVBaFVtTVlKNTcwWlRZY2ZlRnYx?=
 =?utf-8?B?cUMzSFJveU1EZTFiYnFyOWF4TFhpYkZXVjQwRk1IbmhFVEZDclJDNWp6NWtk?=
 =?utf-8?B?ZG1Fa25lbjlMdzZVUnR4c2pFMWtFdjhsbUxZOXNleWsrZTZyV2FUT0FLRFVh?=
 =?utf-8?B?RWNDRkZxM2c2OWNZVzJqVDZNRXBsQ1Y0SE1nNzN3dUtkNk1Ub1hNOXN6STd0?=
 =?utf-8?B?aVo0eS9zNUIzMC8wbUs3WVllcWY4Z01BcjJVWnZ0MWd6dy9GOGgvcHpWWWdR?=
 =?utf-8?B?Y2hVV01mV0ZaUDFoU2JMekFPTjB6bUdzNUJxR1N4TWJDTzFhUVBqclhLN3Nu?=
 =?utf-8?B?RHNXbzhhQW04RXIwQTBRajVmNDBWZDk2UVRlTTN0cE9obEFCYW41bm1zemFI?=
 =?utf-8?B?L05CYkZ2Q2FYbElmVWRLUmtNbVh1aWNXWU84emQwT09LcUlLMUtPR0tqcVdD?=
 =?utf-8?Q?FCMCNOKHzrB5EsSSYYqLinOjF8vSw0m2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHU1M1pGazd6cE5WNmVaYlJ3czdVR1pHRXU5VEpNZWxhcDF2cUU5dDNSQjU1?=
 =?utf-8?B?REppQVM1UDQrL1EzM0pDQTFQRWpsUi9lTWNHb283OER0UDlrQm9DcDB3OUhr?=
 =?utf-8?B?bFNaTEpkTkVQb1J0UmJjVy9pNjJVOG04VHlra0ZyS0ZKSHo2Y2hLZXdxLyt2?=
 =?utf-8?B?OHVtekUvNHpGaVZMMWhGRXd6NFhSY1c4REdQcHErSWxkZHRUMnZvRzBsTmp0?=
 =?utf-8?B?a3FXMW9VcWFTVTZaN2t6dnJrMEpEZ1A0SFY0bUdoejhmcDUyYSs0Ryt6RHlw?=
 =?utf-8?B?SHFOV0QzdmZEdE03Y0VabWJOOUw5M1MvZnRwWlVhM1psMnlrZnNQY0g1ZHFt?=
 =?utf-8?B?bkhHSDltcU56RUdpTzJ4bi9yYjBaaFZLOE9pZUxocVViN0w2T2pRU3EyS1g0?=
 =?utf-8?B?bk0yL0dodnN2cEprUmVSWGdqWlBwdllHZTZnQXdra0lLdHpLSHYyU1dBRXdv?=
 =?utf-8?B?cHA4cGg2bmx4eUtMdDZYRFFSM05RakFRc2gzVU1ORWRnOVhXN3Z2NHlNRERO?=
 =?utf-8?B?WnAwT3hkekE2K1RQbm03TVBpb29vWEVWWmNqWmtnMWtNWHQybGovOFhnYXlt?=
 =?utf-8?B?NUNmTVRjc2U0eG1OaVZjTXBuOGU2RURxU1J1ZXhRSjZsYWNRRXR4Z05lM1Nw?=
 =?utf-8?B?ZjlSWU9YOHppZVdGdGJGWTh5RmtHZnEzaCtOU1p0VHJrL3RsVVJXU2MzQ09H?=
 =?utf-8?B?ZnpIUzlOMlBOVGhmQ0JIVGN1eVRPbW1Hd3FaVVlkOHNxbEpDV0R4K0JTQ2tv?=
 =?utf-8?B?LzZSZE1NRHZSMWp4MlpYSlRCNTFlODFDQ3BUOFlSMmMxRDdmYXVaNitDSFV6?=
 =?utf-8?B?UWE0eTRQZ0tDcndQVGtYRVBRZ3I1emFTakdZUjNVMkFwR0tSMVRlS2RxU2tl?=
 =?utf-8?B?b1R1Q01tMC9tQnJjcFhOakFKNi9tcDhmUkRzT0pjTmpvTllMUUhhTy9qMTNl?=
 =?utf-8?B?Qy8zZ3FteFY4a213TTE3aFFBSWp6NlJSYVlUR0Jwa3E0UTZSYnZUMTV1QjlF?=
 =?utf-8?B?Lzd4ZFZvYVVhQlBsVThvWnByL01QZXhkbW1jRmR6eEs5MktNTXhUMWhUa1Ri?=
 =?utf-8?B?elRteElWbnFtTDMrcy9vUVFUVjE1NFd1UCtLWDBmT2gxbkNObm44Y09scEV1?=
 =?utf-8?B?NWRrNC9pZk8vMmtCVDNTTUYzbGlHQmhwRUZtSmQ2NXJzd0pYbDVnMDRNazhM?=
 =?utf-8?B?VXV0cHdic1g5dm9EM2FrYWdHdUh5QjY2ZVNISk96cXErdXFHL3hiMVZ4WG5Y?=
 =?utf-8?B?b3MweWZKYnBFakFETFBnUTlBYjlsa0dJTTRwbHpXMVdMUGlLZnFkVEhQUk5k?=
 =?utf-8?B?OUZmTTlSa0F1bDI2RWFtRy9lTk5EOSt3UlVScWhVSnV4SWNwOVg2ZTBJYzZQ?=
 =?utf-8?B?RnVDNHpQQ2hWNkdocTJQdGVHSEpzR2JGVDNNNHNLZndacVIyY3ZWbDFmbXlw?=
 =?utf-8?B?V0EvWEk0RStKSXlOK1Z1V2ZMeXBaYmtvWEJzSFFGNGJkcDFJZUdkUUtuS2ND?=
 =?utf-8?B?ejJaTlRnak1SWDQ5R2dOUmZTTUNPdzhTVU9qYjY3WjJ6N0tTTHMvWFFQMlNh?=
 =?utf-8?B?THhIWGdud0szOWM3RG5SSFNvS0lLVmVxa0gxdC9KUU05UGJQbFdKaDRURVdw?=
 =?utf-8?B?RFZjZW9Ea01SZEM1UlhxOVR0M0QrNzhOdkxQMFdjSFVnTlE4cGlzMDNwZjZG?=
 =?utf-8?B?VktldkZBZjlqQnREVkNTdi9CeU54OFluTlozeDdmaUV5NndNTURZWmppRHRv?=
 =?utf-8?B?aWpkNllrbUFsczFrYXprRDNOL0xoMHpaa1lsUTFXaklhNUJ2MFpJTHZPNWFM?=
 =?utf-8?B?THlPTm9uU2thNytHdkZ1RmtpejJwYzJMdXFMN3Vzc1VnemlIR1BqNXlob3JP?=
 =?utf-8?B?SExLNUZZOVQ1NGZiOElRUWFYTHJpTWVUc2NMMzBPWFJ2alFPbXVBclU1WEp2?=
 =?utf-8?B?Q2prL2NKbjVwbDhRcVA0R0djc0krVXhsUFFYMnFPRHNuTk82dGF5bWFPWXdH?=
 =?utf-8?B?Mm5YZlNPYXFrc2pzQ2pFMWptdndSZlZ2MXBaYXBMbW1FM3hCbGN6RkNIY3lL?=
 =?utf-8?B?OEI1Qy9yTzlVUGhZV1lJekRhRFVDaU9hL1BXV3VsbDRENVhoTDN3dVlsdFd6?=
 =?utf-8?Q?2qb3PtkABo1H3A1PUshwUpr2+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa3b82a-399c-4614-add4-08de22164c88
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 18:07:10.3193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DHtIum3kc3tohEViLsxc0hV12HAz3Ijlz3Q3BWDf9LmPIAUuBkiC8KJnXsIA9SgZfZnwAuHRIQyV8x+O6mLiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042

On 11/11/25 1:10 AM, Shyam Sundar S K wrote:
> This tool development adds selftests for the AMD PMF driver, allowing
> validation of its newly integrated util layer and /dev/amdpmf_interface.
> It includes a user-space test application, test_pmf, designed to interact
> with the PMF driver and retrieve relevant metrics for the testing and
> analysis.
> 
> It provides definitions for test metrics, feature IDs, and device states,
> and includes tests for various AMD PMF metrics such as power source, skin
> temperature, battery state, and custom BIOS inputs/outputs. It also
> enables the testing of PMF telemetry data and feature support reporting.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   tools/testing/selftests/Makefile              |   1 +
>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++++++
>   3 files changed, 397 insertions(+)
>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index c46ebdb9b8ef..6dd2549b5feb 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -25,6 +25,7 @@ TARGETS += drivers/net/bonding
>   TARGETS += drivers/net/team
>   TARGETS += drivers/net/virtio_net
>   TARGETS += drivers/platform/x86/intel/ifs
> +TARGETS += drivers/platform/x86/amd/pmf
>   TARGETS += dt
>   TARGETS += efivarfs
>   TARGETS += exec
> diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
> new file mode 100644
> index 000000000000..876424941e83
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +CFLAGS += $(KHDR_INCLUDES)
> +
> +TEST_GEN_PROGS := test_pmf
> +
> +top_srcdir ?=../../../../..
> +
> +include ../../../../../lib.mk
> diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> new file mode 100644
> index 000000000000..f376bc6f18e1
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Test Tool
> + *
> + * Copyright (c) 2025, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *	    Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <unistd.h>
> +#include <linux/amd-pmf.h>
> +
> +#include "../../../../../kselftest.h"
> +
> +#define DEVICE_NODE		"/dev/amdpmf_interface"
> +
> +#define BIOS_INPUT_START			9
> +#define BIOS_OUTPUT_START			51
> +
> +struct feature_map {
> +	unsigned long id;
> +	const char *name;
> +};
> +
> +static const struct feature_map feature_table[] = {
> +	{ PMF_FEATURE_AUTO_MODE,			"Auto Mode" },
> +	{ PMF_FEATURE_STATIC_POWER_SLIDER,		"Static Power Slider" },
> +	{ PMF_FEATURE_POLICY_BUILDER,		"Policy Builder" },
> +	{ PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC,	"Dynamic Power Slider AC" },
> +	{ PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC,	"Dynamic Power Slider DC" },
> +};
> +
> +enum laptop_placement {
> +	LP_UNKNOWN,
> +	ON_TABLE,
> +	ON_LAP_MOTION,
> +	IN_BAG,
> +	OUT_OF_BAG,
> +	LP_UNDEFINED,
> +};

Can't you include amd-pmf-io.h and then use the define from that for 
enum laptop_placement?

> +
> +static const char *platform_type_as_str(unsigned int platform_type)
> +{
> +	switch (platform_type) {
> +	case CLAMSHELL:
> +		return "CLAMSHELL";
> +	case FLAT:
> +		return "FLAT";
> +	case TENT:
> +		return "TENT";
> +	case STAND:
> +		return "STAND";
> +	case TABLET:
> +		return "TABLET";
> +	case BOOK:
> +		return "BOOK";
> +	case PRESENTATION:
> +		return "PRESENTATION";
> +	case PULL_FWD:
> +		return "PULL_FWD";
> +	case LID_CLOSE:
> +		return "LID_CLOSE";
> +	case PTYPE_UNKNOWN:
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static const char *laptop_placement_as_str(unsigned int device_state)
> +{
> +	switch (device_state) {
> +	case ON_TABLE:
> +		return "ON_TABLE";
> +	case ON_LAP_MOTION:
> +		return "ON_LAP_MOTION";
> +	case IN_BAG:
> +		return "IN_BAG";
> +	case OUT_OF_BAG:
> +		return "OUT_OF_BAG";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static const char *ta_slider_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case TA_BEST_PERFORMANCE:
> +		return "PERFORMANCE";
> +	case TA_BETTER_PERFORMANCE:
> +		return "BALANCED";
> +	case TA_BEST_BATTERY:
> +		return "POWER_SAVER";
> +	case TA_BETTER_BATTERY:
> +		return "BETTER_BATTERY";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static int pmf_open_device(void)
> +{
> +	int fd;
> +
> +	fd = open(DEVICE_NODE, O_RDONLY);
> +	if (fd < 0)
> +		fprintf(stderr, "opening PMF Device Node failed: %s\n", strerror(errno));
> +
> +	return fd;
> +}
> +
> +/* Helper to run IOCTL_PMF_GET_METRICS_DATA for one control code and return 0 on success. */
> +static int pmf_get_metrics_fd(int fd, enum pmf_metrics_id code, struct amd_pmf_metrics_key *out)
> +{
> +	struct amd_pmf_metrics_key info = {0};
> +	int ret;
> +
> +	if (!out)
> +		return -EINVAL;
> +
> +	info.control_code = code;
> +
> +	ret = ioctl(fd, IOCTL_PMF_GET_METRICS_DATA, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (out)
> +		*out = info;
> +
> +	return 0;
> +}
> +
> +static int pmf_get_metrics(enum pmf_metrics_id code, struct amd_pmf_metrics_key *out)
> +{
> +	int fd, ret;
> +
> +	fd = pmf_open_device();
> +	if (fd < 0)
> +		return fd;
> +
> +	ret = pmf_get_metrics_fd(fd, code, out);
> +
> +	close(fd);
> +	return ret;
> +}
> +
> +static int pmf_get_feature_status(unsigned long feature_id)
> +{
> +	struct amd_pmf_feature_support info = {0};
> +	const char *name = NULL;
> +	static char buf[32];
> +	int i, fd, ret;
> +
> +	fd = pmf_open_device();
> +	if (fd < 0)
> +		return fd;
> +
> +	info.feature_id = feature_id;
> +
> +	ret = ioctl(fd, IOCTL_PMF_QUERY_FEATURE_SUPPORT, &info);
> +	if (ret < 0)
> +		goto exit_err;
> +
> +	for (i = 0; i < ARRAY_SIZE(feature_table); i++) {
> +		if (feature_table[i].id == feature_id) {
> +			name = feature_table[i].name;
> +			break;
> +		}
> +	}
> +	if (!name) {
> +		snprintf(buf, sizeof(buf), "Feature %lu", feature_id);
> +		name = buf;
> +	}
> +
> +	printf("%-24s %s\n", name, info.feature_supported ? "Yes" : "No");
> +
> +exit_err:
> +	close(fd);
> +	return ret;
> +}
> +
> +static int pmf_get_device_state(unsigned int code)
> +{
> +	struct amd_pmf_metrics_key info = {0};
> +	int ret;
> +
> +	ret = pmf_get_metrics(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_PLATFORM_TYPE:
> +		printf("Platform Type: %s\n", platform_type_as_str(info.val));
> +		break;
> +	case IOCTL_LAPTOP_PLACEMENT:
> +		printf("Laptop placement: %s\n", laptop_placement_as_str(info.val));
> +		break;
> +	case IOCTL_LID_STATE:
> +		printf("Lid State: %s\n", info.val ? "Close" : "Open");
> +		break;
> +	case IOCTL_USER_PRESENCE:
> +		printf("User Presence: %s\n", info.val ? "Present" : "Away");
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmf_get_battery_state(unsigned int code)
> +{
> +	struct amd_pmf_metrics_key info = {0};
> +	int ret;
> +
> +	ret = pmf_get_metrics(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_POWER_SOURCE:
> +		printf("Power Source: %s\n", info.val ? "DC" : "AC");
> +		break;
> +	case IOCTL_BATTERY_PERCENTAGE:
> +		printf("Battery Percentage: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_DESIGNED_BATTERY_CAPACITY:
> +		printf("Designed Battery Capacity: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_FULLY_CHARGED_BATTERY_CAPACITY:
> +		printf("Fully Charged Capacity: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_BATTERY_DRAIN_RATE:
> +		printf("Battery Drain Rate: %ld\n", (int64_t)info.val);
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmf_get_custom_bios_input(unsigned int code)
> +{
> +	struct amd_pmf_metrics_key info = {0};
> +	int ret;
> +
> +	ret = pmf_get_metrics(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_BIOS_INPUT_1:
> +	case IOCTL_BIOS_INPUT_2:
> +	case IOCTL_BIOS_INPUT_3:
> +	case IOCTL_BIOS_INPUT_4:
> +	case IOCTL_BIOS_INPUT_5:
> +	case IOCTL_BIOS_INPUT_6:
> +	case IOCTL_BIOS_INPUT_7:
> +	case IOCTL_BIOS_INPUT_8:
> +	case IOCTL_BIOS_INPUT_9:
> +	case IOCTL_BIOS_INPUT_10:
> +		printf("Custom BIOS input%u: %lu\n", code - BIOS_INPUT_START, (int64_t)info.val);
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmf_get_bios_output(unsigned int code)
> +{
> +	struct amd_pmf_metrics_key info = {0};
> +	int ret;
> +
> +	ret = pmf_get_metrics(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_BIOS_OUTPUT_1:
> +	case IOCTL_BIOS_OUTPUT_2:
> +	case IOCTL_BIOS_OUTPUT_3:
> +	case IOCTL_BIOS_OUTPUT_4:
> +	case IOCTL_BIOS_OUTPUT_5:
> +	case IOCTL_BIOS_OUTPUT_6:
> +	case IOCTL_BIOS_OUTPUT_7:
> +	case IOCTL_BIOS_OUTPUT_8:
> +	case IOCTL_BIOS_OUTPUT_9:
> +	case IOCTL_BIOS_OUTPUT_10:
> +		printf("BIOS output%u: %lu\n", code - BIOS_OUTPUT_START, (int64_t)info.val);
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmf_get_misc_info(unsigned int code)
> +{
> +	struct amd_pmf_metrics_key info = {0};
> +	int ret;
> +
> +	ret = pmf_get_metrics(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_POWER_SLIDER_POSITION:
> +		printf("Slider Position: %s\n", ta_slider_as_str(info.val));
> +		break;
> +	case IOCTL_SKIN_TEMP:
> +		printf("Skin Temperature: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_GFX_WORKLOAD:
> +		printf("GFX Busy: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_AMBIENT_LIGHT:
> +		printf("Ambient Light: %ld\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_AVG_C0_RES:
> +		printf("Avg C0 Residency: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_MAX_C0_RES:
> +		printf("Max C0 Residency: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_SOCKET_POWER:
> +		printf("Socket Power: %lu\n", (int64_t)info.val);
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +int main(void)
> +{
> +	unsigned int idx;
> +
> +	printf("Feature Name          Supported\n");
> +	printf("---------------------------------\n");
> +
> +	for (idx = 0; idx < ARRAY_SIZE(feature_table); idx++)
> +		pmf_get_feature_status(feature_table[idx].id);
> +
> +	printf("\nDevice State\n---------------\n");
> +	for (idx = IOCTL_PLATFORM_TYPE; idx <= IOCTL_USER_PRESENCE; idx++)
> +		pmf_get_device_state(idx);
> +
> +	printf("\nBattery\n--------\n");
> +	pmf_get_battery_state(IOCTL_POWER_SOURCE);
> +	pmf_get_battery_state(IOCTL_BATTERY_PERCENTAGE);
> +	pmf_get_battery_state(IOCTL_DESIGNED_BATTERY_CAPACITY);
> +	pmf_get_battery_state(IOCTL_FULLY_CHARGED_BATTERY_CAPACITY);
> +	pmf_get_battery_state(IOCTL_BATTERY_DRAIN_RATE);
> +
> +	printf("\nCustom BIOS Inputs\n-------------------\n");
> +	for (idx = IOCTL_BIOS_INPUT_1; idx <= IOCTL_BIOS_INPUT_10; idx++)
> +		pmf_get_custom_bios_input(idx);
> +
> +	printf("\nBIOS Outputs\n--------------\n");
> +	for (idx = IOCTL_BIOS_OUTPUT_1; idx <= IOCTL_BIOS_OUTPUT_10; idx++)
> +		pmf_get_bios_output(idx);
> +
> +	printf("\nMisc\n------\n");
> +	pmf_get_misc_info(IOCTL_SKIN_TEMP);
> +	pmf_get_misc_info(IOCTL_GFX_WORKLOAD);
> +	pmf_get_misc_info(IOCTL_AMBIENT_LIGHT);
> +	pmf_get_misc_info(IOCTL_AVG_C0_RES);
> +	pmf_get_misc_info(IOCTL_MAX_C0_RES);
> +	pmf_get_misc_info(IOCTL_SOCKET_POWER);
> +	pmf_get_misc_info(IOCTL_POWER_SLIDER_POSITION);
> +
> +	return 0;
> +}

