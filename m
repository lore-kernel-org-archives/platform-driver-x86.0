Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255F234973;
	Wed,  6 May 2026 04:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778042044; cv=fail; b=TuEUA/quDIbLm1gw3d38LCSUwp9UYl5urWtDiQPTU3jx1Af/DKYjszb+mOs6yHM7y6Mh4bfswh1frEgTfa5JbP4YClAaKkWx43+yCtfGSOCPrCXQMeKGkP1DlZZe81wJ3mdWhntQLn8g9K5RYSkjbahntkb47rsERPOfnxTvRy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778042044; c=relaxed/simple;
	bh=I6JIjSpKC6Vi6OIKzlLeAD7HihOAiUivkj+Ib85nVZA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=utVfjPraepJTIZq++IQFjuxZmFEK+jbI7HgRQXwZPHRjUdhVJssquHyDJL73Mu8sUiD4snbprAijVxl5KSOkeQxGvVkL07zLXk55ZOlplFswUu54ECHRxRTIQZQsr5QQ6p7fplFAWEnfQ1Uh3ztGhSJQ8TLf+Lb0cWriSBwNagU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RGPQzTDy; arc=fail smtp.client-ip=52.101.62.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RGPQzTDy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kM7n4s/ZmiqSBGByi3PbwwSICk8I2A04Ufs6IL8yrsB+tSobvbCxz2a0Ss7ZxUIO0SaMB2ctEhh6cdx1agUqlDQOOu1gSw2lmWEXszEjK1pf2RwZUdkCaUa0+1vtP/+gF6kYkS8OAaRlWeU0o+XxFqixMiblowqIDjcXwU4C9ff2CZKjzojmIkNhSgM/02zJBqZV9HL9sc6BWrPqqbOnXNGmugGup2Lgj9dPev59K6F40i9NcK0C3GZi2lZESAqv0KFFmfln6syIEIiNBCLaS+raVL5GUMM/QEHsY9OvuYVxSSCB2trXEDdBgfFT4FrLx4MC7mmOkx27ZeZBWtGYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzcIxfAuwzggmjHHG14FdW/fENd5rS/LV/2gA/gUbVA=;
 b=vwNblimL0PpfDW48kpc/hE38qpvBzEX29qmqd5MWLZ7zDB9Imw/BfktKb0ueMTsLkpGPDfBsCqM0JC08ygnOs7puV6hh7eBy1uOdnIxAUIiMvouLkPRAp3kPfUPIhbkemPs5YPJnN2HpIMWICJjCHpWFSXGPdDuWnSZoDoaUkSdxm/e5gTvU1tzo6TCK04VF9ctw6sEMBQth2DfJ52UlDfe+W3OQhwc1Xf9m9xSrx3hrosJ8aNhY5ZGmG17RskVJOK239OzA0rSXRtMZgTFSrpAfwz9rkxvArR1t7QCnRlF/MXidDBrOthKkItGoqgGVzdNpHw6htzdnEs3XHXSOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzcIxfAuwzggmjHHG14FdW/fENd5rS/LV/2gA/gUbVA=;
 b=RGPQzTDyikUTxIqy5i9XEQ97F+kDJ+81ib0TCokdZpbrXLmgElAsRH70P1GvBPPGMRIRoVOUrQpEeWPCTqnt++kndNOagpTxGNAbca2fbqjkRNqTB9sy0A8BXYDoADEfZ4jcSIZYcwIh5j2C1QZy9StRW3zroG3J3G84M1hNCc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 04:33:57 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 04:33:52 +0000
