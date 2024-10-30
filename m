Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408B91F4703
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730306342; cv=fail; b=E8KUgRznnBvg0mHsCJhJW0gMyoJ2Z4Kpsz2d3G4CMrX+NDHTSwRstT2LkRWAre8eU9m6JrwQiYY2FAAQZ2kjrilPrAafEpSU0aAxu+0FBqAMpiZwngNuSZZ9heuF4kD50152NCVPLne6qYbOI0Y/c9JT9JW2dEa/RzDll9AQGVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730306342; c=relaxed/simple;
	bh=SMCd6Q6f0OsnfnI33Po2WdLWT03Zbg1WOPLuA1GhOf0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q+DAHdx54wPQeFtd32t+IurNauZXCrVXcSUseVJrzdfugkPa3IJckgOpy+Ykbu3bSXmgzmr9t/OOdJ7wimdIcjZCwjZ6zPN/VBMGBF70HXLZSCcqEbHtypGAuDQYYgg7gRMw8eXJtYruAjLfZb/OGLunIkFabKw7i4q7R1praDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S7DlwfJr; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S7DlwfJr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5/i6O8upEhfCcIPkptf70lr3/SpDkdev37nZ995td34EXPF2E1fGKSu9FNaHJIR4US+jndySD9lXBzMYvveX1FE/6BbzJmPXhiFSoC/MYVpRr4tQx5pYRLAtLMbU3RtO+eCpCrQ10FYdmgwDEuBPAD3kvw/QzFsKn/FxK9ZPax5t05QAHehR4boEjWDOB1cmFrWl0Q4wbGkg0mCuYKHonXgc60/FcuMLEOhDpmGlVjjKL2gDOflNc+aYpaHlQpMBpOgzkRUXUZOi4Zq2vQtnlq8NY1eM3/i23dzHO+2oOzIMYxrmA88G27gNQFnv2itWMF0fRoFvQfBXC9CNfyf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IeI575EXG2pylUsCCBznOcHnMAMmYn0wSGCsVr633s=;
 b=IHq2uUcM111h5TlnZmTOflxI63H66EBs50olTis7FMjyjRlBFFwGYrWyTphLK/Uj42lcYNUEDRO2RHcIdyXJY8bXyaceLRRPyGqcfXmeHva3EUbIWy2l8JixG4QU1clkJTHthPnfCRvGjU6dg1zf97/2fQtvQMlSfg4f2GQz+iNgUkH3e4jatSX+ifJYcEtkyHhDexMPPF3gArmmB505FrSYsutQtzY2FMJZ4DSsqEsK/3kpXVJhdjNb+EeRfxYkzaEXljii9tTjz+ex0BGa7Wgrg06HQ3CQoyzRCx+KXF24axbpuQWdfw3sqjd2g81qlv8qSO+otXlC1DJUAzcyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IeI575EXG2pylUsCCBznOcHnMAMmYn0wSGCsVr633s=;
 b=S7DlwfJrBZ2QyHGjy/w7DOzKK0AqQvHeVH7jepH2XeEG0JCAI0wHoE6onM16BTwuX/qNN6JOaqCv6jIh9Yv6fAKfmqVsic87LHSfr1K+9FfGhHONn3tfSWC5y7rkLYsIUguxdGyxmRdBbtkeByH+UjDLZCMfO3WdJHD9rzsz4G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 16:38:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 16:38:56 +0000
