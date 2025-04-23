Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17971F2C45
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745404121; cv=fail; b=BCe42kCakLiApPAzdEHVhLHgGTRXI/kfpGqHZu1O3Ha4dt4p2kDrM1THXlY0N1CeViL2VZkTBwW1wMG1m7tV6+kO0Rt5/DhWX+pLGbUhW39MYJXryhDxlKDNCoBKRxkaZrR+R8iteuBu+/9fSO8ff/iFJrjg1tpaxj604TzVh6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745404121; c=relaxed/simple;
	bh=D6QO2XRKOfcWmXBSPsqGlO/LZ8jA5Ohpvry4pG8pSfc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UuIeegnhozIAVOLnbhVeFgB/j/eGJYcMVttwy+UFCWzkDcS3fuw3S6D7NePhUK101TkXOxU4U69obwkjrWkHsTzj6iewGxOhqN8ggoHTEuD51R1/NaoP0984ONz/HsfcJTsQD5fQSwVElTUFKktbLC4qriFOIGocip0nGn0INXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bJZ1tyQR; arc=fail smtp.client-ip=40.107.93.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bJZ1tyQR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5szlwwJ2bSRS+RiA6//l9iUz3GkFD0mq7zrO0THfNUhJ65tZ8nhnwYUGsRUOoHU+iXkhDeQbV5p9QmhpgQ63CEH2v7SPxWGQxchzEyG8VzeZQwXB8MXz5cVpW7Fr9RUSdUq86TVRmWIM205k6ejTVqYGC0quSjBuD97V1SS2huVK/I7gnxvkDH4vM+s5wWMQOLg1CscASLA5vDCBsNH2AP+k5QXvo+iAyDhPLXSce8TB5IMKGsSzXrUNchQMSZVm0dlRd/AErFF8wt01whXw9yhkrJ7vrb39MMmsXGRBjYOVlCS/71Ie2whjcYeX7/A4ad6fly3yI/mH+wct3RsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGm/MBBC213P1CoaR8Swa2uGA5e/fzj3iOyrcPL223A=;
 b=H/YGbds0LDj/yf/erWjYWcSFj8N8GyqXcKo8N5XJfO7cZopFhIJ6gLB3wtG79L8UHoM8Ck9AJCDLesrnvXCd9c4czVmRuTC062azXqN1tVlDvDS8uRfiit+6lSxhcVp4tW9U2Av3GptSMzDAyJMSDLPL0ba2Xg5aKYF9R8uTVSwd41AflmDs6EeCj76xi2vN642oT3NtffOvR9pbSHa6BN9C+LT8b1xV1UKubD9WGP7dz28qmhKffJ5YsuX+44Y6NulG8aKMh7h/d+urDtMC7Bly3j7UngZaKD8HTe3YjrqSm73CFBnlBjbmClzL7dyLoxfKGY/+YlHPBgEQyfqDIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGm/MBBC213P1CoaR8Swa2uGA5e/fzj3iOyrcPL223A=;
 b=bJZ1tyQRb7hnB6S4Sjb0uFhXz6na78fs6lobHrOcxGcIRknscm1yn3Xs9Wx5C99xqxUgNLH0v3gN72sC7SL9mWTDkmieOIHpR+4w34ddVKaH9KGyaUlsDysMhWwDADmgKnyBIfJTUOykJh6zSoZ5fVeeZEUrThWahak7LNqAmWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 10:28:37 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 10:28:37 +0000
Message-ID: <16f09f77-3263-4f5c-8803-a59bfdb0498a@amd.com>
Date: Wed, 23 Apr 2025 15:58:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] platform/x86/amd/hsmp: Create separate ACPI, plat and
 common drivers
