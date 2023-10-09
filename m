Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42C8E95A8D
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 05:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345130AbjJIF56 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 01:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345049AbjJIF55 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 01:57:57 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E109E
        for <platform-driver-x86@vger.kernel.org>; Sun,  8 Oct 2023 22:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZhYo1qLb150oYqOkF4kVifh6H8dFdeUCv564MV1ZZhNMX8A2Kt6YsmcfNt+DSm8wV+tlceJ32X/5SCXbk2lgSqxFFt0GuvQ/lBikiQz696e3AeK+xZry1F7+4PUvO7EzJfdBVIl6kuKi/ko8FAQCLuq6BwiqRf4OIzZTlsj2qsZoRecXGoFWP4JMldTXiArga4VcpGtV0NnAdeFn8AxfL53N767gYwlbeink2jUb3M85RGqGFE/ifUg4KlswgLWp277KGazKG383+tP1EDOCu3t0QBgJG2D3KZXvLI6g9rxL2EvT0u/WGkyuyL+h7uRm0DnX9sA6/8Fh6bKW3lWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K++7Yf4QQjsg75yamkPAS+PRP5WIq+/TmQNK9QyYC/w=;
 b=gBfVwQPt4C/CCgAdOTLqc6hdwnFpajpyGnszIvX246xaneJRO9vhsgGRiH0jv97jLfDAKtk/thVDLZetPl150DadDgT0SjAkA3jAHODLQCE02I/3s714LfncLgI7nN8JCbgxIh6JK9u99WAGfEMEqQk9cSTZdZMBTRSl+WzUXDlFl6xLwTJXo481mJJ7xUa6OCYYGkbHWNF1RNEvjGEnljoWguWG90XDiJaAqVtA01obZ5tyAo896dLfB11fnJfPoyoEU5KZVDZXjmovQ9iWKT35sa6gGJvNHFgwZr+5n9pa9zR/if4cYUZiUaG7RwLdfDWFQEcZRoNSLeYvZpbnQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K++7Yf4QQjsg75yamkPAS+PRP5WIq+/TmQNK9QyYC/w=;
 b=fGuVEKO2zEZNjNiBoqQDGtm14nsCpteiBK6jRfR7g3kf+dm93oBOYjVeKdWrkprgyf6opXtnyJnpTLmk46rQJsPzJcx24DMfuZiMZMsDBqEwzu3F78FTweJ2tK/uE+EFrZQ02mDMKw2/SXNABV5Ib93zzepuCd32splteesrUvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY5PR12MB6300.namprd12.prod.outlook.com (2603:10b6:930:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 05:57:53 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 05:57:53 +0000
Message-ID: <9f45d82c-d501-4389-bb7b-691eea0947c1@amd.com>
Date:   Mon, 9 Oct 2023 11:27:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
 <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com>
 <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com>
 <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com>
 <5c6625ba-c2f0-6510-c1ea-3005a9c16e14@redhat.com>
 <844d0ef1-a09c-4c8a-aa14-d3487e3289f9@amd.com>
 <47babe3e-052f-d816-9789-5c8ae4728e78@redhat.com>
 <6d9a33d-3c92-3e24-3843-1084af1f516b@linux.intel.com>
 <5f8ce053-cc9e-e6b2-c2ba-f62df30cb3ab@redhat.com>
 <8215df42-6d3e-bd3f-d85-b17e462b2add@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <8215df42-6d3e-bd3f-d85-b17e462b2add@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::8) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY5PR12MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1a3815-0a19-435a-f999-08dbc88cad0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VsxKScd5SYBsmHdwhUY/wEOFQu1Z1G5T00sxLMhuijJegEAkPOcHg0Z+51uxRYXNtySLJXu9YMVOi0HGrXLwq7Np+b69qO+YRpO/MOqT3X21DFdhTPNIaTMfaUo2y1HK/++AbYR8FXODii+BaWPQzoKLPqVauam6odc/vuoXfYZjJoZiGlgwpFnwYpSQu4KLqJK0UNiTaeA/hTDuz/JPgFViFkuVxnwd4mvRyQRtSHv4CP29nI86AU9l2W3G8m3ICW6iZNeGxibGxX8TirhWg1xrQAGaf+FEXjq/7JzudAv75WOTGIMqspS1WBVzgJPwYVez1HXEqDsl59RooOk0QjwJ7rfI8MYwoL2Q08+j38HWhmPNSK6ubCcpzSToiWZZM8JJrp9uHYe468VkPnoKtCwO8/fWKpZFbqrcN51AzH5hV05ZiolZiv7wC0Lf+OgrXaw+A3Tr+0j/ThXo9aAAnM180XyRjmd6hbAtFjbYqCXIlYbAGvBARjoI5y/eG/FY5lmg1y0EY8ZrCs5RJcijsxlttYoj6mYXebbdbMVY6IsaO34xhZiJ5F4u1jiWZbw033nVogMyiRukMmVepJks8bhJgLgVCmhM32q0so+2c1Y/3iRlhEu9xuTlr8pbjJEWSKXgORZlARMywPDYkdtUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(66899024)(2616005)(26005)(53546011)(36756003)(31696002)(86362001)(38100700002)(8676002)(8936002)(4326008)(2906002)(6506007)(478600001)(66574015)(6512007)(41300700001)(6486002)(316002)(5660300002)(66556008)(66946007)(66476007)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1dmeENxaUlyZS82dU9GZmZxeXBLRUZlQ3ZFNDYwWlE3OGlNQ2dkWWZkV2tN?=
 =?utf-8?B?QlZ0SXR2YWh1ektGR0ZyTE1KdFJLQkJHYWtaM2pyQVU0REhKM2M0ZGV0NTgy?=
 =?utf-8?B?Q2g3OFZmUjBDMVhhRVBERnR6dFZDL1hhVEczNjJhbzJtczlYSk1odFZyUmlH?=
 =?utf-8?B?VU0yVkVueUx0VFcwWjQ2aVJzRVdZakszVW02MzFTc2ZtandhR09oV3RnYjB0?=
 =?utf-8?B?WVJqUlhjS2R0K1I2VVZqSXc2N1E4YVRrZVRUaWJJZ1pzTHFXVmM5SDNhYnJO?=
 =?utf-8?B?eFlJN0t6a2s3Y3BrbmR1TkNnTzN3bWRITG1kYkRmYkVPYm5FWjcrYUN5bCtp?=
 =?utf-8?B?WUpNSTY3QU9MYTlRNmJUQlcvZ3pWNk0wK29GWTAzOEpaN1JpYm4zWGdjV1gv?=
 =?utf-8?B?RGdGL0d0OFdGT2pTOW9kVk1TTitQanMyc3JyT3o0WWVrUE82WGVlSEJGR3hW?=
 =?utf-8?B?dmM0YUZvOXlOSmtTT3V3VFk2S0hCMUVwOSt2Wmh6QnRZZTk0QllxTXljeVZk?=
 =?utf-8?B?REQ4aUhlVUMrV0hQSlBCOGlhbEpJNWpEQlBSMzhUbGl0dVVWYi9vMWFYbmJR?=
 =?utf-8?B?WFh2Z2d0K0ZJd1JEZE5CK1RmUDY0cVAvQk1RVzIwWUNPbjRJa2EvdVByU3FY?=
 =?utf-8?B?R1FXWlZLWEtvQ2htM3ZuUWFBM2tOb0ZnOXlLWVN1amtiVy9TbjRwc2tYWjJo?=
 =?utf-8?B?M0s5RTJEdDJMN3pGT0JyQU9SbHQ5a3JLRkgzZXVkQ2gvUUpIUzI4TzBnNGdD?=
 =?utf-8?B?MTliUTFOSVd1RlJFREJQVEhuYUNUZUVlTjlJbzIwSXdaTTk3RzJHQURZK3pi?=
 =?utf-8?B?RjlNam9xL1JoSzY2SzZPa3lpSm11cExJMWlYLzl2ZGx4YllaN0cxeU91czVH?=
 =?utf-8?B?NkI3VFJQZ2hJZlhEZUpmUUE2N3FxbWpOR3I2dmFRZDZyM1ZFaW9rRnlObDdY?=
 =?utf-8?B?TU9DMnBmb09WVzJOd2tZSHlIZWpyRTVvRlU5NldoYXBiWHBya3ZlR1FKN0lv?=
 =?utf-8?B?YUtOUGlIc0oxMUc2K2hIUU0vem5Bck1lNXEzaHZUajNrZjJnZEY1a1VpWHFp?=
 =?utf-8?B?aThzandpbURKR2xiRFkwY0liREx5NUh1NmtNTnpmeDF3RlBiN1ZXRVFPSVgx?=
 =?utf-8?B?RUFzbVdiQURWMTk3Lzlob3MwOXJsNzQxUUkzcTl6bVdobXRub2dyeGFhc3hh?=
 =?utf-8?B?MXJldXFXclBHNXlmeXB2cEpzeDYzTEtYRWx6QXF5b3lwTzZrMXZvbk55YldW?=
 =?utf-8?B?MlhMWUU3aVhXd3B6VDBrQmxSNDNwODl3R3BESllwckgvOFI1ZVEzWDlzUWs2?=
 =?utf-8?B?U1AwNllZVkI3c0M2NnNRem11WDI5WFBNRk1yOTI1b1ZMSk9kaEN5dUNRTlV1?=
 =?utf-8?B?WHpObnNxcGQrTEhUSVJQbVRKeE5yc1draHpjUGFkenR0d1M2MS9HZ2NVQzhl?=
 =?utf-8?B?ZVpKMXZFYlMvaGxpOXhsMGZCRXJSN0NGK3MxME9zU2RuY0dRam9aQ2pKMnJu?=
 =?utf-8?B?N2hFb01UcVVUejZmaVliV0JmTGVUeTh5MnlQWCtFemVzMnBDaFpKLzhLSDZD?=
 =?utf-8?B?cXBibFNZUCtyZDJVSXZuVjN6UWxwdlc3QTd1V1ptRXlGS01uc3ZBeldEOTNk?=
 =?utf-8?B?Y3NKZzdKNjJHMlp3cEFiZTJIdHcreFp1K2xjNHlIMG1Va2VFNmgrU0k5TFNp?=
 =?utf-8?B?K1BnazZHNUJoMS8ydG80dkw4Zmd0SmRubkVkUkt6emRCNkJrKy9DaU1iSGZZ?=
 =?utf-8?B?eHlUQUZFbnJqSkdkSFBWaTliOXlWSldZZ0FZdzllbmRNcTBuRTRlTzIzT21x?=
 =?utf-8?B?Q0VYUks0cjRRM3h6dzI5Wm9pdlVKc2ZHYXhhU21xSkRKNytvU1lva1RZUkha?=
 =?utf-8?B?aGlsVUFPczJZWnJkY3czZ2Frc3dFWmU2ZW9kRmx5Z3l6cU1CY0dBTjNoZkc4?=
 =?utf-8?B?cEhvZE1xNmw1REd4aGZWaTdwZDBCTWpIeHhLL1luanYyQkdDNWdOa2NnMUxv?=
 =?utf-8?B?djVnTk1ieUkxdU1UZWkyaEZZTTl0UERaanBhWFhWSjFrdUR0bFFHdmM3emw1?=
 =?utf-8?B?am03am51aFRGWlhzNnBueHd6Nk1SbU56a1FoT29sZjdKVFhTSTZBYkRPcVpa?=
 =?utf-8?Q?KMyKw+g0T285CGSC6nmhuvDNS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1a3815-0a19-435a-f999-08dbc88cad0b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 05:57:53.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOSk3iHs0jIJnmtNd+s2XXY2CgCzTwEtqb3Z6P6IYGt0bBnUiWsCzK2ZbLJHtG5kffjLLSsmOGHmqwBJVVpHEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6300
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

