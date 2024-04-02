Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2123.outbound.protection.outlook.com [40.107.212.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FEDBE5E
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Apr 2024 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061304; cv=fail; b=JkBozkzT83GfeUslC5CJKuyPJsv3+xsjxloXtC2Nuy7LcdQp89eriCuJ0WXcEsOATIc7KioYKi6FjGzfAGTB6GndtvuQjuTbkGiQkyjVI7eyTC4pNvwFYXXG9DfUUqPchA+/akOUgER7RtfuQMNk/FkQpD0E3xEw1VnO5WjxBsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061304; c=relaxed/simple;
	bh=IvTWQouFqwUSayLfl6gxd7/KN7pyqmRcrAkpzw6CO8c=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jGYwKdZ0VJCAF+DJ+s4kJgPxzv2i7oOx0/2K6s3BXO5pLhH8OmZX5g0QTXsem1EC1SazpTYd1/rEAO18cTSkTKD5x4CQmlNKARYhve8IcdhbTcV1tjS8qobUBwKoXBcWdIZW5qrcFnpYAtX+if07yGI+TPLM7almh6yvR0+rumk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0tMTMzeZ; arc=fail smtp.client-ip=40.107.212.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0tMTMzeZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMLrxj/D0Ggrj8X554s57+NmTyzmeBtT9AIoyp89GDXBTiCivihU84EU9S30Pe0dtHebEd9uiEjO3nL3cPYkVy/zhB25nesem+adSiURFegeT+zuSU3iimLcg7pIDviubiWQxMfvhg2kawLjpoONZdMSBykTgFcTX1buz2dMnkPKOgI/fWxI9TBRs806Ke+c4a2V5Eu4yrswbEWcip4WGSKW69UaopTh+5sVWLyEKAfCVKgD45IExEmpBIz66XwerfrFUTs+RBnjQx4jtz6gLGmaH5SefEA+C+bNfPFGK+up+TaUpq2SedZthmCmRgBbU2tzBsdX6ivJS7Cu/XT1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jAbghNrPBgC2vHsyZ3lRKvb0Z6Om+YPRzOHak0PMiA=;
 b=FYtpVSP60OBxauzvtZWe+JrCrg5SBq9d+/MkOKjvKmFhXmAMdXd4OUSsRvU0PPEW6Zdr+9SRPs9DJ7GUmh2nllq46I1E5dGpD31/IdW7vx6l+9d5hgQ1QQwcuXKax5+JlDTRL8fwUWn4RBlmxG2gu8Hyd9Dh5hMAt+HsVTOQD/t1zJMomUiozN8rRByWBqPYvCbpUnKpfrSXgWArMYR00oBne8NaxHBfpXf5P4n5KMjWiKAIGfgbz8zgTxSwAlOS6VZK0G8lFvBwdtw7zgVJsDP1O2bCK/yp2AqZpYmh0hQ3ziTf61LrgfCu6yV61/+hdeaniaktuTvKEcd8tnomwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jAbghNrPBgC2vHsyZ3lRKvb0Z6Om+YPRzOHak0PMiA=;
 b=0tMTMzeZdXmvbV439A7uuWrXdHHoCBb6AV4bSI5V/7rbAO+De9ULjpj/ITAAoNQbuAhwVWj+Td7D4+OU/Gm9SmkBdEPn0GtrgEY+fnAicCnQwQflk2AD6RqRkzHkDO6rfxOkc+XfoiuQhbj5DxIWY0a+AZhaSvp6p2DDRBIYxhA=
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 12:34:57 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 12:34:56 +0000
Message-ID: <20512e08-c35c-413d-92c8-9023aa230cb6@amd.com>
Date: Tue, 2 Apr 2024 18:04:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/amd/pmc: Add AMD MP2 STB functionality
To: Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam-sundar.S-k@amd.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 sathyanarayanan.kuppuswamy@linux.intel.com,
 platform-driver-x86@vger.kernel.org
References: <20240304064147.2586158-1-Basavaraj.Natikar@amd.com>
 <ba55cb1c-c483-4882-adb6-ce074646bca6@amd.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <ba55cb1c-c483-4882-adb6-ce074646bca6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::8) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM6PR12MB4107:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yw15+x0+ixsrGb4bRDoXCJGAO/G76lTNXpGsbzG1IBiFMt0Ii6HywwJvMQJuukrJU/zOh6YKOaS2kN0xGzmyVRupmYukYZ6waSYujPvR4jKInpPun9kMopVfY+1el0rjtqMbF49jlacDL34jcxm3p6zKdcNg2qyvSPwZ9nbwH5tFuwoVXAwuxQbb94U1/DWy1+E/lh5s9vDfETDNeOyoGjKlGyFz6qOoj9kF+s2sMXF+kvN/HX4zzveRhpaxtcy1EvOx1ErgiFVo3mVgUIi4d+jsP7h5NqGPHyVrRymNLDWNnfiu7PPKgN/LBfIXMw57qM94BwuqaAUH+5kOC3CG/o61P2YF2GOAbvvMSf4Mn8umpuWprasb3frv/wxXMQBZaf+WUZ1yBFrfZW9StqV12gOjCa9pR3wmfyFZ2pGwk+Px1ayRbffdmHk3nXZpFQ51eNJvcx1WpY9eY0+h4gvjNQpOfQOr0sxTje/ukCtOD3HWnXGRWcW+iPFNNWvfenmqB7QgMzsUSWwwr3Dxzk/zCzNevt4EudLo0fxbuuNicWWD2qVpWGxYtyZib1uA4NAGoivYHtU7++pN3zUGN/Pt0oJX7Ky+T7XjLKYCjshdCa0zHo2/EB3UUZHF8QHY2WWpzlyERnE9f5DWhvBI+SuiCezVYtXm1a0V5Caz2Lww5qI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUhwTU1BdUlhNHZ0QnlZS2dUUjVkcVg3SU85aW80L2plTEsvRTdQK3E2OXVS?=
 =?utf-8?B?YnByS3V5SlI3TXpFV1BoazRYaDBGVElzVm5namxmRXJzdTFmajBRN1dGOVd6?=
 =?utf-8?B?QXlXSXNJK3JjVmtmakUrZkF2ampLYU5CL3dOdm9md09seVZuRVhBUzMyOEIw?=
 =?utf-8?B?YWpETUtVMVdhdmhjV0tYV3ZUUjZrakNvY3dxb3phYTZkUDlXS0RPcFJaS05u?=
 =?utf-8?B?SWMvcG1YOUJqVDNKV2IwZ3pkMTk3YkEzYzFJUUxTcnF3Nm9mcVVEcHh6QjlM?=
 =?utf-8?B?cklLMEdPdlVSc0hDR2FRUGJiN0l1OEtOYzBsQmFONlc3dE5sNTdZRm5mVXdT?=
 =?utf-8?B?Uldoa29FR3dxZW4yM2RHWjZNMFZmUTBETHZzK3FtS3B5TDNYSWs2MjBKeTI2?=
 =?utf-8?B?aitsZ0xJUjREbllnQWkvbW53ZHNDRmEvV3hDYWtUU0lobUxpbVpsVW9RNDA0?=
 =?utf-8?B?bzJEVkRpU2NUR0dEN2J6S1dBWG41dlRGOFdlUnBOclNKZE5odVJxOHlxS0pz?=
 =?utf-8?B?T2VRTVJiOVMvRW5BZ2ZvVTdHcVd2TXU5VnZKSnFoamV6ODRicU9PTVlCRndJ?=
 =?utf-8?B?aC9Sd3Jic3JhemR3R0xsZnRnbUlKWEMrV0xkNkpXZ2FmY3Jxd1l6Q3VyVVR6?=
 =?utf-8?B?djNJdk01aVY0cFRXY3NzT0lsNi9WSmlmcXF4N3laeTZJQTNLVFNMSWJtUE5X?=
 =?utf-8?B?dllwRkRSeU05N2Z0Q2RiSXlXMXdEc0ZKK2JQQ3I1NlFEZUI4OGZkWXN6MTZN?=
 =?utf-8?B?NW9wR2RKbVBiZ243OFE2dCsrdTBld1hMWWI0MlpjbmpNRnhPemwrR1NzVDc4?=
 =?utf-8?B?YmlYeWd2ZEJIZ2IxVUpLUlcreVFXb2JlSFBmektUck43aFZ0U0FyTkpWaFVV?=
 =?utf-8?B?TUJ4Yit4R3JwbjA3aW1iWlF3aGc1RnZZTVFCZFh0a1JIVFJNVGNLWUxFT1cw?=
 =?utf-8?B?NTk3WGFVVlVYcWdnOHlWd25VS0JEdW42SFdXandlYitzVDVVUXY3OWJqdjNE?=
 =?utf-8?B?TnE5TWhwWFhLU3lGaGlVdTI0UCs2bzJOcGp3MXdRMGxjT0dxY09jL2lkSHln?=
 =?utf-8?B?UmEzVm45bWhXM0RmMVdQMlNleVliWmdJREcybVZEZEhkOWRLS0d5eGFwbmdX?=
 =?utf-8?B?ZHdsOFo4bTRXeXIvbTJRZC93UERsU2RVSDJpYlFmTmtUTnJtZkdIYUczd0tD?=
 =?utf-8?B?VUJZZzBNWVBWMFQvUU1KdmhndFRhY2NDekZBQjRUeTB6SDZpNkhxeFJ4OVF4?=
 =?utf-8?B?eVhndEJIbHZiKy9waW1ZWjErR2U2ZVZDR002ak5uWXBzcUQ3cUMzOXhHbG5L?=
 =?utf-8?B?RU1KUkVOZjJGTm53eTNWd1JERkhFNTg4S1BVa083cUZERURQNkErSXZuSnhI?=
 =?utf-8?B?ZDJ6ODhROFkrQ1c5VEd1VnhOWmtxMmlaUUc4c0lVVWtUS1JwZngxOVBHbzVw?=
 =?utf-8?B?VXA2aVN5bkVZak8yZitJSm5CSURUTWI3dnlQZnBpaFdZUDFZaFptMlFLYjJ3?=
 =?utf-8?B?T1pSYTlRYmtNL25OeERhcjVlSFFoYlE1T2psNmgvNlhQN0J6a3hDZmhDMERJ?=
 =?utf-8?B?dkRqTnRIN1R1Y2U4b0N6Q0NuTjNnK01TdDdRc1dIL21jRmliV3FGaEhsMWQv?=
 =?utf-8?B?WWhoMmpjZnJNekk5ZVRFWkh2RTluTCtkanhqR2w4WHFvb29jTVl0U2ZCUE9F?=
 =?utf-8?B?Wk90aHZJeW9UY01oM0dmRjh3bjhOVWh0cHVwSEFGSEczVUUvSUtLNjFrT3Fu?=
 =?utf-8?B?a1UyTFB6U0lMNExKN2ZRaUJycmxnZ0owcFg3dlEvTEJpQVdEazg3M2trdDhP?=
 =?utf-8?B?R2dUbHgxT2ZhdHcyaExnSWRIRjRKT1VWeW5oYTR0V1kyQmhXT0dnblJBT2Rn?=
 =?utf-8?B?UjdMZzBsSDFiU2VRQktWUFlORG9ZK2ovbjkwUnR2WUhrSVhQcll4U0ovTks2?=
 =?utf-8?B?MWErV2NNdHNoWlQwdEMyeW1yTEZxb29hVkF6MkgwSnpMYXREN2FuUkE0RS9o?=
 =?utf-8?B?ZWlIT1dKS1pyMStGaVhMN0E5NkZHekJKTUtwSUgzbTV3Z3BUSkJjOThtYVlz?=
 =?utf-8?B?WkJScDdLSlovOE0xdjdFMXJ5cjgzR0gxb0FYVkx2d3FGaEVOOUpoM1NNWE93?=
 =?utf-8?Q?QGhqx9jKCbxNTbJdeCljlIJb1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dcfb1b-df4c-4a73-1efb-08dc53114df3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 12:34:56.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkSSWvIKW97PZODGIKj4ACGeKMS7K66F4gMsn0GUB5j2t+LepOmPYtjKst8rQBud2AAklzVGcUdYXP5Lfvy2PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107


