Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18C23C3BEE;
	Fri,  8 May 2026 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235178; cv=fail; b=hhwnR5IQvNLor3Vf9QmBHKOkOk7eZ4AZjdFZ7xWVYSo71lgar9b3RKXYKjQGUgEsOxxnHZPL9Zv5lomGsalKz7mBVW/JgQCiGKXPGb6YNSdOq77WKBHHY3/R5H3ng5OHow/1TFjaTRBp2cwsDW7S+k0pSReul++AbYrOyL14RtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235178; c=relaxed/simple;
	bh=3Vmminble9Fvw0hz4H/78n2W8zDroQUwjU4EZeTeIao=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gCDxBUo2wDhVMxuKEN1ZYgZqMVosiikAh6QCpsxMSgyGGQJPHXjSO8BPlFA5O9r0c2uOBaD0pytsy4hyHHBE6+SNgBYIuHFFCI4anATgBUAAee2QLQh4wxP/ov8mM84lBUPY/p/Fb8V3dkYQS4JZxsVwZ5bptekl2JlUPYVhENE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VchzvhF4; arc=fail smtp.client-ip=52.101.193.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VchzvhF4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuJ6lwVMCVWTd0F54+H64+LCk27CaZflorZ3acMDKgAOgL6KNTZIfO03GltHFuz9mbUJoZIQeZijIGHp5BO0el8eunRVUe1SUUfnvi1meyR63M7WS0TIJl+0cOJFqScz1ETv+4AY9neAOYDYhDWAhmnWgRbFGiM4X1rFrRlUDSm9YGmqfpU4RHCh6XZRlxgKNb61dnc1ixr/TZZoyyZQ32kprBbHIXmDvQXPkx3OQ9aF3mTl6UyU5hkLy9GycozO00fuLBeoFQxCPbMT5vrnGI8f+dN84x0rJBp6NPG/jh4FCC+EIQXUfWTA6pxnidB4Al1Elfyb69cST/ji1Z5kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ScAe8WWUQwX7BwYERiyc7WODne+EJHELdptG6ymPU=;
 b=Cy+XdLL4p3EfoKoyBgMFIWol8G2p8uzXx6ZY/F61BccdYrfvQsBwmvTA3QL3loJrH3RBqqJ0Yr44ewt7ot/RAdzCfXlx4oBeR7PDPUDn1IpQ/oC6oz68cP057yJmmdsFQ2b+vCSsc7IyOv25E0zgpEcD5/3fKZEn/fUhCU6bRG97Y8uqOAlxxNijyoC0SNG4pGJtISV7OCgt/fZGPPVoXIZjbRhAC3zTueEV5GNBcLhTKY86nS6Q0xbfKHnIT87K/N8FRJmhiYR4qPRVSCPLa/AnHM8iCPxGN5B8SFNskdEdq0DgX9afNSolBwQiVGQhgiyIBOQaO5Qy/lmxW5NxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6ScAe8WWUQwX7BwYERiyc7WODne+EJHELdptG6ymPU=;
 b=VchzvhF42rTDW1qA2ktNY9tzqWLg4ibbM1g2YioT/G+UiLHfnhcALfe3OfPhg3xI2IIYkKPhpcLGRv1ZAelOutlCOWwR4SBYV51fGl6HZpFw0nQMgsp1xpqFp1RsJhjNOlWX0HqSPOGFPVpwViiRimu+hjaMnyLb3N9GtAlWUeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 10:12:49 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 10:12:49 +0000
