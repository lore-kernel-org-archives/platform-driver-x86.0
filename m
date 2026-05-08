Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4BE377577;
	Fri,  8 May 2026 10:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235119; cv=fail; b=F4LWZhYzBTtiVppmkGYfpO+fxd5XCMl2I9VYlHgj9Vpe4fxvge7tTuEvmwZjpipAZenGXf76htBdo07BJIyZdom1Yce8hpT9x49pXG7U+G1M9Xd04dz1TG4L3mc+AJTB05VK5MnXC/m5/hxY1FV0CMWqZuwGV0umppjmwq/75To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235119; c=relaxed/simple;
	bh=JL2I8dbRjN09aD3qWsL6Qvlzyowa4dR36OI1OxWkygY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PkvH/caTP06wHZ465KRmECH9D46wb9OxtHSQRtSgs8xkB1Hj7UJ/bCuLsy4Ifw4/7tCnnnqds+aoegKhFeJaqPLRo7Z17jv6wDAULauUZl/kp1Xb8jR/g8OLh7LvZWg0bpHF49r/F3wCf8fzindMdEXl4G5w2fzCPWxPvQPQr98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1jxWfk8e; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1jxWfk8e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9q9bhbRULdJqiNiEirgA6ZY7qa0e0nf4v5s8mNJYiJQqYdMsvn7jE8X5KagSWsJmjoZXdT/n0JCnIHJN6DvU1F4/sQnJtcvTa4E7CBA8ZfYAKnH7cu/zZ+itfJkcXPDm8/ejdw1TFgTbtxa16FKO1+gw7FnsTAmjaeHGkBSwhmakWkijNO/8wvAnTtWCYKM2yS+6XwitvPGvdvRoMy7azqaYgpqVTZrrQpyZJ9Yi1zYg7Lxd9xVV2zm3TjLJJBqFpY7UU43ft7OYZSfvzQO596rs1KkXIV4e13O6e/z28mhjsIgQYx5S+F9OO/mk3Q9hFKDLw/izdMrUzImN0CK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bEVWED7P5Mx9KDzKQEWaGRYTAxnbsRMnrXQ/M8Sbac=;
 b=Tmbz8jOB9nF5dF0XDeQnYEXJiXyQs8u5tW8ywQBqO4x/xpIqNZ8yVVdpbMArOU9jhmAN0VVbEobrdiqySGNbrTcjE5wBnVUvfpekNguk+eAO4o24uvhCzRp91rVUQ2+iuzRsbFzRfFzH+/eq0s+OUOTPY8GtNc1JpQF+uTOSgDM2lSIkzcJpsO/IAhyhWtrLM4ML4ksPPmKDcXPikU34Pr1D8vX6wT+vZjswKsOxa8KlNJx66tltWWSeUCQRE5AXSFaaXNOZKNO3Q9LGXTwWBMAwVUq8L3e+WSVR4dCbVmATDR9n2g2Hfs1nLhen94IME9iuciaPT6S4YiQkrTJ2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bEVWED7P5Mx9KDzKQEWaGRYTAxnbsRMnrXQ/M8Sbac=;
 b=1jxWfk8eSSOX4kV8QKvvt7cZ+m4mks2pg5neg1P3rBz6r03M64LnTb4XxcaweuNXlffDIDu32wFJ4v2yuIrdnm0yPpjKuk3/qv+m14r60SB9ttPAJhhVd8wZ0mBONqLiqILh5JJAIx6gtMKXMVBCD0AkBvM+xzjB4ptyigyztTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 10:11:54 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 10:11:54 +0000
