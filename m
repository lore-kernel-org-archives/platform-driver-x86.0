Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C29F32E72F;
	Tue, 18 Nov 2025 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472172; cv=fail; b=ce5KXMfoZKryGE5dPNlMxBoJvI34s6wv4bfJ9KuWqbWIla1ymu6iureXEaKLJUg7Et2lwFVN4sxTibc97L3cfl/Y5/iu1usqPKwKz1ROthkSwLvIyoVTbt/kywujUTM58ovzpvPfgg4D+yktcHd8oSGaZbGT2eLZR70SnW2sCeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472172; c=relaxed/simple;
	bh=wmTx8kM6WiT5XmPHZoQ5kU3pHM7YT6Yh6sInWD2qqEI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CaMV3daMAQ9pRgg6X+m1/YDDdrQPKeMpgIBVRy7Q09ru8v5Lftd7EFA+tUPLNaKF3cfKdqxtjBroq1ruo4Qybi9/NvvkMC40MugGlEiGTmERLnIOSvkTn19eKHcDiskQnIDtGiqEGYyXim+QDatfd4lITlmcS4T0DcbRwILPFKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TlypdICL; arc=fail smtp.client-ip=52.101.43.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TlypdICL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1HcuUMBw+u0wJsuL1oMVzFLGsLBbcKzmpiBmdMWIWEKrhp2I+kx1/GPi++FXnnNajEyltVf0yjaYt+PDqaObR2v+S8PureIDne/xI004cayN95BTsDBBgtWkiRMh3yhCCqQilA+DQyHBYVvCHFsd6xjNwzIYT4cQA8v+wHXTvy1N9LF32IEhVNqmMImVtWISrto81QKfE+h3PscgRZmgvivpLXKLBSeLRwhOgIqfD19THWMxA1bEFiq/wCwxDVYmS0qJe7h2ROZw5NWQYZU7qGH0vo9xa8rBtzdVLTK4lF529rnRK2Z8OEJLEHzJ6gdIGiBbtFa6dzEI5tryaP37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf6riSkzXPVl6QKTIwErlM+4qwvpcgsmENsAg0fLjXI=;
 b=mBcJIjGbI1iCIp7SVnLuDli/d+I7gvOFpQjuuW/I1a/py7YXywoKGaoanTnwlnCSlOAoPYMJuMCU9M/2Jz6LYvAUdCZBLK4h6HT/LVV94M+QyL9cZBAJmmeAJDGcd7dEUtM2Ld48CTR6TZPKKhRNmfgpcYL1sQfSCFVWsOTjwS5LpVTa80RjjVuJyNq/E9MChtrl9kmXqy06IH7jz9RbUeRstcLEh0ZLPa7kaNUXpAzVBK8iep5VtqK9rCWfW6orQKE/wDs+rdKJ8amu05KpQu0vMDDSe6lXgb3rPPPmBcqf/bMep7DMP5jFNP2oDiY9kH1nfSDpC9Djr2kUm4OaRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf6riSkzXPVl6QKTIwErlM+4qwvpcgsmENsAg0fLjXI=;
 b=TlypdICLaxa5mN6kjCU85ev60L678ZES30tj6PHQkhpP8Z1rh8+klIdJTN+jgmeiSxKmLterQ01RSflwLGcQMKc4OQn0fED4WtmO7LJMKM6zOIMDVDInQSPkpeKB2QlZND58Spomw0ETX52GwVGLIx2GnIBzq+qFdrWtmo0vZUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.23; Tue, 18 Nov
 2025 13:22:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 13:22:46 +0000
