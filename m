Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E82248BE
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758016714; cv=fail; b=N+kMVjqtOjHIr2StMxqjJw0I/P1ABbBPCyJ3OXblrSB+gnt1v5/E2zvnupveeupGKSB/jKb5gmixpoMhmkxb2pg97LnBrSZhamVQbsTH5t6JwpeFoXzSUoxNvndJVU+6jmKbH778NpQqjFNbtBLG4Ao7HySIIFHwhowhzSFif4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758016714; c=relaxed/simple;
	bh=Buzd94mAx9XkYRDeX8mByPKUS7wEubXlvak10OUWXo8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RTUqXKJt7ZQpWG6ys5cjrcbHOwKZlESqqbuzLNIXyqj1f7Vew5Yl2TB5sviWWrU45idtJ37jdsaV7NNBhKg1fqv0CPYAJwML2y4TNjxkchLbTvvehANl1WOdQNlDV/Vmqp4KeyrSdr6lwmEns0TIO1lWg7+5ngn7QHXbVliSVEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pnh+BgOV; arc=fail smtp.client-ip=40.107.200.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pnh+BgOV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLUuD1bGoFzMeVTppyfGZEV1/W/8ZpC8TtGUD+4FutxVpzasLAlou0zVyp7wzo67DiAETclQwebxaeTOXgznJcaLr4xKag9acXO6xwatjzo+NjD3yq1ICYSxeXaa/rNDh5LUsIiMxWl9olzbgzRVbiRi5ovT+wSpyoe6dKHV+YFn1A7OnaP99LoeUHbCClJDJ5joAUB5k9ZVglp8bBZxwmOge4MlkpCuQaXkI7bHqgyoqWjdQkvV7aw1f5tDqN2CxSHTqkDzFcIEOtRESagGg6LU/rF5WVKmgvWA1yY8o6uIgTY3kOiJYbIBOfcJEja71UxnIlPJbsVv8ovgl3380A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v30+KBU/N+vGXja3xBmMbPNpzqm7tmAjrp8bokpq0DM=;
 b=EOguzAeU1s37F6tBbyYfDd8aTZR4Z5/b0hseYe1ZeupFwMVWlvzN6oUcy+fwkFCewlwCd6A2+ApYD1+0Lr96Im4kwZeuAogbeTFe5yscHC0N+09xu+4q3XogKgJ9s1sz2yaM+EuLLEEtuiPrAmOpCehJKDyhhhw7us4oImnprVblCAgH34HNSR8DvqMq5PFAILwiGK3VG6GMpueNBWvyz5GNlShED5sDkfdNWN1L8pd3QdsclR3R0SjcJuqdQcvAXhcRfhgKwJh3X06fgpV7M8BCAO+ajFsm+OTm4u/0iAneFXlfUulFdocYq+3R3o8YyFLSXr91MvN/y1EmbVz6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v30+KBU/N+vGXja3xBmMbPNpzqm7tmAjrp8bokpq0DM=;
 b=pnh+BgOVfh03qKtcnA/pr9bg7ofJtYqYOo+68xhWIuGUrN7kWB0jL/vi5bZyejZqpa/1eoqBigP0gRbRYIjITR6FyayIYBwYFFyXgAHVmjdP2YIvrdtUcO11Smge1mYhSyXwE9MuIV2Wy/w1l+iep6Ft8Rt+4zDC6hlVDA8B2xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by DS0PR12MB8270.namprd12.prod.outlook.com (2603:10b6:8:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 09:58:29 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::c8eb:eeb9:cd73:b236]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::c8eb:eeb9:cd73:b236%5]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 09:58:28 +0000
Message-ID: <5f425e5f-5428-488a-911c-2be61302bc90@amd.com>
Date: Tue, 16 Sep 2025 15:28:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/dell: Set USTT mode according to BIOS after
 reboot
