Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2FC435AAD;
	Tue,  7 Jul 2026 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443078; cv=fail; b=FuH+CVRHuwd9VoS2GFDJ12BNSPdcpX4P72bRKRCPpQVezY4IMiQzNpPo/BFnGJWkbJUe00FWp0MY5hWnbfSxuv9WpKv2Bmjv5kT3Ynx28+K/h52LNdfpIh9KJAp9od9Uy1nH2nOoL0r3wMJ2KImaW6/wiqh43KP1Y8pfkluOCEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443078; c=relaxed/simple;
	bh=AH5jq6aH3Nja+gDvCPaP9F6UJ4Y07gAg4uOor7TGqWk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=faEdyhxZ3EJknM+Sop/ABLuamIX3s0+kxd6g/J0Oh7x6ozMbxS913Pxo6td6g0seFs036hRkQXqQR9wDEjQ/N7gQUU4BoeAVGtkwMk/UgIPIr90g1a3hl1THfi9eMI3hY1vCIol8FGFSepf+jnYNaK9/B1q9m5fP6C2UxLs4psk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qCF42lFV; arc=fail smtp.client-ip=40.107.209.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qCF42lFV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVlgL5ooG+BJCgBs+q7y6VCiWIzyg2FwDDbRk+FjEQCf4K6g9EGg4UzAXFLAoY6uWCTVo7B38XiS5/qFWcacBBvTISe46XPxgURNalfiP1V/JBmgmGjm5c9DBl3tzN4y5jy3s1rKxW8VOenVE5mo88kJwRtnfCfKwlYJZPc3NZnZVnT1r2pPPwAaTCFP4rq+AAMo+a9MOSQdBZwJUcrWGAuJ8FmJOfhhFklik2AfcLoa6s9NZLDP5cERYOpUxMEOOyzaipC14gNBeokC6ZfnQ9QfEDgyOhqxb1B9CuqdtNB9Zw+jPPFMx5aYf9EraQfahyGbFdKYvS8QKJnlSD7FSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJmw3k2+RlAxjirSRtUDHUW4ODBJ9ow1e018XMyX+tw=;
 b=Twzkm1+/xxTDGqtIbWyx53MMi74Dd2kIAoj9jggLDiYtMUhSwmesJ69dJSHtyUtlwVEOchzoW2XCUMt0o7Uscxc+KpepVBPALgrfHFtEeD2PjTEMaCnMZpUNbgtTv+XlSeyXEJTgDTCALGBobtECrgrlHycqfK3W+/J3t98GqzQCQMG1M/KYXynuEdRALGsDNNdRa6OwFIzAIYayi3oMSkFtuJJGKBg/+YDBj8BVWJr90RpZzX9YA1lbYXF2mbObmxhjltkqL8KcfmYHS+93nOZSudGkOXEfVkEsjZ9vLaAhXr1JbYyhTyaJwLbDCNzbS3sIMIC5TPpruqY0xfrarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJmw3k2+RlAxjirSRtUDHUW4ODBJ9ow1e018XMyX+tw=;
 b=qCF42lFVZ8eckpvEqx5NLIlzWj+Eld1O7kgQ5bbV5v79gM26pdSsFEy2+TfoY3b24fTL56rt6hzqmkdb6xQklGZZmbK9uV2/NrynIUoVm7fFGRMy9oI40PzN1EJc3PSzOHYCSS/4MUr9zVM6Dj2Dtsumva3MMMVJEmmTGrgB98o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 16:51:10 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 16:51:07 +0000
