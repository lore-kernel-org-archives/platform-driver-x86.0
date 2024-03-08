Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07A25CDF7
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Mar 2024 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709929310; cv=fail; b=NuLSs2vMNc4iFrcr0tsMNEn3WMcRR91fMbdpV0L/XxCbBCJtcyOpYQhl6E2yc8lJ8GfZnJ2ejFmwQNgW+DDo3DqcX3Td+sRf7szcm+GXUqEQKvURW4RwnvkSfroADQXg80lVuQv9wEqF7ud24Wb1OctYCnw20RNJ0eZotGTFOkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709929310; c=relaxed/simple;
	bh=z9STvCBs84ag5fqlr6iMM2q6tZDjr39oj7Dat76MFkU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fgMxSBCck6IfOG4QMCm1IRzBoTs5AmTSFmvCu9OHPGjjZHJn4U7RHdeeFraKo1IUGiH3sFiIR3aFXXkc84C0K+RM+WLGSL4kvE7kRyhmnJ431bXFjSdsmyLs8BzbwNTCoZWtg2B5o0KocdGErLProSJpyg10PfnjsOfYj9pnAB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YsbczRbN; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YsbczRbN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ0FUKSbyZJE4a3rE8Ak3yI8wtSe/7fsEQlCD5z86J5bwmt+hEl6u/pxUeTPVHRjffB8G/9Y0IC17q9CISJkumQvccY5cdV6KdQsYvzKUur9IC2UDrpEXDyW0AdVtMrX/bzFt1xqZ7+YJnynZfX/ut6vY6orVY2kUtrYSiE4dbYOFNkMROU/dLpmpEHyhjmfSaeBDw3gLYgjL5XdbOt6QfsCM0SNIK9CV65ibENry39xAV15Fh+kElXusbmfkj5Lqgfz+axtTm3WlG6QuIdsHRsNH8uJW38cNFYWH6YmuFxdR5TExL1URxns71SFfMYpXEgG0i/9gPUPudb4j2gZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9aiLyqJr/MBYv/1cSTAkBMGyxc5FE9ahyya5iz0q3E=;
 b=etgySxY4a627JQDAI184L3w3tW10DErGgaeNoyh9RLAiz1PfkLrfLEMi3Z/lPkUgOSnONGy7Z3yrKKcSnPn7WNBYJqI7JUwFHG7Bokx+p9WLzxZ3HFqUgRhS9MD5w/1zmvVpSe5crytyDwSq7SLwTcmZ6iQhvcBG1+uTLxUL5G6z0sgfGHBNx3v51FWcoomArr07jAJ+n58NGF+IEOMJRIN5bv5zZ25aoDnsKlPuHiDqqs+rpUt5nNLeJ2J+SQuIpjQjXcnoB5SxDGXk8BOZ+HEUC14YIedBsc4Rn1KV4DbcrO1JWPeukHnNZ3jWF5G2gTM+0pZ0fovVW+HNQFLXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9aiLyqJr/MBYv/1cSTAkBMGyxc5FE9ahyya5iz0q3E=;
 b=YsbczRbNdOunx/mednmE5Hp7617vn0zepZCj/MTEUsG6TWDDQ9M8mqnJKuwT/lJ1XIei7qWnX7sfx0+a+lJ0sgsI7h2xHqUUHTucPc8/dH9Vf8icEekwrCOqx0TFlXu7YdAiZgaVvzcDpBaYXXnqyZ1Q99KNdk9QFfCO4pInTOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 20:21:36 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 20:21:36 +0000
Message-ID: <ba55cb1c-c483-4882-adb6-ce074646bca6@amd.com>
Date: Fri, 8 Mar 2024 14:21:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/amd/pmc: Add AMD MP2 STB functionality
Content-Language: en-US
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam-sundar.S-k@amd.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 sathyanarayanan.kuppuswamy@linux.intel.com,
 platform-driver-x86@vger.kernel.org
