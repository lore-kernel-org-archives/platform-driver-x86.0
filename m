Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC38E95A9F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 16:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376985AbjJIQGV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 12:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377091AbjJIQGU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 12:06:20 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3FC91
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 09:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wpzd/almhHnHkqyeu9iJSLqDSzLTDzvcYs5AQxRwil6GUjt+kuYAlGmf9jpCi02YvE7l5CDoXbVkft2eBvj2XhegPD8d+PbcOlc3HC30Itzc8JSPK3jBPtZPFQ7qiYM/k6LBBWzvTJ+6Qf+29YzxOIV4dN6v1LKErsmaPg/RRg9Fl88vuGBQfo5zcI5Fc7dGcNdRdkkpQLQ2ienEiSyP2FLlHVMiqrGxQ3xl9eypsypG/jt3pfjYqkYb0oc7d6BRVwf8M2mWKDZduVRCKqwvZvNreIH/QyI/FLTp6XBaWJHzJ7byzmHH6i5EnwTFBJJ6yOSUHvYnRTv4SiFm1oARnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XEwXOEKcEqKzv5LDE6FKy6oaDC9E8KTjkRcd7vsNuY=;
 b=aLoNx6ljzYKT9AadFWHkaXNn81bB7GepqMtSSxPC5vwxyFXpmxZiQIpO47STF+YARjAw01hD22MHno0svgUvlLJJW+yQsptaidlCMTaRq131FmRMiiKIPq8ybH6OITYTQ1IL5+iGCxvhmYL0JjVw0yHrOueBQ2A4+25ssKRrdtlLBwt/ZaoJ/JfMOY3X75aI6vfAGcFX3P35Yz2ix7d229TbY66kgGYwUaSxiZ+pDeB1dU+KvJt69nnfZuhVBvJDQF0nEWTzrPxT+ztrY3Qqq0E+ImvTnyciY0MGkyCLOq4X/2hdxCayTNcsZg5EcqoEjCCgSglYVAp/Ct/rulkT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XEwXOEKcEqKzv5LDE6FKy6oaDC9E8KTjkRcd7vsNuY=;
 b=hJk+baw0LBqRHZOzVczioEuOzdT5Dp57z0ildCZX4qqY0nONqC+J61axNp6uarbUCxpd/fT2hymmiGrGp9hV6jxfC1Ccv1JK/oZ0r7oULIU+2XW6OjTn2efZff/DvFigkphJwXm/mf3Oa8g3bAZNEy2uhm7GGwpewRGHACUIR5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 9 Oct
 2023 16:06:14 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 16:06:14 +0000
