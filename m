Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEB1C2324
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Aug 2024 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944468; cv=fail; b=njBBKaCxhML24/2e5VFke4201twEHipGGT8D7v12ABU/TGJ55u6pwcihr60JwbbYCWW/fWn7hoZMooWRSUqzJGqpjZd8hfljk8/aljcloj1FARGqAfDIq6AAlxaLqbgWLWfX2M+LivG1xlTBi6+BGvVfNU9oGuW+mSjuf0iC6xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944468; c=relaxed/simple;
	bh=9o7TfFjBScAPC71Yuz+PSFW//Kdj/oHkE452Rs7VEEg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F8KqM0Rmbx/fT2EvM1hLx+AnOMpKyMac2bu6A1grQHoMzJ7GKFBXImkYRo8E60IMgVaUV/fPn42czQf4aQ78i1cYe+y+fVQiNptijSd+7DbdJF56BbVamZpI9rx+BFEGhb8q62/pLIbN9YwdsS1y70uVyTrcfpExTRAaRw/GiSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mnctGWui; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mnctGWui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0D9SzF0b+C4cGr+Ltwn+qVgUawDjZ1aM3Okd7p9RTzkpfg//s52yR730bx6EU8PHGg1/EGJmHUmIYIhWKdRj7c4GvL/9wOYO47lCQRBoTmxaY02D/SRs57iVsw/p5A6xHPu5JotuCweyuynZLChBr9rTL2AmW0fZMIym0Y92F/4WtkI7zjtCbmnPyJ+2O5rTJUESuZEwbEx4hA7DMb2lA5IH7hVzFSoEZFzokCMLQCF0a0eWvpq9HUkxpS4gLL/Rk9F0bq/9QuIT/2yugsF+/GArczZMePcwiy6JtvJpS0APowGyt0T+f587CQrfMGOTyyf6LfvAraio1FyoIL/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUYYfM2WbAqbCiJQC6ZVNMJk5UT5/Wd0ymsWpO10xKQ=;
 b=YRr7s+TtOYz1Z+2/bhSN5Dhq16JnfzeQXJW190bGqG1BxNwxYHTsKJPMxh7YONnwteS/FOpw1eclNqnuxFhF2GoNGzF+EMTDNOEVXhpTPFQWjjZLdyswduek9/MUKdibadGSPzDwMmgh546Zgmr5BvXVYaRdQk3wyLxS9OYe9Yus8GuIsGPEXlPFtNt5kVIpWmqL3IZ2LzoO46ikRH10cixjad0lwPwZBtpOR/TruQw8HeX7N0QE+s/Q7bA9u+nj4Ai47M8HSobbPrIzd7kjwqFCOvPgpU9FKH+3Gm5vV2DRxhcu7VSZUTGEqVL7qPJs4PzyWl8+3GrG0WLmV7joMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUYYfM2WbAqbCiJQC6ZVNMJk5UT5/Wd0ymsWpO10xKQ=;
 b=mnctGWuiNdA0CZW1BOJmhLFmZwNlKFOJOrIIMgOvQBvUNvq5XL0M/91q8RQxoxohFB3PwP0rM5s3a/n8fo5HYqYH+axx2QdVNZndrRywfMQHH2Xm5W7JnhcFcJZiK5UlYHhLkFaxxj6WjEEX5xkAPuX9TgfoqDLszukpIAMZRE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Tue, 6 Aug
 2024 11:41:02 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 11:41:02 +0000
