Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFD1854
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722320225; cv=fail; b=AS1rCDrS9LXpgPueYp9O1iWT5p6ygdetPCfuaAyVrXAAHuWABrn2zFkjwkWQ1w8yfar4urgHQl51WdqkrlQqWGqH1L1eLP/E0t6A0F/YnBoy6FlouN4AzQ5CAT2ozgkjZnHwOw7nxeiGxvMi8pC79Hm+TWUTIKmBo3yb/kffreg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722320225; c=relaxed/simple;
	bh=BcFSosd3E9C2uSdok36OPggKAiFPz6ODQmOMCiqbmtc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qU/uTeJ1X1xF7gHXnR/eG310MjXIwgFaGJXub6p7+GKba4Ybz1UHmSDowcKIhNkubbtP4ihOxphz85PbxkGvVmV3seRZCG8gnC+tJ3nQ3R96lTZVnOFnGkhYO+1m0Py96a5h2LzMfq4VMr530i1LJHp9XLmI0REAGhUy217erO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QOuyVJA3; arc=fail smtp.client-ip=40.107.92.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QOuyVJA3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTkWFtL+JJtRL7hearJlq+35/KxCj+Qi9IE6yzSzDdYdS6+aeVQ7KQJPqcplJNEAoRxUmVO3NCfLj8liyF+0UT/QQnwiamgY8V/UU/y0uNyIcxn+2Vi3Xf3smArHMVtH6XebUZaUHv9T8fZZnUpXCAFih0nsUO40f2Pr+wYVLp1LP2GUIXNn4Qz8FcEPsxxpC9oZksyrhNkSpnnOUz/xR2liuHADinGc71yeP6QtCF1clEfVUIh9S38ieqcK4S3ddZREbMGjzOLFwMvMpdhwvPNEqJJ0l8cj/9i7Q1FnkT5giUIv3uSbpWCNzo0sB/5IqmY0f6+4gWHmCx7rIefUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXB0UqUVn0tfgwacIukAxCl6CSscRHAH3uDG/AxZ8PY=;
 b=i+SVOVDOCsyl5EM1E2GwtwfUwBxuZqVUMGftrHQ9hN0oQBbDvS5sgq9ru3YqQdcN0Sij4P3UMRguVYJr5Z2y3wSruOia3ahGxUKpUzZYcRnJK5XlbBDhFnhG8hdPKlYbi5SC4upICqPyABtWVl/mJyAAMSikJy2PZPyh/ETPyWX2SDf44ZfQ7fgcN4gMeXeDEBrdtJ9tleIdTobIj+Kss9YcZjZfKUtkR+xPWuOC7l354ezhdTGPe2vWybyW/uhE4pzaT/DmoAO2sjWRxFlkOXAkxQX9qXa2xjL5OYr0LeNLsNHuggYUmrxGSwpGt7XkcKqIGx0C22DnykJh39q/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXB0UqUVn0tfgwacIukAxCl6CSscRHAH3uDG/AxZ8PY=;
 b=QOuyVJA3jH1aw3nMXQjwv8pc/95KnJMtiKemlof0JOM5GJhw2WeuxvAvUR8vsQwQ0KAHoyGcOuTcTUNRH+FIPzTDHw0fEeEogXHZSgJiQtzGIWXRikNdbnPTlH/yHE+QN2iS1U+OpS6yp8h9qnSxnBbfbX25fa23zP2uyW8wNIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 06:17:00 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 06:16:59 +0000
