Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67792139DB
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730304252; cv=fail; b=L6s3RySHYIpj54DRVZF6JkaLhKI5775D8PjuBwUMJNjxArKjtE4J7gYqzV3H3vxPF2FmamNZrU7qvMYpiKId2Q0wIyzncTBz8ZpoqCL+g9tWSAEg1FlIWYq7D+w0Wvn5o/QD3u3w8fU+iTTenKOSaMGLor4kpIyPplDVveIBPHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730304252; c=relaxed/simple;
	bh=Tb8fAwdCwDGzKMYOB32TwT93HzcZ/9/Fqe4DqaPSRdE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CY580NIzzIfXHEQ4G9kCgvDVyBM8kGXWfNPv+NBs4UWTpv+M1YLoDdKNvbuo2AskQi3UnKtN+9zsyf631ar6Hv3J0QPFkGwJXfSkboKd4k9Qndck0mUhCPXAS6i+zYjqc91nHLatxau+VRxZFEWw/Hv1rH18VtnZKVJJaWvBFHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WGpBqljX; arc=fail smtp.client-ip=40.107.220.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WGpBqljX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS1XXwrSgSnQzXn5+VDjnuKPdK8LLyeUuNpMZvY2NGXXLFai9IY9f2a6pHSqtcZ8tWouXdHvit5U6uULwRK4F5jAVssxQR5zpXRp9flc5uLaRGjTYBn1hiiklbnpAcnC1DYHpjHSNYF7hEWJp/VlKN9/VJ5/CzQ/wzknuIi789pmMLNs/eWBwJFpPbBdPTN2wZAh+qdZUEAIrFdozZFSOsnk7Thyb27DbL1RElbtam6pEFjZ7PbzhZ7uffBKYlAd1QPfHPJ4gWAEPwIxaGdKB8rWgd3cve3eRfw8ahKFlZRUL6aBxsl5oqavGCwiYHDdGdw4uyCfCgOjbd2C/Jwveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZIJIVHeCov/SpNFO91nvCf5JF4PK2qOw3tHLtwIjLM=;
 b=C/7AHyA595jOS6CspM0qrQvaP6bVEDZjovRQWOW308SnJFYeeSjD0kZGvsWS2E+hX78S+DzM6xFfcHa4DIngf4tFEQURj4pMSrzhRjrZ+x0///bPVO13DIhpqZzYj5ZvFVCUTsWpnXWu82ExOC2KL+K3JDqeAiyKlzYR4X1mYpLMM8x7O7ZbNVdkuVHV1jka1LSqVNGXCxlzaYhOtsD2YA2bMWjIT1U7CAPiygAQuC00gEefz/Q9SS6gz5JG8LTnDStgNAGO1hMuHB3mZzyMXG0lq9K5IK7iw+lYTy4lVKasVOq5L9jo5x4fosGTeLw53Xoxi07vUrKlZQhvVQHQ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZIJIVHeCov/SpNFO91nvCf5JF4PK2qOw3tHLtwIjLM=;
 b=WGpBqljXOxlV0ADOeHLX1wfSucHs9iJ3Cd7VzfOKrFYuZK5BIJ2DGKMd00evTqO0LxoyJnv9iSwllSZGVSLfYJNfUpC6K23X9hZkR/2qQVDTTnhLAHxOcCqWz9yEzy3kFKu7r1ZJhQP158anDyH3gMUn4FwKuGo5eltV3OcWBHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB6257.namprd12.prod.outlook.com (2603:10b6:208:3e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 16:04:07 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 16:04:06 +0000
Message-ID: <26109281-38a2-4166-b65d-b52dddceb542@amd.com>
Date: Wed, 30 Oct 2024 21:33:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
 <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
 <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com>
 <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com>
 <d7b8d58b-be23-179e-0618-9bcfc54b8d0b@linux.intel.com>
 <63ac59dd-a33b-4bc8-b35c-7bf9329351b7@redhat.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <63ac59dd-a33b-4bc8-b35c-7bf9329351b7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b32942-577c-4f2b-74cb-08dcf8fc7b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmMwRnA2aWszUVpyRmgwSnFpRzBSTnNCVzExNmJXV1JyS2dpdVdFK3k0c2tq?=
 =?utf-8?B?eGRQTjloT1R4alFjL0drRUxpWHlDTGhyVEtwM1ZBTEJTOGJPVW0wT2xhYnZ2?=
 =?utf-8?B?MkxCbkFrU3BQZWpRRGtrKzNXSUxYajZIWnBPZnluU0pHOFdqeGR3YW5PUzAz?=
 =?utf-8?B?dVBaaHFkd2FlY1VSazBjYzcrRHppbS9DbXdKdHlGZXZqckRFbkpTclNXdFhq?=
 =?utf-8?B?WmtjUkZKempwLzIxZXE3UUcxUkhpb0tsZVFMaGh6aHVFZU1oRFFmVUpHV2FJ?=
 =?utf-8?B?N0xaSnphOHJKN3E0bGVXQkU1SUpXd2xhb0t0R05xZTFzbWIzLzd2WXAzZDhQ?=
 =?utf-8?B?TE1sZTdyNHJudi9XU3RoeWRYb2MwNlNHdUpXMStzWFd1cThJWlFyM1F1aGFz?=
 =?utf-8?B?R3Nuem5JNitZUHRYYm1yeThkeVRmUXFNY25NRDFwcWxFMEVpanZtbnhuZEdS?=
 =?utf-8?B?aHp1SGgyV1RBMytsU0JFN2JscFJQb0JxRGVFMVFVcjJuaTB5Vk8zT3JyV1BY?=
 =?utf-8?B?QXVhdlJyamswOC9jZzFtUUdHMkx6WjgwNlgva3AzZnFCajVsbmRTZjFiNkJO?=
 =?utf-8?B?eFpLYXJYeHNVdGRhMk5nTExjLzA4c0JMajVLd29qeVlrN1pNWCt2OHdkNGVX?=
 =?utf-8?B?L1dxRjVYWlNrdDI4Ri9UZEVCbWJQMmRKWjdBOXRlRDF1U0U0akloVGxJRkkr?=
 =?utf-8?B?MlVweVdCSW56WnRPL0t3bDY5TmxjN2pYbFh4Rm52ejJEeUUyYVN2K2ZTcUI3?=
 =?utf-8?B?N1k2K1NTaVVSa0UrMitLTmM5MEVER2ZHUlJKbnVveHNneFpjREpVNGwzSEE3?=
 =?utf-8?B?L2hwSENmRjVXQzVwOTh5WCtCTjdON0l6enNEeWxlUWRmbi9VQmw5Zzl4SWEy?=
 =?utf-8?B?aUx5MmdzQll1b05hcUFYdTIyNW9obExVTm41TzVmTGdJWmUrK3dRZDg2REFH?=
 =?utf-8?B?czdHTjlhemZsTDNLRWorWk9CeUpreC9manlidmEwcE1yRjFDU2Z5YnR4Q0pr?=
 =?utf-8?B?cmdIYVJ6b2JqZm9nM0pEb3ZmMVNhUE1lTVkwVTFFdXlMRnFmcFBpQUhEUmUr?=
 =?utf-8?B?bWp3L1krSnU4eFYwS00xTFMrOUlDNzF3K2RmTTVva3JUTnNLR0RKUlRxQTF5?=
 =?utf-8?B?QThxaENRSU5hajZHZXZJUXZIWlp0Z25QQTZ3VmxXVzJNVytLT2lRWjdOVUpB?=
 =?utf-8?B?dWh6cFNiYkJMQ2ZrK24vUHROd054T1l6akRBRVRpWE0zZllONFpvaW8zamxH?=
 =?utf-8?B?Ti9QQlVDL0lZU1h6NEpaa0dtREw3cDRLUTZiZG1PNUlLUXJ1YmxyaytMZWQz?=
 =?utf-8?B?T0FxcU9xTWtwdDRjekxzdGFFTS9MdHI3N2xYUzBFaG1UYlRzbEV3SkpUbWRv?=
 =?utf-8?B?QmNKODgzbE1xbG1HV3RienhKYjZmWk12MlEzUGdUSmtkcCtCVlljYVpCdXdi?=
 =?utf-8?B?WG1VcS9vTlB5Tkw2NG8vempuVUMwZ0VWQ1hFcklyMjI3R2Fma2VETDBxZW11?=
 =?utf-8?B?UmozR2YyQnFNOWRyK2RrYmlTUndZSjhDV05KZS9RTTR3cGZSMTN5U2ZZbzVX?=
 =?utf-8?B?cDV4UHk4cXJTMnVhbEZZQlBUeGJwcUR3ZWc1eG5nMXN3d1JZeG1KeUZJbGFl?=
 =?utf-8?B?b2JMekR6LzF4T2crRnBOOFlFUTNLZXVXWDNqUW4vZ015cXdLUHJkNk1JMk1h?=
 =?utf-8?B?Z3RjWi8zV0t5VHh0bm96WmduYmFqeGZiWVovdXRhS1pjMHNBYlA3UEdVVk91?=
 =?utf-8?Q?6ITVBjT3yiRM9WDbI8mthv/B8zEaUlHqNDgHlVT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGMzUUdtQlJqMERlM1lKRUtOdVovZk9ISjR4SHdSWE9DNWZQa3pBN3dKUUlI?=
 =?utf-8?B?WHZCNlpCZnhZek1KR3VnajJ4TEQwRzZLYksrd2dsT2MxQjY3U1JpWC9leGVJ?=
 =?utf-8?B?WnEyWWR3V0FMWFN0QWV3T2trOWh1VUV1RjVZSThhYTdyL2ZiSjBKZ2ZvVnZV?=
 =?utf-8?B?dURqQndDVkZsMVNrRXEyMmpkRWUrVFZ1aVNmMGt5ai9LMDVKajBwTURKbGp0?=
 =?utf-8?B?OGVNUmpObEowSkpXZEZGaGlPaDlUbEVXZXRLQlN6enBtSDEyTWdLamkycG40?=
 =?utf-8?B?MG9CM0lpNUxvQ1h3a1FoZ2xPV1dPL1FSV0RLM3F3a2Q4RlBwZEloMDk4UlZR?=
 =?utf-8?B?Z2FiZ2ZwaGZRTUg0bGlHeTArZ2JWNkdTYTRTTW50VWJHaGdwZURxUkQvRXY3?=
 =?utf-8?B?SFV6di96MEVBcVFUeFBqWHpVVE9LdE9UMWx5NW5qamFrN0F6MHY2MFc4Skpa?=
 =?utf-8?B?Y1o1aFRpL3dJRktHNW9kY0ZKcG1VdGYzak5qNFY2aTQ3SUlUQmNRUjVWd1h5?=
 =?utf-8?B?Q3RDK0w5bnlmbEZCeVJDNkl3NWxXN3J2d2laWmxWRlAvdGR6YjFUZVY2RVMx?=
 =?utf-8?B?T1VJUGFObEkzTlRLb1hEVDJtYTdCSzNzcU5Va1FPM3hDU3pRblpqaWhCT21u?=
 =?utf-8?B?ZlNpa1M1cTRoNllTSUlCWGJEQVJQQ3JUeXRSWnhWNTREVk5PUFUvdkJFMzQv?=
 =?utf-8?B?THZibXc4b0FiSHN0Nm8zKy9tOXpCQmlHQk1EaUdGZjMxUFA4S0F1N2VaS1Y4?=
 =?utf-8?B?eXR4ZlpXZmJUeHVXUnhNSHRDK0Zha3JleUtjV3QyN0FVejFld3p1NXpWVHVv?=
 =?utf-8?B?RGZBcEllR2xSMncwbHFNT01NOGZ5dTZ0UjlSR2FxSXJRVGM5SEtBSFE4aS9R?=
 =?utf-8?B?UWU4b2lXRXRzZHFpTWs3QzVVSDhHYndiQ3krVEoyMmRyaHdmUkhBdnBmT0sw?=
 =?utf-8?B?TmtFeVVWRis4eVRjdDFKMHp5d3FGdTNYeDQvWjJQWmllc2oyVDZ1UnUxNmhH?=
 =?utf-8?B?SC94SjlzZitKeTZsTGovckhvMjRaR1Q5UUxRS3dWaVF5M2NNZkx2bVMramRk?=
 =?utf-8?B?YjUvRitUUEliS084bFgzWE54Wmx6VHpKY2liZ2lvVnZka3BkQ2RhVmhmNjVX?=
 =?utf-8?B?Q0Z6Z0VWM3c5RVlFQUg3Qmk5aE9HT0NkSytmZFpELy9jMjNpQ2xCRGpSUU9I?=
 =?utf-8?B?aEpITkdmVkV2Z3lCU2Z2Q1hkWlBxWmx3T0VxN1FjVW91RGRVaDFHNmhKTFhY?=
 =?utf-8?B?OHZ6MEN6R2hsTVFFSUFXNmQ3aFlQU2RkNWFlQ0NCeC9xWk54VGRlVXFrK1F5?=
 =?utf-8?B?d3pPbXRFRFBnazBsZlVFa2tIRTZSTHlDRS9rRUpqYUg4WEo2cUplS3JwWDI0?=
 =?utf-8?B?a0ZINzVuRmZoZGp2L0pkdlMzazVmVlU3VTFFcStmSDZmZnRpM3pTL2d4RnN4?=
 =?utf-8?B?ZFVLREFTS2laODYvUTVFRnl3UTNwclByQlhFajVVRE1KdXdTa1RGRFNXaTcr?=
 =?utf-8?B?SHBJMFc5WjliSzBlQW80Q09OTXEwK3U3VGNacEVLZ3lQbG80c3UzNXdOaDdK?=
 =?utf-8?B?bjZKcS9RWDdlZ3JHRS9tMzQ5M1lTdWFMb0FsWkx2SXZ1aDBRNWtKZER1VVdK?=
 =?utf-8?B?SUcyVXBRd3ZrUHNENXIvbk9Dc0szNXB6a240aW42d3g3YmtCbGtia0Y0dFVI?=
 =?utf-8?B?azJ4M1hTUlBXZHBoZWpYaEhVUGJyWnp5Y2VXd3NmNWYrY21FVnRaOC94Q3N6?=
 =?utf-8?B?bzBZMm4zb0phcUdrVnAwNkFwMm81Qmd1eVUxZStBOGNnNnZuT2ZrdmQwa2sw?=
 =?utf-8?B?MEhZZms1Ni9VRXRjZ0tLSmN4d25GMU9MT2wyVUdpMUpicWdNdWUzNnZEUWdo?=
 =?utf-8?B?TDBRN0lQbFd2ZTBSMExYSWxxNjZTMUgxZDFaS3FvZCtReGp3L2VxYWVmR2ZC?=
 =?utf-8?B?RUx5dnVFU3hpR0xqRXFjT0t6TE9uZ2hqS3dUZHdQTjBKd00raWdicFRodTlV?=
 =?utf-8?B?NnY5bktLUk10MDN1SXl1d3lYSnAzbm9sZjN5R0RCRHhRb2JjcWlvMFhlekh4?=
 =?utf-8?B?Wm9PaUtGUjhmZTE1N1ZTY2F5dFc3ejZXMDJPWEg0RjdFQnFBdktPc2U3Sk9R?=
 =?utf-8?Q?2SLe9aIbyeuVSmFrySuGLK0S3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b32942-577c-4f2b-74cb-08dcf8fc7b58
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 16:04:06.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25Mc9RZYVib1iH8L+aqwRbyfbsRDusaDtt0kQhe3b7+niofngSlooTt6ucpiWc4GqZNAo1wC/e5eB3VdbylOHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6257

Hi,

On 10/30/2024 19:30, Hans de Goede wrote:
> Hi,
> 
> On 29-Oct-24 3:07 PM, Ilpo Järvinen wrote:
>> Hi Hens,
>>
>> There a question / item needing your input below.
>>
>> On Wed, 23 Oct 2024, Mario Limonciello wrote:
>>> On 10/23/2024 10:52, Shyam Sundar S K wrote:
>>>> On 10/23/2024 21:10, Mario Limonciello wrote:
>>>>> On 10/23/2024 10:32, Shyam Sundar S K wrote:
>>>>>> On 10/23/2024 20:04, Mario Limonciello wrote:
>>>>>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>>>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>>>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>>>>>>> The PMF driver will allocate shared buffer memory using the
>>>>>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is located in
>>>>>>>>>> the
>>>>>>>>>> secure world and is used for communication with the PMF-TA.
>>>>>>>>>>
>>>>>>>>>> The latest PMF-TA version introduces new structures with OEM
>>>>>>>>>> debug
>>>>>>>>>> information and additional policy input conditions for
>>>>>>>>>> evaluating the
>>>>>>>>>> policy binary. Consequently, the shared memory size must be
>>>>>>>>>> increased to
>>>>>>>>>> ensure compatibility between the PMF driver and the updated
>>>>>>>>>> PMF-TA.
>>>>>>>>>>
>>>>>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>>>
>>>>>>>>> How does this present to a user?  From what you describe it seems
>>>>>>>>> to
>>>>>>>>> me like this means a new TA will fail on older kernel in some way.
>>>>>>>>
>>>>>>>> Newer TA will not fail on older systems. This change is just about
>>>>>>>> the
>>>>>>>> increase in TA reserved memory that is presented as "shared memory",
>>>>>>>> as TA needs the additional memory for its own debug data structures.
>>>>>>>
>>>>>>> Thx for comments. But so if you use new TA with older kernel driver,
>>>>>>> what will happen?  Can TA do a buffer overrun because the presented
>>>>>>> shared memory was too small?
>>>>>>>
>>>>>>
>>>>>> New TA will fail on older kernel and hence this change will be
>>>>>> required for new TA to work.
>>>>>
>>>>> OK, that's what I was worried about.
>>>>>
>>>>>>
>>>>>>>>
>>>>>>>>    From user standpoint, always be on latest FW, irrespective of the
>>>>>>>> platform. At this point in time, I don't see a need for FW
>>>>>>>> versioning
>>>>>>>> name (in the future, if there is a need for having a limited support
>>>>>>>> to older platforms, we can carve out a logic to do versioning
>>>>>>>> stuff).
>>>>>>>
>>>>>>> I wish we could enforce this, but In the Linux world there is an
>>>>>>> expectation that these two trains don't need to arrive at station at
>>>>>>> the same time.
>>>>>>>
>>>>>>>>
>>>>>>>>> Some ideas:
>>>>>>>>>
>>>>>>>>> 1) Should there be header version check on the TA and dynamically
>>>>>>>>> allocate the structure size based on the version of the F/W?
>>>>>>>>>
>>>>>>>>
>>>>>>>> This can be done, when the TA versioning upgrade happens, like from
>>>>>>>> 1.3 to 1.4, apart from that there is no header stuff association.
>>>>>>>>
>>>>>>>>> 2) Or is there a command to the TA that can query the expected
>>>>>>>>> output
>>>>>>>>> size?
>>>>>>>>>
>>>>>>>>
>>>>>>>> No, this is just the initial shared memory that the driver allocates
>>>>>>>> to pass the inputs and the commands to TA.
>>>>>>>>
>>>>>>>>> 3) Or should the new TA filename be versioned, and the driver has
>>>>>>>>> a
>>>>>>>>> fallback policy?
>>>>>>>>>
>>>>>>>>> Whatever the outcome is; I think it's best that if possible this
>>>>>>>>> change goes back to stable to try to minimize regressions to
>>>>>>>>> users as
>>>>>>>>> distros update linux-firmware.  For example Fedora updates this
>>>>>>>>> monthly, but also tracks stable kernels.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Advisory to distros should be to pick the latest PMF TA (note that,
>>>>>>>> I
>>>>>>>> have not still submitted to new TA FW).
>>>>>>>
>>>>>>> Yeah we can advise distros to pick it up when upstreamed as long as
>>>>>>> there isn't tight dependency on this patch being present.
>>>>>>>
>>>>>>
>>>>>> That is the reason I am waiting for this change to land. Once that is
>>>>>> done, I will submit the new TA, you can send out a advisory to upgrade
>>>>>> the kernel or this change has to be back-ported to stable/oem kernels
>>>>>> for their enablement.
>>>>>>
>>>>>> Makes sense?
>>>>>>
>>>>>
>>>>> I think we need Hans' and Ilpo's comments here to decide what to do.
>>>>>
>>>>
>>>> Sure.
>>>>
>>>>> I will say that when we had this happen in amdgpu for a breaking
>>>>> reason there was a new firmware binary filename created/upstreamed for
>>>>> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
>>>>> have fallback code so it could be compatible with either binary.
>>>>>
>>>>
>>>> True. In case of amdgpu, the FW loading is part of the amdgpu driver.
>>>> But in case of PMF, the PMF TA gets picked from the AMD TEE driver
>>>> through the TEE commands.
>>>>
>>>> So, there is no need for FW versioning logic in PMF driver.
>>>>
>>>
>>> That's a very good point, and this is a lot of complexity then.
>>>
>>>>
>>>>> * If user on older kernel took newer linux-firmware package they used
>>>>> older binary.
>>>>> * If user on newer kernel took older linux-firmware package they used
>>>>> older binary.
>>>>> * If user on newer kernel took newer linux-firmware package they used
>>>>> newer binary.
>>>>>
>>>>> If the decision is this goes in "as is" it definitely needs to go back
>>>>> to stable kernels.
>>>>>
>>>>
>>>> IMHO, let's not put too many fallback mechanisms. The philosophy
>>>> should be use latest driver and latest FW that avoids a lot of
>>>> confusion and yeah for that to happen this change has to go to stable.
>>>>
>>>> Thanks,
>>>> Shyam
>>>
>>> Of course Hans and Ilpo make the final call, but I think from our discussions
>>> here it would be ideal that patch 1 and patch 5 from this series go into 6.12
>>> and have stable tags, the rest would be 6.13 material.
>>
>> Distros and SW component management challenges are more in the domain of 
>> Hans' expertise so I'd prefer to hear his opinion on this.
>>
>> Personally I feel though that the commit message is not entirely honest 
>> on all the impact as is. The wordings are sounding quite innocent while if 
>> I infer the above right, an incorrect combination will cause a 
>> non-gracious failure.
> 
> There are basically 4 possible scenarios and to me it
> is only clear from this thread what will happen in 3 of
> the 4 scenarios :
> 
> 1. Old TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> works
> 2. New TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> broken
> 3. Old TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> ???
> 4. New TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> works
> 
> If the answer to 3 is: "works" then I agree that this patch
> should be submitted to Linus as a fix with Cc: stable ASAP
> and then once that has hit most stable series it should be
> ok to upgrade the fw in linux-firmware
> 

Short answer, "yes" it does not work for "3." and you can consider it
a broken.

> Note this is still not ideal but IMHO it would be ok.
> 
> But if the answer is "broken" then we will really need to
> find some way to unbreak this, which could be as simple
> as querying the fw-version and basing the size on this,
> but having a kernel change which will regress things for
> users who do not have the old firmware yet is simply
> not acceptable.
> 

I am not sure if there is a firmware versioning interface that the ASP
(AMD Security Processor) returns back the kernel/driver.

The code path in this case is:

AMD PMF driver -> AMD TEE driver -> AMD CCP driver -> ASP TEE -> ASP
TA -> ASP HW.

So, I uncertain which module has this information and where exactly
the code of fw versioning has to reside. It will take a while for me
to dig this in.

Meanwhile, shall I drop this patch and resend the series (by
addressing the dev_dbg change Mario commented) so that this atleast
becomes a 6.13 material?


Thanks,
Shyam

> Regards,
> 
> Hans
> 
> 
> 
> 
