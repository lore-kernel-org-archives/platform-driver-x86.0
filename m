Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B388DC05027
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Jan 2023 03:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjAZD3e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 22:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjAZD3d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 22:29:33 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691D02B619
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 19:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thkmua418CTx/0q7QahnlKDIhI4gJeIiD7DhZoz3F+zfK4YAgSBP2DBJhI7ffOb82hVTbjcJzm/vJg+kBzh32k/o1qXS8NCcINH2yy+ADdNCI+3tNAEtWf9xOjtdVHEYkcTTcK8PhY3NM6xQOKEWVXyZe3EEJz25a+Nnm8GFjtfobVMKqgKNYSnbUIKlzxlTUoAkLXT0fu+GlW92NWcNL9DII9412A1K2wFgSa8NI143+4VNyxcsgEpmNW2Fh9Esu64GR1V/LTniJmSaW3GiWxxziKqMegZEYnr8qJf7EkTGTMC6Cyj8RfwMLzVifQs7oLQqMuxwpTcwVDORK/0r+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1bJJm3Z+iGIJ7rIwIO5LjD0OxVP0IerFqYMva5vDgk=;
 b=jghEh/1qyfjzm0KrhJxCzl3/Jd+Qam2MipF7EzVuuYXgipKvcvCgz/7Oy8vG4QbEQ6uUJ2PV/0+AQpxWR9AV8WEApwBXkAxCDaNliiDglMlyGR/tlDWaX1klbYbJsD+WY3HNyoZvMuBedu4OuZpXK7QUk6B75yziBA71WErNWRXj2TC5QgUe8s2yBHqFsHapG4kE4yREpRgwIuBhptUIlxEV+ZmKwdqDk+kSc64xGGBRGwPfpQtb3UPElCuDSCX3Dek0XTeBuxLLuYw+U1suxPM4Kv2enwFhA1h6SaAjFBHSkANu9Ty+sjw31VSAEsiTvnFWpeeaE94+LtY1D1sy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1bJJm3Z+iGIJ7rIwIO5LjD0OxVP0IerFqYMva5vDgk=;
 b=tQvxZuE6mCP1KQ/0E5gN5oSfY6WcCGKJnmJivoNg9j6+oq9M+0+TiFsPhxCAhcDBH2cpaKm3KJHt/5SvxEMCv+aF+Kmm8HfKqWP2NDmC5BJSRJycNCfVzcsvGsB7bs/lX/+G4kO69NIVEWIGz6C5zO0O3q+Sou9LX1YlhNFcn9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 03:29:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0%9]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 03:29:24 +0000