On 3/9/2024 1:51 AM, Mario Limonciello wrote:
> On 3/4/2024 00:41, Basavaraj Natikar wrote:
>> AMD MP2 STB function provides a data buffer used to log debug
>> information
>> about the system execution during S2Idle suspend/resume.
>>
>> A data buffer known as the STB (Smart Trace Buffer) is a circular buffer
>> which is a low-level log to assist in debugging by providing insights
>> into any potential hangs or stalls that may occur during the S2Idle
>> suspend/resume processes.
>>
>> The current PMC driver retrieves STB data from MP1, but there can be
>> scenarios where MP1 might hang or become unresponsive, leading to the
>> loss of critical data present in the STB buffer. This defeats the
>> purpose
>> of the STB buffer, which was originally meant to help identify system
>> failures.
>>
>> This feature creates stb_read_previous_boot debugfs allows users to
>> retrieve the STB log from MP2 specifically from the last occurrence of
>> the S2Idle suspend/resume. A userspace daemon can access STB log of last
>> S2Idle suspend/resume which can help to troubleshoot potential issues
>> related to hangs or stalls during the S2Idle suspend/resume sequence.
>>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>> Changes in v3:
>>     - Changed an error path for deinitialization or freeing resources.
>>     - Modified the macro and variable to have a more specific name.
>>     - Included header files for USEC_PER_MSEC, writeq, and writel.
>>     - Switched the data type of the 'len' variable from 'int' to
>>       'unsigned int'.
>>     - Used one variable for return values.
>>
>> Changes in v2:
>>     - Used linux/sizes.h instead of defining KB.
>>     - Defined timeout containing unit as per USEC_PER_MSEC.
>>     - Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
>>     - Changed string stb to STB in log messages.
>>     - Defined literals using Macro.
>>
>>   drivers/platform/x86/amd/pmc/Kconfig   |  23 +++
>>   drivers/platform/x86/amd/pmc/Makefile  |   1 +
>>   drivers/platform/x86/amd/pmc/mp2_stb.c | 260 +++++++++++++++++++++++++
>>   drivers/platform/x86/amd/pmc/pmc.c     |   4 +
>>   drivers/platform/x86/amd/pmc/pmc.h     |  14 ++
>>   5 files changed, 302 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c
>>
>> diff --git a/drivers/platform/x86/amd/pmc/Kconfig
>> b/drivers/platform/x86/amd/pmc/Kconfig
>> index 883c0a95ac0c..8177486babf9 100644
>> --- a/drivers/platform/x86/amd/pmc/Kconfig
>> +++ b/drivers/platform/x86/amd/pmc/Kconfig
>> @@ -18,3 +18,26 @@ config AMD_PMC
>>           If you choose to compile this driver as a module the module
>> will be
>>         called amd-pmc.
>> +
>> +config AMD_MP2_STB
>> +    bool "AMD SoC MP2 STB function"
>> +    depends on AMD_PMC
>
> What do you think about adding:
>     default AMD_PMC
> Then this will be essentially opt out and any distros that enable 
> AMD_PMC by default will also start enabling this without extra prodding.

