Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4311D24886A
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895705; cv=fail; b=uXcm4UYvkHrQ/FQ9iGtr3GwkaWP70TXQp/+GcR+9EBwiN2uQPpPE4Q3R3L1rxPfDhE6IAw7xToGQ3oFIPHbD6Y7SwfHPjqr0vBTNvHWiD6F4HWTnEH1w057qs8KqyrRBXzburZiCuEO4P5kmDvaw1581Iz13DUOK2nSq96TfUD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895705; c=relaxed/simple;
	bh=E5rk/kKWx5oViBKMgDxYoY5jg2X9kkYOdrdQqG1DK7g=;
	h=Message-ID:Date:From:Subject:References:To:Cc:In-Reply-To:
	 Content-Type:MIME-Version; b=RfQVgbFT3gsX/+PPbznmJOUp4OqIL1cwG7nMoLolEfE06d+lScmpmv2utGfHD0k5WjdC3bKKTtVLheZCYjtP06UOV8xe2PkJlBtGYYjv9MbIPQ/nWjdNA1KwczDSZIekLBS72V9EYP+KkFy1JV5lXfq2fj7MHsPVYA5JNXwqroY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SFW4U/H7; arc=fail smtp.client-ip=40.107.94.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SFW4U/H7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BguZeglE7hets7GiuS9SqCNkfKXCYEnJ5D8WT+hqFq15xuFwiTGVydn5vjwYxsqWsGosw+OZtYtxEu44kLxX7Gm/iXhXSu7FwTMIXXuqjP4dX61HBo9pXt2Yqwy6s6+tqalNOxJ9+jKYxWqEPCMptvSzLqi13+PZFytNBznoEHMrE81wdiVQi4EEY/VnwJvyIl5aDmAhemhWRE7WrWwQJpZ8UModnjAhAIqGoR5nlvmHp6aj8pAFZbwEljgwHnJ/uw/CDYC7jDgLRO0h7YTqHub3rksPAv3k2DslqETBFcp7vnRkQix+qjQ6tVP2tpS/Qj3weiT0hqBDCD/VwG41mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7jICaBtHBRSqr4wsH6v1pdgehZhSnIu64B6U8YauwY=;
 b=CMx/1zSvZj/2VIfCe6egqeJYPgwpNYF6GfttZQsfHzVcx2EAPrstpCqPLyawYoDQwsfMm4xu69zwdBDQZuqfpWDBhgJNu9Pi/497hyOr+BTazIHfz+1C5ON6B2Z/Sdp8Qv6Rk6NDp+KCCAvd2a87znfTE5W699F9DCs1Md7fG8yWVe8OPCSuz4kxeEkDykpXewxyeFAgy980H/FPp/oIHIEAVrBT1GM5SoLi0WJ/GjV9ZHhpqEMUpVvIUmJPDEH7xmLyzSFIJvzl6PZYMY6BA99ZDbF318OMEU39T0iN4wTPVVnovNghKyyTepVoZIcg+C4E+1TRoXTotLLdzZ4sdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7jICaBtHBRSqr4wsH6v1pdgehZhSnIu64B6U8YauwY=;
 b=SFW4U/H7UOr+FquoSIsFQ7TF7FCAluj1YzYx0VOq6P8u28we4FW5YnCtFQBK+69VrF+1dp3GuWrZfIV4fM4rumbZwbQvRjuyuaG+o6fv5Mm0I5dW7dbmlgNsi4+Af7Ew9P5or5CLnSa0WCsqlPOc8l1GyxNlOamVnMHyEM0euK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DM6PR12MB4402.namprd12.prod.outlook.com (2603:10b6:5:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 13:15:00 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%6]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 13:15:00 +0000
