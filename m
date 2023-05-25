Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45D3C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 11:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbjEYLZg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 07:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240311AbjEYLZf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 07:25:35 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58723E7
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 04:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TESxJ3XNV3/Pt3bdL+8lFI5moov7u9PwOX+Lopy3y4LrwgGnJKTp0QU9+lg/kTw2YNBM0d2Mx8O9d74vMOBG8qFsA2Qkh/U8/SM1Zb2l2Qv0RwLAC4MnG1DpwAZcRYCwUXCH+wgiVSHfte7WChGOv7IbpxBNpNUue+YEftaq5Tq/6aQQGKTonXJODALBXFkyy5yTJL46RYUiLcn8Fzvzfo73aKn88Qr4qYKXh7Yvz/UABVbqUH29GHHX2rQfsdiaGmJW6sQG6OZAF4+iRSqIY4tuPsAekaVGZGwcoyeCfL5k9eA95ZYdJl5jq5AEfP38BOslFj5QUME0ierpNK9Wjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvjXwVn8LDJ9bT2LnCsmRcDFxOoKgqEfb89D/WGo50M=;
 b=oMnWEKzEZgEzLuLf7qyx5kJd5gNVijIMMc8vvVnXF2iYHv70i7lkwN0Bj5Unciu85OKP4lBHuuK1ieTigN0iAut+alXj6RLbJGv4llY3k10H71ozu9ybMAqekMHLXFP/cdNmLZT5ViLucL3cEWylvXKQparhmvBcD9QBql6SNZ3/fxMVuFhSDKqbT5y7L0nk4kop6WbDMn3Ysbn3wLC92hke02FeJmuJQQ6a9m49xu7MNW1X6ZN3aPTaZywtkrYYzkiB9X7K8MLRo1xYARsa+2eYSvCnEmwn1iRuRos/woJCUfvtMaHal8bhDwns0F9x5+czVzOmJRfxbwbopyw70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvjXwVn8LDJ9bT2LnCsmRcDFxOoKgqEfb89D/WGo50M=;
 b=DlC+G0VC0sxPa+CuIshjKTrG7ZumkJL40RHNzHqkUMMsC1g0wU3KAjX50BN+Fbn1Ftt55Mh5w5+xA5152QqZ654joOPdEE9vooLT9AM71D6LvaLxNM0LTtTEbPfiU4zC0JowJcvcZLxbLl7b4HPPQlbut5VLZLVbIicE34hTlkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 11:25:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 11:25:30 +0000
