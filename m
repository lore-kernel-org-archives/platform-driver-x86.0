Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F69C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Feb 2022 13:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbiBPNnY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Feb 2022 08:43:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbiBPNnX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 08:43:23 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DBD61F6BAF
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 05:43:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcgGyefZ7jwCQ5NmnSfOVi8rZaYML8q74YXsaYe8anjEdGcEyIq1sR3BZNrltodYbZFA4242wQM4YXDGM2HP/wViE0fcR0WTq4DDAydkV5f6T6K0H+3aP29DyFdYdU1hUCg+GTH7Qk9J2i1Bc0/DFG3KvwC8NdVNR+UuV8VXDrGxQ4lcBde72DwCDpwRo+eDdLpP7mhh+2sacDxH1ICmVTRkVCUqt02Ao2tx4JBpkeyF2hzy9E+5KkPk6S9zlA6TlV7nxlOVHeql9NYUQbcM/uEBfkMIJyAOSlWVev3XzE6WU8gOQvfcOWzvtBRv/VKwpP5gaAzzHG7VciUDKud6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH8zggzgI0ZGCej3ZAw9AAgg1mAQewKNeICjiS8RLOw=;
 b=iKYRU15BwUn2YfrsViFv74loN1Ez6SY9CTz2tqWP87D0t6MX4fsIjz60VnLL36ZkTYmTZzcmUuC+gtI9yt6ohalpXsQUFYBWysqSjzjC/lvCvH0YH4jii2rpD5paYto1wYdeuc3vLRvxGT8ZP0xmqeVGQJk2qPJoawx+WMs/v8U784EcHm/dRRfAEM17SnX0AKWZc2AYQOcQO/fN/9S/BK+L9HptxiyOh5YWDEBkSvTdcg+lnD64Sl2wx8mgzTDVjDHVBDfbyJilC7OTW0xdHMgQ+20PU/BqECX0IqYoArcj+rajlUGxGD58Q2/lQdDDiLdOEKhJ5h+XlIe4o5hDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH8zggzgI0ZGCej3ZAw9AAgg1mAQewKNeICjiS8RLOw=;
 b=k8u/i06vq7HSiVtxzv2CKqFkEMHSBAv1NYI+9Rk2wGN691qJcEqd9CVCXQ0r8eRqYbfvbLT9tgBu/poMAe9VlcOTUZ7Q4RRoOw9jAGoCLH4YBeIjTY7MtD1FV/fW7mPWpvnuR83dW2Ya+1AX3buHlzXMM3cYjnxpLrMDpWzb7h8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 13:43:09 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a%8]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 13:43:09 +0000
Message-ID: <bfee54fe-1779-fea2-8365-31167cc06972@amd.com>
Date:   Wed, 16 Feb 2022 19:12:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Song Liu <song@kernel.org>, Nathan Fontenot <nafonten@amd.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org, carlos.bilbao@amd.com,
        siva.sathappan@amd.com, suma.hegde@amd.com
References: <20220209184406.99938-1-nchatrad@amd.com>
 <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
 <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
 <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com>
 <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
 <aeb4d8d9-a43c-0697-5035-eff7f4ba3728@amd.com>
 <CAPhsuW6QHwpBH79GeNo22YNsRdcWvUupa10sbqup_qZ5V-__HA@mail.gmail.com>
 <2549f688-c148-f893-1fe0-52a09a8fb1d5@amd.com>
 <CAPhsuW5OMLcFWt8iUu0K57iSvxGME=Dj1PCO8VZ0QL1gHZ-dpw@mail.gmail.com>
 <e1249c0a-6729-c02b-45b2-80d0fde07f7b@amd.com>
 <CAPhsuW7mDRswhVjYf+4iinO+sph_rQ1JykEof+apoiSOVwOXXQ@mail.gmail.com>
