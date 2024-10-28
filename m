Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70071DE3D0
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 16:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134234; cv=fail; b=SSBU6IcHVHiRIbWk8wWBz6ZztX1Qk2O99WnBH6n/IfM7L+Rp303BGRlctLnwCPdqoMKJlIlCZSya7Mg4aXw5I+74Vp9dPpBexOzvReU4NPUN5zwEQLxam3cx4YK6oQC+fF2XwZUWCp8WXyVkl45FxzrerM3QYUWQiilVxQD+gqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134234; c=relaxed/simple;
	bh=07b6njtGZ/Q0N4vClDoeKhnpLMq4r5pgoX1BMMIXK2s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cSkdJiSx1+HFn3GyuufliJzntwZbH2nfKZrQp308G52jhYMI7KvpTFqLdgWG6NT7Sfd1s+mNGbYs3g4cJNy/PCA5BAyEFWAItfuJeVPhu02CTXwnyNk0b3TYmHpwLNrgc+JyG6fFDQiSoVCplCGplSivrvz3/eHkb5hGZjFPP+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EkBFxfAb; arc=fail smtp.client-ip=40.107.96.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EkBFxfAb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfVHxiyIP+q4mwT4UhhqNxLiHN3kOO1Hmx5Q2okmC29a0JMfPI9mHfDuuZYNX32ariprfXLnOQgmg3mIPgtOVBDvp5Giy3MYee5wKTC6IxV6VVlEy4t2eUWEnc+I5M8Xjr0Wi1EZsMZDhuvDEXz3cg4X1Dq+hvCkR13XCGgojfyQT55qIH2b0u+KlPeM902dW7iXtzOyDrB0sUmAKjrg1FG+W0s4/6DSv5YB5as8rpH6Q0eQ7VmehfwAJm2B8nomiLkacsP8OsuyLbobUesiMqRG7Ef+kXCNyQ/Ql1czjoAAzR8HartfgUgufePQNFyLNfGx+RETjyaBmod9Jc0rUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7sXgTzzb3LFdYQ+1gxLleXQEk4ddD1a4AHY5N4DsE4=;
 b=o1D13ZUR2NcowQyt9LYl3VUvCBKoWX0nUaLNMiX+da/65jgft0KAsNPTwH3LwjR/QKyCou9HUlLj9XnNTiyg+apK6gUdMs4u5uGNMuHKaUlBCh2vVIBXiOf3yoniL163PSX76gGyKvjqkfA0itR1Al6rcjoQ469Uyle6ev93BFVul1zlYjVg4twQw5GEBinfgf2ePw/ZRSjak3AEeP0rOw6nAtG7iNqZwz/RBV8w3cdXqmO8/3UnQD/G9A1W9Q91Li+/OWZln/+iyYJGr7X29QfSUVnT/Safmvj+DTd9KhUHi+AjDHcH9RtV7C1VbKJAJ+TRlP4vfmOiFAodStOI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7sXgTzzb3LFdYQ+1gxLleXQEk4ddD1a4AHY5N4DsE4=;
 b=EkBFxfAbAA8n9ChoFEzu3XNpAHxR1IIikABYtLcVpUE6gbXG44/bbuhm9dKt7AHZUXKTWhHfDApyePahTicgfJ0aWF34Wv+u+edDOC+wYypJ9c1ie9pvvneO+VxeUJEYd7VnFk+wnaGLYll3D4ENhxtd/jYzHf118Hd37+XIdEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 16:50:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 16:50:29 +0000
