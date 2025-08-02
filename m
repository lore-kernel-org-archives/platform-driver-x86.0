Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4A3207
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Aug 2025 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754137902; cv=fail; b=GoR/022PxZiYWuZVMy1maCC2VxjvYSM+Y4+7yD4rhKyq6AjaZ9U4x21KmePVsFY3rC82nK/hKoYdnIF6Nw+QvpkKbXRw5RTeeBoRMyNhNjyE+9+9o3MgHlNFjaAksmHpChpUp6nbuWdtPxWhT7QId4N+IAssgXQxny9adH2FiA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754137902; c=relaxed/simple;
	bh=uHcIErjdpmxqpa8VQyVMDbUGnoc0JmHzdh4j8EOeoKs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DbiUObtDLIJm10mUboynkT3Ph1s7tVNkmbHt+hJNclB9PBJD5r6+DxmfSrMfCewOlYrgTI+xreqF7Z3LlH024QTzFP3c/1Jy0jt4dy4xSjtZqoXkHcs0uRuZF31rhH4vxqTYOihbhJLswgxm1Gb4yQcCpKuFNkG+nmzdpBSh1dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1x4dmCr5; arc=fail smtp.client-ip=40.107.237.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1x4dmCr5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDfpXD2OsKuchfWm8MlOhaGCixOPwe3kq3tKKFXSIlGF8fenbhGUupPX97/At13xppaVHbdr62ZCb7WKz9iTnBMxKU5U4KymMLhDt4fWvawSr/6iKWupl7PKIyCvg/+vEgjjKIh5+KEqn1ve/IFZFrcPSrjaoZc8Kd/QQF5O5To0j90fhmpoTPfc8J/qH8yHrZmneSCGslRWIgMeqkIx+nbBWbS9Nci+f03+r1JJcymZr2SZFl8L3hruk8HJmvBeSnW8iky4ECqb4kBN/APVd3OuWfSQCQHhcQGrhb4A8Gttl0x8MXMMz+agzXmJfQxJAl0zlZGxM+gSjaalwu53BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtRYNQp9VC5f1RDgr3/pXhWZqZmmN39gf0KV1ffahQ0=;
 b=idbMNzZoaKxWtNpigwlYQQCLW+wYNoIE7WU202C/ryETkH48OtKmHaALX43+ZYGRtE0dTeus6epaBFYbZS3gMIukeFPcCU3oQyElGmPqFVc/8hABi6Ev7QxnaKpuzkZO0vEErE0SDQhP6umjo1li64c6USCabcqxxhs39i+2LW/e+DJ39H5vhVrLMqH0YhS7p2XlEJaBomvunFJ50RkgOYDmuRGbBWD/x4XxnrLnQ/rHmGcS3ocMA49aMgMgrN2QDvsEONUMzqANvBeww3dnYOPgbY30+BIEf1dmgoi/9gFy9r6+1sbu9LcFkEcdxEbud3Z/xtpT7Ul9SN04WHhwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtRYNQp9VC5f1RDgr3/pXhWZqZmmN39gf0KV1ffahQ0=;
 b=1x4dmCr5fLZFj16e9pT/h1x0csdi4kHUbZ+zW0yxBh4S4f+xJ+el/havUb8wonN3rjr0J5ItO5obBT4ItkivUIq2kwWh0AjFKCnYJc4fVmRmacy96rHz7EQ0NsGTJp0BT/91zBmGAg6E1wgQm6im76pKIwXUDW0MAIH4/S3Iktc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Sat, 2 Aug
 2025 12:31:35 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.8989.015; Sat, 2 Aug 2025
 12:31:34 +0000
Message-ID: <534f7096-8ecb-490e-9aca-ee4ecde44e17@amd.com>
Date: Sat, 2 Aug 2025 18:01:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] platform/x86/amd/hsmp: Ensure initialization of
 the sock struct in hsmp_send_message()
