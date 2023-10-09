Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72756E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 09:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346006AbjJIJ1R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345866AbjJIJ1D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 05:27:03 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC8D10F7
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 02:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhsTwylSt5+Wp5Svqr7Ufw3iZnuxZ3tZ5o8Ml2Jbv+oo975Gfkt2x83EsmYW3z5iZ6i3VWBsSykLZ/XB3yf5yHEwOwfU8fASCXpXrk+QBJDwKykHqr3NBeb1RqrSvS/vxNwQRaS6hDruaKZKV7Pjt1sh7+CqId7QoxMMmTh63NSR4oOURBr16AtiT1i5ruviGE+hU+YUsv5WQn0sRYp9MfBh3oCzJjbihJEsz4tN3K+ePYWWauwPlM0axmAeJcs5jlMlqsbsXmXF+K/B0W+oSRYWqvTNMkas8XNQq6h7D5tDayr1XTK+F3J2Yl2PCL3nr0q+qA4xpM8AlsjYGNzNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmbunDzPZhbv16EqwEEWyAX8l5IbeweZ6UvoCKoMjtI=;
 b=mH1na6VYIo1E3j7D8Q6EuBtmIqBcxVX8sDCfiRHmjOtfCOI/fP/VtHuXyGqnXbnPsgqv0BNRxgMfrkkI3GduvcVIgfDZadsyMrU7UxAMhyB2OWVYBVe6DqZDrFT5p2r2Df0643S66Kppft5UNVDsyOEHWVXm4sFbnt2lO244WmC5WcroQvveBMNtBGV36weKp2gVIwt34N+KyKYGbyv2//h1uzjAm5zAK2/u4/tbMNoQyul0hX1XI/O3rKdzQNPCZCyaB1Ih7SlZTrTrUdlbW6fZSUjDL+E00OYWU7PePdZVQL0mN5/F4hSngl1N3DKHmXphWE8/YZW6zk0y4ampgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmbunDzPZhbv16EqwEEWyAX8l5IbeweZ6UvoCKoMjtI=;
 b=C8sv1XBQtmN4oZKImGBvAkMCFUmzTwioaANEcvNYSp1QMos4SRaysqW1jmDGp+sGNL7vjDdu8BzuiNOHckiqRzoMEqSEL5egLFblXVAu+1aEvQEnoddi1Lxd6n8ooRoyYHleUmnWIAftBP+Co6R+wvNsBKzVv9KFhTs3WcJ7s+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 09:25:52 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 09:25:51 +0000
