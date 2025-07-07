Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8F293C45
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Jul 2025 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885433; cv=fail; b=eJ00mS5sOssNTZGdNxqDG/ZpX+fR0GNxrXigr8DTdURo8VRz0GrUo5TsuWI8r1+Y9SDapwZ6GVYsQf7rIHYZ/+la/QQEPGoz3yW/OfMO7mx5Kp6ch46OdFXig5eiTJuzZOZejlthYoOVnRJ2JCHsO/n7r1J847LZ0Hz1kXbYRyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885433; c=relaxed/simple;
	bh=foqDBixIvPTPQ1/eIWD89OlWFgS7dcjdjuRIgqIWgrA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bG0U9YjyVFsPbj4Q0uEQa8TJ2/Lbr2XGavIgzFj4lPfeDm+3VM6svmdNVBhj8betNwNP/BzTaRsZq0GFguBroUzGFI/GrMpTz4bR9Mss9MyMh3TpTV0j/s2pIwuz03wGPLPQ6Ijsjb+8NUu1hroKiGgeao4WLyKEhg8rl81ikdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QDcUM42I; arc=fail smtp.client-ip=40.107.220.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QDcUM42I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DT6rbDakwMD02TsftMdCQGMJaPTbvuOLnzuSECWkWUGv4OXVpfAY/ClcJmPSF9n3JqkewwJ49rBGM1hJx5va/lJr5jgcXrw+NUFFCnWanEp4FccqxULl6kSTB/d2D8fACR1sD7V/WaoqNK0qJe5tNVcY1xGMyY4V4wSvhf3KnTlMJ0/aebvLRTOiBOS6NmfAp0e9m+yWI7pjp2ACGxPtfQ+Z9MmWqHL4XUfbwn4LiOX2OiGRFd32DI8LCc292rhfnxTFNgr0i/EmVCpaeeERMXXdpQEzNEpU3f7AQbzSnLXJwu+WKH4fN5cyI2elGTcXwwyxiGyBFKufxLWHWPWoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jkATv95C29ZNHxsH1kw6KNw6Qg0ihBg1d2BHDwJjTI=;
 b=qVihNBors0Bt6xGxG/H5oWgmY+5eGlhLXIlCBAX1rjGMsTUPu4VRHiK4Vtr87UzPHY7NeZvGLahXQB2mJBfFqigUMY2ZdxPoUzGtmusyXWweEhgMYjiqkUyzl7/Onji/zmo9GDsHMQ2UFpv3r6mXWzJpJBAFSgWiKkSSimJgisqdtWHHjPGamGMSHe4g0HiUeKp//FqbO8axk5CoTiq/PiqGKfeEnq/FrTqY5Lad6t/j9kmlYDukWPT8gWPP5rl53MFXhNCH0EXqPIavuwWLIUM7uarCEDWxXEMpQpUmtrLvwSlsrCVIM2KAjhhJFDOhThXvnjrr8kntbNhxRw/8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jkATv95C29ZNHxsH1kw6KNw6Qg0ihBg1d2BHDwJjTI=;
 b=QDcUM42IrrS3d5QHbEikI/2JhePIL/6HEnTLzm9JtG5bJO8De0DWUk/yPGiDt/HBGibPtpDnGkq09U1jvhTIRdCeaU07Xp8x5aG5/pbW1oa1O4gP9lEhYWBauYaLOKPUh/lZviObIdX179+GDz7RRFKqZMYB+byCCnd6QmMGaHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 10:50:29 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 10:50:29 +0000
