Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECF2F693B
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381996; cv=fail; b=Zq198Jn0kXeh5IlE1oCc2Kgc7OIleck13BO+16cD4rfOBZ5qWnumA+4/REmDBIE5PToxXPo8UX+rUHwXSNUw2PFUJX/m5O3xK98pGfc1886WcORZDSl2pCHoYfGF0YRw2uzoYwrOu69j6OBTHB4IGoaY+VXWmKwgoaCifDS+fW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381996; c=relaxed/simple;
	bh=V0g8xtKbJEVrR5FmH9VhalMLerur9aWJWdMMjv0YSNo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gVdFbBx1gsGjhU+xyLd1QvIe/6TZUPUNZVwAjOSfXCrJLbJQ8vkcYIN2Wj4T+0nccJB6QbNv8uHC9G0jQiQE8wfNSU2HS+d+Kgms8AUa+EL42FIwJnI5w0mGDyaucDWXt98nrX4Xb1a0hFfDGonQCfSpeTYTqtjg4xh5ltCVqT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YBrYl9Dz; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YBrYl9Dz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwMMQpDU72Z3zq6Y9/0XQIeZ4DkLzcXLH4p8gGa0kbTyslnt6jNxIktBjVxN3Pvb9Tf/tN12Fv402BW+LBw19UCEU0vgQ9gTYCRZkVunJ85MFl+NA/hXvEbhWyzN9na5VWefjdS/r26EspdIQJXldr/dwmmBR8nbMsJrQFnU88QaRwisrg5qjjgeWhIQTQqTKyXY53DlFCtfxG5misiS6cnoXjdS/i4G73JPEy5s1yoscokkKPMEE4HKOtx3d6GSp38wC751R0Ry9Ss0pc9fShTZ8FYJhwcQyM0zd/OU8WaWDXwA4dbeVbTU16z7kK0l6jdX4EN5sUJxDA24mt4epA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjyeU/+7TSeF2Mnlx5kzWTRmWsnRb1JHYHWTL1W3ROQ=;
 b=wcWZ1pIkJXaeIWEL7cLCwuVx4qnEcnlMssBvhWFDyjnOrbP/JIX1iRtT+0Qdnxni5d+p6fG9OAl6KfTUQeOdmtB+CbCzVLrVaRaG+uZh1iDna4dUtTizCxnnMDDHJwMTgLDkvJDb+FohuY1uHs9gG65AtbGfrUMjMe/KRaJFQyQ02gd54Z7ktlgMDiVpLr7TULyseW+hhj+rQoZwrQZGQHM/D12FK3IcAJdGpldOkKkbR43UIt9SLFbEP8/njaSEmeYpKmwRNef0pObTS8CObIFSTB6wrDisgTwbrO6HbPqkuMc5Ctkz5ZsLaL5DMDGvtwCgvJJufB9WCqsocC2ejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjyeU/+7TSeF2Mnlx5kzWTRmWsnRb1JHYHWTL1W3ROQ=;
 b=YBrYl9DzooJlE7XuB7lyztOJDtStKTPXKYVfH8Xx3DZxXt00+Wcuk/qseuCkDSArRC04IwbIcoH0xqTlOT/5fnHkAZ9hfJtx5YzJLZ/k1JkAXI3yfhv3GLWtiDpn5vZvFrGjhEoauCzY1gA4WbFdE92Q6bhTiyndCjC+J2zfgMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by MW6PR12MB8914.namprd12.prod.outlook.com (2603:10b6:303:244::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 19:53:12 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 19:53:12 +0000
Message-ID: <a62909f9-0cd8-4894-b2b7-692961a95ea3@amd.com>
Date: Tue, 24 Mar 2026 14:53:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Internal keyboard non-functional on linux on Medion Laptop -
 NTC816 (Intel IPF) has no driver, PS/2 fallback produces corrupted scancodes
To: Armin Wolf <W_Armin@gmx.de>, Ian Jensen <ianmoellerjensen@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CAJ0oKyQTEJit294y=fs2s2nzhzUs_GQzsgMswDNs==zkdiqz0g@mail.gmail.com>
 <05ae0012-db1b-4826-a466-f706d2a57cc7@gmx.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <05ae0012-db1b-4826-a466-f706d2a57cc7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR02CA0118.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::20) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|MW6PR12MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ade4b3-0991-449d-2138-08de89defb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wrZ+/kSVmjZaNRiJt4pQB0Q5hvvhSBjpWco0emZzUwA7TrHlwDos1y9IUVO+O3EbxAVUQ+6sbyI70hNnxIpCfXAmDQOFbKq7eCmmovdeqvpFxrjHCUvTbASpAFq78ZRzDodg5SUJ7W8X/9CJMiDNq+WVqUhA0WhxwX0YkCmMwgesrtyX2LzeMR/hXGEKfNr8ldQiHkI+9OaKapgqirchKPa4ojMes72fJg7q1kT0JVQYCZWD9A9P3m0aCLastT39nfEIbRW9eLvnxB5CF2miLn9uaQJIPwderQOvSwxBkiYNGOZkcwE8RDbpHU4WW219p5UJ5wo5PGJSz85TjPrW+RsxfiBCYHsGZhf+kTNQxzMVJGUd3MeeaZoIKlNW3RENVv6SJ3UCH7uFiXi6+s+gpDm1kDDdRuk5o6Q/FiBRQDP7BxJuIroCwjG9BjyY0PG3K8hF5Yx7sZl0CA9asdoR+XKR9isH2sLF6wYVGW3BbLdNe/j2fNZgHRKKx4EulEsn9Vagp2kbYvF8GaEClpxs5w5O96+3xdXWG6S22HmrTvaO7ZXZ2Io+LIxHppWKQFIvYsmwQgtOBV53ftLSRgJnpgGFH1chmn+3TxBPpXp822xbui7Fa5pbRpAEWgQDkVIk/2ZubFremTjPEBFjhpQZYfD5fCSLC+miA7+hlBwWZNlubXAcyuqvzVbq9Mm2kTONCDnciHPpT11Cus3I3YDlqIiyEjal3CD+CbypB5PTMDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3pXUzRVUW56eENwbWpzb0lzbEQ5ZjkrTWdkRS9wYmVXWUlkK290Rm1UNm5G?=
 =?utf-8?B?MUpTTjZNd2k5MGZSQWl6U0hOVnlVN3cvRi80RmxVcFVvbmdsNDFJb0QzZlY0?=
 =?utf-8?B?dzluZFA4R29nbUxtaW1kd2oxbENkTkMwc3FMOTBJYTZ3c09JQVl1cklrb3VH?=
 =?utf-8?B?YmpBaEp2SVM5UUZ6dTQrTTFIZHRqclBVVE9ZNFp6NElaZGFKR1cxTzlhOXcr?=
 =?utf-8?B?cW01ZUFDSVBxSXBtNmMwSENNYW5kTEs1azRVcUpVcDd5aEJSOGJobEh3Smly?=
 =?utf-8?B?bm5QTDgxd1g5b011TjlGSkxNRlVYY2ZOcTBteUlsM1NEeTlyY0pCUFFmNjJ4?=
 =?utf-8?B?TDB3ZzI4d3pJUmE4aTh1SkVpR3J3WWltQ3hCb1lDZ1pLQkhBNnpVeTdqWW8v?=
 =?utf-8?B?K0ZzR2FhdUJ2YUtXK1d2bHJRVGFyODB4V1JtOStPd0c3RW9ZY1EzZmVHNkI1?=
 =?utf-8?B?UTJsZURyRVB4N1dqeHVXWEwrTnRxaWJXUWxkMVcxS1VhT2wyUkZlZ1lwcERW?=
 =?utf-8?B?alJzUHgvZFFjVFN4WkJQNjMzYnhOVEJKZndQTm1kVkI2SjRsYUFzRmMrb3Ru?=
 =?utf-8?B?VE9VUWE4RWxUbTBFVDMvb0lkQ3ZPYTV1ZDU3TXlGd25WdVBicUJJUExhMUJ3?=
 =?utf-8?B?d2lNU0lKdXpweVlzWld4UER5NWk3ZDcvSjlMaUtsbTFKNWc4VXExNFpVNjV2?=
 =?utf-8?B?cDErTXNiMTJRSWlKNGFIak9GWG5YQ2Job0xVcXh3U2dZRmhsYjYyQ1hkRWVE?=
 =?utf-8?B?OE8xSFBneldINi9oN0hYZzUra3pwL1lJT21HQkZwQTBrYk1tcEFaQ2Y5ZkpK?=
 =?utf-8?B?eFVmMitTZFkzNHl5eUI3OGtvSUlpUWJJanVZQWVVMSswaTlmVmg3OVNQaDdk?=
 =?utf-8?B?ZE4zSjVjZ2FsWWhDQUJNQit2YlhBcnRGaVNRWjlNMjkzQlcwRjBqR2NZK1RZ?=
 =?utf-8?B?UTNoeDRKZGFIZklVOGEya21ZUC9FL3FtS09JcjFXaU14Y0FCd0VCYTIzRUpo?=
 =?utf-8?B?MXJHbHBCaWFzbU5IOTh2SktKSkEzTFVWTVlPVWx5T09mYXcvckFtbUQ4L29x?=
 =?utf-8?B?NnV0czNobnZSZ2xFbm1UMWJHMFVjTEhSeEVzQWRScDN3NVl3QzlHc3Fld2lE?=
 =?utf-8?B?WnFESEpkNnNpZHA4ZGd1Q2ZNTDBWa056aTArYjlWbDlPTldpcGkycWwwVkQz?=
 =?utf-8?B?TklSU1NVWWNPc1I2R0JsT0hpT1poRnVBS3lVWWljS3Q0akxxNlhCY1NWcG5a?=
 =?utf-8?B?dXh1dWNqR1B3bU93bjd2Uk80ai8yb1ZRNVFqdTIxQUdWQUg3Zkd0RmgrdmVs?=
 =?utf-8?B?ZjR3TWxlWlNESjVjNnBBVW1xWnpXYm9sYXpwQ1kwN0xtbm5XWTcwbGptSHQx?=
 =?utf-8?B?RTl6d2luTlUzRHhZWE5iYVhoM25BSXY3VTBKMHYxWlNBTUltLyt1WktJU1hE?=
 =?utf-8?B?SURIMFZvMVZnbURlNjdFSHRvWW45cENieU54cExxRGlvenhEcEVzTm5XTExQ?=
 =?utf-8?B?VUNDaG9CWkcvRDNUUDh3MXlYcHQ5aWZXUGc3MW1yT3J3eHVUSEVYUXp0bDZE?=
 =?utf-8?B?KytyWXdIdUs1RS9jK1RqdWZkN0Jta2pESGY5ZEtlWkk4NnMwZ1o3L0drREtE?=
 =?utf-8?B?Q2dBZ2wvbW14dXdUUEJOWEZTNElFT1VERzFXYXVjajlkM0FlY3BRTzkxNllL?=
 =?utf-8?B?YUE1Ymw5Wm1mSVpGMFVWQjJMbnd1QklSYm5lVWgrdG1LVHIvRmxqUzJWQ3Ji?=
 =?utf-8?B?QlkvSVBvN3Zsamd6YzJHd3FxVE91ZEpvVm5RQzhGOG9TU3NGS1l1OXM4YTQ3?=
 =?utf-8?B?SVIraHF1THRmVkZrdVhuNmFqTWZTa1dPdnVPdkpiZ1lEUC9iczhYc2tOVHht?=
 =?utf-8?B?OGxnV0FSaW5DMkc2MDQ3SHkyNWovMkNySW5LSk1sWmNLT1QxNGN2cHVmaXVI?=
 =?utf-8?B?dDVTSUxpNDJpL3F6L2RCMm9CRlBaK1pWWnZmMkUxanN2NnJ5cy94MVZ2S0p4?=
 =?utf-8?B?NnZZdTRyVXFtS25EYi95QWFnZ3RQRWZEd2RaM3BiUzQxNGp4bWwyR2lrTERH?=
 =?utf-8?B?dmNrektRY3o5ellpWFRpek1jQmRvN3h3MTZHRVpyWjRPakNWN3ZlSGRJRHRx?=
 =?utf-8?B?bTdxajVJeFFZZWIrUnk2REJkRUZHRjhsMWxYOGdabVkvMXBqMXczNWRyZXU3?=
 =?utf-8?B?dnVvRVp4bklMWWdMNTlhdEUyWjA1ak1Ncm9ZREZnNWFnYUQ2ZUgzSHlKdVQ2?=
 =?utf-8?B?UTViK1J5c2ord2JaU004dkxDNGp1akwybUhIUitKeG1SYmZJcTdJMEJnTEdO?=
 =?utf-8?B?NzZ3cEFidm03d1pralcrNGJBSGhGZ1UwT2JRU0dRVVUzNVBDYWp0QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ade4b3-0991-449d-2138-08de89defb5c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 19:53:12.7198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRO5CSmvTBIUNhvpbx0QPfwxGzF8PC0vICWmTl9apOvNM38oVFjnAFwXaD8YULi3yKYN/k+1O7EUuSQCAh6vqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8914