Message-ID: <fc58ccd1-e7c1-4647-bca9-7bdb0c63bfc9@amd.com>
Date:   Mon, 9 Oct 2023 14:55:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
 <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com>
 <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com>
 <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com>
 <5c6625ba-c2f0-6510-c1ea-3005a9c16e14@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <5c6625ba-c2f0-6510-c1ea-3005a9c16e14@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::31) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee29615-7f42-4c0f-db53-08dbc8a9bad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0JSpA7qSeWfIsAR3G22Ucx4T5569MmqlILtFvX+Blq0aVK9qtigmyu1B+4gdSLURqhFWmCC0VyfU13oXF4/69fGM1NXRsGr7CDPrK/8Oe6xjpzC3DUY/wJkKuVx9hRVLOM6yfO2f2/I37PSIsgSYMtQ/SiTunR94QEm9tiB9tvIVXnlSL319C39VC7UZkQCBJtEuVDwDp6eBLgSqkNZ7D42YgecC+a5j54SX9K2Q7CbT3AEnXWQ869L98en9oZYjQIp7FiN+gnuqLxcrQDIAoeozCxNiLmqVqSlH+zolb3DVSEriaHvqqojC5Urj4Wo9p5q6o+S1aSNhB4VHb4dQAbs07epvRrXkNhobn5mMYLVcYGvX4oOY2xZkKFvNHDWHi1qltQkXMjTwqWpNfegcdzev96pCmEg+lADxtCzrRY6l2JL/hAco5nJ2mLzCZ1TDGi5i7AVJjJQNO8ryUgYzn11uVJw3FEJXqkCPjNhpUlwit9AwXbhOVoMPgyQXSXagzkqGCZyk+Rh65bZmN8r4BBm/DRXq3GStxn5a/VeWy96NGpmLcyBOpZMKLaEM4B8EyiSSSOwfnCyeXBORpzBNsaCNTQy2Vt0T51wHFVs/guXzgEvJGUNA5LqWZNqxROgKHXdEIzhIkYPH9iX9i0U9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31696002)(38100700002)(86362001)(36756003)(31686004)(2906002)(6512007)(478600001)(6486002)(30864003)(41300700001)(53546011)(8936002)(5660300002)(4326008)(8676002)(6506007)(83380400001)(2616005)(6666004)(66556008)(66476007)(66946007)(316002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDNvK0dvbjdFZWU4Z0QwbU1hcGNrS05RZmpybU1DT3E1V3dIN0g4VlltaEtt?=
 =?utf-8?B?NTh4Skkra3dMaHJOVTZCWkUxdzU5SnROVHEyKzRJZFRhL3hQMFRIWnFCbHdo?=
 =?utf-8?B?V3NuK2hjdXh5QklWOEgzdnVZNVE2aWx5a2UvL1JjTFF4UDRPZW0vU2RXZTJP?=
 =?utf-8?B?ejJOclNOUkJZU3hjbUplWHY2ZlRMR0w2and2L2hPMXFwYU9uaStTU3M5TVUw?=
 =?utf-8?B?emdiOGRHUlRsZXErQStjYm81bVZYSXllTldXWUhZU3c1UThTbjFwRnhWcEVD?=
 =?utf-8?B?SlVnRTZNTDFPZGx2Qm11Q3lwRXZGUlhLK1NyT1VBQjNCZTlRSjV6VC92d0F4?=
 =?utf-8?B?YnFYVlhFNUt4enJzV2ZMVzl6V1dwUEZsVVNVRnJhblhyTXNyeDM0RjVjNHlM?=
 =?utf-8?B?cE1NTDZRd2ZzZWlwNFBjdWFwMWdMMUxML1hUa0REY1lOWHFNdVp1dEQyYjZy?=
 =?utf-8?B?RmlvSW1wcVNab0xmbWlTWkVEb2tEUWdmeDhybThWQVB5Ym1ha0x0SkpJZDlm?=
 =?utf-8?B?UGhCZnZyRkVVZXNlZXZsQW1Rc1lVOTdIQkI5NFdKTFdxREVKck1hTW0xZTdt?=
 =?utf-8?B?aWtiZW4xcTN6RXg3M2pDK2U2N2JSbDZKL3JjQ0JXYklod2J6Zlp3SzdYMkRM?=
 =?utf-8?B?UDM1Rlhyd2V2Yi9XdHpFaktlV3hYWXY2YldqUnV4OWt3THZOdWtLZDBhd29Z?=
 =?utf-8?B?WUR3OWoyYkU3Zjl2TURBcUV2aDFjN1o0WGZ2TTlnYVJ6ZDNvdGJmRWVRdHJL?=
 =?utf-8?B?VkE5WW8zNjFHcE5vUWluazJhZzdDbnl6WkcrdElJcTVmRktQTXBrYlF1RExn?=
 =?utf-8?B?K3ZmcjU1VW5GejBOQW9NdnQ5MUQxV1ZpV0Z4ZEkwcUE0UnpUN2VWb2hseDdK?=
 =?utf-8?B?bFJRSkdLMjhHcFpzNWdYS1BsN3JHaVVuaGlKZ2Q0dEwzOWh6d1dkaCswV05z?=
 =?utf-8?B?UzdqTVdGNXhhakJ0MDBxQzh4bjlTY1lmdSsxMWFmNTBUczdGWXBnUStvMFI2?=
 =?utf-8?B?enpqcU4vYVN5bjZVaU1VbWpqWFA0cjhsVXVDdDJZK2tHL1BnUEJKc1p0ankz?=
 =?utf-8?B?NnV3WmpvZ1l6N1lCUmtUbE15VEhCTC96MmZEcUZnbzRWZWxCUHM2MUJJMlRr?=
 =?utf-8?B?aDQvUDJLa1RrcmlmTFMwdGJKeWhaUzFPMnN0S1ZxTGl2dHgwajQvcGJKU1Rp?=
 =?utf-8?B?UVI1dS9YVzdlV2thOWljRFZPR3lyMG56VitWNTNxNVk3Qzk5Q1B0WGZGUG51?=
 =?utf-8?B?N2xKYkRBTnJDSks3eUs2L0tJaUE2WTFyQTdxYTNCSUFRUE9ldHF1ejFtRkdJ?=
 =?utf-8?B?S3lndUtTZ2h2MDZ6bEdFMnY1Ykpua25CcWVJUWphcEhQdFJzSUZFQ2cvQ1Jn?=
 =?utf-8?B?SW1jZktTRDVGb3V5cTh0Sm1weGlpb2llWkJQWWp6YUd3RzVmdnMrZFVIMW5t?=
 =?utf-8?B?eXByM1AwZXJuSEhFMjBtSTFQaVRyMkRuNWxsZDM5TFVYYzlEa0RzMEV6ZS9z?=
 =?utf-8?B?b1BlU3VBQk9VTG1XbURRUXltbGkybnhObWJUOVVuTXJ6OXN3QkkvSXFERDRD?=
 =?utf-8?B?YnlMTUR2ajJRTXR0Z3ZyUjV0MWkzS0RmNmkxZDFqT2k3V0owRkdnRWRaMUxi?=
 =?utf-8?B?SE93eUQzZi9wK0Zsazk4ZW5FUElQOTF3MDc1WW9wQS8wWGVvdDRjV1NhMklY?=
 =?utf-8?B?RUhrd1YzK21ZdGJuNm5DaVJnWkdWTW9EUWNLRzFRRXJEREQ3cVJiTDFDUERU?=
 =?utf-8?B?WUdUK0tzS3JkVUpGVTFFb1hJZFJmRTU3a1plOUQ5SUNBdVo5ajYxR1JhQnpD?=
 =?utf-8?B?RnNIdEc2VUpQb3VqOU5GelFjTEE5S1BnOVJ1L0x6VE5taHpickE4NlQ0bUdL?=
 =?utf-8?B?WE9iTE5FZjVXbTVxYVAvUGZjWCtmQnJ1N25tMzBlaVEzWTYvT1RTc0xDM1B0?=
 =?utf-8?B?S09CTHlHTGk0ZXZEVkw2bWpLb1EwdFVQYWNRT2hvdU0wTFJMYlAwZkwwMm50?=
 =?utf-8?B?QlpvZ0daVGU4aFV6TGxqYWpnQnpyNlhmOHRyQ1NDckhkVHJ2UFpibzh1RWpT?=
 =?utf-8?B?eWlnazJIdzRpcjlqMmpXeHBwT2FCVXNOZFRMUndVUGhlYTlLcXR3SVdrY2hv?=
 =?utf-8?Q?xU0UruTqnT2P52ar3QVX/C3aS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee29615-7f42-4c0f-db53-08dbc8a9bad4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 09:25:51.6016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZHPDqaYgoDeJ3xc40UUAzd14qCzaZXo05uLlleTMKQ8VHihuNP2YSwexADf4lJHxT08SvWvnk7TJEMGpqa1sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Thank you for all the suggestions. More information below:

On 10/4/2023 2:44 PM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 9/25/23 12:48, Shyam Sundar S K wrote:
>> Hi Hans,
>>
>> Apologies for the long delay.
> 
> No problem and sorry for being slow with replying
> myself too.
> 
>> On 9/18/2023 5:57 PM, Hans de Goede wrote:
>>> Hi Shyam,
>>>
>>> On 9/10/23 16:20, Shyam Sundar S K wrote:
>>>> There have been instances when the default size (1M) of the STB is not
>>>> sufficient to get the complete traces of the failure. In such scenarios
>>>> we can use a module_param to enable full trace that shall contain more
>>>> debugging data. This is not a regular case and hence not enabling this
>>>> capability by default.
>>>>
>>>> With this change, there will be two cases on how the driver fetches the
>>>> stb data:
>>>> 1) A special case (proposed now) - which is required only for certain
>>>> platforms. Here, a new module param will be supplied to the driver that
>>>> will have a special PMFW supporting enhanced dram sizes for getting
>>>> the stb data. Without the special PMFW support, just setting the module
>>>> param will not help to get the enhanced stb data.
>>>>
>>>> 2) Current code branch which fetches the stb data based on the parameters
>>>> like the num_samples, fsize and the r/w pointer.
>>>>
>>>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>>>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>> v3->v4:
>>>>  - Update code branches and commit-msg as per Ilpo's remark.
>>>>
>>>> v2->v3:
>>>>  - no change
>>>>
>>>> v1->v2:
>>>>  - rebase to 'review-hans' branch
>>>>  - drop 2/4 of v1
>>>>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
>>>>
>>>>  drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++---------
>>>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>>>  2 files changed, 32 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>>> index 443bb78ea5f4..7e907cb50787 100644
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
>>>> @@ -264,20 +265,36 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
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
>>>> +		/*
>>>> +		 * we have a custom stb size and the PMFW is supposed to give
>>>> +		 * the enhanced dram size. Note that we land here only for the
>>>> +		 * platforms that support enhanced dram size reporting.
>>>> +		 */
>>>> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>>> +		stb_rdptr_offset = 0;
>>>
>>> I don't understand this part. Why is num_samples not taken into account
>>> anymore ?  and why substract S2D_TELEMETRY_BYTES_MAX from dram_size ?
>>
>> Like I tried to capture this information in the commit-msg; this is a
>> special case where the standard STB size reported by the SMU FW will
>> not be useful to debug the failures. In those identified platforms,
>> there be a custom SMU FW running and it will have the enhanced FW
>> reporting capability.
> 
> Right that I understand.
> 
>> So, in those "identified" platforms, we don't need to look at the
>> num_samples. That's an agreed protocol between the driver and FW for
>> this case.
> 
> Ok, I find that a bit weird, I understand the special firmware has
> a bigger buffer. But you do still read num_samples:
> 
>         ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> 
> Even in the special firmware case. If the protocol for the special
> firmware is always dump the whole buffer, then why still read
> num_samples at all.
> 
> And even with the bigger buffer it might not be entirely filled
> with info. So assuming num_samples is still valid would it not
> make more sense to then still only return the actual part of
> the buffer filled with samples ?

