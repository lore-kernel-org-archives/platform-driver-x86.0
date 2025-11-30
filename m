Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EC13B2A0
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Nov 2025 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764519276; cv=fail; b=MrZ5W9SRvGQMxjxrlIqW0rsLPOgAvnTsfzvkiapacxRKoUl8rNUXJc3v3xt50AEAxZzIaEE9lTIBYXAmztesBoiVKrn0qdCU/nFhRBA+Tz1KZ9zCHuhVXyjty8VI4yfCsmB2MQoJIx43t6zJz3uhhwB0/2C4kqhpuHTecG8/Fw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764519276; c=relaxed/simple;
	bh=yIowiqKmNQ54ijN92ZIXy1YNX34yt5TxFTfqtIA7ePE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T1KWmo8cbMLaSKlIr8tNNzlDqHg6OH6rJ49qRTOx57FdKwFtIy/5MjvXNOPRbZWyu1syr6uaKyD5f2CiZKZyHNCtYqgdfgY9KR3jC22KUE77QnYcUbU7au8vIlC2fi/yEZMC+ZAHeY0erjjJz7+YFPU5VJQnLEBIIg956i6T8mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RzwFch8O; arc=fail smtp.client-ip=52.101.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RzwFch8O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUXkQi7GHZa7Fpi3xtiUF2n/xdJx0hjCT/rYXmi/ImLGXfYxoD4CrfVucRW9yW+gZpy0elGqtfp8aA8yFbKVviTlwEpP67unbNsXNHqKqrvDKKRJwct4cuuLnn9ghUx7uwlLOZu/cBNpTVzrUzHZ67xPJE4Iigvc6IG5mbxKYDi1Sf1Mj4KfqTYO3KoyGu7pyaP67g92lwYGBLm3XoE6Jia1gMiLxRuFnTOfqs4zVldg209BeLnC3KCPNxe2n8TrQoughJ4Q2FU798GVcwZDeiGUh08zom0uu9bmgx4a95Pk4z8FmD4rH2GSC6vaPPy8WADEjS8j1bc6ZHBBjVX7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXD7uHjn6m6LS8F/owkzSvSaYrNbOgWC6PyUiUwDqxw=;
 b=HqKV1ruUpboxES8fhGVtMIDQmsrdWms62pAwuuup0gE9cbOThV5A8D7MzZgKrL0W02i5xpAHhIDSOQlkCVVQWus1lONGb1QKrIFi9/b+5meNqVBmDwYSUsV9MFaDm0sZatV4EcylVhhZpuCUNbXhmC7D92ZamJMvPTGdJDkp0QWkh1uiAXbPHincSCoiUpqNaPWmXJ3+jL/cJ/5phuAzoiWsE6+D6iLNSu33b7IXUGM9sufa6ZFkMNAb/h6XCHDL8d4U/2KFIITbv/4TWARqSjFPsQDdMAuiWJ/D7aSbZd41vqzWU1VAFqsoUnR4J3n/x/ocT3Ntk1/mDpne/m+XHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXD7uHjn6m6LS8F/owkzSvSaYrNbOgWC6PyUiUwDqxw=;
 b=RzwFch8Ow+B/n3S7zAMTZ1uwYwAbxfqFYEaQ/E1xeqSTrRpkFENAE3npFAPQU2WW2BvnxdMl3DLwxsajmM3PIbS2xhvjPHww1e17I+8D6DmOsrJAzvt05h2PAA4HqT9uEn3EKfqPk83JJ0DA0ypNQoyqnIctqbDRftGhSEPwy2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 16:14:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 16:14:30 +0000
Message-ID: <1fbe317e-a103-4920-a0fd-b6475b0bb6b4@amd.com>
Date: Sun, 30 Nov 2025 10:14:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, Mario Limonciello <superm1@kernel.org>,
 Yijun Shen <Yijun.Shen@Dell.com>
