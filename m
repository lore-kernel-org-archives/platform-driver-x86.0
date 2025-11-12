Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3644C3446A9
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968094; cv=fail; b=m4pQYUwDmI9ccTlvLMZWCOQGyga2ItU8tnQNC1g/6ThpV9TISP6ie87/KA1FGEYhFPFO8X7zwquBBpzPSkj/4di8rOrFpZUvfrR6eWy6WuFBVNcO/XuHOID/41MulZhEpK5097/g2s6H08O7ilxpCKOcJsUFm7QsGsYT4CfYZA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968094; c=relaxed/simple;
	bh=Z/EnysSpIF7bcxB2SREyeMAlC+MOr3Is8ZIyyvAgG6A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rB3Tljru4oSbzb3XNvDNpaglWQKAu7iSnJuXTjmDLKvqa9KV0jM0xN/duKYDkxi71lm2L9bTlUfd/4eZpLvPM4ccy7TTrdR09ehdsYFsbLPvalJPvfPLgc2CwmyOqvGxoOluMtqS6jKp60Q7IVxdGXqz7/zhi8xfRER7I646zB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PfC395Yh; arc=fail smtp.client-ip=40.93.196.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PfC395Yh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9BAKbQ9z28bfkYaRoCB8VUalQ9KsGHmtt+xPWAnDXlPUCK2LtFFXNKjQnIw12yTfubN60iPfZ6lRDlGXjWngX0J01noltD52NdJ5CHIkReMMlvwYPYeew35p4j4VZCYGTbvSwvvoAXzTXQcDl4WeBM5TnvQAi6hqcgU/g/LPkPO4qWtk7SPZBJUJhiI+dkXsB1OMnhfP+YbOAB/fU+X6JNfoAqoA78TU+OFEFdnLwjOf+qgt1ZgTcqT7t2iXtUsANjyXuk6USNsd5OqkZvr8Dn6dfItssiBU21bbwWRk2LHZu/TlayPCERHeiX7JFTdXG2Qf0/6vop44jgibwgUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYG7gmjT8yRDF6alPu9OFiYAtoM8GpMlfSyiTlxYl1o=;
 b=Du/yx1XHRpo8t/QIUqMq+mdBPQfH37EW540o9eshYB0leR6P9IBO7pte6hKJRImWmsalBhjnVPApIwtLYARKnjEaWTla+YS7hIniqAklOQqClUwhwTOGS3Pw7/BBM8qxldWqr7WYwoXSxg8nzXEY/DhIkVQH3Q9AOtjlEPFcDrF1WaQ1/GLaoScFyGEy8BccyswuqOQFj1KSCH9fVk0sNAQgr3Kcvc6Es/sLk/cqvPaKNk/Dh4RjZa+f8lTATLloKuWZAblctvy0LNfJgkePJaMSRmUq3/IuEP1Z8LZlO7d3DpdffAVKqLzaO6+RBYXaGFJV1E+ZcQVoRwdDv6Uo0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYG7gmjT8yRDF6alPu9OFiYAtoM8GpMlfSyiTlxYl1o=;
 b=PfC395YhzicsUbEBSxSt/O2JY8hL/qw+FOUqlHo/M5GHkUAFbmurD4LVnEmMJHPzJB8m5A8darTc/81lXrIT/L3nNUaD7AvWEYAJzmQXnzrv1ry24jl1PqyhD4q1RbDkge/NhePxyzH30mkl8sfQqm0b3M3LANg/IB+1qGXcoMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 12 Nov
 2025 17:21:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9298.010; Wed, 12 Nov 2025
 17:21:29 +0000
