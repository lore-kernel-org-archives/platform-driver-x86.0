Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157C3450F2;
	Wed, 18 Mar 2026 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773798040; cv=fail; b=esEM0+CDrQOh0PmTqKre+m8y2eIjeBDUNcyXG5EJJnc7VdMvQPZauYqT0hEu2XPQOoubZnPNV8Gp+dWCyPtCuslY1KJI/59t/49Hp64GfWeAs2j1ciTG3k4VJoHjETb6mIV+aHJ9pCiobOEFndPBGcnIJTiKhc8UcGpC4FKh410=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773798040; c=relaxed/simple;
	bh=/t+emS1OFCi7RR+/DsfnV6GzD+y9lez5Ymst/y1qT4Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S4de2Diz9JmSF4Iy9XxqQpdrW5PAzGWyncB4Gdopv+3YcbD3dHMpCUfLi0tF00vG8DodfMBVHBvp9WUJjLzXbCPfpd3QjFXqR7a8OnymqNGqM+3vjwoqrmbiYAQBQ8nVqSIuVHLejOlohOL5bwm7Mg97isTIkEm9x+K7dYnBkFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LuAJzTtb; arc=fail smtp.client-ip=40.93.195.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LuAJzTtb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wv8XqL3re7OX4ZzJAtVW+XpV6PQdHvsgl6ZMv+PKGF89JknW9ivljHMjDA/oSVOXdx0A+TKSe8HEPKmj23DxouJ34cjzj1meAHk3nyK94fJQ0u26ULfskSLXaqDkjfeSxEyoGo4XbpFGtW9V1Ojvgn3VhEbtN2IMTWZFIEkPbIAEsSQplLBYuGhBZoKvLqtFL7OgRq06rDEISoW3mMI2qlt/OD9jfecY75lmJRNTi2J/GHoHGqXE9ypPz+clulHKjWaTZPonJ5zUuPcz2AFHXj73Xj/ZSiY3nTNKzTbd6kRswoYmPEffqJ7SL1MO7QfmoixdCs0FNC4eYBgSDdkKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WstNa7pvQBR6MgwWkCa1WwZAHvOOKcZ+Y2ubFO9XW+4=;
 b=tFXm2AVzA/W8a1RbbjwC5wzAW1vobI+bR2M9xNH5kc5bv2iipQ+evrxbWl6KkXiPKPFyHOmk7psD9OzFNg0ynxc8QTRc+kgv3DF0nnW9FfqCDHO7XLEnOhTTjlm6psydgYQxOvva7hcZFyq9/y1NfaqHMcWsfKrauGT9BW9LXkf4YHqLK9l9TZ1SoA5U/+b/yo8+3pRdZnrHweGNr9e/ZbmCKAVXlRqMfPHVohNtx5H4gv/Be87D+5GXy9c5s+tR+62xlAJFtDEc7yfpvJpopHQZk3K/TAhw9rT5VcTI2MV83GV3NWQLTs74TWPthUO24f+YcwN/LSBK67nbmSmyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WstNa7pvQBR6MgwWkCa1WwZAHvOOKcZ+Y2ubFO9XW+4=;
 b=LuAJzTtbicbjrkpAmGrJ8dAMiCTrES45ZUbDqJGhfqrL0MBaUCGrK/f2fGxcSYc9FbCai5v9nPtcGoguD7YHFeKEWg3zN1GeMOBZ4k//3Lnt+So8CuTxZmSodrwI7uXm1hocB4z12tEuFT1U5YDxX58141g5rr22ZVmAyCXZEJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 01:40:34 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 01:40:34 +0000
Message-ID: <1fad8144-e6a8-450f-81d3-dddee2fdb546@amd.com>
Date: Tue, 17 Mar 2026 20:40:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: asus-wmi: log thermal notification event
To: Jonathan Grant <jg@jguk.org>, platform-driver-x86@vger.kernel.org,
 luke@ljones.dev