References: <20240304064147.2586158-1-Basavaraj.Natikar@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240304064147.2586158-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:806:130::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb4cd00-ce4c-4998-cb5a-08dc3fad5acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+c7/HyalyI5z/8GLDDUkSn3sd16rtEFRTnPd99dgJ0tk7ZWwP9hqo9mE7vyZZo9uhIMMsjCpl7ExkrdA2oyngbV4WiSYZfp2rOvq+/VPHTICbNTnFfCq6gBQ0VncQP0/+HjqhctvYk9vQDo4xJC/oy8ypxDxl1HaL70C14DhdrO3DaiNRPi/Eej5MxdlWUONycnCgaZvmFOSUNC5koSYPSR0j1LdRZU4vc8/c16dJjoxyevRP898Oxv9DQiVltsABRnkwk2m2B+rojifzDQz98ADodfKV0tdDY8+LKAEcDhFyTXZRaz7YGfCFGjP+hfUduCWz0h6ez038jZHqQsa6mmuLTx3Jk+qoDDyp6iHQOoZYVnpd5PdmRzytjozaMPl0fRpSacavQOpOcB6Sc6moIixBJcuW6c1iC7o107zPbwNPY6Es1mml2WITCdNZhDPsr1NmJTXu70CxDSoY91zY0zjxDkqOtLpdZOC9MaXtAHldOVxNrPMUovDavqYqmI6Vx3S9MAsECPjPah5i5Ssns9nG7immiZMaPJ6TrP+D9eO4MtVuecHhJWavj3dAxtv48jezqkR1zoTg3+acPbkrkrdfCTeCNWpfLJFK3ea68XNW8z/4h+Pg0z8WKuSysIzEn3nnF1MDVVdcwO6W+WOEElTl9tPUr5o+areHCjmND8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3VnSTZ0MkJPNXZ6RlVFTGFhU3Znd0g3V0RoODRGS3JMOC9uZk1yZ044Ny9v?=
 =?utf-8?B?ZDhIYXo4Vi96c1E3ZHp1UDlEbmpmV2lJc0lPWURnMjZzc0V6V2xZdWVIdFIw?=
 =?utf-8?B?SVBYRENjYzVDU21TMFM1aFN2a0w2RmdzalVQU09nekQ0ajFaMWJGTGJMMGNP?=
 =?utf-8?B?eHJjMFRVOWw0UFpHQy9Gc1I5K1BJOXNKUGp6MmFoOXFEMkxpMkt2SjZTVXlR?=
 =?utf-8?B?cWV1UFR2alJNREdPVGRuK3BHRG4vTGU3Vi9jcTZ1QU5RaTkrVytKVktoZEEw?=
 =?utf-8?B?Nk5aRjdlMGRGeG03K0wraW9QRnU4ZFpVQjU5clBJVXJWQmhLTFFKTlVLdlFJ?=
 =?utf-8?B?VkxjL1BrbDBJcUNBVWNFMUlNQTdlMjduZ1I4enNsVDZPM0lSczFrbmZwQjND?=
 =?utf-8?B?ZTFVT2NxZHo4dXR4ajYzNmNuL3VSM1JZVTBDRXNZUWpSMFlHSWhZazQ0R1NB?=
 =?utf-8?B?YjBGNGVUWGI3VkRVT3d5SG5rOTVaVkdVYXZYU3lYdWd4T0tOWnpuaWNRY0JW?=
 =?utf-8?B?Q0ZBQ0Iyc3pmRXpBWjZpV2E3cURTSG9GTjdMdnJIYnFlaWFLaUx4aDZXZWNx?=
 =?utf-8?B?Q05xYUxnVmM3YU5BSkFYdndZYWRvYlB3ZGhDbktXV083clBtVHB3Q2lwb000?=
 =?utf-8?B?RDVpcVlXMnkycDJNanE2bVB0NnVuZ1UrUXBDYXc2bHpKUEpRbDJwb1dtVmdn?=
 =?utf-8?B?QUE2bmpXYW1pclJ1Y2lqUnlEa2pPSkovRWUrU0VodFVjaEFrZVBOaXl0NjE4?=
 =?utf-8?B?S0huMFF0cWEralMwTUg5MS85VXMrUWFjcCtHSUd1Q2pMS0pFQkhkMHhLckZQ?=
 =?utf-8?B?YXViUXQ5Rjk1T1RQQmlmaVJCbzJnM2RLQzQvaXpFNDM3MThNT0twK0lIY05Y?=
 =?utf-8?B?MXVoNTFxU2ZqWEpOQnBidDFQSG9MR0hna1ZHZWQrR1k2cTR5Zzc5V29nUW8r?=
 =?utf-8?B?M3RJTStYRFFtaVlUa3ZaNVJFdnNpWmx0R3AyZE9HY3o5VUdTT3h4cTd4akND?=
 =?utf-8?B?Q1ptM3czT2FJdFZuczZIYXhtSk9Rc2tNeW9PeHBBRUpIQjg3MWZFSThKblBu?=
 =?utf-8?B?bnQ2YjZodi8ySko4QVhDc1h1WnZFUEZVSzl1dkt4Vzcyc3d0V3VmUDA3dkZM?=
 =?utf-8?B?OENoSlF4bys0ZDJsN1d5aDJGZkppOXVZcU1pWnVFYmNUbkJRQUovc3E2c3NR?=
 =?utf-8?B?Z3lxS0JtWjhmWDBJRjVJRFg4Q1B5YWd4azFSU1RZbWdHei9kN1hkV2lLUEtp?=
 =?utf-8?B?Y0l4UGtXaGw0VnNmbGdBektycGhONWwyNk5OVkNYUnlQRGhtMDZySTJBbFdm?=
 =?utf-8?B?aXFYSTBBVjQzeWpWVTRJcU1Tc1dPcTVjNHVPRVAvSXhsN1AxWlA4Unp2Q0ZB?=
 =?utf-8?B?RFFOQkxTeVBiQlNlc1pUK2o4TzFkZE9McWV0VGhQMHJvSm9mZVZUNzF4aktq?=
 =?utf-8?B?bUFES2FDa1lkenZyeDY2cU9vN1RVaHc5aXlKV1k5VVJ0U2tZdWROZG9Lczhj?=
 =?utf-8?B?dklJUzBaRzRxRkZEMTNGS3pNN0RybUxKNUNBQ1UySzZRaVQxeE15emdBODZE?=
 =?utf-8?B?QVcwNDhxbldMOGszYXkxVmpnYnh4eEtuYUtXdUdXOHJKbU5KQURVN201Qklq?=
 =?utf-8?B?VW9uYkJ6YXJrditkZ2ZVNjhKQXUra01xNEE0SUJlS2M3N0lJTVJkSndJWXJ0?=
 =?utf-8?B?WS90cU9neHlwQWtBY0hBcHI4a2JhTW9Ka1cxRmkwL1BHeE43UjBla2x1Qjdq?=
 =?utf-8?B?R3p0YkxmRk03SVVURFRQVkQvdVZieWpBMlFXTWppMGliUjZSR2hEYXg5djRx?=
 =?utf-8?B?RGcwZEJrSkFVZVFhYXY4M0ZhOGtWZ1owS2I3U012TlRVelB6dzhzd3JGOW82?=
 =?utf-8?B?TmpyZzlBZDluSDdseWZGQXJJWm9wTjlSc3lNb2g3NzZBYkg4RnEyZUtvZ3hQ?=
 =?utf-8?B?dVdvaWdDS2s5eGVrZk5zdVFNYWMxMmRSc1FYV1ZvRWY3eitibndZeEk4Y0Rl?=
 =?utf-8?B?YWtBMUcvMFpqcGIwalpzUitCNVlYTmF4VUd6aXBCNmFiT3BINXNYdWFHaFd3?=
 =?utf-8?B?Q1pWUnBzdVVSc1dna1FuK2ROZktCa0xadVoyZzMyVnRyU3o3SUVCbEVlenF1?=
 =?utf-8?Q?oGkT61h5ftKzRJgDmcT42/E8U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb4cd00-ce4c-4998-cb5a-08dc3fad5acf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 20:21:36.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5++YC+age/wR8FTdAYcdWa3GoEMKz2PshTCNdKottpdC7uvQ4U2fPlztNaxv7U75Pl6Zr7I6sPXS14PyVYWtZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306