From: Suma Hegde <Suma.Hegde@amd.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com>
 <20250723051251.3009625-5-suma.hegde@amd.com>
 <11a77699-49f4-ac5f-4bce-6dedae7f0170@linux.intel.com>
 <dd58fb6a-021c-4467-9873-7832e2185ca2@amd.com>
Content-Language: en-US
In-Reply-To: <dd58fb6a-021c-4467-9873-7832e2185ca2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::9) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: fe03b352-203f-41a6-3363-08ddd1c08401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWh1OVg0UEV3MWpSOU10d0N3YzhYb1ZkcGlIZ25Cb085VmM1OXBYdHppZmRR?=
 =?utf-8?B?clNnRDRsR2MwQnRLTmltd3dvOWhNaHlzdXl0UGhMRldvRHFRREozOUtKK1Bo?=
 =?utf-8?B?eU1kRDZyS1c2MUVRakxXU1RPb1hSeTVKZlc4WjRRVGlIUE1SNnRaaHR2eElT?=
 =?utf-8?B?T2FtOHM3ekdzVStQZkp2dEJUNTc4YjRRK25yTkd3eUpjczdHejIvdU5KcDVK?=
 =?utf-8?B?dEJ4YjBDdlNiRkh0WXd0aEpQKzBPQjBpNktoTnpKNUdidUFvSGIvcXNicEpM?=
 =?utf-8?B?L2hBVEJxcEhZRkoyN2FuMTBLL2lGMzdha1BNTW9yMjJNOGlsQVNqMnpiVmNk?=
 =?utf-8?B?TFNFUDZaTERCeDlsbmxheXZzdVcyZi9aRVRlT3EyS2hYZU8yalRKbjZPa3dH?=
 =?utf-8?B?NlBUY1FySUpQM2tvMnNQWGx3bVo3MmZxVk9WbXZjS29JQ2J2QnpvSWZad1Ja?=
 =?utf-8?B?b1VvWXFBUFR5bjFvNEtyTWEwSEdPUGNBeVk2QmlKRkVGanlTRjZRcEh0NFEz?=
 =?utf-8?B?ZVYzdUVaTEFlTmtwb0huSTBkc1kzblJoYWhRbDBIQW9vNWR1ei9xWkU1cU5N?=
 =?utf-8?B?RGdLRk5GQUZ1eGJWWWhRVVF3OVl2cU1RNnFiTW8wSGhGT1l1RW13eFQyZGFo?=
 =?utf-8?B?YU10SEdsd3JVU0l6Y29zQWVJbk9yMEhYa3IrZWhZZnczTm5XZGtBa09JWjFa?=
 =?utf-8?B?SDZvWElXMURvSXpadTBrNVhMbVVDblZNc2ExZzg2MnJBUFNWL0xkSjQ1YXlp?=
 =?utf-8?B?WURFdVBaL1hFUnBaMU44RnJKc1QxNHpEcVMrZU1XbVYyOURlVjlITWhCc1d5?=
 =?utf-8?B?VWU4RktuRUxMU2N2eWp1STNVWkxwelBZbEdueVIzTm1vclQxOTRnZjdKU0h0?=
 =?utf-8?B?VDlnd3FaWENFc1NZK0g3bzAwYnZieHloMUtuKytacWpHNW9uK3VtdU92WnZX?=
 =?utf-8?B?ZG5CcmhCc1RwdlFsSnRDWXlUZ1UzQ3pjUTAxUWdFTHkzb2RCcXBIWFd6UC9V?=
 =?utf-8?B?cFg4UkNCWGhpNjlZNUJrRlpGOVRBZXhYQkJadTdhME9kQmErNTFFUFllSnY0?=
 =?utf-8?B?eHlhMGJMUTJLaWV5ZkZKM1ExVFowaGlSaFU2YXZzcEZOcGNqTmFJSm5IcnVj?=
 =?utf-8?B?Zi9MUlBJR2IxRExuSmxocTBUemJ1bWxLWmpiTFQwc25RamU1MTdqTHNCMFgz?=
 =?utf-8?B?R3VjUGdFZGw3RndHVUl5TWhmWWZlSHVNVmFTZkx1bVFoUlVVMklIR0FQcUxJ?=
 =?utf-8?B?RUJDNXQ5eXBZTi9WK0lzMUczMFN4d1E1MlFaM29kMEF1U0VNYVA1ZlpDeTNr?=
 =?utf-8?B?TCtJUldmQ090WWU4Q2xIMEs1YjQrUXZkMmR4QS91aVJrRjRteXREbHB4RVEr?=
 =?utf-8?B?ZlNLcU5vM2J4ZU5hSVZ0RElQcE9vYkhnK1FvNEx6U09MeWVLYk9OQ0NXb3dO?=
 =?utf-8?B?eXBDUVUzYTRKK2RlK1Z1SHZhNERla1JmTDg4bnNCbndWTnNnSURZc2F2NzJr?=
 =?utf-8?B?K3Q1NWlicmxxaHVWeUZQZDRKNjZnREUzNC9jcmFLSm9nQUdiN3VNQWd4ZjF3?=
 =?utf-8?B?SmlMOHFNU1o4NnhTaEYyUUF0L0VjNnord1ZyajVmeEdvSm1ZUDk0OE8wT2Vx?=
 =?utf-8?B?ZCs5TzVUSDRqd3NQZ1NjZmpWY0hXUHJ1T3VabEI5eHV4Mk5pSXJGTUpUaGsz?=
 =?utf-8?B?QW9jRWNoS2VaZWR2bXBpNmduclc1cVF0T1RCQWJIQkh2ZVRHWjFFYWRsWFhE?=
 =?utf-8?B?UUhNU0FnU0NtYm5RRy9SMEZPWEVsa2hDWTNwb2NhTTFLdll6VkhVQkpuSU5U?=
 =?utf-8?B?bGZTQ2VVZEdVUTkxNHNYOGc5dm1lYktlc3BxaXgzTmJsQWZSNlBkSjNwbXFa?=
 =?utf-8?B?QzF3LzJxUmhjaTMycG4vK2tqK3AwNS9taUpqTUZzd0VSTGtkWGVzTHVhOEZV?=
 =?utf-8?Q?DdOAx5oW5ls=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU1IMk12RHZqZ1M0ZnBhY3F5K1ZvN2dFMkoxcmp3MkZEYWN3SnR2M0s0NlB2?=
 =?utf-8?B?dmRLK0xMdkJrS1NQVXNtckI1bW9mcGkxOXNCekVrVXZVekNWM1QranI5dDhQ?=
 =?utf-8?B?R04zcXEwTkxEZDllc3MyalJxZXpUbUEvSnAzLzJrYkJmV3l3MnpPcHpPd1ow?=
 =?utf-8?B?TlZUK0lvVkxZSjNaOHJPSWNoei95UzZSZ1hPYy9EMWgyWmtHOWx5TUM4YzBk?=
 =?utf-8?B?TlkyWml1T013aGZncFE4SjMvWjJYMVRjUE1GTmp3ZXNiUU1QZlpSMkd4YkJO?=
 =?utf-8?B?VVlkNlljczVjaWNGL3pHU01xSHNWSHBmTU1jb2RDNjExZGllUXZoMU0xWGhJ?=
 =?utf-8?B?TklXcE56aitTN25mRGRrczdZSFNPdldKaHJHZThtVXQ1NlJiUVk3S1dHcHAr?=
 =?utf-8?B?Yy9DM3ZGZWs2UmVITlNGdnBXOTE2TFFrbEg4Q1NwY3ZHQ202KytaQjVYeUVt?=
 =?utf-8?B?aHArc3RHc2lTdHF2Zkhwc2hiNmJQTk1HNnd5T0dTYnE4T0xOOG9kUXpjUlpv?=
 =?utf-8?B?RjBjYU5oRE5KenM3dWFOUjhNZHcydG8vRGVERmNOTzlRdy9Fc0l4OEVXU0VT?=
 =?utf-8?B?TUQwdEVJaUEvM1RqSUsxT0k1WmNYMDl2cmIvNjJ3TW1MbUNmbzlGQkFyL2tn?=
 =?utf-8?B?bU5GbDNPZklkczRwa1pvOFQvL1ZnYWVwMTVTY295d1g0NzMwcVlpMWtpVnlu?=
 =?utf-8?B?WHdwOVRmNFRuSmVRREFKWXRyUWdmUVBGWVozZUlXMDVwTjRrWWVUb0d3amhY?=
 =?utf-8?B?NE0rUnVSdFFuMWNaZ2RZc0FJc0lTdW1GeXZ0MytJN25VS21kaGpWNnBTamF6?=
 =?utf-8?B?NEZNSE50c0x3MGdJRFlRUXJ1Ky9BbUlYWkdFV21yVmY4b3NVbGQ2dU9aaFFR?=
 =?utf-8?B?aW90VE5rMFVQSDNFVnZVemxkclRuZU1pNllpMWFWbk1ydkg2dTAySVdLVkhi?=
 =?utf-8?B?Q2xiZ0tFL3VXcWxCYjFQaWFLMjZ6dS92N3k2clpwbFh6R1hIZ2p2RHlVcm1S?=
 =?utf-8?B?eldSd3VQaWNzbnY1RkZNdWNJRWNhRTRuNmorRFlTaUZsM0Z2K1JOSmVlWTg5?=
 =?utf-8?B?NGJCREVOT2VXSFVoekMyQVJWK1lXRFpVbE5FMHdweXY4T0E3SG5RN1FxaEox?=
 =?utf-8?B?aHNqQ1JycjV3cG1INEdESFFFWTlVUVNQV043WWtaamlNZmV5VTcrL0l4bENh?=
 =?utf-8?B?Wm10YjlYRVVDK2l5QVpCd3BIZnN1L0RxeGpZYUNKTHgzT1dMVWVxR0pWYXBh?=
 =?utf-8?B?SnRENGM1M3oybmJJV1QrV2lTNHkzWkVocStGRjljNTNOdTlWQ2Y1MEY2Q3Aw?=
 =?utf-8?B?cUV0ODhTOVloVVAzMy9DbVNJV2NuMzQ4WUFTRFcrTE5mVzJXMmpDY2NJNHdi?=
 =?utf-8?B?WThoMko5c3dSQVBsSkZjdVlDK3BTbFg5bWtqbjZBVGxacE4waTFFVXhuMnRG?=
 =?utf-8?B?ZjZJeW1NTWNOM0xoTDlDTGlZM25SVVhvSEx6VHdvWGhCVVRCYVRZcVBiaDZj?=
 =?utf-8?B?WVNjSGJNZ09HQStlMVFva2hJbkg3K0hwN2U2UkVXRHJMOW9rQWQyZXVaZjNF?=
 =?utf-8?B?OGVHa0pFSnRtSHYzb3E0bURFSXZWSDlsVUQ5OGJIQk9jR1ZkVENGek9tVVRV?=
 =?utf-8?B?eE5lZXhyNWZtckVYQTBZUkNpLzhxUVRGQW10UG0rNS8yaTYzcFNkdzRDdHdD?=
 =?utf-8?B?NkRJYTBvSTBObWZ1T2NnUFFjZnRKTXRiUm1xVENWaEgvRnd2UVFkaE5CZUFk?=
 =?utf-8?B?azRsVnFtem1ZM3BERGZZbEdJYVdUT3ZRL2pLVTdmZE1rK29wa1ZwNTd4VGRu?=
 =?utf-8?B?b2xRM0I3VjZjSnpBTEkrTUNVRzJOeE4rVHZCMEVsRHNHcUl2N3RjOFpjcEJu?=
 =?utf-8?B?TTdBaTJVeElybEoxbjhuOXlSZ0RIRW5VZGJKQjJpbkdERFFuWldSV2JvZ0pU?=
 =?utf-8?B?WVJ1WnBHWWRSOHUzLytRTkhkTDQ3amtQcVZXc0ZHTnRza0NURmtMUUVROC9w?=
 =?utf-8?B?YjNTY2FvNWxWMkRwV0VyTG1PM21HaEdqS2dGSmhoSVBmMEFnY1NvOUU3a3d1?=
 =?utf-8?B?ekludk8vakhoMi9JTXpKME9GcUJCelorT0g1MGhKUktZNERLOHJ2VUllckhN?=
 =?utf-8?Q?dYawIFgI/ehx7TfQATpiVr+FG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe03b352-203f-41a6-3363-08ddd1c08401
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2025 12:31:33.9697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqTBliMx3fX8p6P3jnAmiBg34hmfDyiOdlxv9kK+Crpzla/SCnz7WBEpfT5kMPu/paZygwuQB7Oryc6vK0PJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864

