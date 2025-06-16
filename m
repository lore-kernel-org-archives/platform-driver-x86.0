Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDF8295DAA
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Jun 2025 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079615; cv=fail; b=tnu0U9FCnxVO6q2elBjw8JQpQdaMAcw/K5y2mB1WaqHR74R0Ngr13klJmUgO1RLUPpYVJvQ+Cay2Z+w6hiUW1yQwgTZcwtYv24cbp0PpFqsSNJ1Sivi/hosPzuJKqPYy0EZA+CtkZb9c5ZGY6hpveb/kHtGDWvWGzwfzuQKTVjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079615; c=relaxed/simple;
	bh=cM4LJVyL/JLSKDNUXftj9sugyZVDMINjW2eZyy/hVTU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JB8E3MUgGlxlBXFTRr9pEkwkNEfEoHydjqEAoeqDfMjllaRBOyy2c09M8BeP6kKFD9/J/UQSd0rVKcoBGrQnRLwtCweMzbz+UkT2f7KYTWwIylxNtmTZj2Gfg1oBSUXCsWfbgyeCjq8b9rnX6DqQIko+gZmrdYBh2YMQ8i3U9b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OEt+QWvD; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OEt+QWvD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvEinmyTpFPpMVGcDS3j85fQvgI5dVNP8K2tGsEEcXuaPQFU+FPpvKt5+fpSQpA1XymMR0eWjlUKIaQRv4bNTcYBVGGuhOzuuP5ix7qWyFZCArAIlkIaU1s5NO0QzzXYaVCWk6v2Y+c/dnO1URqKSSZQBYeASiB7L+IvR88jP2aDsEFGSa+JRh3afnPS04b9Pe24XAHAPonUyo7OUGXQknptxtq4g8SDacHDB2YSz1d67c3Ym6KRJeuSLHI6cCZDvuT/Od/cwUl8AOXF3kdqkBFQB2BUgHhyNShAZo4I87l+jUZ5/EgiRkb79HsUKhBMYlCyatiLvKLL6rnHIv8pBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8mf/7OTlIqMk9QeukkPoHY2PLWd3iYPC3XLOd4wmwM=;
 b=Q2pF5nRRQiR5zRvQKxKTKeV2SKiXDH7l9wQXcx1Q1osxOz7LYQxb+423lLNCoE6WpIUHQr0WtWiM+xDrSDrfNEju6El8kN0Q+EC6gjpaI8F45phbdaoxs/6GwhFgn+aEQeFXXxDIrNIp0ah/T82j5aL4AlhuO3kJpLYyrDzvib1DOHLZsVPaiA2zxnyclgkQEgPU+fgYkEkiiOPU6jUV3guWWAhty/WX8gmp0zY7Qi0V8EGbdsaamOfzHu+yQszqc30JtlMHVK0erT4w/owd2ZUIBvzS2jdJvoBxRuGk4uKX8rDJLr6/79I1LCTf/BSGbC5ShQ8QfnmlEVRij+CDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8mf/7OTlIqMk9QeukkPoHY2PLWd3iYPC3XLOd4wmwM=;
 b=OEt+QWvD8QZOwwd8bwFGejPGr8wUkQN0npsVQb9mUzI3inDZ2I6kjdFsj5T9eJ+7OVgzdfLBFEA9eqmdQKqMYhu8IZ2SMCdT5zTDh0OZB5xe0xUmTc83klXmOdVasBoSBG2CDZJZZwXsiPIkuBdnrg4IoPFyoSreWabTqoBrFnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 13:13:28 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 13:13:28 +0000
Message-ID: <03da9b39-7bde-43c4-b1c6-4aea871a4ab6@amd.com>
Date: Mon, 16 Jun 2025 18:43:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Improve the print messages to
 avoid confusion
