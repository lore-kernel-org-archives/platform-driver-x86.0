Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668FA2D77EF
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Aug 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756036768; cv=fail; b=f3hV32E+Brqgeo0CIsEC1LTyPR/Uxt2NezRJzoNx7+AN9ZGG3YSv+2o7xrOhtUyi/yTVYmNMGrNjxKtnm9aOgX4omxjZw12GgC2vcv5oQSBJHGkvc48Ane3YcD1lhqG00rgn3Sz15ejHDhSTPkHQ35wwSG/FES7X/lLs5lMLI58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756036768; c=relaxed/simple;
	bh=8wiPbsdbOqAtQZ9uMbKLZO3Ld2alpealMOkGi0BTv1M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PlRkKTqtEGWo/yUQkRmrjce9or5BeyxER5Kt1a91HJB/RJ8hnAcCdSEL+AEVdVM4U5VTGtYjBLNJXUqTs+Xm4BmhM3h0yEHsf9JJa2aKv+vYujwCtlgQswjo3LwdQD3GbWfZYeM/DyosZf6cCVQAFu8nvfLWntYuJ6mUB9kNa3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=avZzeM2L; arc=fail smtp.client-ip=40.107.94.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="avZzeM2L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3RwgPLyoSKKjXG9/e0Unour6phel5KSrI7NG0xPoQaW86h0V4kApmyoinShp8lwAgYLgq/OLwEGKjDRpcElIABl6AneH5/6SqJzlLEKQj857e6aqHZNZvXI0a0Oj24p027nr1aGspNiRCoLVBD5XwZUxvUY1LEh8A7o5YJX3xPyKEMqh3itOYQHRoDts5it6vOCr8Ix3xo6jh3edJvOPfBmtVHr4j8xXg3SOY12ZakowbN9e3MfzjZQGUtUohOAAo0Vs2iCh0tUpV3iXoO1wlj5IRHgB6/DtLZnqvUaVSfBz5UIWRUcXo9R5cGEjcpQbEF+yNdPpIQFWiD1kNtgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxXo/efBukjYqWnifBHP6JQhrJmqZUUIT7wEXhQYLW0=;
 b=x+tSgCUXHWhaPWctn4VNFhPbWSNVLHJOpyErDDrkBxLvTxCbcNAioWq520VHmr39T0Xi1FNT95OpS1D80LpKNiUCRp0f6prk6IZLvF8ABSyiW8S25gpQYqsujNknb5GWhoysP716PDKmo2XszskMIR5CYkmdffp4BY/KixmDUlaLUhulJvYgjgTi0tqc/S5jGltI6iHVeDnDHmdUCb+2+JFg2buuMrw2cO2aZUPoaPf2FBdxREmGabQFdlps/UxtA9Qu+/nph5KsvkDj8Huzx5kKnnbJLuQFUKNdyhIMoi/nNYlJ9C5mV2dF2odxDyCc14OJpc1p70RLxAMyJRoeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxXo/efBukjYqWnifBHP6JQhrJmqZUUIT7wEXhQYLW0=;
 b=avZzeM2LO+04aZ4lcz86DD72Hy5d2oT6bzYqud1UkH4K3WugFBGYYZMhY9g3M96pjir92NYpGCDvXpq6M1HG7ojuDSa8WyedG7Ji1/zCuYbtEcQh8YN46iJRJubmLtuV3gzZCEw9Y1pauzzDgScUXnOteVHWp8Osj7pOG357/Z8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by IA0PPFFEC453979.namprd12.prod.outlook.com (2603:10b6:20f:fc04::beb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Sun, 24 Aug
 2025 11:59:23 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%6]) with mapi id 15.20.9052.014; Sun, 24 Aug 2025
 11:59:23 +0000
Message-ID: <936a2dcc-aea7-4246-ab0a-846bb52d1838@amd.com>
Date: Sun, 24 Aug 2025 17:29:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/hsmp: plat: Add sysfs files to
 display HSMP telemetry
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250806063804.693481-1-suma.hegde@amd.com>
 <20250806063804.693481-3-suma.hegde@amd.com>
 <d120136c-ffbe-2a58-0776-388a0e8aaa6c@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <d120136c-ffbe-2a58-0776-388a0e8aaa6c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::27) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|IA0PPFFEC453979:EE_
