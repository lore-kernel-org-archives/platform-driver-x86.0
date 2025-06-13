Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E131D6DB5
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826819; cv=fail; b=AOapdru+efYjhaOecxpOm7vuUa7iVluslh6K5VW7QaznpfW6avuoQErHWPfOt2yFPPYsy7sIFHXwwyXeH5vox3wgbbGvjNgaEs+EDRB/6Xjr7yl4/fvl/GTdAZY8rgrVPJCoef+LHP3gIbUuRZ5kXyLEH7qz4jmDhgdV5l5K8vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826819; c=relaxed/simple;
	bh=5ev7IwEGpzjhMkG4dKGhSNm3PRySw3UJWr5x9F0D39Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ek63qiYH5/h1NTsJ327NynrhNYIrGBlrR7T4P3M4FldP72iAmsdzxrMZKYeX3WUQ7YRGBVXrz48utHvcdrT1mtQX4U9OeK8b4KT0rVPcstiz9Y+TRrTXWkOKCfD2CU8bcu21mFAIbruuou5tqFlEeFpjkrulX5PbYvUR9ZzU+4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zvcXPi6b; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zvcXPi6b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJLYEPRFX1zjfhm0API/OmhhQpxQEZuyRGFpBflu3wQJ36NU2u1eplRSrJgx7UChIpEHUAudzNPPRSokiIcESTzQtMi8jMqRy27NHuaoo0X1y6T7eGr1Xg9dI/qusnPca1lhsAF028dM9Oy5Tw6mcBgOMAeS5Uj0HYDei87Pf2Ff+i6EgG3VUgzrW5UdhbJBbwgEYppvZM4L4WSIrJFwRBM/1JgjfcthU/HuBeHdvbrpiYTc7UqdoUOSebE01aP3I0OHGw9ZliRufyEtadRJAbbBsG9QJqqgjhOFczRIMSQINzUhM0itsR6q408QYEGcaHt/E/vWlltE6234YKEpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1a8Ndf5ZU+2tXT6pTQ3VJ8qufm+ERBa99cUvCLmHd7M=;
 b=IKoibWG7OHv/vz6BaVIOq4ojhMIcsEs6UTIYDLQyJ7PH4CHdIJCWyqY33ac7rgnXmxGM6HhhSquSgFDOhv3WCiREfkqe8NPXBNAtQzUiEKPtnNsicDrkTzfCGb4S9XrElaI0iB7hw7zS1gasZU2Rg1SmRdMkeUg592DJ7vV9pSdlaI+04n5MevKAJXMpoF+j94uHTpFIsxNk8sTmHjJ/yshvwgBYsBSw1SsIlc2eqaqQlNMylV4ShnupHba2Z6rC/K0wZN8+fLKCpbGhfTjRa5LZDN/pW2xRdtR5VXFqNo7Ll2ktRMiCyLBEo4tG5dbG1r0eOoRQHalEmtu7N8dofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a8Ndf5ZU+2tXT6pTQ3VJ8qufm+ERBa99cUvCLmHd7M=;
 b=zvcXPi6bqOb6YVbk7FI0s+72nntZZogZCi7X8jsQPdxWNjz7+JC3a+6gNk7MsYPfhsmv2EWR53XGITds6LJTIy/SQY4AdNTaXvROtAAeqwdrm3+OUxXICTD8JDysYUa8FOjC6rzcsWhEO6XdN7HPTKHiogkPXCsUeqJ7Rl5zVK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB9106.namprd12.prod.outlook.com (2603:10b6:806:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 15:00:15 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 15:00:14 +0000
Message-ID: <d5867166-f0e1-42f6-a34f-4a7e33b71b09@amd.com>
Date: Fri, 13 Jun 2025 08:00:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Improve the print messages to
 avoid confusion
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250613114445.1665728-1-suma.hegde@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613114445.1665728-1-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:5:333::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 84897cfb-eb3c-48f1-ace7-08ddaa8b00da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXVpQzhIT2ZXTGdBcUNFRjN3R2NOMFhQTmtxTGZPL3hseThFQWF5c1VrUG5p?=
 =?utf-8?B?bTFIVTgzYTRxMWZ1ekx2KyttQXpzSmtycFRiWm9ZZ3M0RlIrcCsrYmZLdHFV?=
 =?utf-8?B?N0JaWDUwK01Ud01EeUtiOEl0Zmpqa01PdzZYc1k2SWJKS1BVZ2plY3VvU3Er?=
 =?utf-8?B?VjcrOE54b2VSazRyZmhLZjRVWTVFc3FvZFZlYWFRZ3pLMzlseEVXV2o1aWJx?=
 =?utf-8?B?a0MrWlVQa3ZVZWhsZ29POEJiT1NGZ0dPbk9pdXZwbFJJL3Nickg2R1dUUGk0?=
 =?utf-8?B?OEI5NjE5Q0tjZ05yamJTMzdkUmM2ZzN6bjZQNGNyM3RUOGtLQzdYQURzSE80?=
 =?utf-8?B?cmlrWkx5M1lDMUxlVGRKRE8vcEpWQzVJK0xqMjUyQU83QUxUd0ZqRm1KQzhz?=
 =?utf-8?B?dmJnRm9aWldCVDJROGYwV2Q5a2h0Q0c2M0h0OENQQUxKWE95S2FqWXozWFd6?=
 =?utf-8?B?dkNiZVZqY245dVFZRk53YTRTU1BjSjdjUll1SFBWZWhRYzNGeWdxQjMvbWpR?=
 =?utf-8?B?b2JKZ0w1V29xeW5yNVZwMjNwUy9hbXgvN2dIRFJwNlVWR25aU2xZWmRqRG5U?=
 =?utf-8?B?S3ZWRjJLQWlvb1dPRDVWOEtIVUZMQVJ2RDNJajFQRFBpU1IyTE1IekwrV3Q1?=
 =?utf-8?B?MDVla3NqSlpsV3d2SWFzck9zUW5YdktJZVVuWUZZNE5JNENCWithOVdDeVhV?=
 =?utf-8?B?azl5aWRObEo3N0dpb0NuUGV3dENLZzEva09uWDZVMU5waWpQV0F4MXk3MFZD?=
 =?utf-8?B?eEsvK0hSTXMrU2JoR1p3dVp5TG5pRExXcGR4ZW0rTklqZ1ZhRW9KQVZwZ3dx?=
 =?utf-8?B?M1NPdWZnOUVFVTJDeFdmUlFyd0hPN3RIZmRYUndKV2lWbXExbVA3RUhJeWE5?=
 =?utf-8?B?MFNUUWxqQmpPb2l1R2JONy9OSi9OK1hoeWNsR2VBZHd0UHVTYVhJUlJFMk9C?=
 =?utf-8?B?K2NzWW5wUXRiSUw0dzBoSkRLODYxVHg1aUdMTU82SmFlQ2poaWd5WEd4MnBC?=
 =?utf-8?B?S1hmS1dsWEpXa2ZFTmVSd3RmY2VaSFlpL1NKU2xaZUVMQ09OUWhMYTZKOEV5?=
 =?utf-8?B?aGhWTW5Melo1UFJRTTBySlVFT2c1WFNSVHNybzlYZ0ZSeFdWdjNtS2lxTEwx?=
 =?utf-8?B?RkdTM09mNFdmVkJKZ243bmEreXg3aVlSZnBLQ2dzRDg4QVNiaVZBN2c3RlIx?=
 =?utf-8?B?QWpnUDIyYjBZS3htalliSkkvZGFmMEFuTjFiMysyVHpDald2NGpKdW11eXdL?=
 =?utf-8?B?QkpSeDZiK1AzVVlaM0dvM2FjVkt2SXVwRExkNWFJRkJDVlRIdGF1c0R2ZnNp?=
 =?utf-8?B?UjZlRFVGUW1PT0RZMzZzRDJ0OHB0MGo3aGlZL1hKU294dUM2bWdDclpWandE?=
 =?utf-8?B?YlBoSzV2R2pBdnZXRlpNUFFraU1KZmVBWkNOelFDbDBBRmJ5WUN1bGV3dGpt?=
 =?utf-8?B?Ky9lWmlKMHZhT0l5OHFwdG9HYmdFcWQ2SzFoVXZCZFkxTVZZK2ZWMzErM0pE?=
 =?utf-8?B?a1JoVk1CMFFOWU8zN1B4U3o4SHpzaGRwODE3eFJEb0FBbHlCMXA2a2dmcGs0?=
 =?utf-8?B?UElWd2xOeVZIV3lKNENiaFpTR0JLK25hUmM1SzJ3V1NMaTNyWXhFNDNET2pY?=
 =?utf-8?B?c0NMN0t4aEo1MlNraVdCaXp2ZSsrak9tQ1dBYnppUEVhaEY1eVlIRms2ZjYy?=
 =?utf-8?B?eEl6T1dzaHp5ZHgwL1ZPNG5SZHhwSUtuL2pmUExHZnJXM0loYU52TzRwcytD?=
 =?utf-8?B?U25ENkQ2Qmdlbk5ldjFxcElEVnR2OTdGR0xJbnRvWFR5eTlwT2Z6bWFiVjFs?=
 =?utf-8?B?aHhNMzZJSWZPeXV6S2Zxc0ZZdkNmVHh5TG11ekRNbUJ5TUMveFJqcURpOW52?=
 =?utf-8?B?aE44MzQycXprdERhYnFzYjYrcG1kTWtGTFJ5ZGJWUkdCVTdueVJYcUY5S0ZX?=
 =?utf-8?Q?zL+iTvFQYy4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LytidWtvcU4zVkZ5cVBCWFFBQ29DaVRidHA5cmJtVmxvK214SVpyNkxrWktH?=
 =?utf-8?B?MG9iWTk4ZzdmbHU1dUdMZGdablNyZHpqbkRzZTh2MENUeHF0VEg1dnFoY1RO?=
 =?utf-8?B?MEZtK1puK2FyK3lVbGFpbnk5d1MyeTdkcnVDMkxta0tzcUVUdERobHE5SGtp?=
 =?utf-8?B?b3JJWGhiNFRHWWgwQ3hwUVhOS1VkMURpbzNJSm9nblp4OGc4V2tsQ042cnF0?=
 =?utf-8?B?NUlaYUFpNXRlNkxzeHc1YzNyNVZkbk4wTzdSRDZrbUhXKzg4dWRodVpTc3oy?=
 =?utf-8?B?VDlFZUo1Z0o4aE9makk3YjVIT1NCOTlBeDAzMjlxQytTTWFwYUlUVUk1Sk9C?=
 =?utf-8?B?RFpYWXh2U3JSRzVORVN6ME1HeHJVRUhvdHFJSWtRblQzVjF5TGcxRGNQRnZk?=
 =?utf-8?B?cUNYVjVuQ2UzU2JmT2J4dFA5Y1dWVmdXUDlvL0huTkFEVEhXNG9pUFB1ZWY1?=
 =?utf-8?B?eHBuY0dUSlVVUC80S2dBaUFuWlRlWENoQnNpMVY3MHBTN1pUb0hxSUFIazlz?=
 =?utf-8?B?U0hqK2RwcXJNT3JmRGI0WGdRamlhTzV4Z21aMVk2U2htNkFWcmtwQVRhT2My?=
 =?utf-8?B?L0E4ZkxlVU41SjVoeDJGOUlNd0RGeDFYR2VhUVlUTEdrMU85eGRXTmpIcFZa?=
 =?utf-8?B?bUhyVmY3K2huUDFOTVIvMUVMOW50eGlWT2ZJQjEvQ2Z2NVl4VUxXZElGWWJu?=
 =?utf-8?B?dUt5Y0x4KzJSNkt6MVlQaDBSR1oycXNhRmJDVXVpOUxBRFMwVVcyY3gyaDZp?=
 =?utf-8?B?RDgrNzk0VVpmL21LVS9HUFdnMGpJeTFHdGs3c3FYQm1XYnVrdXljSGppUHVK?=
 =?utf-8?B?ZEs0TjZ0Q040R2dSdlIxTFd1Q08rbk42bXUyWEVVdTdFODlKK0JsYW4xcG1W?=
 =?utf-8?B?VVQxRWlHUlFrVm1JNG9YcTVNcVNXb3dBQWZ3d2dYZWtxQm5CT0RuTEVBRHB5?=
 =?utf-8?B?dUVKOHlZaTVyK0JsT1FqVjhvN0UyYnJibkFMTHM5Wm81bUVXVHQ2ZUFCWVRS?=
 =?utf-8?B?Zk9STWY3MU5obVRkUW9MYzJkdk5ob085dDlZY0hYazIwRGlTSkFZYVFRN3Jq?=
 =?utf-8?B?RThLdHVEaFVUTGpMWWRwaHhvSnAvaVZrdHVKK0FocXB1UDZOSWxRZ0lGdmFY?=
 =?utf-8?B?YUhyYVVtODZxWnRNUi80cWNKV1M0VzdKckN0d29xVnJlbFIxOVArZ2xoSk9m?=
 =?utf-8?B?UEV0ZTNBMUxMek5OSFR1ZTVSaTdKam5tbDg1QTZsUWtVS1R4SFFRMTc0Z3kr?=
 =?utf-8?B?OEs0U0kwc3ZKMWhrSTBmK3RlNUJHS0paTEo5VWQ4SVNEbVpFK09GclZydHFN?=
 =?utf-8?B?SDMyZHIrZzZJalc5Vks5T3NZTXN2Vnc2ZzA4OEpFNWY1VXVpYktxa2RZZ2NO?=
 =?utf-8?B?UVJnN3R1TkNiT1ZzRUZNT2ZDd09Pd20vOWlQcE9Gb21uUGphMVIxMXNySEti?=
 =?utf-8?B?dURibkdYQ3VYQ3BPcU56NmV4OG01ZmVpSWl5ZW1xVmFwaHlWUHB6UmMzck5F?=
 =?utf-8?B?S1NrRTlqNlV2aVlFTFh1U2JoU29GUU9lRmIrUnlvLzVDL1BzUGNwTG5kSzVK?=
 =?utf-8?B?N2c4VlFSalpsb21pRFRtQW5OMlBIRUVPUFM3TWw4TlhyU0ZaT1lpMnJzbWFZ?=
 =?utf-8?B?RXVSbWV6dStNZWlHQ0MrL2tTSVZSRG1WWkthdHZwT3FKNyttS0hRZDhBV0Js?=
 =?utf-8?B?U0dJZlUyRGZPN2xMU0ZtNzBYbFpDNW9VUTk4Yk5YNTlqWGE3Vi9FeUhMU3cw?=
 =?utf-8?B?dW83Y2RZQVlnYnpFcDlDSE1qSHQ3WDE3cnlRbHpRWFZkZENGRGlXVFFZZzla?=
 =?utf-8?B?ZUl0VkVkOXlsT2huWVlKeHRYUVg1YlNodVpqVUNvZnNwa2V4ZjFrd0ZmOWU2?=
 =?utf-8?B?MC9PUVJlSlBDYVMySkdiUFNsa2YzUnVkclVGdlJoVEpUNWoxTU83SVBwbWkv?=
 =?utf-8?B?ODl5Tk8yTHRNNFhxWlRZZ1lxZXh6QnhzWnNMVVpsODFyVEpOQ1hYOGl6MDVG?=
 =?utf-8?B?NDl3aGlGdjJWSmRYL2VrSWtuNnQ0dWtBYUwySkxsdEFmVE5JNGVBSlQ2MkE4?=
 =?utf-8?B?SDJqTzVsLzZBVHk4VTVWQjZ4NjBlUndzc2w0MldKN0xJRnBYY1M1eG1LUElv?=
 =?utf-8?Q?FI7FXiFZKxwDdcpwFlB/MB/H6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84897cfb-eb3c-48f1-ace7-08ddaa8b00da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:00:14.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9IACJisTfArNgms219VcU8URRd4KcFAf345TYBuG9hbnu+GX/GWgvCAvXLjPKPp3vCc3gJhga/O/22BjP5JLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9106

On 6/13/2025 4:44 AM, Suma Hegde wrote:
> When the HSMP ACPI device is available, then loading the amd_hsmp.ko
> module incorrectly prints the message "HSMP is not supported on
> Family:%x model:%x\n" despite being supported by the hsmp_acpi.ko
> module, leading to confusion.
> 
> To resolve this, relocate the acpi_dev_present() check to the
> beginning of the hsmp_plt_init() and revise the print message
> to better reflect the current support status.
> 
> Also add messages indicating successful probing for both
> hsmp_acpi.ko and amd_hsmp.ko modules.
> 
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>

Generally this seems really noisy, is it really necessary?  I feel like 
the messages in hsmp_plt_init() have value because they show up in the 
error path.  But in the success path if you don't get a return code it 
should be working.


> ---
>   drivers/platform/x86/amd/hsmp/acpi.c |  1 +
>   drivers/platform/x86/amd/hsmp/plat.c | 17 ++++++++++++-----
>   2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 2f1faa82d13e..b631110e5834 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -610,6 +610,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>   		hsmp_pdev->is_probed = true;
>   	}
>   
> +	dev_info(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
>   	return 0;
>   }
>   
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e3874c47ed9e..724e5c7fc819 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -215,7 +215,12 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	return hsmp_misc_register(&pdev->dev);
> +	ret = hsmp_misc_register(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(&pdev->dev, "AMD HSMP is probed successfully\n");
> +	return 0;
>   }
>   
>   static void hsmp_pltdrv_remove(struct platform_device *pdev)
> @@ -287,15 +292,17 @@ static int __init hsmp_plt_init(void)
>   {
>   	int ret = -ENODEV;
>   
> +	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
> +		pr_info("HSMP is supported through ACPI on this platform, please use hsmp_acpi.ko\n");
> +		return -ENODEV;
> +	}
> +
>   	if (!legacy_hsmp_support()) {
> -		pr_info("HSMP is not supported on Family:%x model:%x\n",
> +		pr_info("HSMP interface is either disabled or not supported on family:%x model:%x\n",
>   			boot_cpu_data.x86, boot_cpu_data.x86_model);
>   		return ret;
>   	}
>   
> -	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
> -		return -ENODEV;
> -
>   	hsmp_pdev = get_hsmp_pdev();
>   	if (!hsmp_pdev)
>   		return -ENOMEM;

