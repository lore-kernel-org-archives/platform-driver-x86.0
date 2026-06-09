Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B86423A64
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011494; cv=fail; b=ZVxOQwzvExP6iK8ORkXf1nR2s97shHq023jztvMY4QkzLUWo5ArP74CEFamR121YO5mtVslb6e2l9lzLVKp5WKNdJ00fuD+rbavGhl7jh8OqTkfInn1W6djw/OX1VNtOazOrhnhnIkQG4sX17ZLlSqajkpVfVQbTI4aOyUJnSL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011494; c=relaxed/simple;
	bh=5seX3rhY021ZoQ7YHRvF223i79uLAkoQSzq8HZ6tX4Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WNB2E+148dV3gTPVlZ3OWaKs2oDsCYCviNX+seUozTCyCUhnfAqM5bdDiut2iBB/phHYfFP3olaO6mdeYxhrFgwplQQneuiDvYVOTQTWD9PcLfijBkUXyrBqWwAnWDfrNVG2gyhdpKD+xGs3nZ68Je40Og4JUcdXvwJSdPeLkPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X5CCLcI2; arc=fail smtp.client-ip=52.101.85.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X5CCLcI2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZnKhS8iFCmIS6RCPf9ofC03aD7FBFsJAZeP8N1U4smOckNl6SkFuo69PPIj7Q5qA8RXUhiNdj4qaFAvFng7GO0HlxLAd9aggZ74tMs6R7Lzd6HpWPeg+kCHjyiFzUrutd1XandybGCDmvBKnz+5y2EYSUxAV+0qicoQnfILvPVA15rNlBSw8x9zPSETSQdcTMrj+mWclK/bElgRuegwevMHajBp7CNJzTx6MfQweCr921L8YVQRhtYoyvej06oCr2IGlOiZms00j+rJS8xoaQEIRZY86txELqugtZ6Zh/Z6nAj1bT/RwuzohvSo7x6sKnUL/W1H7Laogc4GDkLVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P79VGmSjl4HpKzTSuBTAHjBJ5MosUfYEk1YTExu/97E=;
 b=rafueOZ88DQ4CIcGhNpMYQlom+itgiLCGmjkk0PG+nINoFYzrypm/BWvwTeEHpfvemCB+q43LgHwC5gGchVHxUJQLFi/S/x/5Yq3zCOBYHJdhBFMDAPtv3Pcy8BdCtDZ89zFPUXfWX6jHxImS2A3kfw/1yY8fNZ5iobzXcFiC+4r3d8/KYTSYv/NSPmnN6M5fMsnIKlNSeIT/0eOfjHEnIw2gN3WVNV0JyR09N69kFYghdVK9Eq/7wwc6tIiICkWmBiJYGLw8/Yzjmc3mc+Ld/6mh7FAzelAdQOIcBszdY5kVQZJbe+L6DqA63rOEE/Xc1bjEd3U+CR13ZENKOznPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P79VGmSjl4HpKzTSuBTAHjBJ5MosUfYEk1YTExu/97E=;
 b=X5CCLcI2d+vv3vVX7JBF3tO5Z6Cml+JruOqVWRGYlMzkXM3T/9f4ijzPTtRlNgev5eZaVQSVsLUjknhjRfmeovCbwwfYoYY00iw7A1OyRHeTRifxDgfIVMwgWBJhd4jG5lXNYHmkzntYzIGTVzF/ozWvN4hILYhmwPMCYDEw9k0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 13:24:50 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 13:24:50 +0000
