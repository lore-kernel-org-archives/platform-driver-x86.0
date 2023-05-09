Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3E1C7EE22
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 14:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235776AbjEIOJQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 10:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbjEIOJP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 10:09:15 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4272D5E
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 07:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSvvY2wufOWqz5vM5Nr/b7XmllripPGdq/LFT5vmat2Hvk43/8hm3hJhpn9+QRc78OY3uadKBvRAvGzJaodTRj0zvEdl5rWK+wheQHqAqlXGD1L4TG4xeAeyA81YG74W6xni0wxgOS9Is9k4wjvL5Olp9be+Sv+qyKZpKT6xPAkLXhhrLhFNTnnkQX2f+7skqrcQ1dTZO/RUlL/w7VrIMl/whCPxLEBeY8XJTWMpOnN3QNSp2oBgoqIf2JhMbsVjMXbmnax/Que743AS4Flp2gxqm+XRpuimwJiPB06ZQRZOrQLzaIeUbLF7f1JsudnGgWqdSloNqpZA/FgUrYBXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heQVRUkTPFMnPuMd+BFQIT6KImlUb3YggxNb4rfrIFU=;
 b=OxpGca5jprwij1rPnba9IGAU4LLCF3ExgAATUVidni7H3Dl10kOvha0QYwbDEPsjF0tk5gFnSXuKf1tC2HKLrgxwhoEH8FRKNakjJA+KgkmUXQ3ChDlj9fX3n2STHDqr5s84dvYTkZGS5tXPmYUQgQFFPnxAALEjE4vu0GQY1kZqB7fLkSa1UMJwCij/GXVM2QD7H5vM5kOUnhWESgZewlxM+/NIzso1A0EnTixJg1U82Jijf8y4SRPj0wZoAYmXgoGhIZrTyZ3ceiAW8cLlx21JNI1YARXSSx8RdVhGkwiMZ3Y/HjtZkXlbZBXqDEkAcLLLglKp1deI9T7DI25daQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heQVRUkTPFMnPuMd+BFQIT6KImlUb3YggxNb4rfrIFU=;
 b=mUoWOYH1WmWRl188LXMxpvwCHfeKfFC0RyR/JuV3/CAZb54Sk8Lko3K7u0rPAl8D/HULeP2BeMwugw5B9ZGmIsZvGIMoEcjAyGtZi4icMH/d7uUAaUjC+rdbWbFlIedFv/yPXJn4cBO4+Fit9YTfd/wEczTQN7UrEtAencHRhWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7242.namprd12.prod.outlook.com (2603:10b6:930:59::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Tue, 9 May
 2023 14:09:09 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b%3]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 14:09:09 +0000
