Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE921CE7A81
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Sep 2023 10:48:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjIYKse (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Sep 2023 06:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIYKsd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2023 06:48:33 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F279FB3
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 03:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G51FYEyWwATWqUXGlh6gqZP7roN8eKgy7SH6hbe1SsPOVUeWuNGCPSye1T4Y4L8u9sdhx0N3d5a7SXxQskuzXini1ODAhtazlko8T/UfeJCP1TRht0zKobhvpBb8Bwuvmq8GrD4clgUTOHrnYS+GRlWiawZiiUcJOK/h0gm5XESKSBMpMYdJ4yr8YNahOGS3o1SOTePAsowYqkxCLid4kUvM/yT6tAr+lCNwAADvzQs4DWfAytRIRyBobBmLEPY1wBvAIUFYu9UWFnN5jyUmTYcV/ULvx3GfsGRlJKyY8lfcTW5UUu1SLpoee+dJZyzA1VwrM5N7DwuUGhlPYNy6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZqFGHVNeZuWC4FKXwB+ku0UL9FpBCTT8Tadeitnrtc=;
 b=fKatEsO0vtoPcz82C7ssWYuV0aOCAK0jraCKXUIo3A1Y6odcps2ZSVpG/v649IGmvxmAZn6CpSq3sYURiP383LpVFHERGsmQrfDd/0V5WasBepkvZZYpRtxd75HokEQRamYZ58GcrxOx/WF48zCkUoNyOtcQNBpNloNwjL1AUYqCDcu+IFiRPw3yoiKvmYn+CJVaL9nAFa+/292DT7ZzX8ad/j469bj+bAAJGhEJ8tvnnN4jEsdo9T0Ax7ELXYy9nbKUGao1Zz9gZs2imQjkGjhPu0uTWVvxPCQYhE0gZ41Q83NVtMs5R4vQbgh1DnzjTp4tD/4IIOArDV534WRisQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZqFGHVNeZuWC4FKXwB+ku0UL9FpBCTT8Tadeitnrtc=;
 b=cRtwqaObP3nie4zeCZhIUGayzJ+wCuB2v+H3wrdHz63HvvkFq5qhNEheDD4uLY1x0d0ONtFzrt0uPGQPDkl62X1+AXn3W6pUA0OiiA0OJae19JCctEkpShgfFciHymQGvT5BhKzeOl32uRrw8IowRcWnnM9NEbbU0fsI+MoDJLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB8076.namprd12.prod.outlook.com (2603:10b6:610:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 10:48:23 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::5564:8c7:6c3a:867d]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::5564:8c7:6c3a:867d%6]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 10:48:23 +0000
