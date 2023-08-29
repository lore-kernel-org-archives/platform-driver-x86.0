Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850B8C6FA8F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 13:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjH2Noz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Aug 2023 09:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236266AbjH2Noi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Aug 2023 09:44:38 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB415E5C
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Aug 2023 06:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDgsw0bAZ36csnQufD215ksbffHDdGchLtxxgBYzNdo9n0qBLYbZfY0/BNAgbgCLUCTN3H69Ugqm7je5MGI+db/XfUdcazgEBSX3ngsA3ahCCyjpLEEJu+daD5JgJE9n2tA42t4MYYf8+f9/imFj2UrbmYWGIi+dRtum1a/68601z/gsMj++8NBT+AJaLlvOTVEdP57yyeTk2NK7tbuIoSNUsNjSHZipZRwgRJb3w15I5pOfJOP+4MPJNf4vEgTuEgpc3EvPB29lWR/O5XOsJqXNNaB9Z/rMxxKfnR2l5Kfj7odzRzYO8GUlwxXVZRxnY6s9s1788nu9XcZ3XMIXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxgqS8g6Uws1FSRtb+DRjh3u0C0vcV3YrbgC917u+8k=;
 b=eLhbSmJcQ4izNIFOBPW4cjx9wHWC+zf1XaHE9Pdf19+Sm035ok4yN9OLiKhufavnPAtP52pVBVCDyYAockD9Sv63d2F3Ux+70B402skFctCtDY9pQ9qnRpXtZ/QIepqPcCAzA/GPmpe9GCN+klhb4BAMwrGNeG35v2BuSUZgKtdUjsX+fAU23wICu5bxWb4zNeA/RdaNzFOBXDrIPnoaKVmi8dP/0ejTI/aWt3n7Rc/ZG1to+fCusUg+MGFLcZ1ltUSZGAzUERwICYL3GpmhuaC0fsX9xbN5dZYDcpiXCfQoQVjwqhhvhCCZ/RetNwwSo72xoqBv66ZInK6ajrlUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxgqS8g6Uws1FSRtb+DRjh3u0C0vcV3YrbgC917u+8k=;
 b=2biOj9RzpTtAFZxgovchjtWJ+6h3SS5h2gfNZ7/6YGNSUdA1CmMZXs+rqeTOAdQiE36pwd0+q076eROfHrzrj37GbNya6V9K0pni8xffeogFZNmbIPq1EnLjCyQXpBJZQKH26TMdhTC7IHADqr3d9fV1bc6SaTKR3DxI0ywAj1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 13:43:00 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f%2]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 13:43:00 +0000
