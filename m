Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE4241C94
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729604078; cv=fail; b=aISHkLFczxcwNBc4SBzq2BNC4QHpviHvvI1FFr8ItYauizSZNSYbhWauztiSZlCDuYm0kZ/8PQSSqKzfiunM+wEDxx5n/xMa4n4kwVPjB2EDFULyFZOl7XzEsRXw/E8FNON+7yTFXt2fxSTzHfRfXNYwX4bEbgG0dtZaoRb64Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729604078; c=relaxed/simple;
	bh=volG912ZTEAR1E9sSYJT89oNTAkabxDzFY7vpgTnMjc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T5ozmjdMZ5U/uRMmcNKnEcoN2rSlSOl/AEcGLZPT6ooki90c33kKuNBpNZdjsZDBMI/Sf8ETL0fQX52e6eF+SaUA7SqSpIyo4FlQUe3lm2Uum+viaQKmQWKkGIPnRw9yTShvL2w9ELbcxrME39PxCuOTMSNFvzY0x2eMend1mTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Go1OEao0; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Go1OEao0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ifh0e5hbezBCiWwVEj10HdhshC2NJRWyZghbosuf1vyEwowDbMbRFlejR6paEY3QEEohN2SexeWPrutF05nZZ7cqFZLJoswpXe4lTrJq5lwVcYiQUykC8ucKDqfx5V8nE6lVTHOJIYFobPbG+UYFCKbfTQHrw8FL8wfflc3b4CAefBJuQYhy2Oy2HmxGVbJ7iWsJKac6R6YUvZB30QKZ8Y3umGsfQqbqxeopSY/Xd9z1GPt31yEIpUnBGigMW58lB9OdY4rJhADSKnI+8jNV9RvW40pfBD/hNij+taNxYAWb5fConQkprSKVK8SwqJvJ34mS7QGebTe0XTK06oe0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX0i1E/0SgRs/qUwE14+RSTDjeQUsSrohhwjdOrjqd8=;
 b=C2fPoQqzSo+WaGyA22vAt9JUH2E/4kj6mM0n+MNjAzzzY/4/01equBzqhJ1vQjK2pocCNZkV/qTweOnR/lm+KMxgdxTwuszpJEBWDRYFQLbWZSe1qH1W/LkHyvxefEY1P1mz9D9daLMXG0uWAuBpA/U1eGxiREsQmTZeMeyuerKqNHTZ+bdtRwVDzt1j7JM8VXZxG45uJfv/2WegBsGyihIy63Uw5uezo2dFMLNdNl6GjmUqR7yZjQo63r+lpi7bERn2JqRdbAaDPaQZFGNPp0xsdylG8VE6a0JpDs7c2v4ouyKVGMQQ7a3KZc5JozIeCKlMkVgDO6DDgPEWxaDCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX0i1E/0SgRs/qUwE14+RSTDjeQUsSrohhwjdOrjqd8=;
 b=Go1OEao0UmMJRwSrISqFI20J734KvVhsSIG8JlvRgo4WvU1tGiepFozDQMxrS86ud4/4mcF94JmJO17oycy6d4h61o9uA1+JINCp1CpFlCLpnErVBq8jgmd2Ym3egQ8bvsp/1S+NkxOZlE6ccsZ9FseFlHsiwNDDHwAA1nuIVMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 13:34:25 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%6]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 13:34:25 +0000
