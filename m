Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139A1A5BA2
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523499; cv=fail; b=qB6bePoIHnGeT3yYDM21LeklmLZgFzlW6Nu9tG8K+rQsm9vggvfF1MBMrYlr+K2/oqVT3VlpD8qi070EKaGnNjumQ43m1sfHpwcntRLLsuKB4FmaVBHtMx84wyvszBJRmES2xMOGyNJFfbA16/ViNiEGEvuxDjyKwRgOno6MZ48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523499; c=relaxed/simple;
	bh=JmmtdX69i0Z8ebjT7BWwpBsJ0j4TuuMps/kXgrdQ3gs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S++TLktjrZDHzJuD81Kf0AiOjIJceGERukLjfXEJyWBQuIW+ytPpNHQ2LlXjroNEFJkH6auyAs63IO3vuZSXgnx4Jk8Q11CNG98bjLj4BH8CZPFfyCMv1vwtJor9v1teTh+4U8ViiCY6j/BNHop1ZRL9XlmloRqmRllKsvobryM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dDO5AZO7; arc=fail smtp.client-ip=52.101.85.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dDO5AZO7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Saisa6T44x+rvsfX9hk71RDmA7CPTfnEmn2lnNjCYK4Akgm3vBXFPuxW3aT7qRiz4cWgeurg+vcmTGcpQBLBTqnBC9kItNSym2RjDEO9p2f6hfR3e1jAqWYLA5bFSdscVLvOrEXrk4mle6QAzxa04ogsCjSLqSbvuWV101hKUmiAk0qgwfwOtz8p/6j2hK33KZl2VnLhuiFMCKth6jqtrp8RgeTZuVz9tmAeXyCp/dADW/s1GWcGQHLHAsWJbVc7mAJIuRmxbAwtc/MjJ75Au+qA+nhtXEfrqBphF/pkGGSSXsnhAcQthFdzND7tVCJ/TWwdMFUcC3I+6aUXjLaZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhHGSyAHGfqmZemeYGsFUTiTmp/0QO8T5OpWikroOi4=;
 b=S664oL+AsNALT23Oe8ebh/fGgt/LecnSiENgKl+uOaEbHz8EW/DXEx4B4KD1Ml+wse2ufXvfGmhwkOZ+w8WgqdlWGPKkygIurkoXIEZQM12Bhpfx5r/IpFxApa6uUt/wOi81IA1pUKTWlM2SMtK0Zh7V6Q2o4myFNFgwJms8D2iw5l7jAT+93lBGwvFIEkVtMjOKxT7+J5kHvt3Ku/Vo8Y9UVMAg5lLu4zbpEa3itFKsL6fMG8sJL4DLAmS7mm5+xDrQ82FSGzOZ/2oC8pG2gyocyHxeRLLvaSump0T2J9NW0WBn1q+I+9DWsDUm3n9N3OzZ7w2DjmTQ/orgmdwIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhHGSyAHGfqmZemeYGsFUTiTmp/0QO8T5OpWikroOi4=;
 b=dDO5AZO7FQP/pDfNFkM4nzOcw0tR2d6hHm0MiiGoHJ0M7/OUA9OezBKtm3ucbWlkixmF0TiYDU7e8JnmxP5mePXnZWO9Bs1jbu+OL04icRTmPj/fx0W1UhbLgUX749vkTSrIxbfh4MJn+PBLr3WxAklbtfaRoOiaAiMXDhs3Od8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CYYPR12MB8940.namprd12.prod.outlook.com (2603:10b6:930:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Wed, 15 Oct
 2025 10:18:14 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 10:18:14 +0000
Message-ID: <71a514c8-1623-497d-91d8-f25b8476a750@amd.com>
Date: Wed, 15 Oct 2025 15:48:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Use ring buffer to store custom
 BIOS input values
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun.Shen@Dell.com
References: <20251014110141.1844925-1-Shyam-sundar.S-k@amd.com>
 <5c779186-d79f-4cb7-8d77-065498dbad6b@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <5c779186-d79f-4cb7-8d77-065498dbad6b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CYYPR12MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: b25f4c99-a8e7-423c-e6ab-08de0bd42676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHZnRWhWRTV1ZjZmZjBxdThBSUdQcGhpS1R0SXRCVkYrYjZSd2hzZWVJWndp?=
 =?utf-8?B?NEZhdUszNU9ueGNnYTNQMTVrdEVEcTFJb1hRNjhLblBjeW9OYmpiWldEZytp?=
 =?utf-8?B?cENLbU1vRWRid2JKdElRUmVtZ1NDNmc4TnYxUG5EeHkrWndyOGZMdy9seHZ2?=
 =?utf-8?B?aVZES29yR1MyMnRpa1IrM0hEYk54bWFNRE5ZdlVJVlpNNmhmZEF5L1YzQlB1?=
 =?utf-8?B?enJMNnl2Q3ZGWnRCb0JHVUxkbFZhRm1Bc0FxcTdvbVJiOFBUemgrSlhxMGdB?=
 =?utf-8?B?UDVKZVhTQ0FhUlFtdGdaZzlDanZNeG50QUVYa3pnaGJqcFJxY3V3Mk9peERM?=
 =?utf-8?B?UERMQVhFVWdWU1RzVE95dTF3dmFiK1VHVlJPaWFUMEhYbkpXNGUzOWdyMFIr?=
 =?utf-8?B?VWZZcFYwbFVac1FOa3luMzBRUVV0dFdoeXpZU2IrVldWN0R1eWVabnVsZGwy?=
 =?utf-8?B?UEFBYUI4NFo3dGppSDcreEh4a0c0Y2lUNktKcFRWckRUUzhjUmQ5aXJCd0VS?=
 =?utf-8?B?V0pEcC93d3pjRzRUOTBRdjNKMDdURVpWOWc2eHpnZkxSTGJ4VmpQQmhaVW8w?=
 =?utf-8?B?RmFCT2NoZXFWTmVLZU5UZE1IMzV5Q2dKSE90d1hlV25mYmNDK0VVUW52c1pZ?=
 =?utf-8?B?Qm9oSThDWUtFZm5nRlBrUzdKRUtHRGRTT29FWmNkSlcxS3ByOWx3a2xKMEdh?=
 =?utf-8?B?OVRXd3VXTExJdWZ5RHp4c0FIYzhaN1djUVk5MlZ0bU9DNkVyQ0lUMEhidTJU?=
 =?utf-8?B?bnBNWGtxNWE3TEVZd2cwVHM3dGpKcjhNVkVLZ0szdnRDOFh3Yy9OelE3aHBr?=
 =?utf-8?B?K2Q2MGRwSEJEWkl1WTJGKzVHMGtaSlI4K3hwZUdCTWR2bWgwNktFT0pRM0tq?=
 =?utf-8?B?VFVLc0pVdHlOUHkwUlBzY040WStNbmN2SFZ3Y1QzbzFOdGFmSVJnVXdscnlQ?=
 =?utf-8?B?L3dTUEtJc0dUM0YyUzZGb3g0eVJ2dFV5Zm5SaWc2WWoyK2hoa2IwS0tEdlo5?=
 =?utf-8?B?N1BOTnJReWlTZi9zZGZvQWZoT3dVVEJYTm5WZGNTSzJhdXRYQXlwejExTW5C?=
 =?utf-8?B?WUVKRW1ULytaZDByNEYrWlJDREF2ZlBkdUp3bWhOTlJWSGR3M0Vmd2QrcElZ?=
 =?utf-8?B?QjZYZ1dvZkZaOVVLdCt2VndSdGdueHZsb1lYc3lKRGI5eUttTEJ3eFlFTnJX?=
 =?utf-8?B?eFRQRTYxMDIrV2l2Z1J2R3RNUUgwZ2NsNUhyaWUrKzJodmNabjlxU0JKQnpt?=
 =?utf-8?B?YWk0NFNPVnd1UkxEU2FWMUtzams4UEc3MnpaMXNEZ0h3YjRDY05aRnZRckR6?=
 =?utf-8?B?bkhnYjN6MUFBbWs4eWtySis1TXlzR3k4eE9obEY5R3pmUUYvc2pDd3ZLeStX?=
 =?utf-8?B?Z0MwcWU4YW5uV0N5cHNYUzdzOXRWYm5JTmd1aDFscGNvK1g5U3JnZTZvYjI1?=
 =?utf-8?B?MUNnMlNnaFl4YytRUnlWOFQ5Vncya1lsZldKSXludGxxSUd3Zm0zVEpsVGMx?=
 =?utf-8?B?UDRJZFg1WVdNejkwK2k3eFdtUGQxeTlWRjJkSDBrNlZSYjI1YVViS3lPNUF2?=
 =?utf-8?B?SGpTU3hkTVgvUnZXTXo2MUY0RHlNcGo0Z3ZvRWpNWktJQzI3Z0FhbHBzUVdV?=
 =?utf-8?B?ZDZQdjYwcHY1VGg4VWdCZjVHV0J6aVV4OEEyc2Z5UlBuTVpXbnRPTWxNVVgx?=
 =?utf-8?B?OGR3WHhSU1Q0ZkdTZTV1R0tEamI0ZHpiVlUxMkRIWnpPL2xhZ0FHeTIvdEs4?=
 =?utf-8?B?eStvUmZPb20yOUt5NWhLNHJKdTFEUTJwQzkwalVxQWlsM21EcktjaTlaR0VN?=
 =?utf-8?B?d0VNVnR6TVF5UDgzL0VPTis4eUdDR3lpLy9sbGF5c24ybUhDM0NmbTBwcVZk?=
 =?utf-8?B?RmRPbTljQU9Od1ZBL3Q2NXFwZ0YvQ0VJZ05IOTB2R3d2WWw4OWRza0hEbElX?=
 =?utf-8?Q?Oa4WqUiVU5x+AECfRGZwMs81LFUF6rNp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWI0N1R0S2IybW5VNE5zYk1nUXRNOVVWekUyb2F4OGQwaWZyMWdGd1NFMC9O?=
 =?utf-8?B?M3p6M0praXFPV1paTXMya291ODAvWlRRR053TUI0L3JOOGcxclVac2hkc2sy?=
 =?utf-8?B?RC80SDBVSDB4RUh6TVNtNTJGZXdKRlVUb0xob0tUNDBFc2tYRE9GOXFCY3R4?=
 =?utf-8?B?MjZCQmowYVpJR2RnbW5jVGw2b0JHVTJpU21PWjJwRkpxVkg0dzdPNnU1WVpl?=
 =?utf-8?B?ek9zcFgxRm1aNUFQdnNiekQ5dWZzWDdhb2kySkxEaVNaeTI4Q28zYitER2Fs?=
 =?utf-8?B?cGRlN21ZNlArWm41NGYyeWZyN3NUK0YyeDFWdm9oOTM3OEtFV2hyUytkTkpa?=
 =?utf-8?B?RVhHSHN1b0x1NzUreDNma1dRR3p4SHZPSHZRMWJKMU1ISDFkb2lieDFWU2U3?=
 =?utf-8?B?YVFsbFUvU3dwdktJcnlZd1Y1Rk9veHdaOExGTGgxbGtvZUlDT1hhNlZpK01T?=
 =?utf-8?B?TGUyVnpKd1pvU1VDc2lXaEF5K2VQYUVFeFNQR2tvRmdkNEs2dkhtNDIrdm4v?=
 =?utf-8?B?SFJSSlFEOXVvTnpVYldTQnFka3l5MVJ0L2xKVGVxWk9RdmlMVDhuZmV1V2cz?=
 =?utf-8?B?STVZK0h0ZWlVVzRTU1FudmdMUlhWb0hQNXlzSEkzQ3hzZUdudUd2V3hKRHNH?=
 =?utf-8?B?UnpOY1NpNmJMaHlBTCs3ZlBkVitQVXR3Rk9Ucm9NZ0VWQWtXamkvd2dhNE1k?=
 =?utf-8?B?RFNIOU1pRTJxZEh4YlNJSVh4eXNnNXNESmRidk5HYmNXREJ6WjdTYThsNnZH?=
 =?utf-8?B?TzJmQkRpckkzR3RJbWx4YTR2U1FDVCttZ3dIRzVmN1lqTUFZOHhvR1FmaWVT?=
 =?utf-8?B?NlhHVyszTUlmNE1waVA0RW40R20veWpHN1Nyd0xTSWp0ZllaZWhkWEY4S0ZN?=
 =?utf-8?B?S0hoY1RUUVhWUzM4cWhZTERGRFVuMTlEQVg5QW9udXI5NE1adnIvbDZEUEJ1?=
 =?utf-8?B?MVFJMjVCTzdUbFVOSUdHSURPZmk0eG1qa0NPMDZwM253N0syc2lOV3NhcDgw?=
 =?utf-8?B?bUFiUzB6b2FESE80cGJQN2wzZXA3Vmk0aVBsYWo2S3RYRFRpNXY5aXh6RVRE?=
 =?utf-8?B?SWhHVTdZNElJeEdVdlpYa2hMRERxMVJXdzFWQXpKcXcvb29XekZuazVncXZk?=
 =?utf-8?B?cUN5WFZXejdSU1dpQmpxc3k3NldGZDlWdnFMbmR2ZzJZTUFKclVhMm80SkRP?=
 =?utf-8?B?TFd2VDVkYmxJR05tdXJJb2tTZzlUdWNEV0gwVk15S1RLSklGREdyODBzRGlu?=
 =?utf-8?B?dkNhNnlxZmc3VWtIVzVkK0N4dDA5amZ0VklWVnBDZGRCRmJuZUJJL3paaTNG?=
 =?utf-8?B?WGxSU2VURHZ3V2pqSGE4dUdrd3JLYWZPRFRTNlJkZHBKYVYzeUJHNjN4TGtp?=
 =?utf-8?B?ZEt3aktoV3JOQmlKZzlwb0YyYzRqN1pUMFhKS0p0YTlFYU5iWkVvcDkzZE1m?=
 =?utf-8?B?YUxVa3NZeHVqeDE2MzdCWHVSclJGcGh4a0Q0VUFqd1NrQlJIOUhLZmNzZ2Jn?=
 =?utf-8?B?dEFjalJIbUo2V3dob2R0cHZXMVAveWk3bWxjZjBSQzh2cEVxUUxabXJ6WW10?=
 =?utf-8?B?dHk3ZktjUUxIOXdnTzcyKzBRRXJDTk53YTRPZFFuNjFyelZEa0FOSnZ3bEdQ?=
 =?utf-8?B?QWpXRjBRanhheVpFRkpSUzg2WHJOVzlXOFZhUnpsZHNOOE93d3Y0TVJSMGY1?=
 =?utf-8?B?aW50dGNuRlIwZjBkVzM4SUNyeldGb0IvTnh0ZXZoeHQ0K2NBZitJNWUrU1dp?=
 =?utf-8?B?K0FQWmppdHVvZTNKTGhCVWJBcnFMUGl3RzZZVDBHOCtUVFhpUzdUYi9sQXAw?=
 =?utf-8?B?QTVSaVpqQTVZS29hNVBLUVZrLy82MXQxanBOeWRyaTdueUV1SHBUcDFaaGxQ?=
 =?utf-8?B?TXh4ZXFxS2pBTzgvZnppeFh6V0VaMlRCcjg5alVad1hYUFJmZ2pnOHpVdjAx?=
 =?utf-8?B?Sml3UkxmM0ZGbWx1YmdGeHhiSnhqdmVhUFBJcmhoK3hLbW5CZzdkZ2lOeURG?=
 =?utf-8?B?Vlp4TnF0aG1NSFJrWWQveWljWG1iYko4YXlTRHN0NHlSOVJKMkRRbnltajNO?=
 =?utf-8?B?OXE3RGdIdEZocUd2cFZpT3lJQ2gzTUVRMlNoVjczRkFJeXYyc3BMeGRrY1hh?=
 =?utf-8?Q?/UL3EJG6/aAGolseN03+6YxKq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25f4c99-a8e7-423c-e6ab-08de0bd42676
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 10:18:14.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LfBxcSlf2A4cdbd9amUJrdUwh5mQ0wOB6/2E9eqsMm22m0eg9YYans61qXhuQ9cj+MsJpeckmd/XPDYFVmpdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8940



On 10/14/2025 21:57, Mario Limonciello wrote:
> 
> 
> On 10/14/2025 6:01 AM, Shyam Sundar S K wrote:
>> Custom BIOS input values can be updated by multiple sources, such as
>> power
>> mode changes and sensor events, each triggering a custom BIOS input
>> event.
>> When these events occur in rapid succession, new data may overwrite
>> previous values before they are processed, resulting in lost updates.
>>
>> To address this, introduce a fixed-size, power-of-two ring buffer to
>> capture every custom BIOS input event, storing both the pending request
>> and its associated input values. Access to the ring buffer is
>> synchronized
>> using a mutex.
>>
>> The previous use of memset() to clear the pending request structure
>> after
>> each event is removed, as each BIOS input value is now copied into the
>> buffer as a snapshot. Consumers now process entries directly from
>> the ring
>> buffer, making explicit clearing of the pending request structure
>> unnecessary.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/acpi.c   | 40 +++++++++++++++++++++++
>> ++++
>>   drivers/platform/x86/amd/pmf/core.c   |  2 ++
>>   drivers/platform/x86/amd/pmf/pmf.h    | 20 ++++++++++++++
>>   drivers/platform/x86/amd/pmf/spc.c    | 24 ++++++++++------
>>   drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>>   5 files changed, 79 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/
>> x86/amd/pmf/acpi.c
>> index 13c4fec2c7ef..8a5eb3eeba55 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -331,6 +331,42 @@ int apmf_get_sbios_requests(struct amd_pmf_dev
>> *pdev, struct apmf_sbios_req *req
>>                                        req, sizeof(*req));
>>   }
>>   +/* Store custom BIOS inputs data in ring buffer */
>> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
>> +{
>> +    struct cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
>> +    struct bios_input_entry entry = { };
>> +    int i;
>> +
>> +    guard(mutex)(&pmf_dev->rb_mutex);
>> +
>> +    switch (pmf_dev->cpu_id) {
>> +    case AMD_CPU_ID_PS:
>> +        for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
>> +            entry.val[i] = pmf_dev->req1.custom_policy[i];
>> +        entry.preq = pmf_dev->req1.pending_req;
>> +        break;
>> +    case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +        for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>> +            entry.val[i] = pmf_dev->req.custom_policy[i];
>> +        entry.preq = pmf_dev->req.pending_req;
>> +        break;
>> +    default:
>> +        return;
>> +    }
>> +
>> +    if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
>> +        rb->data[rb->head] = entry;
>> +        rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
>> +    } else {
>> +        /* Rare case: ensures the newest BIOS input value is kept */
> 
> Even if it's rare, maybe a warning should be emitted so that it's
> clear that "some data" might have gotten lost.
> 
>> +        rb->data[rb->head] = entry;
>> +        rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
>> +        rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
>> +    }
>> +}
>> +
>>   static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>>   {
>>       if (!pdev->cb_flag)
>> @@ -356,6 +392,8 @@ static void apmf_event_handler_v2(acpi_handle
>> handle, u32 event, void *data)
>>       dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n",
>> pmf_dev->req.pending_req);
>>         amd_pmf_handle_early_preq(pmf_dev);
>> +
>> +    amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>   }
>>     static void apmf_event_handler_v1(acpi_handle handle, u32 event,
>> void *data)
>> @@ -374,6 +412,8 @@ static void apmf_event_handler_v1(acpi_handle
>> handle, u32 event, void *data)
>>       dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n",
>> pmf_dev->req1.pending_req);
>>         amd_pmf_handle_early_preq(pmf_dev);
>> +
>> +    amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>   }
>>     static void apmf_event_handler(acpi_handle handle, u32 event,
>> void *data)
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/
>> x86/amd/pmf/core.c
>> index bc544a4a5266..98aa9712b7f6 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device
>> *pdev)
>>       mutex_init(&dev->lock);
>>       mutex_init(&dev->update_mutex);
>>       mutex_init(&dev->cb_mutex);
>> +    mutex_init(&dev->rb_mutex);
>>         apmf_acpi_init(dev);
>>       platform_set_drvdata(pdev, dev);
>> @@ -494,6 +495,7 @@ static void amd_pmf_remove(struct
>> platform_device *pdev)
>>       mutex_destroy(&dev->lock);
>>       mutex_destroy(&dev->update_mutex);
>>       mutex_destroy(&dev->cb_mutex);
>> +    mutex_destroy(&dev->rb_mutex);
>>   }
>>     static const struct attribute_group *amd_pmf_driver_groups[] = {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>> x86/amd/pmf/pmf.h
>> index bd19f2a6bc78..31dfd671f44b 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -12,6 +12,7 @@
>>   #define PMF_H
>>     #include <linux/acpi.h>
>> +#include <linux/circ_buf.h>
>>   #include <linux/input.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/platform_profile.h>
>> @@ -119,6 +120,7 @@ struct cookie_header {
>>     #define APTS_MAX_STATES        16
>>   #define CUSTOM_BIOS_INPUT_BITS    GENMASK(16, 7)
>> +#define CUSTOM_BIOS_INPUT_RB_SZ    64    /* Must be power of two
>> for CIRC_* macros */
>>     typedef void (*apmf_event_handler_t)(acpi_handle handle, u32
>> event, void *data);
>>   @@ -358,6 +360,22 @@ struct pmf_bios_inputs_prev {
>>       u32 custom_bios_inputs[10];
>>   };
>>   +/**
>> + * struct bios_input_entry - Snapshot of custom BIOS input event
>> + * @val: Array of custom BIOS input values
>> + * @preq: Pending request value associated with this event
>> + */
>> +struct bios_input_entry {
>> +    u32 val[10];
> 
> There's a few places that are fixating on "10 inputs":
> 
> * apmf_sbios_req_v1
> * apmf_sbios_req_v2
> * pmf_bios_inputs_prev
> * amd_pmf_notify_smart_pc_update
> 
> Do you think a define is worth while?
> 
>> +    u32 preq;
>> +};
>> +
>> +struct cbi_ring_buffer {
>> +    struct bios_input_entry data[CUSTOM_BIOS_INPUT_RB_SZ];
>> +    int head;
>> +    int tail;
>> +};
>> +
>>   struct amd_pmf_dev {
>>       void __iomem *regbase;
>>       void __iomem *smu_virt_addr;
>> @@ -406,6 +424,8 @@ struct amd_pmf_dev {
>>       struct apmf_sbios_req_v1 req1;
>>       struct pmf_bios_inputs_prev cb_prev; /* To preserve custom
>> BIOS inputs */
>>       bool cb_flag;                 /* To handle first custom BIOS
>> input */
>> +    struct cbi_ring_buffer cbi_buf;
>> +    struct mutex rb_mutex;             /* Protects ring buffer
>> access */
> 
> For consistency how about 'cbi_mutex'?
> 
>>   };
>>     struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/
>> x86/amd/pmf/spc.c
>> index 85192c7536b8..436ecbf07aec 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -150,14 +150,26 @@ static void amd_pmf_update_bios_inputs(struct
>> amd_pmf_dev *pdev, u32 pending_req
>>   static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>                          struct ta_pmf_enact_table *in)
>>   {
>> +    struct cbi_ring_buffer *rb = &pdev->cbi_buf;
>> +    struct bios_input_entry entry = { };
>>       unsigned int i;
>>   +    guard(mutex)(&pdev->rb_mutex);
>> +
>>       for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>>           amd_pmf_set_ta_custom_bios_input(in, i, pdev-
>> >cb_prev.custom_bios_inputs[i]);
>>   -    if (!(pdev->req.pending_req || pdev->req1.pending_req))
>> +    if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) == 0)
>> +        return;    /* return if ring buffer is empty */
>> +
>> +    entry = rb->data[rb->tail];
>> +
>> +    /* If no active custom BIOS input pending request, do not
>> consume further work */
>> +    if (!entry.preq)
>>           return;
>>   +    rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> 
> Is this the right place?  I would think you still want to move the
> tail if CIRC_CNT() > 0 and there is an empty request.
> 
> IE move this before
> 
> if (!entry.preq)
> 
> 
>> +
>>       if (!pdev->smart_pc_enabled)
>>           return;
>>   @@ -165,20 +177,14 @@ static void
>> amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>       case PMF_IF_V1:
>>           if (!is_apmf_bios_input_notifications_supported(pdev))
>>               return;
>> -        amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req,
>> custom_bios_inputs_v1,
>> -                       pdev->req1.custom_policy, in);
>> +        amd_pmf_update_bios_inputs(pdev, entry.preq,
>> custom_bios_inputs_v1, entry.val, in);
>>           break;
>>       case PMF_IF_V2:
>> -        amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req,
>> custom_bios_inputs,
>> -                       pdev->req.custom_policy, in);
>> +        amd_pmf_update_bios_inputs(pdev, entry.preq,
>> custom_bios_inputs, entry.val, in);
>>           break;
>>       default:
>>           break;
>>       }
>> -
>> -    /* Clear pending requests after handling */
>> -    memset(&pdev->req, 0, sizeof(pdev->req));
>> -    memset(&pdev->req1, 0, sizeof(pdev->req1));
>>   }
>>     static void amd_pmf_get_c0_residency(u16 *core_res, size_t size,
>> struct ta_pmf_enact_table *in)
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/
>> platform/x86/amd/pmf/tee-if.c
>> index 6e8116bef4f6..add742e33e1e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>           status = ret == TA_PMF_TYPE_SUCCESS;
>>           if (status) {
>>               dev->cb_flag = true;
> 
> Do you think you still need cb_flag?  Or could you instead look at
> cbi_buf head and tail where it's used?

Ack for all the comments described above.

We’re keeping a 3-second delay on the enact command to accommodate
early custom BIOS inputs. As a result, we process them via the early
pending request, consistent with commit "62214d942d2b
platform/x86/amd/pmf: Call enact function sooner to process early
pending requests." Therefore, the cb_flag still needs to remain in
place for now, based on current test results.

Thanks,
Shyam
