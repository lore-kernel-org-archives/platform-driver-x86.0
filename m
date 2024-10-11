Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9311946A8
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Oct 2024 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659893; cv=fail; b=tVBalHPh1o1SHgisPt0tsTwtQOFy8wW6P6YvLNprLT6BagkicqNucjAZaPlVujzUtYPcSfIsiDVGCgx4WvJeQJmgISDKu6TM2npId9c5akVRRO/LqMnZHNFeCZbhsnv0w3SVZw7wmycZsD4G8l0zjj6ygYNnWbZevFB+IX6eV0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659893; c=relaxed/simple;
	bh=7QxU4IA1k3qj2VNI4j9VfatE339T3MMsF6LOzjgrqmM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sgeGYiBZ7gTTBp80f3jJsU5HcmNntYJhVBGwwkMq0WlViD/Q10sMa+g2ggiwYodTMBOvwRGER0Jq5hyJUdTOUzWLZshKlUB+YZqyqbhyRx127xs2vXKgVSTrgbHfGGN08voqWBpmFt3eGXKElzhcPxMqeQ6yWqQElso08xELFQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ds+/YTVk; arc=fail smtp.client-ip=40.107.223.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ds+/YTVk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+zdmW3NCDLhr/S/XxbVIyYR905XAH7fhFmz7sQdZJAVXdhF5f5Nt1JvPLPd+bq0UhslwZkLm6i9EfRMDfgu68gzUXKgwUuwxGk3EbBA22LRhClRYb/UrqJV0nSbyaLfgaw36CFSqE8DgiYyttBQuRPds3KLrgdvF9A74ZinTEnOP0BL61fkQlDYkXbg6Qgyf2GtHz7h0VK8uYPVO0snvX0mmL2LxVWyqsSn6j7pXeDWHMsBdQ5bF74gEMCjJOhTm6GpZY5iwZ4Grz0Qcv0BADOsWanfISuGKkmYMOGerOwzleSSIIrne41M3Y1MasjusFTkGLF1QU6tvUlKpxg9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X/bbVOR8TQFpIryYCB+Wv9giEKJGe3WwC+0BJeeP+U=;
 b=Z1XL8ovjY4XwtsO3WT056Cxwl6IbzMJ8hedRVm733Ey97UKDPKEPIGJVS9fwPAKVeJANyISXOCj5aY0iBu4eBVlVzJ593zQQ6MmX2yRKRRiamnRcooEffyg6Bs9PORBXLWH1cb2RBnSiEcRuhfMSF4q7Ri8GHcKJmLxVVKDGybHtBPDDDehueztEwvXiRvIoP6BfS+mwhjit8fu516Q3wGj8Hqr3in9sfLpo/+iyp2FEMR+AZJ81O/VKgyF/oJq9LgYc9cXjE5aG7b2cXET1vCG/XHCDq1ZogOLGMaiDa15PiiZq2Je3M5RM/p7SbyNb/rM2v8zHluryu+D2f0WxaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X/bbVOR8TQFpIryYCB+Wv9giEKJGe3WwC+0BJeeP+U=;
 b=Ds+/YTVkVntU9UilF1OAwrIr1XHr9r7IsePWgQJ/iNFxXDY+scH9vnLosbuTZ3qoapDTylg02Ad53q6diOQqnpiyF2C6pfXw7ln786ucorGFpa+IgZiCcjr7hrhPt7qM3CFdPWMrSAaI/Uzy5c4thk23L+Ao4ziL6AM0iDfMe5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5033.namprd12.prod.outlook.com (2603:10b6:408:132::14)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 15:18:08 +0000
