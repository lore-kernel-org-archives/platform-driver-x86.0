Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1AB29AAEA;
	Fri,  9 Oct 2026 05:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522554; cv=fail; b=BIafxwVMN5o9Tzn94kIjSs7HZsjzm8KXoQgD7YxVZ9fgOaUovCjYhbhrx0T5vJHW3Z8dXlggawdmp1/IFmzSo8FPO315NgYvNIlHFWpJ61+uTy4Ord/GcX/2aZZk7MaN6ptif9tvyEWvuY1Rbogr0j8hawe6iyST/LohMWmYcfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522554; c=relaxed/simple;
	bh=Fs+kpGZ3Mi+UpzBLcdoCYZX3d/SxDKeGuiJ6rIqggvA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BtbnqXXExQRoqJzj2zHBVBOs1inb2B97jnqU/0i5GnWhPzqnoqD6S1fXcEqhkveVIMDCeqEMR/FdAwly5uKqvL+5ovrddf/nbrsLcfYjv243BlshZgHec4fVPYugFjI7x2J53/zQRmsBEp2kI7LjwJUd+ozdU3cSQp2uQOtjM08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zz+vrbq4; arc=fail smtp.client-ip=52.101.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zz+vrbq4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O91nO0MJ0tsW59t80w2Lq44X07qLTp46f5/LlLPSd8w7CrbAZ5veFLwZii4XBhjcBnlutLLTllpIVbCruXZfsglXy4T9E8eRjOMi4uS/wbUegl5+43v8jUXG1ZSy8eh4elTuPBD3UpyKffju2sL64WZkZGH5+57K1saTnpEosrxk1y58DY1Glux8dO+NzsyoBXTRsWRepgiDG8okt3nG4k3Tt3g9DodKpuSdqn3OHRqsIkRDZz2U3HE2vKfTwyvYEMYsey/dBkNDT4QnaCby0/BAlKWAfMVgMz3MK2BXnAtdjbbW8pAbnkWUWAEua3Cewb/FfU699hCF0GtnN6zHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpmoNZ5YmleNm3inP+WA1cxvH8kJaq/b/Qv6f6L1O6g=;
 b=BYaIY7cf6jOo4j3t+c2PNyRdmEz2iX9DfKM1OONEn8QrxSLIZYkvPFaPjrQ0rSO/+xf/2tATEGcGqN5kqrRZRHG4FACavYAMKjBtGjty2SJAjOI3moeYrYOp7NLKIQODXFL/JjZWdohapeVjwIkQ8WWrrQygX7osXkVqoWqCXbK0QMYWj15KLggH6kkGns5dQHmzo6ZpTVzCWVuJ88IZe/Hfw7vWYLiRrA64+fO5Mi4f5S5XoV47dkqn5U0IKqMHOxaS4gyvPzCYg1cHtNxzeZyVtfSKv4dcYUQKlpulgbKYF+pPuQq70j0bHT4zqLV/gjPjzN19COx78H3muzJajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpmoNZ5YmleNm3inP+WA1cxvH8kJaq/b/Qv6f6L1O6g=;
 b=Zz+vrbq4WbB12jzi5xZdcMkyE+BaF1h+xsDKlBEs4qviNlG4xyjjB4+v/7bacItOAbdZ0y6d6NRkUFAN5TTSU3nPLufeBG5ALC2PCcwAV7riga0AKEklSJR22C6055WptKzH4V6ZnpSeJDFF2cXr7dDhSrsiBEwiYJytw8MCVhA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MW4PR12MB6804.namprd12.prod.outlook.com (2603:10b6:303:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 05:09:10 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 05:09:10 +0000
Message-ID: <c5288e72-3de8-4ae4-9c53-680ce255b266@amd.com>
Date: Fri, 9 Oct 2026 10:38:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] platform/x86/amd/hsmp: Hide server-only attributes
 on client platforms
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260924154947.1706669-1-muralidhara.mk@amd.com>
 <20260924154947.1706669-4-muralidhara.mk@amd.com>
 <370cbc28-0628-fef7-cc35-b1b70f8fc9fc@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <370cbc28-0628-fef7-cc35-b1b70f8fc9fc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::7) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MW4PR12MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 555b10c7-f833-47df-2b76-08df25c373fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4143699003|56012099006|11063799006|18002099003|22082099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	IoDYuwouRrMBTQN4zC2mlYwvSAf4jyghTYZOao/TTrPZcHKILs9j9IbONqp97qB0gvvxKD8NBhroPx5TdwOzAZ0w9ggbwDbt7D3IqN4X/F5CxHK1aXthLJmYPhKGXAeH+GABQ+3XtEnLxtvguET515W/gMSixWycCiGgSAt18n6yiC89SMGCzTRsu8m8LT+YZ/NCm0DSE0hXvqvsGqCj5HcDM9L90xNsUQzN/Zfsv7208Fdc+28B/UY7xXDxXyTagJIVG3rObhqi4UXuKetIE+7xytNXXvUW7zJhWBJC//KQVBllWjaSTaQYHHE/SLfWfUjNgKs4eGPly1iSWaAcnpNnPlzceBgt+yOuwriG7kYQeUgsaIbYkABuI6ty026bj6rd8MDFVCoDfplOGrS443tRZIcfiI8pLZzYNywuDtkWSpTfEVVoKrJJN22hpV7qAQ50AJDben9fIBe8em2NXP8UQB3r94U9pC1da8RM5GMwtETCqouQsxOpnh1V3Ot5yMSl4de5VQmXjHWsFBUFW3weq3uWdiEGoLwoT9guCtlIaX9CRSwbTQ3M5GkAW147YGbzUPN04WkWt7wbtxJjKN0wGpohLhBAwfTdmhFTSS5dNXpU5kFrvcxV0HQ893YDWzq5yXNod5mb5Mf5Ezaz1cyMAKlMQQKJ1Lv/+7JlG0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2FNZGpNSk14UkFJM2ZTRlJYN0ZLTlE1UjF6ZVIrZ1M5UzIySnltQUErdi9F?=
 =?utf-8?B?bEh2Z3NTRDJ4ZnFmWGpLZ3hUc1IrNjlyTjdESTZRTTcyUnZBSjJINndrOVhR?=
 =?utf-8?B?Z2t1dFZpWVRJN1lkWGFrNWZSRU54OUl3MS96MXF0UUxvck1ZUmR2amZBSHR5?=
 =?utf-8?B?aExWdGp6TDhSK1pEeWFDYldzakh1aEJQdDNrc3VOaTdnbk1QU29SQVZVVDhs?=
 =?utf-8?B?dWZWN0FQNzI0RGVlWnVLemRPZk50WmVqY1NwY1ptbEJvWWU4MHhlbWpSTTNp?=
 =?utf-8?B?KzZJN3RUelBhOG9ReXFUL0pCcmVMVit3S0J0UXlUNCtvZUJ6SStqNFREV1pk?=
 =?utf-8?B?TXBBZEJ3TFJvbGIvMXNnOUdpYU5JMHpEVVI4V3oxR21qVjdqOHFjSElxNlZs?=
 =?utf-8?B?V2ZCRys4d1FXK1RxdHFTR09rRGw2WTBJeVpJT3dEZHRkd0dzU3kyOEcwcHk5?=
 =?utf-8?B?TUQ2NlVXMEtEMzRTMWhONUtvN2JERHlyUjYwS016akcwRDY2cks1MEN0OXor?=
 =?utf-8?B?TTRLNlp0NEpqektTZHhhWEhPblRsa2VDV2FPVUlGOFN1cUdlbzB2dmYvdndK?=
 =?utf-8?B?VU15STZvdFFwQ09CL2htZUh4L1RmVit2K0kvU0UvQzdqTitzbmgrZkVnUmJD?=
 =?utf-8?B?TlY5SUtSMDFPbGkxZ1ZKUFFUV0MwRDEzaEFZREFrOTZqWkpFQS81dGVrWEIv?=
 =?utf-8?B?Q2x4RUFWd0pYdklrTFpWYzdyTWdvWHU0cTdoMXJIdU43ck5WUjF4RUZtMTlD?=
 =?utf-8?B?b3NBaFhJRVVpei8yT1ZNWnFxcEN4Q0Y1UEhwZ1l2dGhjYzExRGI1amczR3ZY?=
 =?utf-8?B?eDQ5a3ZYTlcxWUVGdFpVclBSUnFOaDUwMENUUVpva1hnbmVQeVRLRXFlTTkx?=
 =?utf-8?B?bWs0eWJsY0U2UkxDdkVXNDBMdk5qVUZzNG5LQkhnV3BUaTNuakxxSUs2Z3dv?=
 =?utf-8?B?cHhNYTlaaTAwNVdHcUhFZyt4cnZIbXgrRUM5UnNBOVNSZTdyaXkxQW9lejEw?=
 =?utf-8?B?bS9xQlFTbGxaZ2J0R1N3S0pZdHlkeVJMNVpSR3RMa0pEejh6N0dMcUlOWldv?=
 =?utf-8?B?elhlTUxsMkZDWEZVeHdFeWhBN0J0QjJodW1wS2Mxa25ycENESGQ5NCsrS3A3?=
 =?utf-8?B?TEk2MDJFQTdoYjR3SEV3S3pEejJMajNUZFZuWjdQbzZuZTlLQ3luNEFQTjc1?=
 =?utf-8?B?eTQ5dzNyc21LMWk0QWpUVHl3TWFmeEZxK2tQa3hoaFA1ejhrQWdiY3kybDhY?=
 =?utf-8?B?YTFoRXBEVDRObnFnL0dVRnVFS3hmcVRxc1lvREt5VEtqMHY1Y01hcEFqQzQw?=
 =?utf-8?B?c29WRG01QW5HRTQvWE9OUHNzZ1ZDdDZySGdxeldaL0pESmtrTjJneE1ETGJu?=
 =?utf-8?B?Ky9iKzJWOGcvQ0pPMzJTRHZGbjVpVklkZkh3N05yKy84ZUZoc3VRQ21RSnJU?=
 =?utf-8?B?NG5vVzBFdnRueWQ3L3k5T0I3OVRWMnZwWXZwWFlkUGtrRlhCZmNjM0tlUktw?=
 =?utf-8?B?dDhvcWlWOEQrekdYeWdmSy9iT2MrSWxlWU8rckZIUTZIRmJCQWprb1ZOWUpN?=
 =?utf-8?B?NEE3ZUFWcTdFNk85a0JzVmI0UTg5SDQydjloMExQMUJGVUxWNHNhWFp0SFYx?=
 =?utf-8?B?aU1rTkM5R3V4YUlHOGR1djFXVHo3dFMrZWRvRzJyRWVHQkNzenFYR3grZWpZ?=
 =?utf-8?B?Zm84dE9CNFZSaTRQa0hPUlVSUEtIVGFUbTFDY0I0NEZlQVhEUTQ2SnNZQ2lq?=
 =?utf-8?B?WnI0TFBjT0I1MmxCT2ZHZXlibGs1MFpiWGFvalRMQUdTeW9ROFNtQ0grcTMv?=
 =?utf-8?B?eVJNdmhKbmlzYnFoTUVScWExbWlqbzgwQ1pUeGt1TU5qYkw5MytWc283RjVh?=
 =?utf-8?B?b2NteE8zRUwrMFJYd1ZlUC9FRTc3LzhZcUhFSFd2ckdPWTB2OXEzTjA1SUZh?=
 =?utf-8?B?dm5MUW1FSGtsT2N4SEtsRWV1MXBnV242THpkMjh0QTh0YUlzYnk1UXc5cUl2?=
 =?utf-8?B?Zm40Mk9NV1FzVFV3clc4NWdsWEtna0Z6MUcvR0dQVWpNdHB6ZTRuM212V0pK?=
 =?utf-8?B?TDFRdGQycUw5SWRlK3ZkZUJWWDkyeEoxSDd1U3RFSEVNL0RWN3lxaHhYaDlJ?=
 =?utf-8?B?dEdPZndvNk56QWRiUjc2T2NOeFRXcSs0TlgxTGF6Q2tYSGpHa3A0REpkSVdX?=
 =?utf-8?B?aFhCQktEQUJ6Tkt1RmV1QytxZlpUWFVDT21VOTJYcWQvTDJhY2VuYXIwbTRJ?=
 =?utf-8?B?ZUhJbmRYckFRNk8zUnFGMXJRV3RwaUZEUUNlNE1qaGlLOGszaTQraTBQUUdU?=
 =?utf-8?B?TzJKYU5NaFJUNVNjSXhFckVTUHQzc3JTUkxaSytEVEtGV0FxdGhBQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555b10c7-f833-47df-2b76-08df25c373fe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:09:10.6044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71FMVxXe2yBmX1UuTwqL9qaPUU87j56o0Jo+PLEDu8pMH2sL1QBjeCBJcUNg3HzAe3a+GSF02piHmrN8/wD2FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6804



