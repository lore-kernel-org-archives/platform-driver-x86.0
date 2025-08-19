Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727623E354
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755617583; cv=fail; b=tp/acqlfDVw+UzJwVgXA8bOoq5NqLIoSwy87sw4q2vq2A18DOX07gKxwQTXzx0Whfjz8Vk23pWMWKH+ZOOYSk7O/AyAymJCejo0rcZYgGpL0gPkToVk0+E1QBN78Ep52XNBq8juyVxTjYiajNur77cXdCY7Vq81VAw5qe0G+PJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755617583; c=relaxed/simple;
	bh=COpJDF41l0bznTcO0or5UVmIl0zpmTjMtpCUrzeDAfc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NJUKWK/GJNVXJPjeNeNlJu/a11X41uIZf6SWsvOaFhVFlCrdTkRUBLTCxoVeVfNJtqImDS6xkVFc+GEYvtsfSZEDLG5bbfEiv2u54mD9RU/GijOTd4u98Q77SnokPuTrbcIxWIilNGy+pkP446KM8fbJSJvkCMa+fEgA+BwP1c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vKCReeXa; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vKCReeXa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alcCQcB89Ndj/9lKqmFib93keOH7qJBZV5Nt85Ncdxb2Wiv51ZyaZS8NJCgDM89TOdAoq75nKtjR6aQHauDGiI6TaRNzUJOObGClQAbU/THy+AqwTXnN/BMa4yKp3aiX25ShmDTKnmTdbEQEgzpRCXBU+mvfElQJJSwL5ztR79Zet6oKCDHck2Nfh6k67rReFvlFxnHRymDqK0MdN5S9m73SCzz/yhyaIvL+bDlvSW2YHSqF0pMKy4Z0POwk8RcXl3WCp3PpPm/o8eFvVr1vuATIATPEzNOh90LQxQEGpo+RFr8DX4Ripu2BSS0cPLFahE0qBidtg7qPo3rBVWxLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBzAUSeDZo5tTau5DNhw1OAVIXso8OMd03TFImPdU6I=;
 b=k6mcMi9yIl7ckBbl1oJQV2ystHyksHjuKTJmPYLZu3F0Nbl6u+YCoStfZyNPYkQnfyKRXkIQVTgi9scVnqxDtXWMDLcs7KiuhXHSHOfwzcXjjSEfM/RBUbOjEASJpGUp+PZ42CnRO1rk9f8AZyUgjwjtECKzMCaj3ZV+WbHZjx3KdJ2LnNgZeAnxCeFxyzPCT+FhTCimHlWuLrF1dIfjnQeSZoh9z3EaH/OJk74im4E0aPD6wW1N4e3K4H/LfMCF5imixRfGgkSO3BaiFAxCvQDH4ml0+1WgK1yaZLDm6aak7m/mHmnEqDVUEOQTSZ5t7ygAcUpCKkDL8FSxw81e9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBzAUSeDZo5tTau5DNhw1OAVIXso8OMd03TFImPdU6I=;
 b=vKCReeXa8xDdCI7Jyl/f8FgU0zV4mlH+o7Pv07FyJkGaHAp1ouPsdBj8wmpEtxGweB1ub2u0J5OjgkUKIR0VjImQhHRcxrS/32NG4+y6yqQrbQB0+ztwe2HkVJPgOKc8FR9L3d3GfrpP+1AAD08w87PhCpDvlgwmFtgAuGxDVKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB7619.namprd12.prod.outlook.com (2603:10b6:610:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 15:32:59 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 15:32:59 +0000
Message-ID: <acf03f54-79e7-4b74-8f10-2b90006662a0@amd.com>
Date: Tue, 19 Aug 2025 21:02:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] platform/x86/amd/pmf: Update ta_pmf_action
 structure member
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
 <20250723064121.2051232-5-Shyam-sundar.S-k@amd.com>
 <0c6a6c0d-9abe-eb64-7902-b9f1045835f5@linux.intel.com>
 <3d800301-526a-40fc-be67-ae067de03bfe@amd.com>
 <4a3310d1-0da5-e31f-f25d-5d255fec3d98@linux.intel.com>
 <9ec2e048-a14c-4235-9bfd-4d08ef039476@amd.com>
 <90dc44f2-eed6-6de0-d662-a0816753c68b@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <90dc44f2-eed6-6de0-d662-a0816753c68b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::22) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c744dfe-26be-440f-ca80-08dddf35ad60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2NUYzB5enpQeGJaaE9zRENVTnZxckcwUGVlaGFsZWd0b096MGN5NnV6Y05T?=
 =?utf-8?B?YzExUlR5Qy8wWUMrM0VPcTJKRTFUelE1ZFVPdVZWRjNxNnE3d2Nnam43dFlr?=
 =?utf-8?B?RFFPZGQ5TFFNb2lZRUpPdmFPM1luV2hrQmJ2Rlg2c2JUL3JEN0pZc1k0OG9m?=
 =?utf-8?B?VkxUQ1JnWEtyZlc5UTBBRXcxMFR1d09uZldmandXTG5tSStTWUhNdks0Q0JF?=
 =?utf-8?B?U09KTitIcUVCR0ZMRSs5WUNwN3JDZkRKZFVKQWRESFlqZkVTMlUvMzQ2alkx?=
 =?utf-8?B?ZFp5QjVVU2ZLSUREOHliNjVVN01nYVlRNkFBMm1tQ1MrNXEvbkwyYUdWVjh2?=
 =?utf-8?B?emo4bjA3U2xwUGYrbDVoNlVwRVNsU3RDRWhidGs3K21EU2drTno2emowM2tT?=
 =?utf-8?B?Sm9YNWVvY1JMWStUWndBNVE2OFIyYm80V0ErdnAxNlI1RXUzRURIOW1XSG42?=
 =?utf-8?B?c2ZUZEIxUkNDRGY1UWlVTXNTZUVWdXovTER3VmV3bUZhT21ma3lOWDdyOGJI?=
 =?utf-8?B?WTl3VTZNSWEzbWdwcVlVQm0xSk0va3dKdWw1WW01MHpzU0lnWk9nbm83LzB2?=
 =?utf-8?B?QWdHSjIwc2U0SFJpQU5aeGxpSm4raGpCUnlVcXpnM2htWFFGeG1uKzRDeFhW?=
 =?utf-8?B?ZWhZMWk5aUNNTWdRQktzWGl1STV3SDM1anh6NDFIUy9ZYXZ1TWI0Z3QvMHhj?=
 =?utf-8?B?VEhETWNnczFLeVQyUklDNmM4WVVFdFhhTmM1V09CczE0ajczc2krZVhSeUVs?=
 =?utf-8?B?NW1RNXJxZlU2Vk0wWVpaYjRIZkNlSEFCbnVnM1Yya0VqeW9GM0hUckxCd0ZY?=
 =?utf-8?B?ZnJvTFVJaU42M0M4R28wRmFVSEZ3MUhJTWhYMGxFNWFiZ2pVdk5TeTE3Y0xw?=
 =?utf-8?B?bC84OFo2WUhrN3FlakkwTmcrYTNrK2tUbXlJeXRTQUFMNE1VYlkxRERiL2xj?=
 =?utf-8?B?RGJJU0NlN0ZYS2ZNZnFaNEo4YllBK2I3OW5mWVJxdGdHQjBtYTFVR0MzeHk4?=
 =?utf-8?B?MzdYSVUzV21wTHNNWndXTG5udWJ2OTRPK3lGTzY0U3JIOWx5TkJSQWhiSDVS?=
 =?utf-8?B?ZE5oc0dUN2Y0NEw2L0tyVmRFbGZXQkljWDBCdmxVRHIvaDVaM1VUSnVwcVcw?=
 =?utf-8?B?ZmtWZ1lMWDBua2xEanh1SHlEdE1YK3RMTHdpY1NpSUhMclhqWGZadnY2VGg4?=
 =?utf-8?B?U2JQVjloU1cxUGRmSjdNaDlsNlllckdHWTRFZlZ6bGpFRXJIQWFrMkRjck01?=
 =?utf-8?B?NVRiY2Q3dXNZM0l4N3RkbUdDRFRncHBvVUFVQTdjNEpzT0FFMk9ZVlhqUENa?=
 =?utf-8?B?T3ZVa0pSQW1UNUozUjR3V2Njb2M2NEcxbDdqSWM5cU5jaTAycENPcVNsZjly?=
 =?utf-8?B?Y212RElPaHhSeHl5dE5jTHJtTlR6bDMxYnVONWovZG4wNXhXRllneVFOeVVz?=
 =?utf-8?B?SEVYekkwY0ZIT3VtV0dXeGducFdPV2w5SktKZTlHVFpKMlA0MlY0bnc0dUtT?=
 =?utf-8?B?YUF5WG82Rkd0Vm9zSmtFSTUwTzVzb2x5NEZ2a25jMCtUV0lsTmtFRWNBa2oy?=
 =?utf-8?B?dGk4UUlFaUo2TzVic3ZuK2F1YUphTCt3UTR0aGYrR1cyYlZrcnFhaFBybXhr?=
 =?utf-8?B?NmpnNjR5Z2lid2FpYytDWEdaSGNrWFNKVkVlVzVVTWVmVWJmM21YVWVrcUd1?=
 =?utf-8?B?SjRsckhtandCNWloY0pTdkZ5TDV1Zmk2NytTZ0ZUUzlSaExXUzZxSll5emRP?=
 =?utf-8?B?M21qQmI0d1JOUUJUanRST28xSjJRQlJ4d3V1d1h0Sm91RWswWTdlK1JpaDgz?=
 =?utf-8?B?am5pcXRjY09iZ01KNHRDZHRIWmxkeGZ2TnFtN0tWeFJINmNlNURPYnZkdzY3?=
 =?utf-8?B?NnQ0MzlENlkwS1Juc0s0QlpFNjVkbTlRVS8zV3Zmb1BocWtEbU1tdnhpSVRw?=
 =?utf-8?Q?XX+Z/1RufaE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3o2MkNSYjNSVWRVRXpIOExsbVR5eDBCOU5tZ3FPb3FOY2phZVl6VXlpcjY0?=
 =?utf-8?B?ejJsU1lpY1NteERWMHNLZ0NoK2ZHTjlJN1J3MUI3MHpSRGQ2NkFsTENjRklB?=
 =?utf-8?B?VHlESXhGWUZXdjJ6SlVsek04cHFlVzhCL1ZLRGtHenJHVEhMTDJORDBZM1li?=
 =?utf-8?B?eUx5bFJqaHRxWUMvSkk5NzEzckMwaCtOazZ6YnltUnY5aThsanJwRzQyRmQy?=
 =?utf-8?B?QVp0N2RjQklObFpFSTlmNkxHajJrYWZXYS9xUUFzWWNaN1ZBK1lZWkVNb05i?=
 =?utf-8?B?MERXbjdEb3dsdUVuQTBIMmp6ckR6MVdrbkN3d3F1Rjc5bC9Hb25EVWpuTmdW?=
 =?utf-8?B?TzVjREM3WXhCL2RxN3prMTdoQkw2MHBUU25pREFUV0YvaGVCM3A4TGpxRmxk?=
 =?utf-8?B?MlpDSkRSdHZWTDJpbmpoQ2tIV2c2U2NpRXIwQjRJMnlGUlQ4SG1SN3NJS25z?=
 =?utf-8?B?eXdockV1aTQ4L2FkaUJ1OWxqeEVYYkQwVTlLMTI1ZzJWSDg5NDhvSVExUENG?=
 =?utf-8?B?NmZzVVY5VmJmQTIrVHRZRkJES2phYVdiVElGa2FMWlhmY2p6d0o2NnV1K0Vw?=
 =?utf-8?B?ME5WZGt4UEtUd1dUR0dnSVY5ODNNZmd4emFmeFgrZXlJYkJjM29DZGUraXhp?=
 =?utf-8?B?aXZ3cjY3R2JFNUlFSXVpNEI3d1E4bm5LNlpITE42WFlYL21HQXdxeUN3TnNy?=
 =?utf-8?B?aXRtWE45SHhUWHdJemFqVGxacEt2N2k3citud2lEcmt4UWhjeEdnUmdRMFBk?=
 =?utf-8?B?SFBkQWZTTFkxOW1DWkQrRk9sTkZGMVpsZjJ1dFg2SWVsbWxDcTVMeVBtdyt4?=
 =?utf-8?B?MkV6TmNBbEhyTGFmWGVXemV5OXJTSTAvbzVSZTBoMldOamxLbnZvdDhxYUpC?=
 =?utf-8?B?RHMyWXVuYlRObHlVZnQ2OTgzZlpnREdBNVVIQ3FiaGRyOXNEbHl3a3pZMWdm?=
 =?utf-8?B?SnpYdGVhOVNBakZMaVpqVE15ZkdzNXFwblp0eXNGZXhPWTlVUzg4K3F5R0ZP?=
 =?utf-8?B?bEtSNlN4ZkNuYUJGU1lHTWxkM3NuV0lrVXdCdlVETXhZbTQxRm1qTG04Q09M?=
 =?utf-8?B?Y29jY3hyd1NRUytEaWxncUdJcXRUYUtMT3lvU3hxYjYzWUtheFFSRFBES1ZJ?=
 =?utf-8?B?WVg3RTVsUlpndmFnS2VVRXJkaGxGUGFXM2JwOVJRY2dzaHd0eHRSd0EwbHhj?=
 =?utf-8?B?UHhmbnY0Ui9iZEhCTUFpUVFjZ2RkekFDbHQwZGtxaW1USDJZT0RRYnR0NVhj?=
 =?utf-8?B?YzNVM3Qzd2l0ZmQyRHdKVm4zakd2VFVKRGRQdVREYXR2MnNCeDlUa3BvK2FR?=
 =?utf-8?B?Y2NxN0tma01hcVA3b0VDUFRvckRpWmF2dS8zWlJNOUNGZHp3VWpJTDV4TW9T?=
 =?utf-8?B?RFdVQjduMGtXdCsreW0zRjBwWForUnhtS3haUHVJSUViYUk1ZE5RNnhOWVNk?=
 =?utf-8?B?TE10ck02ai9SSHZJUVFLVWJBWGl3eHRJcVhrcy90SUFnanJFQ1NCdW9zOUU5?=
 =?utf-8?B?c2RJL09mNjlMOFFxRUVXTUxuRU9HT1pGQjdXTDd4WFo4bFd5clVOUXM2a2U3?=
 =?utf-8?B?S2gvWHpRYU5INlU5MUx6K0VpRVdIK20raDBwNlhxS0E1a2o4cVlmUFNDQzAw?=
 =?utf-8?B?WjZVWGxUVlByNlQ4VGQxclhNMVBEOGFnVTA4dmxuVnlOUlNLNTZhcTFOZXJD?=
 =?utf-8?B?a1RKRitFREZGblFNeDkzOS9nbmNZdE9WSGpWT3YvM0FjMW9VOWFmdDZXdGY3?=
 =?utf-8?B?VktFbE5vUjBSOC96WGc1N25DZFFLRUNub2FKVWd5amVKQ2VZbkx1bVNXNEsw?=
 =?utf-8?B?bVBPOER6cXkrNUFTNXplVit6ZlZWNEhtUVVHbTA1T0xhNG9GUUwxclQ3S3pp?=
 =?utf-8?B?WGs2WWJueDR3VDBQUkw3aml0b2hCSktjSTRFTVdBMDYzNkczaVl1TTZJSm9L?=
 =?utf-8?B?SmtMSjNxc2FaNWhTRlVWUWVVUDRRODVDUGE4Mi9PU3RUVmVtQkFEVE1mSmhz?=
 =?utf-8?B?SXFmM2dSS014dHhQNkxzWHR1YzRkb2FhUjlWTW8rQU5BbVl0T05WSnFyYlRp?=
 =?utf-8?B?RE9RMHZkOGdGdmUyNlc5SFFnZzVuWFplTHVndjk0dVJBbThsa1ZBNHVMbWRJ?=
 =?utf-8?Q?Gh7C9YwAHEOPuTFWSoo40rPn2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c744dfe-26be-440f-ca80-08dddf35ad60
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:32:59.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFyisFG2Owb0zl9CP/f7oAMSqgyWahErgTzDEqSPTe9wYXWFhfrmeBKgqGnkLQGYFhn8YKCVyFxm5F0ZpI8FWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7619



