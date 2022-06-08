Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5D6C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 18:25:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiFHSZb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 14:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiFHSZb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 14:25:31 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E4F24704C
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 11:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8cvJPtBH5bHIn9S5KKweFP9a0LIv4bmyT4bmMngz04E9RFnyVlbpNrW7m2Sc0bJ+hJvuiXg/KskxDqznzvjPsEmTexIbLE982JjGxB/ni8g3fBgOEvVopPEZ+NVAx10V0TMQ3tgCTOxVKlluMDyc2yWhm8Cvaatj/gEbFxDeThiOFVu2ERnZv+H0EvlWLrKyudR750Q1H7pce7AemGT4nHULLt41LPTCazUibhhaDvMzkowyqpzygSS6GAPhS7LewuNC72MGK4E4qYE6XVcUN3aIqwD3m6rdqc+PrzOXl/hWkn4oGUgXm9cRnrSCmizA3bHj4U+PMybgltgl5joTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqBlXpGJqo2XsA8/2N996OP81IjUwRSWvy1LKa5iTwg=;
 b=PrOh4s4BfYBXJZRM/S9HX45agKrryzRiOb2B6pHlGA3T4dgGFhDJTLSn4lQ2YWz4YNI21kyDgo88aXb4k82n9XVVwlPJglIML6erVRSkTLt54WbgyxHyw4q7M32srHQLshPV81AfJ4E1A7t7zCQWCPNq+bRXQGvJZITclgkereSoMmnUT/3dE9PJXqNHBYIWX8ofLicq78ruwg4bllLgAzya+Qwg38Og47dARCSKtEpYBK6nxjK8F0YvopjTzSMWh8T9h7kekG9T+AnHRKbpA++CXlz6ID3q+TBxwn5+YYAeROZuOxIiY+Sq3AprSC3yL1yZq2aZ5du9KGmvpKeAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqBlXpGJqo2XsA8/2N996OP81IjUwRSWvy1LKa5iTwg=;
 b=nPV0gFvG9i7tbxUkyfcyXqovE9UFd9ZYCfe6N1tJF0pAIYqYKIfgeTq+2Zwmh2TmCUvFZgtEzGu8DTICMLMVSlsLKmwU2ELVjUFmn2zuaRKsPDYe9KKzs2LqR/Hhkc8qNChTvwg8A63sY8E8UHz0kN4QA6soZrGDkCxdXvSzO9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4567.namprd12.prod.outlook.com (2603:10b6:208:263::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 8 Jun
 2022 18:25:27 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::d2:aa27:39ac:5fd7]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::d2:aa27:39ac:5fd7%6]) with mapi id 15.20.5332.012; Wed, 8 Jun 2022
 18:25:27 +0000
Message-ID: <70f89880-b352-89ed-ac29-4c3e5066ea6c@amd.com>
Date:   Wed, 8 Jun 2022 23:55:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] platform/x86: Move AMD platform drivers to separate
 directory
