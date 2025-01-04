Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6A17C69;
	Sat,  4 Jan 2025 05:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735969050; cv=fail; b=YgnP7DaomHszxtJeD9svh17WOeLPM74a0Hdbyostx3ZUViXVzo8kKEC2Di4J4WrvCLqBtbz5gizAxViW3YPQy+reqzZouzdN5ni3dHybpzURIQW0cxGlM9dTQMOnSsznOeoQ2ZsGQUPTj5xWYKJ03g3M29mgVJO8sjltmDQWvgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735969050; c=relaxed/simple;
	bh=yPPXBVvygjv9DFAJKR5dUWMpe19mMFu1Iq08UQrvms4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I5Y6XMzEPbNh4Xgof8zHyZOFOHuuHD9qIc/u+zAg9OuGmB0S907Y3190M0uSFstjyeERazyyeOHDpkpAA2fIeYZtfx1eYE1wh87Ydg4CbKWTIBnLfpM9TkgJKPXrcMXbNcX1bL3qRjpVRtfNBLLaMYSYX2czqgMd+X7o0e8ZbTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GGxA+OLr; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GGxA+OLr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJR7b+mKSXjiwS3Iwbt56n2SUxA9uDnxJW02CYaIsSk00gF7ONvIUxK6CYDNveZT3V9aXbP8ejRJMrYZkaRRnuij1gd8cbu9nnXh6HFt2hjFAYvJ++KbZe2yZ3h0oa0aweOhc9QET52uWu2MIXWBVHbW4i5rWKXQLoOAK9Qfbxp6UYL4bri5KU5ZRaIFK2v28cWvkvgcOM/l0VctFkOAsz/rjpiKao984Vf5pw2RZTosJmVQH/ymH8jIPoQmLKjApuYpzcmbhe7RvdXSV4M/ZducjwDYExQWSZNVAPD6ox6j8CqyjiRpKE3Qn6Jf3o2U2Pbu+J43f24i8J7XLSY0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjJbdko6+FlW9UX53Hw6qrZatVMvGzj8fY/GLbM0yzQ=;
 b=k8Dd/Pwg26uqseemnaJPQX/VQemMxte1fBYWonFrdkzyn2GzPCvZnuPIScPPmJr3pWYN8dRDu2cmu1IScmaMwgxoqFZmeqL8xJgwo6gKFpVJEiKkOZwysBBSpLVPRk/a2HRhvrB4ZJKS3hVoymZTkYx2FZd+2xR7e37fy2toOkmyH2oiRuuH1YMqiIOytrZgC9nLmS1YVT7lU7hC1zdV5BJbIPjoMKLkBimBDoBrn/HvyDI0OSQ5z/z5ooBxo9zDA/E3V6X/mAF1K/Wbu0SKhaLv1nwxNpE5n41R02bOE4Z1m4ecPd+udQ3BHIy0S694TFMLMmGg5qYPTgVHRIboMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjJbdko6+FlW9UX53Hw6qrZatVMvGzj8fY/GLbM0yzQ=;
 b=GGxA+OLrcdaiU1Wi+smd4BwNiHFugpr7/kFwXwyiW+992hZ7rgRZCS/FKYrTHAwdqUzz52jKig4LIPxgb+qDGAIfo4TnxwviA4lI/7fRsO3NlOHMZ1DkVzkkFvTa8st3dJFGVPv5OIb9WlfraSzhr44XtOKir2CT0HCeCjCarXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Sat, 4 Jan
 2025 05:37:22 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8293.000; Sat, 4 Jan 2025
 05:37:22 +0000
