Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8633726ED5D
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Dec 2025 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764788211; cv=fail; b=IbUFH3joqhA+4Z8oQlCbegTkl2Ybk3oamvSqAylLuscPQ3+FzTnvoyTiT1PCjDIXcRVSIDfGfhbip2CJkDbKrK4DgApHr2wDuaP18KdbjzAsR4QDwqq9c8YT2HXCvX9jbKBSCtKGKflVQ7+Bp+dZhgeIuSO4ArDClz0nbu9+eZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764788211; c=relaxed/simple;
	bh=fiFRhB60IOBd2t33x14hP85vIljN1z7XVaLtqTX+6SQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b34dsK9bLPefT0mI/z7r07bR2M+Z8MZuQLXw0xZIaiguE+fdwcpWEkXk8vZOWpVqB2Z3KTrS4K3j7UaHTZir349NeOmq4AwzEsTJLxskfoAx7xzZ3AZinYEyqe38nPJJSawJ+ZofdbHaYVUFjncemDB8meZh+GtwzY1kt1oXBOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eYyDXbf0; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eYyDXbf0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPjIMv+IoqeQjpt1sYek9iDuYBqAEHDz3LcEOcPWqRYm3P4Gaq2In7CayWmPqBj67c+EsvcJRNITbO7p7pbyiKVcMMNFsqvah+g6kGG3zNAcj6gjXYRZ2h32QVrqRbxaL5IW70wz2AEYyBHqyqvChtIYOXLJrhCwj5JqRb19u1gfPhmKELBrnYjKpRAAm/xd6aPcYGVNbSSIKzH6IKp7L2IN99i1uwzRaPhovBjleqEUPv+U6TwAEzpziwAvJoT03WiwhfJuMWDXmah0ys8EUTpy9ZvSkPgnZymH2oSOxDjq+XKtiZ7WOshWcFlvMkdpDuB/Of+QkMG2g+BvR9QcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWt3+esMhTObRYylQseDYW6e7uueIhAAppJLu1uR1OA=;
 b=ZuOnUdfzX9fx1wFWDU5LKzfJ28HK51xTBhaDbzjv+696121/mt6e26IuU+aAEVafCqeIiPoD+p7RD7RJ+/7RtxK7HIHUfP7A3noTc73rDBeiY6YJsxmk82nOIJEDuj54SEJjLCRd2u6OAd8CtgqdwndpwYudsFVuQ6qTvARgKm7J3lXBV+YAEErKTMu5xzQvqO2Vj8hUD7PfK0esRJbzNu6bpWHfrtVlTbmrnCmF68mpN8Ce9bdorC5tTjR4kyOrB99XrALKrzWhGa2yyA/4UI3TrPbwAyhhtZChSP+rfXE/oiE3fjaqxafD4P2vYhPhYNfghhwQBcz68SdejnpY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWt3+esMhTObRYylQseDYW6e7uueIhAAppJLu1uR1OA=;
 b=eYyDXbf0tqGIwoNV3nzpGrI3UQAhwTn1WS7BLLngSBR22i/nK4ZszRv51kqySESn2I/et1FHWWGe0ST0dHHeZvJXOMFT2KQOgDPo/TeVVyw3WKcwbWoL9NanmLP/v3dsB6CzWRSa//VEZuzGQXy8OocvsQzaZlObArC+VmC02VM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 18:56:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 18:56:45 +0000
Message-ID: <60b09100-fe58-4330-b5dd-707eabf8f5ff@amd.com>
Date: Wed, 3 Dec 2025 12:56:39 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] AMD PMC causes system hang on suspend (HP EliteBook X G1a,
 Strix Point)
