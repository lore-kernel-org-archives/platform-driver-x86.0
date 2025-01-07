Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD061E32CF;
	Tue,  7 Jan 2025 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285403; cv=fail; b=li5bgpW/FeEw8jkgKwuw1jrr4fciWmeD5ao/5p6rh4fvfIuHj3gqB4L7zaYADaQLaRoBSX/LRoOkdJey8XoqQmthdK6+lVAXolKc8ZPhJSOxdPS/7YnTejL9vaFMW7llJ3XD7o7xFD+9J/ligKpgdw0gH2BGDt9nfIU4XUVgfxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285403; c=relaxed/simple;
	bh=UEtW9d6oso/n48lm4tMTQAB+E2UQli6YJ3MNTJTnuHU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nXLijbG4MP6HntmE9r3e+qModGlGiE0LYFl+cwjADKh1yAb4JG+mXsMWi/uou+H8WhOCP3hXg8WZ2B6pXvZ+GyCaqojuwuroBBDzmWWcuFPZPWe1xbZmBizshi2CGzByfl+bZGErh2Q5I4phAajePG1T20JwGd8KOmcFksp9iPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dWq1Geqg; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dWq1Geqg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iemSHy18dcZA0plEYZidwx8JAjHMxmHERkrTXhkT5cOqpRRz6ke+WkL8umSWS35xAyPJ6/0CUaAqkuQ/U1PjB5IjppBQdsCUNKT/Qjwqj3ng60StZtupGuSndn3p1UdWMPsilWyCITMFLg6dtoljfnEBpCwlHPbU0jWhguTHjtf+BmOJneHsCSxQhGb6SnHiAXfZ/SnVd06Xa06pu1jEtHkfetvJ5f3P0MvbNZm+ypYX98yMA63CuIHdFE1vazkU0MhL6KldGwVCGVcXCQm9HmbHz0wqz7IYbBT7HKBPbKTK/sivbp0qkKxBfMZGNR/FYBG3s8+hEBRVb4Ad1viLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/Vu2/5VLPEg+DPEXGp3+27tFVKMXrmupoDs54ay5Zs=;
 b=St1aRsEZKXPmnyjDfsBttiaC+Xq2/6Yrr5frZFo5dKADroIMqe7+rpq2WUrNmhknDCuu468TYWoFi7kgZMnH3C61AAHfLCD146mK4wnGAD3gfSUN+zCHyAgc7QCraxd7ovrU1CFqLVJHC79XRT8OIVYHaT4c4FXlUqhKRVA7cAhXWoSV4TsXOI3eYR0HyvQPnA+6LDUEI5mR08XIePnqYkK1iXS0z/QXswY3g5TGDhD1N1+CnAojLXAQQ50/puWYwvxqWNWuFzFKoscBO20K3kCRVuxgGkxy1kugEcfQu+PX7j2LyzRdxiPGQkczH5LjI7alMpd4ytGTkMY+/Pmc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/Vu2/5VLPEg+DPEXGp3+27tFVKMXrmupoDs54ay5Zs=;
 b=dWq1GeqgUYoZh2ScNeaCQGM4tO2ohFAUYd0KEVd5xaBQqCi/qnnl1Y8ntuLpjDTBPZRbyMsPI8KWNukveOp9Y/tjGmAI0ps8RJ4KEMiAP3VgiNBzInZyVwzm4KMuUcT24ccvjotDibGg++c9xDQJ9V+1NWxkeS/EEOyXRY1EBik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:29:54 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:29:54 +0000
