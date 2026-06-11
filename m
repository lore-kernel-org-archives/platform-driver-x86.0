Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA123126C2;
	Thu, 11 Jun 2026 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152709; cv=fail; b=YoUM4/KFo+MwZsglM6KPvN5QB+SpkiTTNH+ErAhSMr9cvJMPPvLRbn3dX+IoQkxAKWfClSMTaOz72/Bna4Aar5tTNYMyZJAcKPBvW2jQdneY7/ZxBBwRr/paXDO5YWnI3wzft5F6+lJVAK8gGTx9B1nU30VsYJGMxPRC8tmSP2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152709; c=relaxed/simple;
	bh=WJbBgwf8bNr9goeCYrOe6pHosTuot9DF9I+GIeJGlUI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=taVLwUkSl3vkvJB4tKHD81wNigCBqzlTFL+cght2EtWX55QhWDH1HnhYzqxkqfTgdeJzPO8FyLEhTezAn3WL+JeLIVdiy0+MXxJNebWhF021S3nLTLgx1rvGKijYAfomxUp7cxTJask7lHd8xdz/NJoI1oCDbpjCnJ4RjJl0+aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1PENOFUJ; arc=fail smtp.client-ip=52.101.61.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1PENOFUJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzFxK5y374VLjiChm9QJO6dur4xacav/dK8L1EMLHGXZmMa7vYzkBF82qHUokrdji0+rQTV4VsUhO8izV12i1fJXHRBZlPLp1CD5rvEbzmxBCDwqS77oVwsj49MsXLSX4RTVR7eqTUs+A1N97VSBjCfVTeTF7OxbebzQej3402OrfACuVPPEmaC5TAIxl/lb5C3QO+hcPhrzB5mq7yo+pLwulkj+FuB40pSyxVNINdSwjJRMJSbOh4Zy8e6I2xslOIOEp5j19zrV+EonZbvozjyNmGGDgLz28L6NADF9JjN5ilP5ghsUbeQApVVLPvFvsuh1HrPIs2gLGGibn0SA6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WesxvWm1Crn6E/VR96cnDhTZh9GT295qqyx6kPfiluE=;
 b=Y8pEKwIrAi97Yhgg49zkOlsgQnHgeThmm8dNIxz+hgHZdNdywnwqYhmm4nRdSz+wnRuGuyQbyVyAqpd8Dd7+WQuw7lCOvblTRiST/KoNPaq/W2Bpfr8P2sQkempftOynhgecHmo/nwOAvUU/0cIVGobkfo07f2jKlA60cfonLZ1Fp9CWaYI4dJ8YhrXcvMH7hF5tIQtaFMbOo74DSZxQ5YICLwx+Cw/gItqeNUjr5Qbxb6IMKRyRL5DIgP8KoM3srWTGHomjqCOib9v3ZYfJWYHSZ6n2mCXiX9o1KSj7eZzQxsqx5I3+btqRo5Py6GLa+iDpCkXWRyxb4KdHV3Ddng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WesxvWm1Crn6E/VR96cnDhTZh9GT295qqyx6kPfiluE=;
 b=1PENOFUJjCZyDqn99wk+/xOZyOPuvoMHG6gdBVNKQAm8QkjotrFuM3VNkRgn20J39JrVeDsU49+VSgjxM5AW2DGU6KN6QDROqbeabzYHpXe1hFsrsbXUInf8MX5lcOo75eXqPRlhdqgJUJ0hoVuvlUu/2Aip57TgMnPGyRIagCM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11)
 by PH0PR12MB8126.namprd12.prod.outlook.com (2603:10b6:510:299::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 04:38:22 +0000
Received: from CY8PR12MB7316.namprd12.prod.outlook.com
 ([fe80::6d07:74d1:96a0:9069]) by CY8PR12MB7316.namprd12.prod.outlook.com
 ([fe80::6d07:74d1:96a0:9069%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 04:38:22 +0000
Message-ID: <7d496898-ecc1-42d7-bbcd-1251038f332e@amd.com>
Date: Thu, 11 Jun 2026 10:08:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] platform/x86/amd/hsmp: Source metric-table size
 from firmware
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
 <20260528093954.2461272-5-muralidhara.mk@amd.com>
 <3ccdf8eb-861a-970a-5c05-96c1ec54b473@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <3ccdf8eb-861a-970a-5c05-96c1ec54b473@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0157.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::15) To CY8PR12MB7316.namprd12.prod.outlook.com
 (2603:10b6:930:50::11)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7316:EE_|PH0PR12MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b4a405-8e73-4bec-c21c-08dec77344d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TYdc94k1BsKgb3ATgNFjuFtOhow921ElnYDD/SsTzDTTeSJrWOe7kRWKqZ6hCH5tVQq2Vnt00+DF5ad4JOL7ZxvEIVOFYqCX/Tq9Md8Id9m27l3A/LMZ25JT8gUKK+tSoSIK7rENdO7Nj1WldEaWHMyNlkUmXIsn6tlUZptDhPHrYFy1bjA9tZbY/2A3IWC2oqcF4EzZTQMzQwShqGrT1ShElS++/+XMXtAHlIPmAJ/VF0udPNS5/ep6OiScapMs1LD4IevqBkWcSGzobm1wI+1Fi8KVpLxbHeBobCQHY5WOOC6Ttbxp7wnuVgFE2YRgiCuNuHSl2V/eHOBhsGPm/5zIycDdch1223kUuewEh3xZf+sDSsGAqXYqSCGlPoD9IjkP+GMkaCA7yBE+eAf8Pwx5ZP+KW+86hWKkOZODD+IlAzTLFiPMlOlGXogDad2AAhhh1RsS2Cf4WEYJVsn4Byjbye3dmHjVmg3uCOOtjKKLoYu0bGE4FrgOLUEC7UJrgcph10gEx1P7Zdur6CXqJYrhEHpD4KbtB95fD1BgQtc7ZK79fd/3plHlUVKnY8mMam0DIDi07AgTebBWEKMqCfux9XbXB4viVCJSOPMy5uxR52GZqXDH/LOkD+B4KXVH+TuoaUSxN09FlEFSZ3RreaBNGSQbizIGxrK3h/03rQyu2iHaoWbKUtUlwBxVbgxo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7316.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG8yVTBBRi9paTIxc0h3aWdZVHQ5QlBlMmNZSFZsUGNqY1YxOWtsbG83bjBu?=
 =?utf-8?B?UEY3b2lNdER2cXR4WDNxZ0tuRG5PenJZZC9aMHB6N0FmQzZYdTRkblQ4bHU0?=
 =?utf-8?B?WGUzNVpBMWxrU0dmejZDMHV6UTlmR3RGK20wV0NVVUVnYTAwbG9qZHJJS05o?=
 =?utf-8?B?TWhUU2szamwvTUVJZ0phYUlSVGZwamk2UWJjaHBweFl5c0k0dWNHc0ZUZlFr?=
 =?utf-8?B?S2lsY3lrOGtxb1pBZlNDdDJqY3BDRHlOV2QyWnNRQ3JCTVZScnBNckdsZWpr?=
 =?utf-8?B?L1lRNTdJalNDT09GSjlmeFl2YzJkSjUyc3Qzdk1ZLzYzbEkxQ0YyYm43blZu?=
 =?utf-8?B?Y0RMTVBHZlEvMVVOVWpoZHo2SVN3TWxNa0MrNElsWWNkZE9GaEVBYVFUNHhC?=
 =?utf-8?B?Um1DcnE1dzN5NkQvTUtnNXorQkUzVHhBemNFeUpzRDU0SlJPOXFyWDV4dkdL?=
 =?utf-8?B?UHBlWUVHMmU0SG9ZaDhxdDVwUjB1SXZEMzFkSTNpeDI4N2kyNTBzT2lOL1d2?=
 =?utf-8?B?cmx4MjIzL2Z1MVNJYk1qTG16WFVYN2tEbXR6dTVnUlNEb1F2R2lvZlYwdkps?=
 =?utf-8?B?Tngzandaa3picFlhVG5MdkFscGFUSUNLZnpiVC81a0hKRmNEOE5kSHUxeVIz?=
 =?utf-8?B?L2h5dHdkMlJZUnp6L0tGRGkzRkRiaEI3UjMzTjEwVzlyNmg4Ujgxb2RNQXNC?=
 =?utf-8?B?SSsvTFQyaHpGTHpyMlJMN1JBOHo2TE0xZ2JLbGM3Z0wyT0UxbVBvVmNvNjJu?=
 =?utf-8?B?S0pMd0JjRTNINUZ2dXJZK0NaQXlNY1VxL1IyY1VBamp1TUJFUXRlR3o4bkUr?=
 =?utf-8?B?NUx5YlBGajU0TXgxSk1LdWNvYkxuL0JzYlFmV05ORjJnK2FNMXRzM0w0eHRF?=
 =?utf-8?B?QWhDWEVlZzZQMmkvc3F2TUVMdG9uT3lMMmNpcmRQUnQ3VjBDOVluNWtkRmc3?=
 =?utf-8?B?dU1lajkvc2FsU2RVU3ZqK3ZpSXFpN1lnZ051MFM2L1ppN0JGRDRtTTc5NzZT?=
 =?utf-8?B?a2E5R2tSWCtWL1cvQ09zNHM5NUZMRVc4OXRHdDZnWHJzWVpzOTR1TkhrT3Ni?=
 =?utf-8?B?UUYvYWZ0aW9CQmI2cHFDaVlzRTM2MHU2TndtTFhuRWVXQUtscVN1Ym9NTnMx?=
 =?utf-8?B?NW41UGE3ais2RDJVMXJWYi9SYUNQY0R5T0dsSHNiT3JtUThlYWJjTUttYlB5?=
 =?utf-8?B?VlB0ZlBUeFJZZ2krQzRjSlFVTURhdTZKNDNGaFRkSzJaY0gvQjNxbnUyMWN2?=
 =?utf-8?B?VXZCeEE1UjNYa1owTzZ4K1Z0WVpVQURzZGlnTnQ1MnlLbUtCWktDbjFhVHlM?=
 =?utf-8?B?Mm1SSGVNUGF5NmtuV0s1QXFIbDhmZkNBVExya2Mxc3JQaklVa3VMTHJsd0JW?=
 =?utf-8?B?UXNjUENEbDdyZHNFclAyOTkrcHJNZlE5MWk5bHZFUFd0N2x6VCtqT21jLzZa?=
 =?utf-8?B?SVg0VktYblFVN2dCME5Deko1NFRMQ3BDbkQ3MHRDSmhzVThEZm52U2RkYm5p?=
 =?utf-8?B?bTQ1WFhtanRnWS81MGl6OXpva3VJS2l1Mytmd3hUdWc4dy9RVTRxUXJSMDlh?=
 =?utf-8?B?YlYvZnlKOVlDb1owOVdaeWFoUGRmTkZLcjdCMklaV3B3bEhsbWliWFptQnpJ?=
 =?utf-8?B?enUrcitRMnlyencrMVduYmpueStWUERVZitmZGkwZnFEZ04vUWRTbTQvY2Nl?=
 =?utf-8?B?RDRjN09mZll6M2EyOENTUHpoYUNYSkgycHFqcU5VbjlMaE80c21ZVjhzaEhE?=
 =?utf-8?B?UU1sRU9qdGRRVk4yUHRYelNkY2Z3dEV0eXZjRW52cmpKdjZaUzNUQlFFL2Jv?=
 =?utf-8?B?RTFhMWM5NStMZko2WkpiK0l5MGd2MnlRQ2J5NUJvUFJwaWNiU21pWTEzVWJk?=
 =?utf-8?B?dTFYMmU2N2tWSmZxUTRxL284TDNPSzRRSTFOMEVyL1BwNlg1V2FveE5nU1Fn?=
 =?utf-8?B?em5WcSswdGVnQzlYR0hmM2cwU1p6ZmUrZnNEbWNXbVRrdzFiYmFLUnJqZUw5?=
 =?utf-8?B?YUsxazd1bFNpMGRDbDk4RW9GQ055YzdieDBxa05Za09wMlpmUDNIbXVpaExW?=
 =?utf-8?B?QXlXSXFTOCtvejkrRkgvNVNpWi9qS3ZRUE4rKzFJR3d0akliRFlTT2dneWxX?=
 =?utf-8?B?M3h4b0cxNnlOVVhReXVxcUJ2YmxxUnQzTTAwdGM3enBZMm5qSEVSK2ZKZzFT?=
 =?utf-8?B?K2EvRW9UNVQ0Ykl0NndSQTYxZjhXdU5vNDdTQjBJaWVrQkNGRDIrVGtoVXBk?=
 =?utf-8?B?VUZxZ3F2Q1BxcWNvQ3krblNmdWduOHNEb2JZUENVNWtPMkZWNHpUUHg4d0lU?=
 =?utf-8?B?NGdXQ0tPMVZ2dG9sWmI3d2tYSEZ2SUtSR2NXb29yaE1Xcjg4cFFkdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b4a405-8e73-4bec-c21c-08dec77344d0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7316.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:38:22.4052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXhy2QZvtNQwP9VaF6msf3voVXdG1tBnFjxdAo8x2bQxixJX0N+AF44yGrY0x5TXg0xtOjPRUMo/gOY46XMoOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8126



On 6/10/2026 4:35 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, 28 May 2026, Muralidhara M K wrote:
> 
>> The driver hard-codes the metric-table region size to
>> sizeof(struct hsmp_metric_table). That is correct for HSMP protocol
>> version 6 but mis-sizes the ioremap of the SMU DRAM region on newer
>> platforms: Family 1Ah Model 50h-5Fh exposes a ~13 KB
>> hsmp_metric_table_zen6, and the table is expected to keep growing
>> on future firmware. The same hard-coded value also forces
>> hsmp_metric_tbl_read() to reject any read that follows the actual
>> firmware layout.
>>
>> Pick up the table size from firmware instead. SMU on Family 1Ah
>> Model 50h and later populates HSMP_GET_METRIC_TABLE_DRAM_ADDR's
>> args[2] with the DRAM region size in bytes; older firmware leaves
>> it 0. Bump the descriptor's response_sz to 3 so the field is read,
>> store the value in hsmp_pdev.hsmp_table_size at probe time, and
>> fall back to sizeof(struct hsmp_metric_table) when firmware reports
>> 0. Use hsmp_table_size both for the devm_ioremap() of the region
>> and as the upper bound for hsmp_metric_tbl_read().
>>
>> Behaviour on existing protocol-version-6 hardware is unchanged:
>> firmware returns 0, the fallback yields the same value as the
>> previous hard-coded one, and both the ioremap and the size check
>> produce the same result as before.
>>
>> The ioctl interface added later in this series uses the same
>> hsmp_table_size to validate the userspace request and to copy out
>> the full firmware-reported region.
>>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 11 ++++++++---
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
>>   3 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index fce271282348..438ac38d0dc8 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -365,11 +365,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>        {0, 0, HSMP_GET},
>>
>>        /*
>> -      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
>> +      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 3
>>         * output: args[0] = lower 32 bits of the address
>>         * output: args[1] = upper 32 bits of the address
>> +      * output: args[2] = DRAM region size in bytes
>>         */
>> -     {0, 2, HSMP_GET},
>> +     {0, 3, HSMP_GET},
>>
>>        /*
>>         * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 9bad58fef304..cf9392f99298 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -356,8 +356,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>                return -ENOMEM;
>>        }
>>
>> -     /* Do not support lseek(), also don't allow more than the size of metric table */
>> -     if (size != sizeof(struct hsmp_metric_table)) {
>> +     if (size != hsmp_pdev.hsmp_table_size) {
>>                dev_err(sock->dev, "Wrong buffer size\n");
>>                return -EINVAL;
>>        }
>> @@ -398,8 +397,14 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>                dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>>                return -ENOMEM;
>>        }
>> +     /* SMU returns table size from Family 1Ah Model 50h and forward */
>> +     if (msg.args[2])
>> +             hsmp_pdev.hsmp_table_size = msg.args[2];
>> +     else
>> +             hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
>> +
>>        sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>> -                                          sizeof(struct hsmp_metric_table));
>> +                                          hsmp_pdev.hsmp_table_size);
>>        if (!sock->metric_tbl_addr) {
>>                dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>>                return -ENOMEM;
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index b153527e0a0d..e7f051475728 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -55,6 +55,7 @@ struct hsmp_plat_device {
>>        u32 proto_ver;
>>        u16 num_sockets;
>>        bool is_probed;
>> +     size_t hsmp_table_size;
> 
> Please add types.h include.
>
In hsmp.h, size_t becomes visible without adding anything new, because 
the file already includes linux/device.h, and that pulls in linux/types.h

>>   };
>>
>>   int hsmp_cache_proto_ver(u16 sock_ind);
>>
> 
> --
>   i.
> 

