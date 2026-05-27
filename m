Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5663DD525
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874531; cv=fail; b=TNS4fyIPYrqOiM67HdZfIdflm4P8cmmAqEl+5zAdOE/X6RIKXje06MSappibKzTpndl43Wk9ThTp4aYExeNnifmKAmZ/lRLmTR2ZHh0jEJsdgZZNBVAD6qf9P8oxIhOyxR4gEyCysDhj/5iCCXZuhf3qWWfxQdgZuxhIFsIHjH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874531; c=relaxed/simple;
	bh=o3CZtr+PzRdCss3Qvn+Fch5Tg5mAS4Lvuo1sHio7aqA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u8yau6WWaAwvu/bymAqY5U5VgyoPBexdWQpB7Wbg6wdMdawIS5ef4bc4yiJtauuafwlJMHv1wq+4VSesa7AOYZfmnDVAg3KdRlGVBSGcLOqA4i4pk2tl58eNJLUdGQBUBhYbLuxzsEifXyzt4sxIAHPift8wSZTMI9nSAU8gwLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xz5TNmKP; arc=fail smtp.client-ip=52.101.61.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xz5TNmKP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNKIiJ9suPCtfZcTdr5E8AZFuHDOTK+d05vwk0djbPhfuK8b2BfPRX7Lwt5pgni/gDoUs1Pek80UZsKMPae9k+dWf9wYiTO28I1k9uOj98ITQFnfkZ4JyXWGpy2efGay9W/p0lCgbDxPoYLP6Zo0aIvn2yKIUa/2zPrJ7KRg7Bs51nxJXISM13FuR1+d13nIWqbjU5aIUpfkdXLHvV5Z8rWXuUbTl39vOH1OGlbjm7ZN/PI+lTXvmQsg0j5GcmJj6RW0O3sJR/8nK24Qz7j9mDWtvwANCEfqtTEGayj1UCMjYoqzlwDdEjcIgsGfaPys/iwotDp9QiphO9Y//JqmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xwmxXy3egOPUoD6nLteyAlu1UoOAOvtggWx7Gau2qg=;
 b=QpYh7arDn/XBZ7oJ6RIRlTp2dhDCjZOwq4mOOy7+73YkmgiFAUc/UpqILvsixR4ZLzyGTlVWF+iE2VUsXrEaJdAD+GVK5+9W1ogMn2ver8As0UrhKr9KToVsrTs6xvRDA87Y0KkQwbN59x+WeZX/qSt0END1Uv7EKnf4nyXqZ/YuSuAb7i2cuYPvSO1NHTRCoM70s1joWeKiokL0X2FIQ18MusnVneQgE8S+la23RbJbp0hzrMUbq68qW/oFK2O0/n7vpmSWbcTnGDQTxpZQCq9L4AwzX73oAnJ7kN9lhYp2iXg/VUDwBLM03qmLz5btER1YeqIPsz7DaHPnjkYZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xwmxXy3egOPUoD6nLteyAlu1UoOAOvtggWx7Gau2qg=;
 b=xz5TNmKPMZ4D7xERGTgRIQHeD5cOiYF0biHptBM827X0hGGodY56Cywp2crF88dwHNBvY+EnlrUfe73oN3rsWnHzOQ/8DtpLPXA7Sbub7MXseyTMsRVIqICOM9+hV0J0lxTNl9JJ7mcwxv9WRNlrmybrVCyahkYBaEgB1MsF+Zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 09:35:27 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 09:35:27 +0000