On 3/4/2024 00:41, Basavaraj Natikar wrote:
> AMD MP2 STB function provides a data buffer used to log debug information
> about the system execution during S2Idle suspend/resume.
> 
> A data buffer known as the STB (Smart Trace Buffer) is a circular buffer
> which is a low-level log to assist in debugging by providing insights
> into any potential hangs or stalls that may occur during the S2Idle
> suspend/resume processes.
> 
> The current PMC driver retrieves STB data from MP1, but there can be
> scenarios where MP1 might hang or become unresponsive, leading to the
> loss of critical data present in the STB buffer. This defeats the purpose
> of the STB buffer, which was originally meant to help identify system
> failures.
> 
> This feature creates stb_read_previous_boot debugfs allows users to
> retrieve the STB log from MP2 specifically from the last occurrence of
> the S2Idle suspend/resume. A userspace daemon can access STB log of last
> S2Idle suspend/resume which can help to troubleshoot potential issues
> related to hangs or stalls during the S2Idle suspend/resume sequence.
> 
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
> Changes in v3:
> 	- Changed an error path for deinitialization or freeing resources.
> 	- Modified the macro and variable to have a more specific name.
> 	- Included header files for USEC_PER_MSEC, writeq, and writel.
> 	- Switched the data type of the 'len' variable from 'int' to
> 	  'unsigned int'.
> 	- Used one variable for return values.
> 
> Changes in v2:
> 	- Used linux/sizes.h instead of defining KB.
> 	- Defined timeout containing unit as per USEC_PER_MSEC.
> 	- Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
> 	- Changed string stb to STB in log messages.
> 	- Defined literals using Macro.
> 
>   drivers/platform/x86/amd/pmc/Kconfig   |  23 +++
>   drivers/platform/x86/amd/pmc/Makefile  |   1 +
>   drivers/platform/x86/amd/pmc/mp2_stb.c | 260 +++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmc/pmc.c     |   4 +
>   drivers/platform/x86/amd/pmc/pmc.h     |  14 ++
>   5 files changed, 302 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c
> 
> diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
> index 883c0a95ac0c..8177486babf9 100644
> --- a/drivers/platform/x86/amd/pmc/Kconfig
> +++ b/drivers/platform/x86/amd/pmc/Kconfig
> @@ -18,3 +18,26 @@ config AMD_PMC
>   
>   	  If you choose to compile this driver as a module the module will be
>   	  called amd-pmc.
> +
> +config AMD_MP2_STB
> +	bool "AMD SoC MP2 STB function"
> +	depends on AMD_PMC

