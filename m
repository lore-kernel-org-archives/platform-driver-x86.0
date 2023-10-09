Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48174E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 10:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346064AbjJIKKB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 06:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346056AbjJIKKA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 06:10:00 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969FB99
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 03:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiV6jz5EM0UMLyOQxRPqd1WTtmt19lU+nYNfhJKnPo+Nmzc0BuP7sKx4y/cmBps0y5t7LtmHADLfOpsqTvJ2KkRyIFR4NiRrGEVJXOqIqDPhAk7PdF54tOisjWsqE5+VbLNfpuvgeEeH1PF40f6kpW2MM5VM/UthXtzFYo4HpoRW02Qz5vUxvUE4qohNvWHb0TmoA5JUdfIhtVH+6hXAO1gViUstYvkuzhyrADwvQU9+yb0/LgtQPjCnK0C2yzFWTEFCye3TZjOZ1PAQ48aqnBQfdiZor7mvQrm4Z0GDIlOYMK+gqZutkZu8qwKR0jG6rLVMz65QipO/z3jaCkPDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd4kNcXTx4O3RGVuT41IU3Kd1YFcPX2rCrxPbJEnAQk=;
 b=nEFi4T3CkTyh10AKOowtseQHlIvmY4PTM6X1Cfu6prqyk9bXzq2OtdZQ9Ti3i2MY1aegd8APj4H/QPq5kCI9CBRMcgJnErJcVAubSJg8vHWDvHk17lFWjxv8M2I2F9ItHvwOqSqJ6nFh0/EARJRcZkw+MBHwt1M4ZBwJxvr845p+snBieu9S94VEFuWzXSqZ6Gpzlpr/AK03T1NQwvkg9AzJICegfkHp82CR8YScL6UxiIPdqEfH8QN8p1S/n+MzlLnSpmldF0w5It8ZPN1Y4hPwWFguJtILeXzEyWR3tJco+RmZoqTTPxk8rBh67bSFH4dPovnlNJl+WyymHotKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd4kNcXTx4O3RGVuT41IU3Kd1YFcPX2rCrxPbJEnAQk=;
 b=KH4wrcokRKggcL+zg+DVsTyiXwkPjE7EKIKz97wdezeUuoxKmW4V8e4u/hTSLmwRyXFu/rycup4ZrRjhBwQzqY7rm0+Ab4tBjzBcHpqUO7l44h2HMCb4X0tpidygrG8B5msrsqhI1CCmD9ETOTrLN+/yAK/9SpahD3TcT+KKUBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 10:09:51 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 10:09:50 +0000
