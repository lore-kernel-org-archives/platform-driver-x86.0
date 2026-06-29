Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7CA36D51F;
	Mon, 29 Jun 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742041; cv=fail; b=HtmZKKNeTWWcrWw8TGamD7RkXxsSuP0F8+RdN74Rj75v5ZYMX1iV4DnZTi/nltxuRbVfQlmEovcSt7to9GmRT8epYltIdbhVcj8e+KxMvpNLgVUSqU2Zdv89KhBS6H0wEu0YTEfQu189s07rEBI2Ii8nVYspRMvCMRqL3bN0xCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742041; c=relaxed/simple;
	bh=2i9cJzlwWCIS3uV/Wc8iep69Yr6pBz1I/nohoOifbc8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sEuitBBNi5vhNfi3vab2leShudb0EJYTIPsyUgyoS9EtSukokFf5ho+BTAqe4cxZmgMR+uoVzty1hPxoJVuMV3ctlvaqQk1AQCoj2WEt+CTiVKp4VYwQstmlWLfNKhMLGJ0oRHsryP89bY//QGCR+YpG33mhaTnZW9x9n08O2dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uPOzsiEv; arc=fail smtp.client-ip=52.101.43.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uPOzsiEv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYjcP5w5IrLWcv5bOHDIFKknMllIqIJO+M0R67b+DtedlMT9p/erPSMrvdV24Q2iWNaqFANyo5FILhu+1f/vk4NSO4uMfJ0OiO1X487lh9rndUO/YbJp0XgzApVrXj8RMO4dTZZudKyKQlWFXt2iOPP9JrA7tTIS3l4+x2HIWuOVnbslMCPWcuM4j4ltzbcsaVXAb77pmgL420XUCZMfU6zd0ymfUZoAsn+x94IzNyKAt4YTNjrH+z5M5qpux30RtUFZPZ65j2hKGeahOyB0EUSKHWIeZpakcZDtUBL/q4v4Y3EXjXygW2fYUZGvmp4yYh8vi6deNSF8Gz1dSz1seQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExcpKEfyHW+2pFDs0YWF3waWEs/lkDXQM2MobZaBSWk=;
 b=O5ATyqBNO3CyY7TWiP/B6DCDyDTVWqa0nwQlSVJLgCn0+Ld4UpVlSdNOBG/+2PNvXAJoy86Wi1HAQRwUD02zDqVZ4iTOm8DUYslYc8VP3JoeutVnuAb4lZO33GCsw38d4Ybiwy5cx11TLfdzcDf/KIIVXQgvrGsioq8SBkurlrKRXyo9q7kZsL5uyBfNkFFD+CMwjYmtGHPaf8SgeDtZDsqBMklZYeigq6jtX+eXjSjkvUTgB2FGQdis84QXHBujzXNpacC0gBOi3aq/eX4BGWDPtL285jww4U+hc/mB4lZsXvEvdOEkH0QLjFldY4glg6Y02fy9qEAJrFFQYjJMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExcpKEfyHW+2pFDs0YWF3waWEs/lkDXQM2MobZaBSWk=;
 b=uPOzsiEvLyQWEW48VwgsPFCUOZF8mf169QEoRTxtvIGrv2jfFdZOZTpfS2TON23cvZwCN60Jy4QS1V/AeeRPB4VHXZI9rGmrNYeVfvXVObiFEaO8dcqOzjfOvkU9GF+iG3GqHsyD0RZE+uhIbM7j5Qv7Txyl08/grzji402edZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.21; Mon, 29 Jun
 2026 14:07:15 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 14:07:15 +0000
