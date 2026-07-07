Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F43ED135
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420400; cv=fail; b=IBlBwPYJkC6Ysu9XKugM0zYCRpQxS7Cvie4U4NIAMtprk8oa6nDDyaYZvWg+JYovJw/irWySoytkUvoTJCz1bhd8vhsKKLmcdxufLaAQZW3/wx3x8Ln+y6eEy307bVYXOPHOajJ94JPSr5sP8Q5GWBnJI5dL6ThEPjiIKscYnXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420400; c=relaxed/simple;
	bh=486GWitu19rAMuII2W1J4hWOZMCITrh06okjNoZOj1k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k+keeHryiXDyzInHofK0aoX42u5yAqw2jiDpAFII32avy4mhUwTsJ3z+RD1X0IiOt+IrdbmEcbcgyWiB3unoaX+tdE6naxe5zECnTNnLg2d6YwNAzGkNFHYmahnjR7YjB+TG5m2OqwoLBR0tr3XTok+NDITUxTZWYdlkCUMhpT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jH6i82sX; arc=fail smtp.client-ip=40.107.208.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jH6i82sX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6mdiCbnVCYbRhONFvYHBu6BH1EJym9YftdYzCJ6FfkVoELizg4RInmaiboPkuRJMrLIs982zghDfcD/NzOK428t8xnQO9oXaw1GKCv2pInwtaIM00agx/BIDtesC+V/5cmtHhsDYmLXYOivG9sHIVlD9dEnMUM6l9RqktWI1bT0g2LNcXa0Mc1tkHQvK/IyYW1WsCVTddPN5eFA2E3QKqwH7XGfCIpM0fTXKB11Je4NJePO8sMJuc3NUngbYeLFoY1ar9cUxdqYEb/xdhj3dVtRreBViDcIoygtUFdGdse2msP3H6nopXFMMpEqUJCnN31GdIiuRUvvvxdycCUBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX2v54P6qxhjv7/VhTOkgysgmHjcexiapjhYYItpzrs=;
 b=xHaBsT/1ADE2bwfTI67nqque+OptNGKVSz/Wqes40K4Ek4D3Cw8xEDVRe/7wlgEY5h9lWETHO//T6GJXCBed4yzcfIKHfBnyR0lGZT9lHq554pZvIJeKwH9bb1PnXJIxHwzYndbaeivI1yPU8lmQ9cD6jq0U/uh9TdBOZYzvRQ1SOMVSgyat31YGMRxO3Ixmh6sT+tHVFTn4b/M/ORG2JXn6SQ/sIwDNnX7LQhDw9Wgt8BUxYT0R5Smo6h1OsOaP2JxqaxkV1J+YZSKKQhb5oa4OepC3gZ6eHTwuUMOfR0E2dg4pVZp5JX+S1JvZ3pu4B0nPuwEsmxv3Lc2B8ZQTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MX2v54P6qxhjv7/VhTOkgysgmHjcexiapjhYYItpzrs=;
 b=jH6i82sXx841aOFxlyo+tA9kHTEn6GRSpYXrh6g1ADCsduK5b6LBPMyUXPtika/qb681k1paMX8Rr4EeDAFNmwXQMUX5KKB6DRycXAXZku0CLELP2qZfhebaI5bDNonn/qt+McqCHvEMJlj/rNa651V1EkFiFJjxTyK7Qh7tyAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA3PR12MB8809.namprd12.prod.outlook.com (2603:10b6:806:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Tue, 7 Jul 2026
 10:33:15 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 10:33:15 +0000
Message-ID: <0d48eac8-fda9-4bb8-91d1-801cf6a2797d@amd.com>
Date: Tue, 7 Jul 2026 16:03:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: amd-pmc: Add IP block table for AMD 1Ah
 M80H SoC
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20260707054048.69152-1-Shyam-sundar.S-k@amd.com>
 <c07417fd-ddd9-e171-de9b-75bdfc66c5b3@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <c07417fd-ddd9-e171-de9b-75bdfc66c5b3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA3PR12MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 976027f3-7824-4c0a-5e8a-08dedc13271b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|11063799006|22082099003|18002099003|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	qLrLw1/HuMSo5F1ymHfpHgd2fBPBokTJItpqz4r3bUomHE+00rgTWTeurNdAto6/uv0fx8wOZ3Vu5Qq/T3vRzS51Zlnwo3zgwd6JqINyLHXKvjYFpY36bcGsM5rzqOpIHZzHuzdVDhTJTjEoTgqKHUQ0eIXSFM/wHnUm4wmpjY2JBV4vOAaCv74IYnld3kVveARe199lROElocdp370XL1VeHuGQpiLyodgidfwhtS0240BvzPtLk4f++yE706U1h2IizEOPA/XJVwjBdo1zdphlZpEdkthY10bWE75cmgQkPOzgriG6adosfqYDC2K4mTd7dju6bw58b9oe+dK7q3KFZIcSaDoTsW6vyX+F5jL9R90jDkuxKe8aiYaX7GK//SDqIqQFt8/48O9eDImqHYdHK84m7IE+ijUPh3zdWoirEld3ICJORAaU5euGb2RywjVHLAn3Gb5u0YAn45Mknq38avRc705l83GXErNQ/yzeutdmNdOdG1cOmkGyBXkZw0YWasSXxoUIehHuuYwDYWoKmniSvLrYS/StH/p+4PzDtRV0NcxDkQhYZtsLX2+QLf118eQBPGipjfxd3R4Lq7J8ryAt0Hg8OhTSxfWPcswn7lZM44f0jMz9BhOCOkQHjqPCJjry8JfBZ8sLiTm2vXwKXby5H+MmLceQOQr1k+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rjl2WElBV3RTUHIwMXRpK0FUdGludldpQnBWblFqdngwYm0rU2RQQWNvSkg5?=
 =?utf-8?B?L1MrZWFNMEZKSTVjcEFwYWpveEpmSytWZGlGLytKUE9aVXViOTJGTjRPNnlX?=
 =?utf-8?B?V0xjb1JCc29xUDFmbTdSZ2RET3BvUnR6Y0lOVGk1anpYSDlhc3JMYzVpbkY0?=
 =?utf-8?B?NWErS3JsT01BZXpzQmgxazBIZnoxcENFWkJtSHV3TTYwaXQ2WEdaN0dYcENQ?=
 =?utf-8?B?YXR0T1pCWVpNdzBTZmlyaThKamF6U0dxa2VGcGtNdC8rNlZvOW93UWUvc0tG?=
 =?utf-8?B?cWJhei9ZaDQ2MEQyempwSmhVdmtIVm1SOStaMVJTS2trMlZkYXB1T2JhU1Q2?=
 =?utf-8?B?d0JhbXFLM2N1N0RqbHJYMVY3UTNmUXlEOTJoZTFkanMzOXZMQTNRZHVEd3lq?=
 =?utf-8?B?MldpSkM4eWJ0S0pVNndlVFRUbUFCRThCVGJWTWxyd1IrWTRoMWszQVVVa05Y?=
 =?utf-8?B?c0pub1gxVFZ4WWdwMEY3dktld2U3ZU0zdUxyeWFsb1d3aGtBNmI5U0pob1hN?=
 =?utf-8?B?RjVSZTkvU002WGVDbEhxdXJHdUg5ZE9Wb0dQc282eG81MEx0M2R6QjhweGhl?=
 =?utf-8?B?ek40MkJUU0JxS2dmT1ErRm0wYTgveXd4bDdmOEpLc3dPMTVsV3dTQkY3TFJI?=
 =?utf-8?B?UE5hLzV2MFhUcEd3clYycXpGQ1ZVWkxQak5CQUZEOWg3SkVpeUlnQ1pOdHhw?=
 =?utf-8?B?Wk10WS9RVi9KalRnd3VsM2M5dkt0dW5lRmZaT25pbFpkcVVhNWk1WE5CdzRl?=
 =?utf-8?B?NGNaOTRrSTdJRDFQZktETTJvOEk3V3N3UjBaTzhld3o4Tk1SdlFDNXBJc3Zo?=
 =?utf-8?B?RzFDbytCa3JCUWRyekVvblg4RkRza3AxRTFUc042U0w0aTZJR3N2dExBUkxG?=
 =?utf-8?B?R2lnLzE0Y01GS3hGR3p6dnUxMXZ0bDVZNSt0T0RSYS82VUFpT211bEQ3VHBH?=
 =?utf-8?B?RlRzQWNCN3dRcW56b2ZoanFpYVVQOXNVOERkSGNYcVNEbEpPVHhrUkM4SFVy?=
 =?utf-8?B?UFRkRXpPWkc3WE1GUFBpTWNoYzBSTUxuOVQ0YlQwZWhsRjVycUFxTktlNERj?=
 =?utf-8?B?TndZQWVNenAxOU5pQmJUZ1p5U1E3VkpOV2p0eHhCVkhabllDeDBUSk5aUW9H?=
 =?utf-8?B?N3ZZYUo3S3kzKzlXWlY5TmZQR3IxRWZ2dXYrSmxWYUhvM0ZLcE00UFdOWGpt?=
 =?utf-8?B?VW1GRmQzbzErTm51WU5EOXpGTWd2UE9uSElXRTdZaExTYVZIUUZ2bXJ4cFRj?=
 =?utf-8?B?QU5ZSW1WSkZ5RVNpM3hkUGtwTDlaMW1PWVRxR3p6aGFHSk9SR0RCVWZMNU5a?=
 =?utf-8?B?QU56TEhodzdSQ1oxQnlQZk1TWStxa1JWdXdSTHFhbTlqa1hBOStDcGFjTXEr?=
 =?utf-8?B?cFR0TXZGV0dOdTVPcFArNDdZQmZaTUhtRWh4ZXhKb2twZXd6R0RKNnR0blRl?=
 =?utf-8?B?YURqc0VrVWcyK01XVTYyMzZLVXJBeFpDU0NqRmVXVkxDTDdTbUJqMGRIQkkv?=
 =?utf-8?B?QzB5U2M5bzZNUFVPTWNDR2xIaE9Ya2RVZThzNnRQTGhlS2cvOWFCUk1IbjdT?=
 =?utf-8?B?OHZuckJtYkt1OEt4eFlaUFVTcHMxdzZRY09JcjdxeWoxZGZFcG0ybjRFQkpw?=
 =?utf-8?B?VVJkWVZsamV1T09sakVHM3FwRFZQc08vWnFlME1ZNjF4Tlhjd0NLQ2dMR3pw?=
 =?utf-8?B?c21jamFYayt0UXV5bDY2bWp4YmxzMGFEbXNSK3ROSlk5NFJyajl5QVhoU3VF?=
 =?utf-8?B?eW5zWEtnRTB6bGFVM0VJWTJxZGsrSDlqSXdMNVhHQ3A1SENBS3BMQnhMbS8y?=
 =?utf-8?B?ajZ3OHNMNlhubUF0cmxhYmFPYUVnZEF4eUVHYWpvZGE2QkZXRjV2VGZveGR4?=
 =?utf-8?B?K0pQMTdoelM0OE5xZEVQSDlMTjRPWlJ1U0lMMWU4bWJIM3NSOHhtdUZMYTVL?=
 =?utf-8?B?dFM5My9CRUpQL0lTQW5ITjAxNXhsZFJWMUVZejBvUUZ5aHhUVkxoNXJqQ3Uz?=
 =?utf-8?B?YTF5azdsRmo0cThyaVBQWXArYnZiZ0ltQUdjeTFpODhKd2pZODFmTmNGZDJJ?=
 =?utf-8?B?eXlDSVh2cXp0WW04by9ZZXBsYzMxOEFndUdSU2lDV0xxM1k0RE4zTlE1RUdE?=
 =?utf-8?B?UDFhdmJJNjk2Y2JGL0FaM2lGSXFIejZ0dk5CendnbGgvSzZoTkZONDNIbkhy?=
 =?utf-8?B?azZxc3V4cFA5SmZZb1hmZ3BNVk1ILzNEMlF4U1VJTUNvd0huVGxTK3ZsdkpK?=
 =?utf-8?B?dHdUQVV6SGN2eG0rQnZQSXlhVkRuZmpTdFZwM3V0T1A1M25sUkVIWElNU2tz?=
 =?utf-8?B?b2wrTlczOWJUOWFJR2JTWnUwaXhtS3V3Ni9aMkpKMTg2dnd6YjZGUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976027f3-7824-4c0a-5e8a-08dedc13271b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 10:33:15.3471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72jouMPy7h31m5adoz8eNal7banxI0UyeAbdtXCl1al6+VkzPpXnt0TC1VYnvudl/SVfA92TopTtW6cJ2y7XOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8809



On 7/7/2026 13:16, Ilpo Järvinen wrote:
> On Tue, 7 Jul 2026, Shyam Sundar S K wrote:
> 
>> AMD Family 1Ah, Model 80h has different IP subsystem layout compared to
>> previous AMD SoCs. The existing soc15_ip_blk[] does not match the latest
>> firmware's DRAM export structure for S0i3 subsystem accounting.
> 
> You say "the latest firmware" so what about the cases that have older FW?

Good catch — "latest firmware" was misleading..

This isn't a FW-version thing, it's tied to the CPU/SoC, and in fact
the original M80H commit(043af31c8d30) had this wrong.

Let me explain..

PMFW (Power Management Firmware, formerly SMU) exports the power
status of each IP block in the SoC — the subsystem accounting. It
writes this into DRAM, the PMC driver reads it back, and we expose it
via debugfs, which is very useful for inspecting S0i3/s2idle residency
and debugging s2idle failures.

Each IP block is bit-mapped, and the set of blocks is specific to a
SoC generation:
soc15_ip_blk[]    - ~22 IP blocks
soc15_ip_blk_v2[] - 25 IP blocks
soc15_ip_blk_v3[] - 19 IP blocks

As the SoC evolves, the set of blocks that factor into low-power
transitions changes (some added, some dropped). For Family 1Ah / Model
80h, PMFW only accounts for the 19 blocks that physically exist in
that SoC. So the layout is fixed per SoC — there is no older M80H FW
that reports a different layout; PMFW on this part always uses this
ordering.

The problem is that commit 043af31c8d30 wired amd_1ah_m80_cpu_info to
soc15_ip_blk (the oldest table), so M80H has been reporting incorrect
subsystem accounting since it landed. This commit adds
soc15_ip_blk_v3[] with the correct ordering and points M80H at it.

Shall I respin v2 with this rationale in the commit message?

and add?

Fixes: 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for
AMD 1Ah M80H SoC")

(note that this is not in stable tree yet)

Thanks,
Shyam

> 
>> Add soc15_ip_blk_v3[] with the correct SoC IP ordering and wire
>> amd_1ah_m80_cpu_info to use it, enabling accurate S0i3 blocking time
>> reporting in smu_fw_info.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 

