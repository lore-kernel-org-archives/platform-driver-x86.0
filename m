Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8F57333
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828368; cv=fail; b=jtCb3AEZoOC6jv+jiwLuFPJ2zD+wh0DuroHg8nJjU3T9G6PUMVLc/QqWh0pgxLSqOTWj/S6hBM9Bw3pSlI+kFyg4uANQOVACtZaEofTXMrWN6f61TSOR+YAyP/62TgXaKgxSfRTSabQjkO2uTZIpSOsZennulxqrQNSh8Q5oqIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828368; c=relaxed/simple;
	bh=4Rf0sa99HmCkj4++q1mJmAPlK4Jk4dSLv4CNLHX196M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pl6IfpqycMcL4084EewA2mpCnmXxd2gWS+NltepZReDYw8Bm2TXf/E8ttEB4lRm8iSMIlcxvKkWqMDn0jygQk1kdo/36JOY7vu1ZWaSYMy8t0OCDqgLR1w9tNqpL9qLtIP7ZMiArpX1Ndl0G8ueUNoKszmrfIiEi2lywez3ShrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cMOx+E5X; arc=fail smtp.client-ip=40.107.220.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cMOx+E5X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePWXbAyiEkIuiOX5p5MOyQ/BikGbm5MAfekBk/bAjChTjiAmjF5Fucimtatk8ZBagU89SiAcbOoZdBwNlB3GIytDFsUMfUj1JexYEpkyNEQ7E5ckiskFZimnZsQu2SXPM7MyVExFErkoSd+8CTUWENcQFW/1ejLI3p4DREmxy3Pe6uvkT0wViw76+KzdjhJRjI3O5gexo5VNPpj6cgcy0NFRu1U3LNR0oaQHiBWEVSFjYM9ONrLTa2YJgQoXM33VhnQd3DG9Zmr1xXnUwyrcVtL7b/Fh8iBCrzxu3kL+UPYmo5E9tw0zl8taSBRrYwAcNeOHLMZie1bBBBcErT3IbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqOskE5Uc7TgelLrO+QP/okLp8KWyxoJTGCRZVy/hQI=;
 b=U6ca5GibH6ECkFCBE9YeTSchMT+GWVDW8OVZTN+BU9cxlr9Z8so0TbyXWyiI/LPn/p4zg7g/jx7ho/yxU6hJQrhNdRxJe8QAJy+UoPeTfhdPDOKGuz4Z7F7HVShXWCrez24MBQ8jEB0hypIeKd+3Oelphj9Y4cQ4UCDPTwaO1C3UGDHqTDp3kLJWF6Lh+wOh00GctUgUHwsPm3qdFeZ7cUpblXiSEQVmO/CKbd9JgaBuPXTelM0nTmz7w3EQAh7IBopppW4gN1DXBQKblH8U+4DqxVtosi6rVSr9RyYuRrpfLSB6v/5SM8yC8N3bnrY/+sSW8Qc7t13Z25bP1mB4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqOskE5Uc7TgelLrO+QP/okLp8KWyxoJTGCRZVy/hQI=;
 b=cMOx+E5XoSK1IUilLDzbbSZQ4nKJL45IeZOGLaG5omOEbxal4oYmjVKn3BzY9N/MMC+nLmNfqKQxKd6qCiQhnfwGwNlu6F5i0AMnKch93G5a5uZM0EI/KrlBtbUHK4G7+XOk5sJgJVNF4psOec3sOdQ3UJQOxzxF6ldUWT7w4co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Tue, 5 Nov
 2024 17:39:24 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::c8eb:eeb9:cd73:b236]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::c8eb:eeb9:cd73:b236%7]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 17:39:24 +0000