On 10/6/2023 3:57 PM, Ilpo Järvinen wrote:
> On Thu, 5 Oct 2023, Hans de Goede wrote:
>> On 10/5/23 12:15, Ilpo Järvinen wrote:
>>> On Wed, 4 Oct 2023, Hans de Goede wrote:
>>>> On 10/4/23 14:11, Shyam Sundar S K wrote:
>>>>> Thank you for the detailed feedback. I will make these changes and see
>>>>> if that helps - will need some time do tests and come back on this.
>>>>>
>>>>> Meanwhile, is it OK for you to take changes in v4 1/2 atleast? So that
>>>>> I don't need to respin it again (assuming there are no remarks for 1/2).
>>>>
>>>> Note I have a new pdx86 co-maintainer Ilpo who is merging the patches
>>>> leading up to the 6.7 merge window (Ilpo and I plan to take turns for this).
>>>>
>>>> IMHO it will be easier for Ilpo to merge the whole series in one
>>>> go when it is ready.
>>>
>>> I can take single patches just as easily as the whole series as my tools 
>>> anyway explode the whole series into individual patches as an intermediate 
>>> step.
>>>
>>> I'll look into it tomorrow. There seemed to be one whitespace issue in the 
>>> debug print but I can deal with that myself while applying but other than 
>>> that, 1/2 seems fine to me.
> 
> I've now applied 1/2 into my local review-ilpo branch.
> 

This really helps, thank you.

Thanks,
Shyam
