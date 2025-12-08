Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C81534EC
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Dec 2025 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765222289; cv=fail; b=F/aM0JEQg9pl7zNujjtV7Fl99/7Kodzv+/F0kTPBnM0l6Cv2B2L/Q0FxpU0D9KNdoGrArqJWFtgHs1jtn4UD2fgIzXM45Btc/M0I6AUc3Kb0ZmPnRonKgleS9n3aHLadIXdlodP+duWA4gz51UbO3DUZktPPNED2X2bL3iKk9jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765222289; c=relaxed/simple;
	bh=E3h1seWQvq6zRx9rbUe8n5XJWkp02QVnzr3JWdONbjA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EBHV9H67QX/a0qOIb3hpZoxRN0L4HaQW31woGsLDpXCJ9gHv2i8G+yVMQy4M5eV8DeFjqf6jHnaGtIpJZNKlsZwEBRvtniKr5wP6dvNXAC/tl4rsjXMZoisnmrREVIfVTaDLVGT7SXlbScVKj05rpH8GZdC/5TcEZdS1uZ5Xp5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HHWej7qp; arc=fail smtp.client-ip=40.93.194.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HHWej7qp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5M5Vx4YojUY/2rFms4JFtYZxgBPuQCvtp417CRwGXmtjn1RX5vFN9QcJaZV4noT5yQOlmizP6vp/MS9+vjAX06+Ab6mv8De8UlTOMkvkzKToiPSL19aUxRbPgo3ywInBG08jIhgkHbB6q9hd+ExGRrM5Ia78LD0YLWoC2Nqv6doQkWZ/WY67kgdFkNcxVDzdnkLc2uAnARAvV5qdyVFUqj5oxOr6pMLxbFyErfVYyE3uHxpTc+Mo5xgnGHsiQ/7F2KhBxWHdc8n9+/39sTtDsBOPq/fdb7x93z9x72I2ATiTSmP1iCQFZrNaV78c5BbK4J2W6+zOb0aUZ/BJ10mKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCcQZ5taY3CRffRmmbhUSEE1lueJbz/FxLgC8iU8vZ4=;
 b=wM4a77PCIu0ViNG9OfFNE7ldb5kv7f9mrz/13t555iFvpzMn7JsTVoSrQkxT7VE40vVLMGTTOjTpOtIFX6tgrbmxgIcWURv9HxnSKbeYW8rxvubS8c2KzAmxsgHODDd7Gpx6ZMjY9gAyaI2JekHVHWdEFW6BU27nTIwcOjtMzGA/jwx9AGcUG68TGuMBIFdykD3i64UiGDxVNTxAoKvgpaX8Ijd96KU3NtknWyg0RsMeXzHiI8hriQUq6qQefu9wFRFnOrgglguE2oQ/fsKwQOHf+5qAoyE5E0SaO6Y52kh80G462ytHvbq2kyzHIiAi0GR9Gv0c+W3g4Dq2CeAZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCcQZ5taY3CRffRmmbhUSEE1lueJbz/FxLgC8iU8vZ4=;
 b=HHWej7qp93fldwbXitX/Vnm9YJlNN1LTilivg4Hg+RxsyrvD3eK001UUT3zwHANwM6yfV5vDdgYbraWvXL7siqZ6uiab7R0fn9T+Qx51GeVjL4n/2bnEfypzFxu2Wke5xS+hkqaz0VvanrYFgS3WnsIVB4DT1CTg8cyV8ekcNZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 19:31:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 19:31:23 +0000
Message-ID: <8184d299-e223-4acd-b0b8-01463675b8fb@amd.com>
Date: Mon, 8 Dec 2025 13:31:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] AMD PMC causes system hang on suspend (HP EliteBook X G1a,
 Strix Point)
