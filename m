Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33DE1D0438
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700453; cv=fail; b=CanYJds4FFOcvXP9HgqUMFnLqCG/FDN2rSxMZm3BOCu+Hlqf7kKyh6hZOAIFz8LkDQ831b0YIdbrgpITIfVhc17IPAsaWUMPYxf4fJaJaQVlc72wzPbO8FYTWxRY9kDSkaDRULvJUPeVILiUgXF46c5Ubd9inNtvY1OA/jL/5dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700453; c=relaxed/simple;
	bh=1wYw4LwE4nrM9U1s7ZuUF6hlGO+BUyZNwYxQc0v3LjQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bsDgsCyQxcVi7M8D2/Di1bBokomEADPS0P7fnKL8JXnFtQytAXzvjHFhrxCVABNIq+rUrGklEoU6DzubdWXINSZx+8yokIH+A4hNPdpqit1g9Do08SrIgVg3uIHB5Fjyh38ZUMrASJiV/F7nUSkh5k3wQEqUoInpFAAjE3+fo5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4LTibZ3q; arc=fail smtp.client-ip=40.107.243.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4LTibZ3q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX31wfqCzG/ZbCfN6Fs126NGY6BbY9b3nqMRfVWpsFX/v5/rvFEMeZR80/HKZWebmI024pJG1U9/MN66ni2fO8xenYrMQpnAVVYfOMkbh+6txD6Fu0jW769eQnXJGI7ffBVyD6hwl9vlRWVr50t0s3098MRPnOt+eqNHy6Z1TuERniR7KvpMym6nn5CkD0nbNsIGpiiU1EihRA1JBWuZUfQetIsnlzzN+uPZ3QdegrVxxVaiTnM+lZWZKSvwzZOkvGn/kXfQ/k+y9wLBCyi20/Ci06BkuSLltk+BfUVzTHnluHfHJP8JG/99xgm76JgyDY2RNdSLLokrPTHbrY8CqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvCIy0S2ExaxqMBIk/tCAqjdZBAgLMUPkFAS6We2XV0=;
 b=K/CHyFEC6ZH+iF8FEpioZBe7s0a+fpo/72l2i9K81NQ7pzmrxyD5hr/UgX+juS7aSPa4WLJnhhjvOOCIFt/VNyEX+O1XegeGJFf6dKWBLLTTsuEXse27fGGlAvfqhzB9EKpm7ysRXxpZ2O/ITEvoENTP1hOM+GdZKP2w9dn0SJuI/KhiTKu13hsLq57xNmGOK6LTxHUH+vg8TmNq2WwgdLDC4kDDNUAEPqEUQq5ArNCtJWSCqTPl9rEUE0Bmz9EDcZbEDGl6cG8enuS+pSxm52G2N7go0pWypbm6svMsrNLIUEhdRafQNY70wXTugO+t1qWIjmqHsc2PjWxMAIHhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvCIy0S2ExaxqMBIk/tCAqjdZBAgLMUPkFAS6We2XV0=;
 b=4LTibZ3qdKo/DLduBHpdC0s4gvGcDS3FeKJ+BKzjgHTKVLe1bhSIYxtwMGstEoT6oxgh1joEAmtdMN/C5Qf2P4awlXLa18KL4rFWwj0vpoBll32zJFppugm0nF9Pv6rxlTBA5LWI4Ad68z0JwVPAZ7nn+Gp2EV/W2ucY1dzf61A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 16:20:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 16:20:49 +0000
