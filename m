Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4627510B
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763625012; cv=fail; b=pXY0zsmcFw1IJi45gxl5b1mMRemr6w/HrrGqTsIdYX3SxQ0/FKkDp6mIpcQK7lGw247ccBxSHfiSFQYiMQbfei0XZkhpY3hOy4yIi/CDx8mP+VcaaMJr4VGM9cmiX5bxY8MnKXGW6E/DMxBgy3UpXPs3z0meEUVqFHNLNOBrVJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763625012; c=relaxed/simple;
	bh=isf44XCNWN7uKl3s104eVPueMYwH/UFbpBMSnmngpBU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KST8cBZdMjpNd5rdnZSjzToYl7c1rw0EJaX4ncWEzP4wl8IvuzHJ5QQWA0Dl8fWxK79mhgL5GgYPUjMX5+mmJsiGDxxxfp0pnlfPz2MPzceUDwyo51cuj5rbVkMZgGjLnPrhfn/hFg5AtZtIe2RrDr9L58rm/wfaqyaNFSnBiKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SW7r4rMd; arc=fail smtp.client-ip=52.101.52.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SW7r4rMd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB3AIc6xY7QKYAUitX2WxUkTEV26mT+eYsXx4ua4qDISf5sGHGsm7/saiTH5YPfbK0oKvHbg4ag50D3dWAk3MUxVCFSLU7VMCBZ8xvv/8YupZYrpfyA/Wr3tv56vqZ/ZyW4doLz6pLY6DrMedL3/FZN2REtH9Z8hST0RWYUbFZeusdwbwxJTCp/PYayzL2JVdeBi7EF5qzjIWSdzA5I37ByGFwqqKOBZDalKL0zN0js+nJ9JGFXgUaT/o7pGP4vd1+fA5rrGB6kx6/xezBfb7VrKSiWe7oEQmksmsliGlwMjVPVm0CJcHq8Tf/68IpI/mtYs/ltGbcCtgbTJJ8FuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcF4hbjPbF9072yYuPAps99XwF3xA84KqGLdnuYcr8I=;
 b=qq1gP8u4jakvlc2M7AM4q1RfCPolOQEyQpuRXmDgfMsXwd/8UeFPX0StalPYO5uc0ZLeiGHWJoPck1MC9XmsV0leX6EfdDpEBUt5hu5ealFGnx6c824NYzdp77dD80fTe8eoKGYL/mPz7fPnR7hVnpwQFMfQnfBYyhM0yke9F4Oy+ltgFV1ZpDrUhQPIotSd5RvRe6STADG7u0ydqKLzuWZ+D+BJSH89SaAJZwK2b0WSOgADsPUipmKazPER7FPJMQvI+IArRx5zzxuJoMc4XjxjqK4jiiZu9GNzv0IfysDXVUeGW8gapsYmtZwUybKOtHj5t4sJIpDrgB+wMcxCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcF4hbjPbF9072yYuPAps99XwF3xA84KqGLdnuYcr8I=;
 b=SW7r4rMdNPLwlZytRuzJwDCF/Pf+7tVD5AtRVnPIBgKyPccJMJ67nd6TgJHLU7oEG0ixwjeyDXZv9R54UBdyoA8YuwA7e+GQry0n3buVKpgpr1z1Ph5v93Hript+mUQGsPn3SWiKPUd9B+sseA94igeE9AEBI8ll+EC8ja+ccA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by DS0PR12MB9725.namprd12.prod.outlook.com (2603:10b6:8:226::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 07:50:05 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::c8eb:eeb9:cd73:b236]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::c8eb:eeb9:cd73:b236%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 07:50:05 +0000
Message-ID: <9d4ba01f-31f0-40f6-9d86-bd18134d2218@amd.com>
Date: Thu, 20 Nov 2025 13:19:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce AMD PMF util layer and user-space
 interface for SystemDeck