References: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com>
 <20251119085813.546813-3-Shyam-sundar.S-k@amd.com>
 <9f30b9ff-5f27-68c3-9bc1-4bed9fe0bd89@linux.intel.com>
 <80e375e1-0b6b-4c2e-bc5c-7137eb35a8bb@amd.com>
 <0741ec72-f948-a499-fa8c-042dff826871@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0741ec72-f948-a499-fa8c-042dff826871@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:806:120::27) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6a46a6-f8d0-4f26-a6e1-08de302b8a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXJtK2UvSER3aktZL3pRRWxrbyt5Njk4MFBlYWJ1elp4OWpkSlY3OWpKbkNI?=
 =?utf-8?B?OWp6eDhzUEZvaHlkZ2FhM3c5UExVQjZnZFY5aVIrWHdLanRTcm1EWDNZVXZq?=
 =?utf-8?B?Z2k4cmllYVJCTmFHd1ZSOHRyZW1IT2lxbDNDOXVpZEJCSU5mb1A0SStwaDJD?=
 =?utf-8?B?RXJ6d201bVNON0hhb1RRQXNzWmJrTFE0dEFaUTlKYnR1bVdIdndwREhKOUN0?=
 =?utf-8?B?R1M2RlRjRWY4ajJPeldLKy81QjlQTElFN3RiTHlEUUNrdTIyYS82MDc4YTVK?=
 =?utf-8?B?blNOYWJnS3drR3hiKzRNNzVqcEV6MHhGejV0ek5rMm4wRnJuTjJNK1BqbHg1?=
 =?utf-8?B?WDRqWWVub2kzMVVIN0dZSVJlNjRVMCsxbnEwSW1VUHZsbEVxV3hnb2hLemta?=
 =?utf-8?B?Q2EwZ05tdE93ZTcrNnJWem1GTDhxOWhQVUVINlVNOHM5ditHc3VkQ2RyZWFZ?=
 =?utf-8?B?SmxudGhKdEp3WDJzcSsyQnVRV21qVjdCczFYV2JCZkVaSUNya3RkWXNvQlRt?=
 =?utf-8?B?WjRJQnF5eDVGWDJBakE4emMxMmcwcU8wTG9vWDBwZ1RkaEdUWFUrc2gyNGhF?=
 =?utf-8?B?OXJHeUdhdmRNTUpDOHZMdlpHMTcveXB6L0NEM2JGRE9GV0tkaExFZWpyMncw?=
 =?utf-8?B?YU9pVk9IRms5SWhXd3RIL1Q5aGdZbkNEU0RFU0NMYTd2bjZFMXNDSGYzbkp1?=
 =?utf-8?B?NEVLcVNJc0JIRTlwZ1ZWWkgzQ2puMHJBcVVVSE5Hd2I2WjlKaEMxTUtxMTly?=
 =?utf-8?B?Y1h5Uis1QjJnM24xekdNcERTc3IvTmVIM1d3cTd1TDFjdmcwUVJaeGRRdWdz?=
 =?utf-8?B?WEZXZ0x6bzVFREl1ZXlBRHVnNmFmdTMzNTZtd05FNndEdTJVTzFqL2ppOEhF?=
 =?utf-8?B?K1hvWXZ4NmlvUlNVV0txTXNqOGxDdjd4cHp4aWh2MnZXVVhqb1NCMHpkRyty?=
 =?utf-8?B?N1NuQ3Z0NnNhcWlleW9HbThRbytzbjA2c0twOEp5dEJMUVVZbnNQNzBJd2F5?=
 =?utf-8?B?WFN0cHZYUzZMNE02MzE1NnFoM3R6MzlqQkVwYjZKOW1LRWRDT2ZtdTFPTkt3?=
 =?utf-8?B?U003a0RnWXRkRkxjVkxqVDJhRzJLbWVPc1FZekk2dlRBZ0h4VGxNVHNCUWZG?=
 =?utf-8?B?OEZQMnpFeVNqeXlodWREYnVROE45Z0ttZFFZcW9NMkZ5V1hpSEsyTmh5bG5n?=
 =?utf-8?B?a05CcnV0ZjZBRGVwaHhQTkIybnpPaERkUmZvU1h6Q05CSmEvdGpFdzU2RUVI?=
 =?utf-8?B?NDRXcnZRSVErYkFwYzdFWEpLVUdRaWErZi9SbVFMMGgxNThLZnNOaXoyNDky?=
 =?utf-8?B?V2tDb0hlWXhOZnhDU1pFSjg2Rzd6STNZK2dOaXJVbDErdUsyM2dZQndjbFRB?=
 =?utf-8?B?Yk5pL04zaWN2NGdvc2UvcE9lV3o5QitZWDNQMFVjZmM0QzlmcmtMYk5ldXMw?=
 =?utf-8?B?TDdnckN2UHpxZTdlNmtoMmxEaC9sdi9PeHM5cXROZlZ5MWZQUWVSNmZoNUtl?=
 =?utf-8?B?ZUFralZ0TmFGSTNlNHZWR0FTcDUxT1VXY1VOMzdpbG56WjIyQWROSU5Cc3lS?=
 =?utf-8?B?bW5yNWI3aXJocmxYT3VPd3FxRll4L2ZiQlVlL253WFlBOUJyWk11VGs2Tlk4?=
 =?utf-8?B?VlFCblZYQWtFYXFLN3VzU0taUXNpY0ZTSDJFMnd6NjhlNzIwQXBiR1pwZFBP?=
 =?utf-8?B?VVVYUDI4di8xWmk5UENsbnNPOHhuYUZOVEVpVittcWtraFBKdExBM3A5YlNE?=
 =?utf-8?B?ZjNpSWFlZEhDdHl0WGkyVlRPVXVHbTh5d0VZQ2lZOTRhT2d2YUNhT1hLRWRQ?=
 =?utf-8?B?MU5xeUI2YWZnQzlmSmxaV2E3blRHblF1S21zb2Myeml6OG91ZkZhSVlDNzBX?=
 =?utf-8?B?dTE0Y0ZaUXBpTjZDUmM1Y3UvMWxQWk1vd3RtWFFSeFpmZnAvYjlKSDV1T2ZD?=
 =?utf-8?Q?prafTNRn8XmwTBPKB1hU3IKkCoCcU/wc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFpLUFpmN2RORndpMG1VYUQxMURUQm4zWHZqS3lEYm9QcDM5enc5OWNUWjha?=
 =?utf-8?B?dzlXZ25MaHcwQjFsWFFxejNDOTQzcklBcTJRM3h1YThEVzdMaDJJMjErNkZS?=
 =?utf-8?B?aUU1OWhVM1dIV2UrdUZrUWI1UUFmd1hrdnBaeUdnSXpYVThldEdhdkhRWG1L?=
 =?utf-8?B?eWZXYUFzd2xBSUMzM0JwbFV6dGFsWGorRStoNlQ4VTMzY1l3M0JIL2o2d21O?=
 =?utf-8?B?aXE4aWt0dEpZVUtaYzFIUGI4N2g3ZnEwVEJjdkVuMkg4TUF2bDh0QlZyc1RW?=
 =?utf-8?B?ZjA5K0pxSk5RUnpwNytpYWxEUU1hWkVZcEthdTBRWVpSNTYvZklkVGFmNFla?=
 =?utf-8?B?MEl1ZnpFQzBWWjVQMzRXRk4rUDVITE5GNVB0NDdrQWlEWVRVdmdUeFo2OHlI?=
 =?utf-8?B?Rk9OMkRUbzZtQjVIcFVSaTJ1Y21YSkl0a0QyRkdkL1VwR3dWZHpoMncyeFhR?=
 =?utf-8?B?YW9lclB5UW1JNys1VmNhU0l5cEtkMDVsWFEvZDhuM2tJUkcxSEVxcGNFM1JR?=
 =?utf-8?B?TFdPT21ETHVvV2ZrWnpiWjJRa1QxWkRrMXI5NjRhVFp1VVFML1VEblFqbWU5?=
 =?utf-8?B?bktNdUdqbERLM0VHeVNGN2VoVit1R2UxRmNWK2lCVWhVSXh6dnBzMzJuYW5G?=
 =?utf-8?B?UWxwT1kySElLdXgrNktJeTRvdGJLMW9pZXk4SHNHRnNXeWphWXJzQmpBL3RM?=
 =?utf-8?B?RlJsMG13UjU3blJjc2poQ3hrOFBPMkZta1NhbEZIMytmazBGL01qdDcwT0VW?=
 =?utf-8?B?dW9IMGJwWE5MdjRQZTNGVEFQZm1QTjN2cGEzenQ1UzJJY2VWaC9IVU00aStl?=
 =?utf-8?B?aW1PUGhnSkxnWGZqN2ZZanR4dmIxZTdheHRhb0cvdFoyTEYvQmJybFV3emNF?=
 =?utf-8?B?ZXRjSUN3V3pBakRxMndKeWlSTWRyZVVIK1duZFpXazZ6Q21ldVFOU3N4VUNo?=
 =?utf-8?B?bTBuTG9CUFFvL2orakszWUZvZDBucm5JUWtEY2lOTWphamVKODdYNEVXVzVK?=
 =?utf-8?B?VnhUeFZvZ0NJMjZ5d0JyMlpJSW9Ka2pDdXMrbE05RXQ3a3JFVXB5aGtOOEV5?=
 =?utf-8?B?RUk0MWFwanV5dWR2RW96TW56UjNqNHE4V0grUGp4d3BPZmJuTmIyaVZCczha?=
 =?utf-8?B?VUpNUGNaOHNxbklYeU1LbzVNeG9WR216YzhkSXpMUi9HaDQzRTdpS3ZmSDUz?=
 =?utf-8?B?alFBOGgyNEw5aUxrdEVHaktrMFZRY2NaT1FKRFRyY01iMHV2R1JzdlZtbHV2?=
 =?utf-8?B?QVNFS0dxNTB3VjgzYWl2VFZGZFh5d3lnMU5scmQwZ0NlVWlMZ3BTY0laYVhm?=
 =?utf-8?B?SC9zNDl3RTY0aysxNVhOK1dqTmtQd1pEb1l6Y3ozbzZ3NlZqSy9wWGpiazAv?=
 =?utf-8?B?dEdtYm1UTExLbzBFbDJhNk5HSFRZV1c2NmFYRGVsZ0JaWW9wUllIU0NKNXVW?=
 =?utf-8?B?TUd6TnVwcTBNSFgxNzVtSGpiWHpEMG5NV2RESUlCbDhSNnZBck9ZWG9rSThk?=
 =?utf-8?B?MHk0L0hJZ3lwNGxhdm1pMkJ6ZFJpdDNVMFhrQmFIaVNZZVFZRCtmRW5aVTQ1?=
 =?utf-8?B?ZHFESDR6emkrQXpHYlBxTEk3UFZ4L2JuWnc4eHlJT3ltamRjSi9mblJBaVhQ?=
 =?utf-8?B?a0xsUHMrRThmc000YmhncC9YZmNicWYvSWFYeWo0VDI5VWdqNjZnWHFIQkU4?=
 =?utf-8?B?eGt4MFd1MjNCWlpSdU1KYmRiN0swbjFweEpuVzRldHFvSmJqU205R2NnenFL?=
 =?utf-8?B?Y0tWb0Nyc2twNVRHL2RRZnRuRlNEQ3VJRllaNEY3UHAxM3dBZ3paekt2OFpC?=
 =?utf-8?B?bVVoT1cyWTBiczdveElDY2ZDbDdyaXkxNWpEVTNKQnhQb1pNYUFlYkY0U3p1?=
 =?utf-8?B?aHh4b0cyU2JjRDVhdjVaVGp2ZVNJdGpJWkhDeHpkeWQrRzN4Qy96QnE5K2Na?=
 =?utf-8?B?cTF3elhPc09uaEYzaEFWMDFXKzdNMlMvY05tNmdBOFNndndNMWRvakJYV0JG?=
 =?utf-8?B?N1hzRTQwcVBLUnhFZFg0Y05LY0JqV3ZIM3ZXa0V1a3hYVTR6N0dPbVBweGoz?=
 =?utf-8?B?bnVQSGRJcVNTWUhkSlJDSWdPbkZJZThRZlVqSlFpL3Y3VkVmTTFyaXo5Q3hh?=
 =?utf-8?Q?mCu8r9HWPkU/kYTF/hAe0QNEc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6a46a6-f8d0-4f26-a6e1-08de302b8a68
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 16:14:30.1901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMNNE8pw7ojCCzXA73f7uk9tjTmkJZLi7RAEAELjAvghNDuDC1MDYTekG8ncnYQYYeAGAnvNVGI8Om/GYetqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880

