Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB832263E
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Feb 2024 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709101880; cv=fail; b=psQi2p32Ie3na85ekm2IYqXRIYvJty0hHsE9Lfia3eMiVzgZELDtJuBMcn3n4obdMSIpg4h/SMnoJZX8g0aMLBY284ssGHI04sY7NLM2Q7pbKF4VLigTcMuoezL1BM4+XS1QEeoeeShPaNruiyu7M2MbxRRRB+TMiMiNtbn7k3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709101880; c=relaxed/simple;
	bh=HQX6ULP7A2B0QeSRv6aF5VkloO28cmlaKmhXSoMY234=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=snQQu5jPMQNRF2Gt29CbqMBriejxxwolonYv8+GT0ExYkGEBALN5RagUm0wCqbLSWcwZKcX8K5CkdRQWN11kWz1RB4w8asN+fqfM/LemNHMM7xaknGgWzM0IApqD8dbUZFGJmh9oEsn0dgnt8L43RmASfpjtwQ/HxSX8tfGoadI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D5QUA44+; arc=fail smtp.client-ip=40.107.223.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D5QUA44+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgfAQCb24dWVNL8zPMJhfjZ+RXEpxATbk32aKuWqVVmbSPDwidDzHRkRlumTlz0YyknWfAp0CSoYIDGASt+plcZIrydy6nOKHWtyAcSUXiQKdl+VA6l0olba5O+I9S/ESkSDtNcLBIpd7z4cc7diDoQHHOEhSAceRzNipJ3bnJdzzhaviblSTgQaCIV0xPGCK/WkqKUX/BDEV0bluV2yz2ccomPMrYDBfp24Fv4DayYE/xbcmrhQp725aQUWlsxWyj/roAGP8gEq3Lvcm/mt9Elk76QrhgttSZMgYF15AYHOQkMGlLAwgHpmUlaVSIOwpHpKVEoeppaQSvRHJAEi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcRPccLfUiQHDynxBw5Tc5BI+aO5NXhlhJ2CtIwOIcU=;
 b=IB28fQiTVEyxmO+9R6tglOHf02FdEpwArfiOHg4tGfQ7HgPD5stTmqNgOrT2mWmOPPCVpl/LmLUj8b+odz4Hy6DlWpyW3tuYn2ZtcsVohYog/AyM31VNVEV/xcxjJhL3MZBdBNE8wVMNv+iYwnvicer0ABFtjrXuw9ii7daz5BPhbN4BGXaVxO8ALwteF0ovP38fQp28H5ld/UUZZrUxCqV/SEPySAxbWGnKn8ukpj3Q8rPBFf9oEHTVxYKdKVOssrCTXqxJVL5LKrXuLtAunLyCIVvolxcW6n3eLP/V0la/fzwVQckTwIYByuAmst+PGZDr4QPT4U7daTR3vxaWEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcRPccLfUiQHDynxBw5Tc5BI+aO5NXhlhJ2CtIwOIcU=;
 b=D5QUA44+5kJswh4KkqkTjRYxq+oNQfed5FdfXyfdXaokyHALhvD6KuxBixPIoxSllqwWgTLCKxFY8zEh80uguu/xPuuqscr89Gf4eIS3YaACCKNvo+koxfvJ7V1I/gYM/q3/CpvvHGARieqsJsDnPdhGYYd9BUMBQ2baZQ7ckR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 06:31:16 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8%5]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 06:31:16 +0000