To: Hans de Goede <hansg@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
 <2c40e722-ffd7-4e00-92dd-2c89ff4768a0@kernel.org>
 <0a4eaad1-d312-4c43-94f3-b1d9986c117a@amd.com>
 <6104959e-0214-492d-8ceb-c7376d3b1121@kernel.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <6104959e-0214-492d-8ceb-c7376d3b1121@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::26) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|DS0PR12MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2a9d40-e3d2-4ea0-12fb-08de28096ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cE9PSFd2UC9ZVXo5c29YaUwrNFpsR3hlMFNxTGlsR3BCT2hqNmYxRC8rTGVL?=
 =?utf-8?B?SVZsbHFDMGVaWldSQy9Ramd0RS9QN1RoUW5ibzFTZ05hbWlQWk45ajBEL2or?=
 =?utf-8?B?QVZWUzhoUFZQa1ZDUnNRQzhsZ3o1WjhVOEI1U3RmdFFuTkcyZFJaVHBrUFQw?=
 =?utf-8?B?cFBHNmxFTEF0ZEMzTDliUGo3b08rdllPYWZiZ25YQmc4dE5DZVNaaFhCN0Nm?=
 =?utf-8?B?TTVnVk51aXVlL2hHdE9xZ0JyQ1o3Q3g1a2FZRnJoblhjU3dGZnU3dkI0OE1P?=
 =?utf-8?B?alYrNUpSRmQ1MkozTFF5ZnFsZGY4S3VGYmFvblM3T2toNE5obEwyVzQxU2J4?=
 =?utf-8?B?SnNqL0x4cVU3TWsyVWMrMlRVTTkxQ0lkMDJCMHZYRVl3Wjh4SnNFVDlHNVp6?=
 =?utf-8?B?OEk3QmNHbHlHTEplYlhXZEJSZmdrMDBVQnhwTXlYRHhaamV0WmNDNWpuTGhP?=
 =?utf-8?B?ajhpMWxqUFBlV3lNN2oyVDN4MGdBQjVMMFBEZm54cjl3RzB6M0F1QjhrOWdV?=
 =?utf-8?B?aG16Q0lMNk1Pb3ZBZldLblBmcmpBaXZXYW0wSk9LbGVESTdDQnhlUWgwS2ZX?=
 =?utf-8?B?ZTc0WCtmazh3SHZJQVZhRzNPT3dOcGtvTDduaXN0bEx2MzZkZFlRK0VYa1Jj?=
 =?utf-8?B?WlAzOExya21PSSt0THBCR1d2cE12MDdXWnV3SXZya0ltTGwwL3VhVVQ4QXVD?=
 =?utf-8?B?SVJOek5DSFdPdmg1THJFSXZ0V2ZrYkFMa0g2U1BMSGVRRXdaajJWMHJXbm14?=
 =?utf-8?B?czlKSy9maUJnTTAwZUlET0syaHBWcytXRnJ1bW9WUWNnRTUwZ1R4QVFNc2Fq?=
 =?utf-8?B?ckpiZzRrWjdLNzZwalpoR0U5UXZBSXV3Z29QaHR0a0tSMzdjdmROUHJJVE9X?=
 =?utf-8?B?T1RCOGNybmltOVl4Nk1kSy9rZ1ZsaWtldEhzM3l0Q2ZDRS9YaW9xbFNXdk00?=
 =?utf-8?B?VU1lSGxISGZvRmhSdzhGVWxhSnpJNGMwejNoY0lVTVdxMGZHdml5U0hVSFFj?=
 =?utf-8?B?WVJmY3ZLNkM1dVJTeHg1T3JXTGphb3hNTUE3elRxZ01kcXpvSStINVl4WGFp?=
 =?utf-8?B?Q0F4VGtNclBPT0RyZW41bC94bjdCRjRhRkQ2S3hRa042cGRQTU10eC9VcjQz?=
 =?utf-8?B?VFBFS2h3ZHJQSzlDSTVyNlpoeEpZUHE5b0NaVnpLT1NUWUQ4SnQzVm1WVTFU?=
 =?utf-8?B?WGFQWjkyazlOSVpkSlVFYVRVUEMyYllsd0t3Qm9FUXNZa0wyR1NlK2NuV0JN?=
 =?utf-8?B?d2hnQS81TnhJeG5pMC81Y3libXBscFNWT3FjcCtSL0Q0Sy9sRHIwazdXcEZP?=
 =?utf-8?B?YklOQzBQVDB1c2dZYytUbVVtNm9EaUw2VE9GMDNFMWhhSzB2NEszTkdpWE90?=
 =?utf-8?B?Nk90bzZiRkJYQW4rQS9jVUJkL0h1LzAxcWViVi81akxIdmQrNFJiT0pjWkVh?=
 =?utf-8?B?cHF0Q3dDcFI0M09NZXF3T1RpdGxXYnp0VDV2UFVWYW1qcHA0RWVpekFOZnlJ?=
 =?utf-8?B?cCtEbExDc3plTS9MbzNSNTdpdzExL3VqdGJyV3hseFhpZHVzK2ZxSnI5WkVm?=
 =?utf-8?B?cEpjQmt4alZVSjF3YWs3akdQYlVXbTNwSXgwOGRkK0dXWGZBVkQvTUlMM2dh?=
 =?utf-8?B?U1NHWlNEMTlGaCthMDdBeEhLVjNxMEJ6MTIzVEdiekxJZDVJM1BvZnRjNXVh?=
 =?utf-8?B?YWc1SXQxSWVMVE9QMmExWno3WHJEaGY0dmdKblRJS0FVUE5TOUExRDlKKzIv?=
 =?utf-8?B?MFluVUZxSVRZUXhUNUxyaEs5Q2Vsb0MxM1FzV25jUXYxRjV4NC9xTzZCYUZ6?=
 =?utf-8?B?TTRkTi9tMHh2WU0xTVFsT3U0M0g5V0VkWnI3dkkxQ1cxTTZ2TTJwSnZkSWtj?=
 =?utf-8?B?Ti9mSTZabGtycjdlV1BZVEJqRXRZQXpBSjhWZnpVeEd0NFpkZTIrbmVZREE4?=
 =?utf-8?Q?URJeDWSSQ5gVwLZBp+ZN0ic5SDA4RDPu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2xheXgrckJPR1dNRndkVkVkWEZkT2JUNEVyK295T1ZyZ0F6bWN2WmE2SWQ3?=
 =?utf-8?B?djVJUDNYY0tCUHQraHo3K3Q1cDd3UUZkUWoyN1UzRUVXZ0ExZ2xMZXkrbGZZ?=
 =?utf-8?B?aURvSjB1TzVMUkgxUHM2TVdRbkYrbzZ0M1FrKzdERlcyZDBESksyQ1NSQ2oy?=
 =?utf-8?B?ZGVqelN1UzVyN3ppVDhYZ2F4RVBJQ2ppVjNwUFJpVmMvR2VJNUJObHIvYnZT?=
 =?utf-8?B?Nmw2UEYrbXhrbkxzdE82R0JYNWRSS3UreVZQbkQ2enA3WmdVUEpKOWFHNERJ?=
 =?utf-8?B?ZmQ0M0RjSlcxcXRUSWJaU2tKZkZyaEE3cXVUR3BlL3NJR1lZVWdhdU1lblRI?=
 =?utf-8?B?NEFYbm04VEswWE5vd2J2aFlNWnFnblR2Y3FUazlCNUNINDBOaGo0KzdmclpL?=
 =?utf-8?B?Z0VCYTJKeVUwOXdzaHgwRlB5RWh1TXdQakhYbU41OVBjc1R5TjJvWGtWc1di?=
 =?utf-8?B?NzkzTGV1SXVsMHVwa0RIUitOTU5GQXBFOERjYm5nVjhCblZWSEtjZmYvY1JB?=
 =?utf-8?B?aTlPaVFmODRZVXBaUGlyaUo0Qk5JeThXTCtpNXpaS0tVYVliR0tCeTdXTDhJ?=
 =?utf-8?B?dUtrRUZwbzZVTXNSaC9VZTFWZmNTNE5CdzFFdGNlMmZTbHhuR0lTSENsbnNB?=
 =?utf-8?B?dmV5NkJDSmgyc3pVbUpldkEvTVROS1dGT2FIRmdTb0pxK0pmZHVKVFlrWXVx?=
 =?utf-8?B?UnlTOUZnb1JRUFBsMFdwT0drZ2crNWQrdVR3S1dUQytmNm1DZG5OOVpLUjZr?=
 =?utf-8?B?QWhhMVJaVjZwNnF4Sm5RT0c4aEIzWlJnQ2xTcVhiUDBxQTRnTEcrMC9ZRnM1?=
 =?utf-8?B?YWhNNkRJc3BkQlNEK0V1VnRuU1B0TmJKdEFBblZhbFo4Q3F4dE56NnJVWWJV?=
 =?utf-8?B?ZVI4citLTEFXTkVlaXp3bE5iNkNFSWlLcjBzNFdka3dQZUlDaEc5UXFLa3BU?=
 =?utf-8?B?emZTQ3g3QVM4R1lZT3o0OG5wd3RyTHNDQ3RSNlF3dzllQ2xZWVR1OFExTzFn?=
 =?utf-8?B?bzJWRGZKMFVxNWw5MjZUcVZ2cUNFWEtibVZhZGlheENSTkV5UCtsaWord21l?=
 =?utf-8?B?cVg3K3c0N3dQSFI3MFhaT05OY2RnWXV3bXB3eUwrQjdQYUhrMWdDWnJ2R2hX?=
 =?utf-8?B?V2dtUGZQblRWemNkWTZwT0F1TUg2a2VrWGl1dUVLdkl2RFVYbGdkbFhjZHVq?=
 =?utf-8?B?N1BQNGZqSEY1ZWlqMUthZ2p0bVZLZ0hhZW01KzZEOW1QQVQxL1FPSTNnMEZv?=
 =?utf-8?B?Yi96OUUrQThiM0ZzSjNUWkFENUs3RFBDUyt2VkUvcFpWWHFHTlpDbkQ2YU5H?=
 =?utf-8?B?YW96MTc1c3NZOVNHUXZwUzJJVkFZMXVnQkdnTTZsVzg1NEdjVmJyaHp1WjUv?=
 =?utf-8?B?Nm1oQUpOS2RMRi9tRnFNcjhIbWRoV0dVdTNXRDdVSjFjYUZ6T0JqNUNRRXdV?=
 =?utf-8?B?TXhuTW5STDFoNCtGZGdDczlyT1FsaG83dTlmZUlmdGt0Y0lqU2ZSV09EMFli?=
 =?utf-8?B?RU1Zd2VlYjBTRkJwdWs4dkN5ZVpkRGRBTjliRkdZaGlyK1RUbStkTW9JeEY2?=
 =?utf-8?B?Vm1IdVdLOUJzc2F6WFpWUlR2a2x2Q09WVUc2QzAvL2d6RE1MUnZFemxJbXYz?=
 =?utf-8?B?OUF3OXYrQXVZZC9mQnJqc0YwdnBxQVNFWHl6RFgzcUlOWDFYVnd5SFZLTnZa?=
 =?utf-8?B?SjRFcTdxRzVFUUh4K1BQd1M3MWJiWTl3Mnk3aUs0RVJBRzI5Zjh0c00zSFhM?=
 =?utf-8?B?eFhwYXUwTkRYRlpQR1hqWTZtMkNuZk9WQTlwNXNiL3ZhQWQ1NXozM2t5Z3dM?=
 =?utf-8?B?VTVPOXBzMUs1a0pueC9rdStNbllZNGhWeExaNXVyUFdGbHkzWWgrbmFJVkVi?=
 =?utf-8?B?eWh3Zkw5S21ydndsdkpkOEJmR2ZMRFBIYURodTczZGFna2RLRFZienZNODho?=
 =?utf-8?B?TjVVdU91c2c3dDQza0pVWTQ0M3daSWc1c3VHRXZvMnY5bytqU0gvbmFHeVll?=
 =?utf-8?B?RUg2djNqN3c2SDQ2a0pYcU5RcWxyZ1pKcS96bmpRa0ZPdE8zMFRSc1B2S3RF?=
 =?utf-8?B?eVhuS2tWM0VpS00wRzVyWU5Ub1FveFFIK1ZRTE9kNEVHNUxYQU5FdG5BclF0?=
 =?utf-8?Q?CUCq3m6hjr0YsS480seqgou+d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2a9d40-e3d2-4ea0-12fb-08de28096ade
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 07:50:05.1643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCS8uR5khlFIS6zD110HqqH6CIifS3XD9XIjvjZmBpOfUBOxIBnbUhsh3yDheVk6E9CbZmufbQ2SR4om3bdnUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9725

