Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469D8111E
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709202807; cv=fail; b=mEFYQqfDiXRSlEilB7HxcfQW9qZIpjAH5Xp/TklDIddUiGLHOa9lt+hAwHMvNzz6Vg4Ve5FeyzmzyhNte8N8tXtMUr1h/h92auCJs4sJhfHpdU5t0oaBk4QQMK4EzOFO24sn3VMF6NqEtVPtKp2soOKqV8lmMxyycgcmFtuAZFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709202807; c=relaxed/simple;
	bh=GgVoKLDuoBu45UmmV/wLEblUYDFEKXMKoKGL2nr2P6M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=omXBHIFKE9NkC8fae2k9huBVLCkNYEQGvAWrlegluAN5PjOsyPYW7TkLdmRUB9cG/B5tDwt92DghfzV3EQM7MvlKsYxeud9nX91jX+4f4Jv6PdMTn2Ico6mLm+bpp3fYTQ3MYiUVERoySxYUNfTGPhKtSv5fPzSlIef2NZ6SMFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a4JLnvyu; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a4JLnvyu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAORC7OD1Ou8ZbqvyDKi8WGSQFiLWelEtVoOii/WrcJMV/uPnSVQvLWnQOwGfX0aY0umJJdgvzodePKIUG2R5m11S669Mn8oMZkZiNvLnFVdk1SOZ8Tf3UnAMFCwSPshnGNQ7t/11G4E5g/6L7hNDchKrqdUg+t9Y/+FpL4KPtl34+bGlAVsX6vEleqc7PQ0BujTSRmA9ycnfrsXgI2d/WdFx8HU7o22xs/IlXPsndbM/9BBFxGkOhAjdADjStvPfxJ+BybnZu6KOI8ZtKFkE/vIExuDe47dsnohfZCijmq639mX82UkCB7Ql1nj4j55PV2my+81VTvA/MHuHh4uZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcoH/ZN9WyN4DgGtoDZbHTVfabek943AWpFObaTo7DU=;
 b=MKvoZkb8a/UUXBS/aBUagADbBdCboaikpZWlbygFm535Ec96ZcizXBIq0z6anpnZkJJTeKUx1IHIy/FtWBvLgjWMSxyM3LDmLUe2FPfplRCbTgLqS3BzX1SLbJfz8AaeEX6WjIkevko2IRLIbBiPMLw5kU+sFYVK22Qjv2hUN4gBR9tFvugEiRg98YixR1/Ae+ERfdBClQEcaNcuatveJZDzY/KDGrCtcMVvurEg4LASlOPyOgJ2YrFJzXs6jeER8YPujkYXwV3jNf4EkJeFOUfwm6fmW8kfpZQBa6H2ui2kDYv6LNQTeSY5fA0IwpjFsEoupMPqap+ZGn/b841KdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcoH/ZN9WyN4DgGtoDZbHTVfabek943AWpFObaTo7DU=;
 b=a4JLnvyuFpjovb56tuSAoTHG/WcCdI1sXLJ3V4TLulMJf2X9UrU802wgyZHDit034HSBDIvHOHQynnL7nkfRgJVFsOke41tBSF7bvC67f+zZy892eJd0OxuYzI2Tp9byHmD54hsg9tyMrxzAc0IoHVADsrKwx/NKul6RIMkAry0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Thu, 29 Feb
 2024 10:33:23 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8%5]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 10:33:23 +0000
Message-ID: <785c1505-2730-41c4-9101-85de927701fd@amd.com>
Date: Thu, 29 Feb 2024 16:03:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] platform/x86/amd/pmf: Add support to get APTS
 index numbers for static slider