Message-ID: <ed5516f3-d935-4e45-bc4d-709b66ace060@amd.com>
Date: Fri, 8 May 2026 15:41:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: hfi: Support for ranking table versions
To: Krishnamoorthi M <krishnamoorthi.m@amd.com>, mario.limonciello@amd.com,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: perry.yuan@amd.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::24) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d7b0c1-244e-45e3-addc-08deacea3a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KPwr7NGmNVXbIiP/ubwPy3w2Ye7rEZfrmyTxtxricoDI3R7MWMDQu3/L9TBS5O+nRLTn9BlY1DtCL/q7q6GIP8MLFmFgm1NBHAVWGg/I/p82KjEttygUoI7hjGf0RqM+pJR0WlAgJOa3Xbhf2eHJLAwGhB9Y3uIdyGhp8iL5ZK8ikuy3Ur4G8joBQFJJH9igNVdS6Q3mkDXXPpRA4IDfw8EVqKZfbQHFZHDZMuJ4hDj6AZaehK/6cUbaj/eGQ1xBwI/kHyyeIfw6xGF8R9n2dudx5F4JUkAOfkfCp4Gm9GBv75wVi0Hx7E030J04L0PZoyfIJyD11ShAi1hLreGRKRUfOWA3wz8l7bga5ex58spzliG6wNVJdlIAsu7shoS1WwukWaFiEfCeTCSkNcywB5k8R1KF1zScPKlzZ54B2dm7+osNmt6K9U7RGe6gzSDsWNS5ux+/5/z+whq81K3u28wWQORFAJdlgQN/MXK4E1fLptsB3749bXNYZFO5FprNRns6cI211LFKE3AE4O8kIjEsjFXANcFOLdzrY7/2Mcv8kfUOFDJOhFf3wAPEZx15Nz19dAAUXBdHpDTr25YCdQPfn6fFjkpYNzkyztDblUgw55YllSDwvRrRwBn/Q77hQjwVLhuaA16GmefTGHpNKteigLeC2M7UCW9rPKUFzyskmFsrq5jWssN7HgWXUjQ6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0tXeUVtcTZya0o5K2Vhai9LVTJvdGU1UHZTTFBsQ1M2TE94d1NhZmswSzIx?=
 =?utf-8?B?S0wzVnVjN3JmU05yNFNpdGdVNmt5WDBjQjMwdXdLMUJKQVh2TUdJQjhFUU13?=
 =?utf-8?B?eXU5dU8yTXVlckVydThnRzJCbXZQQUQyQW5uMlAxUmx0NThmRGtJSlNXeDA3?=
 =?utf-8?B?cmd5WDI4REhnNHVJMkdFVURoVzFRNHVrT0Q5ZFhqbDhwZ2ZrVmJUdzA0Ui9a?=
 =?utf-8?B?UmVNeDMxdnNZV3FseXRwaGtydSswV2RQMDljVkhrekdPdWVnSldyTG5zUk5Z?=
 =?utf-8?B?ektyQ3l1Z1N6dlg4b2hBTzFHbjAzaHo0VzNDN20zRzFrajB4UU9RR3hHam5r?=
 =?utf-8?B?SkIxby9SY0JEUlpHNThsaVdoNmUwVE91ZzhNSExJYUV2QTh4WW1KTE5iNXlo?=
 =?utf-8?B?M1VONERuRUJMR0E2a3lBdXhQMndIbmlUQnVYVm41eE9RNDN5N1dkRUdDS204?=
 =?utf-8?B?czNGaW9ZKytsVWZ1SG9zZjRvNVFHVmpWQ2dNN3A4Z1ZRUjdSRVRWd2tramkw?=
 =?utf-8?B?TnQ2Q1cvYk9JazdkdndUZ0kxZHk1N21GVTc4b1dibEFUeVNuWWU0VkNWMGlx?=
 =?utf-8?B?U1RQWFdJcStKZ01lYlNkaHI3MXRlNC9HTFFtMGFKS0t4cUM4dURienNhMExN?=
 =?utf-8?B?MEFoRVhzOTRtV3NlNUYzQlJ3VmRTcDFmU3d2cWRXZDVVaTJuNVNjbnFXcVVM?=
 =?utf-8?B?aWVWQ3p3dWE2VTNFcDBEaHllSHdtSXN3eWpUdVRoY0ErcWE0SnBjNmdkcjN0?=
 =?utf-8?B?N0tQL21sM1FzTlFySE83TTBCT3F0ZFlSeXRKQ0hOakRKeEN3bzZQUllqMjd1?=
 =?utf-8?B?YVFOeCsyVXFQV29iMmV6T0xrSk9xZFZ0MkpxcFd4djB4Q0xvblJnRHliR045?=
 =?utf-8?B?VG1rYWk5Uy9GaVVBOHMzT1lNWGJtOWJBL0k0ZGlmbkx3MTkwQkF4Y2tqaDBT?=
 =?utf-8?B?VEQrQkM3MjF2QXdRMldVVHAxQ3NOa1FVRmUyQXptZ3ZrSTZsVExuWTd6cFJL?=
 =?utf-8?B?Z1Q0SGFDdlhOY2hDN0ZxdFcrVFlUZnI0N3JRVEdjMFM3dnByVDgwZWdROEVY?=
 =?utf-8?B?R2JJZUxnUlAwL3Z3VGZWYXpYZVE4cWRMSS9XWUU3NlR4VDN6UkYxL2ZlRVow?=
 =?utf-8?B?L2ozV0xxN2tOMDZSUTBKa0JKR2s0NzRQNnhjajlVZXZvQUxmcXdNN1JmV0M4?=
 =?utf-8?B?MVpSak1PbllFOXJPRStHd2tVTGNLR0tsNWhaeENPWE1yd2EzSlN1QWFZNlpE?=
 =?utf-8?B?SVJraEgvcUtHdlQrdnJ0akhQVWJkbFJGdk85QUFmdFJsVWdTOWp6MVFWQ21w?=
 =?utf-8?B?RE1EN2wxTnBpVGNEN3hQUVBxTUxvYkJTb01waWdETm1WcXlqN0l5MUNic2RT?=
 =?utf-8?B?alVnekZRK04xK1dzVlRUZnNLYTFLeTdnVW5SSjlFVmpGY2g2YkJrYUlwTWtS?=
 =?utf-8?B?MEpCeVNaNmxWNkhHRE9xTEh0ekpTSkVzc1JBTk9hZjdLWmhYKzQ1OXN1bFpH?=
 =?utf-8?B?aC9PeEdVTTFnTXpEU3ZSSEdZWjNHeTRGTXJBc29ROXVpOGdzTEt4OHdneER3?=
 =?utf-8?B?THgrMm1ON3R0SDdVVTU0OFNoNzhsV0ErNzhUdW9pdytiekJKWmE1U1l6OXBM?=
 =?utf-8?B?bUJOYlhkTHRmUXRvb0xPS1dCUlpXMHpMYkpFYTUwcVZHMVlBTzBDSHFTbUtF?=
 =?utf-8?B?dEpLVFNqTTd3ZmZ0VGozejliRWthWXE2ekNqVFRZUUlBcThmVTltTlBJV3BP?=
 =?utf-8?B?WkJRd3lBdnZkajNLVE1IS2M1aTMrZXJ5RDhqK0FOd0RqL1NubnhuckpselNR?=
 =?utf-8?B?Qldzb2ZhZHFhN3pBTGc0QXRobVNDVGJacU1QTmRaUDBCd2dia3hwWllmaWhw?=
 =?utf-8?B?czhEd1g2QWhXL1I4eUdYN3JyWFlsNWtEL3B4azFxYlo4MlhBaUhJY3BGY1lm?=
 =?utf-8?B?QXk0Zi81a1ZUbTdRdHQ5ZUVvY3JuL3NqRjhKeHdMWE50VHZWQ3VPSVg2SjE4?=
 =?utf-8?B?VVVrSjVTZXhUY0NHUkw2c1BlZzRRb25pQ2ZQdFF1WEVrWS9Rb2VqdkpUei8w?=
 =?utf-8?B?MWJoT3gvaDNGclFSamx1N01PVlEvZDh1MzF1MUxXaGFJakQzN1B6L0haQjhq?=
 =?utf-8?B?Z3c0Z216NnhtSk0vZlRUcGtSd3lYUk5uakpoSlptdzY4cDF4MFkvSDlJc3hh?=
 =?utf-8?B?NUMzQU9TeG5JZ2RhWWFJODIrbXN0Wm9WY2ZCUEM2c1NlcG5WMnAxazZqRG9v?=
 =?utf-8?B?RDhSVjJvQVBmMDhkbTNXQVpzY1VjWlVOT3l2bjJPMUthS0FNM1pLaDVmTGlv?=
 =?utf-8?B?SEh3M2hlSEZoS052UVRpaFh5dElyTVY4VnhybkpNMXdJb2M0b3Vjdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d7b0c1-244e-45e3-addc-08deacea3a94
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:11:54.0342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUj6lFyUf3Fg/XK1mQtMNgUZQiY+D0EWvpnM/8VwRraIl8ezO8rkQhqJQ/Yx9cbX8+LWlDvdITI5oQjo3/E1iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6604



