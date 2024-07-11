Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B8420312
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 05:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720674396; cv=fail; b=ohoZvXhzLt2C3qRkqlywTs+ad39OXRrGPE8b/gSG65b6ZsX3WBcfp+FibQOCwDx8PejmQOXEcekyRwr330uw2MtVcMM2PfkzZ6dZdwiKKX8Jx8imIKr9+P3ChVDAh8aY9NAHFX2v/ATO+xPcSd4qWALt5s2LDV2ZOfJvZrxlcqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720674396; c=relaxed/simple;
	bh=+8/Wf/LsHqnsruFHm1k1Ce97jrFFlCZnvStcX1NEFkM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KNw5otvWhoDTN6H6/4AmsQxjZhxbj7HfPAKBikP9PWxHiltXocpIyIvVb4zOpIto/5SrXRoHoDBw51LoXrCGfsD/WdMzc+sjqhIwJU8HATGW9fdCmOVDWTCZZn20AkHWLOm28z1al9+veH25Rr7dBerOGO9wA1PMuXgzWulrF2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4u4itlm3; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4u4itlm3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OskW+ujuIU5906FtAuIl6BSV5H9PgOzmBk0CtmxYmKGeXz/GSEXG6CShRcsljYoq6Z9o3q2lnMHrY+iaSEQs7H21X8J+cIcPKzhqV+9vpi0x2xGnoHvomp4yxcyvNqtbJ2xXmiC40SyhscsYLVFuQ5OgX0v4kDMXRGgFT9cMppGvj2h5YYyYEoCZ4zu/n5rvrHZ3Sx54d4GWP2KpLzxzYXuNXLtHX1QDLfiinJd/xfM+kIz/O0coof/q5kzrUW7xWdRcmhNx8E+G6vni1LJ4iO5THqAN6NkqgscAB5NKaeszTCSPt0fiLqCbZ0nB/xza2YsOWcMQo3h4UW6fbyz0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYhLZk7LutIImjRN7BQ+nVwuq/J6//3noL6o74ITogI=;
 b=D7oH1OOlYeL1nQCNFFqTGLntlMSb5VIN8L+3JW5EzuTqW/Q2Pz3Aax0FDlkwIesBUpKuOg4+qdn3Rqmk5L3kvYknVg6sWPQKHh/IXnz6QqxSk9hMYc1Y8qyA3o8LILPpIi9/qURGahlegGloEmZLA0HJVu4FnQ3FPhYQ9pfXb+7LVGU6FwMI+ZKur0OwbV5Rx037PUuVoB7kUscuK0+Nj7LvZpPrQqrCyH/KZICHVY2lQ6M1tobVD/22b2FE+5Dq4Zmjx4cULsFFaR1kzGbobwOPG1urJwxG3kf/81eaR5dLwkFIDMRfFRsxc6taJJ+usrcGpB5PhCdPD5scZTfmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYhLZk7LutIImjRN7BQ+nVwuq/J6//3noL6o74ITogI=;
 b=4u4itlm3T8g48CThgJwb+/Tnvp5ifjDEhAcYcJzqjpnN9piNchD2xO2UHcvlWzeyGBo6ckamvmR766zz5uprQrYT8//UxvPTpsdiSP++PwLwlrFMBOGXdKMWE7bLrPSwm/tUHHhSm2Hyi1JdmoXdTv+Hx14AoiJgVCV32K9BFv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY5PR12MB6370.namprd12.prod.outlook.com (2603:10b6:930:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 05:06:32 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 05:06:31 +0000
