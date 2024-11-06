Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDB61DE4F4
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730902561; cv=fail; b=u0vwHqkkmV5A8dhVcfg0TOfc1oVJYoWLaQb/rmj2OIqaLXEN/bYkHBockk1G+rd4wtv3lC5rjaxCyFqokINrJ269psTflK9azZPp/wlh0Yw/yWzh2HJvqPmQ3H3LlAvYzvewAbmmnd0YhMOA5yKo+s0G3njDUaqq43chIDrrWyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730902561; c=relaxed/simple;
	bh=+Psl0UjTAIQ0H+mANWlrN4KD/uSump0VHHIJNt3EvoA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N1cW8NITGt0eh8hB6KEgwuT3unWoyXiYDCa5YMSvg4FBU2k8aUdN3jeHwfosvvAIO4fGrp3bLEzTe4qlzCh5PusgospN8Y8F2ym6DliznSTQYvuyPvlGdhESpqUMWC4ncVRsJE2IglKRVyBWi59deh2twcDDqQTHRh18jHr63Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jMJTjQ3w; arc=fail smtp.client-ip=40.107.237.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jMJTjQ3w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uv7u2xKZ5dm92FdI8FgK8at6T/YjuoCPxsOKKJDUr8gJJiDJxGlrABDA+J1W9Gv3XzurfNL+Ne6AmFKNScnyTIrijTkHFwBJT5hQqS99XxBdEC0G+VuoMmUJ/ElTD8hfepZb4l1/r+7pAZZzBEXrXucKrJXp5joa03haqTNC1w42X77LWphVEyA0AgvMGl+zusr0l64N49D5BW8qvSRM6uOiVErywkzcbtRIv7H4w9aJSmWn3Quo2N2QIO17kVJhCEjbIRei+n8yGbw8WFPyArXLlibQQfoZyql7XEPBQ31OkRbzzcC+Tmq1rEay9Qb8h/q88UxQSENP5R1bV+Yxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAb1nMTrkmLOkOTjZ1+mIjwFYsMCpXM8oOjN1uyxDIQ=;
 b=R+3bnPnxm0giAANXZ0DTn/ytEk7s4p77D0tn257Qv8AMpIX5UU9yZgwLofWXoVQir14FxocFiMdlWzpnTbc4UvB0jV5HvuVGMbcaowNjINsc6J+bDAbT7JAWJm6d4InEA13Rahkbkbamx53W0zcbhwt9oMPa6LDRyR4u4I6ARdmpANkrE9AWOcS5k1wLm2G0JIfkzS7AvooZGiLL9aTl0AzK/EbikCxik4Ay0WMlfkV42JjAZ36lCHhYnb/AswSvqZQFKpb1nKxs1tNMfTdxdn0lhtOnAfO5AMhOOqw+jmjhv0tzS/e+eYiQeBkCRGgFEqX8onIRBAmkpOqfQEVvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAb1nMTrkmLOkOTjZ1+mIjwFYsMCpXM8oOjN1uyxDIQ=;
 b=jMJTjQ3wRmRtn+sGWqTY5HWjUDdxLBDuukGMu5mTKe5LrvfF1yhLqaPbRpoXGu68gpk4cG3UpolodLDtGxJUZVZ00CnwgM4Si7VBhkyFUHx09f+rDktWl7y1Vw9yy6D3owpRO2L3YqCSCUABvKhJFf+V+Niyrl0xsdJKQxJT8QY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 14:15:53 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%6]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 14:15:53 +0000
Message-ID: <a87ea4c2-a945-2a44-a3e2-491e89a9b28f@amd.com>
Date: Wed, 6 Nov 2024 19:45:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com,
 W_Armin@gmx.de
