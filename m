Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A1136A351;
	Sun, 12 Jul 2026 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783826008; cv=fail; b=QKy6Kr3YricObt75g2Fr+/jo/8naKT2FlKqU7kqwArAxFXikMkAPKzDOS+AvHqPLoUPTtcFi7EkduGleV1YqxoOZUaVflcvfmUKgqE89CuVxsH9mzsZFl9OOD0/nRFsnPkWKI7gwMAimg/hGXIcEZ/zGdhFRpHkDRR5VeXkRmp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783826008; c=relaxed/simple;
	bh=lTFNlWy5DYxXydWz5+Fy/C7ZFSoRmXnJ3NEnZPB+1a8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IvzHiyi6MXoY1AyYnNnIM7HqualyS7KHWV00Dl4YdNJRXcmiqtcFWbLzESh+edBPCA7wWlDz9j8b/TMLTt5R6atavIXkFjl0sJWshTmlGaOdl9oVZdyuJZDS9j5g49BPZfdSndScADlifMyN04aPYAqZDy3Sd5/Mev5A8k73HL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b90SyRAO; arc=fail smtp.client-ip=52.101.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b90SyRAO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPYi3qWJm5cIfDrTeMp1MqWOdeTfn8V3hwEln/Ne+jk/jXKZPVTVSgbIS3gDE0Ft0aGdYT8fGO0ykLEW3cWy8yoP+duk4ChsFLCnU+LOk0eqSRoVVtF/DK+TT9AExT1VzMysL9NzrJ2jDcPWbiEZNf+rwW/ypPOQnwIG49nQYNATHSvtmMwafGhVpN+HlrjxJ+HGTEbhe65qgumEi8pSNeyFwPGTRw3s7Mu9+bBcvUtpsFRdOi+Pl01NFin7/pmK0muw/ck/uPpxF3BpUYvGCATaCRidIwrt9YOKR/N/hBeMX8J4ez6LszeCBATf0X92cgGfbx6whvV2kVuk5w183w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whp5lqYuUzHIYLTgaoGyUieKpMD/JlXBB4Z6yGblTrQ=;
 b=GJR+CQOoAz22VeYfcyYi9Pe+tty+mqnPH16eD919Nay0PK+Q08MzTtjDaDzE/MNaa6NAQR5nEjtj/MOu+hZUQ51cvfkhrxivVCcPSpXWQfMD+39bq9VT/juo5lApLO5jaRrvDRTMGAdTzLm5h4SF2PiIvnONsL34jUOlQcILepLguI0TCZexu3DIAW0mA28HN5f/Y9L1P9xxyT1Hh8VaDidbm8SKNZShuMdoQZgVAVgeC06XXSpSGhXqGbU0GPVquxFbJYICC5O+F5MaS0TWIts+5ZatWaE1Uu+4BD0/e7HTJHmZim1NLYmi3Xg4xTLJUIaVArKV17FxLWRwIcwWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whp5lqYuUzHIYLTgaoGyUieKpMD/JlXBB4Z6yGblTrQ=;
 b=b90SyRAOEI/G/q4B+qGeKa6NFcd8DJTgKch2663ATBYaRkk9dEHRhQr8rFLKB6lI29DbBb2S4GGDQFbsqE1gtxpxfa0wsOfp7OCo/MXPgxgyRgtHmbrs5SltbqVFmJObDk9UFUE85QDTcWgGjxW+oYbzHB/+3slGNckeH87bpyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH7PR12MB8780.namprd12.prod.outlook.com (2603:10b6:510:26b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Sun, 12 Jul
 2026 03:13:18 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0181.009; Sun, 12 Jul 2026
 03:13:17 +0000
Message-ID: <f91696fb-bbfd-42c8-b637-41c50ce621c0@amd.com>
Date: Sun, 12 Jul 2026 08:43:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] platform/x86/amd/hsmp: ACPI HSMP refcounted
 sockets and coordinated release
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 muthusamy.ramalingam@amd.com
References: <20260710144633.879018-1-muralidhara.mk@amd.com>
 <20260710144633.879018-6-muralidhara.mk@amd.com>
 <9469db87-7c63-aa00-1d0e-161df55fd180@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <9469db87-7c63-aa00-1d0e-161df55fd180@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::6) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|PH7PR12MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc4a135-f7c7-4fbf-099c-08dedfc384c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	LpfXsk8/2W5pSH+yC7I/Y6Bjn5MrFYwIL5PESdQIXmelULuqG0F0du+IR5+S7SbLTF8d5xX/+LboV2K8bT+u31H7cxYOgwYPUaBJ0k1fdPQn7TPUuQtuYqXiPA1Z1i+qb9eaXMlp3AKwQz2z9nveAphmK+07HIAZ86JXeIWwDJxYfjvwjefnDK+D+TfCSm7U8+tqRtFhF3srG6tukcIFewEU4b6TOw99UVTXX7m+BsPvyd9eBEohRr6UxFiGEpH5I+uQ169UDjxysvdUDTzUJzotsY2PPzhHkBQB34ohn3IWYOmiVjE+udCHPld5L7L3GKSgtjjyEH/GxrF11JtbGqua6CdWOQKomGx6SgfjQHvDLNkCoBZ1iBnNFk8Cb0/GjMaiGDZwL2b7DGfWnY0G7hLldU4MJnZtwrpxg4VW/WXAehJWUtGrymHUj77No1rnEupFpCqUJOGKz3aupMS9ZX6y5qB4h4dl1K2Q9aCjAs1iqwganuV8hJR1/77K93M4hJ4I4Van8o17tEmfyr03naTl1UEuhzqXyFYwMzInGqUtSYTIr05oNtD+8dRJkDou4Sz/vynpxljSotbxqWBhlQP9Va8KzT8g6F7azD8zKEv79xQx1WP1gfjNXTPRHlsLdu7iI0d/AYqvCnLpL7fjz6t/SmDfodH9L+wE0X+MJNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU16VytQaDNDK25BMUsyTTRqaWcwVjZKY0U5NXp0QW9RbXF5bWtzU1NFeEE3?=
 =?utf-8?B?N0kvNWxFQXEyVVhvR1ViM0o3QWRmMHFSVGhkQXRtNXUzNXZBbG5JZW50ZFM2?=
 =?utf-8?B?ZWVUVFN6Z2hXYnFNa2UrNFM5RFgwTkJGTnM5WXpUQXJRbHZBNWFTOTBXeHpl?=
 =?utf-8?B?UFdIKzJQdUYxcW50WXB4amJrODEwSTBPdlljcXpKZVZjVnpPeHpXcjAzaG9w?=
 =?utf-8?B?SnN3UUNScmtNTnVCUHc4MEJtUHJ4SnJDVVpEVWt0MmJVeFdIZk9FeXI0d3Rq?=
 =?utf-8?B?V2dyRTE2Rjl5QkdFTmJxSVF2b1p5djZqZEVpUHdHTy8yTWtCVFNIQTIvWURU?=
 =?utf-8?B?cElrMklJS3BXTEcxaVdDc0lkTk5HZWpXbmtDdHpQYUhZRXJZWW5ENjhuTzcx?=
 =?utf-8?B?T3ZMS1VvKy96U3RMMEdVaTdLY1RzWTF4RDN3RzdvbmtDSS9Nd3RSMDFFWjBw?=
 =?utf-8?B?U1krYmo5SjlEMmhadjY2VGxMOXZFdXBLN2w4Z1BzZFpOTjQxVW02UDk3MDBp?=
 =?utf-8?B?T0xhZG8wUm9iNmQ0UytlQ2lxVU85Y3JFdjRFNFF1K3BvZjdmbzlPYTlKNXR2?=
 =?utf-8?B?L2VOQWdBNHZwTmVKRmlUQWsvZklXdHk2VVk1NG80QXpzOUxUWllxZjBMR25w?=
 =?utf-8?B?dTB5R203bTZsSXZrcGJsLzJxTGVtMjY2cDg0VDIyUW43NVN5U3J4NThieDNn?=
 =?utf-8?B?aXhoVTlmbEl6c0YzQVBCeUdHYThzQ2RrSEt5aHU1UUl3N3hjMmU3WmdWMEdn?=
 =?utf-8?B?QXJrd3ByUG9pUi9VMWM0VTUwWXM3aG90UVViTHdwVU5JTm9mNnVjek5NemlL?=
 =?utf-8?B?R0NIa0NDTWZDWUJRbHplTDV6RHZMZlNjSmVMZEtONTNlMFBlWkQ0RC9MU0JO?=
 =?utf-8?B?OEZWV00zTTdHRjhtMmhaMTJwc2ovZFRTQ1Zpai9rRmk2bC9iaS84WVVLVitx?=
 =?utf-8?B?S1ppQ2R6M2JQRzI1WXJQQW9VZHh3MWZOT3hhTFM4TWc2U1VsalpEYWZveGtL?=
 =?utf-8?B?N3VyK0tiYUxCSTNoRkU0NkhhL0FSc2Fhem5oUllmTTBtSTBTQURXTFBubUNK?=
 =?utf-8?B?ZG5OVk92WC9OQ0N2ZU1meWNkYVBvaTdYYWRIcVhmbW8wVkxkZjJFY0Y5R1Z2?=
 =?utf-8?B?eVYyLzdUTW9NK21qT3NRUEpvQlVpaEdKVmtwMmNlYUFMbjI3bm1yWCtaT3VY?=
 =?utf-8?B?cmI2VU1ZOUY3RnJZOUR3V0c3UWJJcVJ6R3JobmUySGd0NTdYQklRNVR4MHhi?=
 =?utf-8?B?U29kbCtiQjU5aU12aENvR0J0eE9xMmJUdTYxS3NCMVZYakhvNThQd1FHTG9i?=
 =?utf-8?B?VEF3ZFMxK2hrMjlsQzlOTzlEcjM4a2ZJU29QbkVtNEdaTmhwallzYTRTczFn?=
 =?utf-8?B?eXNGN0pVM0FqcHNMaW56NmpqOUVCMWtaMU1pVk84K1JrMFNPck1DbXp3eUVn?=
 =?utf-8?B?bUxYaDA4cS9LcFcwcXpydUVlUWxTT2ZCenBjaEhmMG1zbGlCbituSU9UVnVM?=
 =?utf-8?B?c1FaTlFpZDBrSUJrUi8vVVc4UXVJcHAxeTh2WnF1eEJyQ0NYNFovNU5aQ0h5?=
 =?utf-8?B?NkxCQVdpMlNzM0hlTit2M1pRSjIyRWVuNUdtVlpwQ2NkaVY0U3FGSHpsVVVQ?=
 =?utf-8?B?Y01rY0o5T1k2K0hldVBRMHcxT0FtRTh2eVZEYkgrSXFLSmlLWnVCZExOUlhR?=
 =?utf-8?B?SFJ0UnN5Z2duL29lM3pINjJEUXl5UXRqNTNKRmFYSllTTkM2NmtQSW5QckQv?=
 =?utf-8?B?UFF6SXBRM1RaUG1tMS9yUVVPQW5xcVZ5UEpuQmwwMEp3bnhPd1RnOTdMU2Vq?=
 =?utf-8?B?dUZUczZLZzRvUm1kSWdjZTVNOUJEWFErMXhiYU1Sb09nTlRORzQwTjBPWVZj?=
 =?utf-8?B?SWh1ZE81Sm5jbThJaXVob3I2Yyt0UXBtV29uTFNQMFdNUkJTNE1iY1FaREhM?=
 =?utf-8?B?M1NOUDFndS8xdGUxcFlRMTJlNkk0aWFBbnFwR2MwbStIQjhXeENRM3V6UjJS?=
 =?utf-8?B?S1d3MXVkUTNUMEJEOTRBYXUySldPTkNVTUgvU2R5RXUwWlEyQ0dwMHY3RSto?=
 =?utf-8?B?MXJONThOY3V6TjQwVjM1eHU0K3lkclZuaXowSXN6SEFQZjRycy9heGFHUUNV?=
 =?utf-8?B?bWFrQ3cyblRmU2xmUTRSL0FaL1NLNjg0OFVSaXZGM1hMelB0aW5LTmlLQlho?=
 =?utf-8?B?TVRTNGtjOHp6YXMraVdDbXBoMDlvNU5xZysrY3dBS2ZjZitPQ1ljWU1DWkJh?=
 =?utf-8?B?aWNQWk02UmpoTW00RWRCWVY3M2w0eVBubzhNQWJXSnFPN1c1eWhvRTVCbmZv?=
 =?utf-8?B?Z3JQWW8waWREbEdTWVMwT1dGTTFmam1Ed1F3MXlwOTlmUGpuUkwzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc4a135-f7c7-4fbf-099c-08dedfc384c6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 03:13:17.5517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hX4DeeY19CGy66v+LoXIP79uN6ybOG7V8vDJJ0xrs1ybNmGHrqZO6wUnPeYiMrOEPYIVWT7DX5NgS9MJKYYxKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8780



