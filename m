Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4431E1F868D;
	Tue,  7 Jan 2025 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285419; cv=fail; b=t6UtDwQLnnIQj5aCHfTdw2u1tiQIr6hGFzhoBXHVOM+n0ZzQMnDQyiGPEzoBQPMRed1s7ObSjxkJF5fkFIhOS4vngd3lPrbTdQBWClkUJHpc0nhB2W0Vh0pzpVDUmGLmkNNtp3qBXQSypdZNP/8yPpZUh3SVfCs8dRsttdDXwd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285419; c=relaxed/simple;
	bh=MH2u+dxy+P4Q/mo5t7s3H/1tfGhbRHCKsNfAXbiT5L4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lOuXa4jbRulBTZ6buI9DQS80yy7tqw1zX+ERK3PFoyh6rGaQvQpnx19/iKm+ZzwxhUsLaGYLRMItPT/NX7r8J/DF5XOrjP9E0CBWROj61y04+WFJZ6SpVicvspxXGO/j3Ab9dhjTjRP1/pYHHHHX47c2gKsaC5HomXvjVdoKnJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PzvkaCqt; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PzvkaCqt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEcZJvN7mlRmQegdfOZTSRTNTeTKDeCOY64e5DT+TtbN8D2WxsktDCUWoy3oViqSvQu8VXfzK/YlWQOk4tPlX/Rwqr0x23QSpHd2UJQphNbipF4cmzqQDJglxdbflwRKT75FBQAWXlXkid6GEaC7ZR/TR0jvPquo6GNOaEGTvvnCC0xebq7gOLyfi/cTEMoKv8smh+apfAoMNTrpdSNM5iVy8AISOCJMe/46a/oBgWBP/8ZM6MSx9Kev5YR7EYhIyI1aQrm/DpDnNPkuNDvbYvFc825/+8lNpL8ibhkdbI46a5dhghVgkTiDhlmzqZIlRzgWJqFrusibvVc6NsWq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkaj30e97IatN1VJs6rJhIDdkjVBnotkZ0fAMZw5rpM=;
 b=V4dGriHTcgK5gDyyVp9w4jyw5DOjtzVTe/gP11D8Oz0UaTjWtl2jQVhgTrhZofWBvcksfAfWgzflS7OwmKL4aEZx4RyejJtPcskq0RXT3N/z8KEv7gvZTqsUCVisanuPpNn3WptpVmuPAnETMjiOsQen23hNKaC3HyARPPK3jW95ou+ql8e7VVYVmK9i0yLeDxeFSYMpMewidtWN1TTL10x2h3KKd+S3+XzP640uceiAkzh4nzn69CZm5fDptmUTDP+WqZjDFelfVN4LvH7QNCOOk1Dif4MgAD9mWJ1gq63Ars4k/RMJIU3qIWsZgcYsSQDUNooEcqv+o6maISGbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkaj30e97IatN1VJs6rJhIDdkjVBnotkZ0fAMZw5rpM=;
 b=PzvkaCqtFU3HuTuQVXlh5adZXThCRi+zhwtqlne7uvT5h5Mc5ADVBSBLajXgKEDifdoavccRvBK2wreo1ALFCpQHqEM04ZxC7H1HBPF9nG6hbeoFjpvZ/Mvt6eJVv/6SQAXQLXZqwpWo8ZgqOjUd9gzwH712ik6WklbNA7LQn78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:30:09 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:09 +0000
