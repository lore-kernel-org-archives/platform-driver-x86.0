Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A880EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 12:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235770AbjHVMpv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 08:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235755AbjHVMpu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 08:45:50 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA891BE
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 05:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/3pthfFg/md8HwsxeRJ9zPRpyPvnXnxwCxCXiC2Aol6XyXdDXDQnD8gRGgYGNFzU1rKjcVBiJrWHTwOIzrwqDXG8bC0lS+uQrVY7VEIujLlYK0vI3M4tOSwk6lejy03YxkK8WYu2GCkX0z8Cmj7i4+DZIbVsdYUhhVjM6utabln9IT1zPV5LG1iz0h8R0F9wHNEIEizZeKvf0/4n7O58Te5RZ5LQQK2s9ZS+4Uqz/LYEkIiqB0n+WpUTi5fmQgdeaJ5hKsChLQNKwprIL5IDqS8CFs5A+adUPavMrDd37RtuFVxff93nrCYYA5zATZJk9pNpfmO7TaFE6bjy6OxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FxOpG/I4dvSHLzQfrYt8hxcutQiPePPF+hfPpQt+P0=;
 b=Yum6LXA5kMA7uDrMZO7axMvGTycQkfGq8A8w4wcUnhIA8vSPdUwkhrAvFyr1VFAiVaKqsNn1EmuG8z8K8Jjg46UYFJ5W/HNsz7mYc6I84P9uBlAJNnbDFTz9Wr4vmCJQSMy+GfV5rNcKoX/8W21vGPYwUqepmnSi1cXnVBZ7n1HHbYPxXjhm8FuQWjJZDN4mibuPXMQgc98WrSUcHPhBlvKSWK953+ZSkJ2Dz8OdlcCcwYdLHw7tWTxjNjZfjxtZ+iNzeSBTWCmsFUez4Y4xF2uVFY9ETb/tge1fWNIfWp+bADiOyI1PvnjaO6DNQYQuzWiw1hLZnByOpm969rPCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FxOpG/I4dvSHLzQfrYt8hxcutQiPePPF+hfPpQt+P0=;
 b=RSzb4JlMXLEJvacFD+y+ooTZ6CKcP2thxuUMqhTma81G9X2SPAQonYbTLUNzjqlcEnMuHUZHeSRju3QLULJza+xbvv1ONZk0/Db+DU74g4g+wzRS/0eo1bnwwjbgv+aQbVM0QJrNDMM5oqCydT/43kLoRDYzINFbqAnvL9JO5kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:45:43 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::48eb:b2ce:39d0:9626]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::48eb:b2ce:39d0:9626%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 12:45:43 +0000
Message-ID: <884db020-7868-2334-9add-bd49f9543d3d@amd.com>
Date:   Tue, 22 Aug 2023 18:15:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: add support for metrics tbl
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com>
 <20230818125119.1323499-3-Suma.Hegde@amd.com>
 <6fda67c7-f2c4-26db-c3ce-b8b7b53f7ee@linux.intel.com>
