Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BBEA47
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 03:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087734; cv=fail; b=jVlfIAiEE9rrjMYbo5H75Uxi1KPv/XR+spAMt0Pq8Iz75VKdvMADqL77oK6fSt6615DI1safnQ5TFYkajxxo4y+wzNV1IYmIIDVGjg2SQAkeKU6QUCaOsvsoRn0pfnG+qfoFig3fOBbfahQg+h3B0nAZ6Ydv4LfxghbwwMFSbLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087734; c=relaxed/simple;
	bh=4HTj2A8q8XVDmGjdO6H4hXJ6AN8OhYwXcvgfpOqahPc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=awbaDXBLwpyfxrwYN35cfRYGv1/qCyJJcWuq6ReNtxGA1qViOEDrqxIN1FVjLi1qUoSDHJT3et13NCq/wJfxrMocdOYIoB4hihqnk+ASLk71ZXTC5UDLC40G3Ne4gLBX+MgV3EKb475p0A8aFIIdNVXvpNTUsuyahk9IYO6VxBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LL0VGLsq; arc=fail smtp.client-ip=40.107.223.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LL0VGLsq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3zAxbWwixDhmqo/bmxVLWKMt114SIHpVIIh47s6uDWA3jrPdUP/HeQ4P5+AyCtK3cdU/AFVWcuQ3ZXquhXCOioALZBEEoO2ci8nKf00dokibvFMkVjI51ynLjrMwRueq0x2NN1w2xQhPyCtH9cxeCDt9OR/iX2gJzOu1z/f1zwtCgwjE62tXMetENE7qaPxQLLCTIA6UVkwLI982vvtXk3HbpBo6K4m9SqM8Jh0U5GEIUd65/7KYgWUCqXPphidEx3LB8z2wuhi6qxcO6TEYeTHJKUpQoKEfoysV2eEXCZlWfyglXwci7XwmjmYAl7myELmcMjIXvnZM0us46Gbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4N1GViGajwRFX6nsnuHNKfLAASqfZjKw9H9ZqopV4U=;
 b=kCIvyRj1hmGN9N0oSkEDgROoPiIrBqMzxld5+ddCibXjrHd/vB79uNs2nVpBSDNi9rz/P6l11gsqua/2Pac236fM/eDT8zLOSrP7uBEBmtYDFkLdCFHhV3O1gV29rhoMnvLYgOjISYhtLHLb3MdRsfG7++q0zxY4gsUrTmH3xJxIGeEA/3NFTvmwiszg27e5duvyDfa1Nq2tLhT4t/dn1TvpS9oFprZOl6QKD+C/0zkfMmZijgI/eod7g8HTpZhKYMhl4HisLQzZj219GTZRnVxvgHpM9dI07j8+cglaskV2lMtzn8YINZFVaPn4YabhQp8nscj/Pn6IFv2ymtv+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4N1GViGajwRFX6nsnuHNKfLAASqfZjKw9H9ZqopV4U=;
 b=LL0VGLsq0dU+pew7ITqIPpREbLEjSKVgT2JKr7M+IcWGmmvD/l6ict9dGh8jNMfrYFH+LyGajsbuWa0Bd3H6EvKG+Oo+bxbYXXHCEvrIB3hUJZ0RzZQ/Fp5Kqahf/yGft1+32eWIt2gEFSRJP2vzVx9FpxJ5u4X0zYLjRa8jLtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB7329.namprd12.prod.outlook.com (2603:10b6:510:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 03:55:29 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 03:55:29 +0000
Message-ID: <cc52d127-794e-439c-be6d-e6e7bc6fad61@amd.com>
Date: Mon, 28 Oct 2024 09:25:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Detect when STB is not available
Content-Language: en-US
To: Corey Hickey <bugfood-ml@fatooh.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20241025051141.924760-1-bugfood-ml@fatooh.org>
 <20241027023428.419116-1-bugfood-ml@fatooh.org>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20241027023428.419116-1-bugfood-ml@fatooh.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: dbabb920-1114-4305-c76d-08dcf7045cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFhqRS9GNWZSclRud1o0ZEdIMEQ1MndvaFpBRk83MjJZZnFnNmJEc09ZSzBC?=
 =?utf-8?B?cy9FQTJYazY4Rlh6NnhIUHdrc3JXV2M5c29memRTL3NHK0NpWEEzbGVLVFdx?=
 =?utf-8?B?cDJFYUxmMDl4OCs4YmpjWHdCSGlJYjRyNGdPSGJaR3Njam9kYTBLNkNqREUx?=
 =?utf-8?B?Sm04d3U1VHdmbmUzdG9YVjF6Ym85SW1hbnF3WXl0allUQisyK3RpOTJHdEpO?=
 =?utf-8?B?blpPZ3FmMkRNY2xRN3Y3STJaZmJaN1FnWWFLL3dMOE9Sbm9vOGZ1ZnhPUWZW?=
 =?utf-8?B?dllWUnRMNkJjRDBPaHB1bHJlaktWTVh3T1d4YjVSVGV3Qkg4eVdtY25TalV1?=
 =?utf-8?B?bEhBS3VtUUxTWWpXVkw4ZW1CbEwvQ2JMdHprUENKeStyTGV5dk9mT2xPYk9o?=
 =?utf-8?B?OXlsU2xNQ01CbFl2aE1FbmZGVnRMZ3Exd3FTc1JSMHdublR2N0NSSUd0bEd1?=
 =?utf-8?B?Rkgxc3lnd05mcmVpdDdTdlhRcExNZDRuUFdMYUY1M1pqUHNKM3JGQ3dJZWN3?=
 =?utf-8?B?dWF0VFFWQTl0ZFRRRm1EckJlb2NEVEZySWFYNkdYTEdIT2hIdzFtbWd0bm5o?=
 =?utf-8?B?eVNtSisraUtaUXpaVElIRVI4UG9DbHpKbHd1Wk1NcFdxTldVTWxBdjVZaEhH?=
 =?utf-8?B?V2o1bGo1Zk5oY2IybHlTVVBIOTFHR0JZTUt5cHdQbjQ1cHpUVVlvOEFxREhE?=
 =?utf-8?B?dE53NTNzWkthVy95eEptZHA5S3JpVWtENVVZcHBDZE5Ea1J0K3ZsU1Ewb3h6?=
 =?utf-8?B?MzRwbm9xanRnbW42MS9DcWxhREtnUVF3aExkMlpoZjdmTmp1a0dUVVVnWDFt?=
 =?utf-8?B?V25zK0VnQjJySzZ1YXl0NjM3TUcrL0pyVHV1UGVNYXdMYklhNm5hc25taDVD?=
 =?utf-8?B?N2JES1NjVkt0Mnl5OU10MXRuTjdHSnZaemxja04rZ0s3WEc5NVBHSm5kUWF0?=
 =?utf-8?B?UitISW1yQ3NKTm10QndvRkw0WTFUTWhVUVphZXRLQ3o0Z3duWGU4eGpCMDdj?=
 =?utf-8?B?VWJVZ1B5dXlMc3dsYjYxaHcvTEpJTnZzS1oveEtocFVZRWVYa1hNSFNubWxB?=
 =?utf-8?B?MVEzbDlaakRPL0JJYWhCQWJHUHRQZExlMHc5bHdlRUlHa1FmT1BCOTVNMFp0?=
 =?utf-8?B?UlRmaGVuR0RMbUJSbXFxM2h4WXRNb3pXV3JIdWd0eTZONG5lS1VDdjRLOVhY?=
 =?utf-8?B?VWUyVFNYRWQxSHFQbTQ0R3VUOWozL2Jtb2s1SUhGb1AraDVTQThZakRkVkJK?=
 =?utf-8?B?ZFF4YUxjNWY2TXdPVVNDSXRPb0EramZJSjdGSithckNHRWpNZHgxb1NFeElN?=
 =?utf-8?B?UHBDUlNLT3JYb0tIZXVNOU9XVHc4TXlONytFZk5PZm53cmxHVElTWEV2aGFs?=
 =?utf-8?B?VldyQ1ZtU1FMRHU5VlBWSWZnMnFuNjBYUERxYVhZUVE0cWhMOC9FcktQTE1O?=
 =?utf-8?B?UnhaUktKNS9IUk9oU0RiaU1lK3Y1clAvNFF6cEcyeE9pL3FNbzA4a3JrSGtV?=
 =?utf-8?B?M2FBbnhHNUZ1STJWR2Q0eGw3UnJoQlg1M1BkODRZQXJvT09xcU1KZUNCem5u?=
 =?utf-8?B?L2RSWTlRRlJiazd0NlpnT3JBV29ick5LUGY4N3FzenRBL2dwTE8rcFVTMTBL?=
 =?utf-8?B?SDNPS09BOTE3dEkwZWJkMnhTWFdOeXJtUHRZdkp6RXF1RTBsYnE3YlZGQTNz?=
 =?utf-8?B?cVB3UzZzTmtqM08rZFZURUdxbEh5bEQ4ZmdLWnFXWGZjN0p4Wk1YbGE0OEhM?=
 =?utf-8?Q?Ko+CsumGTi3xknlo6GYg02peD6EIvRSSiFz7ABQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3F6L3RBU3N3VExNaWFkc3JSbTFheVFkUzdyY1EyaGo2b05YTzFHaGVTS1A0?=
 =?utf-8?B?QkNVbTZaeUFCcWpxVmZsaEZBMWR1KzV3RnFOeUVmR1Z5MnhVU1huU3drTnR1?=
 =?utf-8?B?cGl1ZUlXOTl3TG9hb3B4QktjR2ZLRWRWZ3BYdXlkMWEyQVIxSktoZDJ5Qzc3?=
 =?utf-8?B?Sk9CR2Q0TmdieWRVNkJOMHhtSkJMc2duYi9GNFVPVXd6ajlxWDZZS2wvbVpM?=
 =?utf-8?B?SnptVzVlRkFTc1hZaVIySnZ2MnJjTFAwWUVZbGR5bDZrTWlUQUgvWjlxUUYz?=
 =?utf-8?B?SmJLdTRvOWlacmVKOWVYRW1HS0FZa2F5WEpLZG1aWEl0RFJnVmprWlY2QXU2?=
 =?utf-8?B?Mm9WSHBUKzRScnpJenBsN1U4Ym1xMFhONjZZNnBGSk5xSXBLRkJsb3VmRHNL?=
 =?utf-8?B?L3hiRERCYXk1NHhpSE5QcmFSOTJVbHU2VHVyNXA1TzVuempWdVdYUjNGcUM5?=
 =?utf-8?B?ZCtDdTZ1VUhWMCtWTG1tQjUwNllkN3ZaWFVUdHhoUlN3aWtiWEgrdm80WmdP?=
 =?utf-8?B?bS8wMXRvekpyTzByK0MxWmtZanVJWXNmaTRycno4aGw4SWJGQitRejJxejhT?=
 =?utf-8?B?RVJ2MlAwTVU0by9FSHlFVjJEVmd0amRWM2dsRVFha2c5Wis2c1JYejVZS0E3?=
 =?utf-8?B?YkxqYUtpZjVUSUVpTEE0TjIwRnRWb282aWYyUC9mLzhiMDNlZjl6OFpRbTZM?=
 =?utf-8?B?THVRMm1OOVlGUnp5TUdKdWorQmw0Qzh6VDlCYWhUN2d1ZTk0a1FNdVJnai91?=
 =?utf-8?B?K1QzcGp5NS94c2lmWEJldE5FQUdwckRYeFVnMHJGVWMwL2xJSStJZTRQdGFZ?=
 =?utf-8?B?U2ZSME1HZzNKMUMrUzFvdkNKelZiZGdlN0hFMXRORzdXUndpOGltR3RieGhV?=
 =?utf-8?B?ZUpsL3RXbWFSMzJ3U1kwTVlYK0oxM1ZueHdBOEFydjhmOEw2bXRsaWNOcWl0?=
 =?utf-8?B?UFV3cTl4YldmWUd2MHBRanl3ZElTT2Z6c0NHTW9wNDlSL2hHUloyK1dwTE5t?=
 =?utf-8?B?YXk2M1p4dXVJU3prOE9wVWp0a2Y3VmkyZDlKbEhqRTBjZytlNWNlTVQ0WDd3?=
 =?utf-8?B?UUp5clNaN2lFVDIwbE80OWxTTWdFSmQzSEt0TGxuWEYzVUtHZ2JHTVU1Myto?=
 =?utf-8?B?NzNIMjZEakt1NmN6cUEvT2VLeUF5bkFOSFdmQXhhbU9VNVZJK2Z6Y1Z5TDI3?=
 =?utf-8?B?VEdGM0lkUlRyRFhvT1RmTzQyVDVFZW81b29XeWo2cFU3a3BCbTU0SEtSMTNI?=
 =?utf-8?B?cEJBempuVTk5T2h5N3JEbVRaSEZza0NiOXNQNXdzemJ3RTgrbEpKZFdSRGN6?=
 =?utf-8?B?QkxYSXZoSlRWbmVTcTBOYVpKWVNxV0tSdm13ZjY4QXNsWEFEeFNSUWxBdXpp?=
 =?utf-8?B?aUVKYlRWS0REb1JtejFkSWJCZkJoa2RhQjI5S3BSYXNQc3JTcXpKcVRkT3FI?=
 =?utf-8?B?VUYrb1B2SUdMa0NhMGRJNEhoTVFDejBiNnBKNUVFOWNubnJISUg2Mm1MWVFL?=
 =?utf-8?B?R2doeGkxT1RVclRVZENhSWtpOXhsQVlxSWs3T1VUTU91aTViRnBNSFRjekVt?=
 =?utf-8?B?ZU9IOXBDanNHL3laQXRDUUIxWGdiS09oNm1jYXpFUTVTUWpmUG01TURoSElW?=
 =?utf-8?B?WU5NeDYxbElIN0ZSbXVQUjZDUC9BRmNTeFBXTjhoTXdjLzJadjZqZ3I1N3VO?=
 =?utf-8?B?UFVPWFVkNlVpVjNoMlRQTmFpRnNSVWc0NXdxWHpUaTJsNHZDbFlTMTM5MStJ?=
 =?utf-8?B?MnM1Y21WZ0Rqem53VmRKOVhNMlJveU94M2dsLy94eTRVZVM4RXFSQXFZSC83?=
 =?utf-8?B?U0FicFFkZ1g1blJ2NTlCcHB1QlF0SG1NcDJ0RVFUa2tMZGJBNkNzODNoalNZ?=
 =?utf-8?B?VXNCSnB2QjJMRHg2Tnc2SElTWUdkWWIrQUdnTFJabi81USswRFN3bElUNm1z?=
 =?utf-8?B?d0EyK3JiMlB5ajdxRzV0UkdlOExkY0RTcEZsQ2NDZkVNZHErRCtMWTV0UTJ3?=
 =?utf-8?B?SXZsYWU4Vkc4ckdTQm5HalRjdlpjeDZWQ3lKU0g5RHdYUmNYV3dkNTQ0ZjMy?=
 =?utf-8?B?d1h5NFQ1Lzh3RkZZNTM3ZVByUWJseHlZQm5neTVTWVdlRnZmMjJwWEg4Ti81?=
 =?utf-8?Q?1xdGMOKLRNd81sgy60f2AbnUJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbabb920-1114-4305-c76d-08dcf7045cce
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 03:55:29.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8WkVrdj/jKrb4ZFiwyaqw0Ybzic9swATA7XfcHM6grMg3v7S1YJ5SboATGaN9qZvlQxd+37XJhr2GHdfL3cuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7329



On 10/27/2024 08:04, Corey Hickey wrote:
> From: Corey Hickey <bugfood-c@fatooh.org>
> 
> Loading the amd_pmc module as:
> 
>     amd_pmc enable_stb=1
> 
> ...can result in the following messages in the kernel ring buffer:
> 
>     amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
>     ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff
>     WARNING: CPU: 10 PID: 2151 at arch/x86/mm/ioremap.c:217 __ioremap_caller+0x2cd/0x340
> 
> Additional debug shows that this happens when the calls to obtain
> S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return 0.
> 
> According to Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, this condition
> indicates that the STB is not available.

No need to put my name in the commit message.

You may simply the commit message to something like this:

Further debugging reveals that this occurs when the requests for
S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return a value of 0,
indicating that the STB is inaccessible. To prevent the ioremap
warning and provide clarity to the user, handle the invalid address
and display an error message.

With this addressed

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam

> 
> In order to avoid the ioremap warning, and to help the user understand
> the situation, catch the invalid address and print an error.
> 
> Link: https://lore.kernel.org/platform-driver-x86/c588ff5d-3e04-4549-9a86-284b9b4419ba@amd.com
> Fixes: 3d7d407dfb05 ("platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature")
> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index bbb8edb62e00..5669f94c3d06 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -998,6 +998,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
>  
> +	if (!phys_addr_hi && !phys_addr_low) {
> +		dev_err(dev->dev, "STB is not enabled on the system; disable enable_stb or contact system vendor\n");
> +		return -EINVAL;
> +	}
> +
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
>  	/* Clear msg_port for other SMU operation */
