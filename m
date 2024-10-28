Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00DE1537D7
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134215; cv=fail; b=iH8GePLREvRO1jyceQ7YQPKR2xnnVL5jv0JcFR/T2X83NkkApEsQnAV7EklSOLljKZz0j/sWthZsnO2Vjv/1nJQz7IossjTHwrxJwHt8UExi7fri1EFy8pyLxBaiOJLxrZcdRCjvhZQMlkHNjBKfdZWNwn//hCBwv38FdWfDF+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134215; c=relaxed/simple;
	bh=7SnBP28g5lu/Byj9uJLpKRR5b1WmJS8w6awU0C/cxJk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GjUQpUcVRm3ZqO2tN2HyaTr1Bvg7I7XhR0UyXOzJAAXCjQJWg+hNID2Ke4oLpHcDe4kDJTI1Z6rBcoTlisvsujyWnsd8R2dcKS5R72srnbhDqd7rgbhFgTqVnrplntDgQJxYPrZN00HJZFb54DZM/VqAbzIUwl4NL9WDJYnTxnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tpwUe7AA; arc=fail smtp.client-ip=40.107.95.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tpwUe7AA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbdsVwEMXB/vVni6pQ5HqaNM9wMFjL1mPRxM212c3xUhclknyUFpXkRc4Bnf+Lm9NHxWew5cHcRJkt6iecxJgsejfBHxRXUoDVacM0lfL5rPS9D39zwuFBlcpMZ5BpdauSNcHYCB9Zc57OaGGHKB/t8uUZHsV7kAz0qAnRjq0T0Y6H7BDgGMlBOTbIWi3zTcCvJgqz0k+/wnwNm9UJpzspw3svnwVDXsNZBUUitkvpYJha0+UJVj600PHMFNSe0lGnh2raOtjzh28E8yUyfTczCvqsS3dPXji3aO9r+HjaRAMHVgKqG74aCh/SV8M3FVWnb5UuaC0LnaJW+6QkO6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K54ipIefmMldV/Ng9D2xywUzQlwFcDmWJoRT4sAXWEA=;
 b=Gfw8N440CYApkIVq9X83Rn3tO8w7U1EHM1vbXwH3MiU3tpVqx/7SuFHdPmx4sFdCoi4nQpz82SZGH7gH6P2hqUm4SOJvbrDIn69Y0RYNiVt6OZoJQo+zjY2lzQXZLHS4J2+ci3CZCo1Qf7l5icBswd6G+JMSzj5KIHHrV25qLCI0u0Te2UhWv4V0V1zW0QheZ5bF3jub/viHugYXkkUq+EZDEmkWk1JP8MAi0B0CiDQTcMqV1EkOmAYZtdCsefRqc8dXZchehiV52ayClniv48b41d4NatWIGg8bj3m4JtRkshf5GuBN1m2n8jexzSFEWSyiKgk3yXZoi4+UwIKgIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K54ipIefmMldV/Ng9D2xywUzQlwFcDmWJoRT4sAXWEA=;
 b=tpwUe7AAvQMTS/1TyocnoPtaX1h9p5QQinu04KWFXJgAJGsLk1o4T26eY57q8+c5kr5gXlH3qGLoaM8ztC1VSza2FehfeFwf5Kp8Dg6XkEhC59eeZ7fMCGI9NcRThLoLIhAisqVj0cl71HB89g9L2XOUp1B1tHSSbotGb360mIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 16:50:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 16:50:10 +0000
