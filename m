Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D5FBA53
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745231686; cv=fail; b=b6aSAYkB9M/OGu6x2PKEcTrDign2rxlAwpwYcdnFMNkavon71pfoXLDfrGT+IeHa+dSWGdwf/dQ4pLOizBPwWjLwRqOL3OM9S8aLFHceBhfpkSYqKRhGNrKkgEDDv9mPKFx7HZxXY0TAb8JaELxpenXTYDk/pr+qWhOBPQh+YK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745231686; c=relaxed/simple;
	bh=orrf5GT8co5ggS+NQyDswDRG+3sP2chxbDwhz6ya2dc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nzfRqWyiRkFjawaOfzZ6rwZL9dMgFhhVRVw3f+IRcPYBQvMO5oh0vAgkxOqUfbPDknn2ceYJe6ZdzUh4+Bzk9Dm/zjov6ZJBbSVJBjUwTq9e2OOpt4nBsbjm1T3v95/BSErZZMjC+qYUV5e/bvjpYwonY8+AA5IcX1Sgvzcoikk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YwXbrWlB; arc=fail smtp.client-ip=40.107.236.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YwXbrWlB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDjvfUq9XgPeQMo5dNeYHSrPkcKF771XyRPlpM9baSQZfsC1MsxBmZNsjzBoZqfQrnrXVTdlwJXVNWArpLc8vEut09gyEUc+SAkmLWDVcoJjBH/CNNdlXF680vADAD2SXcvDSMvfuzffzpOXrFxHG78wOERBQenFG7tW+d8SWLf3zVeABi2BwgMXfOuxe8Q59gqpa56h0jRkRl+kRv9C8EyxCgo8lwGeFyV6r0vcO4AYHhy7eE8qof9e8Y2Xj8Zr8nlBxVlbK+TJOGzpUHY4mYpIO6Lpg1dwK3RckzeGK6Dxy2s9d87+EuUjP8gHUc7QuAS5LAf/IF5p5/KsH98d3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ryksg1fjtKWZyVNS03xagc9F8GGefXZzjeVNGYf/Weo=;
 b=ik/Ksh+OOrhGTO4+vRpWsaa/o4th2Z3ZosJylXw+TXFw0fGdkOJfMMBwdzubDik6jqfOpzWAvC4UwkFDr+/ri0ZHMZwfKZTO9dI389FskAODzZ8ghIUlNu25uEI6nNJzgP6oyZSEQaSkirGgWPGkO+5BnFK2oBPasfnPaB5FVokIL8xWfe2dekgwsXrqLakKMXdEA6SMI55cOD+IdbrpAwR9zoJ6L/ia1IKUtIK1YfDYXpyes2PGGmSlyaQ2GTjxFdSsgJ89nYyH6jy+R7a5y+IMmom4Y8Ve292DTPQBQMgre4hWVLTRxUzi1rCGZ+L1Yqp/aZxIygfZiKNzZ0GrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ryksg1fjtKWZyVNS03xagc9F8GGefXZzjeVNGYf/Weo=;
 b=YwXbrWlBnYXFy/2K32/GoE0Pz5E3pc9EceiGU7ulvDFRzYEXAgFyWPq2fGY1DgPCquhnF93CD7E5QvLY1dXmpI1DjJ5HgxjpdPnqkcqR8PwKZ1uDU+RrOsPwyNgDGTDmLhyntQyJ6kwUE8BSNm6swGSTfx9p3dws86BIofDbrXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by PH7PR12MB6905.namprd12.prod.outlook.com (2603:10b6:510:1b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 10:34:40 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 10:34:40 +0000
Message-ID: <65a8045b-42ca-4d13-b0d6-2f739582faa5@amd.com>
Date: Mon, 21 Apr 2025 16:04:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] platform/x86/amd/hsmp: Create separate ACPI, plat and
 common drivers
