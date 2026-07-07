Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1A31F9B4;
	Tue,  7 Jul 2026 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442537; cv=fail; b=j60pLDcmMm7HjohX4ojqSTfIEIqcZPpv0Rs8ZMYWtpH3xP/xld6Z5EugFLoOQxSAWUoMtbMgxs1LXdF0aakIWec1gnObu48QXy7mp0FXtGTkGVnc8e1D9iPFKJdeYkJrkH9CEbcIf7AwvA6M4fwgn/U0VwQtEaHiGcukAxfGxKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442537; c=relaxed/simple;
	bh=o8rIYu4KM/ZQft3TxFjq6ELm7D9R1fgCZ8aI1aHsOcc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LiJCwxJlFIyaXM5PWrLJ0qKZdUOY+Ihjba6NaudufFNHuBXhaHJ6aiTLMG3gOIOlPL5fhLUkKJAp0zZS6lOr4B/NdJvnBj2flBb1Uzza3gd3KnCwGtnA53507+5F35ETrqWbhmOl09HbrJPfo1ctqU75GXYWSCidaUXBQW6Qbaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=POR8ow2R; arc=fail smtp.client-ip=40.107.208.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="POR8ow2R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCwoLJnXMsi32oGzMUKtoWzoGUg8D88rYnAte1YhJ1J2QznUO7j7cK2TXDoX+eelTUR5oAGe8wQTy1CrY32MXRdaqO21vYNpLYbEiAH/dzlNaOiWzwiNlZ87/2QNEAIFp9yngmUO2TcLIY2Vvwn+vZ+4MNN8aX8J8flus/IsM7v+bQ1a7JXxDxasRjpjkWbVwiKWauPzor40dHJq8iKYto0N12VIpO0OB+J1yX9IArzGOno+o8AJM34efNnBIiRhxiUGMGUOwiXcnbrW3GDhKl5ACn3GURyfTFAIfb+FCTUNUZES5RadqTTovgdXk30gpzWqca7j56aYnD6pPFmZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTjDO6YtpdOGFjI3x1B2HTGsF/Kw4GblT6u2m1D5htg=;
 b=qbChwsaMe6Ubrbukx1y9k1AjiEpcdnd//krUaA9M54uhCtmMh/O2oulqxkKai3b212XG4VpJie47WI5FXgTd3MBFCVIAu1Y9X4wVQxDLdp9Jp7AVJB0WgufYMvyajBz0ZmfDRTXgbaRogh6eNZ/OwjbgQ1i1+IGN+BfrvJ4t4QGPwZcgjIsnAFKlbapbx9wxJM/bSfjUet20YAZ7z2rJCKtMowAF/Cwah5NVAq9NBek2ptzjNSLE4fXng8XxFvdQYoIn2RavVRVlluxm2IHtOOzlPRSL4+SbiW3s4qHb6RIyxVid2X008w5cvaQ4vW1HUnliQaHTgFlGUlfSJn5oCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTjDO6YtpdOGFjI3x1B2HTGsF/Kw4GblT6u2m1D5htg=;
 b=POR8ow2Rb++sObUHQCANjtzBvNwaEnHo3pQKzmDFrDPJ7TDVdeQjrNJspYSOH0hy+5KyMVmgZBbDYQHGTFy4dlKLPA8zCru/8afqg1A6aVmWeNkdWtZdqlD/chQDD9Q+HJbsgEiFeQH6myw/MLppE+MjHdTdJm8Ie8v6wPDwWR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SA1PR12MB9489.namprd12.prod.outlook.com (2603:10b6:806:45c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 16:42:13 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 16:42:12 +0000
Message-ID: <c11b1c43-1019-4884-9126-a0ae105ba892@amd.com>
Date: Tue, 7 Jul 2026 22:12:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] platform/x86/amd/hsmp: Map the metric table with
 ioremap() and unmap it explicitly
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 muthusamy.ramalingam@amd.com
References: <20260707051630.3381945-1-muralidhara.mk@amd.com>
 <d765e212-cd56-8400-5e10-6962208b3a57@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <d765e212-cd56-8400-5e10-6962208b3a57@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0173.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::9) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SA1PR12MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: dd48b96e-13e4-42bb-38a1-08dedc46b1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	7kr3nGnX3vnPcApX0gsT0FOR6yuUYiS16BkgQmRX8LD5dnVCaBmSd15S4fKsUKhUUjya0JuJ64WdXRxdKRciCw/mtbsrppvU7TETks5etNl3e4IR+M005N0eZMvZjA9Jp/SQ5HsJDeyPg/cqcMV/wxHUcux9M+KIhWH1nM8Q3iYRwXb7bu2VNoUpljMVa2Mw4i9KGOvn/qEerPKvHrSRQKhMANivj8zaDUfkn6K8OvZQOX3zB4ZzN2mpx5IGSsT6O4dTZ7MV6vfMxBVZZw4tGC3RSJVaa6jh6ChwvO5AGL5w5bdLZCEOijL4yM8NJu9oEXEf4tAOdiLAr/M1zwXLWQmwJDS72SSo40/w6O8CAKi7s0eLbwv+eL7Azrm6uSrpSucaVkgvOezSbf4V/DYAyE4Be2PYlchtY86rQA49phF5/c4T3j4bXJ4YLFoH3aaiEXOj0Omy+CiNl4sabHeB8MePJ9+ANT04Bu/kOORI8ygAvi5KaGDuZb4GA944nseCkMT8DBhAQxZbJw6NAkLhxM5ONFpiZVOphpenT/gqeJXb+jVB9Y4kDDPdXgKAEfqQhBhDJv9mBS8zk3r14amewZblesduQMhSnHzVVUn34XHGu5LmWgJMPiDcmewQlhm/vseqmMADaMf5iI2GxcdcljWVPUfdFA0GDKf5LWu+AUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWY0TWpZRlJnZkxUTDd2MEx4dVF3WmlBZmtpVkJQQndwQllHYUJqeDNuNW1R?=
 =?utf-8?B?ZkI2ZUFrbllyenNQd0Z5d1hUd2hZa3gvbnlNRjgzclc1ajVURW54cmxmYmln?=
 =?utf-8?B?VS9XakRzdW96ZFhqRDVMT2pEaWdxcTlNeTRCQ1p0QlBYMjZWU0hQdzQwWkhv?=
 =?utf-8?B?eXgvMmJhMFIvcWtqNWhUYkp4THo3Ri9mczNqT3RmaEcwRGtyUUZCN2RqZHZn?=
 =?utf-8?B?MFdydk9kY2pvK2lFV2RMbFBwdjg1UlFkMXBTT2FNaExsc09MUU8yWHlkdXUz?=
 =?utf-8?B?QzFMYUxPWTZIN0srcmNybVl3blB5RUM2ZGcvdHBrVmZJZDBtSGdqMjF5U2h5?=
 =?utf-8?B?MFF5aTdibkVuSnFRL0kzVi9MNnZ4UGNaLzdaM24xbG5ZYThpZGs3UGU3alYv?=
 =?utf-8?B?ZzJxZDJwWnNGSG96cU9WSVF6T0hmbE55dGhXMUljMUNrRmRvMVRjSi9MWk9N?=
 =?utf-8?B?Yk1ubkNXNUxTeVEremVYS0hacjZTOWNPZ1dhZmZGdVhwL08zYWhmRHBmRnlE?=
 =?utf-8?B?NmY2M09STjBSaU9hc2loNHJkNW5kRXRRSlVqSm9xY2NObFVjZDFITms1eWIy?=
 =?utf-8?B?U3F3SGR3cmcrMmhycDBkakhsczFlRDYxelFYYjJ2TDNwKzQ3cmlKMDZLS0dn?=
 =?utf-8?B?UERSRHNJcUFpUGlXN1NHRUdMbVQ5RDhKaUZIclVqUFRiMlgzdTF2NGdwZVZ4?=
 =?utf-8?B?a1pGclVqcFlNOHRzYW9XSkZRR1FCNjZaVmx4OFRPWTRneUozUkhLd0VKMjk4?=
 =?utf-8?B?SHd1SEpFR2dBSll2Z3lLZE9LREs1ZThjOVZrazJVaU0zOFFjMHV6amtEWnlj?=
 =?utf-8?B?TWgraE9rb3JGalNsOWNpQ001SGI1MzFaN0RxVGxhQjV0OXgyVTducG13Wlp4?=
 =?utf-8?B?ZEVvZ285bEQ5T2ZUVy9Vb29PRitMRm1qNXVOOWJuWExzMWJFN1dMNmQ5aklo?=
 =?utf-8?B?NGh1cDFUUnpYRUVCWXJYa3BlaEkwQUxzcWxnQStaSGpXZjl3eHFQemZSTnVz?=
 =?utf-8?B?TTN6TEJuSjRYL2ExVlBwdGQyTEFCNFo1c0pHbSthcG9aMytVVytUMEhKbGFn?=
 =?utf-8?B?REUvVjF2VGxOMTFUUTFnYkpLbk1wWFNrZ0E3WTdpaDZHT2NhWTlWcVJ0cHc5?=
 =?utf-8?B?TTlNY0dheW5tQ1E0dGtxc2hGaDU4TzZENTdBKzgzUVc1OFRjVzVobzlUdkZC?=
 =?utf-8?B?MkdEVEpEVURDQXE4OFdFVDIrci96amE1M1RwZ2Vsb2ZWUGNXSGJ5b2krVFQ2?=
 =?utf-8?B?MWRuRng4cHkvS1lNcWgrWlhjZ2tkRDZnNmpUVW1SUU42My95UlNubnVPM1dX?=
 =?utf-8?B?VUhqejVQRzF3MGRPMk84S0lrOGJxYmdIaW9qalN4L0Jla0JBRjlqelAwbnFi?=
 =?utf-8?B?YXdvS0RhRVVOTEw0T1Rxc0xpbW9OeUpuRWE5WndvOVg2R09IcTFtdklzYnQv?=
 =?utf-8?B?MWtlbHVESTdQQmJkck0yWWMrV01ObEo4VGRLZVJCdjZ1QlVTcjlIRTZJdE43?=
 =?utf-8?B?cnRMSjR2ekhoS1d3NWFJc0Y3VlVydzA1NmJkbHhGdzFMMm1XeCt5elpHSlE5?=
 =?utf-8?B?Z3pZQzE1OHNueEIzZlcyTytjUVdkVEhnM2trZW9mSkNsb0hwSGNYc2VrYmpX?=
 =?utf-8?B?eU5MVmVKNk1XZ2IxbDZPT3NvQ3loRVNLNHJGem1wYmZkcWRraXg5eW5xV0xF?=
 =?utf-8?B?QWFyeEV3RG1lc3VwQ013RUpVRHdjZ1BybGxKYlppbE1IS2ZyYVZoTmQvYS92?=
 =?utf-8?B?WHBXRHZPWFRqYXBBSFo0U0NId2xLMHJPNDJKUUFDSEoyT1VkUnVYMGprc0h3?=
 =?utf-8?B?S1hFZ3ZrZzFaVHFCY0xmaDBzRVg1QUhkQXoxNmFSVHlTV2srdklrWHdFUklF?=
 =?utf-8?B?Z0g0OXkzc3pXT2t5bUJLZlRuY3gzY05zN3Y5UWdzOHgydGVFZkJWUENqQisv?=
 =?utf-8?B?dktBTVFHbjU0N1VtbFVxUXZtRkp0S2hIT1Y3ZTUvcnFFSFRqK0hITENJN0ds?=
 =?utf-8?B?Z2lRK1MrdGNtOU1RZURybVZoVENrRUJNa2QzVUtaQVVLRUFJb1BWcElqNUZR?=
 =?utf-8?B?d2pBYUVMNWlKY2c1ZjB2Z2lkeThVSmtZUDBLV1dUbzJacUNQOFM0NkJCcDQ4?=
 =?utf-8?B?c0NJSUlOWHZ2M1N4NGRqU1gxaTlmZUJIVDhIYWxZcGVVZWgxVklWenZydGw0?=
 =?utf-8?B?eDFLVk5hQkVoejJqZVZZVkRlMkRFeHp4YXg1dHZ0UmFDTWM1Z0FYZi9NVW1O?=
 =?utf-8?B?V3lRczdwNlU4V2d2ZXNJcUovUi9CMTJNd2JpRDdNOVIwWWZEMWJkZnJIYmJa?=
 =?utf-8?B?T2xUMGgwWElXeWJqVG1XaVRrMyttWnc4ZmcyaytvN2pZbzlkdTAzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd48b96e-13e4-42bb-38a1-08dedc46b1eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 16:42:12.6108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljm12w6qxT0MKhA/2OXj60CST3ut4s22mqicyMNAhMba4CBreBtubDnFJO13r60BrksBlNFtbZsg6bOsM5/jDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9489