Message-ID: <fa120fd2-3ebd-4ef9-9882-773123ab2505@amd.com>
Date: Mon, 29 Jun 2026 19:37:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86/amd/hsmp: Pass struct device explicitly
 to ACPI mailbox parsers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260629073923.1595696-1-muralidhara.mk@amd.com>
 <20260629073923.1595696-4-muralidhara.mk@amd.com>
 <74e6fd67-4c10-8efa-7565-dab0dd008b5d@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <74e6fd67-4c10-8efa-7565-dab0dd008b5d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0302.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::19) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e6518f-0437-49ef-e70c-08ded5e7b914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|4143699003|56012099006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TL4Bs4V4Rto/RnWvlfUM+DHWdbR/Ttcw1Sdg0meTtriGR/o9QS/q45lFtNlMfJdrOrF6f4cC/iv8z8dfl5J4Tom29IhDzxJ0rW1xnq+0n4VKC0k20eW4KyNT65VfkkW92dAOq4xBebFM3EKKiPgPzoMrk1nLA81dsHUC6ronAg9CD+T9o8pjDtd8jMmVev4x4HPZMhCE/ddMdO03Z07JtyrEjZdfPn4MOljbn/S/mZbOtkhYC/irD7oDWZyIIonn/6Iq/6q0aPOe71PrKitT+17ZPjJqErEbW3RlCEfV2pozafvjP8ZUWykuh26jqykb6EJgpautj6n6Oq8vhYbwCz/sDCCf1R9hRhYe7UJHQxkqX4pT6wq461vRYdfn1oXmNsY1yCbX3aq4mD5Pk8hhrGOWIAp5zSzDqexdoi9Jfc3wH9Wa8OBI4H7bV2RmkLvQXjIrJth2asOEjHBsaOIsQ4Ld1D780qQFNTSHfQFdmSCr8mh3WxOoPNLVS0eTiHfb5D8MpYPZWJc5f4GjG7R+aXwFuasCIgszIt4BYxBd2aTz4fBjp5zPke9N+7usxS2t+BPapjySh7Caljf8hx9XFyH6Zjx//8LRt3lYulGK5JrGyWJgzG/N3GcpTZrgAbo4iyaajhwYWrfVNP4yMi227M9EiSBpJyZkIlRe9KzvopY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUJiTmoyT1JWSEl5RXExRTRERkZ0WG92cnpnREU2SWo2UldXSEJnUzB1VUVu?=
 =?utf-8?B?ZWZRS1BCWlFqempENkVpY1VhZndSWUFkR1BjVnJOd2liOU52QWlzNnl6bkhz?=
 =?utf-8?B?a1ZZVnFmUi8ycUZNb3VwcXRlbjg4bHlOd3E0eXN0bitlN1ZtVENtZUhpOFhN?=
 =?utf-8?B?SFlwcTdRM1pjdkpsSWcydlpYbDJvMlpybmE3YytrazJySHNPaGUzRjJVZm1K?=
 =?utf-8?B?NmpWNzRiVE9ReENDNU1QTjBxdWZqWlllcDhjV3Q0WGNrY0p0RElzTjlWLzJh?=
 =?utf-8?B?dnU1MXl6c0ROUTJIM0FUdlo1RjlQUFo2V3Mvb2w4SnNueUhIeDV2OVI4Mnh1?=
 =?utf-8?B?UFY1amRteWR5QU9YeEtsR0xvVXRqaG9SRlN4UkdrWVZtMXJSaUtSNTRsZUdk?=
 =?utf-8?B?OURTNHBpZjBrS3RjN1F0QmtQU1B1ZHVVL1pja2U0NDFUSUJQN05NV2NjNUpV?=
 =?utf-8?B?UlJVdW90b2JQYVRsNFgzK2J3clRUYzhNU3FQeVk2UERBay9IMkg5MDZxV2hm?=
 =?utf-8?B?aE5XZVVQa2xabFF5QVVMdGJ1UHREaFRoOUpSM0FpQ0NBWWw4SE9lY0owRExV?=
 =?utf-8?B?SDdUVG1yN1R1Ly9vR1JHckVCSUtVMzJicWRRdW1rZEFycTFVUmNjZmd1UVdk?=
 =?utf-8?B?QUlCaXRRQXd0N3RJWi9UQWFMdjErRnBJY3N0UTRKZG5PY1lRTzR4TjV0K1d3?=
 =?utf-8?B?RDNzeksxM2lLM1JuV25TU1pYWTI1MlIrc2p5eFZ1YksxSGRBNWxZdkVSOVFO?=
 =?utf-8?B?LzJXNzBZUDlYcHk5cE9vUy9WMG9Sa2NoUG1rZW1aa0ZRaXNINEl2UUpLSmFh?=
 =?utf-8?B?ZlEra09hS05Zek9CWEVQb2Y4Yk5CbjZPZS8wRnNpRlVucDVOdERmdmhZdklW?=
 =?utf-8?B?VkJ1SkdJSzZ1L3dYQmkrOEN4WUZ0V01idFpNelVicWRaYzVvSnVuc3J6L05M?=
 =?utf-8?B?OWZ6a252RVA2dWptZjdqTXZVeVVFU3FldmJzd2dDa1lodUVmMzJJd3hZSWhF?=
 =?utf-8?B?WnF4aTJzKzRpNXdKekZjRlRSUGxuMGVHZDhLRHRURDZGZ1ZTN29peGVnYmc0?=
 =?utf-8?B?Y0I3Wjk0cVlzM21OLzZONlVJR3V5VXVRSlBLakgyLy8rL1ZGTG1KejB0VUs4?=
 =?utf-8?B?QXhRYTBxTGpNNkpuVXA4MGx0dUVDQ2dnK2t3U2RYYk4vNFRDR29PNGFsWDJB?=
 =?utf-8?B?Q29RbDd6UnZWOS9wR3UxclRjbmVWdE4xbXFNamJYbGtVYXFCcjhCdlRScS9k?=
 =?utf-8?B?dTQ5UWt6Yk85cWlHY3hVc0RvT3F2R1lENmwzSkhHdmRrSXBmUmt5YXI4aEFi?=
 =?utf-8?B?Q2NGVTVoYXBrcmNwcjdKTU50RmlTZ1Bjc2xsaURxWndRcnQ1UEdONEdvVTdO?=
 =?utf-8?B?RWFxQ1Voc2hlKzhqOFlYTmlGVDlja292ZEc1WS9uVFJhVmp3K3FuR2R2Y0hD?=
 =?utf-8?B?eVpCSERRWEtSeVRmb05WWVNIZ0lldllSanJSd1pmTXBxVFVyR1pkNzRmSGFh?=
 =?utf-8?B?RE9adzBvMXVnU1dDc3IyM3A3OUVCMFJIQlBLY0tOVHFKOUdSS1lxQTJkOGV0?=
 =?utf-8?B?WlN3SVNITGNuNTUvZitkNDMrVDlPRlUyKzFiSFQrdFBETVFOTkVHYnRsWDdu?=
 =?utf-8?B?Mm12NmxLY3BiT2F2YUp2R1dUcXZXQjZFemlmOThoU0g4UlVXbzhBYjZWSE9O?=
 =?utf-8?B?cE5oWGptMXUreXc1NG82K2FuaWxLT1laaEtHRWd4NVFWYUV0Tml3M3VGdWx5?=
 =?utf-8?B?Q1k1ckQ1aXZmVlBNdXpucG5aSzVXb01oMlhjSVFkb24yQzlIaVhjbDA2WHZz?=
 =?utf-8?B?OEJWRDRianRHYitLSXdjeEdwVnFGanhWNHZDdk1vQkFuOXBDNmxtaTdHM3Ax?=
 =?utf-8?B?Smtnb0ZaMmNUa0N6S2VoTEFtQ0xyYUlGNGpEMHBYVmJ4SW1CY21ibGRBTllh?=
 =?utf-8?B?QmU0UUQ0MDBFT2RyUUhwRkJLZDJyV2dhd1hxbWtialNBbzhmbEtlUk94ZDNl?=
 =?utf-8?B?SUJITFl2aWZZTTBYalY2RXYwR1lPanJpOGFCS3BHV1BBY1FXSHVHWVE5SVMz?=
 =?utf-8?B?VHRQdHUvbHNGeFdJY0pIVHl1QUNOOGpwRXF3dmxWYUUrdUxCazgxV2JObVVo?=
 =?utf-8?B?QzVlR1I3cU5zWGV4V2RWT0ZBTVhyVU8zUU4yOGhLRW1ENU1SRjY3cWE2N1ZV?=
 =?utf-8?B?MGs0aFVhN2hESm9xZlFpcjN3NEhYV2xYRTJnU1htbzd5MENKWjRma3pabDI1?=
 =?utf-8?B?VDAwcmtYOWROa2w2Yms1aXNjdlB6dVlDMEM4MmRPRHFQYmZoZzRac3RYS0VF?=
 =?utf-8?B?alR4L05NVDZPRkZYWnRua0JtYWFqQUFaTitrUUdkTnpqbnhNeXd4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e6518f-0437-49ef-e70c-08ded5e7b914
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:07:15.4106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvpTV6zF9U3NMvneApTIgMaz8Nr9nxlYDctRv8A7v+EqjcLJ0+dUbKhMvfff5ItNNJ2Z29A1HsXQ9Ib42yPyOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385



