Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDEC36997F
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570027; cv=fail; b=j9lBTJ+c7TIevDbyQeLfqE18ajGRg2PthGkH3Gn8Zy/GPGYEpSZJ2IhMglglhPVIYqKLXIPpede6qsg77SvF5E6ko1X1GBRXtq+UqwtTa9PEqwkGiwdVoqWJA/6uPnSBx1BMIJ4H9nK4QfO6PgRj7/VySSHHJ83BhMo9Jslcyek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570027; c=relaxed/simple;
	bh=ksTON7vB4y5a1jd5EdYviN3pH8HUXFrt3R6ORxr7utI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HF89XJ4/Egm7YxPdXP0e7ikaEc0Rurr9OLyS8S397HG7FPjqCkx/Q/ADSgDmYbwXRsUr8aI7/Mh6KoglEEY6agaOC0766N5+xKb8rCp6EbRTMEVnjCekA9HImEBDeZcaZTZlyNluTlT2gmkUMDs5ri0zwL80TuWd2N8GkgDWTeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JnCYqXOX; arc=fail smtp.client-ip=52.101.62.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JnCYqXOX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrAqUDs27nSjObe/met9HmLmpv1dJMBMFMKxAZ5pF9Ex0kziIKkSTYYq9jROlL6RKqON6JQ7kjftDvKV4zPWEGx/IsC91RYYx7H0H6UdW+ekYiAbToPEJHrDNmocCTd2UpKt2KoQaThg+YvUUGQInwEbAKZZMDWyLTOpyEqALxfSLHEKv7FjnL6mcaictxGC+XQgdnqgcz4bTH4s2V5/6ic7oucfA4z7l3LZ88fujndiy8YyqYSw9QLaQiBA/3OV+hnHHcEQoVPev7bZwbLubwZbGJicF/NiZODlnl+hweau5dUvO0L35JzH9AQ1aZPySLHtJooYVmSNnvtWgbhi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+YRnrb566CMej7tYs+Xv4eYbyWKm4Jwwib0oNF/KVQ=;
 b=nxSLY4HkKA/d+YX7r6PjaSiOkafevwYLa3Kj8zXfRRf6A2Ox1FeaI7QNnklAt/WBLJQxNobEuTSyYFr+bqDTcvTeTnHwsx55quq88uTYuqtODvrgeQEKvde0YPDJIiyb5s5sHj4NdXbfnrXyxL4M540VVTOYDUk1/yoVlK6tnRiPxrdGLM2nb7AdR3TpKIGAxlHkWbwNDOqnPZ8LBpiK6hb/VSC7MZGNYxJgszEdOnegauNljah1cALxPmqkwuNhM3oMfKH4XW134hQ4YITHmugi8jurl/lR5/F2EEMy7VsWkwMRIH7SENGy6cuLfde6vUbQcm7+ScEgi90ACHKZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+YRnrb566CMej7tYs+Xv4eYbyWKm4Jwwib0oNF/KVQ=;
 b=JnCYqXOXE0czCszPyxObGxcggnEtZrL03e2C4yl/qHQ6Yrh4DNpHPye2/uzkK4MHNR6dJwVs8zy+x76bu/75pOVKX4SL1vcjPFePbJ4tK4b7Qv4cx5kvIecK0SlE81X3UcWZewp03Lr6EMBZDudjR2uqHCKekA2pMh8q4YO4d24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:33:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:33:07 +0000
Message-ID: <0a4eaad1-d312-4c43-94f3-b1d9986c117a@amd.com>
Date: Wed, 19 Nov 2025 10:32:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce AMD PMF util layer and user-space
 interface for SystemDeck