Message-ID: <439b43eb-5b57-49a4-96ca-7e4efcfe2485@amd.com>
Date: Tue, 18 Nov 2025 07:22:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: make CPU cores interface
 readonly
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <benato.denis96@gmail.com>
Cc: Denis Benato <denis.benato@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251118005748.538726-1-denis.benato@linux.dev>
 <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com>
 <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: d12c1fd6-fbbb-4835-3c11-08de26a59056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVN4a2NvMkFodERUZzRpY3FKM0ticXJ4NGliNEZ0elU2YzA2OU8xVjJNNUJ5?=
 =?utf-8?B?RUEzY0puK2hjcHZiOWZGcWcyVkc3Y1FWTGhFRW1IK29tZ2lteGgyVSs4akhu?=
 =?utf-8?B?ZDhTdVhzL2VhK05FQmFkc3NXV0xoWHkveXhqK2RNenU1VWk4bXlIOUtoTGw3?=
 =?utf-8?B?RG13eE01ckNCWnlIVHBvUUpsVE5jdmFtZWxsY1pGd0Nnc0J2WjhxNk5sVENB?=
 =?utf-8?B?eXZXZWkrdVZ5REpBS3dqc3MwWkwyQmhaOGxnRVhwQlR6L2VldnF0WWtuaDFG?=
 =?utf-8?B?ZHVYVnB6czhQOW9wUGhYaERLdEdocTg3VExpTkxDTUdJK0RBaU9sa0tUb05F?=
 =?utf-8?B?R29Bb3VnZ3p0SzhlNHZxN1VISUVkbWcrSVkxNXBpMTdSblVraGkvdlZ1WGIr?=
 =?utf-8?B?WEpGbjF6QWlSZHFTNTlWVDFnKzJPcG9lQndKN1lsTHJtS2pqTjFBazJXRG0r?=
 =?utf-8?B?ejRMbzhrU0xOS01oZC9GSExxMkt3RnBPblRDdGFwdjJrV1RLc3NkVi9BYzRn?=
 =?utf-8?B?NWp6OXVyRHlrdjRURmFnOCtoWTB1QkJMVm5kWU5EZS9UMGJlODJqaXFLWHd4?=
 =?utf-8?B?cXRFbXg3a2MwSFhNME9wWng5TkFRNUNXZDVhZnNsZCtCZUFHdWtHd2RLQUxa?=
 =?utf-8?B?eDhpSHorNUlFMDB4aExDczNZaDg5a2tCSnFSRWtPZVJDS1RyejFTdk14UjE1?=
 =?utf-8?B?Z1dmZ3hYNTB2eHY2b210WWVveVdPa1hISXdKV2FzVWRrcHBSbkY2Zkxwc1N0?=
 =?utf-8?B?REdLTVp4THZsQjZ0ZmgxQlFYM1luSjRxdXhOWGllWS9nUDgzMW8wVjVpZUVr?=
 =?utf-8?B?YkJRTmMwMU1rTzhjN3JwN2M0KzMwZ0FMRW5GcGcyQnBwVG1aU09UL0Z1ekM3?=
 =?utf-8?B?MERMRUI3eWpXWk5xaE0rdmRsaHhaT3A1emhyL3ZobGZWRnJ6R1V4WXloT0hH?=
 =?utf-8?B?TG94cmVXb1lGRWEzdEx2UkFRSzZYT2NRS2d0UnR3MnVHRWduSHA0WllmSGxG?=
 =?utf-8?B?cldsTWNuZEJkbnZYTjMvVG1MMXZWaENET09iTzRUaEdpVkpCbW9JY3A4WVp5?=
 =?utf-8?B?Q05leTNGMlVmOWZEYS9DZG9vemlJa3dQMUo0MVdhTlBteTZyT1BsYTIxWW1R?=
 =?utf-8?B?VDZFd0JLeENXL3B3MUlYRlIyUktZVWcyKzRsNGVYZktVdDRvOTJWcThpQWlQ?=
 =?utf-8?B?bHVvWVEwR2xaQUIvZlNJWG13N25TSGdQSzRydXVadDNvajhSaVZCT3hjM3dn?=
 =?utf-8?B?NGRldGxuRHNHOE5aTWNEY1ptWnJqek5NaWIvbnRnSzRhbU52UnZvZThRVzB6?=
 =?utf-8?B?amhLcmR3aUc4anVsWUJ0UWdGQkdCSE93N2pxNUZGbThIZ25oZWF3ZVl6eEIz?=
 =?utf-8?B?K2ZYM0ZvNTB1L2o0RlZaeTZ4Ujk1M2FZYTA1cWk4Zk5DVklrOTJITHRONFRz?=
 =?utf-8?B?eGs3Vm1ZNHRUNmF6R1lBWWloL2haUlY5dUtLdjU3S2VGRklHWU5LVTNBOWZt?=
 =?utf-8?B?T2haeDJmR0VaQ203dXRla3BxZUxCMlJWNlhSS010a3JrMHduRHh4WUtUVmtL?=
 =?utf-8?B?VE9FYUxhdkIvaW0wcGRkMVBVaVM5RHg0WUFhMTN2cTFhNXYwUnRYNCthSEpO?=
 =?utf-8?B?OFhrcnFDckY5dkc0WEhZM1BVcG9CMWFoWEJqRTdPcmZsTGQ0TEUxWjVFMWlo?=
 =?utf-8?B?Sld1Z204TjVjOVhQNmJPalFzRjU2TSs0MW1aM2NNcWFoK2lXNU1Fb0NwOTBj?=
 =?utf-8?B?TVpHWjJ6SjNEd3Iwd2FRMVN4ajNtazVRQWxYenN1b0txMGVWM0JHR2pnYUJo?=
 =?utf-8?B?Uk9mOGJLTEc0SGJXTlJuZ3ZsVmtESGYzWk1lYzVwa3pCNDRTZmdNYlk4YktP?=
 =?utf-8?B?dTZDZ1p3SitSZkZiNWdMb21PYlF5ZlZsZVpaMjBuNnJaTkV4cG9vaHlhdWdh?=
 =?utf-8?B?Uk93eHZIQnFqaC9iWk1zVndQdVZDYXA3S0QvMmUrMFI5NDBXNlBQb2dXb3gr?=
 =?utf-8?B?SjRCTUdHQkF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBjeFd4WFVKVFZidWxhTXBoaW04SXJaUjQzSjdvS09helFKTVNFMVdVUXdl?=
 =?utf-8?B?cmNBcmh4OTBmZDRlUmRGRTJYRElRODVuYWxaMVVRSkFZOThEN2wvamIwajU0?=
 =?utf-8?B?Rk0zMFBjeVY0ZGRFRFVwbFQ3dmRTTmdpRVRkMWtta3NBQVZNSjdkcmxGZENk?=
 =?utf-8?B?SEtIcWJYeWRSOHVSMWpkY3prUHI3VlptQlYzemxIdkQyeWRibm5RRlRxTklo?=
 =?utf-8?B?TTR6YjBuK0NvcHpIV3V0YXc0ZUVtVUpPUzd2TGRod2gzRm43Ti9EK0E2QWNN?=
 =?utf-8?B?bVhOd0RPVGNZaGJ2M2F6Ky9VTUhkZGJXTHBMUkJsVzVsNnkvc0QwdlhNK0dI?=
 =?utf-8?B?Y1Q0cnlrWm9NR1pRSGgxZkY0OXppR1dXeHBYYWZYbVh2VVAvem83QmxPVkkx?=
 =?utf-8?B?SmFuOVRNM09KM200RzlXRFl0emFrNndubDB0VTg0SEJ5U2ZIaUlrMVdRTDhi?=
 =?utf-8?B?dFRpYjdEOU9sM0ZWeXc5d1lyUWI5TDJ1MXFCOEV3aVpLRHNTVmVBUityZ0E0?=
 =?utf-8?B?dG96ZS96Qm9SNU1FcVBPNzlCc0tIUlBLdjc3SjFBaExRRjNWczVYdkMycWFJ?=
 =?utf-8?B?OXhncWQ0RGFwVEtKRUR6elcvMzRaRmlHUTJpVjdLZ0JkdFNJYzVhbjJzZWg2?=
 =?utf-8?B?V2NOU215N1VET3hCajV2OTZDMTg4d3N5Tlk5QXdWWE40R21lVmJCTDN5Vm1M?=
 =?utf-8?B?OGVIcWFkZGJoSHBGaU9KaVp5ODh5TUFmeXdjd3JyZXo1bEJzZzN2MjlCZm5k?=
 =?utf-8?B?SEJPbW1pM3NxRG9ZdndueHJaamhYZnR6dUxqWS9oZ2h3NnplTGNNM0J0a2NM?=
 =?utf-8?B?Y0ZkbTVsQ25HQVkydVE5dXJIeWFBUm5XamdzZXZnZ2FRenRpcnJaYm1ET3Fs?=
 =?utf-8?B?KzFJZ1FFaGJ6L0NIaktrQzJrajA4akhSeDhNdWpEOXZMR0xCQXRER3JtRUcx?=
 =?utf-8?B?TnFZYVY1WUZUZ0NmbnVObzh4NDdqMmxVL0tkUDEwdGhLL0FxRXdwek5Fc3lv?=
 =?utf-8?B?SHB4Y1A4ZjZQV0lKWWtlbXRmUldVSm9TYlhTWURsTWZhbktoMlczTi96WVIz?=
 =?utf-8?B?enZEbzhDSVhGc0lwRlNSSWxIMk1JS3Mxekh2TEJYWnpIZWpXd0lQeUJIazFh?=
 =?utf-8?B?YW9wTWF0QkI3UWlyRU5JcXNFNXlIYVFyZFgrVWFXM2V1SW42MmZReVBiWTBr?=
 =?utf-8?B?N2xwdXN0RVVUb3kzT2FqcnRiQ2hBN29QUlV4emdzbEdXd01hVTF5dDZIb3pZ?=
 =?utf-8?B?RExKOTMwQ3BMQ3RKYVJyZk96RWhLNXdNWHNRTXBkQTRRKzdaSmdNVTc3Z0F1?=
 =?utf-8?B?c1VXNzBYVnJ4Q29IaVdsbHlWbkY2REFoY2pQOWJPcitrbXJBRTZ3Z0pOMmJH?=
 =?utf-8?B?aDRwalJYblp4Y1BZTTZYQW5QMXErTEg5RzVtWDF4U3RpRXZVMkZ5UVhvVThN?=
 =?utf-8?B?amNYbnI5TXJDNTk0YWMvZFlVS1pOU241ZWtQcjVDVm01aURScUs2RzR2Tyti?=
 =?utf-8?B?Z3gvS0UzNk9vL0JXa21nKzZneUtlUGlxaWJaL3UxbXNqS1lCV28wQjlYMTJB?=
 =?utf-8?B?WEhPVWZpNm5HbDcxM2dCanZYK3RwbHFWZWxuT2pZMFgrejE2K0hibE8wK0Iw?=
 =?utf-8?B?dW90MDBQZnBTZDkvVXN3YWFpa0U1dHdOVVg3R3VsRlJRbzlqNkhQS1ZwbHEz?=
 =?utf-8?B?VWQ2QnRYRkRMWEtiTlBwd0tVY0xkK1lYNUhodTJjZ2dpQ2g0ZWtiOURWbG00?=
 =?utf-8?B?UDlCVGV5TXo5dzRNR3BUL3ZpWnZzcmFvZXRidERnK1JzSlhXZDAya0RscEND?=
 =?utf-8?B?OUJGVTF4Ry9RR3QxZWc1UWdTT2QrRXpVZlIzVmJEQjhrTjZmaDJiNVpJekRG?=
 =?utf-8?B?WUNTS3lRQU00QUtobEtlbEdBeThiaDUyZVJFOVkxMm5Yd3hYb0ZjZjAyUVRl?=
 =?utf-8?B?bjR1TXo4UElKUTI2MGU3NVZjbVh6MXlnT1IwQ1pKZ21wT25yWGNBdmRzc2JS?=
 =?utf-8?B?MjlPVVNPZmJyQ09kOGZCYnFRZG5TSlh1M29aWnVLZlU3Sk9Tem96cllLSVp3?=
 =?utf-8?B?b1QvMENDblAzNGJBVGFJTnNId3VIcmpycHdQRStKSTdtanZ2aks5bUtnWFRr?=
 =?utf-8?Q?Wi07LsBeA8wU7saoAtDQMnqUw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12c1fd6-fbbb-4835-3c11-08de26a59056
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:22:46.8717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCAv55P+1VeEVp7xZlYYGk7HfTQHnei26vmvvdN9mrp5EPOKHjsIXI685s6h8AGOzp734JfaIAqe3iOFvRaMyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7512



