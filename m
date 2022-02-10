Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2BCC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Feb 2022 20:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237545AbiBJUnH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Feb 2022 15:43:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344375AbiBJUnA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Feb 2022 15:43:00 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7235F6A
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 12:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWjF/ybMzDA77Tu6Jm/VsSNnjd03nFPrZMlNuh8iLq2nVew93VEZCGnZyktk8a1n35Av/c9RvII9gX+cEXj+koMlMMRxwV4OEbcUw3IOEYb5c1IkGhXk+n6uokc8COcqUPv0uHvh8JUZQTr840ll9Ig198+rXzs97dSOZNPejpY8EGWHvQu/lWS9f2glwOtcpgjoeYgEAFtYIBuoi6Zi3ZO29Bkb+b3RQJ44dZ/XH46DgPkUJbQLAfP4tzOiTl6WMpF5XoaeKVHEujSWDGWLOiit8R93R4PpDfYLj5RSo0ZEmZHfK6Sapl70RSsX3vQOehZnKtd/5SnwYQZWCWCKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXjPc4mYn84VwX3BaA/3Gf4B9lfWp8D13bfYaMqv8Yk=;
 b=O7Zi6ddNKQgBlD0rWOUTsuQIllVcA+gZZr9B4Jr1DKni9vOpMclDl6L/sKsSjZBNMOk+9AvRVQyz3VKtGhWJEYClw4w1k2RKhldpkpFIIGp2y6C9YdO7bACQpGuR2fluvSiuEaN++l1v9vKqQyqi8beopXw/snG4HDr1oyBmQxvx2j4qtVBFfqga6JtJcnbOINzoO/h7ctuq3yB7CrQhrqwYqaIHGsdJ5B51TQsgIhG4jhCB7Y0awP92BCHOV2eoD9E4oYyee3emF79zEQCbKJa6u6IVACoJ4ZM3EgVhonhRHZgzUeNoIqAV5FbFV0hysVjwOWuOpO4eGNyD5O4/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXjPc4mYn84VwX3BaA/3Gf4B9lfWp8D13bfYaMqv8Yk=;
 b=zA6KazDuBh3MZzlTBxk2qke1TTX6a0ijxpeLUlgHCxxeONOTaoE7gWdWX8v/vldJZsFnE1/UGttz1FxLcBjW2ndxLf4KZn+uCIMdpI4ZFq/LwM5T5cDCiObj5t8mU7KHdmtwmuK8+tMY2y7JKohJJNhc7Tn9S6kK4kP+1UoejiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by MN2PR12MB2927.namprd12.prod.outlook.com (2603:10b6:208:103::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 20:42:53 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c%6]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 20:42:53 +0000
Message-ID: <aeb4d8d9-a43c-0697-5035-eff7f4ba3728@amd.com>
Date:   Thu, 10 Feb 2022 14:42:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Song Liu <song@kernel.org>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, carlos.bilbao@amd.com,
        siva.sathappan@amd.com, suma.hegde@amd.com
References: <20220209184406.99938-1-nchatrad@amd.com>
 <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
 <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
 <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com>
 <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