Message-ID: <7d4c0464-8858-4a63-b397-80b6c95746db@amd.com>
Date: Fri, 3 Jan 2025 23:37:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: firmware_attributes_class: Simplify API
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>,
 Prasanth Ksr <prasanth.ksr@dell.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::35) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: ab78f787-d3d0-4159-22c7-08dd2c81dcab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnQ4MHNabDQ1MVdoeE40QjFNaENqMmZpdjNTdW5lY3JaKzhrYUFvVVFpc25J?=
 =?utf-8?B?b1ZPMmxicGZRMmlvZlJWOUwyZnl6bTMwdEw3Z1liWHAweTlHUEFSUUNnZ3lk?=
 =?utf-8?B?ckV5RlBsc2ZBa2xYbHJJY3RmcGhrb2dxZWlJNjVBZ1VhL3p0M29YdElKR2hO?=
 =?utf-8?B?RTQ4bWcrU1NjV0pidEpVU3g4R1NLWGo5QjZsTzc3bjVoT1JJbWRNSEdvdGhO?=
 =?utf-8?B?QlZ4S2RzcU5RNHM2UjRvemZzb1NqT2RlTUpKYjR1emV5dlRxZnJsTHhJa3hI?=
 =?utf-8?B?TEFNTk1xSTdPQ2FEN1lnRTE4bjg0b0ZXMkdvS09IWmJ1WitaYzhDV2kwOTF4?=
 =?utf-8?B?OWU5QW9UVlBBeWJybG9jMXlTVzJKSGpKWmUyeUVmSmU5TEMrWHlTSFJVbTNh?=
 =?utf-8?B?YWhOUUhjYlpwWCsxeEdSL3RWTFEzNC9iNUlSMDB0NWZpOGFnSEFrWGZzOW9s?=
 =?utf-8?B?czFyUStwcSsrbGEyM1RJZHBIN1RUa3lRNEJNYVpCNlp0eVlsdUY3ME1lTU56?=
 =?utf-8?B?d0hnbFNGc1ZSTmIyVHZMOGVnbmZpSW9YSmFpbVI2bU1WK0JMcXdWeE1EaDFV?=
 =?utf-8?B?VDBUa1djbHRTTzIvT2pab1VwRWtKUThIanVFenJCaGVsVTlkVVo3ZlB1NDFD?=
 =?utf-8?B?OExVVHEveTB6SGtMYU9zQTZlTGg0c203Y1Bodjg1OTlpVkpOOGgzZHU5cTNh?=
 =?utf-8?B?VW1KQUtoTzk0L0dKZElxckcwOTFLR1o5SXhGbGdQbE1MV3hsVWlqZVBPY1VO?=
 =?utf-8?B?TVowcVMrY1BOa1oxVXpVSDY1NjV6SEFMSDJETS9jeXlhQk8xRnJkNlRwcVJ6?=
 =?utf-8?B?em5ydTdpcUhQRnM3OUlCUkxUWnFDcktYcXlQU0JaakNCdlNOMzc3SlphTWht?=
 =?utf-8?B?YWJLbnM4dCtTamZXWW1HR3pmNjZpR3FjMlltemd0aVZIQnNTSVE2WUJ6YzdK?=
 =?utf-8?B?WU82djNFWHRPR0J6Zm9TNG5xNWpIZDhxOGg5RTBBUkZHd2V5ek5pTE82R0pZ?=
 =?utf-8?B?V3N0TjhVV3Q4Y0dTTkthSk1lNGRsUVpUM1MrRXN2bk5qbm40M2Vva0dNNi9G?=
 =?utf-8?B?UVlpQWcxS2FkdnJzeVBzaWpkTkQ2MGpTWUhpZnFCWWt0UG9vMzgvVVVHaUFF?=
 =?utf-8?B?YTN6QkxyQmxLb25MMzV3RWRieUwySFRNNFk5a3R4YXduaVErVzdLU0F0RVIr?=
 =?utf-8?B?SXZoa0tLcnNOWUJQUGF2ckhWOWxLZTlTazhDY3NZaS9EUVlPYm5BQUVRY28v?=
 =?utf-8?B?QkVqYm50d0ZtemdhWW9YZ0IrMFZKaTU0ajZVMkxvTDZSejFaeHNqQnFMbnJZ?=
 =?utf-8?B?d2NnczJ1aFl0czdmNFlyRG9pL3lGNVF4TTUxT0JmcW5QQXRBTldJRTRIZGN5?=
 =?utf-8?B?aEhWeG5kQmdYWGtBbElocDZPTHgrdEhZMUd2VXFvY01wTzF3NFpxaUp3blFG?=
 =?utf-8?B?cWE3Y2dhem4yajRzU0ZRNnNKMlZIeUozcDBIOW5wSjZlY2RRYUsvMjdneVc2?=
 =?utf-8?B?L3R3L2oxZ2lYeTFLd3pkcGI5dmJzcm8vand2Q2xQUE9hT0wyeEw4eU9nRUg4?=
 =?utf-8?B?S0pyN1hwMlV2RUk3aUU0ejVDQXV4aTJYditzSk5oRmVoL2xhdmRtMWdiUGdR?=
 =?utf-8?B?U3dFcDZDelhBVHRRMStjak40eUM1WmYrMHZ4dTRXQ1VLcHNrRmJZdzA0dXJJ?=
 =?utf-8?B?YU1pRXlYUEFHUzRzS3FrSVdmY0hTaVU5dVVZNnNQSGF2ZzNDRStRVTNaTUxX?=
 =?utf-8?B?UFV1T1pYcGpGQjRLZHBGc3cxaWVGT1ZHMk5MOGIyVjliVkhPT3ZMV1k2b1Yr?=
 =?utf-8?B?SUJ5ZjNmamt3ajFSYzNLZHphSnhJZXFpSnlrMnk3dDhQNXUyT2ZKamJaUk4v?=
 =?utf-8?Q?YPaPC0sy8RFLT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXNMZFlBNENKODZVcWNKOHJrTzhuWStGRTlpdEczK1pLTFNvOFUxTmhtbk5z?=
 =?utf-8?B?a2pBMVFLTmRVSStwR2J3QVFnSDh5TDNhWWhab0tkdktQUW9YOUxJMzMvL3Rl?=
 =?utf-8?B?MnlnQ1VxckZ2WkEyanVST0Y3VHdWdGJkWVlBYjJzVGRyUmNUZjFPb25VM3hr?=
 =?utf-8?B?ZURFNEJRZ2JsbkEveXpSQVlmYVh1T2xFNVV2SURkWUFDTDEvZUFTTVI1WENE?=
 =?utf-8?B?L3ZDZkpaQTVYdTNIZm5WcVJ1MHpadmpxYVFYbFF3VHZGclFKa2dlRjdnNkQ5?=
 =?utf-8?B?MlZRbzk2aGUraGFGNEhKU29rRjVTSlg0bWRhcmw3M1N1K2ZmOXUrR3UrUWxR?=
 =?utf-8?B?ZjI1Sm02dW5CVnNHUzdJRklBT0F5UzdwditkWU90djBxQnhxSFg5K2dpWHgz?=
 =?utf-8?B?RGV1U1Biazlvb3FwaWI2NERQUjRxUGYvdVU4L0pIU00yMUxrQVA0elJWa1ZW?=
 =?utf-8?B?RlNHYXlEOW1VYWM3bmlqMlp4TlZ0ZHV3WUhOb1ZYKys2MVhkcWZsRGNTZVVo?=
 =?utf-8?B?Y0JWTUh6SDVvNFRac0pTaDdNK1IvOCtNNEpzV1FuZGN3TWxlU29JeDJXSVVr?=
 =?utf-8?B?bGFsOFEzcklxYnVFVVQrM1NIT1EyU204aXlJbXdMNUNjalgvd1JGdGFNV2gv?=
 =?utf-8?B?TGdabWgwdkd3d0lFMjl6U25lVUJKNmxYd3dyVTZGdVF6eFUyOEtyTFNVR2hl?=
 =?utf-8?B?M05JM1dRT25FeXl5cGhyNVl1TEhzS3ZCZThhNDNLVmNqMDlzSFI2OFR6NVZv?=
 =?utf-8?B?ZDZmVzUzQ0pBeU81ZXU5elk4Sm5uMjUyeW1BME5EWWVVY2RXZ2UwTmlETjBT?=
 =?utf-8?B?ZU1zd2RPQ0lKcWhRY3IreWFXcDBwa25pMkp1Z3pkVldpS3lDTFRZZE91RDVH?=
 =?utf-8?B?MlFkeVdmb1hLTHNCQ1NMT29iRElxYkZoaENOK1A5Nmt0Sk9pelBJcG9VT3A1?=
 =?utf-8?B?YmlYU3htNVVNUkV4S3EzNHFkMFVCTXg2b0U4Y2tObHZXTlB5RUhrSW5ZM241?=
 =?utf-8?B?T0cxSjBFMVA1ZlVnemx0OXZuK003VCtWc2FIWTJOZGpaa3BjMk1nMVNUalB3?=
 =?utf-8?B?ZW80SVkvSHpDZTlxcnpISXBrNVhIR1Q3ZG82UElEN0RPeDlRSTdwYWl2dWFS?=
 =?utf-8?B?ODNlUXdGN0JoN1hpTFAxZENNbkhESlcyN3JLZnRCR0J1c1Y5TmdkejNaMjVv?=
 =?utf-8?B?ZFg2TUFJcU5tYmZIV0ErTFBlT2NBM0V1OWRjN1EwN2lqSnVaSURXbkZnTHly?=
 =?utf-8?B?UytTeDJRS2JlS1JDbndacTEzWVJ5WVU5cGw1czUxNWw1K29Vb0VjRjNTSDI3?=
 =?utf-8?B?NmZCcWFyWWVLQ3JnaW5BdVJBRHNMcjRaVytzUHVkTWErVytua3VVZ2FsRlNu?=
 =?utf-8?B?TmNnRGZyQ1kvRzdVeWYxYlhMbVUzOHkveDlEd2ErQWlMTTBOaXpaVnBPbGh5?=
 =?utf-8?B?cjBva1I4STk5ZUN2dUtIQjVPYjZYUGJuNEdSQWRSdjNYSEhBSUgrd0d4SnFq?=
 =?utf-8?B?elZCanNKWmMxWVJDZ3FKL0NEVDhrZFV4Qlo3QW5ZVHdBT213TGdmVDdDVTQz?=
 =?utf-8?B?YndLWjQxa1ZYTTRQSzdRTXc5SXk3dWx6MldXZVZTUXVUanBubWJKVUZFbThX?=
 =?utf-8?B?WGNxU1RiK3piMklDUHFuYmJ0aUJJdWFFSmo0QXgvbjVPbzFER3o2TnVJK3lq?=
 =?utf-8?B?UXJhQlY2bHNrSUZxVlgyMTlDVHpIbTQvbnRUcmJDZDg3OFpTejN2VDVlaGFV?=
 =?utf-8?B?STh1WGJMVUdlQjRpaTBpVHVvRFMyUjZKc2p3WmFaZzQvcjFYQzcyQXlIWHNy?=
 =?utf-8?B?S2c0dGdMajM2SHZTS2JHODBFTUNIRlNkKzV0QlY5SFJGZHgzcHI4NXdnSUly?=
 =?utf-8?B?R1FyUUZTdHBxNEg1Qms2SG0xN1cvRFJ2dVJsVXZHMjR6L0VKR29kZ3hLcC9Z?=
 =?utf-8?B?UDgyWXVvdnF5MnFqY3UrVXhaV05BOTI4Yzl1Q3RDcHhFZjZYRlp0dVVCYjQy?=
 =?utf-8?B?bzVZMlJQdWNaamxad3VxNFozeTZZZFpkY0hXai9FVEJmZ0NIcFFsZ0orMnc1?=
 =?utf-8?B?c2ZLUzhIdXJTSEI0VFVIZkgxS091M2VxemlJano3eGxLYUtXVXl0b1R6LzlG?=
 =?utf-8?Q?Ce1NpzC3NZ+u1TN98rw8rtJsZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab78f787-d3d0-4159-22c7-08dd2c81dcab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2025 05:37:22.2425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WO7fj+01JwVT92EfeqmtqEVOrGE20PtKVL2BPyo8dd1KFy2OkgalK1Q/I9HlxovE6sAGknuJKsDKqGzyTWYSmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562

