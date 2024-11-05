Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A423D9E
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 05:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730783353; cv=fail; b=LrCvVxXtaFHjHnIEbSChFa4SRc1Jdw6aGrLisSBP0ik38bCMTrAYz9aVaxk23BgcCuxl3kXONp/HFdICsvujL+ETVG6CF8Rv28wRu3gUfVAUASQd7X1v0z8Y+hpgAiCS9EmCUTLtJ1dGDJ55E5kt2CUw1i49WJRzypfmgVXX7rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730783353; c=relaxed/simple;
	bh=4z2OQUqVFYtqSOTWOkkn9FQK17k0URiYJR2gy+u35dk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pA5KwTBn1EAJmN+iMWQhoi1LKORPAuyP3YFrs4CapFY9yv2vJNZx1JY1BaJ+is1l8PzVW+fo2JwzkjP+dNIA45qDlIaA+VakLzsi+kGOC3CchGSiziH1L8ezHNZFZIe0ymidj4orjQkE3wXyKmaOSM3R3lTkqLG98RYY5a3vPhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Eap/1mEz; arc=fail smtp.client-ip=40.107.94.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Eap/1mEz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrBxUdp5le6/igZC7OE0IuI1SmwiA6JGyF48M94qF1ImAWwcdXPcrO/Ld0vXrWed0/2LcTdjweiA77kNMzhuEnA9Pq/vUcaMMUu/RfEA1XJRJvFem5e6SynRyHyxp99F2HoHlYVQms3LOpO8zUscXWgvSFQkLZx77NQcVD1tyEsEDJNrcEUh00L2L1jEy5kGA+Wo75lWf1aoYfwmxZsvdDWHPL7vp9RwK/rp1weAHwP14+VfA/MgBGflmujlplgYL901FYio6+UZg0YuRbcv4uO3ylHpfgpNH2U0LRC/GkxDCwq8oa/uwnWyAp7Zd2nM4v5+OXlBlZAdLN54Q0RtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PjtlXRyO0j5xo1yD4xX+dSF1ts2rxOwmdA4rax1epA=;
 b=vXAElN5vngmSj7O+YR2uSLjyYBFwfiLmBa2TLO2swGp73zP1gtG1h/6QiMlBDLa0GcVOUn4UR2T+6dSQnfSuRstT9Wg/AhTqVr6PnqkmOrHc6CWShdZTGSK4IHTxyNQnM0R4PNKWG+1qkhbo8AUBZQSXEacMjPNSD2G2djus5LLNIAYRip1eB1o0/YhXV6Lywhoj2ch848VdFi+uy95ecTEB8MpCF7bxnoLiwgHVMxvQxNW3XQMHpL91PAA4J8N+Gc0rWEWRS+1TVqgQQtARYD5WCxszWpSAF4J+Fw9Ek1ptysBfcXU9oFvGx0ETanr5TFT4X75avkM4lo5t348fbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PjtlXRyO0j5xo1yD4xX+dSF1ts2rxOwmdA4rax1epA=;
 b=Eap/1mEzYtAJg7S4nBfdpMf13aq2Uk58VGEeSD1/FIoaPc/VoxpBIb254qJRebK9424OcWqXmkijcys7dNx9RlLSbpFnBOyDItIoTE2hnVqcOTTiV0jrSR+bhvVG0h7KA/anoyo4S6kN1L2EgdZszHBmy7Z2PELVzGXvO7LHrhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 05:09:06 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 05:09:06 +0000
