Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52E71B2EC1
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262283; cv=fail; b=arRmPj0MRbdXG1rshYcRHBR1P9Aal9YqHaWEZkNLLa3pV7Ve9Yomz2VJycYFBYuIkdXHA9mYBupTXHhCzJr49l+ds19/3jec1C04MKcEMkM1ENGwO3DuTSjpz8Z5QQp/w2xfWQDKKscRTBo7os9sU9ysSkvO9J8SG9GSq9hHg1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262283; c=relaxed/simple;
	bh=lq1Vq7Zd7GYNeOCkF+1y1x+ykg1CrXwhfuRu+2MylTs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cDezC/qEQUndop3AKXfLiTD3FjaKNMcFAacRO04Hm95v7SNXmkke2bNBVUh9CX4dUp1f85+3dB/wYBdwOmA8/8HhmwetC7ylrhlIKe8RJvpF5o2JofwBNWMrF2lFkvOYLNdYz2hDNlM+2gR7OYFncNE61FELfozfTsDTqG8+uEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JaNSbsk5; arc=fail smtp.client-ip=40.107.96.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JaNSbsk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tq1VKSSIu578tZtQ4tUGY/USDJiW1ZXPHDFYE+zpNOMuaBbBrHtSjZOpD3+9O+ft0t89wL32SBAD5fHieXlecz41sdz/lK3iX300P5rM3IoYQrpaRsxxjtrFNM8Z7C/MRC2eWc0OQVW6YtbxhDVL2IGa+hcqc0l0v4tIhCnFRfVEGJuk+KOaB7lgCfZWJWW8HQRxdEZPqgUL23upczt1iIZ78LVo1OfWYdPVwTxJki/P+kr+HDcXlwG/obk3DegCAp7yp4o7A6NV0GknafqdGP1aFa979mKiku5pqe84RfTPnh96BDUz58A7AaQliSPByivI7een9MhCgA4brOQwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUAc2lSi42uT0VWMVjuI+u/Lt9L4zufT1YZrj0G9OzQ=;
 b=SJKQu/9vlJHy7RaOLn+ovf+ZIOkKMX24BA5tyWs8hTG08f7yq/u9Do6t2mvRisSfG8ARM16UT0YtN3/p2K3H3N5qOMKsWqq4KaePQFli8BOBJ/wWGLs/E5KWLSqe43XNz3enmZyrn+zOSpGv8snIF5DNt2Hgd6PRdY+r6b9RXXewBQJ8BBRN5SxTweMOrScnt5sLMZspFXuw3rIXmxoGgs3PT0O6umaKNXXr+JoAsnWAlkhVgoTEOlyxPsiXJ/eSOz8Shjgt4zR/117MxCnqJHxJiDoAlpB5RIrGSaWLW/5BXMf/Xha0eemT2ibXSdvTopwnlt1S6DtlVwd9EPe4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUAc2lSi42uT0VWMVjuI+u/Lt9L4zufT1YZrj0G9OzQ=;
 b=JaNSbsk5ZXbx3xZovcK6P8zI6rBa/miKjqxyt6G5w1Dwi49KoaF+1VxnyhMnEZWlp98NBzmLh/rLdtVqE0NCZQVcMs30fDwUN7fmiFYqLQ1K7jEErAy0EtWNHay1cln1i1QcqcnzBylshVYbh2QawOSWHfl5lzhx1uWo67lHsTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 17:44:38 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 17:44:38 +0000