To: CX MAIL <mailcx@pm.me>
Cc: "Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <93e7ZGFEiN1SZoCHCVwqctZPrrUmJUlz9NHui4lh4glOm8PYaanRann4m0T9jeq3LwD8mICbSiCw9-COSfmMcDoGNN83VHkK-3wj-PUmfNo=@pm.me>
 <60b09100-fe58-4330-b5dd-707eabf8f5ff@amd.com>
 <_coqLqv0F7WEy-Y31rFUYSagGjuaEVB6-xIARLfhAn0nr4_1ELo_38YthlyZA6Ou1mKAcoDCKIBYZ8foICKeyaEAmUjIYBiTDCfeWCtjpYA=@pm.me>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <_coqLqv0F7WEy-Y31rFUYSagGjuaEVB6-xIARLfhAn0nr4_1ELo_38YthlyZA6Ou1mKAcoDCKIBYZ8foICKeyaEAmUjIYBiTDCfeWCtjpYA=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:806:d0::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: e650ee3f-6cd1-48f0-6e52-08de36905f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmNoRjFYWElwbEJ0bmJOemJvWm12Z0FVd2ROa2c1WDJZck1WL2x2Z08yeEhk?=
 =?utf-8?B?bldvUHJkRkhEOGJ6bzFoMGNDRW15L05vYlQ1YlRsTEdCU0tmWWNLaFJiVkoz?=
 =?utf-8?B?RTBXckN4cTFWNkZKRFlyZm8vQkpEM1RUQ3JDR0hqRjVHazBYcVBJYmlqM3lo?=
 =?utf-8?B?TCsrK3BKd3ZLWUdqU0M2NTMvQmM0MDdJcitCRUk1dG9GbkU0aVFRQk9EbjAw?=
 =?utf-8?B?M2J1TlpRYk9GTkh3ZkgzcGI1d0tNUnBnbW52ZjZ5Q3oyWTRvZFgwRGJMT3g5?=
 =?utf-8?B?UElGSnljQ2hZQ2N2c0ZsOFppRjlQTTZHcC9CYlNhWmU0TXBVZURiQlhJUTRj?=
 =?utf-8?B?UWh2d280UUtONFcwN3hEa3pnK3lpMXYrWXpiWktNbEtUc1NSbHltOTF3SVNl?=
 =?utf-8?B?VXpzYzBCeklhUFJ3YlhZaXFqRnFjU21sclRweVJGbkhiUHhDbmpXZUhKMlpm?=
 =?utf-8?B?ZEsvQzduWFlNa3dYK3B2Z3ZPWjMvcmJDVjY2dks0YVA5QjJ1NjA1WHlYRzBv?=
 =?utf-8?B?YWJsUEdkbHN5eGJjZzNlQS9IMG5IdG0zcTNyWldlbEJ2VlJFVjFjeE81bmhY?=
 =?utf-8?B?UlVlUVhqZ0ZzbE1OcXJOMEt3dDk2NlNOaERLN1l6Q0o3NVZhNStHTXdiZUFD?=
 =?utf-8?B?blRNa1lWSmZmaTZyck9LUk8zSmV4bkd5U2dhVlRlSWZpU2orQTRkbTNIVDNC?=
 =?utf-8?B?bE9PS1M0WjFYekVEaGZtQmZxcUZ2eWx2dGNHcnY3V01YZE1LZnk5TFJGa2Jj?=
 =?utf-8?B?NlNRYWNCVHpOL2JIenI3cW84WG5lWThvbmpIbkZDbUJUbnI1VVcxcCtXSHpW?=
 =?utf-8?B?d3ZZdFZBcHFoaGYzNm13NTY4bSt6WEhOeVNOcEtCTHpqSGRKei9lZCtlQzZW?=
 =?utf-8?B?MGlKRElNWXE1QlMwVDQzcXZlZ1p3RFl4cG9YUTFxWlJYNGRFTVJXRk40MDRT?=
 =?utf-8?B?NDA2NXBTakUxd0RXZjJOMFZmMGFkUC9RcVkrWlY4ZUI5dXFhZGJhckV3QU5y?=
 =?utf-8?B?THIyVVFMa3AzdkNCdWg0L28zRmRPeVBIY3c0d3doRlpDbFQ5WTFrbGkvWFZC?=
 =?utf-8?B?Qm9mQ2U0TGdPYm9Id2hlYWROSmZCM1E5dklNOENlRHhFQUhjSWl5T0U2ZVB5?=
 =?utf-8?B?cmhTVE8wamVHRDY0US9EdTVYenFGVlUydnlmUFZ6YWFjUkk2MzlNb0RqYUlG?=
 =?utf-8?B?b1hJbHdaWjNYUzd1QUFaMzZJWGFVSEl2QXdVZ0VTZXFkN0JxeXE4RThOSXJB?=
 =?utf-8?B?Z3B0R2M4RDRJcklDVnIvZThJVUtKTHl2UkxkcUtNdGwxeWMrcy9uUXJzQm9s?=
 =?utf-8?B?dkRxUXlxOUZweXN3Zlh3WjV5RXl2dXhMU1IxY1V4bGpGMThDeWowMUhMM3F2?=
 =?utf-8?B?dkczbVEwbS9WSXhCemZYTmlFNnNWMFFiWG9pL0JyZTMrU1Y0ZW9uZ1c5MmNl?=
 =?utf-8?B?RlphWFJYMGZRcjQzNFJlMVFZUUNaN3M4MXdwMnlZWStwS1FZWE5rYk1kbkc5?=
 =?utf-8?B?Y2hpMHpNSjFKTXpJVm1NaC95WjhYUExteWNWdXJoSFJQcm1ONUl3YmxHRjZ5?=
 =?utf-8?B?UDNqSzVXdEFZSUFGb1haWERLUmFUSFJ5U2pQdDZ6VkdPYzNJZGphalhtYzRn?=
 =?utf-8?B?aEZHNnlJU1pVWnNVTjh2ZWdqQzFLbElnSldiU1BXak8wTGZNTWx4aGhOSktm?=
 =?utf-8?B?aWtYcUZYR3crcmpXVStPbDcwdXIwbG5sdjRLNEwrM0FoOHhHa2tQMGJUY0lO?=
 =?utf-8?B?T1JNUG9oZ0ZjZjNRb2t2LzhtT2FwcUZNazlGQkp5ZisyKzhiUlRFazQ4dDQz?=
 =?utf-8?B?ZEtJVVNlTlBkTDVmOFRZTTFRZ2dGM25ndmNWSW1HZ0w2Q3E0SENEOGhVTkdt?=
 =?utf-8?B?WTBKYXA2VjlqcFJUb3NSbFpocXZla3BTZzVUSHpxeTg4a1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0RIOExrdndwWWRQaVFYczVPTEJINzEyOWF6OXNmQ0FOaXd6QUpCVDZrMDF2?=
 =?utf-8?B?MmwrY3lMeCs2dUJ1K1Z6a0tNU0ZmZlYvMWd3L1Z1eFo0Z251dTc5K2dnRmlr?=
 =?utf-8?B?dW16Q1ZmOURETTJxQ1hRdVllVFNIR1BFN3VMVENlWTFndldlNDVRVFMxZ1BX?=
 =?utf-8?B?Y2NoQlU4ejcyK005bS9DQU1UUHZXSUdCeVU3N1VzeU9iSFZtMFQrYmhDS0Z5?=
 =?utf-8?B?bGJIK2p2YVZidEtMWFVWNmlGSlVOaHhmZFN1QSt1Wll4Y3FNZjBybW5xcEdo?=
 =?utf-8?B?aTNZcG4ydEJxckhmMmNTQ2VwYk1ZM2VneHkvYTc0Zjh4R3loWWZQd1F2aGds?=
 =?utf-8?B?eVRMUFFKK1JRNGNIRGh5YnVvVWJTZW9uV3BISXFJejJZUnJ4THVCRE5jVVhD?=
 =?utf-8?B?K1YzdkVzRU9vY2U0R3ZrYlNuQmpPQlNXZ1hoNkN0Q29NdlUwMlZRQXhVaFpO?=
 =?utf-8?B?VW1zV3dqelpQaGRwb3JIaXhMMWNlb0tOSXowS0IxYVZNTVdWNU42dUZrWUhj?=
 =?utf-8?B?MXZKZE51RTFjMkxZREozdHg1TnMzRXNKdmNyOXBYdzRkaHlNM0VaV2k5NmFZ?=
 =?utf-8?B?ZXJyeXB0MGlqSEIwRkgzalZ4QzhBT0ViSzVxWTNzRGhpc1R3M2NlUTJMY3Vt?=
 =?utf-8?B?MlNCclBWWUFVVFRVSUkvcGhFajVOdG5ybkpTNVc3MWtkRTd4T1E1bExnV2U2?=
 =?utf-8?B?NGpFaFRQV1Fzdzk3b0FQSkd4YzBhSWxyaHNCbDMzTC94L3pKZ1c5UGhxcVZ4?=
 =?utf-8?B?WGlmVEM4MnhrZ2RyNTZ3VnowRjdEVDZnZ2RhakJQaEJyR3JiNWZ0SWdHbVZm?=
 =?utf-8?B?T0RmeGhRakhISDk4eFpoODU5Nk1GWENWWVQ0ZlloWHJCOTl0bXQ5Q2VpU0Rj?=
 =?utf-8?B?TEFZMzNsUzdXUHd2OEZpSndyU2thaWw5S2RvVUd3SUE3NUZYYXc4RnpWMzFk?=
 =?utf-8?B?K3RmOVVabUxjQm1wRUI2VG42aFc3cm9VQzI3aVBvSVJZb2ZBQXhnWFVEb1ky?=
 =?utf-8?B?U3JxQk8zT2FJVDZWcjQreVlnbGZSaVIrV0NyOFhWdVE1VCtHczN0aVFYZ0ls?=
 =?utf-8?B?NngvWlYxZGNtdHJVTC9FMlAwdS8rck9iSW14QTFSSktCc0pacFE0M3EyVURC?=
 =?utf-8?B?YVg4OHVNK1Q0UTUzK3Q4UXlSWExCRHZmaHh2N24rU0xCd25rNTkzbFhwdnFk?=
 =?utf-8?B?dElLZEg4eEZrSDVYeWphdGNGTkV2TnBzaDN4VzV2WktUemU0eGNBRjJ3azlF?=
 =?utf-8?B?RHpWbjlpTTBtQThmbktvZ2tsQzFzdnhuWUwzNVZWcVFUSUtCdnZWU1BOMzhr?=
 =?utf-8?B?VG9oNENka05HTXdiS1llZmlLR0N4RmtFTGVNaHF3bHBmU1llZUdyTk03Nzg4?=
 =?utf-8?B?alo2ZWhVeEVpUEhmNi94R3dCZXZsT3JoYVpzb0lQa3VQVkJDY2JXK2tYaDdF?=
 =?utf-8?B?R2xkcGZFMjR2bEdMTXd4Z2ErRC9FeU1SRmJZeFRxc0M1MHlYeXI2VnBnN2tI?=
 =?utf-8?B?K0hCTTEwSzhZVjJlS3ljbGVmWFVCZnJ1R2xwOTkzRUhKaVJ6Y2pCZ1B2Vyt2?=
 =?utf-8?B?ZXpGUUNzdzgxK3BGbWk3TEN4UVRZcEtTeUQ1bFloUVMzdDVVN0tJdEZIQVA1?=
 =?utf-8?B?Y1pvMUFOY3BvbjZVa0Jzcmk5SVlEZFBlaHdySXJBS2NIMm9Semp3cmplOHB6?=
 =?utf-8?B?ZkVYQ2hkdlJpbWIzUVZhd1lXY0RvWXJDd2lidVFFZ3JJOUNnTmRZM1doWUtL?=
 =?utf-8?B?eGs3L3hUTmdVTEkxYWQxNm9pU3BaWnRCQXFmbTFuTVNBdEVNamVxODVvZE1M?=
 =?utf-8?B?ZkVBYllSc0F4REdZYTVqY1E5eEtnM3VyaVNpVlhYbXB5eW16bnVMcjNhOEN1?=
 =?utf-8?B?ZkNaSXAxbWZTc2ptbHpiSkdZd3JpSW4zWGU3Y1lDNHBRMjJYTUVSejYwOTVW?=
 =?utf-8?B?R1gwQWdzWVUvalFodVlDeHNqaDR2dTJKaTFvUG1xZWRoS0ozMFJ3R0xWcm1L?=
 =?utf-8?B?MmU5cVE1OStIaEg0bTNvUFRqWnZkTFJOSlBBNzYvQmI5c052dWNDSDg3ZEFU?=
 =?utf-8?B?STFWRmd4MzViM0pRYmx2SVRhenkyeDV4endzbTVGNUJTM1paTmJiV1pzaGJC?=
 =?utf-8?Q?1104yfEmDZVBd6jgAvlhNPHfX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e650ee3f-6cd1-48f0-6e52-08de36905f28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 19:31:23.4360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nML9xxPkhpHRBzWz8GwtAh+F0U9Y/NcfDqM2QI9rH1jzWeXDD/9DsGAT9FPU8f2Ul1VT0La44CotZGAl9SDwpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949