To: Hans de Goede <hdegoede@redhat.com>, Gregory Price <gourry@gourry.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
 <20241021111428.2676884-8-suma.hegde@amd.com>
 <aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F>
 <8c0d9751-767f-4e8e-bbf1-bbab89c1b8c9@redhat.com>
 <65a8045b-42ca-4d13-b0d6-2f739582faa5@amd.com>
 <964de473-8c93-43d3-8712-2f4ae245cf12@redhat.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <964de473-8c93-43d3-8712-2f4ae245cf12@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::9) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CY8PR12MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: c11eb7bd-f0d1-4d65-341d-08dd82519b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHJiSHMyZjlpS1hVRmVUQkhXS0ZzcFIyREZuUUtBSXl2NG9wMURMSW1hZHdq?=
 =?utf-8?B?SEhETWcvZE5Yb1RLU1J2OE5yZy9BY0ovM0VScFZnbG1ZSVRjdWMzMzljUVYx?=
 =?utf-8?B?c3ZYaE9Fc0dzVi9QRGV1a2RZcTVUSzgyN0tZckNYYlNLSGpjZXpES0VSN21l?=
 =?utf-8?B?RGtGc3p1ZVAwcFpxL1NkU2tvZlc0Wm9nT3owRldLekd1czE2dm9WNTN3R1Rn?=
 =?utf-8?B?VkcvemNkSWd3dE41VmlheURLd0F1MlJhYVlwOURBaUhTNm50MEJDWStsM2VR?=
 =?utf-8?B?WXN3M05HODRDa0V5bDZsK2oySi83b1A3alNCR3FRRHVGcHgxbU8yVjYxeFdO?=
 =?utf-8?B?bU1MWEpONnl4YkQrMnR2R0FiNTQ0WHNReHAxRXVrN3N4SHY5WnIxUE9JcHp3?=
 =?utf-8?B?L3h3TWJxUUlCZFJPWDJnNlQ5WDhQcFFFcjJHNlhTVXpCVVdmcytlN0k4TEdt?=
 =?utf-8?B?QVlRTndrMFBiRFh5SXNuSklCdzU4WFBFN1JOVDRPUkNWeThvNkUwQ2I1citu?=
 =?utf-8?B?NExmV0FRcXJjOGNaRDI2SXpmSjQ1SEx5N2E0YjFVamZXdmltZUllWmtHQ1Uz?=
 =?utf-8?B?Nm4zbWJ2SnFTQTdCYlg1MzFtekh0eUhNSTN6QWRYS1RtaExmbHZVSnMvNHhq?=
 =?utf-8?B?cWpKMlUzK2FkSXhORWVEMmhwR2ovY3dKRXFkYUFCTGJnbmFrd1puYUNBbmhz?=
 =?utf-8?B?cEpIeUVRWUVPMHozNmNVYmpnK3gxOVp2bWNDWXIyM0N4QTdVZm55OWJLUGVQ?=
 =?utf-8?B?S20ybGxjNEVoQ0hHaFVsRm92TFZaaWlWQlBwVmEwZmRHZ0s2RjVpSWF0M2tk?=
 =?utf-8?B?SWVmbXdJQ3BhYjF5MmpBQlZEWVF5ckhyeDdxc2FUb2FrRUUrTTFLR3RjdTdN?=
 =?utf-8?B?VENRK2Y5Yk5SRUl0WHJYRlV4c3dOWHpKc3N0ampKbi92Y3h3T00zZnVlN1ZV?=
 =?utf-8?B?YVAwaFB0T29RTktMaEFGMFRvcmc2U0NtR2twVko1LzJzT01YeENrNGl5b0Ew?=
 =?utf-8?B?VHhqODlCVkFSL0x4Q2FCaExxd2xYL21XaDdxa04rVEw4dWpjWDYxNTA3dmM3?=
 =?utf-8?B?cmxTQXlqUDBYb3l4VkU1SVZjd1gyL1RKMWg3S3E0cmdBekdKMjZkb2JzK2lz?=
 =?utf-8?B?MW9nYjF5SFFjMlB6TXlZbm9IRGFSRy9vTDdIdVkwTzNocmdUUWJxUFNwMmtF?=
 =?utf-8?B?c1RtQVVvWnpTYTJwOGJkZUJ4Q0dVbE1oakZycmV1WWVVSkJRRFNGM1ZhYTJJ?=
 =?utf-8?B?WTZaUXlrUkJsVnIvQjhpRnRLM2RaNHcvZEZEMjBpRnUwOExzUXAvY1NmaXZF?=
 =?utf-8?B?dDI3amhIK05Ec3loTk1idjIwRStEdmlMcG5HRVYraXR3eXlBY2ZXTjJlZ3Qv?=
 =?utf-8?B?c1A5QlNBQnRocTgwKzFiY3V5dDMxMnY1Z3Yzd1ZGOVI5VnR3bHVHeDlXM0Mv?=
 =?utf-8?B?TkZWYlMrendVSlIyeXB6L0FoN3dJU0FyV3BiZCtWRXhVb2NkUjkwRks0dGw1?=
 =?utf-8?B?M3NHQmNhOEQxVnRKdzlOSFJ4bUZsMnYxTkQyY0dKK2hsUG5KRkhpMmc5cnFO?=
 =?utf-8?B?TDM1bHUwNzNBSVFuK2U5M2tNKzJFSk12NkFmUnMyYS9kTGExUjU5MTk1bjZr?=
 =?utf-8?B?azMwNmNtckR2UkJpOW1Jb0E1aWxNUUhUczZoT1lwVmxINURjOTYwSUx1WWow?=
 =?utf-8?B?YlR6SlVLVmRGSFdPem5FOVdLYzg0empHaWNQSG1ZNUIrYmJmZVlMbzZ0akRH?=
 =?utf-8?B?OWp1OXdlb2tjOWtVby9rUk5TRmNqalZFMDNUdTFib1pVbTZuYlpkKzZGT1FU?=
 =?utf-8?B?ZkkzTHdZN2xDN3pHalFwNHpCcTBTMTZXY3ArT205cm53Zjk4V05KM29FcGgw?=
 =?utf-8?B?czhKZG5DSHp6b0w5SjFpL0ZiSEg1S2dVWVdZSEhmQ0xhTUw3bHhuNXluVm5l?=
 =?utf-8?Q?mAu5oB8huX0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3o1Zm1mTG00bjRndWZpZGlCUG9zVks5ZUlSTUFuTFhTL3Flc2JtZjZQMjFZ?=
 =?utf-8?B?V0FEMzNxSUd0WXZrNGF1WVFnUUdpejNpSFJETXNOV045TjhVcmRsRkdDOW5x?=
 =?utf-8?B?VWdobTJMNG9NR2hMNTVYQzZUOWlTRjJiT1prdDl1UG1vQlRwWXd0SXhDTStv?=
 =?utf-8?B?eGIzMHFrYjZNOThoWktCNHNic3NYbGcycGxENE9Ta3BBSGFTQTZFOXVJYm9W?=
 =?utf-8?B?aWNTcUFCR3ZBTUZudXNtZVB4NHBmT0hiWDIxT1JNQXNVcGNJM3hQOG9ieW42?=
 =?utf-8?B?QVJEQUJsYlE3ZGlsMjlFUFJRNGo4TGJsT1pMS1lTcEJzZEJQek9DdnNRdnFn?=
 =?utf-8?B?WjhEYStKSklVcWxUd0lDVFhhZnlnSWFiMGxJTi81QUFMNVRiVDdJQkZHUkk1?=
 =?utf-8?B?U3prSW02SHljOXo2WjM3MXl4TElPeW1uYWh6Z2hCMVMrVXR4clJaYmduRWJp?=
 =?utf-8?B?dHlxUHNld0pJN3VGdVZ5MVVZblhZK1RnZExUTE1BYno5dUVaQXA2Tnp5R0x6?=
 =?utf-8?B?VmlXK29RVWJVSzlMaUdhZ285dWZkWDRqemxhTzdsc0FOWTRQbjlhYTdCbWNu?=
 =?utf-8?B?WmNEV0ZFVlVUUGNhU0RtYzUwYlZuQkRxQUJYbzhMTitHdE0wR2l1cEJIeFg2?=
 =?utf-8?B?YlRUUlpKWXBBVlRzYkIvbGFtZWxFMDkrY0szc3ova1hwYWpiaGhMeGRwNTZo?=
 =?utf-8?B?MUE1NFpaYkptWjNTVE1BQXhibEZ4NkxqS3JkamtuVGlJU0Z0eUZQWTdqcWlk?=
 =?utf-8?B?aDYrbnAvci9UUXY4UnRLc0pralYyZFgrVjl3WmNkamx6cldMN3lSVVNlNTd6?=
 =?utf-8?B?YUNQRUd3RWxwNXk5VDZXQnhSdUYxbnlHUWxlbURGTUxmQlFleU9BQkVmVC9Q?=
 =?utf-8?B?YnBOY1RNTklvVGFRZUw5T2laL2ROYk9XWmo5ZlEwYWhHN3AwWHZ0MXUxY3Q1?=
 =?utf-8?B?b2JkTTZyWGJqc3J0Ky94eVAzazEzbXRjZFBrZHY2RkFpUjRucUpyVmVvVGxB?=
 =?utf-8?B?WmNnTGtiajJaczRhNDRvdU9wRnAvNjMrRHRxNFR0UVhNaVR2SDVVRGVMSG9H?=
 =?utf-8?B?TDNNbUdHNDlVS1RTcCtteDlnVnpyVzBlMG5CZld3SlFIOHdOanpOZC9vTUc2?=
 =?utf-8?B?d09maHJtUGtiVE5WVEdia1VEelZRRG1oZkhEWFhBdXNwTHRaRHdKMHU5Z0o0?=
 =?utf-8?B?ZlRYcHI5RnlhRUpUZ01pV0RaVjYwZmtMRE90a1NtVlhlcEpvMkNQNEdPVkNR?=
 =?utf-8?B?N3hXcUhKd0h0VGZOMjFhdVBIaHFBVnQrbmlpVGFkZ0NsWDJ5MGlYTnhLNytK?=
 =?utf-8?B?TnFBMnFSOHNmN2pWMGQ1RHFybXBKNVNJUDhHSHVQZ25tVW5YU0ZSamtleVRM?=
 =?utf-8?B?WmpYOGRkaERyTkpub1V1aUZBdXN1ZlFWSVgwNnBLTUV5UUNmMkt0VHB0YnVs?=
 =?utf-8?B?OVcyaDY4YUhVcmhnTHJqeUdCbmxDV0lSTG8xV2g0UVVwSnpQY0hnMGl4b0gz?=
 =?utf-8?B?UHRPSzc5SE5yeWJaUVBFSTNWVE9ockJQZDV6L0hQbkt0aDBFWWF0QnFqOG1C?=
 =?utf-8?B?ZVF6MlZyc290QUtnSEFNSitvZVNYMTlCdFl1UFR1ZWdDMkZ2SWV2ZnRMS2lk?=
 =?utf-8?B?L1J2cEtUaUg4bmhMOFFUbGloL1Q2bnlMMWxjWVBIUEo3RTN4ZFRzaGVjN1lx?=
 =?utf-8?B?a3BDMEJpRERDMlFJM25nOVRnelE0Z3lBdGM5cmlKM05CNDV6TDdvd3ljbFZw?=
 =?utf-8?B?dWduK1pEeDU0RmFCcVVYeGNXQVFrcDRJbkE0ckgyRWRCN1JmZVg2QlE1ajVk?=
 =?utf-8?B?MS9xR1NyeDhqWHN6Q25VU210bC8yanBmdHJ5enRzYVljRXpXemZJWjEwMjdm?=
 =?utf-8?B?K09rbVR0OXdkT09SS3ZNS0dlQzdQMklwemY3VmlGcUlOU2hBaGFHYkpOWlkv?=
 =?utf-8?B?YmZaWW9Lc29GK0lNdFlWd3hpUWhtU2VnZk14YWtBVHhLQUlJU0R2eHBNNHl1?=
 =?utf-8?B?ckFjNkRZL1hyYm85R1E0Skhic3VrSnUxQ3BRUkJhZStIV0xNanVQMFRjTklE?=
 =?utf-8?B?a2lMTmdrNndoY1hPNnpyak9uTTRWdWhsVitFTVkzVDk5NFUxUEZ1R3J6TkZz?=
 =?utf-8?Q?v2SINfclWr0pKzKnFU3PdiBqL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11eb7bd-f0d1-4d65-341d-08dd82519b77
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 10:28:37.1728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhMn3abRlpvCeBzM292ym/v2ExGvHqS27BdOFUuGj+9baoj6jilxYWmHlMlNkD/YzjV4iB0D5g1+Weq/itMtRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338

