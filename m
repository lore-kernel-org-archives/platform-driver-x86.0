Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4EF21345
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210957; cv=fail; b=erMFVJ1LTyatTHdDIqsNuxcQ62TWIbIkpQ34RPRG9VK10CSUOQmJ9UotLF3oVZM8wwOagCP9ibPxZCsud8UJwqJHuGYrSb9XYuB4oMfWW3UPeWqQkEqz5ma3pPVhb1Ek7B7pgTrFm74WZoFRxmqTDKYjZOZs0ZWmJMu+8Q7aai0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210957; c=relaxed/simple;
	bh=5wjdKQxIGrgPslLEnGdBgBOvJqJjEg4Li/F4B3tEz/0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FIjt4rSNKG26QjPFLcYPQop62ZkCdPzbGJbaCuJbhyJC2JoNhV4nk1ADTNUc6pEAyt0OTl1XChGD9N0KaNIjelME4+4rsdyQ0bYacqTit1qfnxSzd/dUaYiqe9Zditvqw+e+8AYv5jT9lf/mfmOmjfFssijGbcys9KBipNjdLSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oNIi0ziw; arc=fail smtp.client-ip=40.107.244.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oNIi0ziw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoV3ZbVXgzhWnDVjcmF7QyYXEJYpBAUizsOu2ZdPLQDqVrQ0ndfsRQaVOcftDrGFUkDOq3h1qJpxr9d/ukvlNPZypdCuA+j1dRXSkFXgiXkpth+Nd8it5XjHgBFT8BaTKiOXKrqoS7Nh1K/zxbSPRU6MUZzwV+WLyQKiUH4s2KfMfrKkdN74YrXBh+M2PQWpmvZek3kPv6XEDdJdnKhA3cDzj48AZUnHfq8gxMvJM+4zgSfq9ThsNb7QkisGQdRt4lWjKdrDcXIdiFUM0HbdokaykQztRK9jqCrVvtJfJmG/yu7hxOr5qc+Hn6HGDSpPLhXbwvGPE4e4fcf76qPGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvXRP0UjOWqiPjH0VMS1602xdzcyFURL/NqksgjC3I8=;
 b=irNvUxpInnr9QCXwdsTUVj2pNCfeM8fRJyB8OI/gbmTkDXvausCkijb/5abjJbM+o95jQHywO96ASskOZUwFPThqj3ZzJTIp3e/Qxm7wJ4N8yWhzFb5SZCRMcEiQ1GENZL1GhLOZ6HJ19NojWcrK2xT4Hv0lJyGujHgoCzNAC8vtJQfzWmTjGqK3nXZ8wUkjZ4SFlAmRu27JKrwjj0iZqoRvKTOqxP38Z2Dp2SQ1M7sA2OnDw///XZr6TrlwmrOAFJIE4QDdw3kFhBe1foJSuv9vfMLjhaA2r4weYJWImIVoez2ndhmSF2m+4OZ8XVbrirAGngMTwK/2b0BOoVcgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvXRP0UjOWqiPjH0VMS1602xdzcyFURL/NqksgjC3I8=;
 b=oNIi0ziwco0ldmCsLCVsQTIPlgIqr9SWs1VkCbZpnG73RCJYBWI48xdgQHzMH/sxga3Hzkp+ehexkcp6/Z52FKDJ0bOMxTI+6FicksEVX/ENEQN2r9KoxB0DffJxRN0/fdiN281o2f5Gnlt4tzU6qE8difItqe2nGndA5x8UAnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL3PR12MB6377.namprd12.prod.outlook.com (2603:10b6:208:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 14:09:10 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 14:09:09 +0000
Message-ID: <5b2e7143-97f3-4907-96c0-21a513058df5@amd.com>
Date: Tue, 29 Oct 2024 19:39:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] platform/x86/amd/pmc: Add STB support for AMD Desktop
 variants
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-8-Shyam-sundar.S-k@amd.com>
 <b1a97ede-3201-4b04-96b0-9a5df92254f8@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <b1a97ede-3201-4b04-96b0-9a5df92254f8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PEPF000001AC.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BL3PR12MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 3837958c-3d89-4a54-689e-08dcf82341e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ayt2K09zVzZPU0wzd2JXYy9xYXJVbWZIUitTM1FQOFFkUyt5UlBxK0hLZWVH?=
 =?utf-8?B?N2VGWmI5bVd0T0tFOGxiMno2TVArNmtFTHRVMG91UXJxcVdyODExRVFBTWJt?=
 =?utf-8?B?T3p6SXpNNjQyaEk4VTBycURZc3l3cGsvRmNBcXVlQngyYml2Q0t3cmxHRVdK?=
 =?utf-8?B?b05MTzJFZXVNalBDYWRwYkZORS95T3Z5YS9jaEY3OUtVQytJeTR3ZWEwRVha?=
 =?utf-8?B?RTBqWlBmMzRCL3FFL3FYM092TFBrOXNzMEZaSzFwQXF5NjUvQUJlREx6eGw1?=
 =?utf-8?B?cVVkbUVYVEJ4UWJMUjJ1WDkxS2ppQ1hHdGZIR1FWdm1WbWZ0bkR6T05zdjR0?=
 =?utf-8?B?UjI5UzJLemJXQ0tCcXJEMlBaQ0sxNVlCK1hHZUJsQzRENXVVZFU1dTZlTnRJ?=
 =?utf-8?B?Zy9GRER4dmxsWVo0NUxwZloyak1PL1lyY05uM1g0QXJYdVpMNUg0TkorbnZG?=
 =?utf-8?B?czVKNkNVbW02WGxsc1RnVDNRTCtUVGdTajBXTFJIYkJPVlVZSmVsWi9vWGc4?=
 =?utf-8?B?blVscXZMQktRaE1nU2FhcEsyamQyZ2ZrejhIVWZxQzBWRytTQzN3dm9LRWVx?=
 =?utf-8?B?bllOLzRvVUQ5UXRYYXlCcS9zSFlwNk5NdVFpOHBNQURlMTVTUndzL01INGVv?=
 =?utf-8?B?NEJWaW5mVXVObTVKby9SN0Q3RGNIcHVxTlRzakFjZ0NyQVhNMDF6Mys0SVhz?=
 =?utf-8?B?MDJDL0NCNGtMTStKTzNFSFh5S3pobHQwaVNNOFVtMUEvWVhBZGdicnRYekJP?=
 =?utf-8?B?WGFBQWoyUHY4a3RPaXBDS2ovdVlISFRvakZWdVVETVZob0x5QmlCOHM0QUlq?=
 =?utf-8?B?NkhqMGpDeC9pTTNYNHcxakhrai9tNnk1R2RnbW1EQU0zUU1mZDE1a25sbkN6?=
 =?utf-8?B?V21jc1pWSXREYkFaTE0rbDQwKzlWNmxKWSswdXVrcDVWN1hHUXFzdFlnZDRh?=
 =?utf-8?B?VUxqTVFmd1pKdFJtUGJsM0lxK2hHUytPV3pPb0xpZ2RwUmxVMExPeFd6c1Zt?=
 =?utf-8?B?R2liOTB2M2RrMnA4dStpT1NOaXpBT09MREpUUzZQYlRkN0tyWUZXUXFXUTVj?=
 =?utf-8?B?NFA3cUNqWTcvR3ZEZENRVWgwaGh2b2c2TUFjNWdYSXNWV05PbVpuZFFqZFV4?=
 =?utf-8?B?OTM5Qm14ajBXTFpIVFBOLzhhUDR2M3VKTHE0RHpmQUpPaVdycGs3eDhySkxi?=
 =?utf-8?B?VVh6UVhuTFN1MDFiOU1DWUUzVi9JUnYzRnVGbkd2azlFKzFUSFI1UjB3SmlP?=
 =?utf-8?B?bzVsbTc2aFFEMDVCS1BzYU9sbEo4L2FjK0ZiTFNEV2pvTy9sMWMyd00wbUdm?=
 =?utf-8?B?a2t1N0ZYdWIyWTdVcmZ5K3lwb1ZhVDYzZCtHWlU1SE5sblE2NXN3OU9xKy82?=
 =?utf-8?B?OWpRZE8zU3MrTUN5ZWRJYzB3YjZudHc0QjY1NnhzSnhhY1J5ek11U055Rzgw?=
 =?utf-8?B?NlNWaE1uRXlTWGNnb3RNMnpGZHExQTd4N2hJcTROU1hzSVZ1bk5VNjM0c0U4?=
 =?utf-8?B?WFduRkN0MTJ5eENkZVBaZlZQaHBlWWxlMWtsR2tPSFNDMnFjN1ZkOFk0NXBs?=
 =?utf-8?B?U1BYODB5WkUxRzNYVzZDUHdleE9GQmFtanFUTWw5VUo4Y25ZeDZSYW1MSkpv?=
 =?utf-8?B?UWkyaWpsc0Z6TTRGVUtVZDhXVkRHZVdIc1ZoK3JMMVVObVdSN2F5emVEQnNm?=
 =?utf-8?B?Q0pzaUVKWm56alh0UzhnVkhyZUZ4L0d4YnZrWDBUdWhMZjVNT0FYWWxiOWRK?=
 =?utf-8?Q?lnVG2Rf00TI6bXx0k7KX09g1xCaCQ5+6ZIa0+m1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE82SmFlbW8zbXhQamR1WXpOMlJVbWR0SDZLN3pnaTVDZ3VjaWJ1MG1hQ2l4?=
 =?utf-8?B?RVYvbFA4Tmp1dmgzQ1NiOTN6MVNHYTQ5NzhkbW5rdmtyS3RuZWpUUVg2bS9r?=
 =?utf-8?B?a3Zaa3VwemFxd0lFZTF6T0EyNGk2VUhpK3htQ2NHczdPbFZONGlLQTZ4TkVL?=
 =?utf-8?B?TTR1S0RJeEQ5dVZBOGhROFFocXVHSzdwZ0Fqa0lEQWpIN2JWVUx4ZTFQbzgy?=
 =?utf-8?B?Snd1VHBYbDhIZWFHZVhKRGo1SnQrMVlCWkVRYncrNnpxelRtTTVOSy9na0lv?=
 =?utf-8?B?S3JhKzFTVFpCQmhGd3BiaDU2NmMxVm5vQlp0ZGlTRlVUQ0swcEMvYTFVUVJL?=
 =?utf-8?B?aWpjR0t4Z01Lc2xsb2pMKzNINDhzdmtaRFkwUGFFZVhUUElnSmxBeGtUZGRR?=
 =?utf-8?B?bi8xMldzUEp1QU5hcHgvRHhMZnIyWW5ISjRXa3M3U0IxdWluWWFITVpRMlNJ?=
 =?utf-8?B?OCtwV0FzN0pFRWhIQjkvWTVpdkRyTCtpMDVXbDRNRktoSlhqK0ZXMmtPTVRE?=
 =?utf-8?B?ZmxyU0EwV1htL2VjbmJpT2pEYVFmMDg3UU1jQk1rdkZINFhNYXFUdzN5YVZK?=
 =?utf-8?B?b3hhbzZJM2NnbU1BZ2lyUTQ1T21Uck10c0tzdGlrald3cUJOUWVpdXRWdkdS?=
 =?utf-8?B?VEVvYzlUdy84TklPTmxRSEFHbVFvRGs0bHFNSDhmREpZbWtia0RTWjUrUlIz?=
 =?utf-8?B?S2xMUnU0YXNFS2NoU1cyK0JWWXhjNU1PNUZ0dURNRm5JRUJNcDd6WGdrdUJo?=
 =?utf-8?B?dmE0RFNGd0YySkpCRi9PWGlFZFpMVHRyYUZsRitwZ1hkSGxDdTFzeG1vN1du?=
 =?utf-8?B?VHRkanhTejlyUmVFYStHSUdDRkMrMURZS29tODhwaHU2UTJvcDJSOWtUaW5G?=
 =?utf-8?B?UW5jUktteVlMT3ZQZXpPOGhadTFvYlBQSWlBRlpoRmxETU5IdGQ1RVd5SXVM?=
 =?utf-8?B?TVVKNktzdlIrcXg5eFJ5RFM1RXJ5ZDJvMnBhb2tSUEZrY2FoVzVLUVNwUy9Y?=
 =?utf-8?B?THRYMEZxUHl5K1hIYkNxZkFvbmorYWI2bWtNOWFGbHFIUWhLVXpEeVh2d3RQ?=
 =?utf-8?B?QTlKU21vZUloZ1JpNUN3YjNxY1NkcFJVQUJCVHVSRFF3SCtBbEJQU1NMMUZC?=
 =?utf-8?B?NnZJRWlRSWI2clh4MlBPc0pxY1dqL3FOaHdWWDVIWG1JUVNDQXFHMk1nWDV1?=
 =?utf-8?B?QnJDRjRmZjZLS2FoMklvUmdDbjMrenA1ZG9wRmIvNE0xR3dhZEdSV3pqZVdO?=
 =?utf-8?B?VDhRNXN0SWlncWc4U1YvS3g3Z1QySFZWbitwMkJvQVdjY0FueVdmVUZBZkJG?=
 =?utf-8?B?WlhneTJZdWx4Q3pNWGVrVXZWSndXNFNQNWdQS1VBUGtPQUVUQ3R6MEpTeFZD?=
 =?utf-8?B?MTVDajJUUTh1dWNtTXBXcUZ2OElWNkdNd2lyYTFRbG0rSFJiU3N1WjlJazYz?=
 =?utf-8?B?emhhVjkvczhSaDArYWljNjJFb1ZaYjVJTU9FaEpJa3ZnenNjOWc1VUVpeldG?=
 =?utf-8?B?eFdTL1lBcFZTTW5JNFlIS09EWVhlMEdzWm0wZE1ZYmdObkQ4bDZlTVQ3Nk5x?=
 =?utf-8?B?SHM0WnNaODlvK2Ryd0ZTcEErWTY5RklJSnZzRkhqT1ozTUtrK0lQaHFpVElF?=
 =?utf-8?B?SW5iME9CSGk3VC8zVERlMnZ3KzM1ZjN4Tkd2aDBRdklHRUJ3UGk4NDgzNHpw?=
 =?utf-8?B?OEM4SDZGY1FUTGttK05HM0puZ01CZXZTdStQeC9LMWwva3prYnY3U29IMTNB?=
 =?utf-8?B?cmFHek1GMkd6MlhlWU9RRG1WS0lhdHU3MGtacmlzeXB4d2dib3YwVkR4VkND?=
 =?utf-8?B?VXF3OWlnckVZTUZBQ3pNMVFDVTRMQmROakdnQm1ETXpFNm1SOEFUbU9YcEpE?=
 =?utf-8?B?OEprb0JQNGZlajVCK0JGUWxmZVFJN3NDeTZKTXM2bHpjcjdpV0xWT25xalMz?=
 =?utf-8?B?Z2M0UVlNRUwvSVFsRGx3VUx3Rkc2Y3gwemJkaXpQdlAzV1F0SHVncHBpd0xv?=
 =?utf-8?B?UitSWlpmZ1hrb1c3MXRJaXNrM29uSVNyL0x4V2VBanZDdUxpWEtOWktFY0JK?=
 =?utf-8?B?aVdWc0ZYbkRWR3YzVjlQUWtkbFltKzRJMkVsV3BCK0FsODNVaEE4K2pHajdF?=
 =?utf-8?Q?4pTQH2dCQCzkY2Ls21r2hi6ku?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3837958c-3d89-4a54-689e-08dcf82341e8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:09:09.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5Ne2G9m8SYTnxKE6VwrC0NhFTG/YExhn8vKC2OSbep2njw3N9HOeCP/L3sLSG3vpX4yK0eX18gUJ7iTOTNYrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6377