To: Hans de Goede <hansg@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
 <2c40e722-ffd7-4e00-92dd-2c89ff4768a0@kernel.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2c40e722-ffd7-4e00-92dd-2c89ff4768a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e05fcc5-5137-4036-acfb-08de2789522b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVFvNDlSbTlHU3I0VUg4LzJJTEIxcjZsL3prUEw2RitYZ2t4OUU3UmltUXdQ?=
 =?utf-8?B?cjduSlczK0daTDk3VThKWDlTb1lKRUNvd3djdmRIMDQyUGJRVGVNVGVFZ3A3?=
 =?utf-8?B?UnIwM2Z1V3I4ZXdpQmhyalY0aWpMWVJFQWFOTW5TbG1uUVF6bU5nUVpuKzhz?=
 =?utf-8?B?MGN2N1hXTGlsbzNQTVl1NmxvVzhzOFRpMXFtYWhZKzJ4RmNRQkVRcEdYTHhS?=
 =?utf-8?B?Uy9BdTBIeTRxbElhemtKdFQ1ZitKZ2ovMjBZaEZQV2kzUENYMkNROGU1S1Va?=
 =?utf-8?B?dFdFWTVPODQ4cGFHZ0xPK1N1UTkwcmErVFEzRWNjaElPamtUMW5hRmtaYkxs?=
 =?utf-8?B?blhoZVJrcnA4ZjhialduOHFHdURIUWJ0Vy82b0M2R0VWNG8yanlKU2luZG1I?=
 =?utf-8?B?dnplRlRFbkZvVlF1d09McEpyZUd0eUp0UzFvSjJQUThMY1R6cU54bWNaMGJj?=
 =?utf-8?B?c204YTJuTk8zUm9ZUjVjdE1qbDk4R2ZkYnZ0Q0xHaEVMb2Zrc0VrNlFzQzVX?=
 =?utf-8?B?TnQ3Y0VDRUpIQUpRdGp2SWhuMkFZbE9zWVhnNXZ6M2M4QlBVcndYTXp2dk5F?=
 =?utf-8?B?dUd2ZlU5K0R3c1RKdmJ1L1dHdWJVL1MvNEFmUGxrVCtCTTRqOUlZbkVJYmcz?=
 =?utf-8?B?SnRsMWIyZmxvMkp0cG9DWEdrK2dxMGQzWnI0SnhhM3JhVmdJUWdhdHF6UjI4?=
 =?utf-8?B?N2ZodU10MWJnbHJ1T0JhN0xreHg1YXp2a21aUnNHNVZ5bnFOY1Axd0psemNk?=
 =?utf-8?B?UVRJdlhCZGZUekZISG13VDd1ejgxS3RDVHNGajcvVm5ydXlBMmhkMm5hU05U?=
 =?utf-8?B?TlhVNDlGTWM5bWhVTTdJbEQwWUMzbTFJTlVtSU0vcmx3V1hDdWh4QmtEUEhN?=
 =?utf-8?B?elBaY0FPNng1OEtjYitKTEs0UGNtKzBlaE1Ba2V6Z0xLWElqMkNtMXAzVkFW?=
 =?utf-8?B?aDF2d21KMW92WkxNcjhvUUhRQXRZV2lnQTBtOVdaQ3JPNFQ1dkFmUTlBQWpR?=
 =?utf-8?B?cHI4bnBQTGxXMTVVZ3RkNFYzY0kzS3JNMVk1WnJmT0M5TXZJRk90YlphUDE5?=
 =?utf-8?B?cjBxWHAvbDB1M1JTWFJacVhZRjFCSU5QRXFsODBuOEZPTER4dXlwQU1uQVJu?=
 =?utf-8?B?QUNCTlNDaVE0Rm1JcWw3V1RyYkJIbGVzUGJ5MG5BSFJuaUFoSmtobUVzbzlE?=
 =?utf-8?B?Mi9DY2FHUXFnclpxVHg3Q25aSVkyMmFOTGlVemtaWDFUNjdQMVpyWE9IYlhW?=
 =?utf-8?B?L1U3SG1uVk9IQm0wQm44dDVKVG8zYlRzT1VWSzBqamJvOG5LUjF3Q29yVWo5?=
 =?utf-8?B?Mm1FdnExR3NOVmxUNkZFSENwUTJNRTdERVQzLzVDaEpXeDlPcWZsWEcwZWZD?=
 =?utf-8?B?VTg4RGh2cHlqVlV0V0FIcDFRa2E2Myt4VTVkZHRSTlVMd2FYN2FrYjdDZ1Ro?=
 =?utf-8?B?QWpod0s3YUJON2RxenJGWStjWk9PRzBDWGJkSEp0cEFYK2ZVWkRoaHE2b0Ew?=
 =?utf-8?B?Y0hLeEd3bmYyckR3eS9DUTJYdGJxeTNCZSs1VW1MTnI1WlBYREhidFdOdFlF?=
 =?utf-8?B?MmdYV2k0MUlQMDRDZFFEcmVXMVNPdWxKdVZqNHI0eG5RM0xQV1JLTTYrYnNJ?=
 =?utf-8?B?ODVlZTZmYXA1MzEwYkk1N1l2ZVZUaHR0WER6Nys1MkplLzRUV2lNTEJpQmQy?=
 =?utf-8?B?a2MzaE5TR3plUHBaKzR4UTl2NVhqMkZYbW9kS2IwMndxN2hZdDF1MHVzblBG?=
 =?utf-8?B?SGc2VmpkSlVIR21ncGRTaWtvb3dDS0F6a0hMdE5hekJ3RjhvdVgvWTNNTTl4?=
 =?utf-8?B?VzQ5L0hacmsxZm9nblNwWXRDY0ZCK3NXVHpwWG14S1kyM2dhU0J4MnJ5QTlh?=
 =?utf-8?B?K2kyMEY0UDBLSk4xMVpMTXJLZml1eHZnNWhBa2JiRm9CWkxtOWErUmw0Z0dx?=
 =?utf-8?Q?67HCGMbxpS7JeRTLhFiwIEev4x2TBVKf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmVMTUtkV1FqTVBRbGdreHFoSVFDQjB1cFJvdTFWejZxQ0txc3VuTGwvTGx2?=
 =?utf-8?B?VXpqWVd1OStONWFsdjBLVFFJQ04zaCtQMWZ1NkFUTTFFejVaSEVSZ1dYaWV6?=
 =?utf-8?B?ay80cmxCMXVrM2txK3FuZlhtQWdGOXZkK3JpKzB1TG5HNjZWK1pBSUtydWxY?=
 =?utf-8?B?c2o2b0svTmMrMEhkai9jNkdOTGl4YmhGVEM2U25FNG5vd0QvR1VETjlYTkxB?=
 =?utf-8?B?Y211VUQ5aWVzd0RqU3d4SmlQTHJmY093U2MrZGdUb3JyY2RrSlNybm11SGsz?=
 =?utf-8?B?NWhaU1dwd0xmQWZvOWJEcExYWkhYVHpUeGFTaGhNU0xSR3FxaTJ0UFRqQlFZ?=
 =?utf-8?B?TFBadzBCNXl5WTZjVjYvelZXZGU3NkZTM2p6aHAwbVlKVEdPWURwZ0d2QzJx?=
 =?utf-8?B?WHhRSktBb2xOalQya2t4aEduTEdSTWRoRk5EZW8rRXZEeU81VnAyR21xUjBs?=
 =?utf-8?B?eE5sMDkrTWM1bnNGRzRxUVBFZ2VVYnZhMGcyTzBuTGFxVWsxaFc1dUZNMXBx?=
 =?utf-8?B?ZFZldVZZRDhJY0hyK2JrdElUUHRRZnFPQkEyQ0VOQlhoRmVGN0tzNHpHQ1Zu?=
 =?utf-8?B?aUdsb2hQNmRjdHJMZGNHQTlaTWcvS09HclV5TkF0ak4zdS8vUXphS05mQnJM?=
 =?utf-8?B?SDVLNWpRRi9FRFBXdmJ0WkpZbGJIK3RTMXhXb2xJRXFjWUxtV1pNMVU5VHZV?=
 =?utf-8?B?WFdDL256dE9aeU1SS2krbEFreEpDNklZMmtieUwwSUxBTXlscmVTQ1huZGNs?=
 =?utf-8?B?ckVGaGJIVFNNN0lNdC90VnhVSDgzRUJkd1NtTGtoazMvbm9aRFBrQnExMEtE?=
 =?utf-8?B?NWd2dGF5U0dtc3Q1T3lKL1NmbEJsb2VnRS9uMUZOSnA5aFlJL1NiM0p0K2xw?=
 =?utf-8?B?WXJqd0hvZ1NwWGNFaURHUitjUlRnMmVwSFA5L2lpWEIrMmFWdkN2UFduSUww?=
 =?utf-8?B?MFlGaVQ3S1FkK2pBOFljQlBrS0w4Y0luZ1N4MVRXMDR0c0ozdkF5NTBJSzVK?=
 =?utf-8?B?RWMrYnNpelJvRlQyVmZGRnV5TW5NcDNVcitYYklmYW5hT0FaTVV3REw3ODZh?=
 =?utf-8?B?a0o1QU8vVldSNTRwY0c1a3ZZLzErTUd4VDJTUXBXN2pqd1BFbkNtaW1weWs2?=
 =?utf-8?B?YnJ3YTBRcjExSVhUcTZVM3NsbSs0ZXpkbW44TTc0UXd2RGdWL1JqN3g5Skgv?=
 =?utf-8?B?eGhkZFJaZko5bnl2UmdrWFFtQVRsR1NUNXRBUFNxQVBHOWV3RW1EdTJ1OFVS?=
 =?utf-8?B?UE5JdW8rdnB6T3ovTWU1OG9YMEF4RzZMQ3E0NTV3U2JvMXFBNktVUFpMZFpl?=
 =?utf-8?B?M1lqdUZjOEIyZ3BvREc4Sm54Smlhd3RBdVg5ZnVBak55QzhNYzNRWU9sUFM1?=
 =?utf-8?B?eG5ybnNzUE9XYkUrQ1lMZ3hDQmJLdWR3RkdpRnd3aDZrNUxrSEFJdm1vZU4v?=
 =?utf-8?B?ZkNKL0ZDdThhN3duSGZCNEg4UG9MVzFRTkxCOVEzMEZyQzNqbEZPL2dEUFBK?=
 =?utf-8?B?YjRranRzNFVqN28vMUt2dG1uaHJwVTJCV2JQVE12d0d2SkNUNmZJRUhmK2lx?=
 =?utf-8?B?VFFVYzdvK2R4cTFoVHdYMVJTSWttMEhpUmRUaDc2SWVjdFBRb1pmL3JVdXFk?=
 =?utf-8?B?UnhVMkVNZnh1RTJxZE9DSnNuMXhycGV3L1FSY1RjR04vUHljc0JIc3hJcmtM?=
 =?utf-8?B?U1JLR1JOM0N0MUVDNGhoRzFRR0ltN2tlYlhWMVAxRjRjNXJxakVEckFZaDMx?=
 =?utf-8?B?d1hwUXFRbFFReGwwdjVpMm1TMkZhdG14Y0RZTStZaTB0dmpEbDBGc3JWYmRO?=
 =?utf-8?B?VG91QnZOWkpscHNLRmhtTnhmSjhqOHFzUndWeDRuWlUwV0QvRVFibjBpZ1cx?=
 =?utf-8?B?SjVSS1VnWDVCNGZtS2hnNkNaRVVPaEtKYzd0MG9SV3U3UDJSZ1NhL1ZsL1lU?=
 =?utf-8?B?U0M0RVlYaGFQVjcvTUNjL3VMOGt2NkZJa1ZPa1RZalhibUMrcWVZL2VYY0pB?=
 =?utf-8?B?enNET3J1ZVVzRmNhb0RGRHgvWHZNRFcvenVINnBUd1QzeWNzbFFLdWNNeGdj?=
 =?utf-8?B?bHRMOXZucVFSUFdkUnB5cDN3ZWRFOVFPN2ZsYlppV3dyK24yOVppUENYaEcv?=
 =?utf-8?Q?/kA6flTseFS9k+N6bbXA3iwnM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e05fcc5-5137-4036-acfb-08de2789522b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:33:07.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYZwxM+0s5CG0fqZLlx+aiGX5kPLrJkAPzeve6o6zTh/HghK/bzCKuS/0BeaUxKaIFBkqIQsBOtc+etqEwTXcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920

