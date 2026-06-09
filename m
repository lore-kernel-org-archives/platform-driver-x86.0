Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E569D36923F
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016225; cv=fail; b=RO660bQyJPFfNCCU08znmuKV0g9Z9crzMkQwJ75yl5JaqRJqskXIH6I0EHrCxK1RfHar9lQSu0riQaFp1o3RrgADc7G00UkxLX383M354UBFMTD/ZjEEcq7BsXqbtORo7HHse8YP7Wry5YQ6gMA9MecU6GL55IKrPblmjqAS1+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016225; c=relaxed/simple;
	bh=gIv6YNqMHsO1rd2X3n6Y0X3pYvXH/TP7zb8ttbz7jEk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ilkZmiItlJeRa3dY02omfOqDwWDZ8MtgHgoZzOvjtZ6Basp6zf8fhbC2TCRbiWeJB3gb4kTwVEsPgRWSnn98aqGyCDhiZtou1qc7JCFpKZxoSwxbflMR60qBPqMSIfd5yUkDEuuxDh8dSt8RX2kS1rAqYObHLqr4I0+XVngvis8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jeM0lqXA; arc=fail smtp.client-ip=40.107.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jeM0lqXA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYhq6tqy2OaE0/dIsHNzC5JfrbkJI5x7z+WsbbFYlXknxfXRY+hZOKL4/0rGAn8QFm8xXbqbgMUKPuxFsA0Pc7wH986Y7OJbJ9YpyZ59C9xdvXvGh9DOLCV5tmnGa4p29g9TEvXbGI/k+eopm9FzQyeeXCci6KwHuAZhbDZewsDv7JXW96ResXvFw0CtzCz5pRDJ48e8MIHJVJR+SeZAROIeT0DYc0pglWhicELmc+kbv9uChPlW/7vvbWQn8SOQerByfr7/S11PBhljn0dHqpXqBpbfAn4q65NnGSvyDlsuxkKD3+lWNKJlbPZ/8/ynmygapVkMSMnjJ0+T9xIOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrUClwnQ1ANinj2k6CUdX8EdqWQYltB638BkdmsWgbM=;
 b=ZZMGxj3tMK85qpZ6QZ42aiKlbrnvexN35US2P3Md21qL1eSMo4TgmkxfSWvmwYfYsVoTTe4+TMi2ZBQ8fCYHnFB/CHCbDmq5dLqfJQ2HLBJPNbQzua9pMx0GILcTZAJO4/eP9X2pB5SRL+xDeh+E1KIOIZnoxcptw5WBVmLoteIFqrVIGRDp44r15kLdJxvYt2NhBTsXmWkhzWLKkj+p9v5GBzKNM/yYSnlJe4gC+X/k2F7lwmRnYjklF1QpFpA5hfCvhp6s5BtLvPpeU5R5P1jUxgu+ie8ytcL5TV/ufJxyJZnUKtqUXgBf5uxF270+lwonmouLiq5sa+jpRNEjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrUClwnQ1ANinj2k6CUdX8EdqWQYltB638BkdmsWgbM=;
 b=jeM0lqXAhEiAzZM4vwzemQSbpUxuLinjsuDEguxI9zNmUPDjORfqnsbyQL4LhLyLGSeUpHftdZOKtJwhA5lBL4P0skyfOzot+O2TUYYsK0F9/D20aJ61PnOS5jS+HYHkS3j1l+XIopxHmCor3B+RSyIBw33FopKKlkYdOpjgFOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 14:43:37 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:43:37 +0000
Message-ID: <3978ac55-74e1-41dd-a673-92bad4e88f78@amd.com>
Date: Tue, 9 Jun 2026 20:13:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] platform/x86/amd/pmf: Add util layer and userspace
 character device interface
