Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B132C26ED4C;
	Wed, 10 Dec 2025 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765385072; cv=fail; b=iay7dSDm5jmXuz6o2vMurnN49+dZLl2mWA+4Vd1LIqXclIOKiMhl6M9eHfQLSMydewxIlxeE/vCFlE0ehMNta8bks23o0gs4pPbirUJsZaPrK18f9VWkvgoTLKR8MFnc+WpcD4okMQSNBgwQWXv0FXwlYG6fWxCbL+D0YztMlDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765385072; c=relaxed/simple;
	bh=xi5V92ZS28BlyEPRZLr3FX5XJnbJRB9t1e64hEhr0Oo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rFlHTwXbBeTvmVI32DYTSbgJ1/szPlVXFpDe3kbuLmsj60ZMBIq4wIRC9orDpx5xjy/0aOQd9o7sv9yPDGZFBjODfn0fHWiJgNds1BsD5T4XVFI0FznGnOmKClOUZE8rIrO6WiP9rcKZgOzXhhG05Lp12Ww50pnlV0Oc3+y6vl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=frzWcJDu; arc=fail smtp.client-ip=40.93.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="frzWcJDu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N29FUpU2GIxfNjoPqIT/9FwpqJaTOpJ8lTYSwXr5GY/iipRzHnhnjHcgBd1Uc+Nux5oPVKwggdHw4FbQcXoLsa411OHtGLpHzH0IKr4YUG0WxHUxc77t3RWgyoIMG9NP7kbWbqJh3lDqFs+SHZUB7UfsWhua8vgzarhx+vV85a2+kotunvZa+RcZPPsVp9lqS0+z9BqzyZJdM0gJjwpA69lhcql0Mand+7wO9aUfPtbBvAI1NI/jssjma88Kk45WSJxPqsaB2S8HYS9izYWVaq2Hagea90b2jHWlZ8wjfoY8OlCjdUcZZAkVoTt/8wIqU/Nay+t3ro3ZrIRqdRSIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQXNAWJCqPri1qvsZB/ISbZzaQ+oRoC2qUhgDot67Sc=;
 b=VyyjfmaMgXysixZmcPZLdU2D1d8G68q6LM33nyga5l1fhAFXR2Sva9rl0mwkr81W+K/WruvsJvi8mG9xKVY9/O+eNPcHOelBSeUaWw8aC4yp1y64QAoReN7kPUpgW0cDCoTu2F5j5vQnWhtN3vCZCdSwnOFCyDxafrBDwfF9JDL3cUXP94f4qVh6j2JarEDNhIRQbmCG1qhS25TEnuC/TSmtFiuMRqu78lD+yLSBPuzPyio6/oRAB2t9vozK5l47/EtjCbYAYuFtzsMX0l/27e82oB0rS2v7tPds7EyJFs5JKQRkDkoV5nGUtrUdD4TzZ7p8PaMJzY19wAG9ssec2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQXNAWJCqPri1qvsZB/ISbZzaQ+oRoC2qUhgDot67Sc=;
 b=frzWcJDu+x4U5GKln5sZDXN3iyhLVAthzfxEF8N+XbEEw5ZFulpOsbZ35sxkROZDp71U6yWsxqHNawPiTKd7VD3f/9w505M4eWR5AvesZkdUclA1Et90xBIcz8d+9whmHXO65ytQSxoPNsx4s6EwduQ9yhwe7lvW4oxMtBw+h48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 16:44:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 16:44:27 +0000
Message-ID: <198f751e-7178-4363-a849-a6b0abd42016@amd.com>
Date: Wed, 10 Dec 2025 10:44:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Add sysfs to display
 details of damaged device.
