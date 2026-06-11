Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BDE3FFAD1;
	Thu, 11 Jun 2026 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196678; cv=fail; b=AtieZ0759h1gGwS+IeAGITtbeZtFYoCbAkxmeGacrTwmXF+k+ZgoBybbkDHMFVeEw6kqsi7uHSdivE6RDQzS14AzfoCFO0JhNl8Sg6oQCSNRkAxrEwFcAjPpAjQdrKwU3a+6hnzZFtk3+zrj6Gn1o/TJYkrFhSWXm18RH99DaRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196678; c=relaxed/simple;
	bh=J21I+7XL5lxY3eIs+Sr8l/IsLPzfOt38+gThYdvlti0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B8+uhJhiMY11/qKE9H10jVwv846Hy5qFVClzzTmGOKv3rAoL1n0+9pmE9ZjXfpAfCAi7dOOH3piZpR5ehoEk2puCg6zSkTXtn3rO2jXM44yzViV9JLaKVp3UZCkD+RNhdiwkVaNhClU52pLAXbqZab63i32/kbjsvcWrLV8vn3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xPEMd0wP; arc=fail smtp.client-ip=52.101.62.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xPEMd0wP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9KTQ39MXY8JtRttyc97IEScA2gzDeLF4dg9Mw6TfnOJ9kJJCvin8u9rdsLI4ygd+7GE1hjwr5UulLEflGgj7fvB4yhBhS3sa4kf396JWAMHsN63h4vuPrbzFZG7MzEOVXOIGc/+FpdUEbt+ozamEzMvcJYFbo70+cTWx6o3fLqYVTZNb0ekSiODi3VnhgAK0gbRj3Kh8z4G89qOZ7YzB/akKtCbofrio+co6jMW/XA7mRG03tRMhGo9XkkHhgDuyD3yQIf+jhagTq1DR6yex86BrI4lJBNBdY7mKlC0eDe0nrCbdySL6Qv5o6QjawUOF0ot7iaPYJ92tvLSM+y52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAznHH6AVZ6cLWAkJKxRXyrVkUy3A3YLq1HEXpN26/o=;
 b=pJvkpoxH8E2hf7M1KjCULT90Mb+3uo6jfT5zFfGOqEyQSsd/h/b4EPpKJak1mzsiy3zxIknlAlMi4Fe+itq6weXQGESWO29ZFbht+HHJ00qEZTexnQ+58lRlVXLHbOd3f0c6KP94ckSiTT3yCRar/dPa+sdeSJMG0aXLaHO/AVedMmTuteobUtW4mfHf1EI9IernOURV0g7SNL4FZ501qxp7bna6f82QtMrdlyj2ajJfDf6ZaXUFzdphPX2ttmJzRDlMwbgaycPjOJG++nHlzqx9FYd22pUCSBC5nCBHv4Pu4muxJQdmwkZKr7qvrmmcPTGjbEhoyITu+F6lcKSomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAznHH6AVZ6cLWAkJKxRXyrVkUy3A3YLq1HEXpN26/o=;
 b=xPEMd0wPd+RRbgeMsN76t9i1wxSuuVmyZeElTYCYlGuDFkCbaoxMjFUQacGY6GqaOAIMcLEq5HPCuq7tt5/hhLaNQO0JdRGjYr9Q/48VvBjJMz57mNZ7U3xqttdRbpwf7fJoIuw6gG9s//Z0ckOQPB6CjPpX9SFFFsza6XFlSbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by CH1PR12MB9645.namprd12.prod.outlook.com (2603:10b6:610:2af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 16:51:12 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:51:12 +0000
