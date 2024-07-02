Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2219DF82
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jul 2024 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926059; cv=fail; b=FkLMQk5u403WPBYHNBO+2Wxm0gFHbm5NuZ7NAtuiZl7m7ZVHDHcY53wxB6LDVjvss2WZKO8KIQQXcJJQHxhu4rVW1iKqLwjNGn2sbPM20HyI0LBOyDgc74XrSkqMH4tEj5CZTyEAjCjShCzH9KD9UX+3zBeuj+yTohWJaURo5/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926059; c=relaxed/simple;
	bh=kxJqAm5uxxUPKERoP+DxE3L+OnM65UFSeqJ5pPPrn18=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CRob8SOeKKp4lLRYYHgVm4w2eTTck7nQw0J2FjjYco+SgmDQOyA2fMAc5r+e98bzYow9APGxI0MZuA1ubKhiOIkIgHzdQyvpYrn5ZLmMwVs50Whgo4fzeIo6VBIcEqagg5sg/PcJanLhUr5wcpeHL7HF9G3snkZjktUKdvoF6pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TmIPMC2b; arc=fail smtp.client-ip=40.107.92.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TmIPMC2b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6UHJnFp3MQ5VpiHV6TISgGoi2rquEOi6jyLBWeCqGOKZ5UvO7R3TpOCPTrNsWI/39J//0vGGYU2XtuwZaFnVmqipSuBZxcUTPKm1XHUuEEc4klOoc4rbioVTayYh3bg9zS4l+krfHqWREtIE3mWDxswP6UWZwVXvtgLuQKgScTwS0pTzac3QAdSrR8mumNhAOLkVWk96mHUKcRyvfyq+RyKfq7R5qSnl7rNX9f5dDqz6Usnrv/iOPzQspKu59S5Zmy405szolnVqLoIXSviQloQVfwt37j4mEN1g4mxOm2a5UO1QESzygsESpExPVIii7Z1Xee3P2WyH3qvHph/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tAacCSepQ8cKo9T+1y93UPQsaoQ9TbM/byiGBz0VMo=;
 b=FRB6bOzQ2MPkQAeGa8fcr8sjZUSHzHUlP8pWzCA108R2ipeqMyTkqQ7cR+huyZclw68YHsuX+WUBNlFTa6PmjhEyOh9n+RzqEHWKj3ibVz9C4gLRv/CRU3pJQnyDlbQJy5aFkirx8vRz0BzLkwGnrebgWlhF7derfvw7C/zA1OpevXgs/FYNt2qwcFAlSBo3A6b8AyE9jPNWcz/5MpvEPW0RrL51HxXFmLz7YUWg2K03BZzBsmeBh4AwQKycT3RjFhNlIPr7120a/Ua3eaPgxEUWfrLV6SJytywZoemFP6Xm15itKB2gAlrzTSjodIUIG15HLo7OYw8pvoaNbz4GMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tAacCSepQ8cKo9T+1y93UPQsaoQ9TbM/byiGBz0VMo=;
 b=TmIPMC2bJVjXFFQE+uDe7G43dyKoZQqrIu+IL3LgTfnAr7zbnQ8z4vpPjNzgJ7jm0sbt33DobV7z3LgKOdkGR4KKKGpx+Tq/LeIyq1+mVwAVMRk4wgrbx2mJGQowaNkk3Ea2aB16kf1L/Mpk8usy5YO3SUijJ/9Kprzp2TxCLbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 13:14:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 13:14:14 +0000
