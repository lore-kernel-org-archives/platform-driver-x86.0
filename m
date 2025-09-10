Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003A289358
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512720; cv=fail; b=K5uT95me9fdEduKDQMKufE+jULXz7OBImjzT8JR1G74fxtRA6GXAFngxRJO7yvxvXuGW68Bcc4HLiOl4W/SfGgyZ+LKkffgvmpMl6M3+Y3hsB2lboMdVv8YwJxZrq0TxOvu+WyRqXiyK7JqAeK4KM/FR4Wt+35YfkkeUKm1GkRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512720; c=relaxed/simple;
	bh=VmuMEMGZETP6pyK2kRJyZRIUBIxJ+UaJnEAnflbBqkg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=btJBEs/LOKZDVDkQ0YaCnFvsTWFdx92v9GfZ5cEmJSa4h8hPG0xPssqHXBN/ZP0WUfu4abkXONTMVWbKdlTF7dsTatr2QxiAHFCLPXBWcpQOMwKggP0EPaYUX60YgsrBO8Wbv2zhsu1clzAWVanTNCKIXs8OxfgWe/MN/rYDFAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=46drx1JC; arc=fail smtp.client-ip=40.107.92.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="46drx1JC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7ruQ9m5XWNPmkfARe+spDlH8y9RljkXP6dCYpnLf4Uw9sPjvCcNpEoTxCWimKASl0cCt2ElhYxLSLIcig/exR5SQhIvvzYRgMtry94v4RB5hEY4+vHinoksTx8SJdFwMm2EcwDwmfVyUgsWHru2LZOu6bArQMXvMU7cdyFMcDo9NN32/v8bzcZZ3ZtWrBxKOyNpm9CeRcQFnOhDyYzH5dlxQDDaJE2yw/ttwCPzZZYRebk2x2KazZidU5v6nu7L7wgNNYkPO40M6w9FjAcCA/fPfmA1rKSk4dgNCUuurWbeGamlpelodkvpnRFLJ7IPwxuf8C41tiBO+7+pEtxXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gs/kCoPWjsfFhbN90TxjC1pS1rl/8KNttYetgUeoarU=;
 b=yVjYKrVoz3M0CXzmXAJbXP14vteQfNByAe8PYUfnMQ/ELQlvl7LDRddHghx4kIliWHUv9JB7VTbmWj/t8mQ4MJ1onOaOrzzdAzMx4tfPeQdZDzBHVamJOgBbticD2vPeb6WztEXlxYKreXarNL9BRmib6pNFCRo5ONuJWEMJ7S0cfSVhjwt2vAhPuGDiwIWr4wh9dUNfq6p1XuvJqCgvgGBL2D4Q8nGU8zpssy2CNuyfNMquLqf/CwJNZRrTttaKb3rWJP5KaYdNj5Jcrrma6+x70JZefLi1WxCEjRktoIM1SnnYdjwpVeUZKfLnkmv9lEt0OVVMDayLQsfhf3ji9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs/kCoPWjsfFhbN90TxjC1pS1rl/8KNttYetgUeoarU=;
 b=46drx1JC7pOgN7r3kwIEaFCKWsDVESUdBYAzmO51C7DlFAIoKZtKSTvuOP8r1DplcNG0he9JpbTTIMGFWCmFNsa4L8omMkoVamc8cmp+iQN8E/4pjGqBbh8oEKFZdjIH5YwviP6I9FwRyIlHrfqMhWE1c+PB7o0OCAsO4qhVRYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS0PR12MB7511.namprd12.prod.outlook.com (2603:10b6:8:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 13:58:35 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 13:58:35 +0000
Message-ID: <7f93331e-0576-40f1-a692-9d41da778dc9@amd.com>
Date: Wed, 10 Sep 2025 19:28:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 6/9] platform/x86/amd/pmf: Add custom BIOS input
 support for AMD_CPU_ID_PS
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com,
 Yijun Shen <Yijun.Shen@dell.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
 <20250901110140.2519072-7-Shyam-sundar.S-k@amd.com>
 <2ba64be3-34c8-b9e5-549a-8548571168c2@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2ba64be3-34c8-b9e5-549a-8548571168c2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS0PR12MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: aef05ce0-8c08-45b7-6c78-08ddf0722008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1hwQ3VCYllnQmRHK1k3MlJRb3gvU1F4QkNINW9rc1FSK1FIMFhRNjVEV29o?=
 =?utf-8?B?MFBCaWZSWThJV1ZTZ3RwN1lzSmVyTFY0V3JDa3hWRzQwWm8zbTdPZ1dJbGF4?=
 =?utf-8?B?N1lOVVV4RFhFK3FqaHJRTHFnWS9xNUpVT3M2bXpmK2tDNDdkYTF0aTI1RVpN?=
 =?utf-8?B?SHZqd3pQaVBCUGVwalp1U01yUnpDOTJ5Q2llaytpYzR5eWJ4U1ZQT2JDMXhs?=
 =?utf-8?B?K1B1S0ExZUcxZUVwQ05qTUUwbWpxekJySGNGdzJnNlNtUG52RDRaWmJsL1Rk?=
 =?utf-8?B?WENabk9nK3JVZXpiOFdWSVUvL0lhNTFNK3ZwYW14Qndia1N4aSt2RmNjSG9O?=
 =?utf-8?B?RVcyZTFidkdJREFiQ0NjdFV6a1hjYnIvNTlJMUg3ZXV5RGdDcm94SHhSTGxj?=
 =?utf-8?B?WE9Sb1IrcC92MEhmTjR1cUREM1dNVXJXVGxhRjZVNzJQNXE2cTg2MDZrZUY3?=
 =?utf-8?B?N1g3K1VEZnJ0b0YyeGY0bFlseDgyWTJzV3ZjcXJrQmtpQ1ZzU1JESFNnOFhC?=
 =?utf-8?B?RjN1alErRkpNL05pNEtDc3lud1JCR0xLdGZ0aWNJOWN5R0xyd3J3RTE2Mzg0?=
 =?utf-8?B?MEZzV2ZPNjlicU96aW9nWmxGUkZPVUM4TDRvdnh6VFIrNjUydnhZZm4vVzAv?=
 =?utf-8?B?Z2VBbXZUVzZzK1FTdDdrUzNPNGJ3MzZlbXBQb0ZSRmNtRDZJVVQwSWU3VHF5?=
 =?utf-8?B?MHJhbFZwZ2FoVkQwTmJKREUzQWw4VFNraFphWEdIbEVLbzZkbHpkZXc0VVdR?=
 =?utf-8?B?aEROUEowTDZ2UmJsSkc3OHVIeVBUeHNYREVnTzBXVi9WMTFpdEY1ajQ5TSs2?=
 =?utf-8?B?aXB4S1dWUGhnV3ltU054NkFYbFQ4TmwyZ29zSHA5VXZwL2Z0ejZWUnFFQy9C?=
 =?utf-8?B?T1hzYWZZcWRXa1hFSnNONk5aYTVNSVQwTjNtb1d6eGYrYjNWVEU5RzE5K2pJ?=
 =?utf-8?B?UXFnRkJGM0xEaG9xcy9NQnJTV0w2VHZ0S3JwSG9PWGYxWlphNlUwUGJKUVJs?=
 =?utf-8?B?TDJEYnBZMVh6RWlhcncxT0w0M1hhL0FwSnNHZ1NpRUpQZERNMnpVL3F2Y0VG?=
 =?utf-8?B?MnNjY3NrVFdPWE0zY2NMTzBEMysxMHRqUzNOcUMvWWtLT3dpMGtiREdmdGps?=
 =?utf-8?B?enJhcm4vcTV1NmNiQUZTK0xYQXlEMjR6Y2tUcERqN2h3WFp3KzRoK2lXdUlF?=
 =?utf-8?B?VWFFNys0ODFPakZJZVFlTWU1SW0zd09PaFBhNW1abUM1THRkcGdwWHJ5OHhv?=
 =?utf-8?B?THF4NE5zUXkwbHFodC83Szk1RTN5cllTTkJGVTNvdmJZaVpuR2VrWUFuK1Uv?=
 =?utf-8?B?c2NpYXY5OU5rZHhoR25IRkoySFNNamxZaUNLMzJyazdpRGdwanFXeE9weGRo?=
 =?utf-8?B?V2VQUHRjK1FWWWpmZGRpbUpReXFBQWVmVE5UZ0FPMTFwYjl6emNOcDBxWTBz?=
 =?utf-8?B?WjNuZThjMWFVSDZKRXo3YmRleTlMbmlKQ2hWcmJ3SmFHNW50bHRGaXZ4ZmMr?=
 =?utf-8?B?ZjNNYVo3OE9VaHorY1N6MktoV2l1VlFRUm1KQjVrM0dkaFdia3k3YmRURHM4?=
 =?utf-8?B?bTB1MlBoR0MycDJWNUdiOVgrcHJhUjdvRlczelBVdnZNalpNV0lGUmRoZklu?=
 =?utf-8?B?ZG8vbFRWMVJjRWQ3NVN0MzBoUjBRLzdQNkwrOWVxbzBxQ1NRcXpNakFpS3lv?=
 =?utf-8?B?SFFUSjViaUFoU3d3Y0MyMURUSUQvWTl0NkVZbjRxOU1rZTNCM0dhMXd6ZWJQ?=
 =?utf-8?B?RVZ2NWFSUmwwYS82ajVIY3VnOU0wVFdnS1cxb0JudzlFQzcrNGNnUHlCc3Bu?=
 =?utf-8?B?bnJtWWxjc1BZUmtUNWVoV2VWV1NDVXNYM1VwTU9YQnhVcklFNW51S2lsVWRh?=
 =?utf-8?B?Y3N1eDBsWjVJVStoWDZNc3FFMmZvN1Jpc2FtRXZQdGR4LzEyUmk5M3pIa29O?=
 =?utf-8?Q?6jYW6pF21G8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFJJN0VhZUZ6VFRDZG00cG5WaHE3UW80UjY1ejNmMDYzWXE1dnNRUFJFbWV4?=
 =?utf-8?B?cHh4L0ROWmtwOW1WZGFzU0QreDdUL0xVZEo0cnhjdml2bGpybWtCNnV0cXBp?=
 =?utf-8?B?Q1JNM3FHRHhXMEVJd0J6Q01zeThLQk5nbWlWelNJOU9HS2VBVkQxVk1FVUVW?=
 =?utf-8?B?ZmR0OFluc2g5K1Z0dFg3NG9SR1dqejJKYUNnK1RQWkNQZHVLNGhkZnMxVE5O?=
 =?utf-8?B?YnZON004MksxYnhRYUk2a3ZlTzUxazBMMlVQUWhMY2NMSml0K2hqSlJPOC9L?=
 =?utf-8?B?RC9Eb24xOGxyTjR2ZkI5N3ZqQlQ5YlJLbHdtL2tIYUtHaHZqSFNybVNnVVpQ?=
 =?utf-8?B?M2NBTVNBbGdMS3R6aWVScmhvY21rV1pGSWI1bWtqb29UcFcrRlkwQXlxeFV0?=
 =?utf-8?B?R3RSVUNiWGdQUWtPV3FaL0NFdWVsT2VsZFlhazNqS3hNdmUydEx4ZjAyM25o?=
 =?utf-8?B?bVlUZzZFMHhIaStZaHM0U1NjcTVlZlpFVThtQ3RRSURFWnFyMXg2Z3lFanFt?=
 =?utf-8?B?d015bmlENC9mZVdIYlJENkhtMEZ1dXhqNTJqUllLUE5aOXorRThrTE1nc3FF?=
 =?utf-8?B?NnNXcnkrbjU0RVJvbU1idWNubTJtWHh3cXF2QUlJSzhCYTQrYWJXNFBhekZt?=
 =?utf-8?B?UzRtcVYya09haTNLY1RlV0pUeXpaZnpGSk40bkN5SHRUbkZ5WHFtbHdqSUFM?=
 =?utf-8?B?ZXRSNGZ0d2NZREdrbE9XcTUxOFRGMFZZUHZvaVRoYVduL1MwQWVrMUQ0bUlT?=
 =?utf-8?B?dHg0WDZMOWhhR1BoSVhmVVdSZmJ0TlhVYVpmQm1SR3hTMFovQXp3YVFHcDl5?=
 =?utf-8?B?MmY2QjlSSjBuWTJSZW1yckt1MHNUdDdNR0xZR1FNT3dMZ244Q0EwSmFCNm83?=
 =?utf-8?B?bjNVR2JEZUdyeUNXTEk5TFU2ZVJDQ1E1TjkrNHI1Ny9vTGtheDI0Q1RXUUdw?=
 =?utf-8?B?ZHdQSUFMV28xZzhHbjM4eEpmQlducHNrRzZDY3BBd1p2aDdyTEZjYWZqL0FP?=
 =?utf-8?B?VVdiVmRUZFJUNlZXWlNOSzE0M213emVvc0loVlY4V2xVbFlnZU1ablZuc2Vs?=
 =?utf-8?B?Ykd2YVNhUWFPSzVEUnBrbmlVNVRjOS9Sai81WlZXZVFrSmhack9XaEFVU2Iw?=
 =?utf-8?B?dDVtMjZnT1lwcElxS29tdTRiY0VocUxLYnhVYnFmY0V3NjRUb1Zkc2JjczA3?=
 =?utf-8?B?UmgvQktibDFwV09BejdzS1FoL0lYMjQzdjBvNTkwcjBkRU9nOXZvaW40blJK?=
 =?utf-8?B?RVQ0NnE1Wk9aS1FZK1hsY3RxVWI0eW9iRy83bWkzN0ZNaUw5ODlmV0M3Z1du?=
 =?utf-8?B?NVhtY3h5Ykt4Q0hMY0pxbTdWZkwzNnV5cmxpSEkwREovR3lCT2lQU0Z3d3dk?=
 =?utf-8?B?TTd5aDNEdmdZTDRZbzlxYTMrSjhzdXk1U1c3ckgwdGRLSWdPSU0yOWJsZitP?=
 =?utf-8?B?MkVjVHpLc1h6UXpyanJzbWRCaWJpcXE3Zm0vN2dmTVJyNnFFYktVaXhNblo5?=
 =?utf-8?B?UkswQ0JUd2tCUU9waU0wNndLdkZtNldzaGEzVEV3SkQ4TWsrMXIwbmpiYjNG?=
 =?utf-8?B?WnhXQiszNnZQaGovUHJrcDdrQUZDVXQ4YWc3NGhDVm5qRkZRUU1HUEU3a0Yz?=
 =?utf-8?B?aWw3RGpBdCtsOWFHNWR6QUZJaUJHcjVabjRkU1pzTEw0aEVhNUw5Ym5SNnp1?=
 =?utf-8?B?STVvZElJK1pMaWd1Y0MwdWlKUlFkcEVTazFUc1JSNHNTcmYvVkZWWURYRFc3?=
 =?utf-8?B?RDR5RllDNlUvd3BMRytqbEkxaWo1RGxQZVNnZzlDSWVLRzFsRHNqL2RZUUcw?=
 =?utf-8?B?TldINXNNRXVoWU4yV2FpdGs3czR5WDZLc29KOVpWdnAvWFhjM3BCMURYWENK?=
 =?utf-8?B?NGVpd3J5RlBLK3E2ZjV3TEtKY3hCeXFsUTYzQ3FJeVRrSnExc3habUhTZ3hj?=
 =?utf-8?B?czlHWXcvSnRhN2tzUGtoTUFCZnZ2SHVUM2ZGcW0rZ3Mvc0lYVHVCakRaMkcy?=
 =?utf-8?B?czJpeGRzZnJTaFlKeTNFSlk4V2dad1lodlA4dU9SSlNLamttSFZCVjhLblZL?=
 =?utf-8?B?ZExiKzdiS2FVQmpkOVlLaGMwNHNnR1QwenhjVks5cmVaVEZVM3BjS0tTbk9o?=
 =?utf-8?Q?Uar1zm4f17jki3QiQnUlU+MZU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef05ce0-8c08-45b7-6c78-08ddf0722008
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:58:35.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDQ1Ls4dNq5QG1wrD4/ls/5W8rMhb2Hk8irIgkpgtNRRtgywpPX+WBE9tcysfc0tSwthXEaY/jddQrCT3W6OMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7511