What do you think about adding:
	default AMD_PMC

Then this will be essentially opt out and any distros that enable 
AMD_PMC by default will also start enabling this without extra prodding.

> +	help
> +	  AMD MP2 STB function provides a data buffer used to log debug
> +	  information about the system execution during S2Idle suspend/resume.
> +	  A data buffer known as the STB (Smart Trace Buffer) is a circular
> +	  buffer which is a low-level log for the SoC which is used to debug
> +	  any hangs/stalls during S2Idle suspend/resume.
> +
> +	  The current PMC driver retrieves STB data from MP1, but there can be
> +	  scenarios where MP1 might hang or become unresponsive, leading to the
> +	  loss of critical data present in the STB buffer. This defeats the
> +	  purpose of the STB buffer, which was originally meant to help identify
> +	  system failures.
> +
> +	  Creates stb_read_previous_boot debugfs to get STB, a userspace daemon
> +	  can access STB log of last S2Idle suspend/resume which can help to
> +	  debug if hangs/stalls during S2Idle suspend/resume
> +
> +	  Say Y or N here if you have a notebook powered by AMD RYZEN CPU/APU
> +	  and supports MP2 STB.

This last sentence reads as a confusing statement.  I would just drop it.

> diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
> index 4aaa29d351c9..f1d9ab19d24c 100644
> --- a/drivers/platform/x86/amd/pmc/Makefile
> +++ b/drivers/platform/x86/amd/pmc/Makefile
> @@ -6,3 +6,4 @@
>   
>   amd-pmc-objs := pmc.o pmc-quirks.o
>   obj-$(CONFIG_AMD_PMC) += amd-pmc.o
> +amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
> diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
> new file mode 100644
> index 000000000000..4acea31daaaa
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD MP2 STB layer
> + *
> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/pci.h>
> +#include <linux/sizes.h>
> +#include <linux/time.h>
> +
> +#include "pmc.h"
> +
> +#define VALID_MSG 0xA
> +#define VALID_RESPONSE 2
> +
> +#define AMD_C2P_MSG0 0x10500
> +#define AMD_C2P_MSG1 0x10504
> +#define AMD_P2C_MSG0 0x10680
> +#define AMD_P2C_MSG1 0x10684
> +
> +#define MP2_RESP_SLEEP_US 500
> +#define MP2_RESP_TIMEOUT_US (1600 * USEC_PER_MSEC)
> +
> +#define MP2_STB_DATA_LEN_2KB 1
> +#define MP2_STB_DATA_LEN_16KB 4
> +
> +static struct amd_mp2_dev *mp2;

Do you really need a global variable?  I would think this can all be 
children of the amd_pmc dev and you can pass pointers and references to 
that around instead.

