Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007024DD6EF;
	Tue, 12 May 2026 06:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567094; cv=fail; b=rKZe9lWs+ChpKrFypysjhr0uxFQWnoho1EleKepZL5X5Iy0J0zQWCT8mJWg78zwCJu2HBQWFuMYk1AqVWsGecc/rgDmmsFJ1S0KWz+uIZHrt3F/Mp2hW3+FVIVGw/LYyOH8jQlfqmUYl9e9Ff3bNpcK70adPSJ2jQTnWF9nVkpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567094; c=relaxed/simple;
	bh=fkEJU0zj9ztWW5O2+C5+Mfmeno8Hsag5X4TbdAU+thI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fFvYJ90Rl8Ed5EKEvgj8eQghj6RsA58VvbJBDUpA+twFfivuo8P8J2cbhKdl9FzB/8uxBTGTTB3vhKrvzwuCmQISADIxScT7RmL6GFbaixUXRIum06PBqPbdKYFXiNss2hw3yRYa8vDyq/x9FCFIarYnAPIZ+w0e0PNrlcF+KlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PAt+x7PA; arc=fail smtp.client-ip=52.101.61.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PAt+x7PA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yftuj2waAsY7rhqba309DYz+Fvg3tN0p8BljwNodkWW4J9jG+dyZehoAK6Fg0l8VykhK/mNCLjgdIfg568iYiLJaN2c077EiKo2hTrhBYAkpBObUTXwylDpWYrBkmwdDqsAopCJXVBck83wjNyVonk7P59XliqNkIRJ9q6Y0GUFHjpALiIWcnwFYQu/uNaFxWP481n0a/2HVUtykUKhXrkUGg5ugRXgQ3Rw75B3x51fZfZsvI4zkwID7JaIqamLvfeTpB/7KgtpJZatlRfacEUNY6xaNZzLgkQlFgQ1rx7ZT0/6jJ+OEylHyGLNwRZ11ShB2r1L6SlKmeHM75dOluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BKuRD5ANzNWEA+HdwC7TR7mkmBBtdg6KWPdENdXXBY=;
 b=fRQlO9pPDvH3JOsmxLdV7j9uEMfPBwHH9/khpoExDB2bKZ4Fse9V9W2EwvJlXoSMCkNIduTbb0lLfcsb20MrPYhLoqx//NfSYTlsLsFvJIe8ioCCfuT/GfZz4ZNUJDBY8wnyoQXG+brb8spPufRS2Y+Qf7vUpqRf9DM+OR0b4LRGz45NPpFyWM4DRXTPN7iA57lpW4J1nwoL5vR3ziGDwsYASlpZSmbVb0JpnhuwPusgqUMWv2LaQqXrEFpP2SPR4TZIk/rbgSELbJXJiEbS0uqL6xOkmCUSruzV2SL0aFDeSgz+cpgu8nVqTG7MQBCuREufyfly4R9/NrYV07k4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BKuRD5ANzNWEA+HdwC7TR7mkmBBtdg6KWPdENdXXBY=;
 b=PAt+x7PAtKNaw2hNpJESO/2Uo30F1Np7u5cds8xgN0XzIpapaJ4Xs0qbm9Jc446AakIXd03NrrXZQZ/lnrXLow/eGWD2Wp35tmMZ0u+MCQ7TtDv+azqTyuNI2H8AvJleOoEm1QwDNE34eFXTN3T4vqCYiLGIRZFGZRnMBg3Z+mo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Tue, 12 May
 2026 06:24:32 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:24:31 +0000
