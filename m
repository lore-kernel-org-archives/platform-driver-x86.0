Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8846F3A1D14
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485437; cv=fail; b=WDWc4OLjNHo8SgDKUxvTWNfeHLUQqIlqTN6ggXF2pDvqJSMz1WCtWholmYnYHqTEqIbw2aJAdr3WfYMe0mwcMGuqskOtRX+5vMj8oP2cFvpGaB9+ePrqp4WhfN+/oXpuIcOISdI6OH8sQYxvg5tg6ay5x+eFdDSYw0/QUmIx4ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485437; c=relaxed/simple;
	bh=flJesVPxMlOOe90pkF/G9FvpyKoFI3OsahBW8acUaoU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TndOoaHVYXqLAJPAO5zY6svIjsX8g1HAePycN4nWcAadLoqcg8aFYcpxZJb0wbVRoWRuL1a5Q2BRxGvUdeDk0HbopgzMYS4eg3V0v1cX1fYwBBje12V9bpouAhB9TtPDl3HdObdb3arYh7s+WO8eQNeCW//ppNF2ezsMFT6nwAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gYYBMt6l; arc=fail smtp.client-ip=40.107.200.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gYYBMt6l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2OSwlGcZswS8D+YkmfpcVt3gyRXJjiRCE6Gd/jdzO63M7eIMCWrljJRfmPiKgUWhCGdIhKMS+h20x6mhAqMoqJWSIVqYmtSsVIjqTcokrU0n0Lg7NaxHlWUzkZoLu8acdS2Lw0bY5FyTY8q6dQw+9OSDcQIdyghRGVaquWCeThUBgxbxL/cQmBlfxZm46OkDJKPluJYLBdxw6tYd01qxuOAe/Vb0jL1UEyF4lC+xc8v7z61JqztHpZFCMiB0aG3MxvyXu2sJs4CTrF+8xYE5MbIo2OIzlSzJ2y9XnWntpz1uJkFSkoLmixRIBVmJ2Xlo4ERqKWtXk0apwsnbPbCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xY88qSx4Iv+VgKEERcV543Sck1FDCfYUm73ULusTU5c=;
 b=rw1DLAXw2QrDLc4O303Y9b16yjkUpxCOtNAFpBLUwK/qo5abaG6kRlHpJaAY9KXZ/OEWk+yJnL+XkuHfWUA230c+29pTCvdq+v4YMq3SSjaWeRYX7D2Djy2VK7v/DRJaGpq8Z87HaYfV7l9W89TxM9kZlF8aoXFwTC9hEvW444tIO/njEIOy59iOvTDL16PwA3EBQqJ0YqFD7cBZC5Ojif6oTlIuPo06NrXIyt/3ZTl+9/5WAtbckDD7uQS8BsIGb6z6yKPPdn2E5VU+BCJTUmFjLIxuRmG6roeJgfZWb7V7S61Uv6EfvwWE2TaMU+7JklDv8SmtfYQ3vAOIJj3VLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xY88qSx4Iv+VgKEERcV543Sck1FDCfYUm73ULusTU5c=;
 b=gYYBMt6ljyNTNS37QCsgI9yvnZwpv2MXLSea+3xoM+5LgnJ5EJ0yFqnoq03SgcybiXLsRefUSQ26zwYPj6bfzl7ZVftDJjHny3Fn9HVeRHuQjXmcatzn+olZGtZ89O0t5I3TJQrzGoLTZiQFm2nykEMHm6nRoQJ5XwpNynl8QHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB8297.namprd12.prod.outlook.com (2603:10b6:930:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 17:03:47 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 17:03:47 +0000
Message-ID: <1eef31c8-bd50-4ad7-aabe-539992ae3719@amd.com>
Date: Tue, 18 Nov 2025 22:33:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD
 flags in amd_pmf_send_cmd()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, lizhi.hou@amd.com
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
 <20251111063737.4156385-3-Shyam-sundar.S-k@amd.com>
 <2e640a82-eb91-14dc-3f34-5e862df14e59@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2e640a82-eb91-14dc-3f34-5e862df14e59@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0071.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f53344-d50d-4062-57d8-08de26c47032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnAxbGlONWlBelRzRy9ncUxtMUdUZ0xudjlFWEhPc3QwN241RHNOaDQ2OStC?=
 =?utf-8?B?L3BicmhUbEJEUDRrbkgvdjFpclZGMitZczdEWEdMcmt4bG9JT0hWUi92QVRD?=
 =?utf-8?B?MTdTMk9aYXlMNUhsY3VKYlN3VVQwOGlwa1MyeEJKcko3ak9OU1Bkb1pVbS91?=
 =?utf-8?B?YzEyZGg4SndqOHVydndFbHliQVhROVJxM1JsMGFuVHlPVlp1aGxoSU1XRU50?=
 =?utf-8?B?aFNYcTAxemdHVUJQcUczRXdJWHJVRmNzc2pVRnRBWUFWQkpENXRpZjVNcGtC?=
 =?utf-8?B?dUZTSW1TaElkdU9uK01BTzQvei9xeVdRZldha2pDWVRnOGR3QWJwL3M2TEhq?=
 =?utf-8?B?V0VCemt3SnBpMkc3MStxbGZka3BiUGNPYllmSjlLQm5FcVBNcXlvSEVOcVJ3?=
 =?utf-8?B?bktvTkxneTA5LzJWalB5cUNhdGJBa2lBaHRWVmgwSWZoYlY0bTl5dEhPcm8w?=
 =?utf-8?B?Ryt3QlZ0S3NIU1ZpbktxWDM2bjU0V29CMnVjVEMwTGRkd05wV3FHTXd5YVNZ?=
 =?utf-8?B?Vjh0c3JEL25jRy90R2E5eHA5NXVlaHAwWVNOWm04SHhjVVlOY2E5R3ArSWd3?=
 =?utf-8?B?QXJ6N081K1JobHkrV094YmhicTUyb3RVOUxoNitwOWVOam05ZUVpSXYxVVkr?=
 =?utf-8?B?aUpnTVBodGtFYnhOWS8zYUwvS25pZm1vNDRzVVNnN3NudklXcnN5UFdNVWZJ?=
 =?utf-8?B?YzArekMrMEtScnpRZnM5OEpYZE9JRmFYbDlJZFRlYWh4SVJDUDBlQzdxb0w3?=
 =?utf-8?B?MmRlSk5kS0wxWGIvajFmcjZnYmNsdlpRL0R3UWpEUXdleHBhUjh0OElaVmVI?=
 =?utf-8?B?WkFZWFFFaGZUQVpEUnBMekRZWHpYWGJwNG1uNk16S1lNVmhaWUxVZlgybGJt?=
 =?utf-8?B?RjlYd21IMDkzMFJGOUNUenBZTlpBS0w1MDduUHdKa2UzUEF4ZnRpNHhHazJq?=
 =?utf-8?B?cU1qUXJpNTNkd1V0d2xNKzhmK0ZHbnppTVhFTkordTluNGxPLzVSYUMwWThE?=
 =?utf-8?B?QTBGcXlkblpvcG5wZVJIN1lCSStnK3AzR280VHltZERsc0s2b3dxUk9yQU1F?=
 =?utf-8?B?bHpqUEUwQUZGYkJ3YTloR2FmZlFMY3VKOExGNWVCc2U0S1RrZnFUR3lEcHNt?=
 =?utf-8?B?U2VHYkRjRnR4dWRuT0dOS1Avc09ubVBmS3dqTjZWOTN2dFpuY2RyU0doN25x?=
 =?utf-8?B?ZFlsWW5Od3lPbDVNOEJET0lGcWJPT1I5WnNGaXcwU2NkNkYwRU9PemRsYkhI?=
 =?utf-8?B?K1VVQmxvOHAvMENwOHI3T0p1clF3eDQ0bnpuZGtja0xCR0IyQ3JpazY3UVRw?=
 =?utf-8?B?VXo3TTJHRlNDNS9ZalYzcklWeVJXbnJEWFZuaVF5aHpYbHpiMXBvRlhFR0hU?=
 =?utf-8?B?SUFDSTk3N1FGbVJzbUhvZkVMb0RLYndUKzZUeDVodllzVUdRQUdnOWs4dndu?=
 =?utf-8?B?eENkb1lLeDdqVHJxZWxoZUJ6YnVqekVqQVM5OGNGUGhPTGhoWWM4YlZNdnJU?=
 =?utf-8?B?UHN2OUsrTXlWZ2szb3NFUHU3WGdEbjR6bzlpS1dXdnM5RjR2OTdUTkEzVDdn?=
 =?utf-8?B?amp1a1d4cS9mMDM3b29EekxnVGRvMThWV3pDcXRQQm9qZ3Y3MjVtcDlYdFRi?=
 =?utf-8?B?TUY0eDBkUi8rcjRJN29aTFhyNWd2d1RWYkZUb0FVWit4WkxCazBPMU9jMEl0?=
 =?utf-8?B?RmVIekRYem5iTWsraGYvRHR6NmtsR054aUV0T2VhWUY5TGhHdzM2MTdCUExB?=
 =?utf-8?B?UFVJK3c5TE5FRDdBQVhJQkxqekJrbVpJNEVOemQ2L2wwbGNkcm5GRWhtcGRr?=
 =?utf-8?B?M1VZcC9sRzg5VU9wbW5senpoZzZSVExhaEYrQlAzdFBWamljWEdYYTUvN3RM?=
 =?utf-8?B?ZnJTeFFXcEcvdkRiK1BYaWU3bEFiMHppWjlaRVFTeWRsWnVlR1ZtOUFUVjlR?=
 =?utf-8?Q?CJwLx2VNabuIqC/AEiG51E4xy5gSknFX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE0rc2RIU001SEtWY2o3Q2NReDhkdUpXSUQzNE9mRWxyRXIzcWxOc1Q4U3Fn?=
 =?utf-8?B?ck1IR21tRnNMdXduV2V5WG1waldsaVpwQ0VPVjhLV0ZBRjFORUVQME44RmpB?=
 =?utf-8?B?Q2diV1lGTHVqOGltOVhoSEwzSitrRWdxRHo2bXo5R2I5Ujk2WUFNK1FIRTVM?=
 =?utf-8?B?V3lHZHVjUUxVUDBJRUR6N3M1ZDgwcmdrMkZ1aS9FQjd0am9nakRPMW1vWmhX?=
 =?utf-8?B?ajcwQzJiYzdnb3pqMERMalFuaGpWWHhtcW9DMlE3NVJiblY4dEl3dVJOR3ox?=
 =?utf-8?B?WUJYMWFVa29OOWpNYWxRdmJoUGYrUnBDMjdWeFpHbW5ONTB1UU5RODJSUzlG?=
 =?utf-8?B?alBBRG40RDF3ZE9GMUJMMEJOeFdlMk50U2NibWprV3hmY3lVamlaRDZwT05Y?=
 =?utf-8?B?N2UyM3J2YWV6OE1rSEdzRUR6T2xGR00rRVJpUVk1aXpBcnV3QisyS0wwNnJT?=
 =?utf-8?B?c1JXU1RCWno1V0tlS2kvWWN4amJ0NFcrRHJCLzdSaW1qcDJhOE1wQnkyalVS?=
 =?utf-8?B?RGQ0K2g0OTd1NjROSFlJZTh1ZnlTYTZSSTJwVHlIeTN6RFcySmY0eHBxV1I3?=
 =?utf-8?B?SUxjcVBKRkNPT2dCUHpTUkc0ZUNVZXVtN2oyaWJtMkVwOE80TzBiTGdxZUxz?=
 =?utf-8?B?SWNBYU9NeUxuQTQxZElwNXdIVUhkUEpZVU9oK1ZiVTNFOXUzVERMUlhibXZ3?=
 =?utf-8?B?YU8ydGlORUdmd1dUL2FQNGVTb2hkT1RuRUpoVThkVVFGSmUybVRGcjdORmdp?=
 =?utf-8?B?YlhTZ3NpODdPYlBDYVBDcDNiQXF5Y1pqYVM0Rkg3MGRuYjRReVVWMzg5cG1X?=
 =?utf-8?B?d3FUNU0vM3loZlVjMllNdVNST0QrVVYzZXA1SkVGa1BCb2tNSU8zc0pIQnIy?=
 =?utf-8?B?eDNCN0FEWHc5ZlJoSStlTXl5R0czV0dyUTAwMFUvOVlxOWdrRXh6a1ZIWWRT?=
 =?utf-8?B?S1B2cGNWRXpWOFBxTmhRNlBiZjMveUVKWExWOUdtOExTR1lLL3lnZDhKQSt1?=
 =?utf-8?B?RVRrdTNTVkJQZ3lkSmpPQnhqWXJtU3RZdlNLTnFldndnVlI2a0VxcFpVZzlq?=
 =?utf-8?B?cFMvN1RDamhUUmViNEc0eEhCY3B3eWFFV0hzbnZJOHNJNHh5KzJ1V2F4aUZ4?=
 =?utf-8?B?NVkyekpMemVwT3NHZUtkcUg2V29oUGVVZ1grbWY4SzhSQ2V5S2I0TVJIYTd3?=
 =?utf-8?B?ZlEvQklsbkZoQnA2SHlQTFdzM2dXN3hWc2phVHVVdGZIUVNpMGlHY1hjL2hi?=
 =?utf-8?B?MjlPcldwaGFJbHU5ZGRkdnU3Q1pxdVBUYmlzc29GZ0JJMnZRT280STBwUnhr?=
 =?utf-8?B?VEwrOG05TEZSOWpYc0o3bmRjTkhaUkJmcWZBT25iVnhwUE0rQzhuQVNML2ph?=
 =?utf-8?B?MXErZ3Y0cEl3cEJuZzJ3dmJyaWZmMThlOThHazN2ZVR3UEQralFUMUpBdlRv?=
 =?utf-8?B?L3ZOQzVFcncxRGRjQTdmUFVTd3FpSjUvZElaYThPUkRQbjB1ZXBMdU5JNStK?=
 =?utf-8?B?RVhvZytFZmU4aW43KzJGMVJuTHp1NzdVellkZ0pKMFBodHlVQzlpTW5HanZI?=
 =?utf-8?B?N2NHZEVXNVBKZFhSaVhoUGhCOExlSnd2eXVHakNmckRrUjFqNEUzaGZKbkVT?=
 =?utf-8?B?MzdKOWNBY1dVQldndkJJRTJGWi9DS2pQTGVwcGxySmZjWkczQ1pMRWt3Z09L?=
 =?utf-8?B?MkhaSWM0b1I4bXlpYkNST3RkTFdlN2hEdDVFM20rYmFJUnVoczUzbHJ5cmV5?=
 =?utf-8?B?Vkx0cmJ5UFhQY0o2UnpTcnk4NVJyUk5NdzArZGNtd2QvdGo3eTFSMUN0NU5j?=
 =?utf-8?B?OC94MDdnVVV1Q0gxSXAxZGlDR0EyU2hmbXdkWTgrTDA4S2U3S0ZFQStjdU5y?=
 =?utf-8?B?MnJ3S1BnWnR1U01ENXJyZU9OU0lBbkpjM290M2dOSEFyYkJ3QkZ4NFRDMktP?=
 =?utf-8?B?ZDhrRmVQazBqZVRiN2pneDVMaVBhN1l2b05McEpBSW1SYUFONmVsVVBpRFZj?=
 =?utf-8?B?WUJlczRkNXpVdzdxYXp6cWJIeUp3ZFlTdlZONGJPTGU5cEFUN0VzbHJLZ0RM?=
 =?utf-8?B?U05WaUU5Mm9aam9RU21YV3Ryc3dqZWF0SFQ5TEN4eUtzSVdmN0RGTHdyaDVu?=
 =?utf-8?Q?zE9AQWff/LYHRfEUMzapSt2ye?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f53344-d50d-4062-57d8-08de26c47032
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:03:47.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnRWQz3mBHOBD9HaKq/EW2gdFtibSkSD3LSCkhWH0kwl0NT1sqsclFUbGxB5lMX2FDjHjf5ypJhXeIzJvK0ToA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8297



On 11/18/2025 21:11, Ilpo Järvinen wrote:
> On Tue, 11 Nov 2025, Shyam Sundar S K wrote:
> 
>> Add SET_CMD and GET_CMD constants and replace boolean values passed as the
>> get/set argument to amd_pmf_send_cmd() with the new explicit flags. This
>> improves readability, avoids ambiguity around true/false and 0/1 usage.
>> There is no functional change.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/auto-mode.c | 14 ++++-----
>>  drivers/platform/x86/amd/pmf/cnqf.c      | 14 ++++-----
>>  drivers/platform/x86/amd/pmf/core.c      |  6 ++--
>>  drivers/platform/x86/amd/pmf/pmf.h       |  3 ++
>>  drivers/platform/x86/amd/pmf/spc.c       |  2 +-
>>  drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++++++++------------
>>  drivers/platform/x86/amd/pmf/tee-if.c    | 20 ++++++-------
>>  7 files changed, 50 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>> index a184922bba8d..faf15a8f74bb 100644
>> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>> @@ -114,14 +114,14 @@ static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
>>  {
>>  	struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
>>  
>> -	amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
>> -	amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
>> -	amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
>> -	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +	amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, pwr_ctrl->spl, NULL);
>> +	amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, pwr_ctrl->fppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, pwr_ctrl->sppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, pwr_ctrl->sppt_apu_only, NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, pwr_ctrl->stt_min, NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>>  			 fixp_q88_fromint(pwr_ctrl->stt_skin_temp[STT_TEMP_APU]), NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>>  			 fixp_q88_fromint(pwr_ctrl->stt_skin_temp[STT_TEMP_HS2]), NULL);
>>  
>>  	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
>> index 207a0b33d8d3..5469fefb6001 100644
>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>> @@ -76,14 +76,14 @@ static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
>>  
>>  	pc = &config_store.mode_set[src][idx].power_control;
>>  
>> -	amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
>> -	amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
>> -	amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
>> -	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +	amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, pc->spl, NULL);
>> +	amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, pc->fppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, pc->sppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, pc->sppt_apu_only, NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, pc->stt_min, NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>>  			 fixp_q88_fromint(pc->stt_skin_temp[STT_TEMP_APU]), NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>>  			 fixp_q88_fromint(pc->stt_skin_temp[STT_TEMP_HS2]), NULL);
>>  
>>  	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index bc544a4a5266..a659cedc4533 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -131,7 +131,7 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>  
>>  	/* Transfer table contents */
>>  	memset(dev->buf, 0, sizeof(dev->m_table));
>> -	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
>>  	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
>>  
>>  	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
>> @@ -289,8 +289,8 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>>  	hi = phys_addr >> 32;
>>  	low = phys_addr & GENMASK(31, 0);
>>  
>> -	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>> -	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
>> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
>> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
>>  
>>  	return 0;
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 6ea5380f3b23..19e413bd89bc 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -120,6 +120,9 @@ struct cookie_header {
>>  #define APTS_MAX_STATES		16
>>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>>  
>> +#define SET_CMD		0
>> +#define GET_CMD		1
> 
> amd_pmf_send_cmd() takes bool so I don't know why these are defined as 
> numbers?

The signature of amd_pmf_send_cmd() is:

amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32
arg, u32 *data);

