Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2942314F98;
	Thu,  9 Jan 2025 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437033; cv=fail; b=FvfAityLuU3VM1XYj9mFn9MXKXAcP9Ea04Xpb5ukqlaHBNhy8Iyi5eVqkzUMbPV7MedGAoSvNT1Kpa04fSuo8rtiONOq20Snu7eEj1L8ddaLOaO8OQqo2q0pmU3MjDrEhZBnq/vFjCYjgNgCDNwjYzPEi5Yl00cZmCXkX7+3j2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437033; c=relaxed/simple;
	bh=SMkEWkr8HErUd7eQjtBrr7BeljVq8bse4EgHA5sb79I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AFS0ND6aywcqpJUUJgs3CrEKyBDsZngCnhgz84m8YqTTBf9mQhP3SVZPCEUbXa06GrmPCrt79QhUzQyhGu20ww4nRp+eJsb5WrP1LwY6GToeZRz67YqhDJXkTtPd6vH8gSJBrdKxvF76AbLtCoOohlB9oaB7iB0O0SSIsk2H8UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oc7Vb57R; arc=fail smtp.client-ip=40.107.243.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oc7Vb57R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8UUcAb0SDD5lbp4jU+vmERsKLLrePwSfrDF3K+w6ENTZsRGFhFdGjIP/lijnML2mbua/S17SBqrA6Mw6oTcyzJJB0GbsKrPo+sz3TCKDhk1x7dMGSP40vgGFRIOTSI90/CHJfvMc8TFKASf3oLW45vimz5Q33E95WXxzVl3WKaN/urepU3BcICxRjL4gARe0JTHWDqbu3TDxGSdFs6v4peKTeIhQ1fquOnDpWmPGjyttbNTpo4Lemmkz5Sev7oQuwFdkPZ0Q5SJ53UPxlExZAmQ2SczKLKI7QfC1CKnOpbfXgOJYPSG2ln27bZAm2PjWXsijprA5MQAeS2UcujUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgL6qi07kZkWhk4ynT/ru+uW7xz2WiV8+cLU6VwuBxE=;
 b=ngh9BWeCgjyxUpP2zYykd43e9O30Z1Dd+2ErERIqNdqp9rBqtUj1RjEJNCH+/WnOZbhTjz/fm6OpQ/ZgzTx41ZENz8bp69C0F8khG/EbdSLvwUzHY3P445tpnGNMtRpl+aikIle8Fi9+xoJADLVIuAmjwO3f78PNdhJ5SaoTjWVG4NAeI9PdJjwUSpD1x3fMYphep7iwUOGyCC7WfcJyaLqTo2bksaNXwBlXTPsfB82cEcbIbK7yxWluJBdo2p+0aZ+7n0db4tp0bS+IhGSdZFfjl1N5Jkbkl6sTqk472UTtInDiv3RCultDG6Pw4FJRIYWwv6bC0Uw2wcr8RJi00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgL6qi07kZkWhk4ynT/ru+uW7xz2WiV8+cLU6VwuBxE=;
 b=oc7Vb57RKYOh/tgKsmobVbSUVUMHHEz846eoSzxDotUWiuP5uqJi9mTgi8Ebvk7N+JugwvRoH06v1oKhGe0+CO0L3krjr9LAdbqcg0xXlr0QijK2Im+Q1FA+3ItKzWegPkiOPgYSbm2eNyhoZCW7jTe0V3W2Knco2Wcfr4MljX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8742.namprd12.prod.outlook.com (2603:10b6:806:373::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 15:37:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8335.012; Thu, 9 Jan 2025
 15:37:08 +0000
Message-ID: <b1926552-0b78-41f5-a6d9-04a77f1413a2@amd.com>
Date: Thu, 9 Jan 2025 09:37:15 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Joshua Grisham <josh@joshuagrisham.com>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
 <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
 <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com>
 <88ae2335-86dd-4cb2-8e20-88973a8e28b7@t-8ch.de>
 <1f5b77f3-c427-496e-9c1d-3150177f29d6@amd.com>
 <7f568cbd-b299-41c6-8786-25f225de8f4f@t-8ch.de>
 <39e1f247-3b9e-2919-439b-edf95bb7927d@linux.intel.com>
 <c58ee2ba-7800-4da0-81a3-faa971515cab@t-8ch.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <c58ee2ba-7800-4da0-81a3-faa971515cab@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0118.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5d74b3-d8c6-4e3f-390f-08dd30c37a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkFZdEtEakk1VUlIQVdTQWRaNUxIbEZsaG8xNTgrNDNSK0JIeWc0RXNZS3Mv?=
 =?utf-8?B?OE0ramVvbXplMms2YTVrcUx3c2Y4V0hiQk1ic000RERpcG91SFZZUXVwcThr?=
 =?utf-8?B?YnFrakIydkJFbUkxNzNvUTh0V2cwQk4vbTJYcW14UE9wcWpRcmRsWGU1TmJG?=
 =?utf-8?B?cVZBbmdKTGJaVnNmbWRaWjFDd1d6VmlRUkIxd0dZU0UzSEVaSTVFdEtzaURZ?=
 =?utf-8?B?Wkg2dlJqZFM1RWtMZXkvMDQ2Mit6elZHUzBTTkVwN21mUmpVdGViSWNSaG9Q?=
 =?utf-8?B?OE9MZkxHYnlMNTgxSHV2WGN1NWwzQUtBWGorQTNuNnRGamZGeGRsaHdCd293?=
 =?utf-8?B?TDNxU3NsZXNoVHJ2VkJPUHZzQzJockY1RGJZVzY4QXpkK05DbzVOTUswY2lu?=
 =?utf-8?B?T1ljOHkvZmQ5YzBkV3c5V3hUcWNSY2xkRXZZT1pHRmxvekh6NXRXb3Z3NW5h?=
 =?utf-8?B?WmJSdnNsdXNGYWJSdEpUeW1LakljRElxUFlTUk5xS3haaFNFTGhkMHhpYWhx?=
 =?utf-8?B?TWtKcDNoR1BZSDdCNW1OdmpGOHdFbWcyOGdGMFN4eGxXZlp3QVRkQzJaZFBX?=
 =?utf-8?B?TzhxSWNPQXlxVFJ3Q0JEVXdKNmg3ckJtSHhsRUR6a0VWMExDR3lwaTJtMjVK?=
 =?utf-8?B?SkRjSmZrY1BPZFJrT2loV21xODFKdU8wZzk4VHZjUVQvZm8zVUtSbHJ0V2F1?=
 =?utf-8?B?blNKL2UxeXVBU2JyMjhncUhucXovMEVLVWw0MVhHc2kvcm9PYVVWdkR0K1pM?=
 =?utf-8?B?SUNWWXdWeWFzUDRpdk1VbG1zc2l0R1BCV0xrWVRaU2tVVXZHd1hMWXkwOVdD?=
 =?utf-8?B?aHVrOURkVTIxUXgzWkVhK1ZiVkorNHVBcXNDN2g4YWQzdmhKaDQxREZaZ0VP?=
 =?utf-8?B?Yjl3QUd6U0pXQ2laOGNjMVIwVFgxYkJ4UCtralhJMkw5djZaeDBLQUZWV25X?=
 =?utf-8?B?M2RVRlZlRS95ZVNzY3NVUDVHRndOOWJ3K2ErYW9maXdrKzJLSmdQajNuNTFY?=
 =?utf-8?B?MXNMZE1TSjlZK1Uvc0lJWGVCRVBoc0IyaVVxZ1Z5dWorSS8vd3d6WElISXFG?=
 =?utf-8?B?N0dLVFRUVzBLUExxa3prZlJURFlYOVN6SW9iZm1KbndPb0liUjhGS0FHckRq?=
 =?utf-8?B?cjlCbmFkQkhCMWxTZ3g4WEZtTWVnR05pdXpDcHVLMm9DL282TmN1VjR5Vm1j?=
 =?utf-8?B?azMrS00zQytML1NRNml5QWtVc2t3dURvVkVOd2RqQWdqWlk0MTJ2cjdZWm15?=
 =?utf-8?B?emNzUlFqbkNVaTlabTZjeHBkZGxxQm85SWpDWGdYUzBwR0RKZTJvTUwxb215?=
 =?utf-8?B?dThKTFlsT2ZIaXFaa2ZXSUZMeTN5aTFCUUZHWTlSTWpQWVJydVRtKzZDdnh4?=
 =?utf-8?B?cmJ3d0RTK0pmWGpnSVY0azNPS1RBOU5CekRZZjgzQkVCaVhScmpWWHN1d0ZI?=
 =?utf-8?B?THEvbFJIRG0rREkzMEN2dTcyY2tqanVFSFJlY3U5dnRHQkpKUmVFek1URUJo?=
 =?utf-8?B?UzRkVE1XMGNScGpCdVJwQzZXd0cxWm9wdFFndFhlTGtTOG45Qlg1WXJ4RzdL?=
 =?utf-8?B?UU1Yb2RrdmJpd0sxSGpzb3pxRzNtMHpoRVpuK3JTSk9PclpRT0wzK091Um1s?=
 =?utf-8?B?MHlJeGt1cWRsS3ozWXI0OTE1cmVsY2VQdURuM3lXampDMWRkdk55SnpMWU9T?=
 =?utf-8?B?L1F4cnFpa3RUZFhhVFFuak9xeUdGWldKWklWTHd6bW1NTnpmL051U1lnYzNV?=
 =?utf-8?B?K2QxNm5LbjE1Qldmc2ZTMzhnR3pOQTVGT0xHc1ZkWjFHLzhrbENieVZLNkp3?=
 =?utf-8?B?TXVVUzducjFVMmxVT1pkWEQ1UjF0b0NMWGtHOVE5L0JGaVdXbjdLVVIyNFN3?=
 =?utf-8?Q?dQv004pUPRR8i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEFKNXpPS3d3YnRqZklqK1R0bko3Q0R2djQ4dWVsYkJ3aTRoOEhhSlpVKzEw?=
 =?utf-8?B?V3ZNZVhZdkJQcmxHMDl2eEI3ckpWTFZRV2YxZ0RZanZPY0laVGRwVHdoV2VM?=
 =?utf-8?B?VDFlcHhPelZDYzQ2ZDhJektRZXhKUm5zREhnRWl2UVpYb2ZxZTFUKzNKTWUr?=
 =?utf-8?B?UjR0U1htK0hEdkxPaE9DeGQ0RUNreFpsYWNKWTZ5eW9xeGYyNTREajVXeFdC?=
 =?utf-8?B?ODE5QjQyamVZekZESFFXOUtXcmpUWkJTZlVTdGpMYUhISnJyL0F6eHRTVkxx?=
 =?utf-8?B?UGd1ck1ITm9kY1ZSdnNqdkJIR0F0U0VpYlo0NjRIbVpudGFUV1VEOGRIakJX?=
 =?utf-8?B?Z1FqUWJ5eXh2eUg0elowcmJkKytxMGg5WGJpNTlDcjN2Mjg1MFpMWXN4NnZz?=
 =?utf-8?B?WHVOc1NwMzdjalR6c1p5NXh0bXkzVHpMN1hsUmxMMnBUZ2FxMUxENUhta05J?=
 =?utf-8?B?N280akxoRUVRUVhDb2lFQlNERUxwQUQ4R3dMbGc5N1hrT1Byb25QaFpsNHI5?=
 =?utf-8?B?VDU4clNRUjdkcmtERHlrSHVLTzAxY3JKbmpxcDFsSUR2WUpFeDQzRGlrWENS?=
 =?utf-8?B?eWtsdFVoekN5b3c3UmR6V1BNK0hqbzNpZGFpUWVNektEUGhVWFQ0QWtUMi9Z?=
 =?utf-8?B?U1ZsRWI1MTFKU3cxaDVjbmZDbWtsK1J4UER3WVE4b3h1NkRSVWRRemhlZGcr?=
 =?utf-8?B?aytodndNbkoxSzBMbytXblhSOUhvRDA4UHJ3VzYwWVNmRkVDZG1IUVl0akNX?=
 =?utf-8?B?S0JFbVNQQTJZN1kxTEtDUUFQZ2lybHZkUU41bFZMU0ZKK3ljN3dDaVppbEdF?=
 =?utf-8?B?TUdvOWlMQlhsREtsYzdNL2dkcTU0dGF0ZGJ5dGtDN0crdXFlRjN4SnJ3aTRm?=
 =?utf-8?B?Njd3MVZCOVB5NVV6eGhUNElIcFUvR3hOQTIzcjRHc3FybUhWMWI2bytCUG9T?=
 =?utf-8?B?L0RSTUQ0VTJRQU9UUVhRVTRiN3dkdHJUMEdSVHIvTmo1ZU5uQlZkTjd3UnFy?=
 =?utf-8?B?Q2V4bmdGWXlFTG90NnlrcFVzcllPWFNwUHU4aGg2Z21vd0N5S0FiU1piVVF1?=
 =?utf-8?B?bmtjYlBQbVNmaWdiMlRiMWdqZHBnNVg3aTJybHpCdEVYT2I1cEN3R3FRTmE1?=
 =?utf-8?B?dGxoUXVYVjdJakJsWjNLL1hjWFRsMERMUTN6SnM0L2p6U05LOUtsMHMxaWNm?=
 =?utf-8?B?UnJDR0hDNjRJa0d1QjUyQS9zMFVQdTQ3QVFvRHhuSlF5TDk3R3U4QVRCeVFu?=
 =?utf-8?B?aU90SjZRUnIxbFhvR2oxVytBV1pBNkowbU5CTUJOc2xXR2tIMXVxdFdkSTRE?=
 =?utf-8?B?dFRxNkdicjA4KzBubXoyMDRDWVpsNUxURC9qdzFQY0ljS2Q3bVBVcXpwVDFL?=
 =?utf-8?B?bGNzdy8wa2VhVFkrdlhUdHp0UEF3YXNLSWI1WnJJN2hXTUVIa0NDRithUHF6?=
 =?utf-8?B?TEZ3N1hzR0NLU1VCd0g2VjlkV1ZLN0g1cnAyWUlYUnJmNDQ5bjhMWXcyNTRS?=
 =?utf-8?B?a3YxSkJmSEV1WFJmQ0xXRGJqUDZtLzluWDN4bjRqUU4rVUtTb29qYlR5d0NQ?=
 =?utf-8?B?NFgxSHBhVTVxSk4yMTNMVUVvUVNVMk1IWDZIL3RSY1FZNGwyekNNWmFxUFk1?=
 =?utf-8?B?ZUM4Yng0VjgwOXR3bDNmZlF1WXFBZCtYa1F4R2JUSStBNlI1UExlSHk5NlZP?=
 =?utf-8?B?NW5tVFVxaHRjUnNoVHIzWkhvcFZEMk5tVlJRZ2FJTUtHSlFaMW9JMWlPUVhm?=
 =?utf-8?B?K2wxTUR6NUxzM09QbGoxN2RWVTd3KzRFM3I4MXNRS2FQSC93TktVZWVocVdz?=
 =?utf-8?B?YmZWdFpJMGpIcEtuY3FDcU9OWlhyR2NwRXpQaE9lc3FPazJrbHVuTWhEOTZ2?=
 =?utf-8?B?cW12T0x5b1dER3A1RzVnTkk1RVUvYzZudEwzS3Z3RmlUblpnOTJ3R0c2UEFQ?=
 =?utf-8?B?ZnN2RWovR3R0T3dRdmFVc1VpNEk1S0hpaUFEaXRXUjNBVGNBN1FONWRrUEtH?=
 =?utf-8?B?eVdOcE9kbVhybHVLd2lhYldNUllRTVVYYk4wR1FES0VvSWtHNzFjd0YxY3Fn?=
 =?utf-8?B?anhrS1NuVFpjY2RXMHpuOGExd0dJODZuK1lGdUlhWmduWHVNQVJpMDRZZ1hC?=
 =?utf-8?Q?tZRBoqh+tOZPzw1dUeMOnXsYV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5d74b3-d8c6-4e3f-390f-08dd30c37a30
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 15:37:08.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/RvZ3aJ4oXGjDQH36BdeYRsvm+/FruT3iiarOsgCR4GVbsk3feFslzhLWD2TFNFJnADux1St+VHF72P54fwFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8742

On 1/9/2025 09:17, Thomas Weißschuh wrote:
> On 2025-01-08 11:30:12+0200, Ilpo Järvinen wrote:
>> On Tue, 7 Jan 2025, Thomas Weißschuh wrote:
>>
>>> On 2025-01-07 15:18:21-0600, Mario Limonciello wrote:
>>>> On 1/7/2025 14:50, Thomas Weißschuh wrote:
>>>>> On 2025-01-07 13:29:08-0600, Mario Limonciello wrote:
>>>>>> On 1/7/2025 11:05, Thomas Weißschuh wrote:
>>>>>>> The driver showcases the use of the new subsystem API.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>>>>>> ---
>>>>>>>     drivers/platform/x86/Kconfig                    | 12 ++++
>>>>>>>     drivers/platform/x86/Makefile                   |  1 +
>>>>>>>     drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++++++++++++++++++
>>>>>>>     3 files changed, 91 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>>>>>> index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f07074944d6c42dc204fc8825a42 100644
>>>>>>> --- a/drivers/platform/x86/Kconfig
>>>>>>> +++ b/drivers/platform/x86/Kconfig
>>>>>>> @@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-tablets/Kconfig"
>>>>>>>     config FW_ATTR_CLASS
>>>>>>>     	tristate
>>>>>>> +config FW_ATTR_TEST
>>>>>>> +	tristate "Firmware attribute test driver"
>>>>>>> +	select FW_ATTR_CLASS
>>>>>>> +	help
>>>>>>> +	  This driver provides a test user of the firmware attribute subsystem.
>>>>>>> +
>>>>>>> +	  An instance is created at /sys/class/firmware-attributes/test/
>>>>>>> +	  container various example attributes.
>>>>>>> +
>>>>>>> +	  To compile this driver as a module, choose M here: the module
>>>>>>> +	  will be called firmware_attributes_test.
>>>>>>> +
>>>>>>
>>>>>> I think if you're going to be introducing a test driver it should be
>>>>>> compliant to what's in sysfs-class-firmware-attributes so that when it's
>>>>>> inevitably copy/pasted we end up with higher quality drivers.
>>>>>>
>>>>>> That is you need at a minimum 'type', 'current_value', 'default_value',
>>>>>> 'display_name' and 'display_name_language_code'.  Then individual types
>>>>>> employ additional requirements.
>>>>>>
>>>>>> I see 'type', 'current_value', and 'default_value, but I don't see
>>>>>> 'display_name' or 'display_name_language_code' here.
>>>>>>
>>>>>> Furthermore as this is a "string" attribute you're supposed to also have a
>>>>>> "max_length" and "min_length".
>>>>>
>>>>> Agreed that more examples are better.
>>>>>
>>>>> But are these attributes really mandatory?
>>>>> "This attribute is mandatory" is only specified for "type" and>
>>>> "current_value".
>>>>
>>>> Ah wow, I had thought they were, but you're right they're not!
>>>>
>>>>> While "possible_values" certainly looks necessary for "enumeration",
>>>>> "min_length" for "strings" does so much less.
>>>>
>>>> Even if they're not mandatory, I think it's better to include them for the
>>>> same copy/paste reason I mentioned though.
>>>
>>> Thinking about it some more, which attributes should all be included?
>>> Having all of them in there could motivate driver authors to implement
>>> them all even it would mean filling in random values.
>>> The provided examples can already be copied-and-pasted and slightly
>>> adapted to add more attributes.
>>
>> Can't you like add comments to the optional ones to reduce the incentive
>> to fill them with random junk as it's a lot easier to just delete them than
>> generating some random junk. So if a developer is unsure what to do a
>> comment telling something is optional would help to lean towards 'I can
>> safely delete this'?
> 
> That would be possible. But I'm still not convinced.
> If driver authors can't be expected to know how to implement their own
> sysfs attribute groups from the similar provided examples as needed, we
> would have to provide example code for sysfs attributes of all firmware
> attributes. And that would be a lot of them.
> 
> Also the attributes themselves would be highly repetitive. The
> interesting logic would be how to wire it up the the rest of the driver,
> and the example code can't provide copy-paste code for that.

Thinking about it a bit more what do you think about providing a macro 
helper for drivers to use?  Think about how we have macros for pm ops 
for example and drivers can optionally populate all fields with callbacks.

A macro for "enumeration" attributes, another for "string" attributes, 
and another for "integer" attributes.

For string it could have optional values .min_length and .max_length,

For enumeration it can have a callback that gets you a pointer to a 
string of possible options.

For integer attributes it can have a field for scalar value etc.

