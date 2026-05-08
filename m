Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013057.outbound.protection.outlook.com [40.107.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D932ED34;
	Fri,  8 May 2026 05:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778217153; cv=fail; b=RrQw23mnSLvClJqyk05WjaS3NTYXh4SOMyj/xzTpkzONSQv/3pV+d5LCoSiso+KpQN8/3V995xLhK/rc1iEah6o1w9AppRe+Wm7f9Mqfit/1z36PYak1S/EsC67KmDASLam4m93gMKqt8agX4OieHDNfNDkqmcjZrkHP02F2PfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778217153; c=relaxed/simple;
	bh=t2CgK5xwZtDeHNqGjWHDG9r8OBkrVZRva3emEApTR88=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kuaninL+GoQNBJRqzNNooDVdOOJYXgIBDlmETSpRdqnmKdVzJiP5k6j+cQolswfW43TKzF712x3ekGeiKwvj6JzurdJX/R2vHLtKvBEdU0ezLgM5sIVVI1thSrnWBNOAs8kcoG1R4YMUFGLalSZkq380m/AoJ+RV9qQQBleMWsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f1nA1Fhg; arc=fail smtp.client-ip=40.107.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f1nA1Fhg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdTMK7orcfwf18lyR+tlsTs4tD6v3ggdHRQGW1OFtUItzN7H1u7d0Ysn2H6GL3DdBrxt/R5y0Pa1ifo6d5944RC5Osd+7BTN9b9Fyp9CZejqsyCS5nNZ8qoemfHipyFHstEejrqHwjEiyd8upCHdZTdsyp2FODKd2xFK5yKZE1Zn9MPmnisDf3x7LMDm2SXwJwl9dO1pRLqIQ7U64n9DBtO7MOBXtwzmnGFCs+4tieutNUGkU19e8GidkJOGKCwtqjf9w3eLYqGNwfrfHvnD2OumChtM3n9PPqwWuwfoG1lOJibCPRbGa9VoXp7l8dEY+b+A6EpM8t3jYgbpDRaBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/qWKQl5sHE7QKI3/xuHfmg0r8q2YWoyzoqh3eIBUac=;
 b=nFHhzk0DsT06Dq/xeSDWQ/Vxbf/KFfi2jPhXiSPp0zueiUWOwQHssLl3DsB+3M9d1qthfv+4x1yb3hZGEYNr7muydgTXKM51WVJbxSVUOHlz7uacjpUWpl0dE59FWRUQLZESp/jA0nyjOH+zSDResz0Co6pqQ4BgFwlNpyXWxHfGD3Os1mSEpC9SnbHSCyLrVzDeUWI40hp1K/Tg2ewSFhfTNGMKTO2SxfjolX1CvEFZB5XlmqJZ7Il8sqnhBEGbPRPO40zO3rWxj3vTFy74TIcMLknEVat8Q/2fx0vh5SpwV49133m6tx33vFDDLJ/1Z/t24QUDq0de9odoMdk/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/qWKQl5sHE7QKI3/xuHfmg0r8q2YWoyzoqh3eIBUac=;
 b=f1nA1FhgQ37hQl0M+uAt3I8CUwFyYZ6nWbLNokuQBm9mrD4cr1szZRRegY568oXgbP4nIzXAH80ho7HIMzgPgQ7ewcx9UIZn8jmV03c1sPAO4SjhBl/HT0L4EAOK6eLMe4nxjD2oKEBz/FYjzoBdiZbMPNs3BEvtk3tGo3zipqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CYYPR12MB8990.namprd12.prod.outlook.com (2603:10b6:930:ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 05:12:28 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::144:144d:8be3:b980]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::144:144d:8be3:b980%4]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 05:12:27 +0000
