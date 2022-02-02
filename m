Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A080C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Feb 2022 14:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344879AbiBBOY0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Feb 2022 09:24:26 -0500
Received: from mail-dm6nam12on2047.outbound.protection.outlook.com ([40.107.243.47]:9792
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232389AbiBBOY0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Feb 2022 09:24:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYRIEOXEkyXv0/J+799cTgcCD+A0nmnvS7tMfKTo4QUGFZvJkAl9tWFf8dydLx1ChldiCQDAmnwtju1JjuzmOZAIz3OXI9fTfaX2PdFVjSwiCtjGYDRegW2DaUYTWPCrFIQBu9xQ5DkMk1FF93y6iXQ2m5BE5/0oFu8dJP1vxhz5aN14l6tovRzFwGiNjDWicxkwBsBs4zWwG7ghEkS6pLkEGk36mJi+HMRvijxMJj/3OmObON5fkKBOEGYK1jRT6ociD9pP6gEJyCzgGD2biP3e30QL2ZG4cXfcDTXn2dTC0vSC9bemchOO73Uox1jqYqVQ0Yaz6+CYd4mwF9qesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7HLOr+Ch01sFdPLCswbHYouLYdMxKneaR6l4Wjnwjc=;
 b=SYlf09oSpkTu0wTcdkzuUwSq1D2aZCZc8aPj5SlULmllbgMqfNlsznzi1clusUJda5xRQgWjtpNtw35aLUT3dq3TfvuzVBH25sKvusVaVgo4reBXVbxb2lbPf4POjHKoyyIwQGIhyGyQbr6S1cFfxPt7IzU/Ef8grfmsxu+CESkFIZOiDAqtQvZ1pFr6TGAHf0auh/22DE7+n5h+bq2j1uJX8CHSDMDZ175gfLyaa+cGfL1qyqPR2oY2izHOlPgLNzyt6DYd4nscu/Y614EUgoOruIlGeap3rweh1DSKNHLtuLIlc7xNCgZkElhZVRgw2GbHOeUFLWBg+TsJ1fJo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7HLOr+Ch01sFdPLCswbHYouLYdMxKneaR6l4Wjnwjc=;
 b=dSo38brW++qCMxHPSy1MAdhDSTaoXVWSxNLPnSN5N3VpqRyIKVa50MHimAGRyoLqeiywOGg7q3oIbE04kFCebynL8hugQaSsHrHLq5y67o45L7hCnOfSFMJfCHEzTkT2h1J1F5TI+sg3Y+omnYzI08qSamqFe5vCqy58jo2ilbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 14:24:23 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:24:23 +0000
Message-ID: <7b3da1a7-cdd0-9ed4-8e0b-91c191ad9166@amd.com>
Date:   Wed, 2 Feb 2022 08:24:21 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] platform/x86: amd-pmc: Add support for AMD Spill to DRAM
 STB feature
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220127100913.2819051-1-Sanket.Goswami@amd.com>
 <eb2b2f5c-a484-72af-b275-297533a84c57@amd.com>
 <b01dd497-2b1d-4d0e-5de6-67081986f066@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <b01dd497-2b1d-4d0e-5de6-67081986f066@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR01CA0005.prod.exchangelabs.com (2603:10b6:208:10c::18)
 To BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3d9c876-e1f8-4d36-fae7-08d9e657b5b6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB48470F3543D1D03A540302B4E2279@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCapWVU/xOp1WEohO9Gy13aCnya4tgub1ezZczyKEuLvMDhaABsmFpaTBy0sUZluVZT6FYDC+qJmwwykHdRfcE6orcaf0nu43333lQDmM+R9O0R6iJ2Ixp6kuLZXYQZ1ThAwNnJmwVlKsyoucF8TUmB8EOLQxQodbW5S3l5kJlJ9YTMcgoItqiUXzCOsXSamBoO05zu8ptWWXV2W5G9Vq3yk12gHzdqGXIogqONb9WOsjuzrquzLX/LOuOIZlUCT2LAoC8DIxWKxScpzziyOP/H5PR6Vl2Y4o5deWvUpJ4377+tnN/7hhxofm1Etq4BCvc5j1lwzcJ2JEhyqD+avl4JYemW/6JxiI8vB11NBawxuvQLGHlcs24VS6O/tjHaT9c13DlbWdBCjluPCp3kxYfJjwDa79WBvK1ToS0WEcDoaflRgevh5RhLFmKks8SXaXwyv9GOKCWq5aZ4h6LVIUaCz7Sw9QVvl2LUkC2tTP1ZjxpR6UWDYnHQuPZDdIwen7/bhAP0L+7Gxz+tw7lRs9aZUob3WKS3f3wW3+iBFvoVcAkpShrCMrIH1iN+6EuVH5at0TTPwchqdqIDLhm21f1Zw9OCZoNL+afT6vvwxV6K6nBq1WT1loBmYnktmbAT+TsaH64yOm+kw+yqJG2MVFptSW6wI6L0kluEUEfGCrIrKQ4J95nvhYOxAzd81CoeWgR/LTki/f30IM4ZN8jZeaOdcK2jUs7fIuLb4Sk9FHkKmyheiwak5wEBadYBgnFVI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(66946007)(66556008)(66476007)(83380400001)(6506007)(86362001)(8676002)(4326008)(31696002)(30864003)(8936002)(2616005)(38100700002)(31686004)(6512007)(508600001)(186003)(26005)(5660300002)(36756003)(53546011)(110136005)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1luYzVITmRvMEptR3dGaFMwQzVyWEc4RTQwcFNpSjFKcW56aDFTTmJMNGFK?=
 =?utf-8?B?Vzc0R0FVZVJmN3RGSWhJMHcyOVh3dXhKTDRkQmlmdy9YSllFOFgxYU1NRS9j?=
 =?utf-8?B?RVVCTkVwS25VSzk3U2FIT244amJPcHFVb0VHL0JLVlZlS21kVm9QYjJqOUdI?=
 =?utf-8?B?Y2pUT0tQRnRYOGVUMktDS2Y5RGlMaDJMYmlDaVR1WStiaHdueUJMLzZ4NEVv?=
 =?utf-8?B?ZEw2cGROaklMUVFpVitYUTU2MzRWNHF1WjNGN1ZSZzRRaGhvV0xHRWN6UFlC?=
 =?utf-8?B?TW85UllNR1hTeWRyZTNqM3dscm1ZRVRMSUdSSG42Zi9WSGlGV3N1djBQcTNy?=
 =?utf-8?B?VmFhc3V1N2NTK0JPT2hNcTQ4eUhObmttQmhFUVFkOWp4R1VmV0R1UGp6bWdh?=
 =?utf-8?B?SW1aVjdrL3BkZ3J6eHUxS0RuNmtiNWF4QXJFTnh4UWNxUTJjTitrOXBVSUJw?=
 =?utf-8?B?SnBCSDlBdFRNWU9Na0J5VEtaeXZqZ1k4TVJKdjUzRHpTSjJUYjFvUEFNa3NH?=
 =?utf-8?B?cWx1RVJQU3N1UnJWQWF3N3F4NWhaRk9rVENuMUErQXE3WHNkcEZLNlRYU0h1?=
 =?utf-8?B?bE9NeHhseFN3YWR2WTIrUTIvM21WdzNIUFRpdTRBVkZ5MFpLMS9CWnJlemVJ?=
 =?utf-8?B?S3FCd05GOGNvK3NVb003L0M0dC8ydzlIL3hMaHFxeWVZMlhlV3RjOXJVanVB?=
 =?utf-8?B?akdMVHFNeHdMNTdvMGNxUnRucGVRMzlFQkhMOUp4Y2JVaUxCWld1N243NU05?=
 =?utf-8?B?MGprRGl5ZkZrekFmMUk3QnhyS2kxS3UvUUNRZlYwemdpS245OFBGT2xNelZN?=
 =?utf-8?B?c1d5WHNsT1ZUVFJmOGRYWmZsT2FzdXhUYXB3b1dEK05GTytDa2Z5Y3VDY0pC?=
 =?utf-8?B?SUtzSFgremI1VDNnVmUrQytwaU9rQTRxc2pzZEhPbmE2b2Z0SkpqNnJ5RTR2?=
 =?utf-8?B?a3l0dXh1cTBSWVJ2ckhmZnFxZVJrMHVybEJwb3dweU5sZjRtRGZ1WmQ2WVpR?=
 =?utf-8?B?anMvOFM0VWtJR0ROdHVBcW5DS2U4L0VZREZDL04rZWJkVnkreU1RNGNUUFgw?=
 =?utf-8?B?RXFFUzRyTWExSXFiZ0Y3Z1hNVnUwUXVKbFhsMmgvcmljby8yT0FoN0lFNkNK?=
 =?utf-8?B?enpDYnV3cVc0U2JFWHRCTUdDUmZLeDJYUU1Ja1Uvakp6OUlicUVEbXhqSGVD?=
 =?utf-8?B?cmJwQ1lGZGdPLzRqaHV6QzFQQUU0TDdQc0lKSTdXSlJJaFFkdjdDQ0Y1S1g0?=
 =?utf-8?B?MEZkZG5zSnRUTFZ5V2tlZ1MyaitLWXJ6SHdFOEtuNmEwK2t3NU5DeWpRVVFO?=
 =?utf-8?B?Qm5TRzR6Qm5peUFnMzRFaFBKbHVzZm8yVk92QXo3R0RpTGRLdGxsU01Relhw?=
 =?utf-8?B?K3NkdHZTN2J3VGkvZU5Nb05LUFM1Y3FXVDcxZDliOHMwVUNyN2thLzRCY3ht?=
 =?utf-8?B?eHdJSE1TRG1JV1RUNG9hSUtKRHhqaDZFM1Nyc0REaTJZanVuVnlYY1V0VGNU?=
 =?utf-8?B?c2VpU2RTMXpab0RYc1EzNVNjUkRmQ0hub05tVEsvTDltS2lPK1pEUEtNMDVZ?=
 =?utf-8?B?VW1NYmRGakhuNEhCV1AzaDFZTmNnSHFlZkJhS2dObUVSaTQzQjBpclU3VnpK?=
 =?utf-8?B?K2pBQlAzSWM5Yks4UW9MbDJCVEZQT0NXUmx6UnE3N0JlcWhZb0FaN2JqQ2pX?=
 =?utf-8?B?N1hvbjYxYzIzRy93T1FQcGx6anNOMHlpT1VER2N6RFRyWENLdmV3YmdZcFA2?=
 =?utf-8?B?ckJOTHQ1RXRjbWRqU0NRZkM2VVBPR0NDeDNkbk5TZzdqalV6Qm9VazVLMXVt?=
 =?utf-8?B?ak9Fb2g1eHV2eWIvelh5bjB1ODJLakt1aUptUjR2SFprQzJMUFZmNGpJLzFX?=
 =?utf-8?B?TTdVbDlNYXY0TVR5dkNCeWh5eEJIT3AyNnA3Y0NINDl2MmlhL2NiL205T25H?=
 =?utf-8?B?cmNxY3JoVU85b3ZnWE5Xb1ZlVEF3aWdZeUFOUFJUeER0QmQwR0lHWkVHNEpq?=
 =?utf-8?B?SzJWKzZvbWJ4ZWNCZHA5Y0ZsT24rYkhaTmlxMjZvSFlWaWhMZ2RzR2s4aktv?=
 =?utf-8?B?SU85QzlCa2xHMlBueG1KZ3Q1cVFscG5JU0xZd3VDSTlGNjBpdytLbjErWkti?=
 =?utf-8?B?cW4ydUNNWHlFWGVkeEVnRnZ3cS8wWVJrUWJ0OFJzK1BtbC9UWWloTndYOHpN?=
 =?utf-8?Q?/v8iEnvWvAuHkHT/djGQB3Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d9c876-e1f8-4d36-fae7-08d9e657b5b6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:24:23.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2IlLysnyEIKGeZwo4/psX/+pY1ZvKUatheKtJZvNpaGuC2ZzYvcwURN7+cfoJoMyGRVBO2dyZ/6JpcQwZ7nYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/2/2022 00:03, Shyam Sundar S K wrote:
