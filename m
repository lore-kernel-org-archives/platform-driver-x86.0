Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D01F8AE4;
	Tue,  7 Jan 2025 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285428; cv=fail; b=AVRYgqGIkH3oBBefpZivvU0X0VHXMaS1b8G9QgMTrTdbDy/hWWq99OgoecJG4fKLiq1cI3Y1eKEV1NGfF8oHo9MhQRSB+tQpZd8oMGvas2b2wCVPFyADEwq96XlTiQ/VSkggZeJ0qhtZTOfN2clR1DzlwdjVpxrtx6UshFu78o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285428; c=relaxed/simple;
	bh=Y0iJP8KjdG/Ae6rT2b6/lNGJJsvNJ/tDQZbVEw6nwO0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sa2Awhq0Bht+NAXyPxbCkmTrp2eH2gCc2Hkqm+Ws6v8woHL2wTNq4B818/wBxetie4x4BhlwkFYiasRApXlf6yZczKgZTr+SvG4Km/c2VUXlmvKVn8h2QqMZHcEBmiUP7W+PSxNfgVdIXu097oOe4i15XdreWmYCu7de45/8MG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eECSSekT; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eECSSekT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL8MBlmzXQfi+cFy/+Lr6A7iwPDxZrKwV+GMj6Z1lm4iFYlVS8ZgsI0pkh4EpyUH8n9uZxP3I7AisE5K+gaxvMPOXfvHKOnHb1Ibr/cWsI6Zj372OKsys0jvSXl2ff+j6WkmhMtlQ5Xf9RJ/PtvTHyw+VJfqvZwioRE9WWlWONq6NBfLPx4MH0fxNBUne7CBJTpzRXwnzp/uPFpT3q/kqWigOSs+uPpycKFOlonS4CIaZM2ypSN7R1+xwOaMjPi/rVPh6bKRRuavbCbHm8sCny2APKijPVwcZyY5fXVaif9Jj6MlO5yVw3Ax7GfXOHpqXVFQxon/+rrpTl21nKfbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtJHeoH6uPwmQoK7ZfVLsEa8FnLAlu/3FMIZFlib5o4=;
 b=IbBzRIqG1D6/rQh/6yCLikdRjJKyfm+FLP74Wd2oDKETpVoJ03Ftxx+dOlFxdv+mCuWy8usg6g2z6mEYgp7p0KVUqDmizhPqJ7ITfmWhB9QW0PE+bb6lR49ql175jJ2zrTOkwgT1fHrrpT8jbY8c2II3jHSZeNb3N8t1L83AIHLcbhB5ehA5Q6tjq6zQD/zeicACUZVVDRl8rh+DGyYvNw4csn5563QINY05GNqwt6vbAEHtom+w3fwP5kYXT8u6uuhPKyXd94WFQCsgQojKO73FtTN0HptVPLDYdywan9Rc651Y42R9PyDWidrYo2MkqgSMJBvYPUkf6SzjmrKZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtJHeoH6uPwmQoK7ZfVLsEa8FnLAlu/3FMIZFlib5o4=;
 b=eECSSekTOvEmK8fLdaQQa3XNHAPAok4n08NglFpyBJfZXUj9ym3ogqCXZhY8KIzanLCfZh54SrhPHWN78RXIuDCFuWW4XlkEJPLpUdVx4eBIS79CQQS17uy+K51Jr5DKhQ6MkemsK9uxn96+VDkVffnEaQhd4hS6GZjGZKnCNN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:30:20 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:20 +0000
