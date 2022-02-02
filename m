Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB90C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Feb 2022 19:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbiBBTII (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Feb 2022 14:08:08 -0500
Received: from mail-dm6nam10on2065.outbound.protection.outlook.com ([40.107.93.65]:49248
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230380AbiBBTIH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Feb 2022 14:08:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAhIn2ReaABEFR/dF/Naj1h1fCoh4S/DgGJTM/O80hPhtXlJggCHwtwVX4EbIySnrVlSgoqbfyWOcKe3PhjobsXH06LL9+aqE2kJYqAKYI9RR6Vt261vKBYacPuHz4VyicuWEPCPn1+G2xIXBrXjYLBaZ0F+K7oGPc/oW1u6qg0OHI3GOuB4C+6Vc15hnh9/AMy2KCBt/WhBQ2xfqMpycllC43HPO8SNHvXUGxOa8GcwbREZDBnm2F+GHxjYHtm15+mgj5jnVNq0KesvqbY6ppWBzYgPmJGZsJixlxJ+FhakDBaGzVDrpBqVNjnk6SaokSI/QCClV7ngTAPvOHhIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enqklI45R+AI3Zp62bwZcQ7ytLhLuc1vrxPZqocbf9w=;
 b=KgBGq/ItDhZXsGu7g7Hk56ysjMNBz/yg93Zb+KiUSRGqoy+cjoPHGn0tw/9gPeFx4IgDxAd8pOeCoqqkU8I2q3MZJy63vXGC/bwZMrVPLPloB4TDdJ+VmSLAxPm4Wxv6YUdZAnFWISz7nwI94Ostj3NhtuIqrAQrKrSN9IFbzV4rh8UPaQ0GZzDk7l8YAptMr7duYCK8NlnKj7Bm62C8t+gW7MAxXYvOs1DxjIWkBfctb9VidgOYNcxrZ9Ey81LQmxXMOUBpt0SiNzRZM+wdI3EmiRWaC8QHApGrplOjT2/8iMI7PtUv4KzkLRGdstN/eYkG2QuNoVR2yf9mymiqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enqklI45R+AI3Zp62bwZcQ7ytLhLuc1vrxPZqocbf9w=;
 b=rfs8p2Pi74yrFxjzHoWDoJ+9klIt448ovYkjWA6q3mitySAuuN3+kG0HKKA8xifS+vlrjufaH0tKf7zhLcnAjHE1AzyQlX+NF60G9R7/yX252C65M180n6SuHyQ63t+aX/sxicwoMBL2LTlfGVyTUN7O7+CNf8x/dcgGe51n9w4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BN6PR12MB1476.namprd12.prod.outlook.com (2603:10b6:405:11::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Wed, 2 Feb
 2022 19:08:05 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c194:a53d:81a2:ddf7]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c194:a53d:81a2:ddf7%7]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 19:08:05 +0000
Message-ID: <b8a09995-91c2-1ef1-a028-0b825f0fcebb@amd.com>
Date:   Thu, 3 Feb 2022 00:37:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] platform/x86: amd-pmc: Add support for AMD Spill to DRAM
 STB feature
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220127100913.2819051-1-Sanket.Goswami@amd.com>
 <eb2b2f5c-a484-72af-b275-297533a84c57@amd.com>
 <b01dd497-2b1d-4d0e-5de6-67081986f066@amd.com>
 <7b3da1a7-cdd0-9ed4-8e0b-91c191ad9166@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <7b3da1a7-cdd0-9ed4-8e0b-91c191ad9166@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR02CA0201.apcprd02.prod.outlook.com
 (2603:1096:201:20::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4336b2f6-ceb4-4916-5dcf-08d9e67f5725
X-MS-TrafficTypeDiagnostic: BN6PR12MB1476:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB147682590936863DBF628CF59A279@BN6PR12MB1476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5doo8xFlVO7zAgCR1dyIjnSKn4ynbYzZuRTBVjQ3IlEfGY3qhKjsYZovzpEDK09/A7TyCUlZ0lvq8wLrKP5TdSrSHJB6Rezu4mpC+EjkqiusuBiRyfuzTbM2cD9KLkD26NHGN9nKnWWFegt682pTuhFVEH35AeehDPdlb9p29LGP7wVh+/G5fh1sv1Wt5UbFTcWS7VXgi7BKYjuNUrW0Ry3hKrskX3DRtPVF7oN1Oz5uyNyFudGmb8ueNjL0NZ1l3E3PuJEHRe9OInxoJmpxGQ+FyB1jgevPSNjCcjYRLjp/WuLUbH6r0aBxvgUNEX3eVLY4ikurMFlMXM2GB9TidvQUtXdSdc9Ch3oJgXnRrJU/IW0E+g+dvl5q5Q7Djx7P9B49PSS5Ww2Kw2q1XobVVZljMV6f56piT2zNX6UQwN6g00jSnsEcOLF0ytxTMatj9iyou9SOcmCbpMAKxXrgGXEpTZf2tcwCLgstsLdj40T6yAF8/XK69is+E55QIzt+K6dvqeywnUMcO25O0asR7EGkBPwtsP4BoP/y499ZMg1egmCSc/pEIr9M+GBwHAZWtdde+vb0CKRYRkQUAtik8T+gCopHg+W8z5n7jOyOIJnVH8oKLm6RXWFbQs8Lv35/OgnwauhM6eVxLev5Wn33SFx6oXbtQWz2VWm/H2N++uE5/WBUTbD/9Wv2K5snoMVjqvdTVqBFjyD9q5kkdhrrlM4dH7mRtGA6mUqJ5UOOTpgZfhGQCRc82mSoQp9mTGOk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(508600001)(31696002)(38100700002)(186003)(2906002)(316002)(83380400001)(26005)(36756003)(6486002)(5660300002)(8676002)(66476007)(110136005)(4326008)(66946007)(8936002)(30864003)(31686004)(6512007)(66556008)(6506007)(53546011)(86362001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2tnOFQ1aDEyWmh2b3VlSThjSlhGNXZDTUw0QWpoUXRyanNpU1JaVnRlRFBL?=
 =?utf-8?B?Q3hYUS9aU21pK0RScVhqaVdYc05VYWRQT0xQMVJEaFFObWhoWCtxQ2pMVjRO?=
 =?utf-8?B?cWZOdmdmNUhKZHQ0dDB0amJ1aG5EOVd0QTRQVjgwWlpYajI5Y1NEbFVvSUYy?=
 =?utf-8?B?dXgvWmluNVFxTXF6dW1JTXZjYit2TUkvUGhBaVdNZ3JBcDIwUkl4TmtIY2da?=
 =?utf-8?B?VFYvRktUSy91MVI1YWlTWEwvYnJTQlU2NVBxVG1IWEhhRzRRaFVTTzdnR2RQ?=
 =?utf-8?B?dFVQZ1NkWXBOaVJCc0Z5MEVqSVo0NzdUcUtLUm5rbmhWZkRtUlIzRndBRDZG?=
 =?utf-8?B?U1FoZlFTMEVtajdKWUhVNnQ0MERCSFp3VjFSSWR0RnBObUpzcHQ1RERoQk83?=
 =?utf-8?B?VTZaUmZIblZtSzBTTFZYSjNQKytoajZOTlIrdnk3YktNMXp4MjlNalA5WXJW?=
 =?utf-8?B?QjBSYTNSdG5VUEh6ZnQrcy9QbXEzb2tHZDRhMEFzQkxHeUFGdmNEYWk1SGZs?=
 =?utf-8?B?cDlOT1dRYXVUMlpBeGNZc1dlMmE5VVhjSDVYdG9URTkrU2VWWHM1YUJiZ0gy?=
 =?utf-8?B?ZURPNVBPM2gzOHBtUjVDMFdHc2x1alVKb2h2bm5raFZxZ2x1b2dqczE3bUk3?=
 =?utf-8?B?NUl3UVNPdmlwNHVNUXhmTHRMQ1VHZWt5QURoV2JkNzlTMlFEUVd4dkdtbk4v?=
 =?utf-8?B?N3dJdEhYV2dSa0U4aFgxNmsrODVqK3VXbm1RWTNVaUI3Yytub29NdTVydGNt?=
 =?utf-8?B?T0RpZUF1VkFYSWJuSUxJU1hRM0wzUzJjWTFmeWJvYjN6OXhmRFJvc1hoM2Z5?=
 =?utf-8?B?VmpYdEN5V2RKVVdvV1h3MmswVVZtekdJRjNWTnExamlrUXpXRG1yTFlCcWRl?=
 =?utf-8?B?UHY2NEZORHIzdWhNOXQveWY0S1hyUklaL05mYmplVG40cE9GY1ZRR1Vta1ZD?=
 =?utf-8?B?RGxpQ3VkM2hObGhKTGdLc3FtOGVWSTJVQWhNK00wY1A4Q3NkVXpsZEZBRXJm?=
 =?utf-8?B?WEl3Q2FxYlNlMzRKcW5JU0hjUkZqQnZ1M2w4dURpb0lrb3ZGVnd4Rk0vdUd0?=
 =?utf-8?B?STd4ZjN3REtURWZ0bWdKUVlLeDdrV1c3bUJRN3VTOC90djFWc3hiUUxOTDVL?=
 =?utf-8?B?YlVRYkh4RlNVZjZIWklscmh3a25hQUN6aHV6b1BLdDNOS0I0RTdPWlp6L3BK?=
 =?utf-8?B?ZElQNUVlMGNqanlvbDV0dUZwS1JXTlVOb3dyR3ZzQ0ZNNWxEOXFuUTdOTzFm?=
 =?utf-8?B?ZW4weTB2bTB1cDNsUTVtQTY4ckN2SUZaVWNEMGU1cU5CVDFtbjExMWRkamJD?=
 =?utf-8?B?aGx1RjA0R0xDLzZFZTVRejE4dlJLN0hmSWJpL0pWMllJNHBjRFQ3STVESzEy?=
 =?utf-8?B?SE9vbE9FOGdIYnRyMzREQnFWdFZrTTF4aEJxUnp6SFJ6aWFQTHBuazN0Q1dU?=
 =?utf-8?B?aXpEUjhXVFR2S1VGMzBZV2l3NnlEV3hHTFNZS0Fock9ZenA5cE1oWmFmUytm?=
 =?utf-8?B?TTMweDZWcCtQNGhtWmVKTkJ0bU03UHdjSXR3em9IK2pUZEpqV3YwVEw1RjJ0?=
 =?utf-8?B?VUNDWk9leXZJOFhpbXdiL3RPL21DSnE1TTI3czJnSUxMNU9uN05BYjhaVlI2?=
 =?utf-8?B?dFd2TlViMHA4SVYvOXk2QlovaWlDd205WmU5Q3BYRi9ITjZoQnJHajFsTFll?=
 =?utf-8?B?NVNtZFdxalVaUnpJejRHWmdORXRXQTFYV3hUZkxwTER2SkVsNSsxMTdWMEMw?=
 =?utf-8?B?OXluM09IbmNyRDJ3a0c3WDBJWXJzRHNzc2h0OWt6dnhHNHN1cFNpMnJYSnlH?=
 =?utf-8?B?VzI5MDRzV1FZNDQ2RC9vN1FwSjhCMzlvSG1YRytLYWppZFJjU0YxSHVnb2ht?=
 =?utf-8?B?RVFackIwVU1uTUkvVnFka2ZjcWJLd0lHa1Jjb3NYdEZ3K1YzNDhRWk52Q2t5?=
 =?utf-8?B?bmJ3ZmR6Y29VN2FZZlliV2JVUTJnbVQyZ0xaOGVXY2JpTGJtQ3VwaVdKY3NW?=
 =?utf-8?B?WThDV09BbVRUakZYRG5zT2oxL01YRUNMQzRlV3E4WUNycGxSN0NpTnJkYTg4?=
 =?utf-8?B?V3NaUTdiNUt0cVlmWVMybkhYb1Z3cTJjWUw5Z0FiRjlNUHFINVpDck9uZzQ3?=
 =?utf-8?B?Z0ZZeU1EM05lSDZxb3ZTd09mSFo5dkR3ZzlFSEhDOVBRMDNucU16YU1EbWtz?=
 =?utf-8?Q?zoiAXvKh3Zo5QdVOcurPWGc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4336b2f6-ceb4-4916-5dcf-08d9e67f5725
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 19:08:05.0387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfflHUtYaw4+aWLAppWn0h0hs28jfLS3bk/tUKm4aMmZ8lCiVPysfsyGiMwDVE/tjGYcnuDxjavi96etwDkIVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1476
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2/2/2022 7:54 PM, Limonciello, Mario wrote:
> On 2/2/2022 00:03, Shyam Sundar S K wrote:
>>
>>
>> On 2/2/2022 10:14 AM, Limonciello, Mario wrote:
>>> On 1/27/2022 04:09, Sanket Goswami wrote:
>>>> Spill to DRAM functionality is a feature that allows STB (Smart Trace
>>>> Buffer) to spill data from SRAM into DRAM on some future AMD ASICs. The
>>>> size allocated for STB is more than the earlier SoC's which helps to
>>>> collect more tracing and telemetry data.
>>>>
>>>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> ---
>>>>    drivers/platform/x86/amd-pmc.c | 132
>>>> +++++++++++++++++++++++++++++----
>>>>    1 file changed, 118 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd-pmc.c
>>>> b/drivers/platform/x86/amd-pmc.c
>>>> index 4c72ba68b315..3040f50627c6 100644
>>>> --- a/drivers/platform/x86/amd-pmc.c
>>>> +++ b/drivers/platform/x86/amd-pmc.c
>>>> @@ -41,6 +41,16 @@
>>>>    #define AMD_PMC_STB_PMI_0        0x03E30600
>>>>    #define AMD_PMC_STB_PREDEF        0xC6000001
>>>>    +/* STB S2D(Spill to DRAM) has different message port offset */
>>>> +#define STB_SPILL_TO_DRAM        0xBE
>>>> +#define AMD_S2D_REGISTER_MESSAGE    0xA20
>>>> +#define AMD_S2D_REGISTER_RESPONSE    0xA80
>>>> +#define AMD_S2D_REGISTER_ARGUMENT    0xA88
>>>> +
>>>> +/* STB Spill to DRAM Parameters */
>>>> +#define S2D_TELEMETRY_BYTES_MAX        0x100000
>>>> +#define S2D_TELEMETRY_DRAMBYTES_MAX    0x1000000
>>>
>>> Why have two separate definitions for the same value?  Is there a case
>>> that these will ever be different?
>>
>> Values are different right? _BYTES_MAX is 1M and _DRAM_MAX is 16M
> 
> Sorry, my mistake when I looked - yes.
> 
>>
>>>
>>>> +
>>>>    /* Base address of SMU for mapping physical address to virtual
>>>> address */
>>>>    #define AMD_PMC_SMU_INDEX_ADDRESS    0xB8
>>>>    #define AMD_PMC_SMU_INDEX_DATA        0xBC
>>>> @@ -95,6 +105,13 @@ enum amd_pmc_def {
>>>>        MSG_OS_HINT_RN,
>>>>    };
>>>>    +enum s2d_arg {
>>>> +    S2D_TELEMETRY_SIZE = 0x01,
>>>> +    S2D_PHYS_ADDR_LOW,
>>>> +    S2D_PHYS_ADDR_HIGH,
>>>> +    S2D_NUM_SAMPLES,
>>>> +};
>>>> +
>>>>    struct amd_pmc_bit_map {
>>>>        const char *name;
>>>>        u32 bit_mask;
>>>> @@ -119,7 +136,9 @@ static const struct amd_pmc_bit_map soc15_ip_blk[]
>>>> = {
>>>>    struct amd_pmc_dev {
>>>>        void __iomem *regbase;
>>>>        void __iomem *smu_virt_addr;
>>>> +    void __iomem *stb_virt_addr;
>>>>        void __iomem *fch_virt_addr;
>>>> +    bool msg_port;
>>>>        u32 base_addr;
>>>>        u32 cpu_id;
>>>>        u32 active_ips;
>>>> @@ -236,6 +255,65 @@ static const struct file_operations
>>>> amd_pmc_stb_debugfs_fops = {
>>>>        .release = amd_pmc_stb_debugfs_release,
>>>>    };
>>>>    +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct
>>>> file *filp)
>>>> +{
>>>> +    struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>>> +    u32 *buf, phys_addr_low, phys_addr_hi, size, samples;
>>>> +    u64 stb_phys_addr;
>>>> +
>>>> +    /* Spill to DRAM feature uses separate SMU message port */
>>>> +    dev->msg_port = 1;
>>>
>>> This message port is only used for STD right?  Existing messages for
>>> version, OS_HINT and the like should go through the old port.
>>
>> msg_port is a flag to decide whether to use the regular PMC port or the
>> new STB port defined for Spill-to-DRAM feature.
>>
>> Both are complementary. Spill-to-DRAM will only be enabled in Yellow
>> Carp and future ASICs and lower than that the new message port will not
>> be enabled.
>>
>> The decision of whether to use v2 or v1 versions of debugfs is being
>> taken in the debugfs creation with a cpuid check and hence I believe the
>> versions/OS_HINT will not collide.
>>
>> Also, this change has to tested several iterations on older and newer
>> platforms before it was posted here. So, based that this we should
>> ignore any such concerns around the OS_HINT.
>>  >>
>>> You don't seem to ever unset this, so I think if the STB was opened
>>> before S0i3 was invoked I would think it would cause the OS_HINT message
>>> to be sent to the wrong port wouldn't it?
>>
>> I tried to cover this in the above details. No, it would not cause HINT
>> to be sent to wrong message port.
> 
> I don't think you followed my thought process here.
> 
> If `amd_pmc_stb_debugfs_open_v2` is called then dev->msg_port is set to 1.
> 
> So that means that any future call to `amd_pmc_send_cmd` (such as is
> done for OS_HINT) will use the STD registers.  So doesn't that mean
> OS_HINT is sent to STD registers?
> 
> If STD registers support all the existing commands as the PMC registers
> this is fine, otherwise I think there needs to be more logic to check
> whether the command is PMC or STD related.

ah..I get your point now..

> 
>>
>>>
>>> It might be safer to modify amd_pmc_send_cmd to have an extra argument
>>> of which port to use in each invocation.  Then only in debugfs_v2
>>> operations you can use this port.
>>>
>>>> +
>>>> +    amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size,
>>>> STB_SPILL_TO_DRAM, 1);
>>>> +    if (size != S2D_TELEMETRY_BYTES_MAX)
>>>> +        return -EIO;
>>>
>>> What if the firmware was configured to use less than 16MB?  Shouldn't
>>> you be able to respect that?
>>
>> That is why there is a seperate call to fetch the S2D(Spill-to-DRAM)
>> size which the FW has configured it for notifying it to the driver.
> 
> But you only allow size to be S2D_TELEMETRY_BYTES_MAX, shouldn't you be
> flexible to a range of what the firmware returns rather than the single
> value?

the value is derived after querying the FW, atleast by design today for
yellow carp devices the FW team has confirmed that it shall remain 1M
(even the next ASIC version too).

> 
>>
>> Btw, though 16M is the max DRAM carved out space for 16M, but currently
>> only 1M is allocated to get the full STB dumps from DRAM space and this
>> by design. We have the same change on the windows side too.
>>
>>>
>>> I would think you instead want to have a boundary check on the "max" to
>>> support.
>>
>> Above explanation should hopefully address this.
>>
>>>
>>>> +
>>>> +    /* Get STB DRAM address */
>>>> +    amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low,
>>>> STB_SPILL_TO_DRAM, 1);
>>>> +    amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi,
>>>> STB_SPILL_TO_DRAM, 1);
>>>> +
>>>> +    /* Get the number of samples present in the STB buffer */
>>>> +    amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &samples,
>>>> STB_SPILL_TO_DRAM, 1);
>>>> +    stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>>>> +
>>>> +    dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr,
>>>> S2D_TELEMETRY_DRAMBYTES_MAX);
>>>> +    if (!dev->stb_virt_addr)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>>> +    if (!buf)
>>>> +        return -ENOMEM;
>>>
>>> Shouldn't you clear the iomapping for dev->stb_virt_addr on this
>>> failure?
>>
>> I believe, that is why we use managed devm_*() APIs which is supposed to
>>   take care of reducing the reference counts ?
> 
> I think those only take account when unloading the driver or unbinding
> the device though, don't they?  So if devm_ioremap worked but kzalloc
> failed then you call `amd_pmc_stb_debugfs_open_v2` again without unbind
> or unload driver devm_ioremap will be called again too.

