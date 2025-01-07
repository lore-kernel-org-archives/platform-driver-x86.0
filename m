Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0091F8931;
	Tue,  7 Jan 2025 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285416; cv=fail; b=AULIx1s3jXnrQnz9NrHySBJbJOOTR9LaTTx29TdUEk04axZVmy6QPrxpPl0+4eiSQIy6nWyTNee7u6WVKHb+vDWw+tGgW9BeRGfdksw4j9VtwUaF+z7rOtXNLdJllADBvDg0+AnMU0j0CnVQ0qbhI8r6uYK1yFDb9gb2WTvIe+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285416; c=relaxed/simple;
	bh=itNUcp7vPHEw5s6V5Rc2LbWVYgvOkMA3iLpnTCPI8pk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MhaaYr+LSWAMrgn6rMZrHPi8BfTrnmvQ8w8wEPTSx/EK/3mgeXXtg5h9SRBCktHslEFVkXiOyagQd/ian0B0fucJhvsP4U/+t5d6JekX3T4qn8riB/LUVKx58GIrubnuwjYUix1OjC0i1qlFSqX4gtY21Oxg6nrqWaA+2HEShBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DUjF+Vdp; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DUjF+Vdp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7mTaQoWWuChUvQ8S5m4bNq6DnUGR4jOLtxPgc1JoYFC+SwAytfhoU05NrsPhABROsPSeD59I4Rxqf+2ftnphwVIUwSgjQaFXcD2oEaoJEhiS4K0RbwdHDFI+x0DlzhJWT5rZHEgwB2PfQoZWb012ltZiI+rFkhWHXgKioXHvhJPF+anliTT/zdm3M7b1iZqOb7RYrgxkAQKpxmwMZDmI7riBHYihC/tHIAKVZ6FWZ0H3/K95QJXIu4KvXY5mpHXtu7m7w92h3BKVYfV10kQdB4PqwKMcayrui3+iogalEM5dfsNtpNBDzFu7H+9pvLmTrHuxnRkqVNExH/xUBfoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1N3/BVa+na1jzA0Dp503PyJH3PY8P1SMeoq1TcglFA=;
 b=T2N/Vc9NVU7MLMU8yxr1tQs3qfGbxqU+5dfOSmj1XC7GtNH1iRzg9vQO5uAbRTgHatwzLUZwSe/zH/xFooOVmSzzzRD9cJA2BKf252DUrSEAuYblL1ZeUtXjuYoxUt1ZLiF3koAP3/7UYhxwnXP/PW5ZsAsCRScREPrMb/0hcZvHeEv9/oiWihlstync0WmChGM9XzwFAnpu3ZbVLY+YmNruhC88ihWF7N6TEPes1Zi2qF4+HK/atJ3yx9tR9zv4umab+oaVQT0bsa8U0mmAsL151/99pvT+9XEba4XVrEy+yzjj3l+qLN1/WMh0ozX1CMfkf0nJa+vz1gR5Z7ERkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1N3/BVa+na1jzA0Dp503PyJH3PY8P1SMeoq1TcglFA=;
 b=DUjF+Vdpms68Ud8atd/3apFsYeJfm0qNeevXKbDwcFCiDT6VRXhXvkK0FVUtr/matL/lMw6THZ3bihkAlA7vh/8ulIXDS/DX3WoGk85NzNFpj1XV9RdsBSi5KmCtbboldWU8Q4Dcc0Ev9+gMIyNKMSlgbxpO/11St3K0yld82h0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:30:07 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:07 +0000