Content-Language: en-US
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
 <20240229073207.4092698-6-Shyam-sundar.S-k@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20240229073207.4092698-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::20) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 79efd96b-4e74-408d-62cd-08dc3911daa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46bFvlO6Z5zD21TLZOUQ+7JY/d3roFMt2fJ0IxLprm6NdfaeRe1VZjgLwlDz0wGxyGoIZdwnBLTTBjLs6T3wHxfLVtAGw+BzAVnOH1hWQF5XxMoqdIVzoUbCSFLJdjy98kgTS97vAqn/sLRVAXO24f7oAYRMfRLgu6duMbS35v5omif6fSy9sg4T53lxDuTXz0aHTM2twuKlmrVeyf2fpRNFhCcIblKlB7zJ3eFc4YmsHw/BlHoN9Xfq4BLkgde18kfp8RG8wxJ44BLGOWIjasxGs1FayM7Alwz44r3WJsxU+U7if/bDIZx0ZrIPjHVe4bQv7f5XMwsTV7JZxsM16G887CIpJpX7Tp+coVHzgFWC6QeOmBPNC+qouzlDOXJSq86bWaanUuW7zH8qcG9QaGLjuJuhuf+nMujywfuanYvNYLxBb5V3OlyHW6/KMvyTLAefDe+Z478hMq3tZCuVI95KYVIIIIAI01HJ0kH7crhlPeRCk3rBTLLyPXB1XlTBthozyWXtwfK+tNrc414fNSQj5UlOhoX0N7rCvMxMoe97To0d98/PjO7EpOJuVxzwkHBE6Ijs3ZPe5j3cEkO9inFg1eDX9+VJrzh0h+g89VdwUhPsPUhi63ablr21XYJc+BA6L2MI9WmtSLJv9lbYCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0dGRUpoYmwxVjRQUUZVQVE4UFo4Q0tRYUhGQml5MHZsUEpNZGFZaVVRSkhu?=
 =?utf-8?B?Wm9LcVlQRzF3bkdycFJKRElyWTZLOFBneDA5SnkxMVpVTFRmSDdSTnRtbjFJ?=
 =?utf-8?B?SGY1elZSY2NlQWY5VmpiZk4yNVFxbHZuM0FYc1ltZkJpb2NzdlZEN08xZld5?=
 =?utf-8?B?Q0JGMlNncDI4aXFIMnpLSmxmTjhrN1MvUzZxdE80K1B2TmxSMUY1NkxEVllM?=
 =?utf-8?B?ZGhTamdpRy90NnhScmplMFVOam9wZjVOTEo2Z2I4a3dJRER1TTVHZ01UVk5v?=
 =?utf-8?B?cmhoRXNJYkJWcHpWOU14Z0hEWDBRRndGR2dzOGV1dmFXV0NVbldyazFUZFB1?=
 =?utf-8?B?TG5BVUtWUjgyMXZ6SE0xeGRMS2pzVHNQWFBCaDFRRFlJUWsxa3pUNDZxRGZN?=
 =?utf-8?B?eG5JQW9Ccksya0hNZ2U1ZWhPYzJHTVVJdEFRVEl6SXh4aWk5VDFYMkJ3UThq?=
 =?utf-8?B?WE92cHBkZk1veFU3eTdYK085MFMxdVJCUHU4NDVKLytxTkYzTWpNRXNHbFRp?=
 =?utf-8?B?QjN5UVYvMkFvbnFyS05tRXVxcE1mMHMyampxejFVTXEyenpUQnFwYTVERXRt?=
 =?utf-8?B?ZGY5U1UrRmhUcGtaRDFMKzhLa2xSek9VWHRJNld0ajg5SGxzTDROTXhNWnpZ?=
 =?utf-8?B?Rmw1Y1BMS01LaFU3QUhlMWNmS2ZwMWRjdHIxOWplcmdqZUhGTFlRRlVKd2Jh?=
 =?utf-8?B?VllQN3YxUVZUdWdFeG1lR3cvbENmck5IZmZwZitmOFZxaGhLQWUrdDFpUEcv?=
 =?utf-8?B?OFVOWnRMTXNWNmczYTFadnRSSnI0MFhFeVcrWEdGdHY4TjVWVzJaV1NNdnQv?=
 =?utf-8?B?dFNIVGJud1Z1ZWJYZlB2RkN3cjJacUxIUVMxQXdXR1lySlZWU1V1dnBBdThO?=
 =?utf-8?B?ZGRpaW5LMjluM1QzaEFXQVVQT0FlWEQrNDJycVNnTzlXbUpzamlETVlybGhD?=
 =?utf-8?B?NkdyclR2OTUxaC84QTd0K2t4dDIwaksrNGR5aU1hNDVlbjVRRGxqalV0bEFz?=
 =?utf-8?B?Ymd6YVdlOWZyRktFdnMvT2hidnFuSlFFT2dkL20vWExZdkUwQlhhTVlYZ2Fn?=
 =?utf-8?B?UUJhT3ZSSUFzcjJRRnlRSms1VXgvN2FQOVJ5VVZGQ09JWGRXb2Erc3VIWUNB?=
 =?utf-8?B?M1E5NUVtalF1SVVna285bGNoRGpUaGZjU2NlSEp3aUVYQWIwVWJUd0ZoS3BC?=
 =?utf-8?B?SGNpTUZORGN4UnRhalZ3ckE3dWdYR3RKbXpYbzJ2aEZZajNINmF4RDhzdHR1?=
 =?utf-8?B?Q2JMNGZuZlNnMXpvR3RsdndocVEzbkwvVzc5OU42SUxVbEVVTmxJeTFESC9D?=
 =?utf-8?B?ZWpvQ01OQWltTlRId2dQRG1aY1RnNi9CY2pHUXE5QVlIakVBclJhcFZjcVdN?=
 =?utf-8?B?eCt2cWEwZVY2MTRMdHllaHMwclBLVXE0eVowYzRoNUl5V042dkU2R296ZktN?=
 =?utf-8?B?bEtNWEpzTjdXb3dpeHNjWlRBY2RMdXhCdCt1OXAyYk9wa0ltV0NhR1lSWVpZ?=
 =?utf-8?B?NFdnWlRKV0dHVUJNODNrODA4SHJ3SWs5eXhUdDhEN0FSNTBZdi92QWpWVUFJ?=
 =?utf-8?B?UHhEUHlhL0Jud2Z2ZHBWRFVYV2tpNVR6WFlYcHZYWVpmZ0hMLzNTQ2NpTXFQ?=
 =?utf-8?B?aFZOU1BpRHhaS05QdEVkclZRMFdySmI2NW44S0RLcm1HZFg5K3plV3QxeHlV?=
 =?utf-8?B?NEZxUmR6N3JYeTBUYzQvWFYzNHFMeDN0WlhpbGVrdHRTcUhBSWh1anQwaVY5?=
 =?utf-8?B?Ty9DZmk5cTVrOE92UUVTenl3Q2J6Z05ZV0VWMHhhWUxDZzRxY2hyaWtScHBh?=
 =?utf-8?B?aW9mZk1OeGR2cnlKSlZ4dmxwTWVRN080ZnRkMzNpcUQvWkNPQzFPS01RelNI?=
 =?utf-8?B?MjdiN1BaMUUrbmRwSEh1eTJ4WlVBUjdTYm9wSytZcHpBbEROK0J2MkQva3BR?=
 =?utf-8?B?VUUwVEpLRkVXL2hXZWVscVpEYjM4YS92RURZa24wcld2NGoxM21WNmVDclhm?=
 =?utf-8?B?d2IxNzhOeHB0MFNnTjBZb0lFZW15L0F1TzJheWhXQmptb0t6TWVhMjRkeHlX?=
 =?utf-8?B?Mys3WVhpWElOYU9uTHFOdi94aEprQWU2KzUrQUtuaHBveWQvVTREa2RDR25W?=
 =?utf-8?Q?VjR2pV/XXIMrxY6bjZidk0CpJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79efd96b-4e74-408d-62cd-08dc3911daa9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:33:22.8888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnrM+tAaRSmOlHvr2SWH4Czh4SMRbaBL0YJQbsWTyhUXyMK5V31ImiFBFoX2ZqHwAAUCx2fEOn0sRP/h4V50Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039