Hi Ilpo,


On 7/24/2025 2:50 PM, Suma Hegde wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
>
>
> Hi Ilpo,
>
>
> On 7/23/2025 12:40 PM, Ilpo Järvinen wrote:
>> Caution: This message originated from an External Source. Use proper 
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> On Wed, 23 Jul 2025, Suma Hegde wrote:
>>
>>> If all sockets are not probed, invoking hsmp_send_message() might 
>>> result in
>>> unexpected behavior due to accessing an uninitialized socket structure.
>>>
>>> The initialization of the sock structure can be confirmed if sock->dev
>>> is initialized.
>>>
>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>> ---
>>> Changes since v1:
>>> New patch to address the partial probe/removal issue.
>>>
>>>   drivers/platform/x86/amd/hsmp/acpi.c | 4 ++++
>>>   drivers/platform/x86/amd/hsmp/hsmp.c | 3 +++
>>>   2 files changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c 
>>> b/drivers/platform/x86/amd/hsmp/acpi.c
>>> index 15c4cedc2759..a2d91d4a3e02 100644
>>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>>> @@ -617,6 +617,10 @@ static int hsmp_acpi_probe(struct 
>>> platform_device *pdev)
>>>
>>>   static void hsmp_acpi_remove(struct platform_device *pdev)
>>>   {
>>> +     struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
>>> +
>>> +     sock->dev = NULL;
>>> +
>>>        guard(mutex)(&hsmp_lock);
>>>        /*
>>>         * We register only one misc_device even on multi-socket system.
>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c 
>>> b/drivers/platform/x86/amd/hsmp/hsmp.c
>>> index e05d824045d6..a4420db42781 100644
>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>>> @@ -219,6 +219,9 @@ int hsmp_send_message(struct hsmp_message *msg)
>>>                return -ENODEV;
>>>        sock = &hsmp_pdev.sock[msg->sock_ind];
>>>
>>> +     if (!sock->dev)
>>> +             return -ENODEV;
>>> +
>>>        ret = down_interruptible(&sock->hsmp_sem);
>>>        if (ret < 0)
>>>                return ret;
>> This is still racy. AFAICT, nothing prevents assigning NULL into 
>> sock->dev
>> because of remove while hsmp_send_message() is running and that can 
>> result
>> in dereferencing NULL.
>
> Could you please suggest on how to resolve this issue?
>
>

I will relocate hsmp_fops to acpi.c and plat.c from hsmp.c. 
Consequently, the module reference

count for hsmp_acpi should be incremented when the device file is opened.

Does this solution address the issue adequately? Is it acceptable?


>> -- 
>>   i.
>
>
> Thanks and Regards,
>
> Suma
>
>