Message-ID: <ca0eff7c-e771-4056-bc9b-7278d4247099@amd.com>
Date: Wed, 21 Aug 2024 23:14:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Extend support for PMC features on
 new AMD platform
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20240821150446.392726-1-Shyam-sundar.S-k@amd.com>
 <ed50679e-114f-4e7b-8465-1b8d4e0622d9@amd.com>
 <e2105771-ddcd-4e7e-bfc4-a656b6d56b58@amd.com>
 <477d3b1c-9a58-4a37-9c43-ecc8e7c9b922@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <477d3b1c-9a58-4a37-9c43-ecc8e7c9b922@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fe5047-170a-4ed2-8855-08dcc208eda2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmJrd0xxNGhQcjlGbDRSNDhJa0V5elEyY3Fxd1FRclR3Umk0ZHB2YmZnVGt5?=
 =?utf-8?B?cVpnSnJvam55RDU4YVBVR1hodERoZHZ4NGE2akJtdlIxUjRzVU13TlRKblBs?=
 =?utf-8?B?bnh3UzdqUnF3R2lHcGFadUxKaVFPMUVWRHE2OENwL2ZmdnpBQ21VcEhDcWYy?=
 =?utf-8?B?NUhHbEpOd1BKM2FiU1pxUGt5d0x1SVdMRWEyWE0wc2FrUmNaa0dmdXlMOGFJ?=
 =?utf-8?B?QW44WEhPT25sQzBIaXo4a21UNm5RTEpaR1FORW9Ha0Z2MFdCdlhFT0hKT2N4?=
 =?utf-8?B?RTRHT251MmVpL2ozQjd4Sk5POGFqdlQ0S2R3NmFmMFBJMFBCN1BmTGcwL1FE?=
 =?utf-8?B?aUFuNTRBNElJVVlaOG4xVlJXQy9DV2dJMkZnTm9Wbit3VHVGNVdXK1dZbFRK?=
 =?utf-8?B?eGI4Q1dHNVdhTi9TLzloS25XeEZqeDlZMHZpNklMUkhxLzJDR1FqR25hdWVQ?=
 =?utf-8?B?bEoyNEtJZ1N2UHZoTDVvVjJCeWVoZERhMlYwSHFjaDdZR0RYY3BLQmVBenI1?=
 =?utf-8?B?UjhVRjZMN1hsdWphaC94bkt3WG1yNHhVZHowd1YydzhNc3BhRkdaanljalhS?=
 =?utf-8?B?NjlEbXBab0oxRGVtTWVTOGR2ODUzd1J0VzdXbTFydmpaaXlCaHo2OGZ2TzlU?=
 =?utf-8?B?NkJuZmJ5dE9lUnZmTXJ0ZWJKd1lmODRDUWJmQXpEZU94VHlZMEd0ZGZ6T0J1?=
 =?utf-8?B?Tm1wSzFGRTRoM1NpdTlTZ0syV3dvTG1SNWJjZkd2eEpGRTVBbXNRaS9RVUtF?=
 =?utf-8?B?dncrMmNJQUlrdlpPazlBSGo4dVRoR3hhOVdSYXFWdUthakZIQTc5em9sZCtV?=
 =?utf-8?B?YlU0cjRhb0lDMWhvaUxHeG1GdmdiVmV0UlF3ZVFKdHhqYjZZVVgzRHlBRzNh?=
 =?utf-8?B?OXdSRWd5dmxzdWNsMWJiY2ZGcjRqTTZ1bkJNcGJKeHNJWjFhWG9yVWUrKzJW?=
 =?utf-8?B?WUs3OUJ4L25JLzRBYlpjNTBxeXdMZG5XUkdHTlhZSmxjSk5mZ285L3FzbEpq?=
 =?utf-8?B?SC9TMnVkT2dKSEo5cFZzWkpXWUg3VmtIc2YzRFUxbzh1aVJiR3YwRmpubVBD?=
 =?utf-8?B?dk8xZk0xcllGNU5kWW83dno1UXZNSnpOaXlRdzVhK01lRGwvbVIyTnlUOVdv?=
 =?utf-8?B?L3FpcFI4MUdBRFlTYnRDbXpVS2NhWkZETm1ETmR5ZWtadm14Ty9EU2xRcThy?=
 =?utf-8?B?dkxIZFczOWhBTGhGalYyK0xsVWVaM0VCaFBGalVUMjJhVTRTNUZWN3pPK25y?=
 =?utf-8?B?TkhhbHFzOUpYeXd6K0tEbDhOcWhQM1d2NmhZT3QwR0k4VUtxTUJmLzZMS2Nt?=
 =?utf-8?B?Q3cyV1o2ZEZCcmk4UHI4U242Zkt4TWhsNmp2UW5vZ1BvV2xIalJZQXhvUWtD?=
 =?utf-8?B?Tk03UDJZYWtIanFneFFnbnZQbUxUaGJZM3gvQTFqWmd5bUk2cmhhWklTUkJG?=
 =?utf-8?B?N1FhS0NhSUYyckVLZmlydkNtcnNoMGIyNDluL1FXNFRQOFRKMktGUEZCc1V4?=
 =?utf-8?B?OTVrbGFLMGYzdERDYlZESFk5VXpWa1haS29ISHlacU1zNkd4bmNzN3E1Lytj?=
 =?utf-8?B?OXU3Sm1yUmcrUlNIc0VsTTZyeWxqbUFGdS8vY2VhdHRSRGdOc0JkSHFwZVFj?=
 =?utf-8?B?RENjZnlkVzdzUi9DNWpFT0x4L0lkOVFsaytTWmNWaTVEUHFTQW42dlZma3Nl?=
 =?utf-8?B?Y1J5U25FU3cvanlhTjEyZzhvRlI5VjFiVHBLQWw1czNLR0h6YjF3eGdlaFcr?=
 =?utf-8?B?WXlYTnhmZWJUQ1JIVDhvSGRCM1hYcW1lZUIvdTZ2U3Z1RElaREt1aDU4VUtH?=
 =?utf-8?B?L0dReVYvd3NGQmR4MVlEdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alJsZzQwQVJ4a0xDRFNlcVhRQ2NRdzN4ZzB0N2xHdzVVVEJ5amt3N2NiSnRi?=
 =?utf-8?B?T21tcWJpZTlXTllhTmFOakNSTVA4RmgzNFhaTDhyQVM4M21wMUg3Z1VCaGp1?=
 =?utf-8?B?RVhFV1YrNTk0My8zU3c5Qy9EamxxNXdDOE9tZ2dKZG4xWWRpbmxrSDd1akFn?=
 =?utf-8?B?RU85SU5jNnJuV1ZnbFlmL3NYY3NWaGExenJWRXpCd0QxVENLMXV0Ykg1R3R2?=
 =?utf-8?B?VkZKRXVRb3h5Q1hxaWtkd2RqQkh1RURpdE5panNjKzB1U0UyUG9vU2tmK09C?=
 =?utf-8?B?Uk5YeHNacXhUMFVjVEdWWDN4dzFKM0VWK3hLMlRudUdraXhPU05HMHZCenZx?=
 =?utf-8?B?RndFY2ZaQS84OVZqL2hDMmxnUU1QYzBrNkZCN1V3S1Z2ZlZXSzBQa2FkNVY0?=
 =?utf-8?B?V3dDOTUraDA0S1ZlcE5FcWE0eHdyRmxCSytlWkU0WFdrY3lTR1g5SExSSEg2?=
 =?utf-8?B?R0loaG83eHJvbGgxQnZsV1JUV01YYjNEbktyYUZiYzJxbFpPdzM5U24rS0ZG?=
 =?utf-8?B?V3ZFVVBSRUh4R3BnQ005WDZwRUNYcnJQWUh3ei9kNjdhRmZ4T0w2L3Rsam1C?=
 =?utf-8?B?dW1QdVY5SHVEMHIydk9IT1RTWVo0YWc2YzNYR3VmZ0FnUEZRZ3ViY0k1ZEZV?=
 =?utf-8?B?WmN4bnhRVG5mWG9zNGFTWWtiNlJCWVJRMzJiMnQvUmVNVFpEMnhzWERGNjdj?=
 =?utf-8?B?VHVTcXJSZEZVY2xKSFVLa25vKzV2R0hSYTExSng2akJrcHhQMy9PWW13cUlP?=
 =?utf-8?B?QVdVWWZCT3U5T3FFYzhNUGtGS3ZmYTFTeGJCTEhHemFXWVZBdk9tSThxNzd6?=
 =?utf-8?B?UkhrTFNzSjdWSGs5TUx0RjM5WHE2UmNMWWdaWCtaMGZuTlFQeU1zU3dUUHRC?=
 =?utf-8?B?QUExSWZPSU5mVWtSMlNQQmxoY1Nhd291OFl6c1pmMzFMeHF5bGwvWUc2MThX?=
 =?utf-8?B?K0JVNnR5aGljWW1HSE1NTkk2dUNaUXdwbXlEWGUyYnZiN1Mxb0VaMGZMeFkw?=
 =?utf-8?B?OUU3LzRXL1JmOE1rRVdQQlNIVC9ROUVESEg5YWIxY1Bia294M2JJNnR0N3FU?=
 =?utf-8?B?aEJ1SnU2VEUzWUpFRkFiUHZ4NTl1a2tGWlUyY21DNXlnOHJqaXpkandaRHMz?=
 =?utf-8?B?ZmN0SnJIK2ZEaDVZaU51MEs4bTRtYWdJLzFCUktEbVpRWWEreDdkRWk1cW40?=
 =?utf-8?B?WmRqVW5KWW5xSkErQ0NNVG8vWnRhUGttZElvbm1FbmFCUThCWFI4cU9YbmhJ?=
 =?utf-8?B?Q3NZVUt6eHVMSnN2V3pTdW04NTFGK1VxbFJBMS9xaE8wcVJLVko3TjhOdSsz?=
 =?utf-8?B?N1YzNnJwOGxJMlRNSjVPbjlSQmZTaHFsNmY5UFBEK09Nck94bHBJcnU0b1Q4?=
 =?utf-8?B?UTh5ZG5hcmFqUDZSbG1lbHF5V1BPREJsTStBLzFxR1JSNkZMbEZMblowaHJl?=
 =?utf-8?B?UmJUdDExV1hCTXFyeUdkYTZpMitTeGl0K0hPNTVOcnJlUTNLcEFNdUJoSmVC?=
 =?utf-8?B?b0hsWGlpZnhoeWgyZldvclNsNitWakdnZHE2YlJkVVR5S2hsUGVQclYySHdo?=
 =?utf-8?B?U0NTS1JtYktRSFR6STdPZzlwbU05RklDUXhqaS93TmJtVkZuaVlqclg0Z2NN?=
 =?utf-8?B?aFlFa2phODZycGlFbngxd1k4azR5dnk3bDVjVFFNTjlHeDJqRG80UFhPK3d6?=
 =?utf-8?B?bUxlSXdVZlh6eERqUTdJSCtYbkhubmhqSWhGZStlNHBTb1dQcU1tY2dBNklj?=
 =?utf-8?B?dGNVcVlTTjdoVUJaU1JydG5qSndUaUtPUkd5bEZIS1U0YVVhd3J1SnNzcWx4?=
 =?utf-8?B?K2I1eDV2SHVxOTFLeFZyUVU4UWUxS0M1S1p3L1c0MW1BbEkzdXV6NzlVN2U2?=
 =?utf-8?B?NzlOZmtNYVFXYkFFblJoTVlXT2dBR25TWWF1azB3RHJUSGlRWG1sZEozMXU5?=
 =?utf-8?B?TkZCb3JCYjdjenNRWlNZdmppMi9iTHBWWVdXc1JnNzFOK2NqMmtoU0t5NFZ5?=
 =?utf-8?B?NnF3YVdwa3ErWWVZbGpITVBqdXJkbW1HN1h2bitQeG9Xb2d0U0F3YXFuaEJm?=
 =?utf-8?B?Vjk5ZmdsSGNpOEVmNnpyZXdmYUsvSSs1TVI1QmhTT3lkVU82N3BhSXA1Z3Fy?=
 =?utf-8?Q?54qyLaYnF+0mnz4HS08iTs1OM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fe5047-170a-4ed2-8855-08dcc208eda2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:44:38.5025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoxmH8b1ul8/DxzXW26Fr2wtELyzIkcVldm3C1RrK1Ol99Z23Bfhna/zu4Gg7jMho9EjqX+cWTbpoj9tp7F5UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078



