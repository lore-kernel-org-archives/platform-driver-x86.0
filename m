Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210B156967
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jul 2024 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522240; cv=fail; b=WnV14w1Q3NRw1Mt7b+kRr278t6MUUISpnczajzTWfdc6cwGqby8XUTsBbmYq4cmQr1Va7dJnP8wLyOnSNoyBfvdPJaG4mPGwsl51U2DqJHTGyhoAmwOuwlwAnibgcWILhlpuj4pk0awDKO9LhfJyBOsTBgGFs7yGDbcyDIXh4DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522240; c=relaxed/simple;
	bh=lrVkehks+Q032pAjs22ljibzM9fS88emFSKf0PzQPps=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qsWa0qRKfumi+A/hleZuTScpbvAB24YpCYgwAtCVrFSS0kxCIvORbN6naidadGUKrtaUdBSvWwvPafVM/lA8RIRMPs2HtoD6OmJthXPTa4KiuvRVfqeRB5AhTuv0R3hfutmYra/gqUh3S6KzdO3GhzrB/ICIlBq0Fi3br4UnStU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ViS2lPpg; arc=fail smtp.client-ip=40.107.237.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ViS2lPpg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkBbtySYLWbbhgjjwi0nxMdQH3kSp3O4y+FLkTxaZ7ycxwKCGHvQZJBxy7f7NKlnPjGzwliya97E6hUUpGm8lEyvZQ57KzrEY9R/KGERuRF1wbFNq5ePeERmESo3aHJTVnCcZJISpvJwmIQO90M38Wl11nJoCJjSx2wDFd2A99yBubQWTBYKWindpV2Q0tZ1gmyqzfkQV6MUBEkuFhsnUaHCck4V16vYq9+mNz8AsQpvUZSA71I6ov5uFfSszlDQXjSkjNQJ6ePGstmPP/ds0YbjpPxkKRBqEGgUXPlntL8TG8zGCEWBKFPsaUiS72Rdnm3zoR8f1ND4Kl152NWwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0hri1tRYQLIuF8bpNoQWuVcjoPxzCeGyxq9gsKS+0g=;
 b=f7ItdoVWuFulHDm8nJlUEqn5O4JUgo1nlb1E7e/7vw79XLJ7SBwypN/Mrq5xbD8cIvcV6209uDvm4IsaPKHNI0+F5rFiJoDQ0vm7MZpYY43LLz0y6WXIWyB6LMFx3xN3/mt+/G4Y+SxQoI5WDGcH9oRpB/xwQ4ROBAi8zfX8U/JLKC7rHfB+GQnRSmh7iavJPdvbewQBsVnTiayCVciL9n/GoZM3fDqzOtuTjDvEVEhdAf2Y4gBeREqJXv7yFAZXhMBVNVQONTKo70h9LyjQMmb+5CwcPtzmaHkmzLnXpjNFe3zBaSghw/xlvNzRQ5ITiRiQKlre9mtfx9SlHExOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0hri1tRYQLIuF8bpNoQWuVcjoPxzCeGyxq9gsKS+0g=;
 b=ViS2lPpgGi6E7J2oZ6tOqsyQsZMz5pIczOwY802AKGx7CB5/j0+NkWdTq58AaavVCGCEtiEGHzT/q2DwguWxXo+DQdmm74s1GeYhQuJB6kXl97Dna4TACBqB87w6FG3q3vqMIc1jyLwYmfRt2UN1qoRyjjxR358KfPI5XtwCOmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by BL1PR12MB5948.namprd12.prod.outlook.com (2603:10b6:208:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 10:50:34 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 10:50:34 +0000
Message-ID: <41b9c3ff-c406-4df5-bae7-25be4d4c361f@amd.com>
Date: Tue, 9 Jul 2024 16:20:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] platform/x86/amd/hsmp: Move ACPI code to acpi.c
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
 <20240627053958.2533860-6-suma.hegde@amd.com>
 <40c43c62-6666-573f-e0cc-a86bfbff12db@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <40c43c62-6666-573f-e0cc-a86bfbff12db@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::14) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|BL1PR12MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 632c4384-6b49-402b-2b91-08dca004f58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3AyZlZLNk5hVXNNUzhPblYyY1FyNUt6KzYwdFRpV0ZiaG1NM0o5YkhZUm5z?=
 =?utf-8?B?TDVsaWMwVkk5QlM1ZDJraTlPbzVYRUxoS21pU04welJSbk92dEYwSGVLM0Ez?=
 =?utf-8?B?N2JFMkV3RGFaTFhTWXJ1bU96NW1wYk1VZXNtZzNnUW8vSVdVdUk2RkRUS1Z0?=
 =?utf-8?B?c2VCdllpb1J5NnpxdlB5THRYdXpuZHJnY1pnWjVLWGJXYnBnWnF0aHRZQVBR?=
 =?utf-8?B?M2FqRlUrVk9YdHJKV2JIZjQ5YU5mNnkwMURrQ053OFZtdFRmemg5aTdaeFZO?=
 =?utf-8?B?T1UvZlF5YXlwRDBMajlIWGZkejA1eXZITDNJS2lLMVlvL0F3czdXc0YyODl4?=
 =?utf-8?B?SGl5dFlIWUZqUk44UVNnLy9xR201NFZ4T0J3aUd2cmxrUXVBYkMzbnhXdDJy?=
 =?utf-8?B?OGpZMGZGaEtNVEk2ckFjVUZSTDFaMW1WSUpkaFdLdVkxK2N3LzVwYTNYQ2k5?=
 =?utf-8?B?VkZwaEZPQm0vSjNIdzB6MkNEYk1CK2JKZGl1d0lJVU9mS00zZG55NE1WelRo?=
 =?utf-8?B?Rk1QQ3Y0V1UzbTJwN2xDcFcvclBLZjhxd2VHc2V2QWFxQy9FN2hOM1MyWjJK?=
 =?utf-8?B?Zk9yeEtDYW1DQXpiOTBNUnFJWEQySndhK3J2ejE0LytDUUxlQ3hZcnNCa2RL?=
 =?utf-8?B?aUJUS09TRFQrVmVMS1BlRkVaNHZvaXQyYVowWCtrZXdMeVFMS0MvRm9YZTFK?=
 =?utf-8?B?T20wemxBVWZvQSs0OXFiNjdqVmF6dmtsWGtNQTZSanhyOFRGbTY3T0FjMFg4?=
 =?utf-8?B?VDdaSDgvU21aQ05OeStCdUJKRUtWeHhteW8vQW1UcDYzSWVkWmNZaG5oOFZI?=
 =?utf-8?B?T2owS0NtaXpINmNMTlAvNEtFREpsT2VBVzh0T0c5QmwzN3huRDczRHhuclJH?=
 =?utf-8?B?d24wMGt0OXg5bk1XNUJ2dGZWWVZkOVN6QUhsS2k0OWZxV1E4U2M0Y2M0Z2hX?=
 =?utf-8?B?QjZ0YmtKWTZ5N2FNbzRXRmFrRVFoUkduZEcweVZjeEUrTFpick5kdWlZd0tq?=
 =?utf-8?B?NUZhOS91eHFRMHNkd2dsc1Z2QWV1YTB5SXNKMXlDQ0kwdjhPd1poc0dUd2NS?=
 =?utf-8?B?RjFvVWplUWtFWjRLWGxuNVFQYXZSVzZXYTBNcjN1NTY0RG5lNWpaZy9xR0lJ?=
 =?utf-8?B?Z3FLUThLZThrcXJBRTJ2SlNzd1NweG1vUWdaNVFoemd6UnkybWNBWDZHL3Bq?=
 =?utf-8?B?RVBZb09Vd1JNVkdOVG1MUkZRcENSMCt5QmszSG9HM2tnMUE3eFEvY3ZOZ0NU?=
 =?utf-8?B?clVXM3BvWFZwY1U2TkdlWEg1b3dqMi83ZXhLaXBrWDJQeDl6YnNiSnVnMG91?=
 =?utf-8?B?bFB5VVZwckc3NUZiQ0FBRGF5U2JGV2Zub1dRZDhxaXY3T2dhOXAvU1pkVXB3?=
 =?utf-8?B?d0M2bDBxWUJ2Q1ZBOG8rZTZDbThiUUhaeDQxZEVYMWc0MGMybUsvME5WTDE4?=
 =?utf-8?B?NnBZdE44VnB1TWM2UDd4QkN2UndCeDl1WWJYQ1NmSGJaUjFXRVBFMGszRXJu?=
 =?utf-8?B?WnpsaGJhZ20yVGFObkQ5d1RSVTNIZUVMSlF5bS9wdW12ZmxucGdZa1Fkc0V1?=
 =?utf-8?B?d0g3VGdJbHhNZTNmblFZdnhIcTVGYmpwZkIzTFh3bjFob2cwR2N3VVVsU3VS?=
 =?utf-8?B?Y2VkNytDMXhiS0ZmcWN2VFRRbzhZTE1peWtXTS9LYzN3WXZNWm9GdUg4K09t?=
 =?utf-8?B?aStubGpMdkdIRW03Q01zcUw4VysxVDkycGxMQ2g1RzkwVDlWWDFKc0xmdnd1?=
 =?utf-8?B?bVZvcVhQYmMzMHg0b2o1QVNqYy9rbkZSRGFtUUdWN1ByZXF1YWQvSTg1MUJK?=
 =?utf-8?B?U1JSbUtqMXFTUDY5UDY2Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE5HZVpFQ05TS1NZbGxKNzF0NmtsNU53NXptcUVuRXdsRGJKait3VzB6UWRY?=
 =?utf-8?B?THpSbWx5ZDJEdEJxaTdLeHorVnhWV1hJUHA1WjB2c2ZLcjRzQ3hjSnVwdGFE?=
 =?utf-8?B?cFErcExCVGFiNS9ONnRqcnlOUnlCMDlWRFFwc2hYeWVFeDhTTTEzU09DSEc1?=
 =?utf-8?B?eGxZTXFHMHpmeHE1djllSStTSzRkT1Vrc1hLTUgxNEVrV0J4UEFKZE4rTzRj?=
 =?utf-8?B?R3FCNnIvMUFlNVhhdE1vd0FhVkNmcEQ5V01nTll4WmVMaUNnNFZ5cEZ6SVVH?=
 =?utf-8?B?NVpKenp5Vis1MXp4ZVk0TzF5aWJoa0JlTUNTajZHNTIzUEtQSXZLdmZIVm9w?=
 =?utf-8?B?NjF5ZVRYWVVyS2F3Qm9kWHUyMWd1MUFEMjNSUGMzY2xSbytVQlZyaWhYbU1N?=
 =?utf-8?B?dS9XRHhZdU00L29VQjBIMTdZTUVZRHkxTWtHT3NuQm1uV3dlRC84enNOYUI1?=
 =?utf-8?B?NzJ2UXhEdWMzQlRaa3hLRUxmMkQxMTlhTU5ESU9oRldtRC9ncHR2b2JvTmdI?=
 =?utf-8?B?bWtkcGtydExXKy9ZQjk0cTRiZWxhTWtzTEhsazMwaHdCRHlnODJqRW5FaU9W?=
 =?utf-8?B?R2xzSmthNDhaR0FUekIyUWMzcnRBcWwvdWYvNHovMGlEMTBTZVp1dEordGRT?=
 =?utf-8?B?a2R5OFlrc1pLeFRLM0x5MUszT0M2K0cxM1p3UEs2eE5pWEJieEV0WEwweXE2?=
 =?utf-8?B?Y1VDWjlpK05mNUdGQ0I4OEJ1YjVpcG4zYVVkYUVWSi9CK2FURTRTMVVJSzRC?=
 =?utf-8?B?SEFlYndQR3R6TUZITyswWHZndTJPTlgyZkoxZU9CalNrV1g0YVhPRVRvOC9u?=
 =?utf-8?B?SitzRkNtUnpiWlVmOE5qZGV6MmkxZWVkUlNsU2NiWGliME9VeXpMRVRQMENk?=
 =?utf-8?B?b0Y5UGNYQnJIKzFadStXclBoZmJmYUZKc2JSckVwWXhOeEY5Skh0S25SUDVt?=
 =?utf-8?B?WWYzbzIvd09pbkR4U093Nnhnajg3MnRpc205dHF3ejYzNENFQ2g4cXRmS0dT?=
 =?utf-8?B?c1p6WS84aFlIRTZTOTdzOFYyUDNxM1U3VU55cVhJdWVNWjFrK29KM0o1SEdL?=
 =?utf-8?B?bWFMc2Z1MElUQkl2UGdCZldyR2p4alpUZDZwT0IxYlF6clNZQUc4bVRrVkJL?=
 =?utf-8?B?dTMzZXBuRUFUSUNCZmJobmNDUHltL2FleUd6eG0xTUtGb3FNRjBoOVFkWkFO?=
 =?utf-8?B?L2xVZjlFK1ZKNndHelpYc3ZURnd3Vkh0L044WXRBR3dJYitBbzRLbjN2STNp?=
 =?utf-8?B?RDFDNXgwWGxsc2hQTVk1L1Y0b00vdkgyV2R5TUNHSHNXUkozQytSVURMZ0Fq?=
 =?utf-8?B?alBMNVRKL1ZVTTFrZHZ4SHJCczZ0U3dCN2JEK0p4MWlveFFCSS9iVUtTZ2or?=
 =?utf-8?B?TXJ2ME1wOVh2S1ZVcmN4djBtNlY2cm9KZjNDUm5ERnc4c2JDZCthdG83ZjdH?=
 =?utf-8?B?aGw3cVVZL3RyZEV4QWtqdGNpZzNkL1NLUGIxRDhSNjArRENERmN2MFJDQ3Fw?=
 =?utf-8?B?bndHcWQzdDNicVM4VFJPaHkwdkg2YWtCeXVNY2NDTGVHV0dSQUxWUUllWmw0?=
 =?utf-8?B?RUFhaUJxaXdDeWw5N3VPblZvZkV4U0VITVo2d09lejk2bVlzaERUcGF3cFlD?=
 =?utf-8?B?ZGx4NUJwcFZVd2RidUxZKys3eDcwcllyOXFhaEdnTFZMN2ZHZGd4VlA0UVdq?=
 =?utf-8?B?Q3FKY2NQRFpkNXdmYkl3RnZLaklhVm9rVFZpam5JMEc1K205eEdSYnB1K25K?=
 =?utf-8?B?VWhtTjdZZ0JRUXZXMGRmQ1Jtc2VKeDNkRVBTRlZjVUVYVnVQVERaSHVBMG81?=
 =?utf-8?B?SFZURUFtUVhTV05wdXdUd0pvVzAvMVRpdTIzRTQ2eHRQZ1JkUHpVNmhsc0ln?=
 =?utf-8?B?UWRyQXh2bVVQK0I3Uzd6ZjIrWURkdkU0RmwxMFdqanErbXl0dmNBTG1jTHY3?=
 =?utf-8?B?MFdWMFdVVnFPOUxUZCtFRUVzeitPaitvTjRlYzZmakg1cU12bjM1ZFljS2oz?=
 =?utf-8?B?aUVyb08xMDdlMU5JdHd6NDJDVWdPZjVQZXZNcENzRUZYRm9ZL1dkTHZVNWJK?=
 =?utf-8?B?SUFNWFMvZ0ZWdUdUVkhtNk1EWnR2UGs1Y0d3Q1U3SDI0QmEvalVjK0JjK0Q5?=
 =?utf-8?Q?XJOvC+XRrJ7hZTAkk4gbJxWkq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632c4384-6b49-402b-2b91-08dca004f58d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 10:50:34.3411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjOQwNF/DEpmtfcmwytnXaJLPgbcmGjMr9t4UAZgmtsGl+RMV/7bnewhAz8Grvy9eHzItrSysHs5rqawSrdRQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948

