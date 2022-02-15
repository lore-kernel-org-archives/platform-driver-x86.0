Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46240C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Feb 2022 17:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbiBORZF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Feb 2022 12:25:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241449AbiBORZE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Feb 2022 12:25:04 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2098FDB4BA
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 09:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzcqwyg1PDJr2Hp+JBtp0bWKQLOO+F2WzIMq79aaEPpne2U9fdeiBtfhzDAafznVyrXhUdSRCfNQrC/E17By6YeXTAVw68501fmylwNwQx3uJbTP74b9NhXHSTL4zFxm1euZTFKaMWEVkk7CP3KzRumsxwF8HfgAQXTOAWdDX8/CkHfU3kqIKOMdxIguhoxwmJCoHPB2JHBs5CAYWeCkHnU5KEwCVRq7T2wfF9+UIH+W3v0q7mKJdquw0fvteIEJaQQxssTF/74JrKRsTOw5uKG4gZ7jixJTOEIRHR9AfuHRm9RLWBEVNJiZ2Do6dTwD/NjaBVICkHY7Yl1HsgTBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pgrJaAB64F+crjHwPJLO1tZIf0Bhf8jAev3Pw5ETpc=;
 b=SE+L5nAwKCyMaY/tYiTaiBlCEaFPM5FEJpCu8oDNQ5wdZHrnPCTzZ+C95gg9gq+SkXU6le2DB/GgYNB29zXKQ/R+eDxyBrHcplUDn+FnIpj6YbL8CVqLf7RfKYNHSRslUAPCARZmoF49zppJc/P7fpG8UT5Y/d7y+bg/rjUADiusv9xtlWE8pQGr8XGWTNcPekV9hA2pWkN/gU2uo4INVcHT0X4IuWA54WrSnfb46clbSRAsSj7k5OsU6L5xywRz/wD9jjvPsiZg2udi3ktHvBRbn7WsNblKENoToujapCibVQCLjET5QOs1t3wAv9eutX4tf5jHYaH+IBiihViTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pgrJaAB64F+crjHwPJLO1tZIf0Bhf8jAev3Pw5ETpc=;
 b=D4dV1eCzptXtNMJ0U9PlXVnOU0WiRoL58GdF85wb043FQTlw2RpVaKtJz68DiEey+I3VMFovwEHVCtPRCsRcnSyK09xiOgrI4GrvfPbuuCDtG6wIULbOznLH8ut72i0KZ5H511dmRQE7nrJ1sZNnfXjGoQG/efcItuu5zDuaUyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by CY4PR12MB1655.namprd12.prod.outlook.com (2603:10b6:910:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 17:24:52 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c%6]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 17:24:52 +0000
Message-ID: <e1249c0a-6729-c02b-45b2-80d0fde07f7b@amd.com>
Date:   Tue, 15 Feb 2022 11:24:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Song Liu <song@kernel.org>,
        "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
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
 <2549f688-c148-f893-1fe0-52a09a8fb1d5@amd.com>
 <CAPhsuW5OMLcFWt8iUu0K57iSvxGME=Dj1PCO8VZ0QL1gHZ-dpw@mail.gmail.com>
From:   Nathan Fontenot <nafonten@amd.com>
In-Reply-To: <CAPhsuW5OMLcFWt8iUu0K57iSvxGME=Dj1PCO8VZ0QL1gHZ-dpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0058.namprd18.prod.outlook.com
 (2603:10b6:610:55::38) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0f36c13-bf37-43b5-dc98-08d9f0a81336