Message-ID: <b5976ca8-610d-4e50-b246-8049a3e00593@amd.com>
Date: Wed, 28 Feb 2024 12:01:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] platform/x86/amd/pmf: Add support to get APTS index
 numbers for static slider
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
 <20240227125520.3153140-6-Shyam-sundar.S-k@amd.com>
 <91a406cd-bf71-ab86-09ba-97d90f2ae1fd@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <91a406cd-bf71-ab86-09ba-97d90f2ae1fd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 0752f453-7ca6-418c-f18b-08dc3826ddcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lnAq2qE7unCjnggLgUHATQkBGNhRRuJeOeqJc2o6uEDGv1ZLeWvyOqtA9Kiu1TQbkvY59i+yNkbaoQyxpRfU3TRjbnOffKY77Xdg+S+Tcz3YxKVcVduJhzGy+cPSXi1lX/i8Ge4lPXJfTf2un5Tmcn+vHqg2Vbbolwxj7N9/iwXSxYa+lPZ0T80diL/R1FuAntePYF74bi+GOF4mpjIFacHdetcguge5Rb4zp7Tvk11mb1zzGIPnpMjnKAVYZw1+37Y/7rOu2Lf7DyjaulBDEwjfZ3Ov5hUv7j2yDugmmJ51okAnyaFjkFyV4J3Fve0G7rjoCT6Jo1HjuCJZnJNI9DtSoJGNpG9f/iAfzBfs+djw3y6bnFTJQzvPveUVEYsefzIgLLV1haw10Z5aEX+WGBUAJ1IGmFAFSXz+QVAQH7hDW2IwdWnfC8EZn8Zcrbzd5bgf7UBwcSKzVIlCuAJdslBQpwm8JibqmcbN61EXTsR6RSYmISlRGNd8kbpEQa1YnJsVFMzllvtw5SrFsIzfdTUGyH7IPW0Z+BHQLfFCIhwtlRa98ppMyihwRKKK6N8mJip/hKtMw8XAoK4OEbeuCUMG1kKY0Np6Z25YgpN1Hf2OXiznQfNZToXK2JMkb6C9u0VnmXkc5AiN+I6zD2yb+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2MvUFZWcC9xbEExV1BXakN1R1VYMmRqS0pXdVNxRlA4YkhFbVJqV0cvaEYw?=
 =?utf-8?B?VnorNXU3T0trT1VWK1RXZ3Q3aE92MlkxTUIrNXVFZzYvTi9zTGtvNmJyN28x?=
 =?utf-8?B?RzB0WnRzc2c5cm5VMDRxc0M2WDZWQ3duL0luY1Aza2hQalpOVG9RYkd1SlAx?=
 =?utf-8?B?NElxaDM5bisxNHlDUTVLRzUwZlZ6b0owQk5mQ2crY3l6MXFDZ20ydTQ0MnBr?=
 =?utf-8?B?QVBiMHd0MUkxbHRzc0owMGhuRjNTYVdOQ0M3QW5GMHhpTHR0clZJSVdSSU5G?=
 =?utf-8?B?MFloaGxOSTNkRGJMeFJiYzZxNVBscDgyOW5KNXJtYnExMklGYjI4ZUpSUi9G?=
 =?utf-8?B?WDZveTlma1dEbEs3ZGlWSW1VaHlJUTVpcjJnWmZPSW9MNFFsSTcrYnZFRFh1?=
 =?utf-8?B?cDdPUGVEckpHS0l6SXFYZ2M1eGhwR1RnQWVHZE9YVE1iZjVTeldtQ3NFdVFE?=
 =?utf-8?B?R0VpZnNMZ3B2RU9BYkE0aUw5WjgvVHZodnZ6R2I1TjZQVUtzSEszcFdWa2dr?=
 =?utf-8?B?QWlqSFpzUG5YcFFuMWxud25pYnE4ZTdwSG1UQ3UvU0ROM3h6WmRnSGlhd05x?=
 =?utf-8?B?WHdiRURpaklZR2RmaytCbjU5NUNPSjlKZEV3aHlNUHl0V3hRS0hreFFGRlVY?=
 =?utf-8?B?WE5mK2pscjl1My9reDlPTFlONW5sMkdRSGJJRVFhSDhweWwzSXFnZElham55?=
 =?utf-8?B?UHJQYVk2V0lmNlZWdXpkcFdWbXBGR0dHcktKUDM2V1cxbWlnMHU4VVVrM3oy?=
 =?utf-8?B?a2xPdWF6cGZYMEZ5WUlBcGpJNXd1M0lVMFVoOHowbFhobjRGb1RJa3FlRFB3?=
 =?utf-8?B?aGh3anRnRWVZSHFVMXp1aG1rZXBEazFEN2kvWmdzNHlzSDRiWkk5RUlqWXlt?=
 =?utf-8?B?VjhrTXVVTllKYlFxVml6Nk5OVks3WGpXTEdzV21LYzJxcFR1YWRNYldyTHEr?=
 =?utf-8?B?R1RSTW15Z25xbk9JeGQ3R3ZpdStUVnhobmtUa1dnVmhzSjdFZU1uMm8xK29S?=
 =?utf-8?B?NElNcjdMbzZXOUpjbFBNaE8vZ3BRNEdWSjBUSmk2WC9TeEdwUllNY0lKd2sv?=
 =?utf-8?B?N3Z5cVdvc0YzaCtCSGtmUHpZS2FFMHRPTVZyZHp2V3ZHdG13TFdiMnAzQitB?=
 =?utf-8?B?OVY1TnUxdDFiKzNxeXBSM3lBTDlqVXRlNnRBN2FQdnYya1lhalIxUWFEekdq?=
 =?utf-8?B?TitFYWNHazVqRzVtMVZVdXRyVS9vaytwdDJiSXpiTmlBQjRqNjNhTjZCMmFB?=
 =?utf-8?B?UDU4WDJ2S3M0UitvUEdvcm5CaFNCaGlLUml6b3I0aFJNOU14RUE4cGw2MTNk?=
 =?utf-8?B?VUx3YXdZakl4NnRjekdhVGZOeS9oZlpNYU9nSjkxL3NyYnJYOGZ6TkJodzh3?=
 =?utf-8?B?OXVJb0p2L1JNMXRqRjFyTDh5RDhJbVh6b1ZZa2xHY3BsdHVCMlVnMlhaYTN6?=
 =?utf-8?B?TXlMSFNwQ0VUSjFlTzFMNGJkMU9NTnQ0YzMveTM5bTZMZy9ScXBNMFYvQzdy?=
 =?utf-8?B?N3ROR2NiNE5MRDBiaDZNMVNkUkdqY3ErbkovWjhKaER6cVRHWUtVcnBUMUh1?=
 =?utf-8?B?ajl1aEVMVjFMbU9TbEpZMzZ5UnhQSlVjeDNyNFF0Rzg4dEZKWDdVR2lHQ1I1?=
 =?utf-8?B?UllDWWcxb3FtWGVCU0V1MmRmczR6RHhKN0hra2JBNDJJekNCaEhyNWgvVzR0?=
 =?utf-8?B?WlFDSjMzR0lQL0RpdXp0UnAxUWZaMklWMUU2c1dXZittcTB1UTB6b2Y5b0xy?=
 =?utf-8?B?QkN1Y2RRanNyMWQ0Nlp1dDJUNG1ZcFlVeHBiWUJOWndQZWdIU3NBZnUyTzNq?=
 =?utf-8?B?MUFralZHc1l3Sm1QOW9oUnM5N25jY1lYKzFsUjNUbktMV2RGeUI4QWlMMDVq?=
 =?utf-8?B?MjJXZ3pDWi8zNktKWWlkYTNXTHg0NE9mdmZCOVNuZXIwZFpOTisxRFZsWHow?=
 =?utf-8?B?VEJUYXE5TFZBYXdiRTIrZ1lNY0R0QzN0MmNUTEc3RHh5aGoyNDFWWXMvQ1VX?=
 =?utf-8?B?czNIRlFxOHlEOTNDdUZyNlM0eFhxRmxrWDBvRmkzMWVZT1VVRlBDeXFhU0Nn?=
 =?utf-8?B?QWdCWjRTdHlQcDhzcWdLbVFYUmFHSW9uckNuRnVxZE5RdVMycGlMdGFVSmY0?=
 =?utf-8?Q?WcpIR7ZxReJZ3RxjRN/xTdAx2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0752f453-7ca6-418c-f18b-08dc3826ddcb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 06:31:16.4244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6zWsiVJH/VoK4LLsKECmzp3kJs3ND8/cS9emaJGakP5WOSqf6SA85W3c8TTRt8ue0/qX6HVEckCYx4jv3V2MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530



