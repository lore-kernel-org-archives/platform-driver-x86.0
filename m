Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6F93E47B;
	Thu,  9 Jul 2026 05:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783575629; cv=fail; b=bYmPRVOC20H2FCe/ZRYmlc7IA5bLW0adE25kiaxiASbbDKuL9Ml7/J56zpwy1CF0y53jOnMcnhBZsrG6jjrOILB71gfqIe53RdMCe73+vZZvGjPGodNmrgGY+Ag4VB1SNDAFXyV29aYa1Irqu0jyAJBcuBKnOLPOSEBjjafTIMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783575629; c=relaxed/simple;
	bh=jsyOUMhoN2KVCDm62iiHqJaPg1h3hOLwxNwz3rrTkX8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rlgJnNmHHyqakVkUPAgkVq9TcIigGNzXoyxSf1ulRQF0grleXVfHBjgZkhGCxhTR0QQeIXR8neRQ10XvSqRaVgmvmL2An9YqKIMM+cFPYJ91SjD7e984sKyQCkojosxS6bDbhVd+pAWSsOtAiZoDjJhbcKWq42vYWUC46DZriNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BrOj9YFF; arc=fail smtp.client-ip=52.101.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BrOj9YFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPWJqgACvJ1Keocp13qzQhPvkbbeyMdTOex9PTkj0ueEhhEMXcOK1Ng2YX6geHq2mB8a7++fP8HaAoLU0+5QZ9SWj6+HKRiHisiMs+YkrlHZmqlS0zIKOPYIvS1/Xr4h1HIspt0xzVEIJu6Qu8+UsawtUsv2GUHQrMplFgvpRFYkjXISNDt8o7DYYGyxAL9LOXANlWlQy8f9Lw2tvVbC05hdSyQVjPdhq3nSPJprl7YJQBVnw9eVjyPxkCNObtF2MlIznwnwdckW26FAQQaPfORmJbtn57lMAaRvrRMlhWPvGv9IAqfRjBECT4Q+uviB6+nwYA7tiuvnGktE1jXiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OyKgP38kX/4bNweY4J74vtnFadof0A/qMgce3LDlbI=;
 b=FXnIlurYOLQrOYWOymGHScxnCm6+uGCAxcYXQipTSJEJhGNx6Iai40Cf/qEijCFMFu4bAbhddB70w0dJYrCf7jC+ArP1E1L3+QhZzU4GcsvN/+dGrl8UdZrvIUHIsvU/pek5LPMOJsskTSa+Jj0jIJeXqQLajpvqgzd7MiEsfdYrJlDhnYLFIXjegQa3Spxqcvwa24oeOr5gRhqXedgGpvxE3lU8RUQD/7ZbADBrqAwkQnTNKmax3++JgCJ113bPACLV6QsJCNO7fnyzECR+znfrLe7ppD7c6ja3BKfGmYupBvPuMv4g3rR+fLf/8kwnbO/K6TBMhDSObrqXvX4auA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OyKgP38kX/4bNweY4J74vtnFadof0A/qMgce3LDlbI=;
 b=BrOj9YFF7e9W6+U94RiI0MWZrAfIuTMwp5BKKkRYD0rAeeFhb5Q3h0gc4zX7RxyRRkLihHgpfuzlckf4WIx1hTdMMDzUB2Ti6729tdjmJcy8XXA3Co/mdQaaopTZtcal00eIeqQq2wDX5XAVMiQPS5eCjB//UdJS4uIrOocXeR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 05:40:26 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 05:40:26 +0000
