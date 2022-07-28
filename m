Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353E4C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 13:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiG1NoH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 09:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiG1NoG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 09:44:06 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D496061B15
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 06:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhwQrS0OBk9G5pzzb2s03OIssIHhV7P6N7NlcaUmXchoS45yY96fLPVFY+MVcdSxbnxuougKAehlr9RVc9K9SzSDjsL2MWcKW2zM9YJbZXlPXJk6BTZR7I6cveZWKJBrUpChuHt8gXjwCS33LkqU/C9bca+XUPoUHbBmTWU7M6AcgidDB49WmGfxzDk1mz52DVjMk0oOo0uMLS6siP0wcSZJKRjdRgSyY/RfcaxsWkcy+XKi0xhYxm93rRnewBgxVQubYkuDHAKtwrYB45k+IyRGKR+j0i4ualsqdb/yBsTThiabm6NXqNwXfFGOo/rA3UvO/wzOB47W5ngtqXoaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itFKzkMs/1VF/L1q4eIaUHnY1ykS8ffYKLIodKJTJWk=;
 b=PJ4Te1eoEbm2z9+jlFOOcp+k1eMmfOkW40vQ0+fACaUdAg6C8L14JhZTjL1jB0AkOf27/eeEbddnBiNZ6vie2z69zVH5Qwu1GHAyaFEyM/Z0dBdsQVMCRNYlVl0yWPLaGpO+x+TYUCf530TYpa2HkiNU44urp0EZ/anMZsHlXhoRVP+5LaZERc3DqK43nphFb01kWqxJsTLsISl4t5uIIOb0YJmAqnSYO5soBhA1DLAZpH8J9iTJMMN8zoCAqOu58egp54MXfEDoK0novX2wq7ZvU3ZMHPYKE3UIOB2IGQEnK8hv5oAxWM1jBvQYNNoVS6VudjgEz1MeEaCtPGutPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itFKzkMs/1VF/L1q4eIaUHnY1ykS8ffYKLIodKJTJWk=;
 b=a4JEtAPwEUXHMnc7Pzrm1NIFJM5cklye8bvrmu4PYBZaEt+a7d0uW3vkTabdBVZG0KXVP4wbFOBxSKl+oDHLAKCnrQ4VsrJJQUMU3hRH2VPgzO2NBISyG7Z1oFV29gBEa0Rgl+rLP6BmyZzzWag6BYNagKabu1M9EvUAFkaB9bU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 13:44:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5438.023; Thu, 28 Jul 2022
 13:44:01 +0000
Message-ID: <5500e911-22eb-08b3-c3fe-2a63cf22d7b8@amd.com>
Date:   Thu, 28 Jul 2022 08:43:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mark Pearson <markpearson@lenovo.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
 <4585d2c6-6ac1-a697-d54a-f173e9821446@redhat.com>
 <d01e52cb-31c5-7d20-4f18-1e4bb70c1355@amd.com>
 <828a7b8e-2375-a9d0-7b00-d59e84cfaa2b@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <828a7b8e-2375-a9d0-7b00-d59e84cfaa2b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:610:119::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac08ff02-7c2b-41e0-8a9c-08da709f3a96
