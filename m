Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93928684
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Oct 2024 15:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660053; cv=fail; b=q12gT23pf38oJOB+lKBOiNbox582gXkWFn5DStZKvxY+6T3Dv7N6kgxMSiP9VLMiHXmWfbxY7LpGK+M+HYHHvQorTTZTkgxiAGdCkhWMhXLspoLoWa4lklvJxJu9TBKtYj36MV+zlQ/hoGaH7Q5QRlejORBz4kREZKf7emtaQ7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660053; c=relaxed/simple;
	bh=J0BaGOB7jfgq8HI0XZIPCSoPZwrE5omvaip4VobRpmM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f7agwTdtkeSKTprqeAOQO8gLTgnMziAqEkyvnIVn20LWdq3XZuuCPVtWNBNIO9SvOenYUlhAS5zq5JM9YT84wcV9iZR1rKJRDGM3FQwFwwIfQTuTotoOszwSbJ6HipOlh3faw1PFsgp0kHZubPJnGCsQnlzNHdLyyCTcGhiKCqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b8jEf3Mm; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b8jEf3Mm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXBpITyKDUnEHCQaNVRoFaabP1Mpc1e9s4a2Ee2VkNTPVMaNswLV6V85Buvny/hT+1tCzznbMYBX9zryuUM3vOxDLOeNEur3APWJ1/NzSp8D4iNNFYcwm02oCwa2qZ1Tvs5aTWog8+WnwSpJnUfmX9tdxReVy8NG1qNJ4h8xBxGG7vWpgKGZzAAR0jURbYW62XYuFUDnd2y/iRxo5rLsox5eC0dxuJj+DPuEQBJ3d5istqQkMx+04wPndj08ObONxL50tYxF72boZpvpc7hZgxv+ysFCW3hS1CWo71gPXF3Xovg8/3dbE5s8FzsXznK5bxOrUjxafrgXmi3LXe291w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05/hz9ry6FtgOfizYZZ8Di3VD6OrvR4Dh8GW8R/zLCE=;
 b=UBMaMVunC4J9cqKfkbWfb3Q6uzHxlmejOI3xx8YXSL2wHjGWfe+VYYuAHoeT7/XmUyrIzMwl/eYuYGjW9tNFiPgB1wI0XeHKkphrIkV1jfK3d4cBCbHWWtbvm1gxt6BvymHrxo/XigoktUvNNzmK/NliNddUAnBQ+6uJNPpM2fn9DJtp5Act+Ab5WZuB0uodJRAiL9PzEtA+v7ain6xupSuwkAMVua0VQ0Js5heEwcXq7Bgd/S0PCvhYV1GcdKKAa4fzY0yTp9DVlt9cqPbIZ+9mQ3YyRr2DZI0WfaUX6jlO99XSJj2kpNjRHsreIU1VfhgrYesPUOPv17+vRuX0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05/hz9ry6FtgOfizYZZ8Di3VD6OrvR4Dh8GW8R/zLCE=;
 b=b8jEf3MmSDlPxgenPBjoRHTZyCIIpVEUwO59/+QUzF6yGR4iyAE8whIC2ZWy2GGzeBr7cVtOpqasuhgdSngvdZFtFoy46FyZolRQxfAmgrMfpTkHkDRHEEhDbfCdse37ij3r7gjB4gxB+WuwiYKnLMORliqwoObPpYFy8WXKBNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5033.namprd12.prod.outlook.com (2603:10b6:408:132::14)
 by BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 15:20:46 +0000
