Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E147DF90
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551350; cv=fail; b=JL1fN5pdiAnnHskA+9rPPwYHSRKUJQPDIzXTnQK/96SWc7t6zp2Xk4JKKGwZ8TYjHN9PPrs+W2STcW2zGo0XakmDHfpTSf1VggrGSGObgRC/FaL9Yo4QQs8qh2kIKEeniVCxkEeBww/C/ncSx7Q/iMglKXUsOMiuHT72GRYMll8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551350; c=relaxed/simple;
	bh=r/+We6fENsIgMKs2t9cl+ulCQn99LfPjSixTxmE7nxg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SgP4Yq/caAuThg4d0ZtAOuM66Pf/sd1gwRnjhoXi4bKXCBsoqrAsZ3Im4mt8aaNelBsyUUFbEdz4Knp5/B5OJouuqCIoxSTqEfMZNNMOGkL7BrIwnMMaOcugbaNjaIdSprPM2Qw3xLIDts6M5F3B1CjHw/ztTs3aYCOxrRrB4ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IjaiTzOW; arc=fail smtp.client-ip=52.101.53.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IjaiTzOW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oicFdy6yc4BNxuh+6TCvf1+VaucIO62IeCSYJrTe8jfAYCMX6UGT/c/h6qj+FgpkhEtl8n+zZzdTCDzjqZKcpr9o/NBJTSwcfTYX6lfW5CTuDLHfMGeug2kAnL2O8RvIRBAwL0OEJY7RpuoRzRlsUVkCFWrHHw7volzGoUNdnlaAwlRXhv4dqdayRalske1FaXsOGq+iNeVCKKOhGz5TTiruokRucMWcQW9yF5/p0xTA+NRNcO7DU8JVYh5Wva3TXIuT84L8qLXGkgXAIidU+YpOS28MzpcQy8O27BmflHxbJ4hDWVPxdhlg40T5PtSH9YNy+TWUhW96sdkUhWWEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHbbodkvSMB9G0F7slZaGGPqd4jezPR4P1QqubHTJPw=;
 b=cB6A15vvZ7YNiEvh6DI6OgsT9nlZPRpIY5oGPjiT6PRARaT0QM8AzAR/bAA2Nj5OhMPpHem9qURfgfDPeA9d16NM5VPcCKWvawgZDRhIi+9xG8t0uTz0GcYZ6Zy2wlSVgRa4Dia7Wr2dTLmTOa1mP148pdv5r6scqRE3bQR91uriDx+PnP/9cFIwhEkjjpfCTbAz39y9yQDRaCq9sidqikVA7O2s7amwNkoYT2pm0f5Jn5lUmhoqbiEIT4QOjWzFxZmr8+0zHDLCgir5cm3MmUwmhqaHDVhRqf5ut3GCrw2rG1KuzqSOev1K0MOCJ0Tb+4uyqgNSKlEwK+XRR4cPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHbbodkvSMB9G0F7slZaGGPqd4jezPR4P1QqubHTJPw=;
 b=IjaiTzOWUu5Yx5wZBw+8E1/JI/vgKkNwWxhTjJ6IUtzraHBuhT1fgOU/Moer6aiIpwL7BrWNoBs29h3b1wFPDwFTlSaxus/ZHEWspFKEyyNrR60pKaaQzFzNHbpT3FGiEEhsiFUdP6V2m1YEIUOpShmQ0a88nxN28M5NBfZ6Mwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 15:22:23 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:22:23 +0000
Message-ID: <33643e05-91cf-4da9-ac08-a16681a61fcd@amd.com>
Date: Tue, 3 Mar 2026 20:52:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] platform/x86/amd/pmf: Add util layer and userspace
 misc device interface