To: Hans de Goede <hdegoede@redhat.com>, Gregory Price <gourry@gourry.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
 <20241021111428.2676884-8-suma.hegde@amd.com>
 <aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F>
 <8c0d9751-767f-4e8e-bbf1-bbab89c1b8c9@redhat.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <8c0d9751-767f-4e8e-bbf1-bbab89c1b8c9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::17) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|PH7PR12MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: de4f3ec2-80c7-4a49-0ba5-08dd80c01f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0NXQm8xTGwxVVRCN3I0VGJXd0ZQa2xNdEZHWlpYd3h5cGF4Vy9xMFNyVHZ1?=
 =?utf-8?B?SzRLMDhINXZFWTEyNVlhU2tZazBRQnBrN3ltZGRQZE1FdE8rZDJWOU1pT0Ro?=
 =?utf-8?B?UFlYdEJjZEFQMzA2K01FcFFneVFSZ1hoeUUyaUU1WG96dlNnaHkyQWNUTEkz?=
 =?utf-8?B?Z2hMMXBPTHE2VTdHcDExRkR5aUc2QUlHZG9sNFJEbDFhMmR0NDIrK2FwaCts?=
 =?utf-8?B?YUVSZ21QczgybWU2aExrRENaZGRBb29sSHFzbEtDdERxY2hIaHVOSVBGVjFT?=
 =?utf-8?B?L2Z2UDhFeXZzeTNoUlVmZWZlcWpRdjRRcDJNbUViZ0doQk04ZVQwdDJPS3dF?=
 =?utf-8?B?TTRocHZTZFEvTTZENUtvQWpLOXZ2Y2ppWkJQWnd6ZXF5TkdVeEVUcWpNV1pH?=
 =?utf-8?B?VmxlSHpRa1JoZVBabUIwckdUd2NTa0NZclhLY3dPMmp6QXQ5Uyt4YW9vT2hl?=
 =?utf-8?B?a2Y4N1UxMEtxNU9oZnBaRnVLSExFWG5LV1N5cEIvcU54RDhpeDdPVnBDNG52?=
 =?utf-8?B?Z1RIUmNBVmFsV1U1dkhCNUFtV2dSZFN6U1ErVXVyaVZKd1VBSmltckFPQ25E?=
 =?utf-8?B?aTFnMVQ1NXBwWnBoZHFleFJMRksxZmpoc1NPVDVZOW4zVWE5aUQ2LzhJci9O?=
 =?utf-8?B?d1NXcG0yNnhkckYxS0pWS2wzZHNSWGxEcFVBVkcrQVNPOGJoQ0ZEajg5YTc3?=
 =?utf-8?B?dTVJVStSMHhmK0s0dXlOOGpYditRWWhac1l4OStLdXVPQUhscnk5NnQwWDJQ?=
 =?utf-8?B?TFJCMzBCN1U2bXNycENFZW1EUTdrbGE0Wk1PcWNsZjZPbm15dFp5SDIwNm1i?=
 =?utf-8?B?c0FHTU9yamhMYWNKWUZTUStmRkNOaFZibXREaTgrMmFWaUdYeVE1VzQxRFBj?=
 =?utf-8?B?M3hSdG9KalQvSFFhUStUNWxBSHV2Y29IdTRLSUVKd3pMdTJhakpTR09Qb2o3?=
 =?utf-8?B?V2w5N2JFVS83Q3cvWXhEb0VENlVTZFNEdnUxSGZjd0VGa0VVOUJnV1dha3k2?=
 =?utf-8?B?c1VWbG80dE01WVIrQ2ttZ2tVbVZGNEpXL3RPNHRMVW1DZkRhZytxZXZKMTdQ?=
 =?utf-8?B?MUk4d2l2QkYyTzZaQ3Y2NkhHUFZsWjRnd20zeG02MHZCcVdzVzFjSmZta1ZY?=
 =?utf-8?B?d2VQMWUwdlkzRTNablBzeW1GeC9kaVlzdVZvV0F4Szl0T1BGQ1RyVHZMbVdO?=
 =?utf-8?B?MEhEUVVjRVgwYzBUdFFsZEdYeU1pOGtyVWZ4UDFpU1BUNzJOZnozR0lvSEQv?=
 =?utf-8?B?dGNpT21NVE84enBhWTJJeGVjR1h1cTAza0dDOTc2b1dQb3MrR3o3cm5wcUpT?=
 =?utf-8?B?VmFiajhCajRrNEpsUWppbE9ESnN6cjh4OFBNMG5mRWxGV21HTXc2Vk9BQnR2?=
 =?utf-8?B?V2VSeVVrb0NhdzNTdS9ZVURkMThXb2w3VkRSTndoZXBLM1N0djdvaHBpaU1w?=
 =?utf-8?B?QzgwbUZOK0JUQzFtS3AvMHkyUEpRWjViYTlsVkJXYk1oWnRNQ0w2RlZFN1pK?=
 =?utf-8?B?THZ2QTBlT1Q0bUN1S2pNMGMvK1hSTlRaNVlBWktrOXA5ZldTZ3VTM2EvVVJI?=
 =?utf-8?B?YVgzMlVzNERsTE1pNkpXMEJmbk1PSFJNNUlOYnFvVldjOTZ2bGZ4WGZYVlFG?=
 =?utf-8?B?MVdJbG9CNXBsVkNWL3pkeXVXMUFuMmlpc01lemxRV3AzNEdjQW1Tc21SYUNC?=
 =?utf-8?B?NXl3VEpGRHF1V3ZLamxjd1JwTVNqbzZaaW8xNjdkMkhOaW1IMnRteDFnRGor?=
 =?utf-8?B?VGVYNjd3UjN3TWlMeXhUbWY1cVNZcjdoajRKcWZmMnhXeDNzcHo5QWR1aWNG?=
 =?utf-8?B?WkplcUNLTWJLalpHS2phOVF0NjQ4ZStQQ1VVZ1lxTmdFRGV1RGwxZFRPOVo1?=
 =?utf-8?B?QllYd2RUMnVIWm00a2l0V2xtMGVZdzREdlpzcmtrNk5wbHh6Nm1sZHgvcm4z?=
 =?utf-8?Q?RGgDulTJm7Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2ljenp4S0RJMUNWaGFsWTJIM1hEUTlIVVZ5L2k1Y2wyYlFmQWQ0WTA5NFMw?=
 =?utf-8?B?alNOOXZwbndCYyt5ZXlTWDgrUGwvckk2WGF0T1oweGU0YTJHWU5ld1J0WVAw?=
 =?utf-8?B?dHgwRmp4cFYzQ2VacjExMEhaOEplUlRPLzZJM09EQklGUFFtOFFxejlXMFZt?=
 =?utf-8?B?bldPUDMvTlBqMWhDTUtYdDAvcDJuZ2JCejdYZkM5NVNZdjV3QXhsaURYTndq?=
 =?utf-8?B?cjdVaHZ6Q2ZNVG8yRmFOWW8wWm1vZ1BER3hNR0x4MUp0L1VyK2h2UXI2dTla?=
 =?utf-8?B?dkhKMWt1RXZCZW1SV09QOStRMEVLamVCaEM1MURDVVFqclJIT3c1c1U4ZjNF?=
 =?utf-8?B?VlMrWm9nWlMwNzhaeWlMd09hbUNwTXZkUDhiVzFCOXFDQ01Rdi80VGJCOWRT?=
 =?utf-8?B?R3ZzUy9CS1YvVlNMZWZNOWpXWVBiUXZ0L0N3WmlQaTBERE43RVNJTVZmaEZq?=
 =?utf-8?B?bU5ncExaMFl5Z05GbU85YnFXSHQyMGNvcFJVd1Z4NjJzTVRydFpRSVJPa1dW?=
 =?utf-8?B?OEpTS2cxbHNwamRiUDN2V0dGZ0Jwb2JoOFFsNEd1QnpOVk5raWtkL1hnUHBO?=
 =?utf-8?B?WlJhWVVkcWx6Q2JRbXZBRm1rMlJYNGgzcDNvWGNSdDF0NGdYN0hPT2hjem00?=
 =?utf-8?B?ZXJPMVBnR1ZRODRpWVI3QnNJNDFsaWNZc1VKV2ZoN21UQWZuQ3lBSENFSy9h?=
 =?utf-8?B?VVBNOHJIeVVBb21iQUIvYXdUUFlRMWN0NGFPN3ZGckYyZm9PUi8rRUo1Umll?=
 =?utf-8?B?U01RbkQ1bkE4cXhrL2tGc0pPL3hNOGc1ZDVqY2tYUjN0Q0VZN1dqY3B2OGtL?=
 =?utf-8?B?UnJVMXU2YVl0UmsxMlMvOENXYm1peW5pMFlBZm5lRzNCcVdBMkdDampPenh1?=
 =?utf-8?B?QUZyeVNIaUhjbDZ5aTZ5VEJnWkNVdFUwVUUveTVTRjdJUTcxaVo4M2hWOFJu?=
 =?utf-8?B?VFVHNXdYMUg5ZjUzZUF3WmFrSkwzQ2pVQmRJenVtS1gxM0lCaDVPUFI4K25s?=
 =?utf-8?B?S01YcjFORmgyYjBMQ1NRSFJPNjdzK0pQd0JQamdCbElvb05IbGRyQWVrOVho?=
 =?utf-8?B?a1IvUTdZY1ZKQ2g2RWYwb2tySHM0cjBhYkFHaTZJWDQrS0NiUEFVUnpUVTl6?=
 =?utf-8?B?ZmZGeGRMczArcnMzOTloZ2dmUUl2Wjc2Mk52N0dVakRibi9VNlhzcnJ3K3I4?=
 =?utf-8?B?NytoRDkrV0dMV0ZpUk4wVEJoamQ3dkp3MVA3VmE0eXVFQWhkeFRvemlEdzFO?=
 =?utf-8?B?ZjR3Z3lnMUM2U0w2aVRNeVBQY2RQdHhhQ3B2RHMwSnk0ODF2MVlJUnFqVTgx?=
 =?utf-8?B?QXZTNUtsQXR3K2NmTXpGY3dTNE43bU4wOWFuWTloSjgxaVhQS3BxU2w1d1hh?=
 =?utf-8?B?dENjajlEY0xjU0J2RGpyQzBkUHhVMGpmbWNadWJlUk1zWVJsZTlLQnhOVTR5?=
 =?utf-8?B?ZmovaVVBaHRJekwwc0Y0dW82L0x2RXVGelhDVnNSbFRpN0VvNHFiZWRpVjJx?=
 =?utf-8?B?ZnpoNjJvVTVZVlZrK1JKRHJVRFJkV0pyN0xQQXllQ2h4cWlvV0lmTmtrNWNW?=
 =?utf-8?B?VmVDSnhtQ1RGczYvWUtoQUlaMXQrWHJFYjNubE5VZVpUdEovZ2tzUEUwVHdF?=
 =?utf-8?B?MnlwdGcvdUF3c2dpVE1nTFdkMXBPeWxZZE1veDNUNE16UForNGlFOUhoY0Nz?=
 =?utf-8?B?RUNKc2JEbDdxcGVPeUU0M25IblNweU03N1EwdFFsN21qMGNIUEdBZUIwSnd3?=
 =?utf-8?B?dE5iTXBkWFM5a0duWFdEYS8wRHRzTkxLYzFZT043QThSY25vTEZEbTBHQVFI?=
 =?utf-8?B?bzJVNVNEbXRwdHA2Z0JTWTA5TXc2cnFIT01lMU43M2o3dThra2JuN3ZZbC9I?=
 =?utf-8?B?OTY0MDczYUZ1aVpxRy83TXZ1dElBMjVxb3N3SDRPRzJlM1U5VDhEajJjSk0y?=
 =?utf-8?B?RnVYQWlwekhPQWk1eStzZmpYM29yUVBPUjYvMFl4cUhvNHIvQ2dqZzJmdXov?=
 =?utf-8?B?SVJvY01uUDhycFdJR2dZQy9yMmlOZWdrWGMxS0J6OUxyUzFubWFoMWJJdkV6?=
 =?utf-8?B?NlBYTjFJYnJVb3lKMkVyU2N1cXNRWFRMTE1rQjhZVWI2K3R0TnB5bW8yWmZS?=
 =?utf-8?Q?f0ZeBU82i9ifuGf6RS2jBp111?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4f3ec2-80c7-4a49-0ba5-08dd80c01f09
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:34:40.2407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZm1mkSBApw5xxMRth2ntStETtbqaR1pbhmI8QJxR+mM03a0uM07eB7/2Y41lOTX5HerLOI2k2Dd/U2OdbfZ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6905