Message-ID: <d1c6c16b-4259-4d0d-add4-adcaca56a63b@amd.com>
Date: Tue, 12 May 2026 11:54:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] platform/x86/amd/hsmp: Add metrics table support
 for Family 1Ah Model 50h-5Fh
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 driver-core@lists.linux.dev,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-3-muralidhara.mk@amd.com>
 <eea60cbe-1200-6c42-cfb6-f5eea88242ab@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <eea60cbe-1200-6c42-cfb6-f5eea88242ab@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::19) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: ad116ea3-4472-409e-926f-08deafef206a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	6vtgge1P6EfB6pahlh2GF8qs7TcukfM0/zteeOBCbU5wYclLhGYpa1VNkn1C3GlwEzoU0vfJjbTvGPM6IRe3UejfbeVd/AcwAkT5jeR6zNLFKCOYPF8aBpeEVfgC4Sxf0VA32NWAXU46zMTWQZqczF/OysOX6Uz1ZI2x/vK/kEPHolm+nZfY51Yyn1Ke+pX5niAP0V/QJdspUDKTyXZree9G2SIJvV68A/d46b/v2mFni/JrfnShqa/Gno7mIke67ePr41KHdy2mGnGNIHFQD5VqU3Bq7aUUCngKSXs3O07+dBNCIwwSZEVxoImMOHAZlLrBNcfqEseKI99TfrJCAQnl+Crcb0pl0+jD7IR35ba/ulOSY7jle2vZMwgXL02VKz+68/DevyKwqycrLnmA+TepykOG1R/ZreNrWisIOtQjrpePIvafT5AU1G52Vn3FhWODzsiCLrLYKz/JaaOgnnW/Uc6Jpbxwq2YIobwo36/YQrh6aZZEOuwrxnf2aGoak0sNP6lFprzFsCVCzDPr/bhKd01QOJfCi4at5bwzL1y1H70LaXRlpFFawjuURxLAgzF2FyUHS3oMatlsO1unxHGnxjzKr+dmiBXAss6yqgtMme6g9/XE0FxE+g+6JcTlUPG36xpAIbyB/87ZRyM0zHc1q15tWbjCLURFIrBRDrYoKW97syHiQVa6kUfAszEr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXMyUWV4QzJXa0R0WWRyQW1qeWE5cHZCZFo3Q01Ed0tjTTBBRHBWY3pRLy9D?=
 =?utf-8?B?Q2JwdGhxTHFhUmwxUWtDNy83MEJmK1J1VEJPTEU3aVZ6WnpubTNCeEJENS9U?=
 =?utf-8?B?WDMxVzU5dUpIMjlYcUFkL0hNaFFQZXNqL2daYnJMY3FnaFo3Sysra3NJL1B0?=
 =?utf-8?B?ajhsR3NyK256MGJqWWpSWDArOTVXOXNGSExKd0FCMUFNRlRVRW41b09TQm5W?=
 =?utf-8?B?aGFwbXJ3c3RBbTA4QVY3SmttcEFNQkxUYXdvM28vQ3AxMGhyRUdBRnMzdWxO?=
 =?utf-8?B?alpza3FsYnlhaUJpQnJKYWJVcnZSelBkMlZtanQvNlBmUWxjUlI2ak40MEFL?=
 =?utf-8?B?TEFOWmpwR3IzcG5Xam5iMXRmWWRsZ1RTZHVkN0c5U0RrTTkveGN5ZFNvSzRw?=
 =?utf-8?B?VXluZ0lnOTVjY2g1b3ZiTzFRUUExcFJzZFpoUGh5SU5YOUhnSGgxUkwxOWlY?=
 =?utf-8?B?UjBrakVCVFdnbGFsZjRFaVQxY05ZM3p4RzBLNFcyME5OUTN4S0wwM3JnR3Nu?=
 =?utf-8?B?cVVxVTZuQlJsUHU5azBaK0paZmVCU29VN3luRU1RcEpaYjB5MlVXM3NJZFFa?=
 =?utf-8?B?ZzdPWWtBS1RwWmZVWHNPZ21nSDdSS0t3dzFSVCtJa3BZeXIvMkxSNmY0UitE?=
 =?utf-8?B?dTdGRTBmODUxV0dGakQ4c2dPUlZxVTNWaGE2ZmxkZlc3VWcvemFIWGpEQU1R?=
 =?utf-8?B?OTFRSWQ2RU9MelFwSlhta1I4WXQzb2pMNTdOSUczMnJPdE5OZWVuWVA4ckds?=
 =?utf-8?B?ZlJhRHBBMUZ2RXRSa09uRjkrNHlOdy82RlJvSllGZ1B4ZVN2YXdXZHZNb3Iw?=
 =?utf-8?B?WmRZMFlMTzM2S3NwZ2tqZ3dNaFNGRWp2dDVNYlJ1M0VWeHYzZ1BDWWRLcjhZ?=
 =?utf-8?B?TVhOS3M3R2FrQkZyb2g4cVA3VTM4eksxTFVHSERYaGJ4VTJFWXYxOUtSdmdK?=
 =?utf-8?B?M2thSXhkanZHOEVCNWJOVHorVmhORnBPZFJwV29yOXI1ajZOdGRDbHFxUHl0?=
 =?utf-8?B?bkdxOGFPVzVXd3RBNi9zU3ZTQThHZW9xTXVWOVB4THNuejg1OEFzakRucWxT?=
 =?utf-8?B?a1RoMjZvVUl5dUpESmYvbGo1d2dvV3krRk5IL3NVVVR6c09wSnZMOFRYeDB1?=
 =?utf-8?B?Q1BicVRtYURJSUdvTHhvTWYzV3loQ0Z0RlBvRWh3SXV6LzNpZWorQVowTjJR?=
 =?utf-8?B?OHhLUmVzRzR1M201UlFxK0l5bmttTld6OHlOWENJaTBETDh6ZHk4S1VmMm9v?=
 =?utf-8?B?ZmZrdFNlcC91a21EVk9KMGhxbndQZ2JvamJaYXhmUXhxWHpGZHlLc1RnVDdM?=
 =?utf-8?B?Wm44TnN6YTBtNVh4Zy9icDl1VSs4Q0k3V0piR0UrZlJhcG9ybStIOHJ0eUVN?=
 =?utf-8?B?ZTRtNzJudVhZU0FYYURrSXBjK0Nxb0hQMDcvVU9wdERBOU1LUTlPd3VHVUQ4?=
 =?utf-8?B?ajZqOVg1NzdBWVBaaGQ3VGJtQnUwazduZVZLSkUwT3p4cGUyWC9nazJDNjZG?=
 =?utf-8?B?dXVmY2FaMmVyYmhiL0JKTmx5T3Q1WWtaS0VDTHU1dVJ4T29qY2FvOHRpcWxX?=
 =?utf-8?B?eXVHcHkrcER6NVNZUDEycHY4T1gwbkJQMU4rbVdWZmdmTE0vT2Y0SFo0TVpp?=
 =?utf-8?B?WG1ZKzhyc3RZbEo0S1dUR2RyalFCT2hld1d5RFdEdWc4bC9vOHhEWkRxWnRn?=
 =?utf-8?B?QUJWQy9ZNjBpMzFHNGplckYrbDNyZWJud3NmQjI1NG93bXdpZWdhUEphVmVj?=
 =?utf-8?B?Z2ljT2hPbVA5VVByaTdDUi9xUHNXeEorYkFGV2JwLzdqejEvV0ZnQm5xQ3J0?=
 =?utf-8?B?djcxaFlZRXdkckxlKzNsWU1SS3BVNGEzWER4cU9teGtSZG1DZzBsNk1aSG1K?=
 =?utf-8?B?UXpHNmh5Y0JQOTRWUEVWNkFsS3I2MFB0aTg2dHJleGlMOFdvUFhrMjYzSFNp?=
 =?utf-8?B?ZFFLUlpnNW50dE5ZdUljYU8yQUdMSk5jQnpoaG40MkovNHd6Mk9NQVY1Tkh2?=
 =?utf-8?B?LzdHek9VSXZuNEJOaUJSdFE1V0ZiM3VkM2Ird0R1S0JXaE5DbXNjdkNVcldQ?=
 =?utf-8?B?YkZRT1hMdElVTk44WXU5c1JMYlcvMWU2QzNaUTNkZmJ0VTQ1ZkNTdUFieGkw?=
 =?utf-8?B?SlVSRWlVeG9XNGR5Q0RzZjkwcjlSUXlQVDdzSzNqSE1PSU5yYmhhWjdTV0lP?=
 =?utf-8?B?SThsSG1mOXkxZ1lybHlWVVVkL0dpVWR5cWFBVGVZM2VidzdHekZFSWRKb1NS?=
 =?utf-8?B?MGMveSs2Znd3SkZwRklobllySVpiQ3hySU51djVpU3hvL0dlVWhDWnhad2NI?=
 =?utf-8?B?NkpweG9rRTlvZjFadjZDa2NaZk0yRUlES0xzcmx2ekZNMVh1NXc5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad116ea3-4472-409e-926f-08deafef206a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:24:31.0793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDtEKq8iRubk3jgIH+juf9MTcUVjYv+Qh1qcdNho3gU/f2Y8jYSR2S96uhI7w1qZhYUirL4WE1eiQK8PYx+5kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079