Message-ID: <e451a128-cd81-4ec9-909a-47b960f3946c@amd.com>
Date: Wed, 12 Nov 2025 11:21:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PMF NPU metrics cleanup, command flag cleanup, and
 amdxdna integration
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 lizhi.hou@amd.com
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:806:d2::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd25c71-20b8-4924-6659-08de220fea8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWVVbHhrR0lMU3BYNDFYUkdsMW54MldyV21VU3FKRFM5aForTkYvaVhFdmFo?=
 =?utf-8?B?RStVd051UG9sS3o0QUtCYjFYNmNuQjNkNmphdmlPWmJkTGR5cUVJQStZeTFn?=
 =?utf-8?B?Yi9mWjM0YmZGK3JvTFQrRXFEMlZwU0NTZTNRUENqRXN3T1M3S2FCUXBER2lW?=
 =?utf-8?B?YUEveVM4RCt2aUQ5aDhJdHc0SDRJMXVqYUNLYVB5RU5PTFlNVWNqZEx5ZFpp?=
 =?utf-8?B?R216WTN3UnYwSERmQm9PYVJGOE1WcDdORjlQL0J6dXJBeEpUWUIxNFNCVDdq?=
 =?utf-8?B?cm53VTAxWDhNWXp5K0MxdjNSWG8yb24wZDNnZFlwZjJJRmpHamRNbDBXNnZv?=
 =?utf-8?B?MUdidWZBMnoreThsOHZWZCtPUUZCZjVCckdCNmllUnJIRFQwSUwxN3lLK3BW?=
 =?utf-8?B?dSthV21DZnFUcFpLUk5BNWl1NXd3b0lMRVJSRm9XNktkbHZOYlBTTHMvcDhN?=
 =?utf-8?B?Y3FzRU5ieXJ4Q1B0YVl3T3c1T3FZZDV5RHY4ZjArb0k2eDZLci8zZ0tSbmIz?=
 =?utf-8?B?eWUxQTIzZGZCRXBQaUxnd0QvTzdmTC9MWWpDSmZpeWtLRDd3ME1XNmhKeWpY?=
 =?utf-8?B?aCs2cWRFY2JjQ2xrU2RrdlFtNkhodmhCWTZLQW5kUnhGUFoxdVFqck45WFpJ?=
 =?utf-8?B?OE1oU1VRaHFOS0twbUZjaUVML3BvWTE0bU8xODhzN2JyOGJTdzB2ZmYxQlJo?=
 =?utf-8?B?WGFIT1NZbjQ2eEtCUW4rMlpBU0xNMXNvUFFZUFFCdG5IVjdTcElGQjdad0R6?=
 =?utf-8?B?UEdvYVBBZlJVVVE5SUJreDVLQXZGY2dWdVMya2dEVnd2TTNpTHZzNERmTmtx?=
 =?utf-8?B?MmQ0S3ZDVjArem8xSzkwaUpnNk16Uk9Xc2gyeVQreWtqZXprUXl2QUFZeWs4?=
 =?utf-8?B?ZitrNXMvV3JWdXhFUHZRS0pwQ2tVb1Q3bnI5VGJIU0pEY1ZHWmxkM1phWlJU?=
 =?utf-8?B?VlQ3R2JuMW1jTUE1Zlo1SmVkT0daWjRVY0xzNDFaUG9aWUx0dWtFNnFlMjl2?=
 =?utf-8?B?cXRjOERWZW14Ni9yT1JMcjA2SzdnbHc2R2s2Rk1UR2dYcm9DV2tnbzRtc2lz?=
 =?utf-8?B?d1BEcjgrVXpoK052Q0NmM29wMzNTOFdJZjlmM244VXFBYmpvenNXNCthand2?=
 =?utf-8?B?NU5qODB0U21aSjJGSlFYaDZSbXdjdFo5Q2N2ZGt0bjlsQ0VzWksvTUQ5N0NV?=
 =?utf-8?B?MERJajRndk9qM0lpbER2U0NWb3F6Q2dEMkxTNVN4WitHZHpiQUFpZXlqZHhO?=
 =?utf-8?B?dFhudWdzNFFqUk41RmlGMnJCeGlwUXZ2ZlR0OEk2M2YwSVNCUVFaNEF4TXF6?=
 =?utf-8?B?emxwVU1Zcm5yb0FxN0tWRU13am9jT1BMUFJ3Mks1UWhGU0VSOXFjOTdUdWZW?=
 =?utf-8?B?c3htRlRzK0lFdlpBY0IrejF2M0QzekVYZEFZV1lWclRzK2gyMWM1Qis3STR5?=
 =?utf-8?B?ZjRGb2w2NHI4WHc0UWpHalgrRytENUxyY0N3K0pLczlvNVpabnc1R1lVN2FR?=
 =?utf-8?B?RDJIZGowSkU3TnNwaE8yY0J6a2U1dFVLTHZoNXA5SzNTaFNoUllIeU1PaWd6?=
 =?utf-8?B?REhQWXNuNU93amUyZmZsYXZYQkV4RWVoeTIrbFhXOGlaL3FwMWgwUUFTMHVt?=
 =?utf-8?B?S2ZKczVVcDM4V1JNTzNWNHJjWnlpTnZYTytJNnZHa0V2KzByR3ExWFg0dG1J?=
 =?utf-8?B?TXdFVmEwRmJZOFkzQ1lUclU2V1pBNU9pNldLSlB6dDFTWDdobXo3NmhyR041?=
 =?utf-8?B?N216eVNRVkRrMXZiZ084R09xYmtLa2ZnS0FubnozR0RjWExpTEtPYzBBNE5V?=
 =?utf-8?B?WENHeS9rTmxZL0wwOTUyZG1LRlRXQzVaRzFjRlIwVU0wY1g4Tm92elpmQjMv?=
 =?utf-8?B?d0cwSzViUVRUS3lkV3NNM2lrdWt6bDhTVTEvOWN6ckVWWDE0bUpkOVlkQjJM?=
 =?utf-8?Q?iRT/F758xdWSoS2pCacn7WJUSfyjb2AH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGVOQUo0N2RiRHZRL3NyWXpjaDVQRVRLM21JNnd4Z3BJOVMyYmtIZDZ4QWE5?=
 =?utf-8?B?T08zTWo1dithSWJhQWtmL2RkYStrMGtyRU5Kd05VWTJtd3RPSStsZElPTG5B?=
 =?utf-8?B?dkhVU1VuNVF5SHRCUnZYZ0xIZkNBbXBuSnNvTXk1YkRzZmVYNTNkNGhHRmhD?=
 =?utf-8?B?TG04ZDluaVZnR2JoZHUyOVNpV2F3SHduSGh4RUhPeXZrbnhTMnlzWExsOFNB?=
 =?utf-8?B?Z2VvRDBoU2JBbUw2b245dldhcGJTN3FqYXI5TmRUVnh6WkU4NDlPNDJDOG1i?=
 =?utf-8?B?c3BueVU0L3NLWWI3Ymx4enlhZGU1Ymh3SUErTk1TY2x1WEdrcnZzZlRkUG1Q?=
 =?utf-8?B?U0dFVFR1dGZSZVRUck5xNDJaYXEzMTRnWGgzNjQ3Tnk4dWVaT3dQSU1aQ014?=
 =?utf-8?B?clFmREQzanpaakVQelN1ekVFYkkyRXFMQWh5bFJsVlNNMFBORXJ4NE40dEhR?=
 =?utf-8?B?WnVHVnhWNWNnY0xWSTJXQnpTdFZ0S0YxMm13TkRFVGtCZmtleGw1eCtGYllr?=
 =?utf-8?B?SGlzeE95L3VqOE1pUzRoMkNUOHFWdm8xZ3d2OUpka1hQK3FVVThteHo3U3hq?=
 =?utf-8?B?UHlPT2o4V0tIMC9iTS81My9yOWRyT1VxZEg4UGZUQXZrV1paVzVLYWtCMGZB?=
 =?utf-8?B?SWFjS1phZVE5OVhlT3RTR2E5YUtacmY1aDEvWHNjcGEwV01yOXdSR1ppcG0v?=
 =?utf-8?B?b1I0ZUV5ODQ4dkN3WnEvclZhcHNvWERxN0F3NDhRb2I2bENzRjhqaVREZ20v?=
 =?utf-8?B?YmRzMlVkMXp6VGdMcjJkdW9ZeTlFVE5hZTZab3NKU2RMRkpLTDNUVm11bmhR?=
 =?utf-8?B?LzhGM1EwaGpyVW16OXc1U1RhV2UwNGxPS0VseEJMcy9yVERtMWxxNDVIZzhR?=
 =?utf-8?B?MkZwZyt4bHlXREZZWng2UCt4YjF4YWltT29IaWhuTlcxUkFSZHZKVllQVXZI?=
 =?utf-8?B?aUpZRWZ2YnJQU1gybktidVVzUlJZOEVIY3N1N29wY2R6TlN2QnlDWUJlTFBh?=
 =?utf-8?B?K2l6S3N4YzFzaXFiSFdkYms4N2U0OW9hcGV6U2FtV3prTjE4bGQ5M0pjM3RY?=
 =?utf-8?B?RXlpWkhkVDZjQjZkaWFKd3N6c0Qvbk96MGpnbURQZXRqSThFOG1oTFV1aEsy?=
 =?utf-8?B?NVEzYXJ4WEJnTVFxTkxjUjVNMGJOd2NLZjBVT0Y2akRuajFPNmZyNjBTR3Vv?=
 =?utf-8?B?aUJENG9xVDl4QzQweXgySXdtSitHQ1dxRzJ1b0wzQjBmQU9UQTVSU1k0Tita?=
 =?utf-8?B?a0szVWVqUnIzQ1pPYmhYbnZBSmVReUtWNkUwNGtuU2p5YTA4VXpwTnJ3TmxC?=
 =?utf-8?B?ZGsxYWw4aS81WitFbnpsVW0vY3dmQWllRG5XRUJJN0hyVjMyTTl1RENQREZ2?=
 =?utf-8?B?QmRpMEkwWE9ReHcvTlJXQkF3SWx3V3Fvd1hEaW1OT1hZK2RDdlo5eVZpNE8r?=
 =?utf-8?B?VDZmaXFidzlHUGdlWDc1UjRZOVZDVFNuKzV1cFdLOXQ5Q2tOc0g5UDNBM0xx?=
 =?utf-8?B?NlQ3TXR0R25JZHl6djZsSTk2TXlkdkFnM3paaWdkaEJnbmZnUW9wbW5JUk9E?=
 =?utf-8?B?ME50dEZNRGNXMWlMVUl0QjlsWk1FZXIySElSWjRDUUordDR3WFpnSCtNT1kr?=
 =?utf-8?B?WWV2eVpFVW01Ukd2RCswOW1nU2hzTXZVUE5TNmZCa0o4M0d4OVdEZGYrZHZz?=
 =?utf-8?B?eFdQUHdaZ3FVL1VtaENBSmZETXFZSEJ5MUI3dUZSMFJrZWJiejBwVGZocWNN?=
 =?utf-8?B?TlQ2K0RCNlBoNng3WXFJM090dVhSZTgxTHJqbWEydlljTU1raGxMWUQwYVIx?=
 =?utf-8?B?WjdrRTlNN24xK3p3djBUZ1E1Q3lKV2dTR3loYmFCaFNBbXZWQjVBQnRGc3JM?=
 =?utf-8?B?b3ovRFpSSnBTaElEVWtsWVc3c05zdU1jRnZkWGEzbTI3L2tja29ORGRHSzVw?=
 =?utf-8?B?bnZPWnhZV1NRWHJuL1dFaUNnb2pOWFh3UVZFZ01NYWVyZ3R0K3VGbTR1UE9W?=
 =?utf-8?B?TzJFT0M1K0kxczA1aGI2V3dtOC90LzZ0eHVQNUxsdDhCMng0cW8rVWpSaGow?=
 =?utf-8?B?bGpadGlBNDM2d2xDTFNuZXhnQXdzV1RzbHJ4SmVqemM1RzNmTmJJRnNFNkkv?=
 =?utf-8?Q?t/sYhTvygCGPpfi+8GBc15VHZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd25c71-20b8-4924-6659-08de220fea8c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:21:28.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqibxhN7lPyzZC/SaZt+Lch+7CI+2/sQjQN09MEMmZJoANmVplFv8XY9Ay0fP2WGhAWP/5C5i/7ctL58Zryrrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9730

