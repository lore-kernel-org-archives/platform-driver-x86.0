Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0EAC28B2B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Aug 2022 08:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347889AbiHSI6R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Aug 2022 04:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347888AbiHSI6O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Aug 2022 04:58:14 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEC7D6E
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 01:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLMiQdISi+Oapn5wxG+9aP6X9Qu469feYwJGfZ1U9yeg1XyDGG7ZJyx2g23A0mTRW3MI+FtaErxT9XdcoIkx5qirpfE5WFUYyeZJZbXm1dwKh3oOHPbDymAtAsPwqrFPPlBDacHtIC8PD48xx2aeZVzxavFyS73GyV3QRIEUh01rvo5AZjn+FK+gAWe3TduUq2dv5dWsrVlHkmITtnSKVAB2wi0B+8IwowBV0gxAcf/JH6AFJgOjZPIilhkb7QIan7tcHqruAH8YBH7/C+EtbJwiCZjwBBCfrSfOUxQkH9dSIBHRf1KeCrwG3lue+Ug80yc/2yEYV97qAJIgO3zOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOMeJ6fzbkJymwNoJw7XCb8Zr9dmHtL4p7hKjWXSsz4=;
 b=J2UlBg6V6RUHHdJpN/knJUjkjmV6SH6b9G6Pl+LVbFY3WwvLrDoS36yDBgIkEPuilh+Bsv1XhZv3iEDCItgjPoTFmeox93o5R3O0e2ZUsGUYVxfFGmQxSQAXTfnA6Q4kJ/8E7uW5zYsMzbhFsenOhojruL0tCaEBYpUtPWAJ18HamUQGSCWcihW7ZfXtDEITlomDuCI0yALvFKWPOtf+TMVnQikWD15yztxT0Nbx8K4KafWMsfiKUcwY/YDzLB6dEEOqBBaz0hon4rhhaapC/TDxqvUYbOQlQShKixtIWX+/mpJb/Usf2OXg1/v0mvaLCK4bc8IVUMVmcjK1/HqZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOMeJ6fzbkJymwNoJw7XCb8Zr9dmHtL4p7hKjWXSsz4=;
 b=xjznH1VoGFqtCrUepm6WtRv/N0liFibuF8xXi79DhB+ezFPGjl8oXKfH4fLc8evJBl9P3bQ8prZZ3+mqWyjZeC3M15004dR5V1OtArcLJJP3/6+W3aRgWzLjX4QzFZtQgNpZTYMlWGnAmuj2R4mxIrkGMn6kmIelj73V1roXh9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB7021.namprd12.prod.outlook.com (2603:10b6:806:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 08:58:10 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20%9]) with mapi id 15.20.5504.028; Fri, 19 Aug 2022
 08:58:10 +0000
Message-ID: <c515c207-5497-67ba-c0f4-c4d5ae46f755@amd.com>
Date:   Fri, 19 Aug 2022 14:28:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 03/11] platform/x86/amd/pmf: Add support SPS PMF
 feature
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        llvm@lists.linux.dev
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
 <20220802151149.2123699-4-Shyam-sundar.S-k@amd.com>
 <Yv7BmjjLtA3RaKju@thelio-3990X>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Yv7BmjjLtA3RaKju@thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23646a5c-b2eb-4d79-0f90-08da81c0f0d5
