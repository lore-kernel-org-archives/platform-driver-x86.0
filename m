Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9F3C1D48;
	Wed, 19 Aug 2026 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158017; cv=fail; b=E0MToD6KxcbvFHYSidN0WIG6ryvu6nACzEHSbvb3FurHOsw1gmvEdFsi2EJjhSszr63MmzW3x9+drVf9nujMMUPCEXwils5nQtp3SMcLTwxdOlKo5gbr6popDW1YjZToZD22R1w/3BzpzgrcG9n1Y2ChKbIFHmMV11lD4LCKC1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158017; c=relaxed/simple;
	bh=yhzFQ8QHgrd3IrgzsbvQC4t5cwCj8yXmUcF+A6ZgGBI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aNKAAZ4hUbX/pex5Z+awsozjbG3WxSAO42v7xD6mylxdMtW/XfcEEPqBbUc1rNXgsgQe7FhpIATcGo5TvHapOAO9veeu3Y2EhZULEipOl+U6CLZ9PSPjMssurKk/ez7ktToV92g1a22x5whbPQdEiJpxxX1BdO3QTjphg0XiaT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qZENh7P7; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qZENh7P7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ua8rU1Sy5/jIaDF3R4X6eCw5HJyuILzMYtU+u0fLHCvEZIhu8I66TS/PC68wI1nNl37uOdIZgKPL9dZndfnTxSiGO+AMWb//9KcjfZc1w/lNfNbqnCulrUM0gVLWBphA7teo8lQ3TdelCbRwx3gIqMRmLt4N5+JbsbNih9lEUX7lgnfMvEUuvJS+q6GSQTe4Lx8u8NjnII0fvYUQ7SgkqeRx/9366g1/7SowsSANinZ6z5+/UzXxS0ETJaP8shsiRKK6GyTBbRLJuTYDLN007ZNp1tYX3BM+Z5tbKe9wcUbtpVmZTitKwvEw8XfQTG/EJ3GQmgyEkquZIkh5P5nqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EJcAotOC200Qe/KYw7Lhrqhy4s6QGXepD4HtwvhmLY=;
 b=oNrm3CuMy7ppY+rBc3i/xG42O87cak/wgSbb/jtUqWbFyjP0+kheHOuoPesayI6WYlbRBfthTQZCVTVFd1TK6YZxaL345lSlanBoQxx3xzWQ6/lYrTtVsJd9J1EW2Z17MSlwZAdmfSMr8gBiz6OiaWQRvbEgFU0JHNIMYxLWo+yF1VBTF1ePAcGFtCr2xdEOhbwI1SfOJUOh4wuVuENeDnTthTULWq6JqS1vPUXMvYUJhwVyxbyp6eF9CrSsHEoRobMwdcVU+vUG+EUfI/Tr0yya1nsDCF8twMgMx7Hnq7VAKonvsdPXMHLv9eS3GavlrsmoF8Na4oIq3zws105mXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EJcAotOC200Qe/KYw7Lhrqhy4s6QGXepD4HtwvhmLY=;
 b=qZENh7P74JjNzSVp5Qg7hh8FPMaj5ONY05U/lLaFehbv9o69sMaIpVZVAN8dT0gyVwRkc31twV7dpOOhxBUxv2UePQjh5GXe5CMMUS9tAJUzXEGFrx4bJtwkvnXnq0n5hy53lrxyImaiu6shRrXubmEP1wP3GFXCEPcVKaZab2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 16:46:52 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0315.012; Wed, 19 Aug 2026
 16:46:52 +0000
Message-ID: <227d88b8-9224-46f4-a92d-138d3b7ab60e@amd.com>
Date: Wed, 19 Aug 2026 11:46:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] platform/x86/amd/hsmp: Add ACPI client support for
 Family 1Ah