On 11/19/25 10:20 AM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 11-Nov-25 8:10 AM, Shyam Sundar S K wrote:
>> This series introduces a util layer to the AMD Platform Management
>> Framework (PMF) and a minimal user-space interface via a misc character
>> device, enabling feature discovery and smoother integration with
>> user-space tools. It also adds caching of BIOS output policy values to
>> prepare for user-space telemetry reporting via IOCTLs.
>>
>> The motivation is to provide a stable interface for user-space tools to
>> discover PMF features and consume selected metrics. Enable smoother
>> integration with AMD SystemDeck
> 
> This does not really explain why you've chosen for a new character-device
> with IOCTLs instead of sysfs where as so far (AFAICT) all the AMD PMF code
> has been using sysfs APIs.
> 
> Is there any specific reason why to switch to IOCTLs all of a sudden?
> 
> Note that:
> 
> 1. sysfs APIs can be (and must be) stable too, sysfs APIs are not allowed
> to be changed once shipped in a stable kernel.
> 2. sysfs attributes can be used with poll() to so if you want to do
> notifications of changes that can be done through sysfs too.
> 
> Note I'm not saying you must use sysfs, but so far the PMF code has been
> using sysfs everywhere and this new IOCTL based API is not really consistent
> with this.

Isn't there only one sysfs file for turning on/off CNQF?