> 
> 
> On 2/2/2022 10:14 AM, Limonciello, Mario wrote:
>> On 1/27/2022 04:09, Sanket Goswami wrote:
>>> Spill to DRAM functionality is a feature that allows STB (Smart Trace
>>> Buffer) to spill data from SRAM into DRAM on some future AMD ASICs. The
>>> size allocated for STB is more than the earlier SoC's which helps to
>>> collect more tracing and telemetry data.
>>>
>>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> ---
>>>    drivers/platform/x86/amd-pmc.c | 132 +++++++++++++++++++++++++++++----
>>>    1 file changed, 118 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd-pmc.c
>>> b/drivers/platform/x86/amd-pmc.c
>>> index 4c72ba68b315..3040f50627c6 100644
>>> --- a/drivers/platform/x86/amd-pmc.c
>>> +++ b/drivers/platform/x86/amd-pmc.c
>>> @@ -41,6 +41,16 @@
>>>    #define AMD_PMC_STB_PMI_0        0x03E30600
>>>    #define AMD_PMC_STB_PREDEF        0xC6000001
>>>    +/* STB S2D(Spill to DRAM) has different message port offset */
>>> +#define STB_SPILL_TO_DRAM        0xBE
>>> +#define AMD_S2D_REGISTER_MESSAGE    0xA20
>>> +#define AMD_S2D_REGISTER_RESPONSE    0xA80
>>> +#define AMD_S2D_REGISTER_ARGUMENT    0xA88
>>> +
>>> +/* STB Spill to DRAM Parameters */
>>> +#define S2D_TELEMETRY_BYTES_MAX        0x100000
>>> +#define S2D_TELEMETRY_DRAMBYTES_MAX    0x1000000
>>
>> Why have two separate definitions for the same value?  Is there a case
>> that these will ever be different?
> 
> Values are different right? _BYTES_MAX is 1M and _DRAM_MAX is 16M