Received: from BN9PR12MB5033.namprd12.prod.outlook.com
 ([fe80::deef:fa00:d7d4:5069]) by BN9PR12MB5033.namprd12.prod.outlook.com
 ([fe80::deef:fa00:d7d4:5069%5]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 15:20:46 +0000
Message-ID: <8ad82631-0674-9b5a-6910-4e1451ec6739@amd.com>
Date: Fri, 11 Oct 2024 20:50:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI
 documentation
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
 <20241010094252.3892406-3-Basavaraj.Natikar@amd.com>
 <cca099e4-a40c-4901-bf60-dca50ecbefb5@gmx.de>
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <cca099e4-a40c-4901-bf60-dca50ecbefb5@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::14) To BN9PR12MB5033.namprd12.prod.outlook.com
 (2603:10b6:408:132::14)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5033:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 137671f2-a7a4-4175-469b-08dcea08476d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmRXaGlnZWZHWnZObGtaRXNYYU5sRlU1enJNQkFkZmJjT1RBVC9SSnlyRmdo?=
 =?utf-8?B?MHIvT1J6ay85bEVDdUtvZk1oMEwydVRad0pwZEt0WGFhZDg1eXdtSTRyT09n?=
 =?utf-8?B?NS9XMTVkS2JDNXE0N2FsQ2IwMmhhYTQxSitYYUhDK3l0VnRrT0FKTE50bThp?=
 =?utf-8?B?dVpEdlI0U0ZrU256OW1IN21qSnN3MDZZK1hNcnpjUm9RcEtrTVQycG4vL2ZV?=
 =?utf-8?B?dHU0aWliYldKVWhETEFScDRkenZsdmpqV3FtQ01OdDdLQ3lqakxkVWUzWXlG?=
 =?utf-8?B?eklablpYRW1kNG1JakQ0UFkxd3RJSXcyQ0JmY3JBUU9TMi9BUzN2UTVNcjZS?=
 =?utf-8?B?LzNiV25odk1MdFk4QUZ5cHBycTBhOExaL2EzVEN0ZkdDNFEvRWkrU0p6SG83?=
 =?utf-8?B?V2Z2UlJuUXd1NHcrRy9nbjNaSWJzbW4zQjNTS1JLcFBNdXpIUzgzdUkwbUwx?=
 =?utf-8?B?eEhveVdGbExUTlVYTlVyNkVGTVpiZHF0Zmxzd3BkeVZlUGF1alpPa0Y1Y0lm?=
 =?utf-8?B?MFVNVlBiSVZvRlJCVDV6YUhYMmErRzNIMGpmWnAzaEtQekFOSmpmeWh3ZXA2?=
 =?utf-8?B?aXlBR0RvVFhBTTQzcHlqOG1RRSs4RWJ1cmFublZ6MkY2QnRodU00NGFYUDdt?=
 =?utf-8?B?U2FPSWMwaUllcy9BVlM5VUxLSFk2cUhRekUvZ2hmOE96OU1EenBhekY1aGxp?=
 =?utf-8?B?ZytNV0lUSEhpUWdIR2dxcHN5a3EwbFlqOS83ZWhaVmpKSVRLSHJGMk5ielk0?=
 =?utf-8?B?QVVQbklLaXVONnB2NndOMzlVS1hZR2Y3VlljS1Q5Rys0bjNHOUFiZUZrTXpQ?=
 =?utf-8?B?RXNFRFkwUUY5VjBpcm8wTi9LWmF3MWpIUnRteG9HajJnWEZ3aTZzdGJmRTI2?=
 =?utf-8?B?eUdxdFdzY3VFd3lRL1BaMEdGSHZ6TndNeWZQMXkyVDhxc3dKcy8rRTl6ZVAx?=
 =?utf-8?B?dlltWkRuVTQ1TXVuM1RRRWV6bjRzbE1KZkUvdk5oRWFteWtTWDEyQ1FuU1Nw?=
 =?utf-8?B?WXlQcVNjbHJlcnhFbmJLRm42TTQyL1grT0hvUC9wdExoamRLcGVhMkxaZGxW?=
 =?utf-8?B?Y2VCRnFyYWJVQ0RacFIySTZBM1JmaTI5aXdnWVRCZExUMGZLQ1IyWi8yOHg0?=
 =?utf-8?B?N1FpSFU4eis3Y0JWMFFWMWZSNlBiVkt5T3JoQ25YZjMvYktxSjFiWkcvZ3pJ?=
 =?utf-8?B?emRSZE5ZS2ZiTnhxWEZwdnJrUmZiS3hCWWhFVklmeEJabVc2d05SWDlwSitY?=
 =?utf-8?B?L3A0VzZ2ZEpsdFhUSEkwbEsxRDdzeXZuSlVLT083Wi9NYjlqRnNOQ2trRHl4?=
 =?utf-8?B?cmpnZDc3UDFVMFJQdVFSMFJEZFNLK2UyK1krdWRsQWVJQ0lzL2VFMmpZMG9m?=
 =?utf-8?B?aWoydUFqemZVQXh3Vms2N3YzWWNvalowWkRaQWVQcnpCRkVINE9JcWNOY1Z4?=
 =?utf-8?B?ZHB6UWRmbmEyYUtlY1JYWFl6NVFSdW8zSk9kYzM4V1V2akdsYlpnbEwydmpi?=
 =?utf-8?B?cWRDOEczTnlkOTN3M1N3SWpuVzhqUFdEN0JuQ0I0N1Nxa3hqaHJRZUpMRWtE?=
 =?utf-8?B?dU5hVEpmOGovcWIyQkk1OWZRMDNjZ1htQmZkZElDR2V5THhIZzhWdUZtd0pG?=
 =?utf-8?B?MUtkTnVTeDFoa00zdkZnUXV2QXBhOFM0NGVNbFAzSnlxcWdJTTNKTHlPU3hh?=
 =?utf-8?B?TVhtdStaZHgrRFZDdy9RVGdSTGpHNS8zc0ZnV00vZXZwM2M0b0VjWXRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5033.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkExZFYyYTJ2Q1ludlFVd2hTNHVCQnpBcUJUbXEzUFZLZUo4dFc0WUVzbWs3?=
 =?utf-8?B?TDJSTmpqRnRWWmJtUEFyNnRiTFgxYXNiVU53blloRVdDRlRKdVpsZjBWblN0?=
 =?utf-8?B?TEdDUGx4NFhoV3NNZ2lReFpNQitjTkJDeDdaakpXUUFJTU9yYWFmWkprS01h?=
 =?utf-8?B?QTcvSjlobzlrbDRWcDZ4UlNkckZ5V0U2ZW9aYzJ6QUdFZ0pZM1R4R1Q1RFRT?=
 =?utf-8?B?b0VtTmkwN2tWQjBSKyt2aEV0bmYyL3RJemJGYlEwZzhFdWdWTkFHRTNFbHJP?=
 =?utf-8?B?dGlSbExodmtONkF5VE1TdDVWdkI3MjRIZVVrVWtVWmd5V3ZFU1RCcytPVWhE?=
 =?utf-8?B?cE9Sa3gxcTQ4OWtSR3JTNGFLZG1Yb2dwL1B2ckc1QTZlOTNIM0N2OW4zM011?=
 =?utf-8?B?TlEvVTVoK2FCL21tNzJ4RFZVcGo2eFNiY0QyRGxqRnk1V2FPSFVBVjJnbm5D?=
 =?utf-8?B?a3ZEdCtsaWJGOFhJcDR3azd2L2svZDQ0OE1oS2xycWVSbEExSThOdVdhcE1Y?=
 =?utf-8?B?TWdQODh0U0MvMTZpbkM5Rm9hUFBGK2g5dWgwMFNRWTJFRW9vOUNLY1BLNTBI?=
 =?utf-8?B?TzN4S0FLNTFsck11Wm1hVGZ0VUFPZWVxSVpWYUVydVZadEZQbEhadUhFQmRW?=
 =?utf-8?B?MjBVZ0JIZk0zTGtUbFpxRWl4SVdIQ3NHSXhLY2M1eURnZDhwMDNac2lTWG1E?=
 =?utf-8?B?cmhNMW1sQ2xiMUx1TWh3cXpHMkFXYndnU0dMUFkwd0x6aWFiK3h0ZlJsNVFl?=
 =?utf-8?B?MGthTWZ3VnVqajc2YmVUUmhGRUc0U1R2T3lWdytGNlQ1SkovVU1GbFlJbWQy?=
 =?utf-8?B?SEdmZEJjak5jK05pR1I2MEEyR1lwSkZYMGdiRytFQzF6OUFLTHhiUFJEN1Zo?=
 =?utf-8?B?cCtvVlpURUhKVS83S3RsZjZCMEpTb3RQNy80eVVWek5ra1NqV05palo3UzFk?=
 =?utf-8?B?QmYwYmhTYmlhT1VjMU5zSjVPTHM0emp1Ymc4aFg5NkF4eno2K1dWT2M2dnFV?=
 =?utf-8?B?bU9wQnBiWEd1YXZ0TFpIN1NuZ3BmSVdPQ0s1N0pzOVl1bi9tQzYzdFFoOWxR?=
 =?utf-8?B?aEF5MDdJNXNOQ0psei9VcTZiTkJFSGRydjlObXorMmEvRmNUSnAyZnlYVUtz?=
 =?utf-8?B?cURHMzdFdHk2SXBDUXQ0eklTSUZLQ2R5elBQMDZjZ09sYm52NDhRR1I2YUlQ?=
 =?utf-8?B?djBQS0JkT1Nrdk9aSkI5cEY4Q0IvK0FGWlNnUVAzdW9EbmJKTWpDOFhrNlls?=
 =?utf-8?B?dVpXOHdQS3M5SnVmQ3BjSXg3NkV1ZjVKSnR0eVF6bW9HNFBmd25GaC9HT3dD?=
 =?utf-8?B?bkE1VkxCa005U2tPUjZBbnd4SWR1Rmw4VDU5ZEQwZFovY0s2WDlKMHhVaU11?=
 =?utf-8?B?aFlITE5zcW1aNU9jU2F1dU03VVNuakNGcHcyQjdxRWhCUUVFSHYyc0ZGWm5q?=
 =?utf-8?B?TVAyMUNxenhySVNockhlMkVKNVI0Q2FoTGl6K3cvNzM0WGpudkoya2VxSG9p?=
 =?utf-8?B?YmVBM0thNDVpbGR6Slc4YVVSdTFpZjcyaE9OV0VHakZSKzJXR0xteUc4TEtx?=
 =?utf-8?B?NlY4c2VXODJxcUZMN1cwVEtpZDVLSlF1MDg1L3IxR2FpM2FlK0lYVklFS2pS?=
 =?utf-8?B?Sm4vYmk2SVRXd2pBeC90anFEL2R6Y0xoWlZ3T2l4dS9aMTRnMmllM1ltWDl5?=
 =?utf-8?B?S2dvSGFxTzI2ZFZTRlZ2SG5iZG9NSTRSdVlIOVIxNTdLMWhsdm5CakdUNUwx?=
 =?utf-8?B?eXZlaXVYWGwrUXRqYWpOYWIydzMxYzFlWE91S2Y4MEZsYWRZZ0J6Y0YrRzFa?=
 =?utf-8?B?azdOSGRJc1gzbmRHRStZaVhxcysyRUx5a05oZGVrbFpTbEJ2S0xwb0NzaHZa?=
 =?utf-8?B?dmFLUGx5dExhK3FqYWNFL3RBYUlwdXQzWjRTNW9pWG5qWSthdGJ2djdkUDZy?=
 =?utf-8?B?bmRhYkxwOGJ6ekVwOUdoZEtqU0thZjFISFltekhJV1dyWE5pU0YwLzVvUkhR?=
 =?utf-8?B?Qm1SS3NYanc4a3F6K0pVYWhWRE41VExVOHFYVVVKTWdJZmZhUmQwVGpHajZq?=
 =?utf-8?B?RkFJSW4vTFRaa281Z1Z4cFdaSkdTdzc0RzJFWkxVMG1BTkl0a3VLNFhxSUds?=
 =?utf-8?Q?0T6N7b2KcTyuXx4ki2e167Zi8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137671f2-a7a4-4175-469b-08dcea08476d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5033.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:20:46.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZ3pddt7vgFTUTd8Knr1SmTu9+DkV4ZonpwNlhx3cQJ46rga90WwNdSYzDAkdt5P0cFn9wYcEj/Qmm98G2re8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921