Message-ID: <06125c23-c086-ff61-de5a-aedd47ab79ee@amd.com>
Date:   Tue, 29 Aug 2023 19:12:45 +0530
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
 <ce8d2e56-29cc-4b6e-6b61-69c28b7b7d10@amd.com>
 <fae9a214-1d65-f7b-7329-f13ddb669daa@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <fae9a214-1d65-f7b-7329-f13ddb669daa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::33) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb9218a-2281-4c99-b4e9-08dba895dc17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xq6kItoZLYTtkUtG0B//DLYB5xptuMVFKmwNbk7dLWOC+ZplomDkCDQC1LSEoVoULma9E+TE5uiHQ5zYKE5e75q22K7yv723cYjB19pDLcEc8Z0O2oHh+giYg6cPebrIGaWm8BP3pf+bS0XHS/nhE8ei37qWkmmTW+jSZVZyJ1vFpobJPfyc5oJBySHTJi0na58RXOJnwXP+dHz/a/y7tWWeKFieVJ69k8mEKoi1mP/ynEXjew4vjGiiXhCIoH4ijM/iT8x6168j86SSyMgZbAkztG51rZZ0GF0y3CEKP9FobiPhXhMs2gnIW5pT1uy5GFYEHQkEcF7nKORBkrqGVNIPkOId+r2rQINeehBVXPtBldbRquo2ZtZj/Z5ZA62UTydLr+vrhX3TPnEQo/6RR5MCVfZKd5WTN7jlKtLERegIhM7pF93UCo5vgEC9hcxUpXeiHlh3ZCebbYBgmFDvXPQI1l182p2hk0PORk5b80rtz+k10iWWWjS707GbVsoobfDlr69Fadl/HddBnV1c2YW+PZLpu92Cb3m0NtQwsPEnySblX/g+FvmWsyvnD9SI6FeaG/jZiZ63r3GvVIl8nbkTbsFKj6oJQTWAcU2xilegi8lQ1i7cgClody7HCoz4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(1800799009)(451199024)(186009)(6512007)(38100700002)(316002)(6916009)(41300700001)(4326008)(66574015)(2906002)(83380400001)(31696002)(86362001)(2616005)(36756003)(26005)(5660300002)(8676002)(8936002)(6666004)(6506007)(6486002)(66476007)(66556008)(66946007)(53546011)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXRmRUxHZHFFeUdLUEprTWxEdlIrTCtZdm9SZWd3NWlwdzFSRUljTGtsQWRI?=
 =?utf-8?B?YXJsZE03YVdLbXV4WUc1STRHQ0pqbzRmR1lMaGxqMVBMWnVMSDF1UGM4SXMr?=
 =?utf-8?B?eG92WitjeHRmVm9udXhPbGNUNmtWRjFZL0RHMWF0ZVRoWHdDbThUOVpPbFVY?=
 =?utf-8?B?RWRraU9qdVNsZy9YeFV2YXRlbEZraUpNZTRRN1J3VDJuQTlXOUR1YTRkL2ZL?=
 =?utf-8?B?UTdrRlpoa3ZyWTBJL1NNcFFLTUtXWmZ2cHdJYXpFbXdsL1NNTWQvWXpoWDBw?=
 =?utf-8?B?cU4vZnNKdEo5NURUR1d1SEhEZXZqTGZWNkNGRStWMlpYMUo2dmhJRTRwZkR2?=
 =?utf-8?B?eWZ5dnR5c2pkQjk3cE5WY21KbDFCMDlKR0pRTCtwQ3lTdlUyTHJ6U2FzdUNh?=
 =?utf-8?B?U1FPK2o4VVZDamlnM3VEVWZYSnNQY3R2TUZ0S1ZIQTlqc0ZSN29DT0xuVm42?=
 =?utf-8?B?QVVRb1BPMlFjbjRYcE54bU9iSDR4UVY2OVkwemhRTHYwVjFaZ3hYWjdlZW9R?=
 =?utf-8?B?eW1iY0ZWM3lOTVlodUp0c010dmFqUEFPemNzS0h0ZWkvYm80MzlkNDlwWmFh?=
 =?utf-8?B?dDZibE42SnBKRG9NcDN6RjFoUE9rTVFGLzZjbEhDY0JTWHBsSFFicTUwUU4y?=
 =?utf-8?B?UlR2QTZyN3lTUkh6K25LK0JwM2k1WGpTWUJiN2lmUFYyN3dXRmJ3SWpOblNh?=
 =?utf-8?B?SHg4QnFQOThIMmpQWGt5QzN1UHZnblB2VlFjZFB0TE9rYXVFVytDSGpiaTNv?=
 =?utf-8?B?Rzc2SUlCVjNpTnpGTitrSWVENU81VFZXZVR0Nk94VXNBbEljdXpSK05jeE5Q?=
 =?utf-8?B?MjgxcC9MOGI0RjAwSlRWQ0xWaEdRZ3dSOHNwK0w0RXpsL0xoRWJLcDJ5bVhu?=
 =?utf-8?B?SXViRHFKVWQzT3UxSkNjaTlVdlZhZmFoZkJsVnJkZWIzRTAvM2xXYzVIMlQz?=
 =?utf-8?B?d3pLSEg3bm1RMXVWY2NLMFBQbFV1V3J4Y1MxSE1RSzhERHdkdnZhUWV2TlhO?=
 =?utf-8?B?TXkxOEtDOXg1ejZkVk9nQnVqV2hxNU03cU82NmRSMkE4M055bmxvdTlQaGZx?=
 =?utf-8?B?UktXMlZabHFCYU1FVHZuSU84VHYxRlNEWW51cWpSU21KNDRVKzBUL2x3M3pL?=
 =?utf-8?B?RFZwb2hHUm1xL2FjOFR6VXAwZHZLY0JRQTRLRUhVUGxiZzU1UTllMWtUREJS?=
 =?utf-8?B?YytVa0YwOWhVR21vRkJFeW5odjFreUJ3SENKRVI3eVlMdi9zZWFqajQrbUxZ?=
 =?utf-8?B?Tk9Va2dBOVlxVHh4UnhKY3RneFJxa3kxT05VMWNBUTJPQ3lsU242cnEzSnRM?=
 =?utf-8?B?L2F3ejhxd0kraHN5d1kzV1ZIa3FtYVZLM0hJaVduMExVOTNSRzF6SWRXUkdR?=
 =?utf-8?B?OHFvaWFLeWhBbzg0T2JmL2IxTW8zaFhpUHU0bklaSlEwS1pnMGF6YlF6d1Rl?=
 =?utf-8?B?bm9sbFgySGFheDF3T0FBRloxNUNvbllEZjBUOG51c3B1Um51dmxIRHdXbmFs?=
 =?utf-8?B?V3poZDNKTUdZTVpoeWd6Zlh6RVVZN1llbkFySnVQdHRHTlVMRjFrVEw0TG8v?=
 =?utf-8?B?VXlZQWFqQVNWNDVmS25qc3o4NmVIRWsrU2Q2bExkTUVIT01TM1hDNnZiekVU?=
 =?utf-8?B?TlJXYUlVaE5ZQVE0d3Zyc3FIeFlDTUdyUzRCblNWeW1LTi8wWGFIb1o1WkV6?=
 =?utf-8?B?Q0hXYWhiNTM4WU1sNzlhaGxaMzFJeURFRkdDbGZEeEhEaDM2VDRrMEdHL0sw?=
 =?utf-8?B?ajhIVTN2dkI3SVAwcUc1cDBoQVJBcFVMQ0lQWXNPa3F4Rk90QVEzSVQ2ZDVy?=
 =?utf-8?B?SlVRRjRrb1c5MDkyWTZoSHBEYkduV09TeTE2RGdCN1R4ZzBIbEdNSGt3WlEy?=
 =?utf-8?B?RUFsVmxNenZ2RlVnV3AwbFJrRHJlaXhBUG8zaVc0bk5GMnhuR0xlcHByOVFL?=
 =?utf-8?B?OHQzYjZncG02bURra3RmRTZCOEJlU0Z6czI1RVJpNXB2QWVJZXpNVWNqeUxH?=
 =?utf-8?B?OGJRUEs1dExKUkRjRFlYaEhXK0Jtbmx3YlBqamJ2aFBvd2g5ZFNTQjZ0RTZO?=
 =?utf-8?B?VVo1S1c5ZS9SMHZoMkh4eC9SRVlVakl3Zlp0dGlOMGNraHIraWlrZ0hLeGlo?=
 =?utf-8?Q?nYeB0PJMdtHCexz3HE3Au7Gzu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb9218a-2281-4c99-b4e9-08dba895dc17
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:43:00.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqLxUMsd972zP2kQ0ko8Wo7b1au2OkK7+9Btz80QntqmH1fREtw2+hUAFQpEqRZytaiWypr9CoFTTX7O86eOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/29/2023 4:49 PM, Ilpo Järvinen wrote:
> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
> 
>>
>>
>> On 8/29/2023 3:09 PM, Ilpo Järvinen wrote:
>>> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
>>>
>>>> There have been instances when the default size (1M) of the STB is not
>>>> sufficient to get the complete traces of the failure. In such scenarios
>>>> we can use a module_param to enable full trace that shall contain more
>>>> debugging data. This is not a regular case and hence not enabling this
>>>> capability by default.
>>>>
>>>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>>>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>> v2->v3:
>>>>  - no change
>>>>
>>>> v1->v2:
>>>>  - rebase to 'review-hans' branch
>>>>  - drop 2/4 of v1
>>>>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
>>>>
>>>>  drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
>>>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>>> index 443bb78ea5f4..0e61ae74f1a9 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>> @@ -53,6 +53,7 @@
>>>>  
>>>>  /* STB Spill to DRAM Parameters */
>>>>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
>>>> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
>>>>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>>>>  
>>>>  /* STB Spill to DRAM Message Definition */
>>>> @@ -160,6 +161,10 @@ static bool disable_workarounds;
>>>>  module_param(disable_workarounds, bool, 0644);
>>>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>>>>  
>>>> +static bool dump_custom_stb;
>>>> +module_param(dump_custom_stb, bool, 0644);
>>>> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
>>>> +
>>>>  static struct amd_pmc_dev pmc;
>>>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>>>>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>>>> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>  {
>>>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>>>> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
>>>>  	int ret;
>>>>  
>>>>  	/* Write dummy postcode while reading the STB buffer */
>>>> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>  	if (ret)
>>>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>>>  
>>>> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>>> -	if (!buf)
>>>> -		return -ENOMEM;
>>>> -
>>>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>>>>  	dev->msg_port = 1;
>>>>  
>>>> @@ -264,20 +265,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>  	dev->msg_port = 0;
>>>>  	if (ret) {
>>>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>>>> -		kfree(buf);
>>>>  		return ret;
>>>>  	}
>>>>  
>>>>  	/* Start capturing data from the last push location */
>>>> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>>> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
>>>> -		stb_rdptr_offset = num_samples - fsize;
>>>> +	if (dump_custom_stb &&
>>>> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
>>>> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>>> +		stb_rdptr_offset = 0;
>>>> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>>
>>> I find the logic here somewhat suspicious in the first if check (I fail 
>>> to follow the reasoning here despite spending considerable amount of time 
>>> staring at it).
>>>
>>> Lets assume dump_custom_stb is set. If dev->dram_size is large, the first 
>>> if condition will be false because LHS of <= is large. Thus, we go to the 
>>> second branch and dump exactly as many samples as before this patch. 
>>> ...And that is opposite of what this patch claims to do?
>>>
>>
>> Let me explain:
>>
>> We have cases where the S2D (Spill to DRAM) STB (Smart Trace Buffer -
>> which is meant to have debug data that gives information about the
>> system conditions, be it success or failure.) may not fit in the current
>> stb buffer size of 1M (i.e. S2D_TELEMETRY_BYTES_MAX). The stb buffer
>> size of 1M is sufficient for most of the platforms, but there could be
>> exceptions.
>>
>> In those cases, the dram_size would be updated by the PMFW (Power
>> Management Firmware) coupled with "dump_custom_stb" to fit into a custom
>> requirement.
>>
>> As an example (with this proposed change):
>>
>> when dump_custom_stb is SET and dev->dram_size is 3M (received from
>> PMFW) the first if() will be successful and it takes the corresponding
>> code path.
> 
> Heh, I can see the numbers work in that case, however, the above still 
> doesn't really explain why only S2D_TELEMETRY_BYTES_MAX is copied if 
> dram_size - S2D_TELEMETRY_BYTES_MAX > S2D_TELEMETRY_FSIZE_MAX and not
> S2D_TELEMETRY_FSIZE_MAX as I would expect?
> 

I guess if your question is on:

-->the if() case:

why:

dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;

and not

dev->fsize = S2D_TELEMETRY_FSIZE_MAX;

if yes, I think the intention of the code change is correct. The entire
buffer has multiple segments out of which the driver can only access the
STB buffer region. In general cases its S2D_TELEMETRY_BYTES_MAX(1M) and
with the proposed patch a custom STB buffer range that cannot exceed
S2D_TELEMETRY_FSIZE_MAX.

taking the above example, assume

case 1:
dev->dram_size is 3M, S2D_TELEMETRY_BYTES_MAX is 1M, so the dev->fsize
is 2M.

case 2:
dev->dram_size is 2M, S2D_TELEMETRY_BYTES_MAX is 1M, so the dev->fsize
is 1M.

so, it depends on the incoming dev->dram_size from the PMFW based on
which the dev->fsize is calculated and cannot be directly
S2D_TELEMETRY_FSIZE_MAX (always).

-->else if() case:

why:
dev->fsize = S2D_TELEMETRY_BYTES_MAX;

and not:
dev->fsize = S2D_TELEMETRY_FSIZE_MAX;

the already exising code is put under the new else if() block. In this
case the dev->fsize is fixed to S2D_TELEMETRY_BYTES_MAX which is 1M as
the internal alignment with the PMFW team. Like I mentioned above, the
telemetry buffer is huge and we are only interested with the actual STB
buffer region here.

Hope that's clear.

Thanks,
Shyam



