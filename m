Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D7DC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 21:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiG1VCi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 17:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiG1VCg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 17:02:36 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAA43A9
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 14:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmIOVRYq8NVi0e1Zac5jJCwOYAGKwtvn/oI8h3ewkbIFjzNwuwZnu+9tZPetFuQTPSYplmwIVPddjou3Y1gYI0WHIkMZAc61AcsEtYzHfd2BI5Vtue4BF5zV083VQJe7H0W4CP03VJUOROQBlyjZ5+hTn2PgMqUuQiFhb1tDVZpfnGLF7a16X/OFmRqpyJXtzYMaOUO0Vgr/6VmUcdvIGemOMoHk4AKOhDkR5jzVcjRNJYP3fX5rGu2uKR/P1cZ8F8gv3PPzWJ+cqVRCXMemCsKaZSCMraHGE/3P5qyJ617CEN/+pzryootF76nZJnq4eHoO1V8CDDjwNIvOpRC8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M00mBr60GvhkjmYBnHABKLaXlWsRSHGwqDi7oPGFung=;
 b=VSkilNXzR41TIOBXdoN1I3Av8ufMqu3aX7nT4sEpwqcPnUGBp80AZ+PMM/GJbdU6qdoSCP9QhfNH5+/9h5lsK3/9/Bj/MBI2AfyJJb7AqT2oks3h7XvvbblyLb+Q2Q3/sEU2mcYi+GScg9SKUJpxGgJd9YgPAlLpBwTiNNLjnI9D2zktJ5T9+AJpBU9dtNR+TYcFBP57j4jl6IePlCkISTRjEiqdmZ/sAXjFaNL1nZA6hw/TE2SYj6eJDSthR2eV1dHRbdpxMUdzpKofCWtfD2a4BcHNMyAUof0drpaA9rItNhV+MhcgQ4HVBJksDDIko70EJDIMv6WifJRAsLH3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M00mBr60GvhkjmYBnHABKLaXlWsRSHGwqDi7oPGFung=;
 b=jBlpXYDXaX+yoxX0oFYcIGtHfrnbHX6TmMfB8nZPX+jEqBT6eEFtjJn+XtC2URdBChY1T4+K5/x2KZX1eG5iP6QL8eJ5Ht5ZZWLRxkS2jGFp61pxl7i4inc/92WuoZqxI4ozy43/5FEYl53KZe872twjJ0cXmsCS0dOWFBg49Ck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB3911.namprd12.prod.outlook.com (2603:10b6:610:2f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 21:02:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5438.023; Thu, 28 Jul 2022
 21:02:30 +0000
Message-ID: <20af3e5c-450b-a5d2-a3f0-732d0fbaeda5@amd.com>
Date:   Thu, 28 Jul 2022 16:02:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 RESEND 07/11] platform/x86/amd/pmf: Get performance
 metrics from PMFW
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-8-Shyam-sundar.S-k@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220728182028.2082096-8-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0168.namprd04.prod.outlook.com
 (2603:10b6:806:125::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 004a38ed-5f53-4d94-dead-08da70dc7c2e
X-MS-TrafficTypeDiagnostic: CH2PR12MB3911:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zetgQtGA1OjfSpthABuKnjE6V6E1YmuD5IIwyRp8uGJwowKMPC0TjK4L9eAGKRjrQWFA4lcaKJS6lqIJ8dYFuDf9BcqLnjebDouY7rjRDwudGjyRoexvzlZE3uDjNc3igeQFPh5GqGT63PDUTJH2vBhYhg6fUpKBEaHZaspse6crItZIGBSdxsETA6Nd7CG2PugUUw80DgMrBcc9//nevtAYqxIcPOLPVuFK6XU19nlIl4ZS0300Pbvh+B8Q8K7HJBMvywjeu3HxEX8okzS1JBZyYbOWmp9Mu0JSD6jXvpmYF2uh7DCAMaSF6dqFZfP7CuHQPqSxzshxU/z0Ls+x+Rb28K13+lM94RXmVeMfBRH6BIBTtGzx9NatJK1cauLbi0WYNYwZk+UTmShzBwmX+1aEFvVkclI7pVmUTMNzLuhvFlI127dpaysKtfKFOjaMGMmO8yw4I0U0SBt9XXQHtqBFqfFm4rm+N45o73fuE1z+Z08IL7bAqLrCCrbYruUnEpEGmWGAseOy+bkRZ/dPlzipcwjJGNyHL6zDjCzMjTCS759xs8IJAJtdOtk75JTX7YZEdFFcLBOrXgOZXztAb/XzU5H636ytQC0FphXJp2lLVRFa0xiF0cET+veDNpK5x5MjrX5Ek6heYg9ItjoU06u0MqMwtPLMnqHNlc50f7XUtemLgP8JZgcLpwmou6Uz55jQf4QKQiCsvRh+ubb2f55+RAabKxMQ7ok2++lZz1CRRFyEmgjf5Ng/6q8DVWEJLnP5kmYt8Y3Lvwmd1kIXC5XjQep/jU9y4GYXwFG/CwVqUKoqjtjBLxyxULd4WcVoEwDaQ5g5ROBs/IB7a8zE0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(38100700002)(4326008)(66946007)(31696002)(8676002)(8936002)(316002)(6486002)(6512007)(66476007)(6506007)(26005)(86362001)(41300700001)(53546011)(478600001)(31686004)(36756003)(66556008)(186003)(2616005)(83380400001)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG9PdldJb0RaS1BveEJjVnRUWlBoeWtDQUxsK2FhOHkzUTdoUS9MMzdPcjR3?=
 =?utf-8?B?RlVtYUhTQ2xkZVF6aXdpcFNYTTg0Z2tYd0hQNnhNbm1ERGdsM1B3TDFiT3Uv?=
 =?utf-8?B?MGFmT0t1Z3BuLzlnSmNjRHJLZ0lLdUgwOW5uVDVrRVlsWlNUQWlvSWhLNzQw?=
 =?utf-8?B?VEJCKzYwdmdOSFVNNk43WjVpU0Z6enowMlhaZUJZaGtPSEZMdFpTc29aOGoz?=
 =?utf-8?B?RVJaNndoRzFZZUlMZTFyWFROVlJJam0xNi9lWjF6R25ONnJya2NNMmV6NWFs?=
 =?utf-8?B?YWhxcGg3QndPd3I3ZFJ2enYzSTh3by8rcXpWT0Y4cVU3SDk2T3NaMWRCaUdR?=
 =?utf-8?B?bWViWmJTWUZZWHpUOTk5eE45NEJEMFN3bkxUeC94b0w0Z1BRYS9RVTVOaTRp?=
 =?utf-8?B?cXpDZTVodnJ6UmNYaFJZK0duMHlOQWU0Z0ZFVndLczMwZGozZm1iS3lMQnV6?=
 =?utf-8?B?QVFweEUxc0p3VGdRV09kb2M5SUpVU05uSVA2dTJlMExMMDFrNU1xZkxYa0dE?=
 =?utf-8?B?U0JBYTRaaGNVN1BlbDdudEJMUTF6cVA2VUpOY3hjUkFsTGJMKzBNb05hanJq?=
 =?utf-8?B?ZW1pSWlSUTJyWjYzR1ZmdDlwYlhiWjN2TWREZEJoTncvaUtBQmRNSHZFTERo?=
 =?utf-8?B?QjJ0WVBmNmNDNGRxY2NKMlVWSFg2TFJvbHhCdUhod0tTVFRZdUlXZ1lZZ3N2?=
 =?utf-8?B?RVc3dldsd2lDaUFHL053dmhVdWZuU2swZ3FiYlZlbWt0ZTMrZjM5MGxIaXAv?=
 =?utf-8?B?VFF6OHErdmFhL040VjMwSTRjQi92dWFVMDBOMkR0UGZRRmtHcGRha0ZTTXk2?=
 =?utf-8?B?Y0ZVbmJZNmRSL01yVk1uL245T1EzUE03RmZDSTNNTlo3UGZSek5QRjdaYUty?=
 =?utf-8?B?RXIrYWhDYjVzRTBOU21UbjRNcnoxU1M5S1IybjRzbXdsVlNmVmtOcnNYSXpw?=
 =?utf-8?B?WTROcXRLVG9vQUZPNGxuL0N4cXZmRjhVMVpLK2ZnaHZBS3JNbjZVWEQ3bjhY?=
 =?utf-8?B?YTNyMHhsMng4Z2Q4TU13b0NaeHNuRHRTWjNGYW4vMUFmdUtNUjlXMkhFZ0Nh?=
 =?utf-8?B?c1VlTUFLaGRpaUFoZVhTMTBmS3U4MTlwQ1VTby9PUXZkRjZjVXNnQ2Y1Q0ow?=
 =?utf-8?B?aWNZbldUc0puVlRXT0pYYkVuOHpIZnFPSmZBb2trQVhjQUFCSDJSL3FJVXVU?=
 =?utf-8?B?L2NWYjBEOHhvRVJnYXlpaVB2U2lKTEQ5SUFvcWZBZVJRMy9IbVEyRVBVSU5O?=
 =?utf-8?B?cUtRcEd5NEs0VkpVbnlYWExYRlBvYUt5U2NaSG9xblIwWTg5cHNOU3BUNkQ5?=
 =?utf-8?B?SWRzRHVpTWRCb2RiT1lmQzlIaUlTRWpEWC90THRCemZ1YlArL25jdGxET3NK?=
 =?utf-8?B?NEhJbDRPdzN0YXZzNnRjaEJ1WFV0cFpVS0lvRVRTSytqOGFjclMyY1ppeTQw?=
 =?utf-8?B?VG1KRUpEQzRlQ05jQ0lWdFh3ZkxNTGFvbzVOM2J3YnZycHlpV2dwTGpSOTl1?=
 =?utf-8?B?ckZycUZDWHM0Q0J4dG5UZEE5Mll3Q2w4SlJhUnV3MEg1Tk9WL3ZEVlI1SEl4?=
 =?utf-8?B?YjlYL0JYUGJrYXNGZXBEck1tVmxhZ01xVG9kS1FxM245TTVuNXdCcjl6QzZp?=
 =?utf-8?B?ZldFNmRYdVdoZ2p0YmEvYVVBUXZwUFVybUlGcDZEOWVPTHJENG9meWFONVVU?=
 =?utf-8?B?a2JXU2tOQUlBVnAyNXhoRFhJV1prSnBjVHdMQmd5NWw5SUtZb0FFcWo5dkFD?=
 =?utf-8?B?M1Y5NUxycmI5aWxDbWhFRTVvenJ6b1dwSEJwc1UvOERoRklFcnRLVFZhajZ1?=
 =?utf-8?B?RkpFM094QVJBU1pVLy9Cc2xLVFNTRmNMZEsxeU1pTVQ0MlhqSXduTWZubGtV?=
 =?utf-8?B?SzVyazRIeDh1VmNHTkFqVjR0WmNWMUlHSDJsMmFJK0dma2J2YjJQcG4zN1Q2?=
 =?utf-8?B?VzFpRXFNMldiS2NuMGNsNXVWWHF2UmRlUDlWV0svQlVUR25uL2d2NU1oTmFH?=
 =?utf-8?B?LzZYdEtXZFNsZFpJbnFSN1lsemJvaFZBWWVMRit4R1kwN1YzQklTVzRqQ3ox?=
 =?utf-8?B?MjN2VE1aRXNQRU9Sd1lMemZHMlVZcWU2R0FXUDQvdmFzbG9QRGZ4b0UxQkIw?=
 =?utf-8?Q?w9Jo57c8jsgH9aOgYkKvAiug5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004a38ed-5f53-4d94-dead-08da70dc7c2e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 21:02:30.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECUlbrbJ9wL3lkTtKX5axww1L25hKjokEAKeHprP01t3esktxJuhX/FNvmWdeloGce6973cKKWjMmeIr5ck0+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3911
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/28/2022 13:20, Shyam Sundar S K wrote:
> PMF driver polls for metrics information from PMFW to understand the system
> behavior, power consumption etc.
> 
> This metrics table information will be used the PMF features to tweak the
> thermal heuristics. The poll duration can also be changed by the user
> by changing the poll duration time.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/core.c | 56 +++++++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h  | 39 ++++++++++++++++++++
>   2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 6c1c5a89fe71..ede4eefc33a4 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -47,6 +47,11 @@
>   #define DELAY_MIN_US	2000
>   #define DELAY_MAX_US	3000
>   
> +/* override Metrics Table sample size time (in ms) */
> +static int metrics_table_loop_ms = 1000;
> +module_param(metrics_table_loop_ms, int, 0644);
> +MODULE_PARM_DESC(metrics_table_loop_ms, " Metrics Table sample size time (default = 1000ms) ");
> +
>   static int current_power_limits_show(struct seq_file *seq, void *unused)
>   {
>   	struct amd_pmf_dev *dev = seq->private;
> @@ -88,6 +93,29 @@ int amd_pmf_get_power_source(void)
>   		return POWER_SOURCE_DC;
>   }
>   
> +static void amd_pmf_get_metrics(struct work_struct *work)
> +{
> +	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
> +	enum platform_profile_option current_profile;
> +	ktime_t time_elapsed_ms;
> +	int socket_power;
> +
> +	/* Get the current profile information */
> +	current_profile = READ_ONCE(dev->current_profile);

AFAICT this parameter isn't actually used/needed anymore.

> +
> +	/* Transfer table contents */
> +	memset(&dev->m_table, 0, sizeof(dev->m_table));
> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> +
> +	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
> +	/* Calculate the avg SoC power consumption */
> +	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> +
> +	dev->start_time = ktime_to_ms(ktime_get());
> +	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
> +}
> +
>   static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
>   {
>   	return ioread32(dev->regbase + reg_offset);
> @@ -181,6 +209,34 @@ static const struct pci_device_id pmf_pci_ids[] = {
>   	{ }
>   };
>   
> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
> +{
> +	u64 phys_addr;
> +	u32 hi, low;
> +
> +	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
> +
> +	/* Get Metrics Table Address */
> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> +	if (!dev->buf)
> +		return -ENOMEM;
> +
> +	phys_addr = virt_to_phys(dev->buf);
> +	hi = phys_addr >> 32;
> +	low = phys_addr & GENMASK(31, 0);
> +
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
> +
> +	/*
> +	 * Start collecting the metrics data after a small delay
> +	 * or else, we might end up getting stale values from PMFW.
> +	 */
> +	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms * 3));
> +
> +	return 0;
> +}
> +
>   static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>   {
>   	/* Enable Static Slider */
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index b6501a68aa4e..49d3232ee2e0 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -84,6 +84,41 @@ struct apmf_fan_idx {
>   	u32 fan_ctl_idx;
>   } __packed;
>   
> +struct smu_pmf_metrics {
> +	u16 gfxclk_freq; /* in MHz */
> +	u16 socclk_freq; /* in MHz */
> +	u16 vclk_freq; /* in MHz */
> +	u16 dclk_freq; /* in MHz */
> +	u16 memclk_freq; /* in MHz */
> +	u16 spare;
> +	u16 gfx_activity; /* in Centi */
> +	u16 uvd_activity; /* in Centi */
> +	u16 voltage[2]; /* in mV */
> +	u16 currents[2]; /* in mA */
> +	u16 power[2];/* in mW */
> +	u16 core_freq[8]; /* in MHz */
> +	u16 core_power[8]; /* in mW */
> +	u16 core_temp[8]; /* in centi-Celsius */
> +	u16 l3_freq; /* in MHz */
> +	u16 l3_temp; /* in centi-Celsius */
> +	u16 gfx_temp; /* in centi-Celsius */
> +	u16 soc_temp; /* in centi-Celsius */
> +	u16 throttler_status;
> +	u16 current_socketpower; /* in mW */
> +	u16 stapm_orig_limit; /* in W */
> +	u16 stapm_cur_limit; /* in W */
> +	u32 apu_power; /* in mW */
> +	u32 dgpu_power; /* in mW */
> +	u16 vdd_tdc_val; /* in mA */
> +	u16 soc_tdc_val; /* in mA */
> +	u16 vdd_edc_val; /* in mA */
> +	u16 soc_edcv_al; /* in mA */
> +	u16 infra_cpu_maxfreq; /* in MHz */
> +	u16 infra_gfx_maxfreq; /* in MHz */
> +	u16 skin_temp; /* in centi-Celsius */
> +	u16 device_state;
> +};
> +
>   enum amd_stt_skin_temp {
>   	STT_TEMP_APU,
>   	STT_TEMP_HS2,
> @@ -121,6 +156,9 @@ struct amd_pmf_dev {
>   	struct delayed_work heart_beat;
>   	struct mutex lock; /* protects the PMF interface */
>   	struct dentry *dbgfs_dir;
> +	struct smu_pmf_metrics m_table;
> +	struct delayed_work work_buffer;
> +	ktime_t start_time;
>   };
>   
>   struct apmf_sps_prop_granular {
> @@ -154,6 +192,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>   int is_apmf_func_supported(unsigned long index);
>   int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>   int amd_pmf_get_power_source(void);
>   
>   /* SPS Layer */