Message-ID: <71aca138-2a2f-4999-9e40-c1560482f6d6@amd.com>
Date: Tue, 7 Jan 2025 15:30:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/20] platform/x86: Rename alienware-wmi.c
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-17-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-17-kuurtb@gmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0a539b00-55ed-4894-35e8-08dd2f627636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWVzQVZjcDlvMDYvR3dORDZYbjBOOFFOM3dTZHdLek1nbG5jR0QyWDNjUnBw?=
 =?utf-8?B?ZnNxSXlDYkF1emlaQTduSmpWS0NhQmtUQlBnRlhLMEJqSDJoSHM5cU85VG1Y?=
 =?utf-8?B?ZXErN0kzVUVFZ0ZmZUdUWjM0eERsT0VHK2JLSUdhdXBGOVNzMk8xcU1NOExi?=
 =?utf-8?B?VHRCOGcxOGpYTkYzMlZpbHQyQklieFJSa2Q1TVdmQ3llTFdONktkWXFpYlhK?=
 =?utf-8?B?YVpwZGp6a0p5Zm5HQys4MUVOc1FoRzlUcXJuSGhyQWxQZFd4MExwd2ZnMFpJ?=
 =?utf-8?B?SHFscldoNHJmNi9NNE5zcjdJZkpTL3RVc3NGM2Y4TDdyZkZrcE1SR2syT2ow?=
 =?utf-8?B?MlArZmRrTXliVVM4T3haL2ovZ3NxYXJ3dTlqUitHcjd1Ti8vejQxeDhrcnRH?=
 =?utf-8?B?SzVzOUJXNlN3Ym9Cd0ZYOFhaOVhwd2xkd0ppbDVvc3Mzd0dOWXlnQUpZdUs1?=
 =?utf-8?B?UWFmVlc0Y3NuS2lQK0J6aS92VFY1akJabTRNVHpid1dEMjBuVjJFdGs2ZGhB?=
 =?utf-8?B?cWh3TDBkOUxPUHQyc3lhVklrbUtwOXhhb3hyTW9lb3N2UFZvZ0hLTEJOQitN?=
 =?utf-8?B?RXBGZFJsYzJ6czRNYmZCZGNNczBUMk80Z0dRTE1lS200SmZOYkJoZlZQTjRY?=
 =?utf-8?B?NDM3akJ6M0luMDBjNVE1d0swVmJIeUZjNDlBMmplSjB6OFhFM3VKQnpmTUIz?=
 =?utf-8?B?NU5kR0JKN1FTSkRWZGhHL052NldTbUlZM21HTFJ0WDNJSDhDeURTQ0hmUHkw?=
 =?utf-8?B?eWRxQ0xVUUVPeUpOVVI3MlpkZjQxdmdEcGZZbTdDVFNCVGZtZE1EbGx3UnM2?=
 =?utf-8?B?UFBpWnA1b2NHZVFFMzQxbDZ2UXpFT3A1WW9wczFPNnMyb0tNQzFhSDlXS1N4?=
 =?utf-8?B?NVBuVDROOW9yL1N4Z2hManZYYlN0U1pwMU82Rm1NcW43KzFlKzV6WE1OMEg4?=
 =?utf-8?B?aVNhdFNYa3dDUGVnVGo4NjFJdUkydXVtOG13RFNWM0ljNmNLZlJPVFNJbjhZ?=
 =?utf-8?B?cU45d0x0aWZjWDRwamUyaHdMZS8zWFlDWjlwejZmY3dRTThsRUNHMHhXcUFF?=
 =?utf-8?B?UlJqSjI1SVo4OGtqVlk1WEcwWXhSM3Y4VU5HYWdkTnJSTjg2S3kzWFRHSnB0?=
 =?utf-8?B?RkxCeGdCeEdmM0dhQjNURjdlQkxhcVVYYmVqV3QzQ0x1QmxjTFVTVDhzT3hU?=
 =?utf-8?B?MFNJQlg2cVl2Ulg4aU5uUXVxMUk0S0JpM01sWTFHd1pmcUF3d3Vwc2IzRjdU?=
 =?utf-8?B?WVF2WFNIbmk5MWdQMFZjT3hvQWsrai80djdtdG9BeFpCWG0yRTNSNUtXV3FO?=
 =?utf-8?B?bmZ0eFJMTFNOalpEMlRueDB4cXR5elBGVk1YUFlrVjZ5RWlqMlB4bGxGdUtO?=
 =?utf-8?B?OUxIVE5lblZmM3lOekpkbEpwekFTa21Fdm8zWWRFRG0rY3FySEJ6bXpZRXdo?=
 =?utf-8?B?N2RJVkZXQ1RObUpudjdlazJ2ZG1xSlNVTTMweUM1OFNKZTI0b1oyNEltQU91?=
 =?utf-8?B?bDM3WjZOTkcwRnZyc1RIYlQ4RXZqdW8xeXM5QmtXNG85dUJSSXpaUmxCdm9i?=
 =?utf-8?B?aVZKcWJBZXJUV283SEdjNHpxRklTdk9BN2ZKWVYwdUdsTEpNeG5jQVh2ay9i?=
 =?utf-8?B?Yi9sQmg4RVRWTDhjaW00ZlRsSEw5eXVZTm5UcGU3WEs5MkNvVGZKMDRoOHFU?=
 =?utf-8?B?NkoySUtNRlhBd3dKYzl4VEVxYzVUVHhlb1hkb1FlVlNtd0J4YjB0MTg2NFJ6?=
 =?utf-8?B?UlEwM2pqUlhxaFptNVhaWVNtTS9MWnFOTkhyMFVyV2JzRC83dEFtOGFUZy9v?=
 =?utf-8?B?bC82RTkxeVZ1QldDWnIvdEg3RlVaZVZrUDV4andXZ2dEOURBeFV3Z2ZxazNr?=
 =?utf-8?Q?kSspjHDpdcwCa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWcxNXFFbTRUSWdiUWJKMjUrYmZOU3hIcGdVQ0JBZDdDRkJSclJrSC9tcmpF?=
 =?utf-8?B?RXBvNXRPWGN0VURyWXFFYlVpQ1daMGthaFdWcUxEVE56bzJIS0Ixbm5oVFBH?=
 =?utf-8?B?MDJXUUw3TjdCYjQvSUdBTWQ4TW9USWFDSlNLVnVKNnh2ZWlOWmZYNDhzTGxh?=
 =?utf-8?B?cURqZjNYVmlBVUJHUG9jY3BLWFZCUlQ5c3lMYlpjaEwzZE1iRUU3VkM3T0dH?=
 =?utf-8?B?amJraXlvT09CdnlScXhsa2Y5alV5WGtPWTI0TUkvem9iUTN0UGlPZWF4N2tG?=
 =?utf-8?B?RW5UdzZPVmVld3ZKOTBSd1ViNG42RWtVNlNnMXkyaW9pQVFEVEpML3MwZDFr?=
 =?utf-8?B?UWJEUnFwOXRCVTJrUUpSZXJrdFNGV21RQTZHNENtaTQ0ZWdxUWFvQzNWU2g0?=
 =?utf-8?B?SzZwZk05eVVMcjlRTmFnVVQ3djBBdFdmREIybnJXbDJobU4wMmRLbHpoN2RK?=
 =?utf-8?B?YkhTRElPdVpSUGJTUWk2Wnh2T25vYlg2U01hZWxvcEF3ZEVVRXhaYnVwTzBJ?=
 =?utf-8?B?QXA2eEIweEtpVjh6endiSXJHWFBBQUNNSk9nSkhNZitaL3grNnA4d2FPdTJR?=
 =?utf-8?B?ZUdNYTRXazVlVTBmV1dLWVN0TWdaNWdsdXBlVkZaNzN3ZE5lS2ZRV3IrK2Jm?=
 =?utf-8?B?QkhUSkMwNDVVbHBEZ2o0VDFlS0lKWDlabnZ5N2pLbHdtZWtpV3pLVWpTaGN5?=
 =?utf-8?B?RzFZWllaamtRKzIwVXNpRXJYVkRnRGVkaGlCbDV3dXpyWFdmTW9uVXpRdkdY?=
 =?utf-8?B?Slc5SEQwOFFYeThsN0RKV0YyeEVaenZnWk1TL1RxMWIwYVBGVkRZaDRva3Z5?=
 =?utf-8?B?WVJuN0VndmFFZkNPZ2ZOdFUrQVNkQjU3UUJmTU5tb1Viem5JcW94Q2h2WERv?=
 =?utf-8?B?ZnZZZGhJM2VDNUhUWlVreEdwRnZtNUE1R2NlYkVIcmxrQ3pCM1FYK05PTWZZ?=
 =?utf-8?B?K0JCVE4xcjdqek5zOUxTdXNDL2c0SDZORllERWRYWkpFbEFmRHA5eHltNmJF?=
 =?utf-8?B?NDA1RFNCNUx1MVI0RzZ0UVMzVVF0SkZKSk1YTjdPclVXOVVYbGFBZC9zQy9R?=
 =?utf-8?B?SlVUUThsQmxEZ3M3Z1FjaGxBS082dFEvTmlxUTRvUktoWG9JTW9zL3pSZUxU?=
 =?utf-8?B?a0puT2ZaNE12YS9aYm15TDZsenVYbTVhKzcwL3MwN2hKZU0wQzVma0UyaklN?=
 =?utf-8?B?RlZqRFpTSE91Qlk3bEpCN3N4R3FVWlZOcVR1ZTYrcTZ1c0Y5WkhMTnMya3Jy?=
 =?utf-8?B?N2N1dDJvNFpsWE1XdnVJOGQ1QS9YaWRBQ1RQc3luaVZqTEw5MEc2NE5wL0lu?=
 =?utf-8?B?SnNjRFQyc1ZidmtheW9KcDFyOTJEeU9NYnNjNzB5c0J6cjZTc3ZQWXRxUjlk?=
 =?utf-8?B?ZHo5OTJNdkhYaStCZTRHdVZsaGE3dTdhY201Y29Xd3hpUHZWZnoyVHpaT3Ey?=
 =?utf-8?B?ZUNQN0c2RHhvZHIyVDIvM1lIRVo0TlM5dzJwZ2Vkcm5MN3RjZmxWL2NncklK?=
 =?utf-8?B?UEdNTGNqeTJZWEp0OUtMNWwrN3c1bHYvWGdZNG8zM2ZhaTRIZEFrS1FtSlhI?=
 =?utf-8?B?NlNUaHRHbmRXSnRVWVhDU3VpWHJyaVhUWjB2NHdNZXpMNGJOVUtpblMrYmFj?=
 =?utf-8?B?WVJ6SHVwV04vb2lnaWU0K2tyRnZlaHhqS1N4MEV4cWRjRHQzSmljeFdOeWlj?=
 =?utf-8?B?bWx1bnB1SXY3NEdpd0RPK1lIeGI0OWkzT2pnS3lwL203aUZGVis3MWJXSFNp?=
 =?utf-8?B?c0VSZWtxZHdQeGtQWGI3MXZPaHNEZnRudUxCZmU5VytMbWZhR0xjV1pkajlR?=
 =?utf-8?B?d1huRE4xdlN0bDA4L2NycTBMR0tFaElrNjFGOTJIaFJjc2pNaHZoQjVKZ3hk?=
 =?utf-8?B?ZzN4MnBtVDY0M0RReVdsSDJYNjN1TEo5b201UTcwM1gvOU9pQ09laXYwUk1r?=
 =?utf-8?B?VGt3NExMbFVGOXNEN3gzd1RxZnBsaXB5T3E3b2VPNHJLS3hCUEp2RURpVkds?=
 =?utf-8?B?SnZnbVFSbWkzamUzZ2FlcWlSMk9tSWtiTzRvWHRrTHMzaiswR243M2M2WTNE?=
 =?utf-8?B?N1lrT21zb1c2QmFkMERBNG15K01ib04yZklxRTQ4VXlLSElqTUVxajB6TWo2?=
 =?utf-8?Q?V584yAWuF96EZ5KbSiTu441OG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a539b00-55ed-4894-35e8-08dd2f627636
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:09.4163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06MlvtQUsoYg1bLksv3TnAHgU4CH1AkwJ9MsvLWVh3CBuvN08frfmNzfa+rNm+8jNc4LtZ7BdbOncwJSLduGGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Rename alienware-wmi to support upcoming split.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/Makefile                               | 1 +
>   .../platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c}  | 0
>   2 files changed, 1 insertion(+)
>   rename drivers/platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c} (100%)
> 
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index bb3cbd470a46..f8aec8502c2f 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -5,6 +5,7 @@
>   #
>   
>   obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
> +alienware-wmi-objs			:= alienware-wmi-base.o
>   obj-$(CONFIG_DCDBAS)			+= dcdbas.o
>   obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
>   obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi-base.c
> similarity index 100%
> rename from drivers/platform/x86/dell/alienware-wmi.c
> rename to drivers/platform/x86/dell/alienware-wmi-base.c