Makes sense. Will move them to a new routine maybe something like
amd_pmc_s2d_init() and call that from the probe() so that should address
this problem.

shall respin a new revision.

Thanks,
Shyam

> 
>>
>> Thanks,
>> Shyam
>>
>>>
>>>> +
>>>> +    memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
>>>> +
>>>> +    filp->private_data = buf;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char
>>>> __user *buf, size_t size,
>>>> +                       loff_t *pos)
>>>> +{
>>>> +    if (!filp->private_data)
>>>> +        return -EINVAL;
>>>> +
>>>> +    return simple_read_from_buffer(buf, size, pos, filp->private_data,
>>>> +                    S2D_TELEMETRY_BYTES_MAX);
>>>> +}
>>>> +
>>>> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct
>>>> file *filp)
>>>> +{
>>>> +    kfree(filp->private_data);
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>>>> +    .owner = THIS_MODULE,
>>>> +    .open = amd_pmc_stb_debugfs_open_v2,
>>>> +    .read = amd_pmc_stb_debugfs_read_v2,
>>>> +    .release = amd_pmc_stb_debugfs_release_v2,
>>>> +};
>>>> +
>>>>    static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct
>>>> device *dev,
>>>>                     struct seq_file *s)
>>>>    {
>>>> @@ -350,9 +428,14 @@ static void amd_pmc_dbgfs_register(struct
>>>> amd_pmc_dev *dev)
>>>>        debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir,
>>>> dev,
>>>>                    &amd_pmc_idlemask_fops);
>>>>        /* Enable STB only when the module_param is set */
>>>> -    if (enable_stb)
>>>> -        debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>>> -                    &amd_pmc_stb_debugfs_fops);
>>>> +    if (enable_stb) {
>>>> +        if (dev->cpu_id == AMD_CPU_ID_YC)
>>>> +            debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>>> +                        &amd_pmc_stb_debugfs_fops_v2);
>>>> +        else
>>>> +            debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>>> +                        &amd_pmc_stb_debugfs_fops);
>>>> +    }
>>>>    }
>>>>    #else
>>>>    static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>>> @@ -392,26 +475,47 @@ static int amd_pmc_setup_smu_logging(struct
>>>> amd_pmc_dev *dev)
>>>>      static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>>>>    {
>>>> -    u32 value;
>>>> +    u32 value, message, argument, response;
>>>> +
>>>> +    if (dev->msg_port) {
>>>> +        message = AMD_S2D_REGISTER_MESSAGE;
>>>> +        argument = AMD_S2D_REGISTER_ARGUMENT;
>>>> +        response = AMD_S2D_REGISTER_RESPONSE;
>>>> +    } else {
>>>> +        message = AMD_PMC_REGISTER_MESSAGE;
>>>> +        argument = AMD_PMC_REGISTER_ARGUMENT;
>>>> +        response = AMD_PMC_REGISTER_RESPONSE;
>>>> +    }
>>>>    -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
>>>> +    value = amd_pmc_reg_read(dev, response);
>>>>        dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
>>>>    -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
>>>> +    value = amd_pmc_reg_read(dev, argument);
>>>>        dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
>>>>    -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
>>>> +    value = amd_pmc_reg_read(dev, message);
>>>>        dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
>>>>    }
>>>>      static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32
>>>> *data, u8 msg, bool ret)
>>>>    {
>>>>        int rc;
>>>> -    u32 val;
>>>> +    u32 val, message, argument, response;
>>>>          mutex_lock(&dev->lock);
>>>> +
>>>> +    if (dev->msg_port) {
>>>> +        message = AMD_S2D_REGISTER_MESSAGE;
>>>> +        argument = AMD_S2D_REGISTER_ARGUMENT;
>>>> +        response = AMD_S2D_REGISTER_RESPONSE;
>>>> +    } else {
>>>> +        message = AMD_PMC_REGISTER_MESSAGE;
>>>> +        argument = AMD_PMC_REGISTER_ARGUMENT;
>>>> +        response = AMD_PMC_REGISTER_RESPONSE;
>>>> +    }
>>>> +
>>>>        /* Wait until we get a valid response */
>>>> -    rc = readx_poll_timeout(ioread32, dev->regbase +
>>>> AMD_PMC_REGISTER_RESPONSE,
>>>> +    rc = readx_poll_timeout(ioread32, dev->regbase + response,
>>>>                    val, val != 0, PMC_MSG_DELAY_MIN_US,
>>>>                    PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>>>>        if (rc) {
>>>> @@ -420,16 +524,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev
>>>> *dev, u32 arg, u32 *data, u8 msg,
>>>>        }
>>>>          /* Write zero to response register */
>>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
>>>> +    amd_pmc_reg_write(dev, response, 0);
>>>>          /* Write argument into response register */
>>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
>>>> +    amd_pmc_reg_write(dev, argument, arg);
>>>>          /* Write message ID to message ID register */
>>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
>>>> +    amd_pmc_reg_write(dev, message, msg);
>>>>          /* Wait until we get a valid response */
>>>> -    rc = readx_poll_timeout(ioread32, dev->regbase +
>>>> AMD_PMC_REGISTER_RESPONSE,
>>>> +    rc = readx_poll_timeout(ioread32, dev->regbase + response,
>>>>                    val, val != 0, PMC_MSG_DELAY_MIN_US,
>>>>                    PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>>>>        if (rc) {
>>>> @@ -442,7 +546,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev
>>>> *dev, u32 arg, u32 *data, u8 msg,
>>>>            if (ret) {
>>>>                /* PMFW may take longer time to return back the data */
>>>>                usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>>>> -            *data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
>>>> +            *data = amd_pmc_reg_read(dev, argument);
>>>>            }
>>>>            break;
>>>>        case AMD_PMC_RESULT_CMD_REJECT_BUSY:
>>>
> 