Message-ID: <db6acd29-8e66-4088-ac71-a5099c278405@amd.com>
Date: Wed, 30 Oct 2024 11:38:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
 <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
 <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com>
 <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com>
 <d7b8d58b-be23-179e-0618-9bcfc54b8d0b@linux.intel.com>
 <63ac59dd-a33b-4bc8-b35c-7bf9329351b7@redhat.com>
 <26109281-38a2-4166-b65d-b52dddceb542@amd.com>
 <0b1094af-fcf3-4df6-a8b7-9c05c3e20fd5@amd.com>
 <4060a47d-c05c-4b6c-b508-f3ae96a3829f@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <4060a47d-c05c-4b6c-b508-f3ae96a3829f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0005.namprd18.prod.outlook.com
 (2603:10b6:806:f3::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3d6eb1-c688-48f6-cb13-08dcf90158d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFNic1c4dUFiektYeENSMEFXb3pCRm9ZTUc4ZGxrZVBYU2xUdWZUdTh5VDlh?=
 =?utf-8?B?WHh5MHV2SHl4ejlYcnJUYUVvWWpkVW45NU9HUzUxcGI3UGk2dFpQMnByc05M?=
 =?utf-8?B?UjdvK3FLSUpONXZra2ZLcnFJNEV1VVpsNEtsTklvSWF6YmpVbEt6cERXN0lX?=
 =?utf-8?B?N01ZeVFVMlJjK3QrZ2ovU0hlYWFHWCs3M2VYM3hrc3NldHV3emozQlFKdFQ3?=
 =?utf-8?B?RFZQb1UxaHh6amQ5K3JndDFNcmVjZW5EUG1ObGJFMW9iSng5VmVZMEpNKzVH?=
 =?utf-8?B?TDR5WUJUNDVrSVhUNEloUjBoM2Q5VHdaL2lDMVR4K2V5VEpPZHlpcEp6cUpJ?=
 =?utf-8?B?alFhZWRlSUltQ3lmTFhpVGNIMitDUnJpT2JXOGEya1g4SzVsWTFpMTFIbW9F?=
 =?utf-8?B?Y0RJVndXZlRoek1xV0N5Ti9IU29SMXREWVRTZ0VBK2kzZXhSNW1KMy9HQUhp?=
 =?utf-8?B?ckc3czFHNTZmR3hNUVViSk9hdFF5bWY1UnE2VDBtWkxHZktZRjg0Vm1BVUFV?=
 =?utf-8?B?SSt4T2ZtMHN6dzNVdG93L0xweUJBbHpLbHNPVUx3MWhiaW5xanRFeDFLeml6?=
 =?utf-8?B?dUUvbFpFVHBTL0RHTmkvQ3NXSHNzdmNhUmhZT213dk1ubGUya3VBR1FYQzI3?=
 =?utf-8?B?WW9TRTg2M3Q1VmhYZ09ORC9IcVNiYi93R2tIKzJiSm9LRDVZd0k4Z0ZSZlV1?=
 =?utf-8?B?ZXk0U1pMR3ZDc3ZGcFAyRDVaYnlMQTNSYkpTK0lqeWVoSHRreTBEYWcxQWFs?=
 =?utf-8?B?aGZxcUo1ZW51U0pBdVhTcWRZRERaMG0yVXlZdFRkbzdUenYyV0RRc0NhMEFP?=
 =?utf-8?B?U3krRW9ZaTdQQ1YvRUdHV1IwRE1yRVpnUG5lR2N6alhXQk1kRWFqZU5zRlg5?=
 =?utf-8?B?OTFiaXpQMHZIemZvU0VLNXJJUDhxUGcwSDhYU2IweUlIOE95NTZRbW5ia25W?=
 =?utf-8?B?ekV2S2VnMXUwTkpHcjVRbStjV2l4SWVnMEd6bzZ6YThncXRnVlBuS0cxcjQw?=
 =?utf-8?B?NlpMcktieVZmNEE4MkI4OHNHVURMUW92Tld6ZDRQU3NURFZZZzJnc1Vhb3VF?=
 =?utf-8?B?ZkpNNzZPMmpOMGR0NEYvMTF2OUF5VEl3Nkt5N3g1T0VLR1FjZ3l4dFVRZjJl?=
 =?utf-8?B?Umx5aExXekVkMEJjVE1tTGcrSzE0U1h4RWxkb1FnQTU3eUhOemZqZ0g4ZFVl?=
 =?utf-8?B?amc2Q3hvUGtaWW9EN3F2NjZGMWl5MDlMQTNHTE9PSWQzL2tZT1IwM1hvbkly?=
 =?utf-8?B?d0xOajBWc1doV3luZG96T2NhQkFad29uWTA3dktPZGFNVEtxeUxkRDZsZEFw?=
 =?utf-8?B?ZXROWXZES3JxNlNRU2xJK2N0ZlZDZGtSTE9xMk4yaEF4cExpV1pDT3VPbzhr?=
 =?utf-8?B?L3ZmRE9YdDBHVk5uNzA5UUtwUHFjVzhMTEJORXY2KzRvUHJ4YWZHZ0poY3Q2?=
 =?utf-8?B?Q09jTXZUQnV0SVB2U1QrNldMQmxKdW14djZMUm5nUWQxamh6Wkx6bElYNFBL?=
 =?utf-8?B?YlpUYVQvaFB1NzlYdDZFZUFCdnRYZUlseklFWGEzTmZZWkNnT2RmUmd6WlF5?=
 =?utf-8?B?WEU2U1RvTlIrY3ViQVdOdkc3SE5kdEt5cmd5UnlxdW4yMkwvRkgzeGt6VThE?=
 =?utf-8?B?VUZ5VDNpRWFIbDRiN25PMis5T2phdFc3eHZQYnpqcUhvaFNDSDRTYmxlZ0ZK?=
 =?utf-8?B?T2I4aG5MVEowSDJ2UjNPWVBUem80eUd6eUJVejI1dFF6UVQ0SVkwSEtKWjd4?=
 =?utf-8?Q?gyGypqVWp0wJlyu2FbHowLLAEIBG4u/+y3bXweu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0NsaEhFUFBsTDRUcDhvaGJJd3ZRaitYVzJYYVJGVG9iVS9MZVJxcWlaemNl?=
 =?utf-8?B?SGloMkhhcHBVS1BFaWV4TjY4SHdVYnF2SWltSDRSMG9tdG4vMkpWbmRmcExx?=
 =?utf-8?B?OVphbzI5R0hxZkdwTDNBVEhtMWxBQlJFblZVTXB1czk2YXlLam9XOUJTbTJu?=
 =?utf-8?B?aWs3aXZsSTloaEtHOEN6MzB1WG9wcytrU24wRmdPYUpmbDM5TmdrUzNrUVl2?=
 =?utf-8?B?bGZMeXkraTErL2hFU0txeGFSdlMwYWtFSkNUeEZxSXlsZzBFMnV3Vks0dmRh?=
 =?utf-8?B?M1pVcXpDTjNSMDdRTExOdGFwY1N0bFUyMHBGMERwaXpkQVdhR0hYdHFFS2FT?=
 =?utf-8?B?N1ZSREZaUnhBUkF0TlhuaVlYanE1ZHFkSjVsQlhnZURKaUtGeDNxTGpnUENm?=
 =?utf-8?B?VXpjWWxVaUNOQ0syL1llNzRlOGoweDZhWTRPMjlXRGE2em9ndG5PNzZhMUpv?=
 =?utf-8?B?TlZmQURXSEhQRnFlVGlKU09WSStBMHNuOHR5MU5qQmlYd29CUktTWGNvWFU3?=
 =?utf-8?B?YVlVbGNWOEMva0szc3FKUEd1dlM5ZWlVSEorclMyVkZ6QUtTMEtMYkMvMndD?=
 =?utf-8?B?TlFhajU2VmNIY2J2RDdGWStBdGtORDFLakcyaDYvVitpK0VYVXdXSG42YUJ5?=
 =?utf-8?B?dnFjVTFlRTMveTVrL2lmYktSVzJwT0RCc3VISVNUU3JFNlNuMEtyM01NSG9r?=
 =?utf-8?B?d2t3QkRJYWJnbUFlbFRvTC91M0xXcmphRG1nWllQZnVKeGpkZmpOQUEweW1S?=
 =?utf-8?B?eXdaakMxNVpYdXAyTnFnSmhMZnh4TmRWQkFsOExnaC9la0Uyb0ZvZEV4M1ly?=
 =?utf-8?B?eUM4YXVvL01pUkYvb1dwV2hKblVTcHdvK0dsck4zcG9sbUVXTUFVNUdEVHZU?=
 =?utf-8?B?ZDhGU2lXUCtJZU1ZbVIrV0dFQkhjazdtdTFyblFIMHFaMlc0Um5SUzNUaU8x?=
 =?utf-8?B?NWlxTDM3QUlZYnY5SWJocHgrN2FRZUxObUorRGNSb1pLZHg2bzlGV1ZRVmpH?=
 =?utf-8?B?cHY2a3Nzdk53Tm5sT1lsRDBEUTNCNTFacVFNZWE4ajVzbW1BYmVMdXNtZnZk?=
 =?utf-8?B?RzN3ZDgyQ01JQlZOaGRtZW5vTjU0b1gvZ0VJQ2U2MlNMdHA2NmMyL3Z1eThp?=
 =?utf-8?B?ZWd1NThiZStDZ2ZiTlVrWlh4L3VxRmhlY1pEblZFQ3hhUUcvbUNiVkNOdDR6?=
 =?utf-8?B?TmdzVjhMQmhHQ1U5MFNpc0ozbHFIckt2dXlKMy9SNVViSVNGTnJpYTRCZisy?=
 =?utf-8?B?c0NiVHdkMXBLQm8yVjk0WXdDbHJsWHQrcDFvbW9mRDI2YW9RMlVrRERSV1ZO?=
 =?utf-8?B?TmlzdHRTQVBlUmNtMDBtOTFDWXp3a0R4VFpKK3UwT2hySHVqbnlENG9FUE9j?=
 =?utf-8?B?ZDQ1bjFzR0FTK0trbi9SQlovalpqV2VtV3QyWTlBK294WVRBaVhRbStNZzk2?=
 =?utf-8?B?MTVSY21VT1hwSVBiQktmTGFWSGp2UjBHTTJyck9JdjNtRitveVhSRDhNNHA4?=
 =?utf-8?B?dHJUZG9qdzJEdGlhR1FHbjZYSG5RdkloMTJ5N1VLaGlMekRRajUzWG5tV2dm?=
 =?utf-8?B?eXBvczI3UEVqSEhibVpVaVRRL2lhRWVjOWw4L3l3MDc2YXZqTmV1c2pVTG1o?=
 =?utf-8?B?SnJuOGExNXJsOVZJeDA0emZUZFdmWWhzQmdtUmZpOCtyMXZPMWQ3WWxMNWJs?=
 =?utf-8?B?eUtHTWVjR0lTSk9RMFRveWhJSldDWWhCNEVQN0loNk9vVzR1Z2ZyU1dPcC9K?=
 =?utf-8?B?ZHBudHlncjBLY2gyYVZmYSt4aFlIZThSOVBGekZaT1hTT1d0dnVraDMyZExi?=
 =?utf-8?B?aERzQVB6RnNVZXdCNDI2Z1ozbXhFbDBBN1NCZ2t6TWtvcU9kM1UyVUVnZHEr?=
 =?utf-8?B?ZW9tN2ZXZlB0YkNOc1Z1SEZVWndrVEpYb2NnY0w4QWlkRllwVU5QbGhKNWM1?=
 =?utf-8?B?Nnh2bmZ6a25EbzBBY3VpTVNjOEZtVTNNejdYUTJKb2ErN0FrY2ljWlU5Rytq?=
 =?utf-8?B?Q1pIRmhVS2tDQ3lOeXZxRk9hdlVKZ0JIUGVyUVBsVjRpTnh1S1o3TjAvYW5t?=
 =?utf-8?B?cnpHSTdTMmpRcnp5eVZacDlxdGh4dkFMSFIwRlljSWhqUldTY0lzb3F6aHhU?=
 =?utf-8?Q?OcMZjhxmubpd2MxrF/hZc36zI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3d6eb1-c688-48f6-cb13-08dcf90158d8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 16:38:56.1994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0rAHvovxUPWgYJTWD45y1Xg0mPwoz2qoQwWC0of3Fgi0VpApT+bCnnkyXbJYfR9c102f2j9NefWSJmmFSLPIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

On 10/30/2024 11:23, Shyam Sundar S K wrote:
> 
> 
> On 10/30/2024 21:38, Mario Limonciello wrote:
>> On 10/30/2024 11:03, Shyam Sundar S K wrote:
>>> Hi,
>>>
>>> On 10/30/2024 19:30, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 29-Oct-24 3:07 PM, Ilpo Järvinen wrote:
>>>>> Hi Hens,
>>>>>
>>>>> There a question / item needing your input below.
>>>>>
>>>>> On Wed, 23 Oct 2024, Mario Limonciello wrote:
>>>>>> On 10/23/2024 10:52, Shyam Sundar S K wrote:
>>>>>>> On 10/23/2024 21:10, Mario Limonciello wrote:
>>>>>>>> On 10/23/2024 10:32, Shyam Sundar S K wrote:
>>>>>>>>> On 10/23/2024 20:04, Mario Limonciello wrote:
>>>>>>>>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>>>>>>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>>>>>>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>>>>>>>>>> The PMF driver will allocate shared buffer memory using the
>>>>>>>>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is
>>>>>>>>>>>>> located in
>>>>>>>>>>>>> the
>>>>>>>>>>>>> secure world and is used for communication with the PMF-TA.
>>>>>>>>>>>>>
>>>>>>>>>>>>> The latest PMF-TA version introduces new structures with OEM
>>>>>>>>>>>>> debug
>>>>>>>>>>>>> information and additional policy input conditions for
>>>>>>>>>>>>> evaluating the
>>>>>>>>>>>>> policy binary. Consequently, the shared memory size must be
>>>>>>>>>>>>> increased to
>>>>>>>>>>>>> ensure compatibility between the PMF driver and the updated
>>>>>>>>>>>>> PMF-TA.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>>>>>>
>>>>>>>>>>>> How does this present to a user?  From what you describe it
>>>>>>>>>>>> seems
>>>>>>>>>>>> to
>>>>>>>>>>>> me like this means a new TA will fail on older kernel in
>>>>>>>>>>>> some way.
>>>>>>>>>>>
>>>>>>>>>>> Newer TA will not fail on older systems. This change is just
>>>>>>>>>>> about
>>>>>>>>>>> the
>>>>>>>>>>> increase in TA reserved memory that is presented as "shared
>>>>>>>>>>> memory",
>>>>>>>>>>> as TA needs the additional memory for its own debug data
>>>>>>>>>>> structures.
>>>>>>>>>>
>>>>>>>>>> Thx for comments. But so if you use new TA with older kernel
>>>>>>>>>> driver,
>>>>>>>>>> what will happen?  Can TA do a buffer overrun because the
>>>>>>>>>> presented
>>>>>>>>>> shared memory was too small?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> New TA will fail on older kernel and hence this change will be
>>>>>>>>> required for new TA to work.
>>>>>>>>
>>>>>>>> OK, that's what I was worried about.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>      From user standpoint, always be on latest FW,
>>>>>>>>>>> irrespective of the
>>>>>>>>>>> platform. At this point in time, I don't see a need for FW
>>>>>>>>>>> versioning
>>>>>>>>>>> name (in the future, if there is a need for having a limited
>>>>>>>>>>> support
>>>>>>>>>>> to older platforms, we can carve out a logic to do versioning
>>>>>>>>>>> stuff).
>>>>>>>>>>
>>>>>>>>>> I wish we could enforce this, but In the Linux world there is an
>>>>>>>>>> expectation that these two trains don't need to arrive at
>>>>>>>>>> station at
>>>>>>>>>> the same time.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> Some ideas:
>>>>>>>>>>>>
>>>>>>>>>>>> 1) Should there be header version check on the TA and
>>>>>>>>>>>> dynamically
>>>>>>>>>>>> allocate the structure size based on the version of the F/W?
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> This can be done, when the TA versioning upgrade happens,
>>>>>>>>>>> like from
>>>>>>>>>>> 1.3 to 1.4, apart from that there is no header stuff
>>>>>>>>>>> association.
>>>>>>>>>>>
>>>>>>>>>>>> 2) Or is there a command to the TA that can query the expected
>>>>>>>>>>>> output
>>>>>>>>>>>> size?
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> No, this is just the initial shared memory that the driver
>>>>>>>>>>> allocates
>>>>>>>>>>> to pass the inputs and the commands to TA.
>>>>>>>>>>>
>>>>>>>>>>>> 3) Or should the new TA filename be versioned, and the
>>>>>>>>>>>> driver has
>>>>>>>>>>>> a
>>>>>>>>>>>> fallback policy?
>>>>>>>>>>>>
>>>>>>>>>>>> Whatever the outcome is; I think it's best that if possible
>>>>>>>>>>>> this
>>>>>>>>>>>> change goes back to stable to try to minimize regressions to
>>>>>>>>>>>> users as
>>>>>>>>>>>> distros update linux-firmware.  For example Fedora updates
>>>>>>>>>>>> this
>>>>>>>>>>>> monthly, but also tracks stable kernels.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Advisory to distros should be to pick the latest PMF TA
>>>>>>>>>>> (note that,
>>>>>>>>>>> I
>>>>>>>>>>> have not still submitted to new TA FW).
>>>>>>>>>>
>>>>>>>>>> Yeah we can advise distros to pick it up when upstreamed as
>>>>>>>>>> long as
>>>>>>>>>> there isn't tight dependency on this patch being present.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> That is the reason I am waiting for this change to land. Once
>>>>>>>>> that is
>>>>>>>>> done, I will submit the new TA, you can send out a advisory to
>>>>>>>>> upgrade
>>>>>>>>> the kernel or this change has to be back-ported to stable/oem
>>>>>>>>> kernels
>>>>>>>>> for their enablement.
>>>>>>>>>
>>>>>>>>> Makes sense?
>>>>>>>>>
>>>>>>>>
>>>>>>>> I think we need Hans' and Ilpo's comments here to decide what
>>>>>>>> to do.
>>>>>>>>
>>>>>>>
>>>>>>> Sure.
>>>>>>>
>>>>>>>> I will say that when we had this happen in amdgpu for a breaking
>>>>>>>> reason there was a new firmware binary filename
>>>>>>>> created/upstreamed for
>>>>>>>> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
>>>>>>>> have fallback code so it could be compatible with either binary.
>>>>>>>>
>>>>>>>
>>>>>>> True. In case of amdgpu, the FW loading is part of the amdgpu
>>>>>>> driver.
>>>>>>> But in case of PMF, the PMF TA gets picked from the AMD TEE driver
>>>>>>> through the TEE commands.
>>>>>>>
>>>>>>> So, there is no need for FW versioning logic in PMF driver.
>>>>>>>
>>>>>>
>>>>>> That's a very good point, and this is a lot of complexity then.
>>>>>>
>>>>>>>
>>>>>>>> * If user on older kernel took newer linux-firmware package
>>>>>>>> they used
>>>>>>>> older binary.
>>>>>>>> * If user on newer kernel took older linux-firmware package
>>>>>>>> they used
>>>>>>>> older binary.
>>>>>>>> * If user on newer kernel took newer linux-firmware package
>>>>>>>> they used
>>>>>>>> newer binary.
>>>>>>>>
>>>>>>>> If the decision is this goes in "as is" it definitely needs to
>>>>>>>> go back
>>>>>>>> to stable kernels.
>>>>>>>>
>>>>>>>
>>>>>>> IMHO, let's not put too many fallback mechanisms. The philosophy
>>>>>>> should be use latest driver and latest FW that avoids a lot of
>>>>>>> confusion and yeah for that to happen this change has to go to
>>>>>>> stable.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Shyam
>>>>>>
>>>>>> Of course Hans and Ilpo make the final call, but I think from our
>>>>>> discussions
>>>>>> here it would be ideal that patch 1 and patch 5 from this series
>>>>>> go into 6.12
>>>>>> and have stable tags, the rest would be 6.13 material.
>>>>>
>>>>> Distros and SW component management challenges are more in the
>>>>> domain of
>>>>> Hans' expertise so I'd prefer to hear his opinion on this.
>>>>>
>>>>> Personally I feel though that the commit message is not entirely
>>>>> honest
>>>>> on all the impact as is. The wordings are sounding quite innocent
>>>>> while if
>>>>> I infer the above right, an incorrect combination will cause a
>>>>> non-gracious failure.
>>>>
>>>> There are basically 4 possible scenarios and to me it
>>>> is only clear from this thread what will happen in 3 of
>>>> the 4 scenarios :
>>>>
>>>> 1. Old TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> works
>>>> 2. New TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> broken
>>>> 3. Old TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> ???
>>>> 4. New TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> works
>>>>
>>>> If the answer to 3 is: "works" then I agree that this patch
>>>> should be submitted to Linus as a fix with Cc: stable ASAP
>>>> and then once that has hit most stable series it should be
>>>> ok to upgrade the fw in linux-firmware
>>>>
>>>
>>> Short answer, "yes" it does not work for "3." and you can consider it
>>> a broken.
>>>
>>>> Note this is still not ideal but IMHO it would be ok.
>>>>
>>>> But if the answer is "broken" then we will really need to
>>>> find some way to unbreak this, which could be as simple
>>>> as querying the fw-version and basing the size on this,
>>>> but having a kernel change which will regress things for
>>>> users who do not have the old firmware yet is simply
>>>> not acceptable.
>>>>
>>>
>>> I am not sure if there is a firmware versioning interface that the ASP
>>> (AMD Security Processor) returns back the kernel/driver.
>>   > The code path in this case is:
>>>
>>> AMD PMF driver -> AMD TEE driver -> AMD CCP driver -> ASP TEE -> ASP
>>> TA -> ASP HW.
>>>
>>> So, I uncertain which module has this information and where exactly
>>> the code of fw versioning has to reside. It will take a while for me
>>> to dig this in.
>>
>> As a solution to this, can amd-pmf explicitly do it's own
>> request_firmware() call to load the firmware binary and determine the
>> size to use in the array and then discard the loaded binary?
>>
>> This would let the TEE module still do it's own load later like normal
>> without having to plumb this information across subsystems.
>>
> 
> TEE driver feeds in a lot of metadata and the structure information
> for PSP headers and I don't think just having a request_firmware()
> will help.
> 
> Sidebar, TEE driver has a lot of plumbing that can be used decrypt the
> policy binaries to debug issues related to TA load failures and policy
> binary issues (basically the descriptors)
> 
> So we might end up in replicating a majority of TEE code into PMF
> driver, which might not be a good design choice.
> 
> Let me first talk to internal folks to see if we can solve it by not
> making complex changes.
> 

OK, I think for the purpose of 6.13 then this series minus the last 
patch probably makes sense.

I also think the first patch should ideally come in 6.12 if Hans is OK 
with that.  As 6.12 is probably going to be the next LTS we'll want 
hardware supported as widely as possible within stable rules.

> Thanks,
> Shyam
> 
> 
>>>
>>> Meanwhile, shall I drop this patch and resend the series (by
>>> addressing the dev_dbg change Mario commented) so that this atleast
>>> becomes a 6.13 material?
>>>>
>>> Thanks,
>>> Shyam
>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>>
>>