However, in the code it’s called with mixed values for the get parameter:

amd_pmf_send_cmd(…, …, true, …, …);
amd_pmf_send_cmd(…, …, false, …, …);
amd_pmf_send_cmd(…, …, 0, …, …);

That inconsistency makes it harder to read. So, I think adding those
two macros  would be useful so callers can use explicit names instead
of 0/1/true/false, which should improve clarity.

If you don’t think this is worth doing, I’m fine dropping the change
from this series.

Thanks,
Shyam

> 
> Other than that, things look much better than before this change.
> 
> --
>  i.
> 
>>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>>  
>>  /* APTS PMF BIOS Interface */
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 85192c7536b8..b10229def18a 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -202,7 +202,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>>  {
>>  	/* Get the updated metrics table data */
>>  	memset(dev->buf, 0, dev->mtable_size);
>> -	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
>>  
>>  	switch (dev->cpu_id) {
>>  	case AMD_CPU_ID_PS:
>> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
>> index c28f3c5744c2..0b70a5153f46 100644
>> --- a/drivers/platform/x86/amd/pmf/sps.c
>> +++ b/drivers/platform/x86/amd/pmf/sps.c
>> @@ -192,15 +192,15 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>>  
>>  static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
>>  {
>> -	amd_pmf_send_cmd(dev, SET_PMF_PPT, false, apts_config_store.val[idx].pmf_ppt, NULL);
>> -	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false,
>> +	amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, apts_config_store.val[idx].pmf_ppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, SET_CMD,
>>  			 apts_config_store.val[idx].ppt_pmf_apu_only, NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
>> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD,
>>  			 apts_config_store.val[idx].stt_min_limit, NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>>  			 fixp_q88_fromint(apts_config_store.val[idx].stt_skin_temp_limit_apu),
>>  			 NULL);
>> -	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>>  			 fixp_q88_fromint(apts_config_store.val[idx].stt_skin_temp_limit_hs2),
>>  			 NULL);
>>  }
>> @@ -211,30 +211,30 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
>>  	int src = amd_pmf_get_power_source();
>>  
>>  	if (op == SLIDER_OP_SET) {
>> -		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
>> -		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
>> -		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
>> -		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
>> +		amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, config_store.prop[src][idx].spl, NULL);
>> +		amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, config_store.prop[src][idx].fppt, NULL);
>> +		amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, config_store.prop[src][idx].sppt, NULL);
>> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD,
>>  				 config_store.prop[src][idx].sppt_apu_only, NULL);
>> -		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
>> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD,
>>  				 config_store.prop[src][idx].stt_min, NULL);
>> -		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>>  				 fixp_q88_fromint(config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU]),
>>  				 NULL);
>> -		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>>  				 fixp_q88_fromint(config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2]),
>>  				 NULL);
>>  	} else if (op == SLIDER_OP_GET) {
>> -		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE, &table->prop[src][idx].spl);
>> -		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE, &table->prop[src][idx].fppt);
>> -		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE, &table->prop[src][idx].sppt);
>> -		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
>> +		amd_pmf_send_cmd(dev, GET_SPL, GET_CMD, ARG_NONE, &table->prop[src][idx].spl);
>> +		amd_pmf_send_cmd(dev, GET_FPPT, GET_CMD, ARG_NONE, &table->prop[src][idx].fppt);
>> +		amd_pmf_send_cmd(dev, GET_SPPT, GET_CMD, ARG_NONE, &table->prop[src][idx].sppt);
>> +		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, GET_CMD, ARG_NONE,
>>  				 &table->prop[src][idx].sppt_apu_only);
>> -		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
>> +		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, GET_CMD, ARG_NONE,
>>  				 &table->prop[src][idx].stt_min);
>> -		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
>> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, GET_CMD, ARG_NONE,
>>  				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_APU]);
>> -		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
>> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, GET_CMD, ARG_NONE,
>>  				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_HS2]);
>>  	}
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 6e8116bef4f6..44fc69cfe10e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -83,7 +83,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  		switch (out->actions_list[idx].action_index) {
>>  		case PMF_POLICY_SPL:
>>  			if (dev->prev_data->spl != val) {
>> -				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
>> +				amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, val, NULL);
>>  				dev_dbg(dev->dev, "update SPL: %u\n", val);
>>  				dev->prev_data->spl = val;
>>  			}
>> @@ -91,7 +91,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_SPPT:
>>  			if (dev->prev_data->sppt != val) {
>> -				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
>> +				amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, val, NULL);
>>  				dev_dbg(dev->dev, "update SPPT: %u\n", val);
>>  				dev->prev_data->sppt = val;
>>  			}
>> @@ -99,7 +99,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_FPPT:
>>  			if (dev->prev_data->fppt != val) {
>> -				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
>> +				amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, val, NULL);
>>  				dev_dbg(dev->dev, "update FPPT: %u\n", val);
>>  				dev->prev_data->fppt = val;
>>  			}
>> @@ -107,7 +107,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_SPPT_APU_ONLY:
>>  			if (dev->prev_data->sppt_apuonly != val) {
>> -				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
>> +				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, val, NULL);
>>  				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
>>  				dev->prev_data->sppt_apuonly = val;
>>  			}
>> @@ -115,7 +115,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_STT_MIN:
>>  			if (dev->prev_data->stt_minlimit != val) {
>> -				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
>> +				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, val, NULL);
>>  				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
>>  				dev->prev_data->stt_minlimit = val;
>>  			}
>> @@ -123,7 +123,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_STT_SKINTEMP_APU:
>>  			if (dev->prev_data->stt_skintemp_apu != val) {
>> -				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
>>  						 fixp_q88_fromint(val), NULL);
>>  				dev_dbg(dev->dev, "update STT_SKINTEMP_APU: %u\n", val);
>>  				dev->prev_data->stt_skintemp_apu = val;
>> @@ -132,7 +132,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_STT_SKINTEMP_HS2:
>>  			if (dev->prev_data->stt_skintemp_hs2 != val) {
>> -				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
>>  						 fixp_q88_fromint(val), NULL);
>>  				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2: %u\n", val);
>>  				dev->prev_data->stt_skintemp_hs2 = val;
>> @@ -141,7 +141,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_P3T:
>>  			if (dev->prev_data->p3t_limit != val) {
>> -				amd_pmf_send_cmd(dev, SET_P3T, false, val, NULL);
>> +				amd_pmf_send_cmd(dev, SET_P3T, SET_CMD, val, NULL);
>>  				dev_dbg(dev->dev, "update P3T: %u\n", val);
>>  				dev->prev_data->p3t_limit = val;
>>  			}
>> @@ -149,7 +149,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_PMF_PPT:
>>  			if (dev->prev_data->pmf_ppt != val) {
>> -				amd_pmf_send_cmd(dev, SET_PMF_PPT, false, val, NULL);
>> +				amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, val, NULL);
>>  				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
>>  				dev->prev_data->pmf_ppt = val;
>>  			}
>> @@ -157,7 +157,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  
>>  		case PMF_POLICY_PMF_PPT_APU_ONLY:
>>  			if (dev->prev_data->pmf_ppt_apu_only != val) {
>> -				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false, val, NULL);
>> +				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, SET_CMD, val, NULL);
>>  				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
>>  				dev->prev_data->pmf_ppt_apu_only = val;
>>  			}
>>