Message-ID: <b9a9968a-eef3-47af-9f0c-9b7b6e71cfba@amd.com>
Date: Fri, 8 May 2026 10:42:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] platform/x86/amd/hsmp: Add metrics table support
 for Family 1Ah Model 50h-5Fh
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com,
 gregkh@linuxfoundation.org, rafael@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-3-muralidhara.mk@amd.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <20260427155129.545327-3-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::17) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CYYPR12MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1cd7dc-145a-441f-ea0e-08deacc065ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	QM/CGqLERIM/x9t2mnkz61kEHGxFCFZOlDtO7dR/8/sJef/CTz43CoQEqkcTEE5WYSx1uR00wu40sdiOHEk9tlLj11EOHXsaFd3vR1QoRsdHS24qH4lajjgo8vXhFcYHyb4KE2KuR55H0OSBbJ7vXH5l+8p4NS+JkVcfIwuVti/Cd9VNmS4nA5qUDhYgOjED0phJwXlIqeFVnq8UfoLbt6NhNHM5M9KgSSr9C1+ZRsp70B4BW1NSstjSulTDSmeNBHdUVov+AvWHDOAbVp01PD1Tz0LA4aBzg8JCUdidL2FlCbFsebPQmrEVocr3sq/EmmAYQDckwZeW2O80s1sIey7Bwg2OQYCryiTgfLBUgO3qkQBOEWi0L38+mnsqzMk8rnyBL+GqYGEDKvczYsjxWzlkNSOv9RGWZtoxdRZiig6yuwotDp7DgDVCwsaLozQK6oYpnPvOBcpU3wbodxFutnVFX3K1DCYg4YY0f7OvAv9ej0qnZqZtx4tfgzwo3D6XqtDJHXCCx0V/Jv6FzQ9EAwKg2sMvQOPXevpqJzF75I+WxqWrgwcHv5S9x3QFBXvw/GmWPdUWTuTzH5en5yawpqAX5gXKtEufLUx2N3ZB1hsEAqH/xD82AUrHirQdkvFluTksadCcqtiwZNct7XGg2Q378mROeV9F+XrYAuivg+KMBEO+pW2G4S/ejgHXkA1y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU5qenF6RW9RRHBuTXRzOWJEZ2tnNDFsWVNlZkxjaGViVmZwdGlZWEdOeUI5?=
 =?utf-8?B?bkxpa0Z6VGlOalFOVHh6RHRLOG9zQm9CSDdBQ0wxQmRPMWIrWWVuMzgzczdw?=
 =?utf-8?B?d0VNZ1drWUFqTzNuWVF2SFVXS1F0QzZIaHV0a29kbmxhV2VUbm02Z0dQdHRJ?=
 =?utf-8?B?MEdHS09Kdk9WUFc4VHpuS1lpMlF2S3VZRUxDamtsdWJQVXhsajNWUDVMcVNT?=
 =?utf-8?B?WWsxK0YwaTV2NEZINzV1YlNPWFhNZEw3S2pLMnIveHQ1REtWK1VRWlN2eEhl?=
 =?utf-8?B?UnJuc3l4ZjVERllkOVBmVll4a2g5TWNwSTR3T1Nvc3RYZ0F5RWUzK0pRWmtB?=
 =?utf-8?B?bjJ4WXBQbGJnNDdlZzR6UVJneHo4UVd1N1JSK0xXcFgrdGZ6QW9vTE5VQTdo?=
 =?utf-8?B?cEM1NUVia0ZVakxyYkh2bjRDMktTN3hIbWk5WVAxUzJzdmp5Mm1NWVh4dDBO?=
 =?utf-8?B?aE5WbTJCWC91RUJsR3E4QnBEV015c0lyc2Q3L2tCQ21odmx0L3dlNkNNeGhq?=
 =?utf-8?B?Y3o5L3VLcUJEOStlaHdva3NXZ05tQ3Y3OHhOQ1RyYmxUMjdHVExiUkdSaDZq?=
 =?utf-8?B?R3JDL21xSmh2bnoxdkNNL2tYU21MdTlFTEgzLzdyRnVtRWZVWm5ORCtiZ21k?=
 =?utf-8?B?UklyMW9na0x0anV5eDM4SURHWExDU2J6eGo2WDhHUHgzVDVQQ3pzY2Zvbytw?=
 =?utf-8?B?V0tDaE9GdzZIT0tMZjNwVUpyNUV4N0tjWFFzRFBwRytUM29MTUQ1bkdrUWcw?=
 =?utf-8?B?ZS9ZUDU2S2dFbFozMlZQUWpnbDZVVzRZcFczWmhncTNTNE0rc2Y5NGlPMWFD?=
 =?utf-8?B?T09aeXpxZ2N5TDJSZk5pWCtsWE9ZYjJ6d01YUXFlWENpeFZYYWc3Q1luYmMv?=
 =?utf-8?B?TWpXNkhwd0NndzVBaDVaUzdCc0M4dHRZaHNZQmFkRVU4cXJPOGpjRjVMREtB?=
 =?utf-8?B?RXFTWXdzamxib0ZPMytuTnhadi84UEx6TXNHbUR6aldWenBLZTFnUFNzZUdk?=
 =?utf-8?B?UFpqVGZtK292R2w1T3pTcmlKUVU0Q2dkV281WjVGRlRtSXpLdXlnYm14aEY4?=
 =?utf-8?B?WTRsUGkzZ01NZjM4YUI1Skk2V2x5cWk1dXhyWWF1dW5GcjBSaHRRb29OZEFq?=
 =?utf-8?B?OG5rUGovWGpKdHhYZk1TZUprUEhZRkdCdmZ2TU1KWFd4d3ZjaVFPdiswQ3gr?=
 =?utf-8?B?OWxPOG5JYWRLS05PV05uN3FGRFA2YTFubU5MVWNkd2Qxc1Jla1llY3c0VGhZ?=
 =?utf-8?B?QXFMYlRxdnluZnR4Syt5SWRYZWFTVE4zdWtraGZlVTljSlJ3NE5WRU90Mkd2?=
 =?utf-8?B?aWgrWUlheHMzY2pLVi9nS2tkWlVJVFJDMlI1R0lIbWoyQllNT01ONDlKWGVZ?=
 =?utf-8?B?am5CaUxEaG5mYWFHa0FQbG4xdzM2eXYxQkZYSHN5OXRCdkVvckxxZnNuY0dk?=
 =?utf-8?B?YzF0MG5rRXdnRGpFejNxWTFnVUhKa09TbUtGTGVUbEpRTTJYdWs0L3hhWHh6?=
 =?utf-8?B?Z0VIcy9hTXF6ajQyWXRrdXhJcy9qSm1RbUtkaWJjdDZHZWI0b0RmdmcybVpT?=
 =?utf-8?B?OFdIdWFRUnJwdHZ1bDdzak9Sak5iUGk4bWpWcXk0a1I3ZW93d0NVWXJaampR?=
 =?utf-8?B?S2RCUVBDd20yeFM2N1U2ZldmZ2ZJS1NmcTZMWms2UGZISlRxWUgrQlRmQUEy?=
 =?utf-8?B?anpKdnZsM0M5bVF3dC92azdHSElySEl2RTU4cGtHUVV0Sk9DdXV0dWNybUtl?=
 =?utf-8?B?SHlrR01Wa0lWZldCd2NIdkE1dUdXRUpGYXNSSisxSkpVYlgxdFZSVk5ZU2pW?=
 =?utf-8?B?M0REMEcxNkRpd2hJTEl2U0dEQ3NJdEJGOUJGc2pmSlB6WldTbHFJbXpXV1k4?=
 =?utf-8?B?NEJwQ2gwcXkvRlZTMUV2TnBzbWM2Z2ZhaUk5VkxEUktXaGp5NTZ0UEp6a3BC?=
 =?utf-8?B?MlN6ZnkvTVV2d05mM0dTd2RBdmQzbEFSS0JESE13d29GZXhSVml4cjQvb25I?=
 =?utf-8?B?V2V6TkpRQUVRWDR6aE5WWmZSR0dsV05sTlZOTTBHWGUxWXJ3ZXhIcjE0dFk1?=
 =?utf-8?B?YWdWRlpBTnVNMFFSaHJSSldNMDdmTlpoMGJ0R0xEWDRaK2RIVVpkTzlQNlZw?=
 =?utf-8?B?eG84bEtocnV5MXVVYTlBYVJQV1M0LzBNNWN3c2VCN1lnRGk4empTalFORGM2?=
 =?utf-8?B?SlRQVHZLMndqb2ZGL0RaRTR6aENzY252eU9PYTR3SlJWaXZYb0FjWkk2dHk4?=
 =?utf-8?B?VkhOM0JQbWV3M05Ib1M2UzF0RHd3bGFIUjhwL1hFVk1sVHF4T2dqSlN2ZnZi?=
 =?utf-8?B?YWFYNmYwbmVtbDZQRmxkbWh5ZkdHdHBrdHdRY1NORmxiM0ZtZU5SZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1cd7dc-145a-441f-ea0e-08deacc065ba
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 05:12:27.5829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1W8IesFk4Oi0N4aRTkmyBudR6+liNYNcTH5y0+LNBRzDWtW3NbTjnrhSvRKdhjjelhH5Tn1IN5RkRDGv38WI2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8990


