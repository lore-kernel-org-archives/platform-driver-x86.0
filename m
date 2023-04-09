Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AE0C77B6E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 17:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjDIRC2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 13:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjDIRC1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 13:02:27 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6722D5D
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 10:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiO3y6IrjyUH2z+DpGKoYvHznRbRr1kQtPlxtdksnC1QYO3NQeexPqvmfy0f/2vwNcgw8fHofVvnICU62fkT/X1qlfbayBUwkoZLFS7K46a3TJ6BAOD9yQMRlmla9wq7FEINNZ4ord56SoQfOz9Aas1NfWBXwM40L5JwT4Y1RXMqWhrRnnIPjskexxK9gUoiuEyJpgOlsYVAUpCG2Q0HEy2aAv9HJSDzsbffvKqBfWwjymhQW8TnmaNqWTpgGviWMt1cMqs//YxanQHdl+uee154b5rA6FpdlEin+sEri2VRRV5u3Nl/wnDzvXORnGFwCAWrljvrKezwyYhbJzSqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUbBU0N9DsHLE0gY4wisSlL1LwIH3l4lQ2NbolLZMWg=;
 b=ckXB5r4r95+WfMyfS3sAfAxg/+xRcWdfBbs2kdayN20ICvb76T1h9mh9Lz+PYf1i5M1lwru1b3ZYHneltZK9ThCdb/L7dA++d/uFiP9yQJasEYpLl0PQ+acu6Si3AKhEm8L6Cr7qrDk1dLFqY0c4+5t8QV5akNrrrM+t5PCLghiqdrFz0Xhx6JoVBKoK60m1ZKRZhGVKIPfAg4pXurm6FDJFboPQpBKAgvdV4c+hUVsJ1+9XrTIFbR6R74v7F115FBlhsFfVY6PtTlM7zVJYVvd0upZh5u/cq5zuCRzjxQts/qAUYUC70E6Zy2I6k9sBxrLRM8C5L0Wk8F64CIG69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUbBU0N9DsHLE0gY4wisSlL1LwIH3l4lQ2NbolLZMWg=;
 b=y0JuDtCp1Zb4TCwJadzcgVx/ar5Mnnr/du7wDPCzc4Pa1fKK9n9iUKlug6qT9rkUJYPsOuFLYPs/5U3ewD767tkX5TiMvoAeZQhZ55zKCE7TaLsMy3q2qE+++mSpmtKzqaxp/VOXF+kTEsFnmfX+0NYZXpBmhDSotCTcN+TLBnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Sun, 9 Apr
 2023 17:02:21 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::70d7:b03e:aecf:3b6d]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::70d7:b03e:aecf:3b6d%6]) with mapi id 15.20.6277.038; Sun, 9 Apr 2023
 17:02:21 +0000