Message-ID: <52bbb308-f4d3-4b31-a683-49fcc0594f5c@amd.com>
Date: Mon, 7 Jul 2025 16:20:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Use guard mutex to synchronize
 probe
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250625100216.1462594-1-suma.hegde@amd.com>
 <ada3eca0-4c86-c3ee-816c-a3635b4ad110@linux.intel.com>
 <4fc05197-688a-454f-aadb-7a297db7a594@kernel.org>
 <afa69b1c-b992-4897-8bac-5b6f4b77a27e@amd.com>
 <50c8002b-cfee-8d2d-a7d4-cfde81ccafe7@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <50c8002b-cfee-8d2d-a7d4-cfde81ccafe7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::15) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a00e991-5b29-4990-ae5e-08ddbd4416e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjZ0dTZkTVBESjlBN0NNVTBXWjhvMHFwWDAyUU9CcnRYZGFSNmhqMDgyTVpN?=
 =?utf-8?B?ZnV2NERsdkJjYTR6QnQzMnUvRVZBNTY3YVJLb0tuTjM3NWR0UHk1STB1a29U?=
 =?utf-8?B?Ty9DQ25hcXVTREZ5ZVpZOGw2KzhyY1J3UnlvZ1d5WElLUkNBaDdyczhmT2pM?=
 =?utf-8?B?YkJYTUxIV0dSY3hidVVhYVZBL3hIUUNNNGU0VXJzTzVSeVBIQjZBMHAyb09H?=
 =?utf-8?B?RU00UTlNUk1UOGZZRzBaN2tWRzJheGZXemZ6bU9PeG81WEU3by9UU1h2a0hj?=
 =?utf-8?B?R3J2d3U4TTdLUUxDWXkwWmoxQ2hRZktDL3NyZlZ1bFY2SVl4M095azluL0xo?=
 =?utf-8?B?L3NGNSt5NmRzZ3lTWTY5S29hNTMxWUJkT1ZkMHVpbGEwL0IwbHBZN0RBMTZP?=
 =?utf-8?B?K3A1V3YvUmpsNjJxdzVXY2c3MWExOSttZlZZOXoybHFCeWk2VHhTd0I5c0o0?=
 =?utf-8?B?MkM3c2Q3UVFYMnJzY1FIMlU2NjhDSmdKVmU2RlZSQkNZTlFjc0x5V1pGN0M1?=
 =?utf-8?B?SmNCTDBKRzlaMlVKbFlTU0xSVGI5bkpMVnpuOTBFWDhxLzh0WDZhU3htYW5R?=
 =?utf-8?B?L1RTaG5vcEU0dG82RCtlMXNuUjlsYVhWcU8xS3NVY2dKSVNlWTU1Y2lETUlB?=
 =?utf-8?B?UmhKandDYmtFdXg1b2JjNFB5dGtCRzBtVi9RMms3YzExOXJZYm5xS2lFSEw5?=
 =?utf-8?B?a2loS2lWTURYWFhyODIzNjZHZExZUUdIQWpiY0p3K0RCMlA2Wi9SNlVUNnJ4?=
 =?utf-8?B?SUs2Y1RXNzd0V1dMeEhBK0xQbVFyaGh1THplMTF6N2tDNEZJMG1QODdranhr?=
 =?utf-8?B?M3ZJS2N4SFdBaWZJR3ducVpJQ2oycWcvQ1c4ZDhtUWJkTDdvRmMrRWlFVkNm?=
 =?utf-8?B?cVczS3JYaU1VSWNxWXNEdnJ2N1N2NVkrckFwVkZhSXU3Y2xYTVpWcytwVm5V?=
 =?utf-8?B?SXF6eUtPZGNnbXhNY1RWNFpNQzdGYy9vcjJYYTM0cUFZSzNMR0FWR29jRzI5?=
 =?utf-8?B?UXhHSGE1OVhDL3VnbVFiY0JOemE4UE1lSTFUam0xUFpONGhqOWkzWVVvOTBl?=
 =?utf-8?B?dUtKeTN4WXB2Q2o1TE9MY2VYT0lBVUFIeThvRzdTNEFsNVlBdVlVeVF6Qng0?=
 =?utf-8?B?dFl2dk12Yzd2cG5UU09sNk9GTnArTUdpeWhMdktCOTl4ZlNnWFhDTkluV2Nz?=
 =?utf-8?B?UlJvZ2phVjVXZUp0c01ORHNPOXQ1Vys5NXRUdzBwT3lUZVEzMHV1K0lpek9l?=
 =?utf-8?B?Q2NOVDAzQk9VNWJ3dDQ5UXlQSTdITlh6YTNVTENKUFRqcCtNY2EyR1RZd0hz?=
 =?utf-8?B?MC93R011dDV2T0NGZjlBUnhBNUg0dHQyNHRQczZJeUZKMFozRnRkU1F5NDEx?=
 =?utf-8?B?TzNiKzhNeXFrMTlzdGdVVXpDTXRZZm9oMUQzaEJmaFhSL1lGTElrTXlPbDk3?=
 =?utf-8?B?ZUlmU2FBQVArZDg5UFFxbWI3eGVISVJIdEtGeVQ3ejFjNDBiTHNBRkVMUHFp?=
 =?utf-8?B?MTNTeDcyR3Zxem5BNDlUdE9rSGhqWUpmV0Q3YlYwYkRJTnBLYytzZnprMXFQ?=
 =?utf-8?B?VVFXUHB5Z25RTEFNR0lscTlNV0RNUEdWY29sMWxJNjIxdktJdlh6eHVrNEVV?=
 =?utf-8?B?ajhwMzFpWHN3Yk9nNmtYdy9abUl5SU5VUlMvVXhoTVBQVG5HeFQ0Z1pMV3FN?=
 =?utf-8?B?ci8xbzc1bWs5RU1jMm5tazBFTnJ3aWxoWXB4dWhpUjdnaW85Y3FucTJ2WFVF?=
 =?utf-8?B?RWlUSnpyRzRyVlluTXZ1ckFEVXJ2aW1GUXovdjVrSWdCTTdHeWJVQ2h2ZnBv?=
 =?utf-8?B?aWE5Yk5iWDFoNUx1WE1nbXlob2hBYnhWTkpCVHdQc1JnYW1KQ3NiTDRJeit3?=
 =?utf-8?B?S0NsT1p2Z3VRNTJYLy95UmFRNXFwZW1HZEJJb1pLTGdYajZoK2pCazM5dk1n?=
 =?utf-8?Q?nvrsdjNiquM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTQ0U2pMZGFnbEZrazF6VE5MdTd6MThySFFqUzd2K1dLcWV1Z0hpUVBQcDNU?=
 =?utf-8?B?ZlNGVFR1RWszeitSbHZMZklucUxVdndTU2lZSG5kT3JVaWRYQS9jNFpkMHZx?=
 =?utf-8?B?dHNhY3c1cDMyRlljVFg1YXZUbFBRY05uWWJlRllMUUtGM09JQWxwTUE4OU8v?=
 =?utf-8?B?b2MxaU9ENmYrYTRSeExyVXJtZTFROGxyc3ZobUNKMWpMbE1RVnpEUk5vaEYr?=
 =?utf-8?B?RHcyVDl5TG1pVHE0VUpRL2hmQjl1bjUwTUNSYVhlMDVndk5OcTBoNGluY3lo?=
 =?utf-8?B?aGlOMjBjeDJOK2ZMUWFHRzVrY0ZFbDU2RlBoYkRDaE1mc3dIRVdWTE9udkkw?=
 =?utf-8?B?Y1N4OWpOTjBjYjRXZnJHOFI5MktjTGE2a0tqWkdGSzBoQm9lUXBIYlArbTdy?=
 =?utf-8?B?dVVPdENNT1JQTUN2TjkwVTJZOStaelI0WmIyeTUrL3VnblU1cUdUYmUxMzFw?=
 =?utf-8?B?V3pFWk1MTU5EUldpR21rbE5KSERNT2hndTFDS3ptVy91VmN2SUFnVHA4WVNU?=
 =?utf-8?B?U2sxQVRiUkhobnpRWU5UL0xvQjhaSkJQa0toQUROYlJGR1pVakpic0dGdnBu?=
 =?utf-8?B?WTlMaW5VRFZlNndWWDNYMHVPZmxKZ01VR1Vwa2hUYlNobXNDVFBKVWRnT2RH?=
 =?utf-8?B?czhtZGxOY1krLzQ2MDdCUzlRdER4UnlhYUhFRTBvbDd0UmNyUmdNVmY0LzJl?=
 =?utf-8?B?ckU2M3lzaURwRURkLzNaUmN0WFMxTE4vODdTcmFRbFpHYmJXNExadG9XN3Nx?=
 =?utf-8?B?NmM5YWhFSFN4bEh4UWRNUEl5YmN6N3VkeHRwMkdKSEU2K21UcmdLTlBsanhY?=
 =?utf-8?B?M0ptdlpaWGt5VVpNV1Zjc1F2TnBaK21HYlhkcnJlQUxsRjF2OHdqZlVjSVlq?=
 =?utf-8?B?M1hBVytZYVBtdFdPRDJyc1VuSXdmOXQ2S1d0R3Nyd2swbW1Qc0MrdzV4Zjd5?=
 =?utf-8?B?bWxxWnJCRkF0WjkxaktOK2dySzdzOWJYSkNFTzJMVHQyRU4wTGphMmpTZVNs?=
 =?utf-8?B?OHFqbDhaTmVib040WW96dUF1QzVLTXZGekEvMm92bHA2OFBOcDZZcStxNkRs?=
 =?utf-8?B?aEdySkhGaU5rU000N3lZelphTmtsczUvQzlzT0ZRY1hlUk54b0tGdE5PRkJV?=
 =?utf-8?B?aE9ESEp0RFZDTkloU2FVNkQ3dHRrakFIYmFOdUZOS2JRUjlhRHlidHk3VFZz?=
 =?utf-8?B?L09vZUVPOGtYZGM1UzFoKzgvbW5XblVHSTMxT3NuMEpCOWw4QUs5Y3Z1QjRa?=
 =?utf-8?B?UnpCbmlNYTJHa1V0T1FmUUp1bjRzVVl4cGRXNWp5bStBeEtGRURWOUZLSDgv?=
 =?utf-8?B?RUc0ZlkxYXRlLzZ1VnhVWWhWV3prQlpkQ0Vob3RKR3A1WkhJS3FJeE8vSlRZ?=
 =?utf-8?B?SGJvWTgvc1p3S3VJWktVVGszeWJ2andFUitYZnF2cjRNcjRra2NXVnBYY0hl?=
 =?utf-8?B?UU5pRXpVWFZBN3JzaXhMSlVCekovNFJvSkdwZFp4M3I4LzFXcSswUEp2U2RR?=
 =?utf-8?B?WDdLTUxVT3dLVFErNkdGYXY0MGRoVDF1U1g4UHJnSlNIZ3BrcElDUDZWY0xG?=
 =?utf-8?B?SE9PcVBuMzZYbUJFOVpWSkh4OHFvOGtvRzFHVGowTW1SL1NFaytBb291VGE1?=
 =?utf-8?B?Y2hndlo5dTRkU3poMzRDd0lGQUpYNm0xRXJmbVFDT2RyVi82Ym9GdXVTRW1O?=
 =?utf-8?B?TlNyY2tId0xlVDdCbm93ai9QOHh0ajJqNVNkdE1yakp3WXRWTDdNNXdxSkMx?=
 =?utf-8?B?eVhLRDNhdERuNTE1NW04VjZtVlMrV0N6clptS2JNVXQxeE9OUnZqL25hdVU1?=
 =?utf-8?B?VXBRdzRwZ2NQV3Z4Q2REeHhCaUhyRHlUMmIwTmljaE1YQjBUb3dXTTUyeE9i?=
 =?utf-8?B?UW5IMHNVQWlzWFZtK2dtd3VpYm82Slp4WmxsMk5hdGZ1YmtoeGw4OTlmSitL?=
 =?utf-8?B?T0VhZ3g0bDBiWElKYlhlOFlKeEhqbDZzUXBBcmxSSVF3aFEreWJJcFdvSUw4?=
 =?utf-8?B?ZC9haVBHdzVsZDJYa2hscUdYZEZJZytTeE9XT0swL3NxU0ZOd1BTRCtEcTNI?=
 =?utf-8?B?T3dtUVZ2dHdidE5DRWlWTUExbjNzd3pvK3lCYUl3Ky9RQ0xqZ3NaTmdEa3Rw?=
 =?utf-8?Q?7128KxNHLdoGe4uAyWtjC65jv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a00e991-5b29-4990-ae5e-08ddbd4416e1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 10:50:29.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZnsJIly+Jwb1dmN0ZEuNBJu2dg/ghufSF9u0Ic+zuHFCaKr3T37Zo4jUzp2gGtbj90fM6s/w9b3qy3f8ZscsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488

