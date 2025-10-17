Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3C32C931
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 15:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760713814; cv=fail; b=lAKU6sOfhfu2cdSmw2SCnxuktdjfTOh8SVM6vE2Zh0+Lg/pm+yDIWMyJZI0+mN6HWs+AF0XDoxRXULzGKroUGi1qv12hhHJnEyq6BRql7QxRBKLFbfpKxz1Gf+AzY2cKogKiCBpu8xuSXRUi5xMvk1lUQ+Tt840lTwofoGFkTUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760713814; c=relaxed/simple;
	bh=SKnnqs7T8R+7AZ4fTs7j2lZRQBnbF3FlKl2gKy5cr0Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qUlkRBP/R8jtAv/bjnSLCzZIO3cpwYTupTuo+NvFPAcXccK6ZSb1yAXwLob7Zvawgwuroq3MK8l3lW263sDKf3iWyxRf9uVF3PoXIQQaeu2HXvd2maP5pJdncsvxwMvGiloJaX0SMvFlz2ah5LaaRYxNrsVrEiqG+r3C3/7lixk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u0RJU+4s; arc=fail smtp.client-ip=40.107.209.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u0RJU+4s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqDGzyIfPvjhSBu2I+8lfCFvH7fVuNKtnwexMBCO2JN7byz/iXkzOZeEg8comLXFyihNy+r9OuTqdRTu5b0QupK4AjB2NPF+6dYJlB/sYt8X5ESTWk2z/f+moMryXMeo1/Q96q0rMMyH8LYZ8cRlBP5EVwJ3dmgHKQpOEBXoGf+tApLye/d2nbEs3qCAGesJB9xAEJipMo17EvETzgOFQRHO4FWtAv7yAWMNmYueJYmi6A6/zLvFItJBuSpjJeoKtdplkIacllRhFZKBt1DMKSxy11xKJTKGXXmc3YNajbjejlF2K9ffOhgW/S1+UPFnK/ZL7kdABjhujN6mWIVPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oMrT9HlTsuVx4FzhoWcWiPp40PQTK3IuyhY0SYrtTo=;
 b=upWhM2H85xJjyitoLjM5fPPhcMjD8KrLEndGf4bg5us4pQOz+V25CIaArJwXrqkCj/wiIb03FDmWjQq72AA3OVQ6SlcUBqYbUmeqV2hwZMXVupZMVS7YHAGIYRokmbKYbng7o67N/4Y7mXmi1qCGwOGMb+kSxrjrIvufl6D25uB9idC2TUAgdaTQkRSdJqrErgDXOBW0+F14NcR6iFaeSQsHVvnWQ3dZRzAi+teYFPgbq+kvvPTgbjqIwEVwTAOwECpaNlBHf9F0zk2HYBGDnKQqkLuFhpaS6SSiZ2EBwo862SrxPiiw9n3F38A0uNYLxEolbXik/TNM9Pkygze74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oMrT9HlTsuVx4FzhoWcWiPp40PQTK3IuyhY0SYrtTo=;
 b=u0RJU+4sF2+5+XKs8o9GMdysGp1yyKCAx76j3JpD9UhJvWUCQW/A7ftcf7vt3xQLcL7aUHzwsDTSzahr/JCZ/X83H5RsX7ahw68UFKOW81qqkDo/62vGXzC2wKUZRPz2CwFW8fFuNJ0eupRFgzyex9es7tMml6y019zKMWUALtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8309.namprd12.prod.outlook.com (2603:10b6:208:3fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 15:10:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 15:10:09 +0000
Message-ID: <10f1e5ff-a512-4e92-939b-4e99886ae4f4@amd.com>
Date: Fri, 17 Oct 2025 10:10:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86/amd/pmf: add util layer and user-space
 misc device interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
 <20251017102544.1470934-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251017102544.1470934-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0084.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d57ff1-f7af-443f-ef27-08de0d8f4311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkRLM1ZCR25CV3ZCS0o5UVNuS0hjMUVoYVMwb3pOL2h6RDlWL1FOZkVGTXVu?=
 =?utf-8?B?L25GSmhwQUFUNXdhZDBQa29OMWpEOXQweWs5NkRsTHpNU2pyVFQ4RVY4TUl2?=
 =?utf-8?B?ZTNhbHVCMHNYcXhzckhQMkh6bWtDY2tQaUpOZlFad05lMjIrWEZ4d2tCT3Br?=
 =?utf-8?B?cjB5dmU3TTdjUDh6RGpPdjRBdG9PZXVqenJOSlAzajFKRkRwei9BTmJmam5M?=
 =?utf-8?B?MzdqZEVZb0szYVRzN2dZWEJxR2tlSVh5ZGtjcEdkZVJKM0dFenVJa3NKa1hC?=
 =?utf-8?B?cWZDck5iOGdJN1B5QW4xbGJZajZqeHNTSHJKOC8xMFg5RFVTUnZyZC96L2xX?=
 =?utf-8?B?MzJycUxXcDA4T3ZSRHhuQzBpYlZTOWh1bXB3OGV0REVJa3Z4YTZDdUp2Qmdy?=
 =?utf-8?B?K1hVeEdKL0FyMVcvZEorZ3pYc21HWlNhTjJTbWpFMEgwNG1aSS8rNUQ4clJV?=
 =?utf-8?B?WXowMkN3d1A2Qmg5NDNjZjBYaDZZVENqY2hhdWE1TXloWE9QZ0Q4TGV2N1lo?=
 =?utf-8?B?VnVLQmIvODJTdHpsYnpZalJXM2ZySjZSWUkyZzYyVXNEMzN0NkxzZmlMQnhq?=
 =?utf-8?B?YUhpTTJ2OTYwTm9DMEdjaXRlNm9FRTVwNUd6aWpKdWxYVEF4bDNYRXg4M254?=
 =?utf-8?B?UXpYVUdnUEplUHFhOGxSZDU5UGQ4ajdPVno5cVVhMDRMMGNGc2dBK3ZHMkVL?=
 =?utf-8?B?ZzZLanhFbkVZV0VNVlRkbUNIQlphbE1CQVNoZCtoeE1WZk8xeS83S0hjbThQ?=
 =?utf-8?B?VFlqcHNsRE1rdFhKNXA2Sk14R2Q3TXNFUERRMFlkeXRHUmF5S3NKbXp2dFIr?=
 =?utf-8?B?bWxzdGoxeHJnekJmZTNnZUFVUHF4bkZmZWlOMTBadGdGOTJtMysvYXFhM0lR?=
 =?utf-8?B?dDc1a3p5VVhwR3hzbkp3M1MwcTM0ZVlSbnFQR2Z1cm43MkFnYUJXOGNZM0hL?=
 =?utf-8?B?aFhZQk1Dd1FMS2IyeGZ3akRwV0hkOERpcjVNamM3ZXd2amNXY1czQkg4YktZ?=
 =?utf-8?B?SWVqUWpYR2lLN1FueGcyTEJ3WjR0TE01cjFadFAzOFphKzJSTmQzZlh4Rm5O?=
 =?utf-8?B?K1lvSHVzVWIyYkpIdWZTZzZCZ2w2NmtVL2g3UXRyOGZWUE1sczNVU3NUVUVR?=
 =?utf-8?B?cTZEbGRwSlRJMjl6RWRZd25MZDJGbUhkNkwzRWRVYnVuL0dxK2VpeGRxYUNx?=
 =?utf-8?B?Wnh2d1cvU200bVJyZEd6MUdtajQ2Z0NmaGl1MUFPWVJsUVpMUGp2azJlcnpB?=
 =?utf-8?B?Y1FrWVh6eGtqZ3ZmN2lEVEFCK3hocnpsOEo2aVZZRWdnVzB5amlwTFdPZkJz?=
 =?utf-8?B?djFXc3FWVmVsRTIxdzZNK0t6Qkh6akdkWTBESlB1WFlVa3lFaUR3Z2oxUnhV?=
 =?utf-8?B?cFhOcEZEN3dtUCtjeFhSWExGZXg1VjZ5U2lkbHZuTzMwU1J3MXl0NWdnbG1W?=
 =?utf-8?B?SzZYTFJEdStKMWc5dllrRG81TkxtdHZnM1RKWEhKTVN4SUZvSHorSWtEOUNn?=
 =?utf-8?B?Tmx4NlVBS2J6OVJUZWhLU2F6THgwd0c1NkxnQXlvQjErVFlTK2JTL2d0c0xL?=
 =?utf-8?B?a29VMlZNNXdnV05YQThEMVBZSCtCOGJrVWNKQ3FZTDJQWlhLRUVhVmk2eUda?=
 =?utf-8?B?aUFvNWtUekxtRjE1Rmc2ZW9qL2trZXd2RXNVOExObWh6Z2NRSCtwTEpUQjVF?=
 =?utf-8?B?ZkFPYnUvc2hXZi8wRm5TNlZ5UHQrcllCTzA2bmFqQUtvZjU3ckVaNnNzS3I0?=
 =?utf-8?B?SXZYRFhnOGdBQmp5cjFJVjNOVlpBQlJ5MlBtcjJxZ1ovdlV5UnZ6N01OKzl3?=
 =?utf-8?B?eG5XUzBxQUxaczRsdlhsQ2pvOS9hcXdsdThuOVRKUUpwZUhHVEdQSHJxcG1I?=
 =?utf-8?B?Qjkva3RpTzlmUmdHalJBQVJwKzBvTUhSSkZEdTVsZ0VHTUNhbFg3MURmbDRj?=
 =?utf-8?B?MlFuTmxZNEp5c2FNbjF5b1preWJ1THMrS0ZrMUVIeDNJVy9xQXBUb3QvMy83?=
 =?utf-8?B?bURTYnY2Tll3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9PSlNLSUo4ZDN5c3lKb1NzcllZc24vckFJYWxrOHVPTmo0TkoxSFJkSkdv?=
 =?utf-8?B?RVBPREFqTDlYUXRkOUNDWHJYak9IOUJtaW9QcklvcEQ2VktXSW5rcTNyZWRT?=
 =?utf-8?B?ZzcxY0UxVjNKaFRhdEt5S2cxZTdjdkhkREwxQkhTT0hzLzBBUm5UVUpCUW9p?=
 =?utf-8?B?WmY1VThUYWFzdXdSL0x3SHFSL0tCMDFzMmFWWXdLY3lJMzdrQWd3aHlLOHlX?=
 =?utf-8?B?ZjBPMnVpa2lJUVc4YWNpTi9TclVINzVtdU81VEtRNzJ5NTNoaUNPTER6L2xo?=
 =?utf-8?B?Z280dkcwaGpYc2RpRDlMOVQzc0Y4WmZaVHo5Q1FWWEhFM0JST0wydUkxSWxl?=
 =?utf-8?B?dVBoTElQR3VQT0MxMlYzalo4Q0wzMnN0SS83VUxFUWZORmVHazFpck83VlJL?=
 =?utf-8?B?NUJIM0ZXSExHT20yUnN3b2NacnpVTjM0Rk9IQ0hGUFVESHl6amZNS0dFeVp2?=
 =?utf-8?B?emVEZVJQYlVIRmdIdzJHQ0pxdzJYTFM0ditjNEFqcE9PMjNCcWE1ZmlMbmpr?=
 =?utf-8?B?b0I5djJ4bmRRUUlQbFlDdEROZ3lkQWd2bHcrcFU2ZEF6OW5UZ2tUS0NTY2Np?=
 =?utf-8?B?bnVNNFE4WXQ5eGhPa3NNTWxQMXZPdmlnS3gxeHExZlNVbmZvUVFTTk1xUjVs?=
 =?utf-8?B?YzZ1RGd4d3JTc0hEaDJ5cmM4dmMxMlJWMTd1U29pS1FoVWNMM3gzVFRwVGVY?=
 =?utf-8?B?cm4rcjJRMElHdE9pS3MyOFZ0Uk1TeEhNNVRoNWZyY21rME5UWmR1ODFVOU9R?=
 =?utf-8?B?RGJLM3EwMmQzMEQ4dC9jK1U0QlFYbWFRMEdDTkQ3UXZpWW9rSXJOYlphM3VR?=
 =?utf-8?B?QzdjL3h0eGFCZm9oT3UyVVUwVk1pT2JvS0s1c2p5NVJLSzF6VVl2WWREMDhC?=
 =?utf-8?B?UGhMQVRsNHd1akhiSVkxallzUWh6aWE3NGh2TStxZS8waUpqMjFhTDg1eGVk?=
 =?utf-8?B?VWRUL0FwT3EwSGdpZ1dkTWd4aDA1QVJ2MVpseVB3bjVJcGlUS2N6cVFJeGtu?=
 =?utf-8?B?RmxjU1UzNmJRM3pvbE50WFArRWRlRURDM3NWOHd5Q25NcExFampCUW5WVWM0?=
 =?utf-8?B?WHJUZEhqcHJXdWVvblgrMWdSZ1NTM3JjV1R6VmlqWTRtdzZET0RPcnp4OVdB?=
 =?utf-8?B?L0M3dmpVSXVqRnRweStQZnlTWmtDRlBydVlwVlI4ZVRrSExsY09ibk5LbmRL?=
 =?utf-8?B?MlNXSlliR09pTEgzQTZuSnVFT0tUMVJZZW9rNElMdyt2RlY1WkZoUFR1dGd3?=
 =?utf-8?B?Rnc0SGtPWXpyR3N0UG8vQlFIMlZ4aFRBaVM4QmM4R3gxV3JpS1czUWdQbFd2?=
 =?utf-8?B?UHRhQzNIeVVtYVZIaU1hS2VnNlNiSzM2NHZSQmJNWGM2Ujk5YzZDZkdxbWNS?=
 =?utf-8?B?WS9yUDlqdGFwM29QditXNXV4d20yRFpsT0Fwam9UaVpySW0wS00rZXV0Y01n?=
 =?utf-8?B?QUZVc292NlpwYUtWOWFEMEQreVJOMyt4K1VEOGoxckZJNnEwU1FROWpMdUdv?=
 =?utf-8?B?RVlqRzVBVzdOM3dDcEdEaUNEZXlWaENGRWoralFodGFmR0cwMW1DQmZwRW5n?=
 =?utf-8?B?MVd5ZU1DRUxybXBtSTltMXJqRFRtK0luc09wMXVpYUNvMkpaVnUwZnN0U2Vk?=
 =?utf-8?B?bmgrREF6cXp3S2tLWEpUR1ZsUzZsMEhrU2NqODNrQkt2SC9lUGtEOUxQZjJK?=
 =?utf-8?B?aFJFMnczV2JKaEk5V3grNG5qQkpVakU4OStxQURFbWd6VUs4QUNKejRuYklE?=
 =?utf-8?B?dEJMV2N5VGFnKzdxc0pXY2hlWWEyUGpmKzRxcXlOMlozOHZ6SjlJSEFURWNv?=
 =?utf-8?B?VlBHb1BLY2trd3VONytTeTN2WDd4V1BtMlFtRkRwTzdtbmsrSmthTnI2TW1O?=
 =?utf-8?B?VmxxaW8yYytNT21TK2xpbVRkWTlyNkdUL3UwZ1dYcmVEMkNoWWFzY0ttNm1k?=
 =?utf-8?B?WnpsZ0hYVm5pWXprbEUrZmZaNFc1U0ZsWHd5eWE3R0ovRnNGNWR2NUM1Mm5V?=
 =?utf-8?B?VHE4Sm5XQkVJWC9TUUZZTzdvdFlzRldkTkVmeEQrYS90bnczTm13MFNSSTRR?=
 =?utf-8?B?eEN4M2pueUsxY2dwdlA1YlZZUWhyRnNsMCt1ZXNSZStsdXBudkhrSUN0OGl3?=
 =?utf-8?Q?KUrqspnfNe79uVSqjiJO1FlYM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d57ff1-f7af-443f-ef27-08de0d8f4311
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:10:09.2420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGO6XneRRali6IAUc6AVzCMdMLPV6s71s0Xv17/N3g2s5niN+2sFepP15le2+chpsd+y72nsvQGOiVTNz6QT/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309



On 10/17/2025 5:25 AM, Shyam Sundar S K wrote:
> Add a util layer to AMD PMF that exposes a minimal user-space interface
> via a misc character device for metrics monitoring and feature discovery.
> This creates /dev/amdpmf_interface with a basic ioctl to report support
> for PMF features (Smart PC Builder, Auto Mode, Static Power Slider,
> Dynamic Power Slider AC/DC), enabling smoother integration with
> user-space tools such as AMD SystemDeck[1].
> 
> AMD SystemDeck is a widely used user-space tool for monitoring and
> controlling power and thermal behavior. It helps designers keep major
> components within their thermal limits to ensure proper operation.
> Maintaining temperatures within specification enhances overall system
> stability and reliability.
> 
> [1] https://docs.amd.com/v/u/en-US/68773_0.50

This should be

Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]

> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/Kconfig  |  10 +++
>   drivers/platform/x86/amd/pmf/Makefile |   2 +
>   drivers/platform/x86/amd/pmf/core.c   |  19 +++++
>   drivers/platform/x86/amd/pmf/pmf.h    |  10 +++
>   drivers/platform/x86/amd/pmf/util.c   | 115 ++++++++++++++++++++++++++
>   5 files changed, 156 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 25b8f7ae3abd..81ea4934e199 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
>   	 in the PMF config store.
>   
>   	 Say Y here to enable more debug logs and Say N here if you are not sure.
> +
> +config AMD_PMF_UTIL_SUPPORT
> +	bool "AMD PMF Util layer support"
> +	depends on AMD_PMF
> +	help
> +	Enabling this option permits the driver to interface with user
> +	space for capturing AMD PMF metrics and updating them to the
> +	user space tool for smooth monitoring.
> +
> +	Say Y here to enable it and Say N here if you are not sure.
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index 5978464e0eb7..bf7aad80b9e9 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -8,3 +8,5 @@ obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
>   amd-pmf-y 			:= core.o acpi.o sps.o \
>   				   auto-mode.o cnqf.o \
>   				   tee-if.o spc.o
> +# Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
> +amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bc544a4a5266..ac2b80db019e 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -53,6 +53,19 @@ static bool force_load;
>   module_param(force_load, bool, 0444);
>   MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>   
> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> +struct amd_pmf_dev *pmf_handle;
> +
> +struct amd_pmf_dev *amd_pmf_get_handle(void)
> +{
> +	struct amd_pmf_dev *pmf = pmf_handle;
> +
> +	return pmf;
> +}
> +#else
> +struct amd_pmf_dev *amd_pmf_get_handle(void) { return NULL; }
> +#endif
> +
>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>   {
>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -465,6 +478,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	if (!dev->regbase)
>   		return -ENOMEM;
>   
> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> +	pmf_handle = dev;
> +#endif
> +
>   	mutex_init(&dev->lock);
>   	mutex_init(&dev->update_mutex);
>   	mutex_init(&dev->cb_mutex);
> @@ -477,6 +494,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>   		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>   
> +	amd_pmf_cdev_register();
>   	dev_info(dev->dev, "registered PMF device successfully\n");
>   
>   	return 0;
> @@ -489,6 +507,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>   	amd_pmf_deinit_features(dev);
>   	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>   		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
> +	amd_pmf_cdev_unregister();
>   	apmf_acpi_deinit(dev);
>   	amd_pmf_dbgfs_unregister(dev);
>   	mutex_destroy(&dev->lock);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index bd19f2a6bc78..3b1aae8a60a5 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -823,6 +823,7 @@ struct ta_pmf_shared_memory {
>   };
>   
>   /* Core Layer */
> +struct amd_pmf_dev *amd_pmf_get_handle(void);
>   int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>   int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
> @@ -888,4 +889,13 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>   void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>   int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
>   
> +/* Util Layer */
> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> +int amd_pmf_cdev_register(void);
> +void amd_pmf_cdev_unregister(void);
> +#else
> +static inline int amd_pmf_cdev_register(void) { return 0; }
> +static inline void amd_pmf_cdev_unregister(void) {}
> +#endif
> +
>   #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> new file mode 100644
> index 000000000000..483e4531535e
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Util Layer
> + *
> + * Copyright (c) 2025, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *	    Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#include <linux/miscdevice.h>
> +#include <linux/uaccess.h>
> +
> +#include "pmf.h"
> +
> +#define IOCTL_PMF_QUERY_FEATURE_SUPPORT		0
> +
> +/* AMD PMF Feature IDs */
> +#define PMF_FEATURE_AUTO_MODE		0
> +#define PMF_FEATURE_STATIC_POWER_SLIDER		2
> +#define PMF_FEATURE_POLICY_BUILDER		4
> +#define PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC	5
> +#define PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC	6
> +
> +#define AMD_PMF_FEATURE_VERSION         0x02
> +
> +struct amd_pmf_feature_support {
> +	bool feature_supported;
> +	unsigned long feature_version;
> +	unsigned long feature_id;
> +};
> +
> +static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
> +{
> +	struct amd_pmf_feature_support info;

As nothing populates feature_id, I think you should explicitly 
initialize this structure so garbage doesn't get passed back.  If all 
the commands in the future will reply with AMD_PMF_FEATURE_VERSION 
identically you can set it here too when initializing the structure.

> +	struct amd_pmf_dev *pdev;
> +
> +	pdev = amd_pmf_get_handle();
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	switch (feat_id) {
> +	case PMF_FEATURE_AUTO_MODE:
> +		info.feature_supported = is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE);
> +		break;
> +	case PMF_FEATURE_STATIC_POWER_SLIDER:
> +		info.feature_supported = is_apmf_func_supported(pdev,
> +								APMF_FUNC_STATIC_SLIDER_GRANULAR);
> +		break;
> +	case PMF_FEATURE_POLICY_BUILDER:
> +		info.feature_supported = pdev->smart_pc_enabled;
> +		break;
> +	case PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC:
> +		info.feature_supported = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC);
> +		break;
> +	case PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC:
> +		info.feature_supported = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	info.feature_version = AMD_PMF_FEATURE_VERSION;
> +	if (copy_to_user(argp, &info, sizeof(info)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> +{
> +	void __user *argp = (void __user *)arg;
> +	struct amd_pmf_feature_support output;
> +	int ret = -ENOTTY;

I don't see a need to initialize ret here when you set it on the next line.

> +
> +	ret = copy_from_user(&output, argp, sizeof(output));
> +	if (ret)
> +		return -EFAULT;

Shouldn't you return ret here?  If you always want to return -EFAULT and 
throw it away you should instead do:

if (copy_from_user())
	return -EFAULT;

> +
> +	switch (cmd) {
> +	case IOCTL_PMF_QUERY_FEATURE_SUPPORT:
> +		ret = amd_pmf_get_feature_status(argp, output.feature_id);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;

If you're not planning on doing any other processing for future commands 
you can just instead do this:

	switch (cmd) {
	case foo:
		return bar();
	default:
		return -EINVAL;
	}
}

> +}
> +
> +static const struct file_operations pmf_if_ops = {
> +	.unlocked_ioctl = amd_pmf_set_ioctl,
> +};
> +
> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> +static struct miscdevice amd_pmf_util_if = {
> +	.minor		= MISC_DYNAMIC_MINOR,
> +	.name		= "amdpmf_interface",
> +	.fops		= &pmf_if_ops,
> +};
> +
> +int amd_pmf_cdev_register(void)
> +{
> +	return misc_register(&amd_pmf_util_if);
> +}
> +
> +void amd_pmf_cdev_unregister(void)
> +{
> +	misc_deregister(&amd_pmf_util_if);
> +}
> +#else
> +int amd_pmf_cdev_register(void) { return 0; }
> +void amd_pmf_cdev_unregister(void) {}
> +#endif