On 2/27/2024 19:43, Ilpo Järvinen wrote:
> On Tue, 27 Feb 2024, Shyam Sundar S K wrote:
> 
>> APMF spec has a newer section called the APTS (AMD Performance and
>> Thermal State) information, where each slider/power mode is associated
>> with an index number.
>>
>> Add support to get these indices for the Static Slider.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/acpi.c | 10 +++++++
>>  drivers/platform/x86/amd/pmf/pmf.h  | 24 +++++++++++++++++
>>  drivers/platform/x86/amd/pmf/sps.c  | 42 ++++++++++++++++++++++++++++-
>>  3 files changed, 75 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 0fc8ad0ac3e9..28df45c058db 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -96,6 +96,16 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
>>  	return !!(pdev->supported_func & BIT(index - 1));
>>  }
>>  
>> +int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
>> +				       struct apmf_static_slider_granular_output_v2 *data)
>> +{
>> +	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>> +		return -EINVAL;
>> +
>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR,
>> +								data, sizeof(*data));
>> +}
>> +
>>  int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>>  				    struct apmf_static_slider_granular_output *data)
>>  {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 5cad11369697..b27e96aeac23 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -85,6 +85,7 @@
>>  #define MAX_OPERATION_PARAMS					4
>>  
>>  #define PMF_IF_V1		1
>> +#define PMF_IF_V2		2
>>  
>>  struct sbios_hb_event_v2 {
>>  	u16 size;
>> @@ -264,6 +265,17 @@ struct amd_pmf_dev {
>>  	u16 pmf_if_version;
>>  };
>>  
>> +struct apmf_sps_prop_granular_v2 {
>> +	u8 ac_best_perf;
>> +	u8 ac_balanced;
>> +	u8 ac_best_pwr_efficiency;
>> +	u8 ac_energy_saver;
>> +	u8 dc_best_perf;
>> +	u8 dc_balanced;
>> +	u8 dc_best_pwr_efficiency;
>> +	u8 dc_battery_saver;
> 
> I started to wonder if these could be made into an two element array with 
> 4xu8 in each, one for AC and DC because it would simplify some other code 
> in the subsequent patches (and perhaps even in this patch)?
> 

OK I understand your point. Let me give it a try. (I tried to retain
the same struct fields across Linux and Windows so that its easy to
maintain)

Will address your remarks on other patches in the series in the new
revision.

Thanks,
Shyam