Message-ID: <a71ddb4a-6c80-49b1-b8e9-05ae9161df43@amd.com>
Date:   Mon, 9 Oct 2023 21:36:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] platform/x86/amd/pmc: Handle overflow cases where
 the num_samples range is higher
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
 <20231009141254.22114-2-Shyam-sundar.S-k@amd.com>
 <b8d72a27-dc85-f36d-9e85-ca86d81ba83b@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <b8d72a27-dc85-f36d-9e85-ca86d81ba83b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be673ff-19fa-4c43-998e-08dbc8e1a9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EpT9lmjj7mMV1iDSJcV4fRjKfukcrUYFVg2ERKf+HB5Z0QCwUlSFZUFYkHV2fonZOr4bXGU9RKmuuJX9eLtAudYozWq/ut/EuJmbffgUuP7o3haWHJUsjxQUub8L9sNatByOv+IElMd0pIksLyVQQs0PjuJa0u0F3BOHL9PyI+gYHeOH4hvtWYq/AhuOkA9m7/Ls14rzdyM5vvgmh53BQN8fDjXGt4OUTyZST1mso7/8xb9Ui3nlLQ/3tomNcFNtULW80qdYlUx+/H1HyLbDuBQpJ7yhdZg1PAmOtODDXWP2jrnsgycjVCYLFlfIJFMt3pFPpN9S3KHba0/H6UN2MfG4aMz9nSJI6XkFCoumSNFZiIZtOXEoXzClxg+f71mgBYjD9Djldnti/HzWrr+322EudL+RfqVSoMtx3xyq0wbCvo+gyrDDDlxRh5N8sf8zeN2MpdWVbzJutEn/sBmdb0bmTPAKufDe1Fckoph5PmAx5C6zaALutcM4pzOfcHpRqiJdGFKI7I6fJoEiCNcI1kFKssyjTuZcq+gbXYV4YxUwOfNNX/PqMXj21AqLRQDS/Ep5pT0XzRiejarjnMwVe8gVcGmk+zHUybGgRUjQYcbrXSC+3nYGie/oJxp/R+ec
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(66574015)(66556008)(2616005)(66476007)(41300700001)(66946007)(6916009)(83380400001)(6506007)(53546011)(31686004)(26005)(6666004)(6486002)(478600001)(4326008)(8676002)(5660300002)(8936002)(2906002)(38100700002)(36756003)(6512007)(86362001)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJwdWg3OUtNeUdtVkU2ei9VMnRXY2RNRllOOFBIMUFPc09Fa1Z0d3V4cENp?=
 =?utf-8?B?dG9wdklkaFJuWWJwajF4RUxRREhvcEJuMS9JRkwxcit2dER5L0JtOU84Wkl0?=
 =?utf-8?B?NTBFZXdyak14em1yb1VpbExWRVdwZFozampPZnFDVGE5cHRCNlNsZU5VSTVI?=
 =?utf-8?B?Vi9QWnpzQ05laVU5VWJKWHAzclZMU2RscEZ4b1J4MjA0MmgxSXQyMDIxVStz?=
 =?utf-8?B?a2x0YThPYjlvckpZVTNyMUU4SmRvWFMvaElXRzJIaFZ2QUpoYXMzcGpEUnZG?=
 =?utf-8?B?dWZ4VUVRUWZiUE10TTJtOTdOK2JJSk1pdkl3RmE3NWcwK08rOHZYZ3JVVWxu?=
 =?utf-8?B?UTRHQTNYcHArUVo5Q2Jwa2FBTWhlVmNoZVNCQ0FFNmJpOG9hU1h2QzNDNnk2?=
 =?utf-8?B?OC9Ud0h3VnJ1UHRjVlU3RXVkckpQeC95Sml3bEdITHIydDRBOVcrNlltRTE0?=
 =?utf-8?B?cy8rNFhLN2RmOU5LTmkrWnFJak5zR3JTRFJTbERLS0JwUnZLVzlGUi8zT0pt?=
 =?utf-8?B?cDNQUlFLVFNyVVZPL2ZXT3RrRHVWYTAwaHpxS2UvOWtNNjdNRjEwSEV5U1lT?=
 =?utf-8?B?c1ZLS1hqMHkwV2l2dWF3TDh3QzA2OFhIYnN4V3ZoMTJyV2tHSm1hMTBlMDlS?=
 =?utf-8?B?Ukw2VEF6R1pHZjZVSEZ6bGVmMjhHSGVSSk14dGFSVjc0eHBsRy9VWjBoKzEx?=
 =?utf-8?B?ZzdTd0hCU2FsVE1uV2o2eFUvZWFDSUE0Q1YxWGJtaFZYTTFmaHhPSEpiay92?=
 =?utf-8?B?Q09yUzByTWw2RG15SEdQY2t2K0FuUU1LTlk5Z3lzVk9VQjFXa1BadndoR1la?=
 =?utf-8?B?UTBJby9Nemxic2tnTlRubGwvS0JPQUYrb0w0eXk3UjRWMjh1clg1bkxscTV1?=
 =?utf-8?B?akxYM2lNRHF0Q3NQVnppeGxnMHl1TU5zVVU0L2RDaDJOdWEvR3ZuYWpxelkw?=
 =?utf-8?B?K01QMEYvRDQzUkkxRUp3YTYwMCtZVGw2VEtmS1FJbkdJTTA2V21ZUEJmejA1?=
 =?utf-8?B?RjgydkxGU01vck45RXhMN0E4bHN5R2p2MkU2ZzdzMWJ0SzFmaHVpbWdUaENl?=
 =?utf-8?B?S2xlR0YrS2lSMzVhVk1xNWdqRk5qMWJJWFpYa0VqbG1uTzFIbk04aGYzUkZJ?=
 =?utf-8?B?M2JaTVo3Y2RnMHRTcDFGL0FveEczVnNRUXJHVExrUmtLYmQ2UlFKc0F0elM5?=
 =?utf-8?B?cHprZ05JRk1nMmhkS3RpSU9XckFqQjlna2NrVmdCa3lXV1ZuNFpEYjRNSU1s?=
 =?utf-8?B?ZFd4UWRaZG5TdjZVNlNabWlsbjhvTFR0NExxbGpDWlYyZ3JpeHl2Sy90bFA2?=
 =?utf-8?B?NUgwVktybUNFVzVIUVM3NURacStXRmpiUjd4d0pTSUY2VUJGZXgyOXVmV1hV?=
 =?utf-8?B?S1BjTWRhMDVSazVqSlE0Z2Jhb2VZVGFvcXBsSmNsV0UwYklpK2xIcVdvOXNp?=
 =?utf-8?B?VWVPeDNscUIySExSS2k1ZDNjNmlha0Rua1EwRkM5c2lLOFFEeGdUWGFnRS9W?=
 =?utf-8?B?SUxQZkd2dHBwbUR1eG9zRjlLa0YwNG04a3lCS3gyNGJ6amlrV3FDcUE4NXA3?=
 =?utf-8?B?cTJFVmhNZktqOGsvQ2gvejd5YVdjQ0hmUTJkckoyT0w2bHhaMUtmSEJmN2Fz?=
 =?utf-8?B?OFRPT3d1Tzh0NnRxTDAzTHFlc1pxekNYQkhvdmpXN0tYOC9Pc2NpVUJxenZF?=
 =?utf-8?B?ek0zb3gxZXo2cUJpdGl0V3R4c2FRUmZ0c0N5Y1AxRENYR25xMUVKTW81T0tL?=
 =?utf-8?B?THlIcjhvK0FGSVZUaE5rUUpWeDdPUitxVUdXc2pyd1VCQmx2WWFhVHhBQmJC?=
 =?utf-8?B?TjhTT0QrdlpQV1huOVY5RmlhQU9YNjJtOUU0d05wbjR1TFdxWVZLcTZGdTBV?=
 =?utf-8?B?Y2ZjSHpuV2hUZFgyYitkRzYrelRXTW95UGlDanM2MXBVeDFNVHFXYUFyb1hT?=
 =?utf-8?B?ZGJDMXVWelFGUmRNZEliSjlYRkVwNjdiRFcrVVcvaHoyb2t1QkhMdVpwMloy?=
 =?utf-8?B?UCtUUW5RdVBPWWI2aFlRc0gwTlBlck9XQkNSdWFXN0FudGRZM2xlOTJrU1pD?=
 =?utf-8?B?eHRiSXF4Vkx2MWZUKzdabUFkRkpKa1RVRHBiTllHT3paN1BtaDZJcXFKaG9J?=
 =?utf-8?Q?1fq1Y+GyaHPzepAXbSwfenkoS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be673ff-19fa-4c43-998e-08dbc8e1a9ca
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 16:06:14.7740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7VxRrFwvDrNlBxmpU9o+tSqRYis1MM/aFvI6kOyqcgj4LGkHSlc4BPz/KlbPHKtlapxeBfQx8fidU0rtr7LAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/9/2023 8:51 PM, Ilpo Järvinen wrote:
> On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> 
>> In amd_pmc_stb_debugfs_open_v2(), the stb buffer is created based on the
>> num_samples and the read/write pointer offset. This holds good when the
>> num_samples reported by PMFW is less than S2D_TELEMETRY_BYTES_MAX; where
>> the stb buffer gets filled from 0th position until
>> S2D_TELEMETRY_BYTES_MAX - 1 based on the read/write pointer offset.
>>
>> But when the num_samples exceeds the S2D_TELEMETRY_BYTES_MAX, the current
>> code does not handle it well as it does not account for the cases where
>> the stb buffer has to filled up as a circular buffer.
>>
>> Handle this scenario into two cases, where first memcpy will have the
>> samples from location:
>> (num_samples % S2D_TELEMETRY_BYTES_MAX) - (S2D_TELEMETRY_BYTES_MAX - 1)
>> and next memcpy will have the newest ones i.e.
>> 0 - (num_samples % S2D_TELEMETRY_BYTES_MAX - 1)
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v6->v7:
>> - No change
>>
>> v5->v6:
>>  - Make changes as per Hans on v5
>>  - based on review-ilpo branch
>>
>> v4->v5:
>>  - Fix exisiting code problems when reading stb buffer as a circular data
>>  - based on review-ilpo branch
>>
>> v3->v4:
>>  - Update code branches and commit-msg as per Ilpo's remark.
>>
>> v2->v3:
>>  - no change
>>
>> v1->v2:
>>  - rebase to 'review-hans' branch
>>  - drop 2/4 of v1
>>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 19 +++++++++++++------
>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index fdc1e104c437..e0b5d9de473a 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -276,16 +276,23 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  
>>  	flex_arr->size = fsize;
>>  
>> -	/* Start capturing data from the last push location */
>> +	/*
>> +	 * Start capturing data from the last push location.
>> +	 * This is for general cases, where the stb limits
>> +	 * are meant for standard usage.
>> +	 */
>>  	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
>> -		stb_rdptr_offset = num_samples - fsize;
>> +		/* First read oldest data starting 1 behind last write till end of ringbuffer */
>> +		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
>> +		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
>> +
>> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> +		/* Second copy the newer samples from offset 0 - last write */
>> +		memcpy_fromio(flex_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
>>  	} else {
>> -		fsize = num_samples;
>> -		stb_rdptr_offset = 0;
>> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
> 
> Is this actually correct if less than S2D_TELEMETRY_BYTES_MAX are read 
> first time, and then the second call will use zero offset if num_samples 
> is still less than S2D_TELEMETRY_BYTES_MAX? It seems to return duplicated 
> entries and not the latest entries at all until num_samples wraps?

That's right. If there are duplicate entries in the STB dump, there is
an internal tool that parses all the STB data (remove duplicates, if any).

Thanks,
Shyam