References: <20241106112821.1012452-1-Basavaraj.Natikar@amd.com>
 <20241106112821.1012452-2-Basavaraj.Natikar@amd.com>
 <cec45a38-3e30-3a57-ab2c-a6baef484a7a@linux.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <cec45a38-3e30-3a57-ab2c-a6baef484a7a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::8) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: a677ca1a-8090-4393-b6bf-08dcfe6d8605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW5ER1ZidEF5Z0tDaDZ4OWFiU0tMZUI4T1pjdHMvVmVCTFZubnkyUkRPUkpL?=
 =?utf-8?B?b0U3M1NxUU1KMDgrUjB6NEJYbEVLTmVQWVdUb1lTVkQ5NWd3Qk9BM1BBMkVj?=
 =?utf-8?B?dDVWSks1d1BGa2t6ZjhyZUFidkFpZ1lUMVJXcEhiTTdCVG1FZlhvbFRDQTd1?=
 =?utf-8?B?UDIyU0tIWW02bCtJVHdKbUpmeDh5QlJPZFozbmdFQWc4bXRoZDR6K01TcEhW?=
 =?utf-8?B?SlN6ejdEdFVuUHY2MmtubkpUeldFNkthcTJFRXZ6Sy9DVGJvYWUvdHYwUUhC?=
 =?utf-8?B?TFFseWtlQkJ4cGw1ZEVUUnExWG1zYzllK0FaRFZUOC9PWlc3bmdkR1FwY3Mv?=
 =?utf-8?B?c0FBTk9aSVJadXdaK3RCWEQ4djhwNU5ZMmZzM1h3VllvV1lqNlhuc3JiNitD?=
 =?utf-8?B?cld3aFhqaHNCUFBRWUZ2VDN1aEFSU3R2R0dNdzRabm1EbHB3U01UOUk0WUVo?=
 =?utf-8?B?ZjVDeUVLbW1WNEtxVVY3dmppQUYzQTlXRFdiNi9INk1jVEE5c1VoSUcyRUNE?=
 =?utf-8?B?T2x0Mmk3bEQzRCs5YVl3eG1Kb2hFZmVxb2R0Q1l0YVo3OEYzcXZBUDhncVpK?=
 =?utf-8?B?Q1ZyTGlpWmdQZUpIcmVsYVJjdDI3cGhPVnhwRWxOc2FhVmwxb1hSTldWZExE?=
 =?utf-8?B?dG1GTzR1aXBCKzlaNU9aRUNwYkVyYllTZkRpY2VmTnN3SExKVzRpTE51MDEx?=
 =?utf-8?B?Tzd6T0lqQUZLcVN5QUhIc1ROUU5ZaUhYVWdPa0VNOGZvVHJHcHR6ZWUxN3ZH?=
 =?utf-8?B?VjF5a0w1bHVrNDJXaURuL3VSUW5tNFNJY2pPRVJuYVBuWVNJSXBvd1g3cVBs?=
 =?utf-8?B?RnZQZ1NZUXZjZTFXSVlkMTRISjFIRHZVM0E4ZG8xU2QrMTM2NytzQkhYQnNF?=
 =?utf-8?B?YXVHczF1T0FOQmFaZ1R5azJhUHAxSVRDUWo0YmVYNEtPbENvS2h6dTBhMXV5?=
 =?utf-8?B?OFhzNDlKcVhPTXp1eEE4azdCbzJtOHEwK0J3T1o1R3ZoUHM5TWlWc25MRk1a?=
 =?utf-8?B?SEhLL21kUmgyRUZGSWszMjg0R3MvRzhUMGJiSE9sR3VFWWtLRzI3dVJnU1A5?=
 =?utf-8?B?cSs0aDQzeXF0Yitrb3E1L0xienJiSkhkMU1zbVVGVFA2TzV3QVFTc21oU3hm?=
 =?utf-8?B?RWtETzZwaGl2Wkw2YTNibmFRU3BjMkhuOUduUHIvNGVSWUE5MlJtU2lUbjIw?=
 =?utf-8?B?Y2NjYUFnNkpsNk91ZnBYMk5QRmxGZThlR0MvaWt4YS8zYWFCbXV6NmlSUnZ3?=
 =?utf-8?B?QkpXQ21LbUVpcUlNVWpKdFZIY3c0N1lBaHpuL2ViTlZjcU5FWTdZeXlDZkVG?=
 =?utf-8?B?TGg1S3NDSE8xbE9OcUlLSmxCZElsSWpLY1Z0WGMrenFUNlRiVDdueFlYUGk5?=
 =?utf-8?B?N3R6M2wrbzdNUE5NTzhOUDhoS1Y0ZU5mVStiTUZYOUFDdHBwNit1cDJia29N?=
 =?utf-8?B?TnBpOVd3bFhTZVU1b00xamhjVkJZSWhpN3ZuRU5yUE5jZmxIZGd6V0VIa082?=
 =?utf-8?B?VkFzYWMzSU9UVHU5bTlpeVkwUWNxMkpBYjhSeFNDUkgzWU9oOEN4eE9kNDUz?=
 =?utf-8?B?eWgwbGZDMis2UVc1Wk82Q1NEM3E1Z1pidnkybWZpTks0US9DLzU1end6eVpP?=
 =?utf-8?B?OXQ0K2hKb0FwVzhRa0YvZDRKbUFVaVd6bHBsSFNkT1dFa0ViV2ladERHaEJp?=
 =?utf-8?B?MUpPTFRzZXdnY2ZuTDllTEJuQ2k5cXZRdTltVnRTd3BCZ2JQcU1uQWVWQmlq?=
 =?utf-8?Q?TUmN+6rg88gGS3kUaB358NaTW3Qhru7nqp3Ubj+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emZMdHVVTzhkdHRJMHhsQnFJamhpQldIY0VBUVN6eTNCQUhHaDBScDIwMkpa?=
 =?utf-8?B?d1A4QjNTWUwwcTFNN1pnQmhQS1YzUzd1MVZJV2VOK1NNQUVTTlFTODZ4T0RE?=
 =?utf-8?B?Y0lsR0NwT2N6ZWQxNitrdzE2bkRMc2o4dklBMXB3V1JUa053NmU3UjhqSVBp?=
 =?utf-8?B?ejIzYXJ5cHQ1c0laNVNjZ1lYdHVGTFlHM0g3NGp6OWpQTzEvY1czVWJvSUdu?=
 =?utf-8?B?QVNUNDAwdDV1dVlrUGtkY082dEgwNzBLbXR5RU84Z3NCc3pKS3ZiQnZkQ0dY?=
 =?utf-8?B?ZlZ5emFGQ3JGaVlKTEF6TDJtZTM2SFRJeHBzdzZQR2lScnF3WTBCb1lzTVc2?=
 =?utf-8?B?UHlCNC9GZ0ZUU1dZejdnbVFiVXNrUUtZOG4xSTZJZTV2SkdKeitXQmtVRHhi?=
 =?utf-8?B?UUx3SWowMjJRL29vc3pNV21WemRTOWpPOTgzbEIrdlFpTjlRRGNJVEpoelVl?=
 =?utf-8?B?ZkEyVWVyRFJ4VFJoaXNJUVNLV1dLTzNIajNpeXRrM1lDUzNacHlLVDg5bTZ3?=
 =?utf-8?B?MXRYNUw2ZVdhc0FWc2t3c0o5WnVJTjVINUVCcXo2d0NMa3ZsZTQ3TjRPYThq?=
 =?utf-8?B?UG5XY1J5R1hKdmFwZDY3cWNGMHF5T2xYRGVVT1dJeUdHTWxDTXFhRnRnSXgy?=
 =?utf-8?B?cEpzcGZldUQxYjRlZW8xdEtEZ0hXeTRuZEJBeElmTnUyNkczaUR4eEdrbXor?=
 =?utf-8?B?QTB4SG84L0VyaFFpMTJDd0p1c2QwczZ6ODZLdFd1ajdIUjBobXYyTzFKdlVY?=
 =?utf-8?B?UWo4VXZhcWxxU0o3WTkvdm9yZm1BZ3lEZmxLNC9pbExSc2c3OHlzcnVzdG9J?=
 =?utf-8?B?RW5XL01jdW9DaGhCWk8yd1hMQzFMTjEwZHdWQUVRS2s5bExGMUJGdDAvY0dn?=
 =?utf-8?B?Q0RaWitFWWZzR1NSbThrN1lEYUwveWpjZXVBRDhlRytVaVNxT3VqZU55SHpw?=
 =?utf-8?B?VXpFcU4zcEFtWHVxUExGYU9OaHFWSW1RajlURFlDNUR3bkR3R2Qzd2Iyc3ZH?=
 =?utf-8?B?N3pTeW5FMERQVTYvZTYrQ2FIdnpwWE5yNG4yMDMzQjQ5RGZ4eVplKzBFVWE1?=
 =?utf-8?B?dEpCdnlqenpuSTMwUGlmK1E3QVU3bERRaTJta29uN3FrR1pVcS90eUd0RGJ3?=
 =?utf-8?B?a2tnUi9sNmcxcGNieWlkUkRFQk43aUE1ZWE5Rkl4QkphQTRBdjJYQTdpbGUx?=
 =?utf-8?B?SHluWGZ2aElINnFmVUxxaVlIK1lmamxFU0llOWJyVFU1dk5kS2Rkd1I2RHh0?=
 =?utf-8?B?ZTFwcnBPcUJTZmpyTDlVbHM4SkdGYys5cE5JN1l6TTc5dmNKbHpyeWk4cnBV?=
 =?utf-8?B?NUtmcitmalFHREZyMnV2cGNBazNNNERjV3l5anBoQ3lSU3BZc1hZc3o4a29n?=
 =?utf-8?B?RmdmUGFRampuSWZlUldZZ1czVDk0ZVdZUzhNYVVwNWJhN2R2d0pLRmxLc1Vz?=
 =?utf-8?B?NUZnTHE4d0l1dUtaeUVoKy9sNUtMZGJJdGNnbkVOdkZ1TWo5eGRXT3Buczcw?=
 =?utf-8?B?RGZQVjU5Yi9wYUFjSU0yTUdhMm81ZzJjN01GVlpkVk53QWkyVmtyRWFET0pv?=
 =?utf-8?B?ei96cG9RbFdRb1NHWXlhbk93TTF3czYxWE8wSGhWWmlFYWVybGpOOGdrN0RW?=
 =?utf-8?B?MnhtSzQ4YmJBbkwyZ0JwMG1ZU1lFekVQakxhc0s3M2oyQWFIU2RoQzcvbE9S?=
 =?utf-8?B?WWpOZzExZmZRQ3pkYmREb05rN1RyTk5sdGlSUUIyUDdOV0h5S25zU3N0U09x?=
 =?utf-8?B?dDNSWm5rVHFDVTRSM3hQZnBraVh3VjNJT3pib1Q4bkdnRzdMMXlRZlZJaVNr?=
 =?utf-8?B?VG4wYy9Jam5oTEhJUnJ3ejFQd29JRW5TQ1JUYUhTK0toai83MWtndHRRNHZj?=
 =?utf-8?B?L1JYM1ZTd25kbHE4OEhZTVZvZ3ZxeU9WYUJ5M3BZM0tnSHUzTTdVK25OTmlR?=
 =?utf-8?B?cjRmanBQVkxYMW45RmpBNkF5T1NmYXBhQVMramdtTlo5ZWppTTFrSEx5bUoz?=
 =?utf-8?B?V3dDclJFekJEanFTMUM4a2pqMnFML0d6REpMRUdVRnNSczRTWmlRZ3JHaER2?=
 =?utf-8?B?a0tWV2ZBSWV4ZXdkRlVxQ1NwNDRxYlUzWDNMTkFGbzNXQnZvVXpLTDZzKzUw?=
 =?utf-8?Q?aYBuLXTepwwYFlmiT9nDz4AMT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a677ca1a-8090-4393-b6bf-08dcfe6d8605
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:15:53.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0mMr89+TSymAnUfchZrw1P58+oe0eaaHkUgEMJcDBYYbHmlrYehGPOpECzMrO6Zb4DZ8+OSMFUk9O1Z6S7XxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232