Message-ID: <16c4b3eb-4e14-4c6c-9571-d3417676e453@amd.com>
Date: Wed, 27 May 2026 15:05:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] Documentation/ABI: add testing entry for AMD PMF
 character device interface
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Sanket.Goswami@amd.com
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
 <20260520185424.770772-9-Shyam-sundar.S-k@amd.com>
 <ae0ebb59-cd50-73fd-db35-6797117e8d1d@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ae0ebb59-cd50-73fd-db35-6797117e8d1d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 6389cfa4-7998-4dd2-f1cf-08debbd348c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|6133799003|3023799007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	n6KeFBFGmqKm7tkKtn5TyRSzlPmlenya12oAoAV7ny+N6N04bZh+eRWx790zWfcVCsaKIxJD1urIhvoD1n/1NRbCyiiLzgyl7oN6XqyAf65sH6Swp0pLTJJ0Ite7+E8sNEaUB+J5pxikP2Ri1Nr6mK2Vj1z6gKM5uP4rZfd+NqAnecpG1hCIwLxOeTavNR7ah1XJknkGGxxhpPr6aE67nvuYs4dC/ABs9xNNgzn/bcg0rwb+MuezsKdIl5uPJf0UqXhM2+1G0VP4Qsgs9J89jBGrtJadgkIEMarytiEX+Nx1zMJlUsr5cz1e4J5QbJAk/Zg8JY/PncnqpjLaa1/3423mJyDP1I0BTpSeSkhWk9iJZ0bkeiL8DKiCaGWEy6RfseearHbujGedJUh412OutZCWzfMztk8GlutAay+0ugQgkS2tmt7uiZGJDd6a1Y1XAoK+aiFNdKg09UYcWDOpP6a214eQ3t52tMr6fMwR+8RtK+55bn+mAot/19a6T8l2SAs28+TuJp9IdfuI3qTZMBIr411IoMClhM4FTPEtIQ0Z8SCO73cYszryLTkm00hPQBcjSNF1cgqC1V0lwfGALls17R4oDMqo3jAIrHOp4D8As5Gl8awe/e0VefPuPwHcd1tp+ECOouxEwnQTNCcutsh0GjDYGhTRsieZKFsrK0DNN565oC3BmugzlW+SU842
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(3023799007)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1E2czBMZU5FMFVpQ0t6MzlVKzJRdnVVOUVWbjhSYyt3VWVQNHBiZ2lmRWx1?=
 =?utf-8?B?WVdoc2VvMEI3UFQ2ZFpSdjE5M0RvRjBJMjRVYjlDdkgwUENlaFRWZVQ1NmxS?=
 =?utf-8?B?bVFjUGFLK05GWUt0cTFsRWh5S2ZTZFFvQnFMekhOTHFrNUJYcDYrSWFsVU43?=
 =?utf-8?B?NE55S2hHd0FTaGFGRi92VXduRlhOUXdKUXRySWd3TlVmQWFWMlhEVkZmSTh4?=
 =?utf-8?B?TVZPT01INE45RVVybHdZekNkblBxVTViR0xzY283TWhCcDdzeks2Q094Snhm?=
 =?utf-8?B?aXI3ZlJSdENDZE03ajhhVjNXK1FNa2NicmNqczkzZ0RRYVdwYmpWem9Ub0tH?=
 =?utf-8?B?SlJoamgzMVZ3dzVjVFBEdWs1dDNYWlpVN2YxWWFVaXBhYW42MEVRQTExS3g4?=
 =?utf-8?B?TXdQY2NPUGxkc2tBR3EybmpDSmFTUGtHV01yOThlQy91NVFsU2JmN1NyUHdk?=
 =?utf-8?B?T0hWUkMyKzlYYU1xalJRV2lrY0RHMnRJeTVOemprS01uaWFReFo2N25tWjZD?=
 =?utf-8?B?VFRiMzdSdVFmVW5oc3VXSjBTVTQwbnRjYWtlRy95TFZWYWZlNHRMSlRBZ3J6?=
 =?utf-8?B?NFpjQXV5dmNERWk0Smp0dS9hV0lIaEQrUlhXODM5WE5hd1hnWDcvVmI1Tm9C?=
 =?utf-8?B?eFNtZzlGOHFMbTlzS2ZDSlVBWVNPTzJ4R3Q3RW4zSVZ5VE9lZFhwRXlSNjdv?=
 =?utf-8?B?ZzMydW5vK2pERTNYbWQ2ZlpucCswQ0Z0R1lGb3IzWHd0aTNWU0VWcytGZFpi?=
 =?utf-8?B?VkU0bG4rRnh0N3FaQ29VZ3BxSzVsemJkalE5bWx5MGV0cnZBQ2gzS2JRNjN1?=
 =?utf-8?B?UllhUjYybXNmb3gzK2JtMnloOVFia3M3Z0k3WCtPZXNiY3U1Q0tvcXpUOGgz?=
 =?utf-8?B?RmpYcmpLR1VTWjlpOE94bDl2UXFpV3cwcXNuL0pTbE5KSlpWcFYydjlzdFdl?=
 =?utf-8?B?ek9sdlFZaHhEN1pyMU5ZQU9JbDZPOWtiUytscENtTzB5Z0tONmFpRkJ2U1Ru?=
 =?utf-8?B?YlNBa1oyMURvcWhOVjIyYmJEeWhEUHFjRXNpZEsyR3ZtckRQVUJkR0g5d1Jp?=
 =?utf-8?B?a1dOZ3Z6aUZvQnIyRXVmcllNaWw5dkdnNVNqdHk4WHQydmtpaGlqdTNYb0Qv?=
 =?utf-8?B?eURiMjhHT0E2OTNzVUsySHdGT2NxMFpDblM5WkREcjhYRWNnT21Jai9xeTVv?=
 =?utf-8?B?SVF3VGtTNC9panRZMEpOR2djVGNCZTFubnNtM0JGVGlRMXd4MUFjbFVNNS8z?=
 =?utf-8?B?SU1FNVQ5WENuYmplbHB4TUdXZDJxdVRWOW1PK2hQU05SYUc2amYxVStycHJU?=
 =?utf-8?B?c281eUI5U3J3WkNWa1BCeUJ1U2RodTVxK1kxanRnSW5lWnhQaVRHa2NiZnJ1?=
 =?utf-8?B?bTI1UTNYYit3Nkc4Rmlkby9uc0dwYUt0UkZlaWFWMFYwOEJVUitrTWtJbWVz?=
 =?utf-8?B?aGR5Sm8xV2swRlVZZng0Zm1SOUlyblUvSldPRDMxT3JSTXpCMXlTUW5mZ2V2?=
 =?utf-8?B?VDR2V0h6NTVNSFNSeXZFMWZHMFdYWkZNbmlsbTUrb0JNZ3l1U2Mwd1ZwMTJR?=
 =?utf-8?B?NFJDVWNzNFlyQTdSdWlQRHpGOWpMY2l0Z2M5aXBnV1U1d0VWaXE0Q2FBZnZT?=
 =?utf-8?B?MUJKQUwwcnVUcDJGTXduWmlCSHZ1V1RULzNuLzNWaGw3cCtMT1loLzd2dk5o?=
 =?utf-8?B?RlhJU2FOUTlXYjZadUFqTTRVUkdQTFZwL2tzNi9iSmE2NVF2ZFVzbmRlV2Iw?=
 =?utf-8?B?YXJqd3R0YUNTVmkyQ2pIRzdmV1RKSndremtSUC9hdlJEblpLT2N2REdMUHh6?=
 =?utf-8?B?L1NVZFJ5RjM3c3ZISkwyRUZoelZRcG92UkQybUEzVFRMdlgrQ3NsZWdUWGI3?=
 =?utf-8?B?VGdvOHBHb1gybFNSR0N4aHhraGw3aUFrZnl0ZFo4NHc1T0tkclZ2Z01NdUlT?=
 =?utf-8?B?Y1FhQ3FKYkFsRngyZzhsZlc0MEkzQWRHL2t4L2hCVEI1djU2d081SXE5Qk1E?=
 =?utf-8?B?b1I2dEZ5VWJFMUZodHZDY0pJK2ZHVDZwazNhYnNhT0pRd3JqVDI5UlJydWVL?=
 =?utf-8?B?VWViUHFhY2cxMFpoekh5SXpINHlGVmNkTHZJVFJzcXhLV2t3clBPL3dPeGRN?=
 =?utf-8?B?NnZkWFg2bEsxZlZwMC95Z3lJOEw1dTdiNzNSdjFRczEwVGFwL282c1pHN3Z5?=
 =?utf-8?B?TzB1aWFRNjJ1c1lSU3ZCa3VBRjNzZWdkMzN5RmVIeTNnNjk1OVF2Uk1IYjM5?=
 =?utf-8?B?b0xFZnBuNFRraFNNaGZIOEtNQTh4aWhyVld4MytIRnE5OC9YQ3dyQ1EvTmVG?=
 =?utf-8?B?WU4reSsxUWlnWUxEcXBjVXZtVVVEWXlpTEJiWG96b0cvRkp2Uisrdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6389cfa4-7998-4dd2-f1cf-08debbd348c2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 09:35:27.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAytEye4Sn4VO45KjRhkMU6tONze9bPyMojGIlE3+gdGG3lRgwKr6q2kMep8o6PyF2/P9xF1ZTTmkQdjfP0jDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962