To: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, e.velu@criteo.com
References: <20250613114445.1665728-1-suma.hegde@amd.com>
 <d5867166-f0e1-42f6-a34f-4a7e33b71b09@amd.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <d5867166-f0e1-42f6-a34f-4a7e33b71b09@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0098.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::7) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: a953bc30-c97f-4b52-cd4b-08ddacd7956c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cExoNzlsTENsYXBPNTBQdldYY2MwMGZOVmw5WVFPSEErL1NCNUszSU1wMlJP?=
 =?utf-8?B?M0YxK0dtMWgrRm5PQlNOdUpjMG04NWNFb29JUStqQWxZVGZjMDc4aUN0VmlT?=
 =?utf-8?B?RUpzZmJpSlR5OVhJczExMXlEa0tuUSt6T1BocmhaRk5FN08vNG5IOHpZRzBV?=
 =?utf-8?B?dXJXVUwrRGhrZEVDeDBQU0RBcXBMbU80YmwzaFdITjVrSTVtOUJXcS9QNDdN?=
 =?utf-8?B?Q3JxbUxKTGY1dHM3Mmw2MlFKWjhnemxQOWZVdUlFaG1ZUm95SThJeVp3TTdy?=
 =?utf-8?B?K2ozbVNQS1UvcHRlNzd0NEVqQjFsanVtU1NQNEpMNGhITHZlWDIrWWZidDhJ?=
 =?utf-8?B?RUlSaWR2c3A5WHQrOFVnN1V3TzloSmRZZ29tZ3RVd255aXpOZVlLWVo3cVNN?=
 =?utf-8?B?bzhhNUpTQmpqZ29UUDZZRm4rbi9Ld284dGhKZklrNHlEYlFQb1E2c1graFd0?=
 =?utf-8?B?SW9rQnpLc0ZObVhGcCs3Y3VFNnh5M1h1SXZyUWU3ZWxXZStCOHY0dEF0bkdn?=
 =?utf-8?B?OEdRUGw1Z2FwOEhqRERzV0FNSmtFKzlNUHJEYkd5aUN1aXRXRHZXOE1zM2dU?=
 =?utf-8?B?SWIrNmRxbFpwQUYrM1JrUEFwdldMSWdjV3NZMVZ2dHZnd2pMM0NtbmtLTW41?=
 =?utf-8?B?SzZRTmd0bmtsZzRDejVWejVRdGhVUzA0dFNVNGp5QmdkOHRtMEVVbFhWWUdh?=
 =?utf-8?B?SDIwMjhvVERRZGZzSEh6SndqTlVkZ1NlR1lRU3F6RVl2dFFtc0l0c1F4N0Rs?=
 =?utf-8?B?cXBuOWM4S09XOE5VSUVlTE9YeWRzQUJxQURueHZkaVdzK2dsK3FxRFIzNm1u?=
 =?utf-8?B?d0xVQjdHM1l5L1hOTi9XQ2Vla1FBVTJXU3lVbHRPeFNvYWZTeHdPaTQ5emN0?=
 =?utf-8?B?bkJUS1UzdlFCUXVkMjhDNUxlbDNaL3BxZXQ2cThIKytqL01PcDl1UC95WGJo?=
 =?utf-8?B?c2dTMHZ6clB2eFFlb2lObnQyOEgxRVptdFRtQTR0YVY5RGM0cWQ3WkRtVE8x?=
 =?utf-8?B?U1EvMndxb2UzSnUrckNrMXMxNVlHU2lpdDM1bUFNK2ZqYTg2V2xMdFVKcjY3?=
 =?utf-8?B?M3UxcjllUFZlMDVJS2VKTTdIWFdKYmZmZVJ4TFNkRDY4QlZQd01tQW8xS2pZ?=
 =?utf-8?B?Y1FGVE45V1BlTm1BK1ZDWWpVNlZFVWZtUlp6Zm54Yjh0VkN1ZHdyY2hTQS8y?=
 =?utf-8?B?VFhRdW9xeG9FSXF6K00vQUlBNEtPMDkybm9qeUpIRlFEdUtKZUZlM21vSDk0?=
 =?utf-8?B?cCtHd1RuTG9KeW9DRkN4aEpXREpPMlJocEpWNk9DUTRwT3N2c3lzWE9SWXgr?=
 =?utf-8?B?SUY1OUZJNnRCa1Vucml5U2NmdGNCQ0dBT1pyRjBjOXFZbFRaSlZiMVArWWZr?=
 =?utf-8?B?UDBjeWs3VXZjbG9wb2U5TzFRbm9EWDhlUElQM3BHZ3Z1QTlWek5OZlBaRzdM?=
 =?utf-8?B?TkdEMHJRVG1WV3FhVFR1M3dCSUJLNU5QdDljbHZjZ093a1FEWHJmM2pLVkFQ?=
 =?utf-8?B?U2VxekVhbDBJNk9pUXlIZmdua3pSblplTFdMTXV4dDZ1RFhsSnBTcmd3cjZV?=
 =?utf-8?B?ODNRbmZ1VVZCMHpMQndtbVkxM29WSkt0MUJiM2o2ejk3S201T2x5WnpxcWJa?=
 =?utf-8?B?RjZpejBobXpBNEFkMUVWMHloSkVhTi85MEM1a2NzU3g1T3EzdFVJSExibHNX?=
 =?utf-8?B?WFpoYUpUWGVZU0cyV1k3UDRCK0k2NzQyNyswQTZxS0d1c3c4UnpleENYck8x?=
 =?utf-8?B?SjcxVWVmUlFqQUZhcnhYM0ZKWG4xZXFLeVdMWmtidzd0MUMrbGg2RjR0R3li?=
 =?utf-8?B?T3gvZEpHc2xHS3VOcE9TSERqdGtrcXhWb0x5SUE3c2JHaU5WSjdKMVJTNE5z?=
 =?utf-8?B?Vzd2SHF5Y0NPZGxpL0U4cDlYNDBsTERRZDZuYW1UbzlyQzltSG1QTHhJc2hZ?=
 =?utf-8?Q?NBQwUAo5beY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFhVWlMvNEczNXY1aGZjZ3NVbzc0emhWKzhobks5OTdSOGpMSDFocHVDQ0J1?=
 =?utf-8?B?STVlbTIrdlAvK2tFTm45bFA1dkU0VWtLTFVpTVFmWHVVVThuQTBWRU5lcjBN?=
 =?utf-8?B?bkhjanhORUNTRnlXbVN0SE1CbHB0TVJnWGk2cmlVamJWTEtJeUhuQXFWQTVU?=
 =?utf-8?B?TlE3L1RFdGdTaU1QMkdIQnRGMUFtNlkyWGV2RlRraXdJUDhWOEJ0dHJqNUJQ?=
 =?utf-8?B?SmNPZ0Vod3V2WmJRWVNaWU1qa1dkTzhGYWtKcDBEakJ1MUp5cy95Z3NLMDhF?=
 =?utf-8?B?NG8rb0lqMUp6SkxrSUYvckxkaitzNTI0K0RiOVlaQ3A4d2hQUU5VOWlXcDR6?=
 =?utf-8?B?cmJEZ0tQd1o5eS93YTF3UHVxYjg3aGNsU1ZXZFdQNG9tYXdKTWVsSkRaNzl1?=
 =?utf-8?B?RkxUYTk4Tk8ySnJHUnRqbXd4dVpud0RLTkpRWDRMNFNZam1vQmtTQjFjaXNq?=
 =?utf-8?B?MDVFQTk5WkVneDdja2s1S3E2TzdkZUtCMjJHZ0NPQVVRS0c4SW5IOXJRMElt?=
 =?utf-8?B?K0JveW1CM2Rvb3ZKNnZpdXRFcDN1Vll1S2gxQktXY0VUeFRmSWlaNUVRamgr?=
 =?utf-8?B?ZWtWMFFtZ29lLzRFL3ZnQVZuNUlzM3laWTNvWmpLcTdkcCtjS1c3b1l1bEhp?=
 =?utf-8?B?Zm8rR01VQW5PaU1DSUk4OWs2N0M4enVhM3dLeTR0SDJwM3I1dm53SzVQZ3pT?=
 =?utf-8?B?MHJRbXhjMnZQZWlFYVlVdVRzQ0lLV1NsUUlSK3huSFFiaGpYbDZENEVHU2U0?=
 =?utf-8?B?YnJzN2c3VmU0aXZ5MitaYjZEa0RhVEc4MWRpVHo5YnEzTGZvU2JNSnM0YXZv?=
 =?utf-8?B?cjM1eVpESU9oQ0kyV2R4TGRVU3hYTzN6ZlowZmpBeVErVFJQMGdOYTMwVjZI?=
 =?utf-8?B?YlIxQTlQaTVQRUMrdUR3L2xNcWxvSVpDOUhESEl1Zkt1RFpFeGZJUFNwME1l?=
 =?utf-8?B?TGxpYStBYS9HeElvdWpCUVZqZmdERUpuOG0vYk5SU0lrelJGYmdIZHRLdGlU?=
 =?utf-8?B?N21SVXlqSGF5aFg3ZlhsREQ2L25QTUtZV1ZYcUIxUmFvVURLbEFVWWdkRVAv?=
 =?utf-8?B?MW9PRk5jYTFEakgwWjZadkJLNVRTMTNRMXJ1WEI1eStuZFY1Z3hoMEVMN2FN?=
 =?utf-8?B?Z1Zoa1ZaMXdYUzdtOTZmZkdPR0JUZHc0V0F4RDJ1M2xMVm5wREtzK0kvQzc2?=
 =?utf-8?B?Um5DYjdXcXhESm5xcDNDMFRldWRrRHhvTm1YM3M2OXVKdm5JakpadFQ3Y0kw?=
 =?utf-8?B?ZHZwdE5rTTRGVkdPWmpRcGVucUdacE54SGExSW5laWg1ZjVOelJvSk9ZSjBq?=
 =?utf-8?B?bW14Z3Q0eUlxeEZTVklPMzNyM1FhSGVhcCtnNUFlRC9uT0pzOVVhTVprRUhx?=
 =?utf-8?B?M0owcnJQbk5BZk5ZNWdCT2FUcFFnR2QzS0xuVnFXbHVBRXkyZms2Q2FCei84?=
 =?utf-8?B?SlhUMDVjbzZxdkExMGZoNzNiNnowRHJ2d3RWbFVpNnFkaFVlQmxpNHk4RHh6?=
 =?utf-8?B?YzNJbVYwcHdHQW5XZ0k5QmpOSU91OXk2Uk1VNWUzK2JDUkV4VTdSN0lpWDg0?=
 =?utf-8?B?aDRrWFU1UXNqOStRdG1qTnBXbUpWNGE3ZGc1VDhaUERkck45VllsbGtOK0Ux?=
 =?utf-8?B?cE1ObVBTcTdJS0c2WWlnekJidi9VOHRSVEhPZE1lbDUzMmJ4dVhmd2lXVURX?=
 =?utf-8?B?SUF1QXRJVVdIUEJydnBZYjA2YjdPSE94VjFxUEk0K3JWVmlPOVpxYmJxck5p?=
 =?utf-8?B?eExTQVp5eDhjajFEN0dBa3pFTHdmR0pDSWtQMWNNeVIzUTE5eDR6bkhnaERU?=
 =?utf-8?B?N1hRa3ROK3ZlVWFBMDJ0aFNIK2JRMm1FbmZpQkN3anExVGkwODl5UEVGZ1FV?=
 =?utf-8?B?RUpRTHFhVEN1UW1lSkY3ckZQUVF5aDdqM0VtbXpnRG1XeGNkZnJYQ25hVVBW?=
 =?utf-8?B?MGFNNVFhYWNReVRtUWVNMmlJSkZwUTd3VmU2Mms5WWI2cS9Kb0VYUUNHMExF?=
 =?utf-8?B?Znc5ZWRPYTAwU3NyTUlVU21lVC9Gd0pGMmtFeWFBWUMyN3A4Y3hRQkREVjBk?=
 =?utf-8?B?cmJLYkU2NjVCNDNIWEdocjRsUExheThtaGsyMUdkcU85TU9oWEt1bkdUcHRU?=
 =?utf-8?Q?+s9S8Lt5CAzcXFaVFv/rRsD09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a953bc30-c97f-4b52-cd4b-08ddacd7956c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:13:28.5873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PSA4W4TEBV77Kax3py/qqTQTcDeq+Omr6KRotCZZekD/A9538FhjLrx5SosA87PfPC4Zk3N1qtN5oxgiGxBCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669

