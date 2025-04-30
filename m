Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC52D248F55
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009612; cv=fail; b=j09FZZkii2OJ88tiZdzrxo6RFr5aWa+tmdIDRbu2EsuyMsltzULD+u9zSjNfliNbut7Kz8rPGRGp3IvmTdwSOr3r+tKlx3PsqDG6coV+ETpBGVpk+l1T+kOH6bVOrsBAcoVSOYudkZyKwa3GVUL4rN7ZmUHR+URFH79pS8zdwmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009612; c=relaxed/simple;
	bh=l2WUPre+u9vps/8AxxfF/45r/vETMpyjWya1U23cdUw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rlCfYIN5JvHyfCQmR7ZR894uN//Y/tTGuPLydQNq2IWptrbGaRIg6LpqOaH0LkJHn5/kFzf6hFaqEpUawj+jD4WFMoW1GNbp1RwO6v13CRFKKDLCXC2HYhgoifPljCP6OIZbgjMhvJmLjkd9C+j2NmU5ZEjIWeFJcRkN+QBwYCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=swur6Qyu; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="swur6Qyu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjSzlSJ07RxRH2sZP3ovleMJopWPqkw91jj6fC+H1ayhN3xNqv0G0dRarqt/w/9NqZ6n2PVk6DMHQMcg7yuW7wbsP6fCTmfDKgGG/LHlfl+Pr3BT7CjBGA//YlGC1oUkhiFuyWdXW7kvEKQzFv6dUuwxuNEcGupEJehTGXDyLVyZWZUKshXtM3WHZ37z0NBVzkxYKVp/AhQUnHw3F/BcM6Hn1iNfjtzjHaSIC6OWIAxk/Redh/8zQ8+PQk1/hL8O6YkrcLJvbrq7csfuXUZQTA2RNr+eszA2k1/pn/kEUfc4VuOas9V8bYOBdO9iOqhTPlp96u4+AvFh+zx8oyp7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqiaQ4/rDCwtwP7ZDCo9hDgFvt5YNBHATTHBuJR08FI=;
 b=xYCaj/lJoMTrX0NbBoIi3d0CLw99TiXWesahtCMrUeBnM5KpnopGJ7fCDKqvor8xOkYp7+9/wMxUE9NvZKC86xl0dHE6FKE0dLcWTB+HPZfKNbPUPw7WQgj5GWXjtKLzFtWOWavQ1aJx8WBYmUtIxMsHYTgfYUvIeSlkE6MDwqBDX3b7wnZwtZzogRseow9JO4w3lFYmPxaz+yBBwU98UEzRDQWhNXNDZkSQqneNYnIVKLDDynU/G0mWQQ8LZMYHsDLVTFqZ7JsCfItFLSIUUxEmxFrAgMicEfYDum/wQ+Usi5MVEFwVjLYwSMI6974UAl6JYT1EiyLWBQaDclt0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqiaQ4/rDCwtwP7ZDCo9hDgFvt5YNBHATTHBuJR08FI=;
 b=swur6Qyuig9ApwMmoBgSeYQNWF/Kgwh77D+F8lBiPfgWCEmBYPSJaLNnYrD8aMiSmtbtq0QK46ZEjBHFIfZ/O0o3ZloYFAXD4tHVQv86gWyQriYqk4gnq8CI39KrZwzgnty7KZVr1us+cTgRJreRallUuPdFXJZqKrciwGwSq/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 10:40:04 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 10:40:04 +0000
Message-ID: <e82c456d-c64c-4fa3-b404-1388ab7ab17f@amd.com>
Date: Wed, 30 Apr 2025 16:09:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as
 mutually exclusive drivers
