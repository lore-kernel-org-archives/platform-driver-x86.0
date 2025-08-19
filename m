Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816FE20C000
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605529; cv=fail; b=gTYYMv9UAhdHfkK+tcmULLK5kRFVQUAyLyqw2HVoWH49q5wSMmfQ1lvYWkqZ0yi2Mp5sWyHJ4G7ZbgZ6RIV+ouhBa2YxARo5HIokqeYaTV/SqyJBqcaS+QXW0q+GDJRV7lRUEODXGfYu5Pqj9uLJ27b5HC7gzHge1gKu4Ue6u88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605529; c=relaxed/simple;
	bh=1F1Y00oCE47ERckki/Wi8rMUn1TLBUuri6riltkSIAM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ijo3NytXORJj6IbnYbzkBJcsmacidj5DHCZmFpyexwn9IP8VBTBw82k75TDE+Wg0EXW7hxOpBdfuiKuUKlON2ct3aFx2rJ5nfBOFErgC9DP/ik5LJcejpvnbdbLRiyGKhCLR4Lf8kmK2lQ0nghI/OqhdodVKMap+zFup7gpcNWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vrwTj39J; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vrwTj39J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jw3YzmcajU+DcooF2sPei9SmtmaY1Y9C346TYK7TrVeJP68+nlGuOdW/iu+V1/LhsR1J4g99ISj8cq+QInxST6MikEd0Eeeog45C2Ox+BBgnZ8TAOSbMpjz/e//sPX6QRp6cCXWB2/diVi0Qk+e394UhG+L5SRsE7okjwbXqp1RV18H2DB92VbEh1X2tIhvIK8mxsGo6JnfUUjhTgjDDcE5oM34oIS3bWb9Cnzu51ns7LL5mbgWjIF4uEy4rL/73j4TRUWj4DweyYiEvwAy8sk7H0KkCICWWcRseo/Tr6Xyj9c4+1uQWmLDYNT+wDT+hxgL6oPPyLFQzPLst6pVbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVKbFw24ICQXpZ2xxEqdyritjzzwKkLr8rK4SNKv/m8=;
 b=ECGdN5OiDzyvTakki/HmVgdElh54j+ZertpwWKfa1hhKHtFJHgaqRC/XWtMShNXGw5Xd+pkWR6wYouMSSqfKlf7IzL1WuiB4WA8/cXrp56Q2JyCgJOszxl7iSxx4n0FLVW7sc0IqTFceu7kBDVIPO08qln/JspUdLg1dNwq697bNPRh7yMWI5AJFp/Gk7zt0NavTiLjKZDEp0rG6A/9QAPBFBTu+4rCe90We73f9tBKBjithl4uK9SQimZ9cNG3vUBMCoAPUQRtJa064TcWChjSwCnNRyMOChhVe3L87PU4S+TqRG1nOIQEZ9RNNE7yZ7q2lybSQyHLbfePaaqRxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVKbFw24ICQXpZ2xxEqdyritjzzwKkLr8rK4SNKv/m8=;
 b=vrwTj39JUL2z+EVSuPKmtCDsYfYo4Jn00x518vYtFXeKmvkvuaev3O4bVm/FwrurVjnWwHJd43aM3Ls1UmBxckkvvY2X9r+iNSBe93fIazSGPkD7G5g5fiMnWZCSybrts0c1Sl09qrQ38W7viy/Wps6gUg1RKZaXJhqUOuK7TKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 12:12:06 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 12:12:06 +0000
