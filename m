Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE18C11
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724650744; cv=fail; b=hToQ2pLPhfRTbgg5EKO6itFrUHXT3i1JThsMrFqXQTflOqTOaQLx9HFmQF5aEX8qTvMT1G9k1vtkwr4b7eeLfF/J6z2fbG2jzROPOVUjEGHcPyAXIR7HWBjk3hsKdOwAlGwEtL7tqkgfhXOf8AVgDvRmrNWZinnfcbeKeiqJajU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724650744; c=relaxed/simple;
	bh=Ts3U5CDqOua65Sa5t6Y7KuhBjLB0Tz8G5S3eg6YdKe4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hTHnwjZqFBszWu6+A/zgD5zdPHHph1+swyDCFcwEH4dm2VNsfRskqw9FwdsC1PcHoX1evPqW5B5S2P46SF/SUMZOScZB/DAgPGBMKr9E9O/H1FN+01liAvKWRhNi9u5Q63+vgURSc5HwyNx9BHzCYNego3ci4DDTWCNkGvz2++A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dQ6PLjva; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dQ6PLjva"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EO0j0hWC2IBl178bK78Sxj+o8DuiXts6GyOh2JmJfsiSrikN2rmmC1GBuD8fstscPzDlUhJJs+THH4Vhz5fMhCJXDTjw1Jvbna2zSo8Zt/a09ZvSWuYJ+EQ224iZXzgIdGJNFyZlm9f2deKHGm79JdWNfszFAxVt8CJxSPt3jaaqhLJph1kD29ofZQ/hQ0Tndeg/m61RFV0O/BEBdr0CTsFNve+N+uyzLxRze2YhxYHhs6vaH7DHrWRfzuiLopAjMpvYWjCYZJqoVemIZ55f8LmF6ZuuD7tFXZMBIJWO6hNL+mYVLJLkM4eMPQ4wKKGiEZ3j3cPMBoKlxpdJhd15jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tgw+Upn7Rd9IuYEKMmIZgTeKL6UEOBPiJ4kThoRfMk=;
 b=rdv7c3H/BoABlmR28ZnKLPgH1gBBYC3quKMKSJVK1bgeO8TydF4157XbSeJA0K0KTQ8tBRYhFpMyYyQtdiBozxMGXj6KDZq7/XLxQZVkGqZGzwhhja8qg3sMYRSuyV7FmtKBtRqUB3pOXW2Ud56LlqcykrPzZREJWJjLF8I4nKd9SWCdlx/Pv5abwCyrJoxhDAfvEFC6b7mx/Wm0F4YIj7jrYsvGRB7nPFef4r5vc7d5joN46H5UgrCbsMoeiI6GxETgZmh8IKxSmkRZMazDPZMHtQlDcwQgrDhdowZsf/4vZ8cif/OfiXxzbvMuswhm+E0mIji+nHxktpsYdhWQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tgw+Upn7Rd9IuYEKMmIZgTeKL6UEOBPiJ4kThoRfMk=;
 b=dQ6PLjvaIT8oa1jbjdcO5iLTGje2durIzRkqlZ/MCF0rhenxKSkCMqt5Wg3dc9Eo22LyWCalyArychGr2qBo8ZoBHIpwOjM8YcAlZMtzC+BP57Pcva8Y4JgKktRKjJ3GJnrSY/J3kjB2iU5H2G3vaERQTQQbxw+q8vVVIBnBcOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DS0PR12MB8788.namprd12.prod.outlook.com (2603:10b6:8:14f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 05:38:56 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 05:38:56 +0000
Message-ID: <7379fedf-e6f3-45e3-bdb7-b25acbb66876@amd.com>
Date: Mon, 26 Aug 2024 11:08:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 11/11] platform/x86/amd/hsmp: Fix potential spectre issue
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240823075543.884265-1-suma.hegde@amd.com>
 <20240823075543.884265-11-suma.hegde@amd.com>
 <b26f3a01-7c5d-70f8-88fa-2128a8aa18ea@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <b26f3a01-7c5d-70f8-88fa-2128a8aa18ea@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To DM4PR12MB5962.namprd12.prod.outlook.com
 (2603:10b6:8:69::7)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DS0PR12MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: a8818c37-05e3-4c3e-9de4-08dcc5915fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFJJbXhxOEJXVUZXUWJSOGJUWmk0UWZvT1RnWDJROFcrekIyU0NWSnJSTFE1?=
 =?utf-8?B?dW1Wbmt5OXBaWmpRM1VpWnJNVzBvYW5tSW1oalJjcWFQNFUxUTlqV0lxT0t0?=
 =?utf-8?B?MkRXeDF3YWVuRGZnOGFnY08rVmNMWU5sQTlEYzg2ZjZwMEk0alY4dzNyVGJW?=
 =?utf-8?B?UGFsYU5sZTA5YmZtdGVaeWN2Z0ttczAyK1R1cFZUTndkbTlHZEZERTN2STc0?=
 =?utf-8?B?bWQ4cnliQVhVM0llaEN1Zmk0RnE5ZXpuY2d5UXBSb0lSTE9qd2xScXFJTUsz?=
 =?utf-8?B?RENic0hEODd4YkM0UTZRMzZoTTlweHZMVmRtT0MrcFFzS3hvZ0hRQ0R0WVVI?=
 =?utf-8?B?SFd0a1NLRUd2YzNGRVE1bm50eEFrZVJmOFJ4dyt0SXYxQ2lHTFUrQi9VR0Vj?=
 =?utf-8?B?SzBzU05jUm1EKzR1QjQ0RGsvS3U2UE9ZSDJ1emFvT3NyN01YbDJZbkRZTHdm?=
 =?utf-8?B?cFRPZWNWR0t2bDJrR2Nhc2tFWW9KTVlJQWRhY2FVY3V5RVNBTE1PVFFFSXll?=
 =?utf-8?B?NnJmWlcwLzZ2cGVDWCtGTzYzbEFiQzJ3UWhWT2krUVQ2VVd0bnl6M2djM2lt?=
 =?utf-8?B?LzQ2YUd4cFFqY1BxUFpVUGFWZmJiNVl6Z0s5djY1MTViWDhRS2Q0K2l4MlQx?=
 =?utf-8?B?S2JGM1FnWEtVL3piRDlLb2NkMmFSRDBHZnN2aVF5ZVZ0REFYSStyWTdkZTRV?=
 =?utf-8?B?bXc5NFUyc25jOHRMcmM5VDZCOWhzZlRvSVVVTHZ5UHFHOFNFL0lveDJsT3RH?=
 =?utf-8?B?VHY2eDBJOWJOKzdxTEh4TGpqQWNTOGxoMXJzS0lBNkJQTjFWa2FrTkdOTDZ5?=
 =?utf-8?B?SUdxSCtHaU9zeWhCM1cxYnJHTlNvcFhSazBaTnUzTjNiR2lVVTNuK05pMm1y?=
 =?utf-8?B?WWJGempjbmJrVjBkZ2pXVVRjUVQwSXRXYXhMNzNOTTBVVnRaTUtZSGVDTWNC?=
 =?utf-8?B?MGVBQlRVR29GbzdVS3pjM2grUjJpSFk2UzN2eGExRWpOZzZMSGlSQXJMZEV2?=
 =?utf-8?B?R1Rwa1ZhUERmalgyc2VGY0JkWW1QYkxianpjQWF5VXBuV1N6b25EaTVVRWxm?=
 =?utf-8?B?Z2pyVGR1eWN5a211a3pMVVhVdjFWbEYvMEFsUXhYYkhxVUwxWDRDR2xIRHd4?=
 =?utf-8?B?YnRWa1RVZHJSb3hnZU5OUFc4WXYzL0JBek5WS3F3bmVNSFVObzg1RlFKVnFm?=
 =?utf-8?B?VlhzTkUwK3lHK1QzMjdGWTREYld0Q1N1S0k2SlYrVWh4NTdMeTliaWNkQytG?=
 =?utf-8?B?VDlVazJIY1lhd2w4VXhiSUFBK1RYTlFvWURZMnJYWng3UFdYNE5mR1RYZ3F1?=
 =?utf-8?B?RXEzbDh1K2xoRkhOS0c2cytTSHM2ZGpBTEhjL0dEVzVaLy9paHducjB5Vlo4?=
 =?utf-8?B?b2J3UzB1ZW8ybHBiR1B4SFY1bGlFWUNMZWpKdUR0a3V1YXFQcjZteGtTc25v?=
 =?utf-8?B?RWFZOEh1OGtyYnBBbUcyVk1ENm5ucC9KUlBLR3VCVW1RQmR2SFl0dlBXazBK?=
 =?utf-8?B?RVplT0hzeHFPSXI0a0FaK242bEpGZVgzcW1KMVRGRERKT3VOcy93Q3gvTDY0?=
 =?utf-8?B?cHNWMjExYmJIN3lRajFZRWRiQjhtSmFHdXlLV3lscE1iSTZrMjRaYzIxRU9O?=
 =?utf-8?B?OHJSYnhFa1NzUDdxUk05akQ4dnFJM1F5bDZsTHJHRCsvcEIrMjlmUlg3bERu?=
 =?utf-8?B?VENNNXdFYlNhMURmdWpUUTRDcUJuZ2c0Vk9xc0hxQkovc2NJajVKNnlCR25Q?=
 =?utf-8?B?a1NVVEJad0VsN050eTErM084WDJuQldsbVhXbnVFWVQ3UG1vVWt6VDhXejhU?=
 =?utf-8?B?aEllbzFpN2tVQ043TjZVQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGtodktQQWFUQ0xYaUxIVDExSzJZdWl3a1Z4eTZVSHdhQWNHVFVveFd6dWcx?=
 =?utf-8?B?YW95S2UvNnZkQjJGck1WdEY0blllczBBbmpFQXREVGNnWTlxSm1NcDBoL0ln?=
 =?utf-8?B?amZrUlcvbXBGb2JmZkd6MFRKZFZ3YnVwdURtY1RuT3FRNzArTDgxSUFLT2JP?=
 =?utf-8?B?aW9abUhVSkZiYUpiR21ocXZzdG9tWTBkVDhYTyt3MjRmWW9xQlhpeERpYU5z?=
 =?utf-8?B?a2QzVEVvVnJWZkV6VWMxQ2JVbkgwWGJhZTNvbll6WUNLekJmb1RXdmtLVlV4?=
 =?utf-8?B?SjQ1SGtyWmEza1gvQ2JZM0JETG90cU5xRDNoUkc0cXRzc1czSTRrZDh6SXpH?=
 =?utf-8?B?RmljMnd0M0hrcHJRb2FkYnZ6TEJkU3R6T0ZVUjRLN0NaZEl0Rlhwd041Ykt2?=
 =?utf-8?B?dk5aelBYbGE3TUZsbDUyMzl1UFpxWU1scUFrZjlhMmd5cnRhSDBDQVNIYjJr?=
 =?utf-8?B?Q01Jb0hpTjVWVXpKNTV1RGZDUE9QOU1Id1RMYStHQm54NER2YnNNY2JXVFQz?=
 =?utf-8?B?VHJGRndRYjFyTWc3VW1pYXlDdTZmaGRIeXVHaVZ6cWZOSnllREFvbFpHdDNQ?=
 =?utf-8?B?Wjl4d0QvZ2ZiRFVpQUdwUDJQc1ZCLzYzUDFrcURLZ0NYZUdKVFlXeFdiL0lj?=
 =?utf-8?B?MGY2eVp3Q1c5ZWZqbHRVTFcyRWFnYkhISk14dEZSaVQ4R3FOZjhHZThNWWJy?=
 =?utf-8?B?RDRmbmlMK1oyNzJXQVdRU2tFRzdFSzBmdHpJVVR1aGpDeXp6REtHeDBBTU0y?=
 =?utf-8?B?ZDVwZzl2VG56Q015YU95TGg0aHYrNDlJZ28wNTNQcjFodEFUbHF1enBRZ0Jh?=
 =?utf-8?B?T2hZc3FxVWc0elZSQlJjMDVremVGS3BsMzJzR2ZVNWd3OHI2RjM4YUV6dGdW?=
 =?utf-8?B?Q3hYODVQdndDV0RFZkZEZzhSNG95OFM3Z2ZIUTFVMU0vanpxc1FYUWx4ZTVz?=
 =?utf-8?B?b09tRDYrL01vTE5sMVA0amxVdFJNU0U4QWw2eEU1U2dIZ0pwMURuU2pkbkZp?=
 =?utf-8?B?MG4wM0cxRThEaVlwVDdYRS9ZOFNBSXZUZm1CeUxVaHJmRkxlSU4yK3ZmcERL?=
 =?utf-8?B?L041OXpHVE9WbDh0c3hmcm1GckM0aXVYSlBMWUdyWTFZdkIwSkVLV2UzcFdL?=
 =?utf-8?B?WDhEdHcxcEFiZFV5UmlpSGRQOEEvVXhvQkxSZTRKZ044Ylh6YW9HSjVCMVZy?=
 =?utf-8?B?SVpTNUFGZmI1d2xmd0hpSFVZOHpDV0ZHdEx3S1NjUzZBTjAzNS9NcG1LQ0VU?=
 =?utf-8?B?NzZZZjZ4ZDhRalNpREJXcktKVXpLUmRmOXJHWGtxbStTcmtDellTSytEbzdD?=
 =?utf-8?B?SnZ6SHNNdHVYWDFnL1MycGpHT3hWYmVoRkJoODZEVVNuSi94SUpiSmIyaG8z?=
 =?utf-8?B?bzlvdmE2MWhEYkRJQ05qVGJ6ZEFuNTFuZEU2T2ZiZGMwenFjNGZGUUxod2c3?=
 =?utf-8?B?SnhvNDBNOFZDV0xlUlpHSm1RcGdOMVFWN05KZCtnK3VEd0o0TXovR05SMjRG?=
 =?utf-8?B?aDQrTHNtYytKcktYbU16b3hva1QvTW1BbzJwTWt3UWM3V1ZmYkZQL0pqM05o?=
 =?utf-8?B?ZWNXbGRIMjlOVDVRcnpHTzUrd1NXSmsxTVRscVk3S1NQOXdLN1BVT2N5NUV4?=
 =?utf-8?B?bHZmUWd5MU00QkVBMnJrZHFJeW9kbEZuOW1INmVGa29teDRLb1U2UWZueFE5?=
 =?utf-8?B?UHlBNm53bmlrMExRVGhValNPVFNtSmRXbDhITVpvczhlSHg5WVZ3djVHUHVn?=
 =?utf-8?B?T2k1dDFQQTRkNlo3VXVYanp3MUZZRkJkcGJ3UkhsWVFzNXA3YW9KOVJCZHJW?=
 =?utf-8?B?cFE5NytGcWkvZnU0cnJYdi8rNkRQSUhDeUlBeFBWYUNOSWV6elV5VEh4Wm1a?=
 =?utf-8?B?OUt3UkxxS2I0YXFUOWcvNmJQbTk2YnNnTWZ1eXYvWjUwbWNxd09UaHFhWkZa?=
 =?utf-8?B?Y3hzTFdiOGJscGlJc2srNUZEdm5xbU0rN1IzdUJWRGdmaHJxS0VYSC9ZeDJm?=
 =?utf-8?B?UzFYUnZ1ODh3ZE93SlQ2WVJBVkF1eGcwcXRhcDVMWTBtYklzaStJZmZiRGR1?=
 =?utf-8?B?TmZYdTB4bzhkYjdMMVMxaVRLc0hrUStRWWlKUUtoemVHSStKK2Vwd21zQ2lH?=
 =?utf-8?Q?aE9afGeLPXZenT3pROnk/B1UJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8818c37-05e3-4c3e-9de4-08dcc5915fdc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 05:38:56.1688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YU4Z/z8ri6LmENzr/E4Zukct5aQUrKG/KXa4pYI6DYdQENHbbaN/5ppL/Pz18uSuF7t1uSPyo0Ew64kkV9R/dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8788