Message-ID: <3f59c433-422a-40ef-b9fa-bbd77df47896@amd.com>
Date: Wed, 6 May 2026 10:03:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd: Introduce Halo Box RGB LED driver
To: "Yo-Jung Leo Lin (AMD)" <leo.lin@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260504-halo-leds-v2-plus-v2-1-af027727605b@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20260504-halo-leds-v2-plus-v2-1-af027727605b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3df3e3-284c-4601-1064-08deab28a91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F9lZuVe6rzwBZSSDjkScNG4giM++epPXhZaoURojFj873CpMsiypd9wEoKWOO5Ks0eKDv0h3/uj6BUBevPus+EtWQM1+gDdXPQ2D0NFI3zr0VJoGoJ0b0sOa7CPZHl4UEgvkfzzYZU9rFxmwYRB9WPezSBvQRtpyUhLXrU5WV87T5y3ZC/doFV0slOwnXYh9sRuwZ1CJpl/afudlzCgJlOtOxFiCq8QzOGanflxrjlio0fiS40yYngFaA0AmsDBFH2wO+9EdQY/QzEDcwq8ZWHBghz28Yx/AItuVi3/jclfBIkNNTZgLZzxT44jR7y8ep+V9KvDMPkepO2tbAfx/DtgHCmNCLRoSiga+wpBmcOtKpblWu3yah2t+4dKTglntdZenm1QRTNRdhUpmjS2ou0RINMokBFmvlX2RrHEFeKJPYmJ/hW0WeZZ0MY1bjZOJloaWCCslSXhFViHnRULgsMpUXyqa7+yBQMt5GzK1N/GhGwksxqTiDgmCrA7c5+4TiljukxTjFseNeLHO/ta0vct2xt9cBpLFyiHFnMwN/EV6730Pq20P6wVVg80nSISkJMnz1FuhBgHqGzaQOM4Dq0EmXhJudZW9GFWjPX/C62jWck5JwFb+zRxmv3NeDlIJO6xSZ8L028+jTnpjrdnWhJ3snhgzlJqXQZPphRKNPso34mIqlWTTFmFF3E+KMxbV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmVlRDFIb1U1dFN3UmYvQkhLVHl0S0FwSmdOMklrUVkwbEJNQmtrY2Qya3lJ?=
 =?utf-8?B?dW9Xam9Vdm00RkNjaGt1T1l1ZjdTK1d3d09wNllUcWZpODluZmxZS1BRK0FL?=
 =?utf-8?B?TlRGejBhM0tucmFDSGsrV0MvWURKRXZHSGZCYVVFRnh6ZGQzenpsK0lhZ3F0?=
 =?utf-8?B?ZzB3bVh0RVhFVC84ODdDcHZqWkpPTW9uQnFvaVB2MUsxWkZDQUVqUlRvWGw4?=
 =?utf-8?B?bklPZmVUV1Y0S0J4RFo5NDc1VFNJUmRLSXRDTjFLMjc3M00vT0tURGxoOGpE?=
 =?utf-8?B?QmRxOWptU0VBYWc0V1ltdjROaldua2xvcVd0b1FVUmJFMDNwWk1mNTl1azJD?=
 =?utf-8?B?MU5GM2lEbDB3N3RUbnN6RXBjckNReGkySWhkbmJCaCs2dWVNOWdaYUx6cHRL?=
 =?utf-8?B?WlZHdmx4V0t0cDlRdlhQS2I1Nml0SERGZERxbytvNDJTVzhWUi9UMGhYc3py?=
 =?utf-8?B?WEtWNHB5ZXpoMjc3OUEzWGlYcURNZG9qQ3JFeXJLZ05oREI0NHMzZ09IUzNv?=
 =?utf-8?B?WDliWnF0OXlBTDBnUmZMR014UjJNVWlQa1NhaFZtamFNd0FpUkM3bmxkNlp3?=
 =?utf-8?B?OGxFTkMvL2ZMVW15bGNNNm1FZjg1aGtucmt2U3BpVy92ZEkvWXJLTmJzWDk3?=
 =?utf-8?B?dHdpSTM4aGRiclFkUU1BcEJ5M0tkZ0FiaUZWZlhHK2hBWVdsdmc1dGRrY0cv?=
 =?utf-8?B?Y3pxTExPTU5vbzNwQlE3cCtvb2NnanR2VWYvWC9iNHU2WDZQeDZFaTZTM3R3?=
 =?utf-8?B?UFZsYTVMRTVvRWdNaThWWWlqbU55TUNiR0FYZStpb1g4bVo2NUtxbUw4S2hX?=
 =?utf-8?B?MmxZTkQyWjZVZW5ZNUNEcjFTWURyaVFBNkpFOFQ0c3dxOUozdnoxcG9xVUIz?=
 =?utf-8?B?eTNRdEk2WWFUbUdaR2ZBR3JmeVFUWXkyek5wdkVFVmp5eEZtWEtkNVVRc05G?=
 =?utf-8?B?VFRzOGNmYUtoQU1ITTY2a1o0UDFsZTVIRWNnb280QjBSTlMxbHNBUGRpQk1u?=
 =?utf-8?B?eVdjSCs5RkhUMlA1eGxDN0FBWXlMWUJuRjJkZlJsV3NvQmxMZEJoOXp4UTBj?=
 =?utf-8?B?TzAvcG5sL0VtaTRvcG1kNURGcnFrQ1pXMW9nV05IMmpzVVkyeVhFK0Z4WWJh?=
 =?utf-8?B?NGFEcnFFQ0M5ZWt4bXZyem9xd2JVREFLQmJsMEF2elBkeEI0NkppTDArL2g2?=
 =?utf-8?B?eGFRQ09YU0FGNUUvbDJZMXhKODZQNGIza3ZYekhiRnVlN1hibituRjNUZ1ZS?=
 =?utf-8?B?cXcwK2lpVlZlWmNzRzVrdTZjejMzejEyd3h1NHFaY0R1RXJDVlg1Wk9YSVNR?=
 =?utf-8?B?UytsdytZMHFMN2hhUFdlRCs5WkE3eEdzU09mUjVaSlFHVGhGajFidHlqeUlW?=
 =?utf-8?B?VzNrNTQ3bnE4L05ycjVEU0IwbHdLR0xURWI1R25PdWV1ZU9TaitZNlEzTTgy?=
 =?utf-8?B?S2xZelNnOTFoQzFVOXA2MGxteW95djZmZ05aUWtDVEZldVY0VWV3WnpkU2U5?=
 =?utf-8?B?bFBOV1BEMld0QjYrTkZYSG9TTTFtMFp3QS9UUzJld3R3djMwb291djR1NG8v?=
 =?utf-8?B?czQrL0F2a3lYY0U0R1BUS05WUTd1K2NzelFvZzJEY0NPQjM0RUdQVk1kQ2FP?=
 =?utf-8?B?UDFrN1B2U2xOZ04wTm10QmNyb3JNR3VObmVRWnF2MEY4UjV0d2tLTG9PbG1Q?=
 =?utf-8?B?WG1mK00xWXpoVTRYUmNnRVE4TExwYmN4emdkeWZzOS9leDNST0JyZHdVTytC?=
 =?utf-8?B?RW55NjY0MlRIZHR3WFlYMWxwVHh5a0tNQ2craHNna1c4OUlHb0NJVWRRcHBF?=
 =?utf-8?B?WUZaMjdYTWNtbjhLd001VkJLV3ptRVJ1aFlpUFZBSEdtNG10cVBZMUJhQjE1?=
 =?utf-8?B?MzA3ZXpNVGErMjZMcFFmTG1CMmNuZHV4cVhtd25SUG5LN2o3Zlh3RS9USjQ5?=
 =?utf-8?B?QkpScGIvZlNmRHR3ajFXNWVlelpzZ0xRdkpGR1pnVWlPMVdhYTd0dENkMk1C?=
 =?utf-8?B?QnNpTDdqUDJJU080czQ0djEvT2E2RVYxZmdKdUtjbmFuNm1IYW9kZ3htbkl3?=
 =?utf-8?B?M3l5WUw3eWdDRzlkM09PcWswVklUTU1iaHdlNGJUNXByZHloUVZtNEV4OVFj?=
 =?utf-8?B?emlyeW80a2NBQWpwZGVjcWVYTEpadWF5dW9mU3BGQnJXcUtkdG5uSEc3eGxE?=
 =?utf-8?B?ZGhSeGliaEdTNzNMNzJjdVg4ay9wV2pIMFo5VDNUMXVDWEMyVjVNQWwvaEJw?=
 =?utf-8?B?N01zN0ZObEtsUzFmSDJ1VFdKUG1wOVpESVBvT1RkaU8zODgyeDA4WUNZT3dW?=
 =?utf-8?B?STZOTE9qSEljWDJlaTBMc2x4Wkx1ZU5tYVFQcW5UZVRyOCtkTlljQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3df3e3-284c-4601-1064-08deab28a91b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 04:33:49.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Fb6hr94DbIoG4uBlZqB/7Ux56B6YbUPw7iyZFeNjCshiPDBbbBlns0MNM3Igq6ztFYdGxB1mxHqBVBllmDPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245



