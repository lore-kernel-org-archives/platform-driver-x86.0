Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388F3CB577;
	Thu, 30 Jul 2026 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404673; cv=fail; b=f2h6MwQCofukEPzastT9XUxZtN2QHfcq5LmXgLgP4D64TC9mPHrkbh6ZsFVDubZdb7W4PFA/Mi0zC3lb8070ds5wHmpKx9gpvQL7vakTGIcg07PVmd1vrCJA1wzt+veJhdr0dXYg9+XGUQcTW/QTTgAgci1I89j48dq5RIOPCYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404673; c=relaxed/simple;
	bh=lpVxg7CT1yBrtFkMRLLiN4SB+1+5J9eQpBrWj4Uf+aM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jkjfCSi1OwmzFzJmtx4ZNbQhdZ+Q53JA4uJmONKp14OS2fYcB+LUNOI4cfXmy4VmVRfnpuSlMfqq0kwcBYCV1WayV/SjJ5h48itu7tL9FoDquRNjHRYDM+yAfUD0jhMAhSL6whpMmZTitpzBLtqrsHCxTdGMWCivdGOGLSU3WaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m0xd5CTZ; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m0xd5CTZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaFrmB9mMvTajSTPzXBJZ8Prnv7r/HEsTrXemZDdoez46cXId9MpZDoZ6+sKlYRmp8CefInbiPrmjtQ0OOaPtzO/KZ/8i/0LxxTdbh1BEeRUbCahxfilvnlNM42ROEy13w5QIy1vKLuDqG7Ye1E3cOVFmBhw2/zy/X58zSnrIyAQBx2qSi54P6fD5oRZ8B0TdcFRLH2EX3q/rINdfgYWz41AAV8ysbwzm2zSx5gJwJ/1imF+mIQi02vOf0u337kL1ybL/zLwlR8nFfQZy7m7iu6BkEIZfWlBed79fCrgz0lb7EkAJ0igOpebzTQafIoGi8uVRxHfZ5IMynPOJoB/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2DNTKiFukAJvu5gITreVNSmRfEbvzsmOMRHq7sKH/Y=;
 b=ffjxfSydsmwtzKOvZD+M4NwH1p84JZ2wFhJfTupaDZ3DDzVk9MY611CGZnkoslEIRVWXkO8lB2mX4BbumU1NxAlMF2UFmiWHoszoYik6wiPGaE2p4LW+1k1sjOpdBYyY2pph68fMVS5ZijeOIsbWmrTZXTsnxJeTH/EmyyuSwJ5NtKrlttbJt3xNS2yXCKqct/7iiKdTlfO19q11TV8nvgpdqOZcbZTGMZ9zvz3G52bI4pY1y249EWYCngHCmxmcFw99itt98RXOKoo0rhuLOUqLvGXwXOCbjKwzP6JYTnVeYMTAUEoUuWnifPIe41rb8nxJaoDD0dqEErra9kW7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2DNTKiFukAJvu5gITreVNSmRfEbvzsmOMRHq7sKH/Y=;
 b=m0xd5CTZVw+DSFOd409KexLLrFBw2yBTYei1wyM0hi8mTFRh0P8RWw0PefvrTuyyVei/yvxHRVPifGDzffUOZS9DBoWtUxs2TJiGrnUW7HZFLtgWWEv3uG5FEQQ1erg4tfqSwWM2B7gFWXdSC0yqcI7/DKDyVk/TujeFdC0vKEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 09:44:29 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 09:44:29 +0000
Message-ID: <f347b2ec-8333-4449-83b7-3c2f14b75403@amd.com>
Date: Thu, 30 Jul 2026 15:14:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] platform/x86/amd/hsmp: Add ACPI client support via
 the SMNR method