Message-ID: <3b8ad875-d1fc-49a3-91d9-94387634596c@amd.com>
Date: Thu, 9 Jul 2026 11:10:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] platform/x86/amd/hsmp: Map the metric table with
 ioremap() and unmap it explicitly
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com>
 <20260708042405.3758294-3-muralidhara.mk@amd.com>
 <46ccc6c2-f3d7-abb6-a6e2-3a74b48a9cae@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <46ccc6c2-f3d7-abb6-a6e2-3a74b48a9cae@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e26aeb-5de7-4404-0fb3-08dedd7c93cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wKjXZSN7phpIeY88iyZv/ExrtRdUmMM+AYLFWM1zoWkMN4MOqHAxV1AuFFDruDY59mApH/ggrur5PxngTbKb7m9SJoUe44JG/qwExp4xprjpG6Nsg7g5FiWHeU28AuZCfjo2zqsUI4yaDVvr7SgiKA80600e3Y/M0o7jonrF1Z7zPauw1sNgmjiCqnnrkGTcZm/YaZeBHBbxPCISNsWAwsWsQz1aWJF2AOhaA8chaiNEhOcLXCHqvKT9H92VY7jyYIZSsh/y72QIbFHlnAX3GFenxNjduU3JHXvDPNWT/E7WnPcbiMpPBri+VWPzFBYbNeNSKI9MkL0RPJbO4E4xNr2wQfmblfseyDC77Kv4fK6XZ4W1JWl1bch3mPI5lnqoFtDpOcYU6XtjYOU4PTMR0ODK6iWIPkAJt6srL8jh/VWomNvFfPrMIp8BZHYw76lZejhzf0T9xsMJbBEH+lEihnt0DW65lWa9zkcMq9DUW6T6H75omgB2NJufSwSRmev1pUcrH2Fvw096/BQre8REeDR8GdODDr29wtlZfOIRNLjpQxM+dD7iG46rV7NlnU2Uz29LZk19aj0jjXAt/IbTpRLf156LPOOnT6U4dNBJQX0qh2w6A5D+wrSbP+a/Hxeyp8nvjCpQ39TqzswGVUqztw/4GSao8yZihfT/2zqk8VU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGFvdStwckVPWTVHbWRLZ21lSnZ4QzBLa2xmbWNSNnFjYkZqUEVFRjBma0Zx?=
 =?utf-8?B?R1VvZkNSeld2clduRGRhS21VL1RIeU5mR2VoZC9JVTQ1amxpWGQ4WmlSUEFM?=
 =?utf-8?B?aWVsdGFWelRNYjZuYVFnVG5TKzNUWStleGZGNE1KbjZPd2l4TGJHSzdTOWFY?=
 =?utf-8?B?Q21EMGNCdE9KQndFazR1RDVZTlR6SE5ERGtudGlUaGVFWUNmaGhrNE1XMjN4?=
 =?utf-8?B?TUMyZjhzQTd6RUdaS293T0tpRm1XdGRFeFBUcElQVUlTN21ic3ZvdHNwbmNk?=
 =?utf-8?B?R0wvSmx5WmlmdW5ieUpVZEtOMDNKY3dUZk5lUlo1STducTF2Vk1wVU41Uk96?=
 =?utf-8?B?WC91N0ZjNUJwSXZvdUI3VStHdXI2NnNCRXdvN21pbkQxRHBiQkQ1OTk4T2xm?=
 =?utf-8?B?VVVFdHhtL3NyenBZU1Y0REo2d2lIK2lvUzY3NzBCc2U4c1hrVklpZmJOUTJr?=
 =?utf-8?B?enkyNEtwbXNxalRtck4vM0lhRnk5cTRkV1RkVEIzSkExaHBZa2pNc2RJamNR?=
 =?utf-8?B?N0VxeDNHTFBkVk1VaGIwTHZZZk9BbHhBK3hkOXNwdHZvZ24rM295UEJlUnV2?=
 =?utf-8?B?UUpNNmRJeUN0QTJuN1JETU1mTnFlT3VSUCt2QUorNVcwUll4ZEtYT3pIdVU3?=
 =?utf-8?B?cUQ4bjR5eGpxYTFoTGtJMThRS2wzQlVvZXRBdnRLWHNxOUk2SWxHV0JwcUVG?=
 =?utf-8?B?UEFMZHdHM3lmaFIzV200U3IyN3E5Wjg1c1ZpcmxSc28wNHNsa3RxRmU5RUR3?=
 =?utf-8?B?RTdoaWRhRzgyMzlZM01rMHdaRHhEbHRCbDdwNE9vRk9yYzFhZFl4azU2cGNt?=
 =?utf-8?B?Sy9vYXNVeHpmeXhTR1oveG1USmRxK2M2SlhRUEk2QkFoS0pSeEViYXpLNjEx?=
 =?utf-8?B?T3crM21RSHIxN1JtaHRuLzJraXRUQUdOOTY5c2VIWGNhaFYrWXU2TXQrU3Fu?=
 =?utf-8?B?RU9YT0NEUEhab3k3bU50Y3FFaXBGWjFLcDIxSlByZ1ZNSFR6R3VkdmExR25B?=
 =?utf-8?B?YWlTTFpxVjcremIxbHJsS3F6T2ZhTzU0b0dxNzhVcmRKdFNGL09XK1VwVFVJ?=
 =?utf-8?B?Tm1pZy9JK2tWTk1iS0cvbHczY0pnRjJSVC9aZlRXOUVuU01FT2hzVmRaTkNu?=
 =?utf-8?B?YzRpVHR3ajBpS0tZTERVNWhmaWlnYlhWMmxaY0RZT2g5U3docVdhVjJhSDZu?=
 =?utf-8?B?Uy8yZzJDbnFuYlRKZkxwK3BzeUdBTHgrS1hWMTllUitLSWtqd3c1YVZnNU5L?=
 =?utf-8?B?UjhJQVl6TUFjWEFodEVZa2ttWEt1cFA2V1lTbTBMUVVWSVhsbURJVDRGR0xG?=
 =?utf-8?B?MWFQVHlya1A2NGcyNTNaVk1UcFdHU1NLeGxJZEdWQnJsUENHZ0I2ckQ4ajYw?=
 =?utf-8?B?dDEyam94NkYxR2E3NkZFZHdEd05IUnIzZUFwOWNyT052cnZmSkcyVUhZVHRx?=
 =?utf-8?B?RGtZcS9oaU5lR1pmNzhySHkwaGpRRUtZa2hIQ3JWUFgvaDVMY1VvNFU4OWs1?=
 =?utf-8?B?TVI3RzAxdG1CTmE3dEVhdGdvVUZ1U0Zrcno1WGswT01GTDgyN0d2V3hRYmUr?=
 =?utf-8?B?d2c5ZTVKSHNBWEZHek5jRUFMb0I4amthZXJ1RjRmSDYycENhWnhaTmxKaVY3?=
 =?utf-8?B?VXVEb1o5NDd4MU1xazRwZ1NHQmNRRWNDb3ZDaTBmYkdFSGE5L0ZPb2lsTXVy?=
 =?utf-8?B?ZUpsaFQ0ZHEybHRFcWVja2dLZ3U4L2dhMis3UjV2VUZ5bHoveTJVNGZUWEdQ?=
 =?utf-8?B?M3FyNHI2S0NFblFnaFVHZWRSTE5DMEJpU3BxYUlISVpCQlkySXAzaDd5OEY0?=
 =?utf-8?B?R2paNDd4dWN5V0w2amo3WjA3TG0yVWtTa0pvOGc5YnNEcm9WRzBhVVc0dlVD?=
 =?utf-8?B?L1pPRmVCcEExNUFpUjVBR1dIWTN2RndhM1dtSEpzRmR0TVUya1V4aGxMM0Y2?=
 =?utf-8?B?Vzh3UFRiV3BPOE5EdG1pNnlaQW1BdnhSbjE5ZFNMWmVpQlBiczBWWXM3bTJ6?=
 =?utf-8?B?VENGczZOWUZ2cHNKMnB4OXQ1VGtQcXk5eG13UmVXVVJMQWZ4Z09xc08xV2hz?=
 =?utf-8?B?TUhVVmowanIvaDFCamxmS3o4RE5rREJLQ0I3cmgydFY0NnNxQ1R5d0lhcXJH?=
 =?utf-8?B?SGsvbENTaDNJVS85Mk1OV1FaN1hySFFDQXV5UWpTQ0xZTk0vRFJLaFY0b3FZ?=
 =?utf-8?B?bnJKNEdFcWJndkJSZ1JvMzNOa0JYZWx4UWRIc3MvYmlycXBnYTllenFiYWg4?=
 =?utf-8?B?VEpDOVdDMGNRY3FsS0hVcys0b0VmSlhId2tQdUdxWDFpN2s0MTB6QkVyazBk?=
 =?utf-8?B?S1EyL3FBRmVOdFpnNmQ0K0lrOFIzRDZrVVBON2dNRWhNOVFEeml6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e26aeb-5de7-4404-0fb3-08dedd7c93cf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 05:40:26.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QB6Q8qaJdsTUaZkQSunEkuNNLnHs6nakJZ33AxW0E0isWfu/rsxicGBgWh4ObMjFaBIX9OZLGxKrw16x6e22hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621