On 11/18/2025 3:16 AM, Ilpo Järvinen wrote:
> On Tue, 18 Nov 2025, Denis Benato wrote:
> 
>>
>> On 11/18/25 01:57, Denis Benato wrote:
>>> The CPU cores interface is inconsistent between AMD and Intel systems,
>>> leading to probe failure: solve the problem taking following steps:
>>> - make the interface read-only (avoid the possibility of bricks)
>>> - do not fail if the interface returns unexpected data
>>> - show interface errors at either info or debug level
>> I felt like compile-time disabling the write endpoint after reading the comment
>> from Mario while still keeping the core of everything that was said in an attempt
>> to make everyone happy and preparing for the future.
>>
>> I can also evaluate the option to introduce a table for allowed models
>> where the min number of cores is hardcoded for model as it is for TDP
>> tunings: that way allowed values will be tested by someone...
>> Material for another day.
>>
>> On a side note checkpatch says:
>> ```
>> WARNING: Argument '_fsname' is not used in function-like macro
>> #293: FILE: drivers/platform/x86/asus-armoury.h:210:
>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)           \
>>          __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
>>          __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>>          static struct kobj_attribute attr_##_attrname##_current_value = \
>> +               __ASUS_ATTR_CPU_CORES(_attrname, current_value);        \
>>          static struct kobj_attribute attr_##_attrname##_default_value = \
>>                  __ASUS_ATTR_RO(_attrname, default_value);               \
>>          static struct kobj_attribute attr_##_attrname##_min_value =     \
>> ```
>>
>> but _fsname name is used just below in the same macro:
>> checkpatch.pl bug?
>>> Links:
>>> https://lore.kernel.org/all/20251114185337.578959-1-denis.benato@linux.dev/
>>> https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux.dev/
>>>
>>> Suggested-by: Luke D. Jones <luke@ljones.dev>
>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>> ---
>>>   drivers/platform/x86/asus-armoury.c | 104 ++++++++++++++++++++++++----
>>>   drivers/platform/x86/asus-armoury.h |  12 +++-
>>>   2 files changed, 99 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>> index 9f67218ecd14..abbbcd62d0eb 100644
>>> --- a/drivers/platform/x86/asus-armoury.c
>>> +++ b/drivers/platform/x86/asus-armoury.c
>>> @@ -118,11 +118,14 @@ struct asus_armoury_priv {
>>>   	 */
>>>   	struct mutex egpu_mutex;
>>>   
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>   	/*
>>>   	 * Mutex to prevent big/little core count changes writing to same
>>>   	 * endpoint at the same time. Must lock during attr store.
>>>   	 */
>>>   	struct mutex cpu_core_mutex;
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>> +
>>>   	struct cpu_cores *cpu_cores;
>>>   	bool cpu_cores_changeable;
>>>   
>>> @@ -136,7 +139,9 @@ struct asus_armoury_priv {
>>>   static struct asus_armoury_priv asus_armoury = {
>>>   	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
>>>   
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>   	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>   };
>>>   
>>>   struct fw_attrs_group {
>>> @@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>>>   			return -EINVAL;
>>>   		}
>>>   		break;
>>> +	case ASUS_WMI_DEVID_CORES_MAX:
>>> +		/*
>>> +		 * CPU cores max is a read-only property on supported devices.
>>> +		 */
>>> +		pr_err("Refusing to write to readonly devstate of CPU cores interface\n");
>>> +		return -EINVAL;
>>>   	default:
>>>   		/* No known problems are known for this dev_id */
>>>   		break;
>>> @@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>   		return ERR_PTR(-ENODEV);
>>>   	}
>>>   
>>> +	pr_debug("CPU cores control interface max cores read 0%x.\n", cores);
>>>   	cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>   	cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>   
>>> @@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>   		return ERR_PTR(-EIO);
>>>   	}
>>>   
>>> +	pr_debug("CPU cores control interface active cores read 0%x.\n", cores);
>>>   	cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>   	cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>   
>>>   	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>>>   	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>>>   
>>> +	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
>>> +		pr_info("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
>>> +		       cores_p->min_perf_cores,
>>> +		       cores_p->max_perf_cores,
>>> +		       cores_p->cur_perf_cores
>>> +		);
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>>   	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>>>   	    (cores_p->min_power_cores > cores_p->max_power_cores)
>>>   	) {
>>> -		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
>>> +		pr_info("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
>>> +		       cores_p->min_power_cores,
>>> +		       cores_p->max_power_cores,
>>> +		       cores_p->cur_power_cores
>>> +		);
>>>   		return ERR_PTR(-EINVAL);
>>>   	}
>>>   
>>> @@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>   	return no_free_ptr(cores_p);
>>>   }
>>>   
>>> +/**
>>> + * cores_value_show() - Get the core count for the specified core type.
>>> + * @kobj: The kobject associated to caller.
>>> + * @attr: The kobj_attribute associated to caller.
>>> + * @buf: The buffer that will be used to sysfs_emit.
>>> + * @core_type: The core type (performance or efficiency).
>>> + * @core_value: min, max or current count for the specified cores type.
>>> + *
>>> + * Intended usage is from sysfs attribute reading a CPU core count.
>>> + *
>>> + * This function assumes asus_armoury.cpu_cores is already initialized,
>>> + * therefore the compatibility of the interface has already been checked.
>>> + *
>>> + * Returns:
>>> + * * %-EINVAL	- invalid core value type.
>>> + * * %0		- successful and buf is filled by sysfs_emit.
>>> + * * %other	- error from sysfs_emit.
>>> + */
>>>   static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>>>   				enum cpu_core_type core_type, enum cpu_core_value core_value)
>>>   {
>>> @@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
>>>   	return sysfs_emit(buf, "%u\n", cpu_core_value);
>>>   }
>>>   
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>   static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>>>   					 const char *buf, enum cpu_core_type core_type)
>>>   {
>>> @@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
>>>   
>>>   	return 0;
>>>   }
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>   
>>>   static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>>>   						struct kobj_attribute *attr, char *buf)
>>> @@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>>>   	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>>>   }
>>>   
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>   static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>   						     struct kobj_attribute *attr,
>>>   						     const char *buf, size_t count)
>>> @@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>   
>>>   	return count;
>>>   }
>>> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>>> -			 "Set the max available performance cores");
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>> +ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
>>> +			 "Get available performance cores");
>>>   
>>>   /* Define helper to access the current power mode tunable values */
>>>   static inline struct rog_tunables *get_current_tunables(void)
>>> @@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>>>   	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>>>   }
>>>   
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>   static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>   						    struct kobj_attribute *attr, const char *buf,
>>>   						    size_t count)
>>> @@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>   
>>>   	return count;
>>>   }
>>> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>>> -		    "Set the max available efficiency cores");
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>> +ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
>>> +		    "Get available efficiency cores");
>>>   
>>>   /* Simple attribute creation */
>>>   ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
>>> @@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>>>   	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>>>   	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>>>   	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>> -	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>> -	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>   
>>>   	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>>>   	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
>>> @@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
>>>   		}
>>>   	}
>>>   
>>> +	if (asus_armoury.cpu_cores != NULL) {
>>> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>> +					&cores_efficiency_attr_group);
>>> +		if (err) {
>>> +			pr_err("Failed to create sysfs-group for cpu efficiency cores: %d\n", err);
>>> +			goto err_remove_cores_efficiency_group;
>>> +		}
>>> +
>>> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>> +					&cores_performance_attr_group);
>>> +		if (err) {
>>> +			pr_err("Failed to create sysfs-group for cpu performance cores: %d\n", err);
>>> +			goto err_remove_cores_performance_group;
>>> +		}
>>> +	}
>>> +
>>>   	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>>>   		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
>>>   			continue;
>>> @@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
>>>   	}
>>>   	if (asus_armoury.gpu_mux_dev_id)
>>>   		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>> +err_remove_cores_performance_group:
>>> +	if (asus_armoury.cpu_cores != NULL)
>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_performance_attr_group);
>>> +err_remove_cores_efficiency_group:
>>> +	if (asus_armoury.cpu_cores != NULL)
>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_efficiency_attr_group);
>>>   err_remove_mini_led_group:
>>>   	if (asus_armoury.mini_led_dev_id)
>>>   		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>>> @@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
>>>   {
>>>   	char *wmi_uid;
>>>   	struct cpu_cores *cpu_cores_ctrl;
>>> -	int err;
>>>   
>>>   	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>>>   	if (!wmi_uid)
>>> @@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
>>>   		return -ENODEV;
>>>   
>>>   	asus_armoury.cpu_cores_changeable = false;
>>> +	asus_armoury.cpu_cores = NULL;
>>>   	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>>>   		cpu_cores_ctrl = init_cpu_cores_ctrl();
>>> -		if (IS_ERR(cpu_cores_ctrl)) {
>>> -			err = PTR_ERR(cpu_cores_ctrl);
>>> -			pr_err("Could not initialise CPU core control: %d\n", err);
>>> -			return err;
>>> +		if (!IS_ERR(cpu_cores_ctrl)) {
>>> +			pr_debug("CPU cores control available.\n");
>>> +			asus_armoury.cpu_cores = cpu_cores_ctrl;
>>> +			asus_armoury.cpu_cores_changeable = true;
>>>   		}
>>> -
>>> -		asus_armoury.cpu_cores = cpu_cores_ctrl;
>>> -		asus_armoury.cpu_cores_changeable = true;
>>>   	}
>>>   
>>>   	init_rog_tunables();
>>> @@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
>>>   					   armoury_attr_groups[i].attr_group);
>>>   	}
>>>   
>>> +	if (asus_armoury.cpu_cores != NULL) {
>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>> +				   &cores_performance_attr_group);
>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>> +				   &cores_efficiency_attr_group);
>>> +	}
>>> +
>>>   	if (asus_armoury.gpu_mux_dev_id)
>>>   		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>>   
>>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>>> index 2f05a2e0cab3..6b2bfe763d23 100644
>>> --- a/drivers/platform/x86/asus-armoury.h
>>> +++ b/drivers/platform/x86/asus-armoury.h
>>> @@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
>>>   		.name = _fsname, .attrs = _attrname##_attrs			\
>>>   	}
>>>   
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>> +		__ASUS_ATTR_RW(_attrname, __attrval)
>>> +#else
>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>> +		__ASUS_ATTR_RO(_attrname, __attrval)
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>> +
>>>   /* CPU core attributes need a little different in setup */
>>> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)		\
>>>   	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
>>>   	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
>>>   	static struct kobj_attribute attr_##_attrname##_current_value =	\
>>> -		__ASUS_ATTR_RW(_attrname, current_value);		\
>>> +		__ASUS_ATTR_CPU_CORES(_attrname, current_value);	\
>>>   	static struct kobj_attribute attr_##_attrname##_default_value = \
>>>   		__ASUS_ATTR_RO(_attrname, default_value);		\
>>>   	static struct kobj_attribute attr_##_attrname##_min_value =	\
>>
> 
> Hi Denis,
> 
> This cores thing has unfortunately turned into too much of a mess, a fixup
> after fixup, disagreement of even what should be included and what not.
> 
> I'm really sorry for all the extra trouble these people are putting you
> through as apparently even 17 versions of the main patch series weren't
> enough to get them to stretch their fingers over the keyboard :-/.

FWIW there are new issues in brand new hardware that prompted a lot of 
the discussion and put into question the efficacy and safety of the patch.

> 
> I've now dropped the cores patch from the review-ilpo-next branch but
> tried to keep the rest. Please check I didn't make any stupid mistakes
> while resolving the resulting conflicts with the ppt/nv change, at least
> the diff against the removal patch looked promising. If there's an issue,
> please just provide a clean v18 of the main series without the cores patch
> so I can replace.
> 
> If you want to send a clean version of the cores patch (separately), I can
> consider it after giving enough time for people to comment.
> 

I think it's a pragmatic approach, thanks.
