Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8602D7D59;
	Tue, 26 May 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789580; cv=fail; b=B6LaEbWef33tb5EvkH8pRM0wUsVioCI33F3jmO+fVCHOL35WkfO1Cw2sVM3CozgyKTtM2dCKu/8aMEBk89I/WDPsYReobrrJRFVElkGdahfLIi9rzt/4ebCh+M2RDwVRxuCpzQCMXwQkmJQ9OwjKhzULTaatUL51jz+5+yOtWW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789580; c=relaxed/simple;
	bh=THEFxaF67n4kSFpAcwxZmwQ107hI2i4CfljWfh+mvyc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EOKVoblyNHMDD+MIUOOZb7/Tbgjx8ujxLuJoTOt6FVock9ooyEb6Jdm5sp8VN3fTAl0ypy6wEqgVVZdPsNhSO0rdUvJ6SQcIFBa5xMBQa5QcPyXZBbjoEZnRUmNVDiSf1kn9eSn0Js+Mwx8xabRCNCvGUVWtg4QvqFyknxprzYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LpOm7ggy; arc=fail smtp.client-ip=40.107.200.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LpOm7ggy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+jWFzXdoAkWHOlPwqZztXDfAxJCPWUkxrbk/38Br5aCu7ItpHYWY2IAR8+IcZNiMgXOuwQ3sxubQPC6p9Un0mIp7o5k0AQIhnrayo9wWATz1fOHZyuvVb56BgDL9hiei6pFM9xG4qFCwavLL82QXsymloiuSmQGfAqnaMRvCBSXsGVCAraFHplBf54Y3SUrp+ayK89L32JLAivAXzL2cz8WEvAFjqWq5Th/9GDWhuegUCUrI1UNcOxDoBae4ek5sv17FXg6AdE6/2z43gZPjMyOZOypTS0HZahsxNBfxtSqQqZ5wIa7msJuYHgRfGLYFfu7a85zH65R2Zwh4igBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7gfc5D2PM2CeaPFf9Pyy9X5BAu8tYaOItvdekUpZUU=;
 b=FXdWWE0PWR3yI4JobkMSXVvIa+Pi0GeSrZVdJjgunSxOvOQl2Y/FmKQlbs7LrUDG/G1ndI7NbzbBrtXMiGkklgVi5Cvc7JSjQliUPdk2oalCmIiu5U3ZrIgFM484q82QU+7o9lnVb54ddkII9Sg1Z9JJ6i9tvvQLdDRTQRleNJyejYywHD+LigLB2juZl0xNp648EoKIzStlheMRMUJUXXBlqNvgiPs2U2zz+PDSFspHWFe72j02DzyDwvauwpAn4Yj7UuQ8UfnpKa/H5ak7hqKGdzAHFaDEaNBWaxVhLzTD0CXimuDC31IUyi0fT/wekV4Eh/k4dOnjRoXPocZejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7gfc5D2PM2CeaPFf9Pyy9X5BAu8tYaOItvdekUpZUU=;
 b=LpOm7ggyS1KYPVU+nAY6ZGFJA8R4N4r1A6DecY2YYnVqZlXigQ8oj+KLb/DPTmBQiSiIO51AB18+KRBpq0GKW2rEyyAjXJvy9SmQoRdBTemkksIULg9qzZe+p4qy4m0ainn6xwvt/wHTmrJBiWr6t5763Ty96d0RXiVl5zrwqS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:59:33 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 09:59:33 +0000