On 11/6/2024 7:17 PM, Ilpo Järvinen wrote:
> On Wed, 6 Nov 2024, Basavaraj Natikar wrote:
>
>> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
>> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
>> switching between Frequency and Cache modes. To optimize performance,
>> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
>>
>> Frequency mode: cores within the faster CCD are prioritized before
>> those in the slower CCD.
>>
>> Cache mode: cores within the larger L3 CCD are prioritized before
>> those in the smaller L3 CCD.
>>
>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   MAINTAINERS                           |   7 ++
>>   drivers/platform/x86/amd/Kconfig      |  12 ++
>>   drivers/platform/x86/amd/Makefile     |   2 +
>>   drivers/platform/x86/amd/x3d_vcache.c | 170 ++++++++++++++++++++++++++
>>   4 files changed, 191 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 91d0609db61b..60155effead9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -965,6 +965,13 @@ Q:	https://patchwork.kernel.org/project/linux-rdma/list/
>>   F:	drivers/infiniband/hw/efa/
>>   F:	include/uapi/rdma/efa-abi.h
>>   
>> +AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
>> +M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> +R:	Mario Limonciello <mario.limonciello@amd.com>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Supported
>> +F:	drivers/platform/x86/amd/x3d_vcache.c
>> +
>>   AMD ADDRESS TRANSLATION LIBRARY (ATL)
>>   M:	Yazen Ghannam <Yazen.Ghannam@amd.com>
>>   L:	linux-edac@vger.kernel.org
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index f88682d36447..d73f691020d0 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -6,6 +6,18 @@
>>   source "drivers/platform/x86/amd/pmf/Kconfig"
>>   source "drivers/platform/x86/amd/pmc/Kconfig"
>>   
>> +config AMD_3D_VCACHE
>> +	tristate "AMD 3D V-Cache Performance Optimizer Driver"
>> +	depends on X86_64 && ACPI
>> +	help
>> +	  The driver provides a sysfs interface, enabling the setting of a bias
>> +	  that alters CPU core reordering. This bias prefers cores with higher
>> +	  frequencies or larger L3 caches on processors supporting AMD 3D V-Cache
>> +	  technology.
>> +
>> +	  If you choose to compile this driver as a module the module will be
>> +	  called amd_3d_vcache.
>> +
>>   config AMD_HSMP
>>   	tristate "AMD HSMP Driver"
>>   	depends on AMD_NB && X86_64 && ACPI
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index dcec0a46f8af..16e4cce02242 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -4,6 +4,8 @@
>>   # AMD x86 Platform-Specific Drivers
>>   #
>>   
>> +obj-$(CONFIG_AMD_3D_VCACHE)     += amd_3d_vcache.o
>> +amd_3d_vcache-objs              := x3d_vcache.o
>>   obj-$(CONFIG_AMD_PMC)		+= pmc/
>>   amd_hsmp-y			:= hsmp.o
>>   obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
>> diff --git a/drivers/platform/x86/amd/x3d_vcache.c b/drivers/platform/x86/amd/x3d_vcache.c
>> new file mode 100644
>> index 000000000000..4a72ffe75cce
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/x3d_vcache.c
>> @@ -0,0 +1,170 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD 3D V-Cache Performance Optimizer Driver
>> + *
>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
> Are you sure you need the "All Rights Reserved." part? While I'm not a
> lawyer, GPL only reserves some rights AFAICT.