Message-ID: <79cf8fb7-15c5-49c6-b915-dab275510ebb@amd.com>
Date: Tue, 30 Jul 2024 11:46:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 07/11] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
 <20240720174552.946255-7-suma.hegde@amd.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <20240720174552.946255-7-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::19) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 135b0d2f-43aa-436c-c3c8-08dcb05f389f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlVHVGlqcm5tTU9kdjdsa0gwamE0L2xkZSt4N2hWT0ZTaVVMajRYRzUrN3Iy?=
 =?utf-8?B?Z3lZT2NRa2xoUG5QUEk3SlBMM0tlcTlIN3ZvOXNEWFpkQ2ZOSnBIbzlqeGcx?=
 =?utf-8?B?YWZBcDVrVjBFWnJUNFdmaUx3dzdEZE03bVJ6UWduVjE2YTF0Z0crdFBtVnE5?=
 =?utf-8?B?RzF1M2JFSVR6LzlnZkxCYVRZMUFLS3hXVTdtRGxVczBpakRhR0tnZFdPcnFW?=
 =?utf-8?B?TVA4WVhYbzdMWm9CNGYwTmkyaHJqQTdDKzB2L2lRNnhXaVV1bEdKWU1YSDFF?=
 =?utf-8?B?NHpyck1QNktZYjRORGlEYVB6NXRkS3U3dnpBUDdhOWlvQ2ROSEJHVHdYUHVy?=
 =?utf-8?B?VVRvTjlSdWo1N3dhWk1iNFoyamZJb2ZmUmh2R0t3VjhaYTZkUzN6cnVNcms4?=
 =?utf-8?B?OXoyQXEwL0ZYUFhsZlZBZlFBTHkyUjgvT0NZWEFPVkdKcGZ1cmhDbXVhSW9T?=
 =?utf-8?B?cCtNY0psTzN0Z2FWK0pMNDVPbnREaFNzU3RCNnE2VW1HSm01bHF6ZzBCYkxi?=
 =?utf-8?B?V2x0RW9XamJ6NEJweFBVb1VKd2tNaXl6SWt6QmJLWnprVnJTYXN1dGZNYm5v?=
 =?utf-8?B?TDVyNHRyUU5rREdvZGhQRkZJL0svNzRGR0YycWZ0OHA5NWRvU3h0WVJXbWZN?=
 =?utf-8?B?T2xPbmNBRGdzeHV2WmJJSlNxSkw2Mkdsa1NpaEE0SmJuRUhLZFJvTmhXWVlJ?=
 =?utf-8?B?YjgxQkZCS3pGeGp2ZDV6SldKZW1mTFBQNzYwYUk2a3pEcXdMaVZmbU5BaWV1?=
 =?utf-8?B?clZvUjBWVmtBNjgwZUp5SWhPZU1RV2U2SHMrK0ZyZ3hZVXM4K1dBTEY5QjBB?=
 =?utf-8?B?aENYa0IxWDlCaWkxVVVwMmtDNHlhcWVKcUtpNTErMWk0WDBiMzIrQzNlcXZ3?=
 =?utf-8?B?QzdmOWVZa0ZPeFByV2NRQ0JObGF2TWZwaW5RV1FIcnYvWTlUaktNRUtRY2Iw?=
 =?utf-8?B?b2xmMEh0Q0ZZakdDelJ2Z2tvVkF5Vit1dDNTVmV4TGtweGwwbDhETDhiUXps?=
 =?utf-8?B?cHhBWlgyNXZ5QzFpNjFja2hVemhTS2E3aWtjak0vcjc4QTdzSVRtQU5UVHN4?=
 =?utf-8?B?N0FWcFI4MVEyZGJ1bGk4SjNaSzVDSVAzNG1FRytNbThMYUFKeWNwNXFUdmhs?=
 =?utf-8?B?QlBpdFN3ait2K05rMEFrbmtKMGhsNmEzekdwdEdnOEQ3Y3FmbVppbG4yd09Y?=
 =?utf-8?B?ZjVMVzEwbFlDRU8vYXFYY1ZDWm9zT3Npc0FwM2d2cG53aEhXQWZSc3hGUG5p?=
 =?utf-8?B?RnJ1N0ppY2VQcFVQc2pXZ3ovVThDbUJWczFPeVQ0TVUwb214SHhDLzRoclpj?=
 =?utf-8?B?S0lPLzlONWlDclJZektWWUJoMWlPVjlpcGgzd1RZZ2JkYWk2N09mciszYUEz?=
 =?utf-8?B?NFp2WjJqUWVYdUc4RjJwUS9MQXp2LzZDMERGVXhWUEZiT0x3S1VMdHFQOUhP?=
 =?utf-8?B?anNaZjR4NnJMbnE3RmpVSVlmM3dzUExjQ20zWEhkbUFpaE1YeElFdlJIS01n?=
 =?utf-8?B?dHY0eXRZZ0xHOHpPN2xLN2Njc3N3emNiUjFwdEI1RkI2YThySmtlcHFUU0ow?=
 =?utf-8?B?dU94Y2FqUSsxUjFwTjREYXZITDZuSkNqVW1QZjVrNThCT1FYR05TcWVJR1Uz?=
 =?utf-8?B?L2ZZWXQ0TkVvQ1Nrak15RVRnRXFiWmhISHo0VnJSYzFNZXdlcHBBSzU3ZVh6?=
 =?utf-8?B?ZTR0K2ZzTEZJRzNHeCtYeWpIbWg2cDlNUG1MZzNmRVJrWGRsNTVldDNSdlc5?=
 =?utf-8?B?QXRITnNPbE9MR0F3YUIvTDQzRFlPRDNFNkcrT0hERVRHN0ZOYTVLRW9zQVlD?=
 =?utf-8?B?bm5TS3pERDhlTXM3azZyZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTZuM0Jpc2pnTUw2a1VyVDcvWjgwWXhRbjZJNlRNcmswV0g3cjNCTzM5SHpj?=
 =?utf-8?B?RjlXUHBxV09qTm9ESjZZMjF1VCtpRVBFeUJQVjBnS1hZK2hiQUR0RzNZQkUv?=
 =?utf-8?B?aTN4VTV3NXZBUnl2bFFTcitvUUk4aVg3Nitpdlk3MXQwSmJ5dkdkakZrbDE3?=
 =?utf-8?B?bjhUQXFiN2pYeGs1alJBdzNEU3ozT3NqOS84aFpxVCtKSU5VYVJWaGlnY3Y0?=
 =?utf-8?B?bCtLanBJNkV6ckh5NjgzMTZjVTg3WGF6UWtmMnBNNWtWbXgxOUhvM2luYktj?=
 =?utf-8?B?bWpKbGNQRFQwZWtsOHcwMUVQNk5RL2l2OUczWEIvMVU1MU1zM2Rsdmx4N0xr?=
 =?utf-8?B?ZE1hRkpocVRVRTlCZy82THZTeXdNNmlkUEpDSWo3STc5Y3BHZ3MyM2RNWFNZ?=
 =?utf-8?B?bHhnK1ZCMi9lTGdEa3prUTVpTElDNWF6UFMzb01wMjJKWDFiQkxhRGdVSXBt?=
 =?utf-8?B?UE5NdFg2NU1nbmdXZnE2M3hicWhUa3h3c1diUjV4NWYrRjNNalkvR3ppMFlT?=
 =?utf-8?B?OGVYSGZueFp2OFNNcFJjTzVRS3BIUFBkUDdQRVhLQTlkZ2FnQndhdnBmbjFx?=
 =?utf-8?B?d2x2cTFOVzgyZXZkVmJZdWZNVnRnYUxPVFhPR3d6T2h1Z09iaG5ldlNCajVa?=
 =?utf-8?B?NHJFOFFxR2U4b3YzVTJTUE9sNVJYMVFyYkhmbU93MkhSd1Z6ZFFhaDl3Q2p1?=
 =?utf-8?B?c3ZVc2diNU1lektEWlFTYXdJL0F4QWx0TUNZWmRjNjVpVEhydkQybng4SW5h?=
 =?utf-8?B?MWI0cEhhdHdxM3BtR2V0VkpRMVR4dFFlZ0xZNENtZzFmZ3YrOW0wNURucVhC?=
 =?utf-8?B?Q2pvOGlIMDZyTHpERS9wb21acE0wWEJudldDTXlrU2l2M3lIbkw3akxHTDIy?=
 =?utf-8?B?bFdZWWhIdllYTmhIbUEzRW50bEtKVmY2STRjZWtucGJkUUp5NTdkejV0ZlNn?=
 =?utf-8?B?QnZFNmp4cVFpOU1iSDIrdmJOQ0EvMDR0WVl3WWM2MG0zOW5ZdHVDN2JJaFpQ?=
 =?utf-8?B?ZW5adXRxUUxKdHN5akE3VUM2SkFCbnVFMmZBWThvOTVjTzRvS0FhTUdrNWx3?=
 =?utf-8?B?Qmlsa0NQYkpaU3hkTWY0NnUxWDJxUGtSUUsvanJyVWEwVDRMampmeGtnMnYr?=
 =?utf-8?B?RmdLMFp5cmpwTExhM0laMXdIejVROUhEcnVSdFZQdzJCRVZkWXlWVUo5QTlv?=
 =?utf-8?B?b0R1L2V6TFFFVmZDUXFLNWdrWmtQL1VIRVdFL2J2QmxDcGVNNndsYTRLaVNG?=
 =?utf-8?B?U0Y4S1lKSlU2b0ExVkJTMXhaYXdTemZNb0pyTEoxck9RNVhwUkNnQjJGMXBo?=
 =?utf-8?B?Nk1kTExWVnlVem5wb0NpVWR0Ukp3NDNEMDVZK0tsazh5UDBIVmNTMFVNZE9X?=
 =?utf-8?B?d0xyb3d1MjFvRTF0RS8wNUR6ajYxblk4SFcrcnc0ZWdyNWtRT1k1OFJ4Zjlk?=
 =?utf-8?B?WkIvODliT0VVWXhOUzBUSFh6WnhhVUFva3pFUGhLa1RDeVovcjlXUlhqTEZI?=
 =?utf-8?B?RFQ2TTZtUTVxcnU5aEpheG4ybk9rYWRvTjFmZnl6R3hHQnplM1JZNE9XaUpJ?=
 =?utf-8?B?T0dzNklQY0hUTnlGZFpPNWV2NHF4b0pSRVdVZ1QzRWw5VkVwZFBjOTlrMm9U?=
 =?utf-8?B?ZUIzUE03bS9FQUg3SW11SEUyclN5cWZ0QmV6MWhDZUhiTjI3TFNCR3B3dmJC?=
 =?utf-8?B?TTZJZzVjSkp2K0lTOUFESytzaUwrWXpjVGl1eE10R3V4T2JONWRsdlk0T1BP?=
 =?utf-8?B?Q1ZKVWh0SFRCVzk4Rmh4Mk1yWDQxdXlwbjVoM09vZ2lQemZ5Q1dBdEJjUXRm?=
 =?utf-8?B?ekJmc0R2THROZERQSm1BSHZvNUZVeUlvUzVaaTV0Tm5wd3JDNUgyVmZoSjdP?=
 =?utf-8?B?Zkl3UGVjQWJ2MGc0N2ZnQTAybGJUZFh1TE1DTVJQMHhCdlpoeWN0Sm55Vk5j?=
 =?utf-8?B?NnlSaEZVQkFia3NWWDdVZktObWNXclJRRzl5U0pxdTAyRWVxNlFvR2tDbnhV?=
 =?utf-8?B?OERwZFN1c3ZVSloxT0lLaDlSMml4bmZyVWsyQ0RmYmN1SlNxd3UrT3FiSmtS?=
 =?utf-8?B?b3V5Rjd5bWRBajNpaGhpbXVpSnFYeDhMV3IvdlZ5WGxSM2h2RHh5Y1RPdjli?=
 =?utf-8?Q?EF9FY5QvnbhL7KG+VsM/m9m7K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135b0d2f-43aa-436c-c3c8-08dcb05f389f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 06:16:59.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/KnXfYb+NKvH4nh0MKO6zyEHMoIx59ge7P2zZiDBHmgFOg35l/+Qb631oWHh3iOwldAe6zbkIJJ0OW529BwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287

