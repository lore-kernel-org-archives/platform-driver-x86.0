Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA61F8682;
	Tue,  7 Jan 2025 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285413; cv=fail; b=ZXeFYe/kUT51SMyDDkwB734k/j2ph23CE0CgzQKTcI5Ffi2qZz8stY/yrHoqnpF7Z55bAIM1NmYMsDIs7VRD0ybDpz5zTVPQ5nzMm8+W9KrF0T9WayVzVLg3GGuMSxNOzVhHVl/G6D+IB5AyXBS1iGgQLWiA06Ft8pAcPY46/3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285413; c=relaxed/simple;
	bh=qbkkz/LgxBLiGzGmux8hcXGQvXppA9HvLgWEjvO4Fc4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QF/iMdyY1M0ZihTQ22INvUHPl152irD9km36f957NeUKV/B9jImfFMTdlth01K9Gg+lfkj1Rer8UbFxPEty36QQuNOuwHAVJuHgK3k5qKC/fNICPFFvX6XymvYizJA072fM4r0M/1DItA8/bO8OflPj+RjD67yX20MITd95sxe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BkZCnI3D; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BkZCnI3D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVwZe3vdtMWE/saNsQkcMAigmjedx9zWX+uOkL2PNtio3Qmfku/vfO8OIxthSNan/xWU2+OeKkXxWfKvPkwUYpZKxIl2cgYFj1rNxEfUVS1SxlgD2E6QxbrXvG53GUzqPb+18Aj87oz3PZ60K7NK5uG4rrQVkxUBFlRHDHINYYkIXoqqPpcdqP6eysl3nKoKWTuT+Nj0pgEmQVcvXhe07s6CZZQVIWndhygzLyullvIG4Vpr40IYOzFFjfOKzpGX+NMegj4IAaPoYMW00idzvcw6Hye2gTEKAKY2urvNQ7JvpnLkt6WpNXLmttWEhCHUWjWYK1GKrdPp9ej5fFvX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwGLF5awVoNl8gnmBEFHDYxpkp5v3K5c3DhuWouLBUc=;
 b=jdU1jrFgtySCIWca33dhd4KbOZ+w5aLJDrUEOfJFuIfjUL43j5E0vWVu9/l2DczcphI5jvv4/KrhvAiHqCjvKAN7MPrMXtH7xWYbJq/ZVYfm4ZBO1jiMTOXoS8v6a30cdD0Vpu7ma/aOg75WyjJ93AXpRZadEqdv4BrkgAYTs1BVJaxGzhIkKsdcaoX0QkC6FEYKkV2RPMNbQyh/L8gXuWEaClpqZce4qr5kkpl+LJTLsa4f1iqOAf6XMJa8c163T2I9VoP1M10F81lvQDjwM3yBXOLGh43gjtP6Y/fXkvFD58Yp5BsxPeBcvUj6rAOmCyWEG9ZMWQJq2Tdb+wQIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwGLF5awVoNl8gnmBEFHDYxpkp5v3K5c3DhuWouLBUc=;
 b=BkZCnI3DEad7ge/a7c0spWDpUKfIVTWdSYX/z87eWgg705mELj8kpDdh9bU5SM3S79CKnmWn08UtMIq7A0gvlUjgbwPjDgyaW49AexLL1pcMvZ0EttvmoRwbDXQe/JMbKNg/fbGTGP6DYuGzaHt0MHf8YivZ7+TNO8FmxhZ9fxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:30:02 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:02 +0000
