Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFCBC19F2A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Jul 2022 17:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236239AbiG2RoH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Jul 2022 13:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiG2RoG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Jul 2022 13:44:06 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162B8814BF
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Jul 2022 10:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OS77iIOKcKjOfJnVfgw6xMkedXWDXq/+2OB3Vkaf8yQ7Q4CuaWy8uLLQn8EwyMYd/tfBZwJR4ZLAqd4hmcgggQyvu+qUe4bEuom1U/qdlSgwfNpoYmJDjpLHbKJ/KWQVfj6c1ZjoKjRtXWdfiIq9TanH0lVEp7oMcD6cEc2XOVy0qsmF7IIRXnCKZvYZWB5ZsnxkSJzcSrBjUX5FL0ogApcnexBBva45f6OksUjf6buuVar+70TOEeMJLAzUzR6DRtjgRO0ByEgo7/phwp0vmdTpuj6fOvblwNyc9zU5t1PNQZrj2QtQqXqqX/4OunYeASZeP9GuD7cSarqd7jziuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryiKHdCrcyKg+0BAy5aIbyfu75K4Cbe0+iu+Zb7z6bM=;
 b=g3I6HNVKbWos/lvVcy1NgaDfAvx3dFRZVcrGkVq2gVTSl8TMUX+FxoTLy279OmuDZWB7yMyYcFy82rNowld9whQn5mv7a9q0GesEYm8FBRJL6+wdXc8W0/1Ja54I3wwv/iD0VZRR0e3pYD303H7hwrkECEyVlbfWwytnAKpaiE/1D3MPKPzhC0x+2zidX4J40tBA5+YSwHwvm2ZG7aB61uPJUAA/MNpio6uMoLsQSQUlXxeDfo1ov0Mv1nUVbc3G/DR962dzXKCiIOCIO7tjQeV/JyQzL3K/M6nNzBmy0ucHFzxK4/8nMUDDnf+5EOjdV+EKfaHEt1VKshL4OBd65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryiKHdCrcyKg+0BAy5aIbyfu75K4Cbe0+iu+Zb7z6bM=;
 b=4hfjkFU3Bl3IRdOH2RDdK7acSDuWv0MGXfgwBri8ORSym0MWhpZ2nLs8Hui8+b5jIR/byNw8Shy4gzKvvG15BHOBZNns2stDYobCaTo2Fkcdm03MbCeYPzTt13m4pHuF8MwlsyALgWfiYV6SggWYy9b2p5Wm0PrdobU8og5NfYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM5PR1201MB0266.namprd12.prod.outlook.com (2603:10b6:4:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Fri, 29 Jul
 2022 17:44:02 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20%9]) with mapi id 15.20.5482.012; Fri, 29 Jul 2022
 17:44:02 +0000
