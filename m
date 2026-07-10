Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012048.outbound.protection.outlook.com [40.93.195.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDBF37EFE6
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710464; cv=fail; b=vEoeCHR3PpgBzC8iApv0ozVshFTc2nLaWmHZ+26w2OEDyTIo8EROz3mVzQ3mJ50DRgwlgz10pSmZpgfjRZ9RimTMorAKm2167I31gtKl/aHZs+DJyxrKOW8x644tQL0r+mnsGwBOwCLBjQqR26fR1Wcik00iPZNmF89p7P/c524=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710464; c=relaxed/simple;
	bh=SbuenL12YjhYvdUKLrrPUp6uVONzUA88+p+5AkAbttk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BG8HUGW4hv9O2qv+kfJWu7yaJ/J0F3vyUPonJU6PeTXVQcJeX11JynfpCo8roF7sEKLlVIa1abliymVFH7YDayyFm/P/TuQ502TMN0Z4G555iz7H8BHfcuvb7fHD88esLJa33Jy6LAINfksRzRySBmHaW4rCVLKAZ+XEddxtV+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=13vKFF8l; arc=fail smtp.client-ip=40.93.195.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="13vKFF8l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4+VWhHYpkOCXNLWSl1EHH1npawoDF10RjkYhoN8gvM1iS8fwrQEY7hZzV4Lj8sg0Nkx5v500tTx3ECKYo27k+sLh1LVLUTIAoObE1rmIW4c2VV1ydJr5As/ZIPiq6ncCtkwfH7UcApcLwGXob7VAlMuQzLuH6dPdgnudP3/tGWrsLFjGbl8xV097jzKXPo/rj4nJhyln6tQ9DR6aSiDZsCLk3ExhWHz/bqNWcBYhEhDdsWbKkCxb1yQCEbu0djn873rVYkqvHost7n4vhph88Gu9x9bC7biSYZxs72Qr7rSu8mwluG/rSfaHI24EZiIQhVAr/h/Jvg05KgBSPa7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSo1WQA3NpE1Vz6nphFIzHG2KPfj9pvsbsxYtbeGdeg=;
 b=RdUAG8VxQ5h0Rvt9grNTLlq4wzXvH8F1Dc1muOwlIDLwVE5wKJZMAv0pqM88jTzxVPjYpj2DZovB0eL/2XRx54KsC0eTAH+0gUUPR0kSFVYx3wsco4sVNHhqNnx+fzkl7cmazv2FeRwfVh2YwwPD31wga2T+aylTfpNXacEJC4l0AlHlW/AT3+M5nh/UUaZ9Ys0tHNilcMqPAzaXSkRLSO4LkkYdH1CEV6+79jzKLftoBFJuWPFkbK29kjyxqaLfPwANrm+k5a/IlpSV1anGUV0GZzG6OhUfX7RjcoDfKfWX/3aI4U50vInqDkdRlHctexd/QGDHREutNFc2wRbq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSo1WQA3NpE1Vz6nphFIzHG2KPfj9pvsbsxYtbeGdeg=;
 b=13vKFF8le1TNEMP5c5Rl3vQwsJk7qNxDwnF+SRCLP4kFVuKma/9Z07HbeYzAoRwGCjJrkqsJhrYVqc4zDy/KcGgHD/QKFQgTLYXXyECecNBWwyA4LIFxZuGkeEpVPWV1JrWpeUJHR7rWOak27tb7JKvBqe2ooWACf9roQGFnaq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 19:07:36 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 19:07:35 +0000
Message-ID: <4d1e4f30-6957-45c2-b477-26a637c09ddd@amd.com>
Date: Fri, 10 Jul 2026 14:07:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] platform/x86/amd/pmf: Use per-SoC smu_regs struct for
 SMU mailbox registers
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
 <20260710174219.2522269-2-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260710174219.2522269-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:408:f8::32) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 901c9583-b2cd-4224-5fb4-08dedeb6802c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|4143699003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KT1CYtQ7HHYUXS0bKaz7+sXWTozqfOpy0SiF22AhDBERLvcv53Wsa6nkPzy8/xdXbprSPnx5Q5zdXu7SRS90o+Ii2V1eKSw2buqLe/GRvsaPKrEszD43cTCzEJDhKwoq2aaj4F2B4AdlM0MIoTVbT7TnQfYhItw+7i93Zo2O3GW5AozdhQYKJzOzapL2xzIW1QPZtekDtzgFPmRnlZmaJ0gRZWA5NSJkbLH+83xIFzFeGOOLa2CTsdoXCA9Y1bw2OIJj+6CgYYFbC2db7lqofjYQ4wdlXHLEZbymZNu/y05ZrfVUWimRD2Iir6z0VMxwrtZ8N+sizN3WMVHIJfd/ct9NfhSzkfqBajUOCMwpSCPGszXc1IN/HXfS0WqsP1zqrWh8PKVQ9H9mXhyTHAPaBfALleWAGZGiyhTmX2diCAYqym7JgeugRPazQhfXSZt4Vx0g49+jFkFxj/qUE+YJJ/v7wFMTZGcuyMK6YNhfpsmmDexuM9l+BjfGu49fXNWf292Rl0RXpWviGc9QEmkSbD7CNGRsIL5Ws7vZ+FQrklW7MI6y63eNXbJZzAwdHRK9G+bWrhculmMea9V8873s9LPDAFIxW+mRhJfef0jpJZKCcLwLx2U3KNn6wxZt1of59IPjSu5Tg/MZhZEL3ydH3kdAUtpc7QB+qIorCXVA/hM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(4143699003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFByS0F5VWE5UW9LUDZQS0tPa3lFdm95aUN2WG1EMHIxNCtSU3FGTkJMZ3lz?=
 =?utf-8?B?bGZ0RnJBWlc1SVdoeklJWmdycU41WjAvdXd2cXBFekdUcm13L3NjcUdjRVJV?=
 =?utf-8?B?WUFqZlJ2SlNac09VY3ppVlg1SDdNWlQyWS9PNzhuSEsvbDZlOXRRclNWNkRB?=
 =?utf-8?B?UC9GaG1xYVNFMGNNYTBjdmlSTkkvN2kyQmhTWDVvUGIyV0JiL2VwMUVKMVIx?=
 =?utf-8?B?aWNNL2hZVGtnSG9RWGsrRW5oQ01qVk5PaGZNNm9RQ3Ryb2p3UjFNUEZwTms0?=
 =?utf-8?B?V2VLSHp3dEpCZjRWUUFBL3IxTWo4aU1YTjlSWW5TUUhDaGJCV1BvWThVR1M5?=
 =?utf-8?B?WExrbERLeXU1TXRXdVgrUmI5OHA3SUFFN0NJQUlCVkJnQzBYWWdVZnRjRzJM?=
 =?utf-8?B?M1p5N1hWZ3lUZCtDaFp0ZTM1VDlwNHBVemtJdFJvVFBYdHV0enhmdXljdWZL?=
 =?utf-8?B?ZGRjSnNESlZ6Y2FVQUMwZUdDSzVoaTIzQWhNK0dHNm0zWEJwdzZrbjcvWnhH?=
 =?utf-8?B?Z0huREY4dUlGd0hRRUtpMkU3Wmp1TTFVY0Z4WXMzam9BZUpBNUEwaldUdmp1?=
 =?utf-8?B?VTRmWWNERVB5by9sdmc1ang3NlR5aTBNS3BCbkNTdlFuaG5nbHpXeFJmVlZo?=
 =?utf-8?B?ZXZqSjNRT1VhU3VZWXpSVnNsZ0hyWSt5UlpJeTBhVVJLSTJUR2o3OXB0VVEw?=
 =?utf-8?B?bEljL2VSVTlZT09CcWFndVAzWVUyUUZ4bi9BNUdoSElya2t2WVdXb1ZIekUz?=
 =?utf-8?B?emVVUDNYNU9GcC90T0V5OWRjQTRzT01seDRHL2tGdklvcXRhaFBOUXhZV1p2?=
 =?utf-8?B?dXFrM0g0QTgwMW9SUG9SRFFuZndGbUUvK2l4MnhFUXUzeXhRVmVZNmU3cWxM?=
 =?utf-8?B?QkdnbWdnci9YVTFVUFRxWGFsV1NSWCtBc1F4ZDFxanUxZld1RHdnc08zZnRv?=
 =?utf-8?B?UEl5QnAzbWp2eTFnZXNmSVRoSjBZeWsycGJjSC9qZGhleVE4ZWxRVk1GWGda?=
 =?utf-8?B?VHhlZ01tcjhPRlVJQkJtYXdkT1lGeXNwWWxRaCtMYVZaVWZoRG1GNmpXS1dZ?=
 =?utf-8?B?ank1NzQrMVF3alRQSzdMYXlWa1pZT2tRZGdRQzZBSUNuTlU0M1p2bDdpaWpJ?=
 =?utf-8?B?MmhZVTRSci9JK0dQQnlGdEx1TkRjb284am56Q0FvbXdhVDltd002Ni9vQ1Ri?=
 =?utf-8?B?NkZKdllLRENUc014MDdiL1dZd3lKeCt3M2c2ODh0UUx4U0dCOGlxNm96RWFQ?=
 =?utf-8?B?MW42SXFhN1NaWlJlc3oxUjhDNUEzejlIbmJpZVJMSGhTWGRMQnc4NWlSanM0?=
 =?utf-8?B?MW1aUnpSSnd4SjRrRGk1RFpxUlRTdGJMKzFRZklKa0lTOW9jdVZvODdtZGxv?=
 =?utf-8?B?U2tKanlBb1BFTlE2WkdHa00rMWRoQjliaC9uOGgvOW5WM1NRODVCQ29aWGhl?=
 =?utf-8?B?S2Y3c3diUjBXblJRYTRtZldvRmVobWtoQVNQZzQ0ZmFpd2tvaGlGbUllVE5B?=
 =?utf-8?B?OUZIQ3QvOTY5NHhkRCtqUjFNYXEvd2EwYy9RMWRKeGxlMU44ckxQVXl2a3NJ?=
 =?utf-8?B?NXZmMk5ZSWsramJ0RkhSd2tWcVcvQ3JpTXVrYWpTZGI2d1htMUxlTkV5Rk9v?=
 =?utf-8?B?MzFZKzgzamZPNGVCMllUMWNnRjJwdCttTnl1WEhnL3JwWW45aFBFUWo4aThu?=
 =?utf-8?B?ZDVRREhoVkgvdDZvUVRoOUwyazBtN2c0WnFvajBrNDRlbVVaL1JMTHdaeith?=
 =?utf-8?B?MkNuTUMreGthS0Fxcm16YzBWUk56TmpGN0NieDNoeFBOSTkrVUttekEraG9h?=
 =?utf-8?B?YUZ4NENYWjhwMG9HNzArMXhmZ2UvUjB1K2hjSThSTG5hTllmSCtNNGFjYStr?=
 =?utf-8?B?Wk9OM3h1SEJ2N3JTWVp1THdxMDd6ak9pQ3loelRvQzgzekFXVG5jS1pzSFc5?=
 =?utf-8?B?alRBSUlwb1BVcVE3SndGM1NlQUd3RUhqMEZKNmQycGcyT2dyZ0xVcFk5WElz?=
 =?utf-8?B?SXZHcmprclVlMFBUdngyTm4xQWdUenFFSVFlcTVtVVpTdW01L3JtajIvYVlJ?=
 =?utf-8?B?U08zcnVzeUZYckRkQWxCTG01eCtSM3l6U1NVZkpSQmxmWUx0MWh4NUd4Y2ZW?=
 =?utf-8?B?ZWxPb2xFWE04MlMrZTFhU3JLYlRqNFlPWm1aajBPeE1heEI2aTBqOGt4SFht?=
 =?utf-8?B?TEN5TWhkTlJsU0VmenFPaHFMT0FwNEZzbjBkSkE1WjZMS2V4WThxQnlZeEVB?=
 =?utf-8?B?VmZZYnNpRmZDWENIMjZUWElBRzFmMlNma1NtcXpiK3BnUUs1TDA2bFp2T0RK?=
 =?utf-8?Q?4bu/UzObXYlPMwkn/a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901c9583-b2cd-4224-5fb4-08dedeb6802c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:07:35.3273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 806EuCZOWICU208eZNdMr659oIGu17c4sfVrraMuPCKDKYLLF0hHaozEXGGGdvjQg6oHbPyEHbp3btJKPB8Oxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861



On 7/10/26 12:42, Shyam Sundar S K wrote:
> Different AMD platforms use varying SMU register layouts for PMF-SMU
> mailbox communication. The register offsets are currently hardcoded as
> AMD_PMF_REGISTER_MESSAGE, AMD_PMF_REGISTER_RESPONSE and
> AMD_PMF_REGISTER_ARGUMENT directly in amd_pmf_send_cmd() and
> amd_pmf_dump_registers(), making it difficult to support platforms that
> use a different mailbox register layout without scattering per-platform
> conditionals across the send path.
> 
> Introduce struct amd_pmf_smu_regs to capture the SoC-specific SMU
> mailbox register offsets (msg_reg, resp_reg, arg_reg[]) and add a
> pointer to it in struct amd_pmf_dev. RMB, PS, 1AH_M20H and 1AH_M60H
> all share the same legacy register layout and point to a single shared
> amd_pmf_legacy_smu_regs instance, avoiding redundant struct definitions.
> 
> Convert the pmf_pci_ids[] table from PCI_DEVICE() to PCI_DEVICE_DATA(),
> embedding the smu_regs pointer directly as driver_data. Introduce
> amd_pmf_get_smu_mb_offset() which resolves the matching PCI entry via
> pci_match_id() at probe time and assigns driver_data to dev->smu_regs.
> 
> Update all SMU register accesses in amd_pmf_send_cmd() and
> amd_pmf_dump_registers() to go through dev->smu_regs. Remove the
> hardcoded register offset references from the send path. New platform
> support requires only a new smu_regs instance and a corresponding
> PCI_DEVICE_DATA() entry.
> 
> No functional changes for existing platforms.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/core.c | 51 +++++++++++++++++++++--------
>   drivers/platform/x86/amd/pmf/pmf.h  | 12 +++++++
>   2 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 58d86b4c2828..1826fc64bf56 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -176,13 +176,13 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
>   {
>   	u32 value;
>   
> -	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_RESPONSE);
> +	value = amd_pmf_reg_read(dev, dev->smu_regs->resp_reg);
>   	dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
>   
> -	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
> +	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
>   	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
>   
> -	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_MESSAGE);
> +	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
>   	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
>   }
>   
> @@ -208,7 +208,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>   	guard(mutex)(&dev->lock);
>   
>   	/* Wait until we get a valid response */
> -	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
> +	rc = readx_poll_timeout(ioread32, dev->regbase + dev->smu_regs->resp_reg,
>   				val, val != 0, PMF_MSG_DELAY_MIN_US,
>   				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>   	if (rc) {
> @@ -217,16 +217,16 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>   	}
>   
>   	/* Write zero to response register */
> -	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_RESPONSE, 0);
> +	amd_pmf_reg_write(dev, dev->smu_regs->resp_reg, 0);
>   
>   	/* Write argument into argument register */
> -	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_ARGUMENT, arg);
> +	amd_pmf_reg_write(dev, dev->smu_regs->arg_reg, arg);
>   
>   	/* Write message ID to message ID register */
> -	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_MESSAGE, message);
> +	amd_pmf_reg_write(dev, dev->smu_regs->msg_reg, message);
>   
>   	/* Wait until we get a valid response */
> -	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
> +	rc = readx_poll_timeout(ioread32, dev->regbase + dev->smu_regs->resp_reg,
>   				val, val != 0, PMF_MSG_DELAY_MIN_US,
>   				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>   	if (rc) {
> @@ -239,7 +239,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>   		if (get) {
>   			/* PMFW may take longer time to return back the data */
>   			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
> -			*data = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
> +			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
>   		}
>   		break;
>   	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
> @@ -262,11 +262,18 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>   	return rc;
>   }
>   
> +/* RMB, PS, 1AH_M20H and 1AH_M60H share the same legacy SMU mailbox registers */
> +static const struct amd_pmf_smu_regs amd_pmf_legacy_smu_regs = {
> +	.msg_reg	= AMD_PMF_REGISTER_MESSAGE,
> +	.resp_reg	= AMD_PMF_REGISTER_RESPONSE,
> +	.arg_reg	= AMD_PMF_REGISTER_ARGUMENT,
> +};
> +
>   static const struct pci_device_id pmf_pci_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RMB,    &amd_pmf_legacy_smu_regs) },
> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS,     &amd_pmf_legacy_smu_regs) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, &amd_pmf_legacy_smu_regs) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, &amd_pmf_legacy_smu_regs) },