Message-ID: <9d3c976b-839f-2207-d85c-9e19608386b3@amd.com>
Date:   Sun, 9 Apr 2023 22:32:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/3] platform/x86/amd/pmf: Add PMF debug facilities
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
 <20230406164807.50969-3-Shyam-sundar.S-k@amd.com>
 <608f08ef-edfc-0132-02ba-ce96f34728c1@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <608f08ef-edfc-0132-02ba-ce96f34728c1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::20) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f98f8dc-f79b-4361-fc1c-08db391c2ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iz4PAFC3aCFoEqYi18whWUVPIz13wZaBA7sWVB6yAgXum3QtKZ4kmpEoijxntjJpmIWbEXKCFQjo7E+Gtna20ve9U8qk1lSxHBriL0mEOW/tlhPOnbDrUbL7ddsjSszu5MmJ5TnUS2yxeltizGskrlFglwyZB9OxAg4BW4oeUtD/Eg9PZgcTwlF/aLcuWZUiLm4CrnaIjGn2uOaKKpAyJ6Zd+B+FsLnq+MJEI2kSWckuFaJL3BJMy2ryvc/drR9/L4RnaAE+pQwzG6+OfMY7Pz6XoJM3SQ10tzlqMexweQwNW35M9bjbQOdZP2fCoREnbyzVti7fss0S7qO/66eD2VtuSS8/RAxH/Um4CioS5jXYBRWO9WY+NUvcSKzI/nWgalktxrehJPyot76AGwSbLqOJkP0Q4ycXKi1KdlZCl5rdmtNOopH5Xq4k6va+c4XL2sF+72LwxpCnsklNbbP+ZqsoFBKyj5tiYLP6rCFd8p2vYS7eOMV8i0DFaxagcfeH0S2izWveWBqFN5p+JoU6gWvTeB0lDV+OZdhSr0z5f1qwIkhq7Zr+65jybCMTzihGuCnVSsGs+FILJNeeBC8SUKC3lJVGB/Jt+2V9TV12IKXPQNwzUNd8hx5Surm4qqZI7lGIxAw0svZlejGAtV9k7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(478600001)(316002)(53546011)(6512007)(26005)(6506007)(186003)(6666004)(6486002)(2906002)(4326008)(66946007)(5660300002)(8676002)(41300700001)(8936002)(66476007)(66556008)(38100700002)(86362001)(31696002)(36756003)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXNZZjdmNm9KalNraHBuZWg1N0JaTTNNNkVjN3huazZsWkVqblVmR0JRN1Bn?=
 =?utf-8?B?NDFNeUZ4UVB0eUZDU2p1Q2tmRkQwYUxWNTZ2N2xySjZQRlBaTTdlWGZpOUNV?=
 =?utf-8?B?MjNUcHlTRWhkamtqak15cmkrZ1dJSU5CU1kvYmt2NTRHVXpGUG5RcDN2cUx1?=
 =?utf-8?B?SW1acVEwL1FIWWhVbzZ5OGl6Y1BDUnlSeFZIaDdFQWZUYkQ0TmsyalRaUmlS?=
 =?utf-8?B?b1N2cjFrRUsxTnFpbDYxZW9XSytMemZsNERjcU40M25ZeTJsTjFaNmo1elVO?=
 =?utf-8?B?ZmhPYzcyVWk3N2VoaDJMNHo2V2dUbjR2UE1iUWFCZk5RVEcxVWU0ZkFiNm1p?=
 =?utf-8?B?ZjNwQktXd1ZCODBaZkNwUk5PcnFBQU5hV3RQSTMvKzVkOE82VjVpa2UvQ25J?=
 =?utf-8?B?TzBkejNGcW92U3pib0d4WkYzSmN0RjJTVkJzRFVtWkJGZHZObHFEcGVndTJy?=
 =?utf-8?B?Q05LME5LaWE1Z0dCcHF5OGJkUnRKRHVYZk5OZ3M2TkZRZitNT1F3OVduZVhR?=
 =?utf-8?B?dUdYODJwL3I2TXJoZm16R29EdVgrbGRLMlhCeWpZS2Jsc1FzY0pubUxqd1Vs?=
 =?utf-8?B?eTNqVFlYL0dBWkkvWXBkTndCZ1ZFNVBaWERPQTVPWkxqQW4xSVJ2ek9TZmwr?=
 =?utf-8?B?UzZMRDlsMGI3T1E0NUhoS0hZS1NqaVA1cVVGTFFOODRCVzdQUlltZE9MQUh1?=
 =?utf-8?B?bUM4WHVITTlpeDRvaTVnemtMN2FUL1U4aFB4MXlua2trc0hnQjlrNzhvLzV6?=
 =?utf-8?B?OFU3SngzbmcxV1ZjQlZUa3FzV1RHNU1QUjRQY3NKSWxuM01Calp0Z1VxU1d6?=
 =?utf-8?B?ZnQ4RWw0QS92K1hBT0ZWbEcwTHhIS1ZwTGpYdEU3UUdkUE9RM05JYmdGNkVH?=
 =?utf-8?B?TXFMYmtZYVJDSExmd0JGSVhrRkZpTEZ4OU9WUHFWbEl6SDJldS9wSnNrQWhC?=
 =?utf-8?B?RWxRUUNYU2MxVWxZanJ6ek5nczBsZXFYYVJxYk9IUEZuaVBWUHBnS0FZNFhM?=
 =?utf-8?B?VDh2Tzc2ZjlXOUtzbWRGSHRVNTQrWUVvMDlpNWpQWE9CWlJIQzNtQlMxWUFU?=
 =?utf-8?B?TE1BVWxyMzdaN1VtVm9zc3l3VVFTNTBYYXFGTmdLZDVmSkY2NlRYMnNmWTR0?=
 =?utf-8?B?NnVFd3hWNTJ3dlpVNWxzK25QK0hvRit3ZDBaNS9qTmh1MHh3blIyN05USDRO?=
 =?utf-8?B?ZXFCRVFtVEExMTN5WkRVL3VxdWVVZk5sZkpab2lod0swWGkwSzlmb3JNT2k3?=
 =?utf-8?B?R1B2SzhoMkQyQ0VZRGFFSUNJbDg5bktJbTdmTVlHcXl4MENkSGdiN0dJYnpZ?=
 =?utf-8?B?RXM4bC96UWNyKzNFdThEZXpOTWhpUU1kd0ZxL3RtSll0bEdEVXg1R3l2cjd3?=
 =?utf-8?B?SVNyTU12a1VvbnVobjhkdVk4Z0FYRyt2blVjQ3J5SklxSlZnaWlsZndMSTIw?=
 =?utf-8?B?ZEM5WDJoNWhSeXV2d0ZkL3BZSVp3YXVPc0YyT0ppUFp0TmFpTDNuNWo3Yis3?=
 =?utf-8?B?cFpqL1laNVhRc2w5M3hMTmkrV0E5RHJ1MFhNZUNKN0s5VmZmQTVkNUFqQXR4?=
 =?utf-8?B?dHVLa3NWZEczS1E3dmdMMTJvNXpINTdxSDYzaXZxSGF2NHhlc2tPeEw2UnJz?=
 =?utf-8?B?SFNXYXN6d256Nit3ZUQ0VnpsWjJwcWhuMG5uZ0c3am1ZbitEMWEwQUFORHdL?=
 =?utf-8?B?RDFtWWVNWVIzc2RDRFRjUm5NRkxxLzB6UElCMUZNS0xZblZlbFRJd2lRRmZR?=
 =?utf-8?B?aXNsNlFrZGgxYUl2TE5udXZ2ZUlOODVqOTNWZXNXVlQ5OGhPZDBDM3hMMU81?=
 =?utf-8?B?cW0vd0JITEZNRW9wbk9CK1l4M24vZEw5MmZmSTNUdUJXSmprUXROc21lUDJl?=
 =?utf-8?B?RDFrQ0lYVnF1QXZXdUxOWElZbXFVa3V0U1lsaUEremhnUEw2YlRkVWFBZzRZ?=
 =?utf-8?B?bjVYNHh5eFp4N2tlOTIrV05MaEtEeTBKUHlxbFBQc3VBaSt5QStHRE0zMFpY?=
 =?utf-8?B?NHZXcGUyQms5V3ZBSHJzaFJtbzY4NTlHYzYzcHQvc2NLT2ExQTBvL2pEMEp4?=
 =?utf-8?B?bS9GVlhsZUZVd1VRUyt1RWdpamJ3THZiQzZndnVTcGpRbmg4ZDVEQ0NQSkdp?=
 =?utf-8?Q?CkBbs4J31fCrJKW+8GihOWTwY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f98f8dc-f79b-4361-fc1c-08db391c2ec6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 17:02:21.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sC+ihb2/7/m1vP9ekEkj0XhWbd1z3K5e4oNTza4PQ4z+OAyO7Y0MKStfCQdMwVV6dOEPfYJBl5hnTTN5u8v5Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario

On 4/6/2023 10:21 PM, Limonciello, Mario wrote:
> On 4/6/2023 11:48, Shyam Sundar S K wrote:
>> At times, when the mode transitions fail to happen, the current
>> driver does not give enough debug information on why the transition
>> failed or the default preset values did not load. Having an on-demand
>> logs guarded by CONFIG would be helpful in such cases.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/Kconfig     | 10 ++++++++++
>>   drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
>>   3 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>> b/drivers/platform/x86/amd/pmf/Kconfig
>> index f4fd764e55a6..7129de0fb9fb 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -26,3 +26,13 @@ config AMD_PMF_ACPI_DEBUG
>>        in the PMF config store.
>>          Say Y here to enable more debug logs and Say N here if you
>> are not sure.
>> +
>> +config AMD_PMF_DEBUG_FACILITIES
>> +    bool "PMF debug facilities"
>> +    depends on AMD_PMF
>> +    help
>> +     Enabling this option would give more debug information on the
>> PMF interna
>> +     counters such as time constants, power thresholds, target modes and
>> +     power mode transitions of auto mode and CnQF features.
> 
> With the availability of dynamic debugging is there a lot of benefit to
> guarding all the new dev_dbg statements behind a config option?
> 
> Is it because of performance impact?

Yes right.

