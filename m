Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7051F15098E
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258898; cv=fail; b=KdNB81ngMThZ3eauP3dNuOXXwKFIgE73cfdsbLOSdnmSlV2KM19DJz4TRC+ob2wc78ESW8Jsjj4RU3D3RI5rv/LLt7kQYzEUibW0vLYE+/u6DLKE0KkhJsKtN8lRIcCIl8DASozuJkvobZ4jjCRu7tMjIiNr9tUdPfltB7F2aHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258898; c=relaxed/simple;
	bh=MLp0P1zUkB4JPxwI/VZUbFCZYfwY4D0cgX5bU88/PIM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ryqay9fjHPwtdwPDB27ipPO+xxpOAzFMgY4lrhoVEnKB4ejQiACx557hPzWpn8o/YA6Hf51DzOgkpkK0CGKPRKoxrvAf1tgJ7TWy4SETUvMKSpzSzHSd4ZDRm2Fjh8HHP6bTJznSOp3Kv3ZpjqFBhyWmsWU//C2Zk2HGBGXbTSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PJIkcs7m; arc=fail smtp.client-ip=40.107.92.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PJIkcs7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upN2HkFENgM3h2j0b6Up0VqhnfgexlASibYAgciNJT4j1keNDQAcrx3/6dTocycNIM9T54Ngx39vHdUgn9p8QklVLYNao+iUOf2UkkRO0ZDHloQ/k0Nx0ObHwed0sDnQf7KMp7/uGtq7MH0BWg3Ke9BgA6H01PE+I0LVKXoY8ff+n603s1tUJaprkRIN+Yt4KHL61lK9pbxu6t7znIw3C0sZR1Qpa8Y13VyuQv9+9g5jCmstuvotV+04/rGQNZHreP3wKHtei/zoIXD7q4h2fYy/bjHd05YW8i3QSyn8/bJaXKU1zxWA2s1fe5oACrMPLrWiaYPutoMqORlbXzgzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r5SrVr69ggdON9YpzM6ryXp5fzYk3+flahDNb1eLbU=;
 b=OmrwDJ3FqcWeJbfRE+XYjktq54V8pj1Tnt04NnI/xEBxVqaNmT/WzXlGjok1V0m0YQWz304Dh4fEoG/kz8NfqHWzcsMCVNR5H143pI/PbpThPSuK8jqsMDnHko4rmgrwslkSy4hmpdZlx6JHpdQQpRqSC1j65P+6CflDbicCtWOnokVtrrrUxZ5Wf00cdEpuAT0j0ALsJT+RcI4PxKW5DyBzEqdoa2RU3rodm1RXSXtp1dhamCyatnXEoHU9Ss4tgWN72o3hpajBXnkiXrlb9UG/51vmHIuEIyWvXbWoqheIfztbNiBHJQqgbFRZRDg5T5YWqoJ3iDxCO7X9ZWO67Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r5SrVr69ggdON9YpzM6ryXp5fzYk3+flahDNb1eLbU=;
 b=PJIkcs7mbTVvm0a5FhLBn1dn2Nw4XfTtu/8XdOlOQ1EeHrT9yQGCQoTK1Po6YJKJcQIyUpJq3izzJiLUQapgXjj9d9Hx8QJu6wXioZ9UTYUgttWT9sZolx1JpAubjlFWo+dVUg+TR9Sw2PWDpK7bkIfgkiTvbJ3DM4s+Z5+kNlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 21 Aug
 2024 16:48:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 16:48:13 +0000