Message-ID: <a5f66d1f-c114-4428-a2f7-ab41c96993d8@amd.com>
Date: Mon, 28 Oct 2024 11:50:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform/x86/amd/pmc: Update function names to align
 with new STB file
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241028070438.1548737-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:806:20::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: 4049ea70-d573-4e67-60a2-08dcf770a116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXdXQi9oTitnSnEreWNvZS8vRWNsS1JXMi9wTVM0V0wxU2lhS21iYnV0eG5D?=
 =?utf-8?B?VlNzMW9WR1JJek1ORXF6MmZBd2FERnQrYXhMUWh0M0JSMFhDVi9mcjNvYUJz?=
 =?utf-8?B?QW1iOTVRVS9qTUloUXlLb2Q3d2ZMSlc4a0lzVkhOOStlZHgxVk1QR2ZGSTIy?=
 =?utf-8?B?NW01TFZ2UlY4dldJWEtmMXVmVjhFS1pDUGJqaUozbk5oZjFjUjJoT1RGZHF0?=
 =?utf-8?B?UG9mN1JTZGZDcHByd2U3NGJwNDZTK2lSdVc0b0hxRDVGR2ZWSjFvZ0NrUDVO?=
 =?utf-8?B?TnVGeWVBbTFMVHJEZDJ5anlMUWh4d0JOTyt1dkpGYTI4VDBUeElHNDUvYWxs?=
 =?utf-8?B?M0Q0djUzbWRLNHk3Zy9LN08yZ1c1YkZXWm96bGNPblpEZk5mNjcwS1ZBWG5K?=
 =?utf-8?B?MnVTL2w5Y0w4S09XMTVTTlIrZkx6WGwvcTZTOFBuamM5VkplYTBBc0c2dG5D?=
 =?utf-8?B?UGtCc1l2OXFtWlJVLzRuWk9lY0dOcUVoOTlja3NpMkpUL2o1a25NaFBjQVE5?=
 =?utf-8?B?YTVJekVrS3pSTmszc3BYcWFDakJ6b21TTi9FODJnTEd5KzZVTWRVUFhpZmNw?=
 =?utf-8?B?Yy90WXpscW5heVV6RlJoaWFMeWFUTkFXY0xKVXRVTFF6VTNOcWE4cUxJYkxN?=
 =?utf-8?B?ajEzYWpFRTlqbHBUU2xVdDNpZFAvZjFyV2NjY3hDRkxsdTNYVE5oRTBFUUUy?=
 =?utf-8?B?SG9oK1ZvbHZpNFliZmxZcmVYZTZwemNjbE9QcjV4UVlxRVpISG1STVZma0tx?=
 =?utf-8?B?OERndVJHOTRDWDVOck40dytucjVpaEo4cjhSS1FZT0VlM0NSUHRQTU9nbmFX?=
 =?utf-8?B?ZzdSb1RUVkVJZFVpdGFsaXdHSWFJMTdzVHFrVWlVamV3T0l3czQ0MXVndlMr?=
 =?utf-8?B?Sjl1VGltRTBXdXcrQ3BzNlZiTktQN3RNVFQrSW9hdUJEVGE2UXRDcFkrb0Ft?=
 =?utf-8?B?ZVF2UEpsS3J6SXFwTlExZTdUUE5xUDRxVWNsbTRDSkQyNGJjMmJuSlN3NHBv?=
 =?utf-8?B?VEtPRnhFWmN3THVMQkVVNlRuQXpEd0hPNnRmVmtUTDJuTnc1VUJJaVR3WVh6?=
 =?utf-8?B?eDRPeHhyQ0cwMm5RTitKbzhrZlprdEVlY2FpT3hHU1NpZ3QzbGwzNFFUSW85?=
 =?utf-8?B?RHBlNkFiSE9vV3Y1cVdIQ0U3ajg4dEg4Z2lja1BaalgzOCtsS3JJL1hpTXNq?=
 =?utf-8?B?NmFrNWRQMzl2WlFyc0lzb2ZycnovV2JLcUcyeWt1M0M0dW5xRFcvRWdCY2Zz?=
 =?utf-8?B?S1NFVnJhekY0K0NXMlRxZzMwYzlCWm9WWmF1ei9uL3lzcVRtSlZNWkpkbzNI?=
 =?utf-8?B?MklsanVQd1REaUo2Uk9iMXBQc29kZkVlODl6cE1JejN6Y0xqckpRMC8zR1cz?=
 =?utf-8?B?cjNpMENzRXdJMitkQXkrSUJ2WnVTSnIreDAwYUJaSWdvR3gxYzFLd0ZzTWlQ?=
 =?utf-8?B?dFd5ODFLWVpWQndMSTNkeGV6MGdmUXRrdzVNbXI1WnJKVzNMZFVEcUJBTlFj?=
 =?utf-8?B?cHA5NWZkTzM2VmFRZ2ZIcXBxNFJqRkRDMGtiNnBlMjdMaTMyK0pkLzlXZkRw?=
 =?utf-8?B?STVHd0s3UDVhTEhsSTJ5VjFvZWthOEZsOW0veFk1K1hZckZzVlgyT1VTRU5n?=
 =?utf-8?B?ZjArZll6Y3dYODhVNVBEdXlQRitXVFd6R3hjT0tiS2dyM3lJZjhDVlp1dy96?=
 =?utf-8?B?dVQ3eVFsNE1OdTFMZXVBNHhUZUlyV2hacWJUYUZLTVVyb1MxK2pOZDVPVHRh?=
 =?utf-8?Q?KGZfX5+OCirbdLEHa1DPIJ4KPzZHTjRbRNXGq6P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjkxR29yb2xVZTZPT1pwUml1NVlLSXlYQzdXdXVIR1V1MnpMNmxsUGtBTStv?=
 =?utf-8?B?U1hveUdBRGVZdEpXZ016d3pHY3NUazdmaTU1UCs4YXN3Qk9OUmFIV0s4cy9x?=
 =?utf-8?B?TWZ1OHpHWHFKd0xRWmlYS09ia3BTTkxTcXZuVTVSb28wclZRZFI1a0cwQ1hi?=
 =?utf-8?B?NFpvV2lBSWRlT2RjMlRRMWJXTWovcmFKcVFocktRTFZNcXNVZUMvcmViU08w?=
 =?utf-8?B?MEdTdXR4N0R4bHUrOUdmMjhvOUdGQzdjdE5ldmRodEdyemJxbXZvNGZLaG1H?=
 =?utf-8?B?bVFiemcwbTRNSlFDdTRqVEs4cEZ5alNoN0F3YVhWc2FHU1dCZ1ZkenlTU3ph?=
 =?utf-8?B?a3VUVzlBMXNsYmVpRzRPdFNuQVNFV0dmYXlnZXR6clJNRmsrNTNFampFam44?=
 =?utf-8?B?aFdXZU0vRU1OVjNzczZmUUtvS212L0VpM0tiWXhDemVlQlJXNUFYWUFjMUlM?=
 =?utf-8?B?dzEvZlY3Y2VRVU9YTnFLdVdxaFBxSkdtcUxvalk5d1BBSzZsQjRLRlpsWVRI?=
 =?utf-8?B?TUtZNHRpTXEzYUNKa0hYbzhXRXZGeG1neUl2OXhDVEkvM3psTVFEdlgvTGl0?=
 =?utf-8?B?SEUyZG1KdVRDbHlsL3ZIS1ZMSUJqK0k4d1FINmR0VkpmbHArL2NrUDV1L0Jl?=
 =?utf-8?B?UkdlSkZyZUtUR2VxaU9DSmtENGtnRjZLekxScU9wY1pXOGtTaEtkdy9RUytI?=
 =?utf-8?B?ckhoNUIzMElhZGVKSElOWk1DOGYzREFEZUJBMmhiT1JxZkNDekFnMG5GYi9l?=
 =?utf-8?B?ZWIza0xiZTVmVzNidVVPNk5iMGVyZGdpQzJyUzVqenBIa3oyaU9SczlsQ1FF?=
 =?utf-8?B?Q2lPQnllck1nT05XMit0QTRhQVR4L2FHWDJqdm55N1AzS1ptT09ERjJZaUF5?=
 =?utf-8?B?WFJwZmRPYmo0OHhGQ25Pakc4Sy94S2QvOXRwUThVSkRYYmQwK1pSdGlKNWJF?=
 =?utf-8?B?S2FFLzRxc2J5WVY4di8wU3l3QTlGUlBJeGJOT2hZa1EwMTg2QWtkWnUyZGZE?=
 =?utf-8?B?YjdjczdPR0JFWjFlOFFBYk5hbHRhcUc4M3RMTkIwU016L3NPdE5yNGp6Z3lu?=
 =?utf-8?B?S1hDTVNMdWlZTHJyVXh1TkZEMzZrZ1pvTys4YjBWU2lETHVHYWhxNDhKb2U0?=
 =?utf-8?B?N2dHZ0hGTUNzSUlNRko2K0lsOS9SWGt4eE0ya0ZqcitPMUlLOUNobm1oUVBQ?=
 =?utf-8?B?M3pvM09WNUZRcDZwc3hRbmVvYWh5MUx2bmU5cFhaSlEySnphekY1TFZzV05F?=
 =?utf-8?B?WmNuVzRydDJqMUFWNms5bHRJd0xYelF3MGRIMXN4RlN1Q2RudmE1dVFsaW56?=
 =?utf-8?B?QWt3SnoxWHE0LzJqNFRSU3RjZnFiNHdIcmZJdCt1bm1LV3N1bksrMkxFM3Nx?=
 =?utf-8?B?TnpKZFZObzgvWFNZZTZNOFhJQ2t2ODB2YmcxaEZNUHEvaWVTZ0hOcm1ZUlEv?=
 =?utf-8?B?RWZEVjdjMG9tOVh2dks5TlBKUVJXbXdYaHI5eEpVNm1KWnpzTGVBUU5KUVpi?=
 =?utf-8?B?MGJMNWY3Vld3MkdOeVNpZWtKbG1sK1hJM3VqUEc4aGxYcExGeUpybDRvYmJF?=
 =?utf-8?B?S256TjBoVmt1d0pUeVZQTW1VdjVpRmtWc2RBeDJJLzhCZVIvVVA0Vk9tNDNF?=
 =?utf-8?B?TDNOYzVKbnB2dVUrWGZzQmZEN1ArQlVWMnVleGZ0VFRmSEUwUEdkUW5zUzhl?=
 =?utf-8?B?TmcyZWQ2SVhQSWNPZXZoenRWSkowS0VRd284cStJTXNNWWFhUmw1d1hSMUdQ?=
 =?utf-8?B?aUtMSHlpcmJ1RHdtNldVd0NHWHZsd3U2YjNoa01DUUYzSjNRU2ZQc2JraFFC?=
 =?utf-8?B?dlN0eWRmZmRxaG9zY3RrZENmRzRtOWt6UHN6UG5yWVdFNGtiMlhlUkc5NE1u?=
 =?utf-8?B?eGpkVVNJUXNwTHRGTGE3QitzdDdhUmhPdmQvQnI5cHZ5eDN2UWhFUnRORGxn?=
 =?utf-8?B?bndRV0xxS0V4Ym8yclJaZk1HZGFQYzlNZWNzNWNtaXVjQlpnNVhrc0FncXBh?=
 =?utf-8?B?bjMxOWgwUE1WbVhyRG5HRklwdExSTnZOQ0c3b1oySzd5amRtcnMwby9aSy96?=
 =?utf-8?B?NUVwekNnYTJKNnpGTThpcDZsY2pVaXpMVE8wdERQaWhPRFltQVFJQ3UxcE5J?=
 =?utf-8?Q?PIWoGz/QEFH6y0gsjAV54UC2E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4049ea70-d573-4e67-60a2-08dcf770a116
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:50:29.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rm8FBZaJAPoohjo9bVnAXIGmetRIYASa3XjrR5WVBxDIqu6SyIEiNv3jTL2PCPjj2OSX7kSsQ0S2s9tQnl17A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103

