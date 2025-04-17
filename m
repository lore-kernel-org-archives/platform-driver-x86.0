Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8052F24
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895965; cv=fail; b=uNp0yMC3pZ8ynIyhDAzAeEbwIaCZvdQvzABx9jKajpLtbeoPYDSbIMfG95l5ICd3veEQPLbMFNb8ctK52RoXmupeAoZMToHwkO35KuJwCRxp4ZVnLfN9p/85af8HST2iWufHJ+7CtakOQHf/oT3tiQ8IbTjW8VBYZF6Wiz51ddI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895965; c=relaxed/simple;
	bh=CJLCXtEm9bAY6OD5cczgbgRYUN8OiCPSOuix6xFOJ2s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SJTnYjLjsk5VDuB9TOSETAv0xSaNeh0cvrec3ipR2T2U4foFRj9f5vxEkN/QDWA81aSPAdqYBnq7OBPe6Bdn8ZdrMAyNXlmsKy2fdZu/QCNXgmGtm7jgk3jgzTT0XoPu8pEjnhWCUJhhudnesB5q/xAWZBUxY7XmvVtQge3tOIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I+O0tZ3J; arc=fail smtp.client-ip=40.107.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I+O0tZ3J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0/0UDkgD0wiyMRUNT4Cspverg3wXVfKA+ouw0WYivqx0W2q0d7SAsRiuau/2jc9qOTq1LNE0nWluSsVNXO2NN4ORsvm+O9wBLvQ/u9nNB6IEZC6kJSVDv09WOpT2jS7eZG2aI/WNQN0hWrOKFWeaMKLhsCFMWgVYFsNsOIcwSPpMPeR0bpJOhiJzh3YoLw/QLSUQcEaFbPWMIys05yELqzowHp4XDocVyqxyIvN11iJgmNk5hhtP7vaHXwT5N9rqELfbL/eniluN3Hn3hsFbvDz+X45sHU0bUT1qNKsOTpAVZeiDb9n5WhjGNug5gj4T2Rnv+DqJAbeZqdwEgZ4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xwQ+y1JrmXsr7tgPagrUAhHs+hHmxg+4fOgfYy3iAA=;
 b=LaPxfqsMSflUMQy+DU6DuJOF77h8ZZ6ol4WbIUib8bH4RdtJlD1iXXa0SiJg1sY/BTJoWwUlDB0hrpZT0kilHOE6bp6UF2MIEgDA7+Yf8HFCfuLYl8WXWLryq0TMpMKjSZUbwpZoj3ias0T92HE5pIffL/X11Du5gWWdnLf5fE1TsZJAwIp190/Y9ljuXdWXz9qXUkQwmFYtVbnBgPTKenOgvfCemR74jhXN7PYXpQX4yd1cc5Gikyx2l4AArF3CQgjpwogzjw/JalkKC3P3TvmKyRPmAofFHEHa45Gj5vQUTe1dENfAR4qz8OQRG9D0O1Ec3Ob4iZ83/fc5ptioYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xwQ+y1JrmXsr7tgPagrUAhHs+hHmxg+4fOgfYy3iAA=;
 b=I+O0tZ3J+l7QHNKnJyMxgLOf+kqLAA4cSTkOTl/JOmrFyNtJw4ASdALBnll908BogtN9TuxK70fawZSRSKbvdPU5Ab6HOiETLBaNKWCGPc8w6bzJJCEv4w2yWvjQ4C6NwDxSKuHDAk4UhXgq88MchfqCSTPLHooP0NsnAV9j2zY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CH2PR12MB4325.namprd12.prod.outlook.com (2603:10b6:610:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 13:19:15 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%6]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 13:19:15 +0000
