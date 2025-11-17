Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91792322A3E;
	Mon, 17 Nov 2025 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763416728; cv=fail; b=klUbCKLSTEq/fP7f3WMhPrAOVVGQiXR5r5caUWO0rUoA57SzEhKMt7NF4MZG2k3ns4mujIe0X50rDksZNSBNRpHiMKQ27SRusT0AtitCHN7ZcEcvgOk/HyRO3PdqwNdI82adYbxEk5OQyC9F60GbkCorbvXpwjIEYQDHpFD8Nw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763416728; c=relaxed/simple;
	bh=LZp6t6tf/1Yn+5A7NM5L1fp+gqlnc/4MeIHnO+stRUw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LpySACbipn0uwApJ6qf+xFtiNLnEPZdztAeoLrMlilkAGvWJwlwi8BvyHZQKVLOkVSsAiCMSZuQGnbPs0GYqfUQyINVzPXdkYPUCgqKmc4QVUFIrYVxCxs5xJGi8PbemhFJ0fNvhaMrdHi2lZ+3GvLgOJemfnlxiEqt9z6gW4cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iRvEfMJH; arc=fail smtp.client-ip=40.107.209.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iRvEfMJH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFcND0CD8X/6E6qxFkSWuRZAfvbI6gTceTkNEovtpGr9YtNJIe1EG6F5xC92svJYwh2ix7PdaImbIPMulLxjUMz+Au8vfpUOjPl8GVJGXD001pmv4NuIu+zTs51r/piA5LHmsVE8a0Cq2ZenBPlyVBC4wKBMbUNfmpN8dVUVs8J5kkeUcBgDf5+i88WsbwshwUVMgKSORGYEJgL/LDUK8BVRPkH/0WyOQ8vt82hglIivylnE1xjbGHnx0Iw+v0kVO+HE4HkUd5lrcTTm+xRb38FUIDqbQg+p3DQBiDXaW7xpG3abCZhnbct6uHewEZP56tkWedbdPx/2gqX3NtPtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxklPPWbZdqxRF7mvVvWuUI6hZ7HciIIG0EB5cbJTY4=;
 b=IN1p/Ofq93JQYEb++Cc1zSIYxE4Bt4mPbk1KoZN5ffNVydr6s2rNSTnNk0OTJ0Rlm05of/Gp0Y+9b7siBXmxD+9aEkN7IE8diqNCWu0TtSNlzte/Sw3ptwKVkDEjeXa4GFxJpPir2pWEbuP1EllJZTJpDqGA9GQT8Cy6oSVXlMkeWgXNH1TZaEbuN7SMl08L8QirWajvtdIRsS1qaJ8+3aqUWmkUjdhCxIkEktDnBHmnaQXWeHIMVAV5LWsZvR1bzaLaZpGRAcqjhSVTF3iS3d/3O04w/FvyHV9wW5+9YphsUEa1sbYEOcg/UHojEO7zsPSspFCpFmPnOpZGZLGtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxklPPWbZdqxRF7mvVvWuUI6hZ7HciIIG0EB5cbJTY4=;
 b=iRvEfMJHRVq/v19Z0899GhKCMCyJs+9VoQJv7rPY4KHV2/I5BG3i+lOfO58D7V0DGYgJveFM0pLRineV2i+ENNEkb1n2kwdZXUuueG4O2SqNX31P6xeaklT7tc0xcfPE0YD/QE7EFRzmIm/F7Gx71yXt3O0Ie2DvQ/WnuVSXQ9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6370.namprd12.prod.outlook.com (2603:10b6:930:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 21:58:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 21:58:40 +0000
Message-ID: <3da451d6-d57b-4b6b-8d24-9fd77924e777@amd.com>
Date: Mon, 17 Nov 2025 15:58:37 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: remove unsafe CPU cores
 unsafe interface
To: luke@ljones.dev, Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com,
 Denis Benato <benato.denis96@gmail.com>
References: <20251115145158.1172210-1-denis.benato@linux.dev>
 <A7906040-D491-4D34-969E-64E172FA9126@ljones.dev>
 <957ff0c9-8f97-48fc-9425-895fd55da42e@linux.dev>
 <BA46EF01-8952-4FAF-B2C8-F7AC734C4C3E@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <BA46EF01-8952-4FAF-B2C8-F7AC734C4C3E@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:223::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d563ae9-0fee-4276-8977-08de2624778d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3N4dTRaTk44ZHFrMWJlV0w2bUhZOVVESXV6d3VVNk1ZKzZSU01RMjlybUhY?=
 =?utf-8?B?UjNjdmlGeCtINUNPUmZvM2krcGpGYkcrcU9iZ3p3anpISWtsbDZCUkpwL0Nz?=
 =?utf-8?B?RERIZnVLdVdtcGZ4S3ZuWEhXVXk4UndHQko1OVhwMHFZcXkzWGFxMVJmMzBn?=
 =?utf-8?B?eHc1SHoremJHVURwcUQ2MnRZWDdaSG5LczFZdzFLSkRXKzVXaktSN2JzMTkz?=
 =?utf-8?B?Ymh2YWIvNHZ2QmsvdGVtMEtPZTd5MVE2MXMxZWU2c0k3YUNkUWhmdHVZdE5s?=
 =?utf-8?B?NU5HUWZPcjNIT0ROVldRbXNid1lWNmthdmZxMVM5UGQ3NXJTZEVneXBDT3VS?=
 =?utf-8?B?Y2Q0MmtJVzJyQURCelU5V0czMHhpVmNxMGJDY0laTlNFeTgwZU1DMzVDZGhk?=
 =?utf-8?B?S09ISkFhKzRuQXJxVGdTNHhVdE94TURQWnZ2RXBEbTZ5dEI2MnlrdlpFUzZP?=
 =?utf-8?B?cTk3UFJqSmZ1NVNsWkQvaTFoTGJibzZ4dTNJRndMQmcxQmE3TWxmVm9CS0tT?=
 =?utf-8?B?NDZHWFdKUU5PSmYyempETVpyekEyUjB5bGZBUDlQTjdLT2F5dTBleXhKZUp6?=
 =?utf-8?B?SlNnOFY5UVNQVlNNc2Rpczlxc2NmaXVDRENEZDI3RWV1M3gwNEdBbDdCRGpy?=
 =?utf-8?B?VFVxUE9VajljbjExK3Y3Zm9PM1hlNTg0NEZHV3lzWElZaWMxN3BEais3dW40?=
 =?utf-8?B?SGxLSTBFMWQyQnduczRUczZPNVpRbkxpdTdBUmtQeUJjM3BFa0RldC9TcGhO?=
 =?utf-8?B?RlZnckttQVFVUnBSSU1LaXdIVGZIR0dGcVBmMjJiK2MzWkpTTG8rVkFvREFY?=
 =?utf-8?B?S2dYNFFwQjZuenBEb3piOFllbUM0YmRXSGo1eWNuZ0xjVTEzbFA4aDVwVzBa?=
 =?utf-8?B?SzZwUjE5T3RQSzllaU44bmZQcmFkRVp3Q3FvSGZGdis5UytQT2JuWmFRK2dS?=
 =?utf-8?B?Nnc1cUVEUkFXZnhVc2l2SlVBSGdPdlNya3ZzcU5uR0wyZ2t4WlJ5Qm51Nk5a?=
 =?utf-8?B?U2xhZk1wRWYxY294QmdIdTE1YVdKaWVrT0Z2MEhncFpiYWU5RytvcUdBWGdK?=
 =?utf-8?B?dHpYMHRuQ1RkbVBnblgzNmVVbmw5OFF3MlQxaVBtNklTNUF1MFlFYUFOVVVo?=
 =?utf-8?B?RnpKY1lBVnRzZmhQWjBXMXRJcVh1U0Q5Z2VEc1d4QzJxUXQvK1pzbSttUnFw?=
 =?utf-8?B?SzVycUs5VDFMYkR2MStaTkdoc1poU0dXVDhLazhiRE5Rc1RjMEpncjBJeC9Z?=
 =?utf-8?B?N1RVYUlGVmExd3NXbjBnek9tUmRPcmVuVGJhVTZVaEllMVp0aEtkWlFVWkpR?=
 =?utf-8?B?TXoxcW0vWjNsOGUvRG5rRS9CQ0tycFNSandpRlVyVzVoZGoxd25XWUpDYWJu?=
 =?utf-8?B?YVpQSi9BY1hlbSttT001c2RRT0RuUmJ0UHhRN1JVbVlGeCtFdVhpdEdlejk3?=
 =?utf-8?B?K3IxMWJ2K2hsWDcrTEVwYkJUTm4yaW8vVnZYcWhMaHlzMzZFV3RNeFduUXoy?=
 =?utf-8?B?VFMxcG05N2VoK25xNW12MlZiWmhnYUpXbnJNM2NSdEVBQ2RZZ0JRbU8vWTR0?=
 =?utf-8?B?eFpXUzJKUHdJOGxKNGZWOGlGK2V2OHhFUXZLc0ZEMjlXYTFqNjJCNFQ0VnEr?=
 =?utf-8?B?UE1ERHgxbCtlcEIzbzU3djZPMzFKZGNSTlM0R0JLOE5GaW0vVHFlWnh2bWpK?=
 =?utf-8?B?aWZ5SExqMmlvdFBJZ2lONGQ5bDhaTzFxYll6UzlSYzFoN2Qrcjg2aitscWov?=
 =?utf-8?B?YkpENk5JYVFFWWJ0TFd2d1lOZlZpRHpMZ0ExUk9wc0JRcE9oZk11NWhBZ1lQ?=
 =?utf-8?B?MTFwdXhKZEh6cWhoSDBhK1JVZzZKVUNJUlVieU5OMUp6L0lPZXJ4VzJrekh3?=
 =?utf-8?B?RERVc3EySUdWRHhJb2IyYmlrYVZBRWhnSlFsanNuN0c0U0ZYYWdqUGRBY01Q?=
 =?utf-8?B?Rk5oZk5qM3RoTlh5YmZ6cWs1SGNMeUdOVDA4UStzQU5pYzN3VEI5bjB6clkr?=
 =?utf-8?B?M0RhRE5MUDlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um1pMGZpS0V1elN5d1VSQWlxb2UrdXIxcVA1UlA1Z2ZpVU5TQklsOE0rSFNF?=
 =?utf-8?B?d1JrTWk2TmRGajZjY0JQNFVWc3VpNWFoNmlENjJua0p6anQxTmdWODdyWTY3?=
 =?utf-8?B?SnF6MTJjQ2hLdW5UR2gzNUpLdkhQOTRpcU12MmI3TVpHU09Hcy82UFNWNllN?=
 =?utf-8?B?QXB5Mk5wcmVaRVU5SURsSFl4WCtZNGZlckN1N0M0OU1qaWRWa1A5Tm9odmJV?=
 =?utf-8?B?Ky9CYmtaM0duekFEWG1MR0JRVHlDN2M5UEVOUGlkWTBOcGZFME1xVU1aMWth?=
 =?utf-8?B?cldKZkRGa3dmVGxYNTJ1ZkxwRVo0ZVExWk9Ibzc1UU9ydU9vOGRBOUo1RS9y?=
 =?utf-8?B?Yzd2YUhYd0IzNEJTZkx4TkhCQzdvdE1jZXVWd29uaWdVeHBxdzVnV0hpOVB3?=
 =?utf-8?B?VlVWY0FHSHBKZCtTc2IxNmM1SGJ6U3B3aCtRUTFtVHNKVHBMa1o5QTRqVlRF?=
 =?utf-8?B?WXllVmpHUDRUaXZyOGc0ZmNJa3Q1WFY0eFdWMzBNSjRORXZZcnhZV1BsU1Iw?=
 =?utf-8?B?R0ZUNlBvM1RxU3ZiemtycW1YTnFhcHdaVFRtNk91TGR3YTBLd0cwbG5IU1pJ?=
 =?utf-8?B?RFk5R05YZS84TTN3WFNrRkphK1I4bWd5dE5jbzE2WmxDc1FLOHh3enlVRHNu?=
 =?utf-8?B?ODFvSHZwQ1VUTnhHdlE0akRmbkxFbkxHNGw2R1VPVnVDUWdwR0kyTlZaTWtE?=
 =?utf-8?B?eDNOVHdWZXpWVnhjemREVTNsVGorMzVmYXlna2JYQ1hlb1FZcDJIaHcydi85?=
 =?utf-8?B?d3FKcXBKQ202VFd6ZXpJY3V5ZTU3WGZoViswMzN2YncvV0NkVEQ5VlZVSGlB?=
 =?utf-8?B?d3cySUZiT3gyYXAxWFBCOGxUeTBlVkhMbldHVzF1RjYwT0JIbnl6OWJsRXNk?=
 =?utf-8?B?eWtuMG9xU1p4NWFSRjNkU1UrWXB5MkxUV0t3MlFRZmJwQmdBM1hYRkxIRUpP?=
 =?utf-8?B?SFVZSkpOYTF1Zy9Scno3a0ZOM3BCQm5VY2dsdno2Mk5nREZRMFMwT0ZUOUc5?=
 =?utf-8?B?emVFK3QwTFhIK1pBQjNjTVRRb01ONVZnSUZMdjlTZE9mSVk2Wmo5T1hMWjA3?=
 =?utf-8?B?aTYxSkdTeFFiemxaNzJ5VDFvOGFhS2NJc1dnWUxDeDA0eDMyamlrSTM5am1n?=
 =?utf-8?B?dDdtUFA2dFBpdFlBbHlxZzM1aVorNmNjQjlxckQ1aS9JUXoxdFdLTmowNm9s?=
 =?utf-8?B?OVgrenh0ME13cDBueVV6WjFhQzZaTXYvQUpZcXhNT0o1dXM2cXZUZkRjdXdJ?=
 =?utf-8?B?ZW1YWXo3eUJvaGxiTEhRVldsOFRpSXFTdVczNlN0dEhwMVNZVm5HNmRsY0x2?=
 =?utf-8?B?U09qcTM1aTdRM1F0YjlEbllnWVpldnRGcmhJLzg5ZHRqcUgvZVNUelB2eEIr?=
 =?utf-8?B?b2VSUzdodDJBaHZZcTZuOG9INDZkUVVjMGVsZWVBYnBHNk85RWlWUEFZTDgx?=
 =?utf-8?B?aVo0L2FueXRZYVdSdXZxVXBaeENMaEZMclJJUnVuWDRrcnYxSS9RY0lFOHRt?=
 =?utf-8?B?TVRUcVZJR3VtZkdMZ21aTWxwWTlzR0VJSXAwOWlrb2k4U1FFUmh5aEFUU05D?=
 =?utf-8?B?SlB5R01jUi9VamcrVWNwN044SW94VThkUzlkVi90aE03USsrNU9XcGUwWVlw?=
 =?utf-8?B?Vjk0YmV4T0hyZVdEelEySGkvWUxNeWNjNUlXaUh2U3B2eFBXajV0ZUVWUWsr?=
 =?utf-8?B?WUh0RlAyZHJwSVVpUzM4MkpSWmFpL2NiWlFrZVA5ZjU3dlZta0JaVWY2ZVlw?=
 =?utf-8?B?YXFwMTdteUx0dXJ0Q1IyKzlTeW5yQ2h3SEt5eENYZW5oSVprZnVzU3dHL3FM?=
 =?utf-8?B?U3p6R3FHSVdoNjVuQkpvUjQybFlBOXlicnBwaytRaDFTbnZSYVQ1V3VVMU5N?=
 =?utf-8?B?cXIzQUVXd3EwZm01QjRIbnorelh3L1IvSzZBT3NiV0VaTk5qZzIvdHAxUW5t?=
 =?utf-8?B?NjlzUm5sdXhDZlU2ZjhIc3JsUXFtZFhkOVlKbFBMbTV1dXR0RFZ6bzJGSDI3?=
 =?utf-8?B?VTV3SnNPVitOYkh4Q0xNeWc4ZDRnU3ppRGwvWjQzenArekhWMzRsc2dvYkI5?=
 =?utf-8?B?NWhRZmN0clpqTGEzSG1rYS9obHJEZ0gwMlcvdEF0MmRiQzNJcFc1RmVUa3px?=
 =?utf-8?Q?1x+1Gvg+RatFHROm+PbQyalim?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d563ae9-0fee-4276-8977-08de2624778d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 21:58:40.0774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2/NOxCBzklZhMe46wTawb6p7+uOpZg/AfQuLqk0vBgEDTvao90t0bq0ttgchv1LsryDtvoNSB1eWibi/QrcuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6370



On 11/17/2025 3:50 PM, luke@ljones.dev wrote:
> 
>> On 18 Nov 2025, at 07:47, Denis Benato <denis.benato@linux.dev> wrote:
>>
>>
>> On 11/17/25 05:27, luke@ljones.dev wrote:
>>>> On 16 Nov 2025, at 03:51, Denis Benato <denis.benato@linux.dev> wrote:
>>>>
>>>> CPU cores unsafe interface is known to be problematic and recently new
>>>> hardware that is using it in an incompatible way was released, therefore
>>>> remove this interface to avoid any present and future risks.
>>>>
>>>> Link: https://lore.kernel.org/all/018ce202-420c-40c9-a089-b3509c7ee4bd@gmail.com
>>> I’ll copy/paste my response to other thread here:
>>>
>>> I spent a long time debating this myself. Never liked it tbh (the implementation or the actual setting).
>>> It seems that at least making it RO so that if a user changes the settings using the BIOS controls for it, it can at least be tracked in userspace and not lead to confusion might be the best option. It only needs to show the values then - no min/max or other parts required.
>> I haven't considered the mixed usage of windows/linux,
>> perhaps we can rely on the BIOS to change the core count, but
>> thinking more about this considering:
>> - the user-facing interface is correct
>> - this interface is unsafe only when writing
>> - it must not prevent the rest of the attributes to function
> 
> As I no-longer have horse in this race the outcome doesn’t actually affect me.
> I raise the point merely because I am still familiar with many parts of the driver
> and the reversing of much of the WMI interfaces plus the interaction between
> Windows and Linux.
> 
> In general, if a WMI interface setting requires reboot to change (which means
> It is stored across boots), or is generally stored and retained across boots then
> I very very strongly suggest those be exposed in Linux driver so they can be
> tracked in userspace. I’ve had more than a few users complain about something
> That was changed in Windows which then caused unexpected effect in Linux
> and then because it was not visible in Linux anywhere it was rather difficult to
> determine what changed.
> 
>>> This setting is independent to the AMD version and if BIOS changes it, it may lead to a lot of confusion between this plus the official AMD setting.
>>> If users dual boot at all and use the armoury crate to control this, then that app will use the WMI methods. Again leading to confusion in Linux environment. This is actually the main reason I implemented it first time around and it was initially a read-only attribute.
>>>
>>> Do what is best for users and maintenance and safety. At least make it RO at a minimum.
>> I think I will propose to make the _store compile-time disabled behind a config that can't be enabled.
>>
>> This way the code is kept and I can work on it and users will get the RO version
>> until we are very happy with the attribute write.
> 
> I would strongly suggest RO, permanently. The write method could be
> documented in a comment block for reference with a note about why RO
> is default (I mean how it’s written, not the function itself).
> 
> Perhaps if the read core count is differing to the maximum a kernel warning
> could be emitted so it gets logged and potential future bug reports about
> cores catch it early.
> 
> This *is* going to rely on BIOS continuing to expose the core selection or
> dual boot so Windows can change it. Do also talk to Sergei over at ghelper
> about this - he gets a *much* wider range of users and testing due to being
> Windows focused.
> 
>>
>> This also has the benefit of not removing the code that was just merged
>> hopefully making things easier for everybody.
> 
> You can remove the write parts fine in a new patch version if agreed on.
> 
>>
>> To proceed I will fuse [1] after integrating Mario's suggestions to the
>> making it RO, unless someone isn't opposed for some reason.
>>
> 
> Mario I do hope you agree with my assessment on this. Making this attribute RO
> would at least prevent a great deal of confusion thanks to ASUS quirks and also
> allow the stripping out of a chunk of now redundant code. This way it defers to
> the preferred AMD methods, but exposes if the WMI method was used in a dual
> boot scenario.
> 


I don't see a problem with it being read-only, but please make sure it's 
not critical path for driver init if it's read-only.

IE:
* If any part of it (reading interfaces, counts not matching, etc) fail 
then show a debug message, not an error/warning.
* Hide attributes unless the interface for reading works.

Then you shouldn't need to qualify anything against any system.

We also should keep in mind that Armin has plans for a WMI MOF parser in 
the future in the kernel.  I anticipate this is going to expose this 
interface again as writable.

It sounds like it's a year or two out, but WHEN that comes in we should 
make sure that the design at that time prevents people from using this 
for a 🦶 🔫 too.