> 
> So at a minimum you are going to need some pretty good arguments to
> deviate from just doing this with sysfs as has been done before.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> , a widely used tool for monitoring and
>> controlling power and thermal behavior, helping designers keep components
>> within thermal limits to ensure proper operation and improve system
>> stability and reliability.
>>
>> This series also adds a small, dependable userspace utility that leverages
>> the new IOCTLs to query live power and thermal telemetry. Exposing this
>> data in a scriptable interface helps users and tooling make informed,
>> workload-aware decisions and supports validation and debugging.
>>
>> v2:
>> ----
>>   - address remarks from v1
>>   - add a new tool that exercises the IOCTLs from PMF interface
>>
>> Shyam Sundar S K (5):
>>    platform/x86/amd/pmf: add util layer and user-space misc device
>>      interface
>>    platform/x86/amd/pmf: cache BIOS output values for user-space
>>      telemetry via util IOCTL
>>    Documentation/ABI: add testing entry for AMD PMF misc device interface
>>    platform/x86/amd/pmf: Store commonly used enums in the header file
>>    platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>>      metrics and features
>>
>>   .../ABI/testing/misc-amdpmf_interface         |  49 +++
>>   MAINTAINERS                                   |   1 +
>>   drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>>   drivers/platform/x86/amd/pmf/Makefile         |   2 +
>>   drivers/platform/x86/amd/pmf/core.c           |  19 +
>>   drivers/platform/x86/amd/pmf/pmf.h            |  33 +-
>>   drivers/platform/x86/amd/pmf/spc.c            |   1 +
>>   drivers/platform/x86/amd/pmf/tee-if.c         |  10 +
>>   drivers/platform/x86/amd/pmf/util.c           | 236 +++++++++++
>>   include/uapi/linux/amd-pmf.h                  |  96 +++++
>>   tools/testing/selftests/Makefile              |   1 +
>>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++++++
>>   13 files changed, 832 insertions(+), 22 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>>   create mode 100644 include/uapi/linux/amd-pmf.h
>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
>>
> 

