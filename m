Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD11CC6FA8F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 11:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbjH2LB4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Aug 2023 07:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235350AbjH2LBu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Aug 2023 07:01:50 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB42C5
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Aug 2023 04:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6ITjDGeWAKhuQ0gqGhKzTq2bpV+g/xozLNYvDRq184IFxJXe51n3oJjHlpWItTazhHPlcpnbNHqPztYHxyGwfp7uOi8G5cCRZq3NHjdQOdEqiI9GZPkBjzrsgMri5W91T+MOToofjVFX6qBgtNDHaaO+iK1qEiTSFiTFpfpJ6rnLaVHVUzoLzp830Tb8m776ceoj2Zkl3q+bSJLXQkV+8l01bPntZXHkS4y+z7lxyKTVrn0MKZ58hJtasQHg3jY57XsTEfS/jNwvUF1K83k2VgVsjKV+/Bf4mJdp3QpQgQWfAz3+iub05yepmeueyZ4E8Pn5cc99fK5Ig0oY5oY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+3FebM4Z6Um9BHnp3VZIRVilfeSVsd9XtlxHU58iEQ=;
 b=DNM1VlkR/xKE9uWAUfXYbhCLkNLVWLcMZnO2zA9+N5dbLkUcsBpG5wal7rHln1YLny+ESM6SppsHHpBuhTfBgWTCBx4+eaam7WPpeZfjLuBhOJ+e89W3ftii9MgVR40mFN2sBa+87j1qYjYVb/wpFdYGy7mNXKKFKsvcIjCruipqHG/EpiKNjVhC/ZA8MLOP4+drKDk81x8lah6/2MtR0cKeJ7hAvmgaBR8rUDq2DquisEf0mc4OxvjDIq8oTg6ZVgDWTZGPr/rXEvZwhJGNj6DQuiHk5fiT+VyCct1GCZB3egzFrDmQjm3Ql30yNUh3NWL9oQmL1TozmiHC2UbRxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+3FebM4Z6Um9BHnp3VZIRVilfeSVsd9XtlxHU58iEQ=;
 b=piRIbBsXL9M/l0Z//NvMcw6UAY37RYuHVnlUPBNwO7/jJtlCrqlIiraOViCYUxjv4vyg2XIbw7q10oO8zMZ/qeCJaOTJHPrbU6hG9mamgT8OOmIxszNQboNBrEng2WaD/NFXGLELI29hOvZE/C3U1Y87uKYGQ4OITg8JhYf/los=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 11:01:45 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f%2]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 11:01:45 +0000