Content-Language: en-US
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819073157.2426504-1-muralidhara.mk@amd.com>
 <20260819073157.2426504-4-muralidhara.mk@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260819073157.2426504-4-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:610:4c::28) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|SN7PR12MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 93127b13-109f-443a-511b-08defe11782c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|3023799007|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EbKj7wrEGdEIbZIYpKMqGO+UtLuoaOcf4Nm+Y4VxpEzprcYM9rLxrfB8dttUkBJqoIp8x6HZpPCFpMXD7GFDPPNquiM2/fc9ivjHgxtUnxOtX2mbR2nabjI1MV7TT8uWdN7z+U3YFLMv2BRiFXUuHyJeVz/Y9LWPLu2UOtrOyZBKdH6hAa/RGPjmLXtlBTkrBHShuJIm5jtF8qo54k0stx/FmXK8SZPMxgmM919q6nybCIF9ep7TgnsUnNyZXdvld5Fxa0ihseQHPPou0ARL+Okw+FRaKFh9077eJ30jd1sNFb4VPASlWW2s9cmHS2iBojTPMYyq140RqFaCe1WHDezcqUtp4Tfqh1BimRC74BnhhUifUxy4CeBNZEEAbrk0tLrEI4ouL+Zcx1y992vA9mvXHyAzM8j9mtsqRRiINbCMLzPyY7hCVnJk0kaRqi3NkF+bftZrOLH7NBaeTGI0xTnWzlnmp9ZlM8LzQtXqP343o2X8EoPqXEGieWm+fgVa+oXaSzTnwcdgktkCYkFaFAI9xNbPi3mM6nj+c4DuMyA8KPnt9l/VNBpxKVANcr7CzfjvbRjnOhuGGfV/2KW8+yjvQGJmZWXTqsfjKTJxzGVVTxfwJXjBqH6AxK8d9CfrSzii2+0634yGO4sWdjEEtArDGE9FszlyZh9qRhXLb1A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3hiYkdUSDFpMStLcTR1eHkrU0I4Ny9WMGVab2hVdi9yVGZZVGJKcUNPSndM?=
 =?utf-8?B?NG1XOVFnc2tPT0hqcVB0NXVNK2ZhNTBjOTB6NjhsV3BIRHpQZ0FKd1VxeGdn?=
 =?utf-8?B?U2JNZCt5VXNla2lTNWpxaFkzRTF1aUZXVUNtbE1ETm1xQkJFYjlNbnFwdXBk?=
 =?utf-8?B?WXE0Z0swcDlRR2c2cEowT0paOTFRVVdMblJBY2lHVEQ2ejZjbHV3cGlucUFQ?=
 =?utf-8?B?WTRuYzMveXdROXNxVnFOREFvblkyYVluMENUT1M1ZTMxcStWM1NnZGFBTzBK?=
 =?utf-8?B?eDZJdVd4NFFOOVhmQlBEK1kwNVJSZUw3U2J2cEZzOCs5S01YWU5MRW1icGFJ?=
 =?utf-8?B?cytpSE9kVTBmNGtSQ2dHZ0I0bjhtOFJqMUNnbmwyWlhDV00yL3VETUdxNzRK?=
 =?utf-8?B?K3kwUUdHZHJ5Qm9VZHdMV0JzL1ZjR1Q2N3poUVU1cUE1Nm1JYVJuMm1KWHAr?=
 =?utf-8?B?czhyMG5xSDV0S2RMWU5QZHk5TXFBUi9Cb1pudmMvTmNvYW1ZRmdKOG1nM1dL?=
 =?utf-8?B?aWJNbjNCRzlCYUZIVDhnLzZZMHBYQ1lSVnRITUloTzdpUlkrM3FMbzU4NEN3?=
 =?utf-8?B?SlppVjlOZVpLMEJUUjdiSWNsY1RKeXhNbSt0UE9tSFYySVV4LzlRZlNNZ2dC?=
 =?utf-8?B?dkJ5SE9GY1JrNW9QNGU5ZjZvNjcrN0pIZUlOU01oT3F2anMvSXlVVE9LYzRt?=
 =?utf-8?B?b1BmMHdpSkIzcXp0OGVKbGJkNTUyMXR4c2w1N2cvaXpaZGxYV3VJWUZyaHlh?=
 =?utf-8?B?VWs3cmx4dFZwaGtPbXhBcUoxOFNndVgxY0VBaXBjTnBSTit0dnhKTURDVjlk?=
 =?utf-8?B?U0ZEbnRMVEd6NkFWcUtDV2VsdW9hTGNoR1BlVWJFMG5xcDdPSFd1NUJtRytO?=
 =?utf-8?B?NXVlaGNEWkRONTJEK0ZxU2Mxb1Y0TkRmTVRKRi91b2NHVHlsbnhIRHB0ZVFT?=
 =?utf-8?B?STQ4ZXJBeTBUMEI3a01pMEhSamIxRkphenFKS1ZOaVNrU1FtRkkrVmJvcm9r?=
 =?utf-8?B?b1N5Y0QvNXBvRmo2NStBc2hNa2huaHRFNHYwME5MQzVCb0pDZFRKT3EvYWJ5?=
 =?utf-8?B?U0loMDlhekZMWisva2QzY1pkRG04dzduV1REeGp6a3RobFRaT3JJMkt6S0JV?=
 =?utf-8?B?UUZVV0NjNTY0TytJZldsaVJ4UTdoNWFmWU1Na1kzMFFtRlQ0V0hjTG8vb1cv?=
 =?utf-8?B?b1pwMzdqd0VXRW1FVGQ4UEFWT2l4eVptM1VwaVpwUUZHb0dMazg3QWxKbXlO?=
 =?utf-8?B?aTRZSDBQVFEvcDNjL3h3TmxNU2VQUno0MnF6enh6Qms0WUZRWmFhdzJ1Z0Rl?=
 =?utf-8?B?TVU1TmRPd0wwM016WFNlSm5ZcHY0VmRUbkJ3UUMycHpndnBtUVBSU3dHc1JE?=
 =?utf-8?B?bUs3ZnhSRkFReHVBYkFHTU54M2lVQ3JlMmpySnpCMUp5SGtlMlJ6WVBzZEsv?=
 =?utf-8?B?cDVoM3FVdEVnRGRJMnpVZzVES1hwekdQQWVsRDhidmFTVGswelgxT250VnJG?=
 =?utf-8?B?b3Y2dEZ3SmwyQ0NZYXBMdTNsNlhlY25idytkTE5KcWM0VVVTMVlQWWM0dUg1?=
 =?utf-8?B?RDFWcFdsVExEMmNKM2pUNDVFdjFPYUNKdHkyWG1EWVFsUndLUG9jQ0EwbU5Q?=
 =?utf-8?B?MmF4M09vRmJDTVRDQkg3aThuOXViTnZDL2I4Vi93V3hwZ084Ym8xR0ZTV0pR?=
 =?utf-8?B?MjI0dndFNTRZRmt1dDVVUWtwMzIrWTZQZXMzWEVCQ1BBbkc2WS9tcHUrRSti?=
 =?utf-8?B?aTZrRGM1NS9tai9BTi9oOUw1MXoxN2RUbkl6SlNOUGZlK2NhcGZaNFg5Y3I4?=
 =?utf-8?B?dlBOT2dlMTVxMXNUZFBCMENhcmsyOW1RMXozZkxrczRxeHlJYnFmbmFiaks5?=
 =?utf-8?B?cTBXQnNRWGEvT3ZpbjRnSzc3dXRvc3F4d1Q4WGlvVHFBbHZaTEhDSERadTVX?=
 =?utf-8?B?MC9laDVyRzVQWFo2Nld1ZTlmUDUxMCt1eXQwVjBGY0o1RmN2ZmVRNmx3aUh0?=
 =?utf-8?B?RWo4ZHhnMzF3N0hML01FK1AyZ1JwMDFTZEtxcjRySzZlK0VEb3FtNVlyQi9u?=
 =?utf-8?B?S0JMZVhWSGpKVmlRQU1zN0NHM3pZMDF4ZUNwbHBTQjZpQjRYTVlZaFNiM2dM?=
 =?utf-8?B?ZjlSQzV2Z2Z0WTQ0eHAwUlpmcEVpNlRyeUlINHhSYnVjNkhjYU5kYWtja3JF?=
 =?utf-8?B?anhrVU1JTkpiU0xTS0dzUjlzc09qZjh5aUNlVDF2SzR6SlM0Z1d4T0lwally?=
 =?utf-8?B?RW5UZU5pS2VVTWhnZnNVa2psSHVoR2JSUHN6T2N6TU1DQkxvU1NlZkt1RWVI?=
 =?utf-8?B?V3RBWCtOb2pvYnhLTzB5TWlYclAweWw4L2J4STk3UzVVcExxYVhxUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93127b13-109f-443a-511b-08defe11782c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 16:46:51.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2le/AV8Qdb9R4gKUKv6b/376nRr77sAO821Qyq1BtcG4CaZDfyDoKKczRz3A1KHuFjxLTdOxQxZ/VK7QKpW4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002