Sure, I will add 'default AMD_PMC'

>
>> +    help
>> +      AMD MP2 STB function provides a data buffer used to log debug
>> +      information about the system execution during S2Idle
>> suspend/resume.
>> +      A data buffer known as the STB (Smart Trace Buffer) is a circular
>> +      buffer which is a low-level log for the SoC which is used to
>> debug
>> +      any hangs/stalls during S2Idle suspend/resume.
>> +
>> +      The current PMC driver retrieves STB data from MP1, but there
>> can be
>> +      scenarios where MP1 might hang or become unresponsive, leading
>> to the
>> +      loss of critical data present in the STB buffer. This defeats the
>> +      purpose of the STB buffer, which was originally meant to help
>> identify
>> +      system failures.
>> +
>> +      Creates stb_read_previous_boot debugfs to get STB, a userspace
>> daemon
>> +      can access STB log of last S2Idle suspend/resume which can
>> help to
>> +      debug if hangs/stalls during S2Idle suspend/resume
>> +
>> +      Say Y or N here if you have a notebook powered by AMD RYZEN
>> CPU/APU
>> +      and supports MP2 STB.
>
> This last sentence reads as a confusing statement.  I would just drop it.

Sure I will drop.

>
>> diff --git a/drivers/platform/x86/amd/pmc/Makefile
>> b/drivers/platform/x86/amd/pmc/Makefile
>> index 4aaa29d351c9..f1d9ab19d24c 100644
>> --- a/drivers/platform/x86/amd/pmc/Makefile
>> +++ b/drivers/platform/x86/amd/pmc/Makefile
>> @@ -6,3 +6,4 @@
>>     amd-pmc-objs := pmc.o pmc-quirks.o
>>   obj-$(CONFIG_AMD_PMC) += amd-pmc.o
>> +amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
>> diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c
>> b/drivers/platform/x86/amd/pmc/mp2_stb.c
>> new file mode 100644
>> index 000000000000..4acea31daaaa
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
>> @@ -0,0 +1,260 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD MP2 STB layer
>> + *
>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/pci.h>
>> +#include <linux/sizes.h>
>> +#include <linux/time.h>
>> +
>> +#include "pmc.h"
>> +
>> +#define VALID_MSG 0xA
>> +#define VALID_RESPONSE 2
>> +
>> +#define AMD_C2P_MSG0 0x10500
>> +#define AMD_C2P_MSG1 0x10504
>> +#define AMD_P2C_MSG0 0x10680
>> +#define AMD_P2C_MSG1 0x10684
>> +
>> +#define MP2_RESP_SLEEP_US 500
>> +#define MP2_RESP_TIMEOUT_US (1600 * USEC_PER_MSEC)
>> +
>> +#define MP2_STB_DATA_LEN_2KB 1
>> +#define MP2_STB_DATA_LEN_16KB 4
>> +
>> +static struct amd_mp2_dev *mp2;
>
> Do you really need a global variable?  I would think this can all be
> children of the amd_pmc dev and you can pass pointers and references
> to that around instead.