On 3/24/26 14:30, Armin Wolf wrote:
> Am 24.03.26 um 09:36 schrieb Ian Jensen:
> 
>> Hello, I have been advised to send you an email regarding an issue 
>> about a missing driver that causes the internal keyboard on my laptop 
>> to be totally useless.
>>
>> Hardware: Medion Signium S1 OLED (MSN 30040793)
>> Kernel: 6.19.6-200.fc43.x86_64
>> Distro: Fedora Workstation 43
>>
>> The internal keyboard does not work at all in Linux, not even the 
>> capslock button works. The keyboard works in Windows and in GRUB and 
>> the touchpad works fine. An external keyboard also works fine.
>>
>> On Windows, the keyboard is exposed through this device chain:
>>
>>    INTC816 (Intel Innovation Platform Framework)
>>    -> ButtonConverter\ConvertedDevice
>>    -> HID keyboard (kbdhid driver)
>>    DEVPKEY_Device_Service: kbdhid
>>    DEVPKEY_Device_Stack: \Driver\kbdclass, \Driver\kbdhid, 
>> \Driver\mshidkmdf
>>
>> On Linux INTC816 does not appear to have a driver. It does not appear 
>> in /sys/bus/acpi/devices/ or /sys/bus/ishtp/devices/. The Intel ISH 
>> modules are loaded (intel_ishtp_hid, intel_ish_ipc, intel_ishtp), but 
>> only a sensor hub (8087:0AC2) is present on the ISHTP bus. The 
>> keyboard is not enumerated there.
>>
>> ACPI devices with INTC prefix: INTC1001, INTC1046, INTC1048, INTC1055, 
>> INTC1078, INTC1092, INTC109C, INTC10A0-A5. No INTC816.
> 
> Interesting, can you share the output of "acpidump"?
> 
> Thanks,
> Armin Wolf
> 
>>
>>
>> The BIOS presents a PS/2 emulator via i8042, but it produces corrupted 
>> scancodes. Examples:
>>    - H  shows 0x20 (Set 1: D)
>>    - A shows 0x03 (undefined in Set 1)
>>
>> The corruption is not a simple offset and does not match any known 
>> scancode set. This appears to be a firmware bug in the scancode 
>> translation.
>>
>> IRQ 1 is not showing an interrupt storm (~10 interrupts per keypress), 
>> so this is not a stuck interrupt.
>>

Could the polarity be flipped?  We had a problem with this on a lot of 
AMD systems a few years backed.