On 7/8/2026 3:47 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, 8 Jul 2026, Muralidhara M K wrote:
> 
>> The metric table DRAM region is mapped with devm_ioremap(), tying its
>> lifetime to the socket device. An upcoming change lets the ACPI front-end
>> share the socket array across sockets and coordinate its own teardown, so
>> the mapping can no longer be pinned to a single per-socket devres scope.
>>
>> Switch hsmp_get_tbl_dram_base() to plain ioremap() and add
>> hsmp_unmap_metric_tbls(), which drops every socket's metric_tbl_addr
>> mapping. On the platform driver register it with devm_add_action_or_reset()
>> so the mapping is released on both remove and probe failure;
> 
> I feel the explanation is quite basic level description of devres
> functionality. I'd say something like this instead:
> 
> The unmapping for all sockets as whole is still devres managed using
> devm_add_action_or_reset().
> 
>> the socket array itself stays devm-managed.
> 
> devres managed is probably the better term in textual form. "devm" is C
> codish way to say it in a short way.
> 
Agreed, I'll reword to:

Switch hsmp_get_tbl_dram_base() to plain ioremap() and add 
hsmp_unmap_metric_tbls(). The unmapping of all sockets is still devres 
managed, via devm_add_action_or_reset(); the socket array itself stays 
devres managed too.