Message-ID: <a63ae1a9-1da7-4251-a2a1-c431ae32e941@amd.com>
Date: Mon, 28 Oct 2024 11:50:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform/x86/amd/pmc: Isolate STB code changes to a
 new file
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-5-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241028070438.1548737-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0147.namprd11.prod.outlook.com
 (2603:10b6:806:131::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dddd9f6-a1f8-44da-e121-08dcf77095d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUttQSs3NTZrQ2lPeXY1M2YzUllFUjAzNUZCNjNtY3BHOVRlMWtuQWh1MmYy?=
 =?utf-8?B?TUdSNHRSZ1IwQTF1bmVnT0JHOVM3WnNoZmFQcEN2ZmhtcVRFZ2pYVE94eGEr?=
 =?utf-8?B?Uk5xMXNuT3ZZOTBkak1KbE1ieEtiTWxyWXFtSy9EV3Z0YU9oRE5pbHh0eS9U?=
 =?utf-8?B?dW54Q29CY1A4bG9EWXkyd1Q3VWoyYWVjNjJRckpPZmxrb24veFpFcUM0OXND?=
 =?utf-8?B?eTZ0NWFqWFVHeDJzM1RXa2s1UldTTjYzeFkySTltR3JOMXhxNTFITVo1N0RS?=
 =?utf-8?B?Snc2L1lISmlCSFJabENWbGpBWDNDYy9rRGVyb1kvMHZPZGtNeUxudXVmanBk?=
 =?utf-8?B?U1RXREY5TEhrN0plbHI3U2l0ais5VnJwQ3lpRzJ5bUpYMFdXYkU0aUh4ODFN?=
 =?utf-8?B?cWM0MEw1bTdYTDB0ZWJtRVNpbzFuR00weHI1TVJzSWJ2Q1RNcFRmL2hxNU5G?=
 =?utf-8?B?ZGpJeDMwU1BCM0tVMVgreGpyVVhHeU5KM205UzBlUk9SUXI4aVhwYlJRU0wr?=
 =?utf-8?B?ZlVnSnFyc2ZQNW9jd0NKVHJLdW9yL3Nkc1ZYY0RpdTFkUmc2Vm9jUXVwQWF1?=
 =?utf-8?B?Y01rNDd1c056NE9wUmo1clJKMENseFl6a094VnJqY290dTZveGdvZ3VMOHVw?=
 =?utf-8?B?SUErbUZWQ3NHbU1DZTlnZ2xNeDZnQmlKWlhqWFkyOHg1TWlZWCt5RnZQZnV6?=
 =?utf-8?B?Y3ZCbFZqTzZDOFRYczZNcldsTjh5RWpEMHZNNU5qL1lBU21PUWNBcmI0WVFH?=
 =?utf-8?B?SzdVVmdMdXZmM3luYzgvSTZEdXZxYUYxbW9Pc1krUkFMc0dKZTNuVFRZb1FK?=
 =?utf-8?B?UXoyNExrMDh4Q09zL29vN2ZOdGVYVmFCRVhHTUlDWUxZZGcya29MUlY4dEV3?=
 =?utf-8?B?U2NuUURUZHFUMm9MS0x5TFdYT1NydGlaYlhUVG00d294Qmw2MENXbWlIZ252?=
 =?utf-8?B?UExUMmxBZkltZi92Z2RGVnNyZysvQkJIVHY0Sm45WFNxblI1clJDS001RmVn?=
 =?utf-8?B?WldZZ0NSTmRRU0FJd3BScFdxRHRPZ2E2WHhIRlUyMFFGNjhDbUthVG9nNEVY?=
 =?utf-8?B?eWJRUS83U1BDWDlwa1liMC9BNUh3MGRKZUVscUZsU1psNFV6QUREYld6MHJi?=
 =?utf-8?B?Y2UwR0s0N3hoM3cxRW5uWTRQSjJSY3lySkpFTk1KT2JUWXNXeEp0LzNmbGtq?=
 =?utf-8?B?SGJMT3kzV3V1cTU3N2Irb0ZnWHRIeDhaME9HMmIrSzRDemtnTWlWU2RsOG9P?=
 =?utf-8?B?a1UvTktBdVpSdXRKMHUwRkhnNkJKcWY1dUVHNGNsM2R3Q3F3MnJkOGMwUTVS?=
 =?utf-8?B?bDJVTHc1enJpRWR4dkRDQXhqSzNNRGwreVREYnJKWXk0LzdGVWdqNnBSaGlR?=
 =?utf-8?B?VXUwbVNzUEQ1WE1STzJkOEd6UFRtTmdPaHVHYUwwSWlHbVlic0VxV2hYK3VW?=
 =?utf-8?B?TjFYRlUrRWpRRmhlaXVnK2xNZkRxbS9yQWd5OTMxSXdNTnhQVU1uOWd1eWY4?=
 =?utf-8?B?T3pKWk53ZUhVWHNuZC9yT2p4YnViZVRQN0ZwZDFCcUJ3Z3lwL0FETnFTQXB0?=
 =?utf-8?B?b20zQ3ROKzBXbnpsU3Z5bTBmSWFkdlZ0Z0s0ZU13bkdxdGlocWM1dXkreDN2?=
 =?utf-8?B?NnFGY1ZCazJ0SG1GYU1vUWtQYkZ3MkphQVQxWnVWRUNIT1NkRmpYTWpldTNi?=
 =?utf-8?B?ZU5UcElTTHhLMnp2b3ZveXkwOW04azVxbnhZRklwQVVDT3NveC9obVFWMHdV?=
 =?utf-8?Q?wtKv//rh11TkIKssS0p4/tNpcRQOmx/a87itMHB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVrK1hpTVpEQkZHYlVYL0J2OTRJRVpvaEl0YlBWN2VGd25XbTFuSkp0YTh4?=
 =?utf-8?B?VzJGbnhLNk14N1hmYTVWZUVmU1B3dklNaXNTMjc0b3ZLVGxtQldoNEZpWlhG?=
 =?utf-8?B?NGhEejd6T2dJaVB0L0hSK3ZHZC9vZzBoQkxMRzJCU3BJcUYzV1R1MXM0R095?=
 =?utf-8?B?SkRFdlE3OHdRaUg5Q2RBUnZ5Vmw0ZkhiVmk4eENxVGN6bXYxcVh5TUM3cGpo?=
 =?utf-8?B?Z0RmRHpjbktjZ2FVWHVwMzdTb3plMVE4VWVUREN0VjNBOE51VmtNeXdRRWpR?=
 =?utf-8?B?U0U5M0IrdHhPdndtZjFXckU3TW00Q0h2eFRHK21BbkcxZDlUN2NyVGVkWnFi?=
 =?utf-8?B?YXhBVTNVRUliUTBHWFNYcWNqOWQrbEorUjYxMUNhVWR2UUwyczk2VGl6YytE?=
 =?utf-8?B?RGUrU1k1blR0U1J4Vjc3UnhkZjVJS1hrRlNwRENQcWJpVnBmb2kxS0sxTUI4?=
 =?utf-8?B?c3N4MzFKc2U4dGJXdlNuVGdYaHN0UWtvMGRiajAyMmFyWklxcWp6dkxHYTZp?=
 =?utf-8?B?d2tZL2E3ZzQ0UndzY0MxVkdIV2pseXZZLzhrVk9UVlY3MjdEN29CblcwQkpE?=
 =?utf-8?B?VDl4c1pWbnBadDVkZUpoYlkrNEZtWHROT2cxOVRHa0NxRVZ4ZjFDNzBqeGRH?=
 =?utf-8?B?STF1ZnRzSTNXWlIxT1ZOUHExVndhcTMyTmdGTHdHQ2x0RzJWbElBVnN5RVVF?=
 =?utf-8?B?RWJKbmFCTWpld1hoWENUR1Z3MkUwUHV2T0tmT1Bja2dtYXN5aEx4SVdNQWcr?=
 =?utf-8?B?NEhGelMweWhlMHBJRWVNYmhGSkN2bGUzWkhkL3ZjWGkvT2IxSWlUd2RLRGto?=
 =?utf-8?B?WFJFeW1xRE02bFo0UVBHZXRjYi9weDBKbjh1QVcyUmlvZkFMcm0xdDd1MXRZ?=
 =?utf-8?B?Sk1iRURmTDFnMXh3cmJ0b0VGRDVvZlJOS2lMeDIwMEJvZU0vVmk4OENUVzl4?=
 =?utf-8?B?cU9kSzI0cnNKRHpVMUlRNVcwYjVrNFRvVHJHanUwZnN1MDgzWlZpVkhyc29Q?=
 =?utf-8?B?RWdOQXNPdDBrNkUrM2l4ZU03eDdXUUp0RUV1ZGpTdS96Y0drV1JMYjd2Q3JD?=
 =?utf-8?B?azFsQ2FUNEN1UXBiYldoMHlXa1FiUjZlMnRKQVlwUHFYOUNkMkg0S2grZ2VZ?=
 =?utf-8?B?aU1UaWx2d2lCcGhDaHJXYzlRTHJNbkZoZnVSRkxZZVdLYUFUbSt5anhNaTdN?=
 =?utf-8?B?L3FNZXVObXh2bHI1OXJRM083YUhMZVQ5R2J3V2FvOVZGNXRqNVgrcGFkTll6?=
 =?utf-8?B?eWg4dFhQSGZ4SUU3L3h6MktBRSsvUEM5bUljQ281MUY5UXIzRDl5SW4vRG1o?=
 =?utf-8?B?OVo3aFRqSDVENGp2eVp6YXYvdERDWFNVdVA0S3V6TkxuUHZRVTd2WERsY0s2?=
 =?utf-8?B?bWJ2dERSM2IxZ0lEeHhCY0xqUzladHpOYldFeFNrV244OG1Ud0N1Y2tteFgy?=
 =?utf-8?B?L21sQ0JHTXR6VTFnQ1h5OEEzeUJ1QldoeUhJdmhnUEJpNi9jZEZ4MVd4bXZF?=
 =?utf-8?B?Qi9vM3JMalBuS2lUYldjeEdDcHhsOTRzT29hVWR2Q0ZYR3kwb0RkdmZzWnMw?=
 =?utf-8?B?ZFNEK3lVK3JrSExSM2U4WU02enVKSFFnWGVra242WEFINlFIWkZjaUlQN2s2?=
 =?utf-8?B?RnFDcWhjN3N1QXRsQUtGS3VXelE4ZnpyT0w4T2s5clBXL2g5UGtLZlB5VkhE?=
 =?utf-8?B?Y1dEVlo3V1hFc09ERG4vaVhGM0d2LzNGYWNuU0VNZXJtbWpHTlRTVlE2R0tH?=
 =?utf-8?B?czBSN1VBZHF6dm5vODIvYmEydVQza242M1cxYlBSU1kxMjNRS0R6dStZbzdw?=
 =?utf-8?B?ZENtRVBMQW1mbWh2WkdGbTJNTzdMZ0FVdUlGdEQxQXp6SnVVWXArcEFzeDlu?=
 =?utf-8?B?YUFrbUtqaWtpYzQySUdlRjFlVWtRQTV2MVFWOEhYQzJlZWx4alhreXd4WWFn?=
 =?utf-8?B?OGxYc2RPYzRrM2gzOGlRWTAvR1oxMXlvQlNyRDdRMGkrZ1paY0VOVVQ2VlR0?=
 =?utf-8?B?ZlM0WjNlSlJMamI0UkZRZ1VkRHUvQTJlVVdjVGxDaEZkeXE3cUREY29pMWlx?=
 =?utf-8?B?T3pEdDRoS2JEZk01cWYxNG5yOTZ3Zkw4RVN1dkxUenM1VkdBOEIxZlpESFFj?=
 =?utf-8?Q?vhTN+JXoSC+8ubuL+yUzaWGJQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dddd9f6-a1f8-44da-e121-08dcf77095d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:50:10.3454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQZMIrWZapLqy8N5BkjijbCbQ6NhUvp4MfddQ3CrKKZXUZNeXDUSHIMhNof9X6vMBXX6jxwhvuIc+jmnhISVpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660

On 10/28/2024 02:04, Shyam Sundar S K wrote:
> Since S2D (Spill to DRAM) uses different message port offsets compared to
> PMC message offsets for communication with PMFW, relocate the S2D macros
> from pmc.c to a new file, mp1_stb.c, for better code organization.
> 
> Following this change, it is logical to introduce a new structure,
> "struct stb_arg," to pass the message, argument, and response offset
> details to PMFW via the amd_pmc_send_cmd() call. Additionally, move the
> s2d_msg_id member from amd_pmc_dev into the new structure.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/mp1_stb.c | 33 +++++++++++++++++---------
>   drivers/platform/x86/amd/pmc/pmc.c     | 12 +++++-----
>   drivers/platform/x86/amd/pmc/pmc.h     | 14 ++++++-----
>   3 files changed, 36 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 2b06861c479b..1501793b9281 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -31,6 +31,11 @@
>   #define STB_FORCE_FLUSH_DATA	0xCF
>   #define FIFO_SIZE		4096
>   
> +/* STB S2D(Spill to DRAM) has different message port offset */
> +#define AMD_S2D_REGISTER_MESSAGE	0xA20
> +#define AMD_S2D_REGISTER_RESPONSE	0xA80
> +#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> +
>   static bool enable_stb;
>   module_param(enable_stb, bool, 0644);
>   MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> @@ -176,7 +181,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>   		return amd_stb_handle_efr(filp);
>   
>   	/* Get the num_samples to calculate the last push location */
> -	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->stb_arg.s2d_msg_id, true);
>   	/* Clear msg_port for other SMU operation */
>   	dev->msg_port = MSG_PORT_PMC;
>   	if (ret) {
> @@ -239,18 +244,24 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>   	switch (dev->cpu_id) {
>   	case AMD_CPU_ID_YC:
>   	case AMD_CPU_ID_CB:
> -		dev->s2d_msg_id = 0xBE;
> -		return true;
> +		dev->stb_arg.s2d_msg_id = 0xBE;
> +		break;
>   	case AMD_CPU_ID_PS:
> -		dev->s2d_msg_id = 0x85;
> -		return true;
> +		dev->stb_arg.s2d_msg_id = 0x85;
> +		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		dev->s2d_msg_id = 0xDE;
> -		return true;
> +		dev->stb_arg.s2d_msg_id = 0xDE;
> +		break;
>   	default:
>   		return false;
>   	}
> +
> +	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
> +	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
> +	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
> +
> +	return true;
>   }
>   
>   int amd_s2d_init(struct amd_pmc_dev *dev)
> @@ -273,18 +284,18 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>   	/* Spill to DRAM feature uses separate SMU message port */
>   	dev->msg_port = MSG_PORT_S2D;
>   
> -	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->stb_arg.s2d_msg_id, true);
>   	if (size != S2D_TELEMETRY_BYTES_MAX)
>   		return -EIO;
>   
>   	/* Get DRAM size */
> -	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> +	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->stb_arg.s2d_msg_id, true);
>   	if (ret || !dev->dram_size)
>   		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
>   
>   	/* Get STB DRAM address */
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->stb_arg.s2d_msg_id, true);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->stb_arg.s2d_msg_id, true);
>   
>   	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>   
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 8e7c87505327..f9900a03391a 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -450,9 +450,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>   	u32 value, message, argument, response;
>   
>   	if (dev->msg_port) {
> -		message = AMD_S2D_REGISTER_MESSAGE;
> -		argument = AMD_S2D_REGISTER_ARGUMENT;
> -		response = AMD_S2D_REGISTER_RESPONSE;
> +		message = dev->stb_arg.msg;
> +		argument = dev->stb_arg.arg;
> +		response = dev->stb_arg.resp;
>   	} else {
>   		message = dev->smu_msg;
>   		argument = AMD_PMC_REGISTER_ARGUMENT;
> @@ -477,9 +477,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
>   	mutex_lock(&dev->lock);
>   
>   	if (dev->msg_port) {
> -		message = AMD_S2D_REGISTER_MESSAGE;
> -		argument = AMD_S2D_REGISTER_ARGUMENT;
> -		response = AMD_S2D_REGISTER_RESPONSE;
> +		message = dev->stb_arg.msg;
> +		argument = dev->stb_arg.arg;
> +		response = dev->stb_arg.resp;
>   	} else {
>   		message = dev->smu_msg;
>   		argument = AMD_PMC_REGISTER_ARGUMENT;
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 7e7f9170124c..d3c6730ebcd7 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -25,6 +25,13 @@ struct amd_mp2_dev {
>   	bool is_stb_data;
>   };
>   
> +struct stb_arg {
> +	u32 s2d_msg_id;
> +	u32 msg;
> +	u32 arg;
> +	u32 resp;
> +};
> +
>   struct amd_pmc_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> @@ -36,7 +43,6 @@ struct amd_pmc_dev {
>   	u32 active_ips;
>   	u32 dram_size;
>   	u32 num_ips;
> -	u32 s2d_msg_id;
>   	u32 smu_msg;
>   /* SMU version information */
>   	u8 smu_program;
> @@ -50,6 +56,7 @@ struct amd_pmc_dev {
>   	struct quirk_entry *quirks;
>   	bool disable_8042_wakeup;
>   	struct amd_mp2_dev *mp2;
> +	struct stb_arg stb_arg;
>   };
>   
>   void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
> @@ -70,11 +77,6 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>   #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>   #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
>   
> -/* STB S2D(Spill to DRAM) has different message port offset */
> -#define AMD_S2D_REGISTER_MESSAGE	0xA20
> -#define AMD_S2D_REGISTER_RESPONSE	0xA80
> -#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> -
>   int amd_s2d_init(struct amd_pmc_dev *dev);
>   int amd_write_stb(struct amd_pmc_dev *dev, u32 data);
>   int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);