Message-ID: <c03b99ea-4973-481d-9aab-587a53ba8e8c@amd.com>
Date: Fri, 8 May 2026 15:42:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/amd: Introduce Halo Box RGB LED driver
To: "Yo-Jung Leo Lin (AMD)" <leo.lin@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: cd63237f-f8ee-4c43-0374-08deacea5b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TTUukrKKgiGmdjp0RQjPYlhAcxwjcyskMscd56mbG8/Ofv+gHO4yh5CP0sMpw5pWH5hnX2iJIixKwaWJIRCaRo+KTHEJNqwZr3h54xvmWUbKjNWMqlFzlDYu8ByWmGTTFwgpywac0yHIUjS4rvnQZHUDpwfl9gY0gD95lc6ZeZTXcYAq7pLT0TUd2/WSoP/NBc8wyKcTaFcbY/a3qnWfZ1SSMvA3SNwvYmQv6F7h50A12hbkYLTWD2VQUoLd/fNE0oXB1yTwqETSuRmBuuGDDqNDh3Ar2T4xp00v1+voj3ITdjm0RtjCXPEyTZbYXcjQ0NF8ZxQ+fedVYu4FrNa55T6+gutuhD/hv5mCORCxy+DZpFQdw6tNVx82c8ThK3BeEQrbXSghlteQHgrPu+5HmNLgRwUyal8NR+LhkUqcYJ3QBFulkcGplVyG2m8+1xKgVdUT523DbkdA/YGm8zEnFICdD7kQKNSO/jDBoEebS8Eqfn/CKofcaNGtxk5ank+/xsOgedLvCJkD2vSZTJF+TSWarFHClj5olPeXqpEM8o4no9sgZbKoDS6RFNsMU1xC/mjQ+CRCd5lav9UtS339hqDrZUP5wc5/+GnuPULNvc4nUM6bUrYqjFkUZim7CToBEQUWnVRsGrWCQdzgLeOLM3qmxomAb9w/TjDQTfEiI4Y34k9hnLHXLgjtrTZJLGZDj0IlEFvESynX0vzwSXTCTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVNyeVFuajg2SU1CS2NGZGdyVjBIdWMxcFM2VWdFOUNlemVxNXdmYWhuTTkv?=
 =?utf-8?B?WGlDNjdmUmt1dkhtMzMxb1U1MHp3cjB1SENwSVI3RjVWZVl4QnFvZU5JcWgz?=
 =?utf-8?B?OHBieVplZy8rKzdvb3V3S2VVczBaMFo4QkdyQzhRVmF3SnJHc0doR2RQLzNU?=
 =?utf-8?B?RzJkVmYyWHNTQ0hOOEFPazRYd1V6Z0FxL2w1QU0rQUVWVTcyOEhyeUx4bVdU?=
 =?utf-8?B?QjRNMFQ3YnFKOUVic3BHdU8rbmNtMmt4clphOWZWWG1QazFSZVRJdU9reUhC?=
 =?utf-8?B?MWFHUTBUbHMrd29YZGNndjRsWi9XbW9nNUNtQ2RjbldMYU9rVG5ibUY4MDJr?=
 =?utf-8?B?OVVQOENhWVlJVHJXWUlXRzBhaVJ4elYwRWdKMHZyZzB5L0IrTWNUMGFnN3N2?=
 =?utf-8?B?L0RlNVhjSWNYZVoxUFM2WVk0U1M0emNtVCtucW1Oam1GSldjeHl5MVQyem9M?=
 =?utf-8?B?NWRBclhLNm9zUDdWTEZzeWtXZ0xaMEVvU2MxODdIMVlvRHFQWWIyUndCTEh2?=
 =?utf-8?B?Z1ROb00yckdKb2ZIY0t2Q3BCWUZ0TFVmZVJMNDZIZ1ZBdXkxM2FGZlhpMjJp?=
 =?utf-8?B?SjcyY0JTY1V1KzExanFBZGxnRFpnRTgvUVgzTXc5WXVBRUN5QUlhTzVZemhF?=
 =?utf-8?B?SXYrM3NhMEMwcVJoalJUcTA4bDlvN3BwZlVhWUI5U3BGMHE4enc5ekxlalAy?=
 =?utf-8?B?RGlvSkJHTGtPYlB6WkY1cGw1ajY0c1oxZHAyTE9JbFhzTkVOTTV3NjdiTlR2?=
 =?utf-8?B?U2dWeWxNUmlnSDlwVldNdWFWWHhBdmJ4UVhDSUw4QjFod29paGVRc2dIbnVn?=
 =?utf-8?B?VWZhYkhjb0J6NXIvOXd0YnZOVEIvSlhDR3FOL2Y0OUdURFRQMkltMHJ4V2Ey?=
 =?utf-8?B?ZVhMb2tGckFhWHByOGhHcVlrbjMwMUVzMFJmdFNPNDcxMzlwMkVaY0JxYXlS?=
 =?utf-8?B?WFpJQkxmTnFCN1dDMmVzdGlxTExEbnROSEFybWVYcUM4cWxPSTl6cHlZTTJ1?=
 =?utf-8?B?YVF5bk5Sb1lpbFVsRkF6bGxzTFUxcW1OVTBXNnI2V0REM3prSDhPdUgwRlRK?=
 =?utf-8?B?bHF1dXpwR1VMc25HeWw1TzJTMXFIUHYzbWpOQ2xadERsNm9zL0R0eGtGdkM0?=
 =?utf-8?B?RUpSekFNT01vN3dINGhJOWtkeGZRTXBvKzZnQlJVbkNtVEpSZlVtNWRVb0Jq?=
 =?utf-8?B?aHlwZ2tieWVTMWxFOXpPM0dvRmpnS1ZFL3Jxb2R2cHBicEdSNXpVZldFNGhj?=
 =?utf-8?B?UWI2eE96RGVXckc1WlBhU2ZFOHU4KzdvYncvQk9HbDhSQWJNYUk3REVwUkF6?=
 =?utf-8?B?elhXK1czN0dUQ2hGWUFvQ0QrdmRzSkNqSXNwc3lTeXVqc3NZSGJ4QzdPbVpn?=
 =?utf-8?B?Rjc4c01CVkx5L01HdEdjRTdBcTJvYzBJc3g5ZzVLcVZzbHlHbmErTzIrbEpa?=
 =?utf-8?B?c3BBYVhZVnl5NzBIeWNuRDNLWUNEdTdDRE1RSThuQUxKdzJzbUVMVS9UMjEv?=
 =?utf-8?B?NktYQjBzRnpjRmExMzFqejNRN25wZThZTHZxSWE5UHFjL3FURnhSWUIrS3Rq?=
 =?utf-8?B?dGZkRWFmckZwMkJpdkpLQUoxTGY2cGNpUWlCbDhJVUlaWXl1UUdOYUVjNVZJ?=
 =?utf-8?B?M21RNDEvWmFaMFlKcHZJQThXNllqYkQ0ZnNaeGtDMzBUTUtWcEs5c05MSHd6?=
 =?utf-8?B?SllWcUlCd0tQekQ0NGd4cDJWek5iN0hIQlpMY3h6NFl3OHhxanRSVDRIRVdo?=
 =?utf-8?B?Ti9IQk5OcXpkYlJiWEV1SCt2eFg5dGNOb3FmR29HOTF6SkszSmY3SmpHMlk2?=
 =?utf-8?B?VHMxODVacm1kT3JiU3lDb3RyL2JHSjVYS3JoaTVqQ0pmTW9KcldIanA1YnY5?=
 =?utf-8?B?OFp2NloxNzVMYkxXb1AwZURsWFZlWmxUTldvZ0JXaDEyVGEyKzVJalJIK25j?=
 =?utf-8?B?OXpJam83TEltdUNEeHF2WmEyUURRckVQd2JjRHZTSUhHNDNxaEs5cFFkREcz?=
 =?utf-8?B?bzhTK2FEZStYNHJvV3NsK1YzUEF2TU5YK0h1Mk5XNkJQcHp3ZlJtRlBuN3lD?=
 =?utf-8?B?Q29yYXpYNmlJNnNvVE5WU2dCaTRkYi92UW54TGVTaUIxNjZMTVhJRHMwK1Nl?=
 =?utf-8?B?T1RDS2lEV2cwbG1FK3kwZkROSzNXeUUrdlYvVjNTeTZpb3p3enRiRGgxRzBX?=
 =?utf-8?B?ZDQra0RKRkFNMk5GT3JQQm9ua3k4Z0Q2VkVsY3h6amVYc3F5YmQyR2hJVkd2?=
 =?utf-8?B?YUNWcDlDSk5OZUhDajgzTUlIQjdMRFR2OVA4eUF2LzdYSHFLTXBEL0RJOGp4?=
 =?utf-8?B?YVlZems2Vld2dzRKcVdSNmlSMjFvSWVDNlNGTWJEd0ltOUgzY2xwdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd63237f-f8ee-4c43-0374-08deacea5b7e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:12:49.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dphS7SOikHKlFUEJ27413Aeut/Ev8yPKIAwn97kLKxwg8rmmt/63RKOFJCysWSC988jQEyg3+yjJG0F9vLW1zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6604