Message-ID: <23d24aff-a18b-4b77-8035-b875a186d981@amd.com>
Date: Tue, 26 May 2026 15:29:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] platform/x86/amd/hsmp: Drop ACPI sysfs metrics_bin
 in favour of the IOCTL
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
 <20260517151211.415627-7-muralidhara.mk@amd.com>
 <a290bd3e-365f-8fd4-239c-846197a03853@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <a290bd3e-365f-8fd4-239c-846197a03853@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0183.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::13) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 2baa6845-6bc2-44ad-7c3b-08debb0d7c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|11063799006|3023799007|4143699003|5023799004|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+vK4mhj0F4LpYsz5c9oWS9gXpWCgEEZs965I+ZB8HmsbMylkluH4VHowCEsdTiCcI2khskZdgm2PmHuFM1QR24xpnIVdyxo9ZdGXVn6hft990JH7X5aRYNoq3JtGSimArzr1mgNZ0PSNPHBcuCmlQ1f5CigE8H2fSnevADW0mA4MQ3hgrGIg4dMjjPxWAR1tCZte12QgOvrrQZmCpbu2e4oUD3ocgDGgxadmsL0TMk4KfHwWMOTMEH1kDMZtv5Wg6Ik/ox06zfjm4PvTgjZ0wGzLjMvCVYMaaDyV+TPpva5SUTX3vTtnnBStEaAp+DSbQNYZuPGwNYR5nTw0FCdt2SUy4hfIGA/obpAVmUlQskUQa1ivnaUrPx5o+6a+4IE1pEsg0b7b6hXhSHYrr4vyaOnU7M1q99JEvKRRRlpXxN4eA1kNS2SNvikKOlrjd7bszjvCcwuQr6/7Ca8vKrd/QU0G6sRNLTjr34YoOtvHPimLXpegjZiI0wlXNFxV2PDPCmP7Y89voVDqie7XdqsYsuj3vFrO5A5sIW7L1yIeNLlH3D7N0PFaQOFaNXriGOKK5hfAsnDpRbNJQ5Geb4lFqkObgsUmP7thks9Y/Hzjvoqf5oHxTb9GHZnoQeJyzQGWMD8q8EnJmh4xXoV7nXzagKTS5GxomqDw2ixHsv3w4L1KwI2SSBhL+8foijp3AN5f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(11063799006)(3023799007)(4143699003)(5023799004)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlJOTmRIK0xZaktseXIwSUEyNlZPQWRkUkQxNEhsclFGNHNNUTk1OVA5UWJ4?=
 =?utf-8?B?bnNhZmcxazNEQWxsWkVrSmI4ZjlyV09zVE1pN01CTEdkamh6QlFpVzhUUDhB?=
 =?utf-8?B?K3RqTmtvMEd1SVlqbDh6ODhPVm90TnhWVDJIWjZMU2dXUVV4eE5MTU41eDlR?=
 =?utf-8?B?VlBhMWUxTmJZZTh1U1cwNVZnYWUwZTRqRU94UDZPTno1VkhxNU03eVViQzVk?=
 =?utf-8?B?OTN6Z3pWUlFXbXdRRWt5cm9qb2hycU5GTHVuMVY2QSs0NG5VS05DMHB5Nnpo?=
 =?utf-8?B?WWtuVXYwRTRocFpOTVF1MW5SeUdFSE5uZ3FQK1pmelFIeXBwdndldk5vT1Ir?=
 =?utf-8?B?TUgycTQwRzZJV1d3dGlmeVJtYzloTThSTFdQNXJQeUIrVFZLQlNoUmo1WlVX?=
 =?utf-8?B?VTArbEY0ckx3NUEwU3k5d2ZKYy8yUGJ5YWZGNDBUUlI3UkZHL0p1WWtCZ1FL?=
 =?utf-8?B?OHFINThrTXF5bWtlVGZibkxxaW5ua2RCUHI2aDIrM1ZIUGFNa0pESlg4S3JB?=
 =?utf-8?B?Q1NCUVBDWWhyWlV6SjltOHBKWERxQ29NUU0yOWh5d3ZpY1VGZFVGckNKbDVK?=
 =?utf-8?B?YU14MzJCYndwRklTRWRIL1pFK2tLTytzaXFjNlI1aFZWMDc3UEQ5YmhZM1F5?=
 =?utf-8?B?WlJWU0VSYXlNTUIxU2h5L3k4NVVES2syb21qZ0pEMWhUSkNkR1RIUGNpUUpB?=
 =?utf-8?B?NkxueVhHZ1cyaVJvTXZsTzd2ZVZSR2lRWmJQWWRodXQxR2M3YmszOWVZWlN6?=
 =?utf-8?B?SXFOOUZlbGVyRGxDdWd0NUdYNHMyenQxcE5BcmdMS2Q4K0E5bWRLSkZQajlG?=
 =?utf-8?B?S2RKSnB3S3lUSENITVRQUU1XdFpIWlZaWGg4RHB5cWpzTVNQSFhlK3VPQyth?=
 =?utf-8?B?N2pJaG1TRTdxZTNyVWdYbUpYK05Icks0K2FHWUVaVVN1WHF0SVdaQnRsdEJ2?=
 =?utf-8?B?bU8yczh5bzlMODZ0Rk5jYVcvZW5BQ05YMkpHU01yOEFRcEZ0V2JRdEZBdEJn?=
 =?utf-8?B?aTJ4bEVRT3ZTMmd4cm9oZm1DMHNIQThDYzZQZ1ZZclRKa1RDWWJvNE40WWVH?=
 =?utf-8?B?UlZEbGo2eWx1Z0JCcCs0RDhqTzBqRHhDWGRYTEhwR2Rwd3krZmptTFk1Z0lY?=
 =?utf-8?B?aXQxTE9nRW93QVFBUWZxTHVJaFU2ajdDWXdDdXJHU3I3blIwRkNtV3Y5VVpN?=
 =?utf-8?B?TzBxd2djOFJZT3VwcjhGN1JhMVRZajhPdFFYLzN2dzFJVVM5ZGxnSXozMm1S?=
 =?utf-8?B?eWNOUlE4ZjN4VjVKMkFucmxLbk90ZHJvL05QSTlTa1UwdE9nVFAzb3NNeEtI?=
 =?utf-8?B?NVMwWjlPL0FnanI1U3hjNFU5eTR5Vms2eHhjRUkrNmNmZ2pkTDhhbWpVRkUz?=
 =?utf-8?B?VTVSQjlKMW5mTXM0RDJHeHNsMkF4WGlvNVlQSWlkUDdaS2dBQjNJaVVuNWdQ?=
 =?utf-8?B?VExHb0V0OTNBWDkvMlA3TUxDWktMTWVwaHBMU1VxdGM2V096KysrWHdvcVBn?=
 =?utf-8?B?djd6Y0FjOERjZXJRZ1R6OHJ6VWhKcy9xdzRSc3V3eWlDTkFDVFgyTkgrcS9U?=
 =?utf-8?B?UmtDVDRUdHQxVGRsekRDVUZ0eUtiRHJCNk1PVktZVkZxdVZtWGROWHZKQmow?=
 =?utf-8?B?cEVDbUZGNElxVXR1N1VabmNTVGk0VmRxcXlNY2xnb2Rka2U2VkFldGM2YVJD?=
 =?utf-8?B?VFUvQTE5bDVrTzVVZUZEVzlWUE1iMG1WU0Q4Ukp6d1QxYlE3R3pOdytLT05n?=
 =?utf-8?B?aGwweGx1b0dob0lPRithck9SYnEzSzk1Z0Z5MDNBMmFoRzVST1NkRkNaaldp?=
 =?utf-8?B?UnR4bS8xY1hOd0JkM3VjT0Y4SGZZd0pFZkNKT0o1VXVxUksvTUM1SjQ5dW1a?=
 =?utf-8?B?cC9uNFRINjNpQmlvWmlpK29jRk5ZSUZ0V29vTElXZFM2T0RsVys4aUV4Uzgv?=
 =?utf-8?B?ekhDanRBNUkwdTNDSmJJWkhTUmtLMzNENzViUmMrUk91RjFXNVFEb3V3SnZN?=
 =?utf-8?B?ZDhFcmxoMncrNkNwVmF1U2RiYU5yR3VyTU9UT2FrM2orSUlzOGhGdkNFMnBG?=
 =?utf-8?B?Q1FoY2tjT2lrNlBibXFBV0R2NHVUVzdqNEJtRG4rdDRsNUUvNWQ3OEZLb3o2?=
 =?utf-8?B?cUZ4b1Bmb0xyR0lnWGNGMy9VK3gxWjY1YUQ0NlpkUnl4R3ZaNGtpcEs4dkxW?=
 =?utf-8?B?SXpmTnB1S0hyWEJDOXovWjJDb3BpcmhwMDJXUUtaZDFkOWcvRUtVUkJlOXRB?=
 =?utf-8?B?blNiODMvb0laSmZQVWx6akFaYTlJUmFjTG9ScFhLVzFmWDQ3ZzgvSWJxUkZx?=
 =?utf-8?B?bjlMNzl3YTg2aWg0cG9DYWRmekovQzJLM1dCQ1YraCtSZ2RHbDhjdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2baa6845-6bc2-44ad-7c3b-08debb0d7c49
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:59:32.9121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utk/M3fTgwfDkJ4TcOCZ87NjD6/HZye/xCpCSV6EbIVwEpowf2q4EwzIDERqFhiMivSjKKaXUApSXNerw+6hpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179



