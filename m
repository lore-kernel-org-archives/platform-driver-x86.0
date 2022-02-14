Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C33C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Feb 2022 15:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351821AbiBNPcl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Feb 2022 10:32:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355878AbiBNPci (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 10:32:38 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07DD47567
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 07:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsqqcS2dzVWW8SVaHxFY+Gdt+a9hQulEYy2mFGMSjWCGRHXagRFPBruuS45qN/skOlSrVJkwcF5Ixeii7IxsskDOwpae5DxgIcxdZbDZs3xDrqEPBwOeiaDDUGLw01RAJHgNgTpMW4iYd4Dbv4mMszdUUgXBmVhaGH3w2dDNfOTssxevvD0q5fcXKbyjHahEQ1HGgPZ8kDEbASh+LYVmMbvdjtBS6o30AvQiwSbRB2uY+6e/q4lcwpqAMFnDUptaC/hTl0led4UJUA7z0msxixlnoG6hFkWJFICKW1g5nLE0VoTwg0FDLy3Hpi1Irbthk22Az1+TdP6vtLth9S0F/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7xEKCyVVbTuQ+PyXqtBew6vTF6y/oKM2IQ6gwlEU2A=;
 b=Adn32PMtW/j6p+5KxgwEAp4NVH4HcylilJEw1/+ocwErNSo3S86wB7u+b+Bp66JUozf2v9ZhJK076zHwV8PqxsMpJwxTKyXjd3NxV4s6utFZk32H3T81iLM9fcy+zXiMWZZAhzxxbH8fRVBuBGjU3WQsxAHED9DRHAWlUUFkbkdu98uxM2x4Qree32ALLBbjL/q2pJU1fh2BT2waaASv6HVNlUtUFjfu4+YKGpPBF75jlxo9gBSIw6zZIUklsl3MSAG2ctMGMVAvWbLbEo2aIi8ZrCy+DyJjniyzBEnT1u3etBNh/DXK/6fgUPzoGXm0hsCqGAeI7fZlln3jSqMLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7xEKCyVVbTuQ+PyXqtBew6vTF6y/oKM2IQ6gwlEU2A=;
 b=oZ0D0IitTzC6joju9OZaDwC8EW9C+j5cnzluSLSVYYQoy38lSzr4hpha1zGI1HvNs3wz1W+QECEMWpbz2sFKbox4JbmtMTejU5R+BHe95st3BE2q2FdVCNYSqITvbKKqKWET6wKIpid26iGV+0aWgSgUWrupERK2PzAJreEmBB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL0PR12MB2435.namprd12.prod.outlook.com (2603:10b6:207:48::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 15:32:27 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a%8]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 15:32:27 +0000
Message-ID: <2549f688-c148-f893-1fe0-52a09a8fb1d5@amd.com>
Date:   Mon, 14 Feb 2022 21:02:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Song Liu <song@kernel.org>, Nathan Fontenot <nafonten@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, carlos.bilbao@amd.com,
        siva.sathappan@amd.com, suma.hegde@amd.com
References: <20220209184406.99938-1-nchatrad@amd.com>
 <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
 <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
 <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com>
 <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
 <aeb4d8d9-a43c-0697-5035-eff7f4ba3728@amd.com>
 <CAPhsuW6QHwpBH79GeNo22YNsRdcWvUupa10sbqup_qZ5V-__HA@mail.gmail.com>
From:   "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
In-Reply-To: <CAPhsuW6QHwpBH79GeNo22YNsRdcWvUupa10sbqup_qZ5V-__HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::26) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f5bf6f4-7e42-48c9-876a-08d9efcf349b
X-MS-TrafficTypeDiagnostic: BL0PR12MB2435:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB243558B6638A8ADD214C19A6E8339@BL0PR12MB2435.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ztzh16MHohWpVtLTtL0iTz+bgE5R/sbAa1S1+pIvBwrz0B8YdJevDhP6fvoLBr4MGX+9BU54yfkyPrwJV+odhAC2dLLoqyETNCbvj2NzQS4QCK2v821wvj2XSG6B+iO3iO6NJoe8lce23uiOeVcwUpUL133g3Dn6P7WxjQu4vcHFedZF9UUfk5j78Mi8Gq1vnE/6rGmnwMV8KvqzT8vAytir/BvEG11ltpSKWeHK0zCRNivSkDYNMnqwYN5/9UR7xc+alIQoiXO0TrWuosVc9xh6e6weRQFimoNx9+XN6vG3aZ0cC7g37cJL8kzMV550APJXift+qCEygVWYILv6MlTA8QkK/pUydSy/5s1agNjkVFKcj9rsBLPWHYGvCSf9LuKSnlICzfC+UTFgfeBqqbRmiQdXawWCkYtDp5clpe1UZexTQro65zwxe/aCVjD/enKLTS0zVaafpTGIYuQgRMCEDkArDXfrgd2g+GU5PFQWP7ALhziEi+gfduAWZVmKR03QQpQ6pEyVXCTpv708QwAX6oIrx6hh7G70MQq+rqPJUd47Xss4Q7b2sZHj/S1Cz41JO67gOAVNj1nIEog4d2SFMLKQL7jv59iRnkuscRc7Cjlaq9M/VRZYoH+NGh3P58b+zg60yPsZazKT34NBRxrAqRuSeOh8WK9Va6h6uDRgsJYTNUJgqBU6Wx5phcoMaI9o98AJFEniudoEW6z9ay4pz4c2tNmEs99c2A1WdxsftetSSmARne0sBBUJWAG8IGjh6kuj14Us+y9Y7pYT0HDCyvWlNWJp5+YeyK3KbPQN9OSiQ2XzjLV7tDKw7418t5VG3KrrJaFrpDq/KsZUVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(53546011)(8936002)(66556008)(66946007)(66476007)(6486002)(38100700002)(6666004)(6506007)(5660300002)(966005)(2616005)(26005)(186003)(508600001)(6512007)(6636002)(31696002)(110136005)(2906002)(31686004)(36756003)(83380400001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1gxeE05YjR2QjBZU3ZYY2x0aEJIcWxqRWZkOEtCenVSTlhCZlllaUd3VzBo?=
 =?utf-8?B?WlBSeTdnN203NnVSQkt5Y0RoR29WRG5xN1k4c0lFR2JNd3BXTlJYeWNIVjNU?=
 =?utf-8?B?L2kzbVQ4YlVsaFZucWlSY3Z4cFRxVU9za3JjQnRzTGZCeExWVVh3SXRwU0pr?=
 =?utf-8?B?QVRzL0NXS2ZCaTFwTThhVjh1cFIxQi9zR1laZ3lvOHZJb01MdmM5UUNQTytm?=
 =?utf-8?B?a20yTGlUZ1RYQys1RFVKWXdDUlBPZDExTUduWGJIbHlIbmw5YVY2U0FlWW9M?=
 =?utf-8?B?dVpLbXBvTzZSSmE4NWd3UHp0QWZ3b1RUc2krSVZyUFNaYklxTGV3OE1OSDBv?=
 =?utf-8?B?WHB5cTZuUGEwTUR1TitNeDE2V2FKN3NtR0JHZ3QrQ0M1ZFZ1STh4anVxRHpV?=
 =?utf-8?B?aDd4TkZxVERzTUErOVMwYlVxcTg3NWxGaS90VFlxSU42RkhXNnNXa0JZaWNJ?=
 =?utf-8?B?UjFNTld4bDFRL3h1eDlJM2FraWxXaHFqb2RvRVhzZ2JBQkZOeC9JSmZxY2VP?=
 =?utf-8?B?WEw3U25qdzYyQlk4b2dDc2hCaSs3Tm9yaTliekg5c1FJd1BLRHFZalBHREFW?=
 =?utf-8?B?Y1ZyS3JOcHlkOTBGaVNhWE5KS0xGUm9xNWRCejBKcWZ3amRvMnl0Tk81SkJU?=
 =?utf-8?B?TU9hdmVCdnY2bkhvQ3NGUytTa3h0c0phaVhTaWFaRFgrVUp5ckh5UjNLcEdj?=
 =?utf-8?B?N2phM3drTmhkd0tYQmZ5VytSNHU2OXVJNENqa2VWaEI5TTg1cnd6RXY0STE3?=
 =?utf-8?B?MFkzQ05VWFBWMHhjcUIvb3pBbGhJY3RZVDJQQVJ5ODBhMVBwbEFsSGdJTjdk?=
 =?utf-8?B?YUZpenVmOS9aVjNYWGJjRkd3OS9XWnRUTVVRcGdxelZaSFYyQ1ZnTDFrN3Jx?=
 =?utf-8?B?ZC91dFJiMUVUKzROM0RVOXMzOG9hcTcybEw5QTlKSWpOVkQ4RHRGYjRtSlF0?=
 =?utf-8?B?YlkwVVJ1NkxLRURRcVVOTmoxakdqZVJKbUVqT2c1REZKUUJYZ0JTUzJxdE44?=
 =?utf-8?B?Vm1qbjhzamxQbVFicXZab3NPUEgySmRyRVlGcEpUS29vd1ZTaHJubFRhVTFC?=
 =?utf-8?B?NHBUREFmc0drRjA2R3d6SFZQcFNrMkw0dTcwT1VuWldzbHh6K1NGUHdwazFz?=
 =?utf-8?B?V212aktOdk1KV2FUQi9nRUhJQ0o0dCtlK2dkbmt4bjZmd2xNR0ppT3A4Yzkz?=
 =?utf-8?B?Tk9iRGgyeUsrUVJkZ0c3R1Q0WVFPZG9iaWVqeHRORUlBOVhPSFBDbEU2MGJz?=
 =?utf-8?B?cVRET2g2blNLRm82eFhvTEVVdGJiZTNqNDFXOSs3eTM5Y0Z1ZERYd0hhUjBr?=
 =?utf-8?B?OEh0cVZVQjNScXlWUXFhRllNTEdrNjJrRURXKzdIRmFkQjRyUEhPemVlVEwr?=
 =?utf-8?B?VWpUTlVjWVZzcCtGb0xVaTdRekh6VE94NlBWWERJQU9oNXp4Sk9abXJIQ01a?=
 =?utf-8?B?dGk3WkxsdFg1OW4yMEUwVGpzVWJLbW1lV01US2pEZzNoWmdRUUQzVmhOY3No?=
 =?utf-8?B?QzMxcjhMU2cxTlFxMUZsamVURjRzeUJQTXR2bDlRYVhUOWt2b3NGOC9TMWZa?=
 =?utf-8?B?bDZxQ0h5M3FnZWZ4SGlwWHRZMlFlWDZUV0YzSVM4dUZPSHpPR21xZzhQMVg3?=
 =?utf-8?B?dEZCdnh1NmVBRUtncjdKdWdHZXNXU0JYS2tVQUk2bUk2L21iNFdWbzl4YUEv?=
 =?utf-8?B?N09jSUp0eFNQbXVyUWlkcFlSMUJDcnlJWWduQkhPaXVPOHk1d0RmcjJudUtG?=
 =?utf-8?B?NEFXZFIwMXh0SnMvOVRkNUZGOU1vbDZZVitIN2FYcTVwSUpReldTNSs0M2hr?=
 =?utf-8?B?ZXYyYW5uSVRIbVhLWkZBdXlQc3QzQURuZjNoWkh4Wkgrbjh4OHRnUFYzUkl2?=
 =?utf-8?B?ejNqNTZZZ2dYcy96bldxRzJFdFduaVBoZmpLdnZjRE9XUlZBa1BZbW5FUXVx?=
 =?utf-8?B?R3p5cTZPQS9rb3Q0aEU3c2o1eTExMXBMSWxIK2JNcTJxVDBacUsrYXd6aC94?=
 =?utf-8?B?NC9TWG1xMjE0OXpGOHVvZnFhK1NJNkZMN1dXejhEY2ZjdTRvemZ5UWh1QUxS?=
 =?utf-8?B?dnZlUVVwQSsrS3l2TVVaeVBrUGF5ZG9iMHY4bGhMenNUS2lmNVVQamtnSTF0?=
 =?utf-8?B?VmgxckFKRGFTaUU4dXJUeVVQalZzTjZPa1RTUnV4MGJjQVJiOEdXK3lMU2s0?=
 =?utf-8?Q?BjTVRL5SAaXVIfnKrRIX6Ss=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5bf6f4-7e42-48c9-876a-08d9efcf349b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:32:27.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6525bGToU6+XgSZmWpOxxJvGju8hft2y/4NpuSzIXRXkFZNxlhnIRzTGeaYgCmGsev3DhZpa2SBWutzSGh+bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2435
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Song,

On 2/11/2022 3:10 AM, Song Liu wrote:
> [CAUTION: External Email]
>
> On Thu, Feb 10, 2022 at 12:42 PM Nathan Fontenot <nafonten@amd.com> wrote:
>> On 2/10/22 14:32, Song Liu wrote:
>>> On Thu, Feb 10, 2022 at 11:52 AM Nathan Fontenot <nafonten@amd.com> wrote:
>>>> On 2/9/22 19:10, Song Liu wrote:
>>>>> On Wed, Feb 9, 2022 at 1:08 PM Nathan Fontenot <nafonten@amd.com> wrote:
>>>>> [...]
>>>>>>> +
>>>>>>> +static const struct hsmp_msg_desc msg_desc_table[] = {
>>>>>>> +     /* num_args, response_size, type */
>>>>>>> +     {0, 0, RSVD},   /* RESERVED */
>>>>>>> +     {1, 1, GET},    /* HSMP_TEST */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_SMU_VER */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_PROTO_VER */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER */
>>>>>>> +     {1, 0, SET},    /* HSMP_SET_SOCKET_POWER_LIMIT */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT_MAX */
>>>>>>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT */
>>>>>>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT_SOCKET */
>>>>>>> +     {1, 1, GET},    /* HSMP_GET_BOOST_LIMIT */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_PROC_HOT */
>>>>>>> +     {1, 0, SET},    /* HSMP_SET_XGMI_LINK_WIDTH */
>>>>>>> +     {1, 0, SET},    /* HSMP_SET_DF_PSTATE */
>>>>>>> +     {0, 0, SET},    /* HSMP_SET_AUTO_DF_PSTATE */
>>>>>>> +     {0, 2, GET},    /* HSMP_GET_FCLK_MCLK */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_CCLK_THROTTLE_LIMIT */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_C0_PERCENT */
>>>>>>> +     {1, 0, SET},    /* HSMP_SET_NBIO_DPM_LEVEL */
>>>>>>> +     {0, 0, RSVD},   /* RESERVED */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_DDR_BANDWIDTH */
>>>>>>> +     {0, 1, GET},    /* HSMP_GET_TEMP_MONITOR */
>>>>>>> +};
>>>>>> The hsmp_msg_desc, hsmp_msg_type, and msg_desc_table are used by the driver for
>>>>>> validating user data. These aren't part of the user API.
>>>>>>
>>>>>> Perhaps these should be defined in the driver itself instead of being a part of
>>>>>> the uapi header.
>>>>> This was my idea. While I agree it is a little weird to have these
>>>>> tables in a uapi
>>>>> header, I think it is helpful to give the user some reference about
>>>>> proper num_args
>>>>> and response_size for each message. I don't have a better idea to achieve this.
>>>>>
>>>> I like the idea to give users a reference on args and responses for each HSMP function.
>>>> If this table is kept in the uapi header perhaps we should add a short description of
>>>> what the expected args and responses are for each HSMP function with a pointer to the
>>>> full documentation of the HSMP functions in the PPR.
>>> I guess we can use unions do give full descriptions, like:
>>>
>>> struct hsmp_message {
>>>         __u32   msg_id;                         /* Message ID */
>>>         __u16   num_args;                       /* Number of arguments
>>> in message */
>>>         __u16   response_sz;                    /* Number of expected
>>> response words */
>>>         union {
>>>                struct {
>>>                        __u32   args[HSMP_MAX_MSG_LEN];
>>>                 }; /* ensure size of args */
>>>                struct {
>>>                         __u32 test_arg1;
>>>                } hsmp_test;
>>>                /* args for other commands */
>>>         } args;
>>>         union {
>>>                struct {
>>>                        __u32   response[HSMP_MAX_MSG_LEN];
>>>                 }; /* ensure size of response */
>>>                struct {
>>>                         __u32 test_response1; /* or better name */
>>>                } hsmp_test;
>>>                /* reponse for other commands */
>>>         } response;
>>>          __u16   sock_ind;                       /* socket number */
>>> };
>>>
>> I was thinking of keeping the msg_desc_table as is, just provide more details
>> about the expected args and responses in a comment. I think creating a union
>> of structs for each HSMP function (and there are more functions coming) would
>> get a bit messy.
> Yeah, I think msg_desc_table with detailed comments also works.

HSMP mailbox messages are evolving and each platform defines a supported 
list of messages.

On a given platform these messages are described in the PPR.

Eg: Milan PPR has "7 Host System Management Port (HSMP)", is made public

https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip


Bringing detailed description of these messages from PPR into the kernel 
would be a

duplicating effort. Which will also bring in challenges such as 
maintaining the details

for every supported platform and submitting kernel patches for every 
platform.


We would like to avoid bringing more details of these messages to the 
kernel documentation.

Such a structure can be described as part of esmi_oob_library to ease 
user space tool development.

>
>>> btw: do we really need HSMP_MAX_MSG_LEN of 8? The list above
>>> have at most 2 args/responses.
>> The PPR spec defines the args and responses as having up to 8 so we ned to keep
>> the max length at 8. No current HSMP has more than 2 though.
> Got it. Thanks for the explanation.
>
> Song