Message-ID: <908dc053-80d8-2665-8e78-888947b4c8dc@amd.com>
Date:   Thu, 26 Jan 2023 08:59:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into the
 STB DRAM
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
Cc:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
 <20230125113127.3862898-3-Shyam-sundar.S-k@amd.com>
 <MN0PR12MB61016002AB38595C34C40770E2CE9@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <MN0PR12MB61016002AB38595C34C40770E2CE9@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4502:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa79244-0e7b-4935-fdc7-08daff4d8570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0wzj6dk+8rg7821sc4/+7IukhP5C/XXRxUJDHqvtFkck8+BqtVOmoTSU4By5frVihCbj543iG7O4+FkHcIHe/p38LizegBXytkGUWyCB728pA9bKe7qEnmtm4i13zB7ZYqQKF26bEMYWOl2pPIDemwz8tVZeDk0OKR88lzqvSRnU89ZU+zC51K97W+jaEVMjomzIbT1YuXDrs9VCdqOSoBzYUhHwNzOPT95kFrrTP5HdGCrIzyLxD9axdHZD8BTsPMVIaNK+EuIgU4+f+eKXZ8MNk2PN6clZ9rLB5OMq6RbeQ9SY2qwZAzJ2HCg8pj4dhVT/yH2QqmkxRPgJPptT7haCa/4NfgpfXBJXp81bOa7lEfcf6WS7bTdkdOt5tT9iXsK4oBnz1afmoe+EYKpkjgPGCaVvw1r2/5vSdaXBdMHe1RibUXlOx7uAi+lZCa387UjUijjrm662ode48HO9cZYVvA/oXzbVXcbOmtyTZxXlERizDazx779+4CfFAY46WvwSgOwODiETDhLKT37oWbsL6GdZdCRkXCroysrDiYwAHj9I7mRCSmKLWkzgYM9b+ICqdpD7PbEGocifsNmb5/L3IRac52ILAoIs8nXpJvG7uM6wy2GKghTqRhbPUTcbwBxHlNOP1VOeO0n/OF4dTtiw2NuHBYAHGorNz0xMrzhwxzlwukWlmir8MLZ8NqS6Ov2sx5XCClpfAEQ1yYAbifzq4RjOKKigMdE35RRsmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(2616005)(38100700002)(2906002)(316002)(110136005)(6486002)(478600001)(54906003)(8936002)(36756003)(41300700001)(31686004)(86362001)(83380400001)(186003)(6512007)(6666004)(31696002)(53546011)(6506007)(4326008)(66946007)(8676002)(5660300002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJuVXhFa1hwZDlXSXFPVlRwVlpWWlhRSDlkdTU2REZVRjZMdnRkZnFzdE5u?=
 =?utf-8?B?YjJ4VEUrcjhPWFpwRUdZeEtRdW9FWnhpd1hoaFFtYS95Q042WWRRMG9VV1c2?=
 =?utf-8?B?dlFCUVBzV0lIY3JybWU0UXRmay8xcEJkZW5sTHIrcFlOcEY4L1NTZ0tDUmpJ?=
 =?utf-8?B?dDg0UXZpajZDdUlUL3ZTeVpjWXhHMVNSeU52VWMrN3JOV0xJWGNpRU5ZTWlL?=
 =?utf-8?B?WHFGNGxlSnFSZklBK0pkVU54T0IzWVFmbWF3OUVZK2FSM2hpMytQc1ptbmNw?=
 =?utf-8?B?U0RicmJkdG92ZWNIemNJRlVyYnJoTHVlQWludkRlcm82Tm9HaFBMTGREZUJa?=
 =?utf-8?B?Vk5Vc25sbEVuZVNuRXNMT0phZVp5VGlOaDhsODVxREdGSXdYQmVkUFIvS2Vk?=
 =?utf-8?B?Y1FVdC92R2Zhd25tdkNkZExJVkRpS3dwb2lFUzlYTEZPcUhmSUdOK284c1g3?=
 =?utf-8?B?WEhmSWF4bTJFTWNIeHhPUUNjZ0NTamQweHQ5VEIzK2lMdHJSUU14RG9rUFZV?=
 =?utf-8?B?UXJNZVBSTlNET1ZrT0JTOW5raWlUQXYxamtaVXFDQWxJK1FqRnVvK2JIVnQz?=
 =?utf-8?B?UW5abjRSZzhuNHJBUjU2TktSYnJ3UndSV2VROGJycGtZbm9OSms3WnRGcGlM?=
 =?utf-8?B?ZXRFQXBVVUVUN2tiMmN1NHE4V3JmR1pmWGd4N0JpNUxJbmxFZDQxZ0htUGtY?=
 =?utf-8?B?VTR6NEF3bXJvT3krcjlQRHBqWEt5V3VtU3g0OHJ2TWp5b3FqazBqYzd5cGhn?=
 =?utf-8?B?bUsxdDlhc1c3Y3lQZkY2NVBnUDBBWUJPSWdiU2lDMjRqSWNwWVlnVU5qNVRp?=
 =?utf-8?B?a1AvcDc0VVYyZ3BML3FaOWFLYUVhYzlRTE9BdCs2YjdjTHpld2hKVCtNbGFt?=
 =?utf-8?B?ak5QMDZRbjFVUTlzY3VnVmtEUUNBZGZtVU9jR1lsSGFsbnRobEVnQkJaeDY5?=
 =?utf-8?B?UlVkc1FQQzhDSUJ5TDhXdHpDRDE5SDRqQS9OWXZORk10T0VNaS9lWHUwSS9C?=
 =?utf-8?B?V1MwM3NWd2JsQ2txRXRpWFhPcUlyelFZR1dENURhVjdZWWRVcVJhc3o2WDFW?=
 =?utf-8?B?eTlTY2lySTZqaWZ1N3dlbk43U1VjeHlwNHcvbUpRZXc2Mlo2OEdwVzVlWXFx?=
 =?utf-8?B?ZFdFTjFmbncvMFJjWWcwdS9LQThhVGo5V0JkdEU0Tnp0c3BoaFk0aHJ0L2F3?=
 =?utf-8?B?Vk1nWWlJN05oT2FNNytDdXFwdGQvUWxhNCtSeWh0emc5N0FWMGtpaHBpREdB?=
 =?utf-8?B?ejBMZlpvUlExVGVRZU92ZDY5bnZ1UExYNnBVc0lQcFcxaDVDb1Jxbkh6MG8r?=
 =?utf-8?B?eGszSk8rOWczRHFQYjMzVUdESkYvNzhNcnQzd2NGRHZjZ0lISi93Q1lSRTFI?=
 =?utf-8?B?eWpkSTdFTkZhdkpabXhXdk9KelVVRVY5eEZXVjB3ODVNSXJDZEV3ZnhrcUZ2?=
 =?utf-8?B?RTRKVHp2Z2wyZUl0Vm9VZUc0UVRaZjFHdGk4YzlZME4rOUVJY0MzbHBLVHJR?=
 =?utf-8?B?Y0NzUmowK0crWnBBOGZWbk82NEE5T3hNQW84aWdNbU03eElUcXJSdnljZ3Z0?=
 =?utf-8?B?SHNhMmM4eTUvVWs1dTlNWmdVcTBHZ0xLNmpkZ0VBMmtKUmEzU1R2dStmbjhO?=
 =?utf-8?B?T3BKSkNKNUNVOHEvMkZWZzFLTGxibVFwM2pad0o0b0FVTk9qWFRLMHJKNUhV?=
 =?utf-8?B?eW95Y0xwYXFDYjQwTHFqRTBjZWFMdmNoRDNUWlVWUjFnRER4T1BVWFl2cTE2?=
 =?utf-8?B?bVVBNnpSdE5EdU1wU080cDgrSjNENTJ5R1RQdUNCakpmN0NidkM2V0tCMzIw?=
 =?utf-8?B?NFUzNmpUT2NjMUp5R2xicFlaTDZUTDQwM3F6WjdxbzNEWFRLTndLbW5QdXpr?=
 =?utf-8?B?RlNtVGlLNTZpd1FHdVBtVFRrYjFQUWkySWlNdVVld2s5blQ2ek9pbmhqY0ZN?=
 =?utf-8?B?SHBQdHQ5bHRMOUVScVBUUE1ubG5mOHNBMVh6MXNZdzNUN1Zacm5mbWo2RGNZ?=
 =?utf-8?B?TGV3dmFweTI1U0dScnZJbllSZ205Z3dwbTk0UG0xTmExUUlGakZ5N28wcUdq?=
 =?utf-8?B?USswZXZaS2ZrUm1VWjFGSkg3ZFJuVThwOXMwaXIvYUo5RndLakhkRzlMTEI4?=
 =?utf-8?B?SXlKVGM1TEF2N3gzU252VHBXWkZLVFFLZStaVWo3K0V0TGM2cXJUSEZpQVVL?=
 =?utf-8?Q?s7gKdE9M+XK+qdr66D+vL+x9XGmWwVZAfBbdNWCS5IXW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa79244-0e7b-4935-fdc7-08daff4d8570
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 03:29:24.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9cSQqd8PIwdNOnBhMywniTQv7LDGcW3LJBE0mg2eyuMu0ZYU3UVGgDFgHOE2y5x7ejHDfwSYUnaPtEIwbrU2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 1/25/2023 11:13 PM, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Sent: Wednesday, January 25, 2023 05:31
>> To: hdegoede@redhat.com; markgross@kernel.org
>> Cc: Goswami, Sanket <Sanket.Goswami@amd.com>; platform-driver-
>> x86@vger.kernel.org; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
>> Subject: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into
>> the STB DRAM
>>
>> Based on the recommendation from the PMFW team in order to get the
>> recent telemetry data present on the STB DRAM the driver is required
>> to send one dummy write to the STB buffer, so it internally triggers
>> the PMFW to emit the latest telemetry data in the STB DRAM region.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c
>> b/drivers/platform/x86/amd/pmc.c
>> index 01632e6b7820..0dd9fb576f09 100644
>> --- a/drivers/platform/x86/amd/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc.c
>> @@ -43,6 +43,7 @@
>>  #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
>>  #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
>>  #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
>> +#define AMD_PMC_STB_DUMMY_PC		0xC6000007
> 
> Is there significance to this specific code? Any particular reason
> not to pick an incremental code like 0xC6000004?

Wanted to just keep in inline with Windows code atleast w.r.t to this
dummy postcode. However, if you think it does not make sense I can
change it to incremental one.

Thanks,
Shyam


> 
>>
>>  /* STB S2D(Spill to DRAM) has different message port offset */
>>  #define STB_SPILL_TO_DRAM		0xBE
>> @@ -250,6 +251,11 @@ static int amd_pmc_stb_debugfs_open_v2(struct
>> inode *inode, struct file *filp)
>>  	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
>>  	int ret;
>>
>> +	/* Write dummy postcode while reading the STB buffer */
>> +	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
>> +	if (ret)
>> +		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>> +
>>  	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>  	if (!buf)
>>  		return -ENOMEM;
>> --
>> 2.25.1