Message-ID: <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com>
Date:   Mon, 25 Sep 2023 16:18:10 +0530
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
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::8) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdcae2d-b652-4179-0ed8-08dbbdb4f071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pE7YAi/rWWut9SS9/Lm4CMZuSEtTfNPbqoVTKf5DPq6s4QO/LeTVviUNcKHWCmLe5libus/FtwZmht9hbafSJVYV4ZmwPms0JPQvU9pubcVQIJkMfmehtLMCCb4ypFRQn0UwP1QRoAVAuxZKCCmnLR944iIDySQ5hq+VsyxSQ8BroWDoBQC5ZzFTqLGZGW5NEZTiLQVshdqkx7dAlV7zs5lY2wyBmeVWKEFlaeo8WnOIXGaWiNwBn9uO1AA3nrI6uQbzgSv5xDnRwuhaVJh/XENJJmbM+bNESQmCcL4EozBKSAyMN8nChAQBwdzUSbwGlmSA0lc7agSRQT/cCXA5p5GjNL1zIOtQlmX2OhwtJVehwOchX8CuJBWFSoh0ONfKD9nQh7Yw+zDaJkzXESNHHIwxXgmwdbv+igjzk11CKDSoxE/yhLjJgrKHdO3OZhKoTX874t4trKES1rhzgrw74ZNRYBywUzdL0ZiDyLanCVGYtLDHkgJ3LbixSlDxkDZ38JZq0vA+QIaK1rD5LvcjIjqsVv4vzBxHqEPbv2h2AjXNqdjQ/QIpr9h+01IEy7R25NNPsHs/qDxlckX2h8MEEPlsmkJUlK9JnN7xH4jWYqrgvhVx0XkU9d8k1EABmvTf64xqpEAWjyccgrWNkpLMsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(41300700001)(2616005)(8936002)(8676002)(4326008)(31696002)(66476007)(66946007)(66556008)(316002)(26005)(31686004)(86362001)(2906002)(6486002)(478600001)(38100700002)(53546011)(83380400001)(6666004)(36756003)(6512007)(5660300002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjhkaVNocmxYRC9BRGlHMUVhdkl1S0ZkU1Exc2FuOEQ4aTJrTy9uK1NkWnAx?=
 =?utf-8?B?T3ZrZURvRzlXSjlnR2ZPSlNveVM3SXBkNmtpTkRnWGFpODh5ZXVWK1lodTNQ?=
 =?utf-8?B?MXlJbDl0Q0JpYnVvTkk4ZmNRTkVmY2F3Z25YT1IwbVVOS3RiWUJxQzZROFJR?=
 =?utf-8?B?YUJnWjFXOGRLbWoxc3B2dEhLSnBuQi9KaElKMm8zR3BkRlJLTWQwOFQvS1dt?=
 =?utf-8?B?NXcybys0azc1bnl3azFudC9PeldGOEFtLy9hSlpqY1VjS09yZU1XTEJHRTQw?=
 =?utf-8?B?eUo3d2YxTnRwRkNYaEhySEg4Qk56Mk0xQVZLUkY3M0ZwaCszRDNHL3gwTjBO?=
 =?utf-8?B?WjNqZDc5d2ZYTG9HQmk1dmJSTGllWXlWQXNMaFk3TWFDcjM0M1U0YU9ZSmpB?=
 =?utf-8?B?bWMyZEtndFBmK0JSZHNkNXpCdFovSG4zVElKMDZhOHdHL3RITWhpMXdrRFkx?=
 =?utf-8?B?NCtBK3VyYlNvbHRPQXpXVTNhUjZGRzdHQjVNeGsySWk5b0NKSGNLZ09nS3pC?=
 =?utf-8?B?a2JVNi9FcjhENUZ0WXBpYWtqa1VrL1pEcFYyUDBROXlWdmRTTThCTHhqM1M4?=
 =?utf-8?B?d3JtWlp3cytjK2gyTmozVVlEUTdjTkdqQXdRYWRLWE1MM1JHUEFQYVBNU1Js?=
 =?utf-8?B?SjRiMUt6Sjk2allmOTdmMDlHYitwbHZNZ3F5OFRGVmNHOWp5STUxRmtDaXRs?=
 =?utf-8?B?ckYrK0xrQm51YnFETjkrcStRbm5mcG5QekJlNmVZdTNCOEtvdmJITTNIRTZw?=
 =?utf-8?B?VEZLRFNtY2JhcVFwY09DNXIwNm9wb0pHMkJvWS9yZWdSclgybnRoeUpNOVJV?=
 =?utf-8?B?dDhLd3VFQXFVQklxaVdTSXBFc2tncmtFSDduVEhSS1V0eUdlcTZoSjNLYzZx?=
 =?utf-8?B?WFVHOXNoVWRkdXRqU1N3UHhzU3BCVi8yS1VrLzN0NW01M2g1N0RzU09nK25U?=
 =?utf-8?B?VnV2ZDN3SVRTdVV3aXhGdTFaZWtSL2pjSkxtdXZYeklTaitadXJtQ2g1TGs3?=
 =?utf-8?B?VjkwSWVZUFFTZUM5Y1AzQTZqakVZT1NlODFNUWNzN2RCa0VNc3V5UXlLaGlK?=
 =?utf-8?B?eGdTS08vN3c0bktQNjB6OUlUeTk0bS9oWUU1aUVPQmxPTFFhQXFjTGM1NURm?=
 =?utf-8?B?cjlPbnRQQ0hJWTRYUmtiSkJkcEhxS2RZN1ovV2NXMzQxd3p5ZFZaaG1MaXZB?=
 =?utf-8?B?eXE0SkQ3UEF6TXFNNmdiZGViODYvc2VwR1oyc1VDclpCdzE5UXUvSzN1L3Vj?=
 =?utf-8?B?aUF2amFXU0RkOG9ob3VZV3JmdkljaGRUT1ZrR1B2em1sYjJacGJMWU1wekRn?=
 =?utf-8?B?L3pDMFZwWXUrRWJtakhWSFd0RHZEd1pGWUgwSk51SzlSNFBQZWVrNHFsOUR2?=
 =?utf-8?B?RUlFM2tQSlI5eUR2UHpYbUg4dkl0MVdtMEZyRmZPOTJFeWZydVJzMUMyeDZM?=
 =?utf-8?B?UDhZZFBaRmpDV2xUeEZXazlnRUlZSS9KTXZubWxlcXA1NXVzZnBUUEJaa0dH?=
 =?utf-8?B?cVdWNlkxR3BBSGlBVU13cnhQYUlVUnMyMVg4VlBDUWlNY0tTVlpYMFQzMXcx?=
 =?utf-8?B?eVQwMEE4c0dqNjY1VWxFKzZoMjR3cURPNWVQVmNubjRGTUlqSEdQaDlGbFdM?=
 =?utf-8?B?Mk1Kb1dMVWRYelpHVndMZm5vTGhzOGtlZkJqOW9mcjRDdXRuaFZFNXZoNmEr?=
 =?utf-8?B?UTNBSG4zZ3J5VENqbHg3NlBDc3VRalFHYUdaU1pkMHdKYWpneURUS1o2Sno1?=
 =?utf-8?B?aFE5Y0J5L0pNTkFKeUtORUNPMVVUbGFDTklUTXcreVU0SHlKODUzVFduNDdD?=
 =?utf-8?B?bnZKdndMeUdXUGh3eWEydklIc3ZMN1owSVFzbDdmWGJUeGZCcDNIOFpGbGJU?=
 =?utf-8?B?d3llaFUyTjlSWXRnSExqcENRV3V5bGVLZi9pZm1YbWpyMHJmdGtJMllITHRY?=
 =?utf-8?B?amVRaUNWM1JKUENQZCtqTWVnbzVYbERNc25yaU1wOE9uT0xIYUlkYWVtQzFL?=
 =?utf-8?B?alhPYVROQTZNVGgyaEc5ZXJieUdVOVlkSVRGRDJKcHdYMVVqclYzb2tBYkxW?=
 =?utf-8?B?aEJrVHlVbTdXaktpSEF1c1ZqbE1uL0Nra2JJeVBKU3M0UmI5VDN6VXc1QTg4?=
 =?utf-8?Q?vfWUf305xQ8/Ymla5R4WehjKs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdcae2d-b652-4179-0ed8-08dbbdb4f071
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 10:48:23.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxEh1ha3lAbNumub82eI4hycYHL6fpYkqFioSD4PQih0cQPG4PBvSczJ1vXWawd/zp3b9bWGJinXdQvX7wJNHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8076
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Apologies for the long delay.

On 9/18/2023 5:57 PM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 9/10/23 16:20, Shyam Sundar S K wrote:
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
>> 2) Current code branch which fetches the stb data based on the parameters
>> like the num_samples, fsize and the r/w pointer.
>>
>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
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
>>  drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++---------
>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>  2 files changed, 32 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 443bb78ea5f4..7e907cb50787 100644
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
>> @@ -264,20 +265,36 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
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
>> +		/*
>> +		 * we have a custom stb size and the PMFW is supposed to give
>> +		 * the enhanced dram size. Note that we land here only for the
>> +		 * platforms that support enhanced dram size reporting.
>> +		 */
>> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>> +		stb_rdptr_offset = 0;
> 
> I don't understand this part. Why is num_samples not taken into account
> anymore ?  and why substract S2D_TELEMETRY_BYTES_MAX from dram_size ?

