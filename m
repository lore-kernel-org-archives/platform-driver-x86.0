Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD98156968;
	Tue,  7 Jan 2025 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736284707; cv=fail; b=kK6S7W/3fIadfMbX6BRIoWcykMnHNdCCIBQ26BZTYgOSuilKReoJ7llwZKhOaO2BXX85BYaU5GHxhbR2A2gYM4UCCf+zbFG+qRCTXn/OiF4mEUfTYO3uEHAjneCneZb2ld8d7dc+GsCe4ULdqYiQJFRdcTm+0ueFaG7xx8QBtCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736284707; c=relaxed/simple;
	bh=As2uAmCB+SbIN8RB22DYMMdgi4TuVQco85Ybv/agv5Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BkPblAwBquexps0QVSaJVTPBKzNiqmOXcbi656sDFMTgRWV2PWKn4QA1u/Vag79R9R6ygXtYCoJGjznV5+TCgtGAvJHQuKD0c3dl8sJ+9i1uGHxmzyjeMLkvPu34+y71Q/ttf7fVp+h+B8Y3Xs/SP3zK/gwcUSso1S8PgfZqXGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OxmQvz0V; arc=fail smtp.client-ip=40.107.92.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OxmQvz0V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rm1tYhPzW/Unh9x9FGRlZbXjXUW4fD/rzKaIzdAv8+N61HA0Rght22ipb4ynovRsqhlyjjsg+mz65k3yEtdeJ2LFTkGUsskuL8nc2PgppgfJxci2KCAIouVRjwoUQ0fKd5U4HvVUolZl+lUYx9T33t+AZE255jGDlS5HHyPyTqF27KbkwwC9yINsg1J/rMfcC3zJhgekmgllpZcLOzpB3vmqRmdg2gfP0Uxrc5dFvTyOLP7+q8yn/uZAxtLBXF5NWX4Lgi+EsnmXTopD5GOSvot9X+gMul0/4Nd1o6RwfBgM4n2BMb2c22vix5Y2t0uK5GgyoVcHDdKJvPwOjBME8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPPiI6d6vkzLYBsHYh6jbJFh20DMrR7VXGx5UPND2dk=;
 b=NXYfzpqKNlywI0bfy7wyY6yqsy0PmPhIMWRm2odm4jQSxrWWFleyiWqmGDLnBRCeTzUVPg9wVvUoMUp8MKazuuYArKGJzbXPow6K7gWlJpls/CSvwa4oiKaqOWCRlmtvHB7a/fyHbzQeaRF47mjDhcESe3lql+t0drcFPSPJQYkS0fXveImorcm2Gst3NPoMcxrZFn9Lef7Sjw31JK+BSArzGH6lHCFps4TX9UV4OdktkH++9iZnKrqcXOzWSKOIwfOajkZr2TyvWLuUEIUTeR0swwI01MBYHA8/swQfw3fbMdONqxdMe8wVcNsfJOWssfUJVRPOVIEkVeD+mUHLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPPiI6d6vkzLYBsHYh6jbJFh20DMrR7VXGx5UPND2dk=;
 b=OxmQvz0Vbv5Snt8ptELvbslsNAKnkoNRA1okVcN/1TmxQWKoGBpJBnsbTj+Rfsoz5WH+kGeeXkYm6aUVt0TzwcJu/oMqpe48rLIadzIznTbeR584MqwH912b7bL1lBNir7zuMU5XHe4biw7KPYTfXtfj7uw8/n4wZvQ6jLgSlws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:18:23 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:18:23 +0000
