Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450BAC83F01
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243240AbjH3SrO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242744AbjH3J3V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2023 05:29:21 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B351A1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 02:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVKmpg/iGJSrOWNHqOJQ/xfo+dJEU9D0EpbblzJ/snz0Orkf40da2Egu2d0c0Xrzrwc/RMcmEqZQTCnCJzFjngxIPGbhPekpgSiZOjcDQlLz+1IEB3bYZJ6dmV+oY7Wi1hKlDgATvdGP4w2PImnR8Rnun0+2mt7/g9oMlyKhlMiihKtroMONWR7LnmYX0a5uS0SCUFqmiKNnlx18KI//dXSgWApwzlylvbeKuv/Is+Xzo39UCscIAZZtZs4r2qfy0CveN1uM4ybi9dU/up0QuX71Vk1uOLpzVxiRwzNkI119qFE1E8+5dk8hhOgGxsmuC8+Y6vJu6SaLJ4lNEooYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfgjzqMObseBU8IXKhbsMixZ8m9trsDGTKpao7xAZK0=;
 b=bnT6Wn39jTZZlz8znzdguGuxWTWTMOHejw5gR6VvtPXWiHiecmkFZRVOiWPLux7iQyUqjuW7sQ6fkw9qPUneyzQdnU6Uarx+bMMl7745pxAwiehRl+MQEpF4tCIcEFFUBZFpPPh7MUSlRIWCyTzFEC0BTgl42f4Rz3JBTKcvtosjex7yEIMmOV4z0xYfi8qE+v6d3AGijINv9aC1R7D7hRcieJPvDc6DIG8MrRLSZES3ve2nPmhbW5TKIgJRXujxSBwLYtJfCo23MgseD1IAE/9RYIiIrNlRw5xOOtuxcV/rvZ0yL5P7IJ780VpXJIF1CQOm8uhff9wh0Z/xhIiPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfgjzqMObseBU8IXKhbsMixZ8m9trsDGTKpao7xAZK0=;
 b=bicEpbpVowFMMmcjm016zdOI/b8jhYvAgEZq00V198MYXmEfR0EHhJTJi/+/YO1B2DeuTrcfEL7gKesiTsy2Wl8oJmAynbh3x7vP62tlkq53CvqSHb5a97hIzs7ozpc182U3V26OpX/jZIObSpAf9FTnizXLshwpPRZxN0KNY4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB7735.namprd12.prod.outlook.com (2603:10b6:208:421::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 09:29:13 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f%2]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 09:29:13 +0000