On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
> This series streamlines NPU-related handling in AMD PMF, adds a
> lightweight in-kernel interface for fetching NPU metrics from PMF, and
> hooks AMD XDNA to that interface to expose real-time NPU power data to
> user space.
> 
> Changes include renaming legacy IPU fields to NPU in the metrics structure
> replacing ambiguous booleans and magic values with explicit
> SET_CMD/GET_CMD and METRICS_TABLE_ID constants, introducing an exported
> amd_pmf_get_npu_data() API (guarded by a mutex and platform checks) to
> pull NPU metrics from the SMU, and wiring those metrics into the amdxdna
> driver.
> 
> v2:
> ----
>   - Split the series into multiple patches per v1 feedback
>   - Added preliminary PMF driver cleanups as preparatory patches
>   - Introduced an initial amd_xdna patch that consumes PMF-provided data to
>     establish the plumbing; additional logic can be layered on in future
>     patches as more PMF metrics are utilized.
> 
> Shyam Sundar S K (4):
>    platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
>    platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD flags in
>      amd_pmf_send_cmd()
>    platform/x86/amd/pmf: replace magic table id with METRICS_TABLE_ID
>    platform/x86/amd/pmf: Introduce new interface to export NPU metrics
> 
> VinitKumar Shukla (1):
>    accel/amdxdna: Provide real-time NPU power estimate via AMD PMF
> 
>   drivers/accel/amdxdna/aie2_pci.h         |  2 +
>   drivers/accel/amdxdna/aie2_smu.c         | 12 ++++
>   drivers/platform/x86/amd/pmf/auto-mode.c | 14 ++---
>   drivers/platform/x86/amd/pmf/cnqf.c      | 14 ++---
>   drivers/platform/x86/amd/pmf/core.c      | 71 +++++++++++++++++++++++-
>   drivers/platform/x86/amd/pmf/pmf.h       | 18 ++++--
>   drivers/platform/x86/amd/pmf/spc.c       |  2 +-
>   drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++-------
>   drivers/platform/x86/amd/pmf/tee-if.c    | 20 +++----
>   include/linux/amd-pmf-io.h               | 21 +++++++
>   10 files changed, 159 insertions(+), 53 deletions(-)
> 

Which tree do you think this should merge through?
drm-misc or platform-x86?

I tried and the series cleanly applies to both and compiles on both.  So 
I think it can go either way.
