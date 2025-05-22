Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6D72914
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 May 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909219; cv=fail; b=jtcLhLYOSjx2zcrVxghfyl2Za6zlqZQ/X+Ez5P7eDNuYyxFKFsW9Sg/lYDHJK2AqzceQW5I0upP0IYOS428LmwJIfkRZyMXMtvrKfJykO+PKU1KPT4d0UFXCQ4mrhMSOzd58l8dufOGT4TxVx6D2xl3Zpc6hIVtHbygr/UcyFnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909219; c=relaxed/simple;
	bh=nbt8VigyUizwlDQ1C6dQu5iQMcxd4odghA5++QC2gMA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HpOy/++QdJM1Ru5LxOVbONtDSUz7SYtXf+EZytprZoxQuTgVyhSV8QdgD4vJLzEsE9hlyoiZIfgF2FF5KQ9cDbPg89BAQ4TKZ2Ei67AQ+y3YABYmIl0FkQfAxTBkhe/fa5uaEIBL+UpG2oorCg9oHNq+cmLvJtUO3NLHTYgD1CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FCMEijRh; arc=fail smtp.client-ip=40.107.236.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FCMEijRh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJKhv0JsmPw+WqNnlktmPAbx9p/mm4jb/XrVI1Kzjj7V9TZETrv+PL01uxLEb5QlFc6deS076eKYRVaSAxUbF47QLdfnG1Wq0jXRaOj6oMP/rXcZZtMatF4t/iUt/Vy+1SDAt746IrmP4ih9O0S8TJJyCBjgCMTCgK6EJDtiPqjXUJDu7XMtkuTfU77WIDH4adRYnxz6Mu2VX2YiHaz5hZk4DW88h4K6ZHtmaNCRTtUKjhcDz0RaT/gGCh5uia76k3pCiTikEcdeWYeRcEMy5N/cIjWEQtL9I2XB6k67leTiFT3kAqcI55o9FHmzcEc0mAG2GefwYznvhpnN/OsGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdcdBYWa250mI/D4AmHLwaEyIG6kMfP8wTBVgYtKqFk=;
 b=lVuWs7Hbtk4A6wZPt++V8ICFJ6vP0AhBQiV7Zl/HlQmGlG2BUjNBSlTpn2tyW5wXPNYrtnJ7de6M9ulkt9rwuTVoWTd56XBjnRj5yqZyaMzrbpfM85b3QM/yUC7tEbQJMqEtnKJBG7YOakqitLloEewAGpSid3fOTjZHreIo7KDFQkZWRtU9l6lSe/Kduu2IY47hxzlom+tWiBHaWDCuw23VCkNVYPJa1zmJpViE6PjYEUkqIoFMdknF9EhIWpvi7ay83a29jY5BYaIY2ZHhxTjwkAcYDb9lvfzIVEt2n2O+pGDyWy6/FwkNQumHhHIXajvFOpJyXQuG9ZLmEPTmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdcdBYWa250mI/D4AmHLwaEyIG6kMfP8wTBVgYtKqFk=;
 b=FCMEijRh0pK3AOWIdjdOP7fpFYi/pUTrzIrobx3cW59OEUsweUX+lyOmxdmIZDU78t+NI1NDEyiaZ+C3NEUM23PxW8Tz8sUevq2cYUTKHRtBDXNfJS/T8EyE8L5jg773NjmS7SRhPrfyD0uqHb7wprHWsn3fFiDk+H2O8hiOcTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) by
 SN7PR12MB7910.namprd12.prod.outlook.com (2603:10b6:806:34b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 10:20:13 +0000
Received: from DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a]) by DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 10:20:13 +0000
Message-ID: <5a3eb96c-6d72-461c-a98b-386de70d6a7d@amd.com>
Date: Thu, 22 May 2025 15:50:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next] BUILD REGRESSION
 90b85567e45736b662d034be536a76ba0f4c7ca8
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 kernel test robot <lkp@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 PDx86 ML <platform-driver-x86@vger.kernel.org>
References: <202505162024.cljwN0DB-lkp@intel.com>
 <891a439a-7b7f-b661-18d6-3ebe549a0208@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <891a439a-7b7f-b661-18d6-3ebe549a0208@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0122.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::11) To DM4PR12MB5962.namprd12.prod.outlook.com
 (2603:10b6:8:69::7)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5962:EE_|SN7PR12MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 41651e93-dccf-4e06-30e6-08dd991a3cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGNpWDY2ZmNzekVKb0EyMFZoRW9zak5iRnB5d1U3Zzc1cDRuTjlZMlJOVnll?=
 =?utf-8?B?MlVtWXE4U2xIWnU3TnQvTk1FU3hBeUQzb0xBeXlyQUM3SldSZVZid1VtUTBp?=
 =?utf-8?B?Q0YxSnBuTXA5Y2IzNHBrS3JtMDhlYnQ4dEZjaG9vQUJiL3l4N3Q0d2lobHZs?=
 =?utf-8?B?RU05L3FOVHJDTUdHVUNXdFlOMHdza2N6WUJJR3pNeFphMmo0cy9rQ0RkQm84?=
 =?utf-8?B?ZE1WczhyeE0xSjhReTlIanp0dG1SeFdiS09oOU5KK1Z3WEd0VUluYnh0RGs2?=
 =?utf-8?B?Z3QyekMwUTU3aEJqUFVucld6d2crMDUxZ1Q3RElXajBYa0JQblI4cWdHcFdu?=
 =?utf-8?B?aytobWZ4Rk5RQ0w1dVB3UHY2Z2ErTTlTR1NLUmt6TUVEb2YvNEtmR3drbUF5?=
 =?utf-8?B?SGZiUlJkQll5aUsxdGdGOEdlMEJnUjlINk1UOU9QNER5YktQU2RkMlppSGIw?=
 =?utf-8?B?ek9zelNlZnpsMEdHOXY3SURoQlJMNGM0ekFCUlJpMzBBRVoyK1Q1Y1BsaUtp?=
 =?utf-8?B?NUI0N0IrVDNjVjliWXlkRzhlSEtXTjlRbE42R0NWaG5OS0RTS3NxYk5xSy9C?=
 =?utf-8?B?UzlndTlMQWsraTkzeWhlU0dVeHBEaWY0VXMrYlFXQXdka0svMmNKS2k3SnpE?=
 =?utf-8?B?c0o5TzY3RXYzR3pabXBFK3p5MWsrMGw1aWpDWklnaFBBLy9IR3k3UHBpWm1a?=
 =?utf-8?B?dVFuQldmYnZNTGUwcE9UWVRxMFlNOEtTeFd6Q1FSWXdid1Z1N2pmaDhhbmEy?=
 =?utf-8?B?cHE2eERGcXlhLzFGRENzOWFTZnNaTFVmRFBxVEdLT21mcktSa1JZOWVDUUdh?=
 =?utf-8?B?VllqWTNWV2xJM0JaeXlpamptTGp2aDV2aWJIc1FndGNFdC9kaEpjT0c5RmZh?=
 =?utf-8?B?cDRub2NYY09JQi9hRytSN1g1OUtzdTU2QUFxL0Q1NyttQURQTlBLWHY2bXZV?=
 =?utf-8?B?a1U5SERTNmhrYS9qdEMyV2RQaGViR2RFRUtMbzZjeG1xU1JmRTdkN2ZkbDdl?=
 =?utf-8?B?aUdRUDVBNHk4OCtGNWZnd2I3STVWc0tlM1RWUnlnd1FHMEZIR0xSZ2hsSmUw?=
 =?utf-8?B?NFlTRmx4ZTN1VzlnVGROVjZUbFRXR1RJdUhBaEUybmlWM0htMXpkQmVIS0VD?=
 =?utf-8?B?Vk9JaEpPb0s2amJqMGlpVUNVc1IwTHo1YmhhaTdmbVA2T2sxSWV6SkM5bzZZ?=
 =?utf-8?B?SDgxRWcvOEhXWHJ0TytCc3NMZXZGQlFtaHo3b1RzVTZzbjdMYWI1R0N2ODNQ?=
 =?utf-8?B?TzZ6YXQ2VGtNcHhUSFNFMkhyb0dnUFEzNE5xOUtGK2I0NTJ4aDIvTVdzNFJy?=
 =?utf-8?B?SC9rL3p2MVN3QzJFeU5RWk12Y2xkbGd6bU1WN3ZRSEQ2czQ5dy9MclMwQ1F5?=
 =?utf-8?B?aDdrU25BdkwxalJUWCtob0R6VzRucU43UjBoSzEwM0oyZVpNdWtDSVpRYkNJ?=
 =?utf-8?B?aWR4WC9GcEltYmhUYkszbkhZbW9WcU5aQWRLT1p1UDY4bUp4VWhKZXh2S3RF?=
 =?utf-8?B?ZjZOZnh3aG8rb2xqODVEdndJTjE2aStuU3JyaXVLWXI4N2Q0VDRCay9uUFVj?=
 =?utf-8?B?dzJ5T1RGMjFHYkdBbDczVXcwSWJVV3BnS2NYOFlubUw3VVJVckRqcGpuNVNV?=
 =?utf-8?B?Q3dsYlpFZnNDc1ovSzRCaVFJM1cxSnU2eG9JeWthMlMyS2JMM3ZNZ04yOGJw?=
 =?utf-8?B?LzhKUGhLTXBNdlFXaTRYbzdrcU93VUZ0Q1RITjR5TUdadmZoTTk0ajR3UUo2?=
 =?utf-8?B?RHdMamtVVllBYkQ2YmVpdy8xRG4rWkZWMFdUYmEzQVh1R01IeEhEWDIxc1hy?=
 =?utf-8?B?Z0Z2MU9zV1puWmFhME5JUlQ3R0JPSWI0amdOSlhMTzV0cXVUcURQNm9PWUxG?=
 =?utf-8?B?c0w0eTRIM0l0K3B2UFhXcU1Mb3hzU29JclRUdmRCendNc203Sm9aRHdCRUpl?=
 =?utf-8?Q?6y6C3H58fYs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWY5Z2RDZWhLdW8zRld1MGhaVithN3orZUIxQlJ6YlZmY1RwNS9IaU5kQito?=
 =?utf-8?B?K2sxWGRxVTJ3c1ROb2xaVG5aODZYSWdqWXZKaVZhTXhRMnBnOXF2eDdqem43?=
 =?utf-8?B?dkUwbjlleTRHTzRIWG9EelBxMTB1WEdLK1VDWndwUFA1V3prR005eDNVY1Ft?=
 =?utf-8?B?MS9ocTdjWTlwOFFOYTg1cFRGQy9SS0JoTlI2OVJuM2ZFVkhRSGVHQkRORk9W?=
 =?utf-8?B?byt3RXJqS241NThXTHM0RTQ0dy9qd1U1aDhYMzB5NjdkVjRMaVBBYy9NWHNQ?=
 =?utf-8?B?UGlkbzlXZDM4U2c5RWxTQjl1bDE1cExPUUoyVGNQeGhGNDh1RE5VdWNSVDFU?=
 =?utf-8?B?U1ZqSGsxKzF2ZnNTU21qQVNkOEtmNHF3clR5S0lrM2YyRDluY1RPa05lUVlQ?=
 =?utf-8?B?d1BQYzBvcTYvNXFwQkxncnJMYlh0SldabmIrU0JOQk41MFZ2blZKcFRxbkww?=
 =?utf-8?B?ZTNhSjgya1pYbm5Hb0F6YS9UUDRJOWMrcUpMeEF3dTJuWFJwOTZBTVBQZ2Fa?=
 =?utf-8?B?MldZSzIwS2NJNU91VGVGSlNlTGNhV1FCNWpkdWlmODkrSUttdXlCTHBpTlRU?=
 =?utf-8?B?RkNIWDVSeHBPd002NkRkY2k0MDJEOEQvNlE3Z2tRSEhDWi9KRklGb0pqVkc2?=
 =?utf-8?B?WTRhUEI4eXEyMncxQldHNUZ5bmFrMGFPVE9UVU9aMUg3Z2NwZE5zVkpFQVhF?=
 =?utf-8?B?UVg3cDRmcXJwMnNvS0RBbWlzMGR1dXNxb0E2MnlqUFZqcExrcmZtRHNPbldi?=
 =?utf-8?B?anBPYXd2SmdqeC9COU44YlBPMUlIK0s0TEhxTFZaV0xKUVRteWJWaTJPclMw?=
 =?utf-8?B?eG1MRWdDTnlOeS9rTCtwZjI2Y1lXaDZER3gvaXJ2N2hTMWIrMDlITDQxbFMx?=
 =?utf-8?B?TDJLU3lOSU1LVkx1S0J2WFRBc3ZxMzA5UjJlQ2ZCUWlUcXppMGI2M1hhSStG?=
 =?utf-8?B?SS9EdnlaTVNvYlNqNDl0RTRRTDlCdjZEeHUySEV3NXE1MzMyTGFtaCtGUVVO?=
 =?utf-8?B?SDdKK0JKZnRNb2RmNGkzbTRQckFBMEVRREprNThoa2lxRjV0Yk8yMWlUV29S?=
 =?utf-8?B?Z1pwZXN5cW9zWWUrVzBjNTMxZHdzMm8veTZpaUpnNERuTkhmV2p5S0xYOFUw?=
 =?utf-8?B?NjVRb0dLTDN5RndMTGdnVk1PWnF4VGgzdk5ORWtJSTE3MGVNUDZBSFhVdlN4?=
 =?utf-8?B?N2FhOUVyaXo2YVJMbHhmUUZwbFp3UFl0UmxZZjZZSi9oeURQTm4yQmd6WkJF?=
 =?utf-8?B?Tmp2b1owNWR4alRFS2pxc1o1Q3BUWWlmSEs4eWJKNVhkUDQ4aEJNaGFjWGtH?=
 =?utf-8?B?Um1WbWw5aU1ZSHlUME9CSkEwdTJVaXBtQ29lc281cThzTjloVHVCWDM1V1ZG?=
 =?utf-8?B?WGRlNEwvano4NjhlM0hZZ2ZFRUlPbUZvUjFHZHkyaWpFS0JNQzIrWGg0T2Y5?=
 =?utf-8?B?VE1panpBQTRuYml6ck5sNmR3K1hoZW9pQjBkMEpqRTZhVnRTalNDdEhJOTVw?=
 =?utf-8?B?N3hielc3TVVRdDlKcWViaWtpNE12cXZPdHVKZlB3U2h1eGZVVkVlaWFuRUpX?=
 =?utf-8?B?bUt2Znh4WUxOWFloRUtiYkE0ZTZMSnhvNkREUjRnbU13THdJejAxTnJZYm1K?=
 =?utf-8?B?TG5DUzBzeWlPYnR2L2hPR1JEaFhUUWRSakFIcWJZckROZjVNSVpISGtqR015?=
 =?utf-8?B?K1NXNXlMd1k0eDJUSTl5N1NtOU5qR0FVTnZIVXNIc2tzeUVBU0FWZ1krWDhT?=
 =?utf-8?B?UFhCZlZUcnBQNmRzTWM0Y2hmK3p6TUpiQ0FZNXBqSFJsczhmUmVjZHVGMi82?=
 =?utf-8?B?VE5QSnRJVy8rSXdlUXk5ZWozU3d2Nm9RV1ZPa0RMM0I3YmhUZE8vbjMrM0x3?=
 =?utf-8?B?RDBGNnBwc2lIeTlKM3ZJZXUzY3hpcHk3SGF3WVdGK3hxK0dIOEp5bS9FY1hV?=
 =?utf-8?B?NlRhZWpQTE4rT3JVVGhvQUkzYUxuSnBuRldXV05BREFJd0RwbVBvZ2lQeUpY?=
 =?utf-8?B?M3ZnZ01SN3JYRC9XZnZvSEZHblIvT1kvR1MwMUNtc0hLMDV4UkxOVXhMbytn?=
 =?utf-8?B?OWVVYmZnUXBvWlVKRnFKSG1nTzBXNjBqZCs2MkxpWHpRQVlQaDBtbVNmN0pF?=
 =?utf-8?Q?g4V9ekJcLjrTqWk7TPonzkiOf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41651e93-dccf-4e06-30e6-08dd991a3cfb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:20:13.1507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlzEG0Og0zuC2ua/oBCFX+rLkATruol1QhP49wzT9xWP36SyoC6HoNiuIEex15AVBpvwHMoqUUO6m9+U2nln/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7910

Hi Ilpo,


On 5/21/2025 4:12 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Suma,
>
> Could you please fix this as well.

I am checking this. will send a fix patch.


>
> The relevant configs:
>
> CONFIG_AMD_HSMP=y
>
> #
> # AMD HSMP Driver
> #
> CONFIG_AMD_HSMP_ACPI=y
> CONFIG_AMD_HSMP_PLAT=m
>
> CONFIG_HWMON=m
>
> I think it tries to build HSMP's hwmon.o as non-module and therefore
> fails to find the symbol because HWMON=m. Maybe something like:
>
>          depends on HWMON || HWMON = n
>
> to AMD_HSMP would enforce building hsmp as module if hwmon is module.
>
> On Fri, 16 May 2025, kernel test robot wrote:
>
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
>> branch HEAD: 90b85567e45736b662d034be536a76ba0f4c7ca8  platform/x86: Add AMD ISP platform config for OV05C10
>>
>> Error/Warning (recently discovered and may have been fixed):
>>
>>      https://lore.kernel.org/oe-kbuild-all/202505160451.uiXqsnFq-lkp@intel.com
>>
>>      ERROR: modpost: "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/amd_hsmp.ko] undefined!
>>
>> Error/Warning ids grouped by kconfigs:
>>
>> recent_errors
>> `-- x86_64-buildonly-randconfig-001-20250515
>>      `-- ERROR:hsmp_create_sensor-drivers-platform-x86-amd-hsmp-amd_hsmp.ko-undefined
>>
> --
>   i.

Thanks and Regards,

Suma

