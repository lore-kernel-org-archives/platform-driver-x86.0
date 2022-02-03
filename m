Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9100C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 17:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237168AbiBCR6f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 12:58:35 -0500
Received: from mail-mw2nam12on2068.outbound.protection.outlook.com ([40.107.244.68]:38592
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235081AbiBCR6e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 12:58:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5NWH8Yk+kBaF+89R19GigPbGoKDOsiuM7iWMiJgLZZ1sXB9S3LNFzmr2p7nkOORK77EDQZRSKLLT61eWCU/xsH44sU5ZAQVjqmPciw6NDYaET0ltJghzTkuduZPT1+lPgIrJXm8/K1dEeiQt2smA5Xq1zxQnen5KebcVIDKgo5eeKHNwD4Xdl9DTQZQ+zjj3w+RPQ6lzQSZZbcz4u8EDg108flkMtiW5oOA1Yyvi2d5NR5ovQ+mr1K2URuylA2OnwmWzGvlxqweJFJAZHGAWG5n2JCacmJh5+xnaDvu/tkvXbqNFrHfEKH/HsO2eTTPcNwwsojc7fknyMY51NbQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eowqhNm0oFgINly3TpF9ck0P4TEaoRIvzzu+nnMOIY=;
 b=Kd9tDWCbaIQDAZ4FFRAnppfTAu/LNlo6AIA/VDxOIkRKEjCh0nhnOsH84DgflOsUwQ1bM+p8u+8APy1Y6lO1fipbsX6AjfldbVH0CU79/VbteIFDnd3H81d3EmVePL9+8VjmQ4Me/fwogqx8A6F9WdLEMsOcvQZIiYXqASk2fC9/zVCuko/AkYmeqdv85zKGlturFO0OmKtS46Tv5OxEAYrpluY4YR18yhp/d0NNzTsLLidJdq5gfmROaz7RBtvdUEZ2qEPVXdBO8TqiXTMEBu9uE2WkmoAg0luace21g1Epg1Wi/bzAD+H8bsQUJ7HttK3S/H46VE82C2fPNd+fRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eowqhNm0oFgINly3TpF9ck0P4TEaoRIvzzu+nnMOIY=;
 b=D0SulGWJwX/PV7QYSxJ1DxpVLUBxNowRjdDtg8OTxThYx1uwvp+xccazvc3qQMQETG2rimyvKOZEuqjU1icMp8+SfxhPSAAS4GL2ISMAOT5Uoh+9VFyz/RSo9j1tJwAK0e+TX3cfREbXUlsboIQenE9SN6tFiHmfJVBti7Xotsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by DM6PR12MB5568.namprd12.prod.outlook.com (2603:10b6:5:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Thu, 3 Feb
 2022 17:58:32 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a%9]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 17:58:32 +0000
Message-ID: <5794828d-6be8-1f86-673e-f456407c99b9@amd.com>
Date:   Thu, 3 Feb 2022 23:28:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Song Liu <songliubraving@fb.com>
Cc:     "Nathan.Fontenot@amd.com" <Nathan.Fontenot@amd.com>,
        "Siva.Sathappan@amd.com" <Siva.Sathappan@amd.com>,
        "carlos.bilbao@amd.com" <carlos.bilbao@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "suma.hegde@amd.com" <suma.hegde@amd.com>
References: <D0A101F4-4472-4FD6-A9D7-602C15A2F605@contoso.com>
From:   "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
In-Reply-To: <D0A101F4-4472-4FD6-A9D7-602C15A2F605@contoso.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0175.apcprd02.prod.outlook.com
 (2603:1096:201:21::11) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 812f6580-a817-4d18-c4f3-08d9e73eca33
X-MS-TrafficTypeDiagnostic: DM6PR12MB5568:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5568D0CEE350157F95DF4D3EE8289@DM6PR12MB5568.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YVAOEDxTuVEdiAhzCrfqCEvRVBqqEXyDgk7X0zInkC6+tAyimObTUy+CEuhcYenTxHz6v3baTPVVGyVE33lz9scCfjBV1wOtCWDf0cCm4uYTNSxPeU/TEuCyCrdCVP5NemectOnrum62DgybiMUityir+s9+i2LjacJ53LJTe5Xuh1ikUF6a2TBA6QL7Pg0UATzs/ydJvYCbe0XBuG7w3ecZae5JsBKxUI+f37ITVC7RvTWmypkOJRMvEzN8aQtscjhF+VVoYVVXNrUdW977Idxb4lAGbiXkuQ63lAEcXw8vzfL2zHhRw5jOZtn/Azv+oUiIvGJektkQOMFFNnoPpTzGR8Ik5txYpZ7HV0G6NjOZNTx/FUzycydCeo2YCE/J3W2i5pE2JjGdX73R+wjZlqJngX0SMJO/VS/tI18vMDg7BkII4/qmJ/JhYjKkPJhDdq9ybwzA5771oBjuDv5haOZYht1Vy4eCNWTxsxYT9YtbsQoX7CzPGu06RIlnD5JvoXxr2Pj2F94RbXzHLwi0TyNIbZo4EQlNzsy30jcDYJfN9T7Hugce5QZXm1y8bRKugPSXXx21uzqaYTPNUJrDnCtX1kLU9xrRtn9ivYyz3ofjuJv8X4/vRTd6MqXrbTN0QJ2bwhOVqyUlwEZc4r7AaWbLOuQ/1iEpnhgUDnXjV9FINCcNFlrpBBSmz+Vs3oRDJpcoEy5xbiw5CklUoDRGzuO2TusO9H4b5+i6vdACq5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(54906003)(508600001)(316002)(6506007)(6512007)(83380400001)(6666004)(53546011)(6486002)(26005)(186003)(2616005)(8676002)(31696002)(2906002)(38100700002)(31686004)(36756003)(5660300002)(8936002)(66556008)(66946007)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1c0Znh5WFI4RHBoYWg2cjJ3YTNVWElLRUhJdUpHVFdLNERpa2E5WFhVMnZD?=
 =?utf-8?B?ejFOL0xUcUN1bm03YVlVTnYzMmlNSEJaU0JXUnE2aVA4R05ZQzVtVE5RMHpJ?=
 =?utf-8?B?SVAyNEdqTTAramxpOHhTQzZoa290bXl1eHBDZk5qSHF6eVVQV0dnNFMxUkZW?=
 =?utf-8?B?M2dpY1RKQldUdUVBZ0hrVjdRaDNHUzRqeFdabmk2WnNyYkFWWXFYZXJkVXpH?=
 =?utf-8?B?RHJSM1lpRHJiSXFDazFYNm9FejQvVC84cjlZOUNGMmxuZFRvNHo2Vmw0dEQ0?=
 =?utf-8?B?b1JZZGYwWEllTExLb1c1UW14UXZDZEhqSnpPbmtjRTRUWXZvWE5VclVGRFBF?=
 =?utf-8?B?Z0FSc1RMUHZKdkxlWERhd1NNRWNVTC9ndHdyeHhmSmthWEhPY05GbTVGTUZP?=
 =?utf-8?B?MTNJVDVSN2hxSXBUMkx3MVFlM09ZVzlyNEQzcksyay9BanFPWFArSDRCQ3g1?=
 =?utf-8?B?NDlLdEM3RS9pZGlTUjdLYmlySllCZVk3aHNrakU0V3l5UWRwdUw0bUhXT2dw?=
 =?utf-8?B?c3RtQ0FSOWsyNG1VMUQwN0gwUDV3Njk1c3k0Wmp0cnREa0JITk5pVEVBOUU2?=
 =?utf-8?B?T3J6dDN6YnF2NWlrajhFTHFFcG1RdWY3MlJNMzR2WFgwaHc4eG10dkJNU1Yv?=
 =?utf-8?B?c1Q3dVU1RFk4MGZnbmNVQjcvTUxwdnI0Yzh5V3dJWkttcDdEaDY3RGVrVysr?=
 =?utf-8?B?NCs4QVE1M2h2d1Y5c0F2ZUc4RkF6TTVzZ2MrbEttOHhGSEhubG93eWwwOU5V?=
 =?utf-8?B?cmduSitMZnd5cjVRRFJDVHNkMldhRUxJcDlPL2ZUSEFYbGh6RnU4dzJpcE1Z?=
 =?utf-8?B?N3dVSEttSU5vTFdza3FuaUoyNS9JUXBXRXBqcjNwMHRJRUtDTHZESGFRU3lw?=
 =?utf-8?B?NFVDTlVqYTNtVkQzK3NsWG4rVlVncFo4RnoyNDZWL2huclRPS2l4c1dGblEv?=
 =?utf-8?B?VC9Dbk1pS29VQUU2cUlMQXI5NS9JOENQeVUyL0RRNDBRU3dvcFppMDZta2xw?=
 =?utf-8?B?Yi8wSGJyMkowbStwMFdjOWs2SmtsZFIzeEtydTFkNVVYMlFsNHZEcmpwdlhC?=
 =?utf-8?B?eWdpc2crQ3hsVWtQZ2xnN21PZUhDRW5Wbzd3ZzF1TzNiREI1RjN1MVVzeHdK?=
 =?utf-8?B?QTZxTW1RUHFnQUZQV2ZuSHkxejBuTkZlUDdZc3FiTWdBUUoySTdXYVFBL1Za?=
 =?utf-8?B?YUo3WlJkZXFSbEJ3TGVKUG0ySTArVlgrUTkvdVBIck91L21nQVBOVGNWUHJW?=
 =?utf-8?B?cFdvcWx2S3BXV2RhM085THdvNzB4MUc2WDZCNTVCM0Q5aXdOY0pqaFVtNTZj?=
 =?utf-8?B?dE1vVnFTR3FWVGovM05qUGpmR0J2dGZHaXM4NXJUcWJrS3JHY1BjWTkzOWRW?=
 =?utf-8?B?NWxJZUhxMThhRy9DdWpOM1ZuOVdNV0FUaWpMRzRrc1UvYmVrYjlVaVVoUTh4?=
 =?utf-8?B?czlpWEdjUlJqSVltQWRIdytDc29KL1RwbzV6T1pta3VlaVpCbjd0L0lhUDF5?=
 =?utf-8?B?VFpwYy9teHEvcFEwemFqdVN0K1ZIUVFwR0IvSlByTHdtSXZ6Vm1SNUdsZnRy?=
 =?utf-8?B?ZEVOTndxU25jR0MvbnNGZkY3aitWd2NUQlltS29CV2xIcWRuVVZna2QxbjhL?=
 =?utf-8?B?VEh3eVZwL21yeUgwOTF2WEQ0UDRxN09yRW82eTJYbEVpT3NiNEJpUDJRZzJh?=
 =?utf-8?B?OStSVUEwYTVZdUUwNjlNR1k3TVcvNFpCemNXUWNscHNPZ2FtVE1xem1wei9W?=
 =?utf-8?B?VDRLQi9ZWWluWTBLYm9jNjdST2V4Yml0WFg2bDQ3ak1FUmU3NDZCNC9QYm1i?=
 =?utf-8?B?ZlJ3UlBDRXJwQks3OGJNWmM0QjN3Nmg5T1h3RVZJVk83WnVNUVhMWGJVUGE0?=
 =?utf-8?B?WVN3SUFsWjNydW4yc21FeHk3enVDZlBwdzBYTW93WlAxK1VkOFpHK1NkT0V1?=
 =?utf-8?B?anlRbjY2VngrZU5BYnpRL0E1bm9BSis3aUdwdUVaQW03Vndub1p6VHNCVFVV?=
 =?utf-8?B?VFpLdWxpOUZ3TERnWnhvTFhFWTFzMVMxSldGQmNYM2pWWWZsR2Rzb3dMaWx6?=
 =?utf-8?B?YXZWb05oaTNKdzBwWTNUMmxaZm5MZWtQMVBOTXJYcG02NlRBdDVXWGV0TEJw?=
 =?utf-8?B?V3lTbnVSVGVOV25NYXI2bGxKcmkzeGUxTkd1a0JkVkszR0dnV3JJV3NCVHJV?=
 =?utf-8?Q?PGvq1UqdP3r+qnI73ELFI1g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812f6580-a817-4d18-c4f3-08d9e73eca33
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 17:58:31.9764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKYsjUXphJgombJdEfT0ocafX80Yjo5/riGBSP8A4hhLLic7WBZj/QVtCK4P/eRfpP5+bhlzbXteMPMSUAX+ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5568
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Song,

On 2/3/2022 11:22 PM, Song Liu wrote:
> [CAUTION: External Email]
>
> On Thu, Feb 03, 2022 at 05:34:49PM +0530, Naveen Krishna Chatradhi wrote:
>> From: Suma Hegde <suma.hegde@amd.com>
>>
> [...]
>>   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>>   arch/x86/include/asm/amd_hsmp.h               |  16 +
>>   arch/x86/include/uapi/asm/amd_hsmp.h          |  56 +++
>>   drivers/platform/x86/Kconfig                  |  13 +
>>   drivers/platform/x86/Makefile                 |   1 +
>>   drivers/platform/x86/amd_hsmp.c               | 450 ++++++++++++++++++
> We added new files. Shall we update MAINTAINERS?
Sure, i will update the MAINTAINERS
>
>>   6 files changed, 538 insertions(+)
>>   create mode 100644 arch/x86/include/asm/amd_hsmp.h
>>   create mode 100644 arch/x86/include/uapi/asm/amd_hsmp.h
>>   create mode 100644 drivers/platform/x86/amd_hsmp.c
>>
>> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
>> index 687efcf245c1..663e316d320c 100644
>> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
>> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
>> @@ -372,6 +372,8 @@ Code  Seq#    Include File                                           Comments
> [...]
>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> new file mode 100644
>> index 000000000000..42cdac8a331d
>> --- /dev/null
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +
>> +#ifndef _UAPI_ASM_X86_AMD_HSMP_H_
>> +#define _UAPI_ASM_X86_AMD_HSMP_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#pragma pack(4)
>> +
>> +#define HSMP_MAX_MSG_LEN 8
>> +
>> +/*
>> + * HSMP Messages supported
>> + */
>> +enum hsmp_message_ids {
>> +     HSMP_TEST = 1,                  /* 01h Increments input value by 1 */
>> +     HSMP_GET_SMU_VER,               /* 02h SMU FW version */
>> +     HSMP_GET_PROTO_VER,             /* 03h HSMP interface version */
>> +     HSMP_GET_SOCKET_POWER,          /* 04h average package power consumption */
>> +     HSMP_SET_SOCKET_POWER_LIMIT,    /* 05h Set the socket power limit */
>> +     HSMP_GET_SOCKET_POWER_LIMIT,    /* 06h Get current socket power limit */
>> +     HSMP_GET_SOCKET_POWER_LIMIT_MAX,/* 07h Get maximum socket power value */
>> +     HSMP_SET_BOOST_LIMIT,           /* 08h Set a core maximum frequency limit */
>> +     HSMP_SET_BOOST_LIMIT_SOCKET,    /* 09h Set socket maximum frequency level */
>> +     HSMP_GET_BOOST_LIMIT,           /* 0Ah Get current frequency limit */
>> +     HSMP_GET_PROC_HOT,              /* 0Bh Get PROCHOT status */
>> +     HSMP_SET_XGMI_LINK_WIDTH,       /* 0Ch Set max and min width of xGMI Link */
>> +     HSMP_SET_DF_PSTATE,             /* 0Dh Alter APEnable/Disable messages behavior */
>> +     HSMP_SET_AUTO_DF_PSTATE,        /* 0Eh Enable DF P-State Performance Boost algorithm */
>> +     HSMP_GET_FCLK_MCLK,             /* 0Fh Get FCLK and MEMCLK for current socket */
>> +     HSMP_GET_CCLK_THROTTLE_LIMIT,   /* 10h Get CCLK frequency limit in socket */
>> +     HSMP_GET_C0_PERCENT,            /* 11h Get average C0 residency in socket */
>> +     HSMP_SET_NBIO_DPM_LEVEL,        /* 12h Set max/min LCLK DPM Level for a given NBIO */
>> +     HSMP_RESERVED,                  /* 13h Reserved */
>> +     HSMP_GET_DDR_BANDWIDTH,         /* 14h Get theoretical maximum and current DDR Bandwidth */
>> +     HSMP_GET_TEMP_MONITOR,          /* 15h Get per-DIMM temperature and refresh rates */
>> +     HSMP_MSG_ID_MAX,
>> +};
>> +
>> +struct hsmp_message {
>> +     __u32   msg_id;                         /* Message ID */
>> +     __u16   num_args;                       /* Number of arguments in message */
>> +     __u16   response_sz;                    /* Number of expected response words */
>> +     __u32   args[HSMP_MAX_MSG_LEN];         /* Argument(s) */
>> +     __u32   response[HSMP_MAX_MSG_LEN];     /* Response word(s) */
>> +     __u16   sock_ind;                       /* socket number */
>> +};
> IIUC, we rely on user space to know (from other sources) the proper num_args
> and response_sz for each message_id. The only check applied by the kernel is
> "num_args <= HSMP_MAX_MSG_LEN && response_sz <= HSMP_MAX_MSG_LEN". How about
> we explicitly call out those constraints in amd_hsmp.h? Maybe something like:
>
> struct hsmp_msg_format {
>         int msg_id;
>         int num_args;
>         int response_sz;
> };
>
> struct hsmp_msg_format hsmp_msg_format_table = {
>         { HSMP_TEST, 1, 1},
>         /* more */
> };
Good input, will do.
>
> Thanks,
> Song

Thanks,

Naveenk

>
> [...]
>
>