X-MS-TrafficTypeDiagnostic: SN7PR12MB7021:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOBrhBh5CZyEnwXyakFE53lFiYxCahTn3OWfUhPO67pan1zkDWx+TKC+PzeDeAYyApDG53L7NIEYMOre//NJZM1P0QweDz/RXRjKDeIhY7yN2/vJkaHNY0ylgdRWOGSFj4OF49wwvRwFIFJmoASoVQLBX5GbRpdeLhIX1L2PdKSYt+C9SneAtSkTSDIRroftINOQnhcE3rdOE+z5fOZ3ON0xh4SMPjXq0Ml+TdI0zn3memoiTRSb36O/HRXz/AJaAyN6j8Jwzeph9Ij4wNfMAzw+2+xClhiC9Lw8hES94Gf4uWAimDbEkeA972qfvQ76/Wx1pdUm6GD7YqBqrbolC2UT7owu7R/jhkyY6+cJwE8EgzOjkKY8rvUnOvG32L9ZYb5y+eY06NKVpkq85ndfcNAcyyJv8rguZE6Si+WzmLufjyj4WGB5dU5w852UVT2mMBq/7NVLrWAQDiYNlYSjC3CJnZhyodzXQXMVGb3tbcWpH7KEEAkf/bLQqa5fcFRYVw9SgU3fC27g1mIfoK2cytsxQhZXNbEjxUaM51tBN0Sugx7YYxpGfdWn4VFpdXshGru7Ur2YouCHL919zBTJKJ+gd+A5wlcVwiB3fc9s92r5pu1tYQmL/qrUOlF/eduW71ZGc3Bis1B2WteMtklr+2fR43to1Tg08wFvuN5rmyoPBk6jd9hTLqHulqndMqpIa/XcEIUL/WGK7+dUQRKycwLE6cj/fN09vpk25gR90h96huGWagl69K09a6BUvIsuB2dR6cNRjfWJ0fMSWjMl033ODlJx2jw+XTMQ7QXm2W8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(2906002)(2616005)(31686004)(6916009)(186003)(36756003)(316002)(83380400001)(38100700002)(53546011)(4326008)(66946007)(66556008)(66476007)(8676002)(31696002)(6486002)(6512007)(26005)(41300700001)(86362001)(478600001)(8936002)(6666004)(6506007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUJrcUZ0UUN1SW9tYmYvNnhoK05WeVJBcWdhbm52YzRqOTB2cC9pK0xaVUZ3?=
 =?utf-8?B?dy82dzZWYlowQzh5eHY2K1c0VDVWU3RqTDhSc2R1cnZuVW1IV1RjaVd1ekMz?=
 =?utf-8?B?WkZPUjRzdU9wWVJlcnpoV1d1UXpRRVN4UGN0eFB4bExDQytwcjlvYlorNFBx?=
 =?utf-8?B?MXJRSlBJckdpaU9FQTRsMUFQUTNkSG5QenBhdDlZakdZR2xsbTVQRzF6aVBl?=
 =?utf-8?B?VUYxSnVZTm5VUkVaZkJKTmlTemxHeHlJdm1FZmYyMHFHdDN3MnFWMklDSktq?=
 =?utf-8?B?VmxBNjhjZlliZG4xZTFTWXR6VmpMY0tKN283b0MwY0JlSi9OQ3NucVRkMHBu?=
 =?utf-8?B?ZnprdTlsWGF6S1FKcmxsZytuTVQ2dU1ZRTF4VUxja0ZRbUptVXlyVVJqbWp2?=
 =?utf-8?B?dEJhUDN1RmRaU0lGRTR1NGpMTVM4dkxZdGlWbWpYdWdNcTBJRCtJdTcwZ0E3?=
 =?utf-8?B?cE5LQ0pQNGNpajJVc2RWN3JCNXdVUU9DTmFSanhnZDhlVzZrdzR3Z29nM0cz?=
 =?utf-8?B?MWp3Y0Erc0FjSmVtajV1R2VtaW5CYWhGS1kzV3MyUEZ5a0gydmdvWG5hNWJz?=
 =?utf-8?B?R2p5SzZ0SllidEtPMFJlaXVDVFZrN2lLa2dSMzViNWhUOXhzWm5EbGxyVGt4?=
 =?utf-8?B?RkZTK1RBMGRlTHhMSFNaazR5QUVCR0NjenJBcnd5Y2JMM2VXYnhEOGhVb28r?=
 =?utf-8?B?enpQSTVZSi9YTmU1aVJPRG5yRmpSTUNYck4zQ1UzKzlTbUl6NUVkQ3p4LzVU?=
 =?utf-8?B?b3d1bUE2cU9xSVV6UkhXWURqZk1wQkpYVGRncCsxdWZHQ1pHZlh5c2xnN2wy?=
 =?utf-8?B?eEFkYU9yMUkwUVRoeStDYmw0RjdSSm05emJVN21aS3JhblhWV2lKd2RUdmcr?=
 =?utf-8?B?TUhZQjdTOWs4Wjh1bmY4aVIrMVRxVFh1VEY3eXZMSXpjZFltalRJL1VscVlY?=
 =?utf-8?B?TlRzNDcyeDFVKzBqc25TTjNDWHhUTTJuSTB5SGZDdVpZdU15aE9NUU9VOWpl?=
 =?utf-8?B?MTlPVllnM21HWko3cjZIUVRuYnVJVU9GRGxxdEFMSlZJUm1EUU1KRG1KRHJM?=
 =?utf-8?B?NDh5V1NSOE1Mc1d3ZytmNFl6djhNOWZoRld1eWZBTHd1YmNlK1UybTJMM3RJ?=
 =?utf-8?B?bjNMRE1RSWcvSmlMNGZkN0ZjTzJyYXZ4NVlFM05KVER4Z3lyYkJQZWdHZlNS?=
 =?utf-8?B?Qk9kZUtqMS9vTmxkMjQ2QkRNL2lTYWI2WU1MV0VsWFVHcVdhZjNNSmNRTzR1?=
 =?utf-8?B?aWhsc04rVGYxWUFzbkhaM0ZRRWlBMUEwK2RwZmJjYlpDQ1BvbG8yNXB5OEVl?=
 =?utf-8?B?S1IzTElsTW1lazlaVzNkZCtIL0hTK3psSUJCdFZxRnkyM2U2ZHBBcEpnQk1o?=
 =?utf-8?B?cWlDVzNlUmJ2RWh6a3IvWUZ5Wldxemxpd2thTWZqSllOYWlqQ1VtdUdmVzdS?=
 =?utf-8?B?L0VEUnN0Ly8zbWZralVNMHFYeldkRlNoY3g5THdBVHNGNWVQVVJnK1NhNmJ3?=
 =?utf-8?B?UjFxZk9Yd1VIbDlYTzZ0WERZWi9HSm5NbDZVVlRBd3dtaVpKdjNSc0xQVFI1?=
 =?utf-8?B?clkydVlYSmZqKy9vbW1DMHV6MHNpMGJtN2NoR3V3L3RPdFkvQUl2YUhLK29R?=
 =?utf-8?B?VE9BdVhOajBGenV2RkM4eGhWcXVFazhQNEtQOHhMKzJEYzNnTW4yNzBKaHB6?=
 =?utf-8?B?dlQrRTRUYTRhVTRIa2h2NnRGdkNUdHlOanB2YSt2V3ROOGxWcTUrSjlpckFH?=
 =?utf-8?B?TjMwU2VjR2trdWFsWmFUUzJHTHVKWElHU1RiRWMwVERVWWw5QWtEN1F0aHBD?=
 =?utf-8?B?c21HMFFGZkNZY0YzYitxT2ZFT2paNGNxei9XNEwrd3dLcm5WaU5MbU00VDFt?=
 =?utf-8?B?Z3kzWWdFbFpzbHFFcFlRbUI3alI2K29EVmFwZ05yNWk2RmRyYlV6RVlXU1lF?=
 =?utf-8?B?SUhzdEJJSjNpNDF3bU9Ub1R6K2Y1T1dwZFlqTGJPWmJ5OUdNeXlWV0ZCUGlV?=
 =?utf-8?B?R2VzbkpkejVxSjZ6WHZ5VW1INFRQYXppZmUvT21vcUIxeHRRLzdFQndLWEU4?=
 =?utf-8?B?a0M2NHVwYmNRNGpRSjd4dnJidGh5clFGSWhZK3pycGk2RzhqN2gvdU4zR3ht?=
 =?utf-8?Q?5ISJLDO8+HM9AmkEE9jRmrauG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23646a5c-b2eb-4d79-0f90-08da81c0f0d5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:58:10.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 301HEXzrQGsQUq4CSKqXD8WBqdedtVHCBZK/zkSyWikLweNX902oW/IrkGmLMq781Mx79Fh8ry+pnX4KfhGjVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7021
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Nathan,

