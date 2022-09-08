Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E44C38145
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Sep 2022 10:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbiIHKO5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Sep 2022 06:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiIHKO4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Sep 2022 06:14:56 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693D218B18
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Sep 2022 03:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDEQU4nf4LHjdMpPEKZ9dIWnn3fNCprey52Q1Jcni5h6zRnPH0z2bYjR1OYfWN9vl+wS6vmE140HgYfzYOQHKkL2H/L5tKM4mDqbLxNCSgle2StVwwTm8cFua9sW9/m72CvAwMoONTajUEZAncxSJvUJCi+iKmLA2RcvVIblmUsqkMAuo+IPavGZYOwEl0yKeMSNgpCbF6O8XthlJ2x4OeWHKbuLqoEKXY7pTPhPojK7Jzccd3uFXjfR8GP+V7An7kDDg7gLzlZlIpmf1xGyIh9De77HHLE+blPRkJXe8yxOT79oC5ipJ3+Tvf0N0Wx66hF0OeU+8bK/Tc981oC+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnUj7WkgsZVoXlotZ5Qdk3a9jcSUP0g8SLIV8ODwcXY=;
 b=JMSJ9zjh51A/jQIq6n1oaLVa3Sk/S1vs0p/qhTg9mSG2FPLD7RF0UUBqYk40BTzTqqG4946nb8bBOaQshVG8v6jpKfG3WvNpIo28KEuSTz+kJlRu3QPE6JqY8WIQKukgQT4ghhUusfyGO7ZibwaBdUWsbkQ6Ipg19r8S5KPiFEmjyEmNJAKpboAOkeZK5iaNndmDzlOoYwczGjeE6VVkQuP9EKzVSPJR4e8+THtEkzBtRJ509W94FDawXbezIe3cJOzbsganeubT5GEO0Zemne8mhDZCcsE1t750Ph7mGvIsBhu/MSWe6nh3+xwuhvrtp01bJpg/ZQckp+1x9fWqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnUj7WkgsZVoXlotZ5Qdk3a9jcSUP0g8SLIV8ODwcXY=;
 b=O6/7Bk/PQaS/GUhhKRvqt6oHUPcuNwtfR2RxRV9guWRBWDkyGoDgj6IQ1TTn8fJ+pBEgsx9I5HKqitqyaWAghG4WlfaB1EcsVTJeAfZauuBNGMZ+UlG11IiRkYCXvcqno1N/XOFXU3AOj1r0FQUSQBLnL9hOkldLld2LhPJG9Tk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB5003.namprd12.prod.outlook.com (2603:10b6:610:68::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 8 Sep
 2022 10:14:53 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::a145:69df:f280:f813]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::a145:69df:f280:f813%9]) with mapi id 15.20.5588.023; Thu, 8 Sep 2022
 10:14:53 +0000
Message-ID: <7b5178e4-e03f-8c6f-5682-7e59d8aae415@amd.com>
Date:   Thu, 8 Sep 2022 15:44:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD
 PMF
To:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <bnocera@redhat.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
 <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
 <CAKEBQoiuDA1DM4Y_EMRNpRmisCc6KAa2akwxSpbKDrDDnrB71Q@mail.gmail.com>
 <a5ac5eb7-6a8e-aafd-10ca-b3049a7a74f4@amd.com>
 <CAKEBQohHJcxgRr4rMcdDMyi1cgBebcbeVcQu7qfAPuNK5E4t=Q@mail.gmail.com>
 <b29956c0-6b72-a8a4-ccca-0bad7b07c041@redhat.com>
 <CAKEBQojBveLyF7fe=Bv6WAwog6cwtWsyCdwqC5mpqnL4w1aB8A@mail.gmail.com>
 <f7c02f07-f8f1-6fa8-4e88-0b4c651e4795@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <f7c02f07-f8f1-6fa8-4e88-0b4c651e4795@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fa39e7a-17e2-44d2-9e0d-08da9182f890