Message-ID: <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com>
Date: Wed, 23 Oct 2024 11:20:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
 <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
 <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0183.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 397ff792-1be8-4bd2-f793-08dcf37ea7f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWRLSnNzQk83SExGYzlVYWpTamVidktpc2RNeEVMS09jZUIwS1dCV3pGNDlB?=
 =?utf-8?B?ZlVOVGRWZCtpMFFmeE8yN0M2N1h6cjNjdCtUdlF4M3lKbnNVakw3bTVXZWw4?=
 =?utf-8?B?VnYrL0VVV05jQmRnZXdkNk1tVWlGWnRWZkpVOUxJQnZLYytOZU8wR0szVGpS?=
 =?utf-8?B?U09zRy9PcThua0dYN3B5VWx4ZDZtWEpJd1VLYldEMzlUNEpPYWh2VjZJMURk?=
 =?utf-8?B?SzNyaUplalB0M3E2YlFmSTZySUlVZ2NkU240cEx6Q2U0RksxRzNTdHVBWWxv?=
 =?utf-8?B?QjJSM0FUc3UzaG4zV2NETkVDWkQ5YkpDekRrRkpsOWNHZkhBZ2tsQjZ5bkM0?=
 =?utf-8?B?ZlJ6NjZ4SmZtYzE0aGN0eE15VkFONzF6K0JHYjNZdnhiajFPdHJhQWhQMTlQ?=
 =?utf-8?B?MHZ2bUlSZjFKeVRwREx5VkR5R0JzQ21yQUhrdTJPWEJzbExnWEdxTFVydjgw?=
 =?utf-8?B?VkFxeUgxTVNCQWFraWp0OUYrQlJzVVNpVEZIV1hQUDJSNXhJS3JTeG5sYjRp?=
 =?utf-8?B?ZkVncXNlMFBlaVZIeGFTSWFNSnhtMnBMYXRMLyt1Nkt6NGs4UFJiZEgxdHhZ?=
 =?utf-8?B?ODJoSkhFY0tJNkNXMEkySUxPY1VaN1JzNTh1SDRUQ2ExVm42MTZmVjQ5VlZw?=
 =?utf-8?B?aHhFT3pTdHBBaUJnRTBQS3duNG55czQwV2pYdlRmeWJma2dZUGRsdkdjZnFT?=
 =?utf-8?B?NlRVb2JYdjZFUnY1MHEyTUY5VEFjbUdJbzI1UEV2UktuemVyQThkdVJRbG54?=
 =?utf-8?B?MVo4ejd2RDZBZHF4V3RnTlQra2NWR1MrN0tnbVdyeVhJN3NLZDFoWm1JMFAy?=
 =?utf-8?B?MDFxN1VPVEliVVpJQ3p1RmNMSnBsbjdoejQzVzErRTNyd1B1cHJ6cW84NXV3?=
 =?utf-8?B?OVFmbkhFNXN6YmpmL3Y3dm1oUmF4L1lySnhBTWMxS0VZUjdZc1FaM2RWN2ZV?=
 =?utf-8?B?U0xJVWR1ckVSWXZRUmVzdzUwM3ZHbHdKbXFyU29WMjRCNWhqQ2FSS0NGaE5i?=
 =?utf-8?B?bDhUR252cW5uSkE3aWI2ck5hSk1GWVhNTlVXdzZJRjZKQ0lmZGl3UXhSUlJy?=
 =?utf-8?B?VkxzUzc0bzNrY05abXlpT3l0Sm94cUZyaFhTZVVQbmQrNFJ3cC9uYXRsZGZh?=
 =?utf-8?B?QTZXa28wUEVaaTd5WFUwZlVTRkRmWTM1UXBmcHE0cUxkRUVlL0U2QnViK25z?=
 =?utf-8?B?OEVDa05lSERCZ0dwRVZJcTJneVlkcmtqUlRlRWVmVU5mQWwvTEltRFVPRHpP?=
 =?utf-8?B?TWdZL3A3TUZNV21YOEQyVFZid2R6alFPUkNicmM1WERxWjFBb0lMazhKRUx1?=
 =?utf-8?B?UXhjdDJGN3VLRTYwNUwxbk9CYkdRTHU5MVM2UnFLNkNibUttaHdBZ1BHVmdX?=
 =?utf-8?B?eTQ2YUlLODd6L2d5anR0aTJnb1Q5UzFPNzAvNkx6ZmptZlVEZDhMeUU1M0pS?=
 =?utf-8?B?V0RMYjg0ckxDblBHT1lqMHY4ZWxFVjFXVm43Mm1pZ3E5czBsOW4rTHp6bUww?=
 =?utf-8?B?ZUl6RDF0cEJFamRsUVJuMEt4bGx5R0d5dVpiQThtYmc2SUhVK21BWXVmbDJD?=
 =?utf-8?B?T1hBNXZ2aVM0WCsxZURDZ1c4c1YwdmYxL1BITlNla01NazFldmc5Q05WbUVv?=
 =?utf-8?B?SmZCV2RrRVdsRjlVYXY4RE9qcUIzVGRHang1MDhMS3lBTVpvY3Rib3ZvTWVM?=
 =?utf-8?B?ZlVwNkF5UW85ejczc2V1YmNKbWNPRDhYZVhPelZrbUZEamM2TURrUm1wcFg4?=
 =?utf-8?Q?YtySzugBesxHH/3pZSuanSYgs4K3HwGoLKVmskh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDlpbnJjaUNOM2dmWFN4MmtrK3V2UnU3RlJTZGdJODNCK1VETFJsOTRtYmdB?=
 =?utf-8?B?Nm5teDE3RTJVM2orUTZ0Z2w1d1h2RDd1TUxJWHB4TndEdE4xYVZwc3IwRE5D?=
 =?utf-8?B?UHNROGh0a2ZWUmRoMWw5amtCclNtVjQ5OEZ1QStTbzh1a01CdHErME5jYTZ3?=
 =?utf-8?B?aUlkK3VoYlFiT1BoSWUwYlJITS8vVGpkR3VoSkJVVXhaY0xVdHErVHhZbmI4?=
 =?utf-8?B?M1duUXJYcFdYM21sSWE3d0RtQVErb01oTHlMNGdnaEdwaUZNaGtOVWVQRmY4?=
 =?utf-8?B?SnNuUStjdlQreEF5UGdKWm1TUVA3KzdWT2JVcjh2YTFGWWZCLzZHMzNhVmtt?=
 =?utf-8?B?VURIS0RoNmZqVkFlcjl2cjhOTDhMeTB3eDBOU0kzTUdZaWd4MmNzdjVDZXFG?=
 =?utf-8?B?a0k5ZEFDNlZpOEcvWHVrb3g4SWtDcnFQNnJaYTdIcWRXNGgzOHVIbXE5U3o4?=
 =?utf-8?B?eFhNWVZWZG9mNmRpNXpueHVUdE1TRlJ0NHJjZGp4U0gwODdHOXBHRFNFVHQz?=
 =?utf-8?B?aTI0Q1hCcDRCdzgyb0Rna1ArUGQxZ2VpNTcvaUg0WmhXNlhXV2xUL3BQUFA3?=
 =?utf-8?B?eWxyMmNVWlBHZUZqSnNQTjhVbU53RUpuQzIrQ0NKQ3NDd0ZxRnpDMFpqem9y?=
 =?utf-8?B?WjVGN3JjU2NwQmJybUhpTmJsVnZHM3c5aXVBSGd5cWxtYk9aVENXRWZVa3Nw?=
 =?utf-8?B?dTcxU1RBN1k2aVRxWVM5V29RaFVjencxempZZENwZGZ1bkRYSWZyckJtSWZO?=
 =?utf-8?B?VTBJRFY0ZWZDcVZrZjQxbjY0NGdYb0JzRUd2ZXpiQ1I1Umo5bTZIRHp6bDNY?=
 =?utf-8?B?RzJETVQvaFZIdU1wcWd3NnNOQnI1UVd4U0N6aWR3RXlvalJyTURRRlRNT0tD?=
 =?utf-8?B?YW5iUDNiNmVGT0NudFBjRzhqbjhPQktoUlZBU1RLazR6bnN4R0lDY2YxcjFv?=
 =?utf-8?B?N3ZZbTQxdWtSeTB2UG5BZ3M5VWx1dTlsT05nSHhBMStKUk5SejRwM1BRck5s?=
 =?utf-8?B?b1J2TEZmQVNzeEU5bWhBUlhOYWRCeURPWEhrL0lmUEZZVzRDM2hKbXdJYnlh?=
 =?utf-8?B?aDhDUDlsZVdaMGlRaXZLSG1DSlIyaXVlWU9NZXlmSm10eGRhOFZ2MUNPZnRV?=
 =?utf-8?B?bm9HOG9jdkdxMGlEYWRtOWZPQzk3U2ZEZzNJaXVRQ1N2SGswSjRYS1RGUVRq?=
 =?utf-8?B?TnVCSXJUd1NVZFkrV1FvbnZ5TS9sbWtLOGFodENqTDRYeCtGSTBqL0lnQXQ3?=
 =?utf-8?B?Mmczc1h1Q0M0ajdGOHFtUE04NWVJVDRPN2tZaXlOK3VMOUZGYVpWUENVZlEy?=
 =?utf-8?B?c2dPZlN1Rm9qbks4cnlkVndWaEh3SkVpRnVvazVreUdhTk0reGp5MkxoQWF1?=
 =?utf-8?B?TTZwMktOeTR4eU95Vy8wN3NTL3JXd2F1NDZ1UER2MkR1VFRWNDhZaDAvZXpT?=
 =?utf-8?B?UVlFRmluaG5obTczQjV5YWE1dSt5REdObzdTY0VDdW9VZzk2c0cyc1BxR0E4?=
 =?utf-8?B?cjJIL2VDQmlLRGhQZW1PNzlpY3VuaG00Z3BqN29wcmZSdU9tOERoMXpteHpo?=
 =?utf-8?B?blYyNFpCSTlZbHpyQWk3aUtKRFVwYW1xR3QzWXdVWUQ5T3ArdEpQWGVkbFpv?=
 =?utf-8?B?ejRSbmk3d2Q3eXNTZmtZdjArSXpOMlZGcVB4dVVldnVvYmxRY2M0MjAzUEhp?=
 =?utf-8?B?L3FnYU9xcTBHS0FLREYzTnFEdG1KNEZaWUNTelB3QVIrUmJCNzYvVWZiWWcw?=
 =?utf-8?B?alJ5enViSmRzUkJucm5sRG5DTXB4ZXc5WkxDUUNNaEpGZ0xseHo2RDlxMHhT?=
 =?utf-8?B?dnBQVGdlKzltWm9LRzh1dTRjejZ3ZkY5U01SNVV1dnZSYnpoMG5TRGdBRnpY?=
 =?utf-8?B?WGM3aVdGMGtOY0hIZFRMcGpwT3owQlVlZnNwOThsZmQ0djJ3NGRBQnU2ekF2?=
 =?utf-8?B?RE9ncjU5VjNMU2ZuVDZmcXhKdEVORlBpK291ZjJSL3VDQWRpSzU1S2ZqdUF0?=
 =?utf-8?B?ZUNIWldOa3RSTkExa0NENkU2U05EV3JySGdSL0krZU9pTDZLUGd3QnhZc3hD?=
 =?utf-8?B?WXllSENMcVVFMGxMRGhTclBVL2lxU1laL2I5SjFTM0tBTVgvem9NSnlsT3E3?=
 =?utf-8?Q?DzkdKSTO7NcipsnyjHjK5PHYU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397ff792-1be8-4bd2-f793-08dcf37ea7f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 16:20:49.0583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RULb8e27C8xM0GzXaEYH+lzsP9qHI1v1ycxV6BAluKNVgVHr4eK0Ny+fLYl6DoUJstDEe91CyMgnPZAD5uIow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859