Thanks for bringing this up.

On 8/19/2022 4:17 AM, Nathan Chancellor wrote:
> Hi Shyam,
> 
> On Tue, Aug 02, 2022 at 08:41:41PM +0530, Shyam Sundar S K wrote:
>> SPS (a.k.a. Static Power Slider) gives a feel of Windows performance
>> power slider for the Linux users, where the user selects a certain
>> mode (like "balanced", "low-power" or "performance") and the thermals
>> associated with each selected mode gets applied from the silicon
>> side via the mailboxes defined through PMFW.
>>
>> PMF driver hooks to platform_profile by reading the PMF ACPI fn9 to
>> see if the support is being advertised by ACPI interface.
>>
>> If supported, the PMF driver reacts to platform_profile selection choices
>> made by the user and adjust the system thermal behavior.
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> <snip>
> 
>> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
>> new file mode 100644
>> index 000000000000..ef4df3fd774b
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/sps.c
> 
> <snip>
> 
>> +u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>> +{
>> +	u8 mode;
>> +
>> +	switch (pmf->current_profile) {
>> +	case PLATFORM_PROFILE_PERFORMANCE:
>> +		mode = POWER_MODE_PERFORMANCE;
>> +		break;
>> +	case PLATFORM_PROFILE_BALANCED:
>> +		mode = POWER_MODE_BALANCED_POWER;
>> +		break;
>> +	case PLATFORM_PROFILE_LOW_POWER:
>> +		mode = POWER_MODE_POWER_SAVER;
>> +		break;
>> +	default:
>> +		dev_err(pmf->dev, "Unknown Platform Profile.\n");
>> +		break;
>> +	}
>> +
>> +	return mode;
>> +}
> 
> This patch is now in -next as commit 4c71ae414474
> ("platform/x86/amd/pmf: Add support SPS PMF feature"), where it causes
> the following clang warning:
> 
>   drivers/platform/x86/amd/pmf/sps.c:96:2: error: variable 'mode' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   drivers/platform/x86/amd/pmf/sps.c:101:9: note: uninitialized use occurs here
>           return mode;
>                  ^~~~
>   drivers/platform/x86/amd/pmf/sps.c:84:9: note: initialize the variable 'mode' to silence this warning
>           u8 mode;
>                  ^
>                   = '\0'
>   1 error generated.
> 
> As far as I can tell, the default case cannot actually happen due to the
> advertising of choices in amd_pmf_init_sps() and the check against those
> choices in platform_profile_store() but it would be good to avoid this
> warning, especially given that it is fatal with CONFIG_WERROR.
> 
> I do not mind sending a patch for this but I am a little unclear what
> the best fix would be. Removing the default case would cause -Wswitch
> warnings because current_profile is an enum (plus it would make finding
> invalid profiles harder if there was ever a change in the core). Perhaps
> changing the return type to be an int, returning an error code in the
> default case, then updating the call sites to check for an error? I am
> open to other suggestions (or if you want to sent a fix yourself, just
> consider this a report).