Message-ID: <d2b4e5b3-1a17-4a89-abae-c6d67e0569c2@amd.com>
Date: Tue, 7 Jan 2025 15:30:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] platform/x86: alienware-wmi: Move Lighting
 Control State
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-4-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-4-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:806:22::29) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a190e4-6ebc-4521-60ce-08dd2f627cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTlLRExuL3FNc1Q3TGJEc3NKZXN0M3VSckJzVGs4NDMrQTJTMWJ2MEF6YzZi?=
 =?utf-8?B?RUhMNjZMS0Y0bWtPcjJ2RnYxRnVkZEVmYUdRbXgxbmhySmpXTXZWNllLRjdu?=
 =?utf-8?B?WTdYM3NMNkpHWjN6anZ3T2FBdy84aHZET3F6UTRjUENzRUJ1Tm9mbE5aM2VQ?=
 =?utf-8?B?dVB6b1JNTnFyczVSZ2E0a2ZxU3QweU9IbGpQVmpMdHRMRm9EeXRVbEtadld2?=
 =?utf-8?B?RDdncGtNRHcvaHpsWkxXbCtsRnpGZ2xLMCs3anRSNGJBcFZ6OGRLR3czOElq?=
 =?utf-8?B?SW5BdzFsMFVrSnVXc29ObUJYTUxFakZRejNvK2Z4VHVnclk2MXJZMEYyc2I2?=
 =?utf-8?B?bGVUN1hvamRFdFYwZDFISXlBVEE1cDRYVWMwQWVoRmdZQWFUVDhJRHEyZko0?=
 =?utf-8?B?dnhBWW93RSs3SXErd1NIajNPeU9IREJxUURNY2d4TG13R0dJSzRLMG5yRXFh?=
 =?utf-8?B?UzBvK3BZWnQ1SkE4UnU1ZDM4RW81QTVyckpyeFpyUFpKbGRxTWxtQjNMT2I1?=
 =?utf-8?B?blluMlM0UXEyemZLdkhVV3FodXBFVVAvandKMHJZSGozZzlleHdPQUFQNWZn?=
 =?utf-8?B?elNiR1Jzd3dxWGUvSVNIcG9XbExyeWpqOXFTbU8vYUxDVmY3Q1U0dm13eDdB?=
 =?utf-8?B?Sy9YTFBjejM3ZFdBQzYwdVBxU3VhUVZNR2M2VXMvdmhWUE52OGpIaHdZTENJ?=
 =?utf-8?B?RkM5NWFzSGRBaFpTTHJEc21JWGdqeHBWWS94YUFMVGw5VlZLS081VzNEcVQ3?=
 =?utf-8?B?SjRPc05DUC9wZnRKcFpBWTdHVFNwTlM0UEhoNlJRcFpqVWkybHJiM2FPYkVJ?=
 =?utf-8?B?YXBuRFNtMnk2OFNTcWtKMml4QXlLMy9LK2c0MWNkTktmNGJsTThWem13a0VJ?=
 =?utf-8?B?M0ExdGV5eFZBMHZ2bWNwL1k0Vy9ZeUNad1N6dlEwZHdDalhReTBMaVFaU3ho?=
 =?utf-8?B?bmNRL1ZmeTgvdDlHTWJkYWNBUTN2QVZYNm9RdUNUQjV4UDhuUVhFR2VpN3pQ?=
 =?utf-8?B?dzE2ZVE2bjhJb1FCcFdWRk10QkxnZXFBMVRLU2dqOEdwRU9qWkdBYTdSUnla?=
 =?utf-8?B?aks1aWVjTkNpK3pIeHJreGZaalFTb3JTSjBUc3VVUmhOcCtUN0s4eXQ4eHF0?=
 =?utf-8?B?YnMzK2VsSzZBdnFZZzZhUVdZQ2ZseHR6OVZHU2doNlc4aXlhb3MveXJjWDhB?=
 =?utf-8?B?Q0VvaWN4Nmc0cnVmZ0h0QTg3Z0twbmtnbUdxeEROaml1WUJpVWIvQWlVT1dP?=
 =?utf-8?B?ODRiRE9rU1cxcEZwVWliSXJiQXdWMURvMUxabU5JOWxVNlVpWjliZzgwN3du?=
 =?utf-8?B?enNGUlBnVDNHVjc4dVRlaHNTQitRakRmK2RCanBYQ1BJL1lOVW5TdHdmYUtY?=
 =?utf-8?B?TGlBWkRrRGdyaVl1NU9oTnpmOTgzb0pnYlVicEdrNWxscXUwMmhUYlVMUENv?=
 =?utf-8?B?QXYvaGRVTXdOUEY5aVZSUmYwZWRJdmg3NytPSWMwbXhES2xMTHhHSEZFYzlM?=
 =?utf-8?B?MTEwRjVhTGh0cVRKbUV1cEhTSlR5YTJEQzBSRFA5N0pQbm5kcEJaWFBOUTg5?=
 =?utf-8?B?U2QxZzFha1hhQUNVWWMwQTJaMXFiMVRSTGJQNkpMMFpRSEduNVFRMXpnQTB1?=
 =?utf-8?B?S2tTVW1WVU9HUmRBZm95RWJ4L1JabGN0ejBtUWhuUUdqZk1hcHZwUW1Jb1B6?=
 =?utf-8?B?dTVIWFRBNjltQjBUYkY5UHpTWis3eFRZRnZIREh6MjNZQTlvMGpzQjNCZG05?=
 =?utf-8?B?bytjWXFVbDVpMkRLdWxjMHdnVHptTHFIRHRYM2NNc1JoSGwzMVdRNDN2cE9J?=
 =?utf-8?B?Y09zelJ5VjVvdkkzUzdnTVlMNnczT1JmeFpYVTZGOVcvTlFaMFJJSU8zNlRv?=
 =?utf-8?Q?7uRCK1gds69h9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SElkTUNyUGd4dkJ5VnV3aWtVbnNVRDZENGxTRXNqMHM5bXluRFpDMEptc2F3?=
 =?utf-8?B?aEN4djVEb1VmMWwvQ0tiTGYwNjFvYkRYUWc1aXFSWXRIdHlKLzU0SDMzMzlS?=
 =?utf-8?B?WnZJandScEpueFhUd1RYYzdGanRqQWg4L2FvMWhQK3Q5azJYS1pNZStOREhR?=
 =?utf-8?B?RDVTckRTekxFRUpNWSt4ODJJeFlmbEhFbk94eVlOQzBzZGZBNzR2bTByeDUy?=
 =?utf-8?B?cDVrbEZteTMyMEVJcmRBL3RXUEc1dXNyamplbnFEbjFBNWlsUkk2N1MvMGJq?=
 =?utf-8?B?ZGUxaU12ODY4MnVNUkZyT1NlaEoyWG5HSk9oOUhWUVliMVlFUU9LTENGZDgv?=
 =?utf-8?B?OSticGo2ZmJEYVhmRWJpR0lDQS9VUGQyZkEzVktJMEo4OC9rQUdZNUIwVG1o?=
 =?utf-8?B?b2FHRTNyalRhRlpGNHdKRHE5SFVhVERzdjZqYWNoS3BVbDZCSU5ncUZ4dXRN?=
 =?utf-8?B?UE4vZkplaXJmQWVDWW1SLzM3emxRcWpFb0RQZC9jRHFIeHJXRXdSMzlIUk1N?=
 =?utf-8?B?bnRvd3ZTRGtTUUdXdWZDTG5IeFArNWxIWGlLRWsvSUxXQVozRWZ5M25GNEdW?=
 =?utf-8?B?aWtLNGtHTDFFYm50ZUVVNmF3RVpJUnNlRzc4SWovdGhHRjc2a3Bzczk3dzVZ?=
 =?utf-8?B?RmUwcC9GWW13b0M5dTdPMVcyTHVLUDlUV28wMTJ6R0xwalVGMFVXUUhtd2R4?=
 =?utf-8?B?cHlBNDFJejVaQUVUVENFOVNxc3BXRHNmdXI4OUovQm5pMjB1NVFFTVc1c2pF?=
 =?utf-8?B?SmRGQ2lxRFJhVHpkNFFwTTFaNjFTM09FdXRGL3dDalZxcmRFUC9la21JTWkz?=
 =?utf-8?B?RjhoV3N1SVZrTE9NZ2MzQlk0ckFMb1JFUUZveHpnVy80cnBXNU9SQmlZcmJP?=
 =?utf-8?B?bkxaTHBkYndtUFZZZHhuazlrMlc2bWhiVjg2MUIrTDZ2Q0JFVkw3RWRXZnF2?=
 =?utf-8?B?UVVrSFZIdmY4Z3JRQU53QjFqTFp3a01lZTlEV09BODBTWDA4ZGYybFl6eHZz?=
 =?utf-8?B?cFlJV255dUVXNGJ3VU41UEcrV24yWGQ0SXc2LzJKaUtqb21mTnMxVlVZYnZC?=
 =?utf-8?B?M1FXZ01vczluLytFV0FQQm5sWlRqdW16b3BqMkpuUmpna0haNzMxbHdxRnVY?=
 =?utf-8?B?dGJrYTc1em1rRXp1bmlkSGZYRU5uQnRPRllTZm83SnRxZ0NqeFdUOFFtSVFI?=
 =?utf-8?B?NEp4a09JYndQV0o1dHptZitTMUVpUnBxdHloRGpUZ2dOQnF0Z3pzR0dveDE2?=
 =?utf-8?B?QjJNbXRIN1JQdURFZnNCQllMT2hFa1JzLzhUTWFzMURRWVhhUkdBZy9zbzFz?=
 =?utf-8?B?V1VnMU13a3FSZmQ1Ujd3SmgwOWRDWmFFQ01HZkF2MmJDbXNLc3F6SGdkb1o2?=
 =?utf-8?B?U0h3N1ZaMlMrN2RUR2hSMDVNdytWRTgvRCszZXk3NWswSEprSFIwSE0yYUxE?=
 =?utf-8?B?UzVDNksvaEZTNUovZVBuZm9nT3EwQnhZTk5MeWVaKzVZZDNQOWh6SDF3a3J1?=
 =?utf-8?B?bmZ2M01BbERwQ1Vlb2RhOGlsRDBLM1VhN2pBeFRna2NmTkxRR01UZm5ZTDRk?=
 =?utf-8?B?THhrVFRjVUNMZktsa3BuZkMzVVRpQXVVQytxSXFDZGdRODZZMmNFanAyZ3JT?=
 =?utf-8?B?WWxPYWY5R3JZV2dBU1BSQnVqYnFRZUYzUmhRajYvbVVRUytHZVFxMEFhdGVH?=
 =?utf-8?B?VzN5THJrNmo3TzVpaG96YmRURG1IcDQxT24xQmlza09UakgzbXp6M1UwUFo0?=
 =?utf-8?B?RE1UVERRT0kzbDlSdWJ3YytlUG1NR095UnBwTExpaFlJaVlQQ1N3eUx2S1FI?=
 =?utf-8?B?RWZQY20wLzBqU3kzVjY4Rk5KKzRVQU01a0F2WnpoR0dNRGxNWmFtV0c5aThK?=
 =?utf-8?B?SmtaR2QzcXhzcTlLek9iUzROanlBSzNvckZHLy9rWjB2L1BJYWo1M1M4SVJT?=
 =?utf-8?B?UFJLck05bExKUFdxUFoxd0t1dVZBdFRlMWhaSEcvalN3TXgvdTc4Nk50bDRN?=
 =?utf-8?B?L2NhTVMzMTRlSUhaMDNyVUNQeHErZk1yWmsyMm9YYlZEN1RRZFRpdnEvTUdo?=
 =?utf-8?B?T05EclpXWUZzcGI5MmNNbFV1TS9RTTVXVGJ6cU1seUdSYVEvalh3NE9VdWVI?=
 =?utf-8?Q?nOhQP1h0VkIWYOYjpj5YJgQFa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a190e4-6ebc-4521-60ce-08dd2f627cec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:20.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuSKHMbTyA1twURuIscPZikcW1ldK1ynsdjKaxzw9FLsJKXCuSEk6waYfP3fAgdPlZTXQ0eC5yhR8a244I4mFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Place Lighting Control State logic next to other attributes of the same
> sysfs group.
> 
> While at it, rename:
> 
> store_control_state()	-> lighting_control_state_store()
> show_control_state()	-> lighting_control_state_show()
> 
> Replace DEVICE_ATTR() with DEVICE_ATTR_RW() and do a general style
> cleanup.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 74 ++++++++++++-----------
>   1 file changed, 39 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index 7212d75396b9..ec64a8f22301 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -545,6 +545,45 @@ static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
>   	return ret ? ret : count;
>   }
>   
> +/*
> + * Lighting control state device attribute (Global)
> + */
> +static ssize_t lighting_control_state_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf)
> +{
> +	if (lighting_control_state == LEGACY_BOOTING)
> +		return sysfs_emit(buf, "[booting] running suspend\n");
> +	else if (lighting_control_state == LEGACY_SUSPEND)
> +		return sysfs_emit(buf, "booting running [suspend]\n");
> +
> +	return sysfs_emit(buf, "booting [running] suspend\n");
> +}
> +
> +static ssize_t lighting_control_state_store(struct device *dev,
> +					    struct device_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	u8 val;
> +
> +	if (strcmp(buf, "booting\n") == 0)
> +		val = LEGACY_BOOTING;
> +	else if (strcmp(buf, "suspend\n") == 0)
> +		val = LEGACY_SUSPEND;
> +	else if (interface == LEGACY)
> +		val = LEGACY_RUNNING;
> +	else
> +		val = WMAX_RUNNING;
> +
> +	lighting_control_state = val;
> +	pr_debug("alienware-wmi: updated control state to %d\n",
> +		 lighting_control_state);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(lighting_control_state);
> +
>   /*
>    * LED Brightness (Global)
>    */
> @@ -589,41 +628,6 @@ static struct led_classdev global_led = {
>   	.name = "alienware::global_brightness",
>   };
>   
> -/*
> - * Lighting control state device attribute (Global)
> - */
> -static ssize_t show_control_state(struct device *dev,
> -				  struct device_attribute *attr, char *buf)
> -{
> -	if (lighting_control_state == LEGACY_BOOTING)
> -		return sysfs_emit(buf, "[booting] running suspend\n");
> -	else if (lighting_control_state == LEGACY_SUSPEND)
> -		return sysfs_emit(buf, "booting running [suspend]\n");
> -	return sysfs_emit(buf, "booting [running] suspend\n");
> -}
> -
> -static ssize_t store_control_state(struct device *dev,
> -				   struct device_attribute *attr,
> -				   const char *buf, size_t count)
> -{
> -	long unsigned int val;
> -	if (strcmp(buf, "booting\n") == 0)
> -		val = LEGACY_BOOTING;
> -	else if (strcmp(buf, "suspend\n") == 0)
> -		val = LEGACY_SUSPEND;
> -	else if (interface == LEGACY)
> -		val = LEGACY_RUNNING;
> -	else
> -		val = WMAX_RUNNING;
> -	lighting_control_state = val;
> -	pr_debug("alienware-wmi: updated control state to %d\n",
> -		 lighting_control_state);
> -	return count;
> -}
> -
> -static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
> -		   store_control_state);
> -
>   static int alienware_zone_init(struct platform_device *dev)
>   {
>   	u8 zone;

