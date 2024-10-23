Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34821A0B1A
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729692706; cv=fail; b=kljXdvVLtf4PHvh1DUzI3DkTjZIA+kgLk//XmYo/Y8WjxxzM3mwfvSF2IyFhJ4Hmm+7MEaTH+At0BzBw8KzA8KmKIyqY8ckL+JN4vuiyn8m1jBQ2FcTVy5KFzm3zZdPi58Xyt6NkUfyeR4AG9GFrZvbtr5NYMyXa/F2vz1V24nM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729692706; c=relaxed/simple;
	bh=ESP2v/kWJmyI9Ljnp9poadwdaFWozDrQbaHpimpst/8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o0oJ3AWoMTI+8Ys3vKt0D2ozPvFE6M2HG/WMSob95YO+oPv3aqywr3KNzEcjUTNKGmJf0Q4jdV9aI+PMamvSprJ31cB6jUsfk0JBMEKiAqcRA6iq9lmBFQ/UpjaZaVlpLUcdLqLj6TPDe+lI/fOBR5sKOG0BMCTR4+j0ciCntB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TzSUyjnl; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TzSUyjnl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdcR/M2rZ8UZcxvvy8pxdISA5K+MAQrRqKghUGKYOxi1bOZexZQRqzT+Oqdj5T+zoprHoXegX+lirmUSPm9PH7NuxMnaErgku3K+8TSoiY+sfe/leykwFpj8jSn8otYnC35CwEhRLA1PUKet4qKLdNB61z5G6IQR9gj4dmtl3evNYQtdByWyXt4UZifE102UZ5YPs5RM92TIXNKYQptwxZ7uLS2t/DeKNZ5aIwR1z93AxUaQx9Cxa2S5OKhA9aI+cJx3qMvez5JBxjHIQM/oxSMpIbKLomUtYora35HKKIB8v+7JmxS3zR14nBtUwG2//hRUWOzt3ZHzCmWwuVAp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjGV1KHPYaD0i7uPsQIX8reVCYA5hVyD5wm694l0OsU=;
 b=UbnDv7w5pLcMGciw0GbyBr3SP39cw1ggPWo76yABrowN+lO12t9rMJ2PlNK+/2/o5kzaX0V3lUy3rJTMxB/2VjVWGFebrrJafh0S7P5pn7W0vd7yKmcmWwyjaW+wIx8I+hLTA9adCQJlSRRusdW1HANuZxiGFpZJtvuBElAIiq6OF87eC3t4ecYJFT8ijIdZOAJSbIPuWeAufvIPE0D0S1wP9PV2voCbtot8EJEUkXGT8fK3ogrxhTtXqDtiNFzoE0s9J1AlYlLecuVjrL27qBab3qe+3vDedr82tM0d+cRZrcVrNUzcpneYW+QO26NzDny0r9jSq/GNZtWwMsOf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjGV1KHPYaD0i7uPsQIX8reVCYA5hVyD5wm694l0OsU=;
 b=TzSUyjnl/VeB1JOqh2XDrLm9UVG4xSFm/5rFBs9kTvRXU9YutsuORyqiHwIjqkA63d8ICE46lg2dHdkL5eHXNf8Qi6xr+K/F0Rk0S0/9pjj+OUpFSmfi5re+BpwIKqS4T+xVZsSBJOhjbJVhe/6ewbEZX2FrwZMEwwzJMAO8INQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7177.namprd12.prod.outlook.com (2603:10b6:806:2a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 14:11:42 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 14:11:41 +0000
Message-ID: <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
Date: Wed, 23 Oct 2024 09:11:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d54dfa-f791-48ab-82c0-08dcf36c9df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVYrdTFsZjNrbFRqM20vU3VaWXgxMDVVS1ZDdWQvcnl0ck5kTzZ2K0tqamZh?=
 =?utf-8?B?bE1RZUVJUUF0aTBzZW9mZ0xpYXJZa3BXQlJDTGptTVRFNzFRMXpNckYyRXRt?=
 =?utf-8?B?MW9zZ3J1ZlJWOHNjakZibmswOHdSL3Eza2ErR2FnWWxndVUyaHRIRytUU3FC?=
 =?utf-8?B?WlpEc1l2VFlwZCszRGpIb05nYWR2eDZ6UW5UMzBSbTJIUC9lMWVwVW4xUmt2?=
 =?utf-8?B?T2VLMFFpNnorY2dKNXdNWkxBRW1vSzR1L2VXdlEzTitoVW4xVDAzMTFvNG5l?=
 =?utf-8?B?di8wNFBKOGh1NDdZTE51d0VVeHhiRndtY3NQU3YxbG15S0dmaW95dG5UMWt2?=
 =?utf-8?B?S3ZqWWhMOVB3RlQ5d09JMXVrUFhoVXUyNTYwckM1ZnZJTHljMHNiK0NQZlRO?=
 =?utf-8?B?c3pMd2JhVThNNVdnVDBOc2lrclZERjdVWitxRVBrR2owbjltUDR3SzgyamZJ?=
 =?utf-8?B?RnUvYk5zaitud252RURINUxIcjdZci9razh4elYxM2FkN09pLzRpbldPVDJE?=
 =?utf-8?B?cFI3UnY2V0FIOHhxT1l3emx4VlBacXFyaGhYMG1ZSDM4OVc4UWgvRnFhVmNL?=
 =?utf-8?B?azAvOFFnWnpHYUsxNklJd29xSXlzTDZ5SmhkSldtM3BrRlF6b3JETzlYeU9H?=
 =?utf-8?B?YXBob2g1NlRnU1JVRjRxelEzNGtEQVo1Vzg3MlRWMFo0MWUwQzdlMVFPYTBv?=
 =?utf-8?B?dzJGWHdkNmFhc210Tm5EU1FvRzdZVERtMDlWMVRZUU5rYTRWN211dnNxTDQ2?=
 =?utf-8?B?UFF3dnIxK281QThmcDhiaWVQTTlzZDQ3Sm80VDdyN0xWYVFxMGpTbnBKc2o2?=
 =?utf-8?B?TzZwakxvWUlqRzlkSitWd1hzWCtwNXFPUVBCWngvanJWVjZZbUJWQUFXWklZ?=
 =?utf-8?B?TnVrTFJxN1U0UG50YmxraWNyeHVNclh6aTVKcWFtSEVIZ0ZUZ1F3UlpxSk8x?=
 =?utf-8?B?ZHFDS1hGUGZJNFRJRlFMOXQvdEV3QUxRR1V2SGF0emFxYUxFbnlFanI1TzdG?=
 =?utf-8?B?a0JvY3ZGaWRkY0ZiajlHbVVGV2lZc21XeVlaaGR4ZVAxcGxyYkNucm1aVzJa?=
 =?utf-8?B?aFV5aE94TFZRUjQ4M1psdVdtOGlKSnQwcHJaai82RmR1RWhRa3VNWTdnSXR5?=
 =?utf-8?B?MkM5V0p1NmF2Z2gwYkpHVG1ia25JM29tYW8zekYrL0ZVZTcvYUhxRVBCUnpz?=
 =?utf-8?B?c1lDSDFINXYvOVQ5T1ArTlBJMUJ5bCtTbG52cUdRSVg3WThkb0xjSnRYalZa?=
 =?utf-8?B?RVloMFB6VjdqRGhrZittTno4UDFqZTJRWENUN0RQSW1MMlUxbGdSRzM2eklX?=
 =?utf-8?B?NFlGbS9mb2t1T1NmT29vNnV1bTdDUUlDenpZYkZ2RzZKRjBDVTYrNDRMYW1W?=
 =?utf-8?B?ZUprSWp6ZjdWR0lHc0N3MlZnWUZQRm0vN2ZocmQzUFZpQVV4bkgzQW1KTmdV?=
 =?utf-8?B?RFptZmRyUENpb1AyK2pMM1RsU25wVlFYRjJnbk1aNHlRempHVzVUU1JNUXIz?=
 =?utf-8?B?Qm9OU1RVYzAzaStWbzRyUEQ2WU9ZN3VkZ3V0ZVJteVpmQ3N2NWhxd21DMlR5?=
 =?utf-8?B?K1IxQ0Y0d0s3cHpCSXZPekRmWlRNOUU1a2xpVjVqOVoza01YSXlRTTBsalRB?=
 =?utf-8?B?QUl6OW9mRHdZVEZEUWV0U0srSFRHY1d3UmxyNW5ZaFRHS01UQS92aHBPaWFV?=
 =?utf-8?B?QkFXUyt2ei9lU2ZzL3RCUzdDUkhZMkpOdE1UQmdvVVljY0F2TFZuS1VmS1g1?=
 =?utf-8?Q?Ui+hJXN3BSoNWzMhqaKRipgTFXsGfMX3H1w9U3j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJPWjZFUnFwOGdkYTZvcUZrTzNHQ1Zka3labTFYaVZSQzk1cnZUcHdhdTFQ?=
 =?utf-8?B?c1p0a3ZZVFFkU2VieHZuSWNWQ2xLZHZQTDREMmkyMVVycVRtK2lmVGVPZnJ3?=
 =?utf-8?B?SVNSWXJFSXVaNnA5SkIzMzg2WHZxNlNCMERsWFMxaXAyQjlZNldlMnVLUUtE?=
 =?utf-8?B?VGdpNWkzVVFndXE1OE9lYXR2WWVMMnhZTFRoZFNFTjFiV3VtWDgwcENCaVVR?=
 =?utf-8?B?V1RjL29jeHZpODFKM2VhRDdrSFpyUjg0RUFqU0xleUt2UWN3TjVrVzdVU21i?=
 =?utf-8?B?MzhmV2tBcjRYNUZENkR1bG4zbXByUVhZYUZOaEdrL3R6SzM3OWpEMHhGUUZu?=
 =?utf-8?B?WUxrRnRJdWljbnNSNWhvd3lsNTNleVdFTWtsN0drajNxYzYvVVgvY251Sm5U?=
 =?utf-8?B?cU1zV0lqNy9Gd1YwZDhZNGxEem5hbVk4RW9KaUhaMmFscWxrMlpuSGJXKy9n?=
 =?utf-8?B?OWlkcVlnSUF2RnB0Q0wrcTQ2c1JjYkV6QTBkMjdVMHUyMzhsY3FSSVBhSDhM?=
 =?utf-8?B?TjRMQko3RXg2eWpqOWt1NVZnRW45eWs3aWFSeUpoczN4WUZldTBOZ3kwRzVj?=
 =?utf-8?B?ZTc1dTAvZzFjNUpkWWYxajBrd1NBTjlEVWJxaERCQnppdWwrSlNOUDRiT3JZ?=
 =?utf-8?B?VVdudkdEeVFmUWxTcmY5K2w5SnhrMlpUNEx3Vmc0VTFPSStVVG5Ccmp2MXln?=
 =?utf-8?B?UloyMGZ6NDA4S0k0bWNLRmZjekhKNTVGTDJuOG8yaEZMWTMzSVlEbWE1QVJi?=
 =?utf-8?B?RG16R0tvRHV5ZS9nd1NTZUxJYWp3NFd1OHk2eFJITGRJSHJyYTFhK3JZOVNV?=
 =?utf-8?B?MHlFd2J4eFlmYlljM0ZPcDlWR3BUQWtNbmN5OUF4VWUyVU9TQUFOZWhWc2ZJ?=
 =?utf-8?B?SHowb2hTdjFQYTM5SEFTMWw1TmZud0lBUmYwN3NlUEdqRUlkcFE1TEJBaWwx?=
 =?utf-8?B?TTNTeVhMQWVXRjY4QkxWaE5YTDhBRkxYL1lxaGVWSFFHNENteGFYZ1lzT1JR?=
 =?utf-8?B?RmNLckRkemNlY3k5VTV6V09DS3ZNQmtGM2t2akhwRFBvSzZtRmQzMXVzK2tF?=
 =?utf-8?B?RXpUZXAxZzhUZjFXV2R2c21xVGZ3RitNYm1mNUJmU0ZDSURFS0RKUE40RStC?=
 =?utf-8?B?TXpGVSt3Sm5hQllkSmo0THBuS1htTGNNZ1BNV0wvL2N4Z0lOTTg1Q3FLUjZu?=
 =?utf-8?B?OEFkZDFUdFFYYm1sQmNPSGwrdlJIYzNHK1FFOHZDUGx3cG00QUJDS1dOdWY2?=
 =?utf-8?B?bGtYUDYvU1RiRTV3NHMxc0VrUkdtKzJ6TEU5MElZN0U0ZnNVMEFGOEFUQ3hK?=
 =?utf-8?B?RW9pQUlSeHdsUWphb1BDazlqY3NuUGdoeFJ6TmtLaytQZVgyME1QUEZycWRx?=
 =?utf-8?B?MnMvbFRYVmVvdUNJQnI4Z3BXTi94STlFKytKZHJwTUllYTRhZS9IZVdQRUl0?=
 =?utf-8?B?YW1zVWxIVzVSeWlHRDd0ZHl1T25TQi9uTDhkTEc2M3VKQWQweUl1anJOZm5F?=
 =?utf-8?B?d3o2NXpZUGhiTlNvVVNXRENsQWhxZ1cvaS9HNDZnN1JmVEYwYnJXWkl1dG5a?=
 =?utf-8?B?MnNMMGN1MllieFVtWjRwY1l1c081T2grK0l3VjU4OGMwTlhMbHZxcHBtZElJ?=
 =?utf-8?B?TGNCTVRFQTBaNjV0dnlabmFhWm5qd2NJQ2ZuNXlJeWNOZlZuczgyMWtacEtn?=
 =?utf-8?B?ZTE0blB6RGZyWTR6QUswV3V5T0pKdXIraUY1aXhNNk1NTHBUNjFrZkZETEJ1?=
 =?utf-8?B?eFRyRXBPK1MzK29DaFZXVDg1MTFaU0VyMG1XZSswSll2ajJLVi9rckQ4cXpZ?=
 =?utf-8?B?TkFHeittOWJrWjFRSG9FNDM5TXVxQ3E3ZjB5WjVkbzdOSjU2MHdnT000WUg0?=
 =?utf-8?B?QVFHc1drMVVDN0pLYXljd2RETUxqcytPbUZpcjZwOXBZVlRxUWN3U0JnRnRF?=
 =?utf-8?B?WVY2ditDWnZ6ZU81TW5iNkYzaWQ0YjdGM3FVdDBqUmJZbFVYTzFWTU9ScFFI?=
 =?utf-8?B?eXdNcE1heHZlcVlYamJoaTRrNnN3N0cxNTdXeFJZUnQ5UW9BdE9jZFdMRFRt?=
 =?utf-8?B?MnIyRmtpRDFoNXlHazJzYkxYczRhL3ZHL29xbk9SMEtkVTVhY3BHellsM0JM?=
 =?utf-8?Q?9go+ZbnwuZAXiLQkK99snS5xw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d54dfa-f791-48ab-82c0-08dcf36c9df2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:11:41.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKWZL1bumEk3xZpCSUUlD3c7gXybDXpqf67aMT6DNz3J7pL+I8Zndyy0PcjhX2NT5E2rWVyqDkJYormvbTr+RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7177

On 10/23/2024 01:32, Shyam Sundar S K wrote:
> The PMF driver will allocate shared buffer memory using the
> tee_shm_alloc_kernel_buf(). This allocated memory is located in the
> secure world and is used for communication with the PMF-TA.
> 
> The latest PMF-TA version introduces new structures with OEM debug
> information and additional policy input conditions for evaluating the
> policy binary. Consequently, the shared memory size must be increased to
> ensure compatibility between the PMF driver and the updated PMF-TA.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

How does this present to a user?  From what you describe it seems to me 
like this means a new TA will fail on older kernel in some way.
Some ideas:

1) Should there be header version check on the TA and dynamically 
allocate the structure size based on the version of the F/W?

2) Or is there a command to the TA that can query the expected output size?

3) Or should the new TA filename be versioned, and the driver has a 
fallback policy?

Whatever the outcome is; I think it's best that if possible this change 
goes back to stable to try to minimize regressions to users as distros 
update linux-firmware.  For example Fedora updates this monthly, but 
also tracks stable kernels.

> ---
>   drivers/platform/x86/amd/pmf/pmf.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a79808fda1d8..18f12aad46a9 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -106,7 +106,7 @@ struct cookie_header {
>   #define PMF_TA_IF_VERSION_MAJOR				1
>   #define TA_PMF_ACTION_MAX					32
>   #define TA_PMF_UNDO_MAX						8
> -#define TA_OUTPUT_RESERVED_MEM				906
> +#define TA_OUTPUT_RESERVED_MEM				922
>   #define MAX_OPERATION_PARAMS					4
>   
>   #define PMF_IF_V1		1