There's no need for a global variable. I'll use a reference from |amd_pmc|instead.

>
>> +
>> +struct mp2_cmd_base {
>> +    union {
>> +        u32 ul;
>> +        struct {
>> +            u32 cmd_id : 4;
>> +            u32 intr_disable : 1;
>> +            u32 is_dma_used : 1;
>> +            u32 rsvd : 26;
>> +        } cmd;
>> +    };
>> +};
>> +
>> +struct mp2_cmd_response {
>> +    union {
>> +        u32 resp;
>> +        struct {
>> +            u32 cmd_id : 4;
>> +            u32 status : 4;
>> +            u32 response : 4;
>> +            u32 rsvd2 : 20;
>> +        } response;
>> +    };
>> +};
>> +
>> +struct mp2_stb_data_valid {
>> +    union {
>> +        u32 data_valid;
>> +        struct {
>> +            u32 valid : 16;
>> +            u32 length : 16;
>> +        } val;
>> +    };
>> +};
>> +
>> +static int amd_mp2_wait_response(u8 cmd_id, u32 command_sts)
>> +{
>> +    struct mp2_cmd_response cmd_resp;
>> +
>> +    if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
>> +                (cmd_resp.response.response == 0x0 &&
>> +                 cmd_resp.response.status == command_sts &&
>> +                 cmd_resp.response.cmd_id == cmd_id),
>> MP2_RESP_SLEEP_US,
>> +                 MP2_RESP_TIMEOUT_US))
>> +        return cmd_resp.response.status;
>> +
>> +    return -ETIMEDOUT;
>> +}
>> +
>> +static void amd_mp2_stb_send_cmd(u8 cmd_id, bool is_dma_used)
>> +{
>> +    struct mp2_cmd_base cmd_base;
>> +
>> +    cmd_base.ul = 0;
>> +    cmd_base.cmd.cmd_id = cmd_id;
>> +    cmd_base.cmd.intr_disable = 1;
>> +    cmd_base.cmd.is_dma_used = is_dma_used;
>> +
>> +    writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
>> +    writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
>> +}
>> +
>> +static int amd_mp2_stb_region(unsigned int len)
>> +{
>> +    struct device *dev = &mp2->pdev->dev;
>> +
>> +    len *= SZ_1K;
>> +
>> +    if (!mp2->stbdata) {
>> +        mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr,
>> GFP_KERNEL);
>> +        if (!mp2->vslbase)
>> +            return -ENOMEM;
>> +
>> +        mp2->stbdata = devm_kzalloc(dev, len, GFP_KERNEL);
>> +        if (!mp2->stbdata)
>> +            return -ENOMEM;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_mp2_process_cmd(struct file *filp)
>> +{
>> +    struct device *dev = &mp2->pdev->dev;
>> +    struct mp2_stb_data_valid stb_dv;
>> +    int status;
>> +
>> +    stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
>> +
>> +    if (stb_dv.val.valid != VALID_MSG) {
>> +        dev_err(dev, "Invalid STB data\n");
>> +        return -EBADMSG;
>> +    }
>> +
>> +    if (stb_dv.val.length != MP2_STB_DATA_LEN_2KB &&
>> +        stb_dv.val.length != MP2_STB_DATA_LEN_16KB) {
>> +        dev_err(dev, "Unsupported length\n");
>> +        return -EMSGSIZE;
>> +    }
>> +
>> +    mp2->stb_len = BIT(stb_dv.val.length);
>> +
>> +    status = amd_mp2_stb_region(mp2->stb_len);
>> +    if (status) {
>> +        dev_err(dev, "Failed to init STB region, status %d\n", status);
>> +        return status;
>> +    }
>> +
>> +    amd_mp2_stb_send_cmd(VALID_MSG, true);
>> +    status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
>> +    if (status == VALID_RESPONSE) {
>> +        memcpy_fromio(mp2->stbdata, mp2->vslbase, SZ_1K *
>> mp2->stb_len);
>> +        filp->private_data = mp2->stbdata;
>> +        mp2->is_stb_data = true;
>> +    } else {
>> +        dev_err(dev, "Failed to start STB dump, status %d\n", status);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file
>> *filp)
>> +{
>> +    if (!mp2->is_stb_data)
>> +        return amd_mp2_process_cmd(filp);
>> +
>> +    filp->private_data = mp2->stbdata;
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char
>> __user *buf, size_t size,
>> +                    loff_t *pos)
>> +{
>> +    if (!filp->private_data)
>> +        return -EINVAL;
>> +
>> +    return simple_read_from_buffer(buf, size, pos,
>> filp->private_data, SZ_1K * mp2->stb_len);
>> +}
>> +
>> +static const struct file_operations amd_mp2_stb_debugfs_fops = {
>> +    .owner = THIS_MODULE,
>> +    .open = amd_mp2_stb_debugfs_open,
>> +    .read = amd_mp2_stb_debugfs_read,
>> +};
>> +
>> +static void amd_mp2_dbgfs_register(struct amd_pmc_dev *dev)
>> +{
>> +    if (!dev->dbgfs_dir)
>> +        return;
> Is this right?  I don't see dbgfs_dir being initialized.

Yes, that's right. dbgfs_dir is already initialized in amd_pmc i.e. before call amd_mp2_stb_init.

>
>> +
>> +    debugfs_create_file("stb_read_previous_boot", 0644,
>> dev->dbgfs_dir, dev,
>> +                &amd_mp2_stb_debugfs_fops);
>> +}
>> +
>> +void amd_mp2_stb_deinit(void)
>> +{
>> +    struct pci_dev *pdev;
>> +
>> +    if (mp2 && mp2->pdev) {
>> +        pdev = mp2->pdev;
>> +        pci_dev_put(pdev);
>> +        if (mp2->devres_gid)
>> +            devres_release_group(&pdev->dev, mp2->devres_gid);
>> +        mp2 = NULL;
>> +    }
>> +}
>> +
>> +void amd_mp2_stb_init(struct amd_pmc_dev *dev)
>> +{
>> +    struct pci_dev *pdev;
>> +    int rc;
>> +
>> +    mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
>> +    if (!mp2)
>> +        goto mp2_error;
>> +
>> +    pdev = pci_get_device(PCI_VENDOR_ID_AMD, 0x172c, NULL);
>
> Three things:
> 1) Could you put the definition for it in amd/pmc/pmc.h?
> 2) Is this device ID always going to be 0x172c?  If not, should it be
> paired with a specific check?
>
> IE something like if the root device is
> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT then look for 0x172c etc?
>
> You could make a helper that is
>
> static int amd_mp2_get_stb() to abstract it all then.
>
> This could scale better then in the future when more device IDs are
> added.
>
> 3) Does this PCI ID get used for anything else?  On a matching
> platform will amd-sfh use it or anything?

