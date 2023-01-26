Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5ECC05027
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Jan 2023 03:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjAZDiH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 22:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjAZDiG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 22:38:06 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8C6470A9
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 19:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVQiuEREyJrfy5UtCbZPL6rk+6+hlVSNOtDk7oTrcR5CliMoCjCorGcOwFyYJVydr9BCJgz/6hSheu6OoxUdia/f7Qe/l05eIYxTQ3/h90TRJS70hXrF1X4kutn3Tf9t9QyKnE3QmnLEeVYiDR+lOLHriWfEVrdHLNoo+DWHucB/wfsnePL1M+uRHDXZ/exqD0l4XTfTFVnKKpt3m6pnlL0nxFSKYGWJF+GuOFGYvS/jwkWc+G2fSgiEQVkk0+ODo1ynAubM/TBiomgbPQz+1FokMNiXESssirW6QVgopXdSbATvLLfxqZCE1qkENlRWuKJkchuL+wa6PFGcdmNhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGof+eto5EoNz0RMr0jMcchhiNynyQVdfjOPZVcl6Uk=;
 b=nFgu4zGqA5HhWqgQlUumyuoQTomBlkjsa9xYGVOxhZ7wWE+LwcRVWV9znyTWqB0nc2XFwEc6qYRphClyUPbj1iRSYWyAqTmCQs+nU4OJ+4aMI/05/AigGBtvs9/+EpWdpNy051zTqmus63b8D9vn/TqPFZtPV3JxkJwSDJozkl1x4iBFrft/kT6UWDIoIjkyGN4uynae6FWfdSdwUoX5KRmhi4UZQqCYBd0D74TFfehAyRrCHHeakX5kp/uQKHEnNFHEdtovKrnpnBPFmn2FiuhFlUwJByNDfnA6m+ESy+saKHEJmDReZakAk+WKCQzX1pgAeQJ5/EvSRLuESRxh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGof+eto5EoNz0RMr0jMcchhiNynyQVdfjOPZVcl6Uk=;
 b=vAJtF8mgHCEJqCIWbr8RS/92gaDKd/YDnxgQ/tpyaMWcucaA8Ou1pObMyvqc7DCD/fl1aZh5LLcHkLzdYz/rrFxdEqwdpQqie4e3oC61S/9oXNv9zfB/Qb5vCsuHyuQPnHWcCI2yo0bjyB2nybtJma1aYd4XDqq9BjTfLdtzggc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.31; Thu, 26 Jan
 2023 03:37:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%7]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 03:37:58 +0000