To: CX MAIL <mailcx@pm.me>,
 "Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <93e7ZGFEiN1SZoCHCVwqctZPrrUmJUlz9NHui4lh4glOm8PYaanRann4m0T9jeq3LwD8mICbSiCw9-COSfmMcDoGNN83VHkK-3wj-PUmfNo=@pm.me>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <93e7ZGFEiN1SZoCHCVwqctZPrrUmJUlz9NHui4lh4glOm8PYaanRann4m0T9jeq3LwD8mICbSiCw9-COSfmMcDoGNN83VHkK-3wj-PUmfNo=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM5PR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:4:ae::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a41a32-aad6-45dd-a53b-08de329db45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djBCMTBxaFBhajFBTHBsNGR0QzFiTXRIZFhTS0hGVjBtRU1mK3JsVklYL2RD?=
 =?utf-8?B?M29PeHBUUFVsbDBzZHFPYTJpMFlrbC9yaWNTZmRaaFI2emp2bU8wMG1JRER4?=
 =?utf-8?B?Uy8yQUw4MXR3SWhrTkhKNkxwc1ZIdHFFN0lTMGtva3I2bUJ3UE1OVStJb2Fn?=
 =?utf-8?B?R1dITGU4QmhvTmR4cFd5U3gwdmhUdkdXeG1IS2FzOFlrVGwrcmRKRXk0dzhV?=
 =?utf-8?B?Rm8wT2FidU14ZFA0ZmpPQStJcngrRDVpeTAwM1VNd2lpckJla3E1WVo1Yi9r?=
 =?utf-8?B?R2Y4Z1BqQTE0RGcrUDNwRWdvbDlDc0tveXdEbFRXOGlRV081Mm95ZThYTmNx?=
 =?utf-8?B?K3B4R2IzOGxkaGY5L2Njckx6bzZsZGFWR24xckdlTUtLWkE4cUJIOWswblZy?=
 =?utf-8?B?Z1AvK0xaUGdiNVhMMDBEclJvNVBHRG13YnFjeHQ2RmJKZTFRdTNuQXdycklw?=
 =?utf-8?B?Q1JTSWJ4U09ENmgvS21xdTY0Z0ttajRhQ0cyWTl4Z3gyeHkweXNGTmxmbWJC?=
 =?utf-8?B?anN0eExWNm0rWTBBcC9SNmdYNEtHQzBFZjFoUGdpYW0vZ1JBSVk5bnZMOTV6?=
 =?utf-8?B?NjJZekFDa29BODdoTTNlMVpkTE1uR0dsc0YvR3BsemdMNzRUbkpBV0lRaGlw?=
 =?utf-8?B?U1RuVlV6TFNDaEdZV2pGSWQvNXR4b2dBVjRTU042VTg2d2xZamU4Z2dmTmZm?=
 =?utf-8?B?eW5QbHlMZ3p3aTEvQjVnbTNhdWx1N24wZllWRWt3cWVpME50T2xmUFdadGsx?=
 =?utf-8?B?dE4zdkRJTHo5bWRrZUgySGRud01nVmhSZ3RyNE1aR2hnS2dyc2xtdGZBYzF0?=
 =?utf-8?B?K1dKQ1FNL1U2N0ozNHNjT2FYcHRvQ2NteXVBZFYrcjl5NzUrSzJ0ck5vMXk0?=
 =?utf-8?B?ZUlGRmNuMzZHSk12aGFJSUZrclk3eS92TEhhWlFudE8wOFFGcEJJTGlRc2Y3?=
 =?utf-8?B?S3U5eGNnWCsxaCtrV3A5RU1qN0ROSzVEWjkyYWlpN280STE5VUR2djRIS1c5?=
 =?utf-8?B?Q1JzQU1maWFxN0REUDk2WjQ1YlJwMEdqN21PMDFPKzRHQWc2d3ltdGFNcGth?=
 =?utf-8?B?NG8rUjlVK29iRjM2RTVlSVBkdytwT0NEOFp2OUZIWGwvN21zdmpsb2ZpNmxv?=
 =?utf-8?B?bzQxcy9nV2Z3cStVUUlMVzYzb0pWOUdQSFBwSWZKYjBMNnJnR2FkQXFCYy8w?=
 =?utf-8?B?dXVHRU9oWTJXRkhLRG9QbUEvdVNIVHNtS0FpVTRCdGNKajVlWEJwOHFnRzho?=
 =?utf-8?B?bVNvSFhkYlkvdnZKd2NZa1VwcGQrRVlkNUhkbjRXRVFZVDdlakhTTVE0VUpk?=
 =?utf-8?B?TU9SOFpnZjFlZVB5VWE3eUk5b2VDN3RVOFlHNm5udjRhVDhyeXdxQ2lLaFAr?=
 =?utf-8?B?SDkzWS9SSmlQV3VMbWpSYTQ5c05yTzNsUWcweityank5Ulp5Ry81NWdyRU12?=
 =?utf-8?B?aXh3MVJRZUFCK2FzMnFhWHR4U29iVTAwN1oyNzNnbHl0T1dyb1NqZURISTZI?=
 =?utf-8?B?Zmp0Q1ZJQTBBMGU4V0xPVXhVU2lnQlNSK3BJbGpuSnVqVHhnRUprRENzM3BX?=
 =?utf-8?B?MStIWXdGaE9Hd1Y1bHdlOFVqUkdxNWxJSFROb3RCQUJnMXJQY25QZE84aEl2?=
 =?utf-8?B?ZkdYMSsyaEY0aS9QbndFZGpYckFWU3FnRWQ2a3JVVnRGZ1AyU2F3TWxOR1pn?=
 =?utf-8?B?aER0S01QZ1ZjRi81S0RSOHJoWDA1bGUwOUF5R1pxRG1kekJCRk52citONnJU?=
 =?utf-8?B?UGg1amFuUFRpUmtxNUVFeURBVS8va0RGazFLZzVzM2VuamJyZnh3anVtcmtz?=
 =?utf-8?B?QkhtVFZYOTlzTVppRFVMeVRkT29QbG1IcVpNTVo1bVBSR3pVS1NOdW5Tc1hP?=
 =?utf-8?B?YUtPdXFEdjJ0Q09GdFNmRkdnaHZZRG1sV1RDZVNpSGtEc3FCa0ZmaytZNW5l?=
 =?utf-8?Q?qd2RRKzPamzRcGSnpAOmcPhqUiGxpVwi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0JVUnQ0N2hJRzR2emp0QnFFUVFZbDVDd2RoaklQWHdpRUVQYURJL3JWbFBX?=
 =?utf-8?B?ZCt0V045Z1ZxYzRtTTdXWGdPdWcrZ1YrTG5ZcE9nV095SE5SVG1oL1drWm1l?=
 =?utf-8?B?TXNBNHpScFJpYWIzcEtLUEI4ckRsMVk5ZFZHa0FlV2k3ZUc4Rm9aeHRJTmpi?=
 =?utf-8?B?SHdOMEU2UUVXSDk2aFJwWW1DSjRGUTZ4ZnNjSDdIUkIyZ2g5S2FjUjErWG5i?=
 =?utf-8?B?S21CRkgwU3VXUHFZMVpSamxWem5ob1FNMW42K1hLQnh2RjVtczBnZlBNeHZB?=
 =?utf-8?B?bHNZWDMveG44c3JEOWxveHRNcWFhcUYyM3JnaGVkSVZZdTdMd1JscUh6VENW?=
 =?utf-8?B?VEdFQ0pmU25jQmhaMEdreStOL0E4NzMrY3hMaUZ4VkJ4cmg2QnpDTlBLdlJ5?=
 =?utf-8?B?RC92QzUxMEpVdE1WV2psMndpdVBQQ2FLOUhKVTlSQUJMdlVYRExzR2NEVklZ?=
 =?utf-8?B?bElCMXBrdFhPQ0lnTXhFSlVvRzZPd2tHSWIxODNNaGFtN3ZUNEM5ZEh1ZEhE?=
 =?utf-8?B?VEIwV0s3c0dlSFdSdjFTM3dheTdkUEYzQnFIdDBGL0NseUs1SmpDVVZzajIx?=
 =?utf-8?B?THdpNzhwSVF1WEhKMldtWE9OQ01Rb3d2MGs2N3REMGJMcm90TnYyTjMzSFM3?=
 =?utf-8?B?cTVxNitPdnV4TnJ6VFQ1K3lXWXlDTmxQV3AwRmxRZjZNMWU3RWM4Wm5GcE1N?=
 =?utf-8?B?Z3F4RldZZ1ZwQS9IRWxuYTM5TUNUbnhZVWF4U0RwNlhSRFJsaUFxNkxwV0Vy?=
 =?utf-8?B?anh3SlhtVzU4ZExGbTZjRGFQUEJpdnVGTXYwYTkzN3ZyM2hZcHJIWlZ4Qnoz?=
 =?utf-8?B?V2pmdnJSUmZIZkRkR3N2NTcyRnNhYVFnUGdOYjMzbVVkTmNqUFFveUtqSkFy?=
 =?utf-8?B?eW1FZHVONDUvQkZISm4wcHR2ZkUyNEs4ajV6L3RoamdZOWtkbktXbnZPT1pt?=
 =?utf-8?B?Zi9zVTJrT2NtdW1nQnViYUtpcDJUUFhReDhVb2dGY0k1d2VaVlZLUDE3eXdL?=
 =?utf-8?B?VmdabW9yYmNXb0dnVitFK2k2aVhBNmZMbVAwRldnTjZaNWxPUloxYjNlbTUv?=
 =?utf-8?B?WVdKNEtPZEJmTzRrdzk0bHdmWEZCMzFJVSsxQTZ5SUh5SnV4UTUzT3ZsL3Zn?=
 =?utf-8?B?RWxzeG1FM3FJdEtweTFVRCtDZFRWTnBUcVNyaTN6Y1pCQkpaSlkwek85eklx?=
 =?utf-8?B?UEM3WHZrak1RSkNCdDF3NHpTQTJXZFBNaDg0dWRUTGYrZG4wSFVOdFZqZkZw?=
 =?utf-8?B?SzdYa3dQZkxJMVlPTFhsQjNEcklMVzZEOFhqVHVGckVrN0NTdHF5QWtycTZy?=
 =?utf-8?B?eGxPZG15a0wzNGlMcXkrdHQ2TGxESDF5NXk0UjhzQkRHL2FJNk50NUZUZkFh?=
 =?utf-8?B?Unlwa3BkM0hmS3FIWVh0b0Y5VHQzdmZXWFdHbWFFSlhHTVJDcE5iZ3VPMjBi?=
 =?utf-8?B?UDV5QnFyZy9PV3NwcDU2YXo0U3F3Y3NQSlNRVTZCNHU1Z3dTcGhKYlUveDhv?=
 =?utf-8?B?K2piNHp3SEZTT1lwNkpsczN5TFp0K3lKNkhlY2k5Tk1yRFplYnp0VHNTUExa?=
 =?utf-8?B?TTVBcFZEYmJMZkJDVmx1bWpURysvbWZJcU5TTi9MaEsyZDZQbGlkdFlDTEN2?=
 =?utf-8?B?ZytTTndQZ1c5SXg3WnYvNjJvenZGYTY4WUdVTnNBMEZLYTR6STdmVk1Ha0hS?=
 =?utf-8?B?RDFIMXBBOWZ6cmttaVphdGpVSHA0OEEyOUpMd0MzVTJhVUw5cW1iRnJZQnFH?=
 =?utf-8?B?Rmw4b3JHV29vUU5EYVlkd092dFpMMG0xeFdJUnlJUGNEa2pxb2ZlV0VaZzF1?=
 =?utf-8?B?MGUyUFlOSFdHNHlxdkJiZkRSTUx0VlBnQ0J2aUNhTW5leUkxT1dSMVZzYi9D?=
 =?utf-8?B?S2luTElHclltOG8rMU1Uc3BoeWx2OWF1bW5BUHBrY0tXVVZkTE5Cak5zd2x5?=
 =?utf-8?B?cWJNWTVtVHBmMExIQThkN3FuVklSbTJGVWJnOFE3QW9KblFFTHJFL0w5aXJJ?=
 =?utf-8?B?TzRreTZkeWtqazc3M3VmUTl5cWswVWNNM2pvU2NFaExnY1dVVVB6Mm93UDhv?=
 =?utf-8?B?OXBROThhU3A2R2wrdHJnNldQcFJZdXd0K3ZjSFo4UWgwTGd2VnVEZVRYYW95?=
 =?utf-8?Q?IRxbAMNEozLjSw1EVN4GiuOyt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a41a32-aad6-45dd-a53b-08de329db45a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 18:56:45.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3XBojpVHbIoag1n03zase7am8fQK9LgBcI54btsbeonZG4UPOj2reEH5iS1fajqK8G97zN6dMTXzvqeDTCVsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216