On 5/21/2026 16:37, Ilpo Järvinen wrote:
> On Thu, 21 May 2026, Shyam Sundar S K wrote:
> 
>> Add a Documentation/ABI/testing entry describing the AMD PMF util layer
>> character device (/dev/amdpmf_interface) and the initial ioctls used to
>> query feature support and metrics data information. This interface is
>> available when CONFIG_AMD_PMF_UTIL_SUPPORT=y.
>>
>> Also update the MAINTAINERS record with the new UAPI header.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  Documentation/ABI/testing/amdpmf-interface | 74 ++++++++++++++++++++++
>>  MAINTAINERS                                |  1 +
>>  2 files changed, 75 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/amdpmf-interface
>>
>> diff --git a/Documentation/ABI/testing/amdpmf-interface b/Documentation/ABI/testing/amdpmf-interface
>> new file mode 100644
>> index 000000000000..45606907f7e6
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/amdpmf-interface
>> @@ -0,0 +1,74 @@
>> +What:		/dev/amdpmf_interface
>> +Date:		June 2026
>> +KernelVersion:	7.2
>> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +		The AMD Platform Management Framework (PMF) util layer exposes a
>> +		minimal user-space interface via a character device for feature
>> +		discovery and metrics monitoring.
>> +
>> +		When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver creates
>> +		a character device:
>> +
>> +		======================
>> +		/dev/amdpmf_interface
>> +		======================
>> +
>> +		The interface supports a single ioctl:
>> +
>> +		============================ =======================================
>> +		IOCTL			     Usage
>> +		IOCTL_AMD_PMF_POPULATE_DATA  User passes a struct amd_pmf_info with
>> +					     the size field set to sizeof(struct
>> +					     amd_pmf_info). The driver returns all
>> +					     available metrics and feature status
>> +					     in the structure.
>> +		============================ =======================================
>> +
>> +		struct amd_pmf_info layout:
>> +
>> +		======================= ========== ================================
>> +		Field			Type	   Description
>> +		size			__u64	   Structure size for versioning
>> +		features_version	__u32	   IOCTL interface version
> 
> Where does this come from?