Message-ID: <5a37a3da-dead-4be0-9ee0-b734531cd9ad@amd.com>
Date: Tue, 7 Jan 2025 15:30:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] platform/x86: Split the alienware-wmi driver
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-19-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-19-kuurtb@gmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: e11f8bc1-1dc7-4774-988d-08dd2f6271d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGpzaVVQMXFob3NMdHVPWEpwQVZJN3ZGUkRrS25IYzVVOVhqTHpFL2lIVFFh?=
 =?utf-8?B?Nm9NVHNmUGZpSFpmYTVPVDFZZUVNSE9YeGNvcmlmdEE4RSt2RHdXL0Y4cGhY?=
 =?utf-8?B?RjlJZFBWUjB5dTZhSFBXYWdQU0NFREZtbUF5TUxtUUJ2T1VDOWh2OEZsZkNN?=
 =?utf-8?B?dlB4Mk82VWc3ekZOL2s2d3FaTUE5RUdQaTV3TzVlRTVwYjJsYTNCTVNkZVVQ?=
 =?utf-8?B?T1VvUU9hRGJMTUY1UFpNV0U2OHpMK3hFNVZ1WFdxV3ZPa3FBZXRRWmhGYjdB?=
 =?utf-8?B?Q2srUEFoUzNhTkxEOUVQbDdlZlVCU3U5NDlvNWxBbGg5YnY1ZTVDNTBTUFg5?=
 =?utf-8?B?NHRIeGcvZ2xNQnpFWWp1YWtWTGtlbmU1VUFlcTVzbndMam1hUWVRdUNyY0ZZ?=
 =?utf-8?B?dmdESnl1MksyLzlwV0NrTnF5MVcwbVVOS1hOamRHS1BKR1Vxdk1WOFEvT2ZN?=
 =?utf-8?B?MEV2YU5TM0dQMCs0eUNiZmNkUjZkVEZKOE94amxFZU9oSm53RnV2cFdhb0I5?=
 =?utf-8?B?enY0a0ppNkxtNWhWS0pmZnVraE5DOUt3UThQcGdKY0RpZWNxeXN3ZTRDdGkv?=
 =?utf-8?B?TnE3dGFCZTZPSlBRNHRPaDVYemtNajZPamxSWXpKSEZjZGh4WWZoemx1OEVj?=
 =?utf-8?B?WDRnYVZtb2JrcmlYWWdiR05GWHFMZTk5WXg4WE1kNE9GWnM1UEdOWS95TVlR?=
 =?utf-8?B?ZXprZlV6T1N1d08xdzN3bzdRRXpIMDJteG1iR0pRSnp4VXhhbHQySVFZOVhB?=
 =?utf-8?B?N3VERCtXY0k3Ym04OHlXaE15RFlSekZzaVk2SFBOWU5uemxybHdwZUEzWjBY?=
 =?utf-8?B?UUExMXlvcmRTK0xhQ2FQQzF5d0ZlUGpkMnd3ak1jckFHcVRibjdFRlNnMUh5?=
 =?utf-8?B?UDc2cnRIVUsrMzFuY0wrL3BvNE8yS0ZpSHRzbnMxWjkvdVN5aEpYVE5xbi9C?=
 =?utf-8?B?VVRpVDltdzI0YlB2NzQ2TzhRdXZVRWpteXBQcDlSUmJPRUFXQnhqdzgxM1pH?=
 =?utf-8?B?eWE0b1VaTjdPSmM0dWFJdkRRVDFZYUZMUjdOMmFVNkFDSU1yUWJYdlRHMWxS?=
 =?utf-8?B?cmZGN3Y2anZnbVhOaHhNQkoyOFRlY2RrZ1lJRTFaQnZQdXVyV2RkV2lEUVN6?=
 =?utf-8?B?V0ZlZWxlc29rbDg4QUpSN1JmbjJpVno4OHdueFZUcUlOMm5GVEdra1VLYjJ6?=
 =?utf-8?B?MjFSajM0WFNodEVqSjd1RVZBV1B1MlFrVUpnb0grdWN6S1pub0NMQTVmRGUx?=
 =?utf-8?B?cnF6ajdZdC96NTh0dnNrVklDZ0hla1Ntb2tCQXZ1NURqZTNxU3pBY2x1eFpp?=
 =?utf-8?B?OGxQOVVvamEyKzFwQnB2eVJRTWpEci9MWmlJM2I1MGloOXNkWTVmNVBBVUNh?=
 =?utf-8?B?elFFZWdBZUx0R1BRWWhrMjFqZVVxNWxxMlJtU2oySE1yN0xxUHRLT2JwZll1?=
 =?utf-8?B?RWVld21qSUdNSmZVUXlCZXlvemdnRXNsWEVEb29qYjBCS1lZRlhlL2NKMk9E?=
 =?utf-8?B?YStiM3hhdHU1cHU4TTNJNzR3cEtOVzFsakVyTGlSd1BEUDFpUVF2VVIwcENy?=
 =?utf-8?B?QVcwaTloMUZ0T0NCck9jTEg2Z2gzS04rR3IvLzBIR3FPRGVHSkJvUVN2ck9G?=
 =?utf-8?B?TXp1MmJib1JlNHN3ZjJYY245ZUNtYnl3WERqcE5KTzNVYmgzUHFjbzVYR1FE?=
 =?utf-8?B?dU84bXdZQ2wvOFgwTnhwS2hHMXVQSHcxWjZjaE4vVFBFVEdmamw1VDZBcXp5?=
 =?utf-8?B?NldLZ2JGRUZxTkEzYjJPTFNyVGNtSjg3TFhpdTZWUktMcWNrZ3oxOXRiaUgr?=
 =?utf-8?B?T2pCenlVcDRRK1JXVzUwRitvZG9tREx6SjBlbHJDNkcwZ25yTzhBeDF0Ym5w?=
 =?utf-8?Q?+1CtZ/tf133gC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVFtc25jRnlhRDNvNlhSeDljckZ6UzA4d2RTMGptNkhrVzRFSjlmVS9pVlZv?=
 =?utf-8?B?NEdsNVhlbFE3NFpSRkRDUUJSSXBUWUd3S3p4WkpRaytMYm9ZeWZZbmRMeWF3?=
 =?utf-8?B?dHZ4WWtHVC9pYWtpS2dsOWZkOURaRXFWSGZ6T1VCVUdzOU1HU0xxRXpRL1Vh?=
 =?utf-8?B?S0p5MUF0NU5hRExsd25OR21lcUl0MzQwemxtTWtDSTVWSzNtTzhvMzFhZm9m?=
 =?utf-8?B?NkRWaFo1MXNhUHBVZ2xDTDZmRThhS1pVK0dqc3ZCWnVWNktSNGxRdGpwcjVr?=
 =?utf-8?B?WXhGeUtRS2JVV3FHUEw3M2RFd2NsWFozc2p0L0dpTDJTZ2NscmMrVlJJWWNJ?=
 =?utf-8?B?dXZpYVFwWFQ5Ni8wVitVQlpLYk1nNGMvOGRZK2VWYlBnWEtPSmlHbGlPV1lG?=
 =?utf-8?B?RFZqbC95MW9uclV2dWZET1VVeTNkTGFCbUIwSHNpRzVrZms1bEc4U28vNXFP?=
 =?utf-8?B?Um5Sa05PLzBNVU9jRjNaVS9oVG9LTlVMZTB1dU44NTVGQ3FFL1VtSTRDVkxa?=
 =?utf-8?B?N1FyakV3MkJIbUIrQm5rSFZFelRzbDNKOG1JalhBU2h2aTBvS1VzdnR4ZnZD?=
 =?utf-8?B?WXE5Y2VFbVJjVHlxbVo4dFRNSEwraGJvdDNmRUhnbXJDNHV6ejNKVTl4OTkw?=
 =?utf-8?B?djYzUWtTSFlVK0ZMcjhxcFZVcDBWYkxpR0Z6bHk4WHI1T09uQXdvWDJnSS85?=
 =?utf-8?B?RC9nUFNKZFE0WVVRNXgyNzlvWEx5MmRndm14KytRNkFtZ1NIVXhmZkZ0YVNE?=
 =?utf-8?B?dHZtM2NWTllONWpjalk2aU1EOS8za3c2NmNsaHlKdDNDVGd0STVpWWxPSGY0?=
 =?utf-8?B?Z0FYNjI3ejZmbXVHaWEva2t4dTN1bS9Ycm5RUHNQNzdCRUdCcmprMmpwR0I3?=
 =?utf-8?B?bmpLNXg1aUhEcVdYQ3MrYW1XUjVjSVVPODdtcnRrY1ltMmNzTW01Y3VVM2Ez?=
 =?utf-8?B?VFRUQnBoYkJLd3R1cVhIcGVXRWx1OERRaCtWK0kxYkpKMnc0a2JCeU1LWHJO?=
 =?utf-8?B?WjhjTE9FUWRHUFlnRGU5bDdkdGpPZUJEMUtGOEkxK3VLUTV0N2ZuZHphOTd2?=
 =?utf-8?B?K1hlOFM1bERlMEZqaXdZajZXSU5zWnVSY3NVeGZXcVZLTDJWY2kwSFJURkZU?=
 =?utf-8?B?S2daUlN0RDdMY1FTUGErQzg5bndRb2VyWVF5c21uOU9iNlhnZy9pbnBGYi9L?=
 =?utf-8?B?T0VKcTB6cC9iMVh5bnVUL25BVXdiK1Q0aWNsYndBa0s1d0tUWFd3MTgvTVNU?=
 =?utf-8?B?UzVpK0N5UzUvY2k5SVlpbHpUQ0g5V2tqeklOY1pZTFVhTnBYNUdRdHBIUCtN?=
 =?utf-8?B?OWVCR0dpM0JiRi9oamJLd0FoWVB4TkEvSUhuWnpaMFk2Mk9maTdXUnlWaXFF?=
 =?utf-8?B?Wi9mbEpUditxOFdvV0wxdlpDWjMvMVBSRWgvTlJXd0ZxNERpdVhEZy9YU2Z6?=
 =?utf-8?B?RWtQZWNkVVpoaGhwcVRnUFp0NE5Tb2JFRW5CZ3MrVHlNUnhGbElybjFPcHBY?=
 =?utf-8?B?dkphazF3cGQ2d0Uzd2xXRlR2ZjM4MjhFek0velhqWk04a0x2cFVXc3BMVFd1?=
 =?utf-8?B?MDdTT0NhRGJrR0hrMTd5OTRjNy9abThhbyt5NCt1ODlYd3NBV0N2dWgzM1dW?=
 =?utf-8?B?MVg1d25hOS9aMTRyK2JuR2VneW5sNzBoa1JDNFZZWTU3bnBOL1ppMzdIWGxQ?=
 =?utf-8?B?VTlGbFR4UUtyWVk1NHF3OXVFSjFaWVF3bjVWRGFSU1d3QzhuS0JKQkJuYjJ2?=
 =?utf-8?B?N2ZPMi9sSTNoMmYzaFFtK0NQc1NRenFoSllFSjY1TE1pUkpFREV1ME1oWlRZ?=
 =?utf-8?B?bEoxNCtWdDczdlFvZ29USDc5UnFDY1ZGcHBObGlURElKenJQUUdzVGhYNmpP?=
 =?utf-8?B?c2FoZGNhdGdHU3NEYUg3TlU5bnB6NGF0ekhLejJ3bllnVTYrREI1N3k4b2p5?=
 =?utf-8?B?cFpsbVJkenVEOGFxaUhPYVVydS83K25JR0lIdXliTFhDZWlpYU5MTWRVREZG?=
 =?utf-8?B?UmVyWlJRSWNseWJaQ1RTcmlMQWlWTHBqT29kMytsMmZoYWZGTEF2UW9MbU5q?=
 =?utf-8?B?aUJSTXhoRHVoTURNaVBoRGViWVlkOVZySnBYQkxwTzRQZVZvSzFnLy9tcVFW?=
 =?utf-8?Q?dZr7ppXai+raDdBPOQxN3WjLT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11f8bc1-1dc7-4774-988d-08dd2f6271d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:02.1453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ghl3z2jQeU/Yy+lJeDrgUTdgfytdZpkI+PfHP/wup2ES4+a4+hsYelsJJfHVQMFFpb3Jv59KqIPB9ZCfuItD3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Split alienware-wmi WMI drivers into different files. This is done