Cc: linux-kernel@vger.kernel.org
References: <56532bb3-c604-484e-9716-edda3758f627@jguk.org>
 <50cc3d4b-5e5a-422c-9abd-556488710988@amd.com>
 <94dbe1e1-d706-47aa-abf5-f5d76aacf017@jguk.org>
 <7f2f4b15-2fad-4784-a524-7f92f6b21a94@amd.com>
 <09b38ae4-bb6a-4df1-a679-deca52edda88@jguk.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <09b38ae4-bb6a-4df1-a679-deca52edda88@jguk.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::29) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CH0PR12MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: e7962b6e-e84a-48c7-5aa5-08de848f57ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZC4347NqGparg2emmdbC7F24tUARujxs51/UZf94er0DQnmWle1KknArXro9MYNYkrq14rOspQZEBrOFtbqqKsYAbEWQoiKxk72ss5JO1h7DtWNC94ewM7x/dznv91SebnTBjZ5hOHAcjOaZKHqbdx0jj/YiN6jVlvqa2QTcAPgCyE2VAgvwarU1PIsywD4ZQpOt3SyEzZvP1WN5dasOrPXiwGnh6MTraIfQ+WfJm7L+LL1l14S1ED5Q/W7Ep8b6+RV9wwAVjxgwmCj9bUIxubYbmZeIWkuVEZuW6s9csXtxo6IDmbvWyNiX9lWTgOIjR3wOfnvGN+071N0C/sE0GkvP0ELPMYtXeKRd6659ulBIUrNMVU0ACSeiuOst70rxVjJsno7KBrqv3hIcyxBxYZs+O86wu4UMWaIRAbIgcf1YHPdIChQocVmYqO8qUu99nXgf/pKvC3yat7+UfNJTrQwWC/UITNY4XbgFdoiJqj0TOJGgBv2Aaxxjrn0eeI0h53LrRp5swbqinUxXtcZKDHz6X//LFlDN37Ncb26ka2wNRYO2BALYrZzbnViD0EKm438VjWx38vfcqqJ5qbbpQYDVE/bRVm8ctlPj5KsJX/rCo4WBERjiOyr7TX2T74EP7U8f6mEjoXZAZ7c8ZMA3v2mkmJwHuTB+cp8TaSv/W8bZJ9U5proHkNzOZh8zeexMhiIBSxQ0pH0aSkOuV+UEhn7/qmRq3DRBFWPDc2sLugs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFIyaFRNUk9Sb0s4OGVDY2JQK2E5UmJ6NmhCZ0pDbkhmdXYrdVdwRFRqRFlB?=
 =?utf-8?B?eFhNRE5aeGtyb3VaVEhVZUhGMUxpbm82WDQ1NzN2MVQwaGxQRXM5MGFSdWlE?=
 =?utf-8?B?SG9lblMreDZOL3hiUWNhcmVNSFdwRFlnVUVIMzJTVUNGMjV3VmdLeDAwSTMy?=
 =?utf-8?B?cGcxNndrcERuT3hJTFJ4eHpEdWYveTFkL1dQckxLcW1zSVpRZ3ljYUxuU3pN?=
 =?utf-8?B?ODdCcWVFRXVMWS90M2llSjBQeGRjZGlGSUp6dk9DL2ZZU0U4MTZWSlZMM2sr?=
 =?utf-8?B?Tm1ObVZSdVhuUERmK3kzVUhQS1ZOWjZnTWxCRi9TNFkremRSVG5vVFZSc3c4?=
 =?utf-8?B?eHZ5UmxhQmJDQjByR0QyOEVLWC9WamdsYlJMTWtnY0xJdlBjbWc5R28wR1Vk?=
 =?utf-8?B?WkllMXBsVGxQV29PRTBySEhuWHZxOHFsNlVpeDlSc1JuUXJWSllMbllUL2Ix?=
 =?utf-8?B?K3BEdzhhMC9GMlNNRVJFeDVUbGNSdm15bkNyTWV0ZEMwVHFod3k3RjVMK1Mr?=
 =?utf-8?B?N1V1TmV1blg4V0Y1ZWFZMVB1YWVONWZ3UFpaR0FkSy83L0JSZXplTStVTjkw?=
 =?utf-8?B?L2MvOStCYVk5NytTczVsMXJ1SnNmSFAwWFZISTRPcHZVSFJlWGd4UmtXYkxx?=
 =?utf-8?B?eEY3OVhyQ0NQU0paMlJCRldLZjlmRjRwMFJqanR6eUpTRm9ZTER3RmxwQ0Nm?=
 =?utf-8?B?Z3AyRS91b0d2c0VRQ25hdXI2NU9OSm1tQmZtUzR3Tmc0dDFHTGFXQ1JRTEtD?=
 =?utf-8?B?WXJYeXRSN1FtTHNjbmtxUE5aWVJyUUY5RDIzaTZmMzNQaTRrenlFQTZwN3BI?=
 =?utf-8?B?V2Q1YkZ3UXNKcjYvMzg0VVp6MnpWUzVqNjBQdnRDRHU0MDkyOElDWFlTeU04?=
 =?utf-8?B?VHBVQlM1Y0prWnVoeFR3K2ZXY3JFc3BrSldXVk85Zlo3MlhvdGhmUVdlajFC?=
 =?utf-8?B?cDhHRG52TE05NzVRb00zK2dnQkRQeXMxM0xoV3pDZWJqRUZac3I0QS8veGRE?=
 =?utf-8?B?UlFhUDgzbHJ6T3VlaEl3a1dHeXBtZ0NEL2cyK1U1dy9zZkozYjlpcVdlS2NC?=
 =?utf-8?B?WXJNME84bHpBUlpESmQrZmJYMGxBSktHRzd2VldjMklMOEdRcFhQUmRuWG9j?=
 =?utf-8?B?L0hpLysrcHNlc1JJbUZVR3p0ZTNJSFBJcUhmUlp2RDVDNTBKYVIwWjl2cDdZ?=
 =?utf-8?B?TWNmYzBhcW0xN0RLUU95WXJialhxZUtKVnZxU1FadXNMcENKV0lZM1JJYm5n?=
 =?utf-8?B?ZVd2WEpTMFU1dko3cngvSWhMb3Zic01oVFhRQWVISm1mUFBPUmpVRnR3akdD?=
 =?utf-8?B?aDhSS3lQblplcGh0dWkxcWIvRUt5aXZCaEhCV2Yyc1B5aGlmYU50QTZieUx6?=
 =?utf-8?B?dEpSMXV0Q3ZWc253MElhcnNJbGcxeVQyQ3huczJ1aDcvZlhNVkpsR29jRmlK?=
 =?utf-8?B?RWR1TkptdGt4dUgxeTVzTlJoMDUzU0E2cVQ1UUgrM292UnZsYi9wQzFwb0xx?=
 =?utf-8?B?TmJoQ2hjR3JCUnA3ZGNjKzRVTUZmS2dRUEIxS3NCdHhyVGtOZHlZQ0VOcnFB?=
 =?utf-8?B?UFVwV25vTStrKzlwYmdROG9oZFpuZ1ZUMjdLd3VvOXpEWW85ZllqQXBJeGYv?=
 =?utf-8?B?SGNQSDZBOEx5Nmd1eEx1N3daU2wzVUdGQm55MGN5QjUwcGNYQjdVMmJKc3pB?=
 =?utf-8?B?TXlNWXorT1lIMU1lWEQ2YloxM0hEZXZnejhCMW8yZThxcy84NmhJak83OWN4?=
 =?utf-8?B?QUljZVNsdzQzV1gxaEcrSG5zcFhpbE9mZG16STZkeG1oeHZwaFR5MTlqbjFk?=
 =?utf-8?B?TytXalZ2eXdTTExUY3lGNnZZdS9aY0ZtcXlLemlHcTJjWGZNekNBSGEzUU4w?=
 =?utf-8?B?MHZOamE4blFFL01walQxeGM0NVBYeWhXVmozOVNuTWc3MWRyMVZDbWkyUDdY?=
 =?utf-8?B?OEtOV3l2ZHZraGpFdUJOdXI3OTd6Q2cvYVlBZDF3T3dtNFlTa1MvTUhoZENJ?=
 =?utf-8?B?TGRrSHhpT0tMNjQ0T1p5WTFQaGZ3SitCek9aMEZwZVd5a2pYcEdYWkRzRCtZ?=
 =?utf-8?B?cnB3dFBkaEJMK1hvZkN4MmhUVE14NVhaWktOYWpCMWJnNS9rSm9CU1M5R0Jp?=
 =?utf-8?B?S0xHVGNwakkvNXozK2FEQlBRVUg0d2VhM2NpV0xjU0dTR01Gc01nTWdQZ3lH?=
 =?utf-8?B?dzExVXBWeDg0NnFHVUJOa2NZckdhbkRxaFE0ZVAyQVlyZmRWU1Q5TlJwU21h?=
 =?utf-8?B?UU1lRUI2MG1Ma3lCd0FUQlJwWDBJa281THk5aFRJdEdtZ05iUXYwZCtwQTAv?=
 =?utf-8?B?cHY5RU52cjNTTHBxUWdhODRmRm84ZXdONVhWR3lqRDVwclNsVjhHdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7962b6e-e84a-48c7-5aa5-08de848f57ea
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 01:40:34.1332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ol3p3AuKeGUQl7cWLE80M9I9j3TOi9Kf5RyhYjCEKE4LyktlIv13iSMbbj8uc/9vbRReyDjpdWBZSRe2zU/dHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507