To: Nitin <nitjoshi@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
 <20251210151133.7933-2-nitjoshi@gmail.com>
 <21503e42-64c7-4ba1-a6b5-b27cb19af429@amd.com>
 <d7b9167d-ddb2-4bec-b294-513010501ca9@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d7b9167d-ddb2-4bec-b294-513010501ca9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0179.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d352d5-9e6e-4c4d-a663-08de380b6219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dS9zaWpHK2JOQzJwemlkVUtkNDFZc0hkTVNnVFJvYm9tQktDbW9Nd0Nud25I?=
 =?utf-8?B?UFFqNStubkE5TjF1dE1ML0x3VTF4ZkthNzFNOFNWcjNUekcyR21xb1lneHRB?=
 =?utf-8?B?K2c2WTk5YTZVaGxvZ1lGTk1SWDBUTGgvWU9PZjJaK1dTWTExWjZGaEYwYmRX?=
 =?utf-8?B?TnV1VnlvMCtESStvbWZJcGVXOWZFaHYwODd0c3pkRE5HOHhySGlWSFRHdDR5?=
 =?utf-8?B?eE0xTnlRV2FzUElVYjI3cGw0K3BlRUJnTWxaYXlkemh0NFJyQnNydnVWeGt0?=
 =?utf-8?B?czkzS2cySlduVWJTZ0FreVNFd1hQMjE5UHp2MU11bWplUWgrYjhJeXBwS0ZQ?=
 =?utf-8?B?c2dqd2VxZ3lCbmtUN3czYUU5NXBZZ01WVFhITXdYYUtYb3lHRDRSL2xwQTEw?=
 =?utf-8?B?SlVvZm1tcExIZG12aDZGRDR4RnJ0VVVXZ2p2VzhYOEdITDVwNlhxWnhGR25Z?=
 =?utf-8?B?b09LSHd2UFhORHNUUkljOGE3WU1DcHZpdHpabzBPa3gzc2N2UmtYWVdhOVAz?=
 =?utf-8?B?dm9aMUZCN3FFNkgvcnpURVNTWS9kWVE3eW1aRUlSZ0dham9nMTZYSXFGVXNx?=
 =?utf-8?B?U29naUVzSnRiNk9PWG52QndHR2xPWDAxdU9IK1BQMkxxMnM1aFI5Z2IyTVNw?=
 =?utf-8?B?ZDMweVBSTno5ekpVNmtZenVVKy9TelJ1TVp2UVRYTnJZdnc4ejU5QlExc1Fr?=
 =?utf-8?B?N1pYcmRVVEp2T0ZudEczWi9wU3h5bmE2cHU2RkRheWFKaEpkUG1FY1NlY0k2?=
 =?utf-8?B?dEc1S2wxcHVEOWVSVU5sUVh2R3A4YU44WTNHcFg2M2tDRVdkQmlld2lhUkZz?=
 =?utf-8?B?NENmb3ZjTlNNdUl6M0hsbktnZHlEZXNjWlRMdnlLM1picU9EZ2NJajVjMDIx?=
 =?utf-8?B?R0JhWUFkTzFkT3RXVWI0Sk5xREE3azBMcjBZTzhWRVVWKzVqU2k5VFVrSzIr?=
 =?utf-8?B?NDF0UVE4TmxSSUVLcGNkSW9hOHoyaExFTlE2QkRrK3pobUNTVzhjS2ExMDNk?=
 =?utf-8?B?ZHFwOTFlQjRwSWZZVVdoNmY5ZGt0UkRsTG1zRFJHeDZMelJXL09uTGlJOFJ6?=
 =?utf-8?B?SXR6MzFQVXE2V01vQ2hrbG1za2JHK05OQkhvMFZEbEprM3lPMUJYRGVTM0gz?=
 =?utf-8?B?V3RrWGJZcXF3NmpCaENDeVdxejRQS0pMUlVCdWJ2QTR3ZVpEQzlrcUxlR3Zn?=
 =?utf-8?B?Uy9GY1hVN3FvVVpQRVJ2QlROQ1ZSaFFEL3BsQk1GUTE4RGhPeTVzZndrUUJB?=
 =?utf-8?B?LzFIdjVPazZmTWtsbG54UVAwWXZpNWVKdHovN1licHBqM2Q2dllUbjY3dEhW?=
 =?utf-8?B?aEM4emZuM1FjZGJUVzJpK2ZXSVljT2prTEJ3N2lhSlB6T3hzcmtyMVRXa1Nj?=
 =?utf-8?B?WUM3ZkEyNU9rd2NML1RkY2t2NWEyME5aTFdwUldmaXlnYVUyRnVHMG9mSkho?=
 =?utf-8?B?ZzJkM2tHaHdhWHFsY0NwQXZiaVpNRTZRUFZYd1NVTFlEbCtLUnpWTGVVRUZx?=
 =?utf-8?B?SEJueUhXOGE1S0c0Y013aGFFakVNS2ZxZXZuWWx4Qm82d2JNeGR5Tm9ncGRn?=
 =?utf-8?B?bi8xSXk0dVJjQ0hMWVNjZjB6SFBsSy84TWJ2Y2NIQXUvTjV4Rzh1NVU0TzZO?=
 =?utf-8?B?YjlmbGkySVBuUTBCM2svZlVjeU01eEVycHlGcTNDS0RXbTYrQW5CYytRcmov?=
 =?utf-8?B?TUtRYjZuZHhSQUo3VlBEVVIzZDNFT0VQMGZ2QmgxVXhrck0vdkZEYmtpYitE?=
 =?utf-8?B?d3BlNTdmL0hPT2xZd09rL2FtL2VjZ244ckVFYWlndFdwMHBlemlMUGh1K1RE?=
 =?utf-8?B?T1BDdi9CMk9WTnJCVkI5YW1kRHc5V2NqNjBHazdRVHlJeDM1Y2lVbEZTd1ND?=
 =?utf-8?B?R1VGSm4zQm50Rk5xVzdXMTBPVEM3b1VWMVJqemFtYTZ1NXNUYVhZdmxpaisz?=
 =?utf-8?Q?DsFQp7I9cucfO/tlHRL0LWcyOuT09Co7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1BSOXFYaVlzUWthV0dUQWM3M2p6QjZTZ2hhN0FtRFhtcVV0Sy9RbXFkWjMw?=
 =?utf-8?B?OXgxOTdkVnRURmdKZFJsWjRpZVFKMXZkNDZITTlTUWhqQjVrTUt2YnV2c0N0?=
 =?utf-8?B?Qmd1VVVZMGdOWmpITUppajhLY0g3RS83ZTd3Y1ppQzBkZTUyYkdBc2lZQ0h2?=
 =?utf-8?B?MmNBVHZqT3J6R0hYWUZHaENmQmVDMkhNT3EvKzNCOTV1MklWQ1ZzdmlwcXVz?=
 =?utf-8?B?SDlyMkhKV2l2eVpxMG8rbVZ4T0VxTlRMYmhDQktTZXRab1pEVG5rTVp4SkdV?=
 =?utf-8?B?ejZIaEJwYkIrd04xckhtdkJjTUlHL0NKYzFtOHRxT1hjK2FoaURyUzVjTmNS?=
 =?utf-8?B?dGpUOW5yQ0VlQi9tbE9sdmlmOUM0ZnlCanc0cDNJQktsemh0UmhaQU5XTHBV?=
 =?utf-8?B?RG40aUdPRjVsUFlkT0pST0tQMGhSSGZQYXpTSzRFZkdXRGlvbE1NZ0FESm5v?=
 =?utf-8?B?REN3RmUxaGpxM09tNFB5U3ZNeTZTWm5Ick1JY0YxdmpMbXRpWVo1bDFnb3M5?=
 =?utf-8?B?eEhVOURnRVREaytVTUpxdVR3L0hLYnVZeEdLZ1ZuVmdKQVMwM3h2eERrSTdp?=
 =?utf-8?B?a3J4djJDYlRDOFUwck5UbW5oYmp2QnJLUDhNNHZMTGtPNXVDanMrYmVLRmZi?=
 =?utf-8?B?clFjODRMUGFRY1pQZTIzdXdzSlhyRFpWVTVuc3ZKd3NxT0ZzU1pDakJMbWNL?=
 =?utf-8?B?ekRvTVQ4QTdhbDA5K0liWEpjamN6RUxWMitxSDNpMFFyYU16OExtY2tiTml2?=
 =?utf-8?B?RmswTnBhL3FXMnRXTHkyRWg2NEl4aVd0dm5HNG5rVE1zT1RwcXRFZGJ5aXJW?=
 =?utf-8?B?UWhqWDRlTlFuck9YeVlvZVNOQmJTYS90dG5LOGVOZVpBajkzNURmTVc2U2RU?=
 =?utf-8?B?MG5mVmp6UHNvTStXMFE2amlmaGRhOXEwSDU3QVRQdk9sVkxaNG14Rm5zMWNO?=
 =?utf-8?B?dDdMaXNiMVhjS0h3Z0NQT245b0V0VGhmdUo2TDlPN01veE1JZUMwc3FKTGhF?=
 =?utf-8?B?c0kyaUVkbjk0ODZ6RjFSVFN2cWdteEpQbEJXYlVJbTMzeGNRdERHYUdnc21W?=
 =?utf-8?B?eXYzalkydVFVN3k1MU16ZXAxdk1wcGRUa1hKQXkrMXMrUXVXb1NycWFvR2FY?=
 =?utf-8?B?Sm54czFqc1JET2grdzZUcC91ZklVMGRxemViQSt0TXNrenArWVhkZ01kRFc5?=
 =?utf-8?B?QkpneFdoeXduMnorRDRrQ08yMDdEYzZ5MG1DNTZSYXllZUNBUVE0MnZkM21D?=
 =?utf-8?B?bkNjWFlva2RHcEFhWjZnRFRiYXlCbXdISkc3eFoweStmL2JqakRDbnRHdFVj?=
 =?utf-8?B?c2plYWFWM0FnaFl5bUtiNEZWWTBCUG1tb3RsbGxldk1qWi8vblhoRzJLdEtT?=
 =?utf-8?B?YzRwMUs5eDBudm1SUmlRVWJGVkdqWm9kaUZzQVl5bWwyNHhJMWlSWVhXVm5m?=
 =?utf-8?B?aEpDOXpmeTlvMHBKeDZkVlpTR0FqZmN0c2QvWWdOTnZBN2FoWllmbUhUMGoz?=
 =?utf-8?B?Q1NTUDAra3FOU1BvNExLZmE1NGx0VDVSZG91MmlmeC9IWTlRK2M5dHdlZlQ0?=
 =?utf-8?B?YXJmckRlQTJQcHZqaFFwZU9RNjBCRGU2VWY2allsaVZpWElCTUJLc3FDVzBC?=
 =?utf-8?B?MXFVbThnOXp1UjhNL3FlRDdhczRvTFB6eFJFTXlnSDVSYzJBQ2lUelRNSnhn?=
 =?utf-8?B?YThZNUNKZUxLUmlYYUZhQzh4MVVTcnlIVTIydWJwWEhjcU8xSDhLVzlDbEE3?=
 =?utf-8?B?UU5yQUk1RXNiVnlXY1FXZDVRSiszbHJjdWVSQU5Va21yL1Z3WmI3MEVHWVNi?=
 =?utf-8?B?NlRxV0wzangvdkl0cUxMRHFhUFcxbStYdnRhUUkrekZuZjVNM1VmRDErQWtF?=
 =?utf-8?B?MjB0d1JHQk1sdWZEdno4T3F0eXowYm5CMEtaS3ltNGRmR05rUVlPai95bTQz?=
 =?utf-8?B?cGtsbVdzdEM5WTlpbUNmb3lLME0zVU9HTExHVWYrU1pBUUZxVno3a3lTdG5R?=
 =?utf-8?B?NWRVM3hKZWY1MnNCL2FLYWw5Y0FUODc3LzVwTGxETFFBTFE5aWhINE0raEd5?=
 =?utf-8?B?cktzU0xoRElLUFgwazdyUzdHUjZEWFE0d1hOd1ZjeEEwc0xMbW5salpvM1Fr?=
 =?utf-8?Q?G3BEaKegaRYrcmUSry7V4sAkv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d352d5-9e6e-4c4d-a663-08de380b6219
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 16:44:27.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SeFk3QPq+qXUQIWkocCUFg21+lfQUD5N/lBblXvxiqOleDB/6NM6Ce4EvQB7/ItlZUtsJ2kHI6zxS5XW+PCYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611

