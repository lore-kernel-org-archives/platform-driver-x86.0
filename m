Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8DAE95A9F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 16:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377121AbjJIQHF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 12:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377136AbjJIQHB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 12:07:01 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66DA92
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 09:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cC5uqnclaTlVsJgs6wx3LQxHI0/i6aSU6BqqW3P3l0Ap6ypxBY6GbuiSUcgucRk+F7QCfNyHoTvT0wD47OWOJlOgCcANQ/wBbpIM2m1q/RKbX1wCbRi4DHJv2lnuKY2Edj2vrf3GemW5FTHqgmt2iBgaIPhX8H1EM1uHu9DMG5mnkmpue0eiSqbXMnPQeEW3+Mz3fwOyV9xIoxk0/i7pq0R3VMcPZryvZV8qtMcRVF5iL7Lve2NDMO9mISe5583xGJYRmnIFW1DIKl6JzF/XXC3bWgpRpjYwRpPayXzSMlzw0QYb6E72Dm262IyupvZFBBXM35LqDFPsDshfydy0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgpR+YS6MK3xDIQt6ZShDNzSbB9qmhZD8E4IgXaBNZo=;
 b=V7STbS8UNPxqgaEUncWsUkpcil0XRFKsAHpgf+OLlQwFLuVC3ml7DVGCwU265w53WYDQx9NI1C2hxm+xFiOiH80RkMYVSrSLFwj1fPv4/RwALtrQLnwZWr/vYIsiQrSSXWmEHckUjeeUcFyzb7ctHF0RmYDBs48wn+t/JEp9JqYGv5YKpeAsPNim9Oct5biCJ9Xt8BYf6nCK3Rptq349HGyBaet5DZma8KFaq8NsYwjRnB4XBkxQxQ/yd8RymfyWhgJMl1pyHtRVDbu2p8TpDVSz6mI8mPgoER8PRwnjJ6lnbzzh/5YM1hSmqMkj+UTUqZBOK/YGzECki6jTQxnJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgpR+YS6MK3xDIQt6ZShDNzSbB9qmhZD8E4IgXaBNZo=;
 b=Hkqyf3T/xoIMZ8xZBKsfaQ08YkNrKyJ+ND5zVlYD/lxUBnxanvJGW60+3CTGa04An+bVFtCdpeD26tZwp5if1Vdtv8Nwh6t+nUQiQqe0b/PLRoUn3VfyHChN5fpD/C7obrigAtZ00k//jMZcyew9lqYOe/cCCEYqeSgc9f9SOsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 16:06:57 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 16:06:57 +0000