To: Mario Limonciello <mario.limonciello@amd.com>,
 Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-4-muralidhara.mk@amd.com>
 <e8a4a7e9-4e1f-4c00-80ec-84a37c74eb2d@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <e8a4a7e9-4e1f-4c00-80ec-84a37c74eb2d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0266.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::14) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffe4f6c-2727-4f55-a1e1-08deee1f2627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|10067099003|5023799004|11063799006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AQvq1shAZxWMLOvLeAQP7pyuKmPugusMhUQ5Zy7BjrYoym/1stjKaPgWiSakusrzzN4ehfnqXmQACVzXOYn7g081N6sIdZTseO6RGZQnjay01QwoFLhVuJ7zdcuxfZrZSpQAEgEJ/79lJBSa1geFWitRfWRGjCJoVnIRf5oZkFfSDiS1bVBUm5s6Hqk5RYXmk8MyCbNiV6oeKAy9wi9r2uToqJbhg+LBDuFAIBcT5z8rxRmNLkqAD5Tsp//M4fHpBIKqn6IrWhUl4ig9yF1N/LJpRAon2LVP+qm6ML9OBnWBuYZ6aewkgKtjFUjL1kqwaoYgsrkya1Dk5jfSVv+fuwnEV3BvHMJaSor/14D/dvkQDft2sYSFQ9EgBD39prSwS2HzywhHXabJJSDbWvDtR9BShcUN9XtZoGhJvenfrJlRGev+Qn5jeC2R2jjIbeYwk25WKoTcn8fFQZ6LNIPQENadFJQY/d/W9H61C+/hSj+VJM6RSVNBN2gJM9GOW2q3m3H16oawl7s8jfrr43WZgn4eeX1re4uMFxCsPRwds2wrsFniW/zbb+ahggBXN+TDsNd+/xp6HAx8DsRo2bVSFv3LhCa0kqiBeEUFgz4xkb+LiYZbghjDd0Azow96hKu2OEvsEV59ddBCcUugDG9y3TlWEzztK7ACMhuPMh3NVOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0NWOFlHN3gwUkpwbEt4eWxhUWgvM09XZVdJSi9BUmJsaXdrdUFaOUMvQU83?=
 =?utf-8?B?NmdNaTIzU253dnpMbkFzT3dJZjBqUzhUV2R2elR6Q21waldpYy9aaGcrMDZ6?=
 =?utf-8?B?OThUbWYvandhd0puZUgzYkcvOHVCdnk3WEZOSGg0UlprUmpGRW5lSzN6Z2w2?=
 =?utf-8?B?cTZlQmpQdk1qdXF0RDk3YllMbmhsQWFPVlpHams0c04zYXAvYndiOFZubXgv?=
 =?utf-8?B?YVR3Z3pHMlVQRHU3NmFBN3RqZm00aDdsVXJCaWNkRzVnT2FtTlZqMGhhVDlM?=
 =?utf-8?B?YlRyQTFPRDJKclp3bHJRZ3pmMGVPaWMvNlpjV0Q3VUpoMysvb21JeFNhQ0ow?=
 =?utf-8?B?eDVvOE1kK0VUWDIvdlgxc0o2dFI1QlJkUGx6T3hDOTM3Q3dNenVVM295MUMx?=
 =?utf-8?B?ZElGK1VEd3ExZC9mSE1WVEU4T2t2NHJYVzN1a2JWQ2VVaE9GOXdIZDA4Rjhp?=
 =?utf-8?B?Z0VxajQ3ZUorYXVyZWhyUTdGRXJSaGI0RzNHN3VPU0FzcjdyNnJDYi9CajdE?=
 =?utf-8?B?TjdUYlA2U3FkZk8rT0xSdlJlZDJEMTZsaXN5K2V5TU95TW85R0hNcUNZdVVH?=
 =?utf-8?B?cUpuTU93N2J4Y1dHNmYvRlEySXJVN0lUWVNNMm1aRVVST0ltek1XZDdTdlpJ?=
 =?utf-8?B?S2wySDQ3NkFPSE9VbWtwTUFDSnVtSi9hbVpTeXZsYWk2RWVhTFNmVUI3ZGVS?=
 =?utf-8?B?SXI3OXF1TkNQV0hyaHV3TVMvS2UwTE95ZGJSY2hnUlZNOS94dmEyUlNHcjkv?=
 =?utf-8?B?VzRTUCtEcWF0ejJkSlRldEdKd1l3ZkhFSHBMOXd6VDhBWElKdUhLdFQrVk1r?=
 =?utf-8?B?ZndsbHdhS2ZBOXJiTlRCVDBtcE00MEZjelpjYjdRRjFLc2dNV0VWajlLbDZo?=
 =?utf-8?B?ek93a1UvRVY2dkJnTTg2eTh5NjFSdExyL3hUc2VOMmFHK3J4UDBCeDhyZjEz?=
 =?utf-8?B?ekcvL240MVhnZ3F4NE9mTjNjeVFCMDVQamVkR2FYOEdZTURGQjVsc0E3eVli?=
 =?utf-8?B?cm9KUFZscHZ5TGlERzV5cjM2UzN4dDU3aENMUFNhQzhTTndlc3RkUWdVMkRP?=
 =?utf-8?B?VnY0dmwxdXZOc3hkSFNHMFoxRy9DY08yaUJueW5qNnNieWU3bE44UmZUMlBC?=
 =?utf-8?B?VkUxV2ZjR0xZd3lHanU5RmU4ZVpJZ2pnUHptYWNVci9oTWlWOWhFZUo1REE2?=
 =?utf-8?B?TkFDWlFsd21ueUk2cS9uYTNvTERnUlBIVm9mZ0p4VDJSUHFjVFdTTEhKdXlG?=
 =?utf-8?B?U3VuUE4rR1lvdlpFdy85bTZhMmhGa2drdHgzbFYxOWZWVVE5UWtmOTUxR2x1?=
 =?utf-8?B?WUVPSW5yYXFmRHVlK3lnWUZ6QVo5QnF0OHB5Vi9haTZUMjl3cEFTdVI0NGUw?=
 =?utf-8?B?amdsYjdnRHpoTVo3VUR5SFI5YXFQTjhoMUNvWmVLeGR3QXY3MW9ySjZpMFJO?=
 =?utf-8?B?cVErZDhaMEFIL0xXYmVqR0lHY1NjZ3p3eGN6MDdyd2ZHa3R5OGJaU25pNFk2?=
 =?utf-8?B?YUYyMTRCcUpNdVpDUEVmWXNMTEd2bFZFVHRXZkVhNEdRbGxiUjFGdHdtdEwr?=
 =?utf-8?B?WUw5TjZLQUExVzlZV3NwdUxHNm5qK3BiN0c3UzMwalhLS2ZZbTk5ZzVXS1Jp?=
 =?utf-8?B?aG1IS1R4UGd0clpaSHgxazhWblFrZG04YktOOWdML1AvbmlLaFVPMnVhTWR0?=
 =?utf-8?B?VENTSDNmejhrZVQrRldoR0xTbE1WWS9OWlQxTDRNTWkwQWc3eWNsdjB1REF5?=
 =?utf-8?B?Sm93Snk3Z2FjbVk1YVVpcXBLTFpKYUpkb1JZSWNJTHBnbFgrWmtoVUJvUzIv?=
 =?utf-8?B?ZEhHUnBTNUFNSUd4d1ZiN1dnNmxUL3BUNkN1S1lEVEFJbmxmRjRxb0RsM1Y0?=
 =?utf-8?B?VDJjbnBvQ29SVy92VmZnUTZZU3EwdVlsRHVQVHlrdzN1NGg3NVB5ajg3VE5K?=
 =?utf-8?B?bnNLdTBUa2xjcC9DSWNFcjRqRWkyeDIxZ0NqM1A5RFA0ay9nSkFnWGVteFpa?=
 =?utf-8?B?SVBlZUxWMDlLSkdFT0RaZ04wN1BJcWdybUExZEd6N0UzS05zbGtBclA3YWZv?=
 =?utf-8?B?cVZQSWdOOWU5ZUg3eXk1MTVINnhJL05GZXROSlpPOXQ4VGdLWlNmb2pUL210?=
 =?utf-8?B?eHgxWTArTWZTVXUyOVlaQklQaWRPMVVvNG54UTA3T1J1U2t6ME90dHlCaDdE?=
 =?utf-8?B?SUFWc2k5L051bTlKLzZ0NUpsbG1pM1BHYmdLbEtBYkpiSjhZelRaakxoaER0?=
 =?utf-8?B?bk5mS1BPMGM5KzM3WjZtaklNSytFZjVzYTREVUZtZ1R6ZHlya21GWS9Mc0dn?=
 =?utf-8?B?ZnhxWFppakpjeDU2VitPYTdSa0N1QzViV1ZxcEh2aWpPQ1B4eEExZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffe4f6c-2727-4f55-a1e1-08deee1f2627
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:44:28.8647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: romlo9mNvG+BcfWkQnBSirbx6idOaZwqzG3CM6SlUXZgeievzQ4+r2xZQHyFya/PeV85AvPI4omACSncSJDg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995