From:   "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
In-Reply-To: <CAPhsuW7mDRswhVjYf+4iinO+sph_rQ1JykEof+apoiSOVwOXXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::30) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad2349d9-0f3c-43ab-57cb-08d9f15244bc
X-MS-TrafficTypeDiagnostic: CH0PR12MB5106:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5106E7D089FD1F6956E4FF9CE8359@CH0PR12MB5106.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtgGg89prFQCvRbdI1aSrd6yVnZ5wCQAGHa+9XdF/Q7QseSYrJtzMoPnhUYn7DY8vYPXQyO1y0rdGcLFhDjtT7JFP8QhA8nH1O5ue4nPlf1+KBJxqFfvff72JNQOLV1I2dE9VL+4LeJ13mmGA5HIePOclKhQbC8QbbF/n+W9qHRhAFkwLQYdnEJQbbikh5kAC+AxIFw5Sei330K93HABuz6xcIHP/wFqdAKkvVKDjV4PxyYZJIHzT1HvIRXOGBUZ3v0PmfXA/qRb0YV2FMOF6tyo50NHVh/0AMSlt+LjJxfGUktTkc497t4UljACgkwwiyaQ1omX5X/14pPHxO2xyXcTyPpcf7zIvQ1uvXxfxi6SjIE3nUgwSWfYizl8IR53lf8U6YfXm6ZprI0hgcnjINqc7TRlHMLwzw4tfJi41zfyWmJuNeDejvK99bNx2DWbvSSlsotuRo7x2M/HFwIApXWtDvZ+k/YtlKf6CPTJB8HbvvMHNDfcX47MC1c+0gCF3WWpTwsluxGjvUHwrUQlqkqlNRqcbBYB6KFmU8h3XrTuT8BJtGRO9Qje2QmEiAq7Q+BGA2zotLY7GborG1xy2QOKcgUeFjnesCh3nwWMEdZku1Avpky45ibtt4NQObOUfWrZSRqE50W0WJWQs8+rDTn03JAi3PFFTCRwIDRT2/vF8E5vqQGbyLeYEw2VPSHFCFgi2wobS35g5AHtr9f6HpXXFxe6DbdFkhmrGWlzl3kSKcSK5PQd03a1lTh/eldHIhbCssCT5rkNqSNO9bGJX7TfnzuyAKrADvtdGoSmml5LRzns4C9N2OuTw5dBynzOalIx16zfphDoDBqQlptuTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(26005)(186003)(966005)(110136005)(66946007)(508600001)(6666004)(6512007)(6486002)(53546011)(2616005)(38100700002)(6506007)(66476007)(8676002)(31696002)(83380400001)(2906002)(66556008)(4326008)(36756003)(31686004)(8936002)(5660300002)(45080400002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVhOZWo5TW1saDl2Y09MVDJ4RWN6eVRmY25CWW5qanBxYUkvWFpvcS9CeE9J?=
 =?utf-8?B?NVY5cXdTaHJyVDljcnlZdWlpVEtGRzZkU3dRNWk3eUwwZEt1VlR6azdTT3RU?=
 =?utf-8?B?N05BWC9iRjNMcGU1NlVJeWtSbE1LdW9scVJJMkhPbHFUd2hnWW1VSUg1TlMw?=
 =?utf-8?B?M3FFMFhRTzY3UFZRN0lGWTRFSlF1cFNycFhuek1hUDBLdkphOVRCeHlITXAx?=
 =?utf-8?B?U0ZENWhtRGU0NHRiSmEzaS82VzFkeDhldjNHcHpHYnZtQ0czdHQvckJJb29P?=
 =?utf-8?B?NlE4NmZnUkp0R2Y4bkIvaXJkR1lKaXNpcHUrM09sL3hzSWxFM1R5Q2laWEpk?=
 =?utf-8?B?Z3g3dStnbDIrc1cwMkdPYStCNzUxQVNFMmVjRjl4YWhLUS9xbjJoOGdHSzgw?=
 =?utf-8?B?MCtYeEFZMnBxcXFGWCtnejNZYmhoSmpEZmQ5VHBBVGp2TDBFZ2UydnhqYzZF?=
 =?utf-8?B?NFBZemlWcG5nZmR4ZGh4aXJXbFRkc0lVcWhGajlXV3grYSt5VW90UUZ5UnB2?=
 =?utf-8?B?bXJyNlN1ZXNBVzRWeXdrdVVBN2NyR2VrNnR5bW5tZDJ6eVdmMUJkNkJrdUpl?=
 =?utf-8?B?M1dsWE9LTFdqQWZEbzU5dFQrNzVwNzMybDZGMW12cEg5VGFrSTJSbWRCWGFy?=
 =?utf-8?B?bi9zb0VRN0RhOXBHN0l6Y2xNM0UzQnRYYkR4MCtVRlRHTW9Pay9OS24yMFhr?=
 =?utf-8?B?cU0zamU4dFdENjBVblBla0wxazQxLzJ6WDBVL0N0aFoyRWxPVmQ0NE9PZ0F2?=
 =?utf-8?B?d1o3OGRvWDZSaG0rd29DVCtxeFMwZnBLK1JmY0liRGZGTVJRT0xFNnlBMjNZ?=
 =?utf-8?B?dE9tNFBMMDJxcXYxc1EwUUFlN2tSWFVsU3dVRTB2WHFDK2VTcXdRWWpQK3Vr?=
 =?utf-8?B?WnhqbUFNcFJMSzlURlhQbmhTVWxEWnlXazgrb0ZXdHRsbENnN3MzZ0dRMmMz?=
 =?utf-8?B?RmdudENWcE9BUy96dkRqNitMb3FmT2dMR1BDWnQ4ZWJ1MUx0T0g4TzBkcldQ?=
 =?utf-8?B?b2hYejQzRDZVNEdjYnUzdi81dlhMZm5sdndhS1FpbVdYM2ltYkY0dUdvNk5T?=
 =?utf-8?B?cWMrYytzQnBxN3NwakZxTHpXeGczOElad3BnRDNvd2N5dStNcXRTMHFKcmY5?=
 =?utf-8?B?eWUvd0RtalZ2bVpiNXpFN3d4alBabFRaa1hCRjVkSkxBeGtJM0FWUjI3TldD?=
 =?utf-8?B?RkN3Yzh3SUtjY3dYQS9DVkpYb0NPMjdCaEJpNGtnQ1JOYm11ZEMrajM0MWt5?=
 =?utf-8?B?L2VZMUJ5ejhGS2M0d1RCV2FEZTBML2k1VTNrWWJCMXEwOHRlVXZIV0ZvQ1Fa?=
 =?utf-8?B?Z1R6eHRGSDlVS2J1SHZqQWpxRzZ4Y05CaElMWDVPSEtBMFN4TGZkREVKSEtE?=
 =?utf-8?B?NENTS1J5ZllYVzhMYzRuQmhOSVh3SnRaTEIzblVzUDVId0Y0WG8wV1ZZbWRG?=
 =?utf-8?B?MHpqUTYxSXRWYXlOSFRVVVdQVHdjb3gzRlhQb3ZwUVpWQXNKRzMxRTRFd2pM?=
 =?utf-8?B?M2FiSWNBVDVYOCtzbkZjWTcyaXEvcVV2QlErUzZGOS9WRFZpSmxGbmxyTWpC?=
 =?utf-8?B?WFpyWFdyRHlwbVRIaVlIcnlCK2UyY0xWK2lnNUtSV0VZM1FxbkRidEVTTEZ2?=
 =?utf-8?B?a24rM0dTeG5KY1dKbDk2VTFYcGFSRUEyR0NSYXRTbTJsY25ldTAwMVZWTkhY?=
 =?utf-8?B?MkhhdGZWa2svN3pUcHF5Q3g1RmxzcjR2R3gxVXV0NmN0cHpKRUllbHhuRGNl?=
 =?utf-8?B?LytTd3dLZStJa2NCOHZRTTJNWTY4U0IwTzRxQVNqZFJ0T1pBcWhuNmQ4MW5T?=
 =?utf-8?B?d2VkelpDSGVvbERpdGVlOGJjbWJvVmFlM3dnUVhreUl0LzNrVFBlN2VZczZ4?=
 =?utf-8?B?Vkx6U3FnY1FMRWQ1U25nZUU4QmtvOTJpRGdraCtpT0N3b1JZRzh2L0huSHhO?=
 =?utf-8?B?OUwyVE04V2hUeWN4OThVZDcyQzIzd0xOcS9BOXRVMkxLU2FocWg4T1J3Mkdt?=
 =?utf-8?B?T1NDbHFRUi8wRVl0VG5pZXRDRVFpN3RwenMxMkJjbjA1LzMwWWxOdkVYRStZ?=
 =?utf-8?B?bWVaOWlWaVJ4S1pQeWo5RDdsL3JMOXBqMk5hMUQ3eEN4OWVFMW40ZXdCSGw3?=
 =?utf-8?B?SEUwbnArVG5idmZUVG1KQTlKNDZCYWsyTjFHUkRJZXBXdnYwWFhVYXdDdkxs?=
 =?utf-8?Q?fb2i4KfPVbhIB4FXu3ypAz4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2349d9-0f3c-43ab-57cb-08d9f15244bc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 13:43:09.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ga7c8OtuDXKnzki23kHcJ/CeQJDNAPBdehdgvHVotJL40Opri1YiCvlf1vzKDcYzqvRSPTzxzDb0gTWPFM7mFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Song,

On 2/15/2022 11:51 PM, Song Liu wrote:
> [CAUTION: External Email]
>
> Hi Naveen Krishna,
>
> On Tue, Feb 15, 2022 at 9:24 AM Nathan Fontenot <nafonten@amd.com> wrote:
>> On 2/14/22 11:21, Song Liu wrote:
>>> On Mon, Feb 14, 2022 at 7:32 AM Chatradhi, Naveen Krishna
>>> <nchatrad@amd.com> wrote:
>>>> Hi Song,
>>>>
>>>> On 2/11/2022 3:10 AM, Song Liu wrote:
>>> [...]
>>>> HSMP mailbox messages are evolving and each platform defines a supported
>>>> list of messages.
>>>>
>>>> On a given platform these messages are described in the PPR.
>>>>
>>>> Eg: Milan PPR has "7 Host System Management Port (HSMP)", is made public
>>>>
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=04%7C01%7CNaveenKrishna.Chatradhi%40amd.com%7C97254107b02b4ae0c30308d9f0b004d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637805461640162776%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SLrynPAkyTvYswBnj%2BK%2Ff3ELedFn5iOJ6xZtgGcC5XM%3D&amp;reserved=0
>>>>
>>>>
>>>> Bringing detailed description of these messages from PPR into the kernel
>>>> would be a
>>>>
>>>> duplicating effort. Which will also bring in challenges such as
>>>> maintaining the details
>>>>
>>>> for every supported platform and submitting kernel patches for every
>>>> platform.
>>>>
>>>>
>>>> We would like to avoid bringing more details of these messages to the
>>>> kernel documentation.
>>>>
>>>> Such a structure can be described as part of esmi_oob_library to ease
>>>> user space tool development.
>>> I agree there is  extra effort to adding extra logic and documentations to
>>> the kernel. How about we ship current version with a few minor changes:
>>> 1). msg_desc_table is in the header, so please prefix it with hsmp_
>>> 2) as Nathan suggested, add more comments to msg_desc_table. Maybe
>>> something like:
>>> /*
>>>   * HSMP_GET_FCLK_MCLK,
>>>   * output arg0 = fclk (MHz); arg1 = mclk (MHz)
>>>   */
>> Agreed, this is the type of update I was thinking of.
>>
>> -Nathan
>>
>>> {0, 2, GET},
>>>
>>> Besides these, I have a question. Per the hardware design, args and
>>> reponse in hsmp_message share the same registers. Shall we make
>>> them in/out argments in hsmp_message and save 256 bytes per
>>> hsmp_message?
> Do these make sense to you? We are hoping to back port these changes
> to unblock our tests. But we need them to be applied to pdx86 first.

Agreed on using one of buf array for both arguments and response data. I've

submitted the next version with these comments addressed.

>
> Thanks,
> Song