Message-ID: <c5466ac1-642a-4af1-be2f-d342979d5d0e@amd.com>
Date: Tue, 9 Jun 2026 08:24:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] platform/x86/amd/pmf: Add util layer and userspace
 character device interface
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Sanket.Goswami@amd.com
References: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
 <20260609081044.2416731-2-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260609081044.2416731-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:805:106::40) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 169fc3a5-c85d-47ba-4568-08dec62a7bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	amvMhFaeZP7kqU51J90z4FrzUyR/xqv445gJVdpjP17+qba8bv5YKYIpAXczm1P3bzpouThz2aKCu85F0n0KW8dRC1luv8qWUL4p7ie0se3S0ES4s+mX9YnuBopwszpckzoD1FljOE7g3dfz27yL2fE/x9Eq41rMPnN7flXt9KEZVv1JEvu3gSsCgwKZuzPbb5iEWTY2Fl+ykvcYcg4qTithI30cWBcNQNcKzrM/rVsSVjt6LAg6IcJa1S5Omsi91mvDu5CJSpPHNkploPbniSyqygVo70GR/EYVuQTf5dFGDBEcIa1cgvh+ygJxN5t1iK94X4jTGi+Q/Cxr6m2fkHdDDT5ZuXq6+AuttXcHcpH/cKM5UCcEVaRhml/7EbJgDHg79SOpKXMvAlvsgsF/ZEM7iDthg3tSfpOEtBT1Ricco0uLeGc5V7NfG0lEwMfMjxPXt9wnGngYOCzeF7aFrHoE/2YcxNfjHhWdtJJn+4PFl6l9MfjkfQ4xXn5VYrlayqqHbU5uH4M1/86lL5LtNI4IwB3lhpz0YL/UR4LyEgKnyHuY7BUvRTopzRJAcYr/o1dcFxWufviYnbUJwmQGqv9VGSLVRoiz/BvC8R3lMWbYIP+chU1xcV0tyyWc8M02xBGalX/Y+VmKBzsR93ci2aSk+Ja3zeKsG3Ckv0ou2h4Sqf5KmgXwEMReENUSk0YGw09tLdYDfMPOVXN/z7DlzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm83WmVyNDBCbkQ4M2s4Mm42RWFxTTBYdFY2NGJDaDlaYy9yNjNWSk5EVmlU?=
 =?utf-8?B?NUVVdE5nTGU4bk1KV3dBVUlQWE1pT1U1VGNRcFhOVCtvZHdQMnl0QzdUdUc1?=
 =?utf-8?B?cHRGbEk1eHgzWk0rWVFHTWZjeEMxbkhkYjhsRXVwd2IrVXdQVmdraEs3U1cv?=
 =?utf-8?B?VnNqNSt6aURBalYrMmh6VEErTGpDTW9JWW5XZllvcGFuL1JxTlQzaS9QTFYy?=
 =?utf-8?B?SlZUc0R1YnNkSHJ4Qk5ubkFpRFM2ZEJWM2pDMkZpYkdWNktwLzdzUnE5alV2?=
 =?utf-8?B?K3hjQ1o3bTJjalVVcDZJa25yZVFWUHZ4amZ2WnM2WHNsdldZV0Nid2lCUUtR?=
 =?utf-8?B?Ym1yQmwwekJPWDlycEM0bEpReVZkZzZqNWtxaCtFQk10M3Q4M2k1WlR2N0hm?=
 =?utf-8?B?TEI5bGtHWEhkNWxlOUpQdkk5SzdBTG9JTHdUMWkyQmpRRU1SN2Z4aDBpck5q?=
 =?utf-8?B?MTRPY2l0R2o5bEw1MTFDaWVla0hoUFc4eHZ1VHVNS2hPeXJ2YjdaWHNpWHF4?=
 =?utf-8?B?UVBkRTduZlphdDhFZ1ozYlloZVpVbHVmakJTaG1WNXQ4VFNSNzFGWVBzR2Ey?=
 =?utf-8?B?ZUhIUEk5SDcyUXdEV2NUWXMzMGdVakc5UUt1Y0RQYVdZUHpsNHlwQXlkUFQ4?=
 =?utf-8?B?RHViZ0N5Vk40R0Z0QW9wSHVpNnFST3l1OWxpQ0VWSHRqNUpianNZUHlZSmF5?=
 =?utf-8?B?bHptZEx6Z3dlS1g4c1FXUlZwUkZDYkJ5TCtzUzRDMm51SnNVak1YSEY3VXVY?=
 =?utf-8?B?QUVJeVlBb0lDYkpqblZDak90NXM4eEZPT1AxanFTZnJ5bHc2ZzRZZTlCa1Bv?=
 =?utf-8?B?aUxyS0xFQTlhUG5JOG9ITUQwYlNNRERNbCs2bkc3QU53QUk2c3RpZlY3d3Bt?=
 =?utf-8?B?RjUvMW02SVQxelRiS01zQkR4SnB4blBOWFRjbGhiSVVNdG5YM1pLRGJCcmFC?=
 =?utf-8?B?RHQyVU9pTlpSTDMrdjlOYzNCYjMyL3dlSXk4eHJwRlp3S1VjTG9LWTdtaWdX?=
 =?utf-8?B?dFZSOVh5K2ttOWJsYWcrUDBzTFlmMTgwQ3JFcHhzaU5CeFhHazkzcy92amdZ?=
 =?utf-8?B?RDFkbm4wODlWRTdEa1VCb3dIWkxLNWs1TkZFQTZiYXVDbXB3bGxMaXdINjg2?=
 =?utf-8?B?bEpLN0x6NHF4cDhLYzRLQVlZekxVOHRKMkFnNi9uWHREOTAvbTEzeXF5b3Zw?=
 =?utf-8?B?TmthV0NWaTJpUGlHV3pidmtCeG9rS005MmF3a0VhOVNyTkViMzhXNWFUN1ZY?=
 =?utf-8?B?L1FRWk5xb1MzU1EvUFczb2RWQzNvcU1DZ3J5R0FKckpWS1ZJUkU3QjlYcERI?=
 =?utf-8?B?dnJWMlkxYnRleEsybUcyV0JIK3Fmc25XdGYzbHZ6a1QyTTZQbzA3QzJpTHhu?=
 =?utf-8?B?NkQxL0RJNlY1QXlWZEpiZGEyNnRxWTdXaG4rV0lzMXhnWUNwdVB3VWQrZUsx?=
 =?utf-8?B?UHFqVEc5aTNpZXhtdUltSERweFR2Z1JqcTMwSExYdWZ5ZFNoNjB1QTZFdXc4?=
 =?utf-8?B?WnZ2OTB3clkvRG1ZclVJN2hFbVdoaWRBL2JFb2tHbWM0TTNMRXJYdGUrTHB3?=
 =?utf-8?B?RlNqNGdNY1ZKY0JNTVRYTVB4YnFZakhBc3hvWFJnU1dIL1ZTWE5zK3RtRU1o?=
 =?utf-8?B?M2RTWFlVQzFVZngwaFkwakJXbjdkd0VJbFRDaG5vYUFBWkVFZng0VzFMVFRX?=
 =?utf-8?B?M0gvVGx1MkJXdGVGMGwvR2poN3FwQVg1VlRvVjVHcmU0QzJRL2tXVGFvR0RD?=
 =?utf-8?B?ZnVxczdHRlRYQ1NJejZkcnZEY0dIWnNQangwZlhjZW5jQ09hZnJlYzRkVm5Q?=
 =?utf-8?B?V1BZd01CcEphcTVXMUUyR3NhNkx6YmFQNnd4RmVsV3RZM29Qa3ptVGYxWHNE?=
 =?utf-8?B?emYyVmN5bTgydjlGd1NqZ3lTQXNac2dFUk83ZTBSSWFub01KWHBiNFk3RlB1?=
 =?utf-8?B?U3BEQW1oMUZLN3RDUTByemttclhuS2tCVDNHLzFMREFHbm9DQ2VEa0o0VWg5?=
 =?utf-8?B?TGVWN3lOa2pERis2MzY2SWg3bmdmL3VXdGZqeUl4dk9aeERVaVFwZGZKdUsw?=
 =?utf-8?B?ZVRJWGRHNldPY2ExR3ZZQlZ2ZmJIU1VEeG11MGRVNlg1em1RaEZjTGFNZlFl?=
 =?utf-8?B?Q2RWL0ZENzhzRTBZQXQrV2ppTVd4dUVqRmtNWFNnS2FHRTNVeUMyeklLMjM5?=
 =?utf-8?B?b3NTTXNLelR0aVorMWwzY3dqTm5jSVE5RERKTmtUNmhnK0t6ZERpN0Y3eDFQ?=
 =?utf-8?B?d1VYZzBpeEIyYkdxZElrMjd2eTkwVSswTEdVbytjM3NkRXlMQ0lheFJ2dThY?=
 =?utf-8?Q?JNFqOgFUsFKC5wghiZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169fc3a5-c85d-47ba-4568-08dec62a7bb3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:24:50.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4iDgZe8EQuDFdTPQtgD0VByJntrmM4zmcMvuuyQtaiMYYoVoVEovvqsi79r4Ok5xSir2fEO5SuoieVpyHdE3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840