On 7/30/2026 3:00 AM, Mario Limonciello wrote:
> 
> 
> On 7/29/26 11:40, Muralidhara M K wrote:
>> On the Family 1Ah client platforms (Models 80h-8Fh and E0h-E3h) the ACPI
>> HSMP device (HID AMDI0097, ACPI path \_SB_.TELD) is present but, unlike
>> server platforms, exposes neither a _CRS memory window nor a _DSD
>> mailbox-offset package, and names its socket differently. The probe
>> therefore failed in three places:
>>
>>    - hsmp_get_uid() requires the server "IDXX" _UID form and rejects
>>      anything shorter than three characters. The client device carries a
>>      bare socket number ("0"), so the probe aborted with -EINVAL before
>>      it reached any of the code below, and without logging a reason.
>>    - hsmp_read_acpi_crs()/_dsd() found no _CRS/_DSD and bailed out.
>>    - hsmp_cache_proto_ver() issued HSMP_CLIENT_GET_INTERFACE_VER
>>      (msg 0x3), which this client SMU rejects with "invalid message"
>>      (0xFE) even though the mailbox is otherwise functional.
>>
>> Handle the client explicitly:
>>
>>    - hsmp_get_uid(): strip the "ID" prefix only when it is present, so
>>      both the server "IDXX" form and a bare socket number are accepted.
>>      A _UID that is neither still fails, as kstrtou16() rejects it.
>>    - hsmp_parse_acpi_table(): for is_client_platform(), skip _CRS/_DSD
>>      and take the fixed client SMN mailbox addresses from the platform
>>      descriptor, accessed through firmware. Reads go via the read-only
>>      SMNR ACPI method
>>      (TELD.SMNR -> CpmReadSmnRegister, the same accessor used by the
>>      AMDHSMP Windows driver's amdtelemetry_Acpi_SMNR / 'RNMS'); writes
>>      go via the kernel SMN helper (amd_smn_hsmp_rdwr), as this device
>>      has no ACPI SMN write method.
>>    - init_acpi(): treat the interface-version query as non-fatal on the
>>      client, and call hsmp_get_tbl_dram_base() whatever version was
>>      reported so the metric table is fetched with
>>      HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR, mirroring plat.c.
>>
>> As on the server path, the client branch publishes sock->dev last with
>> smp_store_release(). sock->dev is the readiness gate the data plane
>> tests with smp_load_acquire(), so it must not become visible before
>> the accessor and mailbox offsets that this socket's mailbox access
>> depends on.
>>
>> is_client_platform() covers every Family 1Ah client platform (Medusa1,
>> Olympic Ridge and Medusa2), which all share the same client SMN
>> mailbox, so one branch handles them. Server behaviour (pure
>> _DSD/_CRS/MMIO) is unchanged: the _UID handling still strips the "ID"
>> prefix those platforms use.
>>
> 
> Why even bother with the ACPI one? Couldn't amd_smn_hsmp_rdwr() handle 
> both read and write?
> 
Mechanically it can - I built that variant and the mailbox does come up
on the Model 80h system here. But it drops the one thing firmware still
provides on this part, so I would like to keep SMNR for reads. v1 did 
not explain why it was there, which is a fair reason for the question; 
v2's commit message now does.

The reason is the missing _CRS. On the server the mailbox is an MMIO
window: firmware describes it in _CRS, the driver maps it, and every
access lands inside a region firmware has vouched for. The client
supports no MMIO window at all - there is no _CRS to read and nothing to
map - so the mailbox has to be reached in SMN register space at fixed
addresses that no firmware object describes.

SMNR is what closes that gap. It is the BIOS method that validates the
offset it is handed before returning the register, so it is the client
counterpart of the _CRS window the server path relies on. Going straight
to amd_smn_hsmp_rdwr() for reads would mean the client is the one path
that reaches its mailbox with no firmware validation anywhere in it,
against hardcoded addresses. Keeping the read side on SMNR also keeps us
consistent with the accessor AMD firmware exposes for this device and
that the Windows driver uses, so a BIOS change to the telemetry window 
is picked up on both.

The asymmetry you would be right to point at is writes. The device
exposes no ACPI write method, so the message ID, argument and status
writes in the handshake do go through amd_smn_hsmp_rdwr(). I am not
claiming the write side is validated - it cannot be until firmware 
offers a method for it. What SMNR buys today is that the addresses we 
read are confirmed by BIOS rather than only by our own table, and if a 
future BIOS adds a write counterpart the accessor is already routed 
through firmware.

If you would still rather not carry the ACPI round trip and the error
path for that, say so and I will switch both directions to
amd_smn_hsmp_rdwr(); the code is tested and it is a smaller patch. I did
not want to make that call unilaterally, because it changes the client
from firmware-mediated access to raw SMN.

>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c | 125 +++++++++++++++++++++++++--
>>   1 file changed, 116 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/ 
>> x86/amd/hsmp/acpi.c
>> index 8257cd1da48e..bbf2b9a8a408 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -10,6 +10,7 @@
>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>   #include <asm/amd/hsmp.h>
>> +#include <asm/amd/node.h>
>>   #include <linux/acpi.h>
>>   #include <linux/array_size.h>
>> @@ -71,6 +72,68 @@ static int amd_hsmp_acpi_rdwr(struct hsmp_socket 
>> *sock, u32 offset,
>>       return 0;
>>   }
>> +/*
>> + * Family 1Ah client platforms (Models 80h-8Fh and E0h-E3h) expose 
>> the HSMP
>> + * ACPI device (HID AMDI0097, ACPI path \_SB_.TELD) but, unlike server
>> + * platforms, the device provides neither a _CRS memory window nor a 
>> _DSD
>> + * mailbox-offset package.  The mailbox lives in SMN register space 
>> and is
>> + * reached through firmware:
>> + *
>> + *   - Reads  : the read-only ACPI method SMNR(addr) returns the 32-bit
>> + *              value of the SMN register at absolute SMN address 'addr'
>> + *              (TELD.SMNR -> CpmReadSmnRegister).  This is the ACPI 
>> BIOS
>> + *              telemetry accessor referenced by the AMDHSMP Windows 
>> driver
>> + *              (amdtelemetry_Acpi_SMNR, method 'RNMS').
>> + *   - Writes : there is no corresponding ACPI write method, so SMN 
>> writes
>> + *              are issued through the kernel SMN helper 
>> (amd_smn_hsmp_rdwr).
>> + *
>> + * The SMN mailbox addresses themselves cannot be discovered from 
>> firmware
>> + * on the client (no _DSD), so they are fixed; the SMN_HSMP_*_RM
>> + * addresses are defined in hsmp.h and shared with the platform driver
>> + * (plat.c).
>> + */
>> +
>> +/* ACPI method on \_SB_.TELD that reads one SMN register: SMNR(addr) */
>> +#define HSMP_ACPI_SMNR_METHOD        "SMNR"
>> +
>> +static int hsmp_acpi_smnr_read(struct hsmp_socket *sock, u32 
>> smn_addr, u32 *value)
>> +{
>> +    struct acpi_object_list arg_list;
>> +    union acpi_object arg;
>> +    unsigned long long out;
>> +    acpi_status status;
>> +
>> +    arg.type        = ACPI_TYPE_INTEGER;
>> +    arg.integer.value    = smn_addr;
>> +    arg_list.count        = 1;
>> +    arg_list.pointer    = &arg;
>> +
>> +    status = acpi_evaluate_integer(ACPI_HANDLE(sock->dev),
>> +                       HSMP_ACPI_SMNR_METHOD, &arg_list, &out);
>> +    if (ACPI_FAILURE(status)) {
>> +        dev_err_ratelimited(sock->dev,
>> +                    "SMNR(0x%08x) ACPI method failed: %s\n",
>> +                    smn_addr, acpi_format_exception(status));
>> +        return -EIO;
>> +    }
>> +
>> +    *value = (u32)out;
>> +    return 0;
>> +}
>> +
>> +static int amd_hsmp_acpi_smn_rdwr(struct hsmp_socket *sock, u32 offset,
>> +                  u32 *value, bool write)
>> +{
>> +    u32 smn_addr = sock->mbinfo.base_addr + offset;
>> +
>> +    /* Read path uses the firmware SMNR ACPI BIOS method. */
>> +    if (!write)
>> +        return hsmp_acpi_smnr_read(sock, smn_addr, value);
>> +
>> +    /* No ACPI write method exists; drive SMN writes through the 
>> kernel. */
>> +    return amd_smn_hsmp_rdwr(sock->sock_ind, smn_addr, value, true);
>> +}
>> +
>>   /* This is the UUID used for HSMP */
>>   static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 
>> 0x48bd,
>>                           0xa6, 0x9f, 0x4e, 0xa2,
>> @@ -89,15 +152,19 @@ static inline int hsmp_get_uid(struct device 
>> *dev, u16 *sock_ind)
>>       char *uid;
>>       /*
>> -     * UID (ID00, ID01..IDXX) is used for differentiating sockets,
>> -     * read it and strip the "ID" part of it and convert the remaining
>> -     * bytes to integer.
>> +     * Server firmware differentiates the sockets with "ID00", "ID01"..
>> +     * "IDXX", so strip the "ID" before converting the rest.  The client
>> +     * device carries a bare socket number with no prefix to strip, so
>> +     * only skip one when it is actually there.
>>        */
>>       uid = acpi_device_uid(ACPI_COMPANION(dev));
>> -    if (!uid || strlen(uid) < 3)
>> +    if (!uid)
>>           return -EINVAL;
>> -    return kstrtou16(uid + 2, 10, sock_ind);
>> +    if (!strncmp(uid, "ID", 2))
>> +        uid += 2;
>> +
>> +    return kstrtou16(uid, 10, sock_ind);
>>   }
>>   static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
>> @@ -240,12 +307,35 @@ static int hsmp_parse_acpi_table(struct device 
>> *dev, u16 sock_ind)
>>       int ret;
>>       sock->sock_ind        = sock_ind;
>> -    sock->amd_hsmp_rdwr    = amd_hsmp_acpi_rdwr;
>>       sema_init(&sock->hsmp_sem, 1);
>>       dev_set_drvdata(dev, sock);
>> +    /*
>> +     * On the Family 1Ah client platforms the bound ACPI device
>> +     * (\_SB_.TELD) has no _CRS/_DSD, so use the fixed client SMN 
>> mailbox
>> +     * addresses and access them via firmware - reads through the SMNR
>> +     * ACPI BIOS method, writes through the kernel SMN helper.
>> +     */
>> +    if (is_client_platform()) {
>> +        sock->amd_hsmp_rdwr        = amd_hsmp_acpi_smn_rdwr;
>> +        sock->mbinfo            = *hsmp_pdev->desc->mbinfo;
>> +        dev_info(dev,
>> +             "Client platform: SMN mailbox via SMNR ACPI method 
>> (reads) + kernel SMN (writes)\n");
>> +        /*
>> +         * Publish sock->dev last, for the same reason as the server
>> +         * path below: it is the readiness gate for the data plane, so
>> +         * it must not become visible before the accessor and the
>> +         * mailbox offsets this socket needs.
>> +         */
>> +        smp_store_release(&sock->dev, dev);
>> +
>> +        return 0;
>> +    }
>> +
>> +    sock->amd_hsmp_rdwr    = amd_hsmp_acpi_rdwr;
>> +
>>       /* Read MP1 base address from CRS method */
>>       ret = hsmp_read_acpi_crs(dev, sock);
>>       if (ret)
>> @@ -553,11 +643,28 @@ static int init_acpi(struct device *dev)
>>       ret = hsmp_cache_proto_ver(sock_ind);
>>       if (ret) {
>> -        dev_err(dev, "Failed to read HSMP protocol version\n");
>> -        return ret;
>> +        /*
>> +         * Some client SMU builds reject the interface-version query
>> +         * with "invalid message" even though the mailbox is functional
>> +         * (the preceding test message succeeds).  The client does not
>> +         * need the version to reach its metric table, so treat this as
>> +         * non-fatal there, matching the platform driver.
>> +         */
>> +        if (is_client_platform()) {
>> +            dev_warn(dev,
>> +                 "Interface version query unsupported on client SMU; 
>> continuing\n");
>> +        } else {
>> +            dev_err(dev, "Failed to read HSMP protocol version\n");
>> +            return ret;
>> +        }
>>       }
>> -    if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>> +    /*
>> +     * On client parts the metric table is fetched via
>> +     * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR whatever interface 
>> version
>> +     * was reported, since that query may be unsupported, mirroring 
>> plat.c.
>> +     */
>> +    if (is_client_platform() || hsmp_pdev->proto_ver >= 
>> HSMP_PROTO_VER6) {
>>           ret = hsmp_get_tbl_dram_base(sock_ind);
>>           if (ret)
>>               dev_info(dev, "Failed to init metric table\n");
> 