Message-ID: <422424d2-c38d-406b-b4a3-6d48027a81d5@amd.com>
Date:   Mon, 9 Oct 2023 15:39:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] platform/x86/amd/pmc: Use flex array when calling
 amd_pmc_stb_debugfs_open_v2()
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
 <25062006-2eb7-e53a-6d2a-c6c2cf539633@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <25062006-2eb7-e53a-6d2a-c6c2cf539633@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0f4c04-00a9-43a2-291c-08dbc8afdf87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6Evxq49tPGsESM0drHtE6qN+MZWOn8HV1Btm3ivkln7soE1VmKpq2Ke4CcjcnHnpRuhNsAKdewEOOZ3h1bOtcRaN7nd45bQAKmnY8wZOY3eCj2KubITqKmGGfDN47afhz/jSEVKaz2yDk090RzO7QGhykH5WRlsY0HxnivfoinKYI626LacZLipP0ovzynTmJpnEAyLdgxCIwtzbtsMPvGJ8crV5CHnFoc81PFC3mbNaa7GKAGSNpr5ojD59uvdlrHbnPkt61PQONW9KkMpxmxI/QojOXldEFH1l0G/zx5Bq4NrYDuG/BT/rJyQTL4SUu5x/2deblWh7oKx+w/ykwgXaDD2+fjSyHxGfvZnfehqBKhtLDh95SoLDO6kb2+bXG9ENF1cd3pHjbyqK16S1Rs2t3DQeOke/BWoqzyf+yBLLTL9vHAftYnG6XzPM7F2IRtm3N9T0JuQPAToZfb7AI7B5TxKxHkAeXkZGy7Fa2M4k480Hw8SrjDKXbxaWfIJjpcgXMVaYRZVaYoFj4GhSguFYwySwuMh02In2UcyLwZ4CiOgn9G3RktJ1hh6m2vt6+4u7BuOGVX0a39cym1AsQaSpFS/CIm4dqmIQlB0HBPEGmxuGmjry79GVZb1aSudgkA+ZLnuLvo6Z+hf7fnaaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(31686004)(36756003)(86362001)(31696002)(2616005)(6512007)(53546011)(5660300002)(2906002)(6486002)(478600001)(66476007)(66556008)(66946007)(316002)(41300700001)(6666004)(6506007)(26005)(4326008)(8676002)(8936002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHQ3YlNkUllMTnd4QmFPNUVoOHprc3IwUk9ESzk5TWJlTExhbDlMenZzeHN1?=
 =?utf-8?B?WUh5V1BvYk11aE1NVXBjaTllZzZYUW5NNTdpTVFCem1EVTBlelVzYXN0cjZO?=
 =?utf-8?B?aE1TcHo0SmVDems1Ulk2TFE1b1A0NGVwcHZNSWFwUndiSTgwMDkyTDN0b0Fm?=
 =?utf-8?B?eFdaODc2WGF3dm9KclByVitwTE9CcDJqakI2YXhjbHdzL1JiYUxsdENyUUNV?=
 =?utf-8?B?SUZkenVZSFk4WDFObXp3a2hUU0FZR0J3cFFDS3hEZXk4Rmo3SmZpd3J3cWdI?=
 =?utf-8?B?Z3hoa050SWUxSjhCeTRRNFRUWUl6VEhVaTBsdjlCZ3I0YU9HeTRNN21kWTJx?=
 =?utf-8?B?dFpLL2pkbHRPWU1EWnVITkRHckNxWWdPbmtTREw1dHE5SmIwS3U5TWJkc01x?=
 =?utf-8?B?ZitHcUR3NTJSTCs5cFIxaWwvUldFV2Y4bjdpaHNkZVlRNm5jQWtuc21CZ0Vt?=
 =?utf-8?B?enNLMUJ3RDlrL1RVeWpjblpLN05vRHV1dTdJbjFTVUtUcmNtZlRoelltR0JZ?=
 =?utf-8?B?VlNmRVFOZmJSQ0h5QXZNMS9maU1kRTE5bXpMcUdscS93aXRlRXlIWFZnSHp5?=
 =?utf-8?B?MDQ4V2c5bEU5aktWUlAvdkJOTkNURVp3blFLQTV0RkkyUlZIS2pVc29NOHJC?=
 =?utf-8?B?MFBsQmpnaHR2d0JOUnMxZ3h2TjdUNlNvVmdkUGhqQTFjMG9yY0NlTGYyM1pC?=
 =?utf-8?B?NjFrRENJdnBkOEVPRUxDdytlV2tTUVJpWWZidFhVbWFlaFVjN2R1dkNMeHpJ?=
 =?utf-8?B?clp4OWhVSFlKdktPSVdWZkNZN3orVElvV0xSVTFHbGZIaUdNVEI1T1RieUFh?=
 =?utf-8?B?M3BOTERiTFRDVk5qV3NTR3lEVmlvUnptVUJOOEZRTis0UEhNSlhhTStBVWlZ?=
 =?utf-8?B?Ly94YmNLNkkrejVKcVJHS0N1dlQyWVR2SThUUnN0VUlIclowUElJMmx3aEN3?=
 =?utf-8?B?Y0FuNmJkbEpNajNYVGdSOE1JMXViNXNtdlBLbXM5RVhKZEN3cmNwVTBMdEpk?=
 =?utf-8?B?T2NnQUZNQnFnR2ZzNWp4b1lzMTVJallkUHFXb2UyRDBRLzhXMXp1eXUxU2lP?=
 =?utf-8?B?TWwxb1QyMlJxckRnd0JCTEFIWEF5cFBFb3paZ2ZuOEVja3VYc3YzdDRKaWs1?=
 =?utf-8?B?d25HVXV1L1pJdTU4eEdhak5udFI1aUlGdEZvdG9nOFpmejBWY1BjYzlMUGx1?=
 =?utf-8?B?NUpQMDdPTGJ2WUIrL29QNjFFMTBJZ2hNWmh5Z1BtcjJFck1mU1UxbVZHS1N1?=
 =?utf-8?B?ODNVWElpbkErdlNWcnhkSi9NM29yTzQvN09GVktsbndoWmdkdzBYTDA5VVhH?=
 =?utf-8?B?RlpyeGFRaS9kaUp5Nng3cGl4dzdqbm1HaUVQOXQ0Z1RhZklPY3RzYzFCZGNu?=
 =?utf-8?B?T01JRGZSMUR1MDNMWFVzSFgxNk9KSlhoUGZwQUZkeWlpVlVpbEV6NXo0RDhO?=
 =?utf-8?B?b3dGaTlEU0l1RTk4Mjg4ZE1BYXdCMlRZU1VMSTRmUWMrQ2xaSHlVK29MTUtB?=
 =?utf-8?B?R1EvNW9DRkdaN3RiRmRNZzhmOGVMUyswNmFLVW1ISzNQczJHWlpOcW9BSm1M?=
 =?utf-8?B?Qndqa0ZmVThKdUFIeUliN1BkSHVpYnh1S1E3YTB3bFNEN1NPSzZ0R2h6bEhv?=
 =?utf-8?B?Qi9XZGdmeFVCdDlrdGZsQ05EM0hmd2NsNWZDaEpFSVhHRFVFbm1taWRybE1I?=
 =?utf-8?B?RS9EbHlYNUJwSHpGV1pMV2orbDJYdXhEN2ZIdjlOWkNUdHVBYW5McDRNOWlL?=
 =?utf-8?B?UktWbzFZRDRjRW1oUzVPa3JzMUV6N2lEWlgweGxMd0RXaDBzbXIyYjY2cmpw?=
 =?utf-8?B?SWNWZnZGUWsya3BBdE5la2dwczZYM0VlRzNmL3hSWUZSSHZKVTRoRDVGcThJ?=
 =?utf-8?B?b2tiT3lRWnI3MGZMc2NtVXV0Vmh2VGY4ajkxQ1dUNVllS2l3VGdlcE5DWFVF?=
 =?utf-8?B?YUxoeHdjTkdVREhEeHdRb1RUaEtIU0V1NlpaaXYzMmh1aWFOVEhEUXVyOWlt?=
 =?utf-8?B?Ni8yL0lDVWVhclIxSHozb2pZVWR6SGhNenJqZ3JMd29sM3NrdkF5bHlIemdk?=
 =?utf-8?B?bVVUWG9udGV3cjM3R2w2bzIwbysyOFlIbEtSNTZpdG80S3hZMVR1ZzVyUURN?=
 =?utf-8?Q?WlXjTnsBokxvqSH8fxqEvit7X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0f4c04-00a9-43a2-291c-08dbc8afdf87
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 10:09:50.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wa0W4YVnDAolJZLGgWRWgEd1jHs2OAtBgCMEIWgJoylJvuyxWFOpZm7ocG86F08rrXYJVI3mqxBJFm2JfNM/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 10/9/2023 3:21 PM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 10/9/23 11:45, Shyam Sundar S K wrote:
>> Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
>> be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
>> a process holding open another fd. This could change "fsize" to a
>> bigger size causing an out of bounds read.
>>
>> Instead create a struct with a flexarray to solve this.
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v5:
>>  - new patch based on comments in v4 from Hans.
>>  - based on review-ilpo branch
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 22 ++++++++++++++--------
>>  1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index c92dd5077a16..e00d69801369 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -122,6 +122,11 @@ enum s2d_arg {
>>  	S2D_DRAM_SIZE,
>>  };
>>  
>> +struct amd_pmc_stb_v2_data {
>> +	size_t size;
>> +	u8 data[] __counted_by(size);
>> +};
>> +
>>  struct amd_pmc_bit_map {
>>  	const char *name;
>>  	u32 bit_mask;
>> @@ -239,7 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  {
>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
>> +	struct amd_pmc_stb_v2_data *flex_arr;
>>  	int ret;
>>  
>>  	/* Write dummy postcode while reading the STB buffer */
>> @@ -247,10 +253,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
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
>> @@ -264,7 +266,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	dev->msg_port = 0;
>>  	if (ret) {
>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>> -		kfree(buf);
>>  		return ret;
>>  	}
>>  
>> @@ -277,8 +278,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  		stb_rdptr_offset = 0;
>>  	}
>>  
>> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> -	filp->private_data = buf;
>> +	flex_arr = kzalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
>> +	if (!flex_arr)
>> +		return -ENOMEM;
>> +
>> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> +	flex_arr->size = fsize;
>> +	filp->private_data = flex_arr->data;
>>  
>>  	return 0;
>>  }
> 
> 
> You are not adjusting amd_pmc_stb_debugfs_read_v2() to match it will still
> return S2D_TELEMETRY_BYTES_MAX, likely overflowing the array!
> 
> And it will now return the contents of the size_t prefixing the buffer to
> userspace.
> 
> So this is obviously broken, nack.

I think it was taken care in v5 4/4. Can you please take a look at it
and see if something is really missing?

        return simple_read_from_buffer(buf, size, pos, filp->private_data,
-                                       S2D_TELEMETRY_BYTES_MAX);
+                                        dev->fsize);


Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