On 8/19/26 02:31, Muralidhara M K wrote:
> The ACPI HSMP device (HID AMDI0097) on the Family 1Ah client platforms
> (Models 80h-8Fh and E0h-E3h) describes its mailbox the same way server
> platforms already do, via _CRS/_DSD, so hsmp_parse_acpi_table() and
> hsmp_get_uid() need no client-specific handling.
> 
> Client firmware does not respond to the interface version query
> (HSMP_CLIENT_GET_INTERFACE_VER). Instead, query the metrics table version,
> as it is the only version-related request supported by the client firmware.
> Server-side behavior remains unchanged.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>   drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
>   drivers/platform/x86/amd/hsmp/hsmp.c | 8 ++++++--
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 8257cd1da48e..275258ee86bf 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -557,7 +557,7 @@ static int init_acpi(struct device *dev)
>   		return ret;
>   	}
>   
> -	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
> +	if (is_client_platform() || hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {

I'm still not happy that we are missing HSMP protocol version in the 
client platform, but given the current status quo this makes sense.

I just hope this can get fixed in platform F/W and this commit reverted 
later.

>   		ret = hsmp_get_tbl_dram_base(sock_ind);
>   		if (ret)
>   			dev_info(dev, "Failed to init metric table\n");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 60889c1b1099..f35a891772e0 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -196,12 +196,16 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
>   	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
>   };
>   
> -/* The client drives a different mailbox with the Ryzen Master SMC message set */
> +/*
> + * Client firmware queries the metrics table version instead of the
> + * interface version (HSMP_CLIENT_GET_INTERFACE_VER) to provide a unified
> + * interface across multiple client platforms.
> + */
>   static const struct hsmp_plat_desc hsmp_desc_client = {
>   	.msg_desc		= hsmp_client_msg_desc_table,
>   	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
>   	.test_msg		= HSMP_CLIENT_TEST,
> -	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
> +	.proto_ver_msg		= HSMP_CLIENT_GET_METRICS_TABLE_VER,
>   	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
>   	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
>   };