On 5/4/2026 19:51, Yo-Jung Leo Lin (AMD) wrote:
> [You don't often get email from leo.lin@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The Halo Box features an RGB LED light bar that can be controlled
> through WMI methods to display any color combination.
> 
> The driver exposes the LED through the LED multicolor subsystem,
> allowing userspace to control RGB values via sysfs:
>   /sys/class/leds/amd_halo:multicolor:status/multi_intensity
>   /sys/class/leds/amd_halo:multicolor:status/brightness
> 
> Hardware interface:
> - Three separate RGB channels (Red, Green, Blue)
> - Each channel controlled via individual WMI method calls
> - Value range: 0-100 (matching hardware range directly)
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
> v1 -> v2:
> - Fix Kconfig dependencies
> - Remove amd_halo_wmi_turn_off(). Handle the case where brightness=0 with the
>   same logic where brightness != 0
> - Remove the brightness_get callback, because currently there isn't a
>   well-defined global bightness in hardware. Note that the sysfs brightness
>   stil works. It just caches the value last set.
> - Convert to wmidev_invoke_method()
> - Convert to ARRAY_SIZE()
> - Convert some macros to enum
> - Convert to devm_led_classdev_multicolor_register_ext()
> - Rename sysfs path to amd_halo:multicolor:status
> - Fold default LED colors setting in probe, before registration
> - Add no_singleton option
> - Make default RGB values into macros and adjust their values
> ---
>  MAINTAINERS                             |   7 +
>  drivers/platform/x86/amd/Kconfig        |  11 ++
>  drivers/platform/x86/amd/Makefile       |   1 +
>  drivers/platform/x86/amd/amd_halo_led.c | 222 ++++++++++++++++++++++++++++++++
>  4 files changed, 241 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c871acf2179c..464bd4d16461 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1124,6 +1124,13 @@ F:       drivers/char/hw_random/geode-rng.c
>  F:     drivers/crypto/geode*
>  F:     drivers/video/fbdev/geode/
> 
> +AMD HALO BOX RGB LED DRIVER
> +M:     Mario Limonciello (AMD) <superm1@kernel.org>
> +R:     Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Supported
> +F:     drivers/platform/x86/amd/amd_halo_led.c
> +
>  AMD HSMP DRIVER
>  M:     Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>  R:     Carlos Bilbao <carlos.bilbao@kernel.org>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index b813f9265368..a1a74ef6c859 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -34,6 +34,17 @@ config AMD_WBRF
>           This mechanism will only be activated on platforms that advertise a
>           need for it.
> 
> +config AMD_HALO_LED
> +       tristate "AMD Halo Box RGB LED Driver"
> +       depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
> +       help
> +         This driver provides RGB LED control for AMD Halo Box devices
> +         through the LED multicolor subsystem. The Halo Box light bar can
> +         be controlled via sysfs to display any RGB color combination.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called amd_halo_led.
> +
>  config AMD_ISP_PLATFORM
>         tristate "AMD ISP4 platform driver"
>         depends on I2C && X86_64 && ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index f6ff0c837f34..2f467dbbfc8a 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)         += pmc/
>  obj-$(CONFIG_AMD_HSMP)         += hsmp/
>  obj-$(CONFIG_AMD_PMF)          += pmf/
>  obj-$(CONFIG_AMD_WBRF)         += wbrf.o
> +obj-$(CONFIG_AMD_HALO_LED)     += amd_halo_led.o
>  obj-$(CONFIG_AMD_ISP_PLATFORM) += amd_isp4.o
>  obj-$(CONFIG_AMD_HFI)          += hfi/
> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/x86/amd/amd_halo_led.c
> new file mode 100644
> index 000000000000..12188571c7d9
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_halo_led.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Halo Box RGB LED Driver
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + * This driver provides RGB LED control for AMD Halo Box devices through
> + * the LED multicolor subsystem. The Halo Box light bar can be controlled
> + * via sysfs to display any RGB color combination.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/unaligned.h>
> +#include <linux/wmi.h>
> +
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> +
> +/* WMI method IDs from MOF */
> +enum {
> +       AMD_HALO_WMI_GET_LIGHTBAR = 0x01,
> +       AMD_HALO_WMI_SET_LIGHTBAR,
> +       AMD_HALO_WMI_TURN_ON,
> +       AMD_HALO_WMI_TURN_OFF

v2 has turn_off calls removed but the enums are not updated.

AMD_HALO_WMI_TURN_ON/OFF values are not in use.

> +};
> +
> +/* Channel selectors for Arg0 */
> +enum {
> +       AMD_HALO_CHANNEL_RED = 0x01,
> +       AMD_HALO_CHANNEL_GREEN,
> +       AMD_HALO_CHANNEL_BLUE
> +};
> +
> +/* Status codes from spec */
> +#define AMD_HALO_STATUS_SUCCESS                0x0000
> +#define AMD_HALO_STATUS_INVALID_PARAM  0xFFFD