Message-ID: <1f5b77f3-c427-496e-9c1d-3150177f29d6@amd.com>
Date: Tue, 7 Jan 2025 15:18:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joshua Grisham <josh@joshuagrisham.com>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
 <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
 <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com>
 <88ae2335-86dd-4cb2-8e20-88973a8e28b7@t-8ch.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <88ae2335-86dd-4cb2-8e20-88973a8e28b7@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0051.namprd05.prod.outlook.com
 (2603:10b6:803:41::28) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: f08cc344-88d8-45ff-5e98-08dd2f60d13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXlPdTJrSkdJZ0hUUWZ6REZVSThLZVJ3YW01SnRscEVVYWJnVlBSRVgrbXRw?=
 =?utf-8?B?eHRBUk5TamxURzFyZUV2NmtrQ3laellrcWFOTmozVStOUDYwL2FMUWNKZity?=
 =?utf-8?B?SmFTSEZ2VXFvak9LUWNCWTI4dVN4elhTZlFvdWRzeDBRaXJuNW5CYzlZaXN3?=
 =?utf-8?B?bytPalZkeU1ReEc3LzFKWVExTGFVU2E4anR3UFE3RzRKVU1MQ2ZTSWdCU3h5?=
 =?utf-8?B?cTVVcno5SVVRbmZjeVhwOUM1bjl6SDhpUkFkNTc3Vi9PY1NOUjZrNS9DTW5l?=
 =?utf-8?B?dW42ellscmY0Sy8wNjJzOFFoejFoYm0zRG5LajdYTlZERVRIK0x3dHkyMVd5?=
 =?utf-8?B?RGNScjlKdHpJNStHb2NRRitoaGV1VmE0VzVqVENYc3pUbFV6K1dITTJhaS92?=
 =?utf-8?B?bXF3SVdGcTRzcjRzMHdrUjVLYlBLdWFLdFdRc3JxbHhuYzFuZTFlTllNN3E3?=
 =?utf-8?B?ODZ6d29POVFxUitVeXlYbmlXV3o2QTVRZ1JHQ09ZaWo5ZE9Gc0lZTVQraVh2?=
 =?utf-8?B?Qi92OEo0THlCOHhsaklseEZoT0JVZkEzUlpkK1pJWDhrb1RFcEJ1V3BQdnZk?=
 =?utf-8?B?MXlPL0NURHhrbmdDUkhJdGF2b01Obk45cWV5aUUveGZ0Rjcrci9idUtEd2cy?=
 =?utf-8?B?T1g2ZDdsaVdMbk80bzlpbnViUURwOFJuV09LMThZRHhYaU5GNGNXUHFWTGcz?=
 =?utf-8?B?RnpiajlFdGNVdU53NG0wQUhQTVhHQk1WVkE1d2NXZ1BaSWZrU3FHYUtaY0kw?=
 =?utf-8?B?TGNhS01CRGJVM1M3azdiT2lPTWxDWEk3ZmJLdExISmp2UldvS0pWaTFuVVkr?=
 =?utf-8?B?U2Y1SzkwdEpudU1KVWRtTlFLRTZVbkRnYlRqeVQweGYxM0d4K096eEJlYkhz?=
 =?utf-8?B?OURUaXc5UVJramJhZXY3d20zQWRIRzFrK2VydUh6a20zWnRyNWJhb0VCdyt3?=
 =?utf-8?B?WjlBdVdiKzI3Wk5JTEt2bUFMbi93Ujc2eWljUmRVeFZvaDJFalFxckxVVDZF?=
 =?utf-8?B?SGxvY3RWRjRjeVR6UG4vcWtwNVZOMEFCQzhOZlU1VnFwY0V6MkdaYmN5amlU?=
 =?utf-8?B?SksvNjlRU3ZpQjdCdVY4UmRQaG00WnQ1bCs0clE1ZjFTeFM2QStwYW0xOFpR?=
 =?utf-8?B?NjBqZzNNbDdtQnYxczBXT0J2OENnQnJ6cEdSbkI0eEl3bjFNWVVwZUpYWklE?=
 =?utf-8?B?dG5LQmREZWRrUXV6SThsUS9xb0lNVDJLTnhJUXNTenhYOUc5YXJNbThoaEZs?=
 =?utf-8?B?eC9jblFtbmFhTU9MUWs5TVJzeFR5MEZxc0VUVXlDR3hLMHFoOEZHSm1RNnl5?=
 =?utf-8?B?WlBaU2ZmSXJTVnAydzZBV2hORDZ6Si82bFZpcnVOVk9RSW1hVFpKenI3OEhK?=
 =?utf-8?B?QUxkVU9HOEM3Z0FxUDVTMmJZSVNvcGxZUmxmMkh3VXVYcmsybkJtWVZTMTY5?=
 =?utf-8?B?b1hrUkR4WGVITW14L0VxQTl6MXVESWhrNnIvQXIyQ1VFbGc3Q0JBV2V6aTln?=
 =?utf-8?B?TUlGYi9KaGFhWndSN3ovVVlaVWFORUJnUmc4S0NEVW9KQ0Q4MTRrbFNpa2k2?=
 =?utf-8?B?U0YxWUdNUWFmTitQWjJzRXlMU2I3SXlLUEtRVkpML1NjTjZxSkVWMHJ2aWRl?=
 =?utf-8?B?VEdUbW5Qc0JaMlA1b1M2NFRvbERKMjBvajN0SGdENjVzbWJ1SFhRbEVWQ0s2?=
 =?utf-8?B?NmVCV0p3MnB5R3M4NXBTcUxPR3ZGVkR0S1hqalJleUMwc1R4dDNWL1U4b1lY?=
 =?utf-8?B?K0hNOW44RGoyKzNIL2JTMGdtemhFSzJHYldZaVkvU1ltQUcvdXVOSW1nN1Rs?=
 =?utf-8?B?U0ZNZ1ZFSHhzWkNyL1l1NElsSlR1SzhibDRIbVBicUJ3cHFabUNjY1VWcVBD?=
 =?utf-8?Q?P7jVpSWS6CLzu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxqd0FiVlF4QjlWTHliZjNWQmFzLzcya3ZpNFNOaU10bnV5UTdXbkcxOXhO?=
 =?utf-8?B?UWpSb1NOOG1NTDk1elp2d29PY3VTMFRqWkwvYTdNT1FkUWM1aG9WVG1wNHBE?=
 =?utf-8?B?aTVKdTVwYWFIa1prL1JhM0lVeDR4Ui9YaE5qY1piWlpPbWh1TWtuZGxZd1Zr?=
 =?utf-8?B?d3JBVFNTN0hQMkNKTm1sNkJlQ0JZZWlNWXJuR3pLNnREaVJqd1h6UklXQzhS?=
 =?utf-8?B?cTIveHFBeVhZY2RlVkliL3lYcGZycnk5cDhNQWh3eUQ5SFlkRDdIb0FWaG1X?=
 =?utf-8?B?aldYcURFNTJmQTN3V3Bna1o0TjVib0hWWjV3aFovN28xSW5KeUhtMWVMZFJL?=
 =?utf-8?B?dTNIV3FMdE1ycnRFcnRHNUFJTSs2RnVIMXM4SUlRa0MvMGpMMy8zdEJoVkFH?=
 =?utf-8?B?TkRlcXhacm1TTlJZZnRreDZ2dXZTYXFscXZMYnBuTWNybWE1MFJaWU5jVmVG?=
 =?utf-8?B?R3ZsYU5mTlV0U2hpYXJZUFhiM1hWeWN2TUtEaWN6YjNESGx0R1ZiMk5BVFdR?=
 =?utf-8?B?eFZ2SWhHbUxEeTVJdUlickQvOElqZTJDQWZIaDZnYjcwU0MvM3pKVDZBbkRO?=
 =?utf-8?B?czE5ckxveGs5ZnRoOE1td0JCOWRTalBWczhsOVpIYkswNXpXSnZlbWpQTU9H?=
 =?utf-8?B?Yk1rVmFzZHdJUE9sOGNxRzZoVDdvQnRYRW9pRmdSTzV3ZENjd3JpWXFuSmRq?=
 =?utf-8?B?MnBETzg4Y3NVMXhaMTl3MXIyRGVwU3FDd2h2NFp3SGtlYzhUbmJsS1RNMGds?=
 =?utf-8?B?VWJXc0h2RlNpT0NHMG5lZFU2VFZMdnRkQ3lqZm43T3hLdnpmY2lKM1hOOHRM?=
 =?utf-8?B?MDN4NmxWT2VaZnZYdkN3aE9oWEh5QjNKZmdDNzRLK0xaVWRQRFpBVzZ0eita?=
 =?utf-8?B?QUdHY2dNZ0ZkRTR0MzlQMkxaaGR0QUJ1SEhCTnZWeTNMOVNBei9iZlpJRXpj?=
 =?utf-8?B?dDR1bERhdTE0dnptbjVDdDZ4Vm9VdUsrdGRCN1JhUjlCV2JTRDFacVdUVTVF?=
 =?utf-8?B?cytuRGhUQkVZbHUwOUZ2L1ZhZEI0UjJpelV2bGFxY1pNWUZDT1pmMm9mcm0w?=
 =?utf-8?B?M0VleEtJZHdVR3NRTFNnb0tXZGJxZHhuWVU4WllNaU9zYURndXdIWTliMzdB?=
 =?utf-8?B?dTNGODBTV1VFNWNnaFJHMHdIcDRMSDN6QS9LczlOYXM0TjN2djJvbTZnT0sr?=
 =?utf-8?B?aVBxMjZ1eTF1WUxRSld3VkdaOWdNdStuZjNsUUZUVUFyeEZLaDVGbUczZHdM?=
 =?utf-8?B?VE1sM1pONWtCR0phNUhESWMzZ3RqVy80Y2U0TUlzdlpkZTlPK1Nhelc0L0tI?=
 =?utf-8?B?ZWFjQ2ZqZnFna256L2ZoZWxxKy9BT1paTW9TU1hrUlJ1TkQzMTg4Zk94Vkxl?=
 =?utf-8?B?Q3RoSUlhQlJGYmhwRlZRU2ZSN3Yyb056SFNjUDV6U21TUTd6d1hqN2ZHSmpr?=
 =?utf-8?B?RndrN3VNdnhUb2dzN1ZwdUhTQWNkSk5EUHh5QWxtNnYzNERIeDh0NThuQ2FH?=
 =?utf-8?B?NU1jbVEvbkJMd09DQ3hYS0N2Y3FxTGRWWDlZN1NtNmlET3FnTW1Oc0JYOUxR?=
 =?utf-8?B?cThPMXgwVmtjUlJJL3FKajBkWC85TDVEYnJCaDhBUWU5Mk9YY2NFYVZGNUFT?=
 =?utf-8?B?dXFDd2hnYUtkenlYK2crUEcra0E4ZVcvQkJIWXhJS0RyOS9ueitkZTNSdnZk?=
 =?utf-8?B?dEh4b2pYNkYrdU5EQVAyb2V1YVA0MEI2S09VTkFMVzlacXJ1a0lCZzBXZU5F?=
 =?utf-8?B?MmsrT0hiNkZSK2FjNCtteDZwT3hzdDBkKzRoZjVBZ2FMeGwybk1XQkx2Y2FZ?=
 =?utf-8?B?MDNnRDB4VGFqdEdabUdRdWczSkRpelp6UWZoRGRYbTQ5YXpISkZ5SlRST1Jk?=
 =?utf-8?B?K0pqem1sbDZjSEZBNmhrWG5CYjd6dWZ3VWt0enFHcDRWVjY1U004bzZzUmov?=
 =?utf-8?B?YWJEaldVSUtGRU1vcW5OcHkrZFRhL3AySk04NlQrVHBZdVlqNWhKSjZjckhD?=
 =?utf-8?B?bFcvZkIvK213WVJXR1ZYRVF0Vm5hdUdyTWZkckVhV21QTWlLNmhHRXJBRjUw?=
 =?utf-8?B?NHpoZTF2b2tZK2syK0Y4eDBLQm5odGQ5RHcvd2FQWWdRM1dSWVdrM0cyVWRr?=
 =?utf-8?Q?URXsbWn7g5juRNGssubwOEIYO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08cc344-88d8-45ff-5e98-08dd2f60d13a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:18:23.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yViJF412BmqW3EIWI1ZLRM9x9olpbNvm5BVPbzTKmYyd42o/j/YH3chlfM7Q+0jtUY1umIU4vjyBj9F1l3vkSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

