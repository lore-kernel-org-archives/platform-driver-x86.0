Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0F01F8692;
	Tue,  7 Jan 2025 21:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285451; cv=fail; b=WFv7i4hv1Bu9Az9m3Zuc/WN5FFeur4rqr5oNKsWV49FN6bpt0OlCZBeGjbCs9blAitgw32WSo/3hZ37U7182wvZGZnhAy0iL3JS2lnG7o+lY7tlXAtUg6hWCDMKWFVcBaQbCCETjZLMr3RgiqaOgevemKHYgY8n8ZNCkZ5ManY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285451; c=relaxed/simple;
	bh=YJGzskx1xfKBzVzGvYNvfwc7abxtnzQUW6n3avt1ABs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rxBC9qnTKjXfxdaiZLVR47y9VUtP9gKAHULgnNJ3+tmg1pcmjbDkqolZfaVqAhhe/MnmKVLo7OZkwgxRTu4E7Brq1ME4mp9ryW/TszAX7YABbsyXj62e9TDIsjb7bURxLfmOwcP+1b6nlwvy+jY9xTsA98mLrCCd+3HHOKGhp1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Dh2UxBe8; arc=fail smtp.client-ip=40.107.95.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Dh2UxBe8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLuPOXUK9bAj+ClNcvF6HhkRMCcMeKPeIkG2KWWdmJZueYBkYyZ+5DzmFN2mpDeYCNp3CFBqd/TioDoqgvv4iwdeAWHzkUBicMFO0njVyWEiLeWdYWqladKSdfa3cqTihRG0EEb1U6+o7LiRvasNGXUpk+1K86sHEV9VT3IlwsWRxklxX9H7igYjOTz1OsCrw1BaTZm+HZiB/svOgatGzXcHJxiEUZkqaF8iQNhvSZNibkFLQbUNVbInDjiTvFadxMoSeIhS8Zqvb8uNkp6ztJ8GewMjmoSeLF7htUT8qiJsZeMGtQL70RDVQYC7Tq7YysZzNUvCGOJo3Px2z2T/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNUlvgihfoNUM4Hv8JXeanRlBjVxGDPalahp0Dz7vUo=;
 b=hbMTlRK1thUxGsY/FJ10rBYcn5P698GPlJNn21DC2Q9b5tPuWh6DPv8moDUWGxom/hz9J52JMy7EHBwI/YJ8xnKJjjTnrF+QaFIx3omUtInKp+o1oz4YrrzWEmHBE1b8rSuTvwSa6Alipw5r24UtqOcdsLqVOVtiOI1lheAc8ePSt0XveXzyvlbyT/xRnOGQq46w8X5ohFVBGynoJnoayr+u48oN2HihQwxwSDAaOh0aCK3zTiudIXfRRovLdnF5QnO3/QjXGJ8bui+8S1cyd0WYWaYghJ4o5BqcICYvRe/gQk/2WOG6Uwa3WWPEWQ40t8YKuIxKEyytAQtdcdNwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNUlvgihfoNUM4Hv8JXeanRlBjVxGDPalahp0Dz7vUo=;
 b=Dh2UxBe8kyKqzNtCkRE5S7gkAbcVHaYgcJSnyZDlAsP3SNGo9A7/8U5fOXWFO798pNBq1hlMsyanKLBGsac/xuLUheeoSix7fNaknkJBwqnPxoQgk9L64a5a/QmE8g1r+orGUWvpG3HHXlfzbj2EvOkLzbGiDuVfNDoV5K5BKTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:30:43 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:43 +0000