Message-ID: <f929738d-a46c-2298-d552-4ff6d5e2eeb1@amd.com>
Date:   Thu, 25 May 2023 16:55:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
 <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com>
 <d4e98445-d2f2-10f7-7f62-9bcb16deef79@linux.intel.com>
 <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com>
 <209390a5-4945-f99a-5951-9fc61e5f6060@linux.intel.com>
 <34cf33d3-0b43-a7a5-4c1e-c9027c994d5a@amd.com>
 <4651d798-886-9144-7bac-4a87d73fd48@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <4651d798-886-9144-7bac-4a87d73fd48@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 668ec707-7893-41c8-d185-08db5d12bf35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qB9OcpkLm22XV+PVb1prmUmos0ylSTJXXia1d0Rd1MJsbNwNeC7ZJu1C9dZxJZ4XRJ13F1mZknmoqT6JvO18iXns1d2pV12dZFfRvTp6cOCgrfqv9RkHGCRRFVEqQojUnDBr3f2IAwJkIZaE5hvwb7C53n5wAr7oSdU7QDTpZW9SWXJgi6H1+AA1c9w83HSjw7BEr4JRjQszKzgUXFyxSR+aSILfL+a2VvH12CbDfotJOvvxJ//3YLLpq7vthxi9EJEHnWwCdgVJZf2P5xTi20nbADaWrtrrUgsu4NlkjVGTW02s7OD2yP3a5g7kAaWY4IdvsbRHRE3s5WZ4HjegpIsv4lOPPEj44ar7qnHCIHn6iW+QoSpQmGzaL9g4a0JmHqwqiZqcodLr2UsnYlMuMK3LR1hNfuW9ceOBKihwA58AkrmowGr1ktJsA49YZQxsgQrctjq3iiSXa4iTNGAK5XiX05uXQTRlNTdcfK/DtIphQuSMk2D+ZL/0wgsYxlzuv3okgp27R/YGw2SrIeeqOTTRx64Ep/u9dFBFTCxIsvqD8W2ijcQOFILpnH5Pnxzoz8bnMUKtJlk16kZVFRa0SrKkkOFNl9eDI7YzF2iLs7Jywv/hxIYYlffHg8qwkgAxCG4nCZf7KvqwdePr3DCyGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(2616005)(83380400001)(66574015)(2906002)(186003)(36756003)(31696002)(86362001)(38100700002)(66476007)(5660300002)(66556008)(66946007)(6666004)(6486002)(316002)(41300700001)(8676002)(4326008)(8936002)(6916009)(26005)(478600001)(6506007)(6512007)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDdEaUk3eksxQ2FSdWNWVjl2WENGU1lHUmtpMm1rWW5jRExXa0w5ZG5KMENz?=
 =?utf-8?B?aktwbWJVS2kvcWpOYmx2Z1dDenNyQ1dBMStMNG85S0JuRjFqWG5PRnlVQThI?=
 =?utf-8?B?cnJiblFMVHgxR01BVkFGMU1GWGJuOEUyUFlYamM1MGsyemVxYTZsZTBWYjFS?=
 =?utf-8?B?OXVEeVQzVjZsVzFBMGo3M1E1MVdNektXVFJaeGVPQTBTcGNmSk5zbkdJR1FL?=
 =?utf-8?B?S0ZtU015MFZmdlVVVVM1ZGtwVWF2SEJncVgzZTF5Q01iZ3VSbnpZSjZJU1dv?=
 =?utf-8?B?dUhMdGt4YnJxWWVBN0xiOVk4UjY0aUJUSUx1OUM2ZkZUTElRb1BBQ3ZTVkZ2?=
 =?utf-8?B?dm52UjB4MVk5Q1puemZaNzZMMGxNT1ZKNnM3YlFFM0J6MGtBWlNmNXpCektT?=
 =?utf-8?B?N0lkSmhYVGgvUmNIdzdCUWJHR1ZyVG1xMWs5M3NtY012cGtIUmM4aU5hbm5P?=
 =?utf-8?B?akIyb1o1QU54em5BQ3IrZnhaWnNZMXZjL21JN051L0d5dHFMR0xxR3RMdGt5?=
 =?utf-8?B?RVNqWWxXU0MvUmJIc2RpbWdGREZ2TlpRQ0VpblBTSHAwSGtBcWljeFdoei9P?=
 =?utf-8?B?YnVWSVAzUlBCenZTTUJZTHNKcHJxTzlMSVlRSDlDSlZhdk1FNytpaERHclNm?=
 =?utf-8?B?OUdGN1lndEhqeWlIV201YzYwVHdUbkRXcnQrTll4OW9DRnZhc1JUT2RYdmF3?=
 =?utf-8?B?dVprWHhBWkM3RmZFZDBEV2NSMzV4N2hBcWM0ZGpFKzJpQThFdVBoVEVEcEcw?=
 =?utf-8?B?eUU0UllPZjlrdytER1c0ald5cGRMQmZ2WTZRNFdidkt3M1BPUExaOWE3V09V?=
 =?utf-8?B?Y1ZJMkwvUm42UFFiazlCVndxSDI1OHhPODlvaHRCamtoNDVMNWlMQTlLcmpC?=
 =?utf-8?B?TGZjMEFqNVo1dEp4L1N0UWJ5SVk4SUV4UU16NVNKUmI1Z25FVTE2SGNoWHpS?=
 =?utf-8?B?aUhvcHVZUS83VmxheHZiWVcrbHlMTVVFaytnbUpyZ3hsTjljNTVVSElsaFlH?=
 =?utf-8?B?SCtIamJEQlpYKzlYQ0xacExPYW92RXJXMENPTHJqcE5zYnBqQ25SeCtTRkJh?=
 =?utf-8?B?ejMxdmZ1L3dJc2lGOFZWcUREWUk5RzdweHNPVzBHa3VCcjE2T0pGSFM1Q29N?=
 =?utf-8?B?OFk3SUNnL2MrQVVyNkZSYWVVbjJOQW8rUkVhLy9QN0ExVnlOd0U2MGgzNmNl?=
 =?utf-8?B?T242a0t4L3ZKM1hsVFFKalhDNTVkRWllbmpBQnBSeCtRbTNwU1FZbnpMTk04?=
 =?utf-8?B?YWxqQWNoWmJ2dnBid3R5OVZvenFDTkdod2pMb09ldUt5bzRlWVRySjVFYnYw?=
 =?utf-8?B?NmRPVGJydTMySmluTHh3OEl1Q2MraENRTWJFQ0ZpUzM2dFYwWFNoUkdnWnds?=
 =?utf-8?B?RFRiWkxIaEhpQkRsOEUwTEdUOFhkRi9vYmdtQ2x5Y2FvZ0hONndRTnMxU2hG?=
 =?utf-8?B?cUFkU2hqd3hlVmdmSW1wSXpUa21weE9FUmlIWmJHa3BBcXk1VWlKYlBYWEc0?=
 =?utf-8?B?eWpCVDRoNXVuV3V1bzdta3FNMmhkSlh2UTF3MGxLRlU0VUFQQ3ZhNUpva3N0?=
 =?utf-8?B?QktLRGsrS0xXMFNubmVsd3A0OTg0U3A3b3YzR2c2ZWVBK0FrRUw2KzZqbWtl?=
 =?utf-8?B?MW9Eam10dUg0cGpFOEh6UC95dUxQb0dlcHdiRi84N014eDlHTHJzazZkNkFm?=
 =?utf-8?B?Qmh1RTh0dmtQRnVvWGIrY3JRZnQ4YzJjT3lRK3dLMjdEUnhuWHlhOXgwUXRQ?=
 =?utf-8?B?STBVbHBKTWhjWEFXcWxaeXk2Rzh4amtkNzVNVXg1WUc1cXpaY2k5MTRVWUxH?=
 =?utf-8?B?a2hTaktyamNrN3RERUlOZW9wRkFnZk9XZHVJcXByTENyK2x3eCtSWXl4UUVD?=
 =?utf-8?B?N0lucjNLbStyaWVvOWJyNnlQWXNjblZNdk1tRUhqYktOZngrbkkxVmZQak9D?=
 =?utf-8?B?YzVmK1dadmYzZzZBMzVyWGlwQ2JKTDRIYjZRSHRPVG5oczFMYmh1d0lGd05s?=
 =?utf-8?B?V3BHcHVVZmVyQ0U4TGhqWUVNbTFrVDVUNktqUituM3VUZmRvdmVTdVRqdlJa?=
 =?utf-8?B?WEd5WU1hb04rYk9mU1U5ZGpkZzhGd2RwZUVqd3JMZ0Q0TG8rZ1hHQno2dmVK?=
 =?utf-8?Q?25MQD2+OH+LuuXL1iymIKlUEZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668ec707-7893-41c8-d185-08db5d12bf35
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:25:30.6331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ybrY4vy9dswn6zj/AgvginJWYtegUz+W/dJxsYI7G37ilxU9a4zY8bpN/FKo11ChddyKJ1U8eBSFU/jRwuKow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