yes, you are right. We can just change the return an error code like the
other driver implementing the platform_profile. Like below.

diff --git a/drivers/platform/x86/amd/pmf/pmf.h
b/drivers/platform/x86/amd/pmf/pmf.h
index 7613ed2ef6e3..172610f93bd1 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -303,7 +303,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);

 /* SPS Layer */
-u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
+int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
                           struct amd_pmf_static_slider_granular *table);
 int amd_pmf_init_sps(struct amd_pmf_dev *dev);
diff --git a/drivers/platform/x86/amd/pmf/sps.c
b/drivers/platform/x86/amd/pmf/sps.c
index 8923e29cc6ca..dba7e36962dc 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -79,9 +79,9 @@ static int amd_pmf_profile_get(struct
platform_profile_handler *pprof,
        return 0;
 }

-u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
+int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
 {
-       u8 mode;
+       int mode;

        switch (pmf->current_profile) {
        case PLATFORM_PROFILE_PERFORMANCE:
@@ -95,7 +95,7 @@ u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
                break;
        default:
                dev_err(pmf->dev, "Unknown Platform Profile.\n");
-               break;
+               return -EOPNOTSUPP;
        }

        return mode;
@@ -105,10 +105,13 @@ static int amd_pmf_profile_set(struct
platform_profile_handler *pprof,
                               enum platform_profile_option profile)
 {
        struct amd_pmf_dev *pmf = container_of(pprof, struct
amd_pmf_dev, pprof);
-       u8 mode;
+       int mode;

        pmf->current_profile = profile;
        mode = amd_pmf_get_pprof_modes(pmf);
+       if (mode < 0)
+               return mode;
+
        amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
        return 0;
 }


Thanks,
Shyam

> 
> Cheers,
> Nathan
> 
