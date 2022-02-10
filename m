Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83477C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Feb 2022 19:53:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234231AbiBJTw6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Feb 2022 14:52:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238627AbiBJTw4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Feb 2022 14:52:56 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2073.outbound.protection.outlook.com [40.107.100.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769B4FE4
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 11:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilC42pFrM50VnvPmB9vnENM5BI8GU05AqU2FsnzoWxmcFODOQWcl/Xe1Q+gjfDSIWmPX+Ah9RQs4I8KOrTfBhWultkUVI527koHXefp7aMeKaDzQbx9IEBdfM1lJdLurhS4Tlvbb11LCwe1grH68TFoz1GEgCTGyrVdGIdUjprkg4GCO+5cHL0finJ6JSC0SJ0dHWlEKthCqT5UXg5JEaShSlUA6huYn5VMYMyALn89aHeVMgkADZC0JAePb9f+8bSiyWVS4WwucwMnGI4Npwx78gLDVLBaPrUOuk0X2XcNbGUd3HYf2xhj7H4NsCRSpxtvgBHYuaPqcE74Ub6e76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjD1MriKzqBA/sFt9m2p79nEXE5nyC2arC94Pgf4EHE=;
 b=TSNqcsCMc3RFQiRzJbt+0nrQBJBtnS5Bui2AnuY6/LoHcSnNVcJleQ/SUC6YZH3peAtquEnawUEIEqMVudTmhmqWu7fJGVdIicI8gRUwwEorKQ2yj9orMxCN7+yfUzL/0B4+UyPcEXj29vXaOcSq1DpfEf0ps2xXuoGjxDpJ2Ikh3lwtf1UODA5fk2mZLVde1dbIwU1BobNbIREqDAFNKnKLdn8CCzxFoHLLY54oFSHYXr91zol68fmEZtvkcYkmr/3GBDSHhTsoAfHGkpYcWDVLu+1NGeoN0K9vSC0db6YLhP+eP+vjP0Eerlalne/M8OWmjIOTMt7s3qwbKh90Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjD1MriKzqBA/sFt9m2p79nEXE5nyC2arC94Pgf4EHE=;
 b=Ob6ptvfYX5/0bgXGBnPq1HyOxiLvQEysfxXF6zDOkQ9G7K8YFMkXngVHOXGlbXQh9SygAcutU27nGg9gl+Aj7lfVjqEG7dNCecmIwOoTnKOf4wFPugepjzOjXhevhoigQtYTs2X4tm8TE7wuKb6XV3DfpqVF0KZ7lN383QdytS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by CY4PR1201MB0023.namprd12.prod.outlook.com (2603:10b6:910:1f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 19:52:55 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c%6]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 19:52:54 +0000
Message-ID: <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com>
Date:   Thu, 10 Feb 2022 13:52:51 -0600
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
From:   Nathan Fontenot <nafonten@amd.com>
In-Reply-To: <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3402f466-53b2-4516-edac-08d9ecceed98
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0023:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0023066921A75BA5876E9592EC2F9@CY4PR1201MB0023.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7TX+sBqUnDOLsoOO0z2wvTyoeIN8wdWp7HwXjlCHLoygkz2UvLK904bw5fiElRrMa1vXggrMDvNkqplHVg1rINStP8piP8uJyCMwxYB1iJS2kntlXJdporbWhFMvLBeLvabUfGLBW/yJalOf2ztvJlm9n9T3ha+ItW5aH2u5I4Mlka2EH/PfTCilESixcmO2uDQxRBl2TcXAi9W4vmihSmuBJcxLvRDu15/08NHSAR+ciB6HaZyrVSorvzJwePELdngFt6/vPt99v9eOPOlMZSfOQYnO5tyD5Zo0bb3i5w0BXrXPtSqraFGiNHK38gQZRNiEpbKqj/QvMfLxv8Vifz0NMen+f/49lGosKSekRKUEifT6G34El7TLENpXnSkT0re5W/WAxKnUd7yUjRIrGxXx2plwTy28ddlZSbXF/hhQRp/JolfQdkABdTQndD2AqS/m233hbXsXG4rYSIQxJj8ZH3yT9Xtuuzb6dQ+Id56zeJL3oWmvuiekN7sTa5Ksx1kwrR4UKgZdiEedyzu2l+os1OPND5bjaaPioyLMdLYwe2d3v80NPWRVVJocj5J+llewYlyu/svqU6dwbEl/N4dv3/42Wpi34ptG3d+KsVAhcfdP4jQruPRqOvR1vVCPpnLsrtggfygoR2JJM9lHhQv0FgiFR9VbJjEBhekpdcvmNounmVJ/TcXEf5XV5IB/KwfuW6CZcjOZe67i9zptWgMQR6G5hOVaoCQ0fGauyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4720.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6666004)(4326008)(6512007)(5660300002)(6506007)(8676002)(31696002)(508600001)(6486002)(36756003)(31686004)(54906003)(316002)(8936002)(2616005)(186003)(38100700002)(26005)(66946007)(66556008)(66476007)(2906002)(83380400001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjZGT3pjN0V2NUlRN3RGdjdBMmtudFV3OFlkOHl0VzhuYk9zRElxRWZkQzVi?=
 =?utf-8?B?djJBTWV1RFBKU1Z0RVdIMUpzeU8vT1RickFNN2Y0QmdtTytHNFN2S1lFMmNV?=
 =?utf-8?B?WndEVHI1ZVNPajhSMVFxdnVzWlZ1N3JVRE02bWs3eDVlRFBNL3hzTWh1c0xm?=
 =?utf-8?B?dW1iMWxtWTk2MUZJRE5uUm42RldDbFMrN1QwVGFUS2FySnR6Tmp1OTBWZDRi?=
 =?utf-8?B?RTBHMGZDZmZReFpCTTE1ajVvY3M5U2IrdlgxSk5qLzRvejBwK0o3bTFUZ0Vp?=
 =?utf-8?B?WC9lQmQ5SFNzdHNVZGFIQ3MwZnh3MkVuYy9tcHpTTTlyMDFpN00zVVVzTjNZ?=
 =?utf-8?B?dkxrL1VLWlJGRVNSY0xpbzdVLzNYWFdNTUROLzVEUVgzTm1tWjNGdUc3aW1D?=
 =?utf-8?B?ZDVJZmh0V1h2RGFTMmZ6Q0FsVVovMkJYREZvVVN5NXV2dkl6amJmUUZMcmRq?=
 =?utf-8?B?cE9McERidm10NG4ySjY1b2tRSmRxSGRaM0tQUnE5WEZpM05NRTYvWUgzKzVT?=
 =?utf-8?B?dWkwekZ6MTd0VGFTZHdSdG1ENk5OL3lCbm4vbXk2VmVmeEdwd2dGa204VzVP?=
 =?utf-8?B?bzVwUlo0YThRbkVVQ2FyT3lJUUI2aXV6V29XalhDS0NReVEwZlhEZE93cS9E?=
 =?utf-8?B?SFkwdXR3OGJmNVp6eHNyUUdHa095dEdPVDgwRVdCTzdMMTZHK21XM2Fkbys5?=
 =?utf-8?B?ZncwWXhSN3FzNktoS3ZQaU44bmFrQUZxLzZDRTByZEwydEFBWnF2cVhjZFU2?=
 =?utf-8?B?UjVJT0xVSXpXVFhuVXhLZEhVOTg5ODlJMytzTmd5dElvM09DeWtyd0QzSmJ3?=
 =?utf-8?B?VVhXUUJJZ0xKS0JwL1hDZEpSZm4vemdzYW9QME5FN0xCSFQ3MzV6ZmEvNytj?=
 =?utf-8?B?bGo0OW1WWDAxT3dvY3l1Nk9teGZoektKN1ovVmhtZ0I1Mm4xRU04aGxKUCsr?=
 =?utf-8?B?RkNtNi9sS0p5bC9Dc2w2MlNZTW8xb2MzNFpMaVNDOE9wSThzcmt3bThwQ2RN?=
 =?utf-8?B?Z1BodlRiNmZjM1BuYkdsbWVzSjZ5MC90cFZVZW9MWitHVlhQK2REWnNyYnBE?=
 =?utf-8?B?U0ZmeUdsZy9zTFhvZVhXSlpvemJ6bDZoTHhsR2NiMWlWWVFDSEN3TEZxTVM2?=
 =?utf-8?B?S0VBTkh4bGpuWnpxOXBUZW1MVUlMSHpHdVlWRlJDa3hRTUE0QWlJcEtvVFhU?=
 =?utf-8?B?Z2dab21RNmxmU0hGWjhOTHdUbWxmblh0OWIyTzZBVGtBdXNOR292bHVPT05a?=
 =?utf-8?B?UlE5SVFZamt4VGRqbm9qVjljMGFncnZBbmFma2NWMGI0MXljQWp3YU1hVktj?=
 =?utf-8?B?SXlubnJTcjAzVmlCK0o3MXM0NC9mQktXeDExY3dIK2xDSktSRnRadXdYUnRR?=
 =?utf-8?B?LzhxSmZ1RmZhU1UzcDl5WHdxTmMwRWtjZVZNRDJwbnZ4OXNGdXc1VUhHakdx?=
 =?utf-8?B?RHgxU0U5U0c4MnA4ZnZsS2dKNElreHdzeHRCSEFwWjA0TytNcGlxK082YTRW?=
 =?utf-8?B?RXJlUXJOanBhQ3VNMW94WEwra3FEWmhDbG5ETFRHakRjMXM2Snl2MlgrOGxz?=
 =?utf-8?B?NFJzcnlsSTNsT3d2SXJLSlNLbFdvenpmK3l5V2RvY2NrZWhCNy9RZTZqaG1a?=
 =?utf-8?B?emc3UzltanQ4c2VsQnhSQTF6YW1vbzZNUzcrZXB0VjZwN29NTXhIcmoxVGt4?=
 =?utf-8?B?U1RpUm5tOVJYaTVEUzc1R2FYTG9JR0haYjhRdU9kYnV0citXVFlZUFFGbEhy?=
 =?utf-8?B?TXdheUVLT2FXMnJFZEhOeTRPQzlxekJ5UWtKR2kvdjlUaTBReW1sRnJBRkxk?=
 =?utf-8?B?QUNKdXkwbFVadnFFNTRMVzdFWnRZeElaOTNXUGNKUXY4T2V1REsxSmxsUWN6?=
 =?utf-8?B?cXhzU0ZTaDI5Y3hPeG5BeFRhR3lDNk93d282eUNpTFB6TGFNOXFId3ZsNWIy?=
 =?utf-8?B?azN6M1dLM1dvbkxwWTBWejd1Z1lSL2o3MkJyT2JHc0w4RXpUSXIyMThSQVRY?=
 =?utf-8?B?UndVTkcyNjIySHFUTHhtYnE3cUY4dlQ1Z3M0NVFQcVJSb050allhNmtoYTB1?=
 =?utf-8?B?SjdaR0NVeTJ3NENIZThYa2NubFpSTm9lOFl6QzBzSTFsYUJuWXB4VzRoUVJh?=
 =?utf-8?B?d2NwdENDTDIxamY3eW0wZEMvbEtkVUJGcm9OeE9sdzlFYVF0V05GQ2lpV2Jy?=
 =?utf-8?Q?/3LeZUTZwa17qDJzE52gD38=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3402f466-53b2-4516-edac-08d9ecceed98
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 19:52:54.6557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQoLPFjs0U9HIc9UIZsAsrkp/YbRZ78nCxFZp6dtkhgh+N8XlBmuYJLqTFFewkmy3LCf/Byjiox8iQi4QMaKBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0023
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/9/22 19:10, Song Liu wrote:
> On Wed, Feb 9, 2022 at 1:08 PM Nathan Fontenot <nafonten@amd.com> wrote:
>>
> [...]
>>> +
>>> +static const struct hsmp_msg_desc msg_desc_table[] = {
>>> +     /* num_args, response_size, type */
>>> +     {0, 0, RSVD},   /* RESERVED */
>>> +     {1, 1, GET},    /* HSMP_TEST */
>>> +     {0, 1, GET},    /* HSMP_GET_SMU_VER */
>>> +     {0, 1, GET},    /* HSMP_GET_PROTO_VER */
>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER */
>>> +     {1, 0, SET},    /* HSMP_SET_SOCKET_POWER_LIMIT */
>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT */
>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT_MAX */
>>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT */
>>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT_SOCKET */
>>> +     {1, 1, GET},    /* HSMP_GET_BOOST_LIMIT */
>>> +     {0, 1, GET},    /* HSMP_GET_PROC_HOT */
>>> +     {1, 0, SET},    /* HSMP_SET_XGMI_LINK_WIDTH */
>>> +     {1, 0, SET},    /* HSMP_SET_DF_PSTATE */
>>> +     {0, 0, SET},    /* HSMP_SET_AUTO_DF_PSTATE */
>>> +     {0, 2, GET},    /* HSMP_GET_FCLK_MCLK */
>>> +     {0, 1, GET},    /* HSMP_GET_CCLK_THROTTLE_LIMIT */
>>> +     {0, 1, GET},    /* HSMP_GET_C0_PERCENT */
>>> +     {1, 0, SET},    /* HSMP_SET_NBIO_DPM_LEVEL */
>>> +     {0, 0, RSVD},   /* RESERVED */
>>> +     {0, 1, GET},    /* HSMP_GET_DDR_BANDWIDTH */
>>> +     {0, 1, GET},    /* HSMP_GET_TEMP_MONITOR */
>>> +};
>>
>> The hsmp_msg_desc, hsmp_msg_type, and msg_desc_table are used by the driver for
>> validating user data. These aren't part of the user API.
>>
>> Perhaps these should be defined in the driver itself instead of being a part of
>> the uapi header.
> 
> This was my idea. While I agree it is a little weird to have these
> tables in a uapi
> header, I think it is helpful to give the user some reference about
> proper num_args
> and response_size for each message. I don't have a better idea to achieve this.
> 

I like the idea to give users a reference on args and responses for each HSMP function.
If this table is kept in the uapi header perhaps we should add a short description of
what the expected args and responses are for each HSMP function with a pointer to the
full documentation of the HSMP functions in the PPR.

-Nathan

> Thanks,
> Song