On 5/11/2026 11:08 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 27 Apr 2026, Muralidhara M K wrote:
> 
>> Define the UAPI structures hsmp_metric_table_zen6_iod,
>> hsmp_metric_table_zen6_ccd and the top-level hsmp_metric_table_zen6
>> to describe the per-IOD and per-CCD metrics layout for AMD Family 1Ah
>> Model 50h-5Fh processors (HSMP protocol version 7).  These structures
>> allow userspace tools to interpret the raw metric table binary exposed
>> via sysfs.
>>
>> Widen the ACPI driver protocol version checks from
>> == HSMP_PROTO_VER6 to >= HSMP_PROTO_VER6 so the metric table
>> sysfs binary attribute is also created for protocol version 7 and
>> future versions.
>>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
> 
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 97ed71593bdf..8044df862275 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -244,7 +244,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
>>   static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>                                         const struct bin_attribute *battr, int id)
>>   {
>> -     if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
>> +     if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
>>                return battr->attr.mode;
>>
>>        return 0;
>> @@ -491,7 +491,7 @@ static int init_acpi(struct device *dev)
>>                return ret;
>>        }
>>
>> -     if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
>> +     if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>>                ret = hsmp_get_tbl_dram_base(sock_ind);
>>                if (ret)
>>                        dev_info(dev, "Failed to init metric table\n");
> 
> I'm trying to understand is changing these checks safe at this point of
> series, or should it be the last patch of the series? What will occur on
> v7 hw when this patch is applied but not the rest of the series, are the
> tables returned binary combatible with v6?
> 
Thank you for the feedback. I understand your point and will relocate 
this to the last patch of the series.
Family 1Ah and Models 50h-5Fh support Protocol version 7.
> --
>   i.
> 