Message-ID: <ceec4b79-eb14-4326-b3d4-ec46626ed72c@amd.com>
Date: Thu, 17 Apr 2025 18:44:55 +0530
User-Agent: Mozilla Thunderbird
From: Suma Hegde <Suma.Hegde@amd.com>
Subject: Re: [v2 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to show
 HSMP telemetry
References: <20250325060457.3643613-1-suma.hegde@amd.com>
 <20250325060457.3643613-3-suma.hegde@amd.com>
 <ef159e97-6ae9-0646-2488-c2ecacad2243@linux.intel.com>
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <ef159e97-6ae9-0646-2488-c2ecacad2243@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::10) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DM6PR12MB4402:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b916a5-8ba3-4efd-2030-08dd7db1dba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHpmSEpUOHRza0JuVTFiQk5KOGIvaHZmbnpoekpyRUFFZjNsNnowUXBBMTFU?=
 =?utf-8?B?NXhwUkhhbWlPVVFRVVhTK3k2QW14RlpYMWc2dGRDYWIxS0RaZUZaVEQraWZV?=
 =?utf-8?B?eHpNY3Y3K214R3JnYUZhQ3crYXg2SUdlMitONUt3cllTTEdRRmpqQXFHWG5j?=
 =?utf-8?B?cmdMdTEwSjFkeWdIdzVuL1RZZlA4NTg1WWdRNEU3T1BjbDd6Nnhwb0w4U2NF?=
 =?utf-8?B?NklHM3E2b2RHc3JGN0F0VHJqR0dsYTVtdmlNWERZZS8wU0FGWm5PemtrOFlB?=
 =?utf-8?B?QzM2NXd5QzdTWUd5d2ZWb3VSTmJ5Uk52aHJyNUtyOVhTMkhKTkdpQ1hWZWpT?=
 =?utf-8?B?TzdvMlR4Q0JoNnJrRDh1VFFDVXMyUlBzdjlXN2ZEdk5ZZDBvQ09GWFYyem5v?=
 =?utf-8?B?NDFTN09Ebk0zdWNZVFZnTHJrY0dCZWs4UFRCRkYxYWpDR3oxVzdSK3M3UE9n?=
 =?utf-8?B?ck9Idm44WjVRYTRkcm5PbXQ4cmVDS1c4OFR5MUZmSE0zQzl5U3lhNFU2Sk5l?=
 =?utf-8?B?dWs2NFdJbG83MHpyTTFMdXJhZ2RqellNcXVSTmlnRGQxREdOekhuRDBDTDZh?=
 =?utf-8?B?MXpCcDFXQk43aUhxVE02RzVPY1lZdHJjdWZhOXNrZ2pQbVpHb1NZNnJrOEZR?=
 =?utf-8?B?bVhpK2lrSVFxb05MZmZXVDhraUNLaXE2KzlYRHg3Tk5zY3FZeUI3VEZwNVdl?=
 =?utf-8?B?N2JBdVNWYmIvM0g0WlpNVWdMem5ERGVjQ0xSenhDbGk5MGcxZ3RTWWVzTTZk?=
 =?utf-8?B?T01wb3JrMVhjN3E0d25yOVg2RGZqVkJCZFB4b0JmTmZGRlc3cldhOWtOZEV3?=
 =?utf-8?B?b1Bia081YW1iT25iWG1OOUtUK2t3ZCtMN3RtQmxIamhmUmMyVW9XUGRVblpq?=
 =?utf-8?B?WEppVG9GRUJKaHEzUEMzeFpFVmpHeTJkV0J6ejhOVm1vUjVWYlN1Nk1HMkRx?=
 =?utf-8?B?ZTVDbVAxbk1DVnNTOVFyU0RjQThidTNxREdnemFZbGhoMGJVUXJteTFVOGVy?=
 =?utf-8?B?T1N1UGFtUnYzWlF6eTREbm1kUnltWmJDNUJLdmtYMjNGYS9tWkVRRXkzR29D?=
 =?utf-8?B?OEpvcVBqTjZkTERZMVZ4cWM0NnYyYU1temNFTzdrSlN1YU8yNGFnRjJLK1F6?=
 =?utf-8?B?aTgwRmhKWUNqSHkwblc2MGg0YmNtVElZaFgrTG9ianhVbUdQVHRSN2JoTVAx?=
 =?utf-8?B?Vmd1TTZ5Y2FacWxNbCttSlpnYzBJcnNWUHVLaGpvdEFCd2RYUVZ6TFhJSWIr?=
 =?utf-8?B?OG5hSGVhOW93YmpNMEFDMmU0RkIzbWIrbVQzSXpUbVo1WTA5VTF6T2YyUEYv?=
 =?utf-8?B?aE5ISHFHWFAxWGZhOHFzUm0xenJtL3dBeDU5bExNaUowanUzVndSZU9rWUE4?=
 =?utf-8?B?Q2F2cyt4aWF5RmF4c3hRUjV4TTNoVWJzWStEaHAxUU9xTGFUekg2VjdFWDM4?=
 =?utf-8?B?U0JaWXBPVGQxdURyMDRiK01FWGREZ0YrdHQ2SXpqRGRoYTRiQkNYYVBJSHZh?=
 =?utf-8?B?R2N4c2s1VDJvd1A1b3NCWkxKWW9CVWlKd24xM1k0RGZrOWk4NWozM3hWMlFu?=
 =?utf-8?B?ajRuOU1EelJ6RXlDR3k1c1pXckY3blEzYkpTalZTNkNtKys5R2J3UUh5RXdu?=
 =?utf-8?B?MlUzWGt1ZU9PMGhPWXU3UFl1L1FhenBrU0x1K01IbkRNNUt1cTdMeXUwbERn?=
 =?utf-8?B?Uno0TFpNN3l2R09INnRCdWxkN1U3dDQ4cTZXeUJlN2xYY1JObWdMcmVsWkRn?=
 =?utf-8?B?VmVZby93Zjg5bDlSZHMvYXVCcVNLTlAxaU1rNU5sWEd6S1Z0SHVQM0p2VVdY?=
 =?utf-8?B?blBOQ0pjT1NHSXdURDcwdktJbTFJVy9YRHdVZnVxZ01PUmwyelhoNWhKeFFz?=
 =?utf-8?B?ZU9pTXpBNlpOcmZIdVg3YTQ3SEZ0UVBaNE1nMUNyUnQvUFFYRW1lNEFvcWJp?=
 =?utf-8?Q?hxn+Mzc95B4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFg5MjVpTmNpYXphbVBvdWxlZE9JSU4xVlJUTmVRNlJCUzF2QVh4L2wyRUlK?=
 =?utf-8?B?N25KbDdqNTdKTS9CbFlKMkNSTWFkeFRPWDhaQmVBSC82RUlra0tZUC92N1J5?=
 =?utf-8?B?c0Z5eDRVL0VwYUJSQjVoQitNTlpEYW5HUHpTelFxNXd5OU9md1N1NmZvTXYy?=
 =?utf-8?B?Ym5kUXNjSmtKWldlMHc3T2p4dkpOMUwzNnlFbGN4NjNWVVh6Lyt2MkVtVlJ3?=
 =?utf-8?B?WjBLVWNSMHJRV1UvRy9OcTNQS3k2U3ZzaURueTBxbEkwQ25JOVg4WjdTV01t?=
 =?utf-8?B?ZWdpRHlRZGgwWjlTU1VBcjhCSU8zNTFXZzUydUlGNXVqamtabnZFZ284L0pZ?=
 =?utf-8?B?TDJBUURsdy9OMkNKWW9ZKzQxRm4xZXpkN3J1Zm1mUHZjMVBiWGp6MFV1L3d0?=
 =?utf-8?B?RjdGajRKWE1RZ2s2bldlNVFtNkN4SFB4SXZzT05VSFkyWmQ5RXZJMElQS1Fn?=
 =?utf-8?B?MUJIRVd4Qk1aWnp1TzhyVEhGZ1NBa1N2dTlRRVJseXdwdTdmbm9TQ3lQUFJH?=
 =?utf-8?B?SUw3YTdGcnpmVXR3K3RwczlHMkpQYXo1R0FEemF6MUhNT3Y5d1hCU3JiMU5r?=
 =?utf-8?B?RCtiUjN5ZEtIWkxYWHNPRThhRVpxMVN1SVFmd2Q5dGNEQTJLbmh1SXNqTkJw?=
 =?utf-8?B?eld6aFVnSlF3TnA2MTVtOWp6ZEFWM1daU3dpRzlpek1uK2g1ekxQRlNFcUJE?=
 =?utf-8?B?REpwUlZnV2M3V2ZRczZiNmNRVkJJZlFMQTBsd0tXTThRU0I5bDMrSFpJaUdi?=
 =?utf-8?B?K08xZXFLYkZSdGsvZk9KZU9BSzBGM3dycXFlOEpvQkpVSnp0ZnBtRml0OTZ3?=
 =?utf-8?B?ak9uV1M5NzA5d0FLdElzTHBZQUVsWDRUYVJrNXkxMkp5R1pXVmlKN2doQm9t?=
 =?utf-8?B?b00rOFRMbHpvTmpkY1c4TDBveGFzTVRhckV2cUlLZE95L0hBeGozZCtlVE5z?=
 =?utf-8?B?eHAzelB4bG1hNjdKT2tDendLNm1MNkVMQ1c4bEVnNjBCNDlrSC9JTURRQUls?=
 =?utf-8?B?YmJzVCtERGx5ZW9MQjAwL2lGNzJja0MrbVVuVzFWb0FvQjN6emhrMGNiOEFC?=
 =?utf-8?B?K1N3b1ZJOGFlK3NQc0ZNaUQvdis4dGFEVFdvVUM0c2ZhTTFTMnZyVFpxZ3dR?=
 =?utf-8?B?UFZkS0lydk9WYnkzOWdtb21UYmVvcmZmd1gvK285VFRhdmgyRnROSGhuTWR1?=
 =?utf-8?B?K0JLQ3dyY1l5WGh0VDA3S3lOeTNIRTZ0RkhjVjhNUFY2L28wU2pIT0tOdzhr?=
 =?utf-8?B?YXYwK2pEZHZvRWNESEZBeHJOWWJGdnQrN0U2bk9WRDZwVEpVVGsvWU9OSUxp?=
 =?utf-8?B?MUFleUZkZVgydEdnbkt3YnFzV3RuWkNCLzhob25IUzk5aUc4WnA4SldrU1VB?=
 =?utf-8?B?OHNHdllVN2JRR1FyY1daVGZaNnJJWE5ZT2VvVFdjb252clI1UjhwNWd4WFFH?=
 =?utf-8?B?TnlnajFQWHJBalFqam1NZmtnczM5Z29wMW54RlhEWnFxMU9LNEZlRTZtZVlZ?=
 =?utf-8?B?cVZIQTZnMXZIRkdtZFJySEM0dkh2cEFjd0ExVjI0RWQxbXJ0N2dhanJzeDZY?=
 =?utf-8?B?L0Nzc2NOR3RZbFZJZlladUhXZmNCSXpURW9nQzNPNytPTGRRb2xzTkN4VVA0?=
 =?utf-8?B?TC9MeWsraXl2djlOemJUK3RPSmxGazJlUVZZRmMveEovaVJqOUx5aUg0ZzRW?=
 =?utf-8?B?OFVQWFVJMmUrenFTN1UxUG5iMG1LZ28rZGsvNlc2NW1XQmFTVjNEdnprUVpP?=
 =?utf-8?B?Z241eC96UTVUamxoMWVjQ0ZxM2svQTgrc29vcWZ3ZFlXaHZVNHVmRUFDdWFI?=
 =?utf-8?B?R3d2NGlzbWhKTGdwOEtzYUNkcVlkdTUwa3Z2WklML3czWWI5SGFWUkZCcnFD?=
 =?utf-8?B?M3hqVWkwRDFPVWRrSjhGQlB6U1drVlJrZ2kyRFdJekVkbkxMWEVYU1pNSTQ5?=
 =?utf-8?B?N2tVU0c1NEl3bmlpNkhNa1EzaGFnL0RVVTRFQzNpRjF6bEcwRDlGMWZla1pO?=
 =?utf-8?B?TXhsNXB4b0JXeXhERzFDOXkwcjNrQ3hpaW5VOWlEaDdncHdkS2wwZ0ZtOEp3?=
 =?utf-8?B?OVd6MlpYRkJ1MS9NZy9Gcy8yWFgxOFpHNUJjR0Q2cHVhK25RV2pxZk9zZE1C?=
 =?utf-8?Q?9NF+1ELI9Ibyp/Sw+NNBYuJHg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b916a5-8ba3-4efd-2030-08dd7db1dba3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:15:00.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPuYnFniuPekNn+c1lOirY5WWk8umfoRclnXIIzQUkF2ZbkfkIB5iLY0o13HcL2wIIbB+dlwpMt3tr6LtSyzjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4402