On 1/3/2025 17:05, Thomas Weißschuh wrote:
> Looking at the users of firmware_attributes_class makes my head hurt.
> Simplify the subsystem and its users.
> 
> This will break the currently developed samsung-galaxybook driver,
> resolving the breakage should be trivial.

It will also break the lenovo legion wmi drivers that are in review 
right now too, but I agree it should be trivial to fix that too.

> 
> Only compile-tested.
> 
> I have some further improvements in the pipeline building on these
> changes, but those will need some more time.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> Thomas Weißschuh (6):
>        platform/x86: firmware_attributes_class: Move include linux/device/class.h
>        platform/x86: firmware_attributes_class: Simplify API
>        platform/x86: think-lmi: Directly use firmware_attributes_class
>        platform/x86: hp-bioscfg: Directly use firmware_attributes_class
>        platform/x86: dell-sysman: Directly use firmware_attributes_class
>        platform/x86: firmware_attributes_class: Drop lifecycle functions
> 
>   drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 17 +++------
>   drivers/platform/x86/firmware_attributes_class.c   | 42 +++++-----------------
>   drivers/platform/x86/firmware_attributes_class.h   |  5 +--
>   drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 14 ++------
>   drivers/platform/x86/think-lmi.c                   | 13 ++-----
>   5 files changed, 21 insertions(+), 70 deletions(-)
> ---
> base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> change-id: 20250103-firmware-attributes-simplify-9ae561459260
> 
> Best regards,