Message-ID: <153de5f7-6d87-4fa5-9d8a-14ebcb69516d@amd.com>
Date: Thu, 17 Apr 2025 18:49:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] platform/x86/amd/hsmp: Report power using hwmon sensors
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250325060457.3643613-1-suma.hegde@amd.com>
 <20250325060457.3643613-2-suma.hegde@amd.com>
 <1919f8c8-941d-d1bc-d9cf-cea8554a6fdc@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <1919f8c8-941d-d1bc-d9cf-cea8554a6fdc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0124.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::10) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CH2PR12MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: 11119d43-9fe1-41e4-9169-08dd7db27393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGRMaHpCSUJOUnkra2pmR1d6bHB3cDBlaHR0bm5HVzViMFptYlVpaVNCcU9C?=
 =?utf-8?B?WFY4TXRPZys1SmRXdUVNb1ZHZS94alRwb0VRNERvdTZhdGhET0VmbHNxMGU5?=
 =?utf-8?B?dTh3Z2FicCtNbEdKZUNncXJia0pCSlBYQWRSOUs5RVNMczRScXR2bC8wTXhC?=
 =?utf-8?B?dkJlRHNFS0Rsa1dMbFlWa3BmTi8waC9zK1AxM0xKbU1xblErSDUvd2hCWi8y?=
 =?utf-8?B?SnNOb3JMbkRVaW1PZ2xPanZ2MlJhVlpYZGFpQXNiaFRDOFJidFBwM3dVcmNM?=
 =?utf-8?B?dFZXeVJTWlN3UVFWNCtXL3Z2cFlCdVVXeVVRUmFNanpZRGszaEYzZ2E5WWxO?=
 =?utf-8?B?a3hja2tSUlN0SVNReTA4cnFCQUhVbHJabGJNSjdlM2ptN3lGZ1cyV2RWSWRU?=
 =?utf-8?B?NEx3OG1jSkNKaVh1VTMvaW1NNE10Ty9RQW5rZVdFOStybDg1MW95c21zaElW?=
 =?utf-8?B?WTEzY2k3NjZldlVYeEZDVE5yanNVZDVhMDNVcVRXZ3RJUndEcW9WSnQ2c3E3?=
 =?utf-8?B?Wm1weWV3MTdmejNXWUY3NXhKWFIrOUhZOUhaUE0rbnI5ckJSM3dpaVNuSkRG?=
 =?utf-8?B?MENqUEIxLzVBSFBoUE1EMkZIYmV6KzdKMnNkUWpZU1Y5OVVyU29LaUdMdkUr?=
 =?utf-8?B?TGcydUZYZXZwRWIzTnFPaVdveFlIclVlMlFuTmIwNWJMb2ZPNDBFc3VVaDVO?=
 =?utf-8?B?cGhDVlZuNS8xL0tHV3k1cVVMZEI1aXozaForKzdsUVdseG0rTVpmTkJJajNv?=
 =?utf-8?B?VkFOVnBJRDJlMDFFWTlrd0NSVnJ3dkUwWkRxQXErRW9kWlJ0ZUNYT0t6Q0lk?=
 =?utf-8?B?bzJPN3JvcWswWUJ6a1pIMm45L21Ga3N2UUxPanNCY0ljdmwxYys2ODg5TzN3?=
 =?utf-8?B?TDZCT244Z1NFSFM2TU5RVWg4dThVYTJyZXg5aUhKcytqT2hGd1NiK2M2eE5S?=
 =?utf-8?B?R1RXK1NRcVZCR2xHZWM3OEdqRmk4eXo0TUxSbkgxbW1QVm5SaVNtaXQ3OWc0?=
 =?utf-8?B?SFBIVkNYNnJVYnl5NDE0cnQ0anMybEdwNXhNaU0rUDZkM013eDdyOE5OaUJ1?=
 =?utf-8?B?eHZvQU5ndDIvK2hPNHB2L0ZHOUZPbm51WFJ3c1gyRlNTQkoxUVVFZ1ZNQUlj?=
 =?utf-8?B?eFBicS9qVkRNaW9jSHNJRTRaSW5kTWV4VDZiOE9pM0p2OFJjR1ZmYzdET0p4?=
 =?utf-8?B?emYwWXhaQU93UGptMWNScFQ3bkNFN0kvTGwzRVZ3UzNaQUFPYndHSW94UkVq?=
 =?utf-8?B?bWNpaE1sczJySWZkY0JIYTl0bC9hSFY0cU44Z250d1dQY24ydDVBSnRyV3V6?=
 =?utf-8?B?VEhhWkVQNVM2RGlDdHJXRVlVck51N1ZXNDdvUjRzanBzUm1UWDZhd3lUSjEy?=
 =?utf-8?B?WXJFbUdLZ2ZCN1M3eC9XNXI2RXplOWp4Q3pkR0xLZmFKcGhzdFpFcUhwcElw?=
 =?utf-8?B?eHdycEM0ZjZCMGkzaldQZy9OcUxDbWpYVHVJeVdUUExaMW8zSmhqb1RHMVdl?=
 =?utf-8?B?WGVpOG9HdnZDekRDVDBPKy9HdG9qY2pJSE9kWWtOMmdKR0t0ZTFNb1BNeXZJ?=
 =?utf-8?B?S3Qva2ppVjEyWjlxYUZxN0pKZTd0UVVaaHZQN2pqcmRRcHJQK2I1aHV6VlZD?=
 =?utf-8?B?Qm9ZbW5WRzBRaWgwSUpxbDg4LzBaOVJiZDlDNmw3alB0SVdkTWR5Nm42d1BH?=
 =?utf-8?B?UFlkdy9mck16NGVvZ0hRL0VMVktFcEFENTk4VHgwNWxoTkRFdzZwbC9DSUVB?=
 =?utf-8?B?WkJmd0tjZjJoa3FFYTc3YTVNaGtKbHZzc2JVaVgvMzN5a2NSeEw2M1E1WEtO?=
 =?utf-8?B?VW1pY1NrdEUyVnl3QkMzejFJWHlsOE5ZRWtiMnVEaTV1YkhuQi9IRjA1c1Fp?=
 =?utf-8?B?SlFxMW8zeGJrd0srRklCM081NG8zWEYrVlJYaTVWOTJWUmdqb3A4V0R6TVlR?=
 =?utf-8?Q?6YcMoYi86Ho=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0NDVUF3N1VFOVJzUGZDSmUvaTdkQVRyckEwbDU2dkQwbmorMW44UnZ0YUlo?=
 =?utf-8?B?WHFMU3ZWTzFiV1BkZ3UwNHlzM1IreGpPcWl4NVg2Vm1UREtTRjJpUTE2VUVU?=
 =?utf-8?B?U2lqODdFeHVoeDNydlU5elhCVVVkT3FmUmxmekNPbTdBL1pOcTNES3BrM2Zx?=
 =?utf-8?B?YTJHWTEvdk9oVG90ZkJZWFQ1TGVxUEdNbVpidThySnYwZ3drWWljc1pDdmJE?=
 =?utf-8?B?bDJCK2tHaWQ0RTdmZzMyYU5mUFcyYkIzeTZPVEt4UE5aOVBFbms3TGNiWngx?=
 =?utf-8?B?ZkRPZVBGcHY4VVNkUWx2NnZNSzNidGd4cTlRUnlvUmNWUEdWUU5ibWkzUzFo?=
 =?utf-8?B?V1k4aW1ENW1sUk1HTVJGTzZ2aGluWmlUakJJNnZnOFVEYlNoU2liRjFEMmJj?=
 =?utf-8?B?bHdFM2lFanhaSTR2bHc0b3NQUmFaUSt3bGQ5K3lUbHdSQTE4K3YwaVQ1a0tL?=
 =?utf-8?B?NzBlNHFXUUNQMlp0Q1JOV0VGWkQ0Y1V2S2JLTDBtMlZucUZsMkR2RFhZL3Uv?=
 =?utf-8?B?aW5tZUVUZlpRMzM2WWQ0NTlMZk9ieGhPOFZ3QkN0T3pvUmF4bVYxc0U5bXM5?=
 =?utf-8?B?ZWRSVVN2bHNXc09nZCs4cElyNS9TK0k2UmNzRk9aUHhLeDNsaHJaQ0tBSHli?=
 =?utf-8?B?RGFHLys1Z3hKcUVxR0o4MVVna0t6MWc4MUJnSXYzLy9kamNTeXhKS2MwbjVQ?=
 =?utf-8?B?RVFoUW5IMnZtWW1SWCtzd3ZUaXpGakFwL2tVRERwcmc3OC9KVEI2QTVrWEla?=
 =?utf-8?B?UVFGaEVrVzhlbTBpcUtzcWswQ3N5TjcrY0lMQ3pLZDNqVEVCeDg0RE9PVUxL?=
 =?utf-8?B?ejk4c3VpRUFPYndtNlQvUlFnSWlBekl3cDVSdXA4eG83cW5WdlUzd2pna1Vh?=
 =?utf-8?B?djJjcFFRbzN3M054aTZxWFdUL1lJQWNSeUNYcVpsM3RvLytnK2EyNnJyQjVT?=
 =?utf-8?B?aExjbVEvMzZIOVZGR3F0N003bXZCM2c0c1g0bWRnOXFoZGc3SHFBSUd5Y3pZ?=
 =?utf-8?B?QkhlVzMzNXFhcndTMXNzNGJFbmJ6Z3gzaHMyZGlNWkZiUW1WV0FNMVBWSEo1?=
 =?utf-8?B?UEhVRGgxTVU0eG5QWG02RHBWWHN2Y0FQMlRvbTJncW1GNFRmYlNLS1ZjUWZl?=
 =?utf-8?B?ZGk4aTF5QXVSLy94V05ReFNZRG9UM0NmaFFLRGVvRDlRSUxiTDNCOEZoSTQy?=
 =?utf-8?B?NHg2NCtBMGlTbDRVL2ErWnJFcmhzeFo3UlpiV3lIc3IyMGtTOWZuRm56cTlV?=
 =?utf-8?B?NC9jMVgwR2J6eUh1RzdhUDE0V0VHdVlhY0VrN2lXWEFsTzAzcWpGVEl4ejh0?=
 =?utf-8?B?UHAyM2pDdWNiNFFpMmpBUDdKU01td0cxZ0FPUTJWNTRxSHZVbGpjalJjSDZk?=
 =?utf-8?B?WEtSZ09GMzBSOUl6QVM2MVJObldrMVdMdjdINVRiNEZIRUU0UjhkNmx0SUdu?=
 =?utf-8?B?R3o2dGc2K2k2bHdnOElUMzdMWkNzMCtSaldqcnpKM0RBd1B6R01OOHp0R3hw?=
 =?utf-8?B?OE1FVkFDRE9wYW04d1lnNjIrM01tdVBsR05GaUExT1NmUTkxbFQzYk5PeDFQ?=
 =?utf-8?B?Zmk2TDNWVVA4UmVsR3E4SWUwbTdEQXdlcTNjUStXVWJVQ09oWXJ0eUZLYTJJ?=
 =?utf-8?B?TjlBaTRlUFlkTXhZVUI0cXFkZ2F3aHNzY0huVHBNWlBnUDNsQnZlN1JIcWRV?=
 =?utf-8?B?Mk5BdFNFRHN1MEc3WFRGRzIvQ1RKWDJOZTFsSlhuUmE4aG9pZm94amRVL3Rt?=
 =?utf-8?B?QUpxN2NLbW5KTjlwYzlDQWpuZlo0YlhPWllORW05eDFxVDNmdERjdkROU2FG?=
 =?utf-8?B?YlZBMEE2QzhKSVdnUVJKblFzMXRKUUQxbThiS0NVa3oyVnp4NkdoaUNrNEMr?=
 =?utf-8?B?OXh2ZDRvNlMwL0pxL09pQnl4MEdMMFdkQ0NpK04rZXRBcUZDSUJvdWI4OUww?=
 =?utf-8?B?a2V5Z0o1a3hzY2FkVGRWY1lYRHU0a0pFTm5jQ2E0LzFzUURjYk5IalJUK0Rq?=
 =?utf-8?B?NmZjYlNYS2xGZnRiZ1JOOUUxaTNleVppbkFybUU2WTFXVzk1bDU0Ry92TlBE?=
 =?utf-8?B?TG5ITjdVYXE2QkVrMkJVL1ErLzlTQ0tuYmxqNnlvbG5RTGZVZ3RaYWNCVzZC?=
 =?utf-8?Q?9++BmrdksiSVHmdEKAULUstjx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11119d43-9fe1-41e4-9169-08dd7db27393
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:19:15.6320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHle9uN+OJqhUdpwLoNyek8fWJ3AiMFvZVTGpBmV+TdHMuhgHu5cSv5+OsK98cwnNPFDUXIEex7d5ULYUeHpsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4325