From:   Nathan Fontenot <nafonten@amd.com>
In-Reply-To: <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:610:11a::29) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24dd9a72-0ea6-4617-e043-08d9ecd5e8f7
X-MS-TrafficTypeDiagnostic: MN2PR12MB2927:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2927B32983296D358E4814FDEC2F9@MN2PR12MB2927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwXJvEqeU0sWmicTc9BKewcx5ZZCACRq6Vh+u7ZaIIgSvKxO4bQ0E13xP5D+LYJ1KQHBu3Vovju984c1RkTAM9GmkmHUOWFhCVZsFJV8KWevuh92eRUUlmd8AVPAuMtH08wtQftZYNlnAxiVFhXA+mJKL7xI2ZREL7VrrQ+hjKHp2vq4wA/cscR1PIjWaaJ26AAFHXZ+2IHejNoil0XVGmKgzljR95+AaqDlQ04+a7cSLxuTa8PP4wcGo9wtcOyBy6PXkWz39qiCgnZBZXSyMlTUMa/U/rVxVHFRPfQjSUzmC/VuAYC4vB22gEZk3NLt12O0rMrJVm8JDjVO7W7CGNqgweUHSR1xFrFU7JUNDZUPTcz4KQrq2tI6vkWMU6WWVlPQ0ZmXrjnuJmW0FYZj2JlRg6qTYc+C+Lp0XXoYkDn3ZLLtlHl/c2u2ZSsJahhANOmiX7tZXj6JBBOCIbtux8IDJvAQqy3TyrAtwCMyROges4bphzilS4xKGD66PitL1ExsKF7Cz8MHwDZ2S/iJvzpMq3LnD38FhcYUh39Spx8uM3EA5TzdqObdR58RBYbi0DVdghZcrwqIjZjNngYsWvN0L8gZk9q7E8meizF+TtuHRH4SFhP7Cw/mtcRoR+c1Lqy5HkFy0v0TRsafnzWNV3Rpfbu7e4c/Q9hqYI7R60cNnyv49n6x1l54LP6/gS0UrEda1U3p7ws60uF76zzJsvnqjXucptcEwqCLAEPSRGLnpm7FTs1+TDppAozfVzCZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4720.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(5660300002)(31686004)(2616005)(316002)(508600001)(6916009)(6486002)(54906003)(6666004)(83380400001)(66476007)(8936002)(8676002)(38100700002)(66946007)(36756003)(6512007)(4326008)(66556008)(6506007)(53546011)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpYQ2xaODBXT2JSakJGK3IwWTFBS0ZxNkIyYThzU3FoTnZITDI2aHlUQm5D?=
 =?utf-8?B?SFFjZXkzbTRkUEN3MUpaNXBhTWpVSWZLeUNwU3pqU1dWblRGVzlTSGFGRWNM?=
 =?utf-8?B?eTVROThDalk3ODhSR1BLZUwwTVRBRENnVzFuTW9KZHlZY1FtdU1MZVhIZWF0?=
 =?utf-8?B?RGt4M0h4STRtb285QnZYbXpqQTNMNytxUlM1TEhnbXY5TVRxdmphMnZhSGhj?=
 =?utf-8?B?eFlwZk0xWmZ1amxTQmtxR2doSmdnVE9pQktnNGk4bFVTNStjMFBFb1U0T3Jk?=
 =?utf-8?B?ZHM4bU9nRjdPNkJNc0NuMEpPaGYxYVpHYVhzZGtZYXQ4WDJwNlRFalV0aGxv?=
 =?utf-8?B?eHJBNWgrL2lLTDdXdkViZFMyUk41V0RnN0R3WXlyendSRjYwbGVMNDZGVXJQ?=
 =?utf-8?B?VVF1Nk52UEpxeDFFRC9VS2NCVGdyb2pURFYrNTllL0I2WTFnRHoraC9NbnlJ?=
 =?utf-8?B?MW9ibXVtWHlJZ1B6cVJTYW11NUZmclZoK0tmZ2RndmxyOVpHbHJuSFhhamxl?=
 =?utf-8?B?Q0FST1duSjZEWnB1Q0M5YkU1ZzVqS2REVEhURko4VGg5ZnIzbkRWbVdocjZV?=
 =?utf-8?B?cjg3NE1rQzduZElzTER3cVFIc3ppRU5NeVBFYjBKek5tMzd3UTVLTU55N2NI?=
 =?utf-8?B?N0ZqMDJXMkdxVTNGZ3BTZUZTMGpQbUZ3SnRLSER5MVRjSVVwZ1FORVUrYkFM?=
 =?utf-8?B?alQzanMxSWh2Tjkxc0FORnlKVVViVm9WZEJQOXJkWHI1eW5YbkRPa0hza3A3?=
 =?utf-8?B?Mk9oWmJzZ2dJRERicXFxNnkzTlJWMmJpeGFLcDNLdC9IRWJJMWxaUDQ4Tk5j?=
 =?utf-8?B?SXlQc1BlZVc1SGMrWDRNSGJJbHhWNWxyQlVzbTU0RXV4bURTSXFSdHN1M1Z6?=
 =?utf-8?B?WUszSUFEZU4yOVprcGd4UGhYTERKaGtpV0hSVnQ5NUpsWUtmMVk4d3M4dlFm?=
 =?utf-8?B?YzhtcDZZY0VFTXZSbC9aVWdvWWU0UTFML25OajZPSW9nVEVnNjNpSGxTcnA2?=
 =?utf-8?B?NUVZMnZJOHNqR2p0Q3AvYlE4QXpKRVRMTURwSXdJZkNJOWl0czVocnNRWEZ0?=
 =?utf-8?B?bEJRcWd3SzR2WDE1R1dJUEFvSUpIeHJhWm4yeEZFcEtkclBxV1IvWVJReFZI?=
 =?utf-8?B?Z1R0ckR2L3ZDL2hjOU4xNlArS0NleXRzdTZwaFRtVGtlU21kQjV1ZHFPQlJs?=
 =?utf-8?B?REROeDdtT1hSQWRoVWV2WllJRXc5ZTlra21WNU5wd0tLbUp2cFZqaDJPTGF6?=
 =?utf-8?B?eWtaOEpZaE53RFlFN09UekdORjJhQmdHV2JpOGxtTzNMMTBLdE5CVDhVZFhl?=
 =?utf-8?B?REpkcjFjUU1JSkFsV0JHN3hDa0NTMmhJNnIyN1RVK0ZEMnd4eXZXWnp1Ynhz?=
 =?utf-8?B?K3dOaG9LQlg0dGNjTUZkZnE0L2l5N0dkNjRacnZyTWVJV3lqdHZtcGxZYXhx?=
 =?utf-8?B?aERocHBJMUpwTlFESk1zQ0l3OGxLOVhQK2FmclZpTUFJdWFjOTV1ZjRjTnli?=
 =?utf-8?B?WW9uK0djSGhjR3lCRTFuUnVUMmJWUmtsTlVnaGMwTGQ5aXNoWXZLOVRwc1My?=
 =?utf-8?B?OU5hNTE1cTQ0WnBvUW54V0NkVm13Umdjdy9RNDB0SEMxbDBLQUxlVzZyRHMr?=
 =?utf-8?B?TmRqemU4dVlKQlEwdmJqZzF5VVFGc2dHd2VWL2ZNV2Qzd292WmMrbEk3YkFH?=
 =?utf-8?B?TmVIT0ZMQXZoMERJbzhBVnl2TWtqaU5Sd2M2RmFZZUkzYXFUb3lpdnBjYnph?=
 =?utf-8?B?V29zZ28vMm01cW9hS2lVMVZDMVRDQ0p5STNaMHZNMVFwUFFuMmpuNmJwS3NE?=
 =?utf-8?B?enZFN0R0MWFVM2YzSVluNnpFTWttTlhOeEh6OE5ORVZURjkwK1NSaldrNG5R?=
 =?utf-8?B?ZU9ISVhNdFE2bDJseElrNUZ6TzZhTzFWUStTMU1IdlpHSWptQ0J5cUhYOUpz?=
 =?utf-8?B?aWRlSHBRYmQzeUFGUWxWbS9GSTBxSkxoOHAxOTlPbWhvbUZWNDJMVGdrY2Z0?=
 =?utf-8?B?cFJUYSs2NHJEbklVSG1GWko1ZGdKcHIxNkhSUzJoWGhjcEhCK1NIcjdqbTNJ?=
 =?utf-8?B?ZzhxTU9XYXlTazlheFpZcjNVV1gwcS9qaU56Q1R1VDdaeGFDQXZRYW9Ncmxy?=
 =?utf-8?B?T0lKd29XWTV1MkFoMkxNdnloRDI0aEEvZTB4aUgzcGt4UWF2NVM4QW1oNWtI?=
 =?utf-8?Q?6d21LcGYzM+vV4fRbWzmTiI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dd9a72-0ea6-4617-e043-08d9ecd5e8f7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 20:42:53.2571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmPmbk/lla9UollYANEdTMH50nCKqvjn6vAh0YaTntXMf3eseV7v0oTwt8zlKZ1EjDBBMINWZtWhOjMHrKefPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2927
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/10/22 14:32, Song Liu wrote:
> On Thu, Feb 10, 2022 at 11:52 AM Nathan Fontenot <nafonten@amd.com> wrote:
>>
>> On 2/9/22 19:10, Song Liu wrote:
>>> On Wed, Feb 9, 2022 at 1:08 PM Nathan Fontenot <nafonten@amd.com> wrote:
>>>>
>>> [...]
>>>>> +
>>>>> +static const struct hsmp_msg_desc msg_desc_table[] = {
>>>>> +     /* num_args, response_size, type */
>>>>> +     {0, 0, RSVD},   /* RESERVED */
>>>>> +     {1, 1, GET},    /* HSMP_TEST */
>>>>> +     {0, 1, GET},    /* HSMP_GET_SMU_VER */
>>>>> +     {0, 1, GET},    /* HSMP_GET_PROTO_VER */
>>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER */
>>>>> +     {1, 0, SET},    /* HSMP_SET_SOCKET_POWER_LIMIT */
>>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT */
>>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT_MAX */
>>>>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT */
>>>>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT_SOCKET */
>>>>> +     {1, 1, GET},    /* HSMP_GET_BOOST_LIMIT */
>>>>> +     {0, 1, GET},    /* HSMP_GET_PROC_HOT */
>>>>> +     {1, 0, SET},    /* HSMP_SET_XGMI_LINK_WIDTH */
>>>>> +     {1, 0, SET},    /* HSMP_SET_DF_PSTATE */
>>>>> +     {0, 0, SET},    /* HSMP_SET_AUTO_DF_PSTATE */
>>>>> +     {0, 2, GET},    /* HSMP_GET_FCLK_MCLK */
>>>>> +     {0, 1, GET},    /* HSMP_GET_CCLK_THROTTLE_LIMIT */
>>>>> +     {0, 1, GET},    /* HSMP_GET_C0_PERCENT */
>>>>> +     {1, 0, SET},    /* HSMP_SET_NBIO_DPM_LEVEL */
>>>>> +     {0, 0, RSVD},   /* RESERVED */
>>>>> +     {0, 1, GET},    /* HSMP_GET_DDR_BANDWIDTH */
>>>>> +     {0, 1, GET},    /* HSMP_GET_TEMP_MONITOR */
>>>>> +};
>>>>
>>>> The hsmp_msg_desc, hsmp_msg_type, and msg_desc_table are used by the driver for
>>>> validating user data. These aren't part of the user API.
>>>>
>>>> Perhaps these should be defined in the driver itself instead of being a part of
>>>> the uapi header.
>>>
>>> This was my idea. While I agree it is a little weird to have these
>>> tables in a uapi
>>> header, I think it is helpful to give the user some reference about
>>> proper num_args
>>> and response_size for each message. I don't have a better idea to achieve this.
>>>
>>
>> I like the idea to give users a reference on args and responses for each HSMP function.
>> If this table is kept in the uapi header perhaps we should add a short description of
>> what the expected args and responses are for each HSMP function with a pointer to the
>> full documentation of the HSMP functions in the PPR.
> 
> I guess we can use unions do give full descriptions, like:
> 
> struct hsmp_message {
>        __u32   msg_id;                         /* Message ID */
>        __u16   num_args;                       /* Number of arguments
> in message */
>        __u16   response_sz;                    /* Number of expected
> response words */
>        union {
>               struct {
>                       __u32   args[HSMP_MAX_MSG_LEN];
>                }; /* ensure size of args */
>               struct {
>                        __u32 test_arg1;
>               } hsmp_test;
>               /* args for other commands */
>        } args;
>        union {
>               struct {
>                       __u32   response[HSMP_MAX_MSG_LEN];
>                }; /* ensure size of response */
>               struct {
>                        __u32 test_response1; /* or better name */
>               } hsmp_test;
>               /* reponse for other commands */
>        } response;
>         __u16   sock_ind;                       /* socket number */
> };
> 

I was thinking of keeping the msg_desc_table as is, just provide more details
about the expected args and responses in a comment. I think creating a union
of structs for each HSMP function (and there are more functions coming) would
get a bit messy.

> btw: do we really need HSMP_MAX_MSG_LEN of 8? The list above
> have at most 2 args/responses.

The PPR spec defines the args and responses as having up to 8 so we ned to keep
the max length at 8. No current HSMP has more than 2 though.

-Nathan

> 
> Thanks,
> Song