But not all these would be useful all the times when we turn on dyndbg.
I borrowed some of these stuff actually from thinkpad_acpi driver.

Thanks,
Shyam

> 
>> +
>> +     Say Y here to enable logs and Say N here if you are not sure.
>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c
>> b/drivers/platform/x86/amd/pmf/auto-mode.c
>> index 777490fcf8b9..560379b5cda7 100644
>> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>> @@ -177,11 +177,33 @@ void amd_pmf_trans_automode(struct amd_pmf_dev
>> *dev, int socket_power, ktime_t t
>>               config_store.transition[i].applied = false;
>>               update = true;
>>           }
>> +
>> +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
>> +        dev_dbg(dev->dev, "[AUTO MODE] time_ms:%lld avg_power:%d
>> mode:%s timer:%u tc:%d\n",
>> +            time_elapsed_ms, avg_power,
>> +            state_as_str(config_store.current_mode),
>> +            config_store.transition[i].timer,
>> +            config_store.transition[i].time_constant);
>> +
>> +        dev_dbg(dev->dev, "[AUTO MODE] shiftup:%d pt:%d pf:%d pd:%u\n",
>> +            config_store.transition[i].shifting_up,
>> +            config_store.transition[i].power_threshold,
>> +            config_store.mode_set[i].power_floor,
>> +            config_store.transition[i].power_delta);
>> +#endif
>>       }
>>         dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n",
>> avg_power,
>>           state_as_str(config_store.current_mode));
>>   +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
>> +    dev_dbg(dev->dev, "[AUTO MODE] priority1: %u, priority2: %u,
>> priority3: %u, priority4: %u",
>> +        config_store.transition[0].applied,
>> +        config_store.transition[1].applied,
>> +        config_store.transition[2].applied,
>> +        config_store. transition[3].applied);
>> +#endif
>> +
>>       if (update) {
>>           for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
>>               /* Apply the mode with highest priority indentified */
>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c
>> b/drivers/platform/x86/amd/pmf/cnqf.c
>> index 4b9691cd592a..1f25016b3865 100644
>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>> @@ -174,6 +174,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev,
>> int socket_power, ktime_t time_l
>>           config_store.trans_param[src][i].count++;
>>             tp = &config_store.trans_param[src][i];
>> +
>> +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
>> +        dev_dbg(dev->dev, "avg_power:%d total_power:%d count:%d
>> timer:%d\n", avg_power,
>> +            config_store.trans_param[src][i].total_power,
>> +            config_store.trans_param[src][i].count,
>> +            config_store.trans_param[src][i].timer);
>> +#endif
>>           if (tp->timer >= tp->time_constant && tp->count) {
>>               avg_power = tp->total_power / tp->count;
>>   @@ -194,6 +201,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev,
>> int socket_power, ktime_t time_l
>>       dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW
>> mode:%s\n",
>>           avg_power, socket_power,
>> state_as_str(config_store.current_mode));
>>   +#ifdef AMD_PMF_DEBUG_FACILITIES
>> +    dev_dbg(dev->dev, "[CNQF] priority 1: %u, priority 2: %u,
>> priority 3: %u",
>> +        config_store.trans_param[src][0].priority,
>> +        config_store.trans_param[src][1].priority,
>> +        config_store.trans_param[src][2].priority);
>> +
>> +    dev_dbg(dev->dev, "[CNQF] priority 4: %u, priority 5: %u,
>> priority 6: %u",
>> +        config_store.trans_param[src][3].priority,
>> +        config_store.trans_param[src][4].priority,
>> +        config_store.trans_param[src][5].priority);
>> +#endif
>> +
>>       for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
>>           /* apply the highest priority */
>>           if (config_store.trans_param[src][j].priority) {
> 