Message-ID: <7ef3771b-f937-4dd6-8c4d-c96ed409cf2e@amd.com>
Date: Tue, 6 Aug 2024 17:10:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 07/11] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
 <20240720174552.946255-7-suma.hegde@amd.com>
 <79cf8fb7-15c5-49c6-b915-dab275510ebb@amd.com>
 <5fed5a6f-f653-fc14-9935-16c82964ad74@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <5fed5a6f-f653-fc14-9935-16c82964ad74@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::30) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: fc096e23-d3ce-4373-587f-08dcb60ca652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXZES1Fjdjl2WFpxaUtqN1VIeTFFSFc3ejl1RzhWS0szdkpNZDVmM1hlSzUz?=
 =?utf-8?B?Y2R5SXM4R1VJRXpSajRBZlYxcTlGUDdWVVNnb0Q1SWZubTBvaTZtMmdCSVc0?=
 =?utf-8?B?V1ovZkhqbzNUMDByVkR3T09DTndPVktsR3oyMU41T25tbXplVDlncVQyMVhk?=
 =?utf-8?B?SmFVYy9Cd0szN2xKR21kdWU4SGlnMTRXWWREb0UvVmVobHIvU05RVFdmcE9C?=
 =?utf-8?B?SDRTRWFzRTJ0MXd3QUNqQ21BeFlUMzBoTDVoaUdzZzFqRUZVMmJuSXF0RDNC?=
 =?utf-8?B?S1lyMDB5ZUNuaXlnZ1kyYXFTNjBMeWl5WklQVU5sSUVZTEtSRStxMHUzbWgy?=
 =?utf-8?B?Z0EyT0hkUVlZRGdXaytVTU8rK0FyeWp2bThTV0dZUFlMTnhscEtzNGhSMGVL?=
 =?utf-8?B?OGwvRWRpQmdGd2NZME9HMlVpRXhDVlJkY1A4TFBzZENvZ0wxdGZXeGRkNEJY?=
 =?utf-8?B?bTE2UmdRRkZHQlBKS01GYll2YTEybzBlT1QySHozdjNoQloybUx1K20zTFFF?=
 =?utf-8?B?aWlEZXEyM0tWQXR2OUl2YXRFL1RBamg5VG5LaHI0cTBLYkpkQ2JqdXkyWmh4?=
 =?utf-8?B?UDBVR2t1ZFRBWUhIZ0h1MmlvdWdTTG5VL1o4VHJ1MzNmQjRucGFLbmhYL2ZV?=
 =?utf-8?B?S1dYNHYxa0ZUMTkySk1uS09LcGYzWFExZGFNVkYrMm9iVlBJeS83MFFpV0x5?=
 =?utf-8?B?MjI1WVVncE1ndmdsTXZtaTcwdWVVTTdqTnpJVDlwS0dEMTZudTVEdTNZYk04?=
 =?utf-8?B?SkJ3M0U0VXF5Q1Zid01aQUcxYlFrT1RiZDg2THpjYktYbWFiUnlnYWR5Qll0?=
 =?utf-8?B?Q3FSWnROQ3J0YlF4cDZVSnJaZEx6bWR3TitVOGJPdGRnOC9RdFUyYUJFQUpD?=
 =?utf-8?B?Q2hQU3ZVZVZKOXYrMmo1cjh2RGJqS3VTYkxCYU94SUllR3N6YU9aUUlXYng5?=
 =?utf-8?B?SFVGWEhkZGtXUDZRNVYxVkxveWc5OUhHSGUvdXlmcEY4SUwvV1pOdzVFdmc4?=
 =?utf-8?B?VFBPQ2MxOXdYWjRhOUVsemRna1JBQjFncVh3dEpjdFo0cXU5UmpCc1JJUTJM?=
 =?utf-8?B?OWJtSVdaKzd6d2NGZ2hMcVVETGRmNDg1bS9VbXdya1NOd2NMR2tBRTNIb01O?=
 =?utf-8?B?WnpTeEVtSGlNRjlVc1M4MkJQSDNYai9Ua29HZnM0SmxlLzU4WjVyd1A0UXNC?=
 =?utf-8?B?Q3M2eGtVY290Q0J3N043TnFheG9peXA0N2hydFM3MzBRRXNyQ0YvbkJYSG5a?=
 =?utf-8?B?WnJyV2tvREFDYlhIaW04bHF0emJXL3J5YlRlR29iYnR0eXJXMUtJOXZBeDE0?=
 =?utf-8?B?NDFaSW54U3lQQnZyOUZndjdCYjl3VkZwMXM5RVc3c3YxRkM2YTBJeWxCYXZJ?=
 =?utf-8?B?ZCthbTBqb1RiQnRXeWFkMDNuQjNaLzNOY1JUNERFd0lZekJoYWxKbHk0czZU?=
 =?utf-8?B?MmRaaUxWb1pBK2hyVHNKWEo0ZFJmbk1nTzN3UHFnOWZEemhqK1M1RmJla2Zp?=
 =?utf-8?B?Zm5DcjdOaDN5OUR1TEZNcVAvOEpFcXRkZTBobVljZkZTV1RnNjMySEVlQkM1?=
 =?utf-8?B?OHlOelhaTTlIVkZKWmdTL1ZUeWt3b2F4dW5UWXM2TkNRNGtOaUI3SGx2Vmtn?=
 =?utf-8?B?RkkzcVl5aHAzbHNDYkpSUkdXV2NWOXdSa3ZqR2xEM2MzYXhPT2dKcW5mTWpD?=
 =?utf-8?B?YTJ2ZzRRVzNYNC8zM3luMTF4dklBQ0k2OVl3aW9TTWVUcHVEcnpqR0xtOGVN?=
 =?utf-8?B?QVNNK0VraVYxbVpSTm5xZVhuL0U3Q0VvcEdLcDc1NUxOTGNWWU9YdmFQUi9Q?=
 =?utf-8?B?RTAwcDBWalZITHFmL1JVdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OC8vWDRSeDFKOTBLYWJiaElPSWVneDgrUjE2UkhiNm5pTVUvbVkzYUMvNlFo?=
 =?utf-8?B?QTlUTjF2TkJPSzVMMk9qTGJobVgxN0ZNWVRPUFpWc1A5SFhEVnVFRHAxRWJl?=
 =?utf-8?B?clVZa2xaUjlaL1N3R1QyMUYzcE1MK1R2RENreW9yNmVDczM4NWNkSHZyL0ov?=
 =?utf-8?B?dWlHK3RRY1BRang2TWpKY1Vnd0FxR1dRYjcrTURhUzV3ZExkWGdqVFlRSzg4?=
 =?utf-8?B?ZjVrOFFheW9tZkZzN2pRcUxVdWNFQUdUU01RRVZTczVvRDZqbmlmL1ZIVDVU?=
 =?utf-8?B?OVpzblBtbTNJaVRrWEJjVENFMXVidW1mMTd2TjRqRG42aWZvbW9JWjU3amh4?=
 =?utf-8?B?MjVXTldyMFJuQmE1MWVLb2pEWVRGL1g4VzdNdmp5enMxZTNBOXNqYWdxeEk5?=
 =?utf-8?B?eGV1OEJ3RWR4U1BPQ3Y2YTRqL2E3Mk9mZnRMV0ViRWRLK2g3ZmlFNEZtQTNp?=
 =?utf-8?B?Vk8wT0VFVDR6Ry9QbDgySlpFaTZqMzZ2TjBJdXFZTmJWckJOT0pHTFROeHZP?=
 =?utf-8?B?bHlNNWpjNjNlbWRFVUgwWU96STQ5cjVURGxLU2NjTnhJZ0F0NHdHQ0I0MjYr?=
 =?utf-8?B?WXUxMDB0dVVrVjFsc1lXZDF1MmhMTUpSOE1BS2dKSzF1TGtXQU1DWUZoZEJp?=
 =?utf-8?B?SWs2N0k4a1ZyNGpNY2Y2NTZZSU1VK3lZSWpvS2c0M3NUSkNJSlhaU1Z0cnZR?=
 =?utf-8?B?TjNYL0NHOU1MSlBLOGJXR2N1NEoyck1Dc0VPRUFOaE1HRjI1Z1ZLODd6ZEs2?=
 =?utf-8?B?WWtGNmIwUmdUcVorblNVRFQxZ0lzY0xUQ2N3QVRIdEFHTFV5eU5yZHVIUEpT?=
 =?utf-8?B?UHJiWUs2ejlwV0dZdkwwak54ZlBNTXFMTnZhN1AwVzFvOStnVGUvSGIzNUJQ?=
 =?utf-8?B?MVZaaU5DbS9lQ00xVTg2bVEweUVOS0hGdmhmUFQ4R3hWN3FDTFJodHBoZjk4?=
 =?utf-8?B?NXRFTlhUeXQyWEpVM2Fud2ZwRzUxS1h4T1psMVBEaTRRRC9OR0ZnczVMaDhk?=
 =?utf-8?B?S0NMcFVyeDJYN1lYUm1YK2NVQUI0WEt2WGZNK2orU0VBTmcvZzFTTGFKWVVW?=
 =?utf-8?B?VUVKbTZ5Y0ZkZUp3Q1I4RlNmcmNtTFN1eWNncllXVmx2WkFLZDQwL0EwOGFZ?=
 =?utf-8?B?OTdjRWNXY1Q2RVRZVzNFUWJNRHdRRHk0aU9vR0tQSHNRMmtCbVZMS3Q5V1k5?=
 =?utf-8?B?NmVySG1pVlJJdTRNOVJoT2tKZkFqWE5tanZkdDJMclpCMm1DQU5JQ25qaWMz?=
 =?utf-8?B?RTljQ3FON0xsaDZITVd3Y3hVUmQzekt1eGFZWU9Qc3dyMnBnVnB5V1J2S1dk?=
 =?utf-8?B?dVl1QlFSR0FhdzhlUlpxT25TUzdkdVV2eHpBZ0hkYVJWbm5nd09nVEQxcDRv?=
 =?utf-8?B?bWJjM1UwZlRPRVd0TVhDQnJlSTViM0s0VUNCdkpPQ2syRmpiZTFaVGszSC9h?=
 =?utf-8?B?bjVwVVVZRkxBdjhYZWVQN3plYWVVT0J6K3JFQzk5WkdtUnhyRk5GUHk5aE84?=
 =?utf-8?B?T2wyOEZrNEFmVnFobGV5OTVXOHhqMENpVTZ4WDg0SWZrQTA4bmlrMU5CSGhG?=
 =?utf-8?B?NWZVTTZJSjFoTjc3cUplSDN3c3FFdmZuWUsyK0szdGJhYk81ZjhqaEMwdVFQ?=
 =?utf-8?B?L2dBVkJWckludkZVdXdBNVNJNmlVcDBZWDJFVXU5eDQvSXltWTZWRVRvYUk0?=
 =?utf-8?B?aDRYaVRvcWdSRE05RC9xZDdpN0FJVlZWVjJ1TWRJOWlObC9odVNLeDhpQmZj?=
 =?utf-8?B?eWJGQWZZd0J2ZUxCTVk0c1g1anRrMHFuaDBDR2JwN1BQZjJHZHlLaXhzYmhi?=
 =?utf-8?B?YlA0b2FqZDBqanVQbnI4T1dPV1paVlJ5RUFrQnNiaCtwVDdHRzkxT0ZMMC9u?=
 =?utf-8?B?MEowWXhxRUdiSEp6Qk9zT2R0VkloeXNFc2tXbVZsdVovTEp0WVMyZytESGtG?=
 =?utf-8?B?RmI4eE8yMWppTHp5ekpqb0grQUZxWlFSS3VnZDd4ak9sQkN4R2VFbXdLNi91?=
 =?utf-8?B?S3ZHNW1xUjliZFlTU2Z5bnlHUXFnSER1NUdkQXdGSlEzVDI2N1A2RjJNdTJK?=
 =?utf-8?B?c3dyRlJKSFBXK0QrNjJoVmc3TXJpdnBWeU9wUW9lcEZoVXpKL0g0TlMwcjNF?=
 =?utf-8?Q?YC5/zcan3GMTbejHQq9cIF5rd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc096e23-d3ce-4373-587f-08dcb60ca652
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 11:41:02.8801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qterznYy3b2c3muPaCMRQU4d9UZHfPqMOswLnstZHEhQ0DD3Q1BgwwzoNekBHq1ToKoaf0cgw8iiwLhrK+ahaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194