This macro is not used. Please see below for more comments.

> +
> +/* Brightness uses 0-100 range */
> +#define AMD_HALO_MAX_HW_BRIGHTNESS     100
> +
> +/* Default RGB brightness */
> +#define AMD_HALO_DEFAULT_RED           50
> +#define AMD_HALO_DEFAULT_GREEN         30
> +#define AMD_HALO_DEFAULT_BLUE          30

50/30/30 means a reddish-orange on the startup. Intentional? Should it
be just 50/50/50 to look white?

> +
> +/**
> + * struct amd_halo_led_data - Driver private data
> + * @wdev: WMI device pointer
> + * @led_mc: LED multicolor class device
> + * @subled_info: RGB channel information
> + * @lock: Mutex to protect WMI calls
> + */
> +struct amd_halo_led_data {
> +       struct wmi_device *wdev;
> +       struct led_classdev_mc led_mc;
> +       struct mc_subled subled_info[3];
> +       struct mutex lock;      /* Protects WMI method calls */
> +};
> +
> +struct amd_halo_wmi_args {
> +       u32 arg0;
> +       u32 arg1;
> +};
> +
> +/**
> + * amd_halo_wmi_set_channel - Set a single RGB channel value
> + * @wdev: WMI device pointer
> + * @channel: Channel selector (1=Red, 2=Green, 3=Blue)
> + * @brightness: brightness to set (0-100)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_set_channel(struct wmi_device *wdev, u32 channel,
> +                                   u32 brightness)
> +{
> +       struct amd_halo_wmi_args args = {
> +               .arg0 = channel,
> +               .arg1 = brightness,
> +       };
> +       struct wmi_buffer input = {
> +               .length = sizeof(args),
> +               .data = &args,
> +       };
> +       struct wmi_buffer output = { 0 };
> +       u16 result_status;
> +       int ret;
> +
> +       /* Validate input per spec */
> +       if (channel < AMD_HALO_CHANNEL_RED ||
> +           channel > AMD_HALO_CHANNEL_BLUE ||
> +           brightness > AMD_HALO_MAX_HW_BRIGHTNESS)
> +               return -EINVAL;
> +
> +       ret = wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_SET_LIGHTBAR,
> +                                       &input, &output, sizeof(result_status));
> +       if (ret)
> +               return ret;
> +
> +       /* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
> +       result_status = get_unaligned_le16(output.data);
> +       ret = (result_status == AMD_HALO_STATUS_SUCCESS) ? 0 : -EIO;

AMD_HALO_STATUS_INVALID_PARAM macro usage could be something like this?

if (result_status == AMD_HALO_STATUS_SUCCESS)
    ret = 0;
else if (result_status == AMD_HALO_STATUS_INVALID_PARAM)
    ret = -EINVAL;
else
    ret = -EIO

if no, the macro can be entirely dropped.

> +
> +       kfree(output.data);
> +       return ret;
> +}
> +
> +/**
> + * amd_halo_brightness_set - Set LED brightness and color
> + * @cdev: LED class device
> + * @brightness: Brightness value
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_brightness_set(struct led_classdev *cdev,
> +                                  enum led_brightness brightness)
> +{
> +       struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +       struct amd_halo_led_data *data = container_of(mc_cdev,
> +                                                      struct amd_halo_led_data,
> +                                                      led_mc);
> +       u32 red_hw, green_hw, blue_hw;
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       led_mc_calc_color_components(mc_cdev, brightness);
> +       red_hw = mc_cdev->subled_info[0].brightness;
> +       green_hw = mc_cdev->subled_info[1].brightness;
> +       blue_hw = mc_cdev->subled_info[2].brightness;
> +
> +       /* Set each channel individually - 3 WMI calls required */
> +       ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_RED,
> +                                      red_hw);
> +       if (ret)
> +               return ret;
> +
> +       ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_GREEN,
> +                                      green_hw);
> +       if (ret)
> +               return ret;
> +
> +       return amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_BLUE,
> +                                       blue_hw);