Sorry, my mistake when I looked - yes.

> 
>>
>>> +
>>>    /* Base address of SMU for mapping physical address to virtual
>>> address */
>>>    #define AMD_PMC_SMU_INDEX_ADDRESS    0xB8
>>>    #define AMD_PMC_SMU_INDEX_DATA        0xBC
>>> @@ -95,6 +105,13 @@ enum amd_pmc_def {
>>>        MSG_OS_HINT_RN,
>>>    };
>>>    +enum s2d_arg {
>>> +    S2D_TELEMETRY_SIZE = 0x01,
>>> +    S2D_PHYS_ADDR_LOW,
>>> +    S2D_PHYS_ADDR_HIGH,
>>> +    S2D_NUM_SAMPLES,
>>> +};
>>> +
>>>    struct amd_pmc_bit_map {
>>>        const char *name;
>>>        u32 bit_mask;
>>> @@ -119,7 +136,9 @@ static const struct amd_pmc_bit_map soc15_ip_blk[]
>>> = {
>>>    struct amd_pmc_dev {
>>>        void __iomem *regbase;
>>>        void __iomem *smu_virt_addr;
>>> +    void __iomem *stb_virt_addr;
>>>        void __iomem *fch_virt_addr;
>>> +    bool msg_port;
>>>        u32 base_addr;
>>>        u32 cpu_id;
>>>        u32 active_ips;
>>> @@ -236,6 +255,65 @@ static const struct file_operations
>>> amd_pmc_stb_debugfs_fops = {
>>>        .release = amd_pmc_stb_debugfs_release,
>>>    };
>>>    +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct
>>> file *filp)
>>> +{
>>> +    struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>> +    u32 *buf, phys_addr_low, phys_addr_hi, size, samples;
>>> +    u64 stb_phys_addr;
>>> +
>>> +    /* Spill to DRAM feature uses separate SMU message port */
>>> +    dev->msg_port = 1;
>>
>> This message port is only used for STD right?  Existing messages for
>> version, OS_HINT and the like should go through the old port.
> 
> msg_port is a flag to decide whether to use the regular PMC port or the
> new STB port defined for Spill-to-DRAM feature.
> 
> Both are complementary. Spill-to-DRAM will only be enabled in Yellow
> Carp and future ASICs and lower than that the new message port will not
> be enabled.
> 
> The decision of whether to use v2 or v1 versions of debugfs is being
> taken in the debugfs creation with a cpuid check and hence I believe the
> versions/OS_HINT will not collide.
> 
> Also, this change has to tested several iterations on older and newer
> platforms before it was posted here. So, based that this we should
> ignore any such concerns around the OS_HINT.
>  >>
>> You don't seem to ever unset this, so I think if the STB was opened
>> before S0i3 was invoked I would think it would cause the OS_HINT message
>> to be sent to the wrong port wouldn't it?
> 
> I tried to cover this in the above details. No, it would not cause HINT
> to be sent to wrong message port.

I don't think you followed my thought process here.

If `amd_pmc_stb_debugfs_open_v2` is called then dev->msg_port is set to 1.

So that means that any future call to `amd_pmc_send_cmd` (such as is 
done for OS_HINT) will use the STD registers.  So doesn't that mean 
OS_HINT is sent to STD registers?

If STD registers support all the existing commands as the PMC registers 
this is fine, otherwise I think there needs to be more logic to check 
whether the command is PMC or STD related.

> 
>>
>> It might be safer to modify amd_pmc_send_cmd to have an extra argument
>> of which port to use in each invocation.  Then only in debugfs_v2
>> operations you can use this port.
>>
>>> +
>>> +    amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size,
>>> STB_SPILL_TO_DRAM, 1);
>>> +    if (size != S2D_TELEMETRY_BYTES_MAX)
>>> +        return -EIO;
>>
>> What if the firmware was configured to use less than 16MB?  Shouldn't
>> you be able to respect that?
> 
> That is why there is a seperate call to fetch the S2D(Spill-to-DRAM)
> size which the FW has configured it for notifying it to the driver.

But you only allow size to be S2D_TELEMETRY_BYTES_MAX, shouldn't you be 
flexible to a range of what the firmware returns rather than the single 
value?

> 
> Btw, though 16M is the max DRAM carved out space for 16M, but currently
> only 1M is allocated to get the full STB dumps from DRAM space and this
> by design. We have the same change on the windows side too.
> 
>>
>> I would think you instead want to have a boundary check on the "max" to
>> support.
> 
> Above explanation should hopefully address this.
> 
>>
>>> +
>>> +    /* Get STB DRAM address */
>>> +    amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low,
>>> STB_SPILL_TO_DRAM, 1);
>>> +    amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi,
>>> STB_SPILL_TO_DRAM, 1);
>>> +
>>> +    /* Get the number of samples present in the STB buffer */
>>> +    amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &samples,
>>> STB_SPILL_TO_DRAM, 1);
>>> +    stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>>> +
>>> +    dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr,
>>> S2D_TELEMETRY_DRAMBYTES_MAX);
>>> +    if (!dev->stb_virt_addr)
>>> +        return -ENOMEM;
>>> +
>>> +    buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>> +    if (!buf)
>>> +        return -ENOMEM;
>>
>> Shouldn't you clear the iomapping for dev->stb_virt_addr on this failure?
> 
> I believe, that is why we use managed devm_*() APIs which is supposed to
>   take care of reducing the reference counts ?