On 6/9/26 03:10, Shyam Sundar S K wrote:
> Add a util layer to AMD PMF that exposes a minimal userspace interface
> via a character device for metrics monitoring and feature discovery.
> 
> This creates /dev/amdpmf_interface with basic ioctl support to retrieve
> PMF metrics such as:
> *  Power source and power slider position
> *  Platform type, lid state, and user presence
> *  Skin temperature and ambient light
> *  BIOS input parameters (1-10)
> *  Graphics workload metrics
> *  CPU C-state residency (average and maximum)
> *  Socket power consumption
> *  Auto Mode: Automatic power profile switching based on system activity
> *  Static Power Slider: User-selectable power profiles
> *  Policy Builder (Smart PC): Action based policy management
> *  Dynamic Power Slider AC: Adaptive power profiles when on AC power
> *  Dynamic Power Slider DC: Adaptive power profiles when on battery
> 
> The interface enables smoother integration with userspace tools such as
> AMD SystemDeck [1], which is widely used for monitoring and controlling
> power and thermal behavior on AMD platforms. These tools help designers
> keep major components within thermal limits to ensure proper operation
> and enhance overall system stability and reliability.
> 
> The feature is gated behind the CONFIG_AMD_PMF_UTIL_SUPPORT Kconfig
> option, allowing it to be disabled if not needed. The implementation
> uses existing PMF infrastructure to populate data from the TA (Trusted
> Application) shared memory buffer.
> 
> Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/Kconfig  | 10 ++++
>   drivers/platform/x86/amd/pmf/Makefile |  2 +
>   drivers/platform/x86/amd/pmf/core.c   |  5 ++
>   drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++
>   drivers/platform/x86/amd/pmf/util.c   | 68 +++++++++++++++++++++++++
>   include/uapi/linux/amd-pmf.h          | 71 +++++++++++++++++++++++++++
>   6 files changed, 165 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>   create mode 100644 include/uapi/linux/amd-pmf.h
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 25b8f7ae3abd..ad4faf18de47 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
>   	 in the PMF config store.
>   
>   	 Say Y here to enable more debug logs and Say N here if you are not sure.
> +
> +config AMD_PMF_UTIL_SUPPORT
> +	bool "AMD PMF Util layer support"
> +	depends on AMD_PMF