Message-ID: <05ee765c-33f3-4824-b6f2-414501caca18@amd.com>
Date: Tue, 7 Jan 2025 15:29:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] platform/x86: alienware-wmi: Refactor thermal
 control methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-14-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-14-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:806:22::29) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: bf117514-d4f4-4802-50cc-08dd2f626d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tys5dFVEb3ZBUVIwR1BoZ2hSYzgzcFAyaUhUaEp0RkJNZE5uOWtRamNmWnZK?=
 =?utf-8?B?VWE1QmRyWWRLeHlSUkhmS2FtSVI0R2llWmNSRGhyV2JtQUlsWkVnc2hkSHRU?=
 =?utf-8?B?dlZtay9FOWpnWTV5SmlMVkZMQTdzcEpNbWJ0ZURFQ1N2WERhVE4yMG1yWW16?=
 =?utf-8?B?WGpVS0JSTUgrVnQ4bC9YdzkxWFgyTE52OFUxcFdjd1R4eStMMTAwUytSS1pV?=
 =?utf-8?B?bWxhZFFVMjluZHlGSFg3NE1PYjlJM2Z5S0luMFpUdGNoWkFMc2ptOVpBZVFt?=
 =?utf-8?B?YmdkRWRUeStxL3lQWFA0TngycUhZTGtrNlFrL2tMQjVpd1hnQkdwQ0RVY0x3?=
 =?utf-8?B?UXBzY29pMDlnQTBrc1ZXeW1ydFl4ekkwV1BnSGE1SncycEZPT1IrVk5NTEl0?=
 =?utf-8?B?bndsYTB0VTZQbThDVGdnV2NzY0FEVm8vZEZUeC9Mak5nOGlRU0lySWZKWjNG?=
 =?utf-8?B?RWh0VDkwczd0QTNWTnYrSDB5RFFiTUgvM1A3enRWb2ZkY3lIQkVtclM3OUtU?=
 =?utf-8?B?bFlOaGpsWmpGNFJaa1ZWNEpnYktRSlZtTnR3RkFCY01NUEJRSmxNRWE0Wndy?=
 =?utf-8?B?clp4dTVIMGRWME0vQVJaR2hndDlpSStvc0dqeEJFRXl2bU5pVjRLZ01MWTFu?=
 =?utf-8?B?OVZta0pMeTlkQTVGTVNrZVpUbndqSWZDbWk1dHRXNkxXS0Nzd3lsOUJEOXZD?=
 =?utf-8?B?SE1NclRQalU3ZU56c1c2SklMazBrS2Y5Z2RxeDRCVVBHRmd6Q3NCcG9raWhj?=
 =?utf-8?B?aEdnanNZemhjMm1xNkRWd1c0TllTYkV4c29WNnA4bE5oRXNodnhnME9iYU5M?=
 =?utf-8?B?VUU5aXlXcGg1MlJORmFYMElUWllPdFFGU2hORmtFMnlxTHdObkd1eFJ4aktM?=
 =?utf-8?B?a0c1NEZYSjBNa214MEl4Q29Ra29wb21obi9QK3ZRTWozVXFEWU9KbC9tWmZx?=
 =?utf-8?B?b0pCWHV4bGVrUWJNQkJYYkV1dFJsOU14MnNzTGxINWpmWFRFb1g4eW0xU2RE?=
 =?utf-8?B?TkkwamhmQjFGVWM0Z1RwdFJZU00zUGJxSmJmQzl1WUlteXFSMzFUV2xnQ05U?=
 =?utf-8?B?dlB2WXdKV2RKZHFqM3lTVDJSL0pONEMwZ0x6R25lQStjaVJxY28yMWI4OXJ2?=
 =?utf-8?B?Sm9JY0xmMkMzNC9qa3B0eVgvOUpONnVBS3FxWmhVUkMrSm5NSnhGbmQ3MStS?=
 =?utf-8?B?ZE5hYk5uNnJ6bTlSMXpLdk9pWkZBSmFzbUlNM0hSMFR4bVJheTQ2QVB1amo5?=
 =?utf-8?B?ejJNRytFc1JzRy96cWYwWFRGeFhSWDJaczgrLzlJcmZwN1d6eGZhZ0kzOFI5?=
 =?utf-8?B?ZEZ5TFVUdzRvS2RtMjdqd1h3OEgrNWphWHdCMnZnT2FvdVdnQWFUczRMZ0Vx?=
 =?utf-8?B?MFpsQU1VOHgwRlhmZmhEczY1eG1panBwWDNya0dvcFlvcUlwWFVCazJLT0ox?=
 =?utf-8?B?R1daVDY4ZldOYWU3RzFyMnBUTFN6dExFZ0xVOEx6R0Qyd21Xakk5TW5IY2lI?=
 =?utf-8?B?QWo4OTNIenhDaU1GYmdBQXJvY2hZU3BxeUhVYTVTeUdUZnNuL1BMVGkyQndi?=
 =?utf-8?B?Y3U4YkQzWmVKWjhqSHE2NTV6dW9GV0ZidFZsemRONlR5L3dLY3Z2U0MvMHFZ?=
 =?utf-8?B?cmxCTUJDQkljRGRZZXRWa0ozWFI5TGQwbm1YRHRPUnp1bnlCbk81R0xkTmpZ?=
 =?utf-8?B?TVBaTUR4N1kzUS94SjlTN21vMzNad0pPL2dVR0dIM0tzL2tuS1FmY2dGMHhF?=
 =?utf-8?B?SkxjS0loWTlCMm1BSEJIby8yNHR4SkMvalBvUVhhamE5bVloRWNmQjBkZWtO?=
 =?utf-8?B?TEFkelVUWUNTQkNIS2dBY3lGd1grSFFDNzdmZzdWY2lreUFJeHQzQVF0RDlK?=
 =?utf-8?Q?Z+LwZ5ivTJrpa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0RyZktQRFdUL2RtVlp3ZWFocms0aHpIOXNpYVlTWXQwTS9oT2xiV3dJL1Y3?=
 =?utf-8?B?Y1R0clQzQ0RwZHBtOFVmSVIrN1g5ck1KNHZNVXBXU3JKdi9vVnhSSTBJYmpj?=
 =?utf-8?B?SWpQcjBYdWxGOThKVkk0R0N0NWc4dGJNOWlIN2h1dnNQRm9HUVNiQzBQalYy?=
 =?utf-8?B?V0o2VVlmYlIxY3NOTEVmN0MyY20yN204VlptKzkveXU2WlBpMzdUTXUzYXI5?=
 =?utf-8?B?MzJyWDZmYkVuUitTYXhGZll1aDNvWDlBbU9zZmx5WmxjdDR4cFpSNy9GckVz?=
 =?utf-8?B?RmVhWUZla0VtamZ4WTl1UWV4aDZRR2tPbDlpTUZpTmNRL1M0SVhGUXkrenJj?=
 =?utf-8?B?T3VCVEVmRGJBQUJoZDllNU1SOTdBSGV0MWNuVTdwR2RNV0FHNFBXRVVPdDlx?=
 =?utf-8?B?TVFlN2dSV1VRUllVYS9aVHlHcHdZSnc2cmFZRVU3Rk44VlZKVERrSGxxeUF3?=
 =?utf-8?B?ZmYwWjFtMGxCL1JiVEJRN1ZtVjR3NWhVU04rZG8ybllrak9UVCsvRCtaeFJP?=
 =?utf-8?B?VjBXMi95aDQvTUtqd0p3eVRuL044VGJBSXlUd1FGbldWdm0wSmphTExwUmRz?=
 =?utf-8?B?K1BXUXhGVWtRSlBBdFlnMzVSNjFNK1NIK1ZycVZweVNBbFNDMmlFS1p4WU1j?=
 =?utf-8?B?ak9GTzJNekdkdWYwRnY1eTl5U3lscFJNZyt1Ymk0NFcwaWNwaXBhRnlrSnU2?=
 =?utf-8?B?endJODNnT2JERXFqZzcyWE0vRmtjemtmV2lBSmdUaXQyVWRpblZ2R2FEZTFv?=
 =?utf-8?B?SnpQRGVEenA3MEJQcHdvb0VTSnR3aE5yaUFvLy8yckE2ZWp0alM1SzhrQUFh?=
 =?utf-8?B?dXRjVFFmUEE3c1dQVVFuUk9KMkY1YmJQUzFkYWxNbmhZZzF2Tjk2a0l0cldP?=
 =?utf-8?B?ckZhV296Yjg0OHUxWXVnSXM3NG9zdTJXbnd1ZzJERzVneVQxZGlqMjk1N0ts?=
 =?utf-8?B?MkFNK2s1L05rYTR1WlQra1krd1h5Tjgvb1JOTkxGemk3WVdQamJUeEtZbVFt?=
 =?utf-8?B?UHZTNlpCRXRRYmJ5RkFIZ3dLTnpLWTAwcUp6clJYR2gyeFdFa2dBZCtWaVp0?=
 =?utf-8?B?VFpEQ0ZlRWZzOFJMNkFYZHFrUGxQYXBsK0ErUkhyYTY0dFhjMlVWRG5ISGUz?=
 =?utf-8?B?VWxyOWp2blpZWlA2Z1NkVFRTZFdwTERuWXhLOTdsN09QZnJmY1dEZFNVOWZR?=
 =?utf-8?B?Q2JNV29EcDNpMjBOSGpqeHYrQzlLOEJLWHVWRHVRcXdjcVlUckJDUk9Ba0p3?=
 =?utf-8?B?d0ZiSWplOVdJQndEYjRheEdBbHZ4TFhXVlBGdXFkS2JnYmZaZWtKdEtvQ1ht?=
 =?utf-8?B?VTIyekxOODB5US9YbnZzUnpHcWV5S1NNYXNBREl4UDJ0M3UrUUlNdDJmNWVh?=
 =?utf-8?B?eDRLSWZOdUxlUnNiUDdhdkVPQk80WnpucTV5ZmtHQXVkTDk4eSs5WUJTNTZj?=
 =?utf-8?B?ODJsMGUvenRkTm5oN3BTdGU3MzJBaHRrbUdnNFFZYzdvbmNkdHliVkgxek9G?=
 =?utf-8?B?Vm5oRXNEd2ErS0hONHppaVQzcWQ1VUExNnQ0bEY3anhpYm9JOHUvTEdDZGZF?=
 =?utf-8?B?S3FEdWdkMVN4djFYZGVnb2Z5MGRFcnErZU52azlpMC9GeHc1S1BucWt0dGhY?=
 =?utf-8?B?Y3FncE8xQkM1UGhyN0ZLckFlQjFUc0puTE5INW1tTFFYUW5IakVMR2E4Y1dv?=
 =?utf-8?B?QmtNZXRPMFVGMUdmOFYvZ1k0dE5ZSjUxemRJS0xnelNGYm5ac1pIcm1EL0d6?=
 =?utf-8?B?M2VGNkpETmlCYmdjWmNzY1l3V3hSMlA0OUxqWlZBdStKV2MrbWxidjltNVF5?=
 =?utf-8?B?NGxDMEJUSmgrQUU4emN1S210dDVFL0YzMllwSkJJVHBpMDB0aU0vemY4L3gr?=
 =?utf-8?B?UzlYQkxsSXVGdU9YSU9lNnJmWEtUYmplamx5OWJXRUFlRmcxL3dRdGtDUGRK?=
 =?utf-8?B?YkVEMUU5UkRMRUlLSGtJdWFUQnpzNmJMWnBpaWtTSlczRDBHNlpqOXRTWngz?=
 =?utf-8?B?WWhWNTR1U3FUVG1LSm1hV2p4OFhkdnBNbU02RFZxU2ZsajVxT3ZSakhmeTA5?=
 =?utf-8?B?SUMydjhiOWM3Y2VCa2hyN2ZXU1p2SDI0R2dMeGJOVkZYZzBxTjVEZ3NPNnNy?=
 =?utf-8?Q?tMKpSqFlug49fLHT5wyVFFQms?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf117514-d4f4-4802-50cc-08dd2f626d41
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:29:54.3813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDY6tVPDkZ4LbbUsVU+MAm/ZBsVoxWh31yYZrvJYYzf6Qu/kPYFMDIFPQyqjty/BQTjQGVrogcICutDleg9jWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Refactor thermal control methods to use alienware_wmi_command() instead
> of alienware_wmax_command().
> 
> Drop alienware_wmax_command() as there is no more users left.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 87 ++++++++---------------
>   1 file changed, 30 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index 5918750a3bb1..c75ad7ef3d54 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -665,34 +665,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
>   	return priv->global_brightness;
>   }
>   
> -static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
> -					  u32 command, u32 *out_data)
> -{
> -	acpi_status status;
> -	union acpi_object *obj;
> -	struct acpi_buffer input;
> -	struct acpi_buffer output;
> -
> -	input.length = in_size;
> -	input.pointer = in_args;
> -	if (out_data) {
> -		output.length = ACPI_ALLOCATE_BUFFER;
> -		output.pointer = NULL;
> -		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
> -					     command, &input, &output);
> -		if (ACPI_SUCCESS(status)) {
> -			obj = (union acpi_object *)output.pointer;
> -			if (obj && obj->type == ACPI_TYPE_INTEGER)
> -				*out_data = (u32)obj->integer.value;
> -		}
> -		kfree(output.pointer);
> -	} else {
> -		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
> -					     command, &input, NULL);
> -	}
> -	return status;
> -}
> -
>   /*
>    *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
>    *	It can toggle between standard system GPU output and HDMI input.
> @@ -938,7 +910,8 @@ static bool is_wmax_thermal_code(u32 code)
>   	return false;
>   }
>   
> -static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
> +static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
> +				    u8 arg, u32 *out_data)
>   {
>   	struct wmax_u32_args in_args = {
>   		.operation = operation,
> @@ -946,14 +919,12 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
>   		.arg2 = 0,
>   		.arg3 = 0,
>   	};
> -	acpi_status status;
> -
> -	status = alienware_wmax_command(&in_args, sizeof(in_args),
> -					WMAX_METHOD_THERMAL_INFORMATION,
> -					out_data);
> +	int ret;
>   
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> +	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
> +				    &in_args, sizeof(in_args), out_data);
> +	if (ret < 0)
> +		return ret;
>   
>   	if (*out_data == WMAX_FAILURE_CODE)
>   		return -EBADRQC;
> @@ -961,7 +932,7 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
>   	return 0;
>   }
>   
> -static int wmax_thermal_control(u8 profile)
> +static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
>   {
>   	struct wmax_u32_args in_args = {
>   		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
> @@ -969,15 +940,13 @@ static int wmax_thermal_control(u8 profile)
>   		.arg2 = 0,
>   		.arg3 = 0,
>   	};
> -	acpi_status status;
>   	u32 out_data;
> +	int ret;
>   
> -	status = alienware_wmax_command(&in_args, sizeof(in_args),
> -					WMAX_METHOD_THERMAL_CONTROL,
> -					&out_data);
> -
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> +	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> +				    &in_args, sizeof(in_args), &out_data);
> +	if (ret)
> +		return ret;
>   
>   	if (out_data == WMAX_FAILURE_CODE)
>   		return -EBADRQC;
> @@ -985,7 +954,8 @@ static int wmax_thermal_control(u8 profile)
>   	return 0;
>   }
>   
> -static int wmax_game_shift_status(u8 operation, u32 *out_data)
> +static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
> +				  u32 *out_data)
>   {
>   	struct wmax_u32_args in_args = {
>   		.operation = operation,
> @@ -993,14 +963,13 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
>   		.arg2 = 0,
>   		.arg3 = 0,
>   	};
> -	acpi_status status;
> +	int ret;
>   
> -	status = alienware_wmax_command(&in_args, sizeof(in_args),
> -					WMAX_METHOD_GAME_SHIFT_STATUS,
> -					out_data);
> +	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> +				    &in_args, sizeof(in_args), out_data);
>   
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> +	if (ret < 0)
> +		return ret;
>   
>   	if (*out_data == WMAX_FAILURE_CODE)
>   		return -EOPNOTSUPP;
> @@ -1011,10 +980,11 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
>   static int thermal_profile_get(struct platform_profile_handler *pprof,
>   			       enum platform_profile_option *profile)
>   {
> +	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
>   	u32 out_data;
>   	int ret;
>   
> -	ret = wmax_thermal_information(WMAX_OPERATION_CURRENT_PROFILE,
> +	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
>   				       0, &out_data);
>   
>   	if (ret < 0)
> @@ -1043,7 +1013,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
>   		u32 gmode_status;
>   		int ret;
>   
> -		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
> +		ret = wmax_game_shift_status(priv->wdev,
> +					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
>   					     &gmode_status);
>   
>   		if (ret < 0)
> @@ -1051,7 +1022,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
>   
>   		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
>   		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
> -			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
> +			ret = wmax_game_shift_status(priv->wdev,
> +						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
>   						     &gmode_status);
>   
>   			if (ret < 0)
> @@ -1059,7 +1031,8 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
>   		}
>   	}
>   
> -	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
> +	return wmax_thermal_control(priv->wdev,
> +				    priv->supported_thermal_profiles[profile]);
>   }
>   
>   static int create_thermal_profile(struct wmi_device *wdev)
> @@ -1072,7 +1045,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
>   	u32 out_data;
>   	int ret;
>   
> -	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
> +	ret = wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
>   				       0, (u32 *) &sys_desc);
>   	if (ret < 0)
>   		return ret;
> @@ -1080,7 +1053,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
>   	first_mode = sys_desc[0] + sys_desc[1];
>   
>   	for (u32 i = 0; i < sys_desc[3]; i++) {
> -		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
> +		ret = wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
>   					       i + first_mode, &out_data);
>   
>   		if (ret == -EIO)