On 3/17/2026 4:30 PM, Jonathan Grant wrote:
>  From 4eb1a89ef5b481a8bd85bd68735b879e4ed6cb27 Mon Sep 17 00:00:00 2001
> From: Jonathan Grant <jg@jguk.org>
> Date: Sat, 14 Mar 2026 02:11:09 +0000
> Subject: [PATCH] platform/x86: asus-wmi: log thermal notification event
> 
> Print a diagnostic message when the ASUS WMI interface receives event 0x6d.
> This event was observed shortly before thermal shutdown on an ASUS N56VB under
> heavy system load. The message helps diagnose unexpected thermal power-offs.
> 
> Signed-off-by: Jonathan Grant <jg@jguk.org>
> ---
> v3:
>   - do not change unrelated whitespace
>   - address -Wdangling-else by adding braces
> 
>   drivers/platform/x86/asus-wmi.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 7c0915e097ba..3bdd92baac57 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
>   #define NOTIFY_KBD_TTP			0xae
>   #define NOTIFY_LID_FLIP			0xfa
>   #define NOTIFY_LID_FLIP_ROG		0xbd
> +#define NOTIFY_THERMAL			0x6d
>   
>   #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
>   
> @@ -4597,8 +4598,14 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>   		return;
>   
>   	if (!sparse_keymap_report_event(asus->inputdev, code,
> -					key_value, autorelease))
> -		pr_info("Unknown key code 0x%x\n", code);
> +					key_value, autorelease)) {
> +		if (code == NOTIFY_THERMAL) {
> +			pr_info("Thermal state change\n");

Why are you still sending NOTIFY_THERMAL to 
sparse_keymap_report_event()?  It will always fail.

Shouldn't you be catching this earlier in the function like how 
NOTIFY_KBD_FBM and NOTIFY_KBD_TTP work?

> +		}
> +		else {
> +			pr_info("Unknown key code 0x%x\n", code);
> +		}
> +	}
>   }
>   
>   static void asus_wmi_notify(union acpi_object *obj, void *context)