X-MS-TrafficTypeDiagnostic: CY4PR12MB1655:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1655ADEC949B47C346C2C350EC349@CY4PR12MB1655.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 04lDp5bIW/gWgOFPAR0lf/Wy/JD7Z2DGB5Iy4Uo7/qXX+tIHkJlh+eFukSgJHTqjsCu9Vo3oY8e437uFkQZxAzj1ILqTdYpYCSjUM7zA1iWY4sYxIZZYMWAZvTpcDGjkX2VH6GftRBnZlSzZKA7QLT6TkzDj/m+BeehotfH3HeOR0N6M1ceo9WIkaSoYD9Fmjf7GTKdVqtJIlhBFmpVa6oqzkJUQ5wuKW6p8/lDN5KwP3O1IscIfDJGv8UFXcvqjtHzF125egOfms1yH1dMpCN4grhXxGZeIM+No5z7mAcAYWS4M6/17DIuPybGX9iT1zgD07aMphLLwtYHn02zxuNfL1onAqB5cKufLy5PW5tlylya672N2DklSBqkhhTBks2TnYejZaljK+UjtVBKXQFVNUPKmPIvNewTB7IiKtgexc4Bx9JhNlM902v/AVn6IbfpjiGreCeRIQTM6yTOQLITXDVQxDDh//w2H/1wuzbuTg8cTAlcdiq4B4SMTc1hRcxxZQj7fQc6xyP+wmjVorS12E8it/MJ4gjoAQ9zRsL99bBJe1RVwBfDSXNPD2T+q5SBvaNtnI8ZxyI3qa+hMeCaJ2iip9Eq76Y7OMXEYfVHqPBgiJwJo88rHYLWpZJZB+5QyWxuDNUeruyoOfgw6lkplke7QwoEW6CSi5Ygn3I4waqHHWCLAxqadcgL6Pn+qsYcWafUmkMxN18P06E/o+1YqW7f6adletJX/oS0t5lNNDEN4Cp1QHjvRo6EFTS5m/xLbQNKVqla62EXqbD2fk07wcR+cisJXmQltjpzF1LCuW+1Ss27VWh/hWaWH0qgB3QQzAnmqo9S7bACpykVv7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4720.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(4326008)(508600001)(316002)(6636002)(966005)(6506007)(186003)(110136005)(83380400001)(8676002)(66476007)(2906002)(36756003)(66946007)(6486002)(66556008)(5660300002)(6512007)(31686004)(2616005)(26005)(45080400002)(6666004)(53546011)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk15bmV2alVvNk0yaERwZE9tSTkydmNLemZzVTNsWDdTa2E3K05zVDMyaVRz?=
 =?utf-8?B?bnNLU3lOS3BBaE1XSW9mTldjd3BJN1NXNHZUWTNJY01xV0JBRFdFVWw1SWdw?=
 =?utf-8?B?enpxa0NncTdDRjQzbmd0cnZLUGJoNlVLWjZxblVrQ2hhR2owZm8vdGZMZjhw?=
 =?utf-8?B?SDk0REt2VXhCTmhwcmh6ZGEwZ3M0SjU0dE5sSVdJZlczZHlDdGU3eUtXa0tY?=
 =?utf-8?B?SytHdytNMTBvRitXTnNNdTNDSTQ3YWY1emd0MW5BMGUycE9lUEttYXk1WWNP?=
 =?utf-8?B?ODVMY1lpSExHbk1tMjU1dE8yYW9JWmhubnlRS1h4N3g0Q0xGZ0d2d2Y5Y2V2?=
 =?utf-8?B?NWg0Q2dZZDlVSXliamFpMmRjNEsybnFMSmExcUpBRXFnS1dXbVpLTCtteUZy?=
 =?utf-8?B?WS9IemJUZGtPMGUwSkVmcURFOW9xd2VpaEN1UFBqd1BCaTVmeXBDWEhsWWlK?=
 =?utf-8?B?SE91ZHZnOTRSRkhIU2ZxZWVEWG9qTnc0UUxmNXNkeWNINXlWYzQ2M0wxenFn?=
 =?utf-8?B?U05jOUc1dVRZcXduaWhSMWJPL2pyL0VrTlhFRTBDZ0RDaUEwTk1WL0oreDA4?=
 =?utf-8?B?QkJFM3prRElqZVVtbHA5UHZnR2VuMUVyTUFkR08ySzhDcy9YYWN6b1lEKzUz?=
 =?utf-8?B?L3VtaE9pSEJKQjBqaUxwT1lwOWg0VERIK3JPajVlZmU0RFplUWNlVHIzYng4?=
 =?utf-8?B?VlBZTmQwb1hzcVYxQzdFSGxXZVNaUTFVZUVNZEptR3cwSTN4MHFBQy9aeU5u?=
 =?utf-8?B?a0RrbmsyUWRlLzZRd09PVnNxcjM1NFVpU1RkRUNnc3VMS0U4YVpFTHluY3dB?=
 =?utf-8?B?NlRta1hZSFB5THlveDFwajlBSC82bUs2dkxhaFJFTVlrb3F5MGY4RlpGV1RQ?=
 =?utf-8?B?L3QvUm5ndWtqK1NHVitOU1BOUWdYeS9KQUlxRHJ3dnlhZmZhb01uaXZKdmNX?=
 =?utf-8?B?c1VBNGZJekU2K3NpNU1hdVZNekZ2STNqWWZxS0xqS2paRzhnVWxSTTBsZXdI?=
 =?utf-8?B?eDZvZk9rVmw2Tnk2Sk1ONUNNbmRTZFZXM2J0Rml6NFQzUEpXNC84Y3JhM0Nm?=
 =?utf-8?B?UUdhaGtzemtWem1Ob09uNVdIOFpXQmhCaWNpRmZwY01CVHpuWXFEYWRaRFRT?=
 =?utf-8?B?ZzZMNU1CaThHTUdyRmIvOURLVzhnRjFlMERUVHZaMTQ2OG03NG9GTm9VelMy?=
 =?utf-8?B?T1dXZDMvOUsrbzVCV3NKVHBMR1VQMytRcjB2eG5oVm5IR1hGMkVpYk0wbG5K?=
 =?utf-8?B?OUROUmhpbklTNFk2S3g4WFJiSm5heTRqakpVMzJ3anVkV25VaVJwM1FoYUZB?=
 =?utf-8?B?M2JFRXFuV3M5ZEFkWkJvY1VmWG5nbUJyTUxGMG05dlhjNnpPQkZQWkxVOTNN?=
 =?utf-8?B?T2pQYXdUSHBaTzBrWnRkNmRwS2dhbGtPcDNqMFZIazNZdDZjazdZNXNDOFZa?=
 =?utf-8?B?Zkwxb0dhaHpHdGM4U3Y4SzlZazl4ZlZpZS9Td1d1VDYxZXlYMUVYTFZqVWR3?=
 =?utf-8?B?SWhadE4zMEpBbDZUaHAyK25KZVpqTWEydm0zNG8yQnh2QkQyWHdFTVlTYUs1?=
 =?utf-8?B?K2oycHBFRDlTSzB1TWlsVDJ3aE9KdlpMUU5NRS9teXdoanpRKy82b0tVbk1q?=
 =?utf-8?B?d1FJc0JrbkYwV21WV0pwZ1JlR3ZsaFBqem44RmhiSDVpb2pYRDAzT0VtMTUz?=
 =?utf-8?B?dUFubGJ4RU5rdHVKS1cwTUVUcHdyZFRGbElZK3k2amZvc1JnYXJjdHBEZzdY?=
 =?utf-8?B?VkpZaUFzN3I3cWptblZMMG13YVo1bTZwL1UyZ3hPektmYUFFMGxESDdxN3BC?=
 =?utf-8?B?c1ZTcDlwSkxWMkFhU29MMGpuYlV4UEFqZ2hUME1QbTc0R21xV1AxbVRkaVJU?=
 =?utf-8?B?bitHMmRyMmxhWnJGN29ZNEFlWVdBVUU1L1lmbDdZdGc4KzFLcFR5dTZLMjRp?=
 =?utf-8?B?bnc3OGJsSlNLRlpyQ2xMaVpqQnVxNkU0ZC9KTlpBMzBMUXBvcFl4OC91dHpn?=
 =?utf-8?B?QzFDRDNHOTN4eUVwS1BEVzJMSzUwUG9NNkJDYlB5azNKSVhqajhtUkNtY0lt?=
 =?utf-8?B?WW5rSSt0bHVPTW02T1RNSzhYTW81RW9LcDdFZExTWnhrQ3NWVHhsdnpxVzUw?=
 =?utf-8?B?b1ZHdzdqa1FWa3hFdStwMmxSZ1dXSHZuZnBhRE9WRnlmWU1iTjY2OEdsMG5r?=
 =?utf-8?Q?zl55so08L/WFRkPt1eLAA8M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f36c13-bf37-43b5-dc98-08d9f0a81336
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:24:51.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjndKbTlFphNiHDepe+owFXSrQXIJmhawjNPO09RUSxS0jvMOE7BiLWRX+6Qzf0crvvFNaiv0VaPtgP9yB9HDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1655
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/14/22 11:21, Song Liu wrote:
> On Mon, Feb 14, 2022 at 7:32 AM Chatradhi, Naveen Krishna
> <nchatrad@amd.com> wrote:
>>
>> Hi Song,
>>
>> On 2/11/2022 3:10 AM, Song Liu wrote:
> [...]
>>
>> HSMP mailbox messages are evolving and each platform defines a supported
>> list of messages.
>>
>> On a given platform these messages are described in the PPR.
>>
>> Eg: Milan PPR has "7 Host System Management Port (HSMP)", is made public
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=04%7C01%7CNathan.Fontenot%40amd.com%7C6026990f93ed41d04d0608d9efde79a1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637804561503265585%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=o5BR%2FgHpjnNVa9zVu75I3RyzO8WNB4L7FMEvLNbzZVY%3D&amp;reserved=0
>>
>>
>> Bringing detailed description of these messages from PPR into the kernel
>> would be a
>>
>> duplicating effort. Which will also bring in challenges such as
>> maintaining the details
>>
>> for every supported platform and submitting kernel patches for every
>> platform.
>>
>>
>> We would like to avoid bringing more details of these messages to the
>> kernel documentation.
>>
>> Such a structure can be described as part of esmi_oob_library to ease
>> user space tool development.
> 
> I agree there is  extra effort to adding extra logic and documentations to
> the kernel. How about we ship current version with a few minor changes:
> 1). msg_desc_table is in the header, so please prefix it with hsmp_
> 2) as Nathan suggested, add more comments to msg_desc_table. Maybe
> something like:
> /*
>  * HSMP_GET_FCLK_MCLK,
>  * output arg0 = fclk (MHz); arg1 = mclk (MHz)
>  */

Agreed, this is the type of update I was thinking of.

-Nathan

> {0, 2, GET},
> 
> Besides these, I have a question. Per the hardware design, args and
> reponse in hsmp_message share the same registers. Shall we make
> them in/out argments in hsmp_message and save 256 bytes per
> hsmp_message?
> 
> Thanks,
> Song