Message-ID: <d5b3a808-a6a0-4466-8cef-cad0f6e5d52b@amd.com>
Date: Tue, 2 Jul 2024 08:14:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] platform/x86/amd/pmf: Remove update system state
 document
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
 <20240702080626.2902171-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240702080626.2902171-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0045.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 555739ce-3742-44dd-0261-08dc9a98dead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N29qWG8wZE9CVjBmQUdydXM5T0VGRzA1VlBwZ2JNc1krSXBXYnNmM1d5dWUw?=
 =?utf-8?B?QUJSaGtsUUdMRTRlWk0zc0VkQmlxbGhkK1Y1YkhJUlZBWGUra2tnWjRxTHNq?=
 =?utf-8?B?dHU0ZXhrbDhtaUpjK3R6OWZYZDlITXZSUFVua21LMDhiNE9BWWJ3bng5MmlU?=
 =?utf-8?B?TTdRN0hSQ0RycUtKRXJ1VDBsQVVLU2NQSVZpQzdsRHR5aEpJRFJUNlJEUTJa?=
 =?utf-8?B?dmdvaVp2ZzhjcFhwZUxoZGxlRk12NWliT0V0NDJtU2daZEx0YjNWUVpma0Np?=
 =?utf-8?B?UHFxcm9MWDJxclFoYnUycW9ucUt0eitFVXlwbS84d21xaXRXdkhnc3ZwLzVz?=
 =?utf-8?B?ZDk4U0d5cWIwTkFIc2t5VjhLR3lCOTJiajNwNGdHQldYeU1ha2w1SGFuN0h4?=
 =?utf-8?B?NmdpMTc3bUxPdXZBVXNGM2tjWnNMN1JubmtXZnVsUGlBVW4rUDNLMGpJVmE1?=
 =?utf-8?B?bmF3UmpxTjVKVmczNE9WWjFPaU10ak1qSlQvWmNvVzRWOG42ejRmblRrbS9Z?=
 =?utf-8?B?c3hyVExmNVlLL3N1VHBIWjZwSFNDV0o5S2F4aW83MW5CYzc2VXhHYk1SSEpW?=
 =?utf-8?B?azFhNHIxMUtXdjJ3TjJMdVBDajZXMHU1dkRMUk8zeEZVRnhLNE1VTk1aTE1T?=
 =?utf-8?B?Q3NqdXBNR1RFZXU1OFE1ZThUK0NGWG9HK1VYTVg5Y3gvRjd0dGFVY2NzZVda?=
 =?utf-8?B?dDg2bDZZeTI4aGJYZG5nVVNNc1duaEcySkRVNDZEdzVVUitkTVV6ZzdIU3NJ?=
 =?utf-8?B?SmE4MzgwbWdKblVhdVlzQzJ5RExuQlRZZlpqRHhLd01CL045QVl6VGJRVXdM?=
 =?utf-8?B?V0hzQUsyZ3dISHFLS1ExREZFV3NPY3o3cVREbTFmN2JteXoxdk1PSXpFb2VM?=
 =?utf-8?B?R3VjSHF2Q0tsb1BlNHRkT1cvOEJvc0tUODF0TE96dXpteE5jelZnOWhTL29t?=
 =?utf-8?B?ejNDcVFDQi9RUE5NY1N3YWJUVjVsNUVKUVhKY2VZei9pL0ZTYzkydHEwcndO?=
 =?utf-8?B?TTUxVWRieUNIK0pKdXAwZ2NDWm8vUlNCS3hPOWlaWDlwZjgrOTZYRGYyUnpP?=
 =?utf-8?B?VkE1Q1l6VnFaTXZqYnJiaGpVYTVXWWV3QWFJanVZSlU3RWlkRDlJSnlBU21Q?=
 =?utf-8?B?YzJ6bkhhMFA2TTd0TU5lUCtnWHFKYyt1Z2xQWG9ocXFqKzlnQlVOV0hxTWpX?=
 =?utf-8?B?MHcwNnB1aEhTVDU3T1hRQVQ1VFdmNC9kTXBOampxSmtXU3lEcG5XNm5ZYUpq?=
 =?utf-8?B?SjJEd3BNcXFjQ1ZkcHJwakxFRldJVGkrcjlDcXdjb1hTUWNtUjRpV0VoMjMr?=
 =?utf-8?B?NjFQL1FCQzZXdks0TnFtYnFtejAvZVFMaElXR2dUb3Rwc2dYNzFGUVZoKzM3?=
 =?utf-8?B?UjgwZ3VOUHo4WDMxRzFMMkdzaFBaK1FsZHFNVGp1OGd5cGl2d1FmZkd4YVdw?=
 =?utf-8?B?eU05VWN3eWFJblJTb1h0dGtzclRxUm1DRHlHM2M1TGt2bmYxa2ppbFY4U256?=
 =?utf-8?B?Z28vdkZrVkdON1lqd2Y2c2x2UXhJM1VnVGEzYllNcGVaTEhCMWJKRkhBc2ZQ?=
 =?utf-8?B?bmpNV0pPMDdVR0lUTUpTd3dEZjk3T2JFdjk0ZlptdDc3Tk5PMExETWJ3NlVG?=
 =?utf-8?B?Z083S0VlS3JNQXlRVGpFeFJBQlcxaUZpcGk0eEMrQzVTcmxtOC9hdlorVXJF?=
 =?utf-8?B?cWk5alE3WVpzWWVXTFVNekg3UURzOEx6V05FVWNWUEVpdWUrVEhzaUtMRHRG?=
 =?utf-8?B?VlRYOXc2UHdJWmROTXNZY0ZwdU10bEpqV0IwS0YvSEFtSmkzcFI3R1NmZGI3?=
 =?utf-8?B?a2k0OVlxeW03c1g0TmI4UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bitFQm9TU0g1bDNkMm82eXhpN2FNME5mODEwOVMzVW4zR0d5OUtLNmtkaGFC?=
 =?utf-8?B?aEJkTUtCL1RaeUVHSUFxSlVidWFKSEdpSjl4enNjWHZZd2UvZ282cWxnWHBo?=
 =?utf-8?B?ajFEUGp3QjI2clNCNFZIWDZBTU52SlBPc0NyMHJiQVU5U0ZIRTlSUzR2ajdK?=
 =?utf-8?B?OGpSN29yVkJnYU93ZXhWd2lpYmEzNFY1VkZIdnF3ZTFyclpkWlp1OWV2YTVP?=
 =?utf-8?B?N1ZLclhIckE2aXR0SDVGTkFSU1FtbFNPb0dKU3JueTdKUktHRUV6NHBRbHg3?=
 =?utf-8?B?ZHVycmxpeHBscksyWlVHcGFzY2VWWTAzUlQwT1BIRTJqdFdKeldWaGg4bjU0?=
 =?utf-8?B?ODBoQ0lhaXArTkdiVExFbVA5SlprU3dOVmUxaVo4Mjc0eFN3S00zNVJDK0JG?=
 =?utf-8?B?K0x3ZG03SU41OUtsazF3YkxvQ1VVbVpsQ3R5MlhGUUNZVE5EdVpjMjlBRE5V?=
 =?utf-8?B?eENzK0VMcnBld3ltZndLN1pDUXBPY3k5d0M0UlpQaWRxT0R4bEVSb2J0UGt0?=
 =?utf-8?B?M0s1eXFuMnVTWUhmWDZvd0xBT2VkaCt5a2NsT1JISlFJcW5ENW9OdFBGeWNw?=
 =?utf-8?B?ampwOUVmd1B1SWhla3VUQVRTQ0VuNzd1TGNGWUlWZUNLQnAzZkZLeHdmbEJa?=
 =?utf-8?B?L05nbjAvWDdEeEVtZEZLM1pVckJVM1VjVzNPYXhwZEdtbFVWdkVqeld2MmJQ?=
 =?utf-8?B?NXZIdzg3eEV2K2tSUVB0a1M2d0l3RXJ0WjVKY0gzTnY1RlowS3B5V3lpZE5L?=
 =?utf-8?B?TlVtNDRsNG9PSmdINTdaNkVDTVI3ODhpQnlMM0FacFBQVTNac0owVFU4aTZ6?=
 =?utf-8?B?YS8veUduNDZDZVZGNUZWQTY3Q3FvTHl0eldsMlc3OTdXdWFTNHZ2YjZnSlBO?=
 =?utf-8?B?YlV6cTI5SjhDU2EycUx5SjFYazcyUmpFaXZZeldRQnljcHhyOFZqUTB2eDIz?=
 =?utf-8?B?L1BSYnM4c3dZaWxHSU1OWVBwNlFSc3FwcU92RitiUHpGRkFEMXk5Y0pLNnA3?=
 =?utf-8?B?MVMyMjJUVS9CYmtxUFYvVlhEdmlvdGQvZGVLQWNwaElrdjYxQmszbGI0WDJJ?=
 =?utf-8?B?UnNqbytpSzErdkhSazVMcUI4QWU0WkUzSkZIRTBnbU1PdEQwZjFnZUlpelpo?=
 =?utf-8?B?QjdLWXU2M1cwaFJzdmRUVHZydldGditvY3Rvc0JNQjVUVWNyWXpKMGVYN3Fx?=
 =?utf-8?B?M00zWWMxT1owUmhrS1NkNS9oRWtkNkJWWGFyVXBjTXJDVFlTRTRWMkFSSlpz?=
 =?utf-8?B?NVV5c1JzWUFrKytHbDFZcEVJa1BmZHVCQWlOd1BDQVN1anB4ZzV6Um83UVVn?=
 =?utf-8?B?MURUeFQzWW42SDVZY3FIV1V6elJ3Vm1tV0I5R05Bc1Z2WUIxUmM3aTdlK1FH?=
 =?utf-8?B?SVBxNkpOZXo1ZjVsUnRxRkd0a3I2V0VnU2xzeGR3bmlCdXRZSjZlVmhNSkEw?=
 =?utf-8?B?b1B2djZsTEVreUdSZExaalFKeFlCTytDN3pPU0RkNW1oZWVqSVVLb1VJVzNQ?=
 =?utf-8?B?d0xqL2dBL3dSM0RMN2EzOFVadEIrNDR0VHhlSnc1cWtteUJMMEdPNlQ1MlZq?=
 =?utf-8?B?aGtFR29jZmZPK3Y2Ukl6a09NclplTjFUc0ZPUlY1NEZWbjY5OUlTTnRrRFUr?=
 =?utf-8?B?YklnaEl4VG9YL3pmMFQwY2llOFJlK1cvSDdUMkFmVi9iWjBoNi95L3BhNEE0?=
 =?utf-8?B?WGNnY0Z1d1hZVlVQbzhselhjR3R1eXdTK1JjMFRNdnhNVkYzY0JKOEU4MVhI?=
 =?utf-8?B?eU5vRXVRS0RwcVZDTDlvc2NYZTFkVXk1UUxkYkFkVG5LRU16Mk5HekJVL2VD?=
 =?utf-8?B?ejVOU2I3R3N3VXY2cWtzL0FhZGNiVGZFQzltcVhTRSs1dHZuZklGU2VzT0RD?=
 =?utf-8?B?OU4vTllxOFlTQkh5bWtVTG94clBJNkIweWc2RGZlRGY5bnpQaGZoQ0RLei9J?=
 =?utf-8?B?M1M4N0NGbEF5V3pFcHBqVG9vSGdDc1dBV1RrT1lTWEMvTlF1cXNmYnJ3L3hr?=
 =?utf-8?B?R3h1a3VxV2svSklsdGRYcnhjSjl6Z2hMRDZPYmcwUU0yYnFXYnd4WnV6UzYy?=
 =?utf-8?B?aC8zWDlCTXdETm56VFg1Q0U3RHNwVXl4Qko5dFFDQkFWQU1vOHB5eDZsUUN3?=
 =?utf-8?Q?van5EOVmiCgscR6dXIMnO7WPb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555739ce-3742-44dd-0261-08dc9a98dead
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:14:14.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8fDpDtHLX9QGyg2fovzwHNC4sBDb83Nqe5WCnaJ3nMmE8M5zEOt34FALpnLrGiB8Oq0le7N1kB8Uj95XSGVVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456