Nice catch! Will update in v6.

Thanks,
Shyam

> 
>> +		features_supported	__u32	   Bitmask of supported features
>> +		platform_type		__u32	   Platform form factor orientation
>> +		power_source		__u32	   AC/DC power source
>> +		laptop_placement	__u32	   Device placement state
>> +		lid_state		__u32	   Lid open/closed status
>> +		user_presence		__u32	   User presence detection
>> +		slider_position		__u32	   Current power slider position
>> +		skin_temp		__s32	   Skin temperature (centidegrees)
>> +		gfx_busy		__u32	   Graphics workload percentage
>> +		ambient_light		__s32	   Ambient light sensor reading
>> +		avg_c0_residency	__u32	   Average C0 state residency
>> +		max_c0_residency	__u32	   Maximum C0 state residency
>> +		socket_power		__u32	   Socket power consumption
>> +		bios_input[10]		__u32	   Custom BIOS input parameters
>> +		bios_output[10]		__u32	   Custom BIOS output parameters
>> +		======================= ========== ================================
>> +
>> +		Feature Support Flags (features_supported bitmask):
>> +
>> +		=====================================    ====  =============================
>> +		Flag				         Bit   Description
>> +		AMD_PMF_FEAT_AUTO_MODE		         0     Auto Mode feature support
>> +		AMD_PMF_FEAT_STATIC_POWER_SLIDER         1     Static Power Slider support
>> +		AMD_PMF_FEAT_POLICY_BUILDER	         2     Policy Builder (Smart PC)
>> +		AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC     3     Dynamic slider on AC
>> +		AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC     4     Dynamic slider on DC
>> +		=====================================    ====  =============================
>> +
>> +		Return codes:
>> +
>> +		============= ============================================================
>> +		Return code   Description
>> +		0	      Success
>> +		EINVAL	      Invalid size or parameter
>> +		EFAULT	      copy_to_user/copy_from_user failures
>> +		ENODEV	      PMF device not available
>> +		ENOTTY	      Unknown ioctl command
>> +		============= ============================================================
>> +
>> +		User-space tools integrating with AMD PMF to discover capabilities and
>> +		monitor real-time metrics for thermal and power management validation.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 839e39825455..ec061cd127b2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1216,6 +1216,7 @@ L:	platform-driver-x86@vger.kernel.org
>>  S:	Supported
>>  F:	Documentation/ABI/testing/sysfs-amd-pmf
>>  F:	drivers/platform/x86/amd/pmf/
>> +F:	include/uapi/linux/amd-pmf.h
>>  
>>  AMD POWERPLAY AND SWSMU
>>  M:	Kenneth Feng <kenneth.feng@amd.com>
>>
> 