On 7/7/2026 5:14 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, 7 Jul 2026, Muralidhara M K wrote:
> 
>> The metric table DRAM region is mapped with devm_ioremap(), tying its
>> lifetime to the socket device.  The ACPI driver (a later patch) needs to
>> share the socket array across sockets and coordinate its own teardown, so
>> the mapping can no longer be pinned to a single per-socket devres scope.
>>
>> Switch hsmp_get_tbl_dram_base() to plain ioremap() and add
>> hsmp_unmap_metric_tbls(), which drops every socket's metric_tbl_addr
>> mapping.  Wire it into the platform driver's probe-failure and remove
>> paths so the non-devm mapping is released explicitly; the socket array
>> itself stays devm-managed.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 22 ++++++++++++++++++++--
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
>>   drivers/platform/x86/amd/hsmp/plat.c | 14 ++++++++++++--
>>   3 files changed, 33 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 1a87931136fd..ccf21f2d230d 100644
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
>> @@ -414,6 +415,24 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>>
>> +void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
>> +{
>> +     u16 i;
>> +
>> +     if (!pdev->sock)
>> +             return;
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
>> @@ -438,8 +457,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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
>> index e07f68575055..e0a99e8f2be8 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -214,22 +214,32 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>        ret = init_platform_device(&pdev->dev);
>>        if (ret) {
>>                dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>> -             return ret;
>> +             goto err_unmap;
>>        }
>>
>>        ret = hsmp_misc_register(&pdev->dev);
>>        if (ret) {
>>                dev_err(&pdev->dev, "Failed to register misc device\n");
>> -             return ret;
>> +             goto err_unmap;
>>        }
>>
>>        dev_dbg(&pdev->dev, "AMD HSMP is probed successfully\n");
>>        return 0;
>> +
>> +err_unmap:
>> +     /*
>> +      * init_platform_device() may have ioremap()ed metric tables before
>> +      * failing.  They are no longer devm-managed, so drop them explicitly;
>> +      * the socket array itself is devm-managed.
> 
> One additional thought... While you cannot use devm for the ioremap(), you
> probably could still use devm_add_action_or_reset() to make the
> hsmp_unmap_metric_tbls() call using devres.
> 
> ... And the same thing with the cleanup added in patch 3.
> 
Thanks for the suggestion. Sure will Adopt devm_add_action_or_reset(). 
So platform teardown now runs via a hsmp_pltdrv_release() devres action 
and the goto and the explicit unmap in remove will go.
>> +      */
>> +     hsmp_unmap_metric_tbls(hsmp_pdev);
>> +     return ret;
>>   }
>>
>>   static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>   {
>>        hsmp_misc_deregister();
>> +     hsmp_unmap_metric_tbls(hsmp_pdev);
>>   }
>>
>>   static struct platform_driver amd_hsmp_driver = {
>>
> 
> --
>   i.
> 