Hi Ilpo,

On 9/10/2025 16:01, Ilpo Järvinen wrote:
> On Mon, 1 Sep 2025, Shyam Sundar S K wrote:
> 
>> The PMF ACPI Specification (APMF) has been revised to version 1.3 to allow
>> for additional custom BIOS inputs, enabling OEMs to have more precise
>> thermal management of the system. This update includes adding support to
>> the driver using the new data structure received from the BIOS through the
>> existing APMF interfaces.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/acpi.c | 58 ++++++++++++++++++++++++++---
>>  drivers/platform/x86/amd/pmf/pmf.h  | 22 +++++++++++
>>  drivers/platform/x86/amd/pmf/spc.c  | 36 +++++++++++++++---
>>  3 files changed, 105 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 4982311ac045..41c34c26ceec 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -320,6 +320,11 @@ int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v
>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
>>  }
>>  
>> +int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req)
>> +{
>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
>> +}
>> +
>>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
>>  {
>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
>> @@ -338,6 +343,18 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>>  		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
>>  }
>>  
>> +static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>> +{
>> +	struct amd_pmf_dev *pmf_dev = data;
>> +	int ret;
>> +
>> +	guard(mutex)(&pmf_dev->cb_mutex);
>> +
>> +	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
>> +	if (ret)
>> +		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
>> +}
>> +
>>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>  {
>>  	struct amd_pmf_dev *pmf_dev = data;
>> @@ -427,6 +444,11 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
>>  }
>>  
>> +static apmf_event_handler_t apmf_event_handlers[] = {
>> +	[PMF_IF_V1] = apmf_event_handler_v1,
>> +	[PMF_IF_V2] = apmf_event_handler_v2,
>> +};
>> +
>>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>>  {
>>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>> @@ -446,13 +468,26 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>>  		apmf_event_handler(ahandle, 0, pmf_dev);
>>  	}
>>  
>> -	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
>> +	if (!pmf_dev->smart_pc_enabled)
>> +		return -EINVAL;
> 
> Hi,
> 
> Is this change okay? Previously this function returned 0 in this case.
> 

Yes - this change is okay and was introduced to address your v4
remarks w.r.t to code optimization.

This function still returns 0 upon success but this additional check
is to make sure we don't enter the underlying code block for smart pc
if the feature is not enabled.

Thanks,
Shyam