X-MS-TrafficTypeDiagnostic: CH2PR12MB5003:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0mnL3n02TF4ym3Ytq+3jbUoQqdpHF2eedHsMS8eojAp1bQSLUe4T02ELqT7UbWzc+R6JJithMZfWOGC+Gh5b6lxEG0rJ2lRS8mC1MSiEYhMqslagFMLqik20HVky6g1Ik8rOdLxAcAbPtzjgoMq1F473VSgif4ZD5Oeym5G/6mnMvyfCeP6H0SWzz2D96GMmBAnRJt3cuwTl8oSei8CTtc6ITHznIBwoJedMosAGq/NNGqYt3qD5G7YtaE+BpkM6eHsmD8Nm5LprDfKBDqWLwcoDb6bBkmnn18jwZpmUn9imoV1BK4pqkt4+5G64AljyMugn/vDr2ABA9Jn2nDqQrtuKPLQdTyVm+Zq1kEos8XOGMGSpz4h8ws720iGCsGvkqGV+mdKRHYH2TnIDxtdvLqqufdA8jlmzY1EcAEf14F/sIdaB1H6ZXvYR4Sm4YesJh4rJG5rT/pAodzKpgmGS1tVFz3zEU34wbozo+h6RcOrhaYCjpdSamvtbkfAVKRxYMBRjX8uydCJ3JGLfUi1cSBrbJlpHC5DSRA4gfHTDXZI2Z4xCyTyTrTMgVYguXg0/t8dck2Q4NHKuTJJaDW8UTXlLXYX3LL4J1Sm8l379UbYqMjJTP0edzUShfvKwV8658WbccaZ/XGnVFvte0BZrWCoIrn5Pc3IGR2SXuXgNH3qDVUf2I76MYHhtsYqW3T/9bQBhXrYh/xm48pxNF56i4iEwaFPxqHW7kc2GWlSuTg6jiKsBE+0Vp6s2l6bPwNtVEK6jJH6l5v+1tNorQNosUwi9TokRrBzdjmHZ29ZrePg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(66946007)(2906002)(6512007)(110136005)(66556008)(6506007)(41300700001)(6666004)(4326008)(316002)(53546011)(186003)(66476007)(6486002)(478600001)(2616005)(5660300002)(86362001)(36756003)(8676002)(38100700002)(31686004)(8936002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEpFTHIxdGp1ZURGVXJyenBFeVU5amVRS1EzWDJPOTA0WmF3UFQ0SDR5R0xp?=
 =?utf-8?B?OFNjdUJ0dDBCNHpoajdsWUdnUmgrcEpyMDBGRXF3THdmbFNSQ0dVMzlYM2RH?=
 =?utf-8?B?eTAzN1A2R3dBU1VZMFp0dis1WHNjdXFLWG9ZeWJmbGJ1V0V3M2p0SmpRcTNF?=
 =?utf-8?B?WW45ZzgxSDhJcFlqMWZzQVVObDhmcVdoaHRyWFlPam9lRFBtWlJOaDFCT2lj?=
 =?utf-8?B?eUhUVTJDWlRHNzlpeXJ2UXJteXBORzIzMWV5Q01HNXY1SER4V0tzSkxDd0Ir?=
 =?utf-8?B?bjg4ZUJnRGZ4a3dVQ01Cb0ljc1ZjbVR3YUNUVWFTQWtjODZDRTNSdlFsZ2pK?=
 =?utf-8?B?ZVQyQjBZVm5iOVkrTkcwY1MrSmpEdXA5Mzl5a0d5cDRMVnBMMmw4aStwSDUr?=
 =?utf-8?B?VGE4OExSeFdseXgzUmlUTTRGc0FHZzUyY1g1Vkw3ZUFiRlZiejIxU2ZWRTk4?=
 =?utf-8?B?czdCbUk1ZmsxeEhPQmROOFhZamIwaVgzOWdVclJmNFIwcklqVWFIWWFiSmZ2?=
 =?utf-8?B?NTdUUDdKc1VhSjA4a3lFOWVtclp4SFUvTEJHVGwzNFJLYkcydFJFNnhrVWJr?=
 =?utf-8?B?eVRqM2FJWXYyUmpYaHlEUkVhb1VwTUxjeGFRSGpnVUpSTHZqZTg1QnBIQ1Y0?=
 =?utf-8?B?Ym9JWERlN245WXNPWGxVMFdWS0JCZmNlZkdvZUNnNHZWdjJLbjNzaDlxeE96?=
 =?utf-8?B?ZzhqUEd3UU1LbWpPRC93d2l4VUVuTE1iaVhTL3haa05MQ1ZWZzlBLzBpSHpP?=
 =?utf-8?B?SytsTmhrdUIzSXpacHlEeWM0dVAyNGg5eTMvaVhHL3daWGlqSzB5NnMxN0lI?=
 =?utf-8?B?WHpzTmhjUjliM2dwNHBpbGppNUJ2VW91WnFzZHVCZGNQQzd1UjNnZEkvdm9H?=
 =?utf-8?B?ZE0ra2VkUWk1b0NIakEwb29lVkJKQ09CaUxETDdtMy94UitpT2hpUHI0RjFH?=
 =?utf-8?B?WU02UFF0R01BZGVKWmdVNGFkbnZOazZnSDF2am4vRCsxQWg2Wk5wM2RkdDNK?=
 =?utf-8?B?N3Q4c0FxaEhpMUQrQnlFWjFabzBIL1NZNFc0VXhDSzU5N2QxamVtcDlkTmox?=
 =?utf-8?B?TmJFWWZnK0xxbms2UjNnZnVTYkNzNDhDOEYyQ01oaE9XaXY5N0VxRG1odFV2?=
 =?utf-8?B?anNleXVKeEhPVkl5SXRJaXZKMW9vUjVPK0RPSlB2NXFyZkdvak55VkpIdW1n?=
 =?utf-8?B?Q2VrNkVib2M3b2l3bmQ3UFZuekZNWm1VajFySitENE1USWFIY1ljc0lGVHlp?=
 =?utf-8?B?WUNXS0NIaFRuT2NEaFZPL0M3UzNpYWs5S3h5MEtXdjh1MWpSOG1mMWcvK0lj?=
 =?utf-8?B?c29mZVl1S0Zzb2RyZW52MkJhcVBRbjY3dXNncEdDYzNoTCtrMjhCL2UzNVRC?=
 =?utf-8?B?ZU00bTRlWlAxNDlpTys2Vlg4RSs1NEN1YndDUy9Qbml4emRNSFdJUEVSMFhs?=
 =?utf-8?B?a0xIcVliTERsOUNYWWRYWEhkbUgzRWYyL3R6dWpxT20xU3VpYjIxU0VMRi9S?=
 =?utf-8?B?NWV0SjZLYi9qdFBISmFYN1ZqVXdxQ0dhd3JCM0JUcys5bkVQU3J1eFF2VzlW?=
 =?utf-8?B?NmNldmx5SmZ0b1IwWHQydnErZ0M5a2Y3YmRnTnlxcjRqQnZ0NTUrNEg0TTBx?=
 =?utf-8?B?ZXZleThnVVJXOGpMS3BTVDE3MzhvaXQ5T3lMb3FaVS9zVitVbjc5VmJvOWdG?=
 =?utf-8?B?MlhGa3M3eUNEbExZRkdobklwenJKWGozNVhHT2ZLay9CeURoUWdZL1FVbzM3?=
 =?utf-8?B?QjZDNzNOY1RGRjBsd1pOcVNmai9qOC9oSHIySHNHVXJhQmZ5eGJGbk4zMysx?=
 =?utf-8?B?V1VtTGI2bzNQYzBVUkpVdk1PVFoyTzFhTkRsWDQ3WHZXMVFZVUZsaW5rbUgz?=
 =?utf-8?B?anpITGVBTTlLdm4xWTloV0dEUjRlTGZVZGplTlo0bzJ4cHdiT1hSazhReWd0?=
 =?utf-8?B?TUNacEhPa1RWWHo1MEFBbHVQQXlyV1hMaTJKSmpGaGN5eXE1dmQwUFUraEVi?=
 =?utf-8?B?TEQyV29IQThtZ0hwTWcrMCtMeENQcDIvNXBFbEdla3N5U0VscE9yV1g4WFhV?=
 =?utf-8?B?MExHMEd5b3dsN21NWEhLZFlSSnZCc29oYlZJMFNUaG42L3BaTk54dVM3RWNm?=
 =?utf-8?B?WUtNYnlxL1kxTGNVNUhwM1JqSDExczZRMERWSllFeGlEVHlTZ2RVQ1hkb1NW?=
 =?utf-8?Q?KgmaQP7okYEmCDm2nIiqRBxi2iEUInaE23Tyrg5IigtT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa39e7a-17e2-44d2-9e0d-08da9182f890
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 10:14:53.2099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6etMOrscqtUfP/ANOxQNG66uEJciagZmDTwAMK1ol4hNF5RcBxa+effuz6G7u49U1zS0Z2VITudOGGrvNXwoeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5003
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Bastien,

On 9/8/2022 2:38 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/7/22 17:35, Bastien Nocera wrote:
>> On Wed, 7 Sept 2022 at 16:35, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi Bastien,
>>>
>>> On 9/7/22 16:24, Bastien Nocera wrote:
>>>> Hey Shyam,
>>>>
>>>> I misunderstood that CnQF was a single setting, but it looks like it
>>>> has 4 different levels, right?
>>>> Unless there's a major malfunction, I don't think that offering to
>>>> switch between 2 different policies where the difference is how
>>>> "static" the performance boosts are is very useful, or comprehensible,
>>>> to end-users.
>>>>
>>>> If CnQF only has a single "on" setting, then this could replace the
>>>> balanced mode for what you call "static slider", so the end-user can
>>>> still make a choice and have agency on whether the system tries to
>>>> save power, or increase performance.
>>>>
>>>> If CnQF has multiple levels (Turbo, Performance, Balanced and Quiet,
>>>> right?), then I don't think it's useful to have a sysfs setting to
>>>> switch it at runtime, which only confuses user-space and the users.
>>>> BIOS setting and/or kernel command-line option are the way to go.
>>>>
>>>> Did I understand this correctly?
>>>
>>> Let me try clarify things:
>>>
>>> CnQF has 4 levels internally, between which it switches automatically
>>> based on the workload of the last 5 minutes.
>>
>> Oh, those profiles are internal only, OK. Do those automated levels
>> behave like the "static slider" ones, to the point of being
>> indistinguishable? So for example, does the static slider
>> "performance" behave like "CnQF" if the machine was heavily loaded
>> machine for 5 minutes?
> 
> This is more of a question for AMD to answer. But yes I believe that
> the CnQF internal performance mode which it boosts to if the machine
> is heavily loaded for 5 minutes is similar to the static slider
> performance setting.

Its a kind of "yes". But its still dependent on how the OEMs have tuned
the power profiling values and mapped it to the relavant CnQF modes.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