Hi hans,

On 11/20/2025 00:55, Hans de Goede wrote:
> Hi Mario,
> 
> On 19-Nov-25 5:32 PM, Mario Limonciello wrote:
>> On 11/19/25 10:20 AM, Hans de Goede wrote:
>>> Hi Shyam,
>>>
>>> On 11-Nov-25 8:10 AM, Shyam Sundar S K wrote:
>>>> This series introduces a util layer to the AMD Platform Management
>>>> Framework (PMF) and a minimal user-space interface via a misc character
>>>> device, enabling feature discovery and smoother integration with
>>>> user-space tools. It also adds caching of BIOS output policy values to
>>>> prepare for user-space telemetry reporting via IOCTLs.
>>>>
>>>> The motivation is to provide a stable interface for user-space tools to
>>>> discover PMF features and consume selected metrics. Enable smoother
>>>> integration with AMD SystemDeck
>>>
>>> This does not really explain why you've chosen for a new character-device
>>> with IOCTLs instead of sysfs where as so far (AFAICT) all the AMD PMF code
>>> has been using sysfs APIs.
>>>
>>> Is there any specific reason why to switch to IOCTLs all of a sudden?
>>>
>>> Note that:
>>>
>>> 1. sysfs APIs can be (and must be) stable too, sysfs APIs are not allowed
>>> to be changed once shipped in a stable kernel.
>>> 2. sysfs attributes can be used with poll() to so if you want to do
>>> notifications of changes that can be done through sysfs too.
>>>
>>> Note I'm not saying you must use sysfs, but so far the PMF code has been
>>> using sysfs everywhere and this new IOCTL based API is not really consistent
>>> with this.
>>
>> Isn't there only one sysfs file for turning on/off CNQF?
> 
> Ah yes you're right somehow I thought there were more.
> 
> Still generally speaking the kernel community is trying to avoid
> adding new ioctl based interfaces / adding random new char devices
> in preference of using sysfs interface where possible.
> 
> So I've taken a better look at the actual ioctl interface
> and it seems like a really weird multiplexer interface,
> where there is only 2 ioctl commands and then the argument
> gets 1 of a ton of possible feature flags resp. info variables.
> 
> Where it also seems that none of these variables require
> a round-trip to the hardware.
> 
> Given the amount of different variables I can see some sense
> in having this as an ioctl interface, but why do the whole
> thing where userspace has to make ioctl per value it wants
> to read. That feels very sysfs-ish if you want that maybe
> just use sysfs ?
> 
> I would define a uAPI struct like this:
> 
> struct foo {
> 	u64 size;		/* in + out, all other fields out only */
> 	u64 features_supported; /* bitmask with feature info from patch 1/5 */
> 	u64 feature_version	/* from patch 1/5 */
> 	u64 power_source;	/* from patch 2/5 */
> 	...
> 	u64 bios_input[10];	/* from patch 2/5 */
> 	...
> 	etc.
> };
> 

