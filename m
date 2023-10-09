Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D45E95A9A
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376375AbjJIPK0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376395AbjJIPKZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:10:25 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28B4BA
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mg+vDjv9l5TqrTOOgKbulyK58PnNYAVRXXMMFO+CdlqT4Ql3ENtvX6CeB7M2D2iRThEAGS5cWyHQ/iDhID0Qf9tvFwUfsB+ppH4WyCu7U9AGHIbPcnwqPcw50r6vJWUTyJKT49W33rIGoOEMK/zLJDpO5+zDI8CYxt8VB7Lxh5w3FVkEnQ+8PXS20XQq5tnsNVNHbrBMJWKu740eE++ydkSRuXC61kjUsCquIv98IIPlF1GC35vV96EA+gyUbQF5WUTMdWh9pz4DyinkVBlixoySNyk8NYWT05CqfBO26pwO5pEUMSjZApM5H2A9qz7qVjIfANic11IXYzNCD0pN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6/ewLa38sgJq43iQemCfeJ5PCwdd2AvdPW+wqQ72nc=;
 b=Bb+6xM6c6jcIlZ9VX1rXBGeIQgoIBybboY58/elWQSMumOy36Ir5lD3U/tEvP/d+tMsr7vty1FaDcLpB6CNfV5vV2UnGM91PLh+PUXZ6zWRmVd3RhG5oocuJYRanASJAc5mL847FtL9CQqQUsNu/Dn8WYHvf4FnnnhESyP+m6iDemJtFwZ1hhoMvXPtqxVLbo9eUmtQV9LgCKKuZ3ORGUP/B1iVY2G1PVjTzyyUgJPWm8xT4eL4SWxjhti1tmrGBIaZZHm7VzJGCSWwUShNf+QJfhnsVq8DwTwDXjBv5tj2SFGb+7QW1K8Dtiv1SOk2iPZCUnhHhDt9Wb/2styrCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6/ewLa38sgJq43iQemCfeJ5PCwdd2AvdPW+wqQ72nc=;
 b=WSg+S3B25whjHlhfuDleHxkO8SjP10AW3/WRaO1qig106f1X0GgK5H0yz9uhziL2YFijvOPLAMxj5HhLjzaXmE61OIiegmgv/Q7FPW1fJQQRcGiIZUYIYQwuzxgH0B+pa9VU0GeRDdTFhpsDQ+BD7JUqeaVIUwee92GCwmMfRsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CYXPR12MB9427.namprd12.prod.outlook.com (2603:10b6:930:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 15:10:20 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 15:10:19 +0000
Message-ID: <819ca2b6-ba97-4c65-8ffb-45f02c43fd6f@amd.com>
Date:   Mon, 9 Oct 2023 20:40:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
 <20231009141254.22114-3-Shyam-sundar.S-k@amd.com>
 <40ffb29-6b4f-b72e-2e1e-7c5ad34dec1c@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <40ffb29-6b4f-b72e-2e1e-7c5ad34dec1c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CYXPR12MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: a4251cf0-1cbf-48e8-aedc-08dbc8d9da17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUhWjzvdcz2kimT63z46JQcKkC3JfhxYxQMg86R41Si79F64qPxTOEMUG1bpAvqWEV+EMxM79aFvt2KWsYBFyyIj7H+rFk5LTvsfjMhcEgalv1192wjUnHBkO/T8wymNiFmwtSLsILWgQAzn6GH+UDgpsgvVrW97lldaCpRh39fw9b9jTTPo0+YkRrfMOZ+/KLTJyyArMya6buy8h9z2hsLKegrKk2aXoPJ9IaKrkS6s6+n1f9cV/e6/iQmUkCfN57PnqMqquyHnfWWFifj8IX3Xrgb2yIClc8hyZ5kko3fkje0CK3dTWfH/1noWeIqefJeteZ3wsDnnwShQ/hs7vjiD5kbdsFGUjrxDfSPMen+xoy1OpNabdj5w1ousO3nNSaHlIfLOiO8PiabeC5xb1abbd9/yRmxsbZvhhjfR9xtL2IJe85nYy3Hm5oUse8W5SVCPkPRo75KNzw8BeSV/6fX7f7x+0sHJlw+tvU15qZOVBIj6FSq6z1UaYD6zu3APYqTqS1KTjGtnJBefzGWd/3wWgIx4ccS7ereBDh6T0bJ9oL5/OuwlXpghjrktFSFhaOa8A3J+iHvrDepGBHPFs00Tz8FrpX+NmHGGObeZqDVixtYlDzpynqPktB4blGDU+O3q9zyB7JhnXSQfQLWvMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(53546011)(6512007)(2616005)(6506007)(41300700001)(316002)(478600001)(26005)(83380400001)(66574015)(2906002)(6486002)(66476007)(66556008)(5660300002)(6916009)(54906003)(66946007)(4326008)(8676002)(8936002)(31696002)(38100700002)(36756003)(86362001)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNHSGhhQjdmb294ME1JOG9oSzRrZFg2SjRGaHJKcFhpWS9ORm1hcCt2TDNN?=
 =?utf-8?B?U3N5QmZIR1dDTnZFZlFzdEcrNHlJaVdvWlpRVXJNM1FYSHVWQUMzU1FyK0cz?=
 =?utf-8?B?MTFFNG1LU3pqcDZtTTNmV3cwZ1hXU3ViZ01YQ2tmL0kzNmEzQ0c4MEQ2Nlg3?=
 =?utf-8?B?VVY2L2Z2bXhubjdZK2xtMEVUZVpqY1UzbjdEdCtkVW8vUk1BOWtncy9vdldR?=
 =?utf-8?B?U2tsSVBUN3M2WGZxVzhwWCtEL0lmZTFZQ2l5RWMySFh0T0NacnhJNnNMWEoy?=
 =?utf-8?B?QUNpQ0VoL1hEYXYwMFVtQmFjMzNILzNiMkszb2tUS2JrNlJBajFURFM0Mm1P?=
 =?utf-8?B?S0oxVDdFQUFVUmhtc2YyZW9SejRZbmZxMU1wZmE3Y1lXNmVDdmRMY3dHVTN1?=
 =?utf-8?B?a1JlSmVFUDNCMGRCMFd2Q0FBeDdIWkdEdFN5aFVyVlJVeUxsMDVBMXVlN3gy?=
 =?utf-8?B?MGVzeDFJMzdLRE43dE90Q1NQUncrcWpLNjRYQWZrMkcwemtiWXZFS3BVQ21p?=
 =?utf-8?B?VUk1UHRrZzZqWWFlT0ZpVVJJdWRvbGs5QzM0b3UxUTVsbWpuRFo1NWk4SzRW?=
 =?utf-8?B?V2FQQnRWMUU1bi9ReVlSdTJtY3QxdUlRb092c1gxV2lnTHoyeVoyR2lRcHpH?=
 =?utf-8?B?aXlETko3a3hZd0ZJems2NVFER0xPZDFSVWh4MEtRRXpXaldRM0E1TW5sSEt0?=
 =?utf-8?B?UXJwTmduL2hDczJjMVhqTHo1UDRLRlUxYTFHVmxTQndlZm1QYnAzUEhlTXIx?=
 =?utf-8?B?U1JSTXVCam56c1M5d2VBNGQwOE5TeG1IeFVZcnFsaGFWN3RzYlFsbkRmeU5C?=
 =?utf-8?B?ZWZEczl1Y1Q1b0IxSFZWcS9xQ2IwWTFnUmpWc2gzeUZ3Q0lDS3VGR054S2ts?=
 =?utf-8?B?SVB3S215bktaQmYwaUNvZmlpYnE5dmhZSm5Fd2xRLzRFZHVuelFOWlVuS2FW?=
 =?utf-8?B?dW4xaStVZTA5M1FKVmlLcVplYkZqMUgwb09mT2U4SDR4ZHZIUElRMWRKTUs2?=
 =?utf-8?B?MDlULzE1YkMrZnBoaGQ1ZTFVS2RFUytPWTRIMEZnaThhWGloREdabW9xQ3B6?=
 =?utf-8?B?QmptL3YzL2tpZDM4dEk3Q25HM0h4ZGxiNXpJaExqYXJnSG51OHNGd2JNQTZG?=
 =?utf-8?B?THh6VUw2NkJCRU9QTml0UG9qV25JNHpaZHpPcFV5SldLYVF0V05SVlZWRFFz?=
 =?utf-8?B?N2M3ZHRPd1ljQ0JHQzhvbDc4cUptTlo3T0swRHBtQjArdldtRnBJbXhTM3Mw?=
 =?utf-8?B?Wm0rMEd1YTh2SVZiRVZ6YVZqZVJ3Q2l0M3JsdU5tV0xwNUx2QVdjdUd1aEp1?=
 =?utf-8?B?Z3JKcSs5bmEvVTBGYXNhNkxqN24waEV1VWoreXVWVE5oei83VkUrNzEyeGpV?=
 =?utf-8?B?OS9xb1pwRTNOcTA4R0lQcDRlczBBdUhoaG9sYjN5UWtvYVNVb2RtWHJsZ2Z0?=
 =?utf-8?B?a2IyZGxFWFpKYlRmenJybWdPV3NQMytVbnJIY3U4YThzem5Ia3QyS2owL2I0?=
 =?utf-8?B?L3EvUGI2M3k1bXBKUGp5TTNUQmFsbk0zREhxeGdoQTUrMVR1K1NxdGVTUmVH?=
 =?utf-8?B?SkdmOHNmQjVocTc5SFZJSlBXejFDN2FIY1pheFQ4RjZvZldHc29sOTJxKzJk?=
 =?utf-8?B?dDUwN3lhc1YyQ2t1ZStMR0NnUWdZNUZNWFJ2SDBzYnV0V1R6SXpHK2g2WXdQ?=
 =?utf-8?B?ZU5MTm1yZS9iUVFiWFBGdjYramNENElyQmorY3Z3ZndOdDFZY1B2YTBmVnVh?=
 =?utf-8?B?a0U3NDg5WnB0VzhYRnFWTlE0WUFidTJtN2RuanNqODFWREVrY0lzc2tWNURr?=
 =?utf-8?B?b1dMSDJFVFhCeWxYOWxoRFhXVTN2RElXN3I3clJQNlVxU0xHZVNJTElOV0tG?=
 =?utf-8?B?bmRDSGo1S3RlcnQ2R2U0R2x6MkUrYURCeXVmcFpWemJOVDV1ZXlEcFp1c3c5?=
 =?utf-8?B?dzMxSTBvSkU2YmhEbXF5Vk5BMHh3RlVPZjlrdzRzVVh0OXUvV0J0U0N6Szlh?=
 =?utf-8?B?S2tha2xXUGdXcnNsQ1pRZTdNbDYySFdKNzQvMTQ5UkpiSy9yOENZeXlxbWwr?=
 =?utf-8?B?QkFVRUVHdjVBZFlZRDMzcjhhazR6WVozUXpNcnIrcHJ2bVlsZGVGMUp6VFlU?=
 =?utf-8?Q?eXu+NxUgJ+difBJmBU+EVsrr4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4251cf0-1cbf-48e8-aedc-08dbc8d9da17
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 15:10:19.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnEbHzAI1lUGW6DZi9pMhA9MlP3t6wHNcurMWPjFXnXfAYmoJI4tTAgtxucpjoDFjyObmVOKcUJIpwH9++n/pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9427
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/9/2023 8:36 PM, Ilpo Järvinen wrote:
> On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> 
>> There have been instances when the default size (1M) of the STB is not
>> sufficient to get the complete traces of the failure. In such scenarios
>> we can use a module_param to enable full trace that shall contain more
>> debugging data. This is not a regular case and hence not enabling this
>> capability by default.
>>
>> With this change, there will be two cases on how the driver fetches the
>> stb data:
>> 1) A special case (proposed now) - which is required only for certain
>> platforms. Here, a new module param will be supplied to the driver that
>> will have a special PMFW supporting enhanced dram sizes for getting
>> the stb data. Without the special PMFW support, just setting the module
>> param will not help to get the enhanced stb data.
>>
>> To adapt to this change, we will have a new amd_pmc_stb_handle_efr() to
>> handle enhanced firmware reporting mechanism. Note that, since num_samples
>> based r/w pointer offset calculation is not required for enhanced firmware
>> reporting we will have this mailbox command sent only in case of regular
>> STB cases.
>>
>> 2) Current code branch which fetches the stb data based on the parameters
>> like the num_samples, fsize and the r/w pointer.
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v6->v7:
>> - Code simplication
>>
>> v5->v6:
>> - No change
>>
>> v4->v5:
>>  - create a new function amd_pmc_stb_handle_efr() to handle enhanced firmware reporting mechanism
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
>>  drivers/platform/x86/amd/pmc/pmc.c | 32 ++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index e0b5d9de473a..af6d400193ff 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -53,6 +53,7 @@
>>  
>>  /* STB Spill to DRAM Parameters */
>>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
>> +#define S2D_RSVD_RAM_SPACE		0x100000
>>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>>  
>>  /* STB Spill to DRAM Message Definition */
>> @@ -165,6 +166,10 @@ static bool disable_workarounds;
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
>> @@ -241,6 +246,25 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>  	.release = amd_pmc_stb_debugfs_release,
>>  };
>>  
>> +/* Enhanced STB Firmware Reporting Mechanism */
>> +static int amd_pmc_stb_handle_efr(struct file *filp)
>> +{
>> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> +	struct amd_pmc_stb_v2_data *flex_arr;
>> +	u32 fsize;
>> +
>> +	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
>> +	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
>> +	if (!flex_arr)
>> +		return -ENOMEM;
>> +
>> +	flex_arr->size = fsize;
>> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
>> +	filp->private_data = flex_arr;
>> +
>> +	return 0;
> 
> Thanks, this make much more sense than the early versions!
> 
> Just one confirmation, is dev->dram_size >= S2D_RSVD_RAM_SPACE always
> guaranteed so that the fsize never underflows?
> 

Yes, that's right.

Thanks,
Shyam