On 8/19/2025 18:47, Ilpo Järvinen wrote:
> On Tue, 19 Aug 2025, Shyam Sundar S K wrote:
>> On 8/19/2025 17:50, Ilpo Järvinen wrote:
>>> On Tue, 19 Aug 2025, Shyam Sundar S K wrote:
>>>> On 8/19/2025 16:44, Ilpo Järvinen wrote:
>>>>> On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
>>>>>
>>>>>> The latest PMF TA has been updated with the additional structure members
>>>>>> for internal evaluation. Since this same structure is utilized in the
>>>>>> driver, it also needs to be updated on the driver side. Otherwise, there
>>>>>> will be a mismatch in the byte sizes when copying data from shared memory.
>>>>>
>>>>> How is it known if "latest" is in use or not?
>>>>
>>>> it is based on the GUID
>>>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/amd/pmf/tee-if.c?h=v6.17-rc2#n30)
>>>>
>>>> We start of with the latest TA and do a fallback to older TA; if the
>>>> TA load fails.
>>>
>>> Yes but how is that reflected to handle the mismatch in sizes "latest" vs 
>>> "older" TA? I don't see anything to that effect in the patch.
>>>
>>
>> In older versions of TA, there wasn’t a spl_arg field (a 32-bit
>> integer used to track certain failures and debug features internal to
>> the TA firmware). However, in the newer TA, this new member spl_arg
>> has been added to the ta_pmf_enact_table structure.
>>
>> If the driver does not adapt to this change in the structure, the
>> memory layout becomes misaligned, resulting in reading incorrect
>> values from the TA.
>>
>> The ta_pmf_enact_table structure is an output from the TA firmware,
>> specifying which actions the PMF driver should take if certain input
>> conditions are met.
>>

