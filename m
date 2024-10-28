Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892371537D7
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134154; cv=fail; b=CdxvR2pxKtIOBhOmJFFlMvjnCRRZS+aUd36KaeBDA4iSDQh7cU7znusxhjWgty1xKA7bU5OXPJqpWa1XOENQi9aKpHJ76IkPsXN3G4SRXLy9E0NNRfyFGY8efiOj3bXUBervOO2nZVwFpogHei12cC6mChSql5/zaHe6F3ws2mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134154; c=relaxed/simple;
	bh=oNnNtHU3gk1b1JLZDe+p2sAM8t3GxWDM2s4kNNcHRZc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jiBMil83gzv8mNJhXX+4xoZS/+FZ2vqHdInp40zEhzV+fZbdI6XkmRl1swmSXyA33ZoBs71yEkzPpV9mznvD8JQooZ1AyNaGR/NEoXP8iUOVnWObHuZzgj0ST2fAdljaMu+KKKVMNBF8X0m7RQ1pXeyiNMQ3Su1KBFf/yR4h3K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ohfCpR3k; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ohfCpR3k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gY1qFVC70jrjgqXJDBHab9tGdHJ6wXP36oHJWCcl3UG8HV3xSv9pmbka/Ys373jxOJwyEGqWgzkDo/D6fq2K8OIXrrZmG5Coh84HeHw02Wv1SLp3OhW7PKzpJmpNq6BEwd0RbiDlATA3s4Y/7SX89T4ilO4RpstIEwkpWmjXVJk1GrZR5shNQ0zcGtQC6r8KKSsRDKKoOm22EBaOue42Ff5mwcFYLdtAgiuVYwuDbg8jKuvyZ2Uopp2CFNtTfUO0UJlj6ugqSrHga8w1mtU0r6BhkXl2LLAk1MwAqrZT3aK7pdKb3RAKQbcIR6eXEG82WIfOktfzKTwKORpjJQtDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rDjfK4Jgh/Xku/T6F7KqT9GV5k0pbzk4na1BUr0hKk=;
 b=mfhslGyyt3+dR8V4IY4wDJR0bAqM+A/3d91YpllJuKy+97igEImi7bwtdRWgCFirmE554stKteeyf6q+u/Na/7jj8CVR7MfzK9CdxVyt+wOHaPgld94iL9cJbedzAltHkL5zS8cVuALftBUopn7+ln/bt99qMHGtZ8+kVyDgWxfTQ0ncLdW+fx+pTjI8QBobpauYZFi9SNaN/b2L7YJnKYid8JM95wDaVyAReRjwcg4F27DUtxbipI9+diZjwx+zUC2hjwAxYOZfOJ77LFUzAv75yzgB0k9l36f/a1qJVrsykbZjiz37KEc6RAGzrZoJ0jpoK0aXMEoSq470fn0Ljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rDjfK4Jgh/Xku/T6F7KqT9GV5k0pbzk4na1BUr0hKk=;
 b=ohfCpR3koTA4yWNlnx4ndVLdiwtSvJrEdflni9w5/3RZRIONl9bRi2T+W+fDFp4nuJciCpta8yC4qDkhlsV52GtzsAHr4nm9ELvdL3Dz0slKzu9XNVmbgRmQ/IY01q/8H2pqqRYpRs/z6254+OmJV3z0lcqPrD07y0gND/+SYs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6692.namprd12.prod.outlook.com (2603:10b6:806:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 16:49:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 16:49:09 +0000
Message-ID: <6f0403df-6711-4453-9b05-14c63fb39e1b@amd.com>
Date: Mon, 28 Oct 2024 11:49:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] platform/x86/amd/pmc: Update S2D message id for 1Ah
 Family 70h model
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-7-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241028070438.1548737-7-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0232.namprd04.prod.outlook.com
 (2603:10b6:806:127::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e9fa59-024d-4463-1fc2-08dcf77071b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlVINmhqN0ZZV3dNRDJsYzE1a0dvWnNycDg1cWQxYlZISE82b2xwa3Rtbmgy?=
 =?utf-8?B?cDd1dFhNcDdkeDhoKzlzSVRETkhRNkN0bTZXSXpEQk1WWTUzc3BzcElta0xS?=
 =?utf-8?B?eDVWOXR6V3F3Vk5YczZnMyttWWowLzhtSEJwMmhhWlhrdGhqeWJocHVrYjVj?=
 =?utf-8?B?VDM4cjNuaWJLMUFUUytPSFhJdzZyYlJ2dFRwZFdJUzlXV2wzVTVOWHMyT1M2?=
 =?utf-8?B?UWl4MGpEdmpRTnJ4bHlHa2F5VFd5K1Znak9tL2RCdU5PM3Rja1FXdXEzR0lm?=
 =?utf-8?B?U3RaazZhck9FZUZrbGNKem1YNGpxb3h3ZVhtOUlLZSttamJ2azVqNFI2R0dU?=
 =?utf-8?B?RXd6R0prZlJTenNIMUJjQ08zZmFyWGdmNzZDSDFMdW1ZcjRSQVF5OGgzWnhn?=
 =?utf-8?B?T2lKb3I5enJSQ2tsWVZRM2M4RGxLMUJlOHk3RWtxdnhrV0FIcmNCeU5CUW9H?=
 =?utf-8?B?ZHlvaTZxclYyRlN3MFVmTEdtRkYvUkxlc2FkOVN2dWdXVmJIMnlHVFFvNlFw?=
 =?utf-8?B?ODVnSURyd2QxV0hkaHJWUnhIbk81eFVWTGpCRFJhZUdnakxSeFg5anFYTjI4?=
 =?utf-8?B?cndoYTdRdmNjR0NnQXUrU2tPdUxLOGkwZ044UWNKMWoyUFdheTBEdU54R2kr?=
 =?utf-8?B?Z0s2MWV6K2xCd0x4OFB0VzduSWxydVFrV2t6WkQwUUdLa2ZncEU5U3pHRFgy?=
 =?utf-8?B?Mm1rUWlaUVFGVG44MmlmdVhVcDJYVC9RQitCSUxTc2RkY21oR240VXhzMVRC?=
 =?utf-8?B?VFhQWkVQRStKdHdTbDRtN1k5TUhXa1ZMVkR6SlJGdXh2MVpkQXczZkxUUDNh?=
 =?utf-8?B?OXcvTDZtN1BpanBmSVFzSHF6Z2ozWU50ai8va2pURlhvcHRhamJDS2dpdWhR?=
 =?utf-8?B?eUtZYWRlRFRlTUVqYVNYMERoeGhJR1pXODVyTUs0dHZsRzFTL2NZVHNObzJl?=
 =?utf-8?B?WGhuaUl5eWlvN0pJZ3YyNFQ2MDB2azd3SWNmaVNtQXRFL3pqOEliWk92MmJ5?=
 =?utf-8?B?QUxxamFCNzI3RDA5ZjhQTElpNTdnYkJsRzRLYXRwU3JuZVVNc3NPMVhta2NM?=
 =?utf-8?B?UklYMS9kMkhYVDlhTjBHdkErczEvOHBXK0pVeDhoUlhDOG1kZk4rUTR6cDZQ?=
 =?utf-8?B?Wnh5aEphbWpYZ2s2M0xETUZYR2YvTmZ6eGllRzFSb09hMDFhUFF3UVdxVWtZ?=
 =?utf-8?B?UkV0eTNvTGNLY05JQ241OTRmRGwwNGtvK0V3VjFSUjEvc2ExZUhDOVRZd1F5?=
 =?utf-8?B?dndLeGYxOEY4anF6VDVYa2JEVk5DZk5zR1ZaWlRvZVVrRVU5emtFSzI2cXM1?=
 =?utf-8?B?cmJONHcrclVjSkZaZUdEMVFEakpLbXU5VWp6YUlTb3h4MkJoZTluNmp1UG1O?=
 =?utf-8?B?TnlORnN4Z3JYSUUwRms2eHpTSDVSNmhzT1dQeXZoNUZiMlNQelhQTnNFR0dC?=
 =?utf-8?B?djF2ZG1Sa3lSL1I5bmtOVE5MMFVVOVFobnNQbkZpOTVVbU90K0p0SWFFS3Y0?=
 =?utf-8?B?YnpLVGRvb2NRNDhubkNudlAzM0d6emxtY1FZZnJGMXNmcWdDSW5kazIrNzZ3?=
 =?utf-8?B?L212RVM0Skhha0N1TWhEWG42REhjS2VDUWJGUXpNbUNldFdiOE16cEtBYmtz?=
 =?utf-8?B?bjVNcGlWWHl5VERFeEdIQnZnLy96czFucG5sbnEwT2VlTVlGZFZ0SXBUelBm?=
 =?utf-8?B?LzE2Q01FQ29rLzdmQVVUR1hGQlcwdU0wcHZhVTFPNCtEZkwxdzRhVmN4c2li?=
 =?utf-8?Q?LqqXXoftO+NHqi8UmMgGOMenPT0kRdE7DQj9gXY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXlIdkhGNVo0TTdWTXgxU2R4YXVMOHJpNGN1WHc5ZW45eVhmU285eGZ1WVlO?=
 =?utf-8?B?clBqdHpVZkJyMUxRUVB3OGNqNnhoNm1HUHB6QjkyZUxsaG5CamlSaXpIMzB5?=
 =?utf-8?B?b3lzYkF6UDVFVHZXTERkdTRLUVFUbDFtSk9NanJha3NsVTA0UlFmSExMMlpU?=
 =?utf-8?B?RHhpc0t2cWdaejhEVStPV1JxSFZNK2FJZjlBZEt4QkpGNWU3My9sZWdQV0w5?=
 =?utf-8?B?TW1hdS9ENmYxckRZNWR6N2dhRER2Nkk5Q1V1VmxTNUNNWTJrS3d3M1JwaGVQ?=
 =?utf-8?B?Z2ZDM3ZML2Zya3V3Ym9PSStzVUMxckp1eG1nL2VCcHVsazBpdW02QnNGV1Ja?=
 =?utf-8?B?Q00rd1E1MmdQNG40VEdPMkRaWUwzbWlVOXNzT1ZXMXNlVEt1VG5Jb2RWZThQ?=
 =?utf-8?B?TlVGRno4UGFaSlVHUFhUL0FoQ0pGVFBJeFNYR1p1QlpIcHRCZjUrdEtMaHJK?=
 =?utf-8?B?KzdzRlFaL2xPSnpIZUtCaFBZb05kZEo1VTFRemV5YXpnOENteUIwOHZ3cGFI?=
 =?utf-8?B?SVJralB5V3JQV1VBelhwYjJWVlp1cDlLZDBJMHN0QVA5eDFyaXpJcnJ5WmxL?=
 =?utf-8?B?UVpWa0RERVRHcWpCekQvKzhubkFrdVhPVWNUb3hZY3llZ2pDbDRpSVZjQlUz?=
 =?utf-8?B?THg3cysxOEJMbXR0WkNvdTlBNGRFUmxpQWFXRnMrUFA5ckxReG4zV3VkR1di?=
 =?utf-8?B?V0ptaHlOOWdXdjVIZjBDZ2h3NHBxK3U1bE1mVXZ1ZzhJRVdIaUxxZy8rNDNZ?=
 =?utf-8?B?ZVZrR1FjU0Z5ZFY2dTdBa2RVWWhhUkVZM20yNTdjWmVTSUs2MEFpSFNxc3I0?=
 =?utf-8?B?aG1RNkFFZ3g4NGRhWFp0R3Y0WDdtN09icWVtdDhBTEVVTWZZUlNHK29HTktF?=
 =?utf-8?B?SGNSYWhKYThyeUEzV2NOZktZaTNOM1BKUExlL0ZTUmdmTVRhR1BSNWN3R2dC?=
 =?utf-8?B?RkNCVWQ1MVdtTHhKUkMxTm1TSWtCSWxQaTYzYVRUSUI2Q2k0VFhhblRIZTJO?=
 =?utf-8?B?eURjMVNvS0h0ZEswMGVMMko2eTF1MnV6dW04aTExalRGd3QwNWVYQXdZOGdv?=
 =?utf-8?B?cTNCMk00aWl1aXhEMVF5Tk9HYWxYcUM3TGsyUHdoWjZmSnEwMVhqUEtEZzVN?=
 =?utf-8?B?OEpVclVqQlkrNUpqM1JGdzB1V2JsZnVEMGF0NlYwRWRSZU52T0E1elIrdnVj?=
 =?utf-8?B?MVFzcVJicGNuYmc3dzdKZEQ4QXdUMDkxZ2NTY01yNWZwSzJXNFRCUmtjeHFv?=
 =?utf-8?B?cjNGR01YNUF4L20xUGNzTTNsMmpaYkgwVTE2aTdqTUpzcVJhem0vVFhVRzR4?=
 =?utf-8?B?YzA2WlBDMTNFN1h2aVpMdHZSc0pRZEV4a3NvS0RJT0QzU2NXV1ZqaUQ3eVBx?=
 =?utf-8?B?NStEaS9XUUxTQ1N4bHJQUU5DOUNnQ2lnVy9nMzQ2VUt0cUhGN3NVZ1lqTW9l?=
 =?utf-8?B?Z1pSeDNETnhHYTVFbEgyOXpEaDhNTVBSdXFGNUdnQjlrb1J2a1BJZUpZSmtD?=
 =?utf-8?B?Z2NOaCtFNjFMaXBldFRnamtxMGFqTlM1S2hMNUlxMDZ3WWZCL3ZiR1NTR3Bj?=
 =?utf-8?B?QVdMYUJsSzFWek9oU2dML3poa0l6WTAzdkFPREk4cnI3UWxVNzVPZEpmWE9M?=
 =?utf-8?B?cDM3eXhES3czTzNWMjhsQzhWd1E3OHk2WW1aaGtQNkRaTEpSaHEzcitxcUZq?=
 =?utf-8?B?eWJydWFEME13VnMyTmRTd1lZcjhIVkN0SjZyR3ZycWF1OVFHczg3aG8vY2h2?=
 =?utf-8?B?NVVoQlFjeHJnUU4wejE0TTFJdU50bDhJaDBVSkJIRXpzdzRwdUNELzk3SDVm?=
 =?utf-8?B?bU1ySld4RDhiYkltL0JhejNlL1pESTlnV2JDTDF0d2lJZWtYWjVvQUgrS0lG?=
 =?utf-8?B?OEF6TXgyemlCcXQrMDVMMkxoQSt2Sm1MY2szVHVlQWZyUWxnRlNmR3lKUlNX?=
 =?utf-8?B?NkRGamZDVzUrZjRDTEpJR1JRY2s2d0hpV0FvN09DN1V2bXA0SEFnRWZvY2Vv?=
 =?utf-8?B?NmtPR2VCcGRXSUdXSk5IREF5WDdVc0tTbjQxZmNPcUVFMW12clUrZ0h1TG1C?=
 =?utf-8?B?TUVVTHVadkVUYy9FTVI5RTUxMUp2ZFhqNFBEMmxhelZDRmRjM0NLUWRTSUZs?=
 =?utf-8?Q?wXLHNGbwIS2apRROO0t2gIbvd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e9fa59-024d-4463-1fc2-08dcf77071b6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:49:09.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyT1OnYhZfMMq2pTpPE1z5pKkQ/GN7mhtOT92tC0ZU+goDXrGLaWeItnDLMGtp2/Fbo7TnKMjm/gyf07dXTruQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6692

On 10/28/2024 02:04, Shyam Sundar S K wrote:
> AMD's 1Ah family 70h model uses a different S2D (Spill to DRAM) message
> ID. Update the driver with this information.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/mp1_stb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 1501793b9281..917c111b31c9 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -251,7 +251,10 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		dev->stb_arg.s2d_msg_id = 0xDE;
> +		if (boot_cpu_data.x86_model == 0x70)
> +			dev->stb_arg.s2d_msg_id = 0xF1;
> +		else
> +			dev->stb_arg.s2d_msg_id = 0xDE;

See my comments on patch 7.  If you agree with those, then this should 
be reswizzled too.

>   		break;
>   	default:
>   		return false;