Message-ID: <f6eabcca-4a92-470b-bac8-309b011fe9a1@amd.com>
Date: Tue, 5 Nov 2024 10:38:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] platform/x86/amd/pmc: Move STB functionality to a
 new file for better code organization
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
 <20241029155440.3499273-2-Shyam-sundar.S-k@amd.com>
 <3d8d3ad8-4cbd-8115-1c9f-9e1b625775b0@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <3d8d3ad8-4cbd-8115-1c9f-9e1b625775b0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0239.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a76cd4-343f-4c69-015b-08dcfd57f90d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0NKSS83L202SW85M0FhSjNEc1VEaG90S3Y4R2lBMlYzcTJyVk9vSjRjTjgz?=
 =?utf-8?B?NjB3QXBZYUwzQmZibHlETEl5OHVrZDhSRU5WY3FSZ1BCOVlxa3d2TjlGdlRp?=
 =?utf-8?B?bjlHK2pXd0srZEZTZHBCbTBVdTdhWkxaTVdnanZrL2hkZGtpSTduZjhrWmp1?=
 =?utf-8?B?SmpOQzI2eU5mdlBCcUwrRDE1eUV2cUNneVJBeFRXZFN2bkkzVzcwaUI1dEwx?=
 =?utf-8?B?ZFB4Sy9jRkdVSjJQdVZSMDkwWk9ibmtiaEsvaVZaRmxuM3RMWC9xWng0S1Iw?=
 =?utf-8?B?YlBhbjlMSHUvc0cyazNnTFduYVZneTFRUGNjSnY2a05wY2FTSkVLNWI1VjVJ?=
 =?utf-8?B?MUwycXdDb2ljcGpqUWRzVHViWWJBcnZhRnpQSmhoNlQ1cFc0ZkxveTR6MWx0?=
 =?utf-8?B?RmVoTHhpWkNHMmllKzNnUkNrdGxCVk42MFlLN2N4S2N5NXl6S2NTTjFjZGV1?=
 =?utf-8?B?cGxML1p1ak1vME8yMlpnaWo0YzE1cWZqazhUTzc5RnloM3g4TGZyZkErVWgv?=
 =?utf-8?B?andhc0ZZR3JCa0hTRjdSRE5NQ3NGWS9sRUlUM1BRd1k3VFQycWJ5SjZEdEtZ?=
 =?utf-8?B?V09pM1luRis1ckliMUFjOEpaNEFlcW5vSjZjY1lKMWpYY2d1enhjTmNMYmNM?=
 =?utf-8?B?N3VRZGdSR2hGandzVEtQSzJVR0l4Mm5qMUVseWVoakdEWUo2b3htQjNtT1pp?=
 =?utf-8?B?elZUdGkxZDl1ZUpjaFQyOTd5YStUdVBmWWJYeGJZSVFXWW9IeC9pWDFWUHdY?=
 =?utf-8?B?dDBFREcyRExxeDIxY05kYk1UT1dXYjZlUHRrb0tHNW5LQUc1ZXJoTnkxVGth?=
 =?utf-8?B?WXBJbEdiWmEvVjUwbzFJL1RrTkpMVGpNV3dOblExODVlc08wbmpNK09tUHdM?=
 =?utf-8?B?WlJwY2xucnBzMzEyU0NGRTBLMENINHUwVXp1N2tDU21xWVVSS0NtSlI4c1A0?=
 =?utf-8?B?L3o5SFowaUU5a0JtVXF4NGp5akY3NXJERVU2YmtVeEhQK0NMT244SU94cFYw?=
 =?utf-8?B?TDJiQ1BkbnZiaEh6bitUOFNPRlJoeUs4dk5PWkpqUzN4dlFKb0VsS0VrYnFH?=
 =?utf-8?B?UW1GaThNcTNQOE1FSVJZRXdOcFFLdWR3QXFZcE1FdmhkaVFaSitvOHB1eDJ0?=
 =?utf-8?B?clBnOW9Va0xGZmJFZzloT2E0QXFlQjdsaEZ2aUtjOHpybWl5ZllwNGg0NHZz?=
 =?utf-8?B?NXdoYVFwYjVtbzJJVndHR2R1clBZVlk1ME5obzhKbVNQZWNtVkhTMW1FMHlu?=
 =?utf-8?B?TUxDVGZqTXBQT1hmbElaREt0ZnRhMGtKbjdIbnBRMTdXbjZCVDNhSzV0K0lW?=
 =?utf-8?B?elozK0NEamlvOFpienhsTmI3cDJNelY4WnpibEpHSjBzalg4eDJuUndLSmh1?=
 =?utf-8?B?bG9lS2xTazc1aXZXU25FKzRNWjYzY3pwS0xibU16VjNzRDFqT2Q3cnFsU0Iv?=
 =?utf-8?B?UUJUcXZndGxVOXVlRG1vKzZtaDJBblExak5vZkRncE56S1lITHg0T2hjeXhU?=
 =?utf-8?B?a1dnWFRPYmU3YkRYV2JPU0xJL0U2Sys2QlVQajU0UG9uU2pkTzhlRHJZMDFx?=
 =?utf-8?B?N0RGMlJ2ejg3ZnlzUlpSc3dCVlRidThaWklPYzl6bVRpcDNNMFlqdHNIalJS?=
 =?utf-8?B?MisxZllJVS9ZdHJoVndGRTlHMWlTc1dpMDh3a2krTGl0OWZLNXFURm1WdGl3?=
 =?utf-8?B?NnRmaWNhY09PRURVcnJGdkZoM1FMazN4TjhYU1A5KzlNNjRBL2xyYW9Va2NV?=
 =?utf-8?Q?bKTvLNfhJ/PFih5oALtD91JQ9Z3kozLcLNmdR7J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VMYXhSK0ZxYVZvTmRzbFkxTUlVRmRWOHNpYW9wVnhQMzByMlVpaWt4WWFp?=
 =?utf-8?B?R2xWMWpXRUpGK0RkRGtaUjNMaEVJYTZtVGpVV1hSUU5wN0FwaUduaE53OFZx?=
 =?utf-8?B?ZlE2QkVnY0wvd1hhbUlHSTRYbS9wUzR0Z3ZDNG91QVV2QTA2Z1gzbCtsaERZ?=
 =?utf-8?B?aUlQN0JINGNmYmRUVWFtT013bWRkemM1S0VTQkpUZVZSWmN6bVozMGN4NlQx?=
 =?utf-8?B?azlVVWpzWk5hZm44ZkhLaUJWcU1GQ1Z2RzgwUzJvQ2N3ZmEySlorRDBsK2xj?=
 =?utf-8?B?MFlrS3FINXcxeWxOY3pTUitybk85b2kyOU1ONytBcWpXTWFJYjFRVitSWnAx?=
 =?utf-8?B?bzVMVmN5Y0RSdXhVOWdaNWpaYWI2L3lMYUg4U1ZYbVF3Q0l5RkgrRXlYd1Z4?=
 =?utf-8?B?cFhqVmR5TjlyTGxaRU1COWZzdXFmTE5TQkdmcEs2bzhvdkhrQlZlME93NVVt?=
 =?utf-8?B?NW0ySGZZT3g1ZE1RbGx6NE45YUtpRVVUNVdxVytWVTV1ZXB5dXlDeCtrVERm?=
 =?utf-8?B?TWgrR2RvWGZ4azM3Rkh5N3hFZzhBaWtNb0lMWUdObzVLb2ZnTDhDNDRlLzNp?=
 =?utf-8?B?d1N3NzUrUWN2MkM2SHNmcHdrZlluVzd5Rjh2cklyY1NIbUxpMzd1c1ptVFMy?=
 =?utf-8?B?aXV5SVBRcjBKSERqUWtNdERRR3kvcXpWWVR1ZzdjekZDY1hLajUvVFkvUDhH?=
 =?utf-8?B?dzNGNWlQSTljeWtKdHdSSUtRcUxkOVBESzcwNjdnN0dKOXQ3cVp6UUs0MThH?=
 =?utf-8?B?eEhzam5xajVpNUtEd1NsTWZMSmhMSSsxNWx3dWpJcUNLenIxYlN5ck1LV3d4?=
 =?utf-8?B?TTF4K3Q3NFhTck1oWGZMNHdDN3JOSWJwQ25wcDllaFd2VGJhbTV4OFRxM1FX?=
 =?utf-8?B?NHNqbGJPOVpEczNiM0M0d3BiMzErbGlvVkdpNy9VZDgvNlNEUkF1b2JKV3NM?=
 =?utf-8?B?ZmJFelNoTE9WbVRHcXV4ODdtL092WlVJOGREZmY4dyt2amZHSDhvV1hxTXlH?=
 =?utf-8?B?SFJrNHhWWlhQVE5pRDJmYmpmTzBKSTUwUVlZOXV1WFo3amRLVUdpTGxaTDNI?=
 =?utf-8?B?Qlhqc3YrYWg1MWVlZWplZkxpbEZ6SmhOUXBVYytISlN3Ry9zL1N5QXN1Tlli?=
 =?utf-8?B?ajZpNTNaK1FNUUJSc1IwcDhtakk2SDd2bWYzSFgxbWFMYk5nYnhJL05IUjZS?=
 =?utf-8?B?c0hXY3RmZk9nVFowcU53MGxVRUpDUkNybm93aFFCVEdtSzhibkRUKzZmaHJM?=
 =?utf-8?B?MGNGckJkVFgwdE1uZ1Z0bjQ3MXBYaGt0MGNzd2pqRjlGblFvQnB3SVBNYjJE?=
 =?utf-8?B?dmNhUGhnay9sM0pycDF4MmhGUDdiU0ZZb2x6SStaUjhWMzJmZklZeFJkbzRK?=
 =?utf-8?B?WnM4T0RrUFgyVE12UjRLS3g4Y1dnZWZuV0w5MzVPc3pDaXU0UDVRSVdsNGdk?=
 =?utf-8?B?OFlyN1RvOE0vU0VFL0JXYy9VOTZaaDRCeGpOaVBCcG9IdlUyQVBTWEJ6Nkhq?=
 =?utf-8?B?dFZNdG55Q0JNblRmNGtZa0FIeGFWaWFqNm1PQ05uTTdHQmpjeXM5VUI5SWpD?=
 =?utf-8?B?bWFEOUw1RFpJUGZHR3JPMm1WUGs0dk1ITzJadjFBcGZKcXBRRnlpdGJ2NWMr?=
 =?utf-8?B?VGdLK2hYRnQ5emtOMnBlYklUNUNJT2tyTlZldVZhRVg0dlowbmFlOWQzT1Jn?=
 =?utf-8?B?Tm56dXhaaGFHQWVTSStIY3pqMnNDRmFSSVBUQWJhd3ZsL0hrZjhSVUJhRGpS?=
 =?utf-8?B?WDBOSGgveGVLQzNvZ3hRck9iMVpJK1ZnS1ZWYm84bTRZSVF0MkpQU3h4S3RM?=
 =?utf-8?B?RVdmMzQySDduYWUyUXdZTnJReGZXNWpaL0JtVzg5QkpxMEl5VW5tNFJieWll?=
 =?utf-8?B?Qml4K0RXVlNLMlJZZzdBZGF3MWE1K0dBcERyc2RzQ0IrYys4bzhiUWxPcVRq?=
 =?utf-8?B?ZjJDU2ZHOVlHSXR0VENzYS9XYlVYdlNab2ZCeEFHQkIvQUJQTFdaOGFERjJJ?=
 =?utf-8?B?WVhJS2kwWG82QUJqV0ZFMnVUc2g0YlcySmRRQlgwSWZjMkRxc3h4c05Edmx6?=
 =?utf-8?B?aXdWTWxuWkpQdHR6TkFpa2YzU1FITkt3ZnlkcEdVSWpaQUdic2lpS1ZYbGlk?=
 =?utf-8?Q?eZtKrMtfcRwwDCHsao482MONO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a76cd4-343f-4c69-015b-08dcfd57f90d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 05:09:06.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22sckBiK+bH/qklH17+1mMyh1urMEFo7UY1gr+S1UioUXeeRw/xWzDf1gUzx6XstU0mco7D/qkVdtYsqsjqMdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437