On 6/29/2026 6:16 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 29 Jun 2026, Muralidhara M K wrote:
> 
>> hsmp_read_acpi_crs() and hsmp_read_acpi_dsd() read the ACPI handle and
>> emit error messages via sock->dev.  Pass the struct device explicitly to
>> both helpers instead of reading it back from sock->dev.
>>
>> This is a pure refactor with no functional change; it prepares for
>> publishing sock->dev as the data-plane readiness gate only after the
>> socket has been fully initialized, so the parsers must not depend on
>> sock->dev already being set.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> Link: https://lore.kernel.org/platform-driver-x86/20260625123337.886435-5-muralidhara.mk@amd.com/T/#u [1]
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 8c3185ae6395..f7fbba4c6b66 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -107,7 +107,7 @@ static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
>>        return AE_OK;
>>   }
>>
>> -static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>> +static int hsmp_read_acpi_dsd(struct hsmp_socket *sock, struct device *dev)
>>   {
>>        struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
>>        union acpi_object *guid, *mailbox_package;
>> @@ -116,10 +116,10 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>>        int ret = 0;
>>        int j;
>>
>> -     status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
>> +     status = acpi_evaluate_object_typed(ACPI_HANDLE(dev), "_DSD", NULL,
>>                                            &buf, ACPI_TYPE_PACKAGE);
>>        if (ACPI_FAILURE(status)) {
>> -             dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
>> +             dev_err(dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
>>                        acpi_format_exception(status));
>>                return -ENODEV;
>>        }
>> @@ -142,7 +142,7 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>>        guid = &dsd->package.elements[0];
>>        mailbox_package = &dsd->package.elements[1];
>>        if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
>> -             dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
>> +             dev_err(dev, "Invalid hsmp _DSD table data\n");
>>                ret = -EINVAL;
>>                goto free_buf;
>>        }
>> @@ -192,14 +192,14 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
>>        return ret;
>>   }
>>
>> -static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
>> +static int hsmp_read_acpi_crs(struct hsmp_socket *sock, struct device *dev)
>>   {
>>        acpi_status status;
>>
>> -     status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
>> +     status = acpi_walk_resources(ACPI_HANDLE(dev), METHOD_NAME__CRS,
>>                                     hsmp_resource, sock);
>>        if (ACPI_FAILURE(status)) {
>> -             dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
>> +             dev_err(dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
>>                        acpi_format_exception(status));
>>                return -EINVAL;
>>        }
>> @@ -207,10 +207,10 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
>>                return -EINVAL;
>>
>>        /* The mapped region should be un-cached */
>> -     sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
>> +     sock->virt_base_addr = devm_ioremap_uc(dev, sock->mbinfo.base_addr,
>>                                               sock->mbinfo.size);
>>        if (!sock->virt_base_addr) {
>> -             dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
>> +             dev_err(dev, "Failed to ioremap MP1 base address\n");
>>                return -ENOMEM;
>>        }
>>
>> @@ -232,12 +232,12 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>>        dev_set_drvdata(dev, sock);
>>
>>        /* Read MP1 base address from CRS method */
>> -     ret = hsmp_read_acpi_crs(sock);
>> +     ret = hsmp_read_acpi_crs(sock, dev);
>>        if (ret)
>>                return ret;
>>
>>        /* Read mailbox offsets from DSD table */
>> -     return hsmp_read_acpi_dsd(sock);
>> +     return hsmp_read_acpi_dsd(sock, dev);
> 
> It would probably make more sense to have the arguments other way around
> (dev, sock) in both of these calls as dev is "complete" and we're still
> filling sock at this point.
> 
Thanks I will fix this.

Ilpo, could you please confirm whether patches 0001 and 0002 have 
already been accepted in the maintainer branch, or if I should resubmit 
them as v2 along with patches 0003 and 0004 ?

> --
>   i.
> 