On 10/11/2024 4:53 PM, Armin Wolf wrote:
> Am 10.10.24 um 11:42 schrieb Basavaraj Natikar:
>
>> Add documentation for the amd_3d_vcache sysfs bus platform driver
>> interface so that userspace applications can use it to change mode
>> preferences, either frequency or cache.
>>
>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   .../sysfs-bus-platform-drivers-amd_x3d_vcache      | 14 ++++++++++++++
>>   MAINTAINERS                                        |  1 +
>>   2 files changed, 15 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
>>
>> diff --git 
>> a/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache 
>> b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
>> new file mode 100644
>> index 000000000000..1aa6ed0c10d9
>> --- /dev/null
>> +++ 
>> b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
>> @@ -0,0 +1,14 @@
>> +What: 
>> /sys/bus/platform/drivers/amd_x3d_vcache/AMDI0101\:00/amd_x3d_mode
>
> AMDI0101\:00 -> AMDI0101:00
>
>> +Date:           October 2024
>> +KernelVersion:    6.13
>> +Contact:    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> +Description:    (RW) AMD 3D V-Cache optimizer allows users to switch 
>> CPU core
>> +        rankings dynamically.
>> +
>> +        This file switches between these two modes:
>> +        - "frequency" cores within the faster CCD are prioritized 
>> before
>> +        those in the slower CCD.
>> +        - "cache" cores within the larger L3 CCD are prioritized before
>> +        those in the smaller L3 CCD.
>> +
>> +        Format: %s.
>
> What is the purpose of "Format: %s"?

Input takes string format either "frequency" or "cache"
I will remove above Format to avoid confusion.

Thanks,
--
Basavaraj

> Thanks,
> Armin Wolf
>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 61cb6a294f4c..c7e807770438 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -977,6 +977,7 @@ M:    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>   R:    Mario Limonciello <mario.limonciello@amd.com>
>>   L:    platform-driver-x86@vger.kernel.org
>>   S:    Supported
>> +F: Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
>>   F:    drivers/platform/x86/amd/x3d_vcache.c
>>
>>   AMD ADDRESS TRANSLATION LIBRARY (ATL)