To: Gregory Price <gourry@gourry.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250425102357.266790-1-suma.hegde@amd.com>
 <b5e59360-0990-104a-f87c-6acd20dd6b74@linux.intel.com>
 <aBDuQDsugOylYa56@gourry-fedora-PF4VCD3F>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <aBDuQDsugOylYa56@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::15) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c00f630-6749-4f44-306b-08dd87d35dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDNrRVVNYzIyUTg5NVNmSlJHb3hxUzZyVWt2cXo4ZC85VTFRY0hUN1FaR1NW?=
 =?utf-8?B?TU5tbjBTMnF3LzhEZjBmM0Q0Qm81S0E5NEdCamF0UVZGdWxRNWpUdGpGM1hq?=
 =?utf-8?B?OGJnaVFndHgxUU93T1NkU3Nnc2JtMTVrUmgydU9VeGN4dHZ3YjUrSlhNL3FQ?=
 =?utf-8?B?NWNRYWJzUGx4MW1VK1ZkNHhKOWFzZzZFaHhoVzBGMU0rdC9nQXdJSjFXYnhr?=
 =?utf-8?B?WHg1WFdrUG5GM1ZsSWN0ckdXSXRLVzE2cEFBRW9KazNlcGpnamoxTWVPTW5T?=
 =?utf-8?B?RGhkUDgrQU1hUVQzVW5ROG5WOTdYZkp4N1h3MWViZjhWbWcvUkIwN1NIYXlM?=
 =?utf-8?B?bnZKUTJnUDdNNUZweDh5blExcFUrR0dHUHZ2L25oZHNkMmExODlHRHNVWjNM?=
 =?utf-8?B?a2Z4bXJMVnNRb3gvQTZYUE1uYlVrZ24vNklGbmp4cXpmRW45MHFncVhPUTRE?=
 =?utf-8?B?OWVBZ0RwLzRwcEQ0OERGL0MrOXk0cEFTR0s0blE1NmxKY2lId3ZvWmV6aFMx?=
 =?utf-8?B?Q0tPWHRBY2pja1ZpN3c1bEVoZ3dNam4zb2NhelAramJJTG1SUTZwNVRDM1Vt?=
 =?utf-8?B?R1JhRDlDZnMxbnQ3dzRod2VNbmpBOG5yTjkrY2pUcjUxdUpSQUlwbVg2ZDZo?=
 =?utf-8?B?RGNBMUpTTmZSeEJwNUpGTys3UmxHRUFFUUVYMEF0QTIyV28rZkpUR2twUDhi?=
 =?utf-8?B?UmZOdzFYRlZveXJrZmJyQjZ2bStkc0xXMHFIQkVIeWVHRzU3MnA2cFZLWXk3?=
 =?utf-8?B?TFlZcXUrK3hvTW52RFlRTXJPYWN6TWpwTXQvTmE3UDNmemFMSDAzYlV2SkVY?=
 =?utf-8?B?M1lQbnhuMWlYVjlhRm1wNlRha2Z5ZFZ5b1R0dDkwTFFCckwxdjNOZW8vV0F4?=
 =?utf-8?B?VVB0eDg1NFJkbmVxSFlBRVBsTlp1TXFsYTdTS3NYeWFFUWR4dVJHTGFIditV?=
 =?utf-8?B?V1hDU2l5eENyL3ZCZTNQQzVnUHJnU24zZFlVZVBJTVN5WEpyL09GVHd1REJj?=
 =?utf-8?B?eEZKYlV3NUltYktldW8vZDZNcHR5MnBiQ2phblJKMGNITnBvWjluOGNnL0I2?=
 =?utf-8?B?OThkSjdsUi94Y2N2WCtpdFZKVm9DeXJYdU1qWk1wTjU4aW5RbVh1T0JpVlpz?=
 =?utf-8?B?T3RTTnNUS0l0dktYUnE1VWdVQWh0NXpFcFhjR0FOMnMwU1ZqYnh4cUs2a2xZ?=
 =?utf-8?B?L3dJVGFCUCtIQi96ei90WDd3NWgxOTFBdkdVcThNaWN3YU1qaHFNd0tRODZk?=
 =?utf-8?B?cktuY1F1QU10bStzQWlpMDc1RzFYVnRQbzJXS2hyYWN6bHdEbXhPSmRudkdt?=
 =?utf-8?B?L2pCb2dHZTB1a2U5UjlkMXRvRXJnTDV6Y3VQV0hOOWRIYVlEY0hhdDF1OEhJ?=
 =?utf-8?B?U0tSNVFjdFZVN2p6NGd3TTVVL3d1cFEwYnZxS1JHb0QzUUZyQVVzamp2TGVS?=
 =?utf-8?B?dHczSTQwL3doR1hVdkRaa1JxdXVXZ29KQWZrT2J2ZEN5czJkRTBqL2lyRWZu?=
 =?utf-8?B?aGVya0N5aS9sc3ljT3BWZ0RTV3JWUXZXaUV5aFJGL2Z1QmdSVTRuSHNQcS9X?=
 =?utf-8?B?cFF4N2s0L3cvYXVhQXllcWZ4ampMcXhFOTh6SmcrNy8xWEFoSS91M1BsejhT?=
 =?utf-8?B?YXdRWTVFLzI0TVhjN3g0eU5rYmlaRk9EVEdBUTRFUTZzdUFaMFNHVFViSXhQ?=
 =?utf-8?B?WTNYQ01zZmpPTzVVSlhIckNjdnFqMjRzNUpJUllBT1ByQWFuaytYTnZkMkJC?=
 =?utf-8?B?NmlQNFA1bEw3OVBRWHZ1OTFFSXNCMTIxSWxjc2ZEMmNvbWozRUJ1YXJGblcz?=
 =?utf-8?B?RXVvL1BNYW5XZVh1RUFINjBQVmZTUkdjancwRkVwbGZPUjJvT0Z6bCsyc0Vy?=
 =?utf-8?B?RWZmbHBCdnhaY1ZRZFhFTWdvY0sva1Yxclh2MHZrT3NBVVRRVkFjZ1c2bENm?=
 =?utf-8?Q?MxoyIqY6/EA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGJMRUQ2U2xVcnc0ZFBMVWxrRWZiTWlRQklBUzRKZUhRQzJrQXJoa3dZeDhG?=
 =?utf-8?B?aXdvNU54T0pQaFB0cVV5ZXR3RkhYWnkyWFQ2OHVUTkNCcnpjT2d0YzZzRzFa?=
 =?utf-8?B?ZW9YYnVBMXhjQkxFVHZzMFlwdDEvanlOWGVmOHVDZWtKQ1RWaFkrNEhRR0ZR?=
 =?utf-8?B?by9ENG9RMzRnU1FvSmNKWlp1NnNZRHl3R2Z5ZjFoMmYyRE9vYmMwdzlucUpK?=
 =?utf-8?B?clc0NEd1dXBRbm5iS05tblBDR1h3M2p4Z3pBclp2cjVTRlU4bVl1NCs2NWth?=
 =?utf-8?B?bmMweWt5aDBBY0xNZ0poRTRtMVJZQUI2VEFySk1VT280N0lIL2Q5M2huSVZQ?=
 =?utf-8?B?NEtKRStHaXRXV1BJNmhjemdoNkNuMXBJNFdMQXBudXROWDJwbVhmTXg5d2Vt?=
 =?utf-8?B?ckVSYUthaXhQMS91RW41UWhhYnN0Z0tLL2NMdkJjbWdhUmI3c253Umx1Vnlt?=
 =?utf-8?B?OXJkOFBOYysrUi9oNWwvNjBxNXRYQy9uN0t1S2YwUU9qSnQ4OVdhUndKNmxk?=
 =?utf-8?B?UkRsUXFQZy8vUE5vZGVaTGVDZHBHTmZTMHB1LzZDMFovRWt3c003aTJ0OGhh?=
 =?utf-8?B?dnRPUjVWQnhYbmNqeGdNWXlEYlpVVzk1UldINEJpeWV4Z3ZNWGxmYnVBMTFF?=
 =?utf-8?B?Z3dzZjFUS3FNN3duMmZBMTRDWlRmYzR2WDlQdmpZL01oa3g4dFRDMVQwZG5y?=
 =?utf-8?B?Y0tteGM3czhDMXBHa0lGTytPRXNSQmVFRkovZlRKTTlEQmFtQWZqbEtsYkI1?=
 =?utf-8?B?VUQ3Q1FxMm9lS2tOSkhQR2VrNVNZd3FCbGNnUFRTenMvemtJMStYcUZOSE5N?=
 =?utf-8?B?aUd6WFd1TXpEV2R2anR0UEMrM1pBeXNxbWhkMjczNWF4S3llTERQK1JlNHVK?=
 =?utf-8?B?ZzJSRkZGQkZWS0xVcUdEd01CZDFnVFpqS1I1cU1wSTI4Ym1nT1lTck5Qb1lO?=
 =?utf-8?B?NmE1SUc3Q0FCYlFTbkdicWFSQzVxY2x3SzIvZHBQNThVUm1Valo5b1pROU1R?=
 =?utf-8?B?ZjFVUlJBNlhMY0ZRcjZyQlVoTytNUC9ZbGk0ZlJSNWdGaFcrTmxOOHpKZ3ds?=
 =?utf-8?B?M1QraGVDM0xqSWlieFdkbjIrU253NGRlKzNWQmNJM2lMa3ZFL1BhbEtqdGRu?=
 =?utf-8?B?bll3N2w4dEpMaGZ2RCtNYmFCOEgwMGhCNzBINEdIYktia25MdjZhZG5qaTNG?=
 =?utf-8?B?aGVFTWY5RlY0ZlFkc01YYmVZa240S3pmQVNkZzJyakdad3FoNCtxRnNwOEhh?=
 =?utf-8?B?bytzQkZXdU1zSU9IeVAzQ1N4b2E0WXN4dndpendBU2xLTU9ZY0M2a29xQXRT?=
 =?utf-8?B?eEp0U3hTcndMQzhYbHhuU2JoWWJtekN2bmtSYlpjeDMrMS9LWU0vL3hnZmtY?=
 =?utf-8?B?U2NrWlBMMXh2MmNtaGhZcFo4WURYSlNMYUlwalEvcVJ3S00reDBjQXovQlZ6?=
 =?utf-8?B?NS8wU24zaUF5bDZ4QWxRYW9xRXFnbnlGclI3b2pWZHpPL3pOaTE2Vzk0TVN1?=
 =?utf-8?B?eVUrL0JXUHFIdVpuK1o2VU9EZGdJNDhma1NKbFkrdVUzS2s4b3F0M2dGSyth?=
 =?utf-8?B?UE5PaHJiK2JySk1LcGVTQUF2dytodXJlTFVUb2tEZWdEQlF1T1ltenFlLzdN?=
 =?utf-8?B?ZDZHZUxUSEVSMk1GWDBxWTVOY0k4Q24yZC9JMEFlNUwyOUFZNlE1dThOYzlu?=
 =?utf-8?B?ckNYSXV1UXZPblcwVnoxK0VkeXJtOWlVS1Y5SXoxczZONmtCZDJSNnI0Tm9I?=
 =?utf-8?B?SVdKak81d2tQR2dXSzB0Ukg3dDEyQ3J3Q1hpenYzSlo0TWNlQUk4ZDVGUnFK?=
 =?utf-8?B?WW9aV3RSTFpEamFZRFIyeC9vMFpPa3FIdFBQbXZFUllMTEd6WDF5Ykg2NUlQ?=
 =?utf-8?B?RmgxWHZuZU9YeUpxK2NVMTIxL2JidXJIMzNxMTJLc3QzbWcvSXIrUnNaUFdW?=
 =?utf-8?B?VU54eFBxMUVkSEc0ZXhkSUFzb3BpajQvSUMrK0ZjbVZUQ0hjcTNzdElIN2Zk?=
 =?utf-8?B?TUxYYWNNeVlFR3hNTDFrZ2tuMmxMQWRPNzZ2VjY1UVdwMlpGMGtqaHJXSlQ1?=
 =?utf-8?B?aTgzTUorZGZqaUR6VmtGVlc2ZmRLVzI4cXMwT1ZOMERpWW0vd3RHb2ZQaHln?=
 =?utf-8?Q?0Hsit1G9MSDcDb9Nj2h4qdNE4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c00f630-6749-4f44-306b-08dd87d35dc1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:40:04.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N39ifyhMBkgAP2YeA17oYHOOwSDjlnDlpUowqdoXyG6fmFXQiTWnj+yeGj9rome4UIcSsUEygGDI+aLpNSX62A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247

Hi Gregory,


On 4/29/2025 8:50 PM, Gregory Price wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, Apr 29, 2025 at 05:35:24PM +0300, Ilpo Järvinen wrote:
>> On Fri, 25 Apr 2025, Suma Hegde wrote:
>>
>>> amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
>>> amd_hsmp is for legacy platforms. To achieve this, it is essential to
>>> check for the presence of the ACPI device in plat.c. If the hsmp ACPI
>>> device entry is found, allow the hsmp_acpi driver to manage the hsmp
>>> and return an error from plat.c.
>>>
>>> Additionally, rename the driver from amd_hsmp to hsmp_acpi to prevent
>>> "Driver 'amd_hsmp' is already registered, aborting..." error in case
>>> both drivers are loaded simultaneously.
>> This rename has userspace visible impact through sysfs, no? I'm just
>> wondering what's the expected fallout once this patch goes to stable
>> kernels?
>>
> I suppose the real question there is whether these should actually be
> different drivers, as opposed to backends for a single front-end. In
> which case, some of the split work previously would need to be reworked.


No, these are not 2 different drivers, both can not co-exist. Its 
necessary to make them mutually exclusive

and amd_hsmp is only for legacy platforms.


>
> ~Gregory


Thanks and Regards,

Suma

