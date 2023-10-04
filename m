Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFFDE7B5F9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 12:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242311AbjJDML1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 08:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbjJDML0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 08:11:26 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40ABCB0
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 05:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOGJN4wcn9YkzkF+GasPaOmFYWcrOmS09jPqgLLAbHmeGFFffxZJ23Qf3Da/nSszyGcOIcOikaldrZoA4jWhBfNUZ0wY7e1Hmjj0Ux/DruBHXfZ15jqJsvrlCJ3Ea5W5UbEF4V0RntWzVQWdoUfrs7TcNS+qtybdH7hJTcwOLAYoZb4px4cth3ngchkqskOa8qOm/pK3MHmoeYvVHMEDOafxQOXjRvRKDQ/8sWRTyixDJz9ZoWTooW1JvJRGEebz/ajDm7ZNXtAUFnAOAy8EaKehInd+sxiVm9pRlRqeOaNknIognXl4h5S9iWAoTLXLuVEaL8eisJIDaJBXeZyGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5gIHTZe5C2bnTq6ogr4kj4EuIE//+WdIOfCj6YvfQ8=;
 b=YVOFDOUb+LxsbnJDZ1akhzqmTqjOzdOmtZxhsVOaK4OMqUfs4PCtGWB86qLtDOotuD3jE9wa3PjcxWURpzF+qcG4RfjhVPiwYkP3Q40DSyTvhCBIU3JhLbTC5W8xWOOYIBBe1cYRnOeGOAyiFdEe9ZYoge/BxMHBjdbmYBQOLyp92t6kRs6ZRmPQ1s8Vnx0t0oftEJvWr/mzhUs9FxTtwmUcXGPN3BMqWz1gMfOkZ5hAGJ7pNaut0vFMDly1A9sawW+qYE6xzCxgy5e03bZ6Ro0hgkknQJZk543HyDTVCuGJerHlX/opFC+MSDC6TmtRu+W1+L+ni0Tz3mG3YBIX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5gIHTZe5C2bnTq6ogr4kj4EuIE//+WdIOfCj6YvfQ8=;
 b=ff44nKw1FYTWS/wO4SCVUN3Kkmrzd9N1pg9BnYNz7/Ew4kpxLkbQguUHpSBHdYKkgZ9vL901Zk1B6KwIi5HdaLmHPzUCy4/rl2T3FOKNOXIZJwtin+YmUVFsx4o4fQ8iCzTA3+DVRpWSysueRTSP8ndUUH26v9hM3SeRG3bZpvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB6977.namprd12.prod.outlook.com (2603:10b6:510:1b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Wed, 4 Oct
 2023 12:11:18 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 12:11:18 +0000
Message-ID: <844d0ef1-a09c-4c8a-aa14-d3487e3289f9@amd.com>
Date:   Wed, 4 Oct 2023 17:41:08 +0530
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
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f33c02a-38e1-4a9b-f2a3-08dbc4d303af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KG9QQgQVDAzbtPb8JlIVJxrOB1UACQvI7V8ImkwzKnr+ybNi/kIFnUNw8bddyk/kszinpsDA0dj7n0J1L4iOKKtlG/QAOTTM1vddrQegMFy2zfwcKw8ZZZFmpPY6cTOpo86AAYEr3pnuR9Wzm2dUQOQab5nAhQF0Sx05joSqooVhWfAhoz83qOGecbGLKdwhVF0SCUUNQv3ar7L5iZUvlzk/47gEvWhqXP3aU/OKCD/44TI1hPLMf6Mwzfi0Bh1jKuOYxdHYJCj1GrFg2FMI/Rfkz6pB7HUpOI8HdwJ0hRNiMoq9rFFDKH/vvZhiv6yXM8Cq7lXTrSnH0qTduhVNn6E2FaUil0gRCIgHUFp0S3fJi0VDOZpofibnItbP+SNHBBEHHVBIHEUhoe7ov7/M86P3MIC/BsExV9RFxi9X3jC6MNvrpc5zGDeY7tiHJGU/EMco/ZiD1ly1FaDyflSmaPh9XID02Ac6tHnTLNEMR4JNaQkotofdr9Wukst1o50E4fWvcel6yDbhS1fTwvvAximjzLczzEoLE2IGkP3ttuMEyDFCDTQesy7WG10Kn0kNWeFlWrCQS/IJ0BpWHKigYbYW04BmoOfYrxs2pEQy8rLFJRFhxgsy8RWzKxPqbk1KgEMjOY9aBytFVT/sNRcNNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(38100700002)(8936002)(8676002)(4326008)(2906002)(31696002)(36756003)(30864003)(6666004)(6512007)(6486002)(53546011)(2616005)(86362001)(5660300002)(41300700001)(478600001)(66946007)(66476007)(66556008)(316002)(6506007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTcwd0JoOThzMldkZC9GS25XbzZ6R0Y0TVJvU2xHSTFsb1FCNjhPT01vaXNo?=
 =?utf-8?B?UWNxRzdKQnM0UVV6NlJOd0l3dnQ4ckdOdHVGa3VuVlhGNTNuc21BMzMzbDNj?=
 =?utf-8?B?bUNSd0R0Z3QybE9iU1RoaHVKQW8zSkcxQnFxOEpkQzRsNms1cXVlRWhJVDZX?=
 =?utf-8?B?ZG5MVERuekJCZ1ZWQWg4ZWlMeFJlMWhvdXVCZ240YXJGczNTV1lGczFwRHo1?=
 =?utf-8?B?ejhIUXlBeHVvQy81TS9vOUdlTHI5UllhUTB6bkttS0h2SjM4Wms3NmdBWkRk?=
 =?utf-8?B?c2k4T0JmN1J2RFBBZDBlNHBMVmVQZ0J3bHl5VU40dGhtbk1hWXY3ZFFhVzRO?=
 =?utf-8?B?c1kyY0h5ZXBNWHRKQ2VpYXdUWjR0aDVPTnpWanRyaVp6czU5eUVxK3JFSFlv?=
 =?utf-8?B?UVd3emVVYUpLU21PN2dFRHVUdUNhYWRXZDhUOU5jMEJKNHBpYURPdXc4OXJD?=
 =?utf-8?B?YkJkZ0dWOW1sQ1k5TlJFN3gyVlFyREVNK1pDdjM2dTZ1dWRSR1lMTW12Ukd3?=
 =?utf-8?B?L1pqWWpRZ3cyVDlnVTBRTWlyeTJpZVBFZFJYYnZmUkFqN1AwSE1SbHh5c0xI?=
 =?utf-8?B?bE9EV2VtRkhKMWVHYU1WQUdubXRsbkl3ejk0ZlNDTXNnZ0Q4eXVXa0tBbk53?=
 =?utf-8?B?cllhamVHd3V6VVc0cGwydktIcVhVd0RNakFKRkhOYVFZdWozRUwveEVtSUtD?=
 =?utf-8?B?NzdZcnlGdEU2OG50Z2Y5TmxRMG9HTGd4L1F3ZVo4VUx2MUJsblY2TU5ac0Rz?=
 =?utf-8?B?QmwwKzBoWGNGKzVDK2dsVkczMFljN3ArdUJ1OEcwRXo4bE1EK2MrS3M2T0dP?=
 =?utf-8?B?TnZvRThPTTNIRHhhaDNIcFBUODJ6bUpVbVB6a3B6L0tzOG1GS1JvbnFqa1Bl?=
 =?utf-8?B?N3I1QmVFOUV4bjB5MlBZQSttS3JoajN2cGxPYVhkZnBydFBtbkp5MXFCaUlw?=
 =?utf-8?B?TnZ4UU1qRkNJUVFPTGNPKzVPSitiMjhxVlpNNkxqTFFBQ0NrZjBXU3pSZzhI?=
 =?utf-8?B?MzAyQmR3emVpd3pndXRNQU50VDhPblNldlFmcG5BV2xaN05lQk4xbW9XNkZk?=
 =?utf-8?B?cmNnQzlvR1BLeEU2VC8zSWpJZ2FGUUhuVFptU1E1QUlGMEFXSDNsTm91RG01?=
 =?utf-8?B?dU1ncHllNk54THJldTZ6WGM4azN5dmFOSDJ1OFAyaUJyUlJFWmYzRHhRV1Vl?=
 =?utf-8?B?TTZtMG1VOEwxMlFVdFNhK0wrS2JjdFdiRkZkaC9wY1NuSi9MVWNCVEw0ZUFq?=
 =?utf-8?B?TnVuWXVNdTdQbFh1eUYyQ1l6dkVkR09KaEZPa2JCT0k2VDR1STh5a3M4aVZr?=
 =?utf-8?B?Wms4MDl3NDJ3QWlKTkN6QUttQVRVR2ExL3NjTUF2MmxaM2pyUndRcHZQRVRm?=
 =?utf-8?B?c0hzU0Urc3FTRlZyNldKTkVXOTFBV1dHVXJzc043WGdhRjA3ZkMwRnNvVm1W?=
 =?utf-8?B?dE1WRDFoZkZ1bDhnRk9Sd1Juc2huZFp1c2xjREhVdVR0REE0b04zaGdMdUgx?=
 =?utf-8?B?QVJUNWJLaWkzc1cveGdCa09WeGl3WlV0MmdmV0QvbEJYN1h1NFo3c0pmYWtE?=
 =?utf-8?B?QnQwZEZrb2ZwZlNTdWhJRDRIYUVDVkhuSHRrcVFPWnR4ZXlFQm9lVzVHSFZv?=
 =?utf-8?B?d2x3SG1HV2RaTGsraWlDSm9ydUdYYkhGcGVFSmJpYm5LS2xBQXRhc1RRT0NW?=
 =?utf-8?B?am42bmgrajZnVVVMc21rc2M2bkVYckt5bENSS1k3UGN5RWFTRXEvalhzZGto?=
 =?utf-8?B?bVV1TnFVeEJ5YytoOE5JSDZLNzI1Y2lwMDB3ZVpWWEtLektqTVBrREMwM3BP?=
 =?utf-8?B?WU1iM3VTVmxpdXB1dnJjejZUR01wQnhLQmlqbHFrYjZrNG41MUJIQjBObkF3?=
 =?utf-8?B?V0h0bFpxZ21vS1d2a2ZaYThHS0lMbGhUQm1lckpRZ3k4dEhCdCtrMEJaYVFq?=
 =?utf-8?B?NCsyVGxKMEZJZ3FDSng0R3YweEh0WlVRTnB0d2UwWi9zcklSckxqRS9VMkRB?=
 =?utf-8?B?YXYzazRtNE4vR1RyZE1obFZXbmN0QVFGcjVOQ3UrTWsvSFdsVEU5VjlzazFR?=
 =?utf-8?B?Q1AzeUpFaXh0emNUWXFYb1R0eVRsdjNWSGJDOVhCT0Qya1U3V05PYVlCcXVS?=
 =?utf-8?Q?fJjjwneP4EuGDFM39WjnjH0He?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f33c02a-38e1-4a9b-f2a3-08dbc4d303af
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 12:11:18.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRfk1IeTvl9kINPU21vs8baazzfCmSfQKtD/mkw+75jJixhSKi3Z+qXQu4Zti3X3v7d8ICKTKiviRbPrdZcAWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6977
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

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

Thank you for the detailed feedback. I will make these changes and see
if that helps - will need some time do tests and come back on this.

Meanwhile, is it OK for you to take changes in v4 1/2 atleast? So that
I don't need to respin it again (assuming there are no remarks for 1/2).

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