>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 19 +++++++++++++++++--
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
>>   drivers/platform/x86/amd/hsmp/plat.c | 14 ++++++++++++++
>>   3 files changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 1a87931136fd..4586d86f72a3 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/acpi.h>
>>   #include <linux/delay.h>
>>   #include <linux/device.h>
>> +#include <linux/io.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>>
>> @@ -414,6 +415,21 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>>
>> +void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
>> +{
>> +     u16 i;
>> +
>> +     for (i = 0; i < pdev->num_sockets; i++) {
>> +             struct hsmp_socket *s = &pdev->sock[i];
>> +
>> +             if (s->metric_tbl_addr) {
>> +                     iounmap(s->metric_tbl_addr);
>> +                     s->metric_tbl_addr = NULL;
>> +             }
>> +     }
>> +}
>> +EXPORT_SYMBOL_NS_GPL(hsmp_unmap_metric_tbls, "AMD_HSMP");
>> +
>>   int hsmp_get_tbl_dram_base(u16 sock_ind)
>>   {
>>        struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
>> @@ -438,8 +454,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>                dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>>                return -ENOMEM;
>>        }
>> -     sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>> -                                          sizeof(struct hsmp_metric_table));
>> +     sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
>>        if (!sock->metric_tbl_addr) {
>>                dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>>                return -ENOMEM;
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 0509a442eaae..98c82a4c0cc3 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -64,6 +64,7 @@ void hsmp_misc_deregister(void);
>>   int hsmp_misc_register(struct device *dev);
>>   int hsmp_get_tbl_dram_base(u16 sock_ind);
>>   ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>> +void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
>>   struct hsmp_plat_device *get_hsmp_pdev(void);
>>   #if IS_ENABLED(CONFIG_HWMON)
>>   int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index e07f68575055..e7ee6e701e5a 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -201,6 +201,16 @@ static int init_platform_device(struct device *dev)
>>        return 0;
>>   }
>>
>> +/*
>> + * The metric tables are mapped with ioremap() rather than devm, so release
>> + * them explicitly. Registered as a devres action so it also runs on a probe
>> + * failure after init_platform_device() has mapped some of them.
> 
> Please put "Registered..." into own paragraph. It's sort of different
> thing it's talking about that the first sentence, and you'll be adding to
> the first paragraph in the other patch as well.
> 
> /*
>   * Paragraph 1.
>   *
>   * Paragraph 2.
> 
Will do.

>> + */
>> +static void hsmp_pltdrv_release(void *data)
>> +{
>> +     hsmp_unmap_metric_tbls(hsmp_pdev);
>> +}
>> +
>>   static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>   {
>>        int ret;
>> @@ -211,6 +221,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>        if (!hsmp_pdev->sock)
>>                return -ENOMEM;
>>
>> +     ret = devm_add_action_or_reset(&pdev->dev, hsmp_pltdrv_release, NULL);
>> +     if (ret)
>> +             return ret;
>> +
>>        ret = init_platform_device(&pdev->dev);
>>        if (ret) {
>>                dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>>
> 
> --
>   i.
> 