Like I tried to capture this information in the commit-msg; this is a
special case where the standard STB size reported by the SMU FW will
not be useful to debug the failures. In those identified platforms,
there be a custom SMU FW running and it will have the enhanced FW
reporting capability.

So, in those "identified" platforms, we don't need to look at the
num_samples. That's an agreed protocol between the driver and FW for
this case.

not the entire DRAM size reported by the FW is usable, it has a
reserved space of 1M. Hence we have to subtract that while accouting
the dev->fsize here.

> 
> 
> 
>> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>> +		/*
>> +		 * This is for general cases, where the stb limits are meant for
>> +		 * standard usage
>> +		 */
>> +		dev->fsize  = S2D_TELEMETRY_BYTES_MAX;
>> +		stb_rdptr_offset = num_samples - dev->fsize;
> 
> This assumes that num_samples is in the S2D_TELEMETRY_BYTES_MAX+1 .. 2*S2D_TELEMETRY_BYTES_MAX
> rang, what if it is more ?
> 
> I think that what you want here is:
> 
> 		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;

No, this does not work.

Let's take an example:

dev->fsize = S2D_TELEMETRY_BYTES_MAX (i.e. 0x100000)
num_samples = 0x8218b8

existing:
stb_rdptr_offset = num_samples - dev->fsize;
we will get => 0x7218b8

but if we do:
stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
we will get => 0x21ea8

You can see that r/w pointer would get corrupted if we do %

This is only one example and the same holds true for any other
examples too.

I spoke to our FW team too to confirm if the driver interpretation is
as per expectation and their answer was YES.

So I feel the current code is actually doing the right thing to
calculate the r/w offset.

Thanks,
Shyam

> 
> Note this is a pre-existing problem but I just noticed this now.
> 
> Regards,
> 
> Hans
> 
>>  	} else {
>> -		fsize = num_samples;
>> +		dev->fsize = num_samples;
>>  		stb_rdptr_offset = 0;
>>  	}
>>  
>> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> +	buf = kzalloc(dev->fsize, GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, dev->fsize);
>>  	filp->private_data = buf;
>>  
>>  	return 0;
>> @@ -286,11 +303,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>>  					   loff_t *pos)
>>  {
>> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> +
>>  	if (!filp->private_data)
>>  		return -EINVAL;
>>  
>>  	return simple_read_from_buffer(buf, size, pos, filp->private_data,
>> -					S2D_TELEMETRY_BYTES_MAX);
>> +					dev->fsize);
>>  }
>>  
>>  static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>> index c27bd6a5642f..f73d265430b8 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -26,6 +26,7 @@ struct amd_pmc_dev {
>>  	u32 dram_size;
>>  	u32 num_ips;
>>  	u32 s2d_msg_id;
>> +	u32 fsize;
>>  /* SMU version information */
>>  	u8 smu_program;
>>  	u8 major;
> 