Reviewed-by: Suma Hegde <suma.hegde@amd.com>

On 4/27/2026 9:21 PM, Muralidhara M K wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Define the UAPI structures hsmp_metric_table_zen6_iod,
> hsmp_metric_table_zen6_ccd and the top-level hsmp_metric_table_zen6
> to describe the per-IOD and per-CCD metrics layout for AMD Family 1Ah
> Model 50h-5Fh processors (HSMP protocol version 7).  These structures
> allow userspace tools to interpret the raw metric table binary exposed
> via sysfs.
>
> Widen the ACPI driver protocol version checks from
> == HSMP_PROTO_VER6 to >= HSMP_PROTO_VER6 so the metric table
> sysfs binary attribute is also created for protocol version 7 and
> future versions.
>
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes v1->v2:
> Split the change
>
>   arch/x86/include/uapi/asm/amd_hsmp.h | 88 ++++++++++++++++++++++++++++
>   drivers/platform/x86/amd/hsmp/acpi.c |  4 +-
>   2 files changed, 90 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 603d62f8d4da..da3e3bbfa33e 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -575,6 +575,94 @@ struct hsmp_metric_table {
>          __u32 gfxclk_frequency[8];
>   };
>
> +#define F1A_M50_M5F_MAX_CORES_PER_CCD_32       32
> +#define F1A_M50_M5F_MAX_FREQ_TABLE_SIZE                4
> +#define F1A_M50_M5F_MAX_XGMI                   8
> +#define F1A_M50_M5F_MAX_PCIE                   8
> +#define F1A_M50_M5F_MAX_CCD                    8
> +
> +/* Metrics table (supported only with proto version 7) */
> +struct hsmp_metric_table_zen6_iod {
> +       __u32 num_active_ccds;
> +       __u32 accumulation_counter;
> +
> +       /* TEMPERATURE */
> +       __u64 max_socket_temperature_acc;
> +
> +       /* POWER */
> +       __u32 socket_power_limit;
> +       __u32 max_socket_power_limit;
> +       __u64 socket_power_acc;
> +       __u64 core_power_acc;
> +       __u64 uncore_power_acc;
> +
> +       /* ENERGY */
> +       __u64 timestamp;
> +       __u64 socket_energy_acc;
> +       __u64 core_energy_acc;
> +       __u64 uncore_energy_acc;
> +
> +       /* FREQUENCY */
> +       __u64 fclk_frequency_acc;
> +       __u64 uclk_frequency_acc;
> +       __u64 ddr_rate_acc;
> +       __u64 lclk_frequency_acc[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +
> +       /* FREQUENCY RANGE */
> +       __u32 fclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +       __u32 uclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +       __u32 ddr_rate_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +       __u32 max_df_pstate_range;
> +       __u32 min_df_pstate_range;
> +       __u32 lclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +       __u32 max_lclk_dpm_range;
> +       __u32 min_lclk_dpm_range;
> +
> +       /* XGMI */
> +       __u64 xgmi_bit_rate[F1A_M50_M5F_MAX_XGMI];
> +       __u64 xgmi_read_bandwidth[F1A_M50_M5F_MAX_XGMI];
> +       __u64 xgmi_write_bandwidth[F1A_M50_M5F_MAX_XGMI];
> +
> +       /* ACTIVITY */
> +       __u64 socket_c0_residency_acc;
> +       __u64 socket_df_cstate_residency_acc;
> +       __u64 dram_read_bandwidth_acc;
> +       __u64 dram_write_bandwidth_acc;
> +       __u32 max_dram_bandwidth;
> +       __u64 pcie_bandwidth_acc[F1A_M50_M5F_MAX_PCIE];
> +
> +       /* THROTTLERS */
> +       __u32 prochot_residency_acc;
> +       __u32 ppt_residency_acc;
> +       __u32 thm_residency_acc;
> +       __u32 vrhot_residency_acc;
> +       __u32 cpu_tdc_residency_acc;
> +       __u32 soc_tdc_residency_acc;
> +       __u32 io_mem_tdc_residency_acc;
> +       __u32 fit_residency_acc;
> +};
> +
> +struct hsmp_metric_table_zen6_ccd {
> +       __u32 core_apicid_of_thread0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +       __u64 core_c0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +       __u64 core_cc1[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +       __u64 core_cc6[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +       __u64 core_frequency[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +       __u64 core_frequency_effective[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +       __u64 core_power[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +};
> +
> +/*
> + * Metrics table for Family 0x1A, Models 0x50 to 0x5F, table version 0x00700000
> + *
> + * Future processors within the same family and model may support a
> + * variable number of CCDs and cores
> + */
> +struct hsmp_metric_table_zen6 {
> +       struct hsmp_metric_table_zen6_iod iod;
> +       struct hsmp_metric_table_zen6_ccd ccd[F1A_M50_M5F_MAX_CCD];
> +};
> +
>   /* Reset to default packing */
>   #pragma pack()
>
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 97ed71593bdf..8044df862275 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -244,7 +244,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
>   static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>                                           const struct bin_attribute *battr, int id)
>   {
> -       if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
> +       if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
>                  return battr->attr.mode;
>
>          return 0;
> @@ -491,7 +491,7 @@ static int init_acpi(struct device *dev)
>                  return ret;
>          }
>
> -       if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
> +       if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>                  ret = hsmp_get_tbl_dram_base(sock_ind);
>                  if (ret)
>                          dev_info(dev, "Failed to init metric table\n");
> --
> 2.34.1
>
>