Message-ID: <e49f5ce4-4113-1370-624a-d747ecb1c167@amd.com>
Date:   Wed, 30 Aug 2023 14:59:01 +0530
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
 <06125c23-c086-ff61-de5a-aedd47ab79ee@amd.com>
 <e7ffa6a8-8fb2-8f6-1fbd-e898c48c4ec8@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <e7ffa6a8-8fb2-8f6-1fbd-e898c48c4ec8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 35707ef1-924b-43eb-7789-08dba93b927e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDXEEIb8orwLOgOhNW9i9Vh0wuL5zwdAlCXIyt4gfWn0cb1DFQFvJtTimpI1kUC47uuKbWYU+WQQcO38wgOKkPivK8JPChLPeKQL8dcwZDKG3KqjNKj1QPR9Iw0R3pZbrMduec3blSPGLunIX6v4K9fu7sT/kTrIv3VluDuqxnwuDwz+d9QvPxjQzWH6VzeOkQBYsHJ7AgySuyoBbZ1UdhzAUgPL29D5DKF6ryNFNxYYJu1S+UNIfQRj9qO52UEtQ9Rrl47fZOVuo02XsuEVS4N3NwaYx/NLAwKfsvhGatwhWcDpHL7/zQpOKLJO0owUAjbRXmLK0c2EYFMHvqqwVyRf2zHqZ/s35Vd6eGK39T5LFYLf1huqBLLrVLchn2Q7Lkfm81DTfemNpixw8PjsYnkMSXC5Uoed8bM6T2hOuFU49j5tnUBGeMvoZUIMbljCP9Vl9q5KvJNn4C/w7mfestnhBMzlEncxo4Y+L+VR9FkRGkeBmSdud1t0CgHHkCc2sWpLKnblj7V2vmsV+0XP7vq9nIidBUwecYkyiQAE3+2glDusYf9jmYuR11je/CTzmfbZ30X7Nl5lNlun2yCPkuYXW/faWOnsI/zecYLLxKSQIfr+I8ZPupQD2S4Ah16R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(1800799009)(451199024)(186009)(6512007)(38100700002)(316002)(41300700001)(6916009)(4326008)(66574015)(31696002)(86362001)(26005)(83380400001)(2616005)(36756003)(5660300002)(8676002)(2906002)(8936002)(6666004)(6506007)(66476007)(6486002)(66556008)(66946007)(478600001)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUtTNUxPbW9IaEdPL3JreXV4Z3lFcS9HNFJsVS9obnA0RmVsd2VndDREN1lC?=
 =?utf-8?B?VGNuYVlxN2FxclBTdFR6UFo2bkp2OURUMnUyUkFITTZKL2RaOHdab2swWFRQ?=
 =?utf-8?B?T1ZjWHp6amNtdkNHeFJTQS8yYmJNc1pPL1gvbWNLdUcvbVRoYXQ2Um9OUTl2?=
 =?utf-8?B?REczSnExbFRqa2FGR2VDQytIUGxnb1A3ZnZhblFEZXRhbjJQNW9MUjBKaWE4?=
 =?utf-8?B?OVlJVVFTUWVmZjkrTTdnN2Z5RDZMWkZJZUZDMFZiTnFxalQzSC9FeFlPd2E4?=
 =?utf-8?B?OWFqaFdJbCtFTDJ5bDlnWEtLSTlMbWZ5MVJwbUE1S2o5dGI0bkxsdW5SbG4x?=
 =?utf-8?B?Sy9EMHFwblp3R0tlaExodjFBcFBYNHJIM1hoRzFUSFVwTHpkTWpFWlFZdGIy?=
 =?utf-8?B?c1ZvdFZqUHM1MXNtVGtVVUxFWndMRzk3M3lNNWJGeENGc2l5cXJKWmhXMThC?=
 =?utf-8?B?T3pBakl4S1RHNit2TStWQ3FRM3Frb3ZycXo4VklxSU9QUUlOYXg4Tk9yRFdZ?=
 =?utf-8?B?cTl4cytHNHVSczE4YWpCcWFublJJMjUvUFl2bndyUkdUanFZVDZDT3UxYWkw?=
 =?utf-8?B?MmJKalpSVWpub3Nld3FROUF1NVlxNXRzSjJ5dlpjRjhLWkR4Ym5MWVJObkhs?=
 =?utf-8?B?c2pvSGJqRG5INlk0dGdqTzR5SG9JTTUwb2pDNXR6d1Nrd2V5ampWYXZ3TDZu?=
 =?utf-8?B?VGtpd1FEV1pzNnpCZTVyOEtaZXY4SjJDZUh6NzgvajFLUkhGUnZrWlpoekk1?=
 =?utf-8?B?NzArRGMyOFlGVERTM04yVENhRndmb25ZR2kyYTdqL0ZDRVIzSHIwNy9YN3kr?=
 =?utf-8?B?SlAyTWRGMzhwQ3QxUUpLVElDN05nUjZGZU8zWUdHbEIzU1JRSWVaWm1GUlBU?=
 =?utf-8?B?blhjL2VLTStpVXNVR1lMdzNOZk4xS3ROSCtqSklTakFKQWpJem54WWlrYTFh?=
 =?utf-8?B?VFVYZzg4VlpPR29BOXduV2N4M1pGajJSd0I3SzRqME4vSTVjckpCTm80b3kv?=
 =?utf-8?B?MzVMRnVTc2J4Z2lsQ1RsRDI4YTgzcEdwMDVtY3JCWWdvRllCZnVuQVpVUEhF?=
 =?utf-8?B?WkZzeS8wbzRRR05CNDNZYXYwUkx0Nk9zd3doa3djcUFLUDRNTGIrVTZ5eW94?=
 =?utf-8?B?c3BZaldobE93bDlhYnAwNGFxcGNPSkFESTVCOW1BMFM2WGNpRHVQWEZtbGJT?=
 =?utf-8?B?VGpqSFNYbHdpOUVRS2ZDSzA2MjliV3EwOEI0aytYbFFnbEdEUTh2M3J6Sklv?=
 =?utf-8?B?MDNNd3lsOTRDM0liZGY0a1RmYk94UmZtczEyQWxVeFpjakcydjFVS016TURZ?=
 =?utf-8?B?Ky9RaW5IbkZsaFVQRStROVdHZXVCTUxJUUtnWTBRYkdaVUJmQTFQb0FJc2pH?=
 =?utf-8?B?QytvWmhCSHJnaVZZNTQ2YTBSWXBXcEMxcnlxYnFGK0pBUCt4WTBwVG56NlRT?=
 =?utf-8?B?bUNxbHkzWmpTcnhyQWJ1UTRnVEVrSmtXNnNwVmJYZkdNS1lHQzA1R1ptUXN6?=
 =?utf-8?B?WThWRTN2NThSbVhGa2F6NnhTMVlZaC9waUs2TTRiTGxOcVZ5ZmFKUGQrNXF5?=
 =?utf-8?B?bkFIR3p0NXhzKzhka0J6aHhLakxsRmo0bURKV08wSTR2MWc4Mk4rdUNUbnNn?=
 =?utf-8?B?VjJYUnNWU1lVN3NKamh0d1NVNFJxdVNzdkVNam00M1EvMWpwUmhaZ1BMcXFs?=
 =?utf-8?B?dlBlSUl1UTVoZ1lWb3hQVHQrMjlkQ2pzMktvVElENWkvRHhqTTFFTlJwU25E?=
 =?utf-8?B?SWNCaXUzRW9EVE5wSVVLOE9Sem1NcWsxbmo4bXBYb1dzd0g0TEFXZ3JkYkdK?=
 =?utf-8?B?UExFdXRJZnF4NUxzRXovOXRsM0REcVpra1Y1emczNGQ5WURMUG9pRTg5Z2Fh?=
 =?utf-8?B?RGd5L2pmeEx2OGg3aVlGUlUwYUxnUW43N0JVWDJEQ2tIcE8xZzIySWZUSXVi?=
 =?utf-8?B?eDRueWpzbFB4S2xwaDZuSG9JaVJoMG1ucFFrL2F4MHYyUnV1ZXdjMHNwQnNk?=
 =?utf-8?B?SWlZR2g5a1VXV1hUN0tCb0dzaHNmM2dQRUNzS3BWb0pxQnY5TmtwSWRpTk1v?=
 =?utf-8?B?UDdidWJpOGFZcGpMMXJOYldqd0lKcTZBeXFabFNrdEVxamlSb2ZWNWJyYVV2?=
 =?utf-8?Q?NFn7Lk5zHzVgAh49JcMUfVpu1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35707ef1-924b-43eb-7789-08dba93b927e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 09:29:13.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3bBfSskv+mzYC7UnCa9MjHLH7lIY27PYcwZuYkUS6ovWtshi9ysgpFcNoNHTekOFJnPG7kXhq3cW278C6urPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7735
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/29/2023 8:00 PM, Ilpo Järvinen wrote:
> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
>> On 8/29/2023 4:49 PM, Ilpo Järvinen wrote:
>>> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
>>>> On 8/29/2023 3:09 PM, Ilpo Järvinen wrote:
>>>>> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
>>>>>
>>>>>> There have been instances when the default size (1M) of the STB is not
>>>>>> sufficient to get the complete traces of the failure. In such scenarios
>>>>>> we can use a module_param to enable full trace that shall contain more
>>>>>> debugging data. This is not a regular case and hence not enabling this
>>>>>> capability by default.
>>>>>>
>>>>>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>>>>>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>>>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>> ---
>>>>>> v2->v3:
>>>>>>  - no change
>>>>>>
>>>>>> v1->v2:
>>>>>>  - rebase to 'review-hans' branch
>>>>>>  - drop 2/4 of v1
>>>>>>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
>>>>>>
>>>>>>  drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
>>>>>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>>>>> index 443bb78ea5f4..0e61ae74f1a9 100644
>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>>>> @@ -53,6 +53,7 @@
>>>>>>  
>>>>>>  /* STB Spill to DRAM Parameters */
>>>>>>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
>>>>>> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
>>>>>>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>>>>>>  
>>>>>>  /* STB Spill to DRAM Message Definition */
>>>>>> @@ -160,6 +161,10 @@ static bool disable_workarounds;
>>>>>>  module_param(disable_workarounds, bool, 0644);
>>>>>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>>>>>>  
>>>>>> +static bool dump_custom_stb;
>>>>>> +module_param(dump_custom_stb, bool, 0644);
>>>>>> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
>>>>>> +
>>>>>>  static struct amd_pmc_dev pmc;
>>>>>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>>>>>>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>>>>>> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>>>>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>>>  {
>>>>>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>>>>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>>>>>> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
>>>>>>  	int ret;
>>>>>>  
>>>>>>  	/* Write dummy postcode while reading the STB buffer */
>>>>>> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>>>  	if (ret)
>>>>>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>>>>>  
>>>>>> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>>>>> -	if (!buf)
>>>>>> -		return -ENOMEM;
>>>>>> -
>>>>>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>>>>>>  	dev->msg_port = 1;
>>>>>>  
>>>>>> @@ -264,20 +265,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>>>  	dev->msg_port = 0;
>>>>>>  	if (ret) {
>>>>>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>>>>>> -		kfree(buf);
>>>>>>  		return ret;
>>>>>>  	}
>>>>>>  
>>>>>>  	/* Start capturing data from the last push location */
>>>>>> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>>>>> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
>>>>>> -		stb_rdptr_offset = num_samples - fsize;
>>>>>> +	if (dump_custom_stb &&
>>>>>> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
>>>>>> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>>>>> +		stb_rdptr_offset = 0;
>>>>>> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>>>>
>>>>> I find the logic here somewhat suspicious in the first if check (I fail 
>>>>> to follow the reasoning here despite spending considerable amount of time 
>>>>> staring at it).
>>>>>
>>>>> Lets assume dump_custom_stb is set. If dev->dram_size is large, the first 
>>>>> if condition will be false because LHS of <= is large. Thus, we go to the 
>>>>> second branch and dump exactly as many samples as before this patch. 
>>>>> ...And that is opposite of what this patch claims to do?
>>>>>
>>>>
>>>> Let me explain:
>>>>
>>>> We have cases where the S2D (Spill to DRAM) STB (Smart Trace Buffer -
>>>> which is meant to have debug data that gives information about the
>>>> system conditions, be it success or failure.) may not fit in the current
>>>> stb buffer size of 1M (i.e. S2D_TELEMETRY_BYTES_MAX). The stb buffer
>>>> size of 1M is sufficient for most of the platforms, but there could be
>>>> exceptions.
>>>>
>>>> In those cases, the dram_size would be updated by the PMFW (Power
>>>> Management Firmware) coupled with "dump_custom_stb" to fit into a custom
>>>> requirement.
>>>>
>>>> As an example (with this proposed change):
>>>>
>>>> when dump_custom_stb is SET and dev->dram_size is 3M (received from
>>>> PMFW) the first if() will be successful and it takes the corresponding
>>>> code path.
>>>
>>> Heh, I can see the numbers work in that case, however, the above still 
>>> doesn't really explain why only S2D_TELEMETRY_BYTES_MAX is copied if 
>>> dram_size - S2D_TELEMETRY_BYTES_MAX > S2D_TELEMETRY_FSIZE_MAX and not
>>> S2D_TELEMETRY_FSIZE_MAX as I would expect?
>>>
>>
>> I guess if your question is on:
>>
>> -->the if() case:
>>
>> why:
>>
>> dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>
>> and not
>>
>> dev->fsize = S2D_TELEMETRY_FSIZE_MAX;
>>
>> if yes, I think the intention of the code change is correct.
> 
> I agree with you here, the statement itself inside the first if block is 
> not wrong.
> 
>> The entire
>> buffer has multiple segments out of which the driver can only access the
>> STB buffer region. In general cases its S2D_TELEMETRY_BYTES_MAX(1M) and
>> with the proposed patch a custom STB buffer range that cannot exceed
>> S2D_TELEMETRY_FSIZE_MAX.
>>
>> taking the above example, assume
>>
>> case 1:
>> dev->dram_size is 3M, S2D_TELEMETRY_BYTES_MAX is 1M, so the dev->fsize
>> is 2M.
>>
>> case 2:
>> dev->dram_size is 2M, S2D_TELEMETRY_BYTES_MAX is 1M, so the dev->fsize
>> is 1M.
>>
>> so, it depends on the incoming dev->dram_size from the PMFW based on
>> which the dev->fsize is calculated and cannot be directly
>> S2D_TELEMETRY_FSIZE_MAX (always).
> 
> Again your examples leave the most interesting case out... So what if 
> dev->dram_size above 3M, do you want dev->fsize to be
> S2D_TELEMETRY_FSIZE_MAX or up to S2D_TELEMETRY_BYTES_MAX (the latter 
> depends on the num_samples)?
> 
> Or are saying that configuration never happens? If that's the case, then 
> the entire <= condition looks unnecessary (which is why it looked 
> suspicious) and you could simply do:
> 	if (dump_custom_stb) {
> 		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
> 		...
> 
> ...But then, dev->dram_size is assigned S2D_TELEMETRY_DRAMBYTES_MAX if 
> DRAM size wasn't provided so it doesn't look convincing to me 
> dev->dram_size would be limited to 3M.

The examples what I gave was for reference purpose only and lets not
stick to 3M.

There are two cases:
1: A special case (proposed now), which is required only for certain
platforms. Here, a new module param will be supplied to the driver that
will have a special PMFW supporting enchanced dram sizes for getting the
stb data.

like you mentioned, we can just guard that with a simple:

if (dump_custom_stb) {
 		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;


but think of a scenario where any end user can just reload the driver
with this new module param on regular platform? that would result in
getting junk stb data to the userspace or in some cases the entire
behavior is undefined.

Hence would like to add extra conditions to make sure that even if the
new module param is supplied, the underlying PMFW should also be ready
to handle such thing and that is the reason you see:

if (dump_custom_stb && (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <=
S2D_TELEMETRY_FSIZE_MAX))

2: A general purpose regular one - (current existing code), which says
about where to get the stb data. That is decided on the parameters like
the num_samples, fsize and the r/w pointer.

the crux is: the additional conditions are for protection only and
definately not a overkill.

Thanks,
Shyam

> 
>> -->else if() case:
>>
>> why:
>> dev->fsize = S2D_TELEMETRY_BYTES_MAX;
>>
>> and not:
>> dev->fsize = S2D_TELEMETRY_FSIZE_MAX;
>>
>> the already exising code is put under the new else if() block. In this
>> case the dev->fsize is fixed to S2D_TELEMETRY_BYTES_MAX which is 1M as
>> the internal alignment with the PMFW team. Like I mentioned above, the
>> telemetry buffer is huge and we are only interested with the actual STB
>> buffer region here.
> 
> Is it intentional to end up into this branch if dump_custom_stb is set or 
> not? Because that's what happens when dev->dram_size > 3M, no?
> 
>> Hope that's clear.
> 
> Unfortunately my question is still not answered adequately.
> 