Message-ID: <3d800301-526a-40fc-be67-ae067de03bfe@amd.com>
Date: Tue, 19 Aug 2025 17:42:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] platform/x86/amd/pmf: Update ta_pmf_action
 structure member
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
 <20250723064121.2051232-5-Shyam-sundar.S-k@amd.com>
 <0c6a6c0d-9abe-eb64-7902-b9f1045835f5@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0c6a6c0d-9abe-eb64-7902-b9f1045835f5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::24) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb7e85a-acd0-4086-333c-08dddf199d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXk4ZmNuNnZydnlGOG41eHgzVXR1SFJHbzhzSmZKU3EzeVNnelc0enlyMkZ1?=
 =?utf-8?B?alFnaEF2Z1AvNS9mSHdJOFZtNytPdFQxdDE4eUR3M1YyMVRvQW85R1NHaXJP?=
 =?utf-8?B?dTdPZndqbEZuTGY0K3dBQnhMeTlsNEJ3M1hVRE00VlliRjRGR0V3UisrcWw2?=
 =?utf-8?B?T0FXMFoweDRrc0UvV0JsbUowYzZMQzduMnlwN2xNSVA5SXdkYU40amZLZExy?=
 =?utf-8?B?RWdKVzFiampvM0FqRm5Rdzg1cVdVTGt0UklsTTMrYkMxUlgvNVBsU1J5QjZG?=
 =?utf-8?B?VG1uMS93b3JxSHJaRVBqTFYxTGk3VHdFZWNoenV1N0dNVkdheEZpcnBQZkZ0?=
 =?utf-8?B?cG9zckxhN0JtTkNWdmltQVM0YmU1K3RGWE9GcXpEOEtMZGdhVWw3T0VJdjlr?=
 =?utf-8?B?Y0FQeko4YlpsdW1qamNxVXJteHlLVGp3eFpFQ3BCbEJGN1hKVFdLRWJMWFJi?=
 =?utf-8?B?SmFLNG80NTJmZFZiQ3dMVGpzUlVZeU9DM0lPdmprZUhPU20vWU5RQ2J2OHlH?=
 =?utf-8?B?Umd0ZWRNZXZFNEVvRkFTdmRkZnhFWTJXbitoRjVoWktDSDlPZTluVzVHQkhh?=
 =?utf-8?B?TDhLckhHV2cxeGhFc1ZqM1lzUlk4dG0xRkx1Q2RweENwai9XV0JKdkpnVnRu?=
 =?utf-8?B?eDJHQUxlL3gxKzRIcEllcmdGSVdxeTAzYldwb0hPb1R5QzNhaXI1ZWhCb3BP?=
 =?utf-8?B?S0hqTTN2VjNsaWJWUEN1a3dNcDdWTjJIWFA2S2JIL1RqSERzZ056VkluMEpy?=
 =?utf-8?B?T29GZWpZcXhPS0R0V013Y0Vham9lVXJXeWY2ZTYzNlJremkzRUVweEJtTFkx?=
 =?utf-8?B?dHNaUlZBWFg0am5YYWk2TWgzelk0OWE3dEk4NUd2NFZMZjlmVGJPOEhsdDVS?=
 =?utf-8?B?eXd3ZFRhekhYSGNVdmFYcWt3Yk5aSkRQSHlnVzRyZFBSUlNTWVg0N01oTWRX?=
 =?utf-8?B?cW5CVnU1c0V3VU5XTFh1T0xPeFl5eEVrNG5ZUXh0c2N5eG1lZHVibUd5WlpE?=
 =?utf-8?B?dU4xcGVOS2tvYWJyT3Vad2hiMjNVQVpRVzZUcmNSNThOTGJSbkQ4dWltZjFk?=
 =?utf-8?B?MnJqYStvVDdVUlFDcmo1OUZWZGFBVU9GcWljQzFUb1M3T2t2dGpaQzFWaHBy?=
 =?utf-8?B?Sk1YMVR0UEl2MzRPeXpOUVlQY1NoNEVPeEVYVHg3c2xGd3pLZEswRUlUQmxo?=
 =?utf-8?B?Z2NCMEs1VE9IbndBS3JkM1UwbjdCSmZ1MEJFdnB1dVkwek1lMnIzY1B5ZW5v?=
 =?utf-8?B?RnpkMEFRTmNPdnBIME4vdWs5TmxxWWNkVGs4Sk9WTnRUcUpzOFVxYjE2eU0v?=
 =?utf-8?B?ZytYeWtadlN2QWUxSlc4eHFRQUpGM1RhT0JhSXFQWmpqNkhyQUJuTVFuOHJz?=
 =?utf-8?B?di9NOTIvcnhadHpEMHJNWDdoSFR3bmhlZWhPM0xKWDljb1pqMDJ5Tm5FRmtq?=
 =?utf-8?B?bzBSOGFDVkQvUFNlSTBiNnhDbTNGeGtSTTZYb0wxZFZJR1EwUHVLdk15dmVk?=
 =?utf-8?B?a1o1V3dOaGRLM2MxaTBmbDVOTzJ0TlhlK3BRVFJhRjRSNFZQeCs3NkVieis0?=
 =?utf-8?B?UCswWWZMQkUxQzZ0UzJRWDR4RVZDSzBJWnhEYmlNSzVSTWVJSGR2UEZiY0dm?=
 =?utf-8?B?aitkWkkvQkJXRkc5N3hrVCt2ZVVlVE5kOHhocFJpYi9PaWc3bmUxRkx3Z1lv?=
 =?utf-8?B?TS9OajBiSWtBMjhFR0ZwZFNUaGpzZjNyK3JpdkRzTnI3cjZLY0NEQnA5eUly?=
 =?utf-8?B?OGRpVitTMUVwUmtJT0cyMVFNbElpS2p3dVpxNVVWUVFKdm5Lc21KTEZsOXUx?=
 =?utf-8?B?NTlPM25BV1NtdWplN3J6aXgwNHRjdGhKalhMNXo4ZEllNjgxY0VkMzR6UEc2?=
 =?utf-8?B?Q3NJb1ZTTjhIb1BZWm5BeDFBUXlYR3RLSjArTEF1cUhuemhIa1lhSzNWUG0w?=
 =?utf-8?Q?NO4L01CWcI4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjVqdENIRG0wa3ROU2RMZGZTNGx5dXd5bjdRTEc2UUYxRlBUSU9nWERIVC9O?=
 =?utf-8?B?U0ZsckVWSVBJb3RhNHNUWW1lNHNHY3JET2tHbXJnTE5Gelp5WkpRY2dHUFFS?=
 =?utf-8?B?VEhROVFUUEt5U3hQQytLK1ZHUENZYi8wQTJkOERCQnEyN2dRL2FnMXBlRWdV?=
 =?utf-8?B?Tk9nYlJpZ1pkVGNBdXlnTERDdHJ5bzFIUnozZktVZEJyTlB3TzNNc2YvRldk?=
 =?utf-8?B?Mi9qTm5qb3YyOStrQzFLelUxYlQvMkxWbk0rSVJqa0xpdTRBcTI4SmpvQVpV?=
 =?utf-8?B?eVZldm5RcksvamdKRDlZZC9OVG1OYU5oRnB5cE1XeVBBVU9yWEg3c3JhR2l5?=
 =?utf-8?B?cWh1MGdwOVFWbldoNVJyUUNhczI4VGFYNGpqNXpwYlhGMEtrazJtQXYrK2RD?=
 =?utf-8?B?eHowamJ2Z1pqMS9Wc3M1eGVxZTBCOVRHN205UFFKSm9ydmlRVUJQVHY0YUZn?=
 =?utf-8?B?bGZZSS9NRlFLRUNITXlvS0N0Rlcza2tiZjZVRVNDTWlhY200bmUzT1NwdnR1?=
 =?utf-8?B?UW1FVWc5amFKdWJZNlBseEVlRGVndXVoaGZHZWVNNUd0NGc3VzRVQzFPakVv?=
 =?utf-8?B?MTZtWnNPWmhrTG1SVy8yOHk5cnZudjcrNE9uMWdrU2o5NDdHOUhhTGVwVThv?=
 =?utf-8?B?dVM5WFIvT2cwMC9GbXJNRU1SM2R0UFgyR09ia0FsNUhQQW9SeldBSjVtNzE2?=
 =?utf-8?B?L3dCWkRPdWN5elZPYWk4N0VMZFArRFRxcjZQV1UzTXFaNlhpWnRwZGtOdkJx?=
 =?utf-8?B?dW1EOXlxa3F1V1JYYW1VaHpBcGVtb01xMTVaeWd6eVNZZC82TTNuVHd6bFpZ?=
 =?utf-8?B?TkRFZmtidFVocDNCejQ4UjBhQUpra2ZMQzhmZVZiU3dHQjh2V2hBcEM3SFdV?=
 =?utf-8?B?Z2Y4cTdCeXkrUU5LZ3N2NDhHVkxVUUc4enRub2Q0VXNUbDZ3bWg4d2ttUDZt?=
 =?utf-8?B?NGhWV3VlK1R6Vm5ZNlpVT24rRHNPNysyRktNSlNXdEZna1NJcjF5MEhGZTcy?=
 =?utf-8?B?eWl1YjU1b2xadHhna2RSQks1NkFIckY5QlVWVHVaWHRBajZzTzlxZ2NqZkht?=
 =?utf-8?B?Q2ZPMzRIdGtzYmZrMitKQUFSZXhiRjNBQys3OUgvTFZmVTJxYUFTM2swb2wy?=
 =?utf-8?B?Mlo2VFJZc1lTMVkrNWJHYTVIUWpXWFFIZFpnRmxNb3ZDOFZ2eU9jNitKYVNW?=
 =?utf-8?B?RGwrSDZJODRhaC9ITFJyQWRhY0xKOUYzV21USXlkb01vdE9mcnpVcDRwVzdy?=
 =?utf-8?B?dmh3UnpIa05adTlQWEQ4KzhFRjRSdUFnUWE4bG05VjVoajNQcXcyOWQwSm43?=
 =?utf-8?B?czRpWHV3Ym51dENCdUI5dEorZUxYSGlKWHlyVmh6SXBmNmhUM0V5Mmh6Y2FP?=
 =?utf-8?B?NXdHNmpUYi9GUkh0Qk5ETWJJb09mZ0ZiWWk1S3I0VGNpWkFWSVZRTkc3b3VD?=
 =?utf-8?B?d0ZvTk1rc1B6QWpkNTloVUp5d3ZQUkpJZEgwNlZ4T1VFVVNnMXBWcUIrM1I4?=
 =?utf-8?B?c0F6RjU1WjNSVEZ0bGFEclYxVk5HLzJsbEJNamRmbTlhbVpwN2RRTWVUZnE0?=
 =?utf-8?B?cVZ3YVBUNjA5M00xR3IxcnBiamdiR2QxbnZLS3pkRXAwOGhnS3R2TDZMaCtY?=
 =?utf-8?B?aWlVUlBBSFdUakhrak9xVWI1a2YyaEpXQ0djMyt3WGVCR3dPc3JnT0ZQMFky?=
 =?utf-8?B?MG9BYlh3K3plMUFmZThJNDNOK3NFajYzeXlEVzYyWDhBQk1oUXVtVml5bERD?=
 =?utf-8?B?bXFaNDJYZFZhc0g4ZkxMN3hNaFNpblo0UmxiUWVvUFNnVUk0dnVzbU4yK2VX?=
 =?utf-8?B?cGh0N0R0amVPTTF0b2tzVkZHclQ4d1kybnJCd09Wa1RuWDUxbmhkR1dOVXJD?=
 =?utf-8?B?eUtGdm1RMFZtUnBYUjlxdXB2b1FCTkZzMGlEazlxRVllM1NLcHJYSkZEU2VT?=
 =?utf-8?B?dHBvUTRQMUVhdjlEWjZlbUtuUG9qZUd3aGUvVWJFblFMYUpjNEwwTzg1MGM5?=
 =?utf-8?B?dVhyVzlGVDIvRllEQ3lIVTNRMzAvekpBUituemFUdlRjc1I3UWpRR1p5YlQ3?=
 =?utf-8?B?blpxVnZwY1dVL253cnluc0pNcVEvb3h0b0ZGYWloNFNYSTNTL1ROeWlERmlX?=
 =?utf-8?Q?qLnihg0n2L0JZFKadgN2CTcOp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb7e85a-acd0-4086-333c-08dddf199d0e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 12:12:06.0206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lKJvZteQjeFoAjH3WO1WOiZCcBK3KXhc/ppjK1kSgMMMWjwpGV13pE5h6C6EGB2k1UaNrnJRSuvTaVqRGGpRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090



On 8/19/2025 16:44, Ilpo Järvinen wrote:
> On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
> 
>> The latest PMF TA has been updated with the additional structure members
>> for internal evaluation. Since this same structure is utilized in the
>> driver, it also needs to be updated on the driver side. Otherwise, there
>> will be a mismatch in the byte sizes when copying data from shared memory.
> 
> How is it known if "latest" is in use or not?

it is based on the GUID
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/amd/pmf/tee-if.c?h=v6.17-rc2#n30)

We start of with the latest TA and do a fallback to older TA; if the
TA load fails.

Thanks,
Shyam