Hi Ilpo,

On 4/11/2025 4:33 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, 25 Mar 2025, Suma Hegde wrote:
>
>> Make frequently fetched telemetry available via sysfs interface.
>>
>> Create following sysfs files per acpi device node.
>> * c0_residency_input
>> * prochot_status
>> * smu_fw_version
>> * protocol_version
>> * ddr_max_bw(GB/s)
>> * ddr_utilised_bw_input(GB/s)
>> * ddr_utilised_bw_perc_input(%)
>> * mclk_input(MHz)
>> * fclk_input(MHz)
>> * clk_fmax(MHz)
>> * clk_fmin(MHz)
>> * cclk_freq_limit_input(MHz)
>> * pwr_current_active_freq_limit(MHz)
>> * pwr_current_active_freq_limit_source
>>
>> Signed-off-by: Suma Hegde<suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi<naveenkrishna.chatradhi@amd.com>
>> ---
>> Changes since v1:
>> 1. Add linux/bitops.h
>> 2. Define DDR_MAX_BW, DDR_UTIL_BW DDR_UTIL_BW_PERC FW_VER_MAJOR FW_VER_MINOR FW_VER_DEBUG FMAX
>>     FMIN FREQ_LIMIT FREQ_SRC_IND and use them in functions.
>> 3. Return early in hsmp_msg_get_nargs()
>> 4. Change while loop to for loop in hsmp_freq_limit_source_show()
>> 5. Correct the GENMASK size in hsmp_ddr_util_bw_show()[bit 19:8, instead
>>     of bit 20:8]
>>
>>   Documentation/arch/x86/amd_hsmp.rst  |  31 +++-
>>   drivers/platform/x86/amd/hsmp/acpi.c | 259 +++++++++++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.c |  21 +++
>>   drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
>>   4 files changed, 305 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
>> index 1d7b159a35d5..45a209fd5861 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -71,6 +71,25 @@ Note: lseek() is not supported as entire metrics table is read.
>>   Metrics table definitions will be documented as part of Public PPR.
>>   The same is defined in the amd_hsmp.h header.
>>
>> +2. HSMP telemetry sysfs files
>> +
>> +Following sysfs file are available at /sys/devices/platform/AMDI0097:0X/.
>> +
>> +* c0_residency_input : percentage of cores in C0 state
>> +* prochot_status :  reports 1 if socket is in prochot, 0 otherwhile
> otherwise
>
> What's "prochot" ?