On 5/25/2023 4:14 PM, Ilpo Järvinen wrote:
> On Thu, 25 May 2023, Shyam Sundar S K wrote:
>> On 5/25/2023 3:29 PM, Ilpo Järvinen wrote:
>>> On Thu, 25 May 2023, Shyam Sundar S K wrote:
>>>> On 5/23/2023 1:56 PM, Ilpo Järvinen wrote:
>>>>> On Tue, 16 May 2023, Shyam Sundar S K wrote:
>>>>>
>>>>>> Add a helper routine to check the underlying cpu id, that can be used
>>>>>> across the PMC driver to remove the duplicate code.
>>>>>>
>>>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>> ---
>>>>>>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
>>>>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
>>>>>> index e2439fda5c02..7e5e6afb3410 100644
>>>>>> --- a/drivers/platform/x86/amd/pmc.c
>>>>>> +++ b/drivers/platform/x86/amd/pmc.c
>>>>>> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>>>>>>  	debugfs_remove_recursive(dev->dbgfs_dir);
>>>>>>  }
>>>>>>  
>>>>>> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
>>>>>
>>>>> Does sup refer to "supported" or some other acronym? If the latter,
>>>>
>>>> Yes, please read that as "supported"
>>>>
>>>>> you should mention/open it in the changelog and/or in a comment. If the 
>>>>> former, the function naming seems too generic (an observation entirely 
>>>>> based on how/where the function is used, you're not exactly verbose on 
>>>>> what this actually checks for other than what looks like a set of CPU 
>>>>> IDs but clearly there's more behind it).
>>>>
>>>> OK. renaming the function as amd_pmc_is_cpu_supported() would be fine?
>>>
>>> This makes things odder, it gets used in two places:
>>>
>>> 	if (enable_stb) {
>>> 		if (amd_pmc_check_sup_cpuid(dev))
>>> 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops_v2);
>>> 		else
>>> 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops);
>>> 	}
>>>
>>> What about that else branch (PMC is not supported so who does that make 
>>> sense when the file is called pmc.c)? And here:
>>
>> I did not understand the actual concern.
> 
> The file is cammed pmc.c and states "AMD SoC Power Management Controller 
> Driver", so PMC, right?