Message-ID: <8595d06d-d84e-4816-89b9-dc498a4dfec4@amd.com>
Date: Tue, 7 Jan 2025 15:30:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] platform/x86: alienware_wmi: General cleanup of
 WMAX methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-8-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-8-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:806:22::11) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a8f22a-2d00-42b6-99a8-08dd2f628a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1dwSlpzdEhka3hjR2M4SGxydUNXNHZvaUQ5Unl5blVCWGZoblJQL1VrLzhn?=
 =?utf-8?B?Zkw4K3kxUkUwYi9LblA5b2FaQ2hwakNWc0tWQWZpR0lXeFlydDErTWNFV3VE?=
 =?utf-8?B?MVhBakhDNXh1UkpIYzZRZ0FzajVaU1RMaHFIVE9ibkJqZ1pIeDlMRHdlYy9I?=
 =?utf-8?B?NjBrYktJQi9JN0ZRcUk2SW4xbzNXNURHbHV6c0NCNFYvUXpNUnJtdVh4dE1X?=
 =?utf-8?B?VEh6T3l6NU1HWktCcm1DMnNYdVNVYWFQWC8yZG5jZzEvYkwxUFJiWXFpU2h6?=
 =?utf-8?B?RjhmZ1d0ZXJkLzNMOG1zaU42MGRBVjZQZDZFQS9Bc0loT1RBRTRhMWhEdnpJ?=
 =?utf-8?B?RU5PM3BRakIwaXBSRUpobVpuMldtVjFLS3UyMGJmdlBHbHRybWxTc0hpT0hN?=
 =?utf-8?B?ZWV0c01LREdld0Z6THV6ZjBndnJjNDNsM24vMUkwOWJxQkJIcTZRVVRDSmZT?=
 =?utf-8?B?N2tiNEE4bVdlL0NTNzBIRGVTRlVBaXQ4U2dBS2h5cVcrNHhoOUVxSmwwL1Vr?=
 =?utf-8?B?WCtBUVJoNCtLaWFWdVRWelJYdE9aWEpsaEFQbFhlLzdaMG44ellWZUhOaldx?=
 =?utf-8?B?S2lXS3h0YUJUT2RMdVBGdXNQOGRqSDdKbHU3YjlpN0ZvYmtST0NaLzZGSy9q?=
 =?utf-8?B?WG5FZElod2RLNUFTSUl4VFhLNWNnd1VVbDBMdS9XUHJONStEQ2lpaURxTFFo?=
 =?utf-8?B?L0orSlUrMGFUVGEvQk9DRjJ2aUNPUG9jbEQyZXVkdEFtRFRRUWxvUi9kUmZZ?=
 =?utf-8?B?VWpVQ2VTaUcvNnErSCszVUpjdUNnN250Rk1RZzRMS3FyeEdNRW4zeGJpVEZD?=
 =?utf-8?B?VTNkTHpPN2EwOUt6S0laNTE4ZFlQMnhHSERNYU8xRzd6Q1RLVzVHcEh6eGJ2?=
 =?utf-8?B?RnFCUlIvb0hUdW9aMUhZVjBDa0Jrc2ltS09jaC9lNGFwb04zMWJUekhRMGsv?=
 =?utf-8?B?K0hhbExiR3hVWk1SNitjcHlXTGRNZGQrYytmU0J5SHBOZkpRY1k2cFBvUTRz?=
 =?utf-8?B?V0RRR09tUThVY3BkT3hJb0RCa3kwZTNPUGpudUhWdmNkeTZZb2NaS3JLYmpD?=
 =?utf-8?B?VXVCaVlvOVZKQW1rKy9LeUtEbDZaYm9JZ2h2TGJHcXpHK2VlcVNOcnhsZWFH?=
 =?utf-8?B?cGoyRnpYSEJPdlJLdXhwRmZQTFNoMkxvTjZUbXpKUmlXT28zakhRNjFEd2Y2?=
 =?utf-8?B?U281RXJjV1NzR2M4amltSmoyVHBrUG1mb0c1ZUhJMWRVQ09QS05ONm9GTEFt?=
 =?utf-8?B?SjFQYm1NTDgrTldPWWlCbThxaFVTZ002N0tETEFHWERkNFZNSXRwUDIwdUdB?=
 =?utf-8?B?RlJXTjd0UFA3bjF4VTVDdGdWVzM1blZGSisrQlpKR1dxTVE3V0NLY2hyb3U4?=
 =?utf-8?B?RWwycjRUU3NmS3lSRzYyYzVTRWdGYW9vdUVTRlkzdENhVEVUTXJWdi95YjBL?=
 =?utf-8?B?TjF0aUd2WXh2WWk5dVpvWndsZU9JSHFOMzRwVHhiYVRFZEpVc01FMWlWbXRt?=
 =?utf-8?B?S0VPM0oyRGxwRUN5Qjc4RkFLMDl3MmtnOWNYMkFDZi9ybW5yNVJFOXd5YXJD?=
 =?utf-8?B?NzdlT1ZqU2RFb2ZKQkFwTTFUUkZ2RzZaR0xjbFZ2OTJtUmExV09IQk5JVmtF?=
 =?utf-8?B?dWhRaFZQY1JRS3JFL0pVaUg0aERzbW1OWVhDajFyTFFGVWpVU1h4OWxGUnZz?=
 =?utf-8?B?ZzluaHlsY3dzS1BSczV2bHFZckcxZ1MzRHZBbkpueGptbUFqU1pzQkdtdjl2?=
 =?utf-8?B?cDdUUUVUN2c3aFVWaW0rWXAzZTdoL1lRZGV1TFZzc2NtUlUzRmQzS0tqYmZN?=
 =?utf-8?B?NDErZnNzbmQ1bE5GcEZuSFFoS0NXYnJNOWhBOFRpdHViRUs4NjViTVByVTZ1?=
 =?utf-8?Q?5/XDi/0q2+++6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xqRWZkL25Uc1YybnZDVittKzhVZ09ZbmtPdHpLYkVYKzd4T2ZLQi9VeW5a?=
 =?utf-8?B?VitoYS92R0hPQVVvNCtiT2Z5TFNLajFiK0p5NFkrTDNTUmJHcFNMSTNGUm8w?=
 =?utf-8?B?VWU3bWxjZEh4T3ZVWGRVeFJTaWx1OVArWjNCTjVYMm1mNlorbFFDZlB5cHo5?=
 =?utf-8?B?MlpQa1dvemZzRTA5RlNuVVZ1TUFhZDI5YkhKT1YrVFUwclA1MHRTS3pObVRx?=
 =?utf-8?B?RWtsRWpheDFXb1c1ZEZ2aFQvVnZnQ2laa1g5SGFETlh4clFyYlRDL3dXaHRr?=
 =?utf-8?B?bTJCZ1g3cDE5QU5YUlNwQjJxVlhjNk9DMENzVXJpbFE5RHJ0UDBLaXBwcnlU?=
 =?utf-8?B?dTRoR1FqMmtpSDk1QmlqSnRpU2dWTkRLS1YzczFUQ3B4dEZNQzNqWlVBOHds?=
 =?utf-8?B?ZklJMlB1dHBtR0tscDJRNm5GN1pSdVNiMlhhaG16VFJ3eDE3YVJWWFM4NDJx?=
 =?utf-8?B?WU5HbW5TNmx2QWpDTXErcWlJa25FUWVHTGUrS2FKQzByUEY4TUdSK1d6NDZG?=
 =?utf-8?B?RHVhL3pGNHZ5SkNOQ2JyeHdSSGI0THBSY0hHYmQ0Sml1TEl4OGY5WHJOSWgw?=
 =?utf-8?B?N2JSVDVvSHg0Rkx6MWJQcFpCVXg5ZkJQckNLOHN1Z2FqaUZseG5iVVdOZTN3?=
 =?utf-8?B?YVovcW5GMHIxNnhuMk9TMlp1akZTcXJEdWFMZ1lYc0l6N2h6OGJBVDlKcDlV?=
 =?utf-8?B?R0FoNXNKTnpyZ0pQRHhLdW9YNTU3Y2swVktKVEFURHlDRWJjZTZ2L3hJayt3?=
 =?utf-8?B?UVIzcjUrckkvSExqMWcyejBsaG9RSEFMTmdEV21NdDBTeXo0UEd1MGJpODBm?=
 =?utf-8?B?ZlFyaHo0dTZsdFRoL0pQYVF1UkxKSGptMlNWR2pDTXA0djVaVzM4Qmt6TC9L?=
 =?utf-8?B?SWJSZkNNRG1LWitIMzdRTDk0dTdvOW1MckNvMk5zM3JaN0wwNHVVSTNoSFhU?=
 =?utf-8?B?cGRhNGVZcS9QVTFTQWlsQTNKYkt0TzUzMkdoemc4WFpITm9sa2RjVStZZEdF?=
 =?utf-8?B?dXhnK3ZjMmt5VGZqRlF3TnVrWnAyZFByU2JSRWwxbEx6bkk5ZUZ3UGt5YW5N?=
 =?utf-8?B?cHNKY2tHeU1NekkrYlUxRHFwcWo4OUxvaEw2d2V5ejdpRlhPTWxJTHRVSWdK?=
 =?utf-8?B?QWtET090MnFMMkUvTzllZ1lUMTJDQ3RVbDNYOTdNYlZyS2g0dnRBY3JOcnlY?=
 =?utf-8?B?SE1oSEpaUjYrbnR6eXhhcmxQa2NiSloyZnRxSGdOY2dOSitmQzFRc1RSbWwz?=
 =?utf-8?B?V0NmKzJoVkZDZHI2VHJHdkNKR2l3WlVQUmlldjZiZUFkNTFpZElRN2pUWEIy?=
 =?utf-8?B?L1BRRFZtZ3dBU1MyNTV6Y1ljTWpLeUc5YmxZczNmU3JqRDZCeTFPYVZ1T2hn?=
 =?utf-8?B?Z0taSDBVVU9vSTRHWjk4SFRPaUIweXFoTzFJY2o5VlJwYk16T1B3a3gxakIv?=
 =?utf-8?B?SzVFUXRDMFBLaENNeDk0Q0N2UDJyeWhjSjhZSDVRT3RUZEwwc3pFMVAxb0Mw?=
 =?utf-8?B?RzdsL2o1Tlp5emxkT1ZKV0RiT005RTE3SnlpNUt4bUZrYStTdk5WT1BuaE11?=
 =?utf-8?B?ajBYcnBXaFRHVEorSHkzM3VmMm1CNU9qcDRER1dDQjRBQkRJMFJ6QzdvTjRh?=
 =?utf-8?B?NVFQcmUycUN0OVdHK3duNzFBM2VOemw3eC9nZ2hCY01LOVBMR3poZlVuMXAx?=
 =?utf-8?B?bGtrOCtHWXZacFdTM1ArMGozZ3hCdDVZTFdlWWRlemhSNlFPLzRtQklyeldn?=
 =?utf-8?B?WG1hWFo0T2tidElhdFJkMWVsUXBZZEk1cGpOa0xhV0JsaEZoZmEzemtNbHJT?=
 =?utf-8?B?dXYyRDdjM0c5bEdsWlg4QWJSV1o3M0o4eWwvc0dqTmtCZGQ3a3VhWXpWU1Q5?=
 =?utf-8?B?YVh1dTRKOWJFQkRmdzEzTzVZQ1NTeG1hMW85V1JIa3dMZWE5WDh5VGt2amkr?=
 =?utf-8?B?UFY4NWRHbFo1ZlZFbUdoRDY3cDZzQzM3QmxocVB3eU9KcmdtaEd2bkF5eEJv?=
 =?utf-8?B?ZmJHdDJsaHUwTGJqN0dqRnVpMklkRUQ1TEZyMXB1ZVNnVUJWb3dBcE9xUWt1?=
 =?utf-8?B?UkV4WktFbnI0UUNvZm5kY1VvcmV6eU8wbzJGWGp1WTV5QVVjRHkzOEw2VTN3?=
 =?utf-8?Q?z/5Y/jjFMsK/uBVoUOTztLoIH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a8f22a-2d00-42b6-99a8-08dd2f628a66
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:43.3547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWS1TziW47ADFtltVljxJc7fV1dqRQ8QdNeaw+dr/TBrnX0NbzHBrnks4TpRu3BoVatpRpm6hIcqfT6L3s5EhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Reorder variable declaration from longest to shortest. Standarize
> show/store method names of WMAX's sysfs groups.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 67 +++++++++++------------
>   1 file changed, 32 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index 418abf46b593..190fee7539bf 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -725,14 +725,14 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
>    *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
>    *	It can toggle between standard system GPU output and HDMI input.
>    */
> -static ssize_t show_hdmi_cable(struct device *dev,
> -			       struct device_attribute *attr, char *buf)
> +static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
> +			  char *buf)
>   {
> -	acpi_status status;
> -	u32 out_data;
>   	struct wmax_basic_args in_args = {
>   		.arg = 0,
>   	};
> +	acpi_status status;
> +	u32 out_data;
>   	status =
>   	    alienware_wmax_command(&in_args, sizeof(in_args),
>   				   WMAX_METHOD_HDMI_CABLE, &out_data);
> @@ -746,14 +746,14 @@ static ssize_t show_hdmi_cable(struct device *dev,
>   	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>   }
>   
> -static ssize_t show_hdmi_source(struct device *dev,
> -				struct device_attribute *attr, char *buf)
> +static ssize_t source_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
>   {
> -	acpi_status status;
> -	u32 out_data;
>   	struct wmax_basic_args in_args = {
>   		.arg = 0,
>   	};
> +	acpi_status status;
> +	u32 out_data;
>   	status =
>   	    alienware_wmax_command(&in_args, sizeof(in_args),
>   				   WMAX_METHOD_HDMI_STATUS, &out_data);
> @@ -768,12 +768,11 @@ static ssize_t show_hdmi_source(struct device *dev,
>   	return sysfs_emit(buf, "input gpu [unknown]\n");
>   }
>   
> -static ssize_t toggle_hdmi_source(struct device *dev,
> -				  struct device_attribute *attr,
> -				  const char *buf, size_t count)
> +static ssize_t source_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
>   {
> -	acpi_status status;
>   	struct wmax_basic_args args;
> +	acpi_status status;
>   	if (strcmp(buf, "gpu\n") == 0)
>   		args.arg = 1;
>   	else if (strcmp(buf, "input\n") == 0)
> @@ -791,9 +790,8 @@ static ssize_t toggle_hdmi_source(struct device *dev,
>   	return count;
>   }
>   
> -static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable, NULL);
> -static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
> -		   toggle_hdmi_source);
> +static DEVICE_ATTR_RO(cable);
> +static DEVICE_ATTR_RW(source);
>   
>   static bool hdmi_group_visible(struct kobject *kobj)
>   {
> @@ -818,14 +816,14 @@ static const struct attribute_group hdmi_attribute_group = {
>    * - Currently supports reading cable status
>    * - Leaving expansion room to possibly support dock/undock events later
>    */
> -static ssize_t show_amplifier_status(struct device *dev,
> -				     struct device_attribute *attr, char *buf)
> +static ssize_t status_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
>   {
> -	acpi_status status;
> -	u32 out_data;
>   	struct wmax_basic_args in_args = {
>   		.arg = 0,
>   	};
> +	acpi_status status;
> +	u32 out_data;
>   	status =
>   	    alienware_wmax_command(&in_args, sizeof(in_args),
>   				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
> @@ -839,7 +837,7 @@ static ssize_t show_amplifier_status(struct device *dev,
>   	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>   }
>   
> -static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
> +static DEVICE_ATTR_RO(status);
>   
>   static bool amplifier_group_visible(struct kobject *kobj)
>   {
> @@ -862,14 +860,14 @@ static const struct attribute_group amplifier_attribute_group = {
>    * Deep Sleep Control support
>    * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
>    */
> -static ssize_t show_deepsleep_status(struct device *dev,
> -				     struct device_attribute *attr, char *buf)
> +static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
>   {
> -	acpi_status status;
> -	u32 out_data;
>   	struct wmax_basic_args in_args = {
>   		.arg = 0,
>   	};
> +	acpi_status status;
> +	u32 out_data;
>   	status = alienware_wmax_command(&in_args, sizeof(in_args),
>   					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
>   	if (ACPI_SUCCESS(status)) {
> @@ -884,12 +882,11 @@ static ssize_t show_deepsleep_status(struct device *dev,
>   	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
>   }
>   
> -static ssize_t toggle_deepsleep(struct device *dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count)
>   {
> -	acpi_status status;
>   	struct wmax_basic_args args;
> +	acpi_status status;
>   
>   	if (strcmp(buf, "disabled\n") == 0)
>   		args.arg = 0;
> @@ -908,7 +905,7 @@ static ssize_t toggle_deepsleep(struct device *dev,
>   	return count;
>   }
>   
> -static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status, toggle_deepsleep);
> +static DEVICE_ATTR_RW(deepsleep);
>   
>   static bool deepsleep_group_visible(struct kobject *kobj)
>   {
> @@ -956,13 +953,13 @@ static bool is_wmax_thermal_code(u32 code)
>   
>   static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args = {
>   		.operation = operation,
>   		.arg1 = arg,
>   		.arg2 = 0,
>   		.arg3 = 0,
>   	};
> +	acpi_status status;
>   
>   	status = alienware_wmax_command(&in_args, sizeof(in_args),
>   					WMAX_METHOD_THERMAL_INFORMATION,
> @@ -979,13 +976,13 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
>   
>   static int wmax_thermal_control(u8 profile)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args = {
>   		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
>   		.arg1 = profile,
>   		.arg2 = 0,
>   		.arg3 = 0,
>   	};
> +	acpi_status status;
>   	u32 out_data;
>   
>   	status = alienware_wmax_command(&in_args, sizeof(in_args),
> @@ -1003,13 +1000,13 @@ static int wmax_thermal_control(u8 profile)
>   
>   static int wmax_game_shift_status(u8 operation, u32 *out_data)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args = {
>   		.operation = operation,
>   		.arg1 = 0,
>   		.arg2 = 0,
>   		.arg3 = 0,
>   	};
> +	acpi_status status;
>   
>   	status = alienware_wmax_command(&in_args, sizeof(in_args),
>   					WMAX_METHOD_GAME_SHIFT_STATUS,
> @@ -1078,11 +1075,11 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
>   
>   static int create_thermal_profile(struct platform_device *platform_device)
>   {
> -	u32 out_data;
> +	enum platform_profile_option profile;
> +	enum wmax_thermal_mode mode;
>   	u8 sys_desc[4];
>   	u32 first_mode;
> -	enum wmax_thermal_mode mode;
> -	enum platform_profile_option profile;
> +	u32 out_data;
>   	int ret;
>   
>   	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,