> +
> +struct mp2_cmd_base {
> +	union {
> +		u32 ul;
> +		struct {
> +			u32 cmd_id : 4;
> +			u32 intr_disable : 1;
> +			u32 is_dma_used : 1;
> +			u32 rsvd : 26;
> +		} cmd;
> +	};
> +};
> +
> +struct mp2_cmd_response {
> +	union {
> +		u32 resp;
> +		struct {
> +			u32 cmd_id : 4;
> +			u32 status : 4;
> +			u32 response : 4;
> +			u32 rsvd2 : 20;
> +		} response;
> +	};
> +};
> +
> +struct mp2_stb_data_valid {
> +	union {
> +		u32 data_valid;
> +		struct {
> +			u32 valid : 16;
> +			u32 length : 16;
> +		} val;
> +	};
> +};
> +
> +static int amd_mp2_wait_response(u8 cmd_id, u32 command_sts)
> +{
> +	struct mp2_cmd_response cmd_resp;
> +
> +	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
> +				(cmd_resp.response.response == 0x0 &&
> +				 cmd_resp.response.status == command_sts &&
> +				 cmd_resp.response.cmd_id == cmd_id), MP2_RESP_SLEEP_US,
> +				 MP2_RESP_TIMEOUT_US))
> +		return cmd_resp.response.status;
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static void amd_mp2_stb_send_cmd(u8 cmd_id, bool is_dma_used)
> +{
> +	struct mp2_cmd_base cmd_base;
> +
> +	cmd_base.ul = 0;
> +	cmd_base.cmd.cmd_id = cmd_id;
> +	cmd_base.cmd.intr_disable = 1;
> +	cmd_base.cmd.is_dma_used = is_dma_used;
> +
> +	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
> +	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
> +}
> +
> +static int amd_mp2_stb_region(unsigned int len)
> +{
> +	struct device *dev = &mp2->pdev->dev;
> +
> +	len *= SZ_1K;
> +
> +	if (!mp2->stbdata) {
> +		mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr, GFP_KERNEL);
> +		if (!mp2->vslbase)
> +			return -ENOMEM;
> +
> +		mp2->stbdata = devm_kzalloc(dev, len, GFP_KERNEL);
> +		if (!mp2->stbdata)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_mp2_process_cmd(struct file *filp)
> +{
> +	struct device *dev = &mp2->pdev->dev;
> +	struct mp2_stb_data_valid stb_dv;
> +	int status;
> +
> +	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
> +
> +	if (stb_dv.val.valid != VALID_MSG) {
> +		dev_err(dev, "Invalid STB data\n");
> +		return -EBADMSG;
> +	}
> +
> +	if (stb_dv.val.length != MP2_STB_DATA_LEN_2KB &&
> +	    stb_dv.val.length != MP2_STB_DATA_LEN_16KB) {
> +		dev_err(dev, "Unsupported length\n");
> +		return -EMSGSIZE;
> +	}
> +
> +	mp2->stb_len = BIT(stb_dv.val.length);
> +
> +	status = amd_mp2_stb_region(mp2->stb_len);
> +	if (status) {
> +		dev_err(dev, "Failed to init STB region, status %d\n", status);
> +		return status;
> +	}
> +
> +	amd_mp2_stb_send_cmd(VALID_MSG, true);
> +	status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
> +	if (status == VALID_RESPONSE) {
> +		memcpy_fromio(mp2->stbdata, mp2->vslbase, SZ_1K * mp2->stb_len);
> +		filp->private_data = mp2->stbdata;
> +		mp2->is_stb_data = true;
> +	} else {
> +		dev_err(dev, "Failed to start STB dump, status %d\n", status);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +	if (!mp2->is_stb_data)
> +		return amd_mp2_process_cmd(filp);
> +
> +	filp->private_data = mp2->stbdata;
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> +					loff_t *pos)
> +{
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data, SZ_1K * mp2->stb_len);
> +}
> +
> +static const struct file_operations amd_mp2_stb_debugfs_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amd_mp2_stb_debugfs_open,
> +	.read = amd_mp2_stb_debugfs_read,
> +};
> +
> +static void amd_mp2_dbgfs_register(struct amd_pmc_dev *dev)
> +{
> +	if (!dev->dbgfs_dir)
> +		return;
Is this right?  I don't see dbgfs_dir being initialized.

> +
> +	debugfs_create_file("stb_read_previous_boot", 0644, dev->dbgfs_dir, dev,
> +			    &amd_mp2_stb_debugfs_fops);
> +}
> +
> +void amd_mp2_stb_deinit(void)
> +{
> +	struct pci_dev *pdev;
> +
> +	if (mp2 && mp2->pdev) {
> +		pdev = mp2->pdev;
> +		pci_dev_put(pdev);
> +		if (mp2->devres_gid)
> +			devres_release_group(&pdev->dev, mp2->devres_gid);
> +		mp2 = NULL;
> +	}
> +}
> +
> +void amd_mp2_stb_init(struct amd_pmc_dev *dev)
> +{
> +	struct pci_dev *pdev;
> +	int rc;
> +
> +	mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
> +	if (!mp2)
> +		goto mp2_error;
> +
> +	pdev = pci_get_device(PCI_VENDOR_ID_AMD, 0x172c, NULL);

Three things:
1) Could you put the definition for it in amd/pmc/pmc.h?
2) Is this device ID always going to be 0x172c?  If not, should it be 
paired with a specific check?