X-MS-TrafficTypeDiagnostic: SA0PR12MB4445:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cioDrNw/RYJTQ36JsLOMUr7da1UfidebZrDkCO+Kd2ays8oTcq9NFI2hiJ2v/qOaN4ql5xerwYeD82BOmDppIDBwMiWblU3hJf20s/mvuk9Wo1hDNvbdUIpsyGRXH2eYTzxTtv8RTGUpwjJjTcwPrFrKqqgfpUSu/01iWMkOwgawuOzVNWNNpNFpva2bv8A+1cY9/WbqO9kNur/AY91glAhD36HwUDVKrPM/jtCsgdqoFDsbEQFkT2ZvAizgVeK+BUkQasTjVLCvtW8mSnbvSaxPjqzESmaNR4r30a7uQ6qQVCXgmJPbKSA6+OA3tU9uh6PA7WEngJKMKofCsvqHsI36a9xE6iaYVnbz4XoyexT8GHexwqYW3ft7HloQJf5eyOMiBs3KTTnLFTtoUUG0cUKcHvYZ8isp8/2Yh1Tw3tiK/7KWcMYQ+syssZWe5pEggbhZj26QSx1UYe+QhOJ9PmKn0DWZl8i4Hm1DoH12YgyTAbHp1J4qT+G5tIO+mbdfzzHO5Ahmv1Y8+Qvs4GRaEUd67YFzXLdpq2HmmuTEan9rggjhCb2yPqr6/0Z3BEhWsax7NE53DMcbiJ/j46p2K6WA7YkIADh8XOxk3itsmpgI/S01uHrezcixEzKg534kXlhZIUF/FcFh6XzaDM2lgcLewn0c/UF0/QoC34yxc3QwjunDp/+zFMsWoWUZBaUAFYC83kOnZYKnuMlvUIpHJlGtC9NSlrJRUAKKENqclhG3CKly5aKMuCMd7SKQQ9VPoD+0aKT5cgi07hfFWIKWj8vqr1mK2x8dMsQrX5BAzlqbLu1KSNxTce7Vbl401kzuiWi3vEHMXPZRQ29kUL7kUwQpDL/Do8lhLSccCChGfgE5NfwaSOo1H2MowBavuN5Z4uDVMhuoYEr/pyCeCoRhL/CFBzCHjM5mlAENTnu5tn5lvqq5Ghdgt+YOFqcDf+24
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(2616005)(186003)(4326008)(8936002)(83380400001)(38100700002)(5660300002)(66556008)(66476007)(8676002)(66946007)(30864003)(2906002)(6512007)(41300700001)(966005)(6486002)(478600001)(316002)(6506007)(45080400002)(110136005)(26005)(53546011)(36756003)(86362001)(31686004)(31696002)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU5rRURXaWVSR3hnMlVFN3BoRTcrME1FNS9NVkVWdFN3empwckJhMlNNUDhD?=
 =?utf-8?B?Y1RCRUVYcHJZeW1JdmJseDZNRTRGOW5RWTFkZWovTk9NMmVjbG1Idnk2bk56?=
 =?utf-8?B?eWV6Q0s5YUhWejhxVzRieDRhTjMybCt4L2hKampidUt2dCszT0orbG5GQXNZ?=
 =?utf-8?B?RDdVRkgwVFR6elpTa1B2ZmFXNDFMdE5ETk40Y3J1NE1hU2JFbFhVR3BGblJq?=
 =?utf-8?B?THVGa2thOGJQaStlVmNkeS9xMHN6TXVOa1dVTGN6Vy9QVGZDZU52dzZKUUhG?=
 =?utf-8?B?elRCSzEyVHBJVWNSWU16VTlJQzZwTnAyUmFyQlBXdmpxNlU2SUVSS3lqR25w?=
 =?utf-8?B?RmMxZk1RNi85YS8zN2F5N1NTZXZ0YU9SLzdMb1lwTjVuMGdDdGJmdEpwRTJw?=
 =?utf-8?B?TE1FYkpWSm5qRjdoeVRvWXhLTmVTUmh2REcyc25PZkFYbGhFR2kyK05LYzhM?=
 =?utf-8?B?R20wak4wd3Q0bktKZlBOaENRMnM1OTVpTDNFL3hpL1pQQXV0SlVFaWtVNHkw?=
 =?utf-8?B?bWRVMzZyTmdHTXVsb1pSeWZFL0pvbFlGdzFBeEVLcXM3eG5SUEdtR093YUFh?=
 =?utf-8?B?NmExQ0dLZktWTDZ4OE90M0RHeHN1b3lrRjlUdXB3eXBZZFQ2ZnloRUo4aEVT?=
 =?utf-8?B?TjRvSk04QWMvMXJTYnJXTFdmZFFETFYwVmRDbkdJWDh3NzdzczZ1NDZXQnE3?=
 =?utf-8?B?dHpxamVHNlc2UytYUllrMHRFVU8xaVpLS2NxM3F4Ym5LRkdXS2pHWkcyN29L?=
 =?utf-8?B?bXdIZHJ0YWpnMDZ3emZNWGd2VUd1SkdFMUh6cEhoblQ0L1VYM2huRWVDQ0E3?=
 =?utf-8?B?NU5sVENOWVdaOFBJejZVRG9XN0ZydUdGNHVXM1ZGbzArYzZyb3ZMblhEUUdo?=
 =?utf-8?B?d0VKMTM3MjVUT0tYVVJrb1JQa3AzYjU1V3RWcGQyb3dDWXVScTFVRVI3My9p?=
 =?utf-8?B?NGtqemtxRjBHTVltT0loZFYxOE10Wkxuc2o1S0I2U3hia3VGSy8yZHAxZ0k1?=
 =?utf-8?B?Yk9GZ3E0aS90T3grN1JBdXFYVUw2U0NsT1BUczdJMUhBdmFNQm5GczhxeGVT?=
 =?utf-8?B?Rkt2UHRMNytPRDNlcFZCbXJuNnFINTczYnpxU3NtZVZDRkZRL2g2WElvc05p?=
 =?utf-8?B?NWxiR0pyUGFzYTM4b0J4dXZvcytsbCtKSGVoNHYrWkZRU0FTTHVwMmJKbFJU?=
 =?utf-8?B?dTFnN3JCaDZlL21tZU1KUkVTSGdMNjUxUnU3aFhQT1I5ZUx6dzNxUk5hRXFK?=
 =?utf-8?B?NnFiZlZGVXpSYkdYeWY2dWhIUitxVGlFZnNqZVBhaGVXN05NenV2R2VOVmpa?=
 =?utf-8?B?bjJRSEdYMUdrbXFTNWtJKy9wMXZYcHhnZnFaemdGSFFnNUh6VWlGdmppSW5Y?=
 =?utf-8?B?MFVIK090cjZnbmdkbmYwQ3FnZkMwdWJuTUNUK08xR2lSeTRRL2pHa3YzOFlr?=
 =?utf-8?B?Y1M5dFNuaGRGbGExRDV6dHFDVEE3VlEyU0p6NkNUMjBGbDJsRzRzaHdRZjYz?=
 =?utf-8?B?SFY2VTBDNFVmUlg3R2F0d2ZLMEpIdEl2VDR5a2tKN0I4RS9sS3d6QUczSWk3?=
 =?utf-8?B?Tlc0M2kyU3FCbERGazFxLy9SajlYeDlrWW5JdXptNldRRG1Ic2pLWVlDRWpX?=
 =?utf-8?B?NTFKaVcrdzRPZnBCVjVTMGpiYXp6SUpJZi95QWZPUllleEN1eGxYMmFXelpZ?=
 =?utf-8?B?UFcvVW5qT1YwT2Q5S2RsOSsrRDZyNk9TOExpcmFRM3JGdHlodXFkZnYyVGpC?=
 =?utf-8?B?Um9QZk54WXVKbEtWRzIrTHFHOWpNMS9pYXFRelAyUGw4d0o5dENpVDFoK2dm?=
 =?utf-8?B?NmQyY09Ia0RLNlB2UUIxWU9hN21lcEE0d1JDUStEaG45YVhGK29hRFdKSHhZ?=
 =?utf-8?B?U25jTkh1c01Cc2hYQzZzRUd5UXZEMjFKT2pOTUsycE1CME5SWVI1cEtrZ1pp?=
 =?utf-8?B?dDNSRUNkTlhNcUNCT044eEMxd1kvN3QxQkR5YTVnTUJqWjdQTmp2dFRjTnpT?=
 =?utf-8?B?U1NFcXVsZXJJZmczT2YweXFmYXVYZWovekVMT1I4bkgxSjZWVm9rZHd1VzJD?=
 =?utf-8?B?OFFZQ1NyMzdOSU83ajFyWUhQTnJFQ3ZTWk5JbDdDVm5Rcnd1djNJaThqdStJ?=
 =?utf-8?Q?Tb6VGwnzASmhBw+2zhgEBqjvG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac08ff02-7c2b-41e0-8a9c-08da709f3a96
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 13:44:01.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU/HHvefjv321bETFKVAE1xqNasl/8zaR++nLFxnnRfqw9bbTWLU9bdCR0h4QnsvV86Lhkz2LtRVsmk9p6eLdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/28/2022 08:03, Hans de Goede wrote:
> Hi,
> 
> On 7/28/22 01:52, Limonciello, Mario wrote:
>> On 7/27/2022 16:46, Hans de Goede wrote:
>>> <resend with Cc list fixed>
>>>
>>> Hi,
>>>
>>> On 7/12/22 16:58, Shyam Sundar S K wrote:
>>>> The transition to auto-mode happens when the PMF driver receives
>>>> AMT (Auto Mode transition) event. transition logic will reside in the
>>>> PMF driver but the events would come from other supported drivers[1].
>>>>
>>>> The thermal parameters would vary between when a performance "on-lap" mode
>>>> is detected and versus when not. The CQL event would get triggered from
>>>> other drivers, so that PMF driver would adjust the system thermal config
>>>> based on the ACPI inputs.
>>>>
>>>> OEMs can control whether or not to enable AMT or CQL via other supported
>>>> drivers[1] but the actual transition logic resides in the AMD PMF driver.
>>>> When an AMT event is received the automatic mode transition RAPL algorithm
>>>> will run. When a CQL event is received an performance "on-lap" mode will
>>>> be enabled and thermal parameters will be adjusted accordingly.
>>>>
>>>> [1]
>>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Fcommit%2F%3Fh%3Dreview-hans%26id%3D755b249250df1b612d982f3b702c831b26ecdf73&amp;data=05%7C01%7Cmario.limonciello%40amd.com%7Cf7d0a10b43444af391fa08da709993b3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637946102171795208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=GRSR4jEbQu7yaY6CS%2BKienSw7majkwcazo8xoKHd2pA%3D&amp;reserved=0
>>>>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>    drivers/platform/x86/amd/pmf/acpi.c      | 90 +++++++++++++++++++++++-
>>>>    drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++
>>>>    drivers/platform/x86/amd/pmf/cnqf.c      |  4 +-
>>>>    drivers/platform/x86/amd/pmf/core.c      | 18 ++++-
>>>>    drivers/platform/x86/amd/pmf/pmf.h       | 29 +++++++-
>>>>    5 files changed, 156 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>>> index e9f33e61659f..4bde86aeafa0 100644
>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>> @@ -12,6 +12,8 @@
>>>>    #include "pmf.h"
>>>>      #define APMF_METHOD "\\_SB_.PMF_.APMF"
>>>> +#define APMF_CQL_NOTIFICATION    2
>>>> +#define APMF_AMT_NOTIFICATION    3
>>>>      static unsigned long supported_func;
>>>>    @@ -55,6 +57,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>>>>    {
>>>>        func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>>>>        func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>>>> +    func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
>>>>        func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>>>>        func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>>>>        func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
>>>> @@ -292,6 +295,36 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
>>>>        return err;
>>>>    }
>>>>    +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req)
>>>> +{
>>>> +    union acpi_object *info;
>>>> +    size_t size;
>>>> +    int err = 0;
>>>> +
>>>> +    info = apmf_if_call(ampf_if, APMF_FUNC_SBIOS_REQUESTS, NULL);
>>>> +    if (!info)
>>>> +        return -EIO;
>>>> +
>>>> +    size = *(u16 *)info->buffer.pointer;
>>>> +
>>>> +    if (size < sizeof(union acpi_object)) {
>>>> +        pr_err("PMF: buffer too small %zu\n", size);
>>>> +        err = -EINVAL;
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    size = min(sizeof(*req), size);
>>>> +    memset(req, 0, sizeof(*req));
>>>> +    memcpy(req, info->buffer.pointer, size);
>>>> +
>>>> +    pr_debug("PMF: %s: pending_req:%d cql:%d amt:%d\n", __func__,
>>>> +         req->pending_req, req->cql_event, req->amt_event);
>>>> +
>>>> +out:
>>>> +    kfree(info);
>>>> +    return err;
>>>> +}
>>>> +
>>>>    static acpi_handle apmf_if_probe_handle(void)
>>>>    {
>>>>        acpi_handle handle = NULL;
>>>> @@ -312,18 +345,62 @@ static acpi_handle apmf_if_probe_handle(void)
>>>>        return handle;
>>>>    }
>>>>    +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>>> +{
>>>> +    struct amd_pmf_dev *pmf_dev = data;
>>>> +    struct apmf_if *apmf_if = pmf_dev->apmf_if;
>>>> +    int ret;
>>>> +
>>>> +    if (apmf_if->func.sbios_requests) {
>>>> +        struct apmf_sbios_req req;
>>>> +
>>>> +        ret = apmf_get_sbios_requests(apmf_if, &req);
>>>> +        if (ret) {
>>>> +            dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>>>> +            return;
>>>> +        }
>>>> +        if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>>>> +            pr_debug("PMF: AMT is supported and notifications %s\n",
>>>> +                 req.amt_event ? "Enabled" : "Disabled");
>>>> +            if (req.amt_event)
>>>> +                pmf_dev->is_amt_event = true;
>>>> +            else
>>>> +                pmf_dev->is_amt_event = !!req.amt_event;
>>>> +        }
>>>> +
>>>> +        if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>>>> +            pr_debug("PMF: CQL is supported and notifications %s\n",
>>>> +                 req.cql_event ? "Enabled" : "Disabled");
>>>> +            if (req.cql_event)
>>>> +                pmf_dev->is_cql_event = true;
>>>> +            else
>>>> +                pmf_dev->is_cql_event = !!req.cql_event;
>>>> +
>>>> +            /* update the target mode information */
>>>> +            amd_pmf_update_2_cql(pmf_dev);
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>>    void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>>>>    {
>>>> +    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>>> +
>>>>        if (pmf_dev->apmf_if->func.sbios_heartbeat)
>>>>            cancel_delayed_work_sync(&pmf_dev->heart_beat);
>>>> +
>>>> +    if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
>>>> +        acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>>>> +                       apmf_event_handler);
>>>>    }
>>>>      int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>>>    {
>>>> +    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>>>        struct apmf_notification_cfg *n;
>>>>        acpi_handle apmf_if_handle;
>>>>        struct apmf_if *apmf_if;
>>>> -    int ret;
>>>> +    int ret, status;
>>>>          apmf_if_handle = apmf_if_probe_handle();
>>>>        if (!apmf_if_handle)
>>>> @@ -360,6 +437,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>>>            schedule_delayed_work(&pmf_dev->heart_beat, 0);
>>>>        }
>>>>    +    /* Install the APMF Notify handler */
>>>> +    if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
>>>> +        status = acpi_install_notify_handler(ahandle,
>>>> +                             ACPI_ALL_NOTIFY,
>>>> +                             apmf_event_handler, pmf_dev);
>>>> +        if (ACPI_FAILURE(status)) {
>>>> +            dev_err(pmf_dev->dev, "failed to install notify handler\n");
>>>> +            return -ENODEV;
>>>> +        }
>>>> +    }
>>>> +
>>>>    out:
>>>>        return ret;
>>>>    }
>>>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>>>> index 954fde25e71e..a85ef4b95cdb 100644
>>>> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
>>>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>>>> @@ -111,6 +111,13 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>>>        bool update = false;
>>>>        int i, j;
>>>>    +    if (!dev->amt_running && dev->is_amt_event) {
>>>> +        dev_dbg(dev->dev, "setting AMT thermals\n");
>>>> +        amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>>>> +        dev->amt_running = true;
>>>> +        return;
>>>> +    }
>>>> +
>>>>        /* Get the average moving average computed by auto mode algorithm */
>>>>        avg_power = amd_pmf_get_moving_avg(socket_power);
>>>>    @@ -161,6 +168,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>>>        }
>>>>    }
>>>>    +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev)
>>>> +{
>>>> +    config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
>>>> +            dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
>>>> +    if ((config_store.current_mode == AUTO_PERFORMANCE ||
>>>> +         config_store.current_mode == AUTO_PERFORMANCE_ON_LAP) &&
>>>> +        config_store.current_mode !=
>>>> +        config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
>>>> +        config_store.current_mode =
>>>> +                config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
>>>> +        amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>>>> +    }
>>>> +    dev_dbg(dev->dev, "updated CQL thermals\n");
>>>> +}
>>>> +
>>>>    static void amd_pmf_get_power_threshold(void)
>>>>    {
>>>>        config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
>>>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
>>>> index 2b03ae1ad37f..eba8f0d79a62 100644
>>>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>>>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>>>> @@ -101,7 +101,7 @@ static const char *state_as_str(unsigned int state)
>>>>        }
>>>>    }
>>>>    -void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
>>>> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
>>>>    {
>>>>        struct cnqf_tran_params *tp;
>>>>        int src, i, j, index = 0;
>>>> @@ -117,7 +117,7 @@ void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_
>>>>        }
>>>>          for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
>>>> -        config_store.trans_param[src][i].timer += time_lapsed_ms;
>>>> +        config_store.trans_param[src][i].timer += time_elapsed_ms;
>>>>            config_store.trans_param[src][i].total_power += socket_power;
>>>>            config_store.trans_param[src][i].count++;
>>>>    diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>>> index 674ddf599135..2a3dacfb2005 100644
>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>> @@ -109,10 +109,15 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>>>        enum platform_profile_option current_profile;
>>>>        ktime_t time_elapsed_ms;
>>>>        int socket_power;
>>>> +    u8 mode;
>>>>          /* Get the current profile information */
>>>>        platform_profile_get(&current_profile);
>>>>    +    if (!dev->is_amt_event)
>>>> +        dev_dbg(dev->dev, "%s amt event: %s\n", __func__,
>>>> +            dev->is_amt_event ? "Enabled" : "Disabled");
>>>> +
>>>>        /* Transfer table contents */
>>>>        memset(&dev->m_table, 0, sizeof(dev->m_table));
>>>>        amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>>>> @@ -123,8 +128,17 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>>>        socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>>>>          if (current_profile == PLATFORM_PROFILE_BALANCED) {
>>>
>>> Hmm, I guess this is also why the platform_profile_get() is necessary ? Because
>>> on Thinkpads thinkpad_acpi is expected to be the platform_profile provider and
>>> then the PMF code wants to know the platform_profile setting from thinkpad_acpi ?
>>>
>>> Can you please explain the expected interactions between thinkpad_acpi and
>>> this code here a bit more ?
>>>
>>> Since we now only call amd_pmf_trans_automode() based on the AMT flag and
>>> that flag is controlled by the thinkpad BIOS/EC can we not expect that flag
>>> to be cleared when the profile is not balanced and can we thus not just drop
>>> the current_profile == PLATFORM_PROFILE_BALANCED check all together?
>>>
>>> It seems to me that if current_profile == PLATFORM_PROFILE_BALANCED
>>> then enable AMT, else disable it, logic belongs inside thinkpad_acpi
>>> and not here?
>>>
>>
>> It actually already lives in thinkpad_acpi.
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Ftree%2Fdrivers%2Fplatform%2Fx86%2Fthinkpad_acpi.c%3Fh%3Dreview-hans%23n10489&amp;data=05%7C01%7Cmario.limonciello%40amd.com%7Cf7d0a10b43444af391fa08da709993b3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637946102171795208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=cGxN8GG6LXnk%2FPDi%2BS1zNAkWRH4AiTKqF0eebcfcTRA%3D&amp;reserved=0
>>
>> By the control point from thinkpad_acpi BIOS events will be emitted controlling whether AMT is running in a given mode.
>>
>> So yes; there is no need for this here anymore.
> 
> Right. There still are some open questions / things which need fixing here though:
> 
> 1. If I understand things right, then on ThinkPads /sys/firmware/apci/platform_profile
>     will be registered by thinkpad_acpi. But in version 1 of this patchset nothing is
>     stopping the amd-pmf code from registering /sys/firmware/apci/platform_profile if
>     the amd-pmf module gets loaded first. So if the intend is for it to always be owned
>     by thinkpad_acpi then the amd-pmf code must check for this and not even try to
>     register its platform_profile support. We cannot rely on module ordering ensuring
>     that thinkpad_acpi registers first and then amd-pmf will get an -EBUSY error,
>     since there are no module load ordering guarantees.

This was my thought initially too while this was being developed, but 
actually there is some nuance here that is non-obvious.  The platform 
profile registering code in amd-pmf will examine bits set in the BIOS to 
decide whether or not to export platform profile support.  In Lenovo 
platforms that support thinkpad_acpi these bits are not set.  So 
platform profile support ONLY comes from thinkpad-acpi in those platforms.

> 
> 2. So when the thinkpad_acpi platform_profile is set to balanced, then it will
>     enable AMT and then the periodically run workqueue function from amd-pmf
>     will do its AMT thing. But what when the thinkpad_acpi platform_profile is
>     set to low-power or performance. Should the amd-pmf code then apply the static
>     slider settings for low-power/performance which it has read from the ACPI
>     tables?  Or will the ACPI/EC code on thinkpads take care of this themselves ?
> 

When thinkpad_acpi changes platform profile then a BIOS event goes 
through and amd-pmf receives that and will run based on the event.


> 3. If the answer to 2. is "Yes the amd-pmf code should apply the static-slider
>     settings" then we will still need patch 1/15 to allow the amd-pmd code to
>     read the platform-profile setting from the thinkpad_acpi platform-profile
>     provider;
>     And if the answer is "No, the thinkpad ACPI/EC will take care of this"
>     then we should probably make sure that the static slider code never runs
>     at all on thinkpads.

Yup, already handled.

> 
> Regards,
> 
> Hans
> 
> 
>    
> 
> 
> 
>>
>>> Regards,
>>>
>>> Hans
>>>
>>>> -        /* Apply the Auto Mode transition */
>>>> -        amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>>>> +        if (dev->is_amt_event) {
>>>> +            /* Apply the Auto Mode transition */
>>>> +            amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>>>> +        } else if (!dev->is_amt_event && dev->amt_running) {
>>>> +            pr_debug("resetting AMT thermals\n");
>>>> +            mode = amd_pmf_get_pprof_modes(dev);
>>>> +            amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
>>>> +            dev->amt_running = false;
>>>> +        }
>>>> +    } else {
>>>> +        dev->amt_running = false;
>>>>        }
>>>>          if (dev->cnqf_feat) {
>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>> index 0532f49e9613..9ae9812353cd 100644
>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>> @@ -17,6 +17,7 @@
>>>>    /* APMF Functions */
>>>>    #define APMF_FUNC_VERIFY_INTERFACE            0
>>>>    #define APMF_FUNC_GET_SYS_PARAMS            1
>>>> +#define APMF_FUNC_SBIOS_REQUESTS            2
>>>>    #define APMF_FUNC_SBIOS_HEARTBEAT            4
>>>>    #define APMF_FUNC_AUTO_MODE                    5
>>>>    #define APMF_FUNC_SET_FAN_IDX                7
>>>> @@ -51,6 +52,7 @@
>>>>    /* AMD PMF BIOS interfaces */
>>>>    struct apmf_if_functions {
>>>>        bool system_params;
>>>> +    bool sbios_requests;
>>>>        bool sbios_heartbeat;
>>>>        bool auto_mode_def;
>>>>        bool fan_table_idx;
>>>> @@ -84,6 +86,24 @@ struct apmf_system_params {
>>>>        u32 heartbeat_int;
>>>>    } __packed;
>>>>    +struct apmf_sbios_req {
>>>> +    u16 size;
>>>> +    u32 pending_req;
>>>> +    u8 rsd;
>>>> +    u8 cql_event;
>>>> +    u8 amt_event;
>>>> +    u32 fppt;
>>>> +    u32 sppt;
>>>> +    u32 fppt_apu_only;
>>>> +    u32 spl;
>>>> +    u32 stt_min_limit;
>>>> +    u8 skin_temp_apu;
>>>> +    u8 skin_temp_hs2;
>>>> +    u8 dps_enable;
>>>> +    u32 custom_policy_1;
>>>> +    u32 custom_policy_2;
>>>> +} __packed;
>>>> +
>>>>    struct apmf_fan_idx {
>>>>        u16 size;
>>>>        u8 fan_ctl_mode;
>>>> @@ -171,6 +191,9 @@ struct amd_pmf_dev {
>>>>    #endif /* CONFIG_DEBUG_FS */
>>>>        bool cnqf_feat;
>>>>        bool cnqf_running;
>>>> +    bool is_amt_event;
>>>> +    bool is_cql_event;
>>>> +    bool amt_running;
>>>>    };
>>>>      struct apmf_sps_prop_granular {
>>>> @@ -417,9 +440,11 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
>>>>    /* Auto Mode Layer */
>>>>    void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
>>>>    int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
>>>> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
>>>>    void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>>>>    void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>>>> -void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>>>> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
>>>> +void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>>>>      /* CnQF Layer */
>>>>    int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
>>>> @@ -427,6 +452,6 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
>>>>    void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
>>>>    void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>>>>    void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
>>>> -void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>>>> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>>>>      #endif /* PMF_H */
>>>
>>
> 