On 7/10/2026 11:21 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Fri, 10 Jul 2026, Muralidhara M K wrote:
> 
>> The ACPI driver binds one platform device per socket but shares a single
>> socket array and a single /dev/hsmp misc device across them. Replace the
>> is_probed flag with state that tracks this shared ownership:
>>
>>   - miscdevice.this_device tells whether /dev/hsmp is registered, so the
>>     misc device is registered on the first socket and torn down last. A
>>     preceding change clears mdev.this_device on deregister so this gate
>>     stays reliable across a re-probe.
>>
>>   - hsmp_acpi_sock_refs counts the sockets that have probed successfully.
>>     It is guarded by hsmp_sock_rwsem, which probe and remove already hold
>>     for write, so a plain counter is enough and no atomic refcount is
>>     needed. The shared socket array is allocated with kcalloc() on the first
>>     probe and freed by hsmp_acpi_sock_release() when the count drops back to
>>     zero.
>>
>> hsmp_acpi_sock_release() is the single teardown helper: it deregisters
>> /dev/hsmp if registered, unmaps any metric-table DRAM, destroys the
>> per-socket mutexes and frees the array. The remove path and the
>> probe-failure path each call it once they are the last owner, so the
>> teardown lives in one place.
>>
>> Both paths also clear this socket's dev, so a message issued after a
>> non-final unbind (or to a socket that failed to probe on a multi-socket
>> system, whose array stays alive and whose remove() is never called) cannot
>> reach the mailbox that devres is about to unmap.
>>
>> Two lifetime fixes fall out of the array persisting across a non-final
>> unbind:
>>
>>   - hsmp_get_tbl_dram_base() iounmap()s any stale metric_tbl_addr before
>>     remapping, so a rebind does not leak one mapping per cycle. It runs
>>     during (re)probe before the metric sysfs attribute is exposed, so no
>>     reader can be using the old mapping.
>>
>>   - The ACPI path registers /dev/hsmp unparented by passing NULL to
>>     hsmp_misc_register(). Its per-socket devices can be unbound individually
>>     and out of order and the misc device outlives all but the last of them,
>>     so parenting it to one socket's device would leave a dangling parent.
>>     hsmp_misc_register() now takes the parent from its caller, so the
>>     platform driver keeps parenting /dev/hsmp to its single device.
>>
>> hsmp_sock_rwsem is held for write across probe and remove, so the release
>> and probe-failure cleanup run with it already held; an upcoming change adds
>> its read side so the same lock also drains the lock-free data plane.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c | 122 ++++++++++++++++++++++-----
>>   drivers/platform/x86/amd/hsmp/hsmp.c |  20 +++++
>>   drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
>>   3 files changed, 123 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index a092d7589bcb..8339af1624f4 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -24,6 +24,7 @@
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/rwsem.h>
>> +#include <linux/slab.h>
>>   #include <linux/string.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/topology.h>
>> @@ -42,6 +43,14 @@
>>
>>   static struct hsmp_plat_device *hsmp_pdev;
>>
>> +/*
>> + * Number of ACPI socket platform devices that have probed successfully.
>> + * Guarded by hsmp_sock_rwsem, which probe and remove hold for write, so a
>> + * plain counter is enough; no atomic is needed. The shared socket array is
>> + * allocated on the first probe and freed once this drops back to zero.
>> + */
>> +static unsigned int hsmp_acpi_sock_refs;
>> +
>>   struct hsmp_sys_attr {
>>        struct device_attribute dattr;
>>        u32 msg_id;
>> @@ -611,6 +620,60 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>>   };
>>   MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>>
>> +/*
>> + * Tear down the shared ACPI socket state once the last socket is gone:
>> + * deregister /dev/hsmp if it was registered, unmap any metric-table DRAM,
>> + * destroy the per-socket mutexes and free the socket array.
>> + *
>> + * Called with hsmp_sock_rwsem held for write by the remove and probe-failure
>> + * paths. The write lock has drained any in-flight hsmp_send_message(), so
>> + * unmapping the mailbox and freeing the array cannot race the lock-free data
>> + * plane.
>> + */
>> +static void hsmp_acpi_sock_release(void)
>> +{
>> +     lockdep_assert_held_write(&hsmp_sock_rwsem);
>> +
>> +     if (!IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device))
>> +             hsmp_misc_deregister();
>> +     hsmp_unmap_metric_tbls(hsmp_pdev);
>> +     hsmp_destroy_metric_read_locks(hsmp_pdev);
>> +     kfree(hsmp_pdev->sock);
>> +     hsmp_pdev->sock = NULL;
>> +     hsmp_pdev->num_sockets = 0;
>> +     hsmp_pdev->proto_ver = 0;
>> +}
>> +
>> +/**
>> + * hsmp_acpi_probe_failure_cleanup() - Undo a failed ACPI socket probe.
>> + * @dev: ACPI companion device whose probe failed.
>> + *
>> + * This device never incremented hsmp_acpi_sock_refs, so clear its sock->dev
>> + * and, if it was the only socket in play, release the shared state.
>> + *
>> + * Clearing sock->dev matters on multi-socket systems: when a non-first socket
>> + * fails, the array stays alive (owned by an already-probed socket) and
>> + * remove() is never called for this device, yet devres unmaps its mailbox once
>> + * probe() returns. Without clearing dev, a later message to this index would
>> + * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
>> + *
>> + * sock is NULL if probe failed before hsmp_parse_acpi_table() set the drvdata.
>> + *
>> + * Called from hsmp_acpi_probe(), which already holds hsmp_sock_rwsem for write.
>> + */
>> +static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
>> +{
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +
>> +     lockdep_assert_held_write(&hsmp_sock_rwsem);
>> +
>> +     if (sock)
>> +             sock->dev = NULL;
>> +
>> +     if (!hsmp_acpi_sock_refs)
>> +             hsmp_acpi_sock_release();
>> +}
>> +
>>   static int hsmp_acpi_probe(struct platform_device *pdev)
>>   {
>>        int ret;
>> @@ -620,23 +683,24 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>>                return -ENOMEM;
>>
>>        /*
>> -      * Multiple ACPI socket devices probe in parallel, but the is_probed
>> -      * handshake and the one-time socket-array allocation below must run
>> -      * exactly once.  Serialize the whole bring-up against concurrent
>> -      * probe/remove by holding the socket rwsem for write.
>> +      * Multiple ACPI socket devices probe in parallel, but the one-time
>> +      * socket-array allocation and /dev/hsmp registration below must run
>> +      * exactly once. Hold the socket rwsem for write across the whole
>> +      * bring-up so it cannot race a concurrent probe or remove, and so the
>> +      * probe-failure teardown drains the lock-free data plane.
>>         */
>>        guard(rwsem_write)(&hsmp_sock_rwsem);
>>
>> -     if (!hsmp_pdev->is_probed) {
>> +     if (!hsmp_pdev->sock) {
>>                hsmp_pdev->num_sockets = topology_max_packages();
>>                if (!hsmp_pdev->num_sockets) {
>>                        dev_err(&pdev->dev, "No CPU sockets detected\n");
>>                        return -ENODEV;
>>                }
>>
>> -             hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
>> -                                            sizeof(*hsmp_pdev->sock),
>> -                                            GFP_KERNEL);
>> +             hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets,
>> +                                       sizeof(*hsmp_pdev->sock),
>> +                                       GFP_KERNEL);
>>                if (!hsmp_pdev->sock)
>>                        return -ENOMEM;
>>
>> @@ -646,35 +710,55 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>>        ret = init_acpi(&pdev->dev);
>>        if (ret) {
>>                dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>> +             hsmp_acpi_probe_failure_cleanup(&pdev->dev);
>>                return ret;
>>        }
>>
>> -     if (!hsmp_pdev->is_probed) {
>> -             ret = hsmp_misc_register(&pdev->dev);
>> +     if (IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device)) {
>> +             /*
>> +              * Register /dev/hsmp unparented. It is a singleton shared by all
>> +              * ACPI sockets and outlives all but the last of them, so
>> +              * parenting it to this socket's device would leave a dangling
>> +              * parent once that socket is unbound.
>> +              */
>> +             ret = hsmp_misc_register(NULL);
>>                if (ret) {
>>                        dev_err(&pdev->dev, "Failed to register misc device\n");
>> +                     hsmp_acpi_probe_failure_cleanup(&pdev->dev);
>>                        return ret;
>>                }
>> -             hsmp_pdev->is_probed = true;
>> -             dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
>> +             dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
>>        }
>>
>> +     hsmp_acpi_sock_refs++;
>> +
>>        return 0;
>>   }
>>
>>   static void hsmp_acpi_remove(struct platform_device *pdev)
>>   {
>> +     struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
>> +
>> +     /*
>> +      * Serialize the decrement and any release it triggers against a
>> +      * concurrent probe, and drain the lock-free data plane for the whole
>> +      * teardown: this covers the per-socket unbind, whose mailbox devres
>> +      * unmaps once we return, and the last unbind that frees the socket
>> +      * array in hsmp_acpi_sock_release().
>> +      */
>>        guard(rwsem_write)(&hsmp_sock_rwsem);
>>
>>        /*
>> -      * We register only one misc_device even on multi-socket system.
>> -      * So, deregister should happen only once.
>> +      * Clear this socket's dev so hsmp_send_message() rejects it before
>> +      * devres unmaps the mailbox. On a non-final unbind the socket array
>> +      * stays alive, so without this a later message to this index would
>> +      * reach an unmapped iomem region.
>>         */
>> -     if (hsmp_pdev->is_probed) {
>> -             hsmp_misc_deregister();
>> -             hsmp_destroy_metric_read_locks(hsmp_pdev);
>> -             hsmp_pdev->is_probed = false;
>> -     }
>> +     sock->dev = NULL;
>> +
>> +     hsmp_acpi_sock_refs--;
>> +     if (!hsmp_acpi_sock_refs)
> 
> Now that I can actually follow the series this far (pretty easily
> actually, so good work so far!), I again started to wonder why this has
> moved back away from kref to manually handling the reference counting?
> 
> I understand you don't strictly need the atomic part of refcount_t because
> you're under another lock but it would still be cleaner interface with
> kref_get/put().
> 
> It might even be possible to use kref_get_unless_zero() instead of the
> read side of hsmp_sock_rwsem to ensure datastructures won't vanish
> underneath a data place call.
> 
Thanks for your input. I will adress the above suggestion and send next 
series.

>> +             hsmp_acpi_sock_release();
>>   }
>>
>>   static struct platform_driver amd_hsmp_driver = {
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 584fd9b1d31f..967307abe641 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -491,6 +491,18 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>                dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>>                return -ENOMEM;
>>        }
>> +     /*
>> +      * The ACPI socket array is shared across sockets and outlives a
>> +      * per-socket unbind, so metric_tbl_addr may hold a mapping from an
>> +      * earlier bind of this socket. Unmap it before remapping so an
>> +      * unbind/rebind cycle does not leak a metric-table mapping. This runs
>> +      * during probe before the metric sysfs attribute is exposed, so no
>> +      * reader can be using it.
>> +      */
>> +     if (sock->metric_tbl_addr) {
>> +             iounmap(sock->metric_tbl_addr);
>> +             sock->metric_tbl_addr = NULL;
>> +     }
>>        sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
>>        if (!sock->metric_tbl_addr) {
>>                dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>> @@ -528,6 +540,14 @@ int hsmp_misc_register(struct device *dev)
>>        hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>>        hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>>        hsmp_pdev.mdev.fops     = &hsmp_fops;
>> +     /*
>> +      * The caller chooses the parent. The platform driver has a single
>> +      * device whose lifetime matches /dev/hsmp and parents it there. The
>> +      * ACPI driver passes NULL: its /dev/hsmp is a singleton shared by
>> +      * per-socket devices that can be unbound individually and out of order,
>> +      * so parenting it to one would leave it attached to an already-removed
>> +      * device.
>> +      */
>>        hsmp_pdev.mdev.parent   = dev;
>>        hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>>        hsmp_pdev.mdev.mode     = 0644;
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index ec92c2a429bb..45dab9253c13 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -58,7 +58,6 @@ struct hsmp_plat_device {
>>        struct hsmp_socket *sock;
>>        u32 proto_ver;
>>        u16 num_sockets;
>> -     bool is_probed;
>>   };
>>
>>   int hsmp_cache_proto_ver(u16 sock_ind);
>>
> 
> --
>   i.
> 