On 12/8/2025 1:22 PM, CX MAIL wrote:
> I have collected more logs with amd-debug-tools and created this issue on drm/freedesktop
> https://gitlab.freedesktop.org/drm/amd/-/issues/4767
> 

Thanks, will follow up with you there.

> I was able to run the script with --force despite the warnings below. I get the same symptom that system hangs before suspend entry.
> 
> Thanks,
> CX
> 
> ```
> Debugging script for s2idle on AMD systems
> 💻 HP HP EliteBook X G1a 14 inch Notebook Next Gen AI PC (103C_5336AN HP EliteBook)
> 🐧 Bazzite
> 🐧 Kernel 6.17.7-ba19.fc43.x86_64
> 🔋 Battery BAT0 (Hewlett-Packard Primary) is operating at 98.37% of design
> Checking prerequisites for s2idle
> ✅ Logs are provided via systemd
> ✅ AMD Ryzen AI 9 HX PRO 375 w/ Radeon 890M (family 1a model 24)
> ✅ ASPM policy set to 'default'
> ✅ SMT enabled
> ✅ LPS0 _DSM enabled
> ✅ ACPI FADT supports Low-power S0 idle
> ✅ PMC driver `amd_pmc` loaded (Program 11 Firmware 93.10.0)
> ✅ USB3 driver `xhci_hcd` bound to 0000:c3:00.4
> ✅ USB3 driver `xhci_hcd` bound to 0000:c5:00.0
> ✅ USB3 driver `xhci_hcd` bound to 0000:c5:00.3
> ✅ USB3 driver `xhci_hcd` bound to 0000:c5:00.4
> ✅ USB4 driver `thunderbolt` bound to 0000:c5:00.5
> ✅ USB4 driver `thunderbolt` bound to 0000:c5:00.6
> ✅ WLAN driver `mt7925e` bound to 0000:c2:00.0
> ✅ GPU driver `amdgpu` bound to 0000:c3:00.0
> ✅ System is configured for s2idle
> ✅ GPIO driver `pinctrl_amd` available
> ✅ PC6 and CC6 states are enabled
> ❌ IOMMU is misconfigured: missing MSFT0201 ACPI device
> ✅ RTC driver `rtc_cmos` configured to use CMOS alarm
> ❌ Kernel is tainted: 64
> Your system does not meet s2idle prerequisites!
> Explanations for your system
> 🚦 Device MSFT0201 missing from ACPI tables
>          The ACPI device {device} is required for suspend to work when the IOMMU is enabled.
>          Please check your BIOS settings and if configured correctly, report a bug to your system vendor.
> 
> For more information on this failure see:
>          https://gitlab.freedesktop.org/drm/amd/-/issues/3738#note_2667140
> 🚦 Kernel is tainted
>          A tainted kernel may exhibit unpredictable bugs that are difficult for this script to characterize.
>          If this is intended behavior run the tool with --force.
> 
> For more information on this failure see:
>          https://gitlab.freedesktop.org/drm/amd/-/issues/3089
> ```
> 
> 
> Sent with Proton Mail secure email.
> 
> On Wednesday, December 3rd, 2025 at 1:56 PM, Mario Limonciello <mario.limonciello@amd.com> wrote:
> 
>> On 12/3/25 11:28 AM, CX MAIL wrote:
>>
>>> Hello,
>>>
>>> I'm reporting a critical suspend issue on HP EliteBook X G1a with AMD Ryzen
>>> AI 9 HX 375 (Strix Point). The system completely hangs when entering s2idle
>>> with the AMD PMC driver loaded.
>>>
>>> Hardware:
>>> - Model: HP EliteBook X G1a 14 inch (Model 8D08)
>>> - CPU: AMD Ryzen AI 9 HX 375 (Strix Point)
>>> - GPU: Radeon 890M (integrated)
>>> - BIOS: X88 Ver. 01.03.11 (2025-09-03)
>>>
>>> Kernel: 6.17.7-ba19.fc43.x86_64 (Fedora-based)
>>> Current cmdline: bluetooth.disable_ertm=1 amdgpu.gpu_recovery=1 pcie_aspm=off
>>>
>>> Problem:
>>> When executing "systemctl suspend", the system enters s2idle but immediately
>>> hangs. The last kernel message is "PM: suspend entry (s2idle)" with no
>>> further output. System becomes completely unresponsive - keyboard, touchpad,
>>> and power button (short press) have no effect. Only hard power-off works.
>>>
>>> BIOS configuration:
>>> - APMF enabled
>>> - Modern Standby (s2idle only, S3 not supported by firmware)
>>> - /sys/power/mem_sleep: [s2idle]
>>>
>>> AMD PMC device present: /sys/bus/platform/devices/AMDI000A:00/
>>>
>>> Workaround:
>>> Adding "initcall_blacklist=amd_pmc_driver_init" to kernel cmdline prevents
>>> the AMD PMC driver from loading. With this workaround, s2idle works perfectly
>>> and the system resumes normally from suspend.
>>>
>>> Verification with workaround:
>>> - lsmod | grep amd_pmc: (no output - driver not loaded)
>>> - Suspend/resume cycle: successful
>>>
>>> Logs attached:
>>> 1. system-info.txt - detailed system information
>>> 2. suspend-fail.log - Journal from failed suspend attempt (hangs after
>>> "PM: suspend entry")
>>> 3. suspend-success.log - Journal from successful suspend/resume with
>>> workaround applied
>>>
>>> The failure log shows the system stops all output immediately after entering
>>> s2idle, suggesting the AMD PMC driver causes a hard hang during early
>>> platform suspend initialization.
>>>
>>> Please let me know if you need any additional debug information or would like
>>> me to test patches.
>>>
>>> Best regards,
>>> CX
>>
>>
>> Hi,
>>
>> Please use amd-s2idle from https://pypi.org/project/amd-debug-tools/ to
>> generate a report. It may root cause it for you. If it doesn't, please
>> attach it to a bugzilla or drm/freedesktop bug report and CC me.
>>
>> Thanks,