X-MS-Office365-Filtering-Correlation-Id: fef3d865-b672-4f32-8c8a-08dde305aa2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ang5djlXZ3lCVjhjM2RuU2hrbm9QdFg3VTdSUDgzbTA0dXdONzFiY0hUckxT?=
 =?utf-8?B?aDkrVElEcnpiTG1UVUxCWHVia200b3RYVE5NVXJFSVoyRWo3bk01dVV4UUpD?=
 =?utf-8?B?TjNGSEZqUldKaFptQTBzbjdJNy92VjNZbGQ0OFd6ZVRUeURPaEMvaFZ3VXgr?=
 =?utf-8?B?K20xWEJLcmVHb2gvY2NpRlVmT0NMWWZyMEhzMWZOQW1nVlg0SEpCYTNBbWRi?=
 =?utf-8?B?NnFaUk1YamM3QWxnKzFhZzRKa1gyQzNFcEs2RCswWFFPWTBFWTlHNjZjV2hI?=
 =?utf-8?B?L0JBaEM4Q0ZwRzFVaEF4d0JtWmZWakNsZ1VpUStJdERRcmorZDBOY3ZHSXRa?=
 =?utf-8?B?YW44MzI2blBXdngrZ2FpOVlqa2UzYzhsVWQ4b3pZL09PNUpmZGx6elpNQmJU?=
 =?utf-8?B?U2EzMk1zZEUxYmdvT0VncXF2TytIVUpNSjJaZFRRSHZ2MXU2dyt1NFBMeUZv?=
 =?utf-8?B?SDR5eW13eFhEYUx0SlVmcXdGcFF0NStMOElPekVJdnRWMEhrTE93N29zNjZX?=
 =?utf-8?B?ZUJBaGhzZ2pOOFNBVDdvYi8xUUVpdVo1T1JjbmJoUGNXNGZUMVRVVTZlMzNh?=
 =?utf-8?B?VGM5ODRCUXloVGlzNmdSUjIvbzhWVFZLUVpUY1hWS3RQL25razZCV0FPa200?=
 =?utf-8?B?VTVKVTBwc2JPK1N2aGlyVjZmdXZhNWtnWUV3Zkw5NWxicWgzeG8zazZUTFQ4?=
 =?utf-8?B?VWQra21lR2xKbUwwU3lSUm5oUlB2VHdzcENtOEhpNWx6b04rSlZwSys0cEVV?=
 =?utf-8?B?bkQzWHpOUzI2WFU1aW1vUHJMY2IyNGdCamxTSFZqU0VwL1QxVVNnekhlMEVn?=
 =?utf-8?B?aEV0bWkyUnpHT2IwL0NNT1JtTHFrRUx5NGVuKzBWcTJqVnZJc0ZTY0JPN3U3?=
 =?utf-8?B?NFFQWTB0U1Zub3J2SVBRMGlzaHl0emxOb3AyUTFsSk9sRk5oWTZoYitIMitU?=
 =?utf-8?B?RWtNbjNWbkhaVGc0bWtMUTFIVGE5MGhjK2V1UFpQN0dUdXRpTENCMlZxSDFG?=
 =?utf-8?B?UFdkbEtHdUZ0d2dFL0t0cWk5ejdRUVFKbm1vYUh5NDlqTEYzbUdSN3Q3aHdn?=
 =?utf-8?B?QmxsUWtOdXdrMEVkYWd1eHE5aDIwTlBaYnFMYjZTcVlaWkRrbmVMUVdYZEph?=
 =?utf-8?B?a2d4RE1VV3VlU0VUMlRhb1FuV2tuZE5TT0k0eEVKWDJ1RHF3ejZ2WVBlSm81?=
 =?utf-8?B?c1cvazBaZDhSQ0krSmxNbStxMC84SzJoNE83dU4rNHhMVFdpaU9NRVNrbGI0?=
 =?utf-8?B?RGxkSG14blZqOTRWR0E0QjJFUnVWUWVub0xmbldJRkZvNVBVNzdwN0ZlYkFY?=
 =?utf-8?B?K245QzlQb2pLeGNIZ1p6QnZTT0ZYOEJyQVdDRkhQVFp6Vy9xbFpEU3FQd0c5?=
 =?utf-8?B?RkdZeUV5bU0xbXZOU0l6MWY1V0Vtb3NmRk41OWtmQ2FWZ1lkYkppNzRuNyta?=
 =?utf-8?B?YWtFaUFxQlVvTGtHNjNaQmEvTXRlYlBJODJRVEF4enNPZHNocnVmNXdUMGNw?=
 =?utf-8?B?ckQ5SFBaREd6WlViVTZpMDF2Q09ud3ZFS1ZHNDhXMFhmbFpQbmFQYUhiektZ?=
 =?utf-8?B?YTIrVEhSZ3RHdjdSTkZERVRYb08zNE8rV3dDR3ZGSDF0ZTFQMExSZFdHNU1h?=
 =?utf-8?B?S0VvNi9IeXpEd1cvTVlCM0s2TzhhL3BHalpiSUxzUUlENjhXZmJkSFdHNmt1?=
 =?utf-8?B?T1hjT3ZjRUswcEVHcGVuOWRzRXdpaTliK0hqL2NyTXRrNUpFWS9DWUpvLzYw?=
 =?utf-8?B?c2FOaUZENUxqdmZtanFJaXhlSFRETWVkekN4QlMwcVpVN3RUMlI4b0VtK3JP?=
 =?utf-8?B?MzVFeCtvcGRTRjFyWjc0ZzBPYlE4QU9pQ0VkR3dOWWtqSklnNU53NE9mZWwx?=
 =?utf-8?B?QWphcm43ZTN0Slc1N2hxNGlPSlNiR1FSdU5PWDcwQVhBUFMwUFZROUFzcjBD?=
 =?utf-8?Q?6PnnW6xWFno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVp3WFlKLzFzdlFzRnVrL3JnbkQzTzRhclNnaFdEeGtFWXRIQms0a1BSMnZF?=
 =?utf-8?B?L2tMMHFnZ0RGOWdJdEVJaFAvN2ZNRVRjcDBnWXp0M0s4L29sRlRTdFVwT0xY?=
 =?utf-8?B?V0xjT2M2WFJ2QUNRMkE5ZW9nY1BVTmpHa3FRanJzRUNsdldVYXc0RjFCMW5k?=
 =?utf-8?B?TWpQTEVRdG1aQVRsbjdlWU5WUGZYOFhnTmFULzdvTTZWZzFNc0RyS1o5dDlQ?=
 =?utf-8?B?VGtob2hXOVZJQ3FDUTNJK04vV05LNjFkWnI4cS92ZDlUT2oxeVlQVVY2S2Vx?=
 =?utf-8?B?cTJZZHlqeDk3RFJhYWF5RGdKREY3S05BZ2FDT1hlTUNYVEl5N3JnUGtkMlly?=
 =?utf-8?B?YUZiQXVVKzNNMkc2RUZkWTN4OTdmaStJd05UWlc5aVd3MkZ3U0JnZnFBSVEz?=
 =?utf-8?B?OEVwcktRQzQ1eXZNWGhSYk93dExSZ0M2M0U0MDBVdzF0MHlOcE56V0NURUYw?=
 =?utf-8?B?TjZIUlJMbE5QZjZsS1VqWkIzU0NYcnV0eTFyL2lkcnY4OEljWWtReG5iZElH?=
 =?utf-8?B?MUthVUt6SGt2dUJWZGFidUk1VVRNcHhIZXZMWWFNc20yYWd3Tk9CS2krelc2?=
 =?utf-8?B?N2lkd0NYMDNFSms5M3ovQ2VMVHJLdENaaHErb1RGY3NKWFJPNmhZR1dRWVEv?=
 =?utf-8?B?KzhjWndyNWNRZFNlMWd2NUhpdVVjYXlOZ0hFUmg3K0lDZjBTZ2UwSS9yNHpW?=
 =?utf-8?B?cndkci9HeDd3SjlFVzRrcTZRMWdxa0ZXekYwRGFRTVRlUHpoWHJTUERtYTA2?=
 =?utf-8?B?Zi9TdWFGRkJiZTlpUHVNeFlRTGw3bjNHL1F5Z0xaTWxZSFdJWXduZUFJbmVR?=
 =?utf-8?B?ZVF5L1N3dGM0ZytDOGVlb0Q4Wk9LVThMTWFqalYrWi9leWZXc0NUSFYrbkRN?=
 =?utf-8?B?eTI0Y1o2ZHRaQjd0VzVKajMwdzh3S0Rib1FxR1cwOGI1c0ZSNzNvemUrRWtR?=
 =?utf-8?B?WGlXTG9iaHZaVTJqbFp1Q3FjbnRiOE1QMmxkVVZPYmZSdGJTbE5vL1o1UXZ5?=
 =?utf-8?B?ck85Mit3NHdNVk1oVmxmQmJtN2hNaTVqNEcxUmpYWEp6KzdrMW5tcnpQSFov?=
 =?utf-8?B?Y0J1NWtQWUVFbkZiYXY4engyb0FrZXdsM1oyaSs3TndpWmkzaEQvTWwra0hG?=
 =?utf-8?B?MzZmczU1dG84UVdYSTFEQXh4Zm9mSWJaSU4wQ3lnMy9NY3p5QnRVRlZWL2Q2?=
 =?utf-8?B?ZjhMWUdkS1lWVWdWTGVCS2QzSCtaaEppWnlRcThGR3JoYUJkcWY5ekZja1Mz?=
 =?utf-8?B?QTVXcXd1ZlVFOW96Szd5c2tYWkhFaDYxWUYySFZyRUNpR1Y3TjF1VDdlMFp4?=
 =?utf-8?B?bzFzSFhBeERaRHFJWmRSODRJZEFNdmozSC9naGwyWmhCUGQxTGZyYzN4dWFs?=
 =?utf-8?B?TkF1VW0zYjg1eFA4UlVGdWgxSmZ3NFhRd3VnMkowYmdMZlBHQm5FWUN6c2J5?=
 =?utf-8?B?NTEyZE1WSzlPU2ZZZGVIKzc4VllBc0Nvc0hmdFc1WDRVR2U0dlc1bS8vVzRT?=
 =?utf-8?B?Tjg0ZTNJYkVVMWdKZ2QwUUtaQ0l5bVgvV1FGNDkrcFJmSVpiNEYvUm84bkxp?=
 =?utf-8?B?TU40ZGx3a2dNcjcyNG95SE5Uek5RNFlnRHNJOXFDOExlT0h2NVk3c2F2NnhW?=
 =?utf-8?B?ZFB6M3I5eGNiRDBMT1VXTmFTZ1UwR1ZYaVpBbFY5NTZDYThKc09pdWxsNHRu?=
 =?utf-8?B?WllSVSs2K1lpV2w5YmJlWVNXa3F4bWhQektWL2lBbHR2eWQ4WDlJeWRjNFV2?=
 =?utf-8?B?alFCbzBJdW8yL3IyY3J5UXM5RnpnTXFIWmVycmZROXQ2aGhyWFZvTG5idDJ6?=
 =?utf-8?B?a1gyaHZaNUJiaGlTaEVrQ00zb0llNWduVmhKNURGalRlSzUzcGJNMm9MQnNB?=
 =?utf-8?B?YlpvOEZDeE8va2JVNWNidUpWTU5maFVjUWxyUERGdnQ2Y2ZTcTA1MkdjMVZn?=
 =?utf-8?B?UkQvTExJSDdNVkdPREJmeVZNN1B2dDVQUzVvNlZQelh0bExLSVhIcDQzYkxo?=
 =?utf-8?B?UitxSWUrNFI0WTV1K0tGdHZENUFpZUFLZ09JeTNDTk1JS0ZqWXQyTkNyZDhP?=
 =?utf-8?B?ejdwMlZWZkZNMjhJVGZFZWhYR0RHbGo1S0luMVhRaW1ucElMRXF6UUxveTJu?=
 =?utf-8?Q?3bypFewhI35nh0fs3Wj5sHwWY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef3d865-b672-4f32-8c8a-08dde305aa2e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 11:59:23.0591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBzi1VJcMHJcxRzE2lbomx1J4Uv7mg2MxaYtnQXqRhGtLbnl5xgFiTxgCFzezkxPf8ThI5XC9kTs3fQq52pn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFFEC453979