Message-ID: <a0ad071c-dfe3-4172-b1de-9cbf16c46a51@amd.com>
Date: Thu, 11 Jun 2026 22:21:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] platform/x86/amd/hsmp: Make metric table read
 locking use guard(mutex)
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com>
 <20260611052919.1095549-9-muralidhara.mk@amd.com>
 <f4086725-9d83-31f0-77be-34b8ebceb2eb@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <f4086725-9d83-31f0-77be-34b8ebceb2eb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|CH1PR12MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: db5bd0cd-9509-4859-8b49-08dec7d9a4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a17ydcNmtzIrnqpWHx58gjG1rN1bdz0UnhYr2+fICi86nmLpc6ErjX0paneOSy/mne5Ezz1Vo6xuCL40uNWFegJeZje8TEVkJUXe9OzD/ZBLcPt9K3lZpyWvzkHuy26Guee30xz6OVyHCWGXOMmHpIo7WqmwZcc789wYHzhy/wy/hI/The6zIS9pCtpenLdCpu7j0bJpWugczvbc095DUDjdXlDigohv5omQlSmA3C2FzvbMzrznqYV8A8mhLUgElxwLUZHDBau6flrSlDwRKNmlivKYojat5Vpiz9woM9GOlIURwG+mgYkt+/yQfyXtIdEKTCqFmjxeVt6JiKox79k7/go0oB6gZV7zN35G8LXRnHCxgnvFiKx9+tDHkkwxfaKlFXAKsmEa7n26kbNK12xlEbF+02PRCs19ZauHgD1SXqELSACWf4pkJ5+Jf0fYMEs0nHHPi/Ifw97ELq97iuj/v1EkQ/VZcRFRavCYLwXNRPA4mActyHjn/Re6SUxUOfyd0tbt1FZCu2gZ1zO/haQlU0XazMlV9K2bSyo6NXDgmNGDcfDNlRxyFQQA75/X4hfQEvu2slWnso+WlNTAhHNm/G3jJk6vPplBouRIWN9QAYNdwqny0Mv9X/EgZrYyQUwu9D1jl66dMMWf8Zyr0eXYdgQgHPH56NviAYhrNtNA6SyNGQzFY2XMwpD0xm6a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajVDV2dCUTBxRW5RZHpUWGVmaTllRFYvbjIrYmRhYk12QWFvbmpVcWtJTkVx?=
 =?utf-8?B?b2M0NzkvamNUcW5rbnZLeHBtam1CQWhJZEQ4L28vUmc3TXBGQ1hCVzJXNkRI?=
 =?utf-8?B?ZTBzQ2hmQlZjckhlRWswci9NRlllc2UrdlJydGszeDJkTGplVXgyclkxUFlj?=
 =?utf-8?B?UmgyMHJOMTVkS1RZUk1QYS95aXR1ODJxTGdXNVlpQ3NWeFNJOWR1b2ZtKzQv?=
 =?utf-8?B?NXZtYmlhOTBrcTh6Nk1mSkFWQWU0d29TSWNjblZ4QnFIUmlQZXBnb3haeUpa?=
 =?utf-8?B?Zy9yc0dsVVl4enQvajJwaW8yOHNLdGorcE5PbDNlOXNxelpESzJRRHFtamla?=
 =?utf-8?B?VGFsOEZldVcxSDh1ZEI1NGZCelc4VXBJZ3ZrdmNrdSsralJ1UU1Ja1l2a3VL?=
 =?utf-8?B?N0F0TEFML3V5U3UrN0RhZG1VSVBmeTQ0enVnTjJqSkQ3WDdERG52MDNFWHJw?=
 =?utf-8?B?NVpxUEdFSjlHd1U0K282MVNlU0I4Z1I0a21qMlpLcFA3cEdvL2RaeGNHc21w?=
 =?utf-8?B?S09yY2NlZEhhZ0JucHYzR2R6bkVuQ0tqY3RzRW9PUEpVTjA2aGxLRWtwdjd3?=
 =?utf-8?B?clB3T01PWE5PU1ZRZ2hzVnJhQ1ZLckdua1dYSldRWWszMzZMVDU5SFFJWHRu?=
 =?utf-8?B?MTBXbXhmeERVeUFOcE02UFV3cWNiaERoNFZORkVNKzZCdnBleDcxVllNbWsy?=
 =?utf-8?B?MDF0UlVQSDBuYUpyWlNkNDArQmx4ZHpSSUVad3VkbW1QUTNKZXY5T1ROWE9K?=
 =?utf-8?B?M0dkSE5YaEJubWlNYlFibmNHWGt3Ti9vSXZNOFpMTjIvcmJsaWpERFlIeVo4?=
 =?utf-8?B?am1mQ0xTUUVhWmJ4ZDBrTURxNFpPamVKb3ltc0U1eldSSlpZWHpMa2ZWZzZl?=
 =?utf-8?B?V3ovbjlLbkFiQ0lQdjlnVWIrZ3dpNnhNTFVaUnBhUzNvZ3JGNnltS2JmcGF4?=
 =?utf-8?B?WTJiTlNuTnhwRU5JYjZnZGFjVnZXeUhWb1AveldrU05mYTBjYVhQTVFzR3lK?=
 =?utf-8?B?ZGk3VmlPUWFDR09Edk44aHFMajl0MUh5R0hhaFNaZHdZT1JnbG0xUjFyNkF6?=
 =?utf-8?B?Vy9RRXg2dDgwdnRzbm11ajk1L0szK2VsYXNkSHlycy9MMkI0Myt3aFFJUnlU?=
 =?utf-8?B?bjdnMHZaUjZSQk9wbThWWURsb2RUVlRwb3hDSHBQMW80cU9ycGZMSTFTU3lr?=
 =?utf-8?B?MjZ1RUlFeERuQzVvaE5KNkQ1Qk5yVHJBckRnUWVnZFJxUjk5MW5lNTNkZFRY?=
 =?utf-8?B?aW5INWJnVjR0Syt2c2h4Ym5kVTJzMU9EL2JUeEVpRDVsZG12SkJrWDJIRXo3?=
 =?utf-8?B?QmRzbU4wQjY3eDgzcXpwZFIzK1k4NFN5ZFVybm9HK1NwWXJ4RmFiU2hrZHNY?=
 =?utf-8?B?aE5xdkk0ckhmems3Vmw0ODRpa3p3ZDJHYldFUjJNUjhta3EreHVmaUFXYU5q?=
 =?utf-8?B?dlVSUTdkdlMyY0k0cWtqb3huY2UvemZzSzVMcHVBMi9PQU1YUHBrOXJqQWNp?=
 =?utf-8?B?SDlUWFN5ZktJa2tmbnpIMjBDZDI2YWRCRjFpYkZ0OXJxTmpnZnBjME44Ny9X?=
 =?utf-8?B?NCs3c2VhMEFXcHU5Q0s1eE9qbFdJZTEwY0RjakUrWGZET3daeHdQa2NTOUpR?=
 =?utf-8?B?YkpibENRaWxKdmRLZis5d0V5L1U0OXhOc01Ccllqb2syWVRFSjFRNDMwTnk0?=
 =?utf-8?B?d29ua3ZMbGNrTVl2WXJQa2VzdmRERjNnVzhhd3hZV1lPWW5HUk5iYU1WUmtS?=
 =?utf-8?B?OVh3MUxSUXMzck1uWnY5YWNGaFRmb0JDeCsySDFSQ1d2MG0zVDdUcmpzY1N0?=
 =?utf-8?B?RlBvSk1vT1FDNExFMFVBdm9QaGJlbGx6V3BoM1VWTjJYckxtWGt0cE82Ynpu?=
 =?utf-8?B?aDBGay83M2h2T1I4ZWR3eWNHMDRGNHZVSURBR1hNRHE0MnBWbzFFTlVUb281?=
 =?utf-8?B?RW9QL3MwVDFaa2hnb0NneTAxdlJ2akZpazF6a1ZZVkRWaVVXdlVYQVhiNzlF?=
 =?utf-8?B?SkpzNjNsY05aUEE1Z0F0d2JmNGJuQXZ3bjljMFNDaXZWaWtPZ3F2dnhybThU?=
 =?utf-8?B?VVhPNE9aMDhzWExENEkyUld2TDJVbVRsOHoxSDZGMEpDWXltODhPSzZVUWdZ?=
 =?utf-8?B?YUJ1YzkxWm00amJ1K3htQUhCaFY1VVBJTk5JSzNVRU5GaEdqTDhKcDl1MHU2?=
 =?utf-8?B?eGZqWXhHVFBKUVVhV3B0TVVGazZzOWNyWU1vQk9IbTMrU25tUTg4VXQ1b0tk?=
 =?utf-8?B?V3B5WXQ4Nis3SmMzcGVqWTNFTno1Q2pzZitJNHJrdmJyVmJQU2I3aG1jZmNW?=
 =?utf-8?B?a2FZRkY1emFOTmVyTkNDYnR0STkvK2FCUnEzZUw5dDdzTmJ1OG56dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5bd0cd-9509-4859-8b49-08dec7d9a4df
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:51:12.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXG3OKDgU7sIFGgXA+GLvDpg2wAG6A7Evyg0/Rmfooa9o34DrA8/FYpB1TDztPtqzM1uThkjlsQW39kbISynVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9645



On 6/11/2026 6:48 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, 11 Jun 2026, Muralidhara M K wrote:
> 
>> hsmp_metric_tbl_read() refreshes the SMU-side metric table and then
>> memcpy_fromio()'s the result. Without serialization, two parallel
>> readers can interleave the refresh and the copy and the caller
>> observes a torn (mixed old/new) snapshot. Add a per-socket
>> metric_tbl_lock so the refresh-and-copy sequence is atomic from
>> userspace's point of view.
>>
>> Use scoped guard(mutex) so the lock is released on every return
>> path without hand-written goto chains, and initialize the mutex
>> with devm_mutex_init() so no explicit mutex_destroy() cleanup is
>> required.
>>
>> Initialize the mutex before devm_ioremap() so the invariant
>> "sock->metric_tbl_addr != NULL implies metric_tbl_lock is usable"
>> holds on every error exit. Both callers of hsmp_get_tbl_dram_base()
>> (init_acpi() and init_platform_device()) intentionally only log a
>> failure and continue probing, so initializing the mutex after a
>> successful ioremap would leave sock->metric_tbl_addr populated with
>> an uninitialized lock, and the next hsmp_metric_tbl_read() would
>> take guard(mutex)() on garbage memory. With the order swapped, a
>> devm_mutex_init() failure returns early before metric_tbl_addr is
>> ever set, and the existing NULL check in hsmp_metric_tbl_read()
>> keeps rejecting the read with -ENOMEM as before.
>>
>> Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 19 +++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  3 +++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index a9dca97568b8..46e8dc7cfb60 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -479,6 +479,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>        msg.msg_id      = HSMP_GET_METRIC_TABLE;
>>        msg.sock_ind    = sock->sock_ind;
>>
>> +     guard(mutex)(&sock->metric_tbl_lock);
>>        ret = hsmp_send_message(&msg);
>>        if (ret)
>>                return ret;
>> @@ -495,6 +496,24 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>        phys_addr_t dram_addr;
>>        int ret;
>>
>> +     /*
>> +      * Initialize the per-socket lock before anything that can set
>> +      * sock->metric_tbl_addr to a non-NULL value.  hsmp_metric_tbl_read()
>> +      * gates on sock->metric_tbl_addr being non-NULL and then takes
>> +      * metric_tbl_lock unconditionally; both callers of this function
>> +      * (init_acpi() and init_platform_device()) intentionally only log
>> +      * a failure here and continue probing, so an init order that left
>> +      * metric_tbl_addr populated while devm_mutex_init() failed would
>> +      * leave the read path locking an uninitialized mutex.  Doing the
>> +      * mutex init first preserves the invariant "metric_tbl_addr !=
>> +      * NULL implies the lock is usable" on every error exit.
>> +      */
>> +     ret = devm_mutex_init(sock->dev, &sock->metric_tbl_lock);
>> +     if (ret) {
>> +             dev_err(sock->dev, "Failed to initialize metric table lock\n");
>> +             return ret;
>> +     }
> 
> Sashiko flags a concurrency problem here.
> 
> This fundamentally stems from earlier design decisions:
> 
> 1) hsmp_acpi_probe() is not really doing any concurrency control for
> .is_probed access. I somehow seem to recall I did brought this up earlier
> with somebody else working with this driver earlier but apparently there
> still are not locks or other concurrency control in the probe.
> I don't remember anymore what happened with it back then.
> 
> (The problem #1 is not exactly mentioned by sashiko but it's there,
> AFAICT, nothing guarantees only one probe sees !hsmp_pdev->is_probed and
> assigns to ->sock.)
> 
> 2) ->sock teardown being bound to which ever socket allocated ->sock.
> Leading to use-after-free in devm_ teardown for any remove that runs after
> it.
> 
Understood. you are pointing out Unsynchronized is_probed / sock setup.
In hsmp_acpi_probe(), if (!hsmp_pdev->is_probed) guarded num_sockets, 
devm_kcalloc(..., sock), and later hsmp_misc_register() with no lock. 
Several AMDI0097 devices can probe in parallel, so two paths can both 
see !is_probed, or interleave alloc vs misc_register() in a racy way.