On 12/10/25 10:27 AM, Nitin wrote:
> Hi Mario,
> 
> Thank you for your comments.
> 
> On 12/11/25 00:43, Mario Limonciello wrote:
>> On 12/10/25 9:11 AM, Nitin Joshi wrote:
>>> Add new sysfs interface to identify the impacted component with 
>>> location of
>>> device.
>>>
>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>>> ---
>>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
>>>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 112 +++++++++++++++++-
>>>   2 files changed, 121 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/ 
>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> index 94349e5f1298..3a9190ac47d0 100644
>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> @@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
>>>   Hardware damage detection capability
>>>   -----------------
>>>   -sysfs attributes: hwdd_status
>>> +sysfs attributes: hwdd_status, hwdd_detail
>>>     Thinkpads are adding the ability to detect and report hardware 
>>> damage.
>>>   Add new sysfs interface to identify the damaged device status.
>>> @@ -1594,6 +1594,17 @@ This value displays status of device damaged
>>>   - 0 = Not Damaged
>>>   - 1 = Damaged
>>>   +The command to check location of damaged device is::
>>> +
>>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
>>> +
>>> +This value displays location of damaged device having 1 line per 
>>> damaged "item".
>>> +For example:
>>> +if no damage is detected:
>>> +  No damage detected
>>> +if damage detected:
>>> +  TYPE-C: Base, Right side, Center port
>>> +
>>>   The property is read-only. If feature is not supported then sysfs
>>>   attribute is not created.
>>>   diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/ 
>>> platform/x86/lenovo/thinkpad_acpi.c
>>> index 4cf365550bcb..a092d57d995d 100644
>>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>> @@ -11089,8 +11089,24 @@ static const struct attribute_group 
>>> auxmac_attr_group = {
>>>   #define HWDD_NOT_SUPPORTED    BIT(31)
>>>   #define HWDD_SUPPORT_USBC    BIT(0)
>>>   -#define PORT_STATUS        GENMASK(7, 4)
>>> -#define NUM_PORTS        4
>>> +#define PORT_STATUS     GENMASK(7, 4)
>>> +#define LID_STATUS      GENMASK(11, 8)
>>> +#define BASE_STATUS     GENMASK(15, 12)
>>> +#define POS_STATUS      GENMASK(3, 2)
>>> +#define PANEL_STATUS    GENMASK(1, 0)
>>> +
>>> +#define PORT_DETAIL_OFFSET    16
>>> +
>>> +#define PANEL_TOP    0
>>> +#define PANEL_BASE    1
>>> +#define PANEL_LEFT    2
>>> +#define PANEL_RIGHT    3
>>> +
>>> +#define POS_LEFT    0
>>> +#define POS_CENTER    1
>>> +#define POS_RIGHT    2
>>> +
>>> +#define NUM_PORTS    4
>>>     static bool hwdd_support_available;
>>>   static bool ucdd_supported;
>>> @@ -11108,7 +11124,95 @@ static int hwdd_command(int command, int 
>>> *output)
>>>       return 0;
>>>   }
>>>   -/* sysfs type-c damage detection capability */
>>> +static bool display_damage(char *buf, int *count, char *type, 
>>> unsigned int dmg_status)
>>> +{
>>> +    unsigned char lid_status, base_status, port_status;
>>> +    unsigned char loc_status, pos_status, panel_status;
>>> +    bool damage_detected = false;
>>> +    int i;
>>> +
>>> +    port_status = FIELD_GET(PORT_STATUS, dmg_status);
>>> +    lid_status = FIELD_GET(LID_STATUS, dmg_status);
>>> +    base_status = FIELD_GET(BASE_STATUS, dmg_status);
>>> +    for (i = 0; i < NUM_PORTS; i++) {
>>> +        if (!(dmg_status & BIT(i)))
>>> +            continue;
>>> +
>>> +        if (port_status & BIT(i)) {
>>> +            *count += sysfs_emit_at(buf, *count, "%s: ", type);
>>> +            loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * 
>>> i))) & 0xF;
>>> +            pos_status = FIELD_GET(POS_STATUS, loc_status);
>>> +            panel_status = FIELD_GET(PANEL_STATUS, loc_status);
>>> +
>>> +            if (lid_status & BIT(i))
>>> +                *count += sysfs_emit_at(buf, *count, "Lid, ");
>>> +            if (base_status & BIT(i))
>>> +                *count += sysfs_emit_at(buf, *count, "Base, ");
>>> +
>>> +            switch (pos_status) {
>>> +            case PANEL_TOP:
>>> +                *count += sysfs_emit_at(buf, *count, "Top, ");
>>> +                break;
>>> +            case PANEL_BASE:
>>> +                *count += sysfs_emit_at(buf, *count, "Bottom, ");
>>> +                break;
>>> +            case PANEL_LEFT:
>>> +                *count += sysfs_emit_at(buf, *count, "Left, ");
>>> +                break;
>>> +            case PANEL_RIGHT:
>>> +                *count += sysfs_emit_at(buf, *count, "Right, ");
>>> +                break;
>>> +            default:
>>> +                pr_err("Unexpected value %d in switch statement\n", 
>>> pos_status);
>>> +            };
>>> +
>>> +            switch (panel_status) {
>>> +            case POS_LEFT:
>>> +                *count += sysfs_emit_at(buf, *count, "Left port\n");
>>> +                break;
>>> +            case POS_CENTER:
>>> +                *count += sysfs_emit_at(buf, *count, "Center port\n");
>>> +                break;
>>> +            case POS_RIGHT:
>>> +                *count += sysfs_emit_at(buf, *count, "Right port\n");
>>> +                break;
>>> +            default:
>>> +                *count += sysfs_emit_at(buf, *count, "Undefined\n");
>>> +                break;
>>> +            };
>>> +            damage_detected = true;
>>> +        }
>>> +    }
>>> +    return damage_detected;
>>> +}
>>> +
>>> +/* sysfs type-c damage detection detail */
>>> +static ssize_t hwdd_detail_show(struct device *dev,
>>> +                struct device_attribute *attr,
>>> +                char *buf)
>>> +{
>>> +    bool damage_detected = false;
>>> +    unsigned int damage_status;
>>> +    int err, count = 0;
>>> +
>>> +
>>> +    if (ucdd_supported) {
>>> +        /* Get USB TYPE-C damage status */
>>> +        err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
>>> +        if (err)
>>> +            return err;
>>> +
>>> +        if (display_damage(buf, &count, "Type-C", damage_status))
>>> +            damage_detected = true;
>>> +    }
>>
>> Since this is always visible aren't you missing a case for ! 
>> ucdd_supported?  I would think you should be returning -ENODEV.
> 
> In actual, this condition should never occur as only USB Type-C is 
> supported  in this ASL method but i think it's ok to add this check, if 
> there is any benefit.
> 
> In this case, is it recommended to add such case like  !ucdd_supported?
> 
> Also, if new device id like type-a etc..  is added in future then we 
> need to include corresponding device id supported also in this check to 
> make sysfs visible.
> 
>>
>> Although arguably it would be better to control visibility of the 
>> sysfs attribute based upon ucdd_supported.  You can simplify 
>> hwdd_detail_show() too then.
> 
> If new device id is added in future then we need to add additional flag 
> to control visibility of sysfs .
> 
> At this moment , i cant see anything obvious to be simplified 
> in hwdd_detail_show() . Did i missed something ?

Well my comment was specifically upon visibility. If you avoid attribute 
being visible conditional on ucdd_supported, you don't need to actually 
check this in *_show().
> 
>>
>>
>>> +
>>> +    if (!damage_detected)
>>> +        count += sysfs_emit_at(buf, count, "No damage detected\n");
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +/* sysfs typc damage detection capability */
>>>   static ssize_t hwdd_status_show(struct device *dev,
>>>                   struct device_attribute *attr,
>>>                   char *buf)
>>> @@ -11134,9 +11238,11 @@ static ssize_t hwdd_status_show(struct 
>>> device *dev,
>>>       return sysfs_emit(buf, "0\n");
>>>   }
>>>   static DEVICE_ATTR_RO(hwdd_status);
>>> +static DEVICE_ATTR_RO(hwdd_detail);
>>>     static struct attribute *hwdd_attributes[] = {
>>>       &dev_attr_hwdd_status.attr,
>>> +    &dev_attr_hwdd_detail.attr,
>>>       NULL
>>>   };
>> Thank you !