Hi Mario,


On 6/13/2025 8:30 PM, Mario Limonciello wrote:
> On 6/13/2025 4:44 AM, Suma Hegde wrote:
>> When the HSMP ACPI device is available, then loading the amd_hsmp.ko
>> module incorrectly prints the message "HSMP is not supported on
>> Family:%x model:%x\n" despite being supported by the hsmp_acpi.ko
>> module, leading to confusion.
>>
>> To resolve this, relocate the acpi_dev_present() check to the
>> beginning of the hsmp_plt_init() and revise the print message
>> to better reflect the current support status.
>>
>> Also add messages indicating successful probing for both
>> hsmp_acpi.ko and amd_hsmp.ko modules.
>>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>
> Generally this seems really noisy, is it really necessary?  I feel 
> like the messages in hsmp_plt_init() have value because they show up 
> in the error path.  But in the success path if you don't get a return 
> code it should be working.
>

With the upstreamed HSMP patchset in linux v6.15, "Erwan Velu" 
encountered an issue on an AMD machine with a "9845 (Family 1A, Model 
11)" processor.

He observed the error message: "amd_hsmp: HSMP is not supported on 
Family:1a model:11," which is misleading because the HSMP ACPI is 
actually functioning.

He raised a concern to correct the error message and ensure consistency 
in the message across both initialization paths (ACPI/PAT) so that users 
are informed that HSMP was successfully probed.