Apologies. I messed it up. I mixed up the `ta_pmf_enact_table` and
`ta_pmf_action` structures.

To clarify:
`ta_pmf_enact_table` is the structure that’s sent as input to the TA
firmware.

Addressing your specific question:

With the new TA, the `ta_pmf_enact_table` structure must include the
new 'spl_arg' member. On older TA versions, having or not having
'spl_arg' in the structure doesn't cause any issues.

This update is essential for systems using the new TA, since the
firmware now expects additional members in the `ta_pmf_enact_table`
structure. If the driver doesn’t include these changes, the memory
layout will not match, resulting in incorrect input being passed to
the TA.

For older TA versions, including 'spl_arg' in the structure does not
cause any problems. That’s why I answered "No" to your question about
possible breakage with older TA. The change was tested with both old
and new TA versions, and there were no issues observed.


>>> Is this patch causing breakage with the older TA?
>>>
>>
>> No. It has been tested for majority of the platforms.
> 
> This is contradicting what you said above.
> 
> So what layout the older TA has, is it with or without spl_arg? If 
> without, why wouldn't the memory layout be misaligned with the older 
> TA after you add spl_arg to the struct?
> 

It might effectively act as a no-op within the firmware. I’m not
certain how the firmware handles the case when the same structure with
the 'spl_arg' member is passed. However, I can confirm that this
change has been thoroughly tested with both the old and new TA versions.

Thanks,
Shyam