Message-ID: <bdea1525-84f2-6220-2a32-fd80e41fd4b4@amd.com>
Date:   Wed, 25 Jan 2023 21:37:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into the
 STB DRAM
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
Cc:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
 <20230125113127.3862898-3-Shyam-sundar.S-k@amd.com>
 <MN0PR12MB61016002AB38595C34C40770E2CE9@MN0PR12MB6101.namprd12.prod.outlook.com>
 <908dc053-80d8-2665-8e78-888947b4c8dc@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <908dc053-80d8-2665-8e78-888947b4c8dc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0184.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf8e271-81c6-4fa1-a85e-08daff4eb7e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZS5oChcSK8VHoVkqPi/6z0pg5tCJeUHVgVlS8DGWKtBt4i042ZHcyRGwxrrO+j6kX/1TyP1KOM6u7QQ8O6FDAYHzWOSB8ltOmmZ1hNr68/pBHRZJtl4iZswh+lAh86T/FgkFTwQ8igfWMdEnMLaslkU3aqRE2Ti2G5EEK+R3uR3dbBmwFlOxi2KJ6iX2x+vM6o6i0ZbAA+kBBpvtQkU35Tgq1O92Rz9RVQ/vPKWZ9vsicAoMbM1BTnuBb1+FDJlJaByncgj8XJ/oADI4iCNarCVX/j9Hgz481+7b41xiXUp2wcH8brDB961ilWCbMbnrOPwwaPjKKr+c7XBdcfJyhw2TOA3uNox92GBitOyEf8PTKDPgj0WSvvFsVeZiiZ2Ctu+eXtAYxTG6C4I+Jlwqe3FF309WmW/y3G3A355wYTMA57qfGUyn5w0RM2GfVttqvjytC2CRSSpGxp0i9FpG9929NCnPdNbZfinNhUNyQHrvbeEXbwN1mXmaByFezfPOb4LWauxouEGRnVC5RybjWaY/oyS1hoxzSwmOyPiaSo2ZgAWMTNytly5HBNFCwE/j+1aob+x05USGKBR76w6KsVueRZ9CvYiq66mN4XL+Fi5gZNGj1rttihoVXvWoqHf1rWpkphFOjKGHK2oVjXQZlFpC2YVIb5UZN4z/V0LJcJbF5AYtKD/9mEUEJb+0nR3LVmn71mCbn6oUFeWfbbhMj4PQiiGneTksfuzO4Mg2yM0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(31696002)(31686004)(36756003)(54906003)(110136005)(6512007)(316002)(86362001)(38100700002)(2616005)(186003)(53546011)(83380400001)(4326008)(6506007)(66476007)(5660300002)(44832011)(6486002)(8676002)(66946007)(478600001)(66556008)(41300700001)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlMzdWt0VDZjcENQeVNSNzV0aXVQckFYS3hwWTh4eXJiaHV2VVBzUDNya0Ur?=
 =?utf-8?B?RnNTY0F5TExFY1dGT3RSRzg0bno3VmlJRldVZXFEN3FxRU11TmZkRGZCNTdD?=
 =?utf-8?B?S0N2b3FPcktaUVFQWWl5aEVnQmRuTWxJQm1vb3dlbmRXQzU5YTluKy9OL1cw?=
 =?utf-8?B?L2JpbFBqRHllNGJ3MjFLOStVMHdtRHRRQ3F1bnNZQVFYWHVtczU4LytlSnpl?=
 =?utf-8?B?MllmUk1DZWVLd2Fya1RuaWwvYnhlUmpnMDRhNS9scnhQNW5zVVdWNldXbmpX?=
 =?utf-8?B?UjRRUk9pcDMrRG5EUU5EZGdDUGVBU3VJQTJkVnNWRTh1VHRWa2RmMXFPNk1z?=
 =?utf-8?B?b0ZrcDMyVEFLVEkzWHNNU3NFUld3Ty9KcElBNk0wczhrOHBzc1phZWZRQzVH?=
 =?utf-8?B?czhybk0zNVdOR0VlVXhnenhzNjV1eGFWQlh2eE1MWEZHMmtKNTZKd21qVzdQ?=
 =?utf-8?B?R0JsVm42R3ppblpQS2lEVVhqYWhVUDI4dGsxT01yQ0s3V05nVnplbTE3Y2Nl?=
 =?utf-8?B?UUk3RzRqckJzKzRMaWdjVzZZcldlcEhydWUvS08zNUpVczEyWFR0bE80S3Mx?=
 =?utf-8?B?WW5xRXg0ZGV0OXhRSkN2K0JyUzhCekdSV2hzRWNkcnRiTWZjV1VRVVNsamp0?=
 =?utf-8?B?QUsxSzNCQThBMU9hZGdwNnBveVpZWS9mSFVUYzFGOXJNb0pnWXA4cjlxTjFQ?=
 =?utf-8?B?bzdGN0RaUUU4RzdjRmlSMU5QTWU4bzFLcGJUbmJoaFNDaXBPRXliWlhtNHpJ?=
 =?utf-8?B?dWVCMTI3a3dSWEF5RUpGRXhrdElvUkFnaHZXOXE5MFAzYmNSN0tVaEpJM3k1?=
 =?utf-8?B?WWtCQ0Z1RTBWdnd0Y3NNWCtZbkNxUUV3SjBqQWVIQmhkc3lwd0xETW51S2ZL?=
 =?utf-8?B?MVBSQloyNGxLZTJmZDlvQnlnMnU5VzJGczJiaitTa2hHZi9yRStPY05UdTNB?=
 =?utf-8?B?SXo0MCtpNmpuM0ZHaUozOGxSVXVocElSL2xVYmlQdnFUYjZyQTE5dkx1cXlB?=
 =?utf-8?B?dEhkNE0zMGkvUURPelp4eW1Hd1pWMHVPb214a3l1blpWYmY1eXlIN1o2ZVhy?=
 =?utf-8?B?WXBUR2tjNWx2S0hsVGgzekdqQlVZOHNjSVZnNTdLaHQ2dFdHL3VVK0NpVFJB?=
 =?utf-8?B?YVR0dWtTQ0NvMHlNRTA2Uy82V0VYbTV0bXVuN2ZRbFJ0OFJkdDhIZkp4Sk5F?=
 =?utf-8?B?bUpIZFBpck12ZGljdW1NVnExRngyQUdheFdTN1RmaUsraS9MTEJZV05yT2lG?=
 =?utf-8?B?UmtlRWJVTnJTL3FDdEVzSjM4OC9YUEpLRW91VDJTa0Z3SGpRQUJqTzdYaGtS?=
 =?utf-8?B?TE1GK1JDd0F2ZCtlVE15cnp5V1phL000aFovL2FuejRXcXJkZUxCOEJCbmdL?=
 =?utf-8?B?cE5aVm9KSzhPMkVzL1dKbDlqT0xPby9Cb3o4Zzdrd3NmMTJtQnUvTGZLcTNO?=
 =?utf-8?B?azJhZGpTWUlZczZKZSswbzFiRVhxWHJUQkNkVFhFTGhmWTVBV3NqZlJ4MHB1?=
 =?utf-8?B?dTNsaHZRZUxmbFpId3BhS25JYWZUV2duMHpwdWs5UGhKaGJ6WmdYL1B5RGFI?=
 =?utf-8?B?ZXcvaGhuQVhiRDVpUGJpZUdlWityVUZJODJ3QWg0WkduKzlKRkZ2ajlxNFJD?=
 =?utf-8?B?Z1pKWjhvT1lmemcrRGpqOEU3QkdBNlgwczk0N1poV1FFNVdCc0JnNitIdC9Q?=
 =?utf-8?B?UDBGcVM2ZmRhTFFwZW9OTXliNlNXWDUzdzBXOThwMFdIeWo0TmpTWmJkSThi?=
 =?utf-8?B?Q0RuczM1OUxXTXFkL08zT0pxYVNHdUZFdUVmM1U5SDFjOVY3RXNxMGt1QWUr?=
 =?utf-8?B?VGtPak02KzhTTVF2ZXl5RTNNYzhDRDB5bzFTazBnYmo4d3JnY3FTTEIyd0o0?=
 =?utf-8?B?dzQyejBhenNwcFh4R2NqV1M4WUZTMUhrd010SGk0REFsUXU3NzVNK1FybWsz?=
 =?utf-8?B?WVBZSEpJRjRrVmJQNUU2L3JYZlNwM0dueEY5dVV3OGRNU3FNdm8wNlVoR1dz?=
 =?utf-8?B?NFlaSDJOQTN2RTJUSFVWdHFFbUxwcHRwMWlucjUrK28wT1U3VUdJRDR6NWRM?=
 =?utf-8?B?OHpjSTVjcmNzUTZlaXB0STRDbHhvWUYxY01aK3pyZS9DWEZmdjhYYktYYkpF?=
 =?utf-8?B?aVN2R0xuaWlrUmx3WHBuS2NiT1AzY1A4Um1qVDdoZ1NhbDQrVElqcWE0MklS?=
 =?utf-8?Q?M4fPleS1oxds3u9LrF/gRw/X7QzOKAg4ySlr7ghgmbgp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf8e271-81c6-4fa1-a85e-08daff4eb7e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 03:37:58.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXnF0lkDPReijbsGYfMCjgn3QEUs+P5ZwdvzlLl74PlAsFmBoArbBMXbksitey3j5AxLWtkjfdEmp6wlgjJy0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/25/23 21:29, Shyam Sundar S K wrote:
> 
> 
> On 1/25/2023 11:13 PM, Limonciello, Mario wrote:
>> [Public]
>>
>>
>>
>>> -----Original Message-----
>>> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> Sent: Wednesday, January 25, 2023 05:31
>>> To: hdegoede@redhat.com; markgross@kernel.org
>>> Cc: Goswami, Sanket <Sanket.Goswami@amd.com>; platform-driver-
>>> x86@vger.kernel.org; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
>>> Subject: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into
>>> the STB DRAM
>>>
>>> Based on the recommendation from the PMFW team in order to get the
>>> recent telemetry data present on the STB DRAM the driver is required
>>> to send one dummy write to the STB buffer, so it internally triggers
>>> the PMFW to emit the latest telemetry data in the STB DRAM region.
>>>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>   drivers/platform/x86/amd/pmc.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc.c
>>> b/drivers/platform/x86/amd/pmc.c
>>> index 01632e6b7820..0dd9fb576f09 100644
>>> --- a/drivers/platform/x86/amd/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc.c
>>> @@ -43,6 +43,7 @@
>>>   #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
>>>   #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
>>>   #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
>>> +#define AMD_PMC_STB_DUMMY_PC		0xC6000007
>>
>> Is there significance to this specific code? Any particular reason
>> not to pick an incremental code like 0xC6000004?
> 
> Wanted to just keep in inline with Windows code atleast w.r.t to this
> dummy postcode. However, if you think it does not make sense I can
> change it to incremental one.
> 

That's a great reason to keep it this way.  People who look at the STB 
can have familiarity on the milestones they see.

If there are other ones that are used for Windows in similar vain across 
suspend/restore as the 3 that we have today we should adjust those too.

> Thanks,
> Shyam
> 
> 
>>
>>>
>>>   /* STB S2D(Spill to DRAM) has different message port offset */
>>>   #define STB_SPILL_TO_DRAM		0xBE
>>> @@ -250,6 +251,11 @@ static int amd_pmc_stb_debugfs_open_v2(struct
>>> inode *inode, struct file *filp)
>>>   	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
>>>   	int ret;
>>>
>>> +	/* Write dummy postcode while reading the STB buffer */
>>> +	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
>>> +	if (ret)
>>> +		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>> +
>>>   	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>>   	if (!buf)
>>>   		return -ENOMEM;
>>> --
>>> 2.25.1