Message-ID: <e489adae-de29-46e4-92a1-e8bd9d6ba7e7@amd.com>
Date: Tue, 5 Nov 2024 23:09:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] platform/x86/amd/pmc: Define enum for S2D/PMC
 msg_port
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
 <20241029155440.3499273-4-Shyam-sundar.S-k@amd.com>
 <1bf70e8a-5e28-57f3-1cba-41adf83f5a3b@linux.intel.com>
 <051c7469-3b9d-4bb0-8370-1dfc489d16c3@amd.com>
 <311cb5fc-b350-189a-9029-367a934c929b@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <311cb5fc-b350-189a-9029-367a934c929b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::8) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|MN2PR12MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e64a02c-c382-4c57-f37b-08dcfdc0c980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVdRWGRXbEp0R1BRZTVxdms5Z2srQkd4MkhFOHlyc0lmemxxaEUvek5iWU0w?=
 =?utf-8?B?YThoNlBvSGFWYzlQem52a09EK1FyQVdZUWo4UjVKQ2NpUG1jWS9XT21WWWpt?=
 =?utf-8?B?TkpRWDVIN2NJeWJvUlh4ZkFVcEhxek0yZW5Oa0hrWVN5aFdVbHlnSkpzQVY0?=
 =?utf-8?B?RWI2aDdFdmh2am5sb0NFUDMzektva0hOTEFGTHkwMVFxTjNvbFdHeTA2bHN4?=
 =?utf-8?B?ZzZ6a21PTzBTYTJXWTdXNThJODNnVUk5eFZBUU9BbzZwMUswcEM4U29YeXBD?=
 =?utf-8?B?S0Z5V2tCWG5IVGE3KzJERnpVUUk5Wm5xb0RzeUM2NVh4MFdSZWdzeElNWjNN?=
 =?utf-8?B?a3F6TEZQU085cEdZNURSR3dGMC8xaWtsSENrRzhPQ3cwTnVMUmliWlVtN1NQ?=
 =?utf-8?B?RUx6THVMeXY5Rkl6WDdqSzVNRnVqYmdVbmRkRkZSWDhWUU05U0dHbnIvM2I0?=
 =?utf-8?B?d1diOGl5Z1NWaGRONVl6U2xGdGlYT01uOGRMOTByQWRCdUxzdzAvbnQ4V1U2?=
 =?utf-8?B?d29JQnVGVis3ZmlZcXgydDdaS1FXY2lNcnNUVGpwYjJ1VGZDK1hhdERSR1RB?=
 =?utf-8?B?UHMrYThYTzIrMWIrUEpsLzlLcndsSng4cFVaL21uRGRyVU5FdlE4ZGFiM2I0?=
 =?utf-8?B?ZUp0YTNJdjl2ZU5hRUNQTzRZS05ya0Q3WGM5ZTBRQ0lRMXpMOW1RdDdkNmpG?=
 =?utf-8?B?UUtsMWN2ZytRbi9uWUVwYTVxc1FHdk1tTS9RdnFEV1Qvc0ZjL1Bzc0RRTUFr?=
 =?utf-8?B?dTdGcVF2Yzk1NU9FNHBMbXBMQTJGVXdBSlRrc2JQZHZOOGxxRk8xL1d0V3ln?=
 =?utf-8?B?Q1I4b3B3bEJIQzROcG5lMnFPZXNEQ25qME5EUy9nQVd3ZFg1MDlBRmNtK2Nk?=
 =?utf-8?B?RFZZbU1xc0RkTDIvNUZtQkc0VjFNOHd3SXNNZkxOYngxNUxzUmR6NldQRlN0?=
 =?utf-8?B?ZDhOcHREYXlMZXFHQ2xWT0FFUldBWHpnOXp6MjhUUi91eWd2UkJPUkk4cE01?=
 =?utf-8?B?V3R2KzB3aGRmc2hxVzVWY2lrMDRTNVJqTWRSMDZYR0ttZ0k4RGFLUHkwUXZq?=
 =?utf-8?B?aEtKUGsyaE0yUUc2S1QrbmZrYXhDWUhheEZlYkJhaGlmVHdYbjZJQ3E1VWFp?=
 =?utf-8?B?SlgxSGlLWUo3R1UzY25uc1RQSDZhNFlYbGZuWS9IK1RtZnFYanBPUUdhL0hY?=
 =?utf-8?B?eHFjbEFLL2ZyeVBxZUJVVm5udE1pSTllWDVPNzZTS0hJNzIveFlBU1p4OW5J?=
 =?utf-8?B?WWxTWlkrb2FKaTREcVZ4cmlUNmRwRE82WDVINTV1YXlZamRvbzFqQk1ESnNV?=
 =?utf-8?B?ZWdPbHM1d1VIaC9lYWkwQ3Qvd1RnZkpRRnBQaHlqTXFTQU5IMHJ0ak5BTWhF?=
 =?utf-8?B?MlpwQkVxTjJOUXBncUVjc2ZEdUtyWUtzN1NrVTliZmxra2FWeTZCWnpqd1RY?=
 =?utf-8?B?ZTVyaU41eEpiMXAzUTAyN0VUNWRiQm9uMWp2RHVyaCtNcWFuUkxJNEtqbGZn?=
 =?utf-8?B?bmdSbXpVQkY1ZTVlZEpvbktQcGsrWEpTTmRUWVdFVkNBVHhvQkN3WnowUEdW?=
 =?utf-8?B?T0pKOHVQcFFKaWY2eUx4V25xZTgvbjhGVDF2U2lsOTN1MU1ELzdQd1RvcTd6?=
 =?utf-8?B?NFdHTU5NZTlTLzkwb0dTNzcya0xYdHUwRUxIZnp0V2FlQUJsSXYweEJ0aXVu?=
 =?utf-8?B?RzJ5V01lNXl1TWw2cmxnY1l2UncrV2R3amxBaFdRcENTdWwyTUw1WmNIbVdy?=
 =?utf-8?Q?kaAwOKfqb4HXIfNujKtUf96VkGWoSHQj45u3v23?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWdKT3RUbkpQU0lBVDFXZUpNalFoYmVZKy9tWmVIVDZ3MVMxZHpHdmNKc1Jm?=
 =?utf-8?B?L1d4THpnTlgrSmRUYzE2NXJ2VzMvNXBDU2M2NWMxU2VYNzhQUUJmYnUwM2dN?=
 =?utf-8?B?Q1ZsMTJSSjVxcm4wWjd6MjFGQzk0RExDeDBLSmM4L0ppM0lESEhXbWFIc05P?=
 =?utf-8?B?YXBzOFpNZlBUZjRLVXF6TkpzNFVpWmFzbHlGTTlCbWpndktCeWVnZVlVdFZs?=
 =?utf-8?B?RjNOb0RyQ1ZCaE9IQWhva25naGtGYXRrbGl2THoxaEMzckhPM1oxdS83VGRF?=
 =?utf-8?B?WEkwWGRwSyt2NFo3c3RGSVpBTldqSDd0YUNYUTZjU3Q2enVsSU1mNWRYWU5z?=
 =?utf-8?B?SWIvNGRpcmg1c3RMQ0dXUUJadGlGSEprd3ZIMVc0VzhXU05SU3MxUzA5VVNk?=
 =?utf-8?B?bWIrcFdsd2pCS09RSUF0Y0xCL1VLemxMZ2hQazRNanBYRlg3NlRLS3QvZit5?=
 =?utf-8?B?MStIdzVzVjhiQUZDeHNIaXd3UDlyZndsWmF4Y0wzYWE1WGhZcUU5TW11UjQr?=
 =?utf-8?B?eFJibzVML1NtZ2Yxd3p4VHFlWW91T3IvbjhvYmlxc0doZCtmcGZxeSsvTXY3?=
 =?utf-8?B?ZGk3WGNqYi9oeXQxRVFJTUFvREJLNkVFN2FwckZBVDVPcisyZERSOUpxUXpX?=
 =?utf-8?B?dGRxcExoeDRUbHBWczU4bVZSWGNHRzY4bzZVeSszWWVKbG1zTzE4NU45Y3hl?=
 =?utf-8?B?RHF4UGR6TVBYcGMzM3JEOU1OMEJFSmx4NmVjRnVmcytSYlZIYXpBaGVhTjBm?=
 =?utf-8?B?SExKV2IvSnJ5d3R3RFJsNjRnS1dUZGYrS3pyeUpTcUIxTEluVGFpaFFNRnZx?=
 =?utf-8?B?SGFNVUxOelFGeDVVVmJUNDRSNkhSNDlNSGM3ZUlZcXV6U0txeXlnWFBJMFNW?=
 =?utf-8?B?VWRoTzF3SUU0QmRPSHdNekMyVWs0V3RTQit4dmJmVDdmUDZyaGhFUUJpZzJr?=
 =?utf-8?B?UGM2SEdqT0RHUzJVTTR4YXdaZ2gxN1pHZjFncm8wWGVOSk1lZU9qazQ0d2dj?=
 =?utf-8?B?aEtJVTNnQTBkalUyQzJMRlFhNUJWNlovQXdIRFpsUDRDc05IbHNqeitvOEpY?=
 =?utf-8?B?Ukd6MHlvNFRzUkhDWlV0elFZMGFWb3BOOWtaNTdjRUQzOWpRV3RWOGdwd09a?=
 =?utf-8?B?V2VBYllnSnRmbWtrblF4Q0tNWjA3NEsyVnVYQ3ZZWHdvS1JxTFZlVTkxVGI0?=
 =?utf-8?B?dFFZcHdhWVlacWppSXNMME5iYWFaTFdDUk1aUkI0VHdNUEdBZGx4TXJ5cG1t?=
 =?utf-8?B?aVV4MmgvMzZDKzJPN29STlpKV2lpNktmeG1vYzh1L3FLK3lyYmg4U0JuRnZ0?=
 =?utf-8?B?ZmRxWGl2RmlIY25ZYjZ6NFhjNU1lS0lBOEhSaVNPblRBclZ3S2x0VGF1TkdU?=
 =?utf-8?B?K2trbnIvZ0VzK1RhVG1kbk5PbUtYcGUvK1gvSFBLMEI5TnJvdENJTWFjeXpJ?=
 =?utf-8?B?bHhmYU81YkZ1aTdzNFlINmFyVG1OQ3ZUaUIvdUc1VWZScC9RbVdBRjMycFVI?=
 =?utf-8?B?aUhLZUpleDBON3dYOHZmY25HSzFpVTFBalV5WnorSjVkQ0pWaFA3cHl4aUJO?=
 =?utf-8?B?U3hZZFkvUmJkU3I3Y1M3UCs4aW5aK2pSbWtyOUpJVkRkT25sNVpySzl5NjM5?=
 =?utf-8?B?eWthaDhvTmF4MnNPM3drb2V0ZGRQaGZ1R2xDdjM4dDcvQ29jZHgrZlVtdGZr?=
 =?utf-8?B?S2FXTGM1L1QzQ1dxVkxyZzd0NmlMNDlCRDlHQkNTRmR6VzFoY0RiSXRocFU1?=
 =?utf-8?B?NGpORytaK3R2NkJFZ2tTNlFtMjQrcmNCWmROc1RmZ3pkYldkM0lXanVzOWo4?=
 =?utf-8?B?WkdHS08vWjMyc05PUGd4SjB4SGxkMnM1dUNMY0dQRVBUZnNVcWxzQ09lT0li?=
 =?utf-8?B?SFJJQTV6cy9qT1lwSERxcGtNS0xOMUxIdlRrbytYczV4SFU3N3ljdnFMV3hl?=
 =?utf-8?B?S0FHL01MWFpJWGtGRGZJa1ByU0wxaDZ2OXJEN2xvZGNnQzlkNEJWSjhXMmlM?=
 =?utf-8?B?YkNzUEh4UlNzYUJuMnorbDYwc3JxczRBRXo5TEJjdFlJNzh0Z1FvR0xDd214?=
 =?utf-8?B?QXBkdFl2RTJIUnBqVitqdUNXdW9meTl5VEtQSDFPeHVSVjYwaEZPNVVFRytZ?=
 =?utf-8?Q?hn8lPbHpnyqoLPZS0QrrV2xdF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e64a02c-c382-4c57-f37b-08dcfdc0c980
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:39:23.9861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zg8fqZY7fVFnmtVbQ0UhoLDTlkM0eEkZ8sJQbT9/vbA+IyycUDl3TNRxWUa0e9w7xSQDGfMB08f2rxc9OceVWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438