Hi Ilpo,

On 8/23/2024 7:24 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Fri, 23 Aug 2024, Suma Hegde wrote:
>
>> Fix below warning caused by smatch by using array_index_nospec()
>> to clamp the index within the range.
>> "warn: potential spectre issue 'plat_dev.sock' [r] (local cap)"
> While the warning have always been bogus for these code paths because
> those are not user controllable values, I suspect the warning might no
> longer trigger at all. I suspect the warning is tied to kstr*() which is
> no longer used.
>
> Also, it should be hsmp_pdev but please retest if this patch can be
> dropped from this series (no need to resend the entire series because of
> that, just mention if this patch can be left out).
I retested with smatch and warning is no more seen. Please drop this 
patch. Thank you.
> --
>   i.
>
>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>> Changes since v4:
>> None
>>
>> Changes since v3:
>> None
>>
>> Changes since v2:
>> None
>>
>> Changes since v1:
>> Change plat_dev to hsmp_pdev
>>
>>   drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
>>   drivers/platform/x86/amd/hsmp/plat.c | 3 +++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index f2bfc5981590..16a82b8bce28 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/ioport.h>
>>   #include <linux/kstrtox.h>
>>   #include <linux/module.h>
>> +#include <linux/nospec.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/uuid.h>
>> @@ -272,6 +273,8 @@ static int init_acpi(struct device *dev)
>>        if (sock_ind >= hsmp_pdev.num_sockets)
>>                return -EINVAL;
>>
>> +     sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
>> +
>>        ret = hsmp_parse_acpi_table(dev, sock_ind);
>>        if (ret) {
>>                dev_err(dev, "Failed to parse ACPI table\n");
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index d55c984a9a5a..8fb395e91806 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/device.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/nospec.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/sysfs.h>
>>
>> @@ -79,6 +80,8 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>>        if (sock_ind >= hsmp_pdev.num_sockets)
>>                return -EINVAL;
>>
>> +     sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
>> +
>>        sock = &hsmp_pdev.sock[sock_ind];
>>        if (!sock)
>>                return -EINVAL;
>>

> Regards,
Suma Hegde