On 5/8/2026 00:39, Krishnamoorthi M wrote:
> Add changes to support new ranking table version. Version 2 of the
> heterogeneous ranking table provides static CPU rankings. Version 3 adds
> dynamic ranking table support on newer AMD platforms. These changes ensure
> that platforms still reporting version 2 continue to function with the
> existing static ranking path, avoiding regressions on older hardware
> that does not supply a dynamic ranking table.
> 
> Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>

Looks good to me.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam
> ---
>  drivers/platform/x86/amd/hfi/hfi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
> index 83863a5e0fbc..e0ebcb0c4acd 100644
> --- a/drivers/platform/x86/amd/hfi/hfi.c
> +++ b/drivers/platform/x86/amd/hfi/hfi.c
> @@ -33,7 +33,8 @@
>  
>  #define AMD_HFI_DRIVER		"amd_hfi"
>  #define AMD_HFI_MAILBOX_COUNT		1
> -#define AMD_HETERO_RANKING_TABLE_VER	2
> +#define AMD_HETERO_RANKING_TABLE_MIN_VER	2
> +#define AMD_HETERO_RANKING_TABLE_MAX_VER	3
>  
>  #define AMD_HETERO_CPUID_27	0x80000027
>  
> @@ -158,7 +159,8 @@ static int amd_hfi_fill_metadata(struct amd_hfi_data *amd_hfi_data)
>  		dev_err(amd_hfi_data->dev, "invalid signature in shared memory\n");
>  		return -EINVAL;
>  	}
> -	if (amd_hfi_data->shmem->version_number != AMD_HETERO_RANKING_TABLE_VER) {
> +	if (amd_hfi_data->shmem->version_number < AMD_HETERO_RANKING_TABLE_MIN_VER ||
> +	    amd_hfi_data->shmem->version_number > AMD_HETERO_RANKING_TABLE_MAX_VER) {
>  		dev_err(amd_hfi_data->dev, "invalid version %d\n",
>  			amd_hfi_data->shmem->version_number);
>  		return -EINVAL;