Hi Ilpo,


On 8/19/2025 5:12 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Wed, 6 Aug 2025, Suma Hegde wrote:
>
>> This patch adds sysfs files to platform device based driver.
>>
>> Following sysfs files are added similar to those in the ACPI based driver.
>> * c0_residency_input
>> * prochot_status
>> * smu_fw_version
>> * protocol_version
>> * ddr_max_bw(GB/s)
>> * ddr_utilised_bw_input(GB/s)
>> * ddr_utilised_bw_perc_input(%)
>> * mclk_input(MHz)
>> * fclk_input(MHz)
>> * clk_fmax(MHz)
>> * clk_fmin(MHz)
>> * cclk_freq_limit_input(MHz)
>> * pwr_current_active_freq_limit(MHz)
>> * pwr_current_active_freq_limit_source
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>>   Documentation/arch/x86/amd_hsmp.rst   |   4 +-
>>   drivers/platform/x86/amd/hsmp/acpi.c  |  33 +--
>>   drivers/platform/x86/amd/hsmp/plat.c  | 388 +++++++++++++++++++++++++-
>>   drivers/platform/x86/amd/hsmp/sysfs.h |  48 ++++
>>   4 files changed, 433 insertions(+), 40 deletions(-)
>>   create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.h
>>
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
>> index a094f55c10b0..6dd9948d8c21 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -73,7 +73,9 @@ The same is defined in the amd_hsmp.h header.
>>
>>   2. HSMP telemetry sysfs files
>>
>> -Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
>> +Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/ for
>> +ACPI based driver and /sys/devices/platform/amd_hsmp/socketX/ for platform
>> +device based driver.
>>
>>   * c0_residency_input: Percentage of cores in C0 state.
>>   * prochot_status: Reports 1 if the processor is at thermal threshold value,
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 19f0ca7958b6..f6434cf07f6b 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -13,12 +13,12 @@
>>
>>   #include <linux/acpi.h>
>>   #include <linux/array_size.h>
>> -#include <linux/bits.h>
>>   #include <linux/bitfield.h>
>>   #include <linux/device.h>
>>   #include <linux/dev_printk.h>
>>   #include <linux/ioport.h>
>>   #include <linux/kstrtox.h>
>> +#include <linux/limits.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/sysfs.h>
>> @@ -29,6 +29,7 @@
>>   #include <asm/amd/node.h>
>>
>>   #include "hsmp.h"
>> +#include "sysfs.h"
>>
>>   #define DRIVER_NAME          "hsmp_acpi"
>>
>> @@ -39,11 +40,6 @@
>>
>>   static struct hsmp_plat_device *hsmp_pdev;
>>
>> -struct hsmp_sys_attr {
>> -     struct device_attribute dattr;
>> -     u32 msg_id;
>> -};
>> -
>>   static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>                              u32 *value, bool write)
>>   {
>> @@ -257,8 +253,6 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>>        return attr->mode;
>>   }
>>
>> -#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
>> -
>>   static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
>>                                    char *buf)
>>   {
>> @@ -274,17 +268,6 @@ static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute
>>        return sysfs_emit(buf, "%u\n", data);
>>   }
>>
>> -#define DDR_MAX_BW_MASK              GENMASK(31, 20)
>> -#define DDR_UTIL_BW_MASK     GENMASK(19, 8)
>> -#define DDR_UTIL_BW_PERC_MASK        GENMASK(7, 0)
>> -#define FW_VER_MAJOR_MASK    GENMASK(23, 16)
>> -#define FW_VER_MINOR_MASK    GENMASK(15, 8)
>> -#define FW_VER_DEBUG_MASK    GENMASK(7, 0)
>> -#define FMAX_MASK            GENMASK(31, 16)
>> -#define FMIN_MASK            GENMASK(15, 0)
>> -#define FREQ_LIMIT_MASK              GENMASK(31, 16)
>> -#define FREQ_SRC_IND_MASK    GENMASK(15, 0)
>> -
>>   static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
>>                                    char *buf)
>>   {
>> @@ -423,17 +406,6 @@ static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute
>>        return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
>>   }
>>
>> -static const char * const freqlimit_srcnames[] = {
>> -     "cHTC-Active",
>> -     "PROCHOT",
>> -     "TDC limit",
>> -     "PPT Limit",
>> -     "OPN Max",
>> -     "Reliability Limit",
>> -     "APML Agent",
>> -     "HSMP Agent",
>> -};
> Please put these moves into own patch.
>
>>   static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
>>                                           char *buf)
>>   {
>> @@ -521,6 +493,7 @@ static const struct bin_attribute *hsmp_attr_list[] = {
>>   #define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)  \
>>   static struct hsmp_sys_attr hattr_##_name = {                \
>>        .dattr = __ATTR(_name, _mode, _show, NULL),     \
>> +     .sock_ind = U16_MAX,                            \
>>        .msg_id = _msg_id,                              \
>>   }
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index 10e8f98ea12c..3a0171ee4a80 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -12,7 +12,9 @@
>>   #include <asm/amd/hsmp.h>
>>
>>   #include <linux/acpi.h>
>> +#include <linux/bitfield.h>
>>   #include <linux/build_bug.h>
>> +#include <linux/container_of.h>
>>   #include <linux/device.h>
>>   #include <linux/dev_printk.h>
>>   #include <linux/kconfig.h>
>> @@ -24,6 +26,7 @@
>>   #include <asm/amd/node.h>
>>
>>   #include "hsmp.h"
>> +#include "sysfs.h"
>>
>>   #define DRIVER_NAME          "amd_hsmp"
>>
>> @@ -78,6 +81,186 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>        return 0;
>>   }
>>
>> +static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>> +                                          struct attribute *attr, int id)
>> +{
>> +     struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
>> +     struct hsmp_sys_attr *hattr = container_of(dattr, struct hsmp_sys_attr, dattr);
>> +
>> +     if (id == 0 && hattr->sock_ind >= hsmp_pdev->num_sockets)
>> +             return SYSFS_GROUP_INVISIBLE;
>> +
>> +     return attr->mode;
>> +}
>> +
>> +static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
>> +                                 char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%u\n", data);
>> +}
>> +
>> +static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
>> +                                 char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
>> +}
>> +
>> +static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
>> +                                  char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
>> +}
>> +
>> +static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
>> +                                       char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
>> +}
>> +
>> +static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
>> +                                 char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%lu.%lu.%lu\n",
>> +                       FIELD_GET(FW_VER_MAJOR_MASK, data),
>> +                       FIELD_GET(FW_VER_MINOR_MASK, data),
>> +                       FIELD_GET(FW_VER_DEBUG_MASK, data));
>> +}
>> +
>> +static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
>> +                           char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data[2];
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, data, 2);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%u\n", data[0]);
>> +}
>> +
>> +static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
>> +                           char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data[2];
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, data, 2);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%u\n", data[1]);
>> +}
>> +
>> +static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
>> +                               char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
>> +}
>> +
>> +static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
>> +                               char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
>> +}
>> +
>> +static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
>> +                                 char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
>> +}
>> +
>> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
>> +                                        char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     unsigned int index;
>> +     int len = 0;
>> +     u16 src_ind;
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
>> +     for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
>> +             if (!src_ind)
>> +                     break;
>> +             if (src_ind & 1)
>> +                     len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
>> +             src_ind >>= 1;
>> +     }
>> +     return len;
>> +}
>> +
>>   /*
>>    * AMD supports maximum of 8 sockets in a system.
>>    * Static array of 8 + 1(for NULL) elements is created below
>> @@ -110,21 +293,208 @@ HSMP_BIN_ATTR(5, *sock5_attr_list);
>>   HSMP_BIN_ATTR(6, *sock6_attr_list);
>>   HSMP_BIN_ATTR(7, *sock7_attr_list);
>>
>> -#define HSMP_ATTR_GRP(index, _list, _name)                   \
>> +#define HSMP_ATTR_GRP(index, _list, _name, _dlist)           \
>>   static const struct attribute_group sock##index##_attr_grp = {       \
>>        .bin_attrs_new = _list,                                 \
>> +     .attrs = _dlist,                                        \
>>        .is_bin_visible = hsmp_is_sock_attr_visible,            \
>> +     .is_visible = hsmp_is_sock_dev_attr_visible,            \
> Please describe the change properly on the general level in the changelog
> as the necessity of these additional members are not obvious from the very
> terse wording of the changelog.
>
>>        .name = #_name,                                         \
>>   }
>>
>> -HSMP_ATTR_GRP(0, sock0_attr_list, socket0);
>> -HSMP_ATTR_GRP(1, sock1_attr_list, socket1);
>> -HSMP_ATTR_GRP(2, sock2_attr_list, socket2);
>> -HSMP_ATTR_GRP(3, sock3_attr_list, socket3);
>> -HSMP_ATTR_GRP(4, sock4_attr_list, socket4);
>> -HSMP_ATTR_GRP(5, sock5_attr_list, socket5);
>> -HSMP_ATTR_GRP(6, sock6_attr_list, socket6);
>> -HSMP_ATTR_GRP(7, sock7_attr_list, socket7);
>> +#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, _sock_ind)       \
>> +static struct hsmp_sys_attr hattr_##_name##_sock_ind = {     \
>> +     .dattr = __ATTR(_name, _mode, _show, NULL),             \
>> +     .sock_ind = _sock_ind,                                  \
>> +     .msg_id = _msg_id,                                      \
>> +}
>> +
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 0);
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 1);
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 2);
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 3);
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 4);
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 5);
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 6);
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 0);
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 1);
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 2);
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 3);
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 4);
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 5);
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 6);
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 0);
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 1);
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 2);
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 3);
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 4);
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 5);
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 6);
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 0);
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 1);
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 2);
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 3);
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 4);
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 5);
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 6);
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 0);
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 1);
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 2);
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 3);
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 4);
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 5);
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 6);
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 0);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 1);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 2);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 3);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 4);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 5);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 6);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
>> +           0444, 0);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
>> +           0444, 1);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
>> +           0444, 2);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
>> +           0444, 3);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
>> +           0444, 4);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
>> +           0444, 5);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
>> +           0444, 6);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
>> +           0444, 7);
>> +
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 0);
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 1);
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 2);
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 3);
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 4);
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 5);
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 6);
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 0);
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 1);
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 2);
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 3);
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 4);
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 5);
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 6);
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 0);
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 1);
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 2);
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 3);
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 4);
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 5);
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 6);
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 0);
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 1);
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 2);
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 3);
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 4);
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 5);
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 6);
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 0);
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 1);
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 2);
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 3);
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 4);
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 5);
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 6);
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 7);
>> +
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
>> +           0444, 0);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
>> +           0444, 1);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
>> +           0444, 2);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
>> +           0444, 3);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
>> +           0444, 4);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
>> +           0444, 5);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
>> +           0444, 6);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
>> +           0444, 7);
>> +
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444, 0);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444, 1);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444, 2);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444, 3);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444, 4);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444, 5);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444, 6);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444, 7);
> Any reason why you chose this way over having all those done by a macro
> for values 0-7?


I encountered  checkpatch "CHECK" s (CHECK: Macro argument reuse '_name' 
- possible side-effects?)

when I added the following code:

#define HSMP_DEV_ATTR_FOR_SOCK_ALL(_name, _msgid, _func, _mode) {       \
         HSMP_DEV_ATTR(_name, _msgid, _func, _mode, 0)                   \
         HSMP_DEV_ATTR(_name, _msgid, _func, _mode, 1)                   \
         HSMP_DEV_ATTR(_name, _msgid, _func, _mode, 2)                   \
         HSMP_DEV_ATTR(_name, _msgid, _func, _mode, 3)                   \
         HSMP_DEV_ATTR(_name, _msgid, _func, _mode, 4)                   \
         HSMP_DEV_ATTR(_name, _msgid, _func, _mode, 5)                   \
         HSMP_DEV_ATTR(_name, _msgid, _func, _mode, 6)                   \
         HSMP_DEV_ATTR(_name, _msgid, _func, _mode, 7)                   \
}

  As a result, I decided not to include this macro.


>> +#define HSMP_DEV_ATTR_LIST(_name, _sock_ind)                                 \
>> +static struct attribute _name[] = {                                          \
>> +     &hattr_c0_residency_input##_sock_ind.dattr.attr,                        \
>> +     &hattr_prochot_status##_sock_ind.dattr.attr,                            \
>> +     &hattr_smu_fw_version##_sock_ind.dattr.attr,                            \
>> +     &hattr_protocol_version##_sock_ind.dattr.attr,                          \
>> +     &hattr_cclk_freq_limit_input##_sock_ind.dattr.attr,                     \
>> +     &hattr_ddr_max_bw##_sock_ind.dattr.attr,                                \
>> +     &hattr_ddr_utilised_bw_input##_sock_ind.dattr.attr,                     \
>> +     &hattr_ddr_utilised_bw_perc_input##_sock_ind.dattr.attr,                \
>> +     &hattr_fclk_input##_sock_ind.dattr.attr,                                \
>> +     &hattr_mclk_input##_sock_ind.dattr.attr,                                \
>> +     &hattr_clk_fmax##_sock_ind.dattr.attr,                                  \
>> +     &hattr_clk_fmin##_sock_ind.dattr.attr,                                  \
>> +     &hattr_pwr_current_active_freq_limit##_sock_ind.dattr.attr,             \
>> +     &hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,      \
>> +     NULL                                                                    \
>> +}
>> +
>> +HSMP_DEV_ATTR_LIST(*sock0_dev_attr_list, 0);
>> +HSMP_DEV_ATTR_LIST(*sock1_dev_attr_list, 1);
>> +HSMP_DEV_ATTR_LIST(*sock2_dev_attr_list, 2);
>> +HSMP_DEV_ATTR_LIST(*sock3_dev_attr_list, 3);
>> +HSMP_DEV_ATTR_LIST(*sock4_dev_attr_list, 4);
>> +HSMP_DEV_ATTR_LIST(*sock5_dev_attr_list, 5);
>> +HSMP_DEV_ATTR_LIST(*sock6_dev_attr_list, 6);
>> +HSMP_DEV_ATTR_LIST(*sock7_dev_attr_list, 7);
>> +
>> +HSMP_ATTR_GRP(0, sock0_attr_list, socket0, sock0_dev_attr_list);
>> +HSMP_ATTR_GRP(1, sock1_attr_list, socket1, sock1_dev_attr_list);
>> +HSMP_ATTR_GRP(2, sock2_attr_list, socket2, sock2_dev_attr_list);
>> +HSMP_ATTR_GRP(3, sock3_attr_list, socket3, sock3_dev_attr_list);
>> +HSMP_ATTR_GRP(4, sock4_attr_list, socket4, sock4_dev_attr_list);
>> +HSMP_ATTR_GRP(5, sock5_attr_list, socket5, sock5_dev_attr_list);
>> +HSMP_ATTR_GRP(6, sock6_attr_list, socket6, sock6_dev_attr_list);
>> +HSMP_ATTR_GRP(7, sock7_attr_list, socket7, sock7_dev_attr_list);
>>
>>   static const struct attribute_group *hsmp_groups[] = {
>>        &sock0_attr_grp,
>> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
>> new file mode 100644
>> index 000000000000..c4cd7e71e404
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
>> @@ -0,0 +1,48 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * AMD HSMP Platform Driver
>> + * Copyright (c) 2025, AMD.
>> + * All Rights Reserved.
>> + *
>> + * Header file for HSMP sysfs interface
>> + */
>> +
>> +#ifndef HSMP_SYSFS_H
>> +#define HSMP_SYSFS_H
>> +
>> +#include <linux/bits.h>
>> +#include <linux/container_of.h>
>> +#include <linux/device.h>
>> +#include <linux/types.h>
>> +
>> +struct hsmp_sys_attr {
>> +     struct device_attribute dattr;
>> +     u16 sock_ind;
>> +     u32 msg_id;
>> +};
>> +
>> +static char * const freqlimit_srcnames[] = {
> Please don't put this into a header as it's duplicated to all compilation
> units.
>
> Where one const went?


I will address this and other comments in next version.


>
>> +     "cHTC-Active",
>> +     "PROCHOT",
>> +     "TDC limit",
>> +     "PPT Limit",
>> +     "OPN Max",
>> +     "Reliability Limit",
>> +     "APML Agent",
>> +     "HSMP Agent",
>> +};
>> +
>> +#define DDR_MAX_BW_MASK              GENMASK(31, 20)
>> +#define DDR_UTIL_BW_MASK     GENMASK(19, 8)
>> +#define DDR_UTIL_BW_PERC_MASK        GENMASK(7, 0)
>> +#define FW_VER_MAJOR_MASK    GENMASK(23, 16)
>> +#define FW_VER_MINOR_MASK    GENMASK(15, 8)
>> +#define FW_VER_DEBUG_MASK    GENMASK(7, 0)
>> +#define FMAX_MASK            GENMASK(31, 16)
>> +#define FMIN_MASK            GENMASK(15, 0)
>> +#define FREQ_LIMIT_MASK              GENMASK(31, 16)
>> +#define FREQ_SRC_IND_MASK    GENMASK(15, 0)
>> +
>> +#define to_hsmp_sys_attr(_dev_attr) \
>> +     container_of(_dev_attr, struct hsmp_sys_attr, dattr)
>> +#endif /* HSMP_SYSFS_H */
>>
> --
>   i.


Thanks and Regards,

Suma

>