PCI ID used only for MP2_STB not for anything so I will just use Macro for 0x172c and remaining
code is simple no need to abstract. 

>
>> +    if (!pdev)
>> +        goto mp2_error;
>> +
>
> If you re-order these two calls, no extra clean up will be needed if
> the PCI device is missing.

If I re-order then need extra clean up like below 
       pdev = pci_get_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_MP2_STB, NULL);
        if (!pdev)
                return;

        mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
        if (!mp2) {
                pci_dev_put(pdev);

So I will keep same as original order. 

>
>> +    mp2->pdev = pdev;
>> +
>> +    mp2->devres_gid = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
>> +    if (!mp2->devres_gid) {
>> +        dev_err(&pdev->dev, "devres_open_group failed\n");
>> +        goto mp2_error;
>> +    }
>> +
>> +    rc = pcim_enable_device(pdev);
>> +    if (rc) {
>> +        dev_err(&pdev->dev, "pcim_enable_device failed\n");
>> +        goto mp2_error;
>> +    }
>> +
>> +    rc = pcim_iomap_regions(pdev, BIT(2), "mp2 stb");
>> +    if (rc) {
>> +        dev_err(&pdev->dev, "pcim_iomap_regions failed\n");
>> +        goto mp2_error;
>> +    }
>> +
>> +    /* MP2 MMIO is mapped to BAR2 */
>> +    mp2->mmio = pcim_iomap_table(pdev)[2];
>> +    if (!mp2->mmio) {
>> +        dev_err(&pdev->dev, "pcim_iomap_table failed\n");
>> +        goto mp2_error;
>> +    }
>> +
>> +    pci_set_master(pdev);
>
> AFAICT you don't undo setting master (pci_clear_master) if the DMA set 
> mask fails nor on the cleanup path.

I'll also add this to the cleanup path.

>
>> +
>> +    rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>> +    if (rc) {
>> +        dev_err(&pdev->dev, "failed to set DMA mask\n");
>> +        goto mp2_error;
>> +    }
>> +
>> +    amd_mp2_dbgfs_register(dev);
>> +    dev->mp2 = mp2;
>> +
>> +    return;
>> +
>> +mp2_error:
>> +    amd_mp2_stb_deinit();
>> +}
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>> b/drivers/platform/x86/amd/pmc/pmc.c
>> index 108e12fd580f..926257125ac1 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -1106,6 +1106,8 @@ static int amd_pmc_probe(struct platform_device
>> *pdev)
>>       }
>>         amd_pmc_dbgfs_register(dev);
>> +    if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>> +        amd_mp2_stb_init(dev);
>>       pm_report_max_hw_sleep(U64_MAX);
>>       return 0;
>>   @@ -1122,6 +1124,8 @@ static void amd_pmc_remove(struct
>> platform_device *pdev)
>>           acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>>       amd_pmc_dbgfs_unregister(dev);
>>       pci_dev_put(dev->rdev);
>> +    if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>> +        amd_mp2_stb_deinit();
>>       mutex_destroy(&dev->lock);
>>   }
>>   diff --git a/drivers/platform/x86/amd/pmc/pmc.h
>> b/drivers/platform/x86/amd/pmc/pmc.h
>> index 827eef65e133..a49af1fa0060 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -14,6 +14,17 @@
>>   #include <linux/types.h>
>>   #include <linux/mutex.h>
>>   +struct amd_mp2_dev {
>> +    void __iomem *mmio;
>> +    void __iomem *vslbase;
>> +    void *stbdata;
>> +    void *devres_gid;
>> +    struct pci_dev *pdev;
>> +    dma_addr_t dma_addr;
>> +    int stb_len;
>> +    bool is_stb_data;
>> +};
>> +
>>   struct amd_pmc_dev {
>>       void __iomem *regbase;
>>       void __iomem *smu_virt_addr;
>> @@ -38,10 +49,13 @@ struct amd_pmc_dev {
>>       struct dentry *dbgfs_dir;
>>       struct quirk_entry *quirks;
>>       bool disable_8042_wakeup;
>> +    struct amd_mp2_dev *mp2;
>>   };
>>     void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>>   void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>> +void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>> +void amd_mp2_stb_deinit(void);
>>     /* List of supported CPU ids */
>>   #define AMD_CPU_ID_RV            0x15D0
>