IE something like if the root device is PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 
then look for 0x172c etc?

You could make a helper that is

static int amd_mp2_get_stb() to abstract it all then.

This could scale better then in the future when more device IDs are added.

3) Does this PCI ID get used for anything else?  On a matching platform 
will amd-sfh use it or anything?

> +	if (!pdev)
> +		goto mp2_error;
> +

If you re-order these two calls, no extra clean up will be needed if the 
PCI device is missing.

> +	mp2->pdev = pdev;
> +
> +	mp2->devres_gid = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
> +	if (!mp2->devres_gid) {
> +		dev_err(&pdev->dev, "devres_open_group failed\n");
> +		goto mp2_error;
> +	}
> +
> +	rc = pcim_enable_device(pdev);
> +	if (rc) {
> +		dev_err(&pdev->dev, "pcim_enable_device failed\n");
> +		goto mp2_error;
> +	}
> +
> +	rc = pcim_iomap_regions(pdev, BIT(2), "mp2 stb");
> +	if (rc) {
> +		dev_err(&pdev->dev, "pcim_iomap_regions failed\n");
> +		goto mp2_error;
> +	}
> +
> +	/* MP2 MMIO is mapped to BAR2 */
> +	mp2->mmio = pcim_iomap_table(pdev)[2];
> +	if (!mp2->mmio) {
> +		dev_err(&pdev->dev, "pcim_iomap_table failed\n");
> +		goto mp2_error;
> +	}
> +
> +	pci_set_master(pdev);

AFAICT you don't undo setting master (pci_clear_master) if the DMA set 
mask fails nor on the cleanup path.

> +
> +	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +	if (rc) {
> +		dev_err(&pdev->dev, "failed to set DMA mask\n");
> +		goto mp2_error;
> +	}
> +
> +	amd_mp2_dbgfs_register(dev);
> +	dev->mp2 = mp2;
> +
> +	return;
> +
> +mp2_error:
> +	amd_mp2_stb_deinit();
> +}
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 108e12fd580f..926257125ac1 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -1106,6 +1106,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	}
>   
>   	amd_pmc_dbgfs_register(dev);
> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
> +		amd_mp2_stb_init(dev);
>   	pm_report_max_hw_sleep(U64_MAX);
>   	return 0;
>   
> @@ -1122,6 +1124,8 @@ static void amd_pmc_remove(struct platform_device *pdev)
>   		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>   	amd_pmc_dbgfs_unregister(dev);
>   	pci_dev_put(dev->rdev);
> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
> +		amd_mp2_stb_deinit();
>   	mutex_destroy(&dev->lock);
>   }
>   
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 827eef65e133..a49af1fa0060 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -14,6 +14,17 @@
>   #include <linux/types.h>
>   #include <linux/mutex.h>
>   
> +struct amd_mp2_dev {
> +	void __iomem *mmio;
> +	void __iomem *vslbase;
> +	void *stbdata;
> +	void *devres_gid;
> +	struct pci_dev *pdev;
> +	dma_addr_t dma_addr;
> +	int stb_len;
> +	bool is_stb_data;
> +};
> +
>   struct amd_pmc_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> @@ -38,10 +49,13 @@ struct amd_pmc_dev {
>   	struct dentry *dbgfs_dir;
>   	struct quirk_entry *quirks;
>   	bool disable_8042_wakeup;
> +	struct amd_mp2_dev *mp2;
>   };
>   
>   void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>   void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
> +void amd_mp2_stb_init(struct amd_pmc_dev *dev);
> +void amd_mp2_stb_deinit(void);
>   
>   /* List of supported CPU ids */
>   #define AMD_CPU_ID_RV			0x15D0

