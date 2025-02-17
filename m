Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA62253BA
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739812957; cv=fail; b=hwQbMn13JYfYJWTeFElC1HK10+RvtYbwCdmfKTpTbc4jfl+IPW01mI/dBtyTzxmpnN8Vqbo/wVS2XzX/f9EinE9497H+Bw/voCfFSN8jJbOQYr6Y0Mh5dqYaT8/gDmP5ZnHT2nNxr9pg9V3cKCf8MEpEUe+wAuWdM0taDq93Mzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739812957; c=relaxed/simple;
	bh=LF+PNxR7QNTLJkf1axx42BoDyonG7v5iaqkQpLcCCDY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MBshx6CDgX8D8znJp2jbjdBi2Dl9SLwNtkf91zL6VJT+WRGTor0X6BEBM/6f/C157+nO1uuQ1FxSW0t6lSx1sejHxgQKxiRznbA5tejVkeov30BJoFSitMOf9WpqFoHWobWaF1AVpZHhVXCC9d1bwh+l3KQmeBNbDNqCpA22Ppc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pYTPSGR/; arc=fail smtp.client-ip=40.107.92.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pYTPSGR/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYrenVXOcuHHleONAMfbziPFZfxCLpVizpN7mt4Q1zQOu08exP8+gz+1mM7Rfv7FrHPVVpvuxNQkYr24iqmp7UkkFJRMnfM8oBF70liL9UUm1NXNCaAwU2C7kH9sA0xPwRoGSCqk6fABkcp5T5pbxRRrBdy6zwYmn2TVoXFxwPfIuWKQGu6GiPJXxCxEdkYHd4bs3ZxnVmJiFjENZe3yn2fVjL+KdTskCZ2Cth4aKEk/NOHuac3O+rltigviQ3cU2Mza4/TNCt64cNYuxMjMz87X6HOcxkJEDQZP8jODWoUnlEsD3H/N5VtN1+m6RO0QrOuXIoDjpYj/M31bj/y8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZRVT9fElgkbRCkWaaGx6pF/G/A6Swh8CTvj6vH5zCg=;
 b=fVbErA4++kcXRaqjka51eU9Om2quPK8LtJEEQbnnfj5DqPWezbUlegtNIh7q2jxmmZi9vjl91CnbCG1egDIUjY5+8wfwM0Q4Nw2Kj6vxx2m+7nA30CfhXPxQo7yTy6zM09t6WbQJvRd9yOlKb3rs+P5l79joMIdF/JREJ8w2WAxab07LaCCkncG/YX7q0CHsZtLeug76ybSm5rvZejqes+Lk37MJ4pL+nrGtrYjRGLX3J9hJNU1XF5ALBaAFYKWU3Mk+yMBY/Sde2r7jyXQdufy/densyWuDIiWuC8HuvRQSdxUb3NgsKzIhQUFtxokjZKOwNWuhqzakh0zw6Wl3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZRVT9fElgkbRCkWaaGx6pF/G/A6Swh8CTvj6vH5zCg=;
 b=pYTPSGR/YIZRbZlLMCpp3oS4ah/wwqrdTzrY7ge05HjQE+86QEN2l6DEmvfKtWe7Cu/TVWMXeAE9DR6kQ9xMt0jhSBcxXRhyASMHDB/lP/DFKal3RnHn1noUJEptNrufoXOlztEMnAM2GjcQX88wGLul1ZgxWJfAggZkuliALns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 17:22:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 17:22:32 +0000