Message-ID: <bf871f57-7f97-32ba-36ba-3398bae77dc6@amd.com>
Date:   Tue, 9 May 2023 19:38:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: Add PMF acpi debug support
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com>
 <59264fbd-8137-579f-4e70-b3fff64a3931@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <59264fbd-8137-579f-4e70-b3fff64a3931@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9ee42d-b9e1-49f9-394c-08db5096f50b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHrtzeJCM871f9VHTgK8xeZRK5BGUvFpd5Ikd/Ol4tAVid1JIHQrhd6Cpaxfmli5YJRcc7Mjv8TmUYPFrErYzc7hZsY1FAYNCRpACTxMTBI26H+zI4TVWkIg/MBVc5V8QBmi2jWiB2sNKsGWiIif2MRWr55AIOrlCcrXPtraJ0W/fSJu0zABOjhYN590riFVNgW6FFFHAuZIrOVCplspE1FVyX3SWgClMd/ssSJ1xT/htWA3YhhtvYmEu8e6EhrP2NX6dkP+ccT9NyKo1NuhTSmeFVgwG4LtAocPQ1XUB9nh2t3orcIDesdAy1AObNRFMPhrS4Vu8kZErqVSjOjx5sit5QZ2o65RUrd0/73MxwFcJTTpd0H3mhIc90tqI6KI6bSAOu8wz5+7s64A3Ow2D2uWJDGPUXQr+5QXem51tLliHfBd74QckxhWzEsetGVdO2+sKV0I1CEaA1YbZBJcFX87ttbQj7CVLFuf7kTxbUs51+8CbqudPX2ySdXk/uY4rAl7fk4IAEmzhmaf8T5yGAksJWLlmza/hMmnM+1+JVUtKNMQZtXASbrYQuadjjpiKmOn+SgBzXFvb1sarM0qbLVSy1JqMFjv2vnwJDXBob2T354s3j56iV/Eu94RILhGKJgk5kdKAwJqOjuOyuaDhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(86362001)(5660300002)(41300700001)(8936002)(8676002)(2906002)(30864003)(31696002)(53546011)(26005)(6512007)(6506007)(186003)(6486002)(6666004)(478600001)(36756003)(66946007)(83380400001)(31686004)(66556008)(66476007)(316002)(4326008)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N25VVGlLMXF6bHpRbzFoMHowcDNPbTg5QmtnVW9GM28wc1FVSisxeUllUGFP?=
 =?utf-8?B?VFpPUFIzaHVJbFp1V2dhZUR5UWxkRzA1WHJyUzYrd1ZQVkFZUkNPcTV2Um1V?=
 =?utf-8?B?NjNIeCthV0Y1Q0ZYVWJYeGtQYy94Zyt3cWNEMEFwYUM0QUVkOC9UVVBVNXQ4?=
 =?utf-8?B?ZmRPUTl4S3ZzZnZnbjRhUFZkWk54QXJJNUtyejlKeVgwRFpXL3pjQzhSbkxy?=
 =?utf-8?B?ZE9xYkhKUXlIMVdZbFdxdXkvU1BEZjkvSFBmeHpqTmQ2SkY2Q0xUejJJbDho?=
 =?utf-8?B?OUZPYXFBcEZBWFhyUXkwdkRKZWRQUUdHWXFxSE43UWVVZ1ZvMVZvSkFydFRR?=
 =?utf-8?B?K3Y4S0NsVngzbUNVVElHM3l1TjRjTXBwYzRLcEI3YjNqam1QTTZqbVV4V3FP?=
 =?utf-8?B?YjRGUTdjcGV0VDNjZDJmYjNMNHdyeDBROUJKVTBEdm04bFU3TUlhRm5DT05u?=
 =?utf-8?B?M3pqZTJDM0MwQ1I0L0JTSDhRTGNXMVNlZFBkUXZmL2grYmcrT2ZFc3dwVGQz?=
 =?utf-8?B?RFhRenBDTXJSdll2MWlzQkNzRGZhTkEvazhXK0V4RU1mNjJSV2QvNjRIMGc2?=
 =?utf-8?B?RHRyNUhqSjlFUjFsNktiR0FicWVXLzRHdkJXc082Wmo3YkFLMHNLTXVEdlN6?=
 =?utf-8?B?eVNpYnhwYnZvUVRvRFdOVmRoa1BCQnRIa3BtVjN6Q1AxeGZuLysrYjh5WXZo?=
 =?utf-8?B?UjM3Sld5bndzWTFpLzB5VzRNRUI5SkwrUEpHd0NVRnZlVGtNMDlkbWI2WlVI?=
 =?utf-8?B?RUF0SnV2cmRtc1lLZU9TMmdsTHJCVUdaZ0Q1bzh1RjRXYUxFOXlwMXNUVEZp?=
 =?utf-8?B?Wi83WnVCUFNDOHN2dkRrVTFmZlZXM1NpQXFiRjVTUWgyUlFpUmtPQmJFbFgw?=
 =?utf-8?B?bSt0VW9FNk5WWGtTUXo0Ty84T0hTSXcwUk5NRG1RSlZJWjZnSFZkUGROaU1V?=
 =?utf-8?B?WVVUMjZWTE5VcHBSNjJYUUptVmNQY0R1anFYK0c0NzZFOFdhVG5EcDhpd3BB?=
 =?utf-8?B?UGtXV0pha0hMM0t4RXlHWmZIeEpEUzBzOUdHU2pHWkkrQVZxbHJaZmhiWEdY?=
 =?utf-8?B?WkxUQlNPSDRjaVJ1azYvalowN0xuZVJBbVBhRUdqdU1mVFBaODdzdEJFMThZ?=
 =?utf-8?B?UHlPNnhVL3dES1hlWVJIU0xMSjQwOFFmVDZnUHVBclZKZng0WUZZMUJmR1pu?=
 =?utf-8?B?WmFRNHc3NkQxNWk5cHVuYk1JMnk1ZlU0c29YME5RV3NIL2Z4RDEwTk0xZ3lh?=
 =?utf-8?B?dGd0TEFJYnN5UXNSQW9zWlRNSm5BRWt4eU1mVnhWUlZWU29DQ0NRSXh1VzUw?=
 =?utf-8?B?N3lTNzNPTStTdnZoNzJ2OWRPTE53cHNseE5CbDdQQVJXSk5DTnpER2k1Z3dh?=
 =?utf-8?B?eERDNUYwVzZkbkFPWkQ2Zkg0dzZNd3JSR3VsV0lFc3l1azdRR05jOTdJMFRI?=
 =?utf-8?B?M2ZLWUQybkkyMkhjcjFzOVBnMDZFQjhMRTg0dzF0cDQ0ZTVueWlmNkFDeVpS?=
 =?utf-8?B?cEFRU0NTaENXMlRoakNXUmR6b09iS3c0VEF4bTF4VFh6elNtOHR0UXdNYUtj?=
 =?utf-8?B?UFNDVkRpeVFRV1hqQjM5ZGU5MWhzRTVLb3FTanVOdjIyVklHUlRwdUtZVVZp?=
 =?utf-8?B?Z2lZZmo2R05DVXNQbGRpbEZpdVhjam9kaGJ5RWk5dTZhbTlTYVRabjZyQVR5?=
 =?utf-8?B?NlE2YjFBMkprcEdNeWtJRnAxVDVHUVI2cWpuTGsvMEdKenVWSGx6c2lRM3By?=
 =?utf-8?B?ZEo5emZzYUZQcXRMb1RnOHU1UmxMVlBzMWVjc0dLYnhiVC9tbzFVUmVHYlB6?=
 =?utf-8?B?TnZ5RzJwT0h3UWxrMXpkUEFRM1pVY0I0WEdlMlRMc1pkNkVuQ2JYcm5xamIy?=
 =?utf-8?B?Vm9PVjdXYi9vRDJKUitpbjVyemMyeHFMdUovMm9BRnQ3KytybDRoWjdPeGpy?=
 =?utf-8?B?TG4veXg5d0w0ZFNHaEVDc2M4SmtSMVBsMVVVWExidDlnZndOSWxiT1ZMclk5?=
 =?utf-8?B?aHZOS0RkQU5HNmhkV3VEak5meGJaU1FsUlFxQ0J6SnB0dlNXaXJZNklvU1RC?=
 =?utf-8?B?NGtNUi9jKzFhWnZLbDlzdjJXdklidVRLblllWkpQTFBnOUxXaXJJS2NJTXFv?=
 =?utf-8?Q?XLZ48PFrve11dzPWjLijzbHQX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9ee42d-b9e1-49f9-394c-08db5096f50b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:09:09.2624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf3IrqgzFFQZH7ARZOfv3oc2mALvmI6D62kJMU1MoTFaU03KGITe0uXKe3YJAT7tkLEe08cBl4XKswkvvJ4XQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7242
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans, Ilpo,