Hi Hans,


On 4/21/2025 9:10 PM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi,
>
> On 21-Apr-25 12:34 PM, Suma Hegde wrote:
>> Hi Hans and Gregory,
>>
>>
>> On 4/19/2025 2:29 PM, Hans de Goede wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> Hi Gregory,
>>>
>>> On 19-Apr-25 1:01 AM, Gregory Price wrote:
>>>> On Mon, Oct 21, 2024 at 11:14:25AM +0000, Suma Hegde wrote:
>>>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>>>> ... snip ...
>>>>> +#define DRIVER_NAME         "amd_hsmp"
>>>> ... snip ...
>>>>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>>>>> +#define DRIVER_NAME         "amd_hsmp"
>>>> Hi,
>>>>
>>>>   From looking around this patch, the code seems to suggest that these
>>>> drivers should not be mutually exclusive, but we are seeing an error
>>>> when attempting to load them both - apparently because they both use the
>>>> same driver name.
>>>>
>>>> Was this intended, or should the DRIVER_NAME="hsmp_acpi" for acpi.c?
>>> These drivers are mutually exclusive in the sense that only one of
>>> them should actually bind to the hw.
>>>
>>> Looking at the code this seems not to be guaranteed though ...
>> These drivers are supposed to be mutually exclusive drivers.
>>
>> We don't expect them to co-exist, Thats the reason we used the same name for the driver,
> That will not work though for legacy devices if e.g. both
> are builtin and the acpi.c code gets to register its
> driver first. In that case the legacy code will fail to
> register its driver, even though it is the one which should
> be used.
>
> Same happens if the acpi.c and plat.c code both are modules
> but acpi.c is (manually) loaded first on a legacy platform.
>
>> same name for character device and device file.
> Those are fine.
>
>> amd_hsmp is only for legacy platforms. All the new platforms will be having ACPI device.
>>
>>> drivers/platform/x86/amd/hsmp/plat.c has:
>>>
>>> static int __init hsmp_plt_init(void)
>>> {
>>>           int ret = -ENODEV;
>>>
>>>           if (!legacy_hsmp_support()) {
>>>                   pr_info("HSMP is not supported on Family:%x model:%x\n",
>>>                           boot_cpu_data.x86, boot_cpu_data.x86_model);
>>>                   return ret;
>>>           }
>>>
>>>           ...
>>>
>>> So loading that module should fail on AMD CPUs which fail the
>>> legacy_hsmp_support() check. Which checks CPU family and model.
>>>
>>> Since you are seeing the error you are reporting the system you
>>> are testing on does pass that test.
>>>
>>> Question, did you manually load hsmp_acpi, or did that auto-load?
>>>
>>> Or a totally different way to ask the same thing, do you have
>>> any AMDI0097:0? devices under /sys/bus/platform/devices ?
>>>
>>> ATM it seems that the plat.c code assumes that on hw where
>>> legacy_hsmp_support() returns true there will never be an
>>> AMDI0097:0? device which I'm not sure is a safe assumption
>>> to make.
>>>
>>> IMHO besides the "if (!legacy_hsmp_support())" check,
>>> hsmp_plt_init() should also do:
>>>
>>>           if (acpi_dev_present("AMDI0097", NULL, -1))
>>>                   return -ENODEV;
>>>
>>> leaving the HSMP handling up to the hsmp_acpi driver
>>> when an AMDI0097:0? device is present.
>>>
>>> Note that the identical driver-name is still an issue even
>>> with this check, because if both checks pass a user could
>>> still manually load hsmp_acpi and get the driver name conflict
>>> error.
>> To fix the "Driver 'amd_hsmp' is already registered, aborting..." error when both are loaded, the driver name has to be changed, but while changing the driver name
>>
>> adding the below lines which is suggested above by Hans is important.
>>
>> if (acpi_dev_present("AMDI0097", NULL, -1))
>>                  return -ENODEV;
> Ack, the combination of rename of the driver + the above check
> should fix things.
>
>> Otherwise on Family 0x1A Model 0x0-0xF platform where both are supported (this is the transitional platform where both are supported)
>>
>> it will register the driver and complain for creating duplicate entries of character device if user tries to load both.
>>
>> We will add this check and send out the updated patch.
>>
>>> Another issue with the driver seems to be that hsmp_acpi_probe()
>>> relies on hsmp_pdev->is_probed to only do some initialization
>>> once, but that is_probed flag is not protected by a mutex,
>>> so when async probing is used 2 hsmp_acpi_probe() calls can
>>> race and make a mess of things.
>> For the asynchronous probing, we will guard hsmp_pdev->is_probed code with mutex.
> Great, thank you. Note you need to keep the mutex locked
> for almost the entire code flow in hsmp_acpi_probe() (until
> is_probed = true is done).
>
> Please consider using:
>
>          guard(mutex)(&hsmp_pdev->mutex);
>
> in hsmp_acpi_probe() directly after getting hsmp_dev, this
> this avoids the need to manual unlock the mutex.
>
> Note the mutex will be a new addition to struct hsmp_plat_device,
> currently this has no mutex.
>
> And this will need to use a static mutex initializer.
>
> Regards,
>
> Hans

Thanks for these inputs. I will take all these into account and send a 
patch.


Regards,

Suma

>
>
>