Message-ID: <ed50679e-114f-4e7b-8465-1b8d4e0622d9@amd.com>
Date: Wed, 21 Aug 2024 11:48:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Extend support for PMC features on
 new AMD platform
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20240821150446.392726-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240821150446.392726-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0172.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d25279-d887-4bd5-7402-08dcc2010bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUpvcUNjTFpOdlIrZEJlQU9WaFVUM2ZUOHpPZHl2b0RoUVZPOUZsdXNYZ1pY?=
 =?utf-8?B?WDhxaXFKTndQbzJRTk5RWXFDNUhWSmQ1ZVl3S1U0RjZuYUU2YkoxS0pmUVhk?=
 =?utf-8?B?ZGhkNWIwN0htVTZ2TW9EZmlLcDMwTkdqR1h2SS9CZ0c1N2ZkZjhUdnVYS3Nm?=
 =?utf-8?B?RlBlRTMxWlVFeE9Wd25rZUJXNTJXVktHTkcvbWhxdzZiNkFwNnU5ZUtLRkZw?=
 =?utf-8?B?RU1Pang1UTNRYUk5emt2a3FOZXFYRG4yancrd2Y1K3IwaTBxbW9GejdmemY4?=
 =?utf-8?B?ay82dTZsSlpmT2p5MU5xNmZSc0Z5b0ZvcUhpb2JrK0EyRkdzT1dKekN5VGpG?=
 =?utf-8?B?MHJNWkVPQ2xSeGZnSEpaRFZHOU9La0dXblZvUnY2bVdCbUFad1N3NDYzMHlu?=
 =?utf-8?B?Z2w0cUdoNnFGS0tMSVprMUQxMkZxWVQ4Vk9NY2V2UWttaFhDcy85REhxTlNZ?=
 =?utf-8?B?dzBXODlaVklLSytIVzZYMTNYWUtEMTFaRFA3d2JHUXdsdEhmNEhycHV6dy8x?=
 =?utf-8?B?bmFCMS8rSWNNUEovVWY0L3N0b2RzMUNaelZFTnliZW9UdVlieHkvTU4yRlJ2?=
 =?utf-8?B?Zm9OSjFmY0pWUDB1dGZUREJJTWRzcnRwZUVpUG5RVjczclpuc0ljUEl0S1Z0?=
 =?utf-8?B?TlhjT0RPcE9YeVlTd0NOY3VFUkxYM3pkSStHcXAyR3MvaDVHR3l5cTArK09W?=
 =?utf-8?B?NUQrMU1lVC9LY05kSlJsM1ROZmVYRXNZTWxZVnUrTDRmY0ZtQ1N2Y09ZU2hF?=
 =?utf-8?B?MzBCTVZUWklzU3h4bDFweENFNEU1WUYrbVRFcDJuWWdTL0hHUjFjS1YvakRi?=
 =?utf-8?B?cHpMZlFYc3l0cTJnaksxSFZZZ0NaUVF6Mm13ZGFvVEt2WEZsMXE0N1A1ajF0?=
 =?utf-8?B?S3FOb2QwaC9IbW50MFJlQVZGUDNtT2dCeXFJZnR0UnZsVzRhZWdTTks3VGsr?=
 =?utf-8?B?WmswSzdwVFJoL3JYSW8veVVFYVlaekhQa3lzNURQRWxHeXlsVmRxOXFLRXlK?=
 =?utf-8?B?UkIrbWNCNjMwRVlvSlgvZXc3T1NWR21vS3kzb21sUWIycFVneDBmYS9jQXQ0?=
 =?utf-8?B?WmRGZ1dhL3l4bGkwcnFCRXlSclBpbms4R3F6TUNPM3V3RlpPTEtnZDRlLzRO?=
 =?utf-8?B?TGZPeTlzL3hjb3M2cWhnc2h2S0NSVkVTeG5FYjV5UStCQkVJcUY4YThrOGx1?=
 =?utf-8?B?SENmenlsakdLb0NjUmF5Z0c3dy91M0dNRmk4UTlFZW9PaTdqWG9GTytSVzVC?=
 =?utf-8?B?UldYUWhxVXJOR0k1RURNVXZJSXdVR2t2dXptUk5HQ2FzdmxKQUZZeFVDcllm?=
 =?utf-8?B?NVN5TW5FcEFrSndmclZ5LzVEbi9CR2ttNXdzMy9rNisvdEpsUWI3TnloN1F1?=
 =?utf-8?B?QVNlcmVWUVg3NVNKMnB3SFN4OTFoMXp6NXFVbE9xV015WlA2Sy8vOTAreGxD?=
 =?utf-8?B?R1lWcDZ1dHVIV29pSGRYa0hUYjdZUnBLUnRvT2J3M0xJTmRIbXlXT0FzQkxW?=
 =?utf-8?B?SjRBNkJJajdUbmtOOHFGRlRqMC9YMDlOakg0UHByRkllc2hnYTBycDFzdDVp?=
 =?utf-8?B?M0RCTWYzS0c0ckRBajJJQ2ZqUWQ2elBiOXd5aVJlQ1ZMaG9ramxxSXFucjZu?=
 =?utf-8?B?ampwUjBBV0FPaFZUdHNQeVdRcmpVZTdjVVRQTXpkVUJSTUNuLzNQOC9aL2I2?=
 =?utf-8?B?YS9tV1dtRWc1QlhjdFZVWVpHaHlncVVWNmZLSUhydm1DL0VxWkxpblhwM0dn?=
 =?utf-8?B?cklFQWFJVlhEbTNYU21WdE1GRkE5ZXdEZkNnUE94a1laUXdhcUZUYTlib01H?=
 =?utf-8?B?cW1lc3NiOFBtQmNMWXJEUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0wrWWlVZUxBRXU5VzNkNjd4ZXJPcVViWVp2bkxZZjl6dVNmWlUzQm8yT0NO?=
 =?utf-8?B?dXlDTGdKSUNKT3RiTUFiRnhGc2hQSDErc0pQa1pyQm4vUEhTdzZGZVNtRGl5?=
 =?utf-8?B?L1BIZW9oNUcycW5rOVc1RVNOZG5zVGtYQVhKZHBQZk4ycFpCbm8xVzZxaXc4?=
 =?utf-8?B?dGxqTWVGRHhBN01KWHhpYVlJdSs0ZzMvMHd6enM1ajgyV21TWnU2Vzh5VmNY?=
 =?utf-8?B?N1VTR1UxWEtLaEN1Um5TRFRqVjVsWWVxZWNwS3BFb3lmQmFIUzd0aXlsd1FT?=
 =?utf-8?B?SzRlU3RSSTdTdkR4bmRCbU5OaXMyTXBsbUpaM0htaUMwRGowVTJIKzVRK2o3?=
 =?utf-8?B?ZE5jenlEV0lTQ0l1RWhhQ1N6emZnblVhMndWUjRUa0NtZTlQRGRNUzRjeHBP?=
 =?utf-8?B?SlJIbXpoVXhBTXIzRkoyOHRDZ0sxelI2T1dXVUtpa2xCdmZjMGpJTkhIR05j?=
 =?utf-8?B?MVpyaFRJZWpWRTNpTGxXZnp1LzZPRjRwUC9MWTVaa1dySThDQlZkSktlM3da?=
 =?utf-8?B?VzRQa3ZNRnFUaEdEUnVvVktveVVQSjBEcm5tbzd6L0phWHlCUnpMcEJTekhM?=
 =?utf-8?B?R0kwajVWWUJDbUNVeW8zTUpEaEdtYm1FVWp4K0hCd3FyZWlyY3doMEZ5OHkz?=
 =?utf-8?B?YkJrUExDeE9qWlB1TmVKOVFlaGZLdy9pbkIveHRuL2pkS0lsa2YrOVZnY3BZ?=
 =?utf-8?B?Z3dDV1V2L2pkaFpHOFBMaGdmNjlWZitsTlY3R2dORytFTjRkSllyT243RUI1?=
 =?utf-8?B?RkNhTXpPSThWQU1WZndYeWhyRmJIRDl0RDE1ZEVaTGhuM1A2MXk1blZQVW5E?=
 =?utf-8?B?UVcwZm5BOWh3M1JvblNOaytNcmhtVHhScVNNWFVTSmZUU29xbDlYaHlic0Ra?=
 =?utf-8?B?MWFGeTZETzQ4OUpaNzBRNlJ6cml6c3dsdUROWHNSQVcvV01oRFUzb29LaktG?=
 =?utf-8?B?QWo5RzNiaGw5UVROaXJkZnE1SGY5L0NrVjV3K0hnK0pONnpyM2ZhZzl2S3hs?=
 =?utf-8?B?YjFWL21qemhIVGVaQ2gvZUkzdlZpMVVRWHFIcE5uZ1Z0Y1VTRVJ0enpUbk9m?=
 =?utf-8?B?Wmh5NnlPRkN4Vld5TS8wSWVVUGd4TDlzVVRrdWR1NkhRS0ZDd093TjhMSmU5?=
 =?utf-8?B?MWN2TFlieWcydzVnSUxWSDJpSnNGZVprNmNPUzNheXJ4UXk0M2llNVdzVS90?=
 =?utf-8?B?T0Z6aGJzQXpwTTV1M3c0QThtdStCUnZzQ2ZaRm94R1oxR0g3REs2TEFIdXJr?=
 =?utf-8?B?NXN0WkhsUXZ5N1MvVHNxRmdxREpiY1ZlMU9GMnVHVHErZEE4SCs2Z1QvMVow?=
 =?utf-8?B?OW5OTS91d3lFaUdvVVZLWnU4a0I0OVIwamk0NFl4Q3UyRmJteTk3Nm5YOU8x?=
 =?utf-8?B?UzFQQzRXWXhJOGw5dHdCRWNkNDFKVEJqWURKTGF1ZmVVNEQ1dEluN2NqclNL?=
 =?utf-8?B?OExaemxLY0hrMHpxUy9PZERyUHNpVmxpczhid0FkQ2Y0NTd0eElVRjVRKzBx?=
 =?utf-8?B?K3dWZTdnMVQ1SUZYVUM5N2Fzbk5LSTBGYnJCYk1TVG4vZnZkWDlNV01NSHlq?=
 =?utf-8?B?T09Fb1hTOU85cDZrWE5pdFBrUVFUTS8wQUdwRDhSZnhrMjc4bk1sd05rN29L?=
 =?utf-8?B?NHo2QVMwVFNzaTJQdHkxUnRUOElrTDExSUFDdHhzTXFpeDJYVnFKdXVzcHdq?=
 =?utf-8?B?ekxBeGV0NmowNHE2NU5zd1d5N2R1WmJxTkRISUNRQWFRbVNNR1ppMHhQQlRT?=
 =?utf-8?B?eis4NENSc2hhbDZMQ0tZaEZuQkwzeEZISFVIc0ZuS1RMcDI0ZElnZWdTMjU3?=
 =?utf-8?B?VjdFaVZuY3JOMlcrNXhTWUloOXpvT2ZuWjRNcEVvRG9QdGs2Z0FLQUxuMTZP?=
 =?utf-8?B?TEdVakNQc3RaZlI0Vmc0eEw0OHZ6Um9BUWZ6N0hpRnVJWUlCWWZLVXBpWVUw?=
 =?utf-8?B?aEcxN3ArdVdhR3E4ZmJvYS9sTStJMHdkUVhob0JkOFdiRlNzRW9vZ3JUaUEz?=
 =?utf-8?B?UXNsWUpHR3pXNlluZ0p4dGVZZ0xEWHVMd1h1QlFpZDdYS0d5OWF1ZTFpYlBP?=
 =?utf-8?B?dXNJa3AwbDFEZzJTemVHVytkcmNyR2ZZakJ0NjMzYlkycVNrWFVqdW9BSWtv?=
 =?utf-8?Q?O7YAb0P7Dfft/Pc06d8vVT9MX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d25279-d887-4bd5-7402-08dcc2010bf3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 16:48:13.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDSIawAGsKm51yvWlMtjQp/hhCDYD2/Hit9GKJW9NqecgwiwZPF46BH62D9/2mT9Yrz1T0GMh+bZaV0Pp9ssWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877

On 8/21/2024 10:04, Shyam Sundar S K wrote:
> PMC driver has capability to get the IP information, idle mask values and
> STB data from the PMFW. Extend this support to the platforms that belong
> to family 1Ah model 60h series.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

This is actually a fix for another commit in 6.11.  Hans, Ilpo, can you 
please take it in fixes?

Fixes: 426463d94d45d ("platform/x86/amd/pmc: Send OS_HINT command for 
new AMD platform")

> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c3e51f0a5c33..bbb8edb62e00 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>   		dev->smu_msg = 0x538;
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		dev->num_ips = 22;
>   		dev->s2d_msg_id = 0xDE;
>   		dev->smu_msg = 0x938;
> @@ -597,6 +598,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>   		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
>   		break;
>   	default:
> @@ -630,6 +632,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
>   	case AMD_CPU_ID_CB:
>   	case AMD_CPU_ID_PS:
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		return true;
>   	default:
>   		return false;