I don't feel super strongly about this, but I generally feel that the 
word 'legacy' ages poorly.  How about a 'v1', 'v2', etc layout?

>   	{ }
>   };
>   
> @@ -536,6 +543,19 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>   	}
>   }
>   
> +static int amd_pmf_get_smu_mb_offset(struct amd_pmf_dev *pdev, struct pci_dev *rdev)
> +{
> +	const struct pci_device_id *id;
> +
> +	id = pci_match_id(pmf_pci_ids, rdev);
> +	if (!id)
> +		return -ENODEV;
> +
> +	pdev->smu_regs = (const struct amd_pmf_smu_regs *)id->driver_data;
> +
> +	return 0;
> +}
> +
>   static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>   	{"AMDI0100", 0x100},
>   	{"AMDI0102", 0},
> @@ -624,6 +644,11 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> +	/* Populate smu_regs with SoC-specific SMU mailbox register offsets */
> +	err = amd_pmf_get_smu_mb_offset(dev, rdev);
> +	if (err)
> +		return err;
> +
>   	apmf_acpi_init(dev);
>   	platform_set_drvdata(pdev, dev);
>   	amd_pmf_dbgfs_register(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 752fa5dd2267..7a8fd9d399de 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -29,6 +29,10 @@
>   #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
>   #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>   
> +/* Aliases required by PCI_DEVICE_DATA() macro naming convention */
> +#define PCI_DEVICE_ID_AMD_CPU_ID_RMB	AMD_CPU_ID_RMB
> +#define PCI_DEVICE_ID_AMD_CPU_ID_PS	AMD_CPU_ID_PS
> +
>   struct cookie_header {
>   	u32 sign;
>   	u32 length;
> @@ -392,6 +396,13 @@ struct pmf_cbi_ring_buffer {
>   	int tail;
>   };
>   
> +/* SoC-specific SMU mailbox register offsets */
> +struct amd_pmf_smu_regs {
> +	u32 msg_reg;
> +	u32 resp_reg;
> +	u32 arg_reg;
> +};
> +
>   struct amd_pmf_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> @@ -444,6 +455,7 @@ struct amd_pmf_dev {
>   	struct mutex cbi_mutex;		     /* Protects ring buffer access */
>   	struct mutex metrics_mutex;
>   	u32 bios_output[BIOS_OUTPUT_MAX];
> +	const struct amd_pmf_smu_regs *smu_regs;
>   };
>   
>   struct apmf_sps_prop_granular_v2 {