Message-ID: <9b41fab3-ad85-b5ff-f985-894aec0a8cf2@amd.com>
Date: Tue, 22 Oct 2024 19:04:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org, perry.yuan@amd.com,
 Shyam-sundar.S-k@amd.com
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
 <20241021165820.339567-2-Basavaraj.Natikar@amd.com>
 <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de>
 <5dce0b9f-2b91-1cac-5150-899547cd042f@amd.com>
 <7be0b988-013d-4dd4-8a85-0a72cdb1b924@amd.com>
 <f60964d0-6c10-e353-b556-0461f0d6ce7c@linux.intel.com>
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <f60964d0-6c10-e353-b556-0461f0d6ce7c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::19) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c9e190-1776-4ac1-1d38-08dcf29e3ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUVZT2t6OXg3V0tmeEJtWFhxMHB3NXJBLzM4OXpEbGdNNk5CZHVaWXJObEla?=
 =?utf-8?B?MnRGUTlWV0J4V29uZnNqNXNpSE41QVJZMWRtMFJONzRXZkVKR0M0WVYvRTFZ?=
 =?utf-8?B?eUN4dHppRlk4YnFsb3Zrd3BsYnZtQUJIK0FSQVdvcjFSVFhuRW9ldGlXNVlS?=
 =?utf-8?B?NXNJZW9Nb3FjanhDSVhQcFN6TUZ3ck9OKy9aZVQwZk4xRERBTEszTlhiYTlK?=
 =?utf-8?B?LzlXOTFwSUVBTG15RXQvM0ZscXhQNjZ6U2piN21FODg2Z0dUM05KRW1QWWMr?=
 =?utf-8?B?aVFMSHpaeEVSUlo4amJMS0lzOXpRb2tuVXlYUmdaUDI0OFlJMHhPM3J4R0Fz?=
 =?utf-8?B?YklSaC9ab3hJYlpsMGJ2TG1QZFVGZXV1cGcwakozNXBDYVgzYlloUG5Ic2xu?=
 =?utf-8?B?THFoSFhzWW5RTFBpcXpLcGpiYlNScDVOZVlkc2l3REp0SzBiWG1KWE9xczIx?=
 =?utf-8?B?TWN6OUt2N09jNE9UcnlHdGR2M0QweVpHYVpncTA3NkZHNnhEVWR3U3F4dTUx?=
 =?utf-8?B?QzdxZlppWHluZjEzTTJQWmV1M1JiQVQzSm9uTzFoWTFSK3lYR1RkZHVkNFFa?=
 =?utf-8?B?V0VpZTFFR0ZmNUdTZEhpOEhOQ0RHRHIvQkQ1V3U4cFVXMTkzTmRweFRFVUhO?=
 =?utf-8?B?Tmt3K3M1WFdxRWY4QlB5T1l5RVkwUk9hcXhKNXVkRUdEYTJEUjI2SE9kVmU2?=
 =?utf-8?B?am56WXJGK3JiTlN4WGRqQzJ4THJOZ2Z2ZEdqQ2xCNWdkM1cxTGVvOGt6SHpu?=
 =?utf-8?B?MHk4YWhSNnpmb3ZPQ0ZMdkErRVZXcnFwaFJrYkJzQWlnbHJHWURhcmtpL29i?=
 =?utf-8?B?cm1HdXd0akVsODJxaFhRVkZkQWpEd1FVTmQvajl3UVJGdyt3cTlqVy9xYzZI?=
 =?utf-8?B?WkFMOFkxelE1T202ODRHUTBlRHR6Q01tUmFKM3dJTVhKZlF4U0VoZGNma1Qz?=
 =?utf-8?B?dC9lOG5LU0Y3cnlCVFVSODNqMENhK29vMzNjUTZsNUl3TVB0c2g5VUo4d3VP?=
 =?utf-8?B?L0swQUNPUVl2NWZSUjB1Rmg2Q2NZeEgxMzJCcDFkdU1paE9LMXp2Yy92Z0hF?=
 =?utf-8?B?by8wQUcrRzlFNWJzR2Y1YXJJYXJ6UzNWNlJxM0k4MG9YRnJubHhRL09FcXZs?=
 =?utf-8?B?TWRzdnpZaFErWHJ0TTlRc1lraU5YSTZWUy9xQmRydDExL3NzM0twNmZqTjd3?=
 =?utf-8?B?ZGNHSXBsbmdvcExpQzNGb1hQWENINWFNaFZjSGFLWU9oSSthL0ovdW43VElw?=
 =?utf-8?B?S2dkZnBCd3ZSY1YzdmpRWTZ1V2lNbFJZTjRBeXY3OU9KSWdDVUw2K3BkbXZj?=
 =?utf-8?B?QkRPMU1aTEdybU4xMmdaTlBobGk3eWQxNEJwSU9VekNyRDl5UnFpcWMzMUxZ?=
 =?utf-8?B?TFZmbDl4RExHblhMUVd5bnBHdHRSN3ZhbXI4ZFUzVVhkT3BGNXorWDBJWkpG?=
 =?utf-8?B?SlI1eWlOS3hVUFF4RUNWSjRwK2R1MHF1M0Z0blNHZHg4Mm5YWEVuNUpsODV5?=
 =?utf-8?B?c0VJTkJzaHBOUm9IcGRiU1E1TFczOWUvQUZ5QUF5aFZIckdVK0pHUDNxSmJi?=
 =?utf-8?B?R3JMdkMyQ0d0a0h6VURIaFdGVWlFNFlrZHFKZ05EdUc3WEpMNU16NG1VdGtI?=
 =?utf-8?B?aGJPSURPa1hxZ0N3TDZyeFE3Z3liNmdNV1llbGZ3M0NpYVBKVjkyWXVERGxu?=
 =?utf-8?B?L2YzS1M2THFFNXRWaXkxek8vNmJvdSt1Z2RqMXRpMkxGYTJwWkZrOEN0Nlhn?=
 =?utf-8?Q?qmnTcDxcULRNCijgTokm8mtxp1y3E+CFsPoRrg3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHE0VHY4UlFDSkZ1R3ZOVVplNjlqZHREUzRNeG1aZm02aGVSbW12WW80dW1x?=
 =?utf-8?B?RGdWTUVhcVFBNWlCVk9qY20vLzZBeXY4YUVpTDd1MElsMmc2dEt2NzZnb1RQ?=
 =?utf-8?B?aWVvRkhqWEc5dDhhQVh5VWJ6TVpabTE4UHJ4SktXRmVrV0VBZFAvcXVVQU10?=
 =?utf-8?B?bkd6T3N4YW4rUmFVOXI5Smt5RkxKUTJ0eDI3bmR4Y2xWY1lteDlQWFpQUzBR?=
 =?utf-8?B?eDdrNURDNm5WTVY4MjBzcXJ0YUsrdk1WZGl2WVpHdHV3N0dUaGxhenBGR2lX?=
 =?utf-8?B?N0lqcnFlT1lUQ05nT09NdDNFRU84QzYvaFpNcVArejFNVko5Q2Jwd2FLb0M0?=
 =?utf-8?B?c25WNWNXY2pkNEFmc2doVWVlREtac1FOSmJlcGZKSC9wNGpXOU16L25Hbnhy?=
 =?utf-8?B?aVh6NVIvYkMwN1NUcDZ5aHI1Vk9hdTNibVVMblBsSTlYSzAvdFdUWlZyRW1x?=
 =?utf-8?B?RVBtdkJDQlV6bzZqaXlwYUtzb1doRm1EVUJGTXZqOXp3b3VWWEppdU1kZ2NF?=
 =?utf-8?B?WGpMcEhRdFdhbmxiSWdONk5YVVNOSkdqY0tzc1oxWk1KOFEwM1RGUWpKS2hr?=
 =?utf-8?B?MHdKWnpKWHlZRWI5blJGcURzV1FCSllyYXNKRkRiMGROSTNrd2VqSENtOWxo?=
 =?utf-8?B?MllidEZELzFEWS9WNTBLWEhxMFQ2NzU1cGdKVkpHOE5LWWQrNEh2bTh2bFdF?=
 =?utf-8?B?TFM5ZldVTXhmcjI3RnBMR01NRGhETkVaUjJTcjZmbktNYWt4TnoxVUtKa2pi?=
 =?utf-8?B?UEUzcC9TdHgwNFZia3BBM1FDR2dXOGxxOTIrMis2L29ueE0xTFY1c3VYVW9p?=
 =?utf-8?B?a3Q4UzY2c2JzeFVOeGZBWWhzN3M1dVB1cVlYdHJrQnNveXRMcVp4dVp5VTFu?=
 =?utf-8?B?K3phaVNqRDI4bnJGWGVHMVJ4eExUcjkyZkRLVm9TTy9BZy9xWVF3OEFjdGtt?=
 =?utf-8?B?UU5LZ0RtMUJXclZSWFJweHJ5R1hPcDg3blRRT29Pd080bVl6eW1YeThXajhs?=
 =?utf-8?B?OFQwTUFBRWxxR2dCTm45OXB0OXd2L2Y3UHI0U1M4Vy80ODBKTjQ5blQvaGds?=
 =?utf-8?B?UVhLN0xqdnRvL1BtY094M29kTXVXL1psQzg0QmtmMitpR1FoM2ZoR3pWZW1x?=
 =?utf-8?B?b2J6MHdVTmx2Z0ZhN3F1WUR2RDcyUU5JYUlNSXd1RGllMDNDZlpYZkZEV0M2?=
 =?utf-8?B?K1c4VjViejdlRjl6cUI3ZEdNM3d1ZGw2eWxKaEttalZBK1A3eXBmdGdxcWtH?=
 =?utf-8?B?SXhJQXhjdmpJNys5V1RKNkRudStCekVWaVhtRmozU1JCd0FpZGRpajkra29S?=
 =?utf-8?B?QWkrNWRPTDByRGROMHc2MERzbm4rd1M4WHMzVERKeWhJSTFreEN1WDBGWUs1?=
 =?utf-8?B?SVFtdzN5OTEzUDBuY0tiUmZQRHZPeDNVUGVLZjRzanlSd0xDRkllTzhqRENk?=
 =?utf-8?B?MS90MXZLZ0Q3UUg0R1ZjOGMxbzVhbnFkQmxtaU1WMFNzVWsrWGFqQ0VSZWdZ?=
 =?utf-8?B?eUhJS0pzOWJSQlZOeFBZL3h2ZFV4N1Nmd2x1T3NUeStaSVhWeHFEeDhIdnY3?=
 =?utf-8?B?TTUxL1hzL3psQ2pqWUJsWjdGSGFERUF6UTgxT2hxRTByck9xZmtPRjA3MWg5?=
 =?utf-8?B?RWdzU1EwRm5CKzF6bmhZYmIzZjJybm53ZHBCN3Jyc2U3REd6Y0JPYmlWeVkr?=
 =?utf-8?B?SlJuRTc0Ym9PdVMzamhUbTFOSURkY1FQQzg2S2I0b204cnRhU0Jpa1owTWM5?=
 =?utf-8?B?a2d6N2ZNNDNxYUR1Z29UNGV0NVByS2hUdWxEeXZXOGx5WDA3T1E0ZlRtRFhZ?=
 =?utf-8?B?c3gxSzYrN0RVcFJwR1k5L2RnbG9aL2JUdWxSTGluSlFac3pJazlrZDlCR0NB?=
 =?utf-8?B?ckc2dzFycWpxcXk1WVY0RU1XaG1pMUpNK01ObTl4eEsrVjYwRWVseWVOY0Ji?=
 =?utf-8?B?NDBNbUVjMWRudm1BdjVZQ1lEQkdOZ0NoQ3p1Nk0rSGNsUTFYUjdCOXZpNjc2?=
 =?utf-8?B?aCtwNjNlbElYUEFrUWduOEZWclZEK0o1ZXJLNjFIWkVHRGxoNWR2d01Od21o?=
 =?utf-8?B?VmhWOGRWd1J4MEJOOWFBRTlwMWlIODlwSWlZdFVXUW0vOHRnK1hOU2N6RmtP?=
 =?utf-8?Q?YwAE4MExNnmdeUuWkikvxVUep?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c9e190-1776-4ac1-1d38-08dcf29e3ed2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 13:34:25.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6TpldTFL4cdvZ39f+hZDGUvcEnBmuNA0B5rWiLTpPPe1xRxb3P9vvhAAd1GFDRKUSONuWD+gIit3qR5Q745fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826