Hi Ilpo,

On 4/11/2025 3:55 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, 25 Mar 2025, Suma Hegde wrote:
>
>> Expose power reading and power limits via hwmon power sensors.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>> Changes since v1:
>> 1. Move hsmp_create_sensor() call to init_acpi() in acpi.c and init_platform_device() in plat.c
>> 2. Pass u16 as parameter instead of void * in hsmp_create_sensor()
>> 3. Change dev_err() print after hsmp_create_sensor()
>> 4. Add CONFIG_HWMON dependency in Makefile
>> 5. Add #if IS_REACHABLE(CONFIG_HWMON) condition check in hsmp.h
>> 6. Remove hsmp_hwmon struct in hsmp.h and add hwmon_channel_info and hwmon_chip_info to
>>     hwmon.c file as static variables
>> 7. Change argument to devm_hwmon_device_register_with_info()
>> 8. Remove hsmp_create_power_sensor() and define power info statically. Instead of multiple channel,
>>     use single channel with different attributes.
>> 9. Replace switch with if in hsmp_hwmon_is_visble()
>> 10. Remove referencing channel related code in hsmp_hwmon_read() and add code for attribute checking.
>> 11. Replace switch with if in hsmp_hwmon_read()
>> 12. Remove hsmp_hwmon_read_label().
>> 13. Update hsmp_hwmon_write() to remove switch and code related to channel
>> 14. Remove int-ll64.h header
>> 15. Update the documentation
>>
>>   Documentation/arch/x86/amd_hsmp.rst    |  10 ++
>>   drivers/platform/x86/amd/hsmp/Makefile |   1 +
>>   drivers/platform/x86/amd/hsmp/acpi.c   |   4 +
>>   drivers/platform/x86/amd/hsmp/hsmp.h   |  11 ++-
>>   drivers/platform/x86/amd/hsmp/hwmon.c  | 124 +++++++++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp/plat.c   |   5 +
>>   6 files changed, 154 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c
>>
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
>> index 2fd917638e42..1d7b159a35d5 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -117,6 +117,16 @@ for socket with ID00 is given below::
>>                }
>>
>>
>> +HSMP HWMON interface
>> +==================
>> +HSMP power sensors are registered with hwmon interface.
>> +
>> +One hwmon directory is created for each socket and following files with 0444 permission are created
>> +inside the hwmon directory.
>> +- power1_input
>> +- power1_cap_max
>> +- power1_cap
>> +
>>   An example
>>   ==========
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
>> index 0759bbcd13f6..ce8342e71f50 100644
>> --- a/drivers/platform/x86/amd/hsmp/Makefile
>> +++ b/drivers/platform/x86/amd/hsmp/Makefile
>> @@ -6,6 +6,7 @@
>>
>>   obj-$(CONFIG_AMD_HSMP)                       += hsmp_common.o
>>   hsmp_common-y                                := hsmp.o
>> +hsmp_common-$(CONFIG_HWMON)          += hwmon.o
>>   obj-$(CONFIG_AMD_HSMP_PLAT)          += amd_hsmp.o
>>   amd_hsmp-y                           := plat.o
>>   obj-$(CONFIG_AMD_HSMP_ACPI)          += hsmp_acpi.o
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 0c54c91b5f1a..abbb680b9c71 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -281,6 +281,10 @@ static int init_acpi(struct device *dev)
>>                        dev_err(dev, "Failed to init metric table\n");
>>        }
>>
>> +     ret = hsmp_create_sensor(dev, sock_ind);
>> +     if (ret)
>> +             dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
>> +
>>        return ret;
>>   }
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 3dee0bb684c7..0063904904ed 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -12,6 +12,7 @@
>>
>>   #include <linux/compiler_types.h>
>>   #include <linux/device.h>
>> +#include <linux/hwmon.h>
>>   #include <linux/miscdevice.h>
>>   #include <linux/pci.h>
>>   #include <linux/semaphore.h>
>> @@ -26,7 +27,7 @@
>>   #define HSMP_CDEV_NAME               "hsmp_cdev"
>>   #define HSMP_DEVNODE_NAME    "hsmp"
>>
>> -#define DRIVER_VERSION               "2.4"
>> +#define DRIVER_VERSION               "2.5"
>>
>>   struct hsmp_mbaddr_info {
>>        u32 base_addr;
>> @@ -65,4 +66,12 @@ int hsmp_misc_register(struct device *dev);
>>   int hsmp_get_tbl_dram_base(u16 sock_ind);
>>   ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>>   struct hsmp_plat_device *get_hsmp_pdev(void);
>> +#if IS_REACHABLE(CONFIG_HWMON)
>> +int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>> +#else
>> +int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>> +{
>> +     return 0;
>> +}
> Does this even compile with the extra semicolon?!? In any case, put the
> stub's code right after the function:
>
> int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
>
>> +#endif
>>   #endif /* HSMP_H */
>> diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
>> new file mode 100644
>> index 000000000000..98b1d66f491d
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/hsmp/hwmon.c
>> @@ -0,0 +1,124 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD HSMP hwmon support
>> + * Copyright (c) 2025, AMD.
>> + * All Rights Reserved.
>> + *
>> + * This file provides hwmon implementation for HSMP interface.
>> + */
>> +
>> +#include <asm/amd_hsmp.h>
>> +
>> +#include <linux/device.h>
>> +#include <linux/hwmon.h>
>> +
>> +#include "hsmp.h"
>> +
>> +#define HSMP_HWMON_NAME              "amd_hsmp_hwmon"
>> +
>> +static int hsmp_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>> +                         u32 attr, int channel, long val)
>> +{
>> +     u16 sock_ind = (uintptr_t)dev_get_drvdata(dev);
> Casting to intermediate type serves no purpose so why not cast directly to
> u16?

I included uintptr_t instaed of u16 to resolve the below mentioned 
compiler warning.

"warning: cast from pointer to integer of different size 
[-Wpointer-to-int-cast]"

>
>> +
> Remove extra line.
>
>> +     struct hsmp_message msg = { 0 };
>
> {} is enough to initialize.
>
>> +
>> +     if (type != hwmon_power)
>> +             return -EOPNOTSUPP;
> Add #include.
>
>> +
>> +     if (attr != hwmon_power_cap)
>> +             return -EOPNOTSUPP;
>> +
>> +     msg.num_args = 1;
>> +     msg.args[0] = val;
>> +     msg.msg_id = HSMP_SET_SOCKET_POWER_LIMIT;
>> +     msg.sock_ind = sock_ind;
>> +     return hsmp_send_message(&msg);
>> +}
>> +
>> +static int hsmp_hwmon_read(struct device *dev,
>> +                        enum hwmon_sensor_types type,
>> +                        u32 attr, int channel, long *val)
>> +{
>> +     u16 sock_ind = (uintptr_t)dev_get_drvdata(dev);
>> +     struct hsmp_message msg = { 0 };
> Remove double cast and {}.
>
>> +     int ret;
>> +
>> +     if (type != hwmon_power)
>> +             return -EOPNOTSUPP;
>> +
>> +     msg.sock_ind = sock_ind;
>> +     msg.response_sz = 1;
>> +
>> +     switch (attr) {
>> +     case hwmon_power_input:
>> +             msg.msg_id = HSMP_GET_SOCKET_POWER;
>> +             break;
>> +     case hwmon_power_cap:
>> +             msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT;
>> +             break;
>> +     case hwmon_power_cap_max:
>> +             msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT_MAX;
>> +             break;
>> +     default:
>> +             return -EOPNOTSUPP;
>> +     }
>> +
>> +     ret = hsmp_send_message(&msg);
>> +     if (!ret)
>> +             *val = msg.args[0];
>> +
>> +     return ret;
>> +}
>> +
>> +static umode_t hsmp_hwmon_is_visble(const void *data,
>> +                                 enum hwmon_sensor_types type,
>> +                                 u32 attr, int channel)
>> +{
>> +     if (type != hwmon_power)
>> +             return 0;
>> +
>> +     switch (attr) {
>> +     case hwmon_power_input:
>> +             return 0444;
>> +     case hwmon_power_cap:
>> +             return 0644;
>> +     case hwmon_power_cap_max:
>> +             return 0444;
>> +     default:
>> +             return 0;
>> +     }
>> +
>> +     return 0;
> Is this line required by some stupid checker???
I will remove it. checkpatch is not giving any warning .
>
>> +}
>> +
>> +static const struct hwmon_ops hsmp_hwmon_ops = {
>> +     .read = hsmp_hwmon_read,
>> +     .is_visible = hsmp_hwmon_is_visble,
>> +     .write  = hsmp_hwmon_write,
>> +};
>> +
>> +static const struct hwmon_channel_info * const hsmp_info[] = {
>> +     HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
>> +     NULL
>> +};
>> +
>> +static const struct hwmon_chip_info hsmp_chip_info = {
>> +     .ops = &hsmp_hwmon_ops,
>> +     .info = hsmp_info
>> +};
>> +
>> +int hsmp_create_sensor(struct device *dev, u16 sock_ind)
>> +{
>> +     struct device *hwmon_dev;
>> +
>> +     hwmon_dev = devm_hwmon_device_register_with_info(dev, HSMP_HWMON_NAME,
>> +                                                      (void *)(uintptr_t)(sock_ind),
> Double casting seems pointless here as well. And sock_ind doesn't need
> parenthesis either.
Added this double casting to avoid compiler warning.
>> +                                                      &hsmp_chip_info,
>> +                                                      NULL);
>> +     if (IS_ERR(hwmon_dev))
>> +             return PTR_ERR(hwmon_dev);
>> +
>> +     return 0;
> There's some err helper for this PTR_ERR_OR_ZERO() (IIRC). You also need
> to add #include for it (same would have applied to IS_ERR / PTR_ERR).
>
>> +}
>> +EXPORT_SYMBOL_NS(hsmp_create_sensor, "AMD_HSMP");
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index 63034408985c..63a5d31341e1 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -200,6 +200,11 @@ static int init_platform_device(struct device *dev)
>>                        if (ret)
>>                                dev_err(dev, "Failed to init metric table\n");
>>                }
>> +
>> +             /* Register with hwmon interface for reporting power */
>> +             ret = hsmp_create_sensor(dev, i);
>> +             if (ret)
>> +                     dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
>>        }
>>
>>        return 0;
>>
> --
>   i.

Thanks and Regards,

Suma

>