Hi Ilpo,

On 7/30/2024 6:50 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, 30 Jul 2024, Suma Hegde wrote:
>
>> Can you please check the Kconfig and Makefile changes and provide your
>> feedback?
> The Kconfig symbols looked better (but I only took a short glance but I'll
> take a look at it later, likely not before next week).
>
> I'm not fully sure if it's good to base the exclusion into build time
> dependencies though.

The current hsmp driver in the linux without this patch series, 
dynamically checks if ACPI HSMP object is present and if not available 
registers a plat device.

But with this method, we are not able to support sysfs groups through 
dev_groups pointer separately for ACPI and platform device based drivers.

So to address above issue as well as based on your suggestion, we have 
split the driver into two and made them mutually exclusive.

And, we are supporting ACPI alone for future platforms, platform device 
based driver is only for legacy purpose.

> With distros, the expectation is that they enable
> everything which means the ACPI one will always be enabled and built, and
> the legacy module never is.
We are not selecting HSMP ACPI module by default based on ACPI config, 
so either ACPI or plat device based driver can be enabled.
> I don't know if there's some mechanism to
> prioritize one module over the other if both would be built. I'd expect
> that to be the most desirable behavior here, ie., first try if ACPI one
> loads and if it doesn't probe successfully, try with the PLAT one? Maybe
> Hans knows something towards that direction?