On 11/5/2024 15:14, Ilpo Järvinen wrote:
> On Tue, 5 Nov 2024, Shyam Sundar S K wrote:
>> On 11/1/2024 15:58, Ilpo Järvinen wrote:
>>> On Tue, 29 Oct 2024, Shyam Sundar S K wrote:
>>>
>>>> To distinguish between the PMC message port and the S2D (Spill to DRAM)
>>>> message port, replace the use of 0 and 1 with an enum.
>>>>
>>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>  drivers/platform/x86/amd/pmc/mp1_stb.c | 13 +++++++++----
>>>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
>>>> index 5efec020ecac..2b06861c479b 100644
>>>> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
>>>> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
>>>> @@ -47,6 +47,11 @@ enum s2d_arg {
>>>>  	S2D_DRAM_SIZE,
>>>>  };
>>>>  
>>>> +enum s2d_msg_port {
>>>> +	MSG_PORT_PMC,
>>>> +	MSG_PORT_S2D,
>>>> +};
>>>> +
>>>>  struct amd_stb_v2_data {
>>>>  	size_t size;
>>>>  	u8 data[] __counted_by(size);
>>>> @@ -156,7 +161,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>>>  
>>>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>>>> -	dev->msg_port = 1;
>>>> +	dev->msg_port = MSG_PORT_S2D;
>>>>  
>>>>  	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>>>>  	if (ret)
>>>> @@ -173,7 +178,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>  	/* Get the num_samples to calculate the last push location */
>>>>  	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>>>>  	/* Clear msg_port for other SMU operation */
>>>> -	dev->msg_port = 0;
>>>> +	dev->msg_port = MSG_PORT_PMC;
>>>>  	if (ret) {
>>>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>>>>  		return ret;
>>>> @@ -266,7 +271,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>>>>  				    &amd_stb_debugfs_fops);
>>>>  
>>>>  	/* Spill to DRAM feature uses separate SMU message port */
>>>> -	dev->msg_port = 1;
>>>> +	dev->msg_port = MSG_PORT_S2D;
>>>>  
>>>>  	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>>>>  	if (size != S2D_TELEMETRY_BYTES_MAX)
>>>> @@ -284,7 +289,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>>>>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>>>>  
>>>>  	/* Clear msg_port for other SMU operation */
>>>> -	dev->msg_port = 0;
>>>> +	dev->msg_port = MSG_PORT_PMC;
>>>>  
>>>>  	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>>>>  	if (!dev->stb_virt_addr)
>>>
>>> This change is incomplete, you missed all places using it:
>>>
>>> if (dev->msg_port) { 
>>>
>>> + add helper for this:
>>>
>>> dev->msg_port ? "S2D" : "PMC"
>>>
>>
>>
>> I am not sure if I understand your comment fully. Can you please
>> elaborate?
> 
> There are users of dev->msg_port that should be also touched by this 
> change but weren't.
> 
> For the printing, I suggested a helper function which returns the correct 
> string so you don't need to do the compare within print argument.
> 

Got it. I have addressed this helper function in 8/13 of v3 just sent
out now. Please have a look at it.

Thanks,
Shyam