I think those only take account when unloading the driver or unbinding 
the device though, don't they?  So if devm_ioremap worked but kzalloc 
failed then you call `amd_pmc_stb_debugfs_open_v2` again without unbind 
or unload driver devm_ioremap will be called again too.

> 
> Thanks,
> Shyam
> 
>>
>>> +
>>> +    memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
>>> +
>>> +    filp->private_data = buf;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char
>>> __user *buf, size_t size,
>>> +                       loff_t *pos)
>>> +{
>>> +    if (!filp->private_data)
>>> +        return -EINVAL;
>>> +
>>> +    return simple_read_from_buffer(buf, size, pos, filp->private_data,
>>> +                    S2D_TELEMETRY_BYTES_MAX);
>>> +}
>>> +
>>> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct
>>> file *filp)
>>> +{
>>> +    kfree(filp->private_data);
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>>> +    .owner = THIS_MODULE,
>>> +    .open = amd_pmc_stb_debugfs_open_v2,
>>> +    .read = amd_pmc_stb_debugfs_read_v2,
>>> +    .release = amd_pmc_stb_debugfs_release_v2,
>>> +};
>>> +
>>>    static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct
>>> device *dev,
>>>                     struct seq_file *s)
>>>    {
>>> @@ -350,9 +428,14 @@ static void amd_pmc_dbgfs_register(struct
>>> amd_pmc_dev *dev)
>>>        debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>>>                    &amd_pmc_idlemask_fops);
>>>        /* Enable STB only when the module_param is set */
>>> -    if (enable_stb)
>>> -        debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>> -                    &amd_pmc_stb_debugfs_fops);
>>> +    if (enable_stb) {
>>> +        if (dev->cpu_id == AMD_CPU_ID_YC)
>>> +            debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>> +                        &amd_pmc_stb_debugfs_fops_v2);
>>> +        else
>>> +            debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>> +                        &amd_pmc_stb_debugfs_fops);
>>> +    }
>>>    }
>>>    #else
>>>    static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>> @@ -392,26 +475,47 @@ static int amd_pmc_setup_smu_logging(struct
>>> amd_pmc_dev *dev)
>>>      static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>>>    {
>>> -    u32 value;
>>> +    u32 value, message, argument, response;
>>> +
>>> +    if (dev->msg_port) {
>>> +        message = AMD_S2D_REGISTER_MESSAGE;
>>> +        argument = AMD_S2D_REGISTER_ARGUMENT;
>>> +        response = AMD_S2D_REGISTER_RESPONSE;
>>> +    } else {
>>> +        message = AMD_PMC_REGISTER_MESSAGE;
>>> +        argument = AMD_PMC_REGISTER_ARGUMENT;
>>> +        response = AMD_PMC_REGISTER_RESPONSE;
>>> +    }
>>>    -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
>>> +    value = amd_pmc_reg_read(dev, response);
>>>        dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
>>>    -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
>>> +    value = amd_pmc_reg_read(dev, argument);
>>>        dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
>>>    -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
>>> +    value = amd_pmc_reg_read(dev, message);
>>>        dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
>>>    }
>>>      static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32
>>> *data, u8 msg, bool ret)
>>>    {
>>>        int rc;
>>> -    u32 val;
>>> +    u32 val, message, argument, response;
>>>          mutex_lock(&dev->lock);
>>> +
>>> +    if (dev->msg_port) {
>>> +        message = AMD_S2D_REGISTER_MESSAGE;
>>> +        argument = AMD_S2D_REGISTER_ARGUMENT;
>>> +        response = AMD_S2D_REGISTER_RESPONSE;
>>> +    } else {
>>> +        message = AMD_PMC_REGISTER_MESSAGE;
>>> +        argument = AMD_PMC_REGISTER_ARGUMENT;
>>> +        response = AMD_PMC_REGISTER_RESPONSE;
>>> +    }
>>> +
>>>        /* Wait until we get a valid response */
>>> -    rc = readx_poll_timeout(ioread32, dev->regbase +
>>> AMD_PMC_REGISTER_RESPONSE,
>>> +    rc = readx_poll_timeout(ioread32, dev->regbase + response,
>>>                    val, val != 0, PMC_MSG_DELAY_MIN_US,
>>>                    PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>>>        if (rc) {
>>> @@ -420,16 +524,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev
>>> *dev, u32 arg, u32 *data, u8 msg,
>>>        }
>>>          /* Write zero to response register */
>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
>>> +    amd_pmc_reg_write(dev, response, 0);
>>>          /* Write argument into response register */
>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
>>> +    amd_pmc_reg_write(dev, argument, arg);
>>>          /* Write message ID to message ID register */
>>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
>>> +    amd_pmc_reg_write(dev, message, msg);
>>>          /* Wait until we get a valid response */
>>> -    rc = readx_poll_timeout(ioread32, dev->regbase +
>>> AMD_PMC_REGISTER_RESPONSE,
>>> +    rc = readx_poll_timeout(ioread32, dev->regbase + response,
>>>                    val, val != 0, PMC_MSG_DELAY_MIN_US,
>>>                    PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>>>        if (rc) {
>>> @@ -442,7 +546,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev
>>> *dev, u32 arg, u32 *data, u8 msg,
>>>            if (ret) {
>>>                /* PMFW may take longer time to return back the data */
>>>                usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>>> -            *data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
>>> +            *data = amd_pmc_reg_read(dev, argument);
>>>            }
>>>            break;
>>>        case AMD_PMC_RESULT_CMD_REJECT_BUSY:
>>