Received: from BN9PR12MB5033.namprd12.prod.outlook.com
 ([fe80::deef:fa00:d7d4:5069]) by BN9PR12MB5033.namprd12.prod.outlook.com
 ([fe80::deef:fa00:d7d4:5069%5]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 15:18:05 +0000
Message-ID: <09977bcd-3040-093a-c058-10c574f3a27a@amd.com>
Date: Fri, 11 Oct 2024 20:47:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache
 optimizer driver
To: Armin Wolf <W_Armin@gmx.de>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
 <20241010094252.3892406-2-Basavaraj.Natikar@amd.com>
 <4bb99ff4-6c05-4087-9915-3420c36b15f2@gmx.de>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <4bb99ff4-6c05-4087-9915-3420c36b15f2@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0039.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::13) To BN9PR12MB5033.namprd12.prod.outlook.com
 (2603:10b6:408:132::14)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5033:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f084fc5-9184-4456-c7d2-08dcea07e77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VllhRGtabDJLU0xZN2FmWUswWU5oSGFPNG9FVm9vWFQ4SWorWFA2ZUpjeHYv?=
 =?utf-8?B?LzBlMXFIVVBJbUQ3ME1ycy9saGFjNVk2L0tnaTVMS2lSeEQzRytsTVU5YUlk?=
 =?utf-8?B?eVkzRWxsaWJwbFhXOVBKVFRrMG16OVF5R0doODdxa3lOOWhITkthTVYzMmVL?=
 =?utf-8?B?ZlpadE5SV1FZNGNxN05UY2dMQVFnVDU0VjlUZjZrY080d3AxWTBjZG9BZEYx?=
 =?utf-8?B?K1A1ZGp2eVhmWmtVenNxZXkyeDVFN0xXOFZjQU1sOHZBU04rWE4rM2xRQ24x?=
 =?utf-8?B?cWkxdUlBM1dGWWlmV2RGTXZUU2tHeDNDakdXM2kxaGRjdXY0bXJGanZXRlRG?=
 =?utf-8?B?dDAyNkZMQUpRUXNsVUhzYnRoREJxYWNpUktXK2tSK3Y5emNyQTJJSGY5MWRh?=
 =?utf-8?B?MFhSekNPa2t4dmlFT3JkZkVvVkxtWUpLSWs5dDZhODdwSk1HQUI2MHJjdjhu?=
 =?utf-8?B?d3luSU9ZVFJzS21KcmdPYkFmWTREMjN2NVU1TVFxZExFdUgrbG55Qm1KeHpi?=
 =?utf-8?B?R0RBNVA5bzNlWUtSN1NCbkNVelArZk5xT0ZOWlUvaTdMaHRHMHU4TEZOOTA4?=
 =?utf-8?B?ZG5WTlB2M2ZDM2lXMFdmVlZjUDlLQlludGdVbmV2cG1UZ1BNNjF5WEJvLy9L?=
 =?utf-8?B?QWdhdWJRVG4vT3Q1Ti9obTZzVjkycUgzU1BzclhoNDYwQnRTS2NLTE14Q0M0?=
 =?utf-8?B?cW1VVnVwTnBabE5zSGZFQytPYm8zZ3pjSmpFbXpFTmxjMktsWXN2UnloOGp5?=
 =?utf-8?B?MWtVdHZEQkxpbVBpZE14b3FaWnlRRnhMT2I4REtpNzIyL045SFhjbFpHME02?=
 =?utf-8?B?WndNS2JGT2t3dGJhWEZIRmx5MUxZMUw4VVBNU25MQm95dENUb1ZCdnN1Mm9z?=
 =?utf-8?B?N3RJT25nNmFSbXd3MmJ3Uk54YVFaNVJiK1duYXpxYzVMajVGTmhXbGJQcGtn?=
 =?utf-8?B?Z0FaOEZwYVc0RDVHVzFUdzVMcGhOY2h0aE5SSEQzYjhSdkVHTSswbkZYUTcv?=
 =?utf-8?B?U0gvdlliQmJyUmtySjBmeEZtSUYxUFBIdFVNdWZ1dnBhL3pUaDVNaVQwTDJX?=
 =?utf-8?B?R3ZkTzJLSWlUQkdyczdjaU41Z2d4VmM4a3dUTXVLZmhNdk9RZ2Y5OWRlMHJ1?=
 =?utf-8?B?djBZNU13ZWwwbldaQnZDRm9Jd0h3dCtLUy83VTR2a21pYmkySnQyNlFYUVdq?=
 =?utf-8?B?akNxeldZL1ZIOFRCU2xSb0ZKcTdXYlBGWE9UaFBjR1Q1T2Exb2Q0SzBNRlQy?=
 =?utf-8?B?eWJDOU5XckRwSmVDNGltQ09oYlUra1NGcXFwK0RZTlVyTFZaVFRaS1ltTEVK?=
 =?utf-8?B?TkllNWlIUVpZcForTGRnMkRIOGpOVHFOYnBXdldueC8yRldNZmMyMDJscVVv?=
 =?utf-8?B?eW1qTkdrUUtKbGh6WE5JVHJlQmtGR3FMazNFcFRhVDFGZmhqK3ZOems1bitv?=
 =?utf-8?B?T1FGWklWK1JNWm1yN0xscnc0RUQ5cFZMNHpOQW80ckM5TjM1dE9tbFFVNnNI?=
 =?utf-8?B?MUJuSzBWRlJjNkJ0TFo5MHdhdUNscERoTmFlZG55U2RQemI1ZGg0QzY3QkFt?=
 =?utf-8?B?Z0srQngzSEVuMlNNZllYcTFOU1UzRzVGZEJYcExiRkxEYS9XbmFzWkhZdnBB?=
 =?utf-8?B?WTltNW8yNGx6dW4vdWpUYzdDQlJKTkdwWjhaemxyWjVqZlI4UTlZdFdJM3B3?=
 =?utf-8?B?NVBFUEpqOE9qVndsL2pBNVVPM2JsUzkzQnNnWGxteVJrVzhFdktxMFFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5033.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTMxWU9GV01FOGpwS2RIWXBCZHl3ZnNRYlNvWmNqVXUvNzVRelllTFVZa0hL?=
 =?utf-8?B?SDMrZG55NHNZNU04L0FVSjVHR2FwL1BWdjE3VldZRE9nbnNXNmxzVXRTb3d1?=
 =?utf-8?B?c0Y4RUFXbENzQ0QwOG8yZVVuZlFPRnF3bzBhVDdHR3UzcWYzQXJ3OGtrM0Nv?=
 =?utf-8?B?Z1Z0MGFkVTNrM0Qya25PRXlSUUxUTnlUU2J3dlFnMS9vK29aSDZuMU1XQXlT?=
 =?utf-8?B?SElIU2E4NnhpVTRvWWhGcFVOZHV5QlJhQzdPSUQ4ZFpWMkI1TkZEb3FFb0RS?=
 =?utf-8?B?M1hZUno4WHhZakRwMGxkbm9aQXFrWW9GWFVsS0lEUmFXMXR5UGhwcVB6YTE3?=
 =?utf-8?B?WXZnMjhDOXRKK1Vhb2NWblVaMk9Cd3J5bXFreVU2dHI5ekxRaDNBQWlOL2lF?=
 =?utf-8?B?bGZ3aVoyYjlqYlprcW9HcmVUUjB4ait5M2FpdGVHK2pHVTFYZWRPNFpJZ01T?=
 =?utf-8?B?UElKcW9uREZpaHJaMkVoaDB4c1JuUHFCdGIxQmRpMG1qR1hWbTM5blk3NnZ4?=
 =?utf-8?B?aWtrMDduUHY2eDNIdGJoODhZcXdra2VUWUF2dDlUNStoWFhpSFRpVzZ5Nmo0?=
 =?utf-8?B?REM5WUdnZHBqbnZOeVhtS0FYbEFhbFBNdWRnem42UXpCOFk0aE9ETVNZZk1u?=
 =?utf-8?B?Y2dkQmQvOXVqSmhiSkJsU3g3ZTQxOHpqL3pncFVlZlh2Vk9mQUdMVVh5Ymxo?=
 =?utf-8?B?bzVqK2lBbENRcmFJMzRHVWpaNnBsUkdUNXlkY0xmUTdjUmhzbkN6bzQwZWNR?=
 =?utf-8?B?VW1jdVByTWVHZkJNcE44RC9xczdrUGxkcTlRT3I1bDVxV0FIaEU1NDk4bjNI?=
 =?utf-8?B?aHZXMlloWDNjMXNGaEdlWE01TlpkY3E0RWMvQTk0MkVQZGhHWFl5eWZBbmll?=
 =?utf-8?B?dTBMTUZyWWVBMDR1QUFsMzVUTGdMTHNiTUxKUVNWMTVuMlBNUzFGUDBIVE1k?=
 =?utf-8?B?b0UvUmhCeGg1RXFRUHF4NnBxY2ZhVDdHVjYzWFZlZWlabnZZdVFIeEhGTExE?=
 =?utf-8?B?cTVoYXRjcHpIeVpmbDFiQVN0WnVSSEY4bzZLSzhqS09wVEVQY2xOTHQ4U1lx?=
 =?utf-8?B?Q3M5RktLU3BRTmluV29kaWkzNElVTFIwUWd1U29tc052SXpNQlV4aEx1WDZC?=
 =?utf-8?B?ZkxVNVEwNkhCT1ljZmRHM0V3YkRkcis0MTdsT01PZmlWZ1pxQzJpQ0lFa2dr?=
 =?utf-8?B?SjVvT001OHg1eG5qLzFNQWNZWmFEN21hQldqU0gvMVRlNU03WjhQR0pyVitR?=
 =?utf-8?B?R2drZkc4eHFpc3pzZzY4eHBUczcxd3U3WnFxV1dWbTJoMXlkMHFKY0ZiMHVa?=
 =?utf-8?B?OXRrb2hiNjBhY3c3bzVvblpiZ1VuRk90VWZOTVY3ZmtQMHdnWnJ2Z0pYMUZX?=
 =?utf-8?B?V3VmSVl0cVlmeVZxUG5RcUkzdDBCbUQzOE1IYm9pbjgrcUNqWEpqdVR6dGJD?=
 =?utf-8?B?M29vQ2ptZDlkY3dSeWJ6SDBNb25VcGZwSGlJdUIyQWI0c2dKbGdBejJhU1pj?=
 =?utf-8?B?amk1SFZvVEpneGZnOVdKQkozb0VNTjZmd0RUY1IzTGRnY3VMNE5HOUM2NU1n?=
 =?utf-8?B?MjdhNXJZdVlJQmNqb2RmYXMrNzBCVzVXRE53SndTVFNwQ2o0d1RHWlJ3Q2tu?=
 =?utf-8?B?TUUvcStXUGlsaklzV2hkU1NnRnB1YzZQaFFZaWsvbUdxZ21TUUJNTGpyWjNS?=
 =?utf-8?B?OTB1TnQ2a0VjT01OWUVQZDAwemQySVFhem1CdUNkQWRkR1Naa2tlTWxyTm10?=
 =?utf-8?B?RzJGc2E1djNvR29wWm1nb3JpdEdBVDNJNlZpbUlxNVBucEp6SHd1dEpHSHdv?=
 =?utf-8?B?bWFNRUZRVmplWHoxK1RBUDZKT1R0Y3gzN0RQQ25jalYyN3RDNXQ0dURNYmlY?=
 =?utf-8?B?Yy9GckpiRjF3UEtwaW01cXVPRURQcWFVQ2x3YlJoU1pwTWpCeHFMNHpsdEJx?=
 =?utf-8?B?TGZNL05IMTZjQURXYUlwNlF2RzVUTHlhWEJjZnY3TklWSVFyZlRNT1ZHVUQx?=
 =?utf-8?B?b0kyenA0MWl1RWdyRzAzU3BhWWZoTlViMkpYd040NlJXUWZSb3J5QVQvR21W?=
 =?utf-8?B?YjVMSmV3VjRSR3ROYW84NllpM3duN056MVd5ZVpDdjVQd2xIK3ZweHVzZk5Q?=
 =?utf-8?Q?69JF+Vxvo0KYS2UEWA8ENdgwU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f084fc5-9184-4456-c7d2-08dcea07e77a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5033.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:18:05.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVM1UGpHax2F1G7ebS+kx3muJtmraTAbqRxGgZBwROgc4tSQVt2Yzplh7t5jV6hrGxzJ8odXJhwLT2a3llIh+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838