Yes.

> 
> You propose adding function called amd_pmc_is_cpu_supported() which to me 
> reads "is PMC supported on this CPU?" since you don't have anything else 
> in the function name to quality a sub-feature that would be be tested for 
> supported or not.

The function naming convention across this file is amd_pmc_*. So would
like to have it as "amd_pmc_is_cpu_supported()". And yes, this should be
generic helper function that should be used across the PMC and STB
functions interchangeably, as the underlying CPU where it runs remains
the same.

> 
> It begs a question, why probe doesn't always return error when PMC is not 
> supported by the CPU? Can you see the problem now?

PMC driver probe happens based on the _HID amd_pmc_acpi_ids[] and probe
failures are handled.

The only intention to look for CPU ID's through the PCI root port is
handle the Firmware changes across CPU generations.

Hope this clears the question.

> 
>> STB is an on-demand debug
>> feature and that can only be enabled when enable_stb module param is set.
>>
>> The check for amd_pmc_check_sup_cpuid() is to see if the underlying CPU
>> (with the right PMFW support) supported is pre-Rembrandt, then Spill to
>> DRAM is not supported. So reading the STB buffer is a different
>> mechanism and that has been handled in the amd_pmc_stb_debugfs_fops().
>> But the platforms after Rmebrandt, supports spilling to DRAM, and that
>> has been handled in amd_pmc_stb_debugfs_fops_v2().
> 
> This kind of information should be stated the changelog up front.

I don't think I am touching that part of the code to explain this stuff
in the changelog.

Let us purely keep this as a helper function to check the underlying CPU
that can be used across the entire pmc.c file. Makes sense?

> 
> So is that function testing support for Spill to DRAM? Clearly, 
> Spill-to-DRAM != PMC, that's the second problem here related to function 
> naming.

PMC driver is a FW assisted driver for S2Idle path on AMD platforms. But
for whatever reason if the Supend/resume fails to happen, we need to
have a debug mechanims to address the field issues.

Since it's FW assisted, the FW also provides a way to know what happened
behind the scenes and that debug mechanism is called STB (Smart Trace
Buffer).

Intially when we started the STB was supposed to be a small interface
and it has evolved a lot over time. And maybe at times you will see that
PMC and STB are used in conjunction.

If its becoming confusing for the community, maybe I will come up with a
way to decouple PMC and STB sometime soon.

Thoughts?

> 
>> What am I missing in your comments?
>>
>>
>>>
>>> static int amd_pmc_probe(...)
>>> {
>>> 	...
>>> 	if (enable_stb && amd_pmc_check_sup_cpuid(dev)) {
>>> 		err = amd_pmc_s2d_init(dev);
>>> 		if (err)
>>> 			...goto + returns error
>>> 	}
>>>
>>>
>>> If enable_stb is not set, pmc not being supported is not going to return 
>>> error?
>>>
>>>
>>
>> here we return only whne there is failure in s2d_init() - right?
>>
>> And yes, if enable_stb is not set, there is no need to init the s2d path.
> 
> s2d is short for Spill to DRAM I guess?

Yes.

> 
> So in both occassions amd_pmc_check_sup_cpuid() testing support for s2d 
> rather than PMC (it certainly looks that way)? If so, name the function 
> accordingly (I suggest amd_pmc_s2d_supported()) and put a little bit more 
> explanation into the changelog and we're done here.
> 
> 

IMHO. Based on the above details, amd_pmc_is_cpu_supported() should be
generic name. Do you still see a concern?

Thanks,
Shyam