Message-ID: <fcf75c9e-1239-4b22-9788-07ca51268d6e@amd.com>
Date: Tue, 7 Jul 2026 22:20:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] platform/x86/amd/hsmp: ACPI HSMP refcounted
 sockets and coordinated release
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 muthusamy.ramalingam@amd.com
References: <20260707051711.3382354-1-muralidhara.mk@amd.com>
 <516b5c9e-6b0a-0c2e-f684-1e3973ad09f2@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <516b5c9e-6b0a-0c2e-f684-1e3973ad09f2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::35) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2a4be9-0973-4d40-1077-08dedc47f0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	2uoA9qQPBCJMbOtV63ADhSLxktbTPuG4jdCdbseEj0WpGcQav2HotIzydR8KDrfcooG2ARhOvvpU1HJI/Hf+IGclm6V2VqwMcsp4kTfbn5u0PmZQYUqzTJKquTrMD6Z+wGucNxlR8kDoM75qM7+E6VI7Yk9nfKU3g9Px1Lh7sNR2+cfc/qqmhGk0IUEqNYm/7vuZGBXdWRuNxz7U/mqMO0ERFIZfwwOkmMleY2rD92PCGDlSoLINqThVOxNWa0yYsHzOL2g9El/Vwo2I9AE9g2yjHkSJo7TGybvhQjuARMG5AnSjjSxlGIvcOzfzG+cQWE6z9fUoUYe+slkrP6b9F766hy4MIzvJXOYriWL/oofjlk1lrjZAgh++BFnOzKx3zmpFw0JeB0Bt76mxHeoyusVhOO87XUb73hoUk/BSHbKeUyCC+yuTyRV4vib/jhixYGTDYJs5FvfvSc8VVkZtXSwSo1MJi3I8ETBUIywVXC2ZD9I4hUk1Q4aAbWqtF0MJBsMqheuAwhB7MWVZraR/KBXmwUbL+wK1xbYTAhPgtriTMjiVA8vqyxRbd8vTWAGDgDNxkH5a782CoAz/zfl5EuzO4t33xCXGnBB2SFPwFDaRZlJyEXj5hMMWXpY3IGBI1tLJiq4n+NMp68d3LrCW6hoqGlTPdq7l5rp48+Uzvkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzlYUVZIbFh0SldhWFF1UVhnZ3RudEY1TS9Od2FvZ0c3MnMva09mYmpSSlQ3?=
 =?utf-8?B?VjhVRmsyNXRFRmtQOEVzUGV4QWF0VGVUamQyR2N5OVRDaGVRMmlhempsdG1C?=
 =?utf-8?B?TEhLejUwQnhIQVdlcmxNbFJhL2tLaWxndTBOeEY5VlNVQWFya0FXby9mbHpn?=
 =?utf-8?B?WnM2T1FldWt0Nm5mYTJjWEVJNy9ZNG1NdHY2V2VYVXlFVjFvUE5CQ1FhRzF5?=
 =?utf-8?B?Q1BJRWltNlpzQ3E5NEdGM0EyanIzOWYzU2MrbHRSMG5nYVBSYkFhanZYMnMy?=
 =?utf-8?B?aDlDT1FoOUQwRGFLN2NvL2FvOGVGUFNPMC9hWnZMYlVlSWtEcTRrRlJBSTZQ?=
 =?utf-8?B?TFR5eTErVzdvMVdGOENHY3RMODVuNmxOM25aM3RjOWcvd1pIdEQ2VjdmV2U5?=
 =?utf-8?B?T3lraHhuY3UxbU5hRFY0bkxJblFqS1hlSCtCSkYxemd3bDFQRlhReXFhWTNM?=
 =?utf-8?B?a09maEVkaTJOT0t5ZTEyYXRzMWtDbEhHdllXRElkLzV4RkRuVStnVzloZ01H?=
 =?utf-8?B?dkxnR0x3VVhHSzBNSVhsczZIS0l5WUZ0UFF5bFU2eWkzNGZLNWc0UlFEQUlx?=
 =?utf-8?B?TGhVeUpPeDNiNlZramFac1ljQ0RiTmdyU3cyeGpYNVM0N09GL2ZmSExzSm1X?=
 =?utf-8?B?VHJhYXBnL0pjYStoZS9ScmNZbllPM3Z0V1FmNnJCcGhoREV5NmNGVjRVRlNS?=
 =?utf-8?B?Vm1mV1VpUExNN1RtR2xGNVArbHFYSzVTd3VOaFRhQnIxME9lRDVrd25VbGV4?=
 =?utf-8?B?MWozbTJpeUJMKy9ZVUtzSG9WTk9xdkNYaVoxNXdQbjJuWEJ3ZVJGVUVoVGNx?=
 =?utf-8?B?SElNanZ2THhlRFhvMlJncGhWcHByblFOV1J0SFZyODRzdmNNVWVPSEplWEQ4?=
 =?utf-8?B?dU1RUFUrZjJxd1QwWUY4bzN6amo1ellURGQ3Y1VUbHNBRkZESDIwcUFoeWJT?=
 =?utf-8?B?SURFY2ZLUlV1Q0FkVSt6NVJsVFkxZE14NDJ3YTAyZWVoQWtMNWNoUWR5QzZC?=
 =?utf-8?B?bUZQZFVRMkVRVnlqekZ2ejhJaDlIR2YxcWgxamV5U2xDWWdsTkgrTXJsc2VK?=
 =?utf-8?B?ekoxOFh5c3gvYWsyZnhuYVdrT3BGSG5pazdaV2NWcUZTOVpKZmVhSXJIQllX?=
 =?utf-8?B?SmcvSTY5NDB3U25GbnptSk1VbGF0VFdNZVU4cFA1OWZQbWxFdktTMWgrL0xw?=
 =?utf-8?B?dzFYdW5GaVNQMWtBU3Mzc20rYUxtbTBSMjdtZUUvOVlPSWw2MEVVaURScTcv?=
 =?utf-8?B?eVNpTTcvUmZSZTJHUlJ6SmFmVENEQlZRcTh5eFRZckZmZElHRHdpOXQ2eU5q?=
 =?utf-8?B?UHllZkYxMm5yRzdxT0Q5cEZMZ1o3R0pSbENpT0l1NnZLcGtCN1Y3bGJlQ3dL?=
 =?utf-8?B?RStPdWdmUU1nQk1kY3QvUDh2ZUd5K1d2Z3V3eEVBcUdtN2dwU1lXYWVSUEFy?=
 =?utf-8?B?ZzhCbzkwaXQ5cVRiQzFObmR6SjZCTFQ2V05RVmFDL01DdmR2QWEwNDlrUjBs?=
 =?utf-8?B?OTBOK3JmcDFOdDg1S1JmcUJBMGs2THcrU1NuZ0RleVBBYWcyUkE5UXp1TzNB?=
 =?utf-8?B?dTM1R2ZJSWJNOThodnhldzZ0cnZhZzBRSVRBU1gvZUZleUJ2RlptUVYzNDM3?=
 =?utf-8?B?ZU1DN1dKN0ZSTm5ZOXA0SXJ3U1BrRFJQd0V6R1hFaDFONU1PeEdVclU0UytI?=
 =?utf-8?B?aFFLb0RlUU53NjdwS3NCVitFWVVKcDU3c3ZiY2VOYUNrMzBVZ2oycmhUMXRL?=
 =?utf-8?B?UURMSjkrMCtaSU5OMHJuNnZ2cnhyMXZJdmJLOGl4WTNwUnF4MUZ0TStTbnJF?=
 =?utf-8?B?QmtSZmVRUkNUaGFPZW9QL1dEanRUcTAyUWQwZUhBN0xFeTV5V3ZyVmVvUWEw?=
 =?utf-8?B?K1FvT0JIUzVBTHdNT2ZxdjRQcE1FSysvOTFndDY4dEVyOVFPM1RoTXd2MkZi?=
 =?utf-8?B?K0MvT2NPa0J2b0t3TnIrb0Z5VTExWUhtRFRUelEvNXY4ekdjWU5pNExMR2g5?=
 =?utf-8?B?QXpBa0JoeE4yZ2lOR3E0VEdWSU13R2pVT1h1TEFOaHRtNjA0VGQxdEM1aWZF?=
 =?utf-8?B?YjdveDY5Qmh6SmFwNzNQOEFzMU5xVXgrUytoT0xSVjVEZVBzNjVudmpyM28y?=
 =?utf-8?B?WkI1WjZSK0tpWU00OXRHQkNyY1dhK0ZidmQ2cVZJNGlHOWNnc3k1aGhLOUd2?=
 =?utf-8?B?NnJaVWRwclFLOVFKc0RnRTZnNTlTczZMS1lqUnhsU1FVQUYwU0xKZ1owdzRP?=
 =?utf-8?B?dTVUdFhidzFqdDdVaEJKU3graEw0bFdsTWFYak9mNEF3V1lMOUlMRDNnbW5Y?=
 =?utf-8?B?OW5vZ2E3a1VzWUx4OXJGRWduazRwYnlVNWFGSGJaclNTc1FQTGNZZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2a4be9-0973-4d40-1077-08dedc47f0d9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 16:51:07.6918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2x5LxEw5NrUy6CVVSKskaAmEzhPr0H3fBoOaTF9JWFt5Y2/rBAAl5vq+0AUh9bvUvLX68233eBU7SK3i2vcHWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206



