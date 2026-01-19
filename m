Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012062.outbound.protection.outlook.com [40.107.200.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1602F6931;
	Mon, 19 Jan 2026 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768856442; cv=fail; b=ts6Qg2gHfBn4FKft5GgkickVHH8jv+7oh7dhccxy9yzZLsH2wGEmNVH+mV4SCdauaNxRxLCFUF++qqTbXY90R5LQaqBRDzHX3L76QNEFLAgVCrIi9B4pX1NlkZq1j3FAhB9+Gu98TojdYKM18QC1JtZyO/WKGqLJp9vx22D9HKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768856442; c=relaxed/simple;
	bh=HJuhQuPvf1zGBdGW903fB0H9LJimrE4lVr7tRA1E+t8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I9kBzw+S+zuzAEIOTXaaWzoPNrR/YVSA9AR3ucNmDpk6vuYlTYBD0QYL0zKJvtk+O4zJtvhJPHBVsYTUvsyvoq0vHrTj6ZF/FXtFD1jEEif6WKVk9z4VSsU5ZW6hyO2KfufiBVjMMCjYpoXOn6RsRT/fj90h35+CMkFj1EyrCzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QgbWxnDu; arc=fail smtp.client-ip=40.107.200.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QgbWxnDu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzODP7hwnoPpjjEhzzcB/xFo8P/hObdeqEgwhCV9X5WL9EdTSm7CcgRQj1Bsf2HaXhKHYAH9qtie3gMHiyquKIxu5hDyRpORUYCOAh+QghEexzCgXym6JjmKhmjosw2nAwFsP7N96yTWXHOL8UQznapoAbC3kTgBruIefJbie7ZbDrGfRyVAIc2U6phgEcE8gTZXrBZn1YbZuLLj/ysavgJzBucyYnlM1PZ0iSEZi4mnaxQtofvsmBmlX+Dqx/sc4fV3CLjMSt2Q6ZvoCBu57p37067r9C2vGNAIkvyOlm8pqeI8CwQJLwVqRJHVzrK4mH9j1bc5d9HZ0Z3u/LlCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWz07dzHh2rvieZJ4iVFikfEtcEgshBvYsIbbbRUZA0=;
 b=eTXfuRFqTWAVvohR92DZ/CyjUR7LLnukWUd7B3iY3IqWf/7MdA2yJQcRKj7wc5YZmkkRyCuV2R+PDzNKBZn5BpjIcPBJG3aNNt/2fLOCl2rHvFxaQfh9mEsFYf/SJXlO0sg64c8d6HtSdXU142J1mvNifUORA+j/HNXdA8MIbt2dTDA8gHyzJqKuo1DADHVh4TDnDo3A8xmzV4v6SPwPh6Sf1AzOpQteT0F6vCELD26/FyB6y6f1Cxx/eg2TvwNr2tJXLB5nviRqrL7H+JWfSQXbDKXLZLrrBfAuQ3gX010sVKF1HLs+OA/HEYbrv+gHpMGK09u9xqEFoG4o7Kkb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWz07dzHh2rvieZJ4iVFikfEtcEgshBvYsIbbbRUZA0=;
 b=QgbWxnDur7OYrBZvUjtyvHcyzO3n3hFy9jAO78exlRTKzFiUakD+CWRS+FBI723Mg3PhMYaLFaPzyclo52DLx8uHbiPe8dNHwL7Nj3QLUHZqvFXuMKZCp8ypGgWuD8tNhQFFbUjXWPXhHxD7xQv9zlhnDQTAqp9rXMEXEBVVANg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 21:00:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 21:00:38 +0000
Message-ID: <a5f992bd-d4a0-4f01-b5a6-61f7b5dd5d46@amd.com>
Date: Mon, 19 Jan 2026 15:00:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/amd/pmf: Added a module parameter to
 disable the Smart PC function
To: Alexey Zagorodnikov <xglooom@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20260119202100.785129-1-xglooom@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260119202100.785129-1-xglooom@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:5:330::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fdd55e5-9335-440c-2768-08de579dcc5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z09DSjArWVpITVVsOHVFNW1jSXZBUmcrU3EvQ1AyWTRwUHlzQklwSHpQMi9F?=
 =?utf-8?B?MlhYTzVGRFpYeEZXenRsU0R5VmRLY0FIKzhuVW8zYTMzTUw1dEtlNVhFNm5J?=
 =?utf-8?B?L0RnNllvNTk0OUp2N2tneXRwUm9VRGVXZlFBVEUvOTlVaWJid2R5SnZuZHBt?=
 =?utf-8?B?OFlmUzlER04zWGFWQysweDNhdVFsTUNRUHQxYVh0Q1FsZFJTdFZ2SWlPOFpS?=
 =?utf-8?B?eDNKaGZwdGtwbTFLS1k0SXFvenNJOFQ2dDI4bnI2L1lXclhVRVNXTFdvR01x?=
 =?utf-8?B?eUtIZEdqS2RjTjRGTiszUmcyNVo3aUpGSS9YL29vN1JOYlB2S3JyWGZiZVRF?=
 =?utf-8?B?TnlPZy8wTFFSQmg2RkxNd1R0SW8vcU5ZZGFudDRmeE5EN05WeCtZMWZrUG0z?=
 =?utf-8?B?R2FnZ1Z0ajFvcFh4TDAyZ1hOTy8ways5VFhOdW5wQ0YwS1NacGQraTBwWng4?=
 =?utf-8?B?N1dDRW4zVHhINzdYK2R2dUNsTXl0cE5MU25wTHVMZ2U2UnVEZVYwcnkya1dU?=
 =?utf-8?B?OGxOSDU0UmxZbnAyaXgxcVV5M2dtSkx1NHB2UzlQa3NaYTl0azRPVU4rczdB?=
 =?utf-8?B?enNMZjZLcEhPQ2hSRWVlV0JPQWxPYVhESHFSVHdWdFgyazhwUVRsTjVRTFVC?=
 =?utf-8?B?MnpSV3d2TW85cDZYVjBVaGdERUtTY0Zha1J5WFp1bXgxZy9DVW9PL0ZMa2NX?=
 =?utf-8?B?aXY0ZFA5d0RMaytCalY2MC8rN0M2eG9rL0Y5eGYrNVhzSGpSTmQzNHBuN040?=
 =?utf-8?B?UnhEZzdoRzdSbURIWk5oZ3YxeTcrNWc5RFFKRTdndTZUS3lCbTZIOEkzZmgy?=
 =?utf-8?B?SUhCcko2ckk5UzV5TThWQ3A1K2VWZWRwMXZOMjFjT0VLclNvRWZMVlp0azR3?=
 =?utf-8?B?V3dSVWh2ZWs2enVWbjdxSlJ6c0pyWXJTWFA1TUN4S1NJM0hTK0k2VUo1d0kw?=
 =?utf-8?B?MTdyalVObHlBU3pEU0hNUlU4Q2o0VTV6UEM5UnNoQkNuYXg5OHlDZWt3WGUy?=
 =?utf-8?B?RTlIS3VVWDRDVGJNSjdES3NyMlkyTzJTQW9KVUJpMllzL3BDbTE2TGthNVpU?=
 =?utf-8?B?V2l5QmNQMmovRENVMzNvVmFCT0ZzNXZKMEQyVjAyTGRESzYvZUhrTC9UVklO?=
 =?utf-8?B?bHFQZlEzbWtQSnFaTldVMU1KUXFrQ1VHNUpveGc0TVprbURKeisrcnJuNGcz?=
 =?utf-8?B?YVlVdHYvYzBibmlwa3p0dFVSWEhveHpiZHJlZjFXM2FudTZlazVwUGc5Y2Vu?=
 =?utf-8?B?WWVQSWVmelBsK2Q2WmxHWmk5V1pYcS84MjArL1RYR2pXeVBqaVREb2lpcERl?=
 =?utf-8?B?UVI2MitmZmY3WmF6WE9xV21VWHpKaUh1Q285eVZ6M2J6dDhjZmtpQ2dQSmNP?=
 =?utf-8?B?bjY2MUZuMENiY0RadU1vSG84cXd5R3pzc3QvRG1JaUZLd0F6eS9DZ0FhK25t?=
 =?utf-8?B?QmorNDVtZE45QjExK0c2MFN4N0dSdzJtb3F3cWdCRlpCMk5LYkVPbHdneTZL?=
 =?utf-8?B?RDlTS1BBYmNvWHVMaHE5czRNVHFKY0lKck92cFNoYjJuQnpTQ01uU1N0SnBM?=
 =?utf-8?B?KzBsQ0pjQlFkRUNIaGNGTDh6ZitOM2hZaVJ3MXVMdjkzVzlQc2pNZkUvRmxo?=
 =?utf-8?B?bzFPTDFOaTV4cFg5OWJJZGVVRGlnTkpmOXU5dEY0eFlBU0lNQUpKWTZjRlgr?=
 =?utf-8?B?aFM5a3ZsblFHYld5Vkt6ZW5MMUh5MHVuQjF5dmpTUkhNZjI3U09sandGclpp?=
 =?utf-8?B?VFlQVC9NbXNiRTViNWhodWZYenR0QTZJdWRUdXVRNHpxeXlxaFhHbnJCNzVa?=
 =?utf-8?B?Z1hscnBTZUNieUJrbERESFNIcjZ2dTlHQUhqOHRJNTNNanJteWNHbjV2Z1lB?=
 =?utf-8?B?Y3FnR0VIcGZFUE9hdkVuZVVhdVpUdWhEUjdTajVNSzVmNEdTQmJxWEdOUG5C?=
 =?utf-8?B?VzRzQUpJaFAvYk93SDJIUE50MHhhUWh2ekxrZ1Ric2RMc2NKNXJRYlJOeVhl?=
 =?utf-8?B?WGtaTTMyNEVLUHJ1Q01pV2tnTnE5cmN3UUUvRFJSTFRpVEswMjRidUJadVUw?=
 =?utf-8?Q?7/j1Hg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekgxNkR2ZElkT2Y1ajBKZ3JNVWIvOUhDVzlnZTRHWXF4YjBtbVdHTTBzVXRk?=
 =?utf-8?B?TUN2enBmL2wzeUxNRUoyMmJBa1FYT0hKVGplVW9NTGxWcDFOaVpTK0lqR2t2?=
 =?utf-8?B?UU5TcWhWemlyWStUa0FONXd3SkplOG8xY2UzbjJZdzRrWmRZTndOdlROUEVn?=
 =?utf-8?B?amMxSHU3QkRRSWFqc1dBTlFLdnAycTMyRUFUcnF5SklFdmR1bkxvQU5NZFZK?=
 =?utf-8?B?c2R4V1orWk5JNERXck1PTmZJLzJtRjFqclpzWCtXM3p0dFF0eXBVWmJJWmZT?=
 =?utf-8?B?R2VFM213ZklXNDBJVXI4bWF4b29xdWswQkRkKzZBSmswM2RTdndQdWs1YnB5?=
 =?utf-8?B?eXU3LzBjWllwTWVhWFJza3dzRHhVR3ZWRG80Qm00d3hHK1kvNkVXbUVTV1Ba?=
 =?utf-8?B?L3BNMUNtU3V3QlhxcjZYdDZOcXdvN3VCZGVyUzJRYWVRNDV3RjYySnVtYWpU?=
 =?utf-8?B?aDBQREtFaTBpdCsrb0k5dVU3Tm04VHQ2cm1kQXBrK3dMV0FqMjM4c2FEOC9l?=
 =?utf-8?B?eklHcjlkMnJpV2dseTNjSjl5dGIvM09kTEpzWmJLcXBXRzBhOXc4OGdWeHZV?=
 =?utf-8?B?bHVJWVhwQUNjb216cHZYNnJVY1FHU2pyeFVjakEyTE1ZckVodXM5eE9kK0tN?=
 =?utf-8?B?SjZsRU9tRTI4Mm5ac3BtNEYrQ0JWZVFtdGFnOGhpSGE4Q0xHWWlCTjhVOW0z?=
 =?utf-8?B?L0RvNFB0aE5hWkU3cE83Q2JtSFBTbkV1emR0N1pxZDRyUUVQUC9CcnB0dm01?=
 =?utf-8?B?aXl3NkVHT01pNFBMSTh1MW5uNFhPZi9ndmJYVEJRYzQ3amI3NTlwR1VpSUwy?=
 =?utf-8?B?WitPN1NXem1Idm1uL3lQZEZMSkZPbGlhV2l3aDBHM3Z1dXl4MitLZzVESVdo?=
 =?utf-8?B?VWdSRTI3VWtxSVJkRzZBOXlUbDk3SEpUVmtTQ0prbGdYOXd0ZEsxVm0wTVR1?=
 =?utf-8?B?RUxSeWhNOFJrSFhhdkpoUUlIVm4wMVFlTDVqWFh6S0E4Wm1naHhkRVFqSVIr?=
 =?utf-8?B?RHdlaWU3VlZyRUxnTDIyWjREL2pNZjVnYWJreWJmaDJGZFBETWpnNlFXbUpY?=
 =?utf-8?B?TGhOeGVRK1lHaVRNakkzTFpxb3c1UjBjM1BIREh6Q0kzOElGUUV1NHBpRlIw?=
 =?utf-8?B?REpzWU5UZmxNRzJ1THBtQ3JnY1VOVmgxUWxkVi9ybFZxMERYZDl4YmJsSWQy?=
 =?utf-8?B?MjhCREpZMjNnMG5yMEhQVVVUaFQxWDZQNUZPWk5kVE1ESUdFMnl4YlNOVnVi?=
 =?utf-8?B?dTRrMVdHejhLUGRQMEJJSFdsMmExcHVydmxNaGpDTXFsVzc1QkJaNm02STBl?=
 =?utf-8?B?VHNyeW04eG5nS3JOc0NEN0I3UVk0TlFQMnFUZFlPc1d5dzBhbnl6UHdXSFJt?=
 =?utf-8?B?U2ZlRkNPRG1VNDF6V2ZiNGM4TG1CQ1ZBVWoxQzNNdWtCejRrTVhxbERYZ3RS?=
 =?utf-8?B?ME9WSEZpTTFaa0VvSEFWbDVsK2ZudDM5TW9pWnFjc3NWMXJpbnBWTnB1ajNO?=
 =?utf-8?B?R2lTUGRuNHJlNzdva0pyQTUybG0zNVJOMW5zL0g2QXR4bDRHU3JzNFBLRjFR?=
 =?utf-8?B?YlhFbEZ5NHZwZWhwTVVodzdJVTBXYnk5NFdHSmV5ZzMydmZrSWhhR3lDYVFq?=
 =?utf-8?B?MXVhRUFhalNCSncxUklvSHlrc3ZIaFdYK2tnM3RQWXhYUkh0eXBnNlFqTm5W?=
 =?utf-8?B?dnREU01zcE5tZndlTHZMZ3lvVHlVU1RvR2svOUJKaDlRcmJNUkZtZGRqOGNt?=
 =?utf-8?B?STY4aElLVzVtaXFRTXNIRFU1cjJNRVlueitteUcrVmNTN3ozaDNURC9pR3Fy?=
 =?utf-8?B?OS9za01uUmdMS3VQSzFNR0ZnOGFUSkRBV2JoSUJRZ0FmYm5zQWdvTUY3OWxK?=
 =?utf-8?B?NUtSRnA4blMwSCtRMlM5a1JMK0dkcTlvOWVFMzVBK3p4bXNvd1dYN2V4N2ho?=
 =?utf-8?B?TDgzQjA0QlVIV0ZlRTlRcURwOFVvSmNtajJVb0h1QXJ5K00vM3hqUWZxK09i?=
 =?utf-8?B?SVdqZzAyS3ZqWktHRHFpRTkwcVBWVGYwUWJXeDc4NGxlZ1g0NVBacFg3Umpj?=
 =?utf-8?B?QjlISVVVdDV4VnlHRFN3Z3VFdUxUUEFwNXhKOWlTZUM5SUtOV0RUM2hiUVUw?=
 =?utf-8?B?MHY1L2l1b2wrR2tjZGtQNHNtRnZITlNGZ0FreWdRaERwZWU2YjE0SzVPLzlh?=
 =?utf-8?B?cGczdThIVVNNc1VnT2xsdGVTV25xWFpNbi9FM2YxL1U4SGJPd3dRbVpIeGVp?=
 =?utf-8?B?d0ZLeXZ2WHl4YUpwZmwxeXJpRVA5YmoyVlpaaC8ycngvZ01XV21YdGZKY29O?=
 =?utf-8?B?V1F6cW54VU45aGVzcTJkY1VKZHpxOVkxa3FGSGxRZy8zeklDdzZTUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdd55e5-9335-440c-2768-08de579dcc5f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 21:00:38.5589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuJw0auFAKYbXDHrCySEXmGlIRjdmz9PyiDBUFVg98k96pCDZHwFMGve6VA9X88I5RFPD8kfzEc9iM/G9QIxrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716



On 1/19/2026 2:20 PM, Alexey Zagorodnikov wrote:
> Addresses a low power limits issue on HP ZBook Ultra G1a
> https://gitlab.freedesktop.org/drm/amd/-/issues/4868
> 
> If vendor firmware capped APU power limits with 3rd-party AC adapters,
> the user can disable the Smart PC function via the module parameter
> 
> Signed-off-by: Alexey Zagorodnikov <xglooom@gmail.com>

You should use a tag instead for "Link:".  It would look like this 
(assuming rest of commit text was OK):

Addresses a low power limits issue on HP ZBook Ultra G1a [1].
.
.
.
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4868 [1]
Signed-off-by: Foo Bar <foo@bar.com>


> ---
>   drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 8fc293c9c5380..00a4fc899c727 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -53,6 +53,11 @@ static bool force_load;
>   module_param(force_load, bool, 0444);
>   MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>   
> +/* Force to disable Smart PC Solution */
> +static bool disable_smart_pc;
> +module_param(disable_smart_pc, bool, 0444);
> +MODULE_PARM_DESC(disable_smart_pc, "Disable Smart PC Solution");

Totally a nit/preference thing but I would think this is more logical:

static bool smart_pc = 1;
module_param(disable_smart_pc, bool, 0444);
MODULE_PARM_DESC(disable_smart_pc, "Smart PC Support");

Then the code reads the common flow more directly

if (smart_pc)
	//probe
else
	dev->smart_pc = false;

> +
>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>   {
>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -362,11 +367,15 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>   		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>   	}
>   
> -	amd_pmf_init_smart_pc(dev);
> -	if (dev->smart_pc_enabled) {
> -		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> -		/* If Smart PC is enabled, no need to check for other features */
> -		return;
> +	if (disable_smart_pc) {
> +		dev->smart_pc_enabled = false;
> +	} else {
> +		amd_pmf_init_smart_pc(dev);
> +		if (dev->smart_pc_enabled) {
> +			dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> +			/* If Smart PC is enabled, no need to check for other features */
> +			return;
> +		}
>   	}
>   
>   	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {

