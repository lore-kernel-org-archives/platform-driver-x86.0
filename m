Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC182E6CB8;
	Thu,  9 Jul 2026 05:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783575235; cv=fail; b=aaDfniFLhnxGdC3aDGh6A2r+20vEVyoIly2GeypgAwpuX6CHu3hbEKPKRy8X2sbUqVXGcA/m36858a8yX4ZanwKXUUboZXrzBPg0Hb2R0cunHAXsmXB4sMGPqQ0vxs1zgT7g6IrVZRmVrz9YWw50a60M1vB9m2saHZdAkYcNPUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783575235; c=relaxed/simple;
	bh=3NiOx9OF1OAkU0/mJDahxR1Oq/dOLmSMPU9rjCuPdfA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EtklqUsZ/xM1Man3VtXZup2hjjVKuHONQk3g4F13Vy4gnV8avrdqUlh1KqaIR24EoisV9QLuHVZF1SVat7royuveRCsYml8QOZSBIU+WG/sy/fYyXANhwCViAhWF90a35CT2UcuC63ehtEVC8TBRMW1esq9i6BERUrGuuZYxoJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gB62LqrL; arc=fail smtp.client-ip=40.93.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gB62LqrL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoNiCqpy7Eyu5VaZSbcXiseoNDmOJcn9CaRb2EtMt8MtAQ+rMyZjzxlXJRtht0EICxH2DIblqffnBZ+2m1KTybsk+EmXe+ta7xtruyDbAxpK6yP/GqNoAtaR6ru33mhi3cACOg4BZKlJgyDdAirbJvZeZDft3bfA9fBD87wthC2GtgQva8dBZUdueHMxfG2oLApm0HRX9B+9JcFwZPOsjX68lLpjianryYKlV5JmA3DUrz29p9EnxzJ3Pl7yEqpsbXBqv2s9Uk66Fj40g20lDVIB3/yi+XuXEJ4uUNMdgKwwDXiaONrePi6pzFinT3T+Rb7D/HQtWhOMw9IdJpynkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HsfnLjLsCfqAeIjYBy2Od6yHLFZ6bGiY1XEkRF3Zi8=;
 b=wo9t0P+omy8NUaD8ah/EfY1B9I3a0sVPS9Ur04eVncCDoCgFMSZOki0VysoxKcR3AgV8XssKtJkR+RQjrvZ3KVp82Y/mMWAMIGjGfPo75wmLdKx6xB1Ys7C1cnjvewLpqcgmyVeeFO3KSmBF15cWxQbGjRm8NxkNFqNkLYtjRlhvT4yT+3PnGs+5wnopbwLX4ASHnKh5weaX2yUntytrZzmxin+XdqJMBOvFvYFgSc4UkUZzOPB3YdwDz3A45ASFa1wR8/8alTlwBmVjw4/H+WUkRAMO+WQzbnfKW9Rbl2KwgGuxUXCoHmAe0CBsb/wCnYh1WlG2if9hjFVMaqEcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HsfnLjLsCfqAeIjYBy2Od6yHLFZ6bGiY1XEkRF3Zi8=;
 b=gB62LqrLwKwdAA7HBK6qrIVovVLVYedtlQjcZQnrEYf0paLxDJHci+pW2HxZPjISyJT8sPqhYdpJOtxrqbtfarmqABwm9+0ImnoQwmroMQ2GBPQRzChKfAnkYw65/91K8VihJwubQp4WsR/kH0muz9U/3jVXOuDG0a3J3R2jOWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 05:33:51 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 05:33:50 +0000
Message-ID: <844fc5bb-5e0b-4380-b73d-56ff235fea28@amd.com>
Date: Thu, 9 Jul 2026 11:03:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com>
 <c0ff9acc-5a29-1556-dc35-3df205bcf9ec@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <c0ff9acc-5a29-1556-dc35-3df205bcf9ec@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::8) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: fefc1e5d-86d0-4c95-794c-08dedd7ba7c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xxWLl1sITGyhMFPhEpb2BmTBoEcowxI0gK7d4vYgA3RpItMJpX/VQG3NQeqJQ+cpFWidjk871B8EfvQLoUIF6Uedgs5q6e1PVaSqRDe5NdTmo47ZRrfiMVTcs88Ljqi65XDq/Oz33OTApVFHxDIRmzpw/9qOrUqvSO/2Fcuo+UrU/jMOZVxy/dZ365DVQgqmBXRlrBDbSZ0esIDSb6axAC5nvGmJQBOFQuZQsM7HgRUYYcU8FHVkME/gw0NAwJf35DeCYU57RoQF94xiYvljNDKQrqN8XYAuKC96x6pn17osa+T4RLJNLVlkTSDYNG1QI9tyLxutHymeuKZig2mac90KjIPWYur/YS+5LqHqNgknVY33cKVjdVJFDG0/qO+W+KmETZdjw/m5m6fSTFE+1w2NUkv9w7L556S3ZcY8i9t5VfEdyFj+qpYNyFN3Ixwnktw6Z8WMeCt06nbiLlzszGr/BMkUKh8oqpifWREKMSGT/Gss4aD0bS6Y/Iox627IhdSuTOHcGocmHeXuPGn/3PwrgWESA8e84Q0JcpyXrJGvd/+feikbG1giLUYCctAnPPwh7oSN5IRHahfZWPRGAuUKrV6a6QUrWTaohYo8H/I1GuyJbh7AgzlCW0HyDzfwUeWZXegP6grxZoSzpT2jv+P1BwTvyIsK8KOKvFsHtMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUZBNUprNmZPUnJrT1BHT0tmVjdSdkpwa2IxR0l3ZUJWTnhwOUU2VnY3MDVG?=
 =?utf-8?B?b2kxOXY4UXkvcUJqdXBKMkN4bEJVMHNUeCsvYngxQU9CRzFIbllFZmRDRXRS?=
 =?utf-8?B?ditELzF2VzRLeXdhYjJMN3BpY3lJTnZFWFNCdngrOG9qSE5Ua0NxUTNXTEJP?=
 =?utf-8?B?UjhraHUxL2FSM2N2czJpN2hJV1N4RlJlbldXdmdqLzI4VkR5YmJVTDlDMlFY?=
 =?utf-8?B?WVF2bjZMSUlYR2VlUC9vZUZBV0xycXYyUkdIdXExZDRQZFhtS3J6Qisvd1lJ?=
 =?utf-8?B?Y01OTk9WaWdEMGJLSXlWaHFKM2hKYXZXYXpuRmY3bEl2ditSbVhiTmo1Ykgv?=
 =?utf-8?B?RzNjbXc2Zkk4KzBZdzVlbWlaL012T3Y0dWJSVCsycHBNL0dvK2NweDVkeFA3?=
 =?utf-8?B?enAvc1BpTm82UlpoSWpVZi9MVk1seHRSbkdNTFd6T3JiYk5jWHZKWDhuWHNL?=
 =?utf-8?B?Uk9zc0tTcUd6eGtnVUtOZHZiQ090d2xDY2ZCYVNTYjRyeDk4aUlnZkVINmUy?=
 =?utf-8?B?eHpWbkFMTzFTejlLL2wrZkdwQ3RxTWFpUFNwUkE5TTNZbURwNjFObkgzS1k3?=
 =?utf-8?B?T3hINE8yenhJK3VkOGQ0VC95Sy9CYVNHdU9HYTZrNHMvLzFVQUZudzMyTWxJ?=
 =?utf-8?B?eVdjdHJNKy9YamZiMXhNV0ZsZ0cxK2s0UHZka2c4YjlYOXZaZmFDVXRDRy9L?=
 =?utf-8?B?NHFmZGNNeUd5S3pkZ1pyNWNnS2kxdlFuQjhRMXBRYkpIZU4rQkN4WExnRzZ0?=
 =?utf-8?B?bEFXZTRVTXBjZlhwVHIyTmFIUkpjRTFHRDZGQW0yTWpEK2IvSHVmQ1U2ZlZU?=
 =?utf-8?B?QkxzeEx0U1poOFpzY1BWYldLTE1jczRsWEZjQzhQWjZ4cnJEZHMvS1RkdkVW?=
 =?utf-8?B?aHo4R0xreEJFaEw2SGdRUUFpRzcyY2MwYVhBVTFiR083SFExNnlxRXRVV0VU?=
 =?utf-8?B?bDFtZXcyWDJrL0FQanVUVFgzZ211OGNmUXB0MFoyS3lDWVVBQURaVEtMUllK?=
 =?utf-8?B?dmhRSVZUdDMvT1U3bmlzalUrdnhkMlF4R05Ha1dhenRQemNxcFpwblRFejQr?=
 =?utf-8?B?bDRJNEc5ZnM3L3pLNGhuU2I4UHZ5VGxkVnFzWTN5SWRTRGhCOFcxZ2tETUhk?=
 =?utf-8?B?UmQ4SVdnRmFmT1h6OGFFTjBEemg2bHFsSk1Hb3h2VFZjRkY0b1J3UUdOY2JD?=
 =?utf-8?B?bTA2NGZaTitFanowbnhtYVJkSG5lMFpsOFdibjZ0NXAySkp1a0ZkM04xWk1r?=
 =?utf-8?B?OGgxelJVSTIwamc0bDh1RDZPQjMvbCs5c3VVVTZQOWVlUzZuYU1Ia3VaVmpp?=
 =?utf-8?B?RFpCazRWYTh0bGRKcEswSFpnUkpmVk9lL3RjY05CZDM5Y0dqTm1XR2c3b3k0?=
 =?utf-8?B?R2hDNzlub0QzalJJcXFndDFqbko4RDh4eSsvZDBQZGtKb2I4VEZ4dStSN0RX?=
 =?utf-8?B?TEFBYTdqK0Z0S1B1WTd2VVpzejJIanB4LzJWZTl2UUhIWkRXcG1NSTIxZUUr?=
 =?utf-8?B?aXZKYnJtNmIwZ2ZGYUpKT21JZmNURkZ6a1VOSlJNTU11K2taNS9BZlBHWWc3?=
 =?utf-8?B?emlVdlhkS2ZZYUJJcUIrbll6c0J1anBiVGxyYTZIZzhhRWNuOCtVelNGTW9m?=
 =?utf-8?B?ektjNGhHSndPUm9ZN2tJVjZCbFFpbDZyKzdRWG1wUEZtOTlNTDlaR3M5a05J?=
 =?utf-8?B?RTZWTnFiWUF3QjVjVFRLbUoyMzlhZzM0c092WFFhMDZ4ZHcyYXY3YTJ4RGZr?=
 =?utf-8?B?SVdxVmFCUDY2T2NqRDRMQUZCK1k2VnRqK21Pa2xxOFU0cW1JQ3pYdFlEb1NZ?=
 =?utf-8?B?S0xCSUpQNWd4QURhMG5aeU5tNlVON3lITjh6TmpzRlZaWitZQW1sQ1NkdTZZ?=
 =?utf-8?B?N0xHMlhrWm9ZeVh2M0NiZGtiYkRBMjFmaG4zNkg0ckY1dDdKRnJDZHVyZXZy?=
 =?utf-8?B?L09SRVFRYjFPMVNTbnFKaDFYbjlRL0dNQ1FuWHZUdzc3K3VsWC9wenVSdkZs?=
 =?utf-8?B?UEV3YjdrbmtXRFlSclRRb1lyU2JLNGtKb3IxRHdNVVpSU0lBUmZiYlpNcHRn?=
 =?utf-8?B?ZGN4eW5DZUd4eFo5Rmo2NHE0c0NXNHRROEtFb3RkVFN4YVdHTzJLNC9hcHFk?=
 =?utf-8?B?K2RIOGdrT094Vzh5UkdtaU5Id2hpV2dmU0N3OGhJSzM5OFBnODZZTnVnZmlG?=
 =?utf-8?B?R2lDelVGZ2dEVWYweW1ZM2RXZlpiWFk2YnNUYXU3SFZxeEFITzlYcTFtNVRp?=
 =?utf-8?B?a2JQMkE4bHVyMFJ1UHZyQVdSNnNLWXZQL0NBcHhkWHlsR250SmZIK0xISVVC?=
 =?utf-8?B?RjY0RW04cG5oSjVuYmpKU3hCc3JWZy8xeDhoVTRrWE5Wck9vaXNCQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fefc1e5d-86d0-4c95-794c-08dedd7ba7c2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 05:33:50.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EncNLOxqhFlcBDXNov/C0XB7C+DONo76QQDHp0d1G7gFS9GDco1qT26DVzUpRFi4aNfJHCUAqVezRFviYwXyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621



On 7/8/2026 3:37 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, 8 Jul 2026, Muralidhara M K wrote:
> 
>> This series makes the AMD HSMP driver safe against concurrent probe/remove
>> of its per-socket devices and against the lock-free data plane (open
>> /dev/hsmp fds and hwmon/sysfs reads) racing socket teardown.
>>
>> The ACPI front-end binds one platform device per socket but shares a single
>> socket array and a single /dev/hsmp misc device across them, while the data
>> plane issues mailbox messages with no coordination with driver teardown.
>> misc_deregister() does not drain already-open fds, so an in-flight message
>> can touch a freed socket array or an unmapped mailbox on unbind.
>>
>> The fix is built up in small, bisectable steps:
>>
>>   1. Serialize the ACPI probe/remove handshake with a dedicated mutex.
>>   2. Map the metric table with ioremap() and release it via a devres action,
>>      so its lifetime is no longer pinned to a single per-socket devres scope.
>>   3. Serialize the per-socket metric-table fill-and-copy with a mutex.
>>   4. Clear mdev.this_device on deregister (independent hygiene fix that the
>>      next patch relies on to track /dev/hsmp registration).
>>   5. Track shared socket ownership with a refcount and a single coordinated
>>      release helper, drop the is_probed flag and unparent /dev/hsmp.
>>   6. Add hsmp_sock_rwsem: the data plane holds it for read, a teardown path
>>      holds it for write to drain in-flight messages before freeing the socket
>>      array or unmapping the mailbox.
>>
>> Each patch builds on its own and the series is checkpatch --strict clean.
>>
>> Changes since v3:
>>   - Use guard()/scoped locking consistently for both the probe mutex and the
>>     data-plane rwsem, from the first patch that introduces each lock.
>>   - Platform teardown now uses devm_add_action_or_reset(): the metric-table
>>     unmap and the per-socket mutex destroy run from a single devres action
>>     instead of explicit remove()/probe-failure code. The ACPI array is shared
>>     across per-socket devices and must outlive an individual unbind, so it
>>     stays on explicit teardown.
>>   - Split the mdev.this_device clear into its own patch (new patch 4).
>>   - Drop dead defensive checks: the !sock guard in hsmp_unmap_metric_tbls()
>>     and the if (sock) in hsmp_acpi_remove(). Keep and document the one in the
>>     probe-failure path, where sock can legitimately be NULL.
>>   - Replace the !--refs construct with a plain decrement-then-test.
>>   - Explain why the probe path uses a separate mutex rather than the rwsem
>>     write side: the probe path itself drives the data plane via hsmp_test(),
>>     which takes the rwsem for read, so holding it for write across probe
>>     would deadlock.
> 
> Hi,
> 
> Could we have xx_locked() variant function for hsmp_test() to use so the
> recursive locking problem is avoided?
> 
Yes, that works and let me drop hsmp_acpi_probe_mutex entirely and 
serialize the ACPI control plane on hsmp_sock_rwsem alone.

One clarification I am thinking of is: the recursion isn't only through 
hsmp_test(). init_acpi()/init_platform_device() also reach the data 
plane via hsmp_cache_proto_ver(), hsmp_get_tbl_dram_base() and the hwmon 
setup, all through hsmp_send_message(). So rather than a one-off 
hsmp_test_locked(), I'll split hsmp_send_message() into a 
hsmp_send_message_locked() core (bounds/nospec/dev check + per-socket 
semaphore + MMIO, no rwsem) and a thin hsmp_send_message() wrapper that 
takes the rwsem for read. The probe-only senders call the _locked core, 
the probe path takes the rwsem for write, and hsmp_acpi_probe_mutex goes 
away.

The one behavioral change is the probe then holds the rwsem for write 
across the whole mailbox handshake (a few messages, up to 
HSMP_MSG_TIMEOUT each), so the data plane on already-probed sockets is 
blocked for that window. Probe is a boot/rare-rebind event so I think 
that's fine. I'll add lockdep_assert_held_write() in the locked core to 
keep the "rwsem already held" contract explicit.

or Let me know your inputs ?

>>   - Comment cleanups: drop history and "patch N" references, drop
>>     parenthetical function asides, single space after periods.
>>
>> Muralidhara M K (6):
>>    platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
>>      mutex
>>    platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap
>>      it explicitly
>>    platform/x86/amd/hsmp: Serialize per-socket metric table reads with a
>>      mutex
>>    platform/x86/amd/hsmp: Clear mdev.this_device on deregister
>>    platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
>>      release
>>    platform/x86/amd/hsmp: Serialize the data plane against socket
>>      teardown
>>
>>   drivers/platform/x86/amd/hsmp/acpi.c | 135 ++++++++++++++++++++++++---
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 107 ++++++++++++++++++++-
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  15 ++-
>>   drivers/platform/x86/amd/hsmp/plat.c |  26 ++++++
>>   4 files changed, 265 insertions(+), 18 deletions(-)
>>
>>
>> base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
>>
> 
> --
>   i.
> 