prochot is a condition where processor is at thermal threshold value.

I will add this explanation in the document.

>> +* smu_fw_version : SMU firmware version
>> +* protocol_version : HSMP interface version
>> +* ddr_max_bw : theoretical maximum ddr bw in GB/s
> Please capitalize comments and documentation properly.
>
>> +* ddr_utilised_bw_input: current utilized ddr bw in GB/s
>> +* ddr_utilised_bw_perc_input(%): Percentage of current utilized ddr bw
>> +* mclk_input : memory clock in MHz
>> +* fclk_input: fabric clock in MHz
>> +* clk_fmax : max frequency of socket in MHz
>> +* clk_fmin : min frequency of socket in MHz
>> +* cclk_freq_limit_input : core clock frequency limit per socket in MHz
>> +* pwr_current_active_freq_limit: current active frequency limit of socket in MHz
> Is that "active" a meaningful word in this or would just current frequency
> limit suffice?
The term "active" is included to ensure consistency with the processor 
reference manual.
>> +* pwr_current_active_freq_limit_source: source of current active frequency limit
>> +
>>   ACPI device object format
>>   =========================
>>   The ACPI object format expected from the amd_hsmp driver
>> @@ -119,13 +138,11 @@ for socket with ID00 is given below::
>>
>>   HSMP HWMON interface
>>   ==================
>> -HSMP power sensors are registered with hwmon interface.
>> -
>> -One hwmon directory is created for each socket and following files with 0444 permission are created
>> -inside the hwmon directory.
>> -- power1_input
>> -- power1_cap_max
>> -- power1_cap
>> +HSMP power sensors are registered with hwmon interface. One hwmon directory is created for each
>> +socket and following files are created inside the hwmon directory.
> Please fold documentation paragraphs at 80 chars.
>
>> +- power1_input(read only)
>> +- power1_cap_max(read only)
>> +- power1_cap(read, write)
> Don't these need space in before (?
>
>>   An example
>>   ==========
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index abbb680b9c71..803da111a034 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -13,6 +13,7 @@
>>   #include <asm/amd_nb.h>
>>
>>   #include <linux/acpi.h>
>> +#include <linux/bitops.h>
>>   #include <linux/device.h>
>>   #include <linux/dev_printk.h>
>>   #include <linux/ioport.h>
>> @@ -36,6 +37,11 @@
>>
>>   static struct hsmp_plat_device *hsmp_pdev;
>>
>> +struct hsmp_sys_attr {
>> +     struct device_attribute dattr;
>> +     u32 msg_id;
>> +};
>> +
>>   static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>                              u32 *value, bool write)
>>   {
>> @@ -243,6 +249,214 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>        return 0;
>>   }
>>
>> +static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>> +                                          struct attribute *attr, int id)
>> +{
>> +     return attr->mode;
>> +}
>> +
>> +#define to_hsmp_sys_attr(__attr) container_of(__attr, struct hsmp_sys_attr, dattr)
>> +
>> +static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
>> +                                 char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret)
> Reverse logic and handle the error first. Only on very special occassions
> can it be done the other way around but the normal principle is check
> error and early return.
>
>> +             return sysfs_emit(buf, "%u\n", data);
>> +
>> +     return ret;
>> +}
>> +
>> +#define DDR_MAX_BW(data)     FIELD_GET(GENMASK(31, 20), data)
>> +#define DDR_UTIL_BW(data)    FIELD_GET(GENMASK(19, 8), data)
>> +#define DDR_UTIL_BW_PERC(data)       FIELD_GET(GENMASK(7, 0), data)
>> +#define FW_VER_MAJOR(data)   FIELD_GET(GENMASK(23, 16), data)
>> +#define FW_VER_MINOR(data)   FIELD_GET(GENMASK(15, 8), data)
>> +#define FW_VER_DEBUG(data)   FIELD_GET(GENMASK(7, 0), data)
>> +#define FMAX(data)           FIELD_GET(GENMASK(31, 16), data)
>> +#define FMIN(data)           FIELD_GET(GENMASK(15, 0), data)
>> +#define FREQ_LIMIT(data)     FIELD_GET(GENMASK(31, 16), data)
>> +#define FREQ_SRC_IND(data)   FIELD_GET(GENMASK(15, 0), data)
>> +
>> +static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
>> +                                 char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u\n", (u32)DDR_MAX_BW(data));
> Why are these cast necessary?
Since FIELD_GET() returns an unsigned long type, I used a cast to avoid 
compiler warning.
> I'd prefer naming the fields instead of making them function like macros
> and using FIELD_GET() here.
>
>> +
>> +     return ret;
>> +}
>> +
>> +static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
>> +                                  char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u\n", (u32)DDR_UTIL_BW(data));
>> +     return ret;
>> +}
>> +
>> +static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
>> +                                       char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u\n", (u32)DDR_UTIL_BW_PERC(data));
>> +
>> +     return ret;
>> +}
>> +
>> +static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
>> +                                 char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u.%u.%u\n", (u32)FW_VER_MAJOR(data),
>> +                               (u32)FW_VER_MINOR(data), (u32)FW_VER_DEBUG(data));
>> +
>> +     return ret;
>> +}
>> +
>> +static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
>> +                           char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data[2];
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u\n", data[0]);
>> +
>> +     return ret;
>> +}
>> +
>> +static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
>> +                           char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data[2];
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u\n", data[1]);
>> +
>> +     return ret;
>> +}
>> +
>> +static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
>> +                               char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u\n", (u32)FMAX(data));
>> +
>> +     return ret;
>> +}
>> +
>> +static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
>> +                               char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u\n", (u32)FMIN(data));
>> +
>> +     return ret;
>> +}
>> +
>> +static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
>> +                                 char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret)
>> +             return sysfs_emit(buf, "%u\n", (u32)FREQ_LIMIT(data));
>> +
>> +     return ret;
>> +}
>> +
>> +static const char * const freqlimit_srcnames[] = {
>> +     "cHTC-Active",
>> +     "PROCHOT",
>> +     "TDC limit",
>> +     "PPT Limit",
>> +     "OPN Max",
>> +     "Reliability Limit",
>> +     "APML Agent",
>> +     "HSMP Agent"
> Add comma.
>
>> +};
>> +
>> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
>> +                                        char *buf)
>> +{
>> +     struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +     u32 index = 0;
> Either use unsigned int or size_t. u32 is not the right type for this.
>
> Also, why you need to initialize it??
>
>> +     int len = 0;
>> +     u16 src_ind;
>> +     u32 data;
>> +     int ret;
>> +
>> +     ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
>> +     if (!ret) {
> Please handle error first and return early.
>
>> +             src_ind = (u16)FREQ_SRC_IND(data);
> This casting seems overkill.
>
>> +             for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
>> +                     if (src_ind == 0)
>> +                             break;
>> +                     if ((src_ind & 1) == 1)
> Unnecessary == 1, and then unnecessary parenthesis.
>
>> +                             len += sysfs_emit_at(buf, len, "%s ", freqlimit_srcnames[index]);
> This will output an extra " " at the end.
>
>> +                     src_ind = src_ind >> 1;
>> +             }
>> +             len += sysfs_emit_at(buf, len, "\n");
>> +             return len;
>> +     }
>> +
>> +     return ret;
>> +}
>> +
>>   static int init_acpi(struct device *dev)
>>   {
>>        u16 sock_ind;
>> @@ -285,6 +499,8 @@ static int init_acpi(struct device *dev)
>>        if (ret)
>>                dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
>>
>> +     dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
>> +
>>        return ret;
>>   }
>>
>> @@ -299,9 +515,52 @@ static const struct bin_attribute *hsmp_attr_list[] = {
>>        NULL
>>   };
>>
>> +#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)  \
>> +static struct hsmp_sys_attr hattr_##_name = {                \
>> +     .dattr = __ATTR(_name, _mode, _show, NULL),     \
>> +     .msg_id = _msg_id                               \
>> +}
>> +
>> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
>> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
>> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
>> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
>> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
>> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
>> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
>> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
>> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
>> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
>> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_show, 0444);
>> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>> +           hsmp_freq_limit_source_show, 0444);
>> +
>> +static struct attribute *hsmp_dev_attr_list[] = {
>> +     &hattr_c0_residency_input.dattr.attr,
>> +     &hattr_prochot_status.dattr.attr,
>> +     &hattr_smu_fw_version.dattr.attr,
>> +     &hattr_protocol_version.dattr.attr,
>> +     &hattr_cclk_freq_limit_input.dattr.attr,
>> +     &hattr_ddr_max_bw.dattr.attr,
>> +     &hattr_ddr_utilised_bw_input.dattr.attr,
>> +     &hattr_ddr_utilised_bw_perc_input.dattr.attr,
>> +     &hattr_fclk_input.dattr.attr,
>> +     &hattr_mclk_input.dattr.attr,
>> +     &hattr_clk_fmax.dattr.attr,
>> +     &hattr_clk_fmin.dattr.attr,
>> +     &hattr_pwr_current_active_freq_limit.dattr.attr,
>> +     &hattr_pwr_current_active_freq_limit_source.dattr.attr,
>> +     NULL,
>> +};
>> +
>>   static const struct attribute_group hsmp_attr_grp = {
>>        .bin_attrs_new = hsmp_attr_list,
>> +     .attrs = hsmp_dev_attr_list,
>>        .is_bin_visible = hsmp_is_sock_attr_visible,
>> +     .is_visible = hsmp_is_sock_dev_attr_visible,
>>   };
>>
>>   static const struct attribute_group *hsmp_groups[] = {
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 8c05e1415820..65d37605bf88 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -229,6 +229,27 @@ int hsmp_send_message(struct hsmp_message *msg)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
>>
>> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 n)
>> +{
>> +     struct hsmp_message msg = { 0 };
>> +     int ret;
>> +     int i;
> unsigned int.
>
>> +
>> +     if (!data)
>> +             return -EINVAL;
>> +     msg.msg_id = msg_id;
>> +     msg.sock_ind = sock_ind;
>> +     msg.response_sz = n;
>> +
>> +     ret = hsmp_send_message(&msg);
>> +     if (!ret) {
> Please return early on errors.
>
>> +             for (i = 0; i < n; i++)
>> +                     data[i] = msg.args[i];
>> +     }
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(hsmp_msg_get_nargs, "AMD_HSMP");
>> +
>>   int hsmp_test(u16 sock_ind, u32 value)
>>   {
>>        struct hsmp_message msg = { 0 };
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 0063904904ed..febc1672bd65 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -74,4 +74,5 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>>        return 0;
>>   }
>>   #endif
>> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 n);
>>   #endif /* HSMP_H */
>>
> I'm pretty sure I've commented some of similar cases against your other
> patches in the past. I'd appreciate if you try to take such coding style
> comments always into account in future patches too so we don't end up
> going back and forth on trivialities like that.
>
> It might be helpful if you try to "review" your own patch before sending
> them out to see if you missed something (it might surprise how many issues
> you will end up catching by simply looking through your own changes before
> sending them, at least I find many issues that way from my own patches).
>
> --
>   i.

Thanks and Regards,

Suma

>