> I think the early teardown of the misc device was the only thing that
> initially prevented use-after-frees. As it kind of worked, I never voiced
> my concerns about how fragile the teardown was. Looking through the
> history now, it seems things got broken after adding hwmon code which does
> use devm and calls hsmp_send_message(). As a result, removing this driver
> is currently broken. This patch adds to the problem.
> 
> 
> I don't think is_probed is good solution here but the release of ->sock
> should be properly reference counted and that might be reusable for the
> alloc side.
> 
Understood. is_probed is a weak substitute for “who owns sock and when 
may it go away. will explore and try to add reference counted way.

>>        msg.sock_ind    = sock_ind;
>>        msg.response_sz = hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
>>        msg.msg_id      = HSMP_GET_METRIC_TABLE_DRAM_ADDR;
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index e7f051475728..f7b1cbf19932 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -15,6 +15,7 @@
>>   #include <linux/hwmon.h>
>>   #include <linux/kconfig.h>
>>   #include <linux/miscdevice.h>
>> +#include <linux/mutex.h>
>>   #include <linux/pci.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>> @@ -41,6 +42,8 @@ struct hsmp_socket {
>>        struct bin_attribute hsmp_attr;
>>        struct hsmp_mbaddr_info mbinfo;
>>        void __iomem *metric_tbl_addr;
>> +     /* Serializes concurrent metric table refreshes from the sysfs path */
>> +     struct mutex metric_tbl_lock;
>>        void __iomem *virt_base_addr;
>>        struct semaphore hsmp_sem;
>>        char name[HSMP_ATTR_GRP_NAME_SIZE];
>>
> 
> --
>   i.
> 