thank you for your remarks and the UAPI struct suggestion. Let me make
this change and come back with a newer version.

> And have a copy of this struct embedded in the driver
> data struct and keep that updated (replacing the cache
> stuff) so that you can just copy_to_user that on the ioctl.
> 
> Combined with a single get-info ioctl which just fills 
> the struct, using the min of the size passed in by userspace
> + the size supported by the kernel to determine how much
> to copy and set the copied size in the struct passed
> back to userspace (to indicate for new userspace on
> old kernel that the new fields are not set).
> 
> This way for future extensions new fields can be added to
> the end of the struct and the size handling will automatically
> do the right thing.
> 
> As for Ilpo's comment about the battery info being duplicate
> with /sys/class/power_supply/BAT*, where is this info coming
> from ?  Is this a PMF specific view of the battery info,
> IOW it might be different then the power_supply calls info?
> 

with regards to this:

The function amd_pmf_get_battery_info() fills in the data that will be
sent to the TA. Inside this function, it calls
amd_pmf_get_battery_prop() to retrieve each required battery property.

For example:

/* to get the battery percentage */
in->ev_info.bat_percentage =
amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);


Because the PMF already obtains battery information from the
power_supply, amd_pmf_get_battery_info() simply transfers those values
into the ioctl structure so they can be returned to user space via
copy_to_user(). To do this we map the ioctl requests to the
corresponding fields, for example:

+	case IOCTL_DESIGNED_BATTERY_CAPACITY:
+		output.val = in->ev_info.bat_design;
+		break;
+	case IOCTL_FULLY_CHARGED_BATTERY_CAPACITY:
+		output.val = in->ev_info.full_charge_capacity;
+		break;
+	case IOCTL_BATTERY_DRAIN_RATE:
+		output.val = in->ev_info.drain_rate;
+		break;


> Note stil not a fan of adding new IOCTLs but given the large
> amount of variables I can see how using an IOCTL might be
> better then adding a ton of new sysfs attributes.
> 

Thank you..

Thanks,
Shyam

> Regards,
> 
> Hans
> 
> 
> 
> 
>>>> , a widely used tool for monitoring and
>>>> controlling power and thermal behavior, helping designers keep components
>>>> within thermal limits to ensure proper operation and improve system
>>>> stability and reliability.
>>>>
>>>> This series also adds a small, dependable userspace utility that leverages
>>>> the new IOCTLs to query live power and thermal telemetry. Exposing this
>>>> data in a scriptable interface helps users and tooling make informed,
>>>> workload-aware decisions and supports validation and debugging.
>>>>
>>>> v2:
>>>> ----
>>>>   - address remarks from v1
>>>>   - add a new tool that exercises the IOCTLs from PMF interface
>>>>
>>>> Shyam Sundar S K (5):
>>>>    platform/x86/amd/pmf: add util layer and user-space misc device
>>>>      interface
>>>>    platform/x86/amd/pmf: cache BIOS output values for user-space
>>>>      telemetry via util IOCTL
>>>>    Documentation/ABI: add testing entry for AMD PMF misc device interface
>>>>    platform/x86/amd/pmf: Store commonly used enums in the header file
>>>>    platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>>>>      metrics and features
>>>>
>>>>   .../ABI/testing/misc-amdpmf_interface         |  49 +++
>>>>   MAINTAINERS                                   |   1 +
>>>>   drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>>>>   drivers/platform/x86/amd/pmf/Makefile         |   2 +
>>>>   drivers/platform/x86/amd/pmf/core.c           |  19 +
>>>>   drivers/platform/x86/amd/pmf/pmf.h            |  33 +-
>>>>   drivers/platform/x86/amd/pmf/spc.c            |   1 +
>>>>   drivers/platform/x86/amd/pmf/tee-if.c         |  10 +
>>>>   drivers/platform/x86/amd/pmf/util.c           | 236 +++++++++++
>>>>   include/uapi/linux/amd-pmf.h                  |  96 +++++
>>>>   tools/testing/selftests/Makefile              |   1 +
>>>>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>>>>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++++++
>>>>   13 files changed, 832 insertions(+), 22 deletions(-)
>>>>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>>>>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>>>>   create mode 100644 include/uapi/linux/amd-pmf.h
>>>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>>>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
>>>>
>>>
>>
> 