On 1/7/2025 14:50, Thomas Weißschuh wrote:
> On 2025-01-07 13:29:08-0600, Mario Limonciello wrote:
>> On 1/7/2025 11:05, Thomas Weißschuh wrote:
>>> The driver showcases the use of the new subsystem API.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> ---
>>>    drivers/platform/x86/Kconfig                    | 12 ++++
>>>    drivers/platform/x86/Makefile                   |  1 +
>>>    drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++++++++++++++++++
>>>    3 files changed, 91 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f07074944d6c42dc204fc8825a42 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-tablets/Kconfig"
>>>    config FW_ATTR_CLASS
>>>    	tristate
>>> +config FW_ATTR_TEST
>>> +	tristate "Firmware attribute test driver"
>>> +	select FW_ATTR_CLASS
>>> +	help
>>> +	  This driver provides a test user of the firmware attribute subsystem.
>>> +
>>> +	  An instance is created at /sys/class/firmware-attributes/test/
>>> +	  container various example attributes.
>>> +
>>> +	  To compile this driver as a module, choose M here: the module
>>> +	  will be called firmware_attributes_test.
>>> +
>>
>> I think if you're going to be introducing a test driver it should be
>> compliant to what's in sysfs-class-firmware-attributes so that when it's
>> inevitably copy/pasted we end up with higher quality drivers.
>>
>> That is you need at a minimum 'type', 'current_value', 'default_value',
>> 'display_name' and 'display_name_language_code'.  Then individual types
>> employ additional requirements.
>>
>> I see 'type', 'current_value', and 'default_value, but I don't see
>> 'display_name' or 'display_name_language_code' here.
>>
>> Furthermore as this is a "string" attribute you're supposed to also have a
>> "max_length" and "min_length".
> 
> Agreed that more examples are better.
> 
> But are these attributes really mandatory?
 > "This attribute is mandatory" is only specified for "type" and> 
"current_value".

Ah wow, I had thought they were, but you're right they're not!

> While "possible_values" certainly looks necessary for "enumeration",
> "min_length" for "strings" does so much less.

Even if they're not mandatory, I think it's better to include them for 
the same copy/paste reason I mentioned though.