To: Mario Limonciello <mario.limonciello@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Sanket.Goswami@amd.com
References: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
 <20260609081044.2416731-2-Shyam-sundar.S-k@amd.com>
 <c5466ac1-642a-4af1-be2f-d342979d5d0e@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <c5466ac1-642a-4af1-be2f-d342979d5d0e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: ada3b7ed-7fb5-4774-6736-08dec6357d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|6133799003|3023799007|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+Z225/BchYWISV/h0nz7fjObbBo3N8WYY/Zt2cwphw3YebXEA/zA2a/1qccBpHDgLGx8xKwX15gohT1DUgYREWftwO0RTLTAVCTAgiHYfpJ57rQLR36OLsHGXYESGgqKKuihmUmliB0Lz9F3MTg9nBZ4VFwQv9acfd9ZrUFAVYzc6sQvE07ypqslBTlpmhfKmXdZ27OS9wN5sZ6DOJo6nNTxTXiTwNnI59ph9wYWZdmtDKDX+RqtAeUa7Jld51PVjkbH5MYglvLF2qzVdMJpuZi//2IAMPGOGx6hM+G49ehMLz87ErLJfXq07BB65t+iNUr3WgZNh8s9WvH88vw1wI26x0o32hpBJrrfp9/eLv67LXum3J1Vq6HjpuTrEIuH+DJW6dRLno7xKyj+P6T3KKGplXPNtGINRFsUUxqY5C5IsnQs/eUgLWA6KW09IP85BBfgUyJCoohgDOLl7LZOC7RKbd0l3ZALzZqPz/Vjc6WaTXTDTmChX3hABxksiltsU9ragcvh0MvEyPT/NWzDKrM/Bwt6B93FpJ0YEgISw5mamxBGuXlXGUCq2UJZ5qAHUXeuVf60KyOTfNktgnC/3zQYlNtexA8hoLRxX+rbVsFPPLQZoiL4AlyG2df2QRgrv6TapYgvRkHXehBALTts5lOs5wgnOdUtbD1wFZuaY45CC7z/6hCumjw5Bihf8xf+1jfsCY9cvzMq41SFMBsYZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KytDL0MrZUtpUHJJeUVPZlBEMDBWNzJBWWNXVDlPTEZKcGp6c1VLNDE0azgy?=
 =?utf-8?B?ckZsbGxsc0ZLRjRRM2dBT0U0RFJXTEtza05ObWxjcXdBb1dPR1dkMURrYXJ4?=
 =?utf-8?B?ajF5WGVMRFI1d0hoNTgyWXlKUFNzVU1EUHR4YTMwTk5wUFVpRXFyd2NOc21p?=
 =?utf-8?B?VUV0QjVZamtTOGZ4S3hFNHFxd2xpSHE3cGE4aElWdE9jQWlLcDBnSHBlK3lB?=
 =?utf-8?B?TEJHQVF0ZUZPV3ZHNHVlb1FCM2ZhUk1HeXA1SU80bTFPazY0d2F2aVA0d3pX?=
 =?utf-8?B?eWwxY243cXdlQXlDY2Y3V0NOM0tFbU5HV0VXN29hOFQwcjZGTWQ0dm5Zc3l2?=
 =?utf-8?B?RTB3NXhTdlBmSlM0c1FOYmxFbUtSWGlBVllmNE5pcmZZWVZtdXQ1MTFaRFRx?=
 =?utf-8?B?MXVvdGExUHp3U1BNcm83MWszVmJlZmc5S0wva0dKcE9ZU0hNd2wxZEQ5VnBO?=
 =?utf-8?B?bU5ldUdJWis0aThwMytBN25RT3lzUnhrNE9KR2JsWWMrbXhPT09GK0VjbjIr?=
 =?utf-8?B?TXorTkd5eWVFU2ZmbU9SY2VRMDJhSnNnVWFCMmFWYjQ3cmNPcHJ4QmxGQnpP?=
 =?utf-8?B?K01kemF3T0RnKyt1NU9TNDBNcVVJOFNuU1c5MEtmeHFURWFQRlJqREV3TGxZ?=
 =?utf-8?B?TmQ0OHRlVWZrdE0vVlBmZ0VXQlFRU2tDd1dwaEgzcnpsT1RsYUczY1BSTXVp?=
 =?utf-8?B?MG5iZmdxakZRNTc4SWJndjAycDRnbVZ1d0JaOVRIV2djUS82a29NVENBMHU0?=
 =?utf-8?B?bTFjdTcxMjJrMkxNVjJlRzRTeTh0bXh3RkJ0SFljekFJTDhFWXlhc2pWUXFo?=
 =?utf-8?B?cjdhR1lYbTFHMXhhUTB0b2N4N0dydjZVRXY1TkpzM2FkODBzVTZsK3RkeDF0?=
 =?utf-8?B?T2V2aFVxVVRva0RnLzZ0dDh2WGNldm5EZ0FtWXRmdENBVmZjTnhMZDl5SGpr?=
 =?utf-8?B?MmlaTHAzUXhxZHlYOHFOT285TjdaRXpTejAzUWRMMTZVRHdaVFRSMzdWSTh0?=
 =?utf-8?B?NDRPb2psUzdvQ1hFRnRJdnd3elBXYnNFTDdZcXB6WVFvM2V4UU85dmZLNWZP?=
 =?utf-8?B?bTl3MmtnU3ZHQm8vcXhBV3F4dDZ0SHF0RkJhald2TUM0TXlrOXFKcmJvQVZF?=
 =?utf-8?B?N01Jd2RvcGE5cU8wN0FncjMzTmZETmY1eEVhOU1pR3Y0b2dacitQbU9VRENl?=
 =?utf-8?B?NWhGWHg4V3c5c3JPRFdtQVBHVERybmtVeGFUdlY2TVdvYlNPWHkvTVI5ZU82?=
 =?utf-8?B?L2g2NjJxNWd2ZXltRUpMTllJTGFnblpYcVZNeXdBUXBBa0tva3hCSlZGODMw?=
 =?utf-8?B?N0dwVjI3MjNjUWU4M0xpN0VKeGlVUDQ2b3VIdXJCTkhmWVo3Rkp1RFVtV3hY?=
 =?utf-8?B?S2o3Qk1oUUNnN05yWTM0aGlhdnd4WXlWb21RQWRMV3lidVQvRHM4U2d0N3RL?=
 =?utf-8?B?REd1KzVTZzcxK1JKSDJwYUNLbVFoemRxek5HVlFmenlkZGw2SXhyOFppeTls?=
 =?utf-8?B?bWtpNjFGd05DeUdzSTNBT2RrdGs5Z0FaR0haWlZNR3A0OWRGVzdTRSt1K2xh?=
 =?utf-8?B?NW8vMHRZckFudFFPejJ3dk43Q2t2VjlaSENoK0VzSlB2YzFSQkZMZTVzSGtz?=
 =?utf-8?B?RkI4eWZOVXlFblRzSmdmYWtCbTBBeHhpNWErSHlyOU5UV2ZKVW5kQkVBQzJl?=
 =?utf-8?B?a2lnT1MzZ2lSRi9GNmdCZ3FtZHFORXRYQll5KzlvM0NqZS9zZFVYcStZM1J6?=
 =?utf-8?B?Mm5vN3VXcmxhV3NjZ0MrNjFMcFdyM09wNXRnM3ozcmhtZi94TGlSNVc2VS9D?=
 =?utf-8?B?NkUxcEROeGwzLzZrMTVlVWtaa3ZmVjJrVGtHT01yV2xiUkhqSDNHcFFraTdn?=
 =?utf-8?B?d2p5eFQ3YlBPUnhaVkdkRDZkSzZJYTdtSU12cElZandhT05Pc0NXY2tZazdu?=
 =?utf-8?B?ZEZXSXFqN0ljOUdPQ0JMcis1cFRRdlJOUzA4MldteFZ1L2taVkVwOHdLTXlx?=
 =?utf-8?B?dXZKK1h6Rk52eTJaVXhqOXBWMlF2eENiR0lOaDFrMkkvRUloMmR5aFdoM3Zh?=
 =?utf-8?B?dTBvK1Q4WDgrYXpUc25JTHYyS1RaVHdoMUxSemZpbkcya2Q2UG9MWjJWKzVs?=
 =?utf-8?B?WGwybndlaDZSekcxY0xTYUYydHo4TWZnNjJQaHprK1dReDl4SFVSZ1pDOGwz?=
 =?utf-8?B?Mi84dWk1ZVZxcm5YRkJTdG1TRkJycUpVelNyQURUZFpFWGFmS3VMTjNGUDhE?=
 =?utf-8?B?VzVGMWRvSmhTcnlIbXltaFhVZFl4WDJaVWdzampEdkx5eUU2MlZJallPcEhv?=
 =?utf-8?B?ek4xUHBuVkk1c2NXaW1yRnFxS1RCZ3h4ZDlRMmltOVVjNFRqYjh3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada3b7ed-7fb5-4774-6736-08dec6357d2d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:43:37.1391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlX3PW4ULlk02gdPVJOtLDhufRcY03s3QaCPeigxirWTNhzY1ILUt4S6JjQrDEymL7anEbXhJRcja733Gm8zLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264



