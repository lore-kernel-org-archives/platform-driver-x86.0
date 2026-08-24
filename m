Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012008.outbound.protection.outlook.com [40.93.195.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F54379EE7;
	Mon, 24 Aug 2026 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548797; cv=fail; b=AzELS9/ITkd3RvmOffxsIRm/o9wUlvbkoI7QgdNTWMSKA9sClY6N/67wNipllY3+QgD4wXv5WvifAZNuGcKsyV5q61/gjNQ/ft4+kXmfJQ0Qo01MRtVkKG/RdcfYdDuFnsYrdWHKp0wL3fvWVQljDRsO7kh/Pvum2Rw5bwg2HNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548797; c=relaxed/simple;
	bh=WSwOB4nr9KnM1oRz2MXnmOqQE9Sm4CpkrxfoWorJEwk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SsSnKekKILBj/Uj7fDn0Vt6SMGfrtyd0a3ewZtij3JTb0Y4AGV3RuzlPyohiqEIfKoGhUWYKz6sqZzqKb6MPh5H9TS6sh8wmnlqvxsABovqJo07zZb0Q0BbLGh322wLsnwK5SigF4KjArWgkV+EqzeD5fxVZAyw5sSZSKeU8CvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JBp0q1MS; arc=fail smtp.client-ip=40.93.195.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JBp0q1MS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSzOtIWgzsnj5qZB8UvEXee/2jqrptbGFPoPpVxKvmCprVZ3om1ckgdlBvWQIOEUs99PB3w+VljgEt+6OQugUs+sSqgAZ456b79o0mRK7VWidqSyKy2QppJEOwXr+6ooRgAEZpdzWAQVmqZuMXmDtnWBTQIwG0hnSoReX6JTiCntiS0M8VF+dOIdSnMXiuyjFrRVlZSZoWR6xECjQCxL/V9gifL1UWmWeNEnnpkc6jNpfQFRolbngWg5pxPqP/JLg6nq9WVwZElkY8qFawJ2QblreJ5sXEuIoWr05N9crSPxX3XrUoQoa5RcwRAM6rcJkB4RuuYE/n4D/E9iA/AVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms6ao8NA4kyQ1y/Ym4dU2aDDqlEINdM8hHr4Nt+5qJk=;
 b=BKdeS3iUgPWd93mvS3pXcn6Fd4Khd2T/C+abyIlnxAVpeqD/9GzshwrbLm1MiWIKxRxhVP4mxyga5ZjFeE0v0jjAZHpP/SCJfXCfCVUQ3mRQq3uy+AEZug8zBYraDxWjgw9y1LFOE76ERilzxcyZ3w50jUlw1Ld9WYvGkvxvO9pDOrthf0Zqp1WhDur2l1t7HDZCZ2iwAxl/lw/BmgB+N7Drw3q1Y3M0k+vhZ5PYIk9TCJ2cSdxrxMgOquXDNs+IifXsYH5SSrLp0okCxhC1JrCiF5vViy/iDJKMRz2mYn1kWLKVgQR6Jz7O9Ez+UFX4Yy3WUpNrAum3slZ7q+bcRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms6ao8NA4kyQ1y/Ym4dU2aDDqlEINdM8hHr4Nt+5qJk=;
 b=JBp0q1MSZYDI1HKBLlIIGa7ADmYQVCOisvX0Fo7Xsg0UMLvl0w9FCL0rftx/sIzfmIgTlXPsJoearfvEECZIuYC+5RuAYW/16IMVHp6/A6P7RkxqeZb5hmFs0w22+WQxjp61CqKiwPvuN5H/rX5AgYhSpblnscFtsyFw+lnflr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 05:19:48 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 05:19:48 +0000
Message-ID: <bae5dff7-5bf1-4b47-9cb8-a1266c313f2c@amd.com>
Date: Mon, 24 Aug 2026 10:49:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] platform/x86/amd/hsmp: Family 1Ah client support
To: Mario Limonciello <superm1@kernel.org>,
 Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819073157.2426504-1-muralidhara.mk@amd.com>
 <df08c3c2-665c-46b9-a495-1ff0818be6f3@kernel.org>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <df08c3c2-665c-46b9-a495-1ff0818be6f3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d8b87e-f86b-4458-5822-08df019f5144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KshB/XEUx7j1WTl5ctUbKEFZ3PhOTCJ0Yr77bmpxuJUZN/R2PPQIai4zUYjMksQqLQtmaHhXHfbP8uklfDPYLoH29mZtHkYKCgtleS3fJTLuk+e5L+YhDthPhWtD2/tfjaZV2lf2OM3b78IVVSg5ee83cwztL7ky+vG0G86MCaUQRTNbRnU8uscgBk+NZcqpInXLAjmdGzUKskzcDJSmH3/1i2aDsHaEaOLI8Bci3miMKMwSbL6XEKARvr7BV0JZ21JJIvj7F3ILjMUS0Y9bGSS3RO+g55YPIr7HgbX3V+bUv2OykbXCuSa05AWeu2cpTrY6KVcNmkKvr21uaE8tlXVVBqasfB9D18yCXo5gH3oo7NJu/748MMo8OwM+GU7FbD7406ZgswD8xd4XqJqdfG44fqUOcVW/We+t57GngSFnIa5jXWCNyL5TAk15t661mHIWeq0pBN7IyWQiSqo7HUwIBHPmsDYOuS1gl5UTh6GmyG1bc7IOWF9qOeutuUq7zKOOoErAkD3KMHv+S0HfZ3/QZ+WbE1On9K/wgvAttQr/eXbVjj8f/J0IT8FThEksRAo/0ALjJSn+UNwOKS3qGHSnXZPAsyEFaM4e2qffMzYyR3ts7D4gjFmbsIUMSW8vvU5tO8UaMKpLYgAJLTVVQKERA1yIKzFhkh6ShKh3FaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elZSVHlGQjlScXluRjBpL3BCWHVzMGtNbGErMjQwbWRXblFhUlJweWovRk9v?=
 =?utf-8?B?OWVyUHhLM0llOTVrQWI4cHpBTVNNMDl6MmZaWjc0MFZsQ2hIRGxZdHRCSkNz?=
 =?utf-8?B?WWdjbnljL1NiS2VnendKVUpONzJSZXBWc3M0bnM0c255VW9SRVdzVnRQekU0?=
 =?utf-8?B?d2h2ejg0aS9iWEZtdjJDSGR2eUxIZ2dqQ3dmRDVzTUhxVjcwY0ZlNlNDRmZr?=
 =?utf-8?B?YktGcGEyeXhzQnFEenNlc0EzMWVFZEdwSDNRdm1Ma1lhQ3FNMGJvb3E0R3lh?=
 =?utf-8?B?dWlqSFFZWGQ5c1ZlcDNrYVBvR1plNzgrVDlXVG9aclpGc0FHcU1ucGY3NkxP?=
 =?utf-8?B?UVluMUdQc09kNFIxUXBEVjB4blhKaTJnSEVRYjhLZVozVjIvUWJLZzA4N0tP?=
 =?utf-8?B?RkxsNk5BcHQ5UFBkWWRmbGxrSFFHbHNUYVd3VGl0dk1qZURzcXpPeitaZXV3?=
 =?utf-8?B?Z0xTTkVqNTJPSGs0MGhnWjEwSFU3dUxnVFJoOTlsb0tWdkdPUXlNbzNsNTIr?=
 =?utf-8?B?YkU0eHgrZjV4SkRGbDF3ZEo4cENsWnR4UDVNaXNraU1UTDJoc0NBMEN2M3ZK?=
 =?utf-8?B?eEw4TU1WMEhuK01ML3VldUJleFhPUldONlpFeWhEZGZGY0lTNjI0YzloZXpz?=
 =?utf-8?B?WDdtYVR3WlVEWWlHUmduYUgzaDc3TDM5bzFjcWFHc2VGODdWKzFQUVlxYkJq?=
 =?utf-8?B?N3ozd2pLR1N4K3E3NTMycmtkMnM5T2lLTnBFNVVBL0lFZlFOKzlUeVM4WkdQ?=
 =?utf-8?B?ZlpybTd3TkxJL3pJcWplbG4wTFlOVFMzdnpkdElJb0J6amk1ZGU3UW5BVkhM?=
 =?utf-8?B?bEFJOVA4dmtLaXQ0YlZKS3lFc0tWZ1NKdzlzS3VtQ3dhWHRXM25id0ZtT2RR?=
 =?utf-8?B?NUt1VEExMlZjdXpwY0Flb2hQTFdENzBCLzlyU0RnQXhKcCtFT052cjhzWFlN?=
 =?utf-8?B?QTFNKy9XNTlrRkw4RHVObjlLbGtzTDdJbVNvMzlucDI1eFpDYllBOG5YZHhQ?=
 =?utf-8?B?bnlSalprMlRCODFpOEJCMWp2MnlXMm5nUUlZK2RnMWczbmJIN24veTQ0WFB0?=
 =?utf-8?B?aS9RaUtlYnNKMERNaFFFWG12VVhEOU4rK0dwN3Y1dGE5ZUFwdFRVZnk0OEhT?=
 =?utf-8?B?b2NoM0dobkNsRm9vTS8wTzZQV2xGSDc4Y1lBYitIcGVlSnZMSUowaEczY2lJ?=
 =?utf-8?B?T1RVK2ZvbloxMlpnKzU2VktCUXFrYWROcEhab2l6a2FWaEF0aGRPZjdjOHo4?=
 =?utf-8?B?SGZZM1VGRlZYeWZLTjNWUHk3V2g2NXArR0JNMmhtcjBnUWxFcTVJZE5iOFNa?=
 =?utf-8?B?aDUwVW1mYXk2cHp4T0FCQkdNakNYOElURjBBTHdJcmlQakxEbks2V3BUb09q?=
 =?utf-8?B?VWQrZ3QwWHNXU3A4NzZtc24ydUFaVUNsak83UVAxbVVrWklRcWdIZmlHcjBV?=
 =?utf-8?B?YWZ6elRrUHd3aitKSm5zcVNjSzZyWU1jUmJON2JadENFbDZtZ2dZY2VrbjFY?=
 =?utf-8?B?dUo5dTBlM3dRb0JCV2lzRE9mZ1ZDTkR5ZWVWU21xSFAwN09JS3RBNytRZEF5?=
 =?utf-8?B?bEt6bzVrSWVHQnQ5eG1iNmZLL05xMVZ1UVRSMmt5MXdFeTF6OTk1ZmZmMCtM?=
 =?utf-8?B?c0RwaHg2V1N6TklDcE8xRXVzYUkzQW5uUko2THlvQ1pUNXlobE1pTXZIVzRC?=
 =?utf-8?B?Wmh4RFU3bisycjE5TkR6UGo1VGJFRFRTT3RRMDVJSlVZUDJhNm9oempkMHF6?=
 =?utf-8?B?K3Bnbk50Z0VKNDZ6SXkwQkFFaXhzNGlSOUpqTDh5SlFNUW9wU1Y1VEgvU1dG?=
 =?utf-8?B?Q3gzTkJKL2FkMzUrd1pjQVllaDczdGtLL3ZQWFBLc1BNKzdncGJtd0ZLTTBU?=
 =?utf-8?B?Q3draGdJYThmZGluSFo0ZkcrWWhHVW1iUkh3SVBYM0d2bEpFV2svWmtJbkxW?=
 =?utf-8?B?ejgzTk43b0ZvL3NBU0grcVAwRXpiMTg3WEcxcXZqaS9KSHVYQVlYR1VzVTFF?=
 =?utf-8?B?VDZXSStaUEhYbFlaVmVEckxmOU5KbzBaamM2YWU4R2dhdTNSZ3NVZk1ZZUpl?=
 =?utf-8?B?dzJMLzFFTFhqSklBWUpwNlRDbmJKUW1WQW5sdW1DYWZSZFlObS9GKzBSSnBJ?=
 =?utf-8?B?dmxVYkRVZUthekNJMDgvZmltKzV5Y3doMmNSMnpuWlpWc05rRXBVSHkyVHYr?=
 =?utf-8?B?UDRqRVJVVjZLNHhIZ1o4QXJzRS9FZGpvQUh0R1dZbi9OdDlITlBaaW9hek1m?=
 =?utf-8?B?Ym5pbWNxck9pTVlsVWZaOEhXeHlBd25yMk8wWS9XQW5BaVA1N3paK1NTb0Jx?=
 =?utf-8?B?SHovMExGak5ZQS9YcFZhUk9LVTBZb1paQWJ2QmFnODVuaHU0S1RsZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d8b87e-f86b-4458-5822-08df019f5144
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 05:19:48.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTW4Ltm+YvjGSPf3EzRxU+fSIaoZy3l4unKWrp0x5dxPhjSHohqD9GBae8t0pIqPePuM5FEeRfd6ZWn6PY47+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142