For the special FW that num_samples is not required. Hence I have
spinned that into a new function in v5. Can you please take a look at
that.

> 
>> not the entire DRAM size reported by the FW is usable, it has a
>> reserved space of 1M. Hence we have to subtract that while accouting
>> the dev->fsize here.
> 
> Ok, but surely that reserved space has nothing to do with
> S2D_TELEMETRY_BYTES_MAX, just because S2D_TELEMETRY_BYTES_MAX happens
> to have the same value as the amount of reserved space, it seems weird
> to use that define there. If there is 1M of reserved space please
> just add a RESERVED_RAM_SIZE define for this.
> 
> And why is the size:
> 
>  (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)
> 
> check there at all, what if future hw has a bigger size ?
> 
> You already make the size of the malloc of the buffer to read
> the samples into dynamic in this patch, so why have this weird
> arbitrary limit?
> 
> And for that matter what if dev->dram_size is smaller then
> S2D_TELEMETRY_BYTES_MAX/RESERVED_RAM_SIZE ?
> 
> 
> 
> 
>>>> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>>> +		/*
>>>> +		 * This is for general cases, where the stb limits are meant for
>>>> +		 * standard usage
>>>> +		 */
>>>> +		dev->fsize  = S2D_TELEMETRY_BYTES_MAX;
>>>> +		stb_rdptr_offset = num_samples - dev->fsize;
>>>
>>> This assumes that num_samples is in the S2D_TELEMETRY_BYTES_MAX+1 .. 2*S2D_TELEMETRY_BYTES_MAX
>>> rang, what if it is more ?
>>>
>>> I think that what you want here is:
>>>
>>> 		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
>> No, this does not work.
>>
>> Let's take an example:
>>
>> dev->fsize = S2D_TELEMETRY_BYTES_MAX (i.e. 0x100000)
>> num_samples = 0x8218b8
>>
>> existing:
>> stb_rdptr_offset = num_samples - dev->fsize;
>> we will get => 0x7218b8
> 
> Right, but I assume that dev->stb_virt_addr is a ring-buffer
> which contains at most the last max 0 - S2D_TELEMETRY_BYTES_MAX
> bytes, IOW  valid addresses to read from are:
> 
> (dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)
> 
> So valid range for stb_rdptr_offset is:
> 
> (0) - (S2D_TELEMETRY_BYTES_MAX - 1)
> 
> And 0x7218b8 falls out side of that valid range.
> 
>> but if we do:
>> stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
>> we will get => 0x21ea8
> 
> Yes my proposal changes stb_rdptr_offset, that is basically
> the entire goal of my proposal, to make sure that
> stb_rdptr_offset is within:
> 
> (0) - (S2D_TELEMETRY_BYTES_MAX - 1)
> 
> This also makes me realize that the existing code
> really should split the read in 2 when 
> (num_samples > S2D_TELEMETRY_BYTES_MAX)
> 
> First read the oldest samples which are at location
> of (num_samples % S2D_TELEMETRY_BYTES_MAX) - (S2D_TELEMETRY_BYTES_MAX - 1)
> and then read the newer samples from location 0 - (num_samples % S2D_TELEMETRY_BYTES_MAX - 1)
> 
> Note this is a problem with the current code which I'm just noticing
> now unrelated to the new dump_custom_stb module parameter.
> 
> I believe that the current code should look like this:
> 
>         /* Start capturing data from the last push location */
>         if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> 		/* First read oldest data starting 1 behind last write till end of ringbuffer */
>                 stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> 		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> 		memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> 		/* Second copy the newer samples from offset 0 - last write */
> 		memcpy_fromio(buf + fsize, dev->stb_virt_addr, stb_rdptr_offset);
>         } else {
> 		memcpy_fromio(buf, dev->stb_virt_addr , num_samples);
>         }
> 
> This will keep all memory accesses within the range of:
> 
> (dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)
> 
> While as the old code would overflow this range on the high end as soon
> as you hit the if (num_samples > S2D_TELEMETRY_BYTES_MAX) {} path.
> 
>> You can see that r/w pointer would get corrupted if we do %
>>
>> This is only one example and the same holds true for any other
>> examples too.
>>
>> I spoke to our FW team too to confirm if the driver interpretation is
>> as per expectation and their answer was YES.
>>
>> So I feel the current code is actually doing the right thing to
>> calculate the r/w offset.
> 
> I don't think so, your own example:
> 
>> dev->fsize = S2D_TELEMETRY_BYTES_MAX (i.e. 0x100000)
>> num_samples = 0x8218b8
>>
>> existing:
>> stb_rdptr_offset = num_samples - dev->fsize;
>> we will get => 0x7218b8
> 
> Clearly causes memory accesses outside of the:
> 
> (dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)
> 
> range since 0x7218b8 > S2D_TELEMETRY_BYTES_MAX
> 
> But even with an example where we don't need the '%' operator the old code is wrong:
> 
>> dev->fsize = S2D_TELEMETRY_BYTES_MAX (i.e. 0x100000)
>> num_samples = 0x1218b8
> 
> Now after the :
> 
>                 stb_rdptr_offset = num_samples - fsize;
> 
> stb_rdptr_offset will be 0x218b8 and 0x218b8 < S2D_TELEMETRY_BYTES_MAX
> so that is good right?
> 
> Well yes and no, yes the start of the:
> 
>        memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> 
> Will be within the range of:
> 
> (dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)
> 
> But the last read will be from
> 
> (dev->stb_virt_addr + 0x218b8 + S2D_TELEMETRY_BYTES_MAX - 1)
> 
> and the following obviously is true:
> 
> (dev->stb_virt_addr + 0x218b8 + S2D_TELEMETRY_BYTES_MAX - 1) >
> (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)
> 
> So the old code will cause reads outside of the valid window of:
> 
> (dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)
> 
> even if num_samples only is somewhat larger then S2D_TELEMETRY_BYTES_MAX .
> 
> And another potential issue with the *current* code is that for the case
> where (num_samples < S2D_TELEMETRY_BYTES_MAX), amd_pmc_stb_debugfs_read_v2()
> passes S2D_TELEMETRY_BYTES_MAX as bufsize to simple_read_from_buffer()
> while there are only 0s from the kzalloc after the num_samples bytes
> of actual data.