On 5/8/2026 14:12, Yo-Jung Leo Lin (AMD) wrote:
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

Looks good to me.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam

> ---
> v2 -> v3:
> - Re-introduce OF/OFF method: implement them with wmidev_invoke_method
> - Explicitly call the ON method on brightness_set callback for
>   brightness != 0; call the OFF method when brightness == 0
> - Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally
> - Replace get_unaligned_le64 with casting and le16_to_cpu()
> - Add an inline function (wmi_status_to_err) to convert WMI return
>   values to errno
> - Use amd_halo_wmi_set_channel in probe to set default color
> - Use devm_mutex_init() instead
> - Remove unused includes
> - Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1-af027727605b@amd.com
> 
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
>  drivers/platform/x86/amd/amd_halo_led.c | 312 ++++++++++++++++++++++++++++++++
>  4 files changed, 331 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c871acf2179c..464bd4d16461 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1124,6 +1124,13 @@ F:	drivers/char/hw_random/geode-rng.c
>  F:	drivers/crypto/geode*
>  F:	drivers/video/fbdev/geode/
>  
> +AMD HALO BOX RGB LED DRIVER
> +M:	Mario Limonciello (AMD) <superm1@kernel.org>
> +R:	Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/amd/amd_halo_led.c
> +
>  AMD HSMP DRIVER
>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>  R:	Carlos Bilbao <carlos.bilbao@kernel.org>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index b813f9265368..a1a74ef6c859 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -34,6 +34,17 @@ config AMD_WBRF
>  	  This mechanism will only be activated on platforms that advertise a
>  	  need for it.
>  
> +config AMD_HALO_LED
> +	tristate "AMD Halo Box RGB LED Driver"
> +	depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
> +	help
> +	  This driver provides RGB LED control for AMD Halo Box devices
> +	  through the LED multicolor subsystem. The Halo Box light bar can
> +	  be controlled via sysfs to display any RGB color combination.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called amd_halo_led.
> +
>  config AMD_ISP_PLATFORM
>  	tristate "AMD ISP4 platform driver"
>  	depends on I2C && X86_64 && ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index f6ff0c837f34..2f467dbbfc8a 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
>  obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>  obj-$(CONFIG_AMD_PMF)		+= pmf/
>  obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> +obj-$(CONFIG_AMD_HALO_LED)	+= amd_halo_led.o
>  obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
>  obj-$(CONFIG_AMD_HFI)		+= hfi/
> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/x86/amd/amd_halo_led.c
> new file mode 100644
> index 000000000000..632ccdf07ffe
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_halo_led.c
> @@ -0,0 +1,312 @@
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
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/wmi.h>
> +
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> +
> +/* WMI method IDs from MOF */
> +enum {
> +	AMD_HALO_WMI_GET_LIGHTBAR = 0x01,
> +	AMD_HALO_WMI_SET_LIGHTBAR,
> +	AMD_HALO_WMI_TURN_ON,
> +	AMD_HALO_WMI_TURN_OFF
> +};
> +
> +/* Channel selectors for Arg0 */
> +enum {
> +	AMD_HALO_CHANNEL_RED = 0x01,
> +	AMD_HALO_CHANNEL_GREEN,
> +	AMD_HALO_CHANNEL_BLUE
> +};
> +
> +/* Status codes from spec */
> +#define AMD_HALO_STATUS_SUCCESS		0x0000
> +#define AMD_HALO_STATUS_INVALID_PARAM	0xFFFD
> +
> +/* Brightness uses 0-100 range */
> +#define AMD_HALO_MAX_HW_BRIGHTNESS	100
> +
> +/* Default RGB brightness */
> +#define AMD_HALO_DEFAULT_RED		50
> +#define AMD_HALO_DEFAULT_GREEN		30
> +#define AMD_HALO_DEFAULT_BLUE		30
> +
> +/**
> + * struct amd_halo_led_data - Driver private data
> + * @wdev: WMI device pointer
> + * @led_mc: LED multicolor class device
> + * @subled_info: RGB channel information
> + * @lock: Mutex to protect WMI calls
> + */
> +struct amd_halo_led_data {
> +	struct wmi_device *wdev;
> +	struct led_classdev_mc led_mc;
> +	struct mc_subled subled_info[3];
> +	struct mutex lock;	/* Protects WMI method calls */
> +};
> +
> +struct amd_halo_wmi_args {
> +	u32 arg0;
> +	u32 arg1;
> +};
> +
> +static inline int wmi_status_to_err(u16 status)
> +{
> +	switch (status) {
> +	case AMD_HALO_STATUS_SUCCESS:
> +		return 0;
> +	case AMD_HALO_STATUS_INVALID_PARAM:
> +		return -EINVAL;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static int __amd_halo_wmi_call(struct wmi_device *wdev,
> +			       u32 method_id,
> +			       u32 arg0,
> +			       u32 arg1)
> +{
> +	struct amd_halo_wmi_args args = {
> +		.arg0 = arg0,
> +		.arg1 = arg1,
> +	};
> +	struct wmi_buffer input = {
> +		.length = sizeof(args),
> +		.data = &args,
> +	};
> +	struct wmi_buffer output = { 0 };
> +	u16 result_status;
> +	int ret;
> +
> +	ret = wmidev_invoke_method(wdev, 0, method_id,
> +				   &input, &output, sizeof(result_status));
> +	if (ret)
> +		return ret;
> +
> +	/* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
> +	result_status = le16_to_cpu(*(__le16 *)output.data);
> +	ret = wmi_status_to_err(result_status);
> +
> +	kfree(output.data);
> +	return ret;
> +}
> +
> +/**
> + * amd_halo_wmi_turn_on - Turn on all LED channels
> + * @wdev: WMI device pointer
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_turn_on(struct wmi_device *wdev)
> +{
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_ON, 0, 0);
> +}
> +
> +/**
> + * amd_halo_wmi_turn_off - Turn off all LED channels
> + * @wdev: WMI device pointer
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)
> +{
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, 0, 0);
> +}
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
> +				    u32 brightness)
> +{
> +	if (channel < AMD_HALO_CHANNEL_RED ||
> +	    channel > AMD_HALO_CHANNEL_BLUE ||
> +	    brightness > AMD_HALO_MAX_HW_BRIGHTNESS)
> +		return -EINVAL;
> +
> +	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_SET_LIGHTBAR,
> +				   channel, brightness);
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
> +				   enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct amd_halo_led_data *data = container_of(mc_cdev,
> +						       struct amd_halo_led_data,
> +						       led_mc);
> +	u32 red_hw, green_hw, blue_hw;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	if (brightness == 0)
> +		return amd_halo_wmi_turn_off(data->wdev);
> +
> +	red_hw = mc_cdev->subled_info[0].brightness;
> +	green_hw = mc_cdev->subled_info[1].brightness;
> +	blue_hw = mc_cdev->subled_info[2].brightness;
> +
> +	ret = amd_halo_wmi_turn_on(data->wdev);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_RED,
> +				       red_hw);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_GREEN,
> +				       green_hw);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_BLUE,
> +				       blue_hw);
> +	if (ret)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	/*
> +	 * Consider the light bar non-functional if TURN_ON or SET_LIGHTBAR failed.
> +	 * Attempt to turn the LED off completely as clean-up.
> +	 */
> +	if (amd_halo_wmi_turn_off(data->wdev))
> +		dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on cleanup\n");
> +
> +	return ret;
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
> +	struct led_init_data led_init_data = {
> +		.devicename = "amd_halo",
> +		.default_label = "multicolor:" LED_FUNCTION_STATUS,
> +		.devname_mandatory = true
> +	};
> +	struct amd_halo_led_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&wdev->dev, &data->lock);
> +	if (ret)
> +		return ret;
> +
> +	data->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	data->subled_info[0].color_index = LED_COLOR_ID_RED;
> +	data->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +	data->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +	data->subled_info[0].intensity = AMD_HALO_DEFAULT_RED;
> +	data->subled_info[1].intensity = AMD_HALO_DEFAULT_GREEN;
> +	data->subled_info[2].intensity = AMD_HALO_DEFAULT_BLUE;
> +
> +	data->led_mc.led_cdev.brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
> +	data->led_mc.led_cdev.max_brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
> +	data->led_mc.led_cdev.brightness_set_blocking = amd_halo_brightness_set;
> +	data->led_mc.led_cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
> +	data->led_mc.num_colors = ARRAY_SIZE(data->subled_info);
> +	data->led_mc.subled_info = data->subled_info;
> +
> +	ret = amd_halo_wmi_turn_on(wdev);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_RED,
> +				       AMD_HALO_DEFAULT_RED);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_GREEN,
> +				       AMD_HALO_DEFAULT_GREEN);
> +	if (ret)
> +		goto out;
> +
> +	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_BLUE,
> +				       AMD_HALO_DEFAULT_BLUE);
> +	if (ret)
> +		goto out;
> +
> +	ret = devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->led_mc,
> +							&led_init_data);
> +	if (ret)
> +		return dev_err_probe(&wdev->dev, ret,
> +				     "Failed to register multicolor LED\n");
> +	return 0;
> +
> +out:
> +	/*
> +	 * Attempt to turn LED off as a cleanup if either TURN_ON or SET_LIGHTBAR
> +	 * fails. For probe failure due to non-WMI errors, keep the LED in the
> +	 * default color.
> +	 */
> +	dev_warn(&data->wdev->dev, "Light bar non-functional, turning it off\n");
> +
> +	if (amd_halo_wmi_turn_off(data->wdev))
> +		dev_warn(&data->wdev->dev, "Failed to turn LED off on cleanup\n");
> +
> +	return dev_err_probe(&wdev->dev, ret, "WMI call failed during probe!\n");
> +}
> +
> +static const struct wmi_device_id amd_halo_id_table[] = {
> +	{ .guid_string = AMD_HALO_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
> +
> +static struct wmi_driver amd_halo_driver = {
> +	.driver = {
> +		.name = "amd_halo_led",
> +	},
> +	.id_table = amd_halo_id_table,
> +	.probe = amd_halo_probe,
> +	.no_singleton = true,
> +};
> +
> +module_wmi_driver(amd_halo_driver);
> +
> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
> +MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");
> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
> +MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260429-halo-leds-v2-plus-722c8083afe8
> 
> Best regards,