On 10/23/2024 10:52, Shyam Sundar S K wrote:
> 
> 
> On 10/23/2024 21:10, Mario Limonciello wrote:
>> On 10/23/2024 10:32, Shyam Sundar S K wrote:
>>>
>>>
>>> On 10/23/2024 20:04, Mario Limonciello wrote:
>>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>>>
>>>>>
>>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>>>> The PMF driver will allocate shared buffer memory using the
>>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is located in the
>>>>>>> secure world and is used for communication with the PMF-TA.
>>>>>>>
>>>>>>> The latest PMF-TA version introduces new structures with OEM debug
>>>>>>> information and additional policy input conditions for
>>>>>>> evaluating the
>>>>>>> policy binary. Consequently, the shared memory size must be
>>>>>>> increased to
>>>>>>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>>>>>>
>>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>
>>>>>> How does this present to a user?  From what you describe it seems to
>>>>>> me like this means a new TA will fail on older kernel in some way.
>>>>>
>>>>> Newer TA will not fail on older systems. This change is just about
>>>>> the
>>>>> increase in TA reserved memory that is presented as "shared memory",
>>>>> as TA needs the additional memory for its own debug data structures.
>>>>
>>>> Thx for comments. But so if you use new TA with older kernel driver,
>>>> what will happen?  Can TA do a buffer overrun because the presented
>>>> shared memory was too small?
>>>>
>>>
>>> New TA will fail on older kernel and hence this change will be
>>> required for new TA to work.
>>
>> OK, that's what I was worried about.
>>
>>>
>>>>>
>>>>>    From user standpoint, always be on latest FW, irrespective of the
>>>>> platform. At this point in time, I don't see a need for FW versioning
>>>>> name (in the future, if there is a need for having a limited support
>>>>> to older platforms, we can carve out a logic to do versioning stuff).
>>>>
>>>> I wish we could enforce this, but In the Linux world there is an
>>>> expectation that these two trains don't need to arrive at station at
>>>> the same time.
>>>>
>>>>>
>>>>>> Some ideas:
>>>>>>
>>>>>> 1) Should there be header version check on the TA and dynamically
>>>>>> allocate the structure size based on the version of the F/W?
>>>>>>
>>>>>
>>>>> This can be done, when the TA versioning upgrade happens, like from
>>>>> 1.3 to 1.4, apart from that there is no header stuff association.
>>>>>
>>>>>> 2) Or is there a command to the TA that can query the expected
>>>>>> output
>>>>>> size?
>>>>>>
>>>>>
>>>>> No, this is just the initial shared memory that the driver allocates
>>>>> to pass the inputs and the commands to TA.
>>>>>
>>>>>> 3) Or should the new TA filename be versioned, and the driver has a
>>>>>> fallback policy?
>>>>>>
>>>>>> Whatever the outcome is; I think it's best that if possible this
>>>>>> change goes back to stable to try to minimize regressions to
>>>>>> users as
>>>>>> distros update linux-firmware.  For example Fedora updates this
>>>>>> monthly, but also tracks stable kernels.
>>>>>>
>>>>>
>>>>> Advisory to distros should be to pick the latest PMF TA (note that, I
>>>>> have not still submitted to new TA FW).
>>>>
>>>> Yeah we can advise distros to pick it up when upstreamed as long as
>>>> there isn't tight dependency on this patch being present.
>>>>
>>>
>>> That is the reason I am waiting for this change to land. Once that is
>>> done, I will submit the new TA, you can send out a advisory to upgrade
>>> the kernel or this change has to be back-ported to stable/oem kernels
>>> for their enablement.
>>>
>>> Makes sense?
>>>
>>
>> I think we need Hans' and Ilpo's comments here to decide what to do.
>>
> 
> Sure.
> 
>> I will say that when we had this happen in amdgpu for a breaking
>> reason there was a new firmware binary filename created/upstreamed for
>> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
>> have fallback code so it could be compatible with either binary.
>>
> 
> True. In case of amdgpu, the FW loading is part of the amdgpu driver.
> But in case of PMF, the PMF TA gets picked from the AMD TEE driver
> through the TEE commands.
> 
> So, there is no need for FW versioning logic in PMF driver.
> 

That's a very good point, and this is a lot of complexity then.

> 
>> * If user on older kernel took newer linux-firmware package they used
>> older binary.
>> * If user on newer kernel took older linux-firmware package they used
>> older binary.
>> * If user on newer kernel took newer linux-firmware package they used
>> newer binary.
>>
>> If the decision is this goes in "as is" it definitely needs to go back
>> to stable kernels.
>>
> 
> IMHO, let's not put too many fallback mechanisms. The philosophy
> should be use latest driver and latest FW that avoids a lot of
> confusion and yeah for that to happen this change has to go to stable.
> 
> Thanks,
> Shyam

Of course Hans and Ilpo make the final call, but I think from our 
discussions here it would be ideal that patch 1 and patch 5 from this 
series go into 6.12 and have stable tags, the rest would be 6.13 material.