Hi Hans and Gregory,


On 4/19/2025 2:29 PM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Gregory,
>
> On 19-Apr-25 1:01 AM, Gregory Price wrote:
>> On Mon, Oct 21, 2024 at 11:14:25AM +0000, Suma Hegde wrote:
>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> ... snip ...
>>> +#define DRIVER_NAME         "amd_hsmp"
>> ... snip ...
>>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>>> +#define DRIVER_NAME         "amd_hsmp"
>> Hi,
>>
>>  From looking around this patch, the code seems to suggest that these
>> drivers should not be mutually exclusive, but we are seeing an error
>> when attempting to load them both - apparently because they both use the
>> same driver name.
>>
>> Was this intended, or should the DRIVER_NAME="hsmp_acpi" for acpi.c?
> These drivers are mutually exclusive in the sense that only one of
> them should actually bind to the hw.
>
> Looking at the code this seems not to be guaranteed though ...

These drivers are supposed to be mutually exclusive drivers.

We don't expect them to co-exist, Thats the reason we used the same name 
for the driver, same name for character device and device file.

amd_hsmp is only for legacy platforms. All the new platforms will be 
having ACPI device.

>
> drivers/platform/x86/amd/hsmp/plat.c has:
>
> static int __init hsmp_plt_init(void)
> {
>          int ret = -ENODEV;
>
>          if (!legacy_hsmp_support()) {
>                  pr_info("HSMP is not supported on Family:%x model:%x\n",
>                          boot_cpu_data.x86, boot_cpu_data.x86_model);
>                  return ret;
>          }
>
>          ...
>
> So loading that module should fail on AMD CPUs which fail the
> legacy_hsmp_support() check. Which checks CPU family and model.
>
> Since you are seeing the error you are reporting the system you
> are testing on does pass that test.
>
> Question, did you manually load hsmp_acpi, or did that auto-load?
>
> Or a totally different way to ask the same thing, do you have
> any AMDI0097:0? devices under /sys/bus/platform/devices ?
>
> ATM it seems that the plat.c code assumes that on hw where
> legacy_hsmp_support() returns true there will never be an
> AMDI0097:0? device which I'm not sure is a safe assumption
> to make.
>
> IMHO besides the "if (!legacy_hsmp_support())" check,
> hsmp_plt_init() should also do:
>
>          if (acpi_dev_present("AMDI0097", NULL, -1))
>                  return -ENODEV;
>
> leaving the HSMP handling up to the hsmp_acpi driver
> when an AMDI0097:0? device is present.
>
> Note that the identical driver-name is still an issue even
> with this check, because if both checks pass a user could
> still manually load hsmp_acpi and get the driver name conflict
> error.

To fix the "Driver 'amd_hsmp' is already registered, aborting..." error 
when both are loaded, the driver name has to be changed, but while 
changing the driver name

adding the below lines which is suggested above by Hans is important.

if (acpi_dev_present("AMDI0097", NULL, -1))
                 return -ENODEV;

Otherwise on Family 0x1A Model 0x0-0xF platform where both are supported (this is the transitional platform where both are supported)

it will register the driver and complain for creating duplicate entries 
of character device if user tries to load both.

We will add this check and send out the updated patch.

> Another issue with the driver seems to be that hsmp_acpi_probe()
> relies on hsmp_pdev->is_probed to only do some initialization
> once, but that is_probed flag is not protected by a mutex,
> so when async probing is used 2 hsmp_acpi_probe() calls can
> race and make a mess of things.

For the asynchronous probing, we will guard hsmp_pdev->is_probed code with mutex.

> Regards,
>
> Hans
>

Thanks and Regards,
Suma

>
>
>> ---
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index e981d45e1c12..871724995897 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -26,7 +26,7 @@
>>
>>   #include "hsmp.h"
>>
>> -#define DRIVER_NAME            "amd_hsmp"
>> +#define DRIVER_NAME            "hsmp_acpi"
>>   #define DRIVER_VERSION         "2.3"
>>   #define ACPI_HSMP_DEVICE_HID   "AMDI0097"
>>