On 10/8/2026 5:28 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, 24 Sep 2026, Muralidhara M K wrote:
> 
>> Most ACPI sysfs device attributes are wired to hardcoded server
>> message IDs (HSMP_GET_SOCKET_POWER and friends); hwmon power
>> attributes registered from init_acpi() have the same problem. On a
>> Family 1Ah client platform these numeric IDs resolve against enum
>> hsmp_client_message_ids instead, and mostly collide with unrelated
>> client commands, e.g. HSMP_GET_SOCKET_POWER (4) is
>> HSMP_CLIENT_GET_METRICS_TABLE_VER on the client side.
>>
>> Hide the affected ACPI sysfs attributes on client platforms except
>> smu_fw_version and protocol_version, which report the same data in
>> both tables. Forward-declare hattr_smu_fw_version and
>> hattr_protocol_version ahead of their HSMP_DEV_ATTR() definitions.
>> Skip hsmp_create_sensor() in init_acpi() on client platforms for the
>> same reason.
>>
>> The metrics_bin sysfs binary attribute has the same visibility problem:
>> hsmp_is_sock_attr_visible() gates it on hsmp_pdev->proto_ver against
>> HSMP_PROTO_VER6 with no is_client_platform() check. Exclude client
>> platforms outright there too, matching the ACPI sysfs attributes
>> above: the client set has its own telemetry table, read only through
>> HSMP_IOCTL_GET_TELEMETRY_DATA.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c | 29 ++++++++++++++++++++++++----
>>   1 file changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 8b4bf57c3485..d775ea8ba603 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -300,16 +300,31 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>         * so that userspace which expects the file to exist gets a clear
>>         * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
>>         * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
>> +      * The client set has its own telemetry table, read only through
>> +      * HSMP_IOCTL_GET_TELEMETRY_DATA; never show this file there.
>>         */
>> -     if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
>> +     if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
>>                return battr->attr.mode;
>>
>>        return 0;
>>   }
>>
>> +/* Defined below by HSMP_DEV_ATTR(); same message ID in both message tables */
>> +static struct hsmp_sys_attr hattr_smu_fw_version;
>> +static struct hsmp_sys_attr hattr_protocol_version;
>> +
>>   static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>>                                             struct attribute *attr, int id)
>>   {
>> +     /*
>> +      * smu_fw_version and protocol_version map to the same data in both
>> +      * message tables. Every other attribute here uses server-only
>> +      * message IDs that resolve to unrelated client commands.
>> +      */
>> +     if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
>> +         attr != &hattr_protocol_version.dattr.attr)
>> +             return 0;
>> +
>>        return attr->mode;
>>   }
>>
>> @@ -564,9 +579,15 @@ static int init_acpi(struct device *dev)
>>                        dev_info(dev, "Failed to init metric table\n");
>>        }
>>
>> -     ret = hsmp_create_sensor(dev, sock_ind);
>> -     if (ret)
>> -             dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
>> +     /*
>> +      * hwmon attributes use server-only message IDs, which resolve to
>> +      * unrelated client commands on client platforms.
>> +      */
>> +     if (!is_client_platform()) {
>> +             ret = hsmp_create_sensor(dev, sock_ind);
>> +             if (ret)
>> +                     dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
>> +     }
>>
>>        dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
> 
> This series still feels misordered.
> 
> Can we like introduce is_client_platform() first, then add all these
> checks before adding the client support in the first place? This
> same ordering problem applies to the client/server check in patch 2 as
> well.
> 
> And would structs in patch 4 also needed earlier? This is not as bad
> problem as the above ordering one but I'd tend to think we'd want to
> introduce the struct before HSMP_CLIENT_GET_METRICS_TABLE actually works
> which is after patch 1, right?
> 
Thanks Ilpo, it's a series reordering, not a content fix. I will make 
changes and submit next series.
> --
>   i.
> 