On 6/9/2026 18:54, Mario Limonciello wrote:
> 
> 
> On 6/9/26 03:10, Shyam Sundar S K wrote:
>> Add a util layer to AMD PMF that exposes a minimal userspace interface
>> via a character device for metrics monitoring and feature discovery.
>>
>> This creates /dev/amdpmf_interface with basic ioctl support to retrieve
>> PMF metrics such as:
>> *  Power source and power slider position
>> *  Platform type, lid state, and user presence
>> *  Skin temperature and ambient light
>> *  BIOS input parameters (1-10)
>> *  Graphics workload metrics
>> *  CPU C-state residency (average and maximum)
>> *  Socket power consumption
>> *  Auto Mode: Automatic power profile switching based on system
>> activity
>> *  Static Power Slider: User-selectable power profiles
>> *  Policy Builder (Smart PC): Action based policy management
>> *  Dynamic Power Slider AC: Adaptive power profiles when on AC power
>> *  Dynamic Power Slider DC: Adaptive power profiles when on battery
>>
>> The interface enables smoother integration with userspace tools such as
>> AMD SystemDeck [1], which is widely used for monitoring and controlling
>> power and thermal behavior on AMD platforms. These tools help designers
>> keep major components within thermal limits to ensure proper operation
>> and enhance overall system stability and reliability.
>>
>> The feature is gated behind the CONFIG_AMD_PMF_UTIL_SUPPORT Kconfig
>> option, allowing it to be disabled if not needed. The implementation
>> uses existing PMF infrastructure to populate data from the TA (Trusted
>> Application) shared memory buffer.
>>
>> Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/Kconfig  | 10 ++++
>>   drivers/platform/x86/amd/pmf/Makefile |  2 +
>>   drivers/platform/x86/amd/pmf/core.c   |  5 ++
>>   drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++
>>   drivers/platform/x86/amd/pmf/util.c   | 68 +++++++++++++++++++++++++
>>   include/uapi/linux/amd-pmf.h          | 71 +++++++++++++++++++++++
>> ++++
>>   6 files changed, 165 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>>   create mode 100644 include/uapi/linux/amd-pmf.h
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/
>> platform/x86/amd/pmf/Kconfig
>> index 25b8f7ae3abd..ad4faf18de47 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
>>        in the PMF config store.
>>          Say Y here to enable more debug logs and Say N here if you
>> are not sure.
>> +
>> +config AMD_PMF_UTIL_SUPPORT
>> +    bool "AMD PMF Util layer support"
>> +    depends on AMD_PMF
> 
> To help with distros getting this right, how would you feel about
> making this include a "default true"?
> 
> This isn't worth spinning the series over if it's the only comment (it
> can be a follow up).