To:     hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        Suma Hegde <suma.hegde@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220608182019.2810125-1-Shyam-sundar.S-k@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20220608182019.2810125-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82ac77e9-f736-440a-8ff3-08da497c42cd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4567:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4567E8D4CA86BB024580EFC19AA49@MN2PR12MB4567.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzGP5SkTgcyJk4u8AQWUC9NNExu4PiBxLTlx+dVgyeW7mzlK/pBvanX2bXX+qt5JsfgGLaHCBlA7GGCl/uEQNdTsTB4xptkbg6waiRIefctuyXryqT4f4wtGwbIrc0yCad0GhdCX0XyV8MAYHWUwl7GqDCqEoRz/931f99TI4g1YRgqEWh3PWawfKZt5DTVA4wcaaBk+FMUbUOeFSvdyYgZ2O0rpUO646T7zEcPg6vCTbOVrAh3itOMm8wUZgdcolwVcUcvjpNcaDExoWJhqskewF0j0kwfwWp8B+mhOqAS6agoz7GGtq6PrN25n27T8bs3RH2O8xC968HMSSX1GKUSEf+UP5rhdCzC/cpUfswiaCsazrZTzFevVKxWGVsCFdCE3UMgZo4MVZlj+OepKX0enK1dlJqtYBG/Gz8f1Uj5F+z76Ojbb0uij20YxOuPdW4XZo6EGxC/uiwNgq7lCuOUr2hN/Q6IApuJkfVuIW3jMm42hbsz0lvEtUXneanBzZS5TWQFlHgQKvM3K20PJSpKvEQ2a2HYPJAMGEHWIpODcSqE7rlT8CnPiHAC2pe2ejuRK4dPyK5A6dolkb+KSYTnPBsyQKxQPM8y6be8wmGDyVY8D78IJ4cbNxlbjlZ050MHVRieRpIRvYbTA8kwNmSpJBvgtaEIx7qBMGK0drx7gKMq+60DCxWzBUNnU/glKGdp695nfX0uQFZ8zkKJARVW405qr7gyDB56YfHpMNTxk0zmUBSIgJ/2zxzgdAJpd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(54906003)(26005)(86362001)(38100700002)(8676002)(31686004)(4326008)(5660300002)(66946007)(8936002)(66556008)(66476007)(6506007)(6666004)(6486002)(186003)(53546011)(83380400001)(2906002)(508600001)(36756003)(2616005)(31696002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktOTVI3RnFtVzVCb3o5Nk5MMU4zbzU0UEVLT2hvY0JnYW9QNkVrM2dEdTNs?=
 =?utf-8?B?Y1d4UUZTWCtTZkJOVFJQam9KOXNtakRZWnkydUxFd3ljQ0hzdzV0RGlDK1Vu?=
 =?utf-8?B?VlJqUXdUTkZzQVJwcnVMNjBnSlA5ekQraXdOL3RReHdLWTlNQmhzemcwSThY?=
 =?utf-8?B?cElzNmRUNklYem1ZTlduUUZ0WnZPRXl2UGI1N2ZUdnJrdUhxM09EclJZRksy?=
 =?utf-8?B?cXVSR0EwbWYvT1dmTGdRNEJDekV3ZW5XNk9iOE9tTUxtbXdJN1dSK09YTXpw?=
 =?utf-8?B?dElKOW5IcFVONktnQ2dFSkM5OUtTYzdLN0RwL0VJRk5XeS91M0c2RVNlVm85?=
 =?utf-8?B?TURZTUVkM3lGRE90dGZia1pDSkVVOExSN1R2YlMwMWxPeGJPK2ttdEs3amF0?=
 =?utf-8?B?WURoWkFmamF4cHNaNHk4U3F3bW9nZlEzSmhzRXRVVXduTUJlckVnUFN5dnFI?=
 =?utf-8?B?NUYxaExFblE4d3Y3a1hNNjNOdjh5T3Z1dkY3ZVRkNUFtM3lXNEZaRkhQYWFJ?=
 =?utf-8?B?NklOQWJjNDhzTTV2THEwdGVqN0owd25wUDVWdnpiZVA1bzdoUWgvR25rNDZL?=
 =?utf-8?B?NzhqZmxybGZ0OXBBSHVsNTdBNDlGOTlmWEtIZFdDWGtJb09rRUx3d3Q3RDZN?=
 =?utf-8?B?bU1FNy9raGtKRDhaODdaUFBYRmFLMlNLWjkvcWV3QitRbUNuVWk1dmRWUWth?=
 =?utf-8?B?UGtDdFg2S1N0cUdoSHVTMzZPWERvcWtPRWdUTGVkZWRlZEdFN1FSZG9hN0Y5?=
 =?utf-8?B?ekU0SFlBb2dROHFKc2ozYnU1YUdCaXZCYjI5MXhkeThpNGhQcXRCUXB0WkhS?=
 =?utf-8?B?ZFdWWlM4YUZsWk1TYWtYVEVMYng0WVpMVFRRTlNSeXhzUFJVWWNwQVgrVDg3?=
 =?utf-8?B?L3ZQaiszZFpBbnVVVSs5RW9EaUd4TGpOdlVVamdkWERNWmU0ZjZmWmFyZ2dQ?=
 =?utf-8?B?NUJ4SFFxZ3dQWkRESzVQc3hocEswUzNOSHN6VkVtU0gyelpwNnMyeTNMSVZy?=
 =?utf-8?B?WWo2aklWTEFuTTRWYU13aEZ4Zlc2ZUV6eGtvZEYxS3NudXpMSGI2bStsSHR0?=
 =?utf-8?B?MlFSUE96L1NXTkVPMGp0LzVKc1NhRnhjcGdtMG14T01PYWIycUxBV1dEMG9S?=
 =?utf-8?B?cmhzakxuZlZCMnRXL25zd3lUUGp3SFFEMlUwZVN0cTlYdWt5N2liUHhsOHRE?=
 =?utf-8?B?TnBKTWUyMXZFd1pTZ3BZSitoUjN2bFIrUlI2MkF2RUNMeUNYZ0ltWUJnMUJW?=
 =?utf-8?B?aGs4WUh4TlpnWGhHUzV0VW1vdVdxUEFGWUx1cldBbUhiMXF0M3FMVzIzd3kv?=
 =?utf-8?B?dVV1MW5Xc0Vyamw5ckdRV1A0Zk9oTWl5OHN3RlJ2ZnN1R2s2ajlGUGpTdDJz?=
 =?utf-8?B?clNlVlVFdDlNNjV2SzhROXpSWm1vaTFVdWgyMlRmMUVuRGZhZUV5Zzl5WkZV?=
 =?utf-8?B?M0tjbmFvQloyN0duTnZWWW9KWlhjNHZuQmJ4d0I3dGhVR2E4MjQzZGRrcmtL?=
 =?utf-8?B?ZmtqVmRkWmlNaUFNdXpaVlhkZUo1N3BvQmpHcFNBdko1aTBhTXZjLzlNcFhF?=
 =?utf-8?B?bnlzNGZkNmZMOTNoUGJ2Zkd2dzZ6MmFWeU10UnM5bjNnZ0N1RFBvMkFrR3ZD?=
 =?utf-8?B?YkIxTmZyejlrRnVMT09QTnB1MFlkRXRLZFVXelMvK3lwUEFMWmhuYWJGT2lV?=
 =?utf-8?B?K2kwWVpRN1MrZG9Td1JhQzA2VDdvL3Nadi95T1pSdEU3dVZzS2MxL2pwWExF?=
 =?utf-8?B?V0VWTjd3NjJIWDVSS2NVRTM2U3dJN1JkbjgvRERFSHJyTldNd2NybHJjYzdk?=
 =?utf-8?B?MDVPbmxpSnZPVElZaElXNWFhVXRLWENFdWZ5QWxOVGNKeGUzQnB5OEpxaGpm?=
 =?utf-8?B?Z1NkYVo5WEhnenMxbCtnSWpJSmV5WXVJSVptZ0VuRkpyeXJtSk54WGVzRmxT?=
 =?utf-8?B?cVh0ZVk5ZXFCUG9NZWVNdmpCYS96MENHWEJ3U3M2S0JnV1hwMzMrWjlqa0hR?=
 =?utf-8?B?RVhQeG9NSUVuL0hRY0RiTWp1czhXU3ZjU2lmNGRVbCs3VW9LSitGUENJbFdn?=
 =?utf-8?B?Sk1UTkJra0tkeStPZE1mcjFjYkN0Y09jMTBHZ3ltb1JDM2pMSGcyd1B5N1pR?=
 =?utf-8?B?Q2NCQUdsS2dQdzRNZExwUm8zRG00VHRmdGhtZ09YWVpYM28wcWx1N3VDM05v?=
 =?utf-8?B?eUNCWDMxS1Z2ZVg1Q0xCNm5WbTdDd0pCQ0hMdjRXaWhWS0VaSUJDQWFFRy9m?=
 =?utf-8?B?VVJET0xQVkF0SFNuRDBUaVI5REVsdTgrbkxRYTlVNDRHNCtzMENHd1hDeEY1?=
 =?utf-8?B?Y1dhRkdOVjdiUUEyZjdFb3dvQ1UwRVNkLzJPQWJEVGhQRzhaOHZCQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ac77e9-f736-440a-8ff3-08da497c42cd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 18:25:27.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pArt9/Ioo7ENhbUDgiPFEGon+ZgZL9rK5T8bVRfrUUeM07TbyDSZ08qwuLF4tTBhGpnjUlPqdrVPjTGkqGM38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4567
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Adding Andy..

On 6/8/2022 11:50 PM, Shyam Sundar S K wrote:
> Currently, AMD supported platform drivers are grouped under generic "x86"
> folder structure. Move the current drivers (amd-pmc and amd_hsmp) to a
> separate directory. This would also mean the newer driver submissions to
> pdx86 subsystem in the future will also land in AMD specific directory.
> 
> Reviewed-by: Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
> Tested-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>   - drop "amd" prefix from the file names
> 
>  MAINTAINERS                                   |  4 +--
>  drivers/platform/x86/Kconfig                  | 27 +---------------
>  drivers/platform/x86/Makefile                 |  3 +-
>  drivers/platform/x86/amd/Kconfig              | 31 +++++++++++++++++++
>  drivers/platform/x86/amd/Makefile             |  9 ++++++
>  .../platform/x86/{amd_hsmp.c => amd/hsmp.c}   |  0
>  drivers/platform/x86/{amd-pmc.c => amd/pmc.c} |  0
>  7 files changed, 44 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/Kconfig
>  create mode 100644 drivers/platform/x86/amd/Makefile
>  rename drivers/platform/x86/{amd_hsmp.c => amd/hsmp.c} (100%)
>  rename drivers/platform/x86/{amd-pmc.c => amd/pmc.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a6d3bd9d2a8d..2a34deb24594 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -996,7 +996,7 @@ AMD PMC DRIVER
>  M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/amd-pmc.*
> +F:	drivers/platform/x86/amd/pmc.c
>  
>  AMD HSMP DRIVER
>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> @@ -1006,7 +1006,7 @@ S:	Maintained
>  F:	Documentation/x86/amd_hsmp.rst
>  F:	arch/x86/include/asm/amd_hsmp.h
>  F:	arch/x86/include/uapi/asm/amd_hsmp.h
> -F:	drivers/platform/x86/amd_hsmp.c
> +F:	drivers/platform/x86/amd/hsmp.c
>  
>  AMD POWERPLAY AND SWSMU
>  M:	Evan Quan <evan.quan@amd.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f08ad85683cb..b1879980ce2e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -196,32 +196,7 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> -config AMD_PMC
> -	tristate "AMD SoC PMC driver"
> -	depends on ACPI && PCI && RTC_CLASS
> -	help
> -	  The driver provides support for AMD Power Management Controller
> -	  primarily responsible for S2Idle transactions that are driven from
> -	  a platform firmware running on SMU. This driver also provides a debug
> -	  mechanism to investigate the S2Idle transactions and failures.
> -
> -	  Say Y or M here if you have a notebook powered by AMD RYZEN CPU/APU.
> -
> -	  If you choose to compile this driver as a module the module will be
> -	  called amd-pmc.
> -
> -config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64
> -	help
> -	  The driver provides a way for user space tools to monitor and manage
> -	  system management functionality on EPYC server CPUs from AMD.
> -
> -	  Host System Management Port (HSMP) interface is a mailbox interface
> -	  between the x86 core and the System Management Unit (SMU) firmware.
> -
> -	  If you choose to compile this driver as a module the module will be
> -	  called amd_hsmp.
> +source "drivers/platform/x86/amd/Kconfig"
>  
>  config ADV_SWBUTTON
>  	tristate "Advantech ACPI Software Button Driver"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 4a59f47a46e2..48abfe50aaf5 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -23,8 +23,7 @@ obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
>  
>  # AMD
> -obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> +obj-y				+= amd/
>  
>  # Advantech
>  obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> new file mode 100644
> index 000000000000..c0d0a3c5170c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# AMD x86 Platform Specific Drivers
> +#
> +
> +config AMD_PMC
> +	tristate "AMD SoC PMC driver"
> +	depends on ACPI && PCI && RTC_CLASS
> +	help
> +	  The driver provides support for AMD Power Management Controller
> +	  primarily responsible for S2Idle transactions that are driven from
> +	  a platform firmware running on SMU. This driver also provides a debug
> +	  mechanism to investigate the S2Idle transactions and failures.
> +
> +	  Say Y or M here if you have a notebook powered by AMD RYZEN CPU/APU.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd-pmc.
> +
> +config AMD_HSMP
> +	tristate "AMD HSMP Driver"
> +	depends on AMD_NB && X86_64
> +	help
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC server CPUs from AMD.
> +
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> new file mode 100644
> index 000000000000..de1604993309
> --- /dev/null
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for drivers/platform/x86/amd
> +# AMD x86 Platform-Specific Drivers
> +#
> +
> +obj-$(CONFIG_AMD_PMC)		+= pmc.o
> +obj-$(CONFIG_AMD_HSMP)		+= hsmp.o
> +
> diff --git a/drivers/platform/x86/amd_hsmp.c b/drivers/platform/x86/amd/hsmp.c
> similarity index 100%
> rename from drivers/platform/x86/amd_hsmp.c
> rename to drivers/platform/x86/amd/hsmp.c
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd/pmc.c
> similarity index 100%
> rename from drivers/platform/x86/amd-pmc.c
> rename to drivers/platform/x86/amd/pmc.c
> 
