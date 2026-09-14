Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010010.outbound.protection.outlook.com [40.93.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AD0494812;
	Mon, 14 Sep 2026 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404136; cv=fail; b=dwwZ2lRhAg5NX2ddG9WC6EDRedg17pGrNmLNXi0M644Afw6txenRJvkp/5HuAvWPyc8wJWIl9XcJie99ZT7AXbsC4G/r66S3kAk6wTldQrSp5FrZkf/a8UqItirBwOJexJ8f4yUUeM4E5/B76dbud/cIWoS/eGr9UjU5wHeCDaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404136; c=relaxed/simple;
	bh=Y3OVJXZxdOqE6eWJhOBGdeDSu/WdG+irvgprHHHyuw4=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A9XLCAvV4UrMKDySUdozaDRd1eXBZSi+uvAynqvZPJL9MD4p8VZ5mYG2/Eb1rT3dCd3AxFg5y3Y5sy3Mu5l0P0YCdz4728F8l9trlNj4V7fnY0FLo5ynVcn/NHbjy4NZc1v8SZgJlluYZ3nKypeAxZMLIGnzTm0EDRF/0J78NXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pjnY+bi6; arc=fail smtp.client-ip=40.93.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pjnY+bi6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCrXZnE/UE9qMz4N4N7w9VDIkpR8R2DyROxOZeYdy6cFQ3x4DTVLEW0+N8soc4qKPSsOBQsJQdt3PGXCTsg94KVtLjGZxsjOOstMEumbHcIZwBZYcIzIyrnQXXakaeImoXcmtVNyOYZzf5FEwlPAL92zvenlkcJh2ohSWIeeAzS0AnhSU2o+Bjy5bvrmtYqg05DcAjxCSVxFdchx/WjeRIfmD0PLCen8e81pVup3p4WRwaby95QSJtgRzb5YkwNORU2Jp8fh/w9z1+UXmKHKbWmMCnknqVUdH6dT/Iognp71Yslh0uxP2ahzMfPFfwjpWdO6kXDIM17AHbxEUi+jwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfMdRItgickMUGJmGlxlhfN0YrrWV7nWyUA6vtWWLgU=;
 b=WX7wkjEYw/NEsnZ1IcZS2uC8sCDh58Hn4N4OWHoMN/oyCdvfvOsYPNyvy70eV9OTUrP7bbfg/acHBx2HbpOXaIUJem8avRGY9cEO75x0AdyBSqT4pYedgb+xzaCqnq16P8d+Kn80pCZJaUp54zDS5YHpn2ycJcp30MnpljKMkNsFGTPkXfU/Ub0ojh44wrXmWImmMJwrLmMJKcVl2RX840VV0zetLQRU6aBBFhlECnuPN3nWQLFdFxUueuaCrq9L2KqDM21tErvv9nW8er1GhkPPVp5AaLXGAAh71YK1sZI3QeXqkZBtMVWSMJR/JFV3GwBG2x8/iJlARkiYpY8hEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfMdRItgickMUGJmGlxlhfN0YrrWV7nWyUA6vtWWLgU=;
 b=pjnY+bi6kvA3TcZCZRKujAJ7frkRcGM3e0hE7lXbzsPE80kFBZJPTmtvBafnzxPKmm/FVejG/5o2mNouULounKYdR2CC8awkgZnNU+Y0LXX0rYlRL2a1iFVQcm2Kfdy+4yGvPfnaDO6I2in5oVRwzyKiPcdacfwLQUF6+fINaBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by SN7PR12MB6957.namprd12.prod.outlook.com (2603:10b6:806:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:42:06 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:42:06 +0000
Message-ID: <10788f18-2229-4165-ba5f-f2e2811281d9@amd.com>
Date: Mon, 14 Sep 2026 11:42:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Add AMDI0112 ACPI ID
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260826163611.2268377-1-mario.limonciello@amd.com>
Cc: Hans de Goede <hansg@kernel.org>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260826163611.2268377-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0181.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::6) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|SN7PR12MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 94750bfe-53f6-4a4e-64ae-08df127f1c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	EXSPM9aMeVJpZgSulgRB+PSl4GL7qAXmfoVsw/QcGMkIcGkg2I9mUi+mfayE99VyKRU913HA6T4MwwncAPPzy3Y0/6NV/Ez09/BlQcGl1R1f6FiD61DXsuab0U1SU2tq3VuadLsECC1tqzmOqrkVjOUg0V4oqqdFQ2tNX3kgvJBK8Ym7mCPtH8AzR6V4/8JYY7yXTxfS1fOlPM92w7oLnPU3FQU7r6jeojzNahphROhBbM/E/A9XuSPAJaZ5UpgQg1uv3K9Pn0B9jSa+Zyff/1KMLVw7yghdc0zsSrZBQR9oStOPwj3NmUI9HovLG4TzQQAGwTupb9DnY5t8JU6qbnwysHHcwt/yh6X3rTs1KTsg1YpwWwI6fqeScZrC1ckunO5ORKSSchtJJPwng9fFQ9CQM5t7FlxIw4L3zp2R/OJqukwyiZ5x61VE3uBg+my4xEE0K4acqQmuv9Bd5y+tzaHn92AzmdewDkFeCgdrYQHMTB5euijY+9f5+nmCUn1zYzNcuf8AMg+nuOEnWt0yqSivMHtkDkHeKAV8zixYfUIqp6AfhwvzQkKs4CR+wqPEdbYUHuOO7zTW1lBjVFcRHtepeBs9/stmsjd3b8ZRWin7c+rx/sWlLI3DF3JoKn0+qNiDcSEJfkYr8y7oBbukcN1pJ7fgwMeNPGbNDYZnXzQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjVjODNoSnR4MTJMQW1MVEZQQXdMWlhXbnJkMUxZMC9TWWdUUjdWQ01yZ2Qv?=
 =?utf-8?B?TnoxckFWVG9ZRDJkRUExc0I5T3hGc1pFTCs5WGhnazhlWkZMUWRHc2FTelVl?=
 =?utf-8?B?eDhYcFRMTG5TY0hseEpEN0pCckFVM3NnVFcrVFFETnh5Q0VLY21mbEUvbWUv?=
 =?utf-8?B?QlpNT2xjUm1idklQWU5CS2hpdWhmVkl4WE5aaEVrRDlQeGFkN3Mwb3pTa0Ra?=
 =?utf-8?B?LzNMQW9sYnpoZmRPN3ZnT1N0dnJvL1paTGdNQTlvbkpzL1FUV1JZNkxmeXNC?=
 =?utf-8?B?emJhM1BaT1hxQVdMdU1jRENnYWZadll2cjFuL0hrbE0yajJEbENTNFdta2xK?=
 =?utf-8?B?SjFod1pNVTh6QTFrVWQ4RU9kb0VJSExxT3I5bndwMERkWG5kbGZnSXZHajIr?=
 =?utf-8?B?TXBlZVFBRXUzbHVOUHYwRXJZNU91TXZKQmJZRUpMTFhyQ25RT0NkOHNzUVc0?=
 =?utf-8?B?bzN5YnppMnlKdm5tNzQ3Wm5MeWNMQmdQNjcrT3JYLzhDU2l4cjliRjRNVXp3?=
 =?utf-8?B?TDFkN0Q2TUYzNXRCTGRHNFVoVlprNUx4YktVUEJUdUVqbVNaNmlvYmwyYWls?=
 =?utf-8?B?dkRNb3h0ZW9TeTZ4cmlmL3lzS1k0WDZzbGE2SHJKTmUzeFAxUkhCb00zV2FV?=
 =?utf-8?B?WlEzY1V6bXFJMGFZS3BSWmxwb1FmY3NWclFqTFkvQmRwQmxBM3E3YWIzODZy?=
 =?utf-8?B?dE9TdUNSWUhGUzliYlJ3T2U3YjJBclgzd21veXRCWXVNYWNKSmUyT0lOZVha?=
 =?utf-8?B?QUhJQzZhSDc2NHdOZnR6cUVReXlCQi85U3hBekxlTVJCOEY0SVBjVzltZUlo?=
 =?utf-8?B?Tm04THZGTC8xZjZpcERGQnNVbmpVWE4vV3IxY2FqNTQrR1NJR0VQdno0SmhE?=
 =?utf-8?B?TnlTRVlRRTdja1YzSmtFYUdKVWtHUlJRblVqTVBRZ2xsZUtxRXhXM2JXM05I?=
 =?utf-8?B?ZS8xWmtVV1FLQUpkYUNSZGY2WkZXeTlVOHFPMDRyNmUxMlBraW9iS0Z5a0NQ?=
 =?utf-8?B?eFlGT0Evay9SMlhjWEJzTkR4WmVLSFErdTlqQ3ErV2QwZm9uM2NrYm8xTFBY?=
 =?utf-8?B?SkN0VXJGWXMvWWVMLzg0RkxnWjRTUno0VDBZNGR6dm9GcUxPOW05Vjlvc2F5?=
 =?utf-8?B?VHo4YU9rMUMwQTlEb1BDWU5nMGJFV2xISHRwcjJyeWlDdnNGdVlkYURua0hp?=
 =?utf-8?B?UHNpT3dJb2ZxaGVjOCtYaHlQaC8rcURGSjRPcDh2SzlIekoxQy93bkkvcTVl?=
 =?utf-8?B?OTZZV1FtaklqRi9hUUxKSXp3UEdGS0dNK3REVEVibVRLUEJyY01Qb0hEZnIw?=
 =?utf-8?B?bnJuTUZjR09KNm1IYmZoc1l2Y1JBV0t6b0J1UTZlMVR2V1lpUVpWQm8zUFdl?=
 =?utf-8?B?OTdVUmI3R2h1RDhRSDBLVnBBR2h1T3ovL0VyM3VXZFNiWjREd0xZMWk0NzhI?=
 =?utf-8?B?dUN3QitZQ3ZyaC90MENwSTFIUGsrWmZ6SVVSNG5jaFVOamZZaHJLVWkyVlJn?=
 =?utf-8?B?SEhYWlo2L1BQSDE4M01yRnk2MFFRbEg5RXl0MS9KWHVEUmdDYzY2OEpRUnJl?=
 =?utf-8?B?NXpHUjRNekp3N25CRUVsOWFMU01aWFNqNjhSeXNIZUdtMHhUNkJkQlBRYVpx?=
 =?utf-8?B?WDVkbHFXZlNLWHFYMGJWUWhOMkx6V3hkNklneHo2dUlFMXhjanBEaUFLNldM?=
 =?utf-8?B?S3c5WThKWllNZHBnd0lhcG0zbG5Vakh1ZUpYVTFsMmxRclg5aDJRM210clpj?=
 =?utf-8?B?T2ZiVjlWU09qNzFMbUhza283czNSbG9HOUF2T0Nud3dEY1Q0WWhKeWNxRUNV?=
 =?utf-8?B?UGQyT01SYmVyWjZ6RUJ3T0tRZWEwdlZIMjAwNEgxc2tMcUJ6VmwvektzaFIz?=
 =?utf-8?B?Ymk5endyK280cmR3M1dwbUYvbk5xTmYzMEhvbEZEK01TM0k4SmtBRkk2cGwy?=
 =?utf-8?B?SDdhd1hZWDlveFA5UkJUWklnZjY0YVNtdE9CeWlqUGgwdmhIbmRZOVpjRWxJ?=
 =?utf-8?B?VmpMUEFZcVR4SVdlTjZXRm96UjJKZ3BaUW5XM2lScFEzOFIveHloQVY2V2Y1?=
 =?utf-8?B?RnFWR2NzaFlsV0doalhnTTBLblVzK1J6RnBEZjc4NlNpRjVaUnBVSGQrVFlx?=
 =?utf-8?B?VUZXclZOTjZ3Vlo2L0h4S0lBVXNFQUdWYkpBWUdFS1k2ZEtOZC9YbDN1eTJr?=
 =?utf-8?B?U3NhNWtkUE1MNDY0SVlDa2xTSGJuWVczamJHUWNORHFmRmlsdStEVktRZWxp?=
 =?utf-8?B?Q1hsWlNpMjM1QUpRVFJlcXd3VTlOckZmbUlxU2VJTzN1K3ZYOVphZEd0ZThN?=
 =?utf-8?B?SVZDNWpkdi9kYndKTkZVcEdjbDR4aXptVDViYk96RE04Z0M4UHFqQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94750bfe-53f6-4a4e-64ae-08df127f1c95
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:42:06.1617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLM1ZrBqr9TaGUst3z5O+SfL3kf95DX9CntLgDttVL+Ez/Ak89V3yZhfPENg3OdcKo0iMm3I6yol1Pgn6giuWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6957



On 8/26/26 11:36, Mario Limonciello wrote:
> The AMDI0112 ID is used to bind the PMF driver to some platforms.
> It doesn't have any Linux side code changes relative to the most
> similar AMDI0105.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Hi Ilpo,

I sent this a few weeks ago, just want to make sure it wasn't lost in 
the merge window and is still on your list.

Thanks!
>   drivers/platform/x86/amd/pmf/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index b4eae65e675b8..5966190d1496b 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -454,6 +454,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>   	{"AMDI0107", 0},
>   	{"AMDI0108", 0},
>   	{"AMDI0109", 0},
> +	{"AMDI0112", 0},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
> 
> base-commit: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a