Sure. Will take this into account in the follow on if there are no
further comments on this.

Thanks,
Shyam

> 
>> +    help
>> +      Enabling this option provides a character device for
>> userspace to capture
>> +      PMF features (Smart PC Builder, Auto Mode, Static Power
>> Slider, Dynamic
>> +      Power Slider AC/DC) along with PMF metrics from the AMD PMF
>> driver.
>> +
>> +      Say Y here to enable it and Say N here if you are not sure.
>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/
>> platform/x86/amd/pmf/Makefile
>> index 5978464e0eb7..bf7aad80b9e9 100644
>> --- a/drivers/platform/x86/amd/pmf/Makefile
>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>> @@ -8,3 +8,5 @@ obj-$(CONFIG_AMD_PMF)        += amd-pmf.o
>>   amd-pmf-y             := core.o acpi.o sps.o \
>>                      auto-mode.o cnqf.o \
>>                      tee-if.o spc.o
>> +# Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
>> +amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/
>> x86/amd/pmf/core.c
>> index b9e5a2cf3aae..58d86b4c2828 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -634,6 +634,10 @@ static int amd_pmf_probe(struct platform_device
>> *pdev)
>>         pmf_device = dev->dev;
>>   +    err = amd_pmf_cdev_register(dev);
>> +    if (err)
>> +        dev_warn(dev->dev, "failed to register util interface:
>> %d\n", err);
>> +
>>       dev_info(dev->dev, "registered PMF device successfully\n");
>>         return 0;
>> @@ -643,6 +647,7 @@ static void amd_pmf_remove(struct
>> platform_device *pdev)
>>   {
>>       struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>>   +    amd_pmf_cdev_unregister();
>>       amd_pmf_deinit_features(dev);
>>       if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>>           amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>> x86/amd/pmf/pmf.h
>> index 69fef7448744..6f61076a9386 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -928,4 +928,13 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev,
>> const uuid_t *uuid);
>>   void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
>>   int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev);
>>   +/* Util Layer */
>> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
>> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev);
>> +void amd_pmf_cdev_unregister(void);
>> +#else
>> +static inline int amd_pmf_cdev_register(struct amd_pmf_dev *dev)
>> { return 0; }
>> +static inline void amd_pmf_cdev_unregister(void) {}
>> +#endif
>> +
>>   #endif /* PMF_H */
>> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/
>> x86/amd/pmf/util.c
>> new file mode 100644
>> index 000000000000..f8a283192ffe
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/util.c
>> @@ -0,0 +1,68 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD Platform Management Framework Util Layer
>> + *
>> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + *        Sanket Goswami <Sanket.Goswami@amd.com>
>> + */
>> +
>> +#include <linux/amd-pmf.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/mutex.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include "pmf.h"
>> +
>> +static struct amd_pmf_dev *pmf_dev_handle;
>> +static DEFINE_MUTEX(pmf_util_lock);
>> +
>> +static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd,
>> unsigned long arg)
>> +{
>> +    return -ENOTTY;
>> +}
>> +
>> +static int amd_pmf_open(struct inode *inode, struct file *filp)
>> +{
>> +    guard(mutex)(&pmf_util_lock);
>> +    if (!pmf_dev_handle)
>> +        return -ENODEV;
>> +
>> +    filp->private_data = pmf_dev_handle;
>> +    return 0;
>> +}
>> +
>> +static const struct file_operations pmf_if_ops = {
>> +    .owner          = THIS_MODULE,
>> +    .open           = amd_pmf_open,
>> +    .unlocked_ioctl = amd_pmf_set_ioctl,
>> +};
>> +
>> +static struct miscdevice amd_pmf_util_if = {
>> +    .minor        = MISC_DYNAMIC_MINOR,
>> +    .name        = "amdpmf_interface",
>> +    .fops        = &pmf_if_ops,
>> +};
>> +
>> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev)
>> +{
>> +    int ret;
>> +
>> +    guard(mutex)(&pmf_util_lock);
>> +    pmf_dev_handle = dev;
>> +    ret = misc_register(&amd_pmf_util_if);
>> +    if (ret)
>> +        pmf_dev_handle = NULL;
>> +
>> +    return ret;
>> +}
>> +
>> +void amd_pmf_cdev_unregister(void)
>> +{
>> +    guard(mutex)(&pmf_util_lock);
>> +    if (pmf_dev_handle)
>> +        misc_deregister(&amd_pmf_util_if);
>> +    pmf_dev_handle = NULL;
>> +}
>> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-
>> pmf.h
>> new file mode 100644
>> index 000000000000..bbbd39b2ce15
>> --- /dev/null
>> +++ b/include/uapi/linux/amd-pmf.h
>> @@ -0,0 +1,71 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-
>> note */
>> +/*
>> + * AMD Platform Management Framework (PMF) UAPI Header
>> + *
>> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * This file defines the user-space API for interacting with the
>> AMD PMF
>> + * driver. It provides ioctl interfaces to query platform-specific
>> metrics
>> + * such as power source, slider position, platform type, laptop
>> placement,
>> + * and various BIOS input/output parameters.
>> + */
>> +
>> +#ifndef _UAPI_LINUX_AMD_PMF_H
>> +#define _UAPI_LINUX_AMD_PMF_H
>> +
>> +#include <linux/bits.h>
>> +#include <linux/ioctl.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * AMD_PMF_IOC_MAGIC - Magic number for AMD PMF ioctl commands
>> + *
>> + * This magic number uniquely identifies AMD PMF ioctl operations.
>> + */
>> +#define AMD_PMF_IOC_MAGIC    'p'
>> +
>> +/**
>> + * IOCTL_AMD_PMF_POPULATE_DATA - ioctl command to retrieve PMF
>> metrics data
>> + *
>> + * This ioctl command is used to populate the amd_pmf_info structure
>> + * with the requested PMF metrics information.
>> + */
>> +#define IOCTL_AMD_PMF_POPULATE_DATA        _IOWR(AMD_PMF_IOC_MAGIC,
>> 0x00, __u64)
>> +
>> +#define AMD_PMF_BIOS_PARAMS_MAX        10
>> +
>> +/* AMD PMF feature flags - bitmask indicating supported features */
>> +#define AMD_PMF_FEAT_AUTO_MODE            BIT(0)
>> +#define AMD_PMF_FEAT_STATIC_POWER_SLIDER    BIT(1)
>> +#define AMD_PMF_FEAT_POLICY_BUILDER        BIT(2)
>> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC    BIT(3)
>> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC    BIT(4)
>> +
>> +struct amd_pmf_info {
>> +    __u64 size;
>> +
>> +    /* Feature info */
>> +    __u32 features_supported;
>> +
>> +    /* Power and state info */
>> +    __u32 platform_type;
>> +    __u32 power_source;
>> +    __u32 laptop_placement;
>> +    __u32 lid_state;
>> +    __u32 user_presence;
>> +    __u32 slider_position;
>> +
>> +    /* Thermal and power metrics */
>> +    __s32 skin_temp;
>> +    __u32 gfx_busy;
>> +    __s32 ambient_light;
>> +    __u32 avg_c0_residency;
>> +    __u32 max_c0_residency;
>> +    __u32 socket_power;
>> +
>> +    /* BIOS parameters */
>> +    __u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
>> +};
>> +
>> +#endif /* _UAPI_LINUX_AMD_PMF_H */
> 