> seamlessly by copying and pasting, however some blocks are reordered.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/Makefile            |   2 +
>   .../platform/x86/dell/alienware-wmi-base.c    | 847 +-----------------
>   .../platform/x86/dell/alienware-wmi-legacy.c  |  98 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    | 767 ++++++++++++++++
>   drivers/platform/x86/dell/alienware-wmi.h     |   1 -
>   5 files changed, 868 insertions(+), 847 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
> 
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index f8aec8502c2f..03ba459f3d31 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -6,6 +6,8 @@
>   
>   obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
>   alienware-wmi-objs			:= alienware-wmi-base.o
> +alienware-wmi-y				+= alienware-wmi-legacy.o
> +alienware-wmi-y				+= alienware-wmi-wmax.o
>   obj-$(CONFIG_DCDBAS)			+= dcdbas.o
>   obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
>   obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
> index 9fa5ac48436e..78101952094c 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -6,96 +6,21 @@
>    */
>   
>   #include <linux/acpi.h>
> -#include <linux/bitfield.h>
> -#include <linux/bits.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/platform_profile.h>
>   #include <linux/dmi.h>
>   #include <linux/leds.h>
> -#include <linux/wmi.h>
>   #include "alienware-wmi.h"
>   
> -#define WMAX_METHOD_HDMI_SOURCE		0x1
> -#define WMAX_METHOD_HDMI_STATUS		0x2
> -#define WMAX_METHOD_BRIGHTNESS		0x3
> -#define WMAX_METHOD_ZONE_CONTROL	0x4
> -#define WMAX_METHOD_HDMI_CABLE		0x5
> -#define WMAX_METHOD_AMPLIFIER_CABLE	0x6
> -#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
> -#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
> -#define WMAX_METHOD_THERMAL_INFORMATION	0x14
> -#define WMAX_METHOD_THERMAL_CONTROL	0x15
> -#define WMAX_METHOD_GAME_SHIFT_STATUS	0x25
> -
> -#define WMAX_THERMAL_MODE_GMODE		0xAB
> -
> -#define WMAX_FAILURE_CODE		0xFFFFFFFF
> -
>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>   MODULE_DESCRIPTION("Alienware special feature control");
>   MODULE_LICENSE("GPL");
>   
> -static bool force_platform_profile;
> -module_param_unsafe(force_platform_profile, bool, 0);
> -MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
> -
> -static bool force_gmode;
> -module_param_unsafe(force_gmode, bool, 0);
> -MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
> -
>   enum INTERFACE_FLAGS {
>   	LEGACY,
>   	WMAX,
>   };
>   
> -enum WMAX_THERMAL_INFORMATION_OPERATIONS {
> -	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
> -	WMAX_OPERATION_LIST_IDS			= 0x03,
> -	WMAX_OPERATION_CURRENT_PROFILE		= 0x0B,
> -};
> -
> -enum WMAX_THERMAL_CONTROL_OPERATIONS {
> -	WMAX_OPERATION_ACTIVATE_PROFILE		= 0x01,
> -};
> -
> -enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
> -	WMAX_OPERATION_TOGGLE_GAME_SHIFT	= 0x01,
> -	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	= 0x02,
> -};
> -
> -enum WMAX_THERMAL_TABLES {
> -	WMAX_THERMAL_TABLE_BASIC		= 0x90,
> -	WMAX_THERMAL_TABLE_USTT			= 0xA0,
> -};
> -
> -enum wmax_thermal_mode {
> -	THERMAL_MODE_USTT_BALANCED,
> -	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
> -	THERMAL_MODE_USTT_COOL,
> -	THERMAL_MODE_USTT_QUIET,
> -	THERMAL_MODE_USTT_PERFORMANCE,
> -	THERMAL_MODE_USTT_LOW_POWER,
> -	THERMAL_MODE_BASIC_QUIET,
> -	THERMAL_MODE_BASIC_BALANCED,
> -	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
> -	THERMAL_MODE_BASIC_PERFORMANCE,
> -	THERMAL_MODE_LAST,
> -};
> -
> -static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_MODE_LAST] = {
> -	[THERMAL_MODE_USTT_BALANCED]			= PLATFORM_PROFILE_BALANCED,
> -	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> -	[THERMAL_MODE_USTT_COOL]			= PLATFORM_PROFILE_COOL,
> -	[THERMAL_MODE_USTT_QUIET]			= PLATFORM_PROFILE_QUIET,
> -	[THERMAL_MODE_USTT_PERFORMANCE]			= PLATFORM_PROFILE_PERFORMANCE,
> -	[THERMAL_MODE_USTT_LOW_POWER]			= PLATFORM_PROFILE_LOW_POWER,
> -	[THERMAL_MODE_BASIC_QUIET]			= PLATFORM_PROFILE_QUIET,
> -	[THERMAL_MODE_BASIC_BALANCED]			= PLATFORM_PROFILE_BALANCED,
> -	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> -	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
> -};
> -
>   struct alienfx_quirks *alienfx;
>   
>   static struct alienfx_quirks quirk_inspiron5675 = {
> @@ -220,138 +145,7 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
>   	{}
>   };
>   
> -struct wmax_brightness_args {
> -	u32 led_mask;
> -	u32 percentage;
> -};
> -
> -struct wmax_basic_args {
> -	u8 arg;
> -};
> -
> -struct legacy_led_args {
> -	struct color_platform colors;
> -	u8 brightness;
> -	u8 state;
> -} __packed;
> -
> -struct wmax_led_args {
> -	u32 led_mask;
> -	struct color_platform colors;
> -	u8 state;
> -} __packed;
> -
> -struct wmax_u32_args {
> -	u8 operation;
> -	u8 arg1;
> -	u8 arg2;
> -	u8 arg3;
> -};
> -
> -struct awcc_priv {
> -	struct wmi_device *wdev;
> -	struct platform_profile_handler pp_handler;
> -	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> -};
> -
> -static u8 interface;
> -
> -struct awcc_quirks {
> -	bool gmode;
> -};
> -
> -static struct awcc_quirks g_series_quirks = {
> -	.gmode = true,
> -};
> -
> -static struct awcc_quirks generic_quirks = {
> -	.gmode = false,
> -};
> -
> -static const struct dmi_system_id awcc_dmi_table[] __initconst = {
> -	{
> -		.ident = "Alienware m17 R5",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> -		},
> -		.driver_data = &generic_quirks,
> -	},
> -	{
> -		.ident = "Alienware m18 R2",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> -		},
> -		.driver_data = &generic_quirks,
> -	},
> -	{
> -		.ident = "Alienware x15 R1",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> -		},
> -		.driver_data = &generic_quirks,
> -	},
> -	{
> -		.ident = "Alienware x17 R2",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> -		},
> -		.driver_data = &generic_quirks,
> -	},
> -	{
> -		.ident = "Dell Inc. G15 5510",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> -		},
> -		.driver_data = &g_series_quirks,
> -	},
> -	{
> -		.ident = "Dell Inc. G15 5511",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> -		},
> -		.driver_data = &g_series_quirks,
> -	},
> -	{
> -		.ident = "Dell Inc. G15 5515",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> -		},
> -		.driver_data = &g_series_quirks,
> -	},
> -	{
> -		.ident = "Dell Inc. G3 3500",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> -		},
> -		.driver_data = &g_series_quirks,
> -	},
> -	{
> -		.ident = "Dell Inc. G3 3590",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> -		},
> -		.driver_data = &g_series_quirks,
> -	},
> -	{
> -		.ident = "Dell Inc. G5 5500",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> -		},
> -		.driver_data = &g_series_quirks,
> -	},
> -};
> -
> -struct awcc_quirks *awcc;
> +u8 interface;
>   
>   int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>   			  void *in_args, size_t in_size, u32 *out_data)
> @@ -587,445 +381,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
>   	return priv->global_brightness;
>   }
>   
> -/*
> - *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
> - *	It can toggle between standard system GPU output and HDMI input.
> - */
> -static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
> -			  char *buf)
> -{
> -	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> -	struct wmax_basic_args in_args = {
> -		.arg = 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
> -				    &in_args, sizeof(in_args), &out_data);
> -
> -	if (!ret) {
> -		if (out_data == 0)
> -			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> -		else if (out_data == 1)
> -			return sysfs_emit(buf, "unconnected [connected] unknown\n");
> -	}
> -
> -	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
> -	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> -}
> -
> -static ssize_t source_show(struct device *dev, struct device_attribute *attr,
> -			   char *buf)
> -{
> -	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> -	struct wmax_basic_args in_args = {
> -		.arg = 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
> -				    &in_args, sizeof(in_args), &out_data);
> -
> -	if (!ret) {
> -		if (out_data == 1)
> -			return sysfs_emit(buf, "[input] gpu unknown\n");
> -		else if (out_data == 2)
> -			return sysfs_emit(buf, "input [gpu] unknown\n");
> -	}
> -
> -	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
> -	return sysfs_emit(buf, "input gpu [unknown]\n");
> -}
> -
> -static ssize_t source_store(struct device *dev, struct device_attribute *attr,
> -			    const char *buf, size_t count)
> -{
> -	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> -	struct wmax_basic_args args;
> -	int ret;
> -
> -	if (strcmp(buf, "gpu\n") == 0)
> -		args.arg = 1;
> -	else if (strcmp(buf, "input\n") == 0)
> -		args.arg = 2;
> -	else
> -		args.arg = 3;
> -	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
> -
> -	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
> -				    sizeof(args), NULL);
> -
> -	if (ret < 0)
> -		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
> -
> -	return count;
> -}
> -
> -static DEVICE_ATTR_RO(cable);
> -static DEVICE_ATTR_RW(source);
> -
> -static bool hdmi_group_visible(struct kobject *kobj)
> -{
> -	return alienfx->hdmi_mux;
> -}
> -DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
> -
> -static struct attribute *hdmi_attrs[] = {
> -	&dev_attr_cable.attr,
> -	&dev_attr_source.attr,
> -	NULL,
> -};
> -
> -static const struct attribute_group hdmi_attribute_group = {
> -	.name = "hdmi",
> -	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
> -	.attrs = hdmi_attrs,
> -};
> -
> -/*
> - * Alienware GFX amplifier support
> - * - Currently supports reading cable status
> - * - Leaving expansion room to possibly support dock/undock events later
> - */
> -static ssize_t status_show(struct device *dev, struct device_attribute *attr,
> -			   char *buf)
> -{
> -	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> -	struct wmax_basic_args in_args = {
> -		.arg = 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
> -				    &in_args, sizeof(in_args), &out_data);
> -
> -	if (!ret) {
> -		if (out_data == 0)
> -			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> -		else if (out_data == 1)
> -			return sysfs_emit(buf, "unconnected [connected] unknown\n");
> -	}
> -
> -	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
> -	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> -}
> -
> -static DEVICE_ATTR_RO(status);
> -
> -static bool amplifier_group_visible(struct kobject *kobj)
> -{
> -	return alienfx->amplifier;
> -}
> -DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
> -
> -static struct attribute *amplifier_attrs[] = {
> -	&dev_attr_status.attr,
> -	NULL,
> -};
> -
> -static const struct attribute_group amplifier_attribute_group = {
> -	.name = "amplifier",
> -	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
> -	.attrs = amplifier_attrs,
> -};
> -
> -/*
> - * Deep Sleep Control support
> - * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
> - */
> -static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
> -			      char *buf)
> -{
> -	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> -	struct wmax_basic_args in_args = {
> -		.arg = 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
> -				    &in_args, sizeof(in_args), &out_data);
> -
> -	if (!ret) {
> -		if (out_data == 0)
> -			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
> -		else if (out_data == 1)
> -			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
> -		else if (out_data == 2)
> -			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
> -	}
> -
> -	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
> -	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
> -}
> -
> -static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
> -			       const char *buf, size_t count)
> -{
> -	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> -	struct wmax_basic_args args;
> -	int ret;
> -
> -	if (strcmp(buf, "disabled\n") == 0)
> -		args.arg = 0;
> -	else if (strcmp(buf, "s5\n") == 0)
> -		args.arg = 1;
> -	else
> -		args.arg = 2;
> -	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
> -
> -	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
> -				    &args, sizeof(args), NULL);
> -
> -	if (!ret)
> -		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
> -
> -	return count;
> -}
> -
> -static DEVICE_ATTR_RW(deepsleep);
> -
> -static bool deepsleep_group_visible(struct kobject *kobj)
> -{
> -	return alienfx->deepslp;
> -}
> -DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
> -
> -static struct attribute *deepsleep_attrs[] = {
> -	&dev_attr_deepsleep.attr,
> -	NULL,
> -};
> -
> -static const struct attribute_group deepsleep_attribute_group = {
> -	.name = "deepsleep",
> -	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
> -	.attrs = deepsleep_attrs,
> -};
> -
> -/*
> - * Thermal Profile control
> - *  - Provides thermal profile control through the Platform Profile API
> - */
> -#define WMAX_THERMAL_TABLE_MASK		GENMASK(7, 4)
> -#define WMAX_THERMAL_MODE_MASK		GENMASK(3, 0)
> -#define WMAX_SENSOR_ID_MASK		BIT(8)
> -
> -static bool is_wmax_thermal_code(u32 code)
> -{
> -	if (code & WMAX_SENSOR_ID_MASK)
> -		return false;
> -
> -	if ((code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_LAST)
> -		return false;
> -
> -	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_BASIC &&
> -	    (code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_BASIC_QUIET)
> -		return true;
> -
> -	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
> -	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
> -		return true;
> -
> -	return false;
> -}
> -
> -static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
> -				    u8 arg, u32 *out_data)
> -{
> -	struct wmax_u32_args in_args = {
> -		.operation = operation,
> -		.arg1 = arg,
> -		.arg2 = 0,
> -		.arg3 = 0,
> -	};
> -	int ret;
> -
> -	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
> -				    &in_args, sizeof(in_args), out_data);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (*out_data == WMAX_FAILURE_CODE)
> -		return -EBADRQC;
> -
> -	return 0;
> -}
> -
> -static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
> -{
> -	struct wmax_u32_args in_args = {
> -		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
> -		.arg1 = profile,
> -		.arg2 = 0,
> -		.arg3 = 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> -				    &in_args, sizeof(in_args), &out_data);
> -	if (ret)
> -		return ret;
> -
> -	if (out_data == WMAX_FAILURE_CODE)
> -		return -EBADRQC;
> -
> -	return 0;
> -}
> -
> -static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
> -				  u32 *out_data)
> -{
> -	struct wmax_u32_args in_args = {
> -		.operation = operation,
> -		.arg1 = 0,
> -		.arg2 = 0,
> -		.arg3 = 0,
> -	};
> -	int ret;
> -
> -	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> -				    &in_args, sizeof(in_args), out_data);
> -
> -	if (ret < 0)
> -		return ret;
> -
> -	if (*out_data == WMAX_FAILURE_CODE)
> -		return -EOPNOTSUPP;
> -
> -	return 0;
> -}
> -
> -static int thermal_profile_get(struct platform_profile_handler *pprof,
> -			       enum platform_profile_option *profile)
> -{
> -	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
> -	u32 out_data;
> -	int ret;
> -
> -	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
> -				       0, &out_data);
> -
> -	if (ret < 0)
> -		return ret;
> -
> -	if (out_data == WMAX_THERMAL_MODE_GMODE) {
> -		*profile = PLATFORM_PROFILE_PERFORMANCE;
> -		return 0;
> -	}
> -
> -	if (!is_wmax_thermal_code(out_data))
> -		return -ENODATA;
> -
> -	out_data &= WMAX_THERMAL_MODE_MASK;
> -	*profile = wmax_mode_to_platform_profile[out_data];
> -
> -	return 0;
> -}
> -
> -static int thermal_profile_set(struct platform_profile_handler *pprof,
> -			       enum platform_profile_option profile)
> -{
> -	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
> -
> -	if (awcc->gmode) {
> -		u32 gmode_status;
> -		int ret;
> -
> -		ret = wmax_game_shift_status(priv->wdev,
> -					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
> -					     &gmode_status);
> -
> -		if (ret < 0)
> -			return ret;
> -
> -		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
> -		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
> -			ret = wmax_game_shift_status(priv->wdev,
> -						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
> -						     &gmode_status);
> -
> -			if (ret < 0)
> -				return ret;
> -		}
> -	}
> -
> -	return wmax_thermal_control(priv->wdev,
> -				    priv->supported_thermal_profiles[profile]);
> -}
> -
> -static int create_thermal_profile(struct wmi_device *wdev)
> -{
> -	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
> -	enum platform_profile_option profile;
> -	enum wmax_thermal_mode mode;
> -	u8 sys_desc[4];
> -	u32 first_mode;
> -	u32 out_data;
> -	int ret;
> -
> -	ret = wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
> -				       0, (u32 *) &sys_desc);
> -	if (ret < 0)
> -		return ret;
> -
> -	first_mode = sys_desc[0] + sys_desc[1];
> -
> -	for (u32 i = 0; i < sys_desc[3]; i++) {
> -		ret = wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
> -					       i + first_mode, &out_data);
> -
> -		if (ret == -EIO)
> -			return ret;
> -
> -		if (ret == -EBADRQC)
> -			break;
> -
> -		if (!is_wmax_thermal_code(out_data))
> -			continue;
> -
> -		mode = out_data & WMAX_THERMAL_MODE_MASK;
> -		profile = wmax_mode_to_platform_profile[mode];
> -		priv->supported_thermal_profiles[profile] = out_data;
> -
> -		set_bit(profile, priv->pp_handler.choices);
> -	}
> -
> -	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
> -		return -ENODEV;
> -
> -	if (awcc->gmode) {
> -		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
> -			WMAX_THERMAL_MODE_GMODE;
> -
> -		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
> -	}
> -
> -	priv->pp_handler.profile_get = thermal_profile_get;
> -	priv->pp_handler.profile_set = thermal_profile_set;
> -	priv->pp_handler.name = "alienware-wmi";
> -	priv->pp_handler.dev = &wdev->dev;
> -
> -	return devm_platform_profile_register(&priv->pp_handler);
> -}
> -
> -static int alienware_awcc_setup(struct wmi_device *wdev)
> -{
> -	struct awcc_priv *priv;
> -
> -	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	dev_set_drvdata(&wdev->dev, priv);
> -	priv->wdev = wdev;
> -
> -	return create_thermal_profile(wdev);
> -}
> -
>   /*
>    * Platform Driver
>    */
> @@ -1060,13 +415,6 @@ static const struct attribute_group *alienfx_groups[] = {
>   	NULL
>   };
>   
> -static const struct attribute_group *wmax_alienfx_groups[] = {
> -	&hdmi_attribute_group,
> -	&amplifier_attribute_group,
> -	&deepsleep_attribute_group,
> -	NULL
> -};
> -
>   static struct platform_driver platform_driver = {
>   	.driver = {
>   		.name = "alienware-wmi",
> @@ -1106,199 +454,6 @@ void alienware_alienfx_exit(struct wmi_device *wdev)
>   	platform_driver_unregister(&platform_driver);
>   }
>   
> -/*
> - * Legacy WMI driver
> - */
> -static int legacy_wmi_update_led(struct alienfx_priv *priv,
> -				 struct wmi_device *wdev, u8 location)
> -{
> -	struct legacy_led_args legacy_args = {
> -		.colors = priv->colors[location],
> -		.brightness = priv->global_brightness,
> -		.state = 0,
> -	};
> -	struct acpi_buffer input;
> -	acpi_status status;
> -
> -	if (legacy_args.state != LEGACY_RUNNING) {
> -		legacy_args.state = priv->lighting_control_state;
> -
> -		input.length = sizeof(legacy_args);
> -		input.pointer = &legacy_args;
> -
> -		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> -					     location + 1, &input, NULL);
> -		if (ACPI_FAILURE(status))
> -			return -EIO;
> -
> -		return 0;
> -	}
> -
> -	return alienware_wmi_command(wdev, location + 1, &legacy_args,
> -				     sizeof(legacy_args), NULL);
> -}
> -
> -static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
> -					struct wmi_device *wdev, u8 brightness)
> -{
> -	return legacy_wmi_update_led(priv, wdev, 0);
> -}
> -
> -static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
> -{
> -	struct alienfx_platdata pdata = {
> -		.wdev = wdev,
> -		.ops = {
> -			.upd_led = legacy_wmi_update_led,
> -			.upd_brightness = legacy_wmi_update_brightness,
> -		},
> -	};
> -
> -	return alienware_alienfx_setup(&pdata);
> -}
> -
> -static void legacy_wmi_remove(struct wmi_device *wdev)
> -{
> -	alienware_alienfx_exit(wdev);
> -}
> -
> -static struct wmi_device_id alienware_legacy_device_id_table[] = {
> -	{ LEGACY_CONTROL_GUID, NULL },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> -
> -static struct wmi_driver alienware_legacy_wmi_driver = {
> -	.driver = {
> -		.name = "alienware-wmi-alienfx",
> -		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -	},
> -	.id_table = alienware_legacy_device_id_table,
> -	.probe = legacy_wmi_probe,
> -	.remove = legacy_wmi_remove,
> -};
> -
> -int __init alienware_legacy_wmi_init(void)
> -{
> -	return wmi_driver_register(&alienware_legacy_wmi_driver);
> -}
> -
> -void __exit alienware_legacy_wmi_exit(void)
> -{
> -	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> -}
> -
> -/*
> - * WMAX WMI driver
> - */
> -static int wmax_wmi_update_led(struct alienfx_priv *priv,
> -			       struct wmi_device *wdev, u8 location)
> -{
> -	struct wmax_led_args in_args = {
> -		.led_mask = 1 << location,
> -		.colors = priv->colors[location],
> -		.state = priv->lighting_control_state,
> -	};
> -
> -	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
> -				     sizeof(in_args), NULL);
> -}
> -
> -static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> -				      struct wmi_device *wdev, u8 brightness)
> -{
> -	struct wmax_brightness_args in_args = {
> -		.led_mask = 0xFF,
> -		.percentage = brightness,
> -	};
> -
> -	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> -				     sizeof(in_args), NULL);
> -}
> -
> -static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> -{
> -	struct alienfx_platdata pdata = {
> -		.wdev = wdev,
> -		.ops = {
> -			.upd_led = wmax_wmi_update_led,
> -			.upd_brightness = wmax_wmi_update_brightness,
> -		},
> -	};
> -	struct platform_device *pdev;
> -	int ret;
> -
> -	if (awcc) {
> -		return alienware_awcc_setup(wdev);
> -	} else {
> -		ret = alienware_alienfx_setup(&pdata);
> -		if (ret < 0)
> -			return ret;
> -
> -		pdev = dev_get_drvdata(&wdev->dev);
> -
> -		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
> -		if (ret < 0)
> -			alienware_alienfx_exit(wdev);
> -
> -		return ret;
> -	}
> -}
> -
> -static void wmax_wmi_remove(struct wmi_device *wdev)
> -{
> -	struct platform_device *pdev;
> -
> -	if (!awcc) {
> -		pdev = dev_get_drvdata(&wdev->dev);
> -
> -		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
> -		alienware_alienfx_exit(wdev);
> -	}
> -}
> -
> -static struct wmi_device_id alienware_wmax_device_id_table[] = {
> -	{ WMAX_CONTROL_GUID, NULL },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> -
> -static struct wmi_driver alienware_wmax_wmi_driver = {
> -	.driver = {
> -		.name = "alienware-wmi-wmax",
> -		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -	},
> -	.id_table = alienware_wmax_device_id_table,
> -	.probe = wmax_wmi_probe,
> -	.remove = wmax_wmi_remove,
> -};
> -
> -int __init alienware_wmax_wmi_init(void)
> -{
> -	const struct dmi_system_id *id;
> -
> -	id = dmi_first_match(awcc_dmi_table);
> -	if (id)
> -		awcc = id->driver_data;
> -
> -	if (force_platform_profile)
> -		awcc = &generic_quirks;
> -
> -	if (force_gmode) {
> -		if (awcc)
> -			awcc->gmode = true;
> -		else
> -			pr_warn("force_gmode requires platform profile support\n");
> -	}
> -
> -	return wmi_driver_register(&alienware_wmax_wmi_driver);
> -}
> -
> -void __exit alienware_wmax_wmi_exit(void)
> -{
> -	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> -}
> -
>   static int __init alienware_wmi_init(void)
>   {
>   	int ret;
> diff --git a/drivers/platform/x86/dell/alienware-wmi-legacy.c b/drivers/platform/x86/dell/alienware-wmi-legacy.c
> new file mode 100644
> index 000000000000..45ff6b6518e5
> --- /dev/null
> +++ b/drivers/platform/x86/dell/alienware-wmi-legacy.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Alienware LEGACY WMI device driver
> + *
> + * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#include <linux/wmi.h>
> +#include "alienware-wmi.h"
> +
> +struct legacy_led_args {
> +	struct color_platform colors;
> +	u8 brightness;
> +	u8 state;
> +} __packed;
> +
> +
> +/*
> + * Legacy WMI driver
> + */
> +static int legacy_wmi_update_led(struct alienfx_priv *priv,
> +				 struct wmi_device *wdev, u8 location)
> +{
> +	struct legacy_led_args legacy_args = {
> +		.colors = priv->colors[location],
> +		.brightness = priv->global_brightness,
> +		.state = 0,
> +	};
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	if (legacy_args.state != LEGACY_RUNNING) {
> +		legacy_args.state = priv->lighting_control_state;
> +
> +		input.length = sizeof(legacy_args);
> +		input.pointer = &legacy_args;
> +
> +		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> +					     location + 1, &input, NULL);
> +		if (ACPI_FAILURE(status))
> +			return -EIO;
> +
> +		return 0;
> +	}
> +
> +	return alienware_wmi_command(wdev, location + 1, &legacy_args,
> +				     sizeof(legacy_args), NULL);
> +}
> +
> +static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
> +					struct wmi_device *wdev, u8 brightness)
> +{
> +	return legacy_wmi_update_led(priv, wdev, 0);
> +}
> +
> +static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct alienfx_platdata pdata = {
> +		.wdev = wdev,
> +		.ops = {
> +			.upd_led = legacy_wmi_update_led,
> +			.upd_brightness = legacy_wmi_update_brightness,
> +		},
> +	};
> +
> +	return alienware_alienfx_setup(&pdata);
> +}
> +
> +static void legacy_wmi_remove(struct wmi_device *wdev)
> +{
> +	alienware_alienfx_exit(wdev);
> +}
> +
> +static struct wmi_device_id alienware_legacy_device_id_table[] = {
> +	{ LEGACY_CONTROL_GUID, NULL },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> +
> +static struct wmi_driver alienware_legacy_wmi_driver = {
> +	.driver = {
> +		.name = "alienware-wmi-alienfx",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = alienware_legacy_device_id_table,
> +	.probe = legacy_wmi_probe,
> +	.remove = legacy_wmi_remove,
> +};
> +
> +int __init alienware_legacy_wmi_init(void)
> +{
> +	return wmi_driver_register(&alienware_legacy_wmi_driver);
> +}
> +
> +void __exit alienware_legacy_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> +}
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> new file mode 100644
> index 000000000000..9b65e401b454
> --- /dev/null
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -0,0 +1,767 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Alienware WMAX WMI device driver
> + *
> + * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
> + * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/dmi.h>
> +#include <linux/moduleparam.h>
> +#include <linux/platform_profile.h>
> +#include <linux/wmi.h>
> +#include "alienware-wmi.h"
> +
> +#define WMAX_METHOD_HDMI_SOURCE			0x1
> +#define WMAX_METHOD_HDMI_STATUS			0x2
> +#define WMAX_METHOD_HDMI_CABLE			0x5
> +#define WMAX_METHOD_AMPLIFIER_CABLE		0x6
> +#define WMAX_METHOD_DEEP_SLEEP_CONTROL		0x0B
> +#define WMAX_METHOD_DEEP_SLEEP_STATUS		0x0C
> +#define WMAX_METHOD_BRIGHTNESS			0x3
> +#define WMAX_METHOD_ZONE_CONTROL		0x4
> +#define WMAX_METHOD_THERMAL_INFORMATION		0x14
> +#define WMAX_METHOD_THERMAL_CONTROL		0x15
> +#define WMAX_METHOD_GAME_SHIFT_STATUS		0x25
> +
> +#define WMAX_THERMAL_MODE_GMODE			0xAB
> +
> +#define WMAX_FAILURE_CODE			0xFFFFFFFF
> +#define WMAX_THERMAL_TABLE_MASK			GENMASK(7, 4)
> +#define WMAX_THERMAL_MODE_MASK			GENMASK(3, 0)
> +#define WMAX_SENSOR_ID_MASK			BIT(8)
> +
> +static bool force_platform_profile;
> +module_param_unsafe(force_platform_profile, bool, 0);
> +MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
> +
> +static bool force_gmode;
> +module_param_unsafe(force_gmode, bool, 0);
> +MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
> +
> +struct awcc_quirks {
> +	bool gmode;
> +};
> +
> +static struct awcc_quirks g_series_quirks = {
> +	.gmode = true,
> +};
> +
> +static struct awcc_quirks generic_quirks = {
> +	.gmode = false,
> +};
> +
> +static const struct dmi_system_id awcc_dmi_table[] __initconst = {
> +	{
> +		.ident = "Alienware m17 R5",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> +		},
> +		.driver_data = &generic_quirks,
> +	},
> +	{
> +		.ident = "Alienware m18 R2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> +		},
> +		.driver_data = &generic_quirks,
> +	},
> +	{
> +		.ident = "Alienware x15 R1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> +		},
> +		.driver_data = &generic_quirks,
> +	},
> +	{
> +		.ident = "Alienware x17 R2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> +		},
> +		.driver_data = &generic_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G15 5510",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G15 5511",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G15 5515",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G3 3500",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G3 3590",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G5 5500",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +};
> +
> +enum WMAX_THERMAL_INFORMATION_OPERATIONS {
> +	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
> +	WMAX_OPERATION_LIST_IDS			= 0x03,
> +	WMAX_OPERATION_CURRENT_PROFILE		= 0x0B,
> +};
> +
> +enum WMAX_THERMAL_CONTROL_OPERATIONS {
> +	WMAX_OPERATION_ACTIVATE_PROFILE		= 0x01,
> +};
> +
> +enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
> +	WMAX_OPERATION_TOGGLE_GAME_SHIFT	= 0x01,
> +	WMAX_OPERATION_GET_GAME_SHIFT_STATUS	= 0x02,
> +};
> +
> +enum WMAX_THERMAL_TABLES {
> +	WMAX_THERMAL_TABLE_BASIC		= 0x90,
> +	WMAX_THERMAL_TABLE_USTT			= 0xA0,
> +};
> +
> +enum wmax_thermal_mode {
> +	THERMAL_MODE_USTT_BALANCED,
> +	THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
> +	THERMAL_MODE_USTT_COOL,
> +	THERMAL_MODE_USTT_QUIET,
> +	THERMAL_MODE_USTT_PERFORMANCE,
> +	THERMAL_MODE_USTT_LOW_POWER,
> +	THERMAL_MODE_BASIC_QUIET,
> +	THERMAL_MODE_BASIC_BALANCED,
> +	THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
> +	THERMAL_MODE_BASIC_PERFORMANCE,
> +	THERMAL_MODE_LAST,
> +};
> +
> +struct wmax_led_args {
> +	u32 led_mask;
> +	struct color_platform colors;
> +	u8 state;
> +} __packed;
> +
> +struct wmax_brightness_args {
> +	u32 led_mask;
> +	u32 percentage;
> +};
> +
> +struct wmax_basic_args {
> +	u8 arg;
> +};
> +
> +struct wmax_u32_args {
> +	u8 operation;
> +	u8 arg1;
> +	u8 arg2;
> +	u8 arg3;
> +};
> +
> +struct awcc_priv {
> +	struct wmi_device *wdev;
> +	struct platform_profile_handler pp_handler;
> +	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> +};
> +
> +static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_MODE_LAST] = {
> +	[THERMAL_MODE_USTT_BALANCED]			= PLATFORM_PROFILE_BALANCED,
> +	[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +	[THERMAL_MODE_USTT_COOL]			= PLATFORM_PROFILE_COOL,
> +	[THERMAL_MODE_USTT_QUIET]			= PLATFORM_PROFILE_QUIET,
> +	[THERMAL_MODE_USTT_PERFORMANCE]			= PLATFORM_PROFILE_PERFORMANCE,
> +	[THERMAL_MODE_USTT_LOW_POWER]			= PLATFORM_PROFILE_LOW_POWER,
> +	[THERMAL_MODE_BASIC_QUIET]			= PLATFORM_PROFILE_QUIET,
> +	[THERMAL_MODE_BASIC_BALANCED]			= PLATFORM_PROFILE_BALANCED,
> +	[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
> +};
> +
> +struct awcc_quirks *awcc;
> +
> +/*
> + *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
> + *	It can toggle between standard system GPU output and HDMI input.
> + */
> +static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
> +			  char *buf)
> +{
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> +	struct wmax_basic_args in_args = {
> +		.arg = 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
> +		if (out_data == 0)
> +			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> +		else if (out_data == 1)
> +			return sysfs_emit(buf, "unconnected [connected] unknown\n");
> +	}
> +
> +	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
> +	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> +}
> +
> +static ssize_t source_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> +	struct wmax_basic_args in_args = {
> +		.arg = 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
> +		if (out_data == 1)
> +			return sysfs_emit(buf, "[input] gpu unknown\n");
> +		else if (out_data == 2)
> +			return sysfs_emit(buf, "input [gpu] unknown\n");
> +	}
> +
> +	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
> +	return sysfs_emit(buf, "input gpu [unknown]\n");
> +}
> +
> +static ssize_t source_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> +	struct wmax_basic_args args;
> +	int ret;
> +
> +	if (strcmp(buf, "gpu\n") == 0)
> +		args.arg = 1;
> +	else if (strcmp(buf, "input\n") == 0)
> +		args.arg = 2;
> +	else
> +		args.arg = 3;
> +	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
> +				    sizeof(args), NULL);
> +
> +	if (ret < 0)
> +		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RO(cable);
> +static DEVICE_ATTR_RW(source);
> +
> +static bool hdmi_group_visible(struct kobject *kobj)
> +{
> +	return alienfx->hdmi_mux;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
> +
> +static struct attribute *hdmi_attrs[] = {
> +	&dev_attr_cable.attr,
> +	&dev_attr_source.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group hdmi_attribute_group = {
> +	.name = "hdmi",
> +	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
> +	.attrs = hdmi_attrs,
> +};
> +
> +/*
> + * Alienware GFX amplifier support
> + * - Currently supports reading cable status
> + * - Leaving expansion room to possibly support dock/undock events later
> + */
> +static ssize_t status_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> +	struct wmax_basic_args in_args = {
> +		.arg = 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
> +		if (out_data == 0)
> +			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> +		else if (out_data == 1)
> +			return sysfs_emit(buf, "unconnected [connected] unknown\n");
> +	}
> +
> +	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
> +	return sysfs_emit(buf, "unconnected connected [unknown]\n");
> +}
> +
> +static DEVICE_ATTR_RO(status);
> +
> +static bool amplifier_group_visible(struct kobject *kobj)
> +{
> +	return alienfx->amplifier;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
> +
> +static struct attribute *amplifier_attrs[] = {
> +	&dev_attr_status.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group amplifier_attribute_group = {
> +	.name = "amplifier",
> +	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
> +	.attrs = amplifier_attrs,
> +};
> +
> +/*
> + * Deep Sleep Control support
> + * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
> + */
> +static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> +	struct wmax_basic_args in_args = {
> +		.arg = 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
> +		if (out_data == 0)
> +			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
> +		else if (out_data == 1)
> +			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
> +		else if (out_data == 2)
> +			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
> +	}
> +
> +	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
> +	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
> +}
> +
> +static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> +	struct wmax_basic_args args;
> +	int ret;
> +
> +	if (strcmp(buf, "disabled\n") == 0)
> +		args.arg = 0;
> +	else if (strcmp(buf, "s5\n") == 0)
> +		args.arg = 1;
> +	else
> +		args.arg = 2;
> +	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
> +				    &args, sizeof(args), NULL);
> +
> +	if (!ret)
> +		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(deepsleep);
> +
> +static bool deepsleep_group_visible(struct kobject *kobj)
> +{
> +	return alienfx->deepslp;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
> +
> +static struct attribute *deepsleep_attrs[] = {
> +	&dev_attr_deepsleep.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group deepsleep_attribute_group = {
> +	.name = "deepsleep",
> +	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
> +	.attrs = deepsleep_attrs,
> +};
> +
> +static const struct attribute_group *wmax_alienfx_groups[] = {
> +	&hdmi_attribute_group,
> +	&amplifier_attribute_group,
> +	&deepsleep_attribute_group,
> +	NULL
> +};
> +
> +/*
> + * Thermal Profile control
> + *  - Provides thermal profile control through the Platform Profile API
> + */
> +static bool is_wmax_thermal_code(u32 code)
> +{
> +	if (code & WMAX_SENSOR_ID_MASK)
> +		return false;
> +
> +	if ((code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_LAST)
> +		return false;
> +
> +	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_BASIC &&
> +	    (code & WMAX_THERMAL_MODE_MASK) >= THERMAL_MODE_BASIC_QUIET)
> +		return true;
> +
> +	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
> +	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
> +		return true;
> +
> +	return false;
> +}
> +
> +static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
> +				    u8 arg, u32 *out_data)
> +{
> +	struct wmax_u32_args in_args = {
> +		.operation = operation,
> +		.arg1 = arg,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +	int ret;
> +
> +	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
> +				    &in_args, sizeof(in_args), out_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (*out_data == WMAX_FAILURE_CODE)
> +		return -EBADRQC;
> +
> +	return 0;
> +}
> +
> +static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
> +{
> +	struct wmax_u32_args in_args = {
> +		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
> +		.arg1 = profile,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> +				    &in_args, sizeof(in_args), &out_data);
> +	if (ret)
> +		return ret;
> +
> +	if (out_data == WMAX_FAILURE_CODE)
> +		return -EBADRQC;
> +
> +	return 0;
> +}
> +
> +static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
> +				  u32 *out_data)
> +{
> +	struct wmax_u32_args in_args = {
> +		.operation = operation,
> +		.arg1 = 0,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +	int ret;
> +
> +	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> +				    &in_args, sizeof(in_args), out_data);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (*out_data == WMAX_FAILURE_CODE)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int thermal_profile_get(struct platform_profile_handler *pprof,
> +			       enum platform_profile_option *profile)
> +{
> +	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
> +	u32 out_data;
> +	int ret;
> +
> +	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
> +				       0, &out_data);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (out_data == WMAX_THERMAL_MODE_GMODE) {
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		return 0;
> +	}
> +
> +	if (!is_wmax_thermal_code(out_data))
> +		return -ENODATA;
> +
> +	out_data &= WMAX_THERMAL_MODE_MASK;
> +	*profile = wmax_mode_to_platform_profile[out_data];
> +
> +	return 0;
> +}
> +
> +static int thermal_profile_set(struct platform_profile_handler *pprof,
> +			       enum platform_profile_option profile)
> +{
> +	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
> +
> +	if (awcc->gmode) {
> +		u32 gmode_status;
> +		int ret;
> +
> +		ret = wmax_game_shift_status(priv->wdev,
> +					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
> +					     &gmode_status);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
> +		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
> +			ret = wmax_game_shift_status(priv->wdev,
> +						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
> +						     &gmode_status);
> +
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	return wmax_thermal_control(priv->wdev,
> +				    priv->supported_thermal_profiles[profile]);
> +}
> +
> +static int create_thermal_profile(struct wmi_device *wdev)
> +{
> +	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
> +	enum platform_profile_option profile;
> +	enum wmax_thermal_mode mode;
> +	u8 sys_desc[4];
> +	u32 first_mode;
> +	u32 out_data;
> +	int ret;
> +
> +	ret = wmax_thermal_information(wdev, WMAX_OPERATION_SYS_DESCRIPTION,
> +				       0, (u32 *) &sys_desc);
> +	if (ret < 0)
> +		return ret;
> +
> +	first_mode = sys_desc[0] + sys_desc[1];
> +
> +	for (u32 i = 0; i < sys_desc[3]; i++) {
> +		ret = wmax_thermal_information(wdev, WMAX_OPERATION_LIST_IDS,
> +					       i + first_mode, &out_data);
> +
> +		if (ret == -EIO)
> +			return ret;
> +
> +		if (ret == -EBADRQC)
> +			break;
> +
> +		if (!is_wmax_thermal_code(out_data))
> +			continue;
> +
> +		mode = out_data & WMAX_THERMAL_MODE_MASK;
> +		profile = wmax_mode_to_platform_profile[mode];
> +		priv->supported_thermal_profiles[profile] = out_data;
> +
> +		set_bit(profile, priv->pp_handler.choices);
> +	}
> +
> +	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
> +		return -ENODEV;
> +
> +	if (awcc->gmode) {
> +		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
> +			WMAX_THERMAL_MODE_GMODE;
> +
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
> +	}
> +
> +	priv->pp_handler.profile_get = thermal_profile_get;
> +	priv->pp_handler.profile_set = thermal_profile_set;
> +	priv->pp_handler.name = "alienware-wmi";
> +	priv->pp_handler.dev = &wdev->dev;
> +
> +	return devm_platform_profile_register(&priv->pp_handler);
> +}
> +
> +static int alienware_awcc_setup(struct wmi_device *wdev)
> +{
> +	struct awcc_priv *priv;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +	priv->wdev = wdev;
> +
> +	return create_thermal_profile(wdev);
> +}
> +
> +/*
> + * WMAX WMI driver
> + */
> +static int wmax_wmi_update_led(struct alienfx_priv *priv,
> +			       struct wmi_device *wdev, u8 location)
> +{
> +	struct wmax_led_args in_args = {
> +		.led_mask = 1 << location,
> +		.colors = priv->colors[location],
> +		.state = priv->lighting_control_state,
> +	};
> +
> +	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
> +				     sizeof(in_args), NULL);
> +}
> +
> +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> +				      struct wmi_device *wdev, u8 brightness)
> +{
> +	struct wmax_brightness_args in_args = {
> +		.led_mask = 0xFF,
> +		.percentage = brightness,
> +	};
> +
> +	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> +				     sizeof(in_args), NULL);
> +}
> +
> +static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct alienfx_platdata pdata = {
> +		.wdev = wdev,
> +		.ops = {
> +			.upd_led = wmax_wmi_update_led,
> +			.upd_brightness = wmax_wmi_update_brightness,
> +		},
> +	};
> +	struct platform_device *pdev;
> +	int ret = 0;
> +
> +	if (awcc) {
> +		return alienware_awcc_setup(wdev);
> +	} else {
> +		ret = alienware_alienfx_setup(&pdata);
> +		if (ret < 0)
> +			return ret;
> +
> +		pdev = dev_get_drvdata(&wdev->dev);
> +
> +		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
> +		if (ret < 0)
> +			alienware_alienfx_exit(wdev);
> +
> +		return ret;
> +	}
> +}
> +
> +static void wmax_wmi_remove(struct wmi_device *wdev)
> +{
> +	struct platform_device *pdev;
> +
> +	if (!awcc) {
> +		pdev = dev_get_drvdata(&wdev->dev);
> +
> +		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
> +		alienware_alienfx_exit(wdev);
> +	}
> +}
> +
> +static struct wmi_device_id alienware_wmax_device_id_table[] = {
> +	{ WMAX_CONTROL_GUID, NULL },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> +
> +static struct wmi_driver alienware_wmax_wmi_driver = {
> +	.driver = {
> +		.name = "alienware-wmi-wmax",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = alienware_wmax_device_id_table,
> +	.probe = wmax_wmi_probe,
> +	.remove = wmax_wmi_remove,
> +};
> +
> +int __init alienware_wmax_wmi_init(void)
> +{
> +	const struct dmi_system_id *id;
> +
> +	id = dmi_first_match(awcc_dmi_table);
> +	if (id)
> +		awcc = id->driver_data;
> +
> +	if (force_platform_profile)
> +		awcc = &generic_quirks;
> +
> +	if (force_gmode) {
> +		if (awcc)
> +			awcc->gmode = true;
> +		else
> +			pr_warn("force_gmode requires platform profile support\n");
> +	}
> +
> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> +}
> +
> +void __exit alienware_wmax_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> +}
> diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
> index 427203821967..e4b75b1acd10 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.h
> +++ b/drivers/platform/x86/dell/alienware-wmi.h
> @@ -48,7 +48,6 @@ struct color_platform {
>   
>   struct alienfx_priv {
>   	struct platform_device *pdev;
> -	struct alienfx_quirks *quirks;
>   	struct led_classdev global_led;
>   	struct color_platform colors[4];
>   	u8 global_brightness;