Hi Ilpo,


On 6/27/2025 1:25 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Fri, 27 Jun 2025, Suma Hegde wrote:
>
>> Hi Ilpo and Hans,
>>
>>
>> Thank you for the review.
>>
>>
>> On 6/27/2025 12:23 AM, Hans de Goede wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> Hi,
>>>
>>> On 26-Jun-25 18:31, Ilpo Järvinen wrote:
>>>> On Wed, 25 Jun 2025, Suma Hegde wrote:
>>>>
>>>> In the shortlog, drop word "guard". This should also mention ACPI as the
>>>> legacy probe is not affected.
>>
>> Sure, will drop the guard and will mention ACPI.
>>
>>>>> When async probing is used, 2 hsmp_acpi_probe() calls can race and
>>>>> make a mess of things.
>>>> Too vague wording.
>> I will revise the commit message to enhance clarity.
>>
>>>>> So, add guard mutex to synchronize them.
>>>>>
>>>>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>>>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>>>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>>>> ---
>>>>>    drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
>>>>>    1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c
>>>>> b/drivers/platform/x86/amd/hsmp/acpi.c
>>>>> index 2f1faa82d13e..ab2b65f16d1d 100644
>>>>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>>>>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>>>>> @@ -15,11 +15,13 @@
>>>>>    #include <linux/array_size.h>
>>>>>    #include <linux/bits.h>
>>>>>    #include <linux/bitfield.h>
>>>>> +#include <linux/cleanup.h>
>>>>>    #include <linux/device.h>
>>>>>    #include <linux/dev_printk.h>
>>>>>    #include <linux/ioport.h>
>>>>>    #include <linux/kstrtox.h>
>>>>>    #include <linux/module.h>
>>>>> +#include <linux/mutex.h>
>>>>>    #include <linux/platform_device.h>
>>>>>    #include <linux/sysfs.h>
>>>>>    #include <linux/uuid.h>
>>>>> @@ -44,6 +46,8 @@ struct hsmp_sys_attr {
>>>>>        u32 msg_id;
>>>>>    };
>>>>>
>>>>> +static DEFINE_MUTEX(hsmp_lock);
>>>>> +
>>>>>    static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>>>>                              u32 *value, bool write)
>>>>>    {
>>>>> @@ -585,6 +589,8 @@ static int hsmp_acpi_probe(struct platform_device
>>>>> *pdev)
>>>>>        if (!hsmp_pdev)
>>>>>                return -ENOMEM;
>>>>>
>>>>> +    guard(mutex)(&hsmp_lock);
>>>>> +
>>>>>        if (!hsmp_pdev->is_probed) {
>>>>>                hsmp_pdev->num_sockets = amd_num_nodes();
>>>>>                if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets
>>>>>> MAX_AMD_NUM_NODES)
>>>> So is it just the ->sock alloc and misc dev registration that require
>>>> protection? (The latter doesn't even seem to require that if a local
>>>> variable carries that information over.)
>> Yes, the rest of the code, aside from the remove function mentioned below by
>> Hans, doesn't require protection as it uses local variables.
>>
>> Additionally, we have a semaphore in place to protect the other critical
>> section.
>>
>>> Another review note:
>>>
>>> hsmp_pdev->is_probed is also used in remove() so that needs a
>>> guard(mutex)(&hsmp_lock); too.
>> This was overlooked. I'll make sure to add it.
> Hmm... I was going to suggest replacing ->is_probed with
> devm_add_action_or_reset() but then started to think probe/remove
> ordering between different pdevs.
>
> Is there anything that guarantees ->sock isn't teared down too early, that
> is, pdev that did the allocation should be removed last to not prematurely
> free ->sock?
Currently, there is no assurance that the pdev responsible for the 
allocation will be the last one removed.

Should I implement reference counting to address this? The reference 
count could be initialized to num_sockets and incremented in probe and

decremented with each removal, freeing the "sock" when the count reaches 
zero. Socket allocation will be performed using kmalloc instead of 
devm_alloc.

> --
>   i.

Thanks and Regards,

Suma

