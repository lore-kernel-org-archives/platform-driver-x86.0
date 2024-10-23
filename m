Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3F01B4F04
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729692333; cv=fail; b=TlgunLXNAk5XSA7J541F7V3mX8SD3a7vJMKS4GthTWkz5g6NcfKq8t5MbCDOUqRs3g/Nv3gHfRZGP4socXr0RZs3Y7BOUHDv3DE31ATZS5P72CVP4dY1umCTO5zp4CV7xdFwINVO81uTDU7O+wJ/aaqdkvpJlxZb3frMjCVwkQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729692333; c=relaxed/simple;
	bh=zO1m+JJuh5o7/wAXOdZUtDEO3rYZXjrMC41R02p6A7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B1XPvB1+WQOPas/C+4b87CxKLMbUJWMPMfsIvNCVHK+YL7/4gi8cmSLnxRZx43eAYRDqdLR/ffsNpbG5ysSDGJE5Te4k0Nt+O4GLAizcNEGyvy/arCi3MBw9eKJgC0jAsK5zIO/h6npP+nqZLYKvh0Ltjt6x1Rq2CQ1AgWP2PD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NysDADEE; arc=fail smtp.client-ip=40.107.212.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NysDADEE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbf8NWilqgQy652UCzHxqQp/b0WJXB4qdf6ejrF/lb2QmHKGAt6dAYVAVmHedyWAkyzkVXV37XkHEaZATBuVd7v56t+P7Vs86qvfwOuM/OSnZ/8qgMSZT99j3dTLCiEqz5ZZmQeys+09T8ajLUMewO5LiKWaA5hnhi+WsQM67x+E1UnVzw1ZkNgUXAJSy4qCCaPxJJ9LSzaktb4M2P8iSnwE3lL1x/oex53BIVXOjrJC+xK+gj/oiFenqqD/VQ5Y1b96TsmkUOzmD+LNHcIwZZeM30tz5S2a6nGn4FwaEZ1Pzg2/VLh7EEzEy1IbtZanEFJhtozdWFS+Bq86Yd6qFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsZ4Q5uAxDztFHLcn+UOJHqWuNxHX/b+jLKi4UxEI/8=;
 b=Ww/ZkB0zCWnqlBGY0pZts5a3ov7+XrpzukL9I0TSwuGiyslM4QrJ8W7P6bdL5SYrQpFUnj3IizNNaNjib5v8vjV0v8fqE5982RbSnl3Z6A17dtahFhSL9IhpzV4Fj2svYpO3lgVVdclf0M+qpiMDTxGNwNeST5ZGOjiwkgVRGDeqmV5hiNLDShEAD4FoUwamFJBs7uJWztpCzdGAgDX8+3rhS35Yiy8iKFXqjyt3WO+SFYLe3BPSJxREhXZs+22nm7p+dANJw7WS7AEzaa0EYab3WzsC6V6fzwSwY6CSIxojAzZ6o9qh1ToEfXAn+jbCr1qMrHYE0xCplU0eZhTfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsZ4Q5uAxDztFHLcn+UOJHqWuNxHX/b+jLKi4UxEI/8=;
 b=NysDADEELQLPl8zPBNNRd6QN/R3YyGegIqhx+eqE/SlbtdS7S+7EgwKBWfDuSU7J0P1f7BVGlCbww+Tuvdyfx3HgovOkXOtaHFOFT60S96Y1dOVqjsnUpomAApIGNJKhc4grQo02zoLGg/E+ry8nQUJGCbWoan0d7gK7fpkhPWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6705.namprd12.prod.outlook.com (2603:10b6:303:1e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 14:05:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 14:05:28 +0000
Message-ID: <4e722792-d8fb-4395-b4f6-1cc9c8f6ab91@amd.com>
Date: Wed, 23 Oct 2024 09:05:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] platform/x86/amd/pmf: Add SMU metrics table
 support for 1Ah family 60h model
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241023063245.1404420-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0080.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 08542d3b-2248-4227-77f7-08dcf36bbfa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2F2QUpiVWR6cjBOcVlJUHJMZ3F2QzJuQ2RoUHBmU0FtUHlxUGJPL0MvcE4y?=
 =?utf-8?B?VHBJUXJrR3RqSEZRUTUvaG13VEMvUkFodmI0K3grdU9XVXUxc2ZVOHp0bHg1?=
 =?utf-8?B?YjVhclhqYnJSYlY5RlZRRnpuSkd3OXdwdDRldWpNaWxlUjhPS3NnZjdtdXo1?=
 =?utf-8?B?MElCaVZIZHBIS296YTRRQnV5Nmllc3BOYlZjcFkrVkNBRjB3c0MxTTFCU0NZ?=
 =?utf-8?B?SERTb3FWSEJscnpUeUFzRGpSNGpLL0NhNEV1Tm5ad0NQaFA1QnlmUVJrKzlQ?=
 =?utf-8?B?SVAzRHJya1Bqbmt0bEVTeTg4MmFhNVVvcks3VFQzU0szajAzUUtpaHZIRHJF?=
 =?utf-8?B?RGpJVmlnZGJvSVY0a1BhajdLNk04SDJKN3RpR09pak0zbEpnQXV3alp6M0VU?=
 =?utf-8?B?bEZTdnZ4QjB4Wml6SHFnWXpZajVNa1pGWWtjR2hBdzVDTGxpNlZBWUVBZmgz?=
 =?utf-8?B?V1VvdE9jRnR3SXBPYVBHTnpNZGpFTVI2RTRPa1c5Ulk4QS81ZVdUd0RYVWh4?=
 =?utf-8?B?Z0RscnJUeFpMZnUzOE5uMTZOamVNSVRMU2dqc0kxdFJXMFA2WHdQeHdtdVBD?=
 =?utf-8?B?cVJEVStWZytQZXFnWFl3SGpoS0J4TXkxcFBySVQ2THBkZERlelo3R0JYaVpq?=
 =?utf-8?B?WVJyY24yeVVZSWl3S1kxOURPaFJhZmRiZXMrb2RraXFIL1FCM0FSbjYvQ1JE?=
 =?utf-8?B?ZHVzTHloaTd4VUN0ZGw0R29XTDNhZUNqQUdjQXVLZDU4R3RkbVlVOEl0Rmo2?=
 =?utf-8?B?VE5yMlJTay9xdVFaSHlrZ2xTdHRRSmtKUmsrYmhuL1BFbk9hckVJeFZqNmk0?=
 =?utf-8?B?R2gweUhBakE4VnFHUURGNGQyVEFTZ29Rd09vYUppVmRXU0Z5WHRPeU5NRWlM?=
 =?utf-8?B?QmJnMHQzaFZmTHBCd1loMTdXc0Q2M21CMStUTmRBenAzUGtzcjdzRjR5SmU1?=
 =?utf-8?B?UjRpdmxxd012aFNWK1RqUjVUeGFRUjNIbGVmZTcrclZEdDRnSU5lSWFmQ1kw?=
 =?utf-8?B?MmpNNTZtS2RFRFFPVlEzK293M28yNFJOV3NNbTU1OUJKbjdTOW9mYk52VjhH?=
 =?utf-8?B?bDBJNEpIeGM3ZjNKbkkrbWR5clNZUFBUZzBmbC9COEY1Z1lwS2l4eVVwMmIz?=
 =?utf-8?B?eVV0b2ZBd1FNRHlZaGdKbXBMT25rN0FFVkt6QlVxOTAxOW1BU0t1M0EvK2hV?=
 =?utf-8?B?OVI2eUZQNlJZVkhBUE9lMXVLeDkrMlY4TzY0ZktLdnlIQTB3Rm81L1Q2S2FC?=
 =?utf-8?B?b01sV05sd3QvYjliM2RCeGVMbmFONEZNMEpSUWhJZTU1YkFkbmdYR1paMVJK?=
 =?utf-8?B?dHVncTB6a2tCMk9qY2pmZ2hHcUt2dVYyUDBWV3MrT3pnMDhmLzBQUW91Z1li?=
 =?utf-8?B?RDMydk1ZMXRtUG1xcExHMFVvbmJvMXIyWVNQSU5vUXJHZ3R0VzZ3eURxRHFZ?=
 =?utf-8?B?YWtDbkorajhzcFlKZVFmSm1mNWZLSWtGQVc0MTVEcTBhN04vOFdXNjhLM1I5?=
 =?utf-8?B?UHA2QTdCYzB1eTZUdzJlVFdYL1l6Q2xOVENTdzd4VHEycFp0YVVKK2ljWmN4?=
 =?utf-8?B?a2N2VzdCdWFLUGFqcVVIQWJ5aSt2ejN6eVpSVXNIdHJWbUNmQkJvRjUxQ2xM?=
 =?utf-8?B?QzBhcWtjMXRZK0VSUDZQckp2MlRNQUFRaUJEczY1TFd3ZUJoaW5UN3BUYjVq?=
 =?utf-8?B?TDBoaVhVRzNWUW5xMC8xbTBiWHllam1LenFlVFlhSjdCNnFDdi9PWEo1dXdG?=
 =?utf-8?Q?ua9IYbBUdEzUY/q8QdYyd/CeuDeK+n3K1P2ufoC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3dkNmF4QkduaEhTTHUvbzdHTFRDV0puOTdEUk5yZmxSUldEQ1pPYmVHUlgw?=
 =?utf-8?B?d3liNnZKbU9tRlpER1JSN3VhTkFTUDVsK0RvZkN1cnp2eHJBdjRjbUIwSUpw?=
 =?utf-8?B?RUw5d2hUamlhVXMzZ3FkVVFNUmdTdGR3WHJ6MG9YUFFhUHhVTU1DbUJJbHE2?=
 =?utf-8?B?SzU0MjVOdEtGOWFNODRQam9ldmNYQ2EzckFpM3Q0TUNsbXRpQnJVSHRqdHRC?=
 =?utf-8?B?cTFpZXFrL29IeHM3VitMVnpMY3RISEtHZlduc0NTbEpmcW9QSk5ZZHZSTld6?=
 =?utf-8?B?aGdLUTlyclErRkE2bFRNc2VDa3FEY2pNY1RqckN6SUNtSVlNUFlmb2pJVXV6?=
 =?utf-8?B?aW9IUGE3Qk5ma21VU0R2TThsdlJqYkNlWjhWdHA0bVd2ZkphL2YvcVorRXdV?=
 =?utf-8?B?WERBVStuQkhNS0c3cmJKMjNYVGRsZjByOU9ES21GOVVYWjd1ZmYvVjhWZi94?=
 =?utf-8?B?Y3dxNjN5WjBDZ1gxNG1RaVUyT0hLSndkTGRpdm1NazhaM3JQLzFXK0FkZWNh?=
 =?utf-8?B?TmpTaGhUV1p6cEkxQ0oxY1Q4YnpQTzQvdDRreWM4aVBHRkZBenZyWTlEUkxP?=
 =?utf-8?B?dC9qR0ljcFoyVWM3azJScklVc01RVXRjUHlwU3d6bUR6Y250OUcrT2dIMTdu?=
 =?utf-8?B?Nmp4SGhqdXlZbEpjSXB4cE4zR3FUUHZvaUkvNzZaZ2sxSFZNYllIWmI5TzZ0?=
 =?utf-8?B?UHBjcHR1cFBKN3pLajc4eGxqL0sxVmZucnJxRzNaOWU0d0pkSmNKS0o2OEpF?=
 =?utf-8?B?WEJJcjhkclFaQnJRUnpjNllwVlEyMTBXUVBpaHJVWFMzbllIVEJNTU1xc0cy?=
 =?utf-8?B?TExCdkhOc1d5QVBvSzFQYlQvZ3B4WGhYUXc1UnRuTVA3ck9HdVRVYjdCSHJl?=
 =?utf-8?B?cEVYMHRqb1U3cnhLNUVmY3d6S3BpSnJWYllKeitnQnF3VXVxODR5RzlpWjF3?=
 =?utf-8?B?YkwwN3ZBZnVvNmJvT1hkNGo3T3lkaGRPNWVwbnBtR2ZZbUtvVkozVEs2ZW9E?=
 =?utf-8?B?OEFnV2Y2LzFNT1ExRWFxU1AxSlRUeGo1WndUVWZ1Y3RLNGovZ3FqY1hTT0E5?=
 =?utf-8?B?b3pNamVRc3lCanFQTzNaUVpURnhPaEw1S1B3Tk8zdk50VDJFUlY3Qi8wYmVR?=
 =?utf-8?B?WEFTTWRVb2tGcGN5V09kVzJHdFdLYnQzYnRiM3FqeUN6UWcyamxxS3pzcktB?=
 =?utf-8?B?eUFaazQza1RFMnZ1VmthVUVTNHNVNVpYcWxoNkxaRU52Y0g1MngvSzk1dk52?=
 =?utf-8?B?Sys5RkpsaEdQeGFPQjRZZWtmY0JVUndYbmNpT2tBZjN2QUxUakx2OVB4NjBP?=
 =?utf-8?B?Qk5vNEllL3dROC90WTk0UDZzdFhDZllrRHNjSnNPYjRxT1QrUWtkMkFMN0VU?=
 =?utf-8?B?UG9vaFZIbFJ5SVU0SFVIbkxiNUhtQ2dGRU5NMEVtNkJjU0FCZzVGaXhBbUNB?=
 =?utf-8?B?VTV3cmwvaXB5U0dNRXl6cVRHK01oVkdPM0N3aXdLRkNXVDg2RlIxaHRybDZz?=
 =?utf-8?B?WEthUDhEYUEzUzdER3gyYUVmUFQ4SkRVZm14NFhOeFkwR1QzZnNiRjJGRFFo?=
 =?utf-8?B?aVRzQUFlcXhVU2g0a1A3RFRXQmpxRkNTVlFaZlp3U1g4LzVMbFZaRVcyeDJP?=
 =?utf-8?B?SVRRNzZvNmdwcnMyU2FJZmI1RFVBZ042R0UzdXBSTXREOTRwMnlQTktwWlZQ?=
 =?utf-8?B?dEFRdC90YXZLc1ozN0tCaUNTeTJjcFFXazBOK2lJK2RqVUtnMVRlTjFmQml4?=
 =?utf-8?B?WHpMVXVmSWFWNGtQUWNuY1FKcW84RGF0WDAzbjlEQzJKeitkd0pwZ3IyMXUx?=
 =?utf-8?B?bW5XM2tTcG81MVd1NkI5Y0IvL2xwOHc0WGVBNy96bmY4aGI2VE4xM2JEMXpS?=
 =?utf-8?B?SlBUSkVLY2wrV3MwcElqUzN2M2xVcmNtTkNQQnVMay9hL1UwZ0QzUFRnS3dq?=
 =?utf-8?B?RXNmT2RJWDV1U2UwenArb2NGMTlpMkNKQ1lySlhwTGFvRTJ2RGRaMmNNQmdo?=
 =?utf-8?B?SUtsTUgyZEJETGRleHUvblh4K3BscE9IVFMzYjV3eTVraU1kUVJGbTBqZmRz?=
 =?utf-8?B?UEgydlJFZGxxS1EvdGNFazBja3Yvazg3TUtDNktsSStGOExuT2VxUmNIQm4z?=
 =?utf-8?Q?6dkgHjUVzSHfBCizmLa6wI/Sm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08542d3b-2248-4227-77f7-08dcf36bbfa2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:05:28.3490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRul8yD1WaNVYYvQnWz4t4mRUK8o5Uv1pcxG2OEGXWnvbB4IWtcUZjfWmX5oDOZfLfr7Qi7dsY/bc9O1JglFrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6705

On 10/23/2024 01:32, Shyam Sundar S K wrote:
> Add SMU metrics table support for 1Ah family 60h model. This information
> will be used by the PMF driver to alter the system thermals.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/core.c | 1 +
>   drivers/platform/x86/amd/pmf/spc.c  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index d6af0ca036f1..347bb43a5f2b 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -261,6 +261,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>   			dev->mtable_size = sizeof(dev->m_table);
>   			break;
>   		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   			dev->mtable_size = sizeof(dev->m_table_v2);
>   			break;
>   		default:
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index b5183969f9bf..06226eb0eab3 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -86,6 +86,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>   					 ARRAY_SIZE(dev->m_table.avg_core_c0residency), in);
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>   		in->ev_info.socket_power = dev->m_table_v2.apu_power + dev->m_table_v2.dgpu_power;
>   		in->ev_info.skin_temperature = dev->m_table_v2.skin_temp;