Hi Ilpo,

Can you please check the Kconfig and Makefile changes and provide your 
feedback?

Thanks and Regards,
Suma

On 7/20/2024 11:15 PM, Suma Hegde wrote:
> Separate the probes for ACPI and platform device drivers.
> Provide a Kconfig option to select either the
> ACPI or the platform device based driver.
>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v2:
> Following files are modified to add new symbol
>   - drivers/platform/x86/amd/hsmp/Kconfig,
>   - drivers/platform/x86/amd/hsmp/Makefile
>   - drivers/platform/x86/amd/Makefile
> AMD_HSMP is used as common symbol and new AMD_HSMP_PLAT symbol is added
>
> Changes since v1:
> Rename "plat_dev" to "hsmp_pdev"
>
>   arch/x86/include/asm/amd_hsmp.h        |   2 +-
>   drivers/platform/x86/amd/Makefile      |   2 +-
>   drivers/platform/x86/amd/hsmp/Kconfig  |  33 ++++++-
>   drivers/platform/x86/amd/hsmp/Makefile |   6 +-
>   drivers/platform/x86/amd/hsmp/acpi.c   | 119 ++++++++++++++++++++++--
>   drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
>   drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>   drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
>   8 files changed, 188 insertions(+), 129 deletions(-)
>
> diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
> index 03c2ce3edaf5..ada14e55f9f4 100644
> --- a/arch/x86/include/asm/amd_hsmp.h
> +++ b/arch/x86/include/asm/amd_hsmp.h
> @@ -5,7 +5,7 @@
>   
>   #include <uapi/asm/amd_hsmp.h>
>   
> -#if IS_ENABLED(CONFIG_AMD_HSMP)
> +#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
>   int hsmp_send_message(struct hsmp_message *msg);
>   #else
>   static inline int hsmp_send_message(struct hsmp_message *msg)
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index 96ec24c8701b..f0b2fe81c685 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -5,6 +5,6 @@
>   #
>   
>   obj-$(CONFIG_AMD_PMC)		+= pmc/
> -obj-y				+= hsmp/
> +obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>   obj-$(CONFIG_AMD_PMF)		+= pmf/
>   obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index b55d4ed9bceb..23fb98066225 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -4,14 +4,39 @@
>   #
>   
>   config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	tristate "AMD Host System Management Port driver"
> +	depends on AMD_NB
>   	help
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
>   	  The driver provides a way for user space tools to monitor and manage
>   	  system management functionality on EPYC server CPUs from AMD.
>   
> -	  Host System Management Port (HSMP) interface is a mailbox interface
> -	  between the x86 core and the System Management Unit (SMU) firmware.
> +menu "AMD HSMP Probe"
> +	depends on AMD_HSMP
> +
> +config AMD_HSMP_ACPI
> +	tristate "ACPI based probe"
> +	depends on ACPI
> +	help
> +	  This driver supports ACPI based probing.
> +
> +	  You may enable this, if your platform bios provides an ACPI object
> +	  as described in the documentation.
>   
>   	  If you choose to compile this driver as a module the module will be
>   	  called amd_hsmp.
> +
> +config AMD_HSMP_PLAT
> +	tristate "Platform device based probe"
> +	depends on AMD_HSMP_ACPI=n
> +	help
> +	  This driver supports platform device based probing.
> +
> +	  You may enable this, if your platform bios does not provide
> +	  HSMP ACPI object.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> +
> +endmenu
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 0cc92865c0a2..18d9a0d1e8c5 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -4,5 +4,7 @@
>   # AMD HSMP Driver
>   #
>   
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o plat.o acpi.o
> +obj-$(CONFIG_AMD_HSMP)			+= amd_hsmp.o
> +amd_hsmp-objs				:= hsmp.o
> +amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)	+= plat.o
> +amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)	+= acpi.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 46cb86d5d550..86100943aadc 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -11,29 +11,43 @@
>   
>   #include "hsmp.h"
>   
> +#include <asm/amd_nb.h>
> +
>   #include <linux/acpi.h>
>   #include <linux/device.h>
>   #include <linux/dev_printk.h>
>   #include <linux/ioport.h>
>   #include <linux/kstrtox.h>
> +#include <linux/platform_device.h>
>   #include <linux/uuid.h>
>   
>   #include <uapi/asm-generic/errno-base.h>
>   
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +
>   /* These are the strings specified in ACPI table */
>   #define MSG_IDOFF_STR		"MsgIdOffset"
>   #define MSG_ARGOFF_STR		"MsgArgOffset"
>   #define MSG_RESPOFF_STR		"MsgRspOffset"
>   
> -void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> -			u32 *value, bool write)
> +static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +			      u32 *value, bool write)
>   {
>   	if (write)
>   		iowrite32(*value, sock->virt_base_addr + offset);
>   	else
>   		*value = ioread32(sock->virt_base_addr + offset);
> +	return 0;
>   }
>   
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
> +};
> +
>   /* This is the UUID used for HSMP */
>   static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>   						0xa6, 0x9f, 0x4e, 0xa2,
> @@ -194,9 +208,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>   	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
>   	int ret;
>   
> -	sock->sock_ind			= sock_ind;
> -	sock->dev			= dev;
> -	hsmp_pdev.is_acpi_device	= true;
> +	sock->sock_ind		= sock_ind;
> +	sock->dev		= dev;
> +	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
>   
>   	sema_init(&sock->hsmp_sem, 1);
>   
> @@ -209,7 +223,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>   	return hsmp_read_acpi_dsd(sock);
>   }
>   
> -int hsmp_create_acpi_sysfs_if(struct device *dev)
> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>   {
>   	struct attribute_group *attr_grp;
>   	u16 sock_ind;
> @@ -232,7 +246,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>   	return devm_device_add_group(dev, attr_grp);
>   }
>   
> -int init_acpi(struct device *dev)
> +static int init_acpi(struct device *dev)
>   {
>   	u16 sock_ind;
>   	int ret;
> @@ -266,3 +280,94 @@ int init_acpi(struct device *dev)
>   
>   	return ret;
>   }
> +
> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> +	{ACPI_HSMP_DEVICE_HID, 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> +
> +static bool check_acpi_support(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +
> +	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
> +		return true;
> +
> +	return false;
> +}
> +
> +static int hsmp_acpi_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	if (!hsmp_pdev.is_probed) {
> +		hsmp_pdev.num_sockets = amd_nb_num();
> +		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> +			return -ENODEV;
> +
> +		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +					      sizeof(*hsmp_pdev.sock),
> +					      GFP_KERNEL);
> +		if (!hsmp_pdev.sock)
> +			return -ENOMEM;
> +	}
> +
> +	if (!check_acpi_support(&pdev->dev)) {
> +		dev_err(&pdev->dev, "Not ACPI device?\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = init_acpi(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
> +		return ret;
> +	}
> +
> +	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +
> +	if (!hsmp_pdev.is_probed) {
> +		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> +		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> +		hsmp_pdev.mdev.fops	= &hsmp_fops;
> +		hsmp_pdev.mdev.parent	= &pdev->dev;
> +		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> +		hsmp_pdev.mdev.mode	= 0644;
> +
> +		ret = misc_register(&hsmp_pdev.mdev);
> +		if (ret)
> +			return ret;
> +		hsmp_pdev.is_probed = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static void hsmp_acpi_remove(struct platform_device *pdev)
> +{
> +	/*
> +	 * We register only one misc_device even on multi-socket system.
> +	 * So, deregister should happen only once.
> +	 */
> +	if (hsmp_pdev.is_probed) {
> +		misc_deregister(&hsmp_pdev.mdev);
> +		hsmp_pdev.is_probed = false;
> +	}
> +}
> +
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_acpi_probe,
> +	.remove_new	= hsmp_acpi_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +		.acpi_match_table = amd_hsmp_acpi_ids,
> +	},
> +};
> +
> +module_platform_driver(amd_hsmp_driver);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 14edaace4379..759ec1d4d60d 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -31,17 +31,6 @@
>   
>   struct hsmp_plat_device hsmp_pdev;
>   
> -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
> -			 u32 *value, bool write)
> -{
> -	if (hsmp_pdev.is_acpi_device)
> -		amd_hsmp_acpi_rdwr(sock, offset, value, write);
> -	else
> -		return amd_hsmp_pci_rdwr(sock, offset, value, write);
> -
> -	return 0;
> -}
> -
>   /*
>    * Send a message to the HSMP port via PCI-e config space registers
>    * or by writing to MMIO space.
> @@ -64,7 +53,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>   
>   	/* Clear the status register */
>   	mbox_status = HSMP_STATUS_NOT_READY;
> -	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
> +	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
>   	if (ret) {
>   		pr_err("Error %d clearing mailbox status register\n", ret);
>   		return ret;
> @@ -73,8 +62,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>   	index = 0;
>   	/* Write any message arguments */
>   	while (index < msg->num_args) {
> -		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> -				    &msg->args[index], HSMP_WR);
> +		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> +					  &msg->args[index], HSMP_WR);
>   		if (ret) {
>   			pr_err("Error %d writing message argument %d\n", ret, index);
>   			return ret;
> @@ -83,7 +72,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>   	}
>   
>   	/* Write the message ID which starts the operation */
> -	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
> +	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
>   	if (ret) {
>   		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
>   		return ret;
> @@ -100,7 +89,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>   	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
>   
>   	while (time_before(jiffies, timeout)) {
> -		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
> +		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
>   		if (ret) {
>   			pr_err("Error %d reading mailbox status\n", ret);
>   			return ret;
> @@ -135,8 +124,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>   	 */
>   	index = 0;
>   	while (index < msg->response_sz) {
> -		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> -				    &msg->args[index], HSMP_RD);
> +		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> +					  &msg->args[index], HSMP_RD);
>   		if (ret) {
>   			pr_err("Error %d reading response %u for message ID:%u\n",
>   			       ret, index, msg->msg_id);
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index a77887d298b6..5d4fc7735a87 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -41,6 +41,7 @@ struct hsmp_socket {
>   	struct pci_dev *root;
>   	struct device *dev;
>   	u16 sock_ind;
> +	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
>   };
>   
>   struct hsmp_plat_device {
> @@ -48,19 +49,14 @@ struct hsmp_plat_device {
>   	struct hsmp_socket *sock;
>   	u32 proto_ver;
>   	u16 num_sockets;
> -	bool is_acpi_device;
>   	bool is_probed;
>   };
>   
>   extern struct hsmp_plat_device hsmp_pdev;
>   
> -int init_acpi(struct device *dev);
>   ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>   			     struct bin_attribute *bin_attr, char *buf,
>   			     loff_t off, size_t count);
> -int hsmp_create_acpi_sysfs_if(struct device *dev);
> -int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> -		      u32 *value, bool write);
>   int hsmp_cache_proto_ver(u16 sock_ind);
>   long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>   umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> @@ -68,6 +64,4 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>   int hsmp_create_attr_list(struct attribute_group *attr_grp,
>   			  struct device *dev, u16 sock_ind);
>   int hsmp_test(u16 sock_ind, u32 value);
> -void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> -			u32 *value, bool write);
>   #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index c297540bb64c..3bce2c570f2b 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -13,15 +13,13 @@
>   
>   #include <asm/amd_nb.h>
>   
> -#include <linux/acpi.h>
>   #include <linux/device.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   #include <linux/platform_device.h>
>   
>   #define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.2"
> -#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +#define DRIVER_VERSION		"2.3"
>   
>   /*
>    * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
> @@ -37,8 +35,8 @@
>   #define HSMP_INDEX_REG		0xc4
>   #define HSMP_DATA_REG		0xc8
>   
> -int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> -		      u32 *value, bool write)
> +static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> +			     u32 *value, bool write)
>   {
>   	int ret;
>   
> @@ -113,6 +111,7 @@ static int init_platform_device(struct device *dev)
>   		sock->sock_ind			= i;
>   		sock->dev			= dev;
>   		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
> +		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
>   
>   		/*
>   		 * This is a transitional change from non-ACPI to ACPI, only
> @@ -146,89 +145,39 @@ static int init_platform_device(struct device *dev)
>   	return 0;
>   }
>   
> -static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> -	{ACPI_HSMP_DEVICE_HID, 0},
> -	{}
> -};
> -MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> -
> -static bool check_acpi_support(struct device *dev)
> -{
> -	struct acpi_device *adev = ACPI_COMPANION(dev);
> -
> -	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
> -		return true;
> -
> -	return false;
> -}
> -
>   static int hsmp_pltdrv_probe(struct platform_device *pdev)
>   {
>   	int ret;
>   
> -	/*
> -	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
> -	 * each socket, so the per socket probing, but the memory allocated for
> -	 * sockets should be contiguous to access it as an array,
> -	 * Hence allocate memory for all the sockets at once instead of allocating
> -	 * on each probe.
> -	 */
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> -					      sizeof(*hsmp_pdev.sock),
> -					      GFP_KERNEL);
> -		if (!hsmp_pdev.sock)
> -			return -ENOMEM;
> -	}
> +	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +				      sizeof(*hsmp_pdev.sock),
> +				      GFP_KERNEL);
> +	if (!hsmp_pdev.sock)
> +		return -ENOMEM;
>   
> -	if (check_acpi_support(&pdev->dev)) {
> -		ret = init_acpi(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -			return ret;
> -		}
> -		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> -		if (ret)
> -			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -	} else {
> -		ret = init_platform_device(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -			return ret;
> -		}
> -		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -		if (ret)
> -			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +	ret = init_platform_device(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +		return ret;
>   	}
>   
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> -		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> -		hsmp_pdev.mdev.fops	= &hsmp_fops;
> -		hsmp_pdev.mdev.parent	= &pdev->dev;
> -		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> -		hsmp_pdev.mdev.mode	= 0644;
> -
> -		ret = misc_register(&hsmp_pdev.mdev);
> -		if (ret)
> -			return ret;
> +	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>   
> -		hsmp_pdev.is_probed = true;
> -	}
> +	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> +	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> +	hsmp_pdev.mdev.fops	= &hsmp_fops;
> +	hsmp_pdev.mdev.parent	= &pdev->dev;
> +	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> +	hsmp_pdev.mdev.mode	= 0644;
>   
> -	return 0;
> +	return misc_register(&hsmp_pdev.mdev);
>   }
>   
>   static void hsmp_pltdrv_remove(struct platform_device *pdev)
>   {
> -	/*
> -	 * We register only one misc_device even on multi socket system.
> -	 * So, deregister should happen only once.
> -	 */
> -	if (hsmp_pdev.is_probed) {
> -		misc_deregister(&hsmp_pdev.mdev);
> -		hsmp_pdev.is_probed = false;
> -	}
> +	misc_deregister(&hsmp_pdev.mdev);
>   }
>   
>   static struct platform_driver amd_hsmp_driver = {
> @@ -236,7 +185,6 @@ static struct platform_driver amd_hsmp_driver = {
>   	.remove_new	= hsmp_pltdrv_remove,
>   	.driver		= {
>   		.name	= DRIVER_NAME,
> -		.acpi_match_table = amd_hsmp_acpi_ids,
>   	},
>   };
>   
> @@ -295,6 +243,12 @@ static int __init hsmp_plt_init(void)
>   {
>   	int ret = -ENODEV;
>   
> +	if (!legacy_hsmp_support()) {
> +		pr_info("HSMP is not supported on Family:%x model:%x\n",
> +			boot_cpu_data.x86, boot_cpu_data.x86_model);
> +		return ret;
> +	}
> +
>   	/*
>   	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
>   	 * if we have N SMN/DF interfaces that ideally means N sockets
> @@ -307,19 +261,9 @@ static int __init hsmp_plt_init(void)
>   	if (ret)
>   		return ret;
>   
> -	if (!hsmp_pdev.is_acpi_device) {
> -		if (legacy_hsmp_support()) {
> -			/* Not ACPI device, but supports HSMP, register a plat_dev */
> -			ret = hsmp_plat_dev_register();
> -		} else {
> -			/* Not ACPI, Does not support HSMP */
> -			pr_info("HSMP is not supported on Family:%x model:%x\n",
> -				boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			ret = -ENODEV;
> -		}
> -		if (ret)
> -			platform_driver_unregister(&amd_hsmp_driver);
> -	}
> +	ret = hsmp_plat_dev_register();
> +	if (ret)
> +		platform_driver_unregister(&amd_hsmp_driver);
>   
>   	return ret;
>   }