yes this is correct.

>
>> + *
>> + * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> + *          Perry Yuan <perry.yuan@amd.com>
>> + *          Mario Limonciello <mario.limonciello@amd.com>
>> + *
> Extra line.
>
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +
>> +static char *x3d_mode = "frequency";
>> +module_param(x3d_mode, charp, 0);
>> +MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' (default) or 'cache'");
>> +
>> +#define DSM_REVISION_ID			0
>> +#define DSM_SET_X3D_MODE		1
>> +
>> +static guid_t x3d_guid = GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba, 0x0a,
>> +				   0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee);
> Missing include.
>
>> +enum amd_x3d_mode_type {
>> +	MODE_INDEX_FREQ,
>> +	MODE_INDEX_CACHE,
>> +};
>> +
>> +static const char * const amd_x3d_mode_strings[] = {
>> +	[MODE_INDEX_FREQ] = "frequency",
>> +	[MODE_INDEX_CACHE] = "cache",
>> +};
>> +
>> +struct amd_x3d_dev {
>> +	struct device *dev;
>> +	acpi_handle ahandle;
>> +	/* To protect x3d mode setting */
>> +	struct mutex lock;
>> +	enum amd_x3d_mode_type curr_mode;
>> +};
>> +
>> +static int amd_x3d_get_mode(struct amd_x3d_dev *data)
>> +{
>> +	guard(mutex)(&data->lock);
>> +
>> +	return data->curr_mode;
> Are you aware that the mutex doesn't really do much here, as soon as it's
> released, the value can change again?

Yes, that's correct; the value can change again. At least it uses the latest
one, while simultaneous writing is ongoing.

Thanks,
--
Basavaraj

>
>> +}
>> +
>> +static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
>> +{
>> +	union acpi_object *out, argv;
>> +
>> +	guard(mutex)(&data->lock);
>> +	argv.type = ACPI_TYPE_INTEGER;
>> +	argv.integer.value = new_state;
>> +
>> +	out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID, DSM_SET_X3D_MODE,
>> +				&argv);
> Since you need to split the line anyway, I'd move the second DSM to the
> second line.
>
>> +	if (!out) {
>> +		dev_err(data->dev, "failed to evaluate _DSM\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	data->curr_mode = new_state;
>> +
>> +	kfree(out);
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t amd_x3d_mode_store(struct device *dev, struct device_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct amd_x3d_dev *data = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = sysfs_match_string(amd_x3d_mode_strings, buf);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = amd_x3d_mode_switch(data, ret);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t amd_x3d_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct amd_x3d_dev *data = dev_get_drvdata(dev);
>> +	int mode = amd_x3d_get_mode(data);
>> +
>> +	return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[mode]);
>> +}
>> +static DEVICE_ATTR_RW(amd_x3d_mode);
>> +
>> +static struct attribute *amd_x3d_attrs[] = {
>> +	&dev_attr_amd_x3d_mode.attr,
>> +	NULL
>> +};
>> +ATTRIBUTE_GROUPS(amd_x3d);
> Add #include.
>
>> +
>> +static int amd_x3d_resume_handler(struct device *dev)
>> +{
>> +	struct amd_x3d_dev *data = dev_get_drvdata(dev);
>> +	int ret = amd_x3d_get_mode(data);
>> +
>> +	return amd_x3d_mode_switch(data, ret);
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(amd_x3d_pm, NULL, amd_x3d_resume_handler);
> Add include.
>
>> +
>> +static const struct acpi_device_id amd_x3d_acpi_ids[] = {
>> +	{"AMDI0101"},
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
>> +
>> +static int amd_x3d_probe(struct platform_device *pdev)
>> +{
>> +	struct amd_x3d_dev *data;
>> +	acpi_handle handle;
>> +	int ret;
>> +
>> +	handle = ACPI_HANDLE(&pdev->dev);
>> +	if (!handle)
>> +		return -ENODEV;
>> +
>> +	if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION_ID, BIT(DSM_SET_X3D_MODE)))
>> +		return -ENODEV;
>> +
>> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->dev = &pdev->dev;
>> +	data->ahandle = handle;
>> +	platform_set_drvdata(pdev, data);
>> +
>> +	ret = match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
> Add include for ARRAY_SIZE()
>
>> +	if (ret < 0)
>> +		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mode);
>> +
>> +	devm_mutex_init(data->dev, &data->lock);
>> +
>> +	return amd_x3d_mode_switch(data, ret);
>> +}
>> +
>> +static struct platform_driver amd_3d_vcache_driver = {
>> +	.driver = {
>> +		.name = "amd_x3d_vcache",
>> +		.dev_groups = amd_x3d_groups,
>> +		.acpi_match_table = amd_x3d_acpi_ids,
>> +		.pm = pm_sleep_ptr(&amd_x3d_pm),
>> +	},
>> +	.probe = amd_x3d_probe,
>> +};
>> +module_platform_driver(amd_3d_vcache_driver);
>> +
>> +MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
>> +MODULE_LICENSE("GPL");
>>