Thank you for the detailed explanation. It really makes sense. I have
adjusted this in v5.

> 
> One more remark below.
> 
> 
>>> Note this is a pre-existing problem but I just noticed this now.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>>  	} else {
>>>> -		fsize = num_samples;
>>>> +		dev->fsize = num_samples;
>>>>  		stb_rdptr_offset = 0;
>>>>  	}
>>>>  
>>>> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>>>> +	buf = kzalloc(dev->fsize, GFP_KERNEL);
>>>> +	if (!buf)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, dev->fsize);
>>>>  	filp->private_data = buf;
>>>>  
>>>>  	return 0;
>>>> @@ -286,11 +303,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>  static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>>>>  					   loff_t *pos)
>>>>  {
>>>> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>>> +
>>>>  	if (!filp->private_data)
>>>>  		return -EINVAL;
>>>>  
>>>>  	return simple_read_from_buffer(buf, size, pos, filp->private_data,
>>>> -					S2D_TELEMETRY_BYTES_MAX);
>>>> +					dev->fsize);
> 
> You cannot store the size of the buffer in dev->fsize a second call
> to amd_pmc_stb_debugfs_open_v2() may race with a process holding
> open another fd. This could change fsize to a bigger size causing
> an out of bounds read here.
> 
> Instead you should create a struct with a flexarray data member:
> 
> struct amd_pmc_stb_v2_data {
> 	size_t size;
> 	u8 data[] __counted_by(size);
> };	
> 
> And then kzalloc that struct and store that in filp->private_data so
> that the size of the allocation is tied to the filp and we cannot
> get races when multiple processes are opening the debugfs file
> at the same time.

in v5, you will see a flexarray.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>>>>  }
>>>>  
>>>>  static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>>>> index c27bd6a5642f..f73d265430b8 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>>> @@ -26,6 +26,7 @@ struct amd_pmc_dev {
>>>>  	u32 dram_size;
>>>>  	u32 num_ips;
>>>>  	u32 s2d_msg_id;
>>>> +	u32 fsize;
>>>>  /* SMU version information */
>>>>  	u8 smu_program;
>>>>  	u8 major;
>>>
>>
> 