From:   "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <6fda67c7-f2c4-26db-c3ce-b8b7b53f7ee@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::20) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|IA0PR12MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 746f182f-869a-41ee-d813-08dba30db2b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: txZMqQnysqouLe7Habu1KE87dI1ijKKJ97Bn2AMd9X5QDLfvXLfoO/rcr+raKSzgs/NyVxyDFBmTT8N5oRljpo1cUCnKSAuhjm6ZSpJJlSBgv6qyP4D8R0Rk7j7G9yC0SFSfkjRUX3UChqPArHoSnul1op/iMgLxoRTi1MK1JihN5MG8hVBHEBMYwTqaZwE1FIH+rTMIbdKoFRbVdYGLIe32s9uSi/3JA9zgFzy49xOBB4UwlpM91LXbjtkjGX66Dr0xrdsKfcyV76uOrZVNdjM7JB04Y5bV5Zcl332QQ+74oLD2PyJAM7+g6gimdxdYVtMOrFuv/P2lVyF9UbD/DLcKm4xoq3YDLzUxBnzy+D+0Rty79HIr99FaaZPqLMdrj0aClqowtFMbrND0Bcq2018yeCNbjFcX1rqv5cwGKt9vpIkPxnp2RRUnIXEdM0vOIpv6QxQiLafu3M7Fa1OSD8++G2tBeEM20ULKvCGOA7mjIV+qwOznElVGv7AU6spVBiPDnJIGhqwROSPw1MU2u0d6EXJ+Oua7H2OE3lM2SRARINyzXyBBajHjkl/LBTm9CHTac7nzLZTErNh4vLvt5HkhNfts6K2Ri0n/z/l1UTd/9ccovV6fpU9bNrvPnGH0b657MRQOLXdduPX8CZc9NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6486002)(53546011)(6506007)(83380400001)(66574015)(30864003)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHNqbkI3dmdrNXdabEczRC9objRRaEZCVjR4NmVBZi9wVUxwcFpXQWVncE0r?=
 =?utf-8?B?cVY5QVFsRVUzeDdyV3lsdHZ6cDg2SkZHN3hSRmEvVzJJVXRyMHZqb2FxaDYx?=
 =?utf-8?B?WTdiSUhjWlJ2NFBibmhRMDAxVE1KWEdWVTZaZFhGU3lKcTRlLzQ1U1lYNVZk?=
 =?utf-8?B?UDlQMFdJU3ZPQjh4cjUwUW14ZktyM1lHQ3lKa1Y4N3pMcjNMY1NqbmZZdjFk?=
 =?utf-8?B?R1J2aWM4WTNDa0I2aUpmWEQ3eUxDQmVtc0dVVUdqMEVUKzlFbVdsdmFjK3Ix?=
 =?utf-8?B?ak5UM0p3OTE4aXBaTFBXVGhiZ1BVSVZZN244aFRsK2xhZlZCMW1qa2xtOC9x?=
 =?utf-8?B?REwvQzl1MVRIUHNoWVZMRTgrNEdubUhjdTBHemc5VVdzRWVNdU8wMTRHcGMz?=
 =?utf-8?B?TlpraW9VUmF5WGtQYXFqSXU0NlkrVmluTkI3NnFzRXIvN2s2WEp2N1M2bHRK?=
 =?utf-8?B?eEcweURudEtTRjNaOHl5djFsaVZidTBIYmE2d3hiYlFKWm9Cc0tWR3Q1YTM4?=
 =?utf-8?B?R0xnZ2JqYnZLRDVBMExiWWNMcS9EaXNZTlJOMHdYMzhEVHJzZjJ2NXp1WUhr?=
 =?utf-8?B?TmpLUGFESkdoMjExYituRXV2dHBEa3Q5UjAwOUZKaUdzK1M4aVZId0dIK1lu?=
 =?utf-8?B?aE5zejRDWkpRTHlUbHNtZGU0RkgxWEJTdnFXRXNlclpVUmMyQU9VSXFGaDZv?=
 =?utf-8?B?NHY2Mkd5aGwyWk9yRUhaM0FZVm9QaE91VkRsS3BqNUJoZUl6azF4K2t4QXRK?=
 =?utf-8?B?L0NMN29VUmhSUS9TWnlWQ1hZNlg5aUNCd0lZaGMwb04vZm4vam5OZU9KUFl6?=
 =?utf-8?B?YTJ6VjNKNjdVUmNYeDYrRVNiRS9ZVFN5TUsrdUpnWVFPQUxwWXBHZmo1amc2?=
 =?utf-8?B?NFhPSGljam9lZmMzbHk4Y3hKMzJCbUtVM0lzbVJaSUdQTmRWN0w4TEgzQnc3?=
 =?utf-8?B?MGlaUXRMcU5iUmtqNDVoUWZJNTJyWEhaREJ5WEJ4dmJsc0JyUW5mWmlnMWFN?=
 =?utf-8?B?T294TUtLYm1RVk9hSGtySlFRNHRvYmdiUTJGU1JIRE00dEVQUUFPVXRHNXo5?=
 =?utf-8?B?NFlOdmt6eEdNT1Zud3FsY29TMGJIWmFHb2lHOXdvdURJWm9QUmFuVll0NUVG?=
 =?utf-8?B?UzNJeDQvUWk1MHJJZXpPR0JvYmFVcitiaFM0R2x1NGZpdXd3NFQ4VjdCdkps?=
 =?utf-8?B?QWVJWHpuZVJPbEFhRkw0Y1ZwbFpxWTd4ejlOUmU4M0RUOHNTbThPNG5jeDR1?=
 =?utf-8?B?K3J4aklVbGNLQ0JqVEFyWjl0MHRQYzJpZ2liclVDMFprZGExNWxsaTBQNGY3?=
 =?utf-8?B?Uno5MjJGemZJbmlBN1l2OG1TVEtsSmI3NTBrKzlkQXpLUG1NM3lKdEExN1ls?=
 =?utf-8?B?cU1mMFFaeDJ6OFFiUFY4cVgyM1MxSTg1Wlc4OXhmOGw2YXI0a2hYUG5EdktL?=
 =?utf-8?B?RnlDNTZOSnhSeWZaRVJ1RWM1WTZIRzBUMXdvdkpLUlBFdHBQZEFENWVIcXA5?=
 =?utf-8?B?dGRLbWwvL2FzVjVqZlZ4aDYzNkd4YlpnN0VLdndKUWoweWlGTThscDhQREc1?=
 =?utf-8?B?RUhZKzBJUVhOU1ZVSEhRSmhGcHBTdnBWaVFKVkdvcjZMUEg3NzVZenk3cmhk?=
 =?utf-8?B?dEREUFhTUGo1b08zTXhoeTY1VEZ3cnpud1Z3WCtZUm1LYS80UWZjY1hkRjE1?=
 =?utf-8?B?U2ZERnhSRk04aWZ6aGFLcnYxbHY2UFBmRHN4eklJRFcwQ0lPZ003RE9GbzBR?=
 =?utf-8?B?QndmSkZOcGdia1J1TXpsZU1TV0RHeDJQVXdKNWxkVFo4N0dVY3EzZDhsZHhE?=
 =?utf-8?B?eWNKUytnNXViUXIwcEIzNkhjVEpSam1Zc1pWMm1vWEw5N200TzlXZDRROXdP?=
 =?utf-8?B?cUVuQWlrUXp5NUhmbkV4OFl6c2xnbmRuaGJkQ3FYVXNYcFd0S1RMUWxyTStk?=
 =?utf-8?B?VEJFWGJ4d2ozUHNSRjlwTTltR0d4WVk4eFg3OFV0aWJDS0trVll5ZmdNdmNQ?=
 =?utf-8?B?M0NrZVp4WXhFZUNOYTRNc08wTGlBUnVPRnVrMUV6UHRKbWp2YlBnZmZjam85?=
 =?utf-8?B?RTh5aE4rWnZJclIwN3hUY2k3V05RdUZPZDkxMERheWhSRUFIT2dIaFBNU3Q2?=
 =?utf-8?Q?SC1OsQ+sPcbbBrF/CZ/3bMO2m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746f182f-869a-41ee-d813-08dba30db2b7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:45:43.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PX654o1APHdYwArEVqBIrBQ/O4YulY3gj5mH1aEv2n5mDFTBfTJi6hoXSvJZZbTwG9NULQaEVEoWwGdKPTi5LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8713
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 8/21/2023 4:55 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Fri, 18 Aug 2023, Suma Hegde wrote:
>
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> AMD MI300 MCM provides GET_METRICS_TABLE message with which
>> all the system management information from SMU can be retrieved in just
>> one message.
>>
>> The metrics table is available as hexadecimal sysfs binary file in
>> /sys/devices/platform/amd_hsmp/socket%d_metrics_bin
>> Metrics table definitions will be documented as part of PPR which
>> available in public domain. The same is defined in the amd_hsmp.h header
>> file as well.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 109 +++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp.c      | 155 ++++++++++++++++++++++++++-
>>   2 files changed, 259 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index 769b939444ae..832701b41c7d 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -47,6 +47,9 @@ enum hsmp_message_ids {
>>        HSMP_SET_PCI_RATE,              /* 20h Control link rate on PCIe devices */
>>        HSMP_SET_POWER_MODE,            /* 21h Select power efficiency profile policy */
>>        HSMP_SET_PSTATE_MAX_MIN,        /* 22h Set the max and min DF P-State  */
>> +     HSMP_GET_METRIC_TABLE_VER,      /* 23h Get metrics table version  */
>> +     HSMP_GET_METRIC_TABLE,          /* 24h Get metrics table  */
> extra spaces before */
Ok, will remove it.
>> +     HSMP_GET_METRIC_TABLE_DRAM_ADDR,/* 25h Get metrics table dram address */
>>        HSMP_MSG_ID_MAX,
>>   };
>>
>> @@ -64,6 +67,14 @@ enum hsmp_msg_type {
>>        HSMP_GET  = 1,
>>   };
>>
>> +enum hsmp_proto_versions {
>> +     HSMP_PROTO_VER2 = 2,
>> +     HSMP_PROTO_VER3,
>> +     HSMP_PROTO_VER4,
>> +     HSMP_PROTO_VER5,
>> +     HSMP_PROTO_VER6
>> +};
>> +
>>   struct hsmp_msg_desc {
>>        int num_args;
>>        int response_sz;
>> @@ -295,6 +306,104 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>>         * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
>>         */
>>        {1, 0, HSMP_SET},
>> +
>> +     /*
>> +      * HSMP_GET_METRIC_TABLE_VER, num_args = 0, response_sz = 1
>> +      * output: args[0] = metrics table version
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_METRIC_TABLE, num_args = 0, response_sz = 0
>> +      */
>> +     {0, 0, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
>> +      * output: args[0] = lower 32 bits of the address
>> +      * output: args[1] = upper 32 bits of the address
>> +      */
>> +     {0, 2, HSMP_GET},
>> +};
>> +
>> +/* Metrics table for EPYC socket(supported only from proto version 6) */
>> +struct hsmp_metric_table {
>> +     __u32 accumulation_counter;
>> +
>> +     //TEMPERATURE
>> +     __u32 max_socket_temperature;
>> +     __u32 max_vr_temperature;
>> +     __u32 max_hbm_temperature;
>> +     __u64 max_socket_temperature_acc;
>> +     __u64 max_vr_temperature_acc;
>> +     __u64 max_hbm_temperature_acc;
>> +
>> +     //POWER
>> +     __u32 socket_power_limit;
>> +     __u32 max_socket_power_limit;
>> +     __u32 socket_power;
>> +
>> +     //ENERGY
>> +     __u64 timestamp;
>> +     __u64 socket_energy_acc;
>> +     __u64 ccd_energy_acc;
>> +     __u64 xcd_energy_acc;
>> +     __u64 aid_energy_acc;
>> +     __u64 hbm_energy_acc;
>> +
>> +     //FREQUENCY
>> +     __u32 cclk_frequency_limit;
>> +     __u32 gfxclk_frequency_limit;
>> +     __u32 fclk_frequency;
>> +     __u32 uclk_frequency;
>> +     __u32 socclk_frequency[4];
>> +     __u32 vclk_frequency[4];
>> +     __u32 dclk_frequency[4];
>> +     __u32 lclk_frequency[4];
>> +     __u64 gfxclk_frequency_acc[8];
>> +     __u64 cclk_frequency_acc[96];
>> +
>> +     //FREQUENCY RANGE
>> +     __u32 max_cclk_frequency;
>> +     __u32 min_cclk_frequency;
>> +     __u32 max_gfxclk_frequency;
>> +     __u32 min_gfxclk_frequency;
>> +     __u32 fclk_frequency_table[4];
>> +     __u32 uclk_frequency_table[4];
>> +     __u32 socclk_frequency_table[4];
>> +     __u32 vclk_frequency_table[4];
>> +     __u32 dclk_frequency_table[4];
>> +     __u32 lclk_frequency_table[4];
>> +     __u32 max_lclk_dpm_range;
>> +     __u32 min_lclk_dpm_range;
>> +
>> +     //XGMI
>> +     __u32 xgmi_width;
>> +     __u32 xgmi_bitrate;
>> +     __u64 xgmi_read_bandwidth_acc[8];
>> +     __u64 xgmi_write_bandwidth_acc[8];
>> +
>> +     //ACTIVITY
>> +     __u32 socket_c0_residency;
>> +     __u32 socket_gfx_busy;
>> +     __u32 dram_bandwidth_utilization;
>> +     __u64 socket_c0_residency_acc;
>> +     __u64 socket_gfx_busy_acc;
>> +     __u64 dram_bandwidth_acc;
>> +     __u32 max_dram_bandwidth;
>> +     __u64 dram_bandwidth_utilization_acc;
>> +     __u64 pcie_bandwidth_acc[4];
>> +
>> +     //THROTTLERS
>> +     __u32 prochot_residency_acc;
>> +     __u32 ppt_residency_acc;
>> +     __u32 socket_thm_residency_acc;
>> +     __u32 vr_thm_residency_acc;
>> +     __u32 hbm_thm_residency_acc;
>> +     __u32 spare;
>> +
>> +     // New Items at end to maintain driver compatibility
>> +     __u32 gfxclk_frequency[8];
>>   };
>>
>>   /* Reset to default packing */
>> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
>> index 699c22f7cd42..cab59750cde2 100644
>> --- a/drivers/platform/x86/amd/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp.c
>> @@ -20,7 +20,7 @@
>>   #include <linux/semaphore.h>
>>
>>   #define DRIVER_NAME          "amd_hsmp"
>> -#define DRIVER_VERSION               "1.0"
>> +#define DRIVER_VERSION               "2.0"
>>
>>   /* HSMP Status / Error codes */
>>   #define HSMP_STATUS_NOT_READY        0x00
>> @@ -47,7 +47,12 @@
>>   #define HSMP_INDEX_REG               0xc4
>>   #define HSMP_DATA_REG                0xc8
>>
>> +#define HSMP_CDEV_NAME               "hsmp_cdev"
>> +#define HSMP_DEVNODE_NAME    "hsmp"
>> +
>>   struct hsmp_socket {
>> +     struct bin_attribute hsmp_attr;
>> +     void __iomem *metric_tbl_addr;
>>        struct semaphore hsmp_sem;
>>        u16 sock_ind;
>>   };
>> @@ -56,6 +61,7 @@ struct hsmp_plat_device {
>>        struct miscdevice hsmp_device;
>>        struct hsmp_socket *sock;
>>        struct device *dev;
>> +     u32 proto_ver;
>>   };
>>
>>   static u16 num_sockets;
>> @@ -328,9 +334,122 @@ static const struct file_operations hsmp_fops = {
>>        .compat_ioctl   = hsmp_ioctl,
>>   };
>>
>> +static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>> +                                 struct bin_attribute *bin_attr, char *buf,
>> +                                 loff_t off, size_t count)
>> +{
>> +     struct hsmp_socket *sock = bin_attr->private;
>> +     struct hsmp_message msg = { 0 };
>> +     int ret;
>> +
>> +     if (count == 0 || count > sizeof(struct hsmp_metric_table))
> !count
Ok.
>
>> +             return 0;
>> +
>> +     msg.msg_id      = HSMP_GET_METRIC_TABLE;
>> +     msg.sock_ind    = sock->sock_ind;
>> +
>> +     ret = hsmp_send_message(&msg);
>> +     if (ret)
>> +             return ret;
>> +     memcpy(buf, sock->metric_tbl_addr, count);
>> +
>> +     return count;
>> +}
>> +
>> +#define HSMP_ATRR_NAME_SIZE 25
> ATTR (typo)?
Yes, its a typo. will correct it.
>
>> +static int hsmp_create_metric_tbl_sysfs_file(int sock_ind)
>> +{
>> +     struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
>> +     char *name;
>> +
>> +     sysfs_attr_init(&plat_dev.sock[sock_ind].hsmp_attr);
>> +     name = devm_kzalloc(plat_dev.dev, HSMP_ATRR_NAME_SIZE, GFP_KERNEL);
>> +     if (!name)
>> +             return -ENOMEM;
>> +     sprintf(name, "socket%d_metrics_bin", sock_ind);
> snprintf()
Ok. will change it.
>
>> +     hattr->attr.name        = name;
>> +     hattr->attr.mode        = 0444;
>> +     hattr->read             = hsmp_metric_tbl_read;
>> +     hattr->size             = sizeof(struct hsmp_metric_table);
>> +     hattr->private          = &plat_dev.sock[sock_ind];
>> +
>> +     return device_create_bin_file(plat_dev.dev, hattr);
>> +}
>> +
>> +static int hsmp_get_tbl_dram_base(u16 sock_ind)
>> +{
>> +     struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
>> +     struct hsmp_message msg = { 0 };
>> +     phys_addr_t dram_addr;
>> +     int ret;
>> +
>> +     msg.sock_ind    = sock_ind;
>> +     msg.response_sz = hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
>> +     msg.msg_id      = HSMP_GET_METRIC_TABLE_DRAM_ADDR;
>> +
>> +     ret = hsmp_send_message(&msg);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /*
>> +      * calculate the metric table DRAM address from lower and upper 32 bits
>> +      * sent from SMU and ioremap it to virtual address.
>> +      */
>> +     dram_addr = msg.args[0] | ((u64)(msg.args[1]) << 32);
>> +     if (!dram_addr)
>> +             return -ENOMEM;
>> +     sock->metric_tbl_addr = devm_ioremap(plat_dev.dev, dram_addr,
>> +                                          sizeof(struct hsmp_metric_table));
>> +     if (!sock->metric_tbl_addr) {
>> +             dev_err(plat_dev.dev, "Unable to ioremap metric table addr\n");
>> +             return -ENOMEM;
>> +     }
>> +     return 0;
>> +}
>> +
>> +static int hsmp_create_sysfs_file(void)
>> +{
>> +     int ret, i;
>> +
>> +     for (i = 0; i < num_sockets; i++) {
>> +             ret = hsmp_get_tbl_dram_base(i);
>> +             if (ret)
>> +                     goto cleanup;
>> +
>> +             ret = hsmp_create_metric_tbl_sysfs_file(i);
>> +             if (ret) {
>> +                     dev_err(plat_dev.dev, "Unable to create sysfs file for metric table\n");
>> +                     goto cleanup;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +
>> +cleanup:
>> +     while (i > 0)
>> +             device_remove_bin_file(plat_dev.dev, &plat_dev.sock[--i].hsmp_attr);
>> +     return ret;
>> +}
>> +
>> +static int hsmp_cache_proto_ver(void)
>> +{
>> +     struct hsmp_message msg = { 0 };
>> +     int ret;
>> +
>> +     msg.msg_id      = HSMP_GET_PROTO_VER;
>> +     msg.sock_ind    = 0;
>> +     msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
>> +
>> +     ret = hsmp_send_message(&msg);
>> +     if (!ret)
>> +             plat_dev.proto_ver = msg.args[0];
>> +
>> +     return ret;
>> +}
>> +
>>   static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>   {
>> -     int i;
>> +     int ret, i;
>>
>>        plat_dev.sock = devm_kzalloc(&pdev->dev,
>>                                     (num_sockets * sizeof(struct hsmp_socket)),
>> @@ -344,18 +463,44 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>                plat_dev.sock[i].sock_ind = i;
>>        }
>>
>> -     plat_dev.hsmp_device.name       = "hsmp_cdev";
>> +     plat_dev.hsmp_device.name       = HSMP_CDEV_NAME;
>>        plat_dev.hsmp_device.minor      = MISC_DYNAMIC_MINOR;
>>        plat_dev.hsmp_device.fops       = &hsmp_fops;
>>        plat_dev.hsmp_device.parent     = &pdev->dev;
>> -     plat_dev.hsmp_device.nodename   = "hsmp";
>> +     plat_dev.hsmp_device.nodename   = HSMP_DEVNODE_NAME;
>>        plat_dev.hsmp_device.mode       = 0644;
>>
>> -     return misc_register(&plat_dev.hsmp_device);
>> +     ret = misc_register(&plat_dev.hsmp_device);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = hsmp_cache_proto_ver();
>> +     if (ret) {
>> +             dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
>> +             goto cleanup;
>> +     }
>> +
>> +     /* metrics table is supported only from proto ver6 EPYCs */
>> +     if (plat_dev.proto_ver >= HSMP_PROTO_VER6) {
>> +             ret = hsmp_create_sysfs_file();
>> +             if (ret)
>> +                     goto cleanup;
>> +     }
>> +     return 0;
>> +
>> +cleanup:
> Instead naming labels as "cleanup", try to name them according to what you
> cleanup, so e.g. here deregister:
Ok, will rename it.
>> +     misc_deregister(&plat_dev.hsmp_device);
>> +     return ret;
>>   }
>>
>>   static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>   {
>> +     int i;
>> +
>> +     if (plat_dev.proto_ver >= HSMP_PROTO_VER6) {
>> +             for (i = 0; i < num_sockets; i++)
>> +                     device_remove_bin_file(plat_dev.dev, &plat_dev.sock[i].hsmp_attr);
>> +     }
>>        misc_deregister(&plat_dev.hsmp_device);
>>   }
>>
>>
> --
>   i.

Thanks and Regards,

Suma