To help with distros getting this right, how would you feel about making 
this include a "default true"?

This isn't worth spinning the series over if it's the only comment (it 
can be a follow up).

> +	help
> +	  Enabling this option provides a character device for userspace to capture
> +	  PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
> +	  Power Slider AC/DC) along with PMF metrics from the AMD PMF driver.
> +
> +	  Say Y here to enable it and Say N here if you are not sure.
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index 5978464e0eb7..bf7aad80b9e9 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -8,3 +8,5 @@ obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
>   amd-pmf-y 			:= core.o acpi.o sps.o \
>   				   auto-mode.o cnqf.o \
>   				   tee-if.o spc.o
> +# Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
> +amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index b9e5a2cf3aae..58d86b4c2828 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -634,6 +634,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   
>   	pmf_device = dev->dev;
>   
> +	err = amd_pmf_cdev_register(dev);
> +	if (err)
> +		dev_warn(dev->dev, "failed to register util interface: %d\n", err);
> +
>   	dev_info(dev->dev, "registered PMF device successfully\n");
>   
>   	return 0;
> @@ -643,6 +647,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>   {
>   	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>   
> +	amd_pmf_cdev_unregister();
>   	amd_pmf_deinit_features(dev);
>   	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>   		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 69fef7448744..6f61076a9386 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -928,4 +928,13 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
>   void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
>   int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev);
>   
> +/* Util Layer */
> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev);
> +void amd_pmf_cdev_unregister(void);
> +#else
> +static inline int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
> +static inline void amd_pmf_cdev_unregister(void) {}
> +#endif
> +
>   #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> new file mode 100644
> index 000000000000..f8a283192ffe
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Util Layer
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *	    Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#include <linux/amd-pmf.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mutex.h>
> +#include <linux/uaccess.h>
> +
> +#include "pmf.h"
> +
> +static struct amd_pmf_dev *pmf_dev_handle;
> +static DEFINE_MUTEX(pmf_util_lock);
> +
> +static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> +{
> +	return -ENOTTY;
> +}
> +
> +static int amd_pmf_open(struct inode *inode, struct file *filp)
> +{
> +	guard(mutex)(&pmf_util_lock);
> +	if (!pmf_dev_handle)
> +		return -ENODEV;
> +
> +	filp->private_data = pmf_dev_handle;
> +	return 0;
> +}
> +
> +static const struct file_operations pmf_if_ops = {
> +	.owner          = THIS_MODULE,
> +	.open           = amd_pmf_open,
> +	.unlocked_ioctl = amd_pmf_set_ioctl,
> +};
> +
> +static struct miscdevice amd_pmf_util_if = {
> +	.minor		= MISC_DYNAMIC_MINOR,
> +	.name		= "amdpmf_interface",
> +	.fops		= &pmf_if_ops,
> +};
> +
> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev)
> +{
> +	int ret;
> +
> +	guard(mutex)(&pmf_util_lock);
> +	pmf_dev_handle = dev;
> +	ret = misc_register(&amd_pmf_util_if);
> +	if (ret)
> +		pmf_dev_handle = NULL;
> +
> +	return ret;
> +}
> +
> +void amd_pmf_cdev_unregister(void)
> +{
> +	guard(mutex)(&pmf_util_lock);
> +	if (pmf_dev_handle)
> +		misc_deregister(&amd_pmf_util_if);
> +	pmf_dev_handle = NULL;
> +}
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> new file mode 100644
> index 000000000000..bbbd39b2ce15
> --- /dev/null
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
> +/*
> + * AMD Platform Management Framework (PMF) UAPI Header
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * This file defines the user-space API for interacting with the AMD PMF
> + * driver. It provides ioctl interfaces to query platform-specific metrics
> + * such as power source, slider position, platform type, laptop placement,
> + * and various BIOS input/output parameters.
> + */
> +
> +#ifndef _UAPI_LINUX_AMD_PMF_H
> +#define _UAPI_LINUX_AMD_PMF_H
> +
> +#include <linux/bits.h>
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +/**
> + * AMD_PMF_IOC_MAGIC - Magic number for AMD PMF ioctl commands
> + *
> + * This magic number uniquely identifies AMD PMF ioctl operations.
> + */
> +#define AMD_PMF_IOC_MAGIC	'p'
> +
> +/**
> + * IOCTL_AMD_PMF_POPULATE_DATA - ioctl command to retrieve PMF metrics data
> + *
> + * This ioctl command is used to populate the amd_pmf_info structure
> + * with the requested PMF metrics information.
> + */
> +#define IOCTL_AMD_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, __u64)
> +
> +#define AMD_PMF_BIOS_PARAMS_MAX		10
> +
> +/* AMD PMF feature flags - bitmask indicating supported features */
> +#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
> +#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
> +#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
> +
> +struct amd_pmf_info {
> +	__u64 size;
> +
> +	/* Feature info */
> +	__u32 features_supported;
> +
> +	/* Power and state info */
> +	__u32 platform_type;
> +	__u32 power_source;
> +	__u32 laptop_placement;
> +	__u32 lid_state;
> +	__u32 user_presence;
> +	__u32 slider_position;
> +
> +	/* Thermal and power metrics */
> +	__s32 skin_temp;
> +	__u32 gfx_busy;
> +	__s32 ambient_light;
> +	__u32 avg_c0_residency;
> +	__u32 max_c0_residency;
> +	__u32 socket_power;
> +
> +	/* BIOS parameters */
> +	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
> +};
> +
> +#endif /* _UAPI_LINUX_AMD_PMF_H */