Hi Ilpo,

On 11/28/2025 03:48, Ilpo Järvinen wrote:
> On Fri, 28 Nov 2025, Shyam Sundar S K wrote:
>> On 11/27/2025 17:39, Ilpo Järvinen wrote:
>>> On Wed, 19 Nov 2025, Shyam Sundar S K wrote:
>>>
>>>> Custom BIOS input values can be updated by multiple sources, such as power
>>>> mode changes and sensor events, each triggering a custom BIOS input event.
>>>> When these events occur in rapid succession, new data may overwrite
>>>> previous values before they are processed, resulting in lost updates.
>>>>
>>>> To address this, introduce a fixed-size, power-of-two ring buffer to
>>>> capture every custom BIOS input event, storing both the pending request
>>>> and its associated input values. Access to the ring buffer is synchronized
>>>> using a mutex.
>>>>
>>>> The previous use of memset() to clear the pending request structure after
>>>> each event is removed, as each BIOS input value is now copied into the
>>>> buffer as a snapshot. Consumers now process entries directly from the ring
>>>> buffer, making explicit clearing of the pending request structure
>>>> unnecessary.
>>>>
>>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>> v4:
>>>>  - Do not store local copy of the ring buffer
>>>>  - use devm_mutex_init()
>>>>
>>>> v3:
>>>>  - include headers wherever missing
>>>>  - use dev_warn() instead of dev_WARN_ONCE()
>>>>  - remove generic struct names
>>>>  - enhance ringbuffer mechanism to handle common path
>>>>  - other cosmetic remarks
>>>>
>>>> v2:
>>>>  - Add dev_WARN_ONCE()
>>>>  - Change variable name rb_mutex to cbi_mutex
>>>>  - Move tail increment logic above pending request check
>>>>
>>>>  drivers/platform/x86/amd/pmf/acpi.c   | 40 +++++++++++++++++++++++++++
>>>>  drivers/platform/x86/amd/pmf/core.c   |  5 ++++
>>>>  drivers/platform/x86/amd/pmf/pmf.h    | 21 ++++++++++++++
>>>>  drivers/platform/x86/amd/pmf/spc.c    | 32 +++++++++++----------
>>>>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>>>>  5 files changed, 86 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>>> index 13c4fec2c7ef..3d94b03cf794 100644
>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>> @@ -9,6 +9,9 @@
>>>>   */
>>>>  
>>>>  #include <linux/acpi.h>
>>>> +#include <linux/array_size.h>
>>>> +#include <linux/cleanup.h>
>>>> +#include <linux/dev_printk.h>
>>>>  #include "pmf.h"
>>>>  
>>>>  #define APMF_CQL_NOTIFICATION  2
>>>> @@ -331,6 +334,39 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>>>>  									 req, sizeof(*req));
>>>>  }
>>>>  
>>>> +/* Store custom BIOS inputs data in ring buffer */
>>>> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
>>>> +{
>>>> +	struct pmf_cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
>>>> +	int i;
>>>> +
>>>> +	guard(mutex)(&pmf_dev->cbi_mutex);
>>>> +
>>>> +	switch (pmf_dev->cpu_id) {
>>>> +	case AMD_CPU_ID_PS:
>>>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
>>>> +			rb->data[rb->head].val[i] = pmf_dev->req1.custom_policy[i];
>>>> +		rb->data[rb->head].preq = pmf_dev->req1.pending_req;
>>>> +		break;
>>>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>>>> +			rb->data[rb->head].val[i] = pmf_dev->req.custom_policy[i];
>>>> +		rb->data[rb->head].preq = pmf_dev->req.pending_req;
>>>> +		break;
>>>> +	default:
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0) {
>>>> +		/* Rare case: ensures the newest BIOS input value is kept */
>>>> +		dev_warn(pmf_dev->dev, "Overwriting BIOS input value, data may be lost\n");
>>>> +		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>>>> +	}
>>>> +
>>>> +	rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>>>> +}
>>>> +
>>>>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>>>>  {
>>>>  	if (!pdev->cb_flag)
>>>> @@ -356,6 +392,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>>>>  	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
>>>>  
>>>>  	amd_pmf_handle_early_preq(pmf_dev);
>>>> +
>>>> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>>>  }
>>>>  
>>>>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>>>> @@ -374,6 +412,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>>>>  	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
>>>>  
>>>>  	amd_pmf_handle_early_preq(pmf_dev);
>>>> +
>>>> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>>>  }
>>>>  
>>>>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>>> index 2ec4cb92e34f..71421a5d7afd 100644
>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>> @@ -11,6 +11,7 @@
>>>>  #include <linux/debugfs.h>
>>>>  #include <linux/iopoll.h>
>>>>  #include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>>  #include <linux/pci.h>
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/power_supply.h>
>>>> @@ -477,6 +478,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>>>  	if (err)
>>>>  		return err;
>>>>  
>>>> +	err = devm_mutex_init(dev->dev, &dev->cbi_mutex);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>>  	apmf_acpi_init(dev);
>>>>  	platform_set_drvdata(pdev, dev);
>>>>  	amd_pmf_dbgfs_register(dev);
>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>> index 2145df4128cd..5a18b3604b6e 100644
>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>> @@ -12,7 +12,9 @@
>>>>  #define PMF_H
>>>>  
>>>>  #include <linux/acpi.h>
>>>> +#include <linux/circ_buf.h>
>>>>  #include <linux/input.h>
>>>> +#include <linux/mutex_types.h>
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/platform_profile.h>
>>>>  
>>>> @@ -120,6 +122,7 @@ struct cookie_header {
>>>>  #define APTS_MAX_STATES		16
>>>>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>>>>  #define BIOS_INPUTS_MAX		10
>>>> +#define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
>>>>  
>>>>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>>>>  
>>>> @@ -359,6 +362,22 @@ struct pmf_bios_inputs_prev {
>>>>  	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>>>>  };
>>>>  
>>>> +/**
>>>> + * struct pmf_bios_input_entry - Snapshot of custom BIOS input event
>>>> + * @val: Array of custom BIOS input values
>>>> + * @preq: Pending request value associated with this event
>>>> + */
>>>> +struct pmf_bios_input_entry {
>>>> +	u32 val[BIOS_INPUTS_MAX];
>>>> +	u32 preq;
>>>> +};
>>>> +
>>>> +struct pmf_cbi_ring_buffer {
>>>> +	struct pmf_bios_input_entry data[CUSTOM_BIOS_INPUT_RING_ENTRIES];
>>>> +	int head;
>>>> +	int tail;
>>>> +};
>>>> +
>>>>  struct amd_pmf_dev {
>>>>  	void __iomem *regbase;
>>>>  	void __iomem *smu_virt_addr;
>>>> @@ -407,6 +426,8 @@ struct amd_pmf_dev {
>>>>  	struct apmf_sbios_req_v1 req1;
>>>>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>>>>  	bool cb_flag;			     /* To handle first custom BIOS input */
>>>> +	struct pmf_cbi_ring_buffer cbi_buf;
>>>> +	struct mutex cbi_mutex;		     /* Protects ring buffer access */
>>>>  };
>>>>  
>>>>  struct apmf_sps_prop_granular_v2 {
>>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>>>> index 85192c7536b8..34fff41b86fe 100644
>>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>>> @@ -11,6 +11,7 @@
>>>>  
>>>>  #include <acpi/button.h>
>>>>  #include <linux/amd-pmf-io.h>
>>>> +#include <linux/cleanup.h>
>>>>  #include <linux/power_supply.h>
>>>>  #include <linux/units.h>
>>>>  #include "pmf.h"
>>>> @@ -132,30 +133,37 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
>>>>  	}
>>>>  }
>>>>  
>>>> -static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
>>>> +static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct pmf_bios_input_entry *data,
>>>>  				       const struct amd_pmf_pb_bitmap *inputs,
>>>> -				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
>>>> +				       struct ta_pmf_enact_table *in)
>>>>  {
>>>>  	unsigned int i;
>>>>  
>>>>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
>>>> -		if (!(pending_req & inputs[i].bit_mask))
>>>> +		if (!(data->preq & inputs[i].bit_mask))
>>>>  			continue;
>>>> -		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
>>>> -		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
>>>> -		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy[i]);
>>>> +		amd_pmf_set_ta_custom_bios_input(in, i, data->val[i]);
>>>> +		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
>>>> +		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, data->val[i]);
>>>>  	}
>>>>  }
>>>>  
>>>>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>>>  					   struct ta_pmf_enact_table *in)
>>>>  {
>>>> +	struct pmf_cbi_ring_buffer *rb = &pdev->cbi_buf;
>>>>  	unsigned int i;
>>>>  
>>>> +	guard(mutex)(&pdev->cbi_mutex);
>>>> +
>>>>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>>>>  		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>>>>  
>>>> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
>>>> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
>>>> +		return;	/* return if ring buffer is empty */
>>>> +
>>>> +	/* If no active custom BIOS input pending request, do not consume further work */
>>>> +	if (!rb->data[rb->tail].preq)
>>>>  		return;
>>>
>>> I'm left usure if "do not consume further work" comment really means that 
>>> the entry is supposed to not get removed from the ring, which stalls the 
>>> ring forever?
>>
>> No. The amd_pmf_populate_ta_inputs() function runs periodically and
>> calls amd_pmf_get_custom_bios_inputs(). The preq check prevents
>> unnecessary processing when the ring buffer is empty or contains no
>> valid pending requests.
> 
> At this point, the ring buffer IS NOT EMPTY as you just checked for it 
> above this check! So no, this preq check cannot ever find ring buffer 
> empty.
> 
>> Regarding the ring stall:
>> Entries are added to the ring buffer only when a valid ACPI event
>> triggers the event handler. Once an entry with preq set is queued, the
>> consumer processes it and increments the tail.
> 
> Who is consuming them? This function? And it keeps returning if the entry 
> at rb->tail has zero preq.
> 
>> The check acts as a guard when the periodic function runs but no new
>> events are available - either the ring buffer is empty or the current
>> entry has no active pending request.
> 
> But the entry is left in place so the next invocation finds "no active 
> pending requests", and the entry is again left in place, and so on.
> 
>>> If that's the wanted behavior, does that imply overwrite dev_warn() above 
>>> can spam the logs from that point on as the ring can fill up without 
>>> anything consuming entries from it?
>>
>> Entries with valid preq are always consumed,
> 
> True, but I'm talking about the opposite case, that is, when the 
> rb->tail entry has an entry with zero preq!
> 
>> preventing ring stalls.
> 
> This returns when !preq so I don't know what would prevent the stalling. 
> Please explain (but please think twice whether the explanation you're 
> going to give is sound!).
> 
>> The dev_warn() only triggers when the buffer overflows, not from
>> stalled consumption.
> 
> Stalled consumer and queuing more and more entries to the circular buffer 
> will eventually lead to overflow, no matter what.
> 
> The overflow would likely actually destall it by overwriting the entry 
> with zero preq but that'd just hide to logic bug you have here.
> 
> 
> I think what you should do is to consume the entry even when it has !preq
> (that is, advance rb->tail also in that case; I'm not talking about other 
> processing you do but getting rid of the "nothing to do" entry at the 
> rb->tail).

ah! great feedback. Let me fix these bugs and resend.

Thanks,
Shyam

> 
>>> I've taken first two patches into review-ilpo-next.
>>>
>>>>  	if (!pdev->smart_pc_enabled)
>>>> @@ -165,20 +173,16 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>>>  	case PMF_IF_V1:
>>>>  		if (!is_apmf_bios_input_notifications_supported(pdev))
>>>>  			return;
>>>> -		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
>>>> -					   pdev->req1.custom_policy, in);
>>>> +		amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bios_inputs_v1, in);
>>>>  		break;
>>>>  	case PMF_IF_V2:
>>>> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
>>>> -					   pdev->req.custom_policy, in);
>>>> +		amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bios_inputs, in);
>>>>  		break;
>>>>  	default:
>>>>  		break;
>>>>  	}
>>>>  
>>>> -	/* Clear pending requests after handling */
>>>> -	memset(&pdev->req, 0, sizeof(pdev->req));
>>>> -	memset(&pdev->req1, 0, sizeof(pdev->req1));
>>>> +	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>>>>  }
>>>>  
>>>>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> index 6e8116bef4f6..add742e33e1e 100644
>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>>  		status = ret == TA_PMF_TYPE_SUCCESS;
>>>>  		if (status) {
>>>>  			dev->cb_flag = true;
>>>> +			dev->cbi_buf.head = 0;
>>>> +			dev->cbi_buf.tail = 0;
>>>>  			break;
>>>>  		}
>>>>  		amd_pmf_tee_deinit(dev);
>>>>
>>>
>>
> 