On 10/28/2024 22:18, Mario Limonciello wrote:
> On 10/28/2024 02:04, Shyam Sundar S K wrote:
>> Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
>> However, to accommodate this recent change, PMFW has implemented a new
>> message port pair mechanism for handling messages, arguments, and
>> responses, specifically designed for distinguishing from Mobile SoCs.
>> Therefore, it is necessary to update the driver to properly handle this
>> incoming change.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmc/mp1_stb.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c
>> b/drivers/platform/x86/amd/pmc/mp1_stb.c
>> index 917c111b31c9..bafc07556283 100644
>> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
>> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
>> @@ -36,6 +36,11 @@
>>   #define AMD_S2D_REGISTER_RESPONSE    0xA80
>>   #define AMD_S2D_REGISTER_ARGUMENT    0xA88
>>   +/* STB S2D(Spill to DRAM) message port offset for 44h model */
>> +#define AMD_GNR_REGISTER_MESSAGE    0x524
>> +#define AMD_GNR_REGISTER_RESPONSE    0x570
>> +#define AMD_GNR_REGISTER_ARGUMENT    0xA40
>> +
>>   static bool enable_stb;
>>   module_param(enable_stb, bool, 0644);
>>   MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>> @@ -244,6 +249,13 @@ static bool amd_is_stb_supported(struct
>> amd_pmc_dev *dev)
>>       switch (dev->cpu_id) {
>>       case AMD_CPU_ID_YC:
>>       case AMD_CPU_ID_CB:
>> +        if (boot_cpu_data.x86_model == 0x44) {
> 
> It's unfortunate that this information can't be discovered from the
> F/W, because this code is now turning into:
> 

That's true.

> switch(dev->cpu_id)
> case FOO:
>     if (boot_cpu_data.x86_model == BAR)
> 
> That's pretty ugly IMO.
> 
> If you're doing to have a check like that, I think it's better to just
> ditch the cpu_id (root port PCI ID detection) and go all in on x86
> checks like this instead:
> 
> if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
>     switch (boot_cpu_data.x86_model)
>     case 0x60 .. 0x6f:
>         //set up args
>         break;
>     default:
>         break;
> } else if (cpu_feature_enabled(X86_FEATURE_ZEN5)) {
>     switch (boot_cpu_data.x86_model)
>     case 0x40 .. 0x44:
>         //set up args
>         break;
>     default:
>         break;
> }

The only benefit I see is instead of using cpu_id, using
cpu_feature_enabled() to know the underlying generation.

We have to update two things with the evolution of family, i.e.
s2d_msg_id that is changed (and getting changed..) from each
generation/family/model and next is the passing the right arguments to
PMFW (i.e. msg/arg/resp).

But the catch is, the s2d_msg_id is tied to the model, for which we
will still have to depend of boot_cpu_data.x86_model() to get to know
the information.

So, the code will turn something like this:

{
if (cpu_feature_enabled(X86_FEATURE_ZEN2)) {
		dev->stb_arg.s2d_msg_id = 0xBE;
} else if (cpu_feature_enabled(X86_FEATURE_ZEN3)) {
		dev->stb_arg.s2d_msg_id = 0xBE;
} else if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
		switch (boot_cpu_data.x86_model) {
		case 0x60:
				dev->stb_arg.s2d_msg_id = 0xBE;
				break;
		default:
				dev->stb_arg.s2d_msg_id = 0x85;
				break;
		}
} else if (cpu_feature_enabled(X86_FEATURE_ZEN5)) {
		switch (boot_cpu_data.x86_model) {
		case 0x24:
				dev->stb_arg.s2d_msg_id = 0xDE;
				break;
		case 0x70:
				dev->stb_arg.s2d_msg_id = 0xF1;
				break;
		case 0x44:
				dev->stb_arg.s2d_msg_id = 0x9B;
				//update stb args
				break;
		default:
				break;
		}
}

//update stb args
}

IMO, this still looks clumsy. So, I will take your input of using
cpu_feature_enabled() and drop cpu_id from root port..

but, I have a code simplification that will be addressed in v2.

> 
> if (!dev->stb_arg.s2d_msg_id) {
>     pr_warn("unsupported platform");
>     return false;
> }
> 

This is not required, as we will end up having unnecessary spew when
this function gets triggered on platforms that wont support Spill to
DRAM, i.e Cezzane or lower.

I have looked your comments on 6/8. Will address them with
cpu_feature_enabled() + code simplification.

Thanks,
Shyam

> return true;
> 
> Then each time a new one is added it's a lot easier to follow what
> it's really matching.
> 
>> +            dev->stb_arg.s2d_msg_id = 0x9B;
>> +            dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
>> +            dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
>> +            dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
>> +            return true;
>> +        }
>>           dev->stb_arg.s2d_msg_id = 0xBE;
>>           break;
>>       case AMD_CPU_ID_PS:
> 