Message-ID: <ce8d2e56-29cc-4b6e-6b61-69c28b7b7d10@amd.com>
Date:   Tue, 29 Aug 2023 16:31:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20230829035239.4132737-1-Shyam-sundar.S-k@amd.com>
 <20230829035239.4132737-2-Shyam-sundar.S-k@amd.com>
 <31b525c2-1271-f9b0-af58-6b68b5d9f967@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <31b525c2-1271-f9b0-af58-6b68b5d9f967@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::24) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb5487d-46a4-4a75-f053-08dba87f553d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6d9wBZSxSsMxefOP77U+X4WwZjI+rap6yPzwlF0hrTgYaXDgN5Hi0swsNJNlxM3dRtHzt+Za28d8gf1My/y8Fshcbje0Fkc0trx61Uz6CtZhyRrm83vBAL/4VdtAUW9Dbh4F0+WwDW6n9CCEP4L4Of6nODpz3ktWKHJXt2Y0irHJXM/cMwahnpKoW+qrGJfJJjNF6dJdPVvS/as0F0tghDnsOZwO29sfttNlDa0fBJjsuBUeamTnWi0j9jWgfEnYKWwrREaS0qTNedT22AN8Bs5VcdskLLWFOg614mx5Bqmd3noRNOZpvgJOt5ouldgUadOlnO85qT86Zo9sfHxfWw7sMBBHye0geTzS8O1qxsqyO5XXF0UqQpzAwsGQRuYiGu+cKaYO0iXMWp7FRdOia/8Oq4OqzsDGX9HWgMV0tXt5NeIBcdQGuDmzt3XLIAL9kwo9VuSL16d5dK1smyU1yNwToMZhKueDVMFS8/veKpsNpbHkhcV4zcIrIi0CgmYXUnilocUvqT2GwCy3GV8Li89jGnr/LeaRVrj1S9pSKNCTtBErqPVesBxv+9m81idNn0QZVwuTM4fde8rpXIfgO7ONhjHXaGTnLPbLeEJln0C05LXsnG8ksrYJAccYdSo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199024)(1800799009)(186009)(8936002)(6666004)(66946007)(53546011)(31686004)(478600001)(6506007)(66476007)(66556008)(6486002)(6916009)(316002)(38100700002)(41300700001)(6512007)(26005)(36756003)(8676002)(5660300002)(83380400001)(31696002)(2906002)(2616005)(86362001)(66574015)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdENzhKTVM2VythSm8ydVlLV1FTUzJWcG9UM1c5djVwRzF4OVdjb2NBVGkz?=
 =?utf-8?B?cUs4SHFVWnlLa0h2OGMvcHEzR05BcFhQN2hOc1V5OFBRZ3U2YlNqeE95Qjdz?=
 =?utf-8?B?T2IrNUlyaVJtSnIvWGo2NFo5SklhWURRUWREWmJtc2hVTy8wN2E5V0Rtd0FO?=
 =?utf-8?B?b1JJd0dybjh5dGVTY1JYbmhUbVVyclJvNEJJa2V2SktQb2cwYnN3dXJqYis5?=
 =?utf-8?B?ZnBFcWZrYU1vS0hGV2daTHEwNGZCbFNHQU82QnE1YUkxY2ROVlFaaFZ1MDBm?=
 =?utf-8?B?SUxjdDlibDBlYVcvaHBNYzR6eUNIVmxaQklzN29TL3c0alVFZUJGNi9rNWRi?=
 =?utf-8?B?QTQ5enV6b2FEYnpSRFlLczJTaVpEblpuNFVVa1FLanY4Z2MxN3kzbVB0dHBH?=
 =?utf-8?B?NlpEK2tGVVB3OFhZbzQwMDlxT2x6dTZxVCs0RUZjR1BJaWZ1MVJaZy9xQlZm?=
 =?utf-8?B?ckphb2NGRWNNbkkyTE1sRjVscEIwYWJpVTh6eHUyaXZ3MnppZjVVbkhSRUda?=
 =?utf-8?B?YWUxc3BCenR1aDBvaXFFRnJDQlVRWlR5WDMzM29MRlozSnFNYTBQbHpMWUNw?=
 =?utf-8?B?QjluUEpWY21lY0xoNUt0dUZqSmFHK2hXbG9hdVZieEp6QmMvL25nNC9iNkl4?=
 =?utf-8?B?cEIyWmxOTjlOMXBkMTR5eHI5QkxMTzNKL2U5djdkUldNb1FoM1MzeWdCWURK?=
 =?utf-8?B?Z2EvRXJEcGdteG5lNi8vSi9waVg0ZzBqNnZzU0kwSkxhc3FsdVpFMjl5ZDlp?=
 =?utf-8?B?Z3dLUnNxU3hYa3lqYlBMbm1vRVFJZ1VYbDg0VVVzM3pVWE5WMUJpWVVCTjNX?=
 =?utf-8?B?NUszaW5LU1FUYkpmallucGVYQVFDMmp3ZkhFVnpaTi9IbG5HbjE5NlptZTJI?=
 =?utf-8?B?Rk5ydi85dUM0NXE0bHkwOG1OanVxaVdBeFc2TGg3TXMvVVhncEZSNlU4TTFG?=
 =?utf-8?B?UHBZY2ZLT1dkVHltVTdWWFl3T1JhUjRRTlhZTDlmKzZ6K2NJODJqZ3UvNDUx?=
 =?utf-8?B?c0pCdFc0MnNPWVJubU5XYy90cFA1NDYxcWRYRmdreEk0bVhHSzZiOHRzY1ZS?=
 =?utf-8?B?RVdUSmRsbFZFVGQxbzFGM0lUekVKQU9GL0l6ZVp4S2ZtVjE0SDJKMDJ3QXdv?=
 =?utf-8?B?T2dZb05JN25rL3FQOWtnd0JDcEtyem9QQ1ZCR3BOdUtleWF4VFkwTkNRRzJT?=
 =?utf-8?B?QURpbHBjdUo0emR6c2RiNXA1aGEveVJicmRDd0swSSs4Q2xCVTNmbk83NWMv?=
 =?utf-8?B?ajErR0w2cVhsckFtcHVVNksxK3JyUzZ5bXQ1WktCYmEyMWFHaEN2MHN2UU1R?=
 =?utf-8?B?NW93N2JRdFJlKy9yYlVBYXQrM05Rc0FDUXdNSkpKcmI1S0FpcVlwVDdaS0s0?=
 =?utf-8?B?ZzlmZXBHN3BIS3o5QURkZUFMRHphYllCRWdCazZ6UWE3dzBUYnRWWjVnRFpX?=
 =?utf-8?B?N2hyM2VEN0lpa2Z1VEl6RG1Jc3JheHJDc0tiV1d6bEVWcHRQUEYzVlFFbEMv?=
 =?utf-8?B?WU1PekZUd2p2eE5UYzlLTUF3UUVsY1l5dzlzOEg1WEZpTWJhTkk3RlJIa1Ba?=
 =?utf-8?B?MHBOYVFSejFnYjVRbUM1N0VwWW9XUHBXU3dTa1IxNndMQUhoWUI4MS9WZGZW?=
 =?utf-8?B?NFRLemx0eGdjbXE4MURwdGZwNHUyL2M2MG55Y1cxaEFoN2lQYjM2U0E3eHE1?=
 =?utf-8?B?bjBwcGpBUk9MY2RvTHM4WjBidjFpaEViaHhJalYvZEhCMGNzamQyNkZQNURB?=
 =?utf-8?B?MmpWdEtoZkFiQU5FM3I1dStYTzkrcktLenI0Mk9EanFTTkNqOFlwNEV5MWJ1?=
 =?utf-8?B?L2N1WXFEU0RCZFpLVWdDTE1xRHY1U0VpQ3lLU0p2OHB5RnlRR0xkNjhLN0xW?=
 =?utf-8?B?Qk9seDZ1N0FRRklXMTR5VEZ6bWhmVGNEMktqMDl0RTNJdFp6blJLeUJEcUl6?=
 =?utf-8?B?bzBMYnY5U2lOano4eWZVakZwUmhuNDNjeDNpTGJJQm1DZmV2Ynh0RWZqUFR0?=
 =?utf-8?B?N0dDcEo3RUZZL0JCOWFHRVlVNi9INU1NdEJLbXFjSk5zVEl4ZnlDL0hvL2lM?=
 =?utf-8?B?aTNkbEpiRHh1U3gyemlTK2ZzMWZKdjVic1g5SWNPaEVzZ0YwWWVzbytsU1Ni?=
 =?utf-8?Q?myTvVkYDZCgwJbnZP40tBjW+W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb5487d-46a4-4a75-f053-08dba87f553d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 11:01:45.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/YX+xkqKGtLZ8tAQrn3ln0c/bl4/bMgxG63g7lDg6uzri/KXSxkIdmW7yoV5HOmnPwKqeA+6s+MDUXJDLebLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/29/2023 3:09 PM, Ilpo Järvinen wrote:
> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
> 
>> There have been instances when the default size (1M) of the STB is not
>> sufficient to get the complete traces of the failure. In such scenarios
>> we can use a module_param to enable full trace that shall contain more
>> debugging data. This is not a regular case and hence not enabling this
>> capability by default.
>>
>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v2->v3:
>>  - no change
>>
>> v1->v2:
>>  - rebase to 'review-hans' branch
>>  - drop 2/4 of v1
>>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>  2 files changed, 23 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 443bb78ea5f4..0e61ae74f1a9 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -53,6 +53,7 @@
>>  
>>  /* STB Spill to DRAM Parameters */
>>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
>> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
>>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>>  
>>  /* STB Spill to DRAM Message Definition */
>> @@ -160,6 +161,10 @@ static bool disable_workarounds;
>>  module_param(disable_workarounds, bool, 0644);
>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>>  
>> +static bool dump_custom_stb;
>> +module_param(dump_custom_stb, bool, 0644);
>> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
>> +
>>  static struct amd_pmc_dev pmc;
>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  {
>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
>>  	int ret;
>>  
>>  	/* Write dummy postcode while reading the STB buffer */
>> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	if (ret)
>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>  
>> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>> -	if (!buf)
>> -		return -ENOMEM;
>> -
>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>>  	dev->msg_port = 1;
>>  
>> @@ -264,20 +265,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	dev->msg_port = 0;
>>  	if (ret) {
>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>> -		kfree(buf);
>>  		return ret;
>>  	}
>>  
>>  	/* Start capturing data from the last push location */
>> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
>> -		stb_rdptr_offset = num_samples - fsize;
>> +	if (dump_custom_stb &&
>> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
>> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>> +		stb_rdptr_offset = 0;
>> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> 
> I find the logic here somewhat suspicious in the first if check (I fail 
> to follow the reasoning here despite spending considerable amount of time 
> staring at it).
> 
> Lets assume dump_custom_stb is set. If dev->dram_size is large, the first 
> if condition will be false because LHS of <= is large. Thus, we go to the 
> second branch and dump exactly as many samples as before this patch. 
> ...And that is opposite of what this patch claims to do?
> 

Let me explain:

We have cases where the S2D (Spill to DRAM) STB (Smart Trace Buffer -
which is meant to have debug data that gives information about the
system conditions, be it success or failure.) may not fit in the current
stb buffer size of 1M (i.e. S2D_TELEMETRY_BYTES_MAX). The stb buffer
size of 1M is sufficient for most of the platforms, but there could be
exceptions.

In those cases, the dram_size would be updated by the PMFW (Power
Management Firmware) coupled with "dump_custom_stb" to fit into a custom
requirement.

As an example (with this proposed change):

when dump_custom_stb is SET and dev->dram_size is 3M (received from
PMFW) the first if() will be successful and it takes the corresponding
code path.


>> +		dev->fsize  = S2D_TELEMETRY_BYTES_MAX;
> 
> Please remove also the extra space here since you're touching this line.

Ah! thanks, will change this in v4.

Thanks,
Shyam
> 