Hi Ilpo,

On 7/9/2024 3:39 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, 27 Jun 2024, Suma Hegde wrote:
>
>> Move ACPI related code to acpi.c from hsmp.c.
>> We still have one driver, the driver probe will be split in the next patch.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/Makefile |   2 +-
>>   drivers/platform/x86/amd/hsmp/acpi.c   | 261 +++++++++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.c   | 247 -----------------------
>>   drivers/platform/x86/amd/hsmp/hsmp.h   |   2 +
>>   4 files changed, 264 insertions(+), 248 deletions(-)
>>   create mode 100644 drivers/platform/x86/amd/hsmp/acpi.c
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
>> index fb8ba04b2f0d..0cc92865c0a2 100644
>> --- a/drivers/platform/x86/amd/hsmp/Makefile
>> +++ b/drivers/platform/x86/amd/hsmp/Makefile
>> @@ -5,4 +5,4 @@
>>   #
>>
>>   obj-$(CONFIG_AMD_HSMP)               += amd_hsmp.o
>> -amd_hsmp-objs                        := hsmp.o plat.o
>> +amd_hsmp-objs                        := hsmp.o plat.o acpi.o
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> new file mode 100644
>> index 000000000000..90bfa1ddadbf
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -0,0 +1,261 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD HSMP Platform Driver
>> + * Copyright (c) 2024, AMD.
>> + * All Rights Reserved.
>> + *
>> + * This file provides a device implementation for HSMP interface
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include "hsmp.h"
>> +
>> +#include <linux/acpi.h>
>> +
>> +/* These are the strings specified in ACPI table */
>> +#define MSG_IDOFF_STR                "MsgIdOffset"
>> +#define MSG_ARGOFF_STR               "MsgArgOffset"
>> +#define MSG_RESPOFF_STR              "MsgRspOffset"
>> +
>> +void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>> +                     u32 *value, bool write)
>> +{
>> +     if (write)
>> +             iowrite32(*value, sock->virt_base_addr + offset);
>> +     else
>> +             *value = ioread32(sock->virt_base_addr + offset);
>> +}
>> +
>> +/* This is the UUID used for HSMP */
>> +static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>> +                                             0xa6, 0x9f, 0x4e, 0xa2,
>> +                                             0x87, 0x1f, 0xc2, 0xf6);
>> +
>> +static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
>> +{
>> +     if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
>> +             return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
> #include for GUID_INIT() and guid_equal().
Ok, will change it.
>> +     return false;
>> +}
>> +
>> +static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
>> +{
>> +     char *uid;
>> +
>> +     /*
>> +      * UID (ID00, ID01..IDXX) is used for differentiating sockets,
>> +      * read it and strip the "ID" part of it and convert the remaining
>> +      * bytes to integer.
>> +      */
>> +     uid = acpi_device_uid(ACPI_COMPANION(dev));
>> +
>> +     return kstrtou16(uid + 2, 10, sock_ind);
> #include for kstrtou16().
>
> I think I mentioned already earlier that each file should include what
> they use, but it seems that not even the original hsmp.c contained these
> so they came from somewhere deeper in the include chain.

Sorry, probably i had not understood the comment clearly.

Will include all the header files explicitly in alphabetical order.


Also will address all the comments for this patch series and will send v2.

>> +}
>> +
>> +static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
>> +{
>> +     struct hsmp_socket *sock = data;
>> +     struct resource r;
> #include for struct resource
>
>> +
>> +     switch (res->type) {
>> +     case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>> +             if (!acpi_dev_resource_memory(res, &r))
>> +                     return AE_ERROR;
>> +             if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
>> +                     return AE_ERROR;
>> +             sock->mbinfo.base_addr = r.start;
>> +             sock->mbinfo.size = resource_size(&r);
> #include for resource_size()
ok.
>> +             break;
>> +     case ACPI_RESOURCE_TYPE_END_TAG:
>> +             break;
>> +     default:
>> +             return AE_ERROR;
>> +     }
>> +
>> +     return AE_OK;
>> +}
>> +
>> +static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>> +{
>> +     struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
>> +     union acpi_object *guid, *mailbox_package;
>> +     union acpi_object *dsd;
>> +     acpi_status status;
>> +     int ret = 0;
>> +     int j;
>> +
>> +     status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
>> +                                         &buf, ACPI_TYPE_PACKAGE);
>> +     if (ACPI_FAILURE(status)) {
>> +             dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
>> +                     acpi_format_exception(status));
> #include for dev_err()
ok.
>> +             return -ENODEV;
> #include for -Exx codes.
ok
>> +     }
>> +
>> +     dsd = buf.pointer;
>> +
>> +     /* HSMP _DSD property should contain 2 objects.
>> +      * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
>> +      * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
>> +      *    This mailbox object contains 3 more acpi objects of type
>> +      *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
>> +      *    these packages inturn contain 2 acpi objects of type
>> +      *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
>> +      */
>> +     if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
>> +             ret = -EINVAL;
>> +             goto free_buf;
>> +     }
>> +
>> +     guid = &dsd->package.elements[0];
>> +     mailbox_package = &dsd->package.elements[1];
>> +     if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
>> +             dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
>> +             ret = -EINVAL;
>> +             goto free_buf;
>> +     }
>> +
>> +     for (j = 0; j < mailbox_package->package.count; j++) {
>> +             union acpi_object *msgobj, *msgstr, *msgint;
>> +
>> +             msgobj  = &mailbox_package->package.elements[j];
>> +             msgstr  = &msgobj->package.elements[0];
>> +             msgint  = &msgobj->package.elements[1];
>> +
>> +             /* package should have 1 string and 1 integer object */
>> +             if (msgobj->type != ACPI_TYPE_PACKAGE ||
>> +                 msgstr->type != ACPI_TYPE_STRING ||
>> +                 msgint->type != ACPI_TYPE_INTEGER) {
>> +                     ret = -EINVAL;
>> +                     goto free_buf;
>> +             }
>> +
>> +             if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
>> +                          msgstr->string.length)) {
>> +                     sock->mbinfo.msg_id_off = msgint->integer.value;
>> +             } else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
>> +                                 msgstr->string.length)) {
>> +                     sock->mbinfo.msg_resp_off =  msgint->integer.value;
>> +             } else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
>> +                                 msgstr->string.length)) {
>> +                     sock->mbinfo.msg_arg_off = msgint->integer.value;
>> +             } else {
>> +                     ret = -ENOENT;
>> +                     goto free_buf;
>> +             }
>> +     }
>> +
>> +     if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
>> +         !sock->mbinfo.msg_arg_off)
>> +             ret = -EINVAL;
>> +
>> +free_buf:
>> +     ACPI_FREE(buf.pointer);
>> +     return ret;
>> +}
>> +
>> +static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
>> +{
>> +     acpi_status status;
>> +
>> +     status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
>> +                                  hsmp_resource, sock);
>> +     if (ACPI_FAILURE(status)) {
>> +             dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
>> +                     acpi_format_exception(status));
>> +             return -EINVAL;
>> +     }
>> +     if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
>> +             return -EINVAL;
>> +
>> +     /* The mapped region should be un cached */
> uncached
ok.
>> +     sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
>> +                                            sock->mbinfo.size);
>> +     if (!sock->virt_base_addr) {
>> +             dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
>> +             return -ENOMEM;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +/* Parse the ACPI table to read the data */
>> +static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>> +{
>> +     struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
>> +     int ret;
>> +
>> +     sock->sock_ind          = sock_ind;
>> +     sock->dev               = dev;
>> +     plat_dev.is_acpi_device = true;
>> +
>> +     sema_init(&sock->hsmp_sem, 1);
>> +
>> +     /* Read MP1 base address from CRS method */
>> +     ret = hsmp_read_acpi_crs(sock);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* Read mailbox offsets from DSD table */
>> +     return hsmp_read_acpi_dsd(sock);
>> +}
>> +
>> +int hsmp_create_acpi_sysfs_if(struct device *dev)
>> +{
>> +     struct attribute_group *attr_grp;
>> +     u16 sock_ind;
>> +     int ret;
>> +
>> +     attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
> #include for devm_kzalloc()
ok.
>> +     if (!attr_grp)
>> +             return -ENOMEM;
>> +
>> +     attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
>> +
>> +     ret = hsmp_get_uid(dev, &sock_ind);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return devm_device_add_group(dev, attr_grp);
> #include for devm_device_add_group()
ok.
>
> --
>   i.
>
>> +}
>> +
>> +int init_acpi(struct device *dev)
>> +{
>> +     u16 sock_ind;
>> +     int ret;
>> +
>> +     ret = hsmp_get_uid(dev, &sock_ind);
>> +     if (ret)
>> +             return ret;
>> +     if (sock_ind >= plat_dev.num_sockets)
>> +             return -EINVAL;
>> +
>> +     ret = hsmp_parse_acpi_table(dev, sock_ind);
>> +     if (ret) {
>> +             dev_err(dev, "Failed to parse ACPI table\n");
>> +             return ret;
>> +     }
>> +
>> +     /* Test the hsmp interface */
>> +     ret = hsmp_test(sock_ind, 0xDEADBEEF);
>> +     if (ret) {
>> +             dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
>> +                     boot_cpu_data.x86, boot_cpu_data.x86_model);
>> +             dev_err(dev, "Is HSMP disabled in BIOS ?\n");
>> +             return ret;
>> +     }
>> +
>> +     ret = hsmp_cache_proto_ver(sock_ind);
>> +     if (ret) {
>> +             dev_err(dev, "Failed to read HSMP protocol version\n");
>> +             return ret;
>> +     }
>> +
>> +     return ret;
>> +}
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index cd4de107a470..d3f0f08cebf7 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -28,22 +28,8 @@
>>   #define HSMP_WR                      true
>>   #define HSMP_RD                      false
>>
>> -/* These are the strings specified in ACPI table */
>> -#define MSG_IDOFF_STR                "MsgIdOffset"
>> -#define MSG_ARGOFF_STR               "MsgArgOffset"
>> -#define MSG_RESPOFF_STR              "MsgRspOffset"
>> -
>>   struct hsmp_plat_device plat_dev;
>>
>> -static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>> -                            u32 *value, bool write)
>> -{
>> -     if (write)
>> -             iowrite32(*value, sock->virt_base_addr + offset);
>> -     else
>> -             *value = ioread32(sock->virt_base_addr + offset);
>> -}
>> -
>>   static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>>                         u32 *value, bool write)
>>   {
>> @@ -298,181 +284,6 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>        return 0;
>>   }
>>
>> -/* This is the UUID used for HSMP */
>> -static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>> -                                             0xa6, 0x9f, 0x4e, 0xa2,
>> -                                             0x87, 0x1f, 0xc2, 0xf6);
>> -
>> -static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
>> -{
>> -     if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
>> -             return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
>> -
>> -     return false;
>> -}
>> -
>> -static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
>> -{
>> -     char *uid;
>> -
>> -     /*
>> -      * UID (ID00, ID01..IDXX) is used for differentiating sockets,
>> -      * read it and strip the "ID" part of it and convert the remaining
>> -      * bytes to integer.
>> -      */
>> -     uid = acpi_device_uid(ACPI_COMPANION(dev));
>> -
>> -     return kstrtou16(uid + 2, 10, sock_ind);
>> -}
>> -
>> -static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
>> -{
>> -     struct hsmp_socket *sock = data;
>> -     struct resource r;
>> -
>> -     switch (res->type) {
>> -     case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>> -             if (!acpi_dev_resource_memory(res, &r))
>> -                     return AE_ERROR;
>> -             if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
>> -                     return AE_ERROR;
>> -             sock->mbinfo.base_addr = r.start;
>> -             sock->mbinfo.size = resource_size(&r);
>> -             break;
>> -     case ACPI_RESOURCE_TYPE_END_TAG:
>> -             break;
>> -     default:
>> -             return AE_ERROR;
>> -     }
>> -
>> -     return AE_OK;
>> -}
>> -
>> -static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>> -{
>> -     struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
>> -     union acpi_object *guid, *mailbox_package;
>> -     union acpi_object *dsd;
>> -     acpi_status status;
>> -     int ret = 0;
>> -     int j;
>> -
>> -     status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
>> -                                         &buf, ACPI_TYPE_PACKAGE);
>> -     if (ACPI_FAILURE(status)) {
>> -             dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
>> -                     acpi_format_exception(status));
>> -             return -ENODEV;
>> -     }
>> -
>> -     dsd = buf.pointer;
>> -
>> -     /* HSMP _DSD property should contain 2 objects.
>> -      * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
>> -      * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
>> -      *    This mailbox object contains 3 more acpi objects of type
>> -      *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
>> -      *    these packages inturn contain 2 acpi objects of type
>> -      *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
>> -      */
>> -     if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
>> -             ret = -EINVAL;
>> -             goto free_buf;
>> -     }
>> -
>> -     guid = &dsd->package.elements[0];
>> -     mailbox_package = &dsd->package.elements[1];
>> -     if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
>> -             dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
>> -             ret = -EINVAL;
>> -             goto free_buf;
>> -     }
>> -
>> -     for (j = 0; j < mailbox_package->package.count; j++) {
>> -             union acpi_object *msgobj, *msgstr, *msgint;
>> -
>> -             msgobj  = &mailbox_package->package.elements[j];
>> -             msgstr  = &msgobj->package.elements[0];
>> -             msgint  = &msgobj->package.elements[1];
>> -
>> -             /* package should have 1 string and 1 integer object */
>> -             if (msgobj->type != ACPI_TYPE_PACKAGE ||
>> -                 msgstr->type != ACPI_TYPE_STRING ||
>> -                 msgint->type != ACPI_TYPE_INTEGER) {
>> -                     ret = -EINVAL;
>> -                     goto free_buf;
>> -             }
>> -
>> -             if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
>> -                          msgstr->string.length)) {
>> -                     sock->mbinfo.msg_id_off = msgint->integer.value;
>> -             } else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
>> -                                 msgstr->string.length)) {
>> -                     sock->mbinfo.msg_resp_off =  msgint->integer.value;
>> -             } else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
>> -                                 msgstr->string.length)) {
>> -                     sock->mbinfo.msg_arg_off = msgint->integer.value;
>> -             } else {
>> -                     ret = -ENOENT;
>> -                     goto free_buf;
>> -             }
>> -     }
>> -
>> -     if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
>> -         !sock->mbinfo.msg_arg_off)
>> -             ret = -EINVAL;
>> -
>> -free_buf:
>> -     ACPI_FREE(buf.pointer);
>> -     return ret;
>> -}
>> -
>> -static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
>> -{
>> -     acpi_status status;
>> -
>> -     status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
>> -                                  hsmp_resource, sock);
>> -     if (ACPI_FAILURE(status)) {
>> -             dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
>> -                     acpi_format_exception(status));
>> -             return -EINVAL;
>> -     }
>> -     if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
>> -             return -EINVAL;
>> -
>> -     /* The mapped region should be un cached */
>> -     sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
>> -                                            sock->mbinfo.size);
>> -     if (!sock->virt_base_addr) {
>> -             dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
>> -             return -ENOMEM;
>> -     }
>> -
>> -     return 0;
>> -}
>> -
>> -/* Parse the ACPI table to read the data */
>> -static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>> -{
>> -     struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
>> -     int ret;
>> -
>> -     sock->sock_ind          = sock_ind;
>> -     sock->dev               = dev;
>> -     plat_dev.is_acpi_device = true;
>> -
>> -     sema_init(&sock->hsmp_sem, 1);
>> -
>> -     /* Read MP1 base address from CRS method */
>> -     ret = hsmp_read_acpi_crs(sock);
>> -     if (ret)
>> -             return ret;
>> -
>> -     /* Read mailbox offsets from DSD table */
>> -     return hsmp_read_acpi_dsd(sock);
>> -}
>> -
>>   ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>>                             struct bin_attribute *bin_attr, char *buf,
>>                             loff_t off, size_t count)
>> @@ -581,29 +392,6 @@ int hsmp_create_attr_list(struct attribute_group *attr_grp,
>>        return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
>>   }
>>
>> -int hsmp_create_acpi_sysfs_if(struct device *dev)
>> -{
>> -     struct attribute_group *attr_grp;
>> -     u16 sock_ind;
>> -     int ret;
>> -
>> -     attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
>> -     if (!attr_grp)
>> -             return -ENOMEM;
>> -
>> -     attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
>> -
>> -     ret = hsmp_get_uid(dev, &sock_ind);
>> -     if (ret)
>> -             return ret;
>> -
>> -     ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
>> -     if (ret)
>> -             return ret;
>> -
>> -     return devm_device_add_group(dev, attr_grp);
>> -}
>> -
>>   int hsmp_cache_proto_ver(u16 sock_ind)
>>   {
>>        struct hsmp_message msg = { 0 };
>> @@ -619,38 +407,3 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>>
>>        return ret;
>>   }
>> -
>> -int init_acpi(struct device *dev)
>> -{
>> -     u16 sock_ind;
>> -     int ret;
>> -
>> -     ret = hsmp_get_uid(dev, &sock_ind);
>> -     if (ret)
>> -             return ret;
>> -     if (sock_ind >= plat_dev.num_sockets)
>> -             return -EINVAL;
>> -
>> -     ret = hsmp_parse_acpi_table(dev, sock_ind);
>> -     if (ret) {
>> -             dev_err(dev, "Failed to parse ACPI table\n");
>> -             return ret;
>> -     }
>> -
>> -     /* Test the hsmp interface */
>> -     ret = hsmp_test(sock_ind, 0xDEADBEEF);
>> -     if (ret) {
>> -             dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
>> -                     boot_cpu_data.x86, boot_cpu_data.x86_model);
>> -             dev_err(dev, "Is HSMP disabled in BIOS ?\n");
>> -             return ret;
>> -     }
>> -
>> -     ret = hsmp_cache_proto_ver(sock_ind);
>> -     if (ret) {
>> -             dev_err(dev, "Failed to read HSMP protocol version\n");
>> -             return ret;
>> -     }
>> -
>> -     return ret;
>> -}
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index d65ff2acdf3d..2baeef57ca54 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -68,4 +68,6 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>   int hsmp_create_attr_list(struct attribute_group *attr_grp,
>>                          struct device *dev, u16 sock_ind);
>>   int hsmp_test(u16 sock_ind, u32 value);
>> +void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>> +                     u32 *value, bool write);
>>   #endif /* HSMP_H */


Thanks and Regards,

Suma