On 10/28/2024 02:04, Shyam Sundar S K wrote:
> With STB now in a separate file, update the function names to match the
> correct naming schema by removing the _pmc_ prefix where needed.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/mp1_stb.c | 61 +++++++++++++-------------
>   drivers/platform/x86/amd/pmc/pmc.c     |  8 ++--
>   drivers/platform/x86/amd/pmc/pmc.h     |  4 +-
>   3 files changed, 36 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 9a34dd94982c..5efec020ecac 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -47,12 +47,12 @@ enum s2d_arg {
>   	S2D_DRAM_SIZE,
>   };
>   
> -struct amd_pmc_stb_v2_data {
> +struct amd_stb_v2_data {
>   	size_t size;
>   	u8 data[] __counted_by(size);
>   };
>   
> -int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +int amd_write_stb(struct amd_pmc_dev *dev, u32 data)
>   {
>   	int err;
>   
> @@ -65,7 +65,7 @@ int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>   	return 0;
>   }
>   
> -static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> +static int amd_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>   {
>   	int i, err;
>   
> @@ -81,7 +81,7 @@ static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>   	return 0;
>   }
>   
> -static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> +static int amd_stb_debugfs_open(struct inode *inode, struct file *filp)
>   {
>   	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>   	u32 size = FIFO_SIZE * sizeof(u32);
> @@ -92,7 +92,7 @@ static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>   	if (!buf)
>   		return -ENOMEM;
>   
> -	rc = amd_pmc_read_stb(dev, buf);
> +	rc = amd_read_stb(dev, buf);
>   	if (rc) {
>   		kfree(buf);
>   		return rc;
> @@ -102,8 +102,7 @@ static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>   	return rc;
>   }
>   
> -static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> -					loff_t *pos)
> +static ssize_t amd_stb_debugfs_read(struct file *filp, char __user *buf, size_t size, loff_t *pos)
>   {
>   	if (!filp->private_data)
>   		return -EINVAL;
> @@ -112,24 +111,24 @@ static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, siz
>   				       FIFO_SIZE * sizeof(u32));
>   }
>   
> -static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> +static int amd_stb_debugfs_release(struct inode *inode, struct file *filp)
>   {
>   	kfree(filp->private_data);
>   	return 0;
>   }
>   
> -static const struct file_operations amd_pmc_stb_debugfs_fops = {
> +static const struct file_operations amd_stb_debugfs_fops = {
>   	.owner = THIS_MODULE,
> -	.open = amd_pmc_stb_debugfs_open,
> -	.read = amd_pmc_stb_debugfs_read,
> -	.release = amd_pmc_stb_debugfs_release,
> +	.open = amd_stb_debugfs_open,
> +	.read = amd_stb_debugfs_read,
> +	.release = amd_stb_debugfs_release,
>   };
>   
>   /* Enhanced STB Firmware Reporting Mechanism */
> -static int amd_pmc_stb_handle_efr(struct file *filp)
> +static int amd_stb_handle_efr(struct file *filp)
>   {
>   	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	struct amd_pmc_stb_v2_data *stb_data_arr;
> +	struct amd_stb_v2_data *stb_data_arr;
>   	u32 fsize;
>   
>   	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> @@ -144,15 +143,15 @@ static int amd_pmc_stb_handle_efr(struct file *filp)
>   	return 0;
>   }
>   
> -static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> +static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>   {
>   	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>   	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
> -	struct amd_pmc_stb_v2_data *stb_data_arr;
> +	struct amd_stb_v2_data *stb_data_arr;
>   	int ret;
>   
>   	/* Write dummy postcode while reading the STB buffer */
> -	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
> +	ret = amd_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
>   	if (ret)
>   		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>   
> @@ -169,7 +168,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>   	 * platforms that support enhanced dram size reporting.
>   	 */
>   	if (dump_custom_stb)
> -		return amd_pmc_stb_handle_efr(filp);
> +		return amd_stb_handle_efr(filp);
>   
>   	/* Get the num_samples to calculate the last push location */
>   	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> @@ -209,28 +208,28 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>   	return 0;
>   }
>   
> -static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> -					   loff_t *pos)
> +static ssize_t amd_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> +				       loff_t *pos)
>   {
> -	struct amd_pmc_stb_v2_data *data = filp->private_data;
> +	struct amd_stb_v2_data *data = filp->private_data;
>   
>   	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
>   }
>   
> -static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> +static int amd_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
>   {
>   	kfree(filp->private_data);
>   	return 0;
>   }
>   
> -static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
> +static const struct file_operations amd_stb_debugfs_fops_v2 = {
>   	.owner = THIS_MODULE,
> -	.open = amd_pmc_stb_debugfs_open_v2,
> -	.read = amd_pmc_stb_debugfs_read_v2,
> -	.release = amd_pmc_stb_debugfs_release_v2,
> +	.open = amd_stb_debugfs_open_v2,
> +	.read = amd_stb_debugfs_read_v2,
> +	.release = amd_stb_debugfs_release_v2,
>   };
>   
> -static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
> +static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>   {
>   	switch (dev->cpu_id) {
>   	case AMD_CPU_ID_YC:
> @@ -249,7 +248,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
>   	}
>   }
>   
> -int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
> +int amd_s2d_init(struct amd_pmc_dev *dev)
>   {
>   	u32 phys_addr_low, phys_addr_hi;
>   	u64 stb_phys_addr;
> @@ -259,12 +258,12 @@ int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>   	if (!enable_stb)
>   		return 0;
>   
> -	if (amd_pmc_is_stb_supported(dev))
> +	if (amd_is_stb_supported(dev))
>   		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -				    &amd_pmc_stb_debugfs_fops_v2);
> +				    &amd_stb_debugfs_fops_v2);
>   	else
>   		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -				    &amd_pmc_stb_debugfs_fops);
> +				    &amd_stb_debugfs_fops);
>   
>   	/* Spill to DRAM feature uses separate SMU message port */
>   	dev->msg_port = 1;
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index a977ff1e52b5..8e7c87505327 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -667,7 +667,7 @@ static void amd_pmc_s2idle_prepare(void)
>   		return;
>   	}
>   
> -	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_PREPARE);
> +	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_PREPARE);
>   	if (rc)
>   		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
>   }
> @@ -686,7 +686,7 @@ static void amd_pmc_s2idle_check(void)
>   	/* Dump the IdleMask before we add to the STB */
>   	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
>   
> -	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_CHECK);
> +	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_CHECK);
>   	if (rc)
>   		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
>   }
> @@ -713,7 +713,7 @@ static void amd_pmc_s2idle_restore(void)
>   	/* Let SMU know that we are looking for stats */
>   	amd_pmc_dump_data(pdev);
>   
> -	rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
> +	rc = amd_write_stb(pdev, AMD_PMC_STB_S2IDLE_RESTORE);
>   	if (rc)
>   		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
>   
> @@ -828,7 +828,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	}
>   
>   	amd_pmc_dbgfs_register(dev);
> -	err = amd_pmc_s2d_init(dev);
> +	err = amd_s2d_init(dev);
>   	if (err)
>   		goto err_pci_dev_put;
>   
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 07fcb13a4136..7e7f9170124c 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -75,8 +75,8 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>   #define AMD_S2D_REGISTER_RESPONSE	0xA80
>   #define AMD_S2D_REGISTER_ARGUMENT	0xA88
>   
> -int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
> -int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +int amd_s2d_init(struct amd_pmc_dev *dev);
> +int amd_write_stb(struct amd_pmc_dev *dev, u32 data);
>   int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>   
>   #endif /* PMC_H */

