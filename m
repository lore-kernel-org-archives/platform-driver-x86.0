Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507612571BE;
	Wed, 10 Dec 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765381436; cv=fail; b=Co8whY1Va4cghiBeqgnIXThbf171Yz0Bxoh80dI1haFHv8FeO7jCO07I3RNX0D/wnhMXqH6s6lB2N8hYDSWSZ4aUh5aIQB/rTdzDzjzwJ9Ylfqzew+AGo50BTZKIUrxSz/fL3Z392CPDo51UUq1VdVvOeUjBrU7JRUBZbABRLOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765381436; c=relaxed/simple;
	bh=3Z25c2u1VkmAzVIU9Y7BLrqI/pp0otKnizT5DCZXCkM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=timrpjxWHx9zYu8vuuMK21XmOhrEu9qAtkuzV4u9d4I/ndfqdx5W5gftyP+bt6nPXBQk3gcPxSTorYNdMR50qbwsUORdeN/g+AL3au7PqOHNNNOwQpJz5I6zDmcFQR2eXmPNaGg+ao4spkrACFadsHV9+DCnpyIvWMXekH4drkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ndCdAlWh; arc=fail smtp.client-ip=52.101.46.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ndCdAlWh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJrCbr9vPJeUX8rBS9gauDv7r4VlsJL1xgrGfswLX1vbeA0aSVFtv9X9/XloBMR6xWmEFXNRYN0AASKeh+etlnD3k2wFqUXId1ng8AqsVKxO2FcMKZNU7+Bo1hhbNHh6za6sdxm4Pm3+uG6SeAryY43odkCrXLNFE0E6SyOX3zYypLCP8NkeqHk8VY2N7Ky/HeEqf8AxBVzafeAdOQGhsr4nJM+1zB4xgo96z9ZnKq3b+6Ma8641f1cglbEa1fHJKCNoAxiphmQ+Qf3dInPAli6bduksKBZqsoFqXy4eFZrR3aA7zZPGCfZWnF1NidYv+iMoOzaIuk2ifWZhUk87pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haJg6ZuMV31WBOft+hPKSWhhT/nekCMcsF2xyW1/65o=;
 b=t01lm+hRHPGcME9Gwp/DpZWk8k2UbPoM3EdjPdTwqjtfoxN73na2LOLdQM/EqKxTKGYvFKu6oJKBibMdiIhmzznTXg2Vn6553r4E6y72YtymGQbI+RN8fdBX9S9IUQ/MLh65G3RrV20D70lj8P9hhzfowaOJusrwcJa4fHVZUDO/UaLeyPyggeRGsIUtSljFxggaJt38iHbSyB/dq2wf1Q+t9jw3ut6uXXWVjEkn16fQKwIFVhcbG99nYUc5XO9sxiQcHaUt2L8ExOjKf86zanntikcJmjwgjyxOpLkb2wwjVIt/5dxfc19eyskRXHSLssWv94xo4UDBRXIsPlBqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haJg6ZuMV31WBOft+hPKSWhhT/nekCMcsF2xyW1/65o=;
 b=ndCdAlWh8SHslFvfOfWBS8rn68rfJ9ztWEZee2MQ9w8j39yqXVtm6TTsrbTRhg1xoK9YWrp6tk0oogYRcKGoM+6tD5z213qms/Io/lJRBDeLf7Yrii6EsmaeVnHk0L4GY9rQXcqlIufEf/VJQPeITcA/Z9h+DsnvN9c0Hzs4GAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5594.namprd12.prod.outlook.com (2603:10b6:510:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 15:43:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:43:51 +0000
Message-ID: <21503e42-64c7-4ba1-a6b5-b27cb19af429@amd.com>
Date: Wed, 10 Dec 2025 09:43:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Add sysfs to display
 details of damaged device.
To: Nitin Joshi <nitjoshi@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
 <20251210151133.7933-2-nitjoshi@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251210151133.7933-2-nitjoshi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0184.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0b2e00-1adf-4b83-a15a-08de3802eae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1dPSnR0VGZwU1NWMElxWWZHdldQakswYmlGUGRObzN3ZVZyRTdGb0UzQXhs?=
 =?utf-8?B?MUNyaDJDRWhicnhUaXMydVpnd1RaZU5HQUkzNUZFMTNGdWkwQ2pJREx5WXBy?=
 =?utf-8?B?amN1ajlhZVJSMmFRWlI1WG1xei9VeThJZUFjOVJ5WkZNcnk5djJVZUZhNFBX?=
 =?utf-8?B?MFdpa1lPQ1NsbWxCWS9pRWxqa2dRZnhtUHB2c1JZa0VjOFAzaDhSMVY0Q0Vs?=
 =?utf-8?B?TzJteWJIa0dxbkRreVFIZW9ubTh5WXhlQnNPOFQyREk2Y0Z2d2NKVVFJbnlj?=
 =?utf-8?B?MTE2L3c0eXErYk5BbzNqcjVWWVZqOU5EeUNUeVVKK3ZJRzF6N3lMY1NlV1J4?=
 =?utf-8?B?d3BWMmo0ZzVJdGMwWUZMMkFvUmtjNmlmT3VRSmdGWEJ4R2VXTXNXZjlhelRw?=
 =?utf-8?B?Q1FwUS9VNGQ4K2xxbitobG9GTUYrYnZIUVg5ays1YWQyTjJ0a0laU21zclFm?=
 =?utf-8?B?d3ZaSkVXMnJvcnVWYkhqN24yVnQzMUZ4cDU2OCswZmtCRnRJOHluTEh2Z3ZM?=
 =?utf-8?B?VmlWMHpOdkhUbVk2cGdJNHd4ZFdhSnFKN0pkbkRwKzZBOTE4ZU1rZnlOMmI5?=
 =?utf-8?B?TEJFMVlIdnFibzB1ekZUbk5RalEweHlRN3RIa3ZYc0pMRXNmbkFad0p2Mit3?=
 =?utf-8?B?dVM5S0pBZTdlbWpJODAvcm0vK3kvNGdBQW9OT29NTlU0UG9kM2VJMEZqL1dW?=
 =?utf-8?B?Mm5tWjdPMFNyS2NibW5PbVV6Z1dUaE5oQUluV3lKbHQrQndPMElROS9raW1I?=
 =?utf-8?B?QmRsZE8yVmhSTkdOZEREQkQxeVJXVVpLWXUzK0l0Y0MvUnVKaW5zaXBBTVdn?=
 =?utf-8?B?RW93RUhWd1U1aG1WdExSRTJTR0JLQkt1blV0bFFHQnBjQWpENG5vL0tXWW9a?=
 =?utf-8?B?UmY3dStCc2xweHVXd3BWcit2S3ltM1UwVFZIalNnSXllc29oeGRiTUhDR0xU?=
 =?utf-8?B?dVcrRTJLMXluQ0xQM1lLcGtVWTJ6dkNlYXMxdUVkWmxFMlVFN1RmS2sreW9h?=
 =?utf-8?B?Rjc1OTY1WWFZWEVCUHZZa2hDSkxLeTZIV3Vzck1GcDE1cFhXUGd4VGR1clJv?=
 =?utf-8?B?Q3ZrWmtlWUdLMUlGclh6V1NiNnVsOE95dVhHcklXWU9jVEVBQmY0ZElaeDNZ?=
 =?utf-8?B?M0lldzhRVDB6Z0U5ZXJWWWlxZlFqNFZGTHRYRjRPQXpxcG83MG9peHM0WDdM?=
 =?utf-8?B?VFhMdzN5NnFXckVoM1F4eEllZDNZSzR2cUpLRTZYbFBYYUlJcHlVeEZXOG9a?=
 =?utf-8?B?RTJ4Vk81OUxWSDJ3OUhBTHYvVVlsNm9xVnY5bXhTcGlrNTMvWFhzUVhQVzg0?=
 =?utf-8?B?YkxjSmxoN3NwWWJmcnhmUm5aZ21ibkVNZVZuSjN1aWxmRDdHMENEbDV5UWVx?=
 =?utf-8?B?NGwwZEZyL2J6WWgyMVdWa2c5SHZHRm9ITnhJekJXdURsWUtuaVFrOUxHbFlU?=
 =?utf-8?B?SWNiMnlQalJMMnNhWEpqb0gzRXAyRjh1MUMyQlRoWmtoVlJtdzlQNFdKNGRu?=
 =?utf-8?B?UTFhdmF4K21aVVVFRG0vMUxyTTZaMVV3Z3VJT1VTSDcwT0hzNzVYK3A0WjZJ?=
 =?utf-8?B?NlRLRGpKaGJnQ2g5TFk5OS83Nkl3aDI5aDNmcmt2aytGd2ljd1YzaGpnYTNP?=
 =?utf-8?B?L3E1SEVXYnM0V1YyMThpdFlzM2pBc0JUeHhFOUdlWUZLZnp4RVBLbUQrYVpD?=
 =?utf-8?B?QlNkWm5ZdzZVU0hHTzlKbVZ3Nm92ZEhhcC9HZ29kOE1VRk1VSEc4Zm1QVjRO?=
 =?utf-8?B?ME5VbWlNREF0Ti9jVk1CU1NOZGttN01tQVJna2NYelNrSXluVzVYMm0xRGwy?=
 =?utf-8?B?SkRYMWtDWElUNC9hTTRWTmpCYWtzaW5idUk3WS9TRVdxbEpCOHArTFpnYkgw?=
 =?utf-8?B?OXdRdWdzVTQxSVIyb29tY2VDZnlINExUTG42aHQ5bGhrb0FHRG9sRVRNL0wr?=
 =?utf-8?Q?FznmQXJwOX/sTsAnUrsaGNTkwghXtIIQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk5sSzF5bEE2akM4dlRXZTdrTWIzemdhMHdTZzEzekM2N1hUQkhDcEtYMXZw?=
 =?utf-8?B?YkU4VWx0OENhUEplUjJubnluanVJUnlhc3dtL3hFNUJiVW5ZZ0g0RWlUS01m?=
 =?utf-8?B?N0gvNVF2eUVCVUk0UFVMeXRFa2hVY0sxRjM4Zm9oSlB5dGRmc25DR2dDcnRx?=
 =?utf-8?B?cHI4Z0FzVjhpOERpeVV6V1lUQnh5b09MZU5zdXRiV045bUNCY09aekt3ODU2?=
 =?utf-8?B?Wlg2cGhEUkhQU0dxcXlkWitLSDFwWlNqcUFCZkgySlpkZkpOTkdtakkzbnI3?=
 =?utf-8?B?UUNjcWdRRkQ0ZHYwbWNBSkswSURsTDk4NEZyTW9CVGxodzM2d1FWVU14SXY5?=
 =?utf-8?B?TUp1eVNhWVBqU09TcUV1NkZhWS91Q1pyRjZKTXplQXE2Smt1a1hyNzAxSjFG?=
 =?utf-8?B?WXlHQ1hYcmYzZ2dXS2hSbTlScDdnNmozTlBpakJnNkorUHBzR1BUSWx0WllH?=
 =?utf-8?B?ZjJoOXBKSGxTYmlVOWFxY05lZlpidFVRR1ZWZmNvNThtUEtWUitVdzJDek1k?=
 =?utf-8?B?eW1zWnJMS1hZNHYzWlN5VlkzaGI1VHp3aS8wN29Va0laZlBZRHhDN3h3WHV6?=
 =?utf-8?B?bEhGdjVMTUd5Q1VuMHdLVFo1ZFh4SzY2UHJFR0RLY3d1SFV2c0crcmJ5L0Uv?=
 =?utf-8?B?MktBSnlWeTZEMU1YdWpHUER6K05NczhQRm9Mc3BWdElqTW9sN2s1RmYrdGJx?=
 =?utf-8?B?Q3FSajBuaWozeFNjaXkzc3R3TGR4MTRHRGlFV2VMeEQ1UlVHRC8vWDR1ZHNV?=
 =?utf-8?B?dWExeS81cEpCeFV5bVFnRkdHVEF6OVVFRjBwR2J3SGZ5OWk4UzBPRDNPZmVP?=
 =?utf-8?B?N2ZXTjV2TzlMZEpGMHdXWUNYeWdJc1NKaEJPUEQvcWd1OEt0SEMzTklab3Zj?=
 =?utf-8?B?YjlHQm5TQkVyU3EyV0ltNWg4VEhhSjZaUGtSbTU5dVM5VmxaRzdwRkJFblF2?=
 =?utf-8?B?Rk5ycjJ2eFAvRzcxRjBlZ2JUTTk1ZG9LQ2FGZGdhZGZURkJPaXlnUDVlOGFq?=
 =?utf-8?B?Wk54WXhudDJzbGJETlQzKy80NTc4TTFlalRwc1N3Q2drd0V1TytWRVZFUnli?=
 =?utf-8?B?bisxaXVmV1hITlNxVlhUdnprS0RDUEE0WXBRbWZsSmh6NjdqQ3M3dzQ4aytG?=
 =?utf-8?B?V1QxbWltYm9ta3BVbU01b0p3TWpFSEZxTW1Db2M5b1l3MXRWTVB4NGovYzkz?=
 =?utf-8?B?ZSt4dEppaTVPcmZ1Vjk5UjdXdHNTMGF0NU96Sm5XcG5YczJKZ0lpb1JPdGxC?=
 =?utf-8?B?T2dFbFFaeklFaGVjV2ZvcGltOW81dUx1bktpQ2pUN2UvKzc4M05GRytJMGdF?=
 =?utf-8?B?L1NrZ1MrRnJ0aENQMDg2NnR6NndsZEFRM2lPcE5ZVmlpT01GMHBXQ1p1cmY4?=
 =?utf-8?B?QlZ0bEpRYmdTM0RMbCtZVVZmZUlISmtpS0xCSzA4OHFzc2piY3BIRnJpa1pY?=
 =?utf-8?B?NjJ5VXZSN0pwUHhWa0VTd3J1VnNPa0lTRDlpclNuZS95SDBOemV3Q013UlFz?=
 =?utf-8?B?YU5ud0doSEZNdnE4RE5ucHV5RGNhZXVJd3crZ2Z1bmp1Tm1VbEJTajloN282?=
 =?utf-8?B?b2RLallPWlZjZjJnUFRScUQvY043ZkVTUkRxYnVIdDNQMDVLdkpFTWpnV1lJ?=
 =?utf-8?B?R3B4VHVxRmNBNDIyVUo4VFpTQ0Z4cGdQSFJlSnMrNU1IcFB3RUM3N0tHcGxE?=
 =?utf-8?B?b2duOFpjSmlTWU9CcFRpNklrL0RiWDdMTXhVYVBpMFIraytXeFNabmUyYS8v?=
 =?utf-8?B?MzVEdEU5QzJET0tBb1BuQkpIaXZ3eTFRTGpURXA5MXJnaUJ2ZmdpWmZkRFlK?=
 =?utf-8?B?eHdZTE0wTG9rckxMd3g0am1WTlBwUDB2a3RJQ0VUWHRGRStOYjhQOEtndk9t?=
 =?utf-8?B?YmpCSXlpcXl5TWZWQU10eXI1VndldlVFS01Ga0xYZ1F1MjZjc0R5OU40Wkgw?=
 =?utf-8?B?Uit3Z1B1bVFsdjd0VVdpckNhZ3ZPa2lZUEE1YXhWMm9nWDhpMFJqTVhUSlpJ?=
 =?utf-8?B?K3ZaTC8wQlJZNkFIQ2NDb004Nk1PUVNXcDVGeTlDYUt6dXpqdnR1aFkxS2pZ?=
 =?utf-8?B?Z3l3bjVUTTFGUmhmQWY2aFpzRVEyblhNZGlVdWZZQVNLejVmb1pEWGV2Zm5o?=
 =?utf-8?Q?LvwQH9nKZbuBh+2ekL7euXhbR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0b2e00-1adf-4b83-a15a-08de3802eae6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:43:51.6633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /80Ym7Q1CzOZotBfRmZscKA8mS+EqT0JLVidJh5dhVjDyXNsH4/s4Bmusxy4isp7TmReMYlD4AVGtq0z1r/kjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5594

On 12/10/25 9:11 AM, Nitin Joshi wrote:
> Add new sysfs interface to identify the impacted component with location of
> device.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
> ---
>   .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 112 +++++++++++++++++-
>   2 files changed, 121 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 94349e5f1298..3a9190ac47d0 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
>   Hardware damage detection capability
>   -----------------
>   
> -sysfs attributes: hwdd_status
> +sysfs attributes: hwdd_status, hwdd_detail
>   
>   Thinkpads are adding the ability to detect and report hardware damage.
>   Add new sysfs interface to identify the damaged device status.
> @@ -1594,6 +1594,17 @@ This value displays status of device damaged
>   - 0 = Not Damaged
>   - 1 = Damaged
>   
> +The command to check location of damaged device is::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
> +
> +This value displays location of damaged device having 1 line per damaged "item".
> +For example:
> +if no damage is detected:
> +  No damage detected
> +if damage detected:
> +  TYPE-C: Base, Right side, Center port
> +
>   The property is read-only. If feature is not supported then sysfs
>   attribute is not created.
>   
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 4cf365550bcb..a092d57d995d 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -11089,8 +11089,24 @@ static const struct attribute_group auxmac_attr_group = {
>   #define HWDD_NOT_SUPPORTED	BIT(31)
>   #define HWDD_SUPPORT_USBC	BIT(0)
>   
> -#define PORT_STATUS		GENMASK(7, 4)
> -#define NUM_PORTS		4
> +#define PORT_STATUS     GENMASK(7, 4)
> +#define LID_STATUS      GENMASK(11, 8)
> +#define BASE_STATUS     GENMASK(15, 12)
> +#define POS_STATUS      GENMASK(3, 2)
> +#define PANEL_STATUS    GENMASK(1, 0)
> +
> +#define PORT_DETAIL_OFFSET	16
> +
> +#define PANEL_TOP	0
> +#define PANEL_BASE	1
> +#define PANEL_LEFT	2
> +#define PANEL_RIGHT	3
> +
> +#define POS_LEFT	0
> +#define POS_CENTER	1
> +#define POS_RIGHT	2
> +
> +#define NUM_PORTS	4
>   
>   static bool hwdd_support_available;
>   static bool ucdd_supported;
> @@ -11108,7 +11124,95 @@ static int hwdd_command(int command, int *output)
>   	return 0;
>   }
>   
> -/* sysfs type-c damage detection capability */
> +static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_status)
> +{
> +	unsigned char lid_status, base_status, port_status;
> +	unsigned char loc_status, pos_status, panel_status;
> +	bool damage_detected = false;
> +	int i;
> +
> +	port_status = FIELD_GET(PORT_STATUS, dmg_status);
> +	lid_status = FIELD_GET(LID_STATUS, dmg_status);
> +	base_status = FIELD_GET(BASE_STATUS, dmg_status);
> +	for (i = 0; i < NUM_PORTS; i++) {
> +		if (!(dmg_status & BIT(i)))
> +			continue;
> +
> +		if (port_status & BIT(i)) {
> +			*count += sysfs_emit_at(buf, *count, "%s: ", type);
> +			loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * i))) & 0xF;
> +			pos_status = FIELD_GET(POS_STATUS, loc_status);
> +			panel_status = FIELD_GET(PANEL_STATUS, loc_status);
> +
> +			if (lid_status & BIT(i))
> +				*count += sysfs_emit_at(buf, *count, "Lid, ");
> +			if (base_status & BIT(i))
> +				*count += sysfs_emit_at(buf, *count, "Base, ");
> +
> +			switch (pos_status) {
> +			case PANEL_TOP:
> +				*count += sysfs_emit_at(buf, *count, "Top, ");
> +				break;
> +			case PANEL_BASE:
> +				*count += sysfs_emit_at(buf, *count, "Bottom, ");
> +				break;
> +			case PANEL_LEFT:
> +				*count += sysfs_emit_at(buf, *count, "Left, ");
> +				break;
> +			case PANEL_RIGHT:
> +				*count += sysfs_emit_at(buf, *count, "Right, ");
> +				break;
> +			default:
> +				pr_err("Unexpected value %d in switch statement\n", pos_status);
> +			};
> +
> +			switch (panel_status) {
> +			case POS_LEFT:
> +				*count += sysfs_emit_at(buf, *count, "Left port\n");
> +				break;
> +			case POS_CENTER:
> +				*count += sysfs_emit_at(buf, *count, "Center port\n");
> +				break;
> +			case POS_RIGHT:
> +				*count += sysfs_emit_at(buf, *count, "Right port\n");
> +				break;
> +			default:
> +				*count += sysfs_emit_at(buf, *count, "Undefined\n");
> +				break;
> +			};
> +			damage_detected = true;
> +		}
> +	}
> +	return damage_detected;
> +}
> +
> +/* sysfs type-c damage detection detail */
> +static ssize_t hwdd_detail_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	bool damage_detected = false;
> +	unsigned int damage_status;
> +	int err, count = 0;
> +
> +
> +	if (ucdd_supported) {
> +		/* Get USB TYPE-C damage status */
> +		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
> +		if (err)
> +			return err;
> +
> +		if (display_damage(buf, &count, "Type-C", damage_status))
> +			damage_detected = true;
> +	}

Since this is always visible aren't you missing a case for 
!ucdd_supported?  I would think you should be returning -ENODEV.

Although arguably it would be better to control visibility of the sysfs 
attribute based upon ucdd_supported.  You can simplify 
hwdd_detail_show() too then.

> +
> +	if (!damage_detected)
> +		count += sysfs_emit_at(buf, count, "No damage detected\n");
> +
> +	return count;
> +}
> +
> +/* sysfs typc damage detection capability */
>   static ssize_t hwdd_status_show(struct device *dev,
>   				struct device_attribute *attr,
>   				char *buf)
> @@ -11134,9 +11238,11 @@ static ssize_t hwdd_status_show(struct device *dev,
>   	return sysfs_emit(buf, "0\n");
>   }
>   static DEVICE_ATTR_RO(hwdd_status);
> +static DEVICE_ATTR_RO(hwdd_detail);
>   
>   static struct attribute *hwdd_attributes[] = {
>   	&dev_attr_hwdd_status.attr,
> +	&dev_attr_hwdd_detail.attr,
>   	NULL
>   };
>   