On 12/3/25 11:28 AM, CX MAIL wrote:
> Hello,
> 
> I'm reporting a critical suspend issue on HP EliteBook X G1a with AMD Ryzen
> AI 9 HX 375 (Strix Point). The system completely hangs when entering s2idle
> with the AMD PMC driver loaded.
> 
> Hardware:
> - Model: HP EliteBook X G1a 14 inch (Model 8D08)
> - CPU: AMD Ryzen AI 9 HX 375 (Strix Point)
> - GPU: Radeon 890M (integrated)
> - BIOS: X88 Ver. 01.03.11 (2025-09-03)
> 
> Kernel: 6.17.7-ba19.fc43.x86_64 (Fedora-based)
> Current cmdline: bluetooth.disable_ertm=1 amdgpu.gpu_recovery=1 pcie_aspm=off
> 
> Problem:
> When executing "systemctl suspend", the system enters s2idle but immediately
> hangs. The last kernel message is "PM: suspend entry (s2idle)" with no
> further output. System becomes completely unresponsive - keyboard, touchpad,
> and power button (short press) have no effect. Only hard power-off works.
> 
> BIOS configuration:
> - APMF enabled
> - Modern Standby (s2idle only, S3 not supported by firmware)
> - /sys/power/mem_sleep: [s2idle]
> 
> AMD PMC device present: /sys/bus/platform/devices/AMDI000A:00/
> 
> Workaround:
> Adding "initcall_blacklist=amd_pmc_driver_init" to kernel cmdline prevents
> the AMD PMC driver from loading. With this workaround, s2idle works perfectly
> and the system resumes normally from suspend.
> 
> Verification with workaround:
> - lsmod | grep amd_pmc: (no output - driver not loaded)
> - Suspend/resume cycle: successful
> 
> Logs attached:
> 1. system-info.txt - detailed system information
> 2. suspend-fail.log - Journal from failed suspend attempt (hangs after
>     "PM: suspend entry")
> 3. suspend-success.log - Journal from successful suspend/resume with
>     workaround applied
> 
> The failure log shows the system stops all output immediately after entering
> s2idle, suggesting the AMD PMC driver causes a hard hang during early
> platform suspend initialization.
> 
> Please let me know if you need any additional debug information or would like
> me to test patches.
> 
> Best regards,
> CX

Hi,

Please use amd-s2idle from https://pypi.org/project/amd-debug-tools/ to 
generate a report.  It may root cause it for you. If it doesn't, please 
attach it to a bugzilla or drm/freedesktop bug report and CC me.

Thanks,