Message-ID: <8e0dbaf5-5202-49ad-a8d1-4903559a73c4@amd.com>
Date: Mon, 17 Feb 2025 11:22:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmf: Propagate PMF-TA return codes
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250217064937.98702-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250217064937.98702-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 8944b33e-5e0c-4e18-2d04-08dd4f77a976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUhZLy9sVXNPbXIycC9DdWpDdVdyanBYQUhHeVNJSkhMUnErMDY3YnI3dUdn?=
 =?utf-8?B?QkdRdDRNazVYOTBYb2JXeEIyWC9UWGE1MDhoSHB3MkhINFBDMFE2K0c4TGdH?=
 =?utf-8?B?NkN2YkRWZUdCYjlKbUU0THNhM3FjeHQxSTRnUGViQzZ3TVJPV0hzS2IzbVFT?=
 =?utf-8?B?RHRVMWx0SEo5d1dSYXozM0tybXJFWm5JeU82NHVlYnVZMTdnNlk3MWJ0dTF1?=
 =?utf-8?B?VmV1b3J1MjZWUC9rY2Y2a3FRejBXaWZlSXh4YlE3WVRDTFFtcTgzOHU1STli?=
 =?utf-8?B?LzZ0dDJtUHFaZ1orVGZzM0xobkF4ZkpGeGNIdnhubmNFNk1uRjNVeWxKeDh4?=
 =?utf-8?B?WVlhSE1vV0l2N2dZL1MvZ1MxRHIxMzlIZDNvSStTZjdXbVdGeHZyd1NQaTM2?=
 =?utf-8?B?bWNQQldzOFBpL0VxMGpWak96N1hhbE5WRmhyUUd2ZXMrRm85QlN6eWgvYVU5?=
 =?utf-8?B?eGZxOFprTGJMTStqZStKU0E1L1lIVmd6UG9NL2FZckJLV2dYdkZwWDlzZTNU?=
 =?utf-8?B?aGdlZUJDeTFXK2xaK1JkTkxuY2o2Uy9rc05yWTJydlRyTEQ2S08yVndTVCtE?=
 =?utf-8?B?K2NNWkhyOGVUVzZvZnh2NHA2VVNJRkRSQWpUeDZkWkk2YUNIYWU2UGcvbHFx?=
 =?utf-8?B?d3NkZWQ5QjNQNjYwZWNDTzdmbDBlSG85ZFVkcE9vMUxvT1RxN1QwOWNOU3Jh?=
 =?utf-8?B?UmhMTTkyL082Z3FQVVhsQVZzSGNaU0pxVHZuQjAvQzNaV29Ub3NHWld2dFg5?=
 =?utf-8?B?aWhFSGl4YWtZSFZJVHZvVFRsZVpCbUFSZVFHY2tTeTc4ZkJOS1k1NWM4NVI0?=
 =?utf-8?B?MU5SeUdDM2JSa3pCbU9TUUVXWTMwalRqK2szS3ZMZmpKZklVdkw4Q2RCY1ZO?=
 =?utf-8?B?K3pNMk9XWGZSV2tFa1JKaC9MZCtJa0VnbVZucHNjYnYxd21mdTZGR09oRFdm?=
 =?utf-8?B?RnBTcFFwbTh2WE50TFhhblFMOUZ2QkJSWEhGc3dlNGplWjdiak45OEZOSG1V?=
 =?utf-8?B?V2VvNEtWbmtsWi9KSmhhODJJOHNabnpxUTN6aXlvSEQyWEQ4aTQyUlJtNEE4?=
 =?utf-8?B?Z3djWHI2WHhLbzlsTDVxTk5kU29aWXpVeU9LWWxaTCswWFRZUmhHMlZmc3NQ?=
 =?utf-8?B?NEEzcUxTYWhGRS9JNUNpK1UxUXBYK1FkaGc3dlFGNVBsQ2JON3NGdW5oM0JT?=
 =?utf-8?B?SzVUWUJaa2UzTk43R3R5RHlSeGRVL0s1T2NKaFdLRm9XMC9RK1pFSWJFNktF?=
 =?utf-8?B?S3YvdXNYNjl4bjJ3eDBJbTNHTkFjcE13eGFTM0tpT3BhNUxaNnJhTHBMdTB2?=
 =?utf-8?B?elpUQkxHNVlpOTlmdlBFSmowMStMa0ptUFBCRnI2cEkwbWRSU24vQnA5c2hq?=
 =?utf-8?B?TkI0NUpzOVJkZURXZlc4Y3luVWRYVmluSlRVRGpROHptWFpLdmVNQi8yclNi?=
 =?utf-8?B?TVBGMTRzU2VFNUd6ZHgyTWpyZ1o3SjZKMWpFNm41TlhjQktNWU9kVmg5eUhE?=
 =?utf-8?B?R3BROUZWMUZOTS81MjJ5Nk1yS3BnZEZXQW9BUkJPR2d5amtrNVRJa2FHZEZT?=
 =?utf-8?B?VDBna0lVbERmeG5KZnU1dUNTZU55d2tQWDZTTU8xZVU3cXpmbFh5K08yem9N?=
 =?utf-8?B?djlvWEZjeHNha3ozdVBBMFZ0WnpHLy9UTkpIUzIwdDNISGdmVDYvMWcvTlV3?=
 =?utf-8?B?OUIwamV1SUk4cGZBdGF0bFhCdU9ueVp3azhMRzA4RmJtcFVISCt6QjU4TGk4?=
 =?utf-8?B?bkI5Q2VOL1RycmhsanpHTUlwWjhxL2N1U3lQS3RxRFRjbFN5T24wZllDY3A2?=
 =?utf-8?B?QnFqZ3dzRk1LSGpOK1ozaks5aEJoaHNxbTJNVFBmNThIRDNEd084SXJ0NTZ5?=
 =?utf-8?Q?BWLmQ8XTmPK77?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnVRTDM2NHJwa0pFOVpqR2NvU3h5NlpXeThKNTdpTjNKQVN3NHJWcHBGcCtD?=
 =?utf-8?B?Nm9PekI1Uk0xUWp1NkkxTWxrT1hham12akQ4b21zVG9qZmhEZUt0a0FWTFRu?=
 =?utf-8?B?aUk0YTFoMlJVK2djQXdJODRkMVZSUE9uZzZ5akp1SkZwREdmWXJTUzQ0OElZ?=
 =?utf-8?B?SGxJemNEcnlPTitrdVNqZTA1UWx2SWtvaDFJdEI4OFMyNHA1dEIzV3U2OER6?=
 =?utf-8?B?WkRxb3dkUllQTCtHV3F2WDVkaUdNb0xiWkticVBwRjNqSGdWY0VaVGFvbEpX?=
 =?utf-8?B?SVh0YVdzellpYnJ4dGFWK3ZYZ1lHcFhEZWVtSStPSmhJQnh6TUpYa3R2c2V4?=
 =?utf-8?B?eUZpZmZqVmloTHJsVlpINFZ0RXdoV1FRT0Jjc2pqSnM5YVRhQ2hRZTcvTy9K?=
 =?utf-8?B?WU1HNzc0L3o5T0RkV3h2QVBkTmYxcHV0ZWFBc2tGUEFJRnJQZndwSmVlTVYy?=
 =?utf-8?B?SE1BdFdaak9uYXh3L3RBVFdYWGVLTlhyRVdPdWQ3ZTExeUdZbXlsbmZRQmE0?=
 =?utf-8?B?SXBNVDl2czRnZ2pQcjJIRkg5Vy9KU0I0b3hVQS9STm82YlhiNDd4WWgwWGdG?=
 =?utf-8?B?TGJJSG5VT0FtR3ZDM2dhT3NqeTNVMHBsNDZxUmhoaXhPRHNCaGl0TENsQzBC?=
 =?utf-8?B?RnVQcVJsbFFOME9vQW1kaUw5MldZeWl6RFlRbHhKWk92REFCdHFCaWdyMTR5?=
 =?utf-8?B?OWtxTzlKRlgvUzBWb1ViNGRIQm4rWVR6d0lob1dabXJKUjd6Y1dmMTF0eSt1?=
 =?utf-8?B?MXNwcFJTRzdjQVlGVnNTNEN3ODlycFVKenBGbkVhcXFqNFRUa2M2Z1oxbW1I?=
 =?utf-8?B?Q1Ayc1ZnOEZRb1ZEMjd6ekVpYk5vNS9PUlNJWUorYlhhOFd6WGVmWWJlQ3Vj?=
 =?utf-8?B?MWUvd2Q2QWpVa0tJSk8rcjRaT3VTWG1zT0tJSk1hTTBpazFETnorcFdzazNZ?=
 =?utf-8?B?T2xoWXpaWFAyb1JEOUxwSllCaU8yM2x6NUUzak5SL0J1ZUxTVlRMcHBScmd3?=
 =?utf-8?B?Z2hPWjdyNUcxWk5peGUvczI2aUQ2Ym8xcTBvdVppOGp4MklwNWcycytsdExq?=
 =?utf-8?B?NWlubEFPWTlwc2M3YncwMjZ4YWsxcURtdTZPSHFJVzhxUjNlV2Roc014OFA0?=
 =?utf-8?B?MnpibjhUNDZPQ3FWKzViOGcxQVExcWRyZURvL3BZZTJmQThnTjJUYkcyZk1v?=
 =?utf-8?B?dlRndmpUWk52eS9IMXozaTR4M3NpdEJueG5GU0NEM2o3S3o0ZUpITlV0L3Mz?=
 =?utf-8?B?anZOU3lld1VXcHdFcmd5VFFlS2JNb2haZ2RQR1kxYkoxbHFTYjBWVXBzSEdr?=
 =?utf-8?B?dXJyV2hZemlPMlB3YWF6Q1F5LzZXOTZFQnhneExjUlRRQWZVRGlCM3hmR3pE?=
 =?utf-8?B?R0E5TXVsOUlDNEZUYW5OeWNqZHZ6ajlUTDBqU0xpNzVrcmxHd01mR1lpejY3?=
 =?utf-8?B?RVM3bmpjcmdSZlhURmx5a2wwUkRlLzlwNXQzTXhDeU1wTXg0cW0vQml5Yy9R?=
 =?utf-8?B?SWkzYXhlSXZJelFTZHRzcXZVWmVjWVZGR0l1anJURUxzOGFZK2VXZVRxS3FE?=
 =?utf-8?B?TktuVTk2UUFSQzVhbThEZEFyMENrYXE1L3Zud25GVGJxMUF6eVBRZmdvOVlk?=
 =?utf-8?B?UEJ5VTlTREZjOGZSS1J0S2Z1ZGFsMWplQTAvZDFnTTN1OGdPZElCOFB6K1Vt?=
 =?utf-8?B?MU53c1dYVUVkQ1pKb3hQWE9oZVhJeUF6cnh6R21RSTZ5elBkWUlwWm1BVGR5?=
 =?utf-8?B?aHo5UkdDdERYN3MzUVFJWUlFNjd4WXozbE9NYXhOeDVad01WVTJkbDQ2Y1FR?=
 =?utf-8?B?RlUwT0cyTE50Q0Fab2pGekZZelFqUE96Z1RYSS9FSjdiSkhMU2ZKVXRhOVFs?=
 =?utf-8?B?L2FJOUFueXdHUTJuM1F2Q0NKSGRuMTZYc05TWEZpbG8vMGlUWTJVNnFvbXpr?=
 =?utf-8?B?Yk1EUWYrY1RZK21XN21qV0FZYS9sdWNpNlkray85bmtDbGZ1ald1b1NDWTBl?=
 =?utf-8?B?d05vSVIzMXR1U0FtdExxZFFiYmpDMXB1SSsyZTk3MjQrdThadk5SUE1zWlNq?=
 =?utf-8?B?NnpTcXR4REhqWVlyZHR0WEFnK0FKd3d2M04vdGlvQlRqNkZFWEhzeTk4QitB?=
 =?utf-8?Q?BDIv6UNroTvpjNebiqMK9Hxbp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8944b33e-5e0c-4e18-2d04-08dd4f77a976
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:22:32.0929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMNEpSldkZNoze4zXHL6nbnw1WHk7xCvkuSrAzgt2BcHupaVmtPJx2oPVMsMVCsQkbRh6LsK9F5Lk6+2xtfmyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340

On 2/17/2025 00:49, Shyam Sundar S K wrote:
> In the amd_pmf_invoke_cmd_init() function within the PMF driver ensure
> that the actual result from the PMF-TA is returned rather than a generic
> EIO. This change allows for proper handling of errors originating from the
> PMF-TA.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

>   drivers/platform/x86/amd/pmf/tee-if.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 8c88769ea1d8..b404764550c4 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -323,7 +323,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   	} else {
>   		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>   		dev->smart_pc_enabled = false;
> -		return -EIO;
> +		return res;
>   	}
>   
>   	return 0;