> --
>   i.
>
>> On 7/20/2024 11:15 PM, Suma Hegde wrote:
>>> Separate the probes for ACPI and platform device drivers.
>>> Provide a Kconfig option to select either the
>>> ACPI or the platform device based driver.
>>>
>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>> ---
>>> Changes since v2:
>>> Following files are modified to add new symbol
>>>    - drivers/platform/x86/amd/hsmp/Kconfig,
>>>    - drivers/platform/x86/amd/hsmp/Makefile
>>>    - drivers/platform/x86/amd/Makefile
>>> AMD_HSMP is used as common symbol and new AMD_HSMP_PLAT symbol is added
>>>
>>> Changes since v1:
>>> Rename "plat_dev" to "hsmp_pdev"
>>>
>>>    arch/x86/include/asm/amd_hsmp.h        |   2 +-
>>>    drivers/platform/x86/amd/Makefile      |   2 +-
>>>    drivers/platform/x86/amd/hsmp/Kconfig  |  33 ++++++-
>>>    drivers/platform/x86/amd/hsmp/Makefile |   6 +-
>>>    drivers/platform/x86/amd/hsmp/acpi.c   | 119 ++++++++++++++++++++++--
>>>    drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
>>>    drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>>>    drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
>>>    8 files changed, 188 insertions(+), 129 deletions(-)
>>>
>>> diff --git a/arch/x86/include/asm/amd_hsmp.h
>>> b/arch/x86/include/asm/amd_hsmp.h
>>> index 03c2ce3edaf5..ada14e55f9f4 100644
>>> --- a/arch/x86/include/asm/amd_hsmp.h
>>> +++ b/arch/x86/include/asm/amd_hsmp.h
>>> @@ -5,7 +5,7 @@
>>>      #include <uapi/asm/amd_hsmp.h>
>>>    -#if IS_ENABLED(CONFIG_AMD_HSMP)
>>> +#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
>>>    int hsmp_send_message(struct hsmp_message *msg);
>>>    #else
>>>    static inline int hsmp_send_message(struct hsmp_message *msg)
>>> diff --git a/drivers/platform/x86/amd/Makefile
>>> b/drivers/platform/x86/amd/Makefile
>>> index 96ec24c8701b..f0b2fe81c685 100644
>>> --- a/drivers/platform/x86/amd/Makefile
>>> +++ b/drivers/platform/x86/amd/Makefile
>>> @@ -5,6 +5,6 @@
>>>    #
>>>      obj-$(CONFIG_AMD_PMC)           += pmc/
>>> -obj-y                              += hsmp/
>>> +obj-$(CONFIG_AMD_HSMP)             += hsmp/
>>>    obj-$(CONFIG_AMD_PMF)             += pmf/
>>>    obj-$(CONFIG_AMD_WBRF)            += wbrf.o
>>> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig
>>> b/drivers/platform/x86/amd/hsmp/Kconfig
>>> index b55d4ed9bceb..23fb98066225 100644
>>> --- a/drivers/platform/x86/amd/hsmp/Kconfig
>>> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
>>> @@ -4,14 +4,39 @@
>>>    #
>>>      config AMD_HSMP
>>> -   tristate "AMD HSMP Driver"
>>> -   depends on AMD_NB && X86_64 && ACPI
>>> +   tristate "AMD Host System Management Port driver"
>>> +   depends on AMD_NB
>>>      help
>>> +     Host System Management Port (HSMP) interface is a mailbox interface
>>> +     between the x86 core and the System Management Unit (SMU) firmware.
>>>        The driver provides a way for user space tools to monitor and manage
>>>        system management functionality on EPYC server CPUs from AMD.
>>>    -   Host System Management Port (HSMP) interface is a mailbox interface
>>> -     between the x86 core and the System Management Unit (SMU) firmware.
>>> +menu "AMD HSMP Probe"
>>> +   depends on AMD_HSMP
>>> +
>>> +config AMD_HSMP_ACPI
>>> +   tristate "ACPI based probe"
>>> +   depends on ACPI
>>> +   help
>>> +     This driver supports ACPI based probing.
>>> +
>>> +     You may enable this, if your platform bios provides an ACPI object
>>> +     as described in the documentation.
>>>                If you choose to compile this driver as a module the module will be
>>>        called amd_hsmp.
>>> +
>>> +config AMD_HSMP_PLAT
>>> +   tristate "Platform device based probe"
>>> +   depends on AMD_HSMP_ACPI=n
>>> +   help
>>> +     This driver supports platform device based probing.
>>> +
>>> +     You may enable this, if your platform bios does not provide
>>> +     HSMP ACPI object.
>>> +
>>> +     If you choose to compile this driver as a module the module will be
>>> +     called amd_hsmp.
>>> +
>>> +endmenu
>>> diff --git a/drivers/platform/x86/amd/hsmp/Makefile
>>> b/drivers/platform/x86/amd/hsmp/Makefile
>>> index 0cc92865c0a2..18d9a0d1e8c5 100644
>>> --- a/drivers/platform/x86/amd/hsmp/Makefile
>>> +++ b/drivers/platform/x86/amd/hsmp/Makefile
>>> @@ -4,5 +4,7 @@
>>>    # AMD HSMP Driver
>>>    #
>>>    -obj-$(CONFIG_AMD_HSMP)           += amd_hsmp.o
>>> -amd_hsmp-objs                      := hsmp.o plat.o acpi.o
>>> +obj-$(CONFIG_AMD_HSMP)                     += amd_hsmp.o
>>> +amd_hsmp-objs                              := hsmp.o
>>> +amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)   += plat.o
>>> +amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)   += acpi.o
>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c
>>> b/drivers/platform/x86/amd/hsmp/acpi.c
>>> index 46cb86d5d550..86100943aadc 100644
>>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>>> @@ -11,29 +11,43 @@
>>>      #include "hsmp.h"
>>>    +#include <asm/amd_nb.h>
>>> +
>>>    #include <linux/acpi.h>
>>>    #include <linux/device.h>
>>>    #include <linux/dev_printk.h>
>>>    #include <linux/ioport.h>
>>>    #include <linux/kstrtox.h>
>>> +#include <linux/platform_device.h>
>>>    #include <linux/uuid.h>
>>>      #include <uapi/asm-generic/errno-base.h>
>>>    +#define DRIVER_NAME              "amd_hsmp"
>>> +#define DRIVER_VERSION             "2.3"
>>> +#define ACPI_HSMP_DEVICE_HID       "AMDI0097"
>>> +
>>>    /* These are the strings specified in ACPI table */
>>>    #define MSG_IDOFF_STR             "MsgIdOffset"
>>>    #define MSG_ARGOFF_STR            "MsgArgOffset"
>>>    #define MSG_RESPOFF_STR           "MsgRspOffset"
>>>    -void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>> -                   u32 *value, bool write)
>>> +static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>> +                         u32 *value, bool write)
>>>    {
>>>      if (write)
>>>              iowrite32(*value, sock->virt_base_addr + offset);
>>>      else
>>>              *value = ioread32(sock->virt_base_addr + offset);
>>> +   return 0;
>>>    }
>>>    +static const struct file_operations hsmp_fops = {
>>> +   .owner          = THIS_MODULE,
>>> +   .unlocked_ioctl = hsmp_ioctl,
>>> +   .compat_ioctl   = hsmp_ioctl,
>>> +};
>>> +
>>>    /* This is the UUID used for HSMP */
>>>    static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>>>                                              0xa6, 0x9f, 0x4e, 0xa2,
>>> @@ -194,9 +208,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16
>>> sock_ind)
>>>      struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
>>>      int ret;
>>>    - sock->sock_ind                  = sock_ind;
>>> -   sock->dev                       = dev;
>>> -   hsmp_pdev.is_acpi_device        = true;
>>> +   sock->sock_ind          = sock_ind;
>>> +   sock->dev               = dev;
>>> +   sock->amd_hsmp_rdwr     = amd_hsmp_acpi_rdwr;
>>>              sema_init(&sock->hsmp_sem, 1);
>>>    @@ -209,7 +223,7 @@ static int hsmp_parse_acpi_table(struct device *dev,
>>> u16 sock_ind)
>>>      return hsmp_read_acpi_dsd(sock);
>>>    }
>>>    -int hsmp_create_acpi_sysfs_if(struct device *dev)
>>> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>>>    {
>>>      struct attribute_group *attr_grp;
>>>      u16 sock_ind;
>>> @@ -232,7 +246,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>>>      return devm_device_add_group(dev, attr_grp);
>>>    }
>>>    -int init_acpi(struct device *dev)
>>> +static int init_acpi(struct device *dev)
>>>    {
>>>      u16 sock_ind;
>>>      int ret;
>>> @@ -266,3 +280,94 @@ int init_acpi(struct device *dev)
>>>              return ret;
>>>    }
>>> +
>>> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>>> +   {ACPI_HSMP_DEVICE_HID, 0},
>>> +   {}
>>> +};
>>> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>>> +
>>> +static bool check_acpi_support(struct device *dev)
>>> +{
>>> +   struct acpi_device *adev = ACPI_COMPANION(dev);
>>> +
>>> +   if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
>>> +           return true;
>>> +
>>> +   return false;
>>> +}
>>> +
>>> +static int hsmp_acpi_probe(struct platform_device *pdev)
>>> +{
>>> +   int ret;
>>> +
>>> +   if (!hsmp_pdev.is_probed) {
>>> +           hsmp_pdev.num_sockets = amd_nb_num();
>>> +           if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets >
>>> MAX_AMD_SOCKETS)
>>> +                   return -ENODEV;
>>> +
>>> +           hsmp_pdev.sock = devm_kcalloc(&pdev->dev,
>>> hsmp_pdev.num_sockets,
>>> +                                         sizeof(*hsmp_pdev.sock),
>>> +                                         GFP_KERNEL);
>>> +           if (!hsmp_pdev.sock)
>>> +                   return -ENOMEM;
>>> +   }
>>> +
>>> +   if (!check_acpi_support(&pdev->dev)) {
>>> +           dev_err(&pdev->dev, "Not ACPI device?\n");
>>> +           return -ENODEV;
>>> +   }
>>> +
>>> +   ret = init_acpi(&pdev->dev);
>>> +   if (ret) {
>>> +           dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>>> +           return ret;
>>> +   }
>>> +
>>> +   ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
>>> +   if (ret)
>>> +           dev_err(&pdev->dev, "Failed to create HSMP sysfs
>>> interface\n");
>>> +
>>> +   if (!hsmp_pdev.is_probed) {
>>> +           hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>>> +           hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>>> +           hsmp_pdev.mdev.fops     = &hsmp_fops;
>>> +           hsmp_pdev.mdev.parent   = &pdev->dev;
>>> +           hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>>> +           hsmp_pdev.mdev.mode     = 0644;
>>> +
>>> +           ret = misc_register(&hsmp_pdev.mdev);
>>> +           if (ret)
>>> +                   return ret;
>>> +           hsmp_pdev.is_probed = true;
>>> +   }
>>> +
>>> +   return 0;
>>> +}
>>> +
>>> +static void hsmp_acpi_remove(struct platform_device *pdev)
>>> +{
>>> +   /*
>>> +    * We register only one misc_device even on multi-socket system.
>>> +    * So, deregister should happen only once.
>>> +    */
>>> +   if (hsmp_pdev.is_probed) {
>>> +           misc_deregister(&hsmp_pdev.mdev);
>>> +           hsmp_pdev.is_probed = false;
>>> +   }
>>> +}
>>> +
>>> +static struct platform_driver amd_hsmp_driver = {
>>> +   .probe          = hsmp_acpi_probe,
>>> +   .remove_new     = hsmp_acpi_remove,
>>> +   .driver         = {
>>> +           .name   = DRIVER_NAME,
>>> +           .acpi_match_table = amd_hsmp_acpi_ids,
>>> +   },
>>> +};
>>> +
>>> +module_platform_driver(amd_hsmp_driver);
>>> +
>>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>>> +MODULE_VERSION(DRIVER_VERSION);
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c
>>> b/drivers/platform/x86/amd/hsmp/hsmp.c
>>> index 14edaace4379..759ec1d4d60d 100644
>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>>> @@ -31,17 +31,6 @@
>>>      struct hsmp_plat_device hsmp_pdev;
>>>    -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>>> -                    u32 *value, bool write)
>>> -{
>>> -   if (hsmp_pdev.is_acpi_device)
>>> -           amd_hsmp_acpi_rdwr(sock, offset, value, write);
>>> -   else
>>> -           return amd_hsmp_pci_rdwr(sock, offset, value, write);
>>> -
>>> -   return 0;
>>> -}
>>> -
>>>    /*
>>>     * Send a message to the HSMP port via PCI-e config space registers
>>>     * or by writing to MMIO space.
>>> @@ -64,7 +53,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock,
>>> struct hsmp_message *ms
>>>              /* Clear the status register */
>>>      mbox_status = HSMP_STATUS_NOT_READY;
>>> -   ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status,
>>> HSMP_WR);
>>> +   ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status,
>>> HSMP_WR);
>>>      if (ret) {
>>>              pr_err("Error %d clearing mailbox status register\n", ret);
>>>              return ret;
>>> @@ -73,8 +62,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock,
>>> struct hsmp_message *ms
>>>      index = 0;
>>>      /* Write any message arguments */
>>>      while (index < msg->num_args) {
>>> -           ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
>>> -                               &msg->args[index], HSMP_WR);
>>> +           ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index
>>> << 2),
>>> +                                     &msg->args[index], HSMP_WR);
>>>              if (ret) {
>>>                      pr_err("Error %d writing message argument %d\n", ret,
>>> index);
>>>                      return ret;
>>> @@ -83,7 +72,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock,
>>> struct hsmp_message *ms
>>>      }
>>>              /* Write the message ID which starts the operation */
>>> -   ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
>>> +   ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id,
>>> HSMP_WR);
>>>      if (ret) {
>>>              pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
>>>              return ret;
>>> @@ -100,7 +89,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock,
>>> struct hsmp_message *ms
>>>      timeout = jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
>>>              while (time_before(jiffies, timeout)) {
>>> -           ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status,
>>> HSMP_RD);
>>> +           ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off,
>>> &mbox_status, HSMP_RD);
>>>              if (ret) {
>>>                      pr_err("Error %d reading mailbox status\n", ret);
>>>                      return ret;
>>> @@ -135,8 +124,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock,
>>> struct hsmp_message *ms
>>>       */
>>>      index = 0;
>>>      while (index < msg->response_sz) {
>>> -           ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
>>> -                               &msg->args[index], HSMP_RD);
>>> +           ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index
>>> << 2),
>>> +                                     &msg->args[index], HSMP_RD);
>>>              if (ret) {
>>>                      pr_err("Error %d reading response %u for message
>>> ID:%u\n",
>>>                             ret, index, msg->msg_id);
>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h
>>> b/drivers/platform/x86/amd/hsmp/hsmp.h
>>> index a77887d298b6..5d4fc7735a87 100644
>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>>> @@ -41,6 +41,7 @@ struct hsmp_socket {
>>>      struct pci_dev *root;
>>>      struct device *dev;
>>>      u16 sock_ind;
>>> +   int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool
>>> rw);
>>>    };
>>>      struct hsmp_plat_device {
>>> @@ -48,19 +49,14 @@ struct hsmp_plat_device {
>>>      struct hsmp_socket *sock;
>>>      u32 proto_ver;
>>>      u16 num_sockets;
>>> -   bool is_acpi_device;
>>>      bool is_probed;
>>>    };
>>>      extern struct hsmp_plat_device hsmp_pdev;
>>>    -int init_acpi(struct device *dev);
>>>    ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>>>                           struct bin_attribute *bin_attr, char *buf,
>>>                           loff_t off, size_t count);
>>> -int hsmp_create_acpi_sysfs_if(struct device *dev);
>>> -int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>>> -                 u32 *value, bool write);
>>>    int hsmp_cache_proto_ver(u16 sock_ind);
>>>    long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>>>    umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>> @@ -68,6 +64,4 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>>    int hsmp_create_attr_list(struct attribute_group *attr_grp,
>>>                        struct device *dev, u16 sock_ind);
>>>    int hsmp_test(u16 sock_ind, u32 value);
>>> -void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>> -                   u32 *value, bool write);
>>>    #endif /* HSMP_H */
>>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c
>>> b/drivers/platform/x86/amd/hsmp/plat.c
>>> index c297540bb64c..3bce2c570f2b 100644
>>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>>> @@ -13,15 +13,13 @@
>>>      #include <asm/amd_nb.h>
>>>    -#include <linux/acpi.h>
>>>    #include <linux/device.h>
>>>    #include <linux/module.h>
>>>    #include <linux/pci.h>
>>>    #include <linux/platform_device.h>
>>>      #define DRIVER_NAME             "amd_hsmp"
>>> -#define DRIVER_VERSION             "2.2"
>>> -#define ACPI_HSMP_DEVICE_HID       "AMDI0097"
>>> +#define DRIVER_VERSION             "2.3"
>>>      /*
>>>     * To access specific HSMP mailbox register, s/w writes the SMN address of
>>> HSMP mailbox
>>> @@ -37,8 +35,8 @@
>>>    #define HSMP_INDEX_REG            0xc4
>>>    #define HSMP_DATA_REG             0xc8
>>>    -int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>>> -                 u32 *value, bool write)
>>> +static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>>> +                        u32 *value, bool write)
>>>    {
>>>      int ret;
>>>    @@ -113,6 +111,7 @@ static int init_platform_device(struct device *dev)
>>>              sock->sock_ind                  = i;
>>>              sock->dev                       = dev;
>>>              sock->mbinfo.base_addr          = SMN_HSMP_BASE;
>>> +           sock->amd_hsmp_rdwr             = amd_hsmp_pci_rdwr;
>>>                      /*
>>>               * This is a transitional change from non-ACPI to ACPI, only
>>> @@ -146,89 +145,39 @@ static int init_platform_device(struct device *dev)
>>>      return 0;
>>>    }
>>>    -static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>>> -   {ACPI_HSMP_DEVICE_HID, 0},
>>> -   {}
>>> -};
>>> -MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>>> -
>>> -static bool check_acpi_support(struct device *dev)
>>> -{
>>> -   struct acpi_device *adev = ACPI_COMPANION(dev);
>>> -
>>> -   if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
>>> -           return true;
>>> -
>>> -   return false;
>>> -}
>>> -
>>>    static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>>    {
>>>      int ret;
>>>    - /*
>>> -    * On ACPI supported BIOS, there is an ACPI HSMP device added for
>>> -    * each socket, so the per socket probing, but the memory allocated
>>> for
>>> -    * sockets should be contiguous to access it as an array,
>>> -    * Hence allocate memory for all the sockets at once instead of
>>> allocating
>>> -    * on each probe.
>>> -    */
>>> -   if (!hsmp_pdev.is_probed) {
>>> -           hsmp_pdev.sock = devm_kcalloc(&pdev->dev,
>>> hsmp_pdev.num_sockets,
>>> -                                         sizeof(*hsmp_pdev.sock),
>>> -                                         GFP_KERNEL);
>>> -           if (!hsmp_pdev.sock)
>>> -                   return -ENOMEM;
>>> -   }
>>> +   hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
>>> +                                 sizeof(*hsmp_pdev.sock),
>>> +                                 GFP_KERNEL);
>>> +   if (!hsmp_pdev.sock)
>>> +           return -ENOMEM;
>>>    - if (check_acpi_support(&pdev->dev)) {
>>> -           ret = init_acpi(&pdev->dev);
>>> -           if (ret) {
>>> -                   dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>>> -                   return ret;
>>> -           }
>>> -           ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
>>> -           if (ret)
>>> -                   dev_err(&pdev->dev, "Failed to create HSMP sysfs
>>> interface\n");
>>> -   } else {
>>> -           ret = init_platform_device(&pdev->dev);
>>> -           if (ret) {
>>> -                   dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>>> -                   return ret;
>>> -           }
>>> -           ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
>>> -           if (ret)
>>> -                   dev_err(&pdev->dev, "Failed to create HSMP sysfs
>>> interface\n");
>>> +   ret = init_platform_device(&pdev->dev);
>>> +   if (ret) {
>>> +           dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>>> +           return ret;
>>>      }
>>>    - if (!hsmp_pdev.is_probed) {
>>> -           hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>>> -           hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>>> -           hsmp_pdev.mdev.fops     = &hsmp_fops;
>>> -           hsmp_pdev.mdev.parent   = &pdev->dev;
>>> -           hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>>> -           hsmp_pdev.mdev.mode     = 0644;
>>> -
>>> -           ret = misc_register(&hsmp_pdev.mdev);
>>> -           if (ret)
>>> -                   return ret;
>>> +   ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
>>> +   if (ret)
>>> +           dev_err(&pdev->dev, "Failed to create HSMP sysfs
>>> interface\n");
>>>    -         hsmp_pdev.is_probed = true;
>>> -   }
>>> +   hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>>> +   hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>>> +   hsmp_pdev.mdev.fops     = &hsmp_fops;
>>> +   hsmp_pdev.mdev.parent   = &pdev->dev;
>>> +   hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>>> +   hsmp_pdev.mdev.mode     = 0644;
>>>    - return 0;
>>> +   return misc_register(&hsmp_pdev.mdev);
>>>    }
>>>      static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>>    {
>>> -   /*
>>> -    * We register only one misc_device even on multi socket system.
>>> -    * So, deregister should happen only once.
>>> -    */
>>> -   if (hsmp_pdev.is_probed) {
>>> -           misc_deregister(&hsmp_pdev.mdev);
>>> -           hsmp_pdev.is_probed = false;
>>> -   }
>>> +   misc_deregister(&hsmp_pdev.mdev);
>>>    }
>>>      static struct platform_driver amd_hsmp_driver = {
>>> @@ -236,7 +185,6 @@ static struct platform_driver amd_hsmp_driver = {
>>>      .remove_new     = hsmp_pltdrv_remove,
>>>      .driver         = {
>>>              .name   = DRIVER_NAME,
>>> -           .acpi_match_table = amd_hsmp_acpi_ids,
>>>      },
>>>    };
>>>    @@ -295,6 +243,12 @@ static int __init hsmp_plt_init(void)
>>>    {
>>>      int ret = -ENODEV;
>>>    + if (!legacy_hsmp_support()) {
>>> +           pr_info("HSMP is not supported on Family:%x model:%x\n",
>>> +                   boot_cpu_data.x86, boot_cpu_data.x86_model);
>>> +           return ret;
>>> +   }
>>> +
>>>      /*
>>>       * amd_nb_num() returns number of SMN/DF interfaces present in the
>>> system
>>>       * if we have N SMN/DF interfaces that ideally means N sockets
>>> @@ -307,19 +261,9 @@ static int __init hsmp_plt_init(void)
>>>      if (ret)
>>>              return ret;
>>>    - if (!hsmp_pdev.is_acpi_device) {
>>> -           if (legacy_hsmp_support()) {
>>> -                   /* Not ACPI device, but supports HSMP, register a
>>> plat_dev */
>>> -                   ret = hsmp_plat_dev_register();
>>> -           } else {
>>> -                   /* Not ACPI, Does not support HSMP */
>>> -                   pr_info("HSMP is not supported on Family:%x
>>> model:%x\n",
>>> -                           boot_cpu_data.x86, boot_cpu_data.x86_model);
>>> -                   ret = -ENODEV;
>>> -           }
>>> -           if (ret)
>>> -                   platform_driver_unregister(&amd_hsmp_driver);
>>> -   }
>>> +   ret = hsmp_plat_dev_register();
>>> +   if (ret)
>>> +           platform_driver_unregister(&amd_hsmp_driver);
>>>              return ret;
>>>    }

Thanks and Regards,

Suma