To: Lyndon Sanche <lsanche@lyndeno.ca>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yijun Shen <Yijun.Shen@dell.com>
References: <20250915094154.2765361-1-Shyam-sundar.S-k@amd.com>
 <9fac1d5b-9ee0-4867-bf2b-1f4128c1f17a@app.fastmail.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <9fac1d5b-9ee0-4867-bf2b-1f4128c1f17a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::14) To BN9PR12MB5177.namprd12.prod.outlook.com
 (2603:10b6:408:11a::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|DS0PR12MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: a3eead9c-af33-4f0e-891c-08ddf50793e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlJyMDVBek5Da3h2eVZCVWpNd3JGOHhReUg0NldWUDZhSGRZbTZCOC84aWo3?=
 =?utf-8?B?WnZMWnRZRDE3bFJKZ0NkM3UrMkU3cjc2SXBFYmlCSWlzOWpBU09pdnpudE56?=
 =?utf-8?B?c000UktPbEUxSWFENGxTSG1ieWNURmVxR0xBZ25TNWdqd3lsZ2dkY3NmOW0x?=
 =?utf-8?B?V215amdQeWZtL1RGcGlwcVVycXVWMEZINWFHYXlhN1dtMTJTbVVyL3lwRE00?=
 =?utf-8?B?MFA5YWZ1c3ROclQwM3krYThJMUk0a1ViYjJDRG1oTmZoVmxYWTJ0MzBWbjh6?=
 =?utf-8?B?NElVcnF0TGdUOUg5K0JkdTUyV2VqRm5jbEdzVTRQQm9rVm9oOXVMbTQ4RnIv?=
 =?utf-8?B?VDFXK2xaNlNiRmJ2WG9HeEFpWnF3UGpxM2lIOWs3VzlXYWdOUnYzcXdjaE95?=
 =?utf-8?B?T2JIU0p3WTJCLzVBZ3F3VnZtZDRtcEFBZHVtR1l3YndlUldJejA5a1JKRHpj?=
 =?utf-8?B?TzAwcTVjaFNndGYwSEwzTHRXYWpjQVJhVFBGMjIwUDN3aUp2MEduOUp6Rnps?=
 =?utf-8?B?ZjJHSjdLQWRER3FqVlR6QlpiZyt1TVZKRmdySzNrdlpxbnZGdXU3Sld5VGE3?=
 =?utf-8?B?MnhURmVCQUE4VTZJdFFwazBGNEQxL0l3SUJXcHl1eFNhWGc2SEYrRmhWWE5v?=
 =?utf-8?B?R1kxZ3ZzQWp5ZzFjeVQ5NE00dlhQMDlUZk5QMHJGYUdBTE9mTTQ2eUtkQW05?=
 =?utf-8?B?ZURKK0RUTEluTTVTRG9oSFRJWlRGMDdqbEozN01xMzd1TnYyU3plZC8wTlp1?=
 =?utf-8?B?UEZQSzkwaTRwdGNyeUx3ZjYzOXVwUGdrU0xLVUpXaWowTjlMMHd5SFA5bDlk?=
 =?utf-8?B?TXRXaDNuMSt5Vks3cEhNRThKLzNGN1dVMkZmNDhDcDRtK3ZTVjluaitMOFhH?=
 =?utf-8?B?aGFkSmMyVDdLWGFLSEU3Q01iN1FEVlZwR2N1TVpIZlB1Y1crcmkxS0s4YmUy?=
 =?utf-8?B?aDZWcnpHbE5WczJ3eU9wQ0R2YU5PcE5zdnYvZ1NUKzVmUTM2dTlwSnhuV01s?=
 =?utf-8?B?eTFJUUp5RWtBZzNxR3E5RmlGdEtNWWNXVllwN1hIL0FBOHdEY2R0Z0dlWVMw?=
 =?utf-8?B?elhTUVQ4cm5FQ0lVQ3FGZHlHeGIrK3hNWFBGTEdDbGRyWXlKNkxFMUFsU0tn?=
 =?utf-8?B?djM0TndBTiszT2tNQm9RSWIxUTU3VG5kYlI1M0l1Nk9IMzcrbVM5a2RqazVo?=
 =?utf-8?B?SHNSa1lNSm5OUmtCNCtJT3N1K3NyNlIzem9tWUlSeWZENUFYaVV3UUo3MVZi?=
 =?utf-8?B?VmhpL21rNDVFbWpkUzhNK3VOM1EraHNKWlZYdHhsaFRyQ2N2U0M5bGlSZUEv?=
 =?utf-8?B?MWR3czVkTTcyS0VFRGZML2Zuc29aWnNqREhQV3lVa2xnZGpGbG5ZNyt5S1hF?=
 =?utf-8?B?Q0R3YUM1TSs2VGVINW5UODhTMk5nT0FiUnJqenNra3ZMZ1FNR3duWHJ5LzBo?=
 =?utf-8?B?ZWtRcytmVVlxUjJEOUV3cmp2dmlyTllhMlNqNExSNFJ2dVNISzBUL0NEblJ6?=
 =?utf-8?B?alk1cUc2a3dBRnhVMmluSG9YYVNkRjJrWm02bzJHYmZ6dHRSYXF3NjJMZDVk?=
 =?utf-8?B?Z3VqNGQwVjVYMDNmWnNSVHJUeGdyK0JhT0E3Uk1RTVRwM0FVdnVHTXBJVU1D?=
 =?utf-8?B?OVh5MkRzVGV2eWlVZURjcm9TNkxxVzM0REtya2hjalNkUkFHcmhLbzJUbk5o?=
 =?utf-8?B?bG1HcW1kRnR0eUF5RkZZOXFZeUdrYmJwTGZpc0QxYWJHc1dUMVQ3ekYyWkVv?=
 =?utf-8?B?d0s0cGxXV0ZqMTRpNUxzWGRBRVMvZjRYWGRCSnRQaGJvZlVKeFRXM2FMVTQ3?=
 =?utf-8?B?NTlvcThva040TWJPSlJubGVJR01MdDNvMXFoMXk3NWl6OGVVdmtvWUxYLy9o?=
 =?utf-8?B?cHhDeXFRb1k4bUFxOURXU0t6N3F6TVhxZ2tUSW1oTXFjSVFoTVhYVTNMWmtp?=
 =?utf-8?Q?Uoa1UfCH9nI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OS9wMk5ndUZkYXJLeUpRSWZGWTVvRy9ZSW5JNmE1WlVKd3JQU0krWldLM2da?=
 =?utf-8?B?Nm1Hb2JDZzZDWW4vMFFBa3MwL2syYmJyNjRKa2ZKY3hMM3IyODZuNWtwMmZr?=
 =?utf-8?B?VlFJaWY0Zlk4emxJVWFFUzRBSEtncjZGbnIwVXpDdGp3MG9NcXRjcEg2RTB4?=
 =?utf-8?B?aHFYbGYreWdrK1BqN0ovVjBRbTBoZUpWWU9PSWtlNGJaR204R2ljZW5uS3NI?=
 =?utf-8?B?ZzdsMHIwd0tYbE5oYUxJMXVwM3U3TlUxVkZQdGlqWnlhbVJDemJNbzdFUUox?=
 =?utf-8?B?d3h1aUJWUzU1enVTcS9pWCtQVmREQTJXUTlTeFJ4UzV2c2FPZXlja0VNUDcr?=
 =?utf-8?B?KzFlbk1RL24zR3JLcExhQnBMUGFYb0l4bjM1elRBTnpaWU1nMklJMGk3akhu?=
 =?utf-8?B?SDJJeEI0WjJTcitGTGQyYy9mZGw0bUFnSEhvNThaNStCZjNBYUVyTld4YlRG?=
 =?utf-8?B?UzQyM0NncmVmSDJ4akpXb1FWSUN1eDBGVmFuNjN1dVViM2VOR1k1UFRYMWs1?=
 =?utf-8?B?UEM3d25IME9YUkEzQjFtak9UKzZlWHo2TUJTenltNHpoNWU5aTBaKzBpQWdF?=
 =?utf-8?B?RkIyUWFrREZ5aEFPRFBUUEVlR3VhVVhFeXNydVJjZG52UHJsWjN5Y0tvSmNi?=
 =?utf-8?B?TllmVi9xaHk1TVVUZ0I5OWNCYjc3b29vVE1Vdmh4Y1pjTk52Q1VRK1FKakRN?=
 =?utf-8?B?aUtGYWRyUU5mdGJhMHNsNW9WY0lqMTAySmJHcXhaRTUyL3BDME1uOWtwajht?=
 =?utf-8?B?Z04vbWxIOEg1c01pamp1L2NtYTJqYmwyRXJ5aFY4VDZaV0NhZGYzMkd1ZEI0?=
 =?utf-8?B?UTZodDk2MUlZbm9xTWhOdHU5bXErMWdxY2NPOUZqZ0NaWko0emRsL3ptQTRS?=
 =?utf-8?B?MHZZd29zeUUvanJTSG9qbWc0QTMxbWpXcXo5aVZLUzNMVW9hNUQzWUp3ek0y?=
 =?utf-8?B?alR6cHFuTFFsVjZtaDNnQ2d3ejZNOHdLMWZWbElTekJIOXREWWdFQ3UxY2ND?=
 =?utf-8?B?Mmk2djZRbEowL1p6OElaZUVHWGxQLzF1cXdpWW9hVFExSlJCanh3RFhXV29p?=
 =?utf-8?B?ZnRyanpBQk85N01CS0UwZGx2VFdKcGp2d0FBV1N0VlliQjM3YzR0K2EyVVBR?=
 =?utf-8?B?VGdFOW01R1Zac0MwSWpyMTM5WWxnMFM1eEU1Mi9MN1BsOFA1RXhxa1RqNnM5?=
 =?utf-8?B?Y2UyWVNESmJMTjJ5QXQ4di9sUXFOWVhLT1JrOXNnSCs2dlp0TDdya1V3Y3Fo?=
 =?utf-8?B?Z0l1SGdKUGdML0FhMVBIRm1PMHhlK3pjc25OUEpXR01STWJPOTVTQXZwd0Nm?=
 =?utf-8?B?bzc3MHpWWit4NGxrSEtGNUhXZGF1UVB2eGlqMGl1bWsrMzNrUHRoNWFlcDhM?=
 =?utf-8?B?LzdKZEpJQ1ptbml3emZPTXFlMkIyVVc4dThkNE1XMlpLdGd3YlFTclVyNlc3?=
 =?utf-8?B?R2M5d3ZpQkxycnFHU3k2ZW5oZkE1ZmtLVXUwbHF5ckN5RDhIL1djRzkxa0FJ?=
 =?utf-8?B?RTNPN3ErUWdWMWpwczA0a2FRdE1kZjZCQ1ZGbEdSOW1ZRTZHRmlFa2Q2WTY4?=
 =?utf-8?B?ckF2RFJ5N3l1SW5vRk4vV0NOUzBCU1hXOHhTQnRIY1d0MWVRZzAxSmgyeUpL?=
 =?utf-8?B?M1BYdU9zL1BRc1pNbnZKS2dsZXNFaVZDenJ4VnhtNm1nRTI4TGJkdldOUmto?=
 =?utf-8?B?ZWVHTTFheFhIcnZHNjdlbnh0NjQyVlpGQ05BYmZKUjhCcGp0VGI3OXhIajdD?=
 =?utf-8?B?UHU4dThWSXNYdkwzNHppcnZLWVZQL1lEZ3ZlZEFWTm90VlQ1Y1Z0QkorYnhy?=
 =?utf-8?B?RG04QzlnUG9HWmljQXF6dlE4SG1SOWRmcEluQjg2L2RFNlpmRHFOTjd1bjBl?=
 =?utf-8?B?Y2VFVXVWRXhGZms5bFJaYXBBVVE4cm1sbUUzQUFvY3ZSbEtpQ2ZyZ0V1Nzh2?=
 =?utf-8?B?dVpFSnBuMGlic2RNcmE0WmJvNUxQTGZZYm5hM09ZREhZQVVJbllnT1RobU5R?=
 =?utf-8?B?MzJBVzMxSkFveFJXOUFXY2VtTmtJZEZ5ZHhMLzRYUDFVMlBLdzdHOXZ2d1Nh?=
 =?utf-8?B?RFFOa0pNbUpreUc4UFl3azd0b2xob3c2d0w2Nm9MUlZYRld6K3YybFJSVFBW?=
 =?utf-8?Q?B16kgJuYqwjjF51oQjUf1X1q9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3eead9c-af33-4f0e-891c-08ddf50793e0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5177.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:58:28.5582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQIzZN2uu0SaFpyVJVzOWqZJUEwHFsnnvEm/0seTlcDP0KDHAmSwsOfayhee1szYR0O0PzIyQCDke4pExjaopw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270

Hi Lyndon,

On 9/16/2025 00:24, Lyndon Sanche wrote:
> On Mon, Sep 15, 2025, at 3:41 AM, Shyam Sundar S K wrote:
>> After a reboot, if the user changes the thermal setting in the BIOS, the
>> BIOS applies this change. However, the current `dell-pc` driver does not
>> recognize the updated USTT value, resulting in inconsistent thermal
>> profiles between Windows and Linux.
>>
>> To ensure alignment with Windows behavior, the proposed change involves
>> reading the current USTT setting during driver initialization and updating
>> the dell-pc USTT profile accordingly whenever a change is detected.
> 
> Hello:
> 
> Thank you for the patch. I think I need help understanding why this is not working currently, as this is implemented in the thermal_get_mode functionality.

Okay. Let me elaborate:

There are scenarios where the Dell BIOS needs to send specific events
to the AMD PMF driver. The `amd_pmf` driver registers a handler with
the ACPI subsystem to listen for these events, which should originate
from the `dell_pc` driver. However, during probe time, the `dell_pc`
driver lacks awareness of any changes to the USTT value. As a result,
it may report outdated USTT data, leading to incorrect thermal
configurations.

Further debug revealed that Windows adjust to changes in USTT and
behave accordingly.

To align with Windows behavior, we now read the current USTT value
during the `dell_pc` driver's probe phase. This ensures that any
updates are captured, enabling the `amd_pmf` driver to receive
accurate information through the ACPI events it listens to.

> 
> This change, upon my first read, seems to read the mode from the BIOS and then write what it read back to the BIOS. Is my understanding correct?
Yes, via the dell_smbios_*() calls.

> I do not have a computer where I can change the mode from the BIOS, so I cannot test that specific case.
Okay. Alex (Cc'ed) from Dell has tested this on Multiple platforms.

> What does the platform_profile get set to on boot without this patch?

"custom"

Thanks,
Shyam
