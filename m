Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004F0C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 16:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiILQV2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 12:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiILQV1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 12:21:27 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3021C2A72C
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 09:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQjElquIPqEKTj/0NxORXGLE5yF96nyrDUECQyShvfcOfL2l9ITIiOhsmZLjTsrFB7eapzE6TXy9zUjSqa1cQdgpHab1jMJmRka3d5Olpc7t8uZBUjfiyDuSl79OSSE7YSJcbl6S5+bXG4QfTiFChc4rLhqniajROujnWZZTqYBWmVN+FzSkgfQ7zFd/9LurqkJXSCBGoVDN/xYeXqGoWNNdMiSk5tcgbF7ESOJ29B7rQMl2li0qs5ALSj1Gm9WdA2jcN4JgVVXDGhg8nYoqjbtp1BSNbg5hjEllVp5zmoUvoxduZfhLSHEVCgF+6zv6OLMKSmhaVOFJijvaWfslMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8UtSiKEPh330RUyL19tmz5cEl8dpvjvTbP8D2sG/jw=;
 b=X9sWz+EnMV7dR3t8QIF7d2fwyQ4mE2e+4+C8g1kr+XkodUmKIHc0iZ7qPCn36BrLKokwYhFGzffg8o+zyMfQyfX0QbXBWbO7QVnq6iQDRjCIt+0zmo7Rh1G8OZTc1R8aCsehUFd1yQ/dXW2vbXOYgUxBZ1+cc5lTVE9sz3OBecHu+BABRP4u0579fNHOObbNw2rNDRNvYQYJEcHtIdjzz1cz42beBYuCj/sP+4xhOZkcf3yu+GbCBx0K6l6VuBPPnRAJwqxxS96lT8zpY3g4r2mrs/9Edbr9sNK/tuccFWR/kHvrICiJ+PLZA9IW+uZlf2jejhYQ1Bp2HYLFBPkVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8UtSiKEPh330RUyL19tmz5cEl8dpvjvTbP8D2sG/jw=;
 b=KkC7QoI5v/2jLV9NUzWzhZv3lnV40sVFqzQmfrxAy26WNOhDBHtMcrRjF4NYu6nsmFNRi5rn01nknkL/4rijA5jl0MfxBHA0pj+ZjvAtsRpZBMSsJ+G7zDkqerOZ57iLzrDrpItriLYTpQiFkQum7Btg+Chd65elPinyv9/Pu+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB4328.namprd12.prod.outlook.com (2603:10b6:610:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 16:21:24 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:21:24 +0000
Message-ID: <c1560ca6-442e-2770-c2c5-60d40f6f7aba@amd.com>
Date:   Mon, 12 Sep 2022 21:51:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 3/4] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI
 doc for AMD PMF
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-4-Shyam-sundar.S-k@amd.com>
 <3bf7a091-5757-a4aa-6492-30ddb4b2cea5@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <3bf7a091-5757-a4aa-6492-30ddb4b2cea5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::26) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e075b4b-fcca-416a-2758-08da94dad5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: feg6K1n7s3R+4TPcQUnRZ0U69ExVoE2mIiifsUioA53vyjdxEgrGA3j5KnZ2fetVBJznYt18bQQYx3gInkCzUY2VPkhAcfcLR2yX/YzMMTgzfDodz9T0VAyGAhIbuEm5ZMdtFTGFQ4KPiI1EswODEWgC3ZjTNFnNpzdwkKv41xt/0sSkaZUcBfDlq89/dvAs2RVjHiA9f5LSoCXSOVu0APRLy01TNP8pDiuyj1iFf73MBk40RrQPgvUBokfLazhY+UeHV5WNFiCveFmMTVxKUvtoePYMc3w/9knxspJmoOma1d1dNxFVgKEM4HPab18Rl3gvFP848L5oQYn736/Z3qRG8+KxQTi2V+7obrrP8B/HB8yYnQqu44/Nk2xns46qve1jYnGv7ohH/g47Sgu4bJo5P+Qhe2OJW7hRTEGA+GJzc1yXO7/y91On9SXAvsqgAPO+9uldprrQneQX/g04mxaA2/9HqdXFDPpm1Ax5cKBcDypjD1rTAh0Z8RSQCVJmNVR1pH+3RTjZWA/hb8CooH/KnNk1bakerQOKw3lHpWP3OnC5LHO962phoWxl+jochrs2MjUNf8FRBoapB4N98yAFXX6YPCEAeSB/NqAiU1ykvFJGd9hFROMPyK1E/0WboEofds/vOUi9DkT5RcySOcmqDou7z2C1B2rZh79hLNC/XKcmGVcAzkcYTOrn3Xta9hvatZURNqiuZR3DbE5sw+Qy+IUOr5PGEhQXfYyzWXFWuyEgRO1/FiLE90cHnHYwz5GH0Qzt4XxZDhzIGPPQ6EOra/3fMcFoABAW1nTsXOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230017)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(5660300002)(8936002)(2906002)(8676002)(83380400001)(2616005)(31686004)(6512007)(186003)(53546011)(478600001)(41300700001)(6486002)(66946007)(86362001)(4326008)(38100700002)(36756003)(31696002)(66476007)(66556008)(6506007)(316002)(6666004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWNhcVRaZ3pUTE1FUEdRbWs4cXYvWEtMVnBYSjNOc0w4akxCQWxFaldXWEht?=
 =?utf-8?B?Q0NuQTk5UVpFdHBCMjlMWFFkSEtxaG9xWk1vTHpmaVVFRlRmTnBZRHZLTkla?=
 =?utf-8?B?RE0vTGw3NlNGS09rZnIya2ZCUEI1Y01mZjVUUDg0VmR2c0NhZ0kwSlQycGNn?=
 =?utf-8?B?Q3MydVA5d1VVWlVMYWJsOWNLcFpMVFBxU2tobkdyakQ4b0M4dHJ6d3ZnVk9t?=
 =?utf-8?B?d3J6UFZJMUo4cjl5ZStMUjdWSzl5Tk03S1NnV1RXSE9HTE9WcnZNNVZiUHlL?=
 =?utf-8?B?TmtTRS96ZmE4SmtBMFpLQUFRd081Vng5K1VnUnhmVUJMaGpYL2ZwT3p1ZHVN?=
 =?utf-8?B?VTl0OEZ6bVRSVmFwNWwwQTNXSllMM0hsM1BocU9mN2xzNngrdGRoZnZBUmlV?=
 =?utf-8?B?czJOMjlYNWsvYTFmK1hGaVFoMERyaVlnMFBNbGtsa1Q0NEptTC9JQm1ralB0?=
 =?utf-8?B?WTQ0QnhrazlrdEI5L2ZkbFJlSk9mekc5RlZ6OFR3V3NCeDlXcit5MGZ3WnB1?=
 =?utf-8?B?b25WOUg5Kzk2dHhFeWUzcDRYN25qN2JuRE5wbThneGVIOHFLM3lWbE9YRTlQ?=
 =?utf-8?B?VE9LcUFrcnltS251K3hBRkVnNUdjRUwyZi9CdUJFTXNCaDV1MDVYSWJTYmxn?=
 =?utf-8?B?TERncWxFYVRjeXB3RmZrT0ticDZUajBsbFlhandVY3Q4dWNHc0J6N0IwR2Zw?=
 =?utf-8?B?S01Tb3ZDZk1LbVNSRG9xWjhRb2lNUkRBN2FIaUxRTnR5c042dnNiWkovT1J2?=
 =?utf-8?B?TEJkS0c5cGh4M0JGT09RNXlybnFpQmR2NnQ5Ly9lalRvN3p5TDN0THlBa1la?=
 =?utf-8?B?NmpkUzU4STFlVkJ2R0VUMW9lTHZHam4wdThlTzRCRmxiYittTzZpU1lTRWsx?=
 =?utf-8?B?eDBwZGtNQ0hicHVmWlZwMDY0NEZsbTNhbE8wOTgwZ29xQkJOV0tsNm9EUnZZ?=
 =?utf-8?B?MURFVVUwWnNET3U1Z3pjU3lkeUIvdGVHNy9RUUliUUpRc0dWQU4zeU05U25y?=
 =?utf-8?B?SkNDVURCNnhpMlhXMW1xRk5sT244WitWYUk4S1pvS1NXeHJmdkR6T2txcnV2?=
 =?utf-8?B?QWR0V3crSEcxbldXWUovblVqdVJOa0d4K0pnNDF6djFoM2Rvem95VGUyS3Jh?=
 =?utf-8?B?Q3VuaktsNk95eHV2a2Z4R0pPWmlqQjEvNnZ2eEwrbUZjSzFYRUZ3MGdCRW0w?=
 =?utf-8?B?NFF0eENyL3RIWWJIZjB5M01ZcEFla1NFTS9mOEQ2aElqb2dYVzEvclllV0tC?=
 =?utf-8?B?RXFrK1I1ZWlLL1h2a2swMWxZdE11YUxUWEF6TnBadnFWbFQwOVRraEc1WkZY?=
 =?utf-8?B?QnQrVjdtQ2VrdHVzSVZhRnFOSFVhaWUzdVViaWpUeU9FMkRURmRubzdJUzIx?=
 =?utf-8?B?K3dFZ1dQTWRKV2ZGMXVDK3NpSWVjMEpOUXI4S3RzVDBPQWVVV1pBbGplOTdm?=
 =?utf-8?B?MUxLUSs1MzhsNFBkK0lEV2tqajJBVm9ZSk53SzB6RU1QRjIzNWU0eit4aHV2?=
 =?utf-8?B?dUhZenBVeEFHcko3b1FUcGhQdU1panNBQm10YzV3OWpvMGRCcndQYzVhL0R0?=
 =?utf-8?B?akwrZjZVc1BJYld4elR3My81K29qVXk5SXEwNWtzQ0x3Z2hJSG04Umlna2dB?=
 =?utf-8?B?dGNmSmsvQU1QMCtGN216eWIvcWxYMkdncGxHN2ZVWnAxKzlvRHlUQlFlUG9M?=
 =?utf-8?B?Nm5lcFNIY01UQlhXVlF2Qm5KaGlJeVYwYnM1ZnE3dzhrQXlwZFNmWk4vRE80?=
 =?utf-8?B?WHNCSUJsazMvSkYrMmVsb0pCK1BLQVg0aWZGTXBoa04zRnlETktJaTYydlZp?=
 =?utf-8?B?MDhGZmpqa2lyK3lMb2d5azBWZUJUdVJYeUtVc0xyTTdUUTNnNy8rdk1DT0pK?=
 =?utf-8?B?VE10aHJ4eUYyckl0UThxMzhSVS9xaGRGVFpVSDVVWnBWcHl6dUZReHlFR1Iz?=
 =?utf-8?B?cUI5MHNuK1RvZXVZU0FneC9zSENqakhnYURkcEdQSTdmcHpmZ2JlcFJnbjlT?=
 =?utf-8?B?NkdCRGE2R3pUMERuaDBSdEE4VC9Id2ozdzZ6TkE5akFSUGl6V3RRVW9GaXRt?=
 =?utf-8?B?V1cxa0xEbm8vQ2dEUHlXUlhSdXRWcGFDWWZMcm8yb2Z6dlFEd0tUNDYxMTRn?=
 =?utf-8?Q?W7lKPcUWQT9y1SwXKapGS6AD+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e075b4b-fcca-416a-2758-08da94dad5df
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:21:24.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4BLa2JRZW0gKUY8iM3WFO+gaVKalczOIltOSg5sXWDGb0rqLaxmZZmdLvK8hJWazN/Zj8amkAL8VwZobyG6OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4328
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 9/12/2022 7:31 PM, Limonciello, Mario wrote:
> On 9/12/2022 04:06, Shyam Sundar S K wrote:
>> AMD PMF driver provides the flexibility to turn "on" or "off"
>> CnQF feature (introduced in the earlier patch).
>>
>> Add corresponding ABI documentation for the new sysfs node.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   Documentation/ABI/testing/sysfs-amd-pmf | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
>>
>> diff --git a/Documentation/ABI/testing/sysfs-amd-pmf
>> b/Documentation/ABI/testing/sysfs-amd-pmf
>> new file mode 100644
>> index 000000000000..c75d7426c2c7
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-amd-pmf
>> @@ -0,0 +1,11 @@
>> +What:        /sys/devices/platform/AMDI0102\:00/cnqf/feat
> 
> Presumably future devices beyond AMDI0102 can possibly support this too.
> 
> So maybe this should be "/sys/devices/platform/*/cnqf/feat".

Yes, but still we have not reserved a new _HID for future programs. So,
I think its OK to leave it as-is and update this file in future when
such change happens?

> 
>> +Date:        September 2022
>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:    Reading this file tells if the AMD Platform
>> Management(PMF)
>> +        Cool n Quiet Framework(CnQF) feature is enabled or not.
>> +
>> +        This feature is not enabled by default and gets only turned on
>> +        if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or
>> 12)
>> +        or in case the user writes "on".
>> +
>> +        To turn off CnQF user can write "off" to the sysfs node.
> 
> I think you want to have a comment here to the effect that "systems that
> support auto mode will not have this sysfs file available".

OK. Will take it in the next revision.

Thanks,
Shyam