On 4/17/2023 3:01 PM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 4/12/23 12:52, Shyam Sundar S K wrote:
>> PMF driver maintains an internal config store for each PMF feature
>> after the feature init happens. Having a debug mechanism to triage
>> in-field issues w.r.t to mode switch not happening based on the OEM
>> fed values via the ACPI method to PMF driver is becoming the need of
>> the hour. Add support to get more ACPI debug spew guarded by a CONFIG.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Please prepare a new version of this series addressing
> Ilpo's review remarks.

Apologies for a very long delay in sending a new revision. I have sent a
new version now.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> ---
>> v2:
>>  - Based on review-hans branch
>>  - use a pointer and not create a local copy while dumping
>>  - use dummy #else blocks
>>
>>  drivers/platform/x86/amd/pmf/Kconfig     |  11 +++
>>  drivers/platform/x86/amd/pmf/auto-mode.c | 118 +++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/cnqf.c      |  61 +++++++++++-
>>  drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++++
>>  4 files changed, 243 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
>> index d87986adf91e..3064bc8ea167 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -16,3 +16,14 @@ config AMD_PMF
>>  
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called amd_pmf.
>> +
>> +config AMD_PMF_DEBUG
>> +	bool "PMF debug information"
>> +	depends on AMD_PMF
>> +	help
>> +	 Enabling this option would give more debug information on the OEM fed
>> +	 power setting values for each of the PMF feature. PMF driver gets this
>> +	 information after evaluating a ACPI method and the information is stored
>> +	 in the PMF config store.
>> +
>> +	 Say Y here to enable more debug logs and Say N here if you are not sure.
>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>> index 96a8e1832c05..557a962b48f9 100644
>> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>> @@ -15,6 +15,98 @@
>>  static struct auto_mode_mode_config config_store;
>>  static const char *state_as_str(unsigned int state);
>>  
>> +#ifdef CONFIG_AMD_PMF_DEBUG
>> +static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data)
>> +{
>> +	struct auto_mode_mode_settings *its_mode;
>> +
>> +	pr_debug("Auto Mode Data - BEGIN\n");
>> +
>> +	/* time constant */
>> +	pr_debug("balanced_to_perf: %u\n",
>> +		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant);
>> +	pr_debug("perf_to_balanced: %u\n",
>> +		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant);
>> +	pr_debug("quiet_to_balanced: %u\n",
>> +		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant);
>> +	pr_debug("balanced_to_quiet: %u\n",
>> +		 data->transition[AUTO_TRANSITION_TO_QUIET].time_constant);
>> +
>> +	/* power floor */
>> +	pr_debug("pfloor_perf: %u\n", data->mode_set[AUTO_PERFORMANCE].power_floor);
>> +	pr_debug("pfloor_balanced: %u\n", data->mode_set[AUTO_BALANCE].power_floor);
>> +	pr_debug("pfloor_quiet: %u\n", data->mode_set[AUTO_QUIET].power_floor);
>> +
>> +	/* Power delta for mode change */
>> +	pr_debug("pd_balanced_to_perf: %u\n",
>> +		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
>> +	pr_debug("pd_perf_to_balanced: %u\n",
>> +		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
>> +	pr_debug("pd_quiet_to_balanced: %u\n",
>> +		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
>> +	pr_debug("pd_balanced_to_quiet: %u\n",
>> +		 data->transition[AUTO_TRANSITION_TO_QUIET].power_delta);
>> +
>> +	/* skin temperature limits */
>> +	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
>> +	pr_debug("stt_apu_perf_on_lap: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
>> +	pr_debug("stt_hs2_perf_on_lap: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
>> +	pr_debug("stt_min_limit_perf_on_lap: %u\n", its_mode->power_control.stt_min);
>> +
>> +	its_mode = &data->mode_set[AUTO_PERFORMANCE];
>> +	pr_debug("stt_apu_perf: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
>> +	pr_debug("stt_hs2_perf: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
>> +	pr_debug("stt_min_limit_perf: %u\n", its_mode->power_control.stt_min);
>> +
>> +	its_mode = &data->mode_set[AUTO_BALANCE];
>> +	pr_debug("stt_apu_balanced: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
>> +	pr_debug("stt_hs2_balanced: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
>> +	pr_debug("stt_min_limit_balanced: %u\n", its_mode->power_control.stt_min);
>> +
>> +	its_mode = &data->mode_set[AUTO_QUIET];
>> +	pr_debug("stt_apu_quiet: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
>> +	pr_debug("stt_hs2_quiet: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
>> +	pr_debug("stt_min_limit_quiet: %u\n", its_mode->power_control.stt_min);
>> +
>> +	/* SPL based power limits */
>> +	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
>> +	pr_debug("fppt_perf_on_lap: %u\n", its_mode->power_control.fppt);
>> +	pr_debug("sppt_perf_on_lap: %u\n", its_mode->power_control.sppt);
>> +	pr_debug("spl_perf_on_lap: %u\n", its_mode->power_control.spl);
>> +	pr_debug("sppt_apu_only_perf_on_lap: %u\n", its_mode->power_control.sppt_apu_only);
>> +
>> +	its_mode = &data->mode_set[AUTO_PERFORMANCE];
>> +	pr_debug("fppt_perf: %u\n", its_mode->power_control.fppt);
>> +	pr_debug("sppt_perf: %u\n", its_mode->power_control.sppt);
>> +	pr_debug("spl_perf: %u\n", its_mode->power_control.spl);
>> +	pr_debug("sppt_apu_only_perf: %u\n", its_mode->power_control.sppt_apu_only);
>> +
>> +	its_mode = &data->mode_set[AUTO_BALANCE];
>> +	pr_debug("fppt_balanced: %u\n", its_mode->power_control.fppt);
>> +	pr_debug("sppt_balanced: %u\n", its_mode->power_control.sppt);
>> +	pr_debug("spl_balanced: %u\n", its_mode->power_control.spl);
>> +	pr_debug("sppt_apu_only_balanced: %u\n", its_mode->power_control.sppt_apu_only);
>> +
>> +	its_mode = &data->mode_set[AUTO_QUIET];
>> +	pr_debug("fppt_quiet: %u\n", its_mode->power_control.fppt);
>> +	pr_debug("sppt_quiet: %u\n", its_mode->power_control.sppt);
>> +	pr_debug("spl_quiet: %u\n", its_mode->power_control.spl);
>> +	pr_debug("sppt_apu_only_quiet: %u\n", its_mode->power_control.sppt_apu_only);
>> +
>> +	/* Fan ID */
>> +	pr_debug("fan_id_perf: %lu\n",
>> +		 data->mode_set[AUTO_PERFORMANCE].fan_control.fan_id);
>> +	pr_debug("fan_id_balanced: %lu\n",
>> +		 data->mode_set[AUTO_BALANCE].fan_control.fan_id);
>> +	pr_debug("fan_id_quiet: %lu\n",
>> +		 data->mode_set[AUTO_QUIET].fan_control.fan_id);
>> +
>> +	pr_debug("Auto Mode Data - END\n");
>> +}
>> +#else
>> +static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data) {}
>> +#endif
>> +
>>  static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
>>  				 struct auto_mode_mode_config *table)
>>  {
>> @@ -140,6 +232,30 @@ static void amd_pmf_get_power_threshold(void)
>>  	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
>>  		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
>>  		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
>> +
>> +#ifdef CONFIG_AMD_PMF_DEBUG
>> +	pr_debug("[AUTO MODE TO_QUIET] pt:%d pf:%d pd: %u",
>> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold,
>> +		 config_store.mode_set[AUTO_BALANCE].power_floor,
>> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta);
>> +
>> +	pr_debug("[AUTO MODE TO_PERFORMANCE] pt:%d pf:%d pd: %u",
>> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold,
>> +		 config_store.mode_set[AUTO_BALANCE].power_floor,
>> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
>> +
>> +	pr_debug("[AUTO MODE QUIET_TO_BALANCE] pt:%d pf:%d pd: %u",
>> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE]
>> +		 .power_threshold,
>> +		 config_store.mode_set[AUTO_QUIET].power_floor,
>> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
>> +
>> +	pr_debug("[AUTO MODE PERFORMANCE_TO_BALANCE] pt:%d pf:%d pd: %u",
>> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE]
>> +		 .power_threshold,
>> +		 config_store.mode_set[AUTO_PERFORMANCE].power_floor,
>> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
>> +#endif
>>  }
>>  
>>  static const char *state_as_str(unsigned int state)
>> @@ -262,6 +378,8 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>>  	/* set to initial default values */
>>  	config_store.current_mode = AUTO_BALANCE;
>>  	dev->socket_power_history_idx = -1;
>> +
>> +	amd_pmf_dump_auto_mode_defaults(&config_store);
>>  }
>>  
>>  int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
>> index 4beb22a19466..371762ce8446 100644
>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>> @@ -13,6 +13,59 @@
>>  
>>  static struct cnqf_config config_store;
>>  
>> +#ifdef CONFIG_AMD_PMF_DEBUG
>> +static const char *state_as_str_cnqf(unsigned int state)
>> +{
>> +	switch (state) {
>> +	case APMF_CNQF_TURBO:
>> +		return "turbo";
>> +	case APMF_CNQF_PERFORMANCE:
>> +		return "performance";
>> +	case APMF_CNQF_BALANCE:
>> +		return "balance";
>> +	case APMF_CNQF_QUIET:
>> +		return "quiet";
>> +	default:
>> +		return "Unknown CnQF State";
>> +	}
>> +}
>> +
>> +static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx)
>> +{
>> +	int i;
>> +
>> +	pr_debug("Dynamic Slider %s Defaults - BEGIN\n", idx ? "DC" : "AC");
>> +	pr_debug("size: %u\n", data->size);
>> +	pr_debug("flags: %u\n", data->flags);
>> +
>> +	/* Time constants */
>> +	pr_debug("t_perf_to_turbo: %u\n", data->t_perf_to_turbo);
>> +	pr_debug("t_balanced_to_perf: %u\n", data->t_balanced_to_perf);
>> +	pr_debug("t_quiet_to_balanced: %u\n", data->t_quiet_to_balanced);
>> +	pr_debug("t_balanced_to_quiet: %u\n", data->t_balanced_to_quiet);
>> +	pr_debug("t_perf_to_balanced: %u\n", data->t_perf_to_balanced);
>> +	pr_debug("t_turbo_to_perf: %u\n", data->t_turbo_to_perf);
>> +
>> +	for (i = 0 ; i < CNQF_MODE_MAX ; i++) {
>> +		pr_debug("pfloor_%s: %u\n", state_as_str_cnqf(i), data->ps[i].pfloor);
>> +		pr_debug("fppt_%s: %u\n", state_as_str_cnqf(i), data->ps[i].fppt);
>> +		pr_debug("sppt_%s: %u\n", state_as_str_cnqf(i), data->ps[i].sppt);
>> +		pr_debug("sppt_apuonly_%s: %u\n", state_as_str_cnqf(i), data->ps[i].sppt_apu_only);
>> +		pr_debug("spl_%s: %u\n", state_as_str_cnqf(i), data->ps[i].spl);
>> +		pr_debug("stt_minlimit_%s: %u\n", state_as_str_cnqf(i), data->ps[i].stt_min_limit);
>> +		pr_debug("stt_skintemp_apu_%s: %u\n", state_as_str_cnqf(i),
>> +			 data->ps[i].stt_skintemp[STT_TEMP_APU]);
>> +		pr_debug("stt_skintemp_hs2_%s: %u\n", state_as_str_cnqf(i),
>> +			 data->ps[i].stt_skintemp[STT_TEMP_HS2]);
>> +		pr_debug("fan_id_%s: %d\n", state_as_str_cnqf(i), data->ps[i].fan_id);
>> +	}
>> +
>> +	pr_debug("Dynamic Slider %s Defaults - END\n", idx ? "DC" : "AC");
>> +}
>> +#else
>> +static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx) {}
>> +#endif
>> +
>>  static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
>>  			    struct cnqf_config *table)
>>  {
>> @@ -275,10 +328,14 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>>  		if (!is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC + i))
>>  			continue;
>>  
>> -		if (i == POWER_SOURCE_AC)
>> +		if (i == POWER_SOURCE_AC) {
>>  			ret = apmf_get_dyn_slider_def_ac(dev, &out);
>> -		else
>> +			amd_pmf_cnqf_dump_defaults(&out, i);
>> +		} else {
>>  			ret = apmf_get_dyn_slider_def_dc(dev, &out);
>> +			amd_pmf_cnqf_dump_defaults(&out, i);
>> +		}
>> +
>>  		if (ret) {
>>  			dev_err(dev->dev, "APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
>>  			return ret;
>> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
>> index bed762d47a14..0a4d0549ea03 100644
>> --- a/drivers/platform/x86/amd/pmf/sps.c
>> +++ b/drivers/platform/x86/amd/pmf/sps.c
>> @@ -12,6 +12,60 @@
>>  
>>  static struct amd_pmf_static_slider_granular config_store;
>>  
>> +#ifdef CONFIG_AMD_PMF_DEBUG
>> +const char *slider_as_str(unsigned int state)
>> +{
>> +	switch (state) {
>> +	case POWER_MODE_PERFORMANCE:
>> +		return "PERFORMANCE";
>> +	case POWER_MODE_BALANCED_POWER:
>> +		return "BALANCED_POWER";
>> +	case POWER_MODE_POWER_SAVER:
>> +		return "POWER_SAVER";
>> +	default:
>> +		return "Unknown Slider State";
>> +	}
>> +}
>> +
>> +const char *source_as_str(unsigned int state)
>> +{
>> +	switch (state) {
>> +	case POWER_SOURCE_AC:
>> +		return "AC";
>> +	case POWER_SOURCE_DC:
>> +		return "DC";
>> +	default:
>> +		return "Unknown Power State";
>> +	}
>> +}
>> +
>> +static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data)
>> +{
>> +	int i, j;
>> +
>> +	pr_debug("Static Slider Data - BEGIN\n");
>> +
>> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
>> +		for (j = 0; j < POWER_MODE_MAX; j++) {
>> +			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
>> +			pr_debug("SPL: %u mW\n", data->prop[i][j].spl);
>> +			pr_debug("SPPT: %u mW\n", data->prop[i][j].sppt);
>> +			pr_debug("SPPT_ApuOnly: %u mW\n", data->prop[i][j].sppt_apu_only);
>> +			pr_debug("FPPT: %u mW\n", data->prop[i][j].fppt);
>> +			pr_debug("STTMinLimit: %u mW\n", data->prop[i][j].stt_min);
>> +			pr_debug("STT_SkinTempLimit_APU: %u C\n",
>> +				 data->prop[i][j].stt_skin_temp[STT_TEMP_APU]);
>> +			pr_debug("STT_SkinTempLimit_HS2: %u C\n",
>> +				 data->prop[i][j].stt_skin_temp[STT_TEMP_HS2]);
>> +		}
>> +	}
>> +
>> +	pr_debug("Static Slider Data - END\n");
>> +}
>> +#else
>> +static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
>> +#endif
>> +
>>  static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>>  {
>>  	struct apmf_static_slider_granular_output output;
>> @@ -36,6 +90,7 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>>  			idx++;
>>  		}
>>  	}
>> +	amd_pmf_dump_sps_defaults(&config_store);
>>  }
>>  
>>  void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
> 