On 8/19/2026 10:17 PM, Mario Limonciello wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> On 8/19/26 02:31, Muralidhara M K wrote:
>> This series enables the HSMP driver on the Family 1Ah client platforms,
>> Models 80h-8Fh and E0h-E3h.
>>
>> The client parts drive a different mailbox from the server HSMP
>> interface, but the latest BIOS describes it through ACPI _CRS/_DSD the
>> same way a server socket's mailbox is described, and the parts speak
>> the Ryzen Master SMC message set instead of the server message IDs.
>> Patches 1-3 teach the driver the message set and let the client reach
>> its mailbox through the existing _CRS/_DSD-driven MMIO path, leaving
>> server behaviour unchanged, and patch 4 includes the telemetry table
>> those parts return. Only the ACPI driver probes them.
>>
>> Changes in v3:
>>
>>    - is_client_platform() now tells client and server apart through the
>>      ACPI-reported PM profile (FADT preferred_profile: PM_DESKTOP,
>>      PM_MOBILE, PM_WORKSTATION, PM_TABLET) instead of a hardcoded Family
>>      1Ah model range, the same signal amd-pstate already keys off of.
>>      Future client generations are recognised as long as firmware
>>      reports the right PM profile, with no driver update needed.
>>    - hsmp_desc() now resolves the running platform's descriptor once and
>>      caches the pointer behind READ_ONCE()/WRITE_ONCE() instead of
>>      recomputing it on every call. Concurrent first callers are benign,
>>      since every one of them computes and stores that same pointer, so
>>      the pair only needs to keep the load/store from being torn or
>>      reordered by the compiler, not order it against anything else.
>>    - The client message enum in amd_hsmp.h is now documented with
>>      kernel-doc, one @member entry per message describing its inputs
>>      and outputs, rather than a block comment plus a same-line comment
>>      per enumerator. Noted there that not every platform supports every
>>      message and that an unsupported one returns -ENOMSG.
>>    - Patch 4: the Telemetry Table RM layout moved out of the .rst and
>>      into amd_hsmp.h as real kernel-doc'd struct/enum declarations,
>>      giving userspace one authoritative definition of the byte layout.
>>      The .rst now just points at struct hsmp_telemetry_table_rm. The
>>      structs are now also packed to a 4-byte boundary to match
>>      firmware's actual layout, and the trailing NPU/PMF counters and
>>      spare padding firmware carries after the overclocking fields are
>>      no longer missing. Verified field-by-field against AMD's internal
>>      metrics table header and end-to-end against a live snapshot off
>>      Family 1Ah client hardware.
>>
>> Each patch builds individually at W=1 and is clean under
>> checkpatch.pl --strict, kernel-doc, codespell and the htmldocs build.
>>
>> Muralidhara M K (4):
>>    platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
>>    platform/x86/amd/hsmp: Route metric table through the client messages
>>    platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
>>    platform/x86/amd/hsmp: Document the client telemetry table
>>
>>   Documentation/arch/x86/amd_hsmp.rst  |  24 ++-
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 398 +++++++++++++++++++++++++ 
>> ++++++++++
>>   drivers/platform/x86/amd/hsmp/acpi.c |   2 +-
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 273 +++++++++++++++++++++---
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  25 +++
>>   5 files changed, 688 insertions(+), 34 deletions(-)
>>
>>
>> base-commit: 775f2078b38ff2121410a35302497a1e81b8e459
> 
> Thank you very much for the changes you did in v3, I'm happy now with
> the changes.
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Thanks Mario.

Hi Ilpo,
  Could you please take a look at this series and share your feedback ?


