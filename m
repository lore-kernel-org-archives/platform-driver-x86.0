Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF722DF144;
	Tue,  1 Sep 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265468; cv=fail; b=BdlHUq6zR6xZEc6PVmppfRJMItZnnIJP8kHGD+1uMYQmkUsBFyYhdleP5BtskNi+93skaKD0T6zbCriiDWSjajtO5MRTzs4zFjMPsQXBzET/cS62ok2Qn0gju20f6nOSGU5Xsqji12kK0UxhUJ3oXAgS84X6agRZkdG3u1n0C7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265468; c=relaxed/simple;
	bh=N5wxRrMaelq4IHU3hS5Db7uh7S9xeRGFQVqR/2mdj04=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UmwYeVFUP9sMgPWtxKMWdGO2uInbtJvwGTXWZCvI1xg0cLqzx1VNUQ8CJMvX4iSkatuaSgcHSF/Qmzf7TnMbd5oILuTIb+ARx2tq3RcS1puFgTOEVC9M1WG4JppLCHSVVL2rVx4FKuxpzoa6B/QWM+cbtTfXMKe99dR7HA1wBz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WSSPMZoJ; arc=fail smtp.client-ip=52.101.53.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WSSPMZoJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3QcipJCDh6iEYJZs5bVtc7aytFFuy7MtyiKf3I+8pviXCloOygm9N9XhqGBpBS159LTq3fqGK0m15SniXFkTwIQ5iqjR4BoDgdAtgZGa0pI6iNnA+Av+za7ZFNxZ5N210cYUAnK/p5o4CHhTqbzVuvgSMgAseOi3LeK2yIFJe3EsOYZyYmICFBrq5t+k/W6u2kPK2gGw3192hzMBRhQcIEsl4Ar7h21UFpaOxAVajMHJwVf+SMjoqDF+cOeJGY38xwJ3iMgZaxjYx5eY+tTO6wGot6M7nIk1Ocxg5PTVA4Sepwb0Hg4kp3G+JIX0QeEodqVmkuGqjJ+SZ0Hi4UtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IvDss3URbNx6H1rXB50EI5hIfiFhW0ozX7MNjv/dbg=;
 b=lZyhjoGT5Z2QIDFXwk7BtVmriQZVyfM/0aUA7NcG9dnhN8JqEGoHHNU+8U1bsX8tFy8ltQZ1NEzfneTgggTkuV8tHlvm/hdHwsrTUIBZ1iFo4TeGZbqCoUlfCJLkyW1/Q+6hfHZsPQ/j6FNq7tkn8HVYKXi7ZIo3XB6GfTBP0hz2a13ZZTVLiuPd82DcT9lPZRIRbdHfRBR96v6f70ajTIBKFFmR7Nr8Frd3y4vLhe6wyBGN3njdd6S+LySBNufk0f1X8/vRYACVDA6pI2C0J3hWa/nfyEsdO3pW1c87tp0VCapZBfKnfYMbXaonBxP9hOBWCd+mQWHf4NJQtb63cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IvDss3URbNx6H1rXB50EI5hIfiFhW0ozX7MNjv/dbg=;
 b=WSSPMZoJIIxEp8xTmgR59RFOyRhh2zq5yF/rRzayeXh+p/HA6L0qd0CgF2rCgKQFH0zIWS5TT/HSQivjyB8yi/uDzZtmLJDg+DUKSLO0BbbrrEtlsczzR8x/iM9BDYVA+xvYLWUX5C3imuEGvdvp5ccSuuphjLEDBNeNjxTJO74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by LV9PR12MB9757.namprd12.prod.outlook.com (2603:10b6:408:2ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 12:24:24 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 12:24:24 +0000
Message-ID: <401f1265-553a-4738-952f-3c7199d206a1@amd.com>
Date: Tue, 1 Sep 2026 07:24:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Content-Language: en-US
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901045134.2833282-1-muralidhara.mk@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260901045134.2833282-1-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0021.namprd11.prod.outlook.com
 (2603:10b6:806:d3::26) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|LV9PR12MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d651c58-84a8-46bc-7455-08df0823f512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|56012099006|5023799004|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+NiJMneNI+cYR9uwooMf3ikzT+DqYqJrPwb0R7nTRjn1O6qGyPcau8YHDsCHkOFP/lQ7L8YBJSq7fHEkgIUrOquz7pIRFrRtjiGOScmX0zaEXteMmL8eLBTjvFTFMNp13d7EqcEs5j06Lhed2zRfYw2YEuOcjoIJ5w0pGhR05k6v3P7yuxOvIKPU9Llm9EVO0y5urbGVkah+TBnwbaIws5ZxWvPiTqZTb2cbJ6ucVSYdFASd22NLPzXx74WO+aQyESZi+/iEq6xRc9nwPMjqYeUDXWLQH1uX/sPqeNg7Bubh7DJlEYTJgt86Es7AeBhMbk9HagBOomyVnMfbb9ptqGoq/wTZa8l0IdWuJaG4GMGuZ9uZXm6m8HqPI9d0Gz3c4KBmSwiS4HLFGUMA4HWSfvrDF3ryb4eF0XdEh90UeFOGp/1tXeu7cQPON519b1Id406sVwUQu8PNez4w/fEXriXOy/y2cZ7EMU9W6PNKfA5IpbSyozUo+xP+sil/Fs3E0eYrpGHjCzTEzCHst+m7gEc0VTvmVvaOOHcJ/qT8ztw66sbnxZnDVleb65fj56mE1AzqbTPaxiNgATVHyBg9t5oTwJ8PbsTYYultJeplTifZlwP/KFuwhGpUaBfvWWgY3S80Ew0VM8Mt110yBte6wrVOxXCSTLlBCRyzokOOLpE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(56012099006)(5023799004)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUpucGZ5dDYvdTdLV1U5T09MaStseGNUNmxoUTNYRE1lYXJHRE9mNHlzVVU3?=
 =?utf-8?B?SW5vZmZQN1MyemtvbFZXajdlRHBxS1pRVFlaV2tTbEtML1Nyak40OXhRY0l0?=
 =?utf-8?B?TjdDREpTR3ppRmlsdWM0NG1aR3luL2lpWkhQeEJ3Q3hxbGJxMitzazF2UG1q?=
 =?utf-8?B?VE9VN2pOY0xEdGtFdFBXajFDRHNSZjlWcXFpd2FUOWJtaG5kQ3ZnbnZCNFFY?=
 =?utf-8?B?MnF2Ujh4Rm41TzY3RWpEamt6MEg1RWZ5dS9rM1pxdmI0Vmpaa3hTSlc3UWps?=
 =?utf-8?B?QmFXTTVRZElRSDQ4MDlvZ1kvbm9yenloVXdsMTNQZ3JadWc4VmVoVU9NWlYr?=
 =?utf-8?B?bjUrNUtNVDhVSldGL3FyZDliZnpLM0xhYnlrYlBsUkpndWpySnV2ai96ODFy?=
 =?utf-8?B?ekRqQzRKdFVPNGtCU05xaGFldjBuMC9IZDlBdFBvRnRTdmttYVlweGV4Q0Ro?=
 =?utf-8?B?V3ZNUk0zdmQ2WG9TTGJDZ1VLZDRueEVyNDlVeGpuQ1A4Z0tSd2JIbUJ1QXNF?=
 =?utf-8?B?MkNic3YrR3pkMXdLYng4S0pGUWF4M29ZVlJ0S0VGMjFMZTdCYUxXamhmaURo?=
 =?utf-8?B?Ym4xOXVGdDZJSXIzUXJpczNSTGVzWm56ZW5ZSkZuMHF1V3lGSXpZMzhuUEI2?=
 =?utf-8?B?bzdUdk1YU0IrSVpXTlFLT3lEbzBNRXUwa0lydVF0b21wL0FLT25TMVpJRDQz?=
 =?utf-8?B?UHlHQldaQWlIQjhWeitDdHJPWG5TY3VJb3hTdFZxOW9tSWEzNkNZNHh0eGdS?=
 =?utf-8?B?cExuNTU0TlpJZTNhM2xNaGsvWmF2Z2pRMUNvSm01UFFYc0tHWm81ZzA1MHNJ?=
 =?utf-8?B?SnVrRFdWWkN0c0hyczB3R1lqTmxEb3dGRldjL2ZiS241QlBReDlrYXNQUXcz?=
 =?utf-8?B?K01SMUU0c3pLR3k1ZjdYUmhzT1pBdDU4R2xUamlQMDFWR3M4bE9EallmbGZG?=
 =?utf-8?B?cTNZR1B3N3AyWGVoVkxSMXdrd3ljR21WNHVCQk9EL0ppN09mSnJMTlRHM0Jz?=
 =?utf-8?B?V0ZYNE5BQjVJUlpWQXFKY3BNeWtSSDZkbWVFaGt0QUltaE5zSE9Ub0ZQTVN6?=
 =?utf-8?B?cEJSMG56OWR1cDNRaU1uL1VvZ0R4eGNEaTluMDRzNDdDTUx0eWtSWEVXMmpM?=
 =?utf-8?B?ZFpudkF5R285TTJQTXhtQUhmTkh3bEpMVXJsVU5OK1VIalVEZ3lQcHp0NHZs?=
 =?utf-8?B?VWNrbDlkS1d2WUFuVmpFRmE3OFByOThHakw4Yzd3b0xZZDFOdUYrdmJpMDVI?=
 =?utf-8?B?V2dEaWoyeU5HQkdmbmpnTEpPd3l3K1dsejJ1N09ZSzNWdHM4QmkwcTNJckdL?=
 =?utf-8?B?WHBlZzdUNElhR1JJd3JZQlhRSFZLN0JaTUVPYjBUQzlMV0Z1MWIrTUQ5VmRh?=
 =?utf-8?B?dDFaMVFtaHZlOFZtMmhQZjBRbTJ5UWQ0ZlRSOTJPTEsxY1Q2aG12b1lvVXA5?=
 =?utf-8?B?UGpYUlFWUDJpdU5mRmRvZCtsd2NYL2dES04rWisrbW9qVDlUbTlHS1JFbjNH?=
 =?utf-8?B?cjhURTdONTRQL3I2b1FydUZkVXlIRElZRVZ2RHZuUzNVU0pldUV0cklDRnJn?=
 =?utf-8?B?U1owVXplekFiZU5CVWxwdmRrdDFPS0JLK3lUNFNTZUdxR0l5K1d2MXpFSzdX?=
 =?utf-8?B?eXlTR0t1OGZrM1M5STB1TmN5NHUwYi9WUUFvSFpIbVhVamdnVVFiOWZSS0Qw?=
 =?utf-8?B?blZCdFpDMUNxS2V5aEFpbWx1SHYrcGFINjMxdDEvcXUxU2RsYVQ4bklvSktH?=
 =?utf-8?B?Uk9PL1ZwcEoxVlZFNHJ4THZ3Wk54ZHIxUUVUTXo5SC9ZVzNHRkUvZjNDa2Y0?=
 =?utf-8?B?eXFSWGRjQ3VMaE56MFJkWDNwdnZxNVVOZ0JUTWRrZmlFem5xR3dqMWZVQURC?=
 =?utf-8?B?TGsrZUw4RzN1dElRdEdWdFlQbEFLbGtaZkNKRUNONjZjNEZrK3BhVzVWNEp0?=
 =?utf-8?B?UHNkSlVabWc1OWR6YmpZZHlmV05EUnJDT3F4NWxWS3ZiY2ZOMjVZQkdrRE4y?=
 =?utf-8?B?SVZFeHdjQUJ1a3hzMHZ2UDFWRU5nQktaalNHZ3BWOTJPa1YyYVBiR1I3ZGM4?=
 =?utf-8?B?ZVFYcHJISW5jelpHTk9pQXF3ZHBUdXVkWVVCTXhyWHg5bUNVWlBmOG1JenM2?=
 =?utf-8?B?NmN5WmpXb1VjN0FIRlJUOC9hSzZQajB3UU1FSmREUUd2bFgyWHFIdUNJYklI?=
 =?utf-8?B?UU1adnZ4ZnlQYko5TGtsZ2x0UlEvUUJzRStvQk1QSldkZWp6REx5MDgyYjhI?=
 =?utf-8?B?WFlGNHNGbXRlYkE1QU9TM1VwME5ZRFprMnhFSTYzaVZVWlRSTFVoTzNaMUFC?=
 =?utf-8?B?Y0ttTStIcG1sa3NiTDBTYXZDWXFsMUV1Y2RUdGtpL1lBam4zaHd5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d651c58-84a8-46bc-7455-08df0823f512
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 12:24:24.0229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGzayrlYCiRU+mp0tu5QiTe25r9RFZR30EIMi0PnUexlv4Awy2IvVk44nW3nIwGfbt6b9LppjmYdNhezSwqyUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9757



On 8/31/26 23:51, Muralidhara M K wrote:
> This series enables the HSMP driver on the Family 1Ah client platforms,
> Models 80h-8Fh and E0h-E3h.
> 
> The client parts drive a different mailbox from the server HSMP
> interface, but the latest BIOS describes it through ACPI _CRS/_DSD the
> same way a server socket's mailbox is described, and the parts speak
> the Ryzen Master SMC message set instead of the server message IDs.
> Patches 1-3 teach the driver the message set and let the client reach
> its mailbox through the existing _CRS/_DSD-driven MMIO path, leaving
> server behaviour unchanged, and patch 4 includes the telemetry table
> those parts return. Only the ACPI driver probes them.
> 
> Changes in v5:
> 
>    - Patch 3: hsmp_pdev->proto_ver holds the Ryzen Master SMC interface
>      version on client platforms, a separate numbering space from the
>      server protocol versions in enum hsmp_proto_versions.

Thanks for this change.  My tags are still valid.

> 
> Changes in v4:
> 
>    - SMU now answers the interface version query on client platforms,
>      so hsmp_desc_client.proto_ver_msg goes back to
>      HSMP_CLIENT_GET_INTERFACE_VER instead of
>      HSMP_CLIENT_GET_METRICS_TABLE_VER. Patch 3 is back down to just
>      the ACPI metric-table-DRAM-base change, since that was the only
>      other thing it did.
> 
> Changes in v3:
> 
>    - is_client_platform() now tells client and server apart through the
>      ACPI-reported PM profile (FADT preferred_profile) instead of a
>      hardcoded Family 1Ah model range, the same signal amd-pstate
>      already keys off of. Future client generations are recognised as
>      long as firmware reports the right PM profile, with no driver
>      update needed.
>    - hsmp_desc() now resolves the running platform's descriptor once and
>      caches the pointer behind READ_ONCE()/WRITE_ONCE() instead of
>      recomputing it on every call. Concurrent first callers are benign,
>      since every one of them computes and stores that same pointer, so
>      the pair only needs to keep the load/store from being torn or
>      reordered by the compiler, not order it against anything else.
>    - The client message enum in amd_hsmp.h is now documented with
>      kernel-doc, one @member entry per message describing its inputs
>      and outputs, rather than a block comment plus a same-line comment
>      per enumerator. Noted there that not every platform supports every
>      message and that an unsupported one returns -ENOMSG.
>    - Patch 4: the Telemetry Table RM layout moved out of the .rst and
>      into amd_hsmp.h as real kernel-doc'd struct/enum declarations,
>      giving userspace one authoritative definition of the byte layout.
>      The .rst now just points at struct hsmp_telemetry_table_rm. The
>      structs are now also packed to a 4-byte boundary to match
>      firmware's actual layout, and the trailing NPU/PMF counters and
>      spare padding firmware carries after the overclocking fields are
>      no longer missing. Verified field-by-field against AMD's internal
>      metrics table header and end-to-end against a live snapshot off
>      Family 1Ah client hardware.
> 
> Each patch builds individually and is clean under checkpatch.pl.
> 
> Muralidhara M K (4):
>    platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
>    platform/x86/amd/hsmp: Route metric table through the client messages
>    platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
>    platform/x86/amd/hsmp: Document and expose client telemetry table in
>      UAPI
> 
>   Documentation/arch/x86/amd_hsmp.rst  |  24 +-
>   arch/x86/include/uapi/asm/amd_hsmp.h | 407 +++++++++++++++++++++++++++
>   drivers/platform/x86/amd/hsmp/acpi.c |   3 +-
>   drivers/platform/x86/amd/hsmp/hsmp.c | 269 +++++++++++++++---
>   drivers/platform/x86/amd/hsmp/hsmp.h |  27 ++
>   5 files changed, 696 insertions(+), 34 deletions(-)
> 
> 
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72