On 11/1/2024 15:45, Ilpo Järvinen wrote:
> On Tue, 29 Oct 2024, Shyam Sundar S K wrote:
> 
>> As the SoC evolves with each generation, the dynamics between the PMC and
>> STB layers within the PMC driver are becoming increasingly complex, making
>> it challenging to manage both in a single file and maintain code
>> readability.
>>
>> Additionally, during silicon bringup, the PMC functionality is often
>> enabled first, with STB functionality added later. This can lead to missed
>> updates in the driver, potentially causing issues.
>>
>> To address these challenges, it's beneficial to move all STB-related
>> changes to a separate file. This approach will better accommodate newer
>> SoCs, provide improved flexibility for desktop variants, and facilitate
>> the collection of additional debug information through STB mechanisms.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/Makefile  |   2 +-
>>  drivers/platform/x86/amd/pmc/mp1_stb.c | 295 +++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmc/pmc.c     | 289 +-----------------------
>>  drivers/platform/x86/amd/pmc/pmc.h     |   9 +
>>  4 files changed, 310 insertions(+), 285 deletions(-)
>>  create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c
>>
>> diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
>> index f1d9ab19d24c..255d94ddf999 100644
>> --- a/drivers/platform/x86/amd/pmc/Makefile
>> +++ b/drivers/platform/x86/amd/pmc/Makefile
>> @@ -4,6 +4,6 @@
>>  # AMD Power Management Controller Driver
>>  #
>>  
>> -amd-pmc-objs := pmc.o pmc-quirks.o
>> +amd-pmc-objs := pmc.o pmc-quirks.o mp1_stb.o
>>  obj-$(CONFIG_AMD_PMC) += amd-pmc.o
>>  amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
>> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
>> new file mode 100644
>> index 000000000000..9a34dd94982c
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
>> @@ -0,0 +1,295 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD MP1 Smart Trace Buffer (STB) Layer
>> + *
>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + *          Sanket Goswami <Sanket.Goswami@amd.com>
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <asm/amd_nb.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include "pmc.h"
>> +
>> +/* STB Spill to DRAM Parameters */
>> +#define S2D_TELEMETRY_BYTES_MAX		0x100000U
>> +#define S2D_RSVD_RAM_SPACE		0x100000
>> +#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>> +
>> +/* STB Registers */
>> +#define AMD_PMC_STB_PMI_0	0x03E30600
> 
> Is this still needed in pmc.c? I think all users moved to this file.
> 
>> +#define AMD_PMC_STB_DUMMY_PC	0xC6000007
>> +
>> +/* STB Spill to DRAM Message Definition */
>> +#define STB_FORCE_FLUSH_DATA	0xCF
>> +#define FIFO_SIZE		4096
>> +
>> +static bool enable_stb;
>> +module_param(enable_stb, bool, 0644);
>> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>> +
>> +static bool dump_custom_stb;
>> +module_param(dump_custom_stb, bool, 0644);
>> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
>> +
>> +enum s2d_arg {
>> +	S2D_TELEMETRY_SIZE = 0x01,
>> +	S2D_PHYS_ADDR_LOW,
>> +	S2D_PHYS_ADDR_HIGH,
>> +	S2D_NUM_SAMPLES,
>> +	S2D_DRAM_SIZE,
>> +};
>> +
>> +struct amd_pmc_stb_v2_data {
>> +	size_t size;
>> +	u8 data[] __counted_by(size);
>> +};
>> +
>> +int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>> +{
>> +	int err;
>> +
>> +	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
>> +	if (err) {
>> +		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
>> +		return pcibios_err_to_errno(err);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>> +{
>> +	int i, err;
>> +
>> +	for (i = 0; i < FIFO_SIZE; i++) {
>> +		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
>> +		if (err) {
>> +			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
>> +				AMD_PMC_STB_PMI_0);
>> +			return pcibios_err_to_errno(err);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>> +{
>> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> +	u32 size = FIFO_SIZE * sizeof(u32);
>> +	u32 *buf;
>> +	int rc;
>> +
>> +	buf = kzalloc(size, GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	rc = amd_pmc_read_stb(dev, buf);
>> +	if (rc) {
>> +		kfree(buf);
>> +		return rc;
>> +	}
>> +
>> +	filp->private_data = buf;
>> +	return rc;
>> +}
>> +
>> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
>> +					loff_t *pos)
>> +{
>> +	if (!filp->private_data)
>> +		return -EINVAL;
>> +
>> +	return simple_read_from_buffer(buf, size, pos, filp->private_data,
>> +				       FIFO_SIZE * sizeof(u32));
>> +}
>> +
>> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
>> +{
>> +	kfree(filp->private_data);
>> +	return 0;
>> +}
>> +
>> +static const struct file_operations amd_pmc_stb_debugfs_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = amd_pmc_stb_debugfs_open,
>> +	.read = amd_pmc_stb_debugfs_read,
>> +	.release = amd_pmc_stb_debugfs_release,
>> +};
>> +
>> +/* Enhanced STB Firmware Reporting Mechanism */
>> +static int amd_pmc_stb_handle_efr(struct file *filp)
>> +{
>> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> +	struct amd_pmc_stb_v2_data *stb_data_arr;
>> +	u32 fsize;
>> +
>> +	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
>> +	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
>> +	if (!stb_data_arr)
>> +		return -ENOMEM;
>> +
>> +	stb_data_arr->size = fsize;
>> +	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
>> +	filp->private_data = stb_data_arr;
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>> +{
>> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
>> +	struct amd_pmc_stb_v2_data *stb_data_arr;
>> +	int ret;
>> +
>> +	/* Write dummy postcode while reading the STB buffer */
>> +	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
>> +	if (ret)
>> +		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>> +
>> +	/* Spill to DRAM num_samples uses separate SMU message port */
>> +	dev->msg_port = 1;
>> +
>> +	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>> +	if (ret)
>> +		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
>> +
>> +	/*
>> +	 * We have a custom stb size and the PMFW is supposed to give
>> +	 * the enhanced dram size. Note that we land here only for the
>> +	 * platforms that support enhanced dram size reporting.
>> +	 */
>> +	if (dump_custom_stb)
>> +		return amd_pmc_stb_handle_efr(filp);
>> +
>> +	/* Get the num_samples to calculate the last push location */
>> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>> +	/* Clear msg_port for other SMU operation */
>> +	dev->msg_port = 0;
>> +	if (ret) {
>> +		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
>> +	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
>> +	if (!stb_data_arr)
>> +		return -ENOMEM;
>> +
>> +	stb_data_arr->size = fsize;
>> +
>> +	/*
>> +	 * Start capturing data from the last push location.
>> +	 * This is for general cases, where the stb limits
>> +	 * are meant for standard usage.
>> +	 */
>> +	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>> +		/* First read oldest data starting 1 behind last write till end of ringbuffer */
>> +		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
>> +		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
>> +
>> +		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> +		/* Second copy the newer samples from offset 0 - last write */
>> +		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
>> +	} else {
>> +		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
>> +	}
>> +
>> +	filp->private_data = stb_data_arr;
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>> +					   loff_t *pos)
>> +{
>> +	struct amd_pmc_stb_v2_data *data = filp->private_data;
>> +
>> +	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
>> +}
>> +
>> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
>> +{
>> +	kfree(filp->private_data);
>> +	return 0;
>> +}
>> +
>> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>> +	.owner = THIS_MODULE,
>> +	.open = amd_pmc_stb_debugfs_open_v2,
>> +	.read = amd_pmc_stb_debugfs_read_v2,
>> +	.release = amd_pmc_stb_debugfs_release_v2,
>> +};
>> +
>> +static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
>> +{
>> +	switch (dev->cpu_id) {
>> +	case AMD_CPU_ID_YC:
>> +	case AMD_CPU_ID_CB:
>> +		dev->s2d_msg_id = 0xBE;
>> +		return true;
>> +	case AMD_CPU_ID_PS:
>> +		dev->s2d_msg_id = 0x85;
>> +		return true;
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +		dev->s2d_msg_id = 0xDE;
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>> +{
>> +	u32 phys_addr_low, phys_addr_hi;
>> +	u64 stb_phys_addr;
>> +	u32 size = 0;
>> +	int ret;
>> +
>> +	if (!enable_stb)
>> +		return 0;
>> +
>> +	if (amd_pmc_is_stb_supported(dev))
>> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> +				    &amd_pmc_stb_debugfs_fops_v2);
>> +	else
>> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> +				    &amd_pmc_stb_debugfs_fops);
>> +
>> +	/* Spill to DRAM feature uses separate SMU message port */
>> +	dev->msg_port = 1;
>> +
>> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>> +	if (size != S2D_TELEMETRY_BYTES_MAX)
>> +		return -EIO;
>> +
>> +	/* Get DRAM size */
>> +	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
>> +	if (ret || !dev->dram_size)
>> +		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
>> +
>> +	/* Get STB DRAM address */
>> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
>> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
>> +
>> +	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>> +
>> +	/* Clear msg_port for other SMU operation */
>> +	dev->msg_port = 0;
>> +
>> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>> +	if (!dev->stb_virt_addr)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index bbb8edb62e00..a977ff1e52b5 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -44,20 +44,6 @@
>>  #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
>>  #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
>>  #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
>> -#define AMD_PMC_STB_DUMMY_PC		0xC6000007
>> -
>> -/* STB S2D(Spill to DRAM) has different message port offset */
>> -#define AMD_S2D_REGISTER_MESSAGE	0xA20
>> -#define AMD_S2D_REGISTER_RESPONSE	0xA80
>> -#define AMD_S2D_REGISTER_ARGUMENT	0xA88
>> -
>> -/* STB Spill to DRAM Parameters */
>> -#define S2D_TELEMETRY_BYTES_MAX		0x100000U
>> -#define S2D_RSVD_RAM_SPACE		0x100000
>> -#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>> -
>> -/* STB Spill to DRAM Message Definition */
>> -#define STB_FORCE_FLUSH_DATA		0xCF
>>  
>>  /* Base address of SMU for mapping physical address to virtual address */
>>  #define AMD_PMC_MAPPING_SIZE		0x01000
>> @@ -97,7 +83,6 @@
>>  
>>  #define DELAY_MIN_US		2000
>>  #define DELAY_MAX_US		3000
>> -#define FIFO_SIZE		4096
>>  
>>  enum amd_pmc_def {
>>  	MSG_TEST = 0x01,
>> @@ -105,19 +90,6 @@ enum amd_pmc_def {
>>  	MSG_OS_HINT_RN,
>>  };
>>  
>> -enum s2d_arg {
>> -	S2D_TELEMETRY_SIZE = 0x01,
>> -	S2D_PHYS_ADDR_LOW,
>> -	S2D_PHYS_ADDR_HIGH,
>> -	S2D_NUM_SAMPLES,
>> -	S2D_DRAM_SIZE,
>> -};
>> -
>> -struct amd_pmc_stb_v2_data {
>> -	size_t size;
>> -	u8 data[] __counted_by(size);
>> -};
>> -
>>  struct amd_pmc_bit_map {
>>  	const char *name;
>>  	u32 bit_mask;
>> @@ -149,22 +121,11 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>>  	{}
>>  };
>>  
>> -static bool enable_stb;
>> -module_param(enable_stb, bool, 0644);
>> -MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>> -
>>  static bool disable_workarounds;
>>  module_param(disable_workarounds, bool, 0644);
>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>>  
>> -static bool dump_custom_stb;
>> -module_param(dump_custom_stb, bool, 0644);
>> -MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
>> -
>>  static struct amd_pmc_dev pmc;
>> -static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>> -static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>> -static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>>  
>>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>>  {
>> @@ -193,155 +154,6 @@ struct smu_metrics {
>>  	u64 timecondition_notmet_totaltime[32];
>>  } __packed;
>>  
>> -static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>> -{
>> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -	u32 size = FIFO_SIZE * sizeof(u32);
>> -	u32 *buf;
>> -	int rc;
>> -
>> -	buf = kzalloc(size, GFP_KERNEL);
>> -	if (!buf)
>> -		return -ENOMEM;
>> -
>> -	rc = amd_pmc_read_stb(dev, buf);
>> -	if (rc) {
>> -		kfree(buf);
>> -		return rc;
>> -	}
>> -
>> -	filp->private_data = buf;
>> -	return rc;
>> -}
>> -
>> -static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
>> -					loff_t *pos)
>> -{
>> -	if (!filp->private_data)
>> -		return -EINVAL;
>> -
>> -	return simple_read_from_buffer(buf, size, pos, filp->private_data,
>> -				       FIFO_SIZE * sizeof(u32));
>> -}
>> -
>> -static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
>> -{
>> -	kfree(filp->private_data);
>> -	return 0;
>> -}
>> -
>> -static const struct file_operations amd_pmc_stb_debugfs_fops = {
>> -	.owner = THIS_MODULE,
>> -	.open = amd_pmc_stb_debugfs_open,
>> -	.read = amd_pmc_stb_debugfs_read,
>> -	.release = amd_pmc_stb_debugfs_release,
>> -};
>> -
>> -/* Enhanced STB Firmware Reporting Mechanism */
>> -static int amd_pmc_stb_handle_efr(struct file *filp)
>> -{
>> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -	struct amd_pmc_stb_v2_data *stb_data_arr;
>> -	u32 fsize;
>> -
>> -	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
>> -	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
>> -	if (!stb_data_arr)
>> -		return -ENOMEM;
>> -
>> -	stb_data_arr->size = fsize;
>> -	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
>> -	filp->private_data = stb_data_arr;
>> -
>> -	return 0;
>> -}
>> -
>> -static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>> -{
>> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
>> -	struct amd_pmc_stb_v2_data *stb_data_arr;
>> -	int ret;
>> -
>> -	/* Write dummy postcode while reading the STB buffer */
>> -	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
>> -	if (ret)
>> -		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>> -
>> -	/* Spill to DRAM num_samples uses separate SMU message port */
>> -	dev->msg_port = 1;
>> -
>> -	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>> -	if (ret)
>> -		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
>> -
>> -	/*
>> -	 * We have a custom stb size and the PMFW is supposed to give
>> -	 * the enhanced dram size. Note that we land here only for the
>> -	 * platforms that support enhanced dram size reporting.
>> -	 */
>> -	if (dump_custom_stb)
>> -		return amd_pmc_stb_handle_efr(filp);
>> -
>> -	/* Get the num_samples to calculate the last push location */
>> -	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>> -	/* Clear msg_port for other SMU operation */
>> -	dev->msg_port = 0;
>> -	if (ret) {
>> -		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
>> -	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
>> -	if (!stb_data_arr)
>> -		return -ENOMEM;
>> -
>> -	stb_data_arr->size = fsize;
>> -
>> -	/*
>> -	 * Start capturing data from the last push location.
>> -	 * This is for general cases, where the stb limits
>> -	 * are meant for standard usage.
>> -	 */
>> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>> -		/* First read oldest data starting 1 behind last write till end of ringbuffer */
>> -		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
>> -		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
>> -
>> -		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> -		/* Second copy the newer samples from offset 0 - last write */
>> -		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
>> -	} else {
>> -		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
>> -	}
>> -
>> -	filp->private_data = stb_data_arr;
>> -
>> -	return 0;
>> -}
>> -
>> -static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>> -					   loff_t *pos)
>> -{
>> -	struct amd_pmc_stb_v2_data *data = filp->private_data;
>> -
>> -	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
>> -}
>> -
>> -static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
>> -{
>> -	kfree(filp->private_data);
>> -	return 0;
>> -}
>> -
>> -static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>> -	.owner = THIS_MODULE,
>> -	.open = amd_pmc_stb_debugfs_open_v2,
>> -	.read = amd_pmc_stb_debugfs_read_v2,
>> -	.release = amd_pmc_stb_debugfs_release_v2,
>> -};
>> -
>>  static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  {
>>  	switch (dev->cpu_id) {
>> @@ -350,18 +162,15 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  	case AMD_CPU_ID_YC:
>>  	case AMD_CPU_ID_CB:
>>  		dev->num_ips = 12;
>> -		dev->s2d_msg_id = 0xBE;
>>  		dev->smu_msg = 0x538;
>>  		break;
>>  	case AMD_CPU_ID_PS:
>>  		dev->num_ips = 21;
>> -		dev->s2d_msg_id = 0x85;
>>  		dev->smu_msg = 0x538;
>>  		break;
>>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>  		dev->num_ips = 22;
>> -		dev->s2d_msg_id = 0xDE;
>>  		dev->smu_msg = 0x938;
>>  		break;
>>  	}
>> @@ -625,20 +434,6 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>>  	debugfs_remove_recursive(dev->dbgfs_dir);
>>  }
>>  
>> -static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
>> -{
>> -	switch (dev->cpu_id) {
>> -	case AMD_CPU_ID_YC:
>> -	case AMD_CPU_ID_CB:
>> -	case AMD_CPU_ID_PS:
>> -	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> -	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> -		return true;
>> -	default:
>> -		return false;
>> -	}
>> -}
>> -
>>  static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>  {
>>  	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
>> @@ -648,15 +443,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>  			    &s0ix_stats_fops);
>>  	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>>  			    &amd_pmc_idlemask_fops);
>> -	/* Enable STB only when the module_param is set */
>> -	if (enable_stb) {
>> -		if (amd_pmc_is_stb_supported(dev))
>> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> -					    &amd_pmc_stb_debugfs_fops_v2);
>> -		else
>> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> -					    &amd_pmc_stb_debugfs_fops);
>> -	}
> 
> Is it related to the logic change I ask about down below? It looks 
> something that really ought to be done in a separate preparatory patch if 
> that's the case since it seems entire independent of moving things to 
> another file this patch is supposed to be all about.
> 