Message-ID: <c243c5ee-ff10-1fd5-9f75-c8f339daacae@amd.com>
Date:   Fri, 29 Jul 2022 23:13:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 RESEND 07/11] platform/x86/amd/pmf: Get performance
 metrics from PMFW
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-8-Shyam-sundar.S-k@amd.com>
 <20af3e5c-450b-a5d2-a3f0-732d0fbaeda5@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20af3e5c-450b-a5d2-a3f0-732d0fbaeda5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::20) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20b2d62e-5a03-4589-a7d4-08da7189ecd9
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0266:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HZc/KTSXbTQzkO8gDFEswgH7cUGLIO74O1/E4Bx1DghIVq09BK5BorX0l8Zv4ev/Dsq1HojH107ATvFpaNK798NctiyFqBu4YLeWuMM4jf73x3QjXem5NS/jYOiMyxVw2uhBakYuPXCjlBxlz46XjHRp1DlLb4xqUuE7JkD3bxmlGX1h3i859oGia3rnm4Yki1tJb4tj2cT3yEU+YbyU4Gs3xixd1yvl6JxMGXofj+WioCKTrMJ38JodN/MmIF6W5Nc5b4sPEI6mhHthaZa711D/kwAV9B08LY/YflFmos+qGTScV/atrPMlM2YirAIW2qyBOsjV8YPtCjb0c6AGA2DK54Tc9yxtBmrK/9M1BD/NST14jMy/3r4FgwoUd73QqAEy0O54i8ElT1cnje4+fptw1dFkL6JIhEM3zOmfvCSOHuSRIk9WoRMAVpFbdPRH4wCqIhGN+CehorGX6oaJH3IoHAWilgA8QfLysBI40c6D3ab63J0wvJVqHKpKCh02NSSmOZSTLsPnd+SdP7K6eTaZx9wBSZNRU/vpaBzbp4XKVNGbIEx7FPjwbbSkbWP7QW067S+P7cFzAVpKD+mVi76zw2wgT1NpQrgWTiLwmctxEJholh+e+poJdBRN6Qy5Gl/cWuiOrlb1cRnLVZe9uYwf6kdK3zO50F//MTqUocBzyCaXyQxOS/A8ZjboMgGLBKG3HWJtWYxDaBfTZ1dV10RCHG09IRxUFBi7rIVRuhAZRpyQ1tUCc6s2I5QVTAPYqlURKhqpgV85/K47IrYIoN6+DwCusaPQ/UH0ZoLPgOUMMdMzeDhvoGaWI+iZJxAfiSZ/IMCsqXQ5Q0K11jkLRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(8936002)(6506007)(38100700002)(41300700001)(86362001)(31696002)(83380400001)(31686004)(186003)(5660300002)(36756003)(66556008)(66946007)(4326008)(53546011)(66476007)(6666004)(478600001)(8676002)(6512007)(6486002)(2616005)(2906002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDNwNDlzQ0VaUkN0ajMwZzJiUzMwVWZtM0FQZVV1a1NJdmpsS1V5NWdVUXJh?=
 =?utf-8?B?OWEvaG04VW1WaVRPc2VSeGw0Q2I2TWlWNkdldTNqZWc1aHFiY2o3NHNlb0di?=
 =?utf-8?B?blQ0RHZyYitsNUYzSWt0VEtMZ0ZnV1VLNW1ESTAxc0FjZWVxNkx1bWlWTSs2?=
 =?utf-8?B?VERQWDBlaU4zOXBnVHprem1LRGVlWVAySExibWY2aENad0tQalFuTjBMdHNK?=
 =?utf-8?B?a0oyVVYyRTdqUG9OSGRZUUlnWlZMQnJUYkdQSndUTEVtVjJ4alY3bVR3eFZt?=
 =?utf-8?B?Z1FxQ2daVDhqaFBzWXp4VjJ6cFZyd0JNTU9Zcy9jTDYxajNpV0VQYjgvWkt6?=
 =?utf-8?B?eVpieDBEemN1M0NJTFU3TDZsVDhQSlNkcHdOeVJrcGw0M3YzeHZydVdpOFNs?=
 =?utf-8?B?WmZ0SkhuTjJMcXNIaG53Q3c3RE5iT1hXZGUzMW4vYmRwdW1oU0FUNFMxVldG?=
 =?utf-8?B?QWVxeE51a0Fxd0ZEV3Uwd0VucXEvVmYvOHQ5Umdqem9BMG9sUy9VVDJqTmM2?=
 =?utf-8?B?MkZHeXAxZ2ErN25WUXJjYSsxN0VIWnAwT1RQVHNDNUJsNW13K012dlZzTHNU?=
 =?utf-8?B?RGwzV1BlM2FTSG04Z085MWJSaGNWK1ZySkl3QVFwUjFZNWV3RzVoV2QyTW9X?=
 =?utf-8?B?ZGg1N0M2Um5UT0tjSnVTNHB5UzlGT2NzbCt5VGlwT09SZGVlNU5QM3RrWjg0?=
 =?utf-8?B?WkMxQmNqRnZlbmFwNFpYSWd2Mmg2cG1IdHNrVzl3ak9GTVZxQm0rdXZwam01?=
 =?utf-8?B?Y0FJRGpGTU5NbTRHc1FMLy9na2lsQm5JUFFiU0I3ZmZyNElMdHdoR0kralZx?=
 =?utf-8?B?UkNBUVZJZTRvaG1UY0dNa1JBT0J3cFVkVWpIRnpDU0plb1Roamh2Y2ViZi9u?=
 =?utf-8?B?UXhJbFdGbDhra2phWUE3ZDRiVldFMjQzMDVLUmkzK1FRY0dvcitacG5JL2VF?=
 =?utf-8?B?eDhLSDcvZzYyNmp1VDZ6QTFTVnlxdmFMRG9tRTNvbVFGY1kzMTFGZmZpSjAy?=
 =?utf-8?B?VXF3S09NTGhGblh6dUZCdm92RWhjR0UwcHQ5a242blpvakRmR0NJT2REbzYv?=
 =?utf-8?B?UkNVVHlneVpGQmpkbUJjQ2tFQXl1aEh6V1Y4KzlyclZ3OUFEZnY0MmZLV2ZQ?=
 =?utf-8?B?ekpsZEtnVm45M0xSRjVmaXNiZHdWQWoxemNFVlp6UHRrc3RuZmFMVDU0QTJo?=
 =?utf-8?B?R0U0RTBGSnNocVMwdUx3c0FCM2owSi9QNm5Gb0FIM3dnV0ZVTFliY3QyWDB4?=
 =?utf-8?B?N0gxQXB0Z0JkOVYzdEZXMGZDTXVrcTA4SWJFRWp1WldWMkJEdVJZQ0k0TVZB?=
 =?utf-8?B?VDVhYVVZcEdFRFBza0ZwR3BodDVtSW9yQXVSRzJvbGRkRmoyRVlKS1dad216?=
 =?utf-8?B?OUY0cXFYaXpWN3FyeUZwQXBhT1pjVC9MTXBaUmptQnF2VXFvS25HclRGWkky?=
 =?utf-8?B?VzNyUG02MWgxQzlvcGNyWmdCQml1czFoQ1kyclc0TmNQVDg4TkxwVjBxZCtD?=
 =?utf-8?B?M29FN3JERUdOZTZNQ2NMdHFMaFRUWjA3V3F2ZE5SQnc3dzExOTR4OGcvcGtN?=
 =?utf-8?B?dnpEdXhPMkZWM0lmYWpzbTkrbkpyR2VITTJRRW1MRGsxZWU2RmxHMDFYQ2t3?=
 =?utf-8?B?RWliMGlnVW1ucHUrN1JSMlQvbUl6TnA1djN6WldmeCtCZWlGZ09RNThiWkZq?=
 =?utf-8?B?TEpkNFhnSDhIUHdZWVkyZXZDcUo2VzZwUS9rZlQ3eFh6TUlqbndkQ01WWWww?=
 =?utf-8?B?ZFIrWG5qbktqR3c5em9mWVlTVFkwYWdGTjFKMzA5MkV6dzQvRVV0TENnb2pW?=
 =?utf-8?B?b1pqS3JEUEVtMDhqWFQxU3VFM0dSNXB5MjE4UlNLeDBQTDJxQ2swc0M2ZWow?=
 =?utf-8?B?bHVxM3VJWCtPOW9UVkJGT2RRQ0gzWU91eU40RHVjcGJUZ3RzZHh2c0I2MDM4?=
 =?utf-8?B?WG1JRjZ6VGVmRUhjQldyV2hMaWw5Q041eXZRcUcwM3lqK2VRUEVVeVhlMXh4?=
 =?utf-8?B?SGJESi9lbEdjbnluQ1BQWmhwb2NsVkZXR2dOelZKSmxlNUd3cFdSSHA2bnF4?=
 =?utf-8?B?L0Z4SUI3cmJ3eWFnbEpUWWJ2aFg1RjdUVEdxTnoxRG5obmc4K3VkZm1BRGQy?=
 =?utf-8?B?Nm13ek8wbTFSMFN3U0MwVjhrSmc3aVRRaUZWRUovQ0tlcGVJd2VZVlhrZ3dp?=
 =?utf-8?Q?HWiQdTzL4Ht/UVoeiWEofvYZl7kQ0+oEK+Yuul62EuQ2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b2d62e-5a03-4589-a7d4-08da7189ecd9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 17:44:02.7928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Y+BWvR2PQNjOYFuL0tKYri+4BhAaXt8ikxOOYQsHvrGpIR12E//7mw1XowItVS1TjA6Kd0VQLKM5NbC5zSTHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0266
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 7/29/2022 2:32 AM, Limonciello, Mario wrote:
> On 7/28/2022 13:20, Shyam Sundar S K wrote:
>> PMF driver polls for metrics information from PMFW to understand the
>> system
>> behavior, power consumption etc.
>>
>> This metrics table information will be used the PMF features to tweak the
>> thermal heuristics. The poll duration can also be changed by the user
>> by changing the poll duration time.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/core.c | 56 +++++++++++++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/pmf.h  | 39 ++++++++++++++++++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>> b/drivers/platform/x86/amd/pmf/core.c
>> index 6c1c5a89fe71..ede4eefc33a4 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -47,6 +47,11 @@
>>   #define DELAY_MIN_US    2000
>>   #define DELAY_MAX_US    3000
>>   +/* override Metrics Table sample size time (in ms) */
>> +static int metrics_table_loop_ms = 1000;
>> +module_param(metrics_table_loop_ms, int, 0644);
>> +MODULE_PARM_DESC(metrics_table_loop_ms, " Metrics Table sample size
>> time (default = 1000ms) ");
>> +
>>   static int current_power_limits_show(struct seq_file *seq, void
>> *unused)
>>   {
>>       struct amd_pmf_dev *dev = seq->private;
>> @@ -88,6 +93,29 @@ int amd_pmf_get_power_source(void)
>>           return POWER_SOURCE_DC;
>>   }
>>   +static void amd_pmf_get_metrics(struct work_struct *work)
>> +{
>> +    struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev,
>> work_buffer.work);
>> +    enum platform_profile_option current_profile;
>> +    ktime_t time_elapsed_ms;
>> +    int socket_power;
>> +
>> +    /* Get the current profile information */
>> +    current_profile = READ_ONCE(dev->current_profile);
> 
> AFAICT this parameter isn't actually used/needed anymore.

ah! good catch.

Will look forward for other comments and will make this change in the
next version.

Thanks,
Shyam

> 
>> +
>> +    /* Transfer table contents */
>> +    memset(&dev->m_table, 0, sizeof(dev->m_table));
>> +    amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> +    memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
>> +
>> +    time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
>> +    /* Calculate the avg SoC power consumption */
>> +    socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>> +
>> +    dev->start_time = ktime_to_ms(ktime_get());
>> +    schedule_delayed_work(&dev->work_buffer,
>> msecs_to_jiffies(metrics_table_loop_ms));
>> +}
>> +
>>   static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int
>> reg_offset)
>>   {
>>       return ioread32(dev->regbase + reg_offset);
>> @@ -181,6 +209,34 @@ static const struct pci_device_id pmf_pci_ids[] = {
>>       { }
>>   };
>>   +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>> +{
>> +    u64 phys_addr;
>> +    u32 hi, low;
>> +
>> +    INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
>> +
>> +    /* Get Metrics Table Address */
>> +    dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>> +    if (!dev->buf)
>> +        return -ENOMEM;
>> +
>> +    phys_addr = virt_to_phys(dev->buf);
>> +    hi = phys_addr >> 32;
>> +    low = phys_addr & GENMASK(31, 0);
>> +
>> +    amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>> +    amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
>> +
>> +    /*
>> +     * Start collecting the metrics data after a small delay
>> +     * or else, we might end up getting stale values from PMFW.
>> +     */
>> +    schedule_delayed_work(&dev->work_buffer,
>> msecs_to_jiffies(metrics_table_loop_ms * 3));
>> +
>> +    return 0;
>> +}
>> +
>>   static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>   {
>>       /* Enable Static Slider */
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>> b/drivers/platform/x86/amd/pmf/pmf.h
>> index b6501a68aa4e..49d3232ee2e0 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -84,6 +84,41 @@ struct apmf_fan_idx {
>>       u32 fan_ctl_idx;
>>   } __packed;
>>   +struct smu_pmf_metrics {
>> +    u16 gfxclk_freq; /* in MHz */
>> +    u16 socclk_freq; /* in MHz */
>> +    u16 vclk_freq; /* in MHz */
>> +    u16 dclk_freq; /* in MHz */
>> +    u16 memclk_freq; /* in MHz */
>> +    u16 spare;
>> +    u16 gfx_activity; /* in Centi */
>> +    u16 uvd_activity; /* in Centi */
>> +    u16 voltage[2]; /* in mV */
>> +    u16 currents[2]; /* in mA */
>> +    u16 power[2];/* in mW */
>> +    u16 core_freq[8]; /* in MHz */
>> +    u16 core_power[8]; /* in mW */
>> +    u16 core_temp[8]; /* in centi-Celsius */
>> +    u16 l3_freq; /* in MHz */
>> +    u16 l3_temp; /* in centi-Celsius */
>> +    u16 gfx_temp; /* in centi-Celsius */
>> +    u16 soc_temp; /* in centi-Celsius */
>> +    u16 throttler_status;
>> +    u16 current_socketpower; /* in mW */
>> +    u16 stapm_orig_limit; /* in W */
>> +    u16 stapm_cur_limit; /* in W */
>> +    u32 apu_power; /* in mW */
>> +    u32 dgpu_power; /* in mW */
>> +    u16 vdd_tdc_val; /* in mA */
>> +    u16 soc_tdc_val; /* in mA */
>> +    u16 vdd_edc_val; /* in mA */
>> +    u16 soc_edcv_al; /* in mA */
>> +    u16 infra_cpu_maxfreq; /* in MHz */
>> +    u16 infra_gfx_maxfreq; /* in MHz */
>> +    u16 skin_temp; /* in centi-Celsius */
>> +    u16 device_state;
>> +};
>> +
>>   enum amd_stt_skin_temp {
>>       STT_TEMP_APU,
>>       STT_TEMP_HS2,
>> @@ -121,6 +156,9 @@ struct amd_pmf_dev {
>>       struct delayed_work heart_beat;
>>       struct mutex lock; /* protects the PMF interface */
>>       struct dentry *dbgfs_dir;
>> +    struct smu_pmf_metrics m_table;
>> +    struct delayed_work work_buffer;
>> +    ktime_t start_time;
>>   };
>>     struct apmf_sps_prop_granular {
>> @@ -154,6 +192,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>>   int is_apmf_func_supported(unsigned long index);
>>   int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get,
>> u32 arg, u32 *data);
>> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>>   int amd_pmf_get_power_source(void);
>>     /* SPS Layer */
> 