On 7/7/2026 5:43 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, 7 Jul 2026, Muralidhara M K wrote:
> 
>> The ACPI driver binds one platform device per socket but shares a single
>> socket array and a single /dev/hsmp misc device across them.  Replace the
>> global is_probed flag with state that tracks this shared ownership:
>>
>>   - miscdevice.this_device tells whether /dev/hsmp is registered, so the
>>     misc device is registered on the first socket and torn down last.  Clear
>>     mdev.this_device in hsmp_misc_deregister() so a later re-probe does not
>>     skip registration on a stale pointer.
>>
>>   - hsmp_acpi_sock_refs counts the sockets that have probed successfully.
>>     It is guarded by hsmp_acpi_probe_mutex, so a plain counter is enough and
>>     no atomic refcount is needed.  The shared socket array is allocated with
>>     kcalloc() on the first probe and freed by hsmp_acpi_sock_release() when
>>     the count drops back to zero.
>>
>> hsmp_acpi_sock_release() is the single teardown helper: it deregisters
>> /dev/hsmp if registered, unmaps any metric-table DRAM, destroys the
>> per-socket mutexes and frees the array.  Both the remove path and the
>> probe-failure path call it once they are the last owner, so the teardown
>> lives in one place.
>>
>> Both paths also clear this socket's dev before devres unmaps the mailbox,
>> so a message issued after a non-final unbind (or to a socket that failed
>> to probe on a multi-socket system, whose array stays alive and whose
>> remove() is never called) cannot reach an unmapped mailbox.
>>
>> Two lifetime fixes fall out of the array now persisting across a non-final
>> unbind:
>>
>>   - hsmp_get_tbl_dram_base() iounmap()s any stale metric_tbl_addr before
>>     remapping, so a rebind does not leak one mapping per cycle.  It runs
>>     during (re)probe before the metric sysfs attribute is exposed, so no
>>     reader can be using the old mapping.
>>
>>   - /dev/hsmp is no longer parented to a per-socket device.  Sockets can be
>>     unbound individually and out of order, and the misc device outlives all
>>     but the last of them, so parenting it to one socket's device would leave
>>     a dangling parent.  Register it unparented instead.
>>
>> This provides the refcounted socket ownership the ACPI teardown needs;
>> the following patch wires both teardown paths into the data-plane rwsem so
>> they are drained against the lock-free data plane, nested inside
>> hsmp_acpi_probe_mutex.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c | 103 ++++++++++++++++++++++-----
>>   drivers/platform/x86/amd/hsmp/hsmp.c |  26 ++++++-
>>   drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
>>   3 files changed, 112 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 16edcf51c971..11a478503fa7 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -44,6 +44,13 @@ static struct hsmp_plat_device *hsmp_pdev;
>>
>>   static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
>>
>> +/*
>> + * Number of ACPI socket platform devices that have probed successfully.
>> + * Guarded by hsmp_acpi_probe_mutex; the shared socket array is allocated on
>> + * the first probe and freed once this drops back to zero.
>> + */
>> +static unsigned int hsmp_acpi_sock_refs;
> 
> That mutex should say what it protects, though I think you can probably
> just add one comment for this, which covers both followed by the mutex and
> this variable.
> 
Sure will clarify in the comments.
>> +
>>   struct hsmp_sys_attr {
>>        struct device_attribute dattr;
>>        u32 msg_id;
>> @@ -610,6 +617,56 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>>   };
>>   MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>>
>> +/*
>> + * Tear down the shared ACPI socket state once the last socket is gone:
>> + * deregister /dev/hsmp if it was registered, unmap any metric-table DRAM,
>> + * destroy the per-socket mutexes and free the socket array.
>> + *
>> + * Called with hsmp_acpi_probe_mutex held (serializing it against a concurrent
>> + * probe).  Coordination with the lock-free data plane (draining in-flight
>> + * hsmp_send_message() before the mailbox is unmapped and the array is freed)
>> + * is added in a subsequent patch via the data-plane rwsem.
>> + */
>> +static void hsmp_acpi_sock_release(void)
>> +{
>> +     lockdep_assert_held(&hsmp_acpi_probe_mutex);
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
>> + * probe() returns.  Without clearing dev, a later message to this index would
>> + * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
>> + */
>> +static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
>> +{
>> +     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +
>> +     lockdep_assert_held(&hsmp_acpi_probe_mutex);
>> +
>> +     if (sock)
> 
> Is this needed?
> 
>> +             sock->dev = NULL;
>> +
>> +     if (!hsmp_acpi_sock_refs)
>> +             hsmp_acpi_sock_release();
>> +}
>> +
>>   static int hsmp_acpi_probe(struct platform_device *pdev)
>>   {
>>        int ret;
>> @@ -620,16 +677,16 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>>
>>        guard(mutex)(&hsmp_acpi_probe_mutex);
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
>> @@ -639,35 +696,49 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>>        ret = init_acpi(&pdev->dev);
>>        if (ret) {
>>                dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>> +             hsmp_acpi_probe_failure_cleanup(&pdev->dev);
>>                return ret;
>>        }
>>
>> -     if (!hsmp_pdev->is_probed) {
>> +     if (IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device)) {
>>                ret = hsmp_misc_register(&pdev->dev);
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
>> -     mutex_lock(&hsmp_acpi_probe_mutex);
>> +     struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
>> +
>>        /*
>> -      * We register only one misc_device even on multi-socket system.
>> -      * So, deregister should happen only once.
>> +      * Serialize the decrement (and the release it may trigger) against a
>> +      * concurrent probe so the count cannot be revived from zero.
>>         */
>> -     if (hsmp_pdev->is_probed) {
>> -             hsmp_misc_deregister();
>> -             hsmp_destroy_metric_read_locks(hsmp_pdev);
>> -             hsmp_pdev->is_probed = false;
>> -     }
>> -     mutex_unlock(&hsmp_acpi_probe_mutex);
>> +     guard(mutex)(&hsmp_acpi_probe_mutex);
> 
> So here you convert it, please do it with guard() right from the start.
> 
You are right. I missed this and will address in the next version.
>> +
>> +     /*
>> +      * Clear this socket's dev so hsmp_send_message() rejects it before
>> +      * touching the mailbox that devres is about to unmap.  On a non-final
>> +      * unbind the socket array stays alive, so without this a later message
>> +      * to this index would reach an unmapped iomem region.
>> +      *
>> +      * This teardown is drained against the lock-free data plane in a
>> +      * subsequent patch that wires it into the data-plane rwsem.
>> +      */
>> +     if (sock)
> 
> Can this ever be not true?
> 
>> +             sock->dev = NULL;
>> +
>> +     if (!--hsmp_acpi_sock_refs)
> 
> This would be simpler form (does not require thinking unlike !-- construct):
> 
>          hsmp_acpi_sock_refs--;
>          if (!hsmp_acpi_sock_refs)
> 
Thanks for the input. I will update.

>> +             hsmp_acpi_sock_release();
>>   }
>>
>>   static struct platform_driver amd_hsmp_driver = {
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index c3d0e64c415d..8440671235de 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -492,6 +492,17 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>                dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>>                return -ENOMEM;
>>        }
>> +     /*
>> +      * The ACPI socket array now persists across a non-final unbind, so a
>> +      * stale mapping from a previous bind can still be recorded here.  Drop
> 
> "a stale mapping from a previous bind can still be recorded here" sounds
> odd, and honestly I cannot fully grasp the meaning of it. I guess it
> revolves around what does "record" mean in this context.
> 
> Are you saying that without this change, we could encounter a stale
> mapping? (which is again history telling more than documenting what the
> current code does, and it is confusing obviously because how code behaved
> in the past doesn't match the behavior now.)
> 
> One space is enough.
> 
>> +      * it before remapping to avoid leaking one metric-table mapping per
>> +      * unbind/rebind cycle.  This runs during (re)probe before the metric
> 
> Ditto.
> 
>> +      * sysfs attribute is exposed, so no reader can be using it.
>> +      */
>> +     if (sock->metric_tbl_addr) {
>> +             iounmap(sock->metric_tbl_addr);
>> +             sock->metric_tbl_addr = NULL;
>> +     }
>>        sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
>>        if (!sock->metric_tbl_addr) {
>>                dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>> @@ -529,7 +540,14 @@ int hsmp_misc_register(struct device *dev)
>>        hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>>        hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>>        hsmp_pdev.mdev.fops     = &hsmp_fops;
>> -     hsmp_pdev.mdev.parent   = dev;
>> +     /*
>> +      * /dev/hsmp is a singleton shared by all sockets and, on ACPI, is torn
> 
> Remove: on ACPI.
> 
>> +      * down only on the last socket's unbind.  Do not parent it to a single
> 
> Remove: only
> 
>> +      * per-socket device: those can be unbound individually and out of order,
>> +      * which would leave the misc device parented to an already-removed
>> +      * device.  Leave it unparented so its lifetime is independent.
>> +      */
>> +     hsmp_pdev.mdev.parent   = NULL;
>>        hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>>        hsmp_pdev.mdev.mode     = 0644;
>>
>> @@ -540,6 +558,12 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, "AMD_HSMP");
>>   void hsmp_misc_deregister(void)
>>   {
>>        misc_deregister(&hsmp_pdev.mdev);
>> +     /*
>> +      * misc_deregister() leaves mdev.this_device pointing at the now
>> +      * destroyed device.  Clear it so a subsequent re-probe does not skip
>> +      * registration on a stale pointer.
>> +      */
>> +     hsmp_pdev.mdev.this_device = NULL;
> 
> I wonder how hard it would be to just make hsmp_pdev a pointer so the
> struct could be dynamically allocated/freed instead.
> 
> In any case, this looks like an independent problem/fix AFAICT.
> 
I will fix this in a seperate patch.

>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSMP");
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 71a8b202aa92..9036cb221635 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -57,7 +57,6 @@ struct hsmp_plat_device {
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