On 8/21/2024 23:12, Mario Limonciello wrote:
> On 8/21/2024 12:40, Shyam Sundar S K wrote:
>>
>>
>> On 8/21/2024 22:18, Mario Limonciello wrote:
>>> On 8/21/2024 10:04, Shyam Sundar S K wrote:
>>>> PMC driver has capability to get the IP information, idle mask
>>>> values and
>>>> STB data from the PMFW. Extend this support to the platforms that
>>>> belong
>>>> to family 1Ah model 60h series.
>>>>
>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>
>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> This is actually a fix for another commit in 6.11.  Hans, Ilpo, can
>>> you please take it in fixes?
>>>
>>> Fixes: 426463d94d45d ("platform/x86/amd/pmc: Send OS_HINT command for
>>> new AMD platform")
>>>
>>
>> I'm not certain how this commit addresses the existing issue. Last
>> week, when I sent out commit 426463d94d45d, I tested the changes on my
>> test bed, and everything seemed to work fine.
>>
>> If this new commit is indeed resolving an existing problem, I shall
>> amend the commit message to make it more meaningful.
> 
> Hmm when I was talking to a colleague about it this morning s0i3
> didn't start working on this platform until this change, presumably
> because the message IDs weren't properly configured without it.

Okay thanks! Let me respin a new version with a updated commit.

> 
>>
>> Thanks,
>> Shyam
>>
>>>> ---
>>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>>>> b/drivers/platform/x86/amd/pmc/pmc.c
>>>> index c3e51f0a5c33..bbb8edb62e00 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>> @@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct
>>>> amd_pmc_dev *dev)
>>>>            dev->smu_msg = 0x538;
>>>>            break;
>>>>        case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>>            dev->num_ips = 22;
>>>>            dev->s2d_msg_id = 0xDE;
>>>>            dev->smu_msg = 0x938;
>>>> @@ -597,6 +598,7 @@ static int amd_pmc_idlemask_read(struct
>>>> amd_pmc_dev *pdev, struct device *dev,
>>>>            val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>>>>            break;
>>>>        case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>>            val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
>>>>            break;
>>>>        default:
>>>> @@ -630,6 +632,7 @@ static bool amd_pmc_is_stb_supported(struct
>>>> amd_pmc_dev *dev)
>>>>        case AMD_CPU_ID_CB:
>>>>        case AMD_CPU_ID_PS:
>>>>        case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>>            return true;
>>>>        default:
>>>>            return false;
>>>
> 