On 10/11/2024 4:51 PM, Armin Wolf wrote:
> Am 10.10.24 um 11:42 schrieb Basavaraj Natikar:
>
>> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
>> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
>> switching between Frequency and Cache modes. To optimize performance,
>> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
>>
>> Frequency mode: cores within the faster CCD are prioritized before
>> those in the slower CCD.
>>
>> Cache mode: cores within the larger L3 CCD are prioritized before
>> those in the smaller L3 CCD.
>>
>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   MAINTAINERS                           |   7 +
>>   drivers/platform/x86/amd/Kconfig      |  12 ++
>>   drivers/platform/x86/amd/Makefile     |   2 +
>>   drivers/platform/x86/amd/x3d_vcache.c | 193 ++++++++++++++++++++++++++
>>   4 files changed, 214 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a097afd76ded..61cb6a294f4c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -972,6 +972,13 @@ Q: 
>> https://patchwork.kernel.org/project/linux-rdma/list/
>>   F:    drivers/infiniband/hw/efa/
>>   F:    include/uapi/rdma/efa-abi.h
>>
>> +AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
>> +M:    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> +R:    Mario Limonciello <mario.limonciello@amd.com>
>> +L:    platform-driver-x86@vger.kernel.org
>> +S:    Supported
>> +F:    drivers/platform/x86/amd/x3d_vcache.c
>> +
>>   AMD ADDRESS TRANSLATION LIBRARY (ATL)
>>   M:    Yazen Ghannam <Yazen.Ghannam@amd.com>
>>   L:    linux-edac@vger.kernel.org
>> diff --git a/drivers/platform/x86/amd/Kconfig 
>> b/drivers/platform/x86/amd/Kconfig
>> index f88682d36447..d73f691020d0 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -6,6 +6,18 @@
>>   source "drivers/platform/x86/amd/pmf/Kconfig"
>>   source "drivers/platform/x86/amd/pmc/Kconfig"
>>
>> +config AMD_3D_VCACHE
>> +    tristate "AMD 3D V-Cache Performance Optimizer Driver"
>> +    depends on X86_64 && ACPI
>> +    help
>> +      The driver provides a sysfs interface, enabling the setting of 
>> a bias
>> +      that alters CPU core reordering. This bias prefers cores with 
>> higher
>> +      frequencies or larger L3 caches on processors supporting AMD 
>> 3D V-Cache
>> +      technology.
>> +
>> +      If you choose to compile this driver as a module the module 
>> will be
>> +      called amd_3d_vcache.
>> +
>>   config AMD_HSMP
>>       tristate "AMD HSMP Driver"
>>       depends on AMD_NB && X86_64 && ACPI
>> diff --git a/drivers/platform/x86/amd/Makefile 
>> b/drivers/platform/x86/amd/Makefile
>> index dcec0a46f8af..16e4cce02242 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -4,6 +4,8 @@
>>   # AMD x86 Platform-Specific Drivers
>>   #
>>
>> +obj-$(CONFIG_AMD_3D_VCACHE)     += amd_3d_vcache.o
>> +amd_3d_vcache-objs              := x3d_vcache.o
>>   obj-$(CONFIG_AMD_PMC)        += pmc/
>>   amd_hsmp-y            := hsmp.o
>>   obj-$(CONFIG_AMD_HSMP)        += amd_hsmp.o
>> diff --git a/drivers/platform/x86/amd/x3d_vcache.c 
>> b/drivers/platform/x86/amd/x3d_vcache.c
>> new file mode 100644
>> index 000000000000..679613d02b9a
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/x3d_vcache.c
>> @@ -0,0 +1,193 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD 3D V-Cache Performance Optimizer Driver
>> + *
>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> + *          Perry Yuan <perry.yuan@amd.com>
>> + *          Mario Limonciello <mario.limonciello@amd.com>
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +
>> +static char *x3d_mode = "frequency";
>> +module_param(x3d_mode, charp, 0444);
>> +MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' 
>> (default) or 'cache'");
>> +
>> +#define DSM_REVISION_ID            0
>> +#define DSM_GET_FUNCS_SUPPORTED        0
>> +#define DSM_SET_X3D_MODE        1
>> +
>> +static guid_t x3d_guid = GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba, 
>> 0x0a,
>> +                   0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee);
>> +
>> +enum amd_x3d_mode_type {
>> +    MODE_INDEX_FREQ,
>> +    MODE_INDEX_CACHE,
>> +};
>> +
>> +static const char * const amd_x3d_mode_strings[] = {
>> +    [MODE_INDEX_FREQ] = "frequency",
>> +    [MODE_INDEX_CACHE] = "cache",
>> +};
>> +
>> +struct amd_x3d_dev {
>> +    struct device *dev;
>> +    acpi_handle ahandle;
>> +    /* To protect x3d mode setting */
>> +    struct mutex lock;
>> +    enum amd_x3d_mode_type curr_mode;
>> +};
>> +
>> +static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
>> +{
>> +    union acpi_object *out, argv;
>> +
>> +    guard(mutex)(&data->lock);
>> +    argv.type = ACPI_TYPE_INTEGER;
>> +    argv.integer.value = new_state;
>> +
>> +    out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, 
>> DSM_REVISION_ID, DSM_SET_X3D_MODE,
>> +                &argv);
>> +    if (!out) {
>> +        dev_err(data->dev, "failed to evaluate _DSM\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    data->curr_mode = new_state;
>> +
>> +    ACPI_FREE(out);
>
> Hi,
>
> please use kfree() instead of ACPI_FREE().
>
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t amd_x3d_mode_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                  const char *buf, size_t count)
>> +{
>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    ret = sysfs_match_string(amd_x3d_mode_strings, buf);
>> +    if (ret < 0) {
>> +        dev_err(dev, "no matching mode to set %s\n", buf);
>> +        return ret;
>> +    }
>> +
>> +    ret = amd_x3d_mode_switch(data, ret);
>> +
>> +    return ret ? ret : count;
>
> ret = amd_x3d_mode_switch(data, ret);
> if (ret < 0)
>     return ret;
>
> return count;
>
>> +}
>> +
>> +static ssize_t amd_x3d_mode_show(struct device *dev, struct 
>> device_attribute *attr, char *buf)
>> +{
>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>> +
>> +    if (data->curr_mode > MODE_INDEX_CACHE || data->curr_mode < 
>> MODE_INDEX_FREQ)
>> +        return -EINVAL;
>
> Can curr_mode ever leave this range of values?

yes it's either MODE_INDEX_CACHE or MODE_INDEX_FREQ

Thanks,
--
Basavaraj

>
>> +
>> +    return sysfs_emit(buf, "%s\n", 
>> amd_x3d_mode_strings[data->curr_mode]);
>> +}
>> +static DEVICE_ATTR_RW(amd_x3d_mode);
>> +
>> +static struct attribute *amd_x3d_attrs[] = {
>> +    &dev_attr_amd_x3d_mode.attr,
>> +    NULL
>> +};
>> +ATTRIBUTE_GROUPS(amd_x3d);
>> +
>> +static int amd_x3d_supported(struct amd_x3d_dev *data)
>> +{
>> +    union acpi_object *out;
>> +
>> +    out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID,
>> +                DSM_GET_FUNCS_SUPPORTED, NULL);
>
> Please use acpi_check_dsm().
>
>> +    if (!out) {
>> +        dev_err(data->dev, "failed to evaluate _DSM\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    if (out->type != ACPI_TYPE_BUFFER) {
>> +        dev_err(data->dev, "invalid type %d\n", out->type);
>> +        ACPI_FREE(out);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ACPI_FREE(out);
>> +    return 0;
>> +}
>> +
>> +static const struct acpi_device_id amd_x3d_acpi_ids[] = {
>> +    {"AMDI0101"},
>> +    { },
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
>> +
>> +static void amd_x3d_remove(void *context)
>> +{
>> +    struct amd_x3d_dev *data = context;
>> +
>> +    mutex_destroy(&data->lock);
>
> Please use devm_mutex_init().
>
>> +}
>> +
>> +static int amd_x3d_probe(struct platform_device *pdev)
>> +{
>> +    const struct acpi_device_id *id;
>> +    struct amd_x3d_dev *data;
>> +    acpi_handle handle;
>> +    int ret;
>> +
>> +    handle = ACPI_HANDLE(&pdev->dev);
>> +    if (!handle)
>> +        return -ENODEV;
>> +
>> +    id = acpi_match_device(amd_x3d_acpi_ids, &pdev->dev);
>> +    if (!id)
>> +        dev_err_probe(&pdev->dev, -ENODEV, "unable to match ACPI ID 
>> and data\n");
>
> The driver core already takes care of that, please remove.
>
>> +
>> +    data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    data->dev = &pdev->dev;
>> +    data->ahandle = handle;
>> +    platform_set_drvdata(pdev, data);
>> +
>> +    ret = amd_x3d_supported(data);
>> +    if (ret)
>> +        dev_err_probe(&pdev->dev, ret, "not supported on this 
>> platform\n");
>> +
>> +    ret = match_string(amd_x3d_mode_strings, 
>> ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
>> +    if (ret < 0)
>> +        return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode 
>> %s\n", x3d_mode);
>> +
>> +    mutex_init(&data->lock);
>> +
>> +    ret = amd_x3d_mode_switch(data, ret);
>> +    if (ret < 0)
>> +        return ret;
>
> You forgot to call mutex_destroy() here in case of an error. Using 
> devm_mutex_init() would solve that.
>
> Thanks,
> Armin Wolf
>
>> +
>> +    return devm_add_action_or_reset(&pdev->dev, amd_x3d_remove, data);
>> +}
>> +
>> +static struct platform_driver amd_3d_vcache_driver = {
>> +    .driver = {
>> +        .name = "amd_x3d_vcache",
>> +        .dev_groups = amd_x3d_groups,
>> +        .acpi_match_table = amd_x3d_acpi_ids,
>> +    },
>> +    .probe = amd_x3d_probe,
>> +};
>> +module_platform_driver(amd_3d_vcache_driver);
>> +
>> +MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
>> +MODULE_LICENSE("GPL");