Hi All,

On 2/29/2024 13:02, Shyam Sundar S K wrote:
> APMF spec has a newer section called the APTS (AMD Performance and
> Thermal State) information, where each slider/power mode is associated
> with an index number.
> 
> Add support to get these indices for the Static Slider.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 10 ++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 25 +++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c  | 56 ++++++++++++++++++++++++++++-
>  3 files changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index f0360eea81e6..82dafe74fc6d 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -96,6 +96,16 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
>  	return !!(pdev->supported_func & BIT(index - 1));
>  }
>  
> +int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
> +				       struct apmf_static_slider_granular_output_v2 *data)
> +{
> +	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		return -EINVAL;
> +
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
> +					 data, sizeof(*data));
> +}
> +
>  int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>  				    struct apmf_static_slider_granular_output *data)
>  {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 5cad11369697..e1bcd9e80ab9 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -85,6 +85,7 @@
>  #define MAX_OPERATION_PARAMS					4
>  
>  #define PMF_IF_V1		1
> +#define PMF_IF_V2		2
>  
>  struct sbios_hb_event_v2 {
>  	u16 size;
> @@ -224,6 +225,14 @@ enum power_modes {
>  	POWER_MODE_MAX,
>  };
>  
> +enum power_modes_v2 {
> +	POWER_MODE_BEST_PERFORMANCE,
> +	POWER_MODE_BALANCED,
> +	POWER_MODE_BEST_POWER_EFFICIENCY,
> +	POWER_MODE_ENERGY_SAVE,
> +	POWER_MODE_V2_MAX,
> +};
> +
>  struct amd_pmf_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -264,6 +273,10 @@ struct amd_pmf_dev {
>  	u16 pmf_if_version;
>  };
>  
> +struct apmf_sps_prop_granular_v2 {
> +	u8 power_states[POWER_SOURCE_MAX][POWER_MODE_V2_MAX];
> +} __packed;
> +
>  struct apmf_sps_prop_granular {
>  	u32 fppt;
>  	u32 sppt;
> @@ -285,6 +298,16 @@ struct amd_pmf_static_slider_granular {
>  	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
>  };
>  
> +struct apmf_static_slider_granular_output_v2 {
> +	u16 size;
> +	struct apmf_sps_prop_granular_v2 sps_idx;
> +} __packed;
> +
> +struct amd_pmf_static_slider_granular_v2 {
> +	u16 size;
> +	struct apmf_sps_prop_granular_v2 sps_idx;
> +};
> +
>  struct os_power_slider {
>  	u16 size;
>  	u8 slider_event;
> @@ -634,6 +657,8 @@ const char *amd_pmf_source_as_str(unsigned int state);
>  
>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
>  int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
> +int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *dev,
> +				       struct apmf_static_slider_granular_output_v2 *data);
>  
>  /* Auto Mode Layer */
>  int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index 33e23e25c8b1..e4bf685269bd 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -10,9 +10,26 @@
>  
>  #include "pmf.h"
>  
> +static struct amd_pmf_static_slider_granular_v2 config_store_v2;
>  static struct amd_pmf_static_slider_granular config_store;
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> +static const char *slider_v2_as_str(unsigned int state)
> +{
> +	switch (mode) {


Apologies. I did not enable CONFIG_AMD_PMF_DEBUG while sending out
this series and hence there is a build error with parameter names
state/mode.

will do a resend.

Thanks,
Shyam

> +	case POWER_MODE_BEST_PERFORMANCE:
> +		return "Best Performance";
> +	case POWER_MODE_BALANCED:
> +		return "Balanced";
> +	case POWER_MODE_BEST_POWER_EFFICIENCY:
> +		return "Best Power Efficiency";
> +	case POWER_MODE_ENERGY_SAVE:
> +		return "Energy Save";
> +	default:
> +		return "Unknown Power Mode";
> +	}
> +}
> +
>  static const char *slider_as_str(unsigned int state)
>  {
>  	switch (state) {
> @@ -63,10 +80,44 @@ static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *dat
>  
>  	pr_debug("Static Slider Data - END\n");
>  }
> +
> +static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data)
> +{
> +	unsigned int i, j;
> +
> +	pr_debug("Static Slider APTS state index data - BEGIN");
> +	pr_debug("size: %u\n", data->size);
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++)
> +		for (j = 0; j < POWER_MODE_V2_MAX; j++)
> +			pr_debug("%s %s: %u\n", amd_pmf_source_as_str(i), slider_v2_as_str(j),
> +				 data->sps_idx.power_states[i][j]);
> +
> +	pr_debug("Static Slider APTS state index data - END\n");
> +}
>  #else
>  static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
> +static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data) {}
>  #endif
>  
> +static void amd_pmf_load_defaults_sps_v2(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_static_slider_granular_output_v2 output;
> +	unsigned int i, j;
> +
> +	memset(&config_store_v2, 0, sizeof(config_store_v2));
> +	apmf_get_static_slider_granular_v2(dev, &output);
> +
> +	config_store_v2.size = output.size;
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++)
> +		for (j = 0; j < POWER_MODE_V2_MAX; j++)
> +			config_store_v2.sps_idx.power_states[i][j] =
> +							output.sps_idx.power_states[i][j];
> +
> +	amd_pmf_dump_sps_defaults_v2(&config_store_v2);
> +}
> +
>  static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>  {
>  	struct apmf_static_slider_granular_output output;
> @@ -256,7 +307,10 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
>  	dev->current_profile = PLATFORM_PROFILE_BALANCED;
>  
>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> -		amd_pmf_load_defaults_sps(dev);
> +		if (dev->pmf_if_version == PMF_IF_V2)
> +			amd_pmf_load_defaults_sps_v2(dev);
> +		else
> +			amd_pmf_load_defaults_sps(dev);
>  
>  		/* update SPS balanced power mode thermals */
>  		amd_pmf_set_sps_power_limits(dev);