To: Randy Dunlap <rdunlap@infradead.org>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
 <98a467d4-c0ac-46ca-aa59-00b392d6a30a@infradead.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <98a467d4-c0ac-46ca-aa59-00b392d6a30a@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0265.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH1PR12MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: c9bbd0c7-1614-47f5-2912-08de7938aaf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	Y3LffesBlzjXMZuUw2gZrgA8mQ8DXTQP6v8VR/SXIjRLq0Rc0NtpeZAKStCBFBVrF83cir8T/pYK6afNwZAApa97sYBoExy6OV22fWXbnoUcwcJpLYf5ucKJJoEa2tpAFgb+D5Dncc4ULZYmBBeML2tofMVHwdxe2MphnOAK1TE61iXOOfdAbYuSU4U/OJOtyk2tOssXaHAJZce9LxiJs4oFtTMsKKiuSonvTBPtic7roo5itfNYUVcaDCCP9uaBCmyNWCQbGWzr2aTt+UaPZMvF2p5CFYTbBk6HiFz0BBibdUyCDuzNiCX4DL8TYYpCDKdu8h8DIhNU+ZL7zbwbu3rFpAGvgHlZwH9G8HQXMlkBG7scHNsBWjc4iLV+i75MSZ24yOQHEcsQAKRUTVPKR/2SU3Kohoga2ckwhexojPKx+DcO3Rbi+km5WhcDgG7hUakbfaPS1rtEdNGJbQFT+KlBkJ6D9R+u6Z+t/pMLNIEZxOsfbHZVymu93IQoROgk8MQurfV33QeEGFoTR+EkE/TAb/JB5EhH0TChjlOcPLUcfiLW/frnEuBOpg5RVo4khGLMaVVbGQdzQoo1WAZWeOSZd1YhKcRk86h2rhtCUu0687E2t8f4fBJejTtQMSqi4nuvIFN6W5mI7wNBYalvor16ag8vMOYU4plrJDb2PVMO83Qh/qg2UJmmXWpbq7V6QsrtqYnB/dobE7C9Z9IorQdAX6rlqc57qpr1qqeyYsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1xWTMzbndVaVJJRFFoaENUbW8xK280S3VObUZUZFkxaWtoUDVpSG5oUVV0?=
 =?utf-8?B?MVd4bXA2ZzBaRFlYalRzQXZOQ29ORHJWV1liRzAyYWdIS3AwdCtVQkhYU3JE?=
 =?utf-8?B?cVM1bzFVdHJGWEsxOEg4bXBSUlhZVFVEdUNDUG9YS2hJeVFyTktXUFVQS2NO?=
 =?utf-8?B?aHBSVHFQckJMZU9JbzdFYVZnekxXdmVvb3NITjdMY2FRRjVCaFJ0VnZGd3BC?=
 =?utf-8?B?dUtGdG5kWEF6QTh6am42aGd0SUdQSWwxZ3Z5UFFUM2UwakUwUE5HeVA0MVow?=
 =?utf-8?B?aTJPN2NITEFLT1BXUHRRejhSVHdrbXFPVGdKcmMva2tDS0N2djFHdWdSZnoz?=
 =?utf-8?B?ZGFBS1lLSCtLY0tCMDNUaDBKSlVxVjRsOVlXZGlzVXcxbjVhTHhnRkpFR0JT?=
 =?utf-8?B?dXRaZG4vMzQ5bXNTb2MxNkpocXNuVHZCOW05cExzbi9uRXA3K1p0VkhidDlG?=
 =?utf-8?B?RlRNNFEvZmRzSkorRXgwbXNFV0dUelBHZjJlY2xWM01XTnNsbHN2aXVtVlRi?=
 =?utf-8?B?c0x2VUloMDZBbmdxSDBlSDl6d2VNUkNzT0t5M1hGZm8wbnFJWVdtOVhZRnQ2?=
 =?utf-8?B?cnluSWk0UXNKMjdIdlBOcUZDYkpTOW5hVVY4T0pGQUJUN0ttSGdsUFhIaGtr?=
 =?utf-8?B?djBhS3BoVndaNHRYK3gvdFJrckVJS3hwbUVBYXYzZlNRc2s4SjRObFZRWmR3?=
 =?utf-8?B?Nkx0Ym0zWDNKeEI1UGJodThicVN3S3d3MlJycWZ0UGNPbi9CMXN1VnBRbTFz?=
 =?utf-8?B?U3hNTnZPTGVqeXV5RVFFK2QvY2ZobFF5S0lTL2orVFdZMzRiaHRTd09xbklU?=
 =?utf-8?B?WmNXcW9SdktUY3dDYkdqRkRYRUhNWk1iVTkySEtXMHhOK0JPUG5vNUZlWTVz?=
 =?utf-8?B?b3k3R1J0bE9wK1RSeUpTS0RLeFpCbVA3bmxNWXRteVJ4TWxWME5KaVF1RXVi?=
 =?utf-8?B?QUV2NjB3dUsyMWFUZFBya3R2Um0yWEZodlgrR2dVSEVHamNvMUlxYldkUXNJ?=
 =?utf-8?B?MUttT1d2WFc4YUd3SmlJdmlRU0Z3Uy9vdHR4eGJOcjhzVkg2Rm1DTXdwSXhZ?=
 =?utf-8?B?bm01dm96aFNJOVJ3d0tNMVI2N3FLMkNZU3ROSDQ2UHZWYUdOb0s5SEh3MFIw?=
 =?utf-8?B?SjRxWEZXck1aeFpCQUZtbzNVSTFEYnFmRURLN0pJY1BzaG90NjJvUnlXaVBU?=
 =?utf-8?B?MWMwTlZ3UjJrUDNTQTgzOUFuaXZwQllzZnlObEdZcGtoU0laOE9vc0JMZEFv?=
 =?utf-8?B?blVlMGFqTjBsTG5IUlkyRkJlOVpmQkY3V01pSDYvczJaUTNscXFuSUNDNThR?=
 =?utf-8?B?SnVaZGxHb3c1c3o4b3czSitHZTZhcFpoSFJCVlAwS21LT25UOXg5K25qbmdD?=
 =?utf-8?B?TXJ0bnR6WTdVMFMzMjQ0MW15UDd1QWd2dHhGUjFPTll1bk5oRFYybmFJMlFT?=
 =?utf-8?B?Um9CODMxWUp3SGZCeGVkQjh2ckF5TnE5Z1hzSEN2MHpPMHpUcFowdHk5NS9M?=
 =?utf-8?B?MEhqS1AyVVZpYTg0K3JVdDREUURLbkNQajZpQUdKQ3QvUldHV3RySmpiZkI0?=
 =?utf-8?B?V0I5Nml0endjM2dVYzNxYzk4bWNDeG52RURaME80OFRyQXUwdGRpNzcvRCtu?=
 =?utf-8?B?b2RRRG96Rjl0SmtIWWVGV2UwL3UwYnd2SmlrbVA1UEc0c3FLYlRZQVhnVHFm?=
 =?utf-8?B?KzNYS1ZvNHhyai9DRVNBclRFQzlaNEFBOVU5bnlCY2VLWStsTkl0N1lwUjhZ?=
 =?utf-8?B?b1FObi9yUk00ZkJ3NGlXZHNwck1FOWxDejV3WUpxanlLZmVOS3N2c1hyc2l4?=
 =?utf-8?B?RVJndUdBYktIdU0rdEV2ejBzTCtmYlgzbGlkUHppYnVCWU51TWxDTDdOR3Q4?=
 =?utf-8?B?SzFPWkdkSUlrWnJVSkF3TVhGdjdDaFNOdWZkU1hacXRpTzJwdGk2aWw1QjJh?=
 =?utf-8?B?VFRrZ2JReVFac1ZSazc0MW0vZTJzQjJ2cVVLZlJFNzl2U1hYWHhKWFR5NkQ3?=
 =?utf-8?B?SURGOGJqNkRhVUxLakR3LzJrK0VjbjFibHRFbjBxdTdKOTZmQXJFdGY1RFhq?=
 =?utf-8?B?eVhFeHVtcjhVQ0JZam9KYzlOZ0pBOHVsMTJyczVRaDF0aEx1TDZtd0VUeitN?=
 =?utf-8?B?OFYrZlNCNDRGK1ZmYWMwcWhvVVUwelVhZjdpS2ZUSzNZT3ByK3duYUM3N1Bv?=
 =?utf-8?B?bTk0ZG9YNUFhZXM4Z0FYeXV0SERKZ2Evbmt5Y2plL2MwNlgwbmh1SzN1OWlY?=
 =?utf-8?B?TXJBc3AwZW9hS2RaODNsMWdEWGpCR0IxdEg1dFRtejNnL01NU0xlWWpYTG9K?=
 =?utf-8?B?K1ZoRklLSzlSNGN0djVkR0dvVnNPend4aDdTeHUyZXRSb0dDOW42UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bbd0c7-1614-47f5-2912-08de7938aaf0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:22:23.1023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfAusMbPhH3rhPJIylUVMrdeHnntdX1kJXvdK2rFWtIB5bb85pzD6yz6vZ23CzwUWEmVGNy6YtHacK35zyAMPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9575



On 3/2/2026 00:15, Randy Dunlap wrote:
> 
> 
> On 3/1/26 5:11 AM, Shyam Sundar S K wrote:
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
>> index 25b8f7ae3abd..ad21f679b8ab 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
>>  	 in the PMF config store.
>>  
>>  	 Say Y here to enable more debug logs and Say N here if you are not sure.
>> +
>> +config AMD_PMF_UTIL_SUPPORT
>> +	bool "AMD PMF Util layer support"
>> +	depends on AMD_PMF
>> +	help
>> +	Enabling this option provides a character device for userspace to capture
>> +	PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
>> +	Power Slider AC/DC) along with PMF metrics from the AMD PMF driver.
>> +
>> +	Say Y here to enable it and Say N here if you are not sure.
> 
> Missing indentation of help text.
> from coding-style.rst:
> 
> 10) Kconfig configuration files
> -------------------------------
> 
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.
> 

Thank you. I will fix that in the next revision.

thanks,
Shyam