On 7/2/2024 3:06, Shyam Sundar S K wrote:
> This commit removes the "pmf.rst" document, which was associated with
> the PMF driver that enabled system state updates based on TA output
> actions.
> 
> The driver now uses existing input events (KEY_SCREENLOCK, KEY_SLEEP,
> and KEY_SUSPEND) instead of defining new udev rules in the
> "/etc/udev/rules.d/" directory. Consequently, the pmf.rst document is no
> longer necessary. Therefore, the pmf.rst documentation is being removed.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   Documentation/admin-guide/pmf.rst | 24 ------------------------
>   1 file changed, 24 deletions(-)
>   delete mode 100644 Documentation/admin-guide/pmf.rst
> 
> diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
> deleted file mode 100644
> index 9ee729ffc19b..000000000000
> --- a/Documentation/admin-guide/pmf.rst
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0
> -
> -Set udev rules for PMF Smart PC Builder
> ----------------------------------------
> -
> -AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
> -like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
> -TA (Trusted Application).
> -
> -In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
> -sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
> -enabled.
> -
> -Please add the following line(s) to
> -``/etc/udev/rules.d/99-local.rules``::
> -
> -        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="0", RUN+="/usr/bin/systemctl suspend"
> -        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl hibernate"
> -        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/bin/loginctl lock-sessions"
> -
> -EVENT_ID values:
> -0= Put the system to S0i3/S2Idle
> -1= Put the system to hibernate
> -2= Lock the screen