On 5/22/2026 5:14 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Sun, 17 May 2026, Muralidhara M K wrote:
> 
>> The HSMP_IOCTL_GET_TELEMETRY_DATA character-device ioctl introduced in
>> the previous patch is now the canonical interface for reading the
>> metric table on the ACPI driver path.  Unlike the metrics_bin sysfs
>> binary attribute, the ioctl is not constrained by PAGE_SIZE, so it
>> works for the ~13 KB hsmp_metric_table_zen6 layout
> 
> This was only a secondary reason from moving away from sysfs files? The
> main cause for moving to misc device according to my impression was that
> you wanted to prevent partial reads which are always possible with files.
> 
Sure I will update the changelog to document the rationale for moving 
away from sysfs files.

>> used on Family 1Ah
>> Model 50h-5Fh as well as for the existing hsmp_metric_table layout
>> used on protocol version 6.
> 
> 
> 
>> Drop the metrics_bin bin_attribute from the ACPI hsmp_attr_grp.
> 
>> Widen the remaining proto_ver gate in init_acpi() from
>> '== HSMP_PROTO_VER6' to '>= HSMP_PROTO_VER6' so
>> hsmp_get_tbl_dram_base() is invoked on protocol version 7
>> (Family 1Ah Model 50h-5Fh) and any future protocol version that
>> retains a compatible per-socket metric table.  This populates
>> sock->metric_tbl_addr and hsmp_pdev.hsmp_table_size, which the ioctl
>> handler requires.
> 
> These are two logically separate changes so they should not be in the same
> patch (but you'll likely need to alter the drop patch anyway, see below).
> 
Ya Understood. I will make this change as a separate patch.

>> This is an ABI change for users of the ACPI driver:
>> /sys/bus/platform/devices/AMDI0097:*/metrics_bin no longer exists.
>> Userspace must read telemetry through the HSMP_IOCTL_GET_TELEMETRY_DATA
>> ioctl on /dev/hsmp instead, sizing its buffer using the matching UAPI
>> metric table struct.
> 
> I might not be entirely following what's the extent of removal here but it
> looks too extensive to me. The number 1 rule is that we cannot take away
> existing and working ABI without properly deprecating it first.
> 
> You don't have to make it work with version 7 and can return error in
> that case as it has never worked. But with version 6, things shouls be
> left as is until properly deprecated. You may consider adding a warning
> print too to warn about the deprecation and point towards the new way.
> 
I will review and ensure that an appropriate error is returned if sysfs 
is not supported for a particular version.

> This interface probably never was documented in Documentation/ABI where
> such deprecations are usually marked... oh well, maybe we need to add
> a simple entry for this ABI there to follow the usual deprecation path.
> 
> --
>   i.
> 
>> The non-ACPI plat.c path is intentionally left
>> unchanged: it covers Family 1Ah Model 0h-Fh hardware that is fixed at
>> protocol version 6, and its per-socket metrics_bin remains available
>> for existing userspace tooling on those systems.
>>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>> Changes:
>> v1->v3: Remove bin attributes
>>
>>   drivers/platform/x86/amd/hsmp/acpi.c | 34 +---------------------------
>>   1 file changed, 1 insertion(+), 33 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 97ed71593bdf..49765fefe1fb 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -231,25 +231,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>>        return hsmp_read_acpi_dsd(sock);
>>   }
>>
>> -static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
>> -                                      const struct bin_attribute *bin_attr, char *buf,
>> -                                      loff_t off, size_t count)
>> -{
>> -     struct device *dev = container_of(kobj, struct device, kobj);
>> -     struct hsmp_socket *sock = dev_get_drvdata(dev);
>> -
>> -     return hsmp_metric_tbl_read(sock, buf, count);
>> -}
>> -
>> -static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>> -                                      const struct bin_attribute *battr, int id)
>> -{
>> -     if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
>> -             return battr->attr.mode;
>> -
>> -     return 0;
>> -}
>> -
>>   static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>>                                             struct attribute *attr, int id)
>>   {
>> @@ -491,7 +472,7 @@ static int init_acpi(struct device *dev)
>>                return ret;
>>        }
>>
>> -     if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
>> +     if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>>                ret = hsmp_get_tbl_dram_base(sock_ind);
>>                if (ret)
>>                        dev_info(dev, "Failed to init metric table\n");
>> @@ -506,17 +487,6 @@ static int init_acpi(struct device *dev)
>>        return 0;
>>   }
>>
>> -static const struct bin_attribute  hsmp_metric_tbl_attr = {
>> -     .attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
>> -     .read = hsmp_metric_tbl_acpi_read,
>> -     .size = sizeof(struct hsmp_metric_table),
>> -};
>> -
>> -static const struct bin_attribute *hsmp_attr_list[] = {
>> -     &hsmp_metric_tbl_attr,
>> -     NULL
>> -};
>> -
>>   #define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)  \
>>   static struct hsmp_sys_attr hattr_##_name = {                \
>>        .dattr = __ATTR(_name, _mode, _show, NULL),     \
>> @@ -559,9 +529,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
>>   };
>>
>>   static const struct attribute_group hsmp_attr_grp = {
>> -     .bin_attrs = hsmp_attr_list,
>>        .attrs = hsmp_dev_attr_list,
>> -     .is_bin_visible = hsmp_is_sock_attr_visible,
>>        .is_visible = hsmp_is_sock_dev_attr_visible,
>>   };
>>
>>