what if one of the above set_channel fails? 3 things I can think of:

- Restore previous state on failure, or
- Accept partial updates (current behavior), or
- Add a comment documenting this is intentional

> +}
> +
> +/**
> + * amd_halo_probe - Driver probe function
> + * @wdev: WMI device
> + * @context: Context data (unused)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_probe(struct wmi_device *wdev, const void *context)
> +{
> +       struct led_init_data led_init_data = {
> +               .devicename = "amd_halo",
> +               .default_label = "multicolor:" LED_FUNCTION_STATUS,
> +               .devname_mandatory = true
> +       };
> +       struct amd_halo_led_data *data;
> +       int ret;
> +
> +       data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->wdev = wdev;
> +       mutex_init(&data->lock);
> +       dev_set_drvdata(&wdev->dev, data);
> +
> +       data->subled_info[0].color_index = LED_COLOR_ID_RED;
> +       data->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +       data->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +       data->subled_info[0].intensity = AMD_HALO_DEFAULT_RED;
> +       data->subled_info[1].intensity = AMD_HALO_DEFAULT_GREEN;
> +       data->subled_info[2].intensity = AMD_HALO_DEFAULT_BLUE;
> +
> +       data->led_mc.led_cdev.brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
> +       data->led_mc.led_cdev.max_brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
> +       data->led_mc.led_cdev.brightness_set_blocking = amd_halo_brightness_set;
> +       data->led_mc.led_cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;

Are these suspend/resume flags required?

Does the hardware retain LED state across suspend/resume, or does the
LED core need to restore it?

> +       data->led_mc.num_colors = ARRAY_SIZE(data->subled_info);
> +       data->led_mc.subled_info = data->subled_info;
> +
> +       ret = amd_halo_brightness_set(&data->led_mc.led_cdev,
> +                                     AMD_HALO_MAX_HW_BRIGHTNESS);

brightness_set is called before the LED registration. Is this intentional?

> +       if (ret)
> +               return dev_err_probe(&wdev->dev, ret,
> +                                    "Failed to set default LED colors\n");
> +
> +       ret = devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->led_mc,
> +                                                       &led_init_data);
> +       if (ret)
> +               return dev_err_probe(&wdev->dev, ret,
> +                                    "Failed to register multicolor LED\n");
> +       return 0;
> +}
> +
> +static const struct wmi_device_id amd_halo_id_table[] = {
> +       { .guid_string = AMD_HALO_GUID },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
> +
> +static struct wmi_driver amd_halo_driver = {
> +       .driver = {
> +               .name = "amd_halo_led",
> +       },
> +       .id_table = amd_halo_id_table,
> +       .probe = amd_halo_probe,
> +       .no_singleton = true,
> +};
> +
> +module_wmi_driver(amd_halo_driver);
> +
> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
> +MODULE_AUTHOR("Leo Lin <Leo.Lin@amd.com>");
> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
> +MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260429-halo-leds-v2-plus-722c8083afe8
> 
> Best regards,
> --
> Yo-Jung Leo Lin (AMD) <leo.lin@amd.com>
> 
> 