Message-ID: <906dd4a8-8ebe-43e3-a5b3-f89c5b758dec@amd.com>
Date: Thu, 11 Jul 2024 10:36:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86/amd/pmf: Use existing input event
 codes to update system states
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
 <1af52145-bc2c-4406-9564-dccd3da3664d@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <1af52145-bc2c-4406-9564-dccd3da3664d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY5PR12MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: fda3af9c-7b24-4877-4f97-08dca1673a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEdYczlkNUw1d0ZaWXVIeHp5Z1ZJMkRxRXJIYnBidHNZR084OW0xcDJKa3dp?=
 =?utf-8?B?TlFxN2libXNuL1hvNGFzRXhicFgzY1dUZFlUV2tjeWdLUHpBUHZUK2JvQTJi?=
 =?utf-8?B?TWpOWFNCL1BSR2lQenQ2K0xDUVRSdmU1M0FZWEpmWGh3SlRQbXBVc3B5MkhZ?=
 =?utf-8?B?MCtXdFdFdi9tdWdzZXVkY1lGbUtpVmFuSmNqaVlFb3UxYUxLZ2xhejVsMU1O?=
 =?utf-8?B?bGFXWWc2Vk9pcmdJWmVLeHA3NnVKLzM2MERMVDlhZVhUYmRIRUdacFYxTTcy?=
 =?utf-8?B?K0xiaDlDZUxDdjFMaVNvaU9ZL2Y5M1lRbi96REJUaVVpaHlDUzNTdFg5WDEr?=
 =?utf-8?B?N1ZDR0lzdHdzSjNiVk1aTEMrNGdrUzV3UDhhcVpHa0MyQ2dlMWpJUjI4NGxs?=
 =?utf-8?B?SGtjeVhKQU03c3c3UHZKaFkrbmIrRkswVURQTmNyUlBuTUVJTi85dkY4THhD?=
 =?utf-8?B?d1pHakVveUd2V0VxM0V6dDFCQTFrMWxyVW1jamprYk04dnVTUUpObEpSQUVQ?=
 =?utf-8?B?WHI4SFpVUjRCalJITFpKUmxucmN2SzJPOUc1eDdLc2lkcHdnN2ZqNTdod3ln?=
 =?utf-8?B?MFVlUnZ2b3Njald4OEF6ZVF0UFAwY1YrazN3c0c0UVJua2p1OGloaTlRT3Q4?=
 =?utf-8?B?UnBBZTA3dlBkVXJKNVNaK3lBWFJJMWVRcEduNE0xNzNOTDQxdDlPMTFndTJr?=
 =?utf-8?B?Z3NNenowLzJNZUg2UXV0b0ZnOG9iNFQ4b0lsaGRwbFFialBFOWxOM2Z5akpL?=
 =?utf-8?B?MjRlSG13NkhzQzRPbEtKM1NGdHcwQk1zeWZ6cVRTSjVsNGx1cG9ERlBuZTZQ?=
 =?utf-8?B?aFZBTk9EMnFZVmJKeFVsNnpsTTlZV2hzMUZnejFYamNiTVNHZlk4M0ViODlK?=
 =?utf-8?B?dDFjOTlKTGRuL2ZvUjQyN1JJanNKbVVGZzc2bHd0NlJUNmFYZ1ZhRndldzAy?=
 =?utf-8?B?elFzNE5IVXdGU1F5MlJRSHlnTkMrK0pvUG9WYUhnNkVlMk1YYnF6S01ka2gv?=
 =?utf-8?B?Rm5Ec2Y4WXROeVMzay9XdGVNT0xqRnBqdk15TDRZV05WOTNzTTBRbmZLWVFP?=
 =?utf-8?B?TEJZMW5aY3ZQK0tONlJRUTlUQVp3dHRtUnM0K2x0R2pneDg2VDV1bXNHemhS?=
 =?utf-8?B?b1MyWlZSRFVyTDU3YW8rdTRNa0psRjR6TjR1M29wd25GUTQxYzhXRFFIN29R?=
 =?utf-8?B?L3Q4VmJMMnkrUll3MExsaGNESXByY2JZK00wMjZicjB1UmxPMmMycXducUNX?=
 =?utf-8?B?cUZtVjhGOVV0SkVXd1NGa0hwUVpjUEU0NitINUZNZ3QxcHF6N3JmQ1gyQXhV?=
 =?utf-8?B?NEx5TlNRalUwNVhFT2pkam93NmdLV0dKRSt5Q09lNVN2d0t5dFNrM0ppZEdl?=
 =?utf-8?B?Tlk4RkxzQkxHYzVWOXlzZmVuMXEraDNxYWFsaHk2bWd4cHdBK052emZkamxZ?=
 =?utf-8?B?NGpEeEVrVzBmNmhnOHl2MldJZmJwTjVsYmFGZVh1RGpvVDJxUWI2M2k4QUds?=
 =?utf-8?B?Y0l2OEh5MUJIa0RJdlpjNzkrNUFXSGswWUo5RE1vQjdFbUpoWmU3aWNVMWFW?=
 =?utf-8?B?WjhnS1Fvb2xLbWoxRkNPZDI1QXpVWFRVT21GSmR1cUlwaW4reUFoR0RYTEY1?=
 =?utf-8?B?M2FHY3AzbDF5Qm5rd1VYb2k2NjZxc0ZiWHJMRFYrSm5kNzlRZ3U4N1cwaFNU?=
 =?utf-8?B?Skt0SGJ2d3dpNjB1NU5SUjgwRVVyb3V2M3F4Um11S3B6Ym9hdVZwMUMyY1ho?=
 =?utf-8?B?dVA3UWVOTnhScmhYSkVBUks1czc1UTY4aFFVWEJPN2ZiRWFodmdkV05JYm1G?=
 =?utf-8?B?aUYwakdhRTdUWjBDTXZLZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODM5Si9QZmZCQUtTMzBRYUpLcmVrU2hhc2sxUS96TXhKdDhLamZMVThMRVRa?=
 =?utf-8?B?VGJLcXIzU0ZlcnFRVGRQVmp3T0FuWmMrSkVzTCtOT2txY1RTQ3RrT2pkZEQx?=
 =?utf-8?B?c2x6bldHbE43QTJIY2VaSjk5UVdQNDdVSmtvL1FCSk5JMEoxNDNGOHo1a3Yy?=
 =?utf-8?B?T1dQWGYzSElseThZTW5PdHFUbjlvd3Z3bTFEMGI0YTJ5cHFGWk94N3NtRGF1?=
 =?utf-8?B?WTFuWE1SbUdMY0RuWmNRMjh0VnJrcGdHTEYyVThLNld6M1NEMXR2NDlnYmd2?=
 =?utf-8?B?MG9QeXF4RlBMYWdvOEZvMEpkbjEwQ2tSTlNHZ2tZZ1lLM0RiMnNKYU1CaXQz?=
 =?utf-8?B?eUNEc3hOQ2tySGc5Z3VEdzQ1dXhHcUNidnAyUWtzVDFnUS9saFU4ZSsxaDdv?=
 =?utf-8?B?THM5SjRKYzNPV3c5b0hteU1hcy8xY3hpL0ZOczBTRTJxL3NzN00rU2p0clV6?=
 =?utf-8?B?TGJPdmNxU0lTb2dKNjlBWGlBSmU0MXVqZjRycTU1ZnNkKy9VMytqY2diTDUz?=
 =?utf-8?B?QVRkOGxpaitHZDNoNUNQMXp3dzJ1UDl3Nnl4WklvektmenJwMEozM2VnQ09k?=
 =?utf-8?B?aER6cWpoUXNZd3pCWGllQWQwQm5EUm1TOGhQVmtvalA5UmtiN2JsUXRyekNK?=
 =?utf-8?B?WUR4VFB1UGYyWjN4d1hVN3l5NjdBaWg1THh6dnhFRUkxM1ByTlROYmVyemd5?=
 =?utf-8?B?b1Y4NVdLZXJ0VzExRytBV1lCV3B2YzZrb0FqUVZ6ZnhjclVWVEN5eGVnS3dT?=
 =?utf-8?B?SWNVVjRCbmQ0bWRFcVF4MW1iMlYweS9Ec1ZhRjA0aDJtelhFNGZZUnl4Q3BZ?=
 =?utf-8?B?TVRpcVZ6aFFwV3g5L1FycjhNOGRrcHExS2NxU3IxWWRhNE1PZnZBVkczOHEy?=
 =?utf-8?B?bWYyOEc2ak9Ea2hIdXprcGZSMUc4RUxCdDJKZTgxaTBxSFRHZEJwa1VjZ1ky?=
 =?utf-8?B?bHJadXFYSlVnMzhVbS9hc2lCMDgyNEo5ZW1CY2o3QmZlVE5hS1NEZWNQTllu?=
 =?utf-8?B?Skl6VjF5TDBTK1o4M0JEdjR4cS9WUDdPNmV3UnFVSUNEaWd4NmdiVHQvYmxt?=
 =?utf-8?B?SE8yQS9tNEZZVjd5ek9vYXFHQ0tySk9OOGxTREFDTVFaQ1BmSHZYYTlFVHRL?=
 =?utf-8?B?bmZGSVNlZ20zKzJuc2hZNkIzUVZaRTZCcHpudUNXcWNqNGhlYkFvVk90NVE5?=
 =?utf-8?B?M05JWkVWbWF4QW1wYmlWNmw2eFErRGllOEZxY1dwT3JFd3d1SDFidmV0KzNn?=
 =?utf-8?B?SlllcW82VUJCNEVVNGttKzJyWHUrQjlxdGw5bnV0ZWt6Y01nNnFtMVU0OFU4?=
 =?utf-8?B?VmtyWWFlcHl0YW45bXRaZ0NnL1ZwOWdjNmt2bTVoY09LQ3ozUE5sUk8vNmhs?=
 =?utf-8?B?ZnV3NVYzMVd2T0hINzMrWCt4TTdBc1lTc3ZNb24rNWdKbmdvcDdhZzFOdjR4?=
 =?utf-8?B?NDNyMml0OUhkakJ0ZzI2T0pLVS9SeXpZMTlZa0p6cXpMVGdzM3BkY3hSSUZw?=
 =?utf-8?B?NUhyVVJHWDliK0svV0pDZTNBa0Q5UDFTdTFqYWRpWDYrT3duajVReUQ1T2Rp?=
 =?utf-8?B?dE1tS2paL2lzZjNJU2pLaG5td2EzeEl0dWtvTk55OXNQSkFRV2lKalFidkRt?=
 =?utf-8?B?Y1pIWFVXUGw0Mks3eEFxV1NLbUp0WGtPL2RkTW42UFhpaU1hYzV2cEZGdW9w?=
 =?utf-8?B?aDZvM3hmUVRhcmZ1bEVNdlBhdEorTW81Wjl1LzZ1Z2xGN1pRb3R3V3FraUVG?=
 =?utf-8?B?UzhhbDVqWmhMNzViOWhVTFlXSHNTUjZsOFB2OGcwRzVVSU1YSWdSV2kzNG1J?=
 =?utf-8?B?WmsvSnRtc2c0a0YxUEhYaTNnZzg0Y25RanJGL29TeW1ZNUFEMGxDWnB3cHJH?=
 =?utf-8?B?T0JoM1orVDhiVG1wU3lsZFFYdXlrTmYrakdiUFduTnlTM1dITml0Z0tXWXhC?=
 =?utf-8?B?NlRXeXoxZzJLUjJVU0R6WDZRNDZXR003S2dJaXlYS2dxY2NXRE9lVWZ1cHJD?=
 =?utf-8?B?UFF5U3NTK21wdUZobGpwS09CcmdrUFREWnFzOWErY2tEK3Y4NE80SFFJQlRq?=
 =?utf-8?B?dDdFL0xwMGQ1dUlBaHB6TFZFSmd3dFp6WmtCZWFQaUhneTYvaXkvVXErU3Yy?=
 =?utf-8?Q?Vsws1qRbQm34LmpJgPttsEJ4g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda3af9c-7b24-4877-4f97-08dca1673a53
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 05:06:31.5499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lHre1szSc0cFHbdAUbDy2JK0q6U7ebkv4EPSv923BMbj3/BTD5Lpa64RJZoo/qSPYYM9jeToCEAmW8CQjnusQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6370

Hi Ilpo,

On 7/10/2024 16:36, Ilpo Järvinen wrote:
> On Tue, 2 Jul 2024, Shyam Sundar S K wrote:
> 
>> At present, the PMF driver employs custom system state codes to update
>> system states. It is recommended to replace these with existing input
>> event codes (KEY_SLEEP, KEY_SUSPEND, and KEY_SCREENLOCK) to align system
>> updates with the PMF-TA output actions.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
> 
>> @@ -475,6 +506,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  	if (pb_side_load)
>>  		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>>  
>> +	ret = amd_pmf_register_input_device(dev);
>> +	if (ret)
>> +		goto error;
>> +
>>  	return 0;
>>  
>>  error:
>> @@ -488,6 +523,9 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>>  	if (pb_side_load && dev->esbin)
>>  		amd_pmf_remove_pb(dev);
>>  
>> +	if (dev->pmf_idev)
>> +		input_unregister_device(dev->pmf_idev);
>> +
> 
> Why is the ordering in the init and deinit asymmetric? Is that 
> intentional?
> 

No. This is not intentional. I will respin a new version to make it
symmetric.

Thanks,
Shyam