Message-ID: <4ac2d62e-f452-4fcc-9f76-363f70a21f9a@amd.com>
Date: Tue, 7 Jan 2025 15:30:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/20] platform/x86: alienware-wmi: Update header and
 module information
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-22-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-22-kuurtb@gmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9549971c-9eab-4222-01a1-08dd2f6274c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXdSQjRKVTNKcEQyM01MQ2dwd3lkTSsxYVhjOFhOMzY3aFFIbW9ja25oTkth?=
 =?utf-8?B?MGV1Q0FPcEk0Rzk4WnB3YWt1bVhnbVlwOEM0NzF0cndpSnIvZllpeDJYdlZL?=
 =?utf-8?B?azNYTzJvczluSzdaQmxWcUQ5bitpOHdLWGsvYkhtalAwK0dXcVhGVXNWVXhH?=
 =?utf-8?B?OENzeUk5d005ZDQ0amdMVURPd1AzZmtWcEp1V3oxVGFLbHdNRllqWlpUWTly?=
 =?utf-8?B?UzI3VVNzODl0cE1wTnEzYU9UdmFhREtCRVI2bkMwYWgxcXorWFR4MVFUUVU4?=
 =?utf-8?B?Z0Ewc0dPbnhOMmR6elBSVXU4VGxnMW5Kdmh6V2Ywdk5lVnJiME94alJ4L1Mv?=
 =?utf-8?B?bTdoUy8wU1J3WklaY0JtWmJsTjU3TVpWQUduRUYwYmFmUVBoMUgwTjBoaCtD?=
 =?utf-8?B?dW9JNnFXaUZGOEo5UlBtcnk5c2Q5N1oyTGgwOUFJY0IxUlRUT2dxLzhwWnVE?=
 =?utf-8?B?S0ZYVk9tN0tFN3liSlBjZWJlNWFSZW8xQVhiT1dyVDZjdlhzWHdjalg1WnlH?=
 =?utf-8?B?RmZNZXVMTWY3MHI1c2pDUEdGWmFkM2ZGYVZJR3ZMMzNmb01yWWVRR3gzVjAx?=
 =?utf-8?B?dmNNRjQ4VjJKTGNicXlFVCszaUVObURpY3FQMGdCYTlKbG9hYTVOVFM4MlhM?=
 =?utf-8?B?eDU0TjYxR2NHcW9ZdUVSZTg1UjdiM0lWejd3czhublFENEtHWFg5SzN0ZUtK?=
 =?utf-8?B?VXZ0VElPMUNkQXRsclVyWDN2STlTZ3pSZUxlUWJZVytlL2JlemlZSG0rNDlC?=
 =?utf-8?B?ZDUvODl5YjE0YU9kOFZ0aXI2empTUnBsZ3FJbVk5VGJ2YmRrZnVGZllrVWRH?=
 =?utf-8?B?WVkrNWtYcmNKbVpUN2FlbmxSeTAzN3pMVERscUk0eHQzUWJHaEpoSmUyWDNM?=
 =?utf-8?B?Mjd1MEdsK255Y3ZYbTZHVHdLTkFieUFLVjZ4THRNMU9YRzdsT0NGTkRWaDBK?=
 =?utf-8?B?b0xmam5rUmoxNW5Lc1BCWmNuNWhueEZJLy83TFZ5TGtFUW1QaElqNTMveGRQ?=
 =?utf-8?B?VjZrTCtGdFNTenpNNTNHNlBVOXIrZzU0cHY4YjZJNXk1Y1BKam1VUmQ4MVox?=
 =?utf-8?B?VWZMTjRlNmJrNkZJSEkzVEpQSkJjOXNUbytaRVBPWFZFL0VadnE3NHdQbm53?=
 =?utf-8?B?WlJyc3J3aEF0aVlPSVF6QVBZeThoNHlKU1U3dnBCKzBLRVZWeG1WTHdMRmFX?=
 =?utf-8?B?cVNRd0l6VGVtWDJmaUdVMFNsRjFOb0RESUQ3dEMzdmRoQWNDUnJyMFJGUjZF?=
 =?utf-8?B?OXYydFFUYWEyNEtuMnRzdThlZnNubHVRRmhOUUZMQ2FFWUNFV0xuN3c5dWpE?=
 =?utf-8?B?UGxBZ3N2MWZpS09QOUNEdHh1Vk5QcUIwZlBScU5FNmxrWVBOdHlOTkJGT0Fr?=
 =?utf-8?B?cHkzTWJBcmp0UXhJVjBzYkdqQXlTNjUvc0xmVlpxRDkxMWdKNFJXQmt0SjJk?=
 =?utf-8?B?VmZFY2JUS2VnWTYzVXdURytqVUpBSXBRcFNHejNLNDRNeHJQNXZxOHgxOStm?=
 =?utf-8?B?bE5UWG9kbzNVSXNtY2s1bEdPMEFTMmM1WUNrSVV5aTBTOHk1cEJkblNwcHJJ?=
 =?utf-8?B?bVNVZDUvN1M4cS8vQ3RiSE1qQjk4djFTV2Q2Y3RuYjQyQ2tRdHdpNUlKWk44?=
 =?utf-8?B?UUZWY2JZeUhlMEpsSUpDcGF4bFEwZ3NsYWU1MnFsSGc1cFF4cTZjejY2d3By?=
 =?utf-8?B?VEc4QXV6cUJNMEU5ZXY0cjFYRzA5V0I2T0hUSjY4VHRBb0EyeFp0VDczamM0?=
 =?utf-8?B?UENmbTZRWWtJMXpleXZLc3lZWnY5NFRoQStQUUFjbWkzaHNWT1V5V2xaSkIz?=
 =?utf-8?B?d1BqWWdwUUk3QmxZeXd5d3JRL1RhdDJNV1kvTUlDK1d1bDVhZkd1bDcyM21z?=
 =?utf-8?Q?/I5SsHhxG3XR+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJFbDJMZjh3S1k2R255NC9PaWozYmdoWm44MmsvcnJBZ3dleGNIOXA0ak1p?=
 =?utf-8?B?WG1LY3V1M1l2eEoxVEZxMDNUZTNEb3pKM2xEbFRvTFFzVmMxTk5qTVVKWms4?=
 =?utf-8?B?dkVGQjhISlhFNkk3cHdFczhTMDY1MjdGZGRWL3RONXg3dktUVG9aeUlYK3M1?=
 =?utf-8?B?cDVHWE5EdzFsdzROaHFPYjFlYjhpQ3VNOXFHbzd5RFhPc3Npc0Q4NE9lLzkv?=
 =?utf-8?B?Z1JWT1FNR0JyRzNndWI2YURYZjl5WVd0d1VtUG4rR2s0eitWcmxXU0MyWmtQ?=
 =?utf-8?B?b3hTU0RSbnNCSlBqTnhyazhNSEJ4QnNEdnRJT3c3ZjNQdHN4czh1WXQ3THJ4?=
 =?utf-8?B?MWhkV09ERVVrNXR0bWNiaW9ueFNVZTloWmh1Mk8wODQ0eVVKWUo4VGxMbVUv?=
 =?utf-8?B?VnB4VVBsT09xRSt3QmJqWko1WUtqb1BwMmp2RmVXYXdQYUVPUmJlQXU3YjRz?=
 =?utf-8?B?UXEybjNRV2JCQlJjUG5EcmFLbzlJNEZieUp1NlFRRWtiV2loS2p4WmErNVY3?=
 =?utf-8?B?Z1dSSWQxcFJ3S3pGYWJsdHhEaFhqOG9QMFVhYzhMNnUwaWIrWDZXTno3eWR1?=
 =?utf-8?B?YTM5cGdwOGVYWCsyRU13VG1GcThUYzVMMWk3eHEwczRXYXJXNVhVdlp3a04r?=
 =?utf-8?B?RUJJQzkwNDdaU2dWcjJtUUs1bFFjWVFpdGZUUGt6akpVSEh1R1o3MEsyTnJl?=
 =?utf-8?B?cmljTHc5eFVBbno3a1JheHBHL2EzdFNHSXhJQ0h3ZzdUTGZBMFhvdm5QcXF0?=
 =?utf-8?B?ZnRIT3ZhcnlFQ3FjVXlaWG8wNGhKSmk4dEJIbEg5ZUZLcXptRmppb0U2cEwz?=
 =?utf-8?B?VEw2a2ZNNzcxOXA0OWV5bjlCZEVJS3I0S0grVGhwOGdRMytEbHRTYW5GNkZ2?=
 =?utf-8?B?Ym0rQndjQjlrTC9UaWh6WmVDZ0V3MHBFMG5aankrUmNFNko4VThBaVNzMXR3?=
 =?utf-8?B?SVBqcVBXaFZTOTNxV1UrWkFINHphVmhxbEpaWVVLblVsb3pUYUpxcldjNzJW?=
 =?utf-8?B?MGFTQ24zWVkzUzhLZGpGMGxWT2dIb1kxVmVWL0piWHlOeGlZTENlMmtKYnZV?=
 =?utf-8?B?MjFnZS9zU3cvYmNHY3VpMDNMdW9xWVhGeUxLZUxHVDVOdEM0bmYwbkova0hr?=
 =?utf-8?B?T1c3RjlVZ0JjbENzSjBHZ1p0VkhkNFNrV3BnMzRGS2llTExydjYwcGRCY0g1?=
 =?utf-8?B?ZVRBejVrUjVhVUxHUjZ5MmpuU3F0bXFJcWVaY2pxMkFvUFJOdjVjZ1FwdWpJ?=
 =?utf-8?B?QWxZQTFOaEZ1SHc2Njl5cUwzU1lrZ0lyQ1J0OUoySnl1YTZnQXUrZW9tU3ZW?=
 =?utf-8?B?TjNOUTBIVUdqODhFQm5lbERYeTB6NTJ4Rk1SejF4VDk3V2p5WjRrdXVtK2hS?=
 =?utf-8?B?bzNXeGZ0TE1uOUhlT2YxaFFzcG9HMERJQ29jKytJM01Ta0R1M1E3K0lnSThi?=
 =?utf-8?B?ZjRqRTUzbmZtRFJGbEh6YTByaUFCK2ZTSGpCVVIwcFpIeWladkhmbkZKeGhr?=
 =?utf-8?B?ZlRLSm9rOGFPT2F5VVM5dWJWK01udGo1eks5RWp0VUtXcWluWUM4ZnBqOFp6?=
 =?utf-8?B?TzJ5TDR0Z1YwRmVPQnZobkE2bkxiU0VLYmhpRy9Mcnd3Vyt3U05XTC9EdWh0?=
 =?utf-8?B?SHJLaXJqbkRmcWdPNVNIZFQwNys0OVF3Mmo2K3VwMDhRc0NmYWhFVFBueVV4?=
 =?utf-8?B?bXhWMVNvb2xyRlpkQkVsbnNKTkExSXdORGxmclZScC9uK09lSVcwYm9nSWQ2?=
 =?utf-8?B?ZEZlWlFscGtPNi83ZUtSY1B4ZS9nbERVWTlZOHovbGI3K0d5cTBBcGcwSC82?=
 =?utf-8?B?V2ZoUXlndXBreUlld1JNNWIwTWVLRnIvL1VCSUh5R085VjA5QXBkMkpQQlMy?=
 =?utf-8?B?SGd6OEJNY1AyUzZtQ3g3M1ZSVU5LM1c1QWwyd2JkZkVTT0E2VkVYT3lTQWNN?=
 =?utf-8?B?M3NFS0ZWc3cvOTYwWEFsUC8yKzQ3K010RVN1UmxzdFhzZ2QrMnVxeXFyTTJx?=
 =?utf-8?B?Z295enV4V3lIdGx0ZGJ6TzdIbnlPdjRzZytsbGN3bC9tWUJsRWxGT2RiejlY?=
 =?utf-8?B?Mm5WNHNtWmZYSDlJa3RsczJHeCtWYXc0ZURjSWZ0Qmx6TldMNjNkR1R1eG1l?=
 =?utf-8?Q?W5KqmH3+Yf/Y0IbOHyxzdChdJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9549971c-9eab-4222-01a1-08dd2f6274c8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:07.0319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/XK78dDqSd8ZAxaCvAjKlbZdYr9dpgZ3y+7EQnhCziXh9GCJYQ5twN6H565qHwN6ktZ+tgP2nt6Acxgw7rcQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Update module header and description. Additionally add myself as a module
> author.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
> index 78101952094c..c98c65341233 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -1,8 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - * Alienware AlienFX control
> + * Alienware special feature control
>    *
>    * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
> + * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
>    */
>   
>   #include <linux/acpi.h>
> @@ -13,6 +14,7 @@
>   #include "alienware-wmi.h"
>   
>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
>   MODULE_DESCRIPTION("Alienware special feature control");
>   MODULE_LICENSE("GPL");
>   