On 10/22/2024 6:52 PM, Ilpo Järvinen wrote:
> On Tue, 22 Oct 2024, Mario Limonciello wrote:
>
>> On 10/22/2024 00:54, Basavaraj Natikar wrote:
>>> On 10/22/2024 2:05 AM, Armin Wolf wrote:
>>>> Am 21.10.24 um 18:58 schrieb Basavaraj Natikar:
>>>>
>>>>> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
>>>>> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
>>>>> switching between Frequency and Cache modes. To optimize performance,
>>>>> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
>>>>>
>>>>> Frequency mode: cores within the faster CCD are prioritized before
>>>>> those in the slower CCD.
>>>>>
>>>>> Cache mode: cores within the larger L3 CCD are prioritized before
>>>>> those in the smaller L3 CCD.
>>>>>
>>>>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>>>>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>>> +static int amd_x3d_resume_handler(struct device *dev)
>>>>> +{
>>>>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>>>>> +    int ret = amd_x3d_get_mode(data);
>>>>> +
>>>>> +    ret = amd_x3d_mode_switch(data, ret);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    return 0;
>>>> Please directly return the result of amd_x3d_mode_switch() here.
>>>>
>>>> Also i think that maybe there exists a way to avoid locking data->lock
>>>> twice
>>>> during resume, but i will leave that to you.
>>> I will leave as it is.
>>>
>>>> Other than that:
>>>>
>>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>> Thanks for the feedback. I will re-spin a new version after looking for more
>>> feedback from others. Thanks, -- Basavaraj
>>>
>> FYI - if no other feedback comes in there is no need to re-spin just to add
>> R-b tags.  Maintainers will automatically pick them up when they use 'b4
>> $LORE_URL'.
> ?? There's the return change requested above.

Yes, I will include above return change and re-spin a new version after
looking for more feedback from others.

Thanks,
--
Basavaraj

>