Could you please provide your suggestion to this issue?


>
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c |  1 +
>>   drivers/platform/x86/amd/hsmp/plat.c | 17 ++++++++++++-----
>>   2 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c 
>> b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 2f1faa82d13e..b631110e5834 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -610,6 +610,7 @@ static int hsmp_acpi_probe(struct platform_device 
>> *pdev)
>>           hsmp_pdev->is_probed = true;
>>       }
>>   +    dev_info(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
>>       return 0;
>>   }
>>   diff --git a/drivers/platform/x86/amd/hsmp/plat.c 
>> b/drivers/platform/x86/amd/hsmp/plat.c
>> index e3874c47ed9e..724e5c7fc819 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -215,7 +215,12 @@ static int hsmp_pltdrv_probe(struct 
>> platform_device *pdev)
>>           return ret;
>>       }
>>   -    return hsmp_misc_register(&pdev->dev);
>> +    ret = hsmp_misc_register(&pdev->dev);
>> +    if (ret)
>> +        return ret;
>> +
>> +    dev_info(&pdev->dev, "AMD HSMP is probed successfully\n");
>> +    return 0;
>>   }
>>     static void hsmp_pltdrv_remove(struct platform_device *pdev)
>> @@ -287,15 +292,17 @@ static int __init hsmp_plt_init(void)
>>   {
>>       int ret = -ENODEV;
>>   +    if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
>> +        pr_info("HSMP is supported through ACPI on this platform, 
>> please use hsmp_acpi.ko\n");
>> +        return -ENODEV;
>> +    }
>> +
>>       if (!legacy_hsmp_support()) {
>> -        pr_info("HSMP is not supported on Family:%x model:%x\n",
>> +        pr_info("HSMP interface is either disabled or not supported 
>> on family:%x model:%x\n",
>>               boot_cpu_data.x86, boot_cpu_data.x86_model);
>>           return ret;
>>       }
>>   -    if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
>> -        return -ENODEV;
>> -
>>       hsmp_pdev = get_hsmp_pdev();
>>       if (!hsmp_pdev)
>>           return -ENOMEM;


Thanks and Regards,

Suma