There are tight deps if I have make a prep patch out of it. However I
ended up making this into two, you can take a look at v2 (but before
that I have some follow-ups, which are in the respective patches).

>>  }
>>  
>>  static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>> @@ -683,7 +469,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>>  	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
>>  }
>>  
>> -static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
>> +int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
>>  {
>>  	int rc;
>>  	u32 val, message, argument, response;
>> @@ -975,69 +761,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>  	{ }
>>  };
>>  
>> -static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>> -{
>> -	u32 phys_addr_low, phys_addr_hi;
>> -	u64 stb_phys_addr;
>> -	u32 size = 0;
>> -	int ret;
>> -
>> -	/* Spill to DRAM feature uses separate SMU message port */
>> -	dev->msg_port = 1;
>> -
>> -	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>> -	if (size != S2D_TELEMETRY_BYTES_MAX)
>> -		return -EIO;
>> -
>> -	/* Get DRAM size */
>> -	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
>> -	if (ret || !dev->dram_size)
>> -		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
>> -
>> -	/* Get STB DRAM address */
>> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
>> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
>> -
>> -	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>> -
>> -	/* Clear msg_port for other SMU operation */
>> -	dev->msg_port = 0;
>> -
>> -	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>> -	if (!dev->stb_virt_addr)
>> -		return -ENOMEM;
>> -
>> -	return 0;
>> -}
>> -
>> -static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>> -{
>> -	int err;
>> -
>> -	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
>> -	if (err) {
>> -		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
>> -		return pcibios_err_to_errno(err);
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>> -{
>> -	int i, err;
>> -
>> -	for (i = 0; i < FIFO_SIZE; i++) {
>> -		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
>> -		if (err) {
>> -			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
>> -			return pcibios_err_to_errno(err);
>> -		}
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>  static int amd_pmc_probe(struct platform_device *pdev)
>>  {
>>  	struct amd_pmc_dev *dev = &pmc;
>> @@ -1095,12 +818,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  	/* Get num of IP blocks within the SoC */
>>  	amd_pmc_get_ip_info(dev);
>>  
>> -	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
>> -		err = amd_pmc_s2d_init(dev);
>> -		if (err)
>> -			goto err_pci_dev_put;
>> -	}
>> -
>>  	platform_set_drvdata(pdev, dev);
>>  	if (IS_ENABLED(CONFIG_SUSPEND)) {
>>  		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
>> @@ -1111,6 +828,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	amd_pmc_dbgfs_register(dev);
>> +	err = amd_pmc_s2d_init(dev);
>> +	if (err)
>> +		goto err_pci_dev_put;
> 
> Why isn't this logic change in a separate patch?
> 

makes sense. This movement of amd_pmc_s2d_init() after the debugfs
creation is required without that the debugfs root directories for the
driver would have not created.

Thanks,
Shyam

>> +
>>  	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>>  		amd_mp2_stb_init(dev);
>>  	pm_report_max_hw_sleep(U64_MAX);
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>> index f1166d15c856..07fcb13a4136 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -70,4 +70,13 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>  #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>>  #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
>>  
>> +/* STB S2D(Spill to DRAM) has different message port offset */
>> +#define AMD_S2D_REGISTER_MESSAGE	0xA20
>> +#define AMD_S2D_REGISTER_RESPONSE	0xA80
>> +#define AMD_S2D_REGISTER_ARGUMENT	0xA88
>> +
>> +int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
>> +int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>> +int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>> +
>>  #endif /* PMC_H */
>>
> 