Message-ID: <cc3369d1-0953-4cd3-8218-8e77637cbef0@amd.com>
Date:   Mon, 9 Oct 2023 21:36:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] platform/x86/amd/pmc: Use flex array when calling
 amd_pmc_stb_debugfs_open_v2()
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
 <8bb675d-8bbf-c6cb-cec1-f53910ac673e@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <8bb675d-8bbf-c6cb-cec1-f53910ac673e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BN9PR12MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: 88eece6f-8b62-478b-d160-08dbc8e1c365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sDp7VxLbfgPK0d6Qzjh59i6IkzTac/lUJalAhir+HLsZjgDuuKtrp2I7RFMs9l5oy8sBwYbsAbx3KgEQRGb1i+5d9VLHLotOJHN/cQAvSsAqDEKa4fRP6gMAkwNAVei4mH3y8oE9PsiItWRSMBF3D+8jIQ7yj5pBn+1Yn5HllbJ4ts7LhK1sCdvFDFPnXfWsYIlJORK6dQgOPeb4v6sqx4fZv3fx7sZAqXc9+DG+PP1pyLWykE8ite3Rf1b0UGlPhSSreO5XkFCoy8JmDgxvuhc1h3RQLu+/GC4w/ugP2EdP5laNpufK2Fq+YVafTOvb2iodvgmGrGTmY3n6nDdZdUHYt08LMU3epklEhhwTFjg1qy+xPp75tmgvId2yucbPdQrzheZLMqx0GZEeEcxUEqRxTS9BMInQ9e2pF+3ttzpy0vlCGyyAlUm+C4/jerhltYH1s8i3xCmDBjNV3zrZUWQIm8nxRM4tW2UE+wZXzejGy9SrJyX1dsCWlzr+ZdfoAhtXmQ0LFQH6V936oNzgEkrTJeNkdpUqA5Q3KWNyFwmcc+//4+vYMbNG/Pt7tZYan+ZO2DSHZmknXrm+vrjoDKiNlDhjv+S+8SSJY/a92YoL/II8v7f8YENaz66ftIz6xKQDItUNShD7haC4xiqtbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(53546011)(6512007)(2616005)(6506007)(41300700001)(316002)(478600001)(26005)(83380400001)(66574015)(2906002)(6486002)(66476007)(66556008)(5660300002)(6916009)(66946007)(4326008)(8676002)(8936002)(31696002)(38100700002)(36756003)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk1LWE02OWdZZ0tFNVdWRUU5UDh2UThqbUUyclhJVjd2bUN4eG9hSDV4ODRD?=
 =?utf-8?B?U25FNEFDNmNFUFhTVUkzMVR3UVVONHdnNGRLYVBOVDQvZ0k5b2VWMkU1TFIy?=
 =?utf-8?B?VHY4bDVTRnF2ODhaZmYrbEwzUWpqQW9tMVI2VFBMMVRDb1crc255QnZXeEd3?=
 =?utf-8?B?SXJmTjBCMDZVZEl4T1VrbVRoSEZsT2YxcXVuelp0WC8zUVBjbkVmN3MwQnFV?=
 =?utf-8?B?Q1J5ZHFuU0I3TWhkNnNmZ1NScWpidjFqZitJZWFPZEdnM2d6SGFMUDNaUGlY?=
 =?utf-8?B?SE52U1ZDYS9MeWk5OElXakhDcjAybkdacTJnbzREMlVCeE9WZVMyblp6emFq?=
 =?utf-8?B?ZHN3QXZVbVBTNnhadkY2bDluZUJBQnl2MlM4OUpNcHhRc2lvcnhPT05SZ1lt?=
 =?utf-8?B?NENITmlJZXdsN2RuNWhObVdpekMwYXBPTEhNWTNjcE50RzVkYXdwY2RsYmhB?=
 =?utf-8?B?SExoUU9VMHpRN2wzTS90aGVzNmZMWGlFY1Q3RnRkSXRFVnRWMlJia3AwQldX?=
 =?utf-8?B?aWhYenpibVNRTVpkVjBscmZVQkZjRDBVUlNDdERhYXBPRUZNWFYzakQ2VmxX?=
 =?utf-8?B?ci9zM0pxREMzOXVVU1NyVEJKQmhCQVhXdUpqZTdoaWZhRTJ1ZDU5RTh2SFNV?=
 =?utf-8?B?aWpoWDN1ek9RN2JoOTZBMkJvMy84VDlnZCs1aXRaSWJ1MkhXTjhaL2JqS2FB?=
 =?utf-8?B?TTNoT3FtMzFJc3RVYXNhU3RMVE9zY3Y0NzhOTHlSSVF2SU1vYzNSM1NVUXdO?=
 =?utf-8?B?enJ3NHJDbWFXY1dBdFd4QmRWTnNPV2pUSWFZN1JqTGZ4dk5BRTBxekdnbm8r?=
 =?utf-8?B?VW9xVy9oYWVYcFgzU1JqaXFxaVc4dlRQVHhLcitFVDJmd0F2bDhaek92S1Nr?=
 =?utf-8?B?a1RaZEl4TWgvdlZvK0J5QTZLZXFxMWtYTWZWWXpUVk8wMDBJZFpwdXc4U2RI?=
 =?utf-8?B?Q3dtZVhUM2xRdGVyUExvSjdVK1k1TjRjMklpaVBOMVZaTVZEZ0k0dUxkNDcy?=
 =?utf-8?B?enNNNDBUc3NYV1ZqQytLaDc0Rlo1bHpJU2JMaXhqKzFyRVB3OGpXRk9vTk1G?=
 =?utf-8?B?alh5VEMweEppaHUyYzFobGtLWTdvbmhtR2Vzd1VNNXpnamRtd3ZQSG9aMFU4?=
 =?utf-8?B?RFd1aUwxNnVqY3B2QWRQRzRWd0RsTTZtRDNSbUpqMTdjY3cyRkJZWENaY1hC?=
 =?utf-8?B?WFVEbXhwRWRpRnkvOE1QRlVSTzEvYkM0TEx4T3Y5YVAzSllyM1hxdWUwMEdK?=
 =?utf-8?B?UUZhRzRQM2JMR1NObm9NUVdVbTJQUFJkTk90Ym1SQnhhUEV0WHdMWncrZDhJ?=
 =?utf-8?B?WmlCN1hjTUQrNkNnTkRjTVF1QjliMVNZMmlQSSs5cm1GNnNzOS83cTM0cjRo?=
 =?utf-8?B?aENlaXRidlBTdXp1SHZxYzVNUG5Ib3Q4MHpBenB2QU9RNkNCbjFUVDhBNUdo?=
 =?utf-8?B?d3hCY016Z3UzZDljMzhuT0l0MC9ySXhmWmdzREl4MHE1N0FaN0QzWFE1aDFX?=
 =?utf-8?B?Q3c0TS9Xc1h5L29maUJPaXZWeVF3MmxkeGdmaFVFZzF5dFl4R3ovR0dzbGFu?=
 =?utf-8?B?TVR6Vk1TdGRYVUswOFRvYUl5VDhnMHdZTXlHQy9MTU0wT1JmbGxUNWR0OEhT?=
 =?utf-8?B?ekUrVm9ocnRUaWo1cWpNZ3lVdytzd3ZkcUVrYm5lRzNkUjhNYmM4VFpRWXlR?=
 =?utf-8?B?SHNIUWpJZzZadVJoK1RqeGhPcUJvdUJjM1VLU0pyWmdINTl1RkRvSjhRZFlu?=
 =?utf-8?B?T3RvTTRqelFERTVEK0lOWHJFVXhHVXl3Q2hKTG8zSGhVMjg2VmJHVm93N3dW?=
 =?utf-8?B?L01ETUJKZnlSbDVQOUpOVVdnMlNtUnUrMVhQQzRreUgwZWYyNGhvMWVrdFI1?=
 =?utf-8?B?c0JVY0R0ZEd1VFBId1MyZGxKUlptRVY5MzRONlNxeWlWeHM1RGpxZmlDK3Qv?=
 =?utf-8?B?SEYwRDEweHUydCt0cEw4b3VlTkFGdVpnRGhsUENvSXJKb09SUEo3MFRoN3Qw?=
 =?utf-8?B?SFFrNks1bWVKOENGc2dTL3VGbGV4alZBRk8zVUlvVXpYUjFyRExDcFdYd0dY?=
 =?utf-8?B?ektZU0FpMHF6ejUvV2VOTlNSL3ZpSWVPaWxuM2pOZGRTUk5tcHhSTkF0TTlG?=
 =?utf-8?Q?Edvz1rPa5py+3r7gaYTv15gv9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88eece6f-8b62-478b-d160-08dbc8e1c365
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 16:06:57.7254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDjffSg9qlxJvQobge2PZZccnt4H6VgxlL7EnchtTNYDeqnfcnn4K9vThXWUMRA5hlmiUErimDQL76ZCzNRUuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5179
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/9/2023 8:42 PM, Ilpo Järvinen wrote:
> On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> 
>> Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
>> be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
>> a process holding open another fd. This could change "fsize" to a
>> bigger size causing an out of bounds read.
>>
>> Instead create a struct with a flexarray to solve this.
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v6->v7:
>> - No change
>>
>> v6:
>> - Handle release buffer case as per Hans remarks
>> - based on review-ilpo branch
>>
>> v5:
>> - new patch based on comments in v4 from Hans.
>> - based on review-ilpo branch
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 30 ++++++++++++++++++------------
>>  1 file changed, 18 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index c92dd5077a16..fdc1e104c437 100644
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
>> @@ -264,10 +266,16 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	dev->msg_port = 0;
>>  	if (ret) {
>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>> -		kfree(buf);
>>  		return ret;
>>  	}
>>  
>> +	fsize = (num_samples > S2D_TELEMETRY_BYTES_MAX) ? S2D_TELEMETRY_BYTES_MAX : num_samples;
> 
> min() but that will only work when you add U postfix to 
> S2D_TELEMETRY_BYTES_MAX (I see no reason why it couldn't make it 
> unsigned).
> 
> Make sure to add the include for it too.
> 

Sure, I will address this.

Thanks,
Shyam
