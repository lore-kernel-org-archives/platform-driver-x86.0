Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26D28B4FA
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626695; cv=fail; b=e+I7s6Px2MQTAAEyJQbxLJhAcvOTD1Y19/vLPcNlJl+njzUxGBMEYCqdmAJpA2HziwJZiNc3DMcY4Qn2U1fpztTJzifeOki9TrNqaeQdms1msyr/MfxepP4bQuM0tjy2cHIKGYcVu3boVbZel/wfnTA/Nqycr+OJjn4ubOF0D0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626695; c=relaxed/simple;
	bh=6Qyfevx5HBdTzO88F44Zp5MmpCbnXNJVwpDJ/NQ5OFM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R1WIZdG8rRewtGBSAsjmdss3oF3z+iRhIeDdN5DxSR+yZvMwK0iDJdfscIx46KNLCX71ha7V87kR3IMTkRJ31pfy4/UrwEd0cjT0Hn7PPvhnXZd/ub/+gQYKa0qeNxH3J6XuAG4Y90bIOp3FSryj5GhFAMgPiDlP2jVWlYTFiPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UFuVK57t; arc=fail smtp.client-ip=40.107.209.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UFuVK57t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZDSzEg+jtRk7dQ/rYK82no1aU/giNmmu5vEMVLmaA8+MReb0EGVRaGBdAO+ECuuZtYdW0w8fQCTemEtpYfkvo+3dDA1LSBYaxpcLp3PGP0IKtf1TL6Q5OzKCBPXcWUPKJK9Ot6zFyN7fKIUjmFqga28C5pPYJW6wyKxPTp9YpZBUndI4Tk0TJh76HW8GBKcQjYUQu0Div4jlxsVsPqXTmV9WwbBHM6CxKqRI6GfWuckz3g4vxLeYBTnwjugf5/B5gFiMQjKR847NcMmZsGNKVfsPh6zSsaK+SykuBzSVsngG0wZXKrqtAjR1KseHrwymttLYhKIW9BgmrPh45R/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PPxDNFRYwRjVntF4bwj7xIpQuv07IOJz0ufASS3Z7Q=;
 b=b+N6AxwS7MR7sGS8MmFVVj5IWY9wv6GYhKNwiIBkKUzq6weh6jP78zubjTQbh29Yu1RM/ibkR4vnLl+C+Hs0oe/fDp8q7WLFZdeP4E2Jkz97zHxlEu8id9W2wUBlpVYW60ZrgPQkZdGvmKb7Z+e1wGYWCI+tnHKsa145i8jDJVOlxDijPpHTNaoIqbvEV5mwAeArFo59O4W0hepKH8af1ryJj2NYnS3ue5R/tQGchUqUyatMCHel5y610VHjlwIq4F72Ar+bwCb45EQr+4bG69yyEDT3niAJEKThYivb/H3aOXKtbLpISo3uSPu1cR2rNS/fy5y3nx5WKOFv7jsCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PPxDNFRYwRjVntF4bwj7xIpQuv07IOJz0ufASS3Z7Q=;
 b=UFuVK57t4V1ce/TY4ctWuzVDGGDzhrlTV/mfjxB0+QkAfgbPyER0DvECeU3yrgo4Cbf7608G8pBf4G9lkMEJe7h1/IS9jlnM5azWOpW9gH00uUmJ3OsIO7ig4J134xAKemiodn6VAOF9oSQT1WFUGMqWX9ohNU3U0dgG618rFtc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 18:58:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 18:58:10 +0000
Message-ID: <ad26a6a3-fc9e-4ced-8150-2e9ebb98877d@amd.com>
Date: Wed, 28 Jan 2026 12:58:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fixes for hp-bioscfg
To: Alain Cousinie <alain.cousinie@laposte.net>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, jorge.lopez2@hp.com,
 linux@weissschuh.net, platform-driver-x86@vger.kernel.org
References: <22ed5f78-c8bf-4ab4-8c38-420cc0201e7e@laposte.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <22ed5f78-c8bf-4ab4-8c38-420cc0201e7e@laposte.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR01CA0003.prod.exchangelabs.com (2603:10b6:805:b6::16)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: f89b8e86-a391-42aa-b948-08de5e9f2e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzB4TlJ6MWI3QzlGN1FKbDhrbFQrZnd1SnArNkdWc2ZTVFNZekpwenBHOUFY?=
 =?utf-8?B?T1VPVjZHQUJyQmhtRmwwOU10MThmU3FtNGZ3L2xub2R3WnkyYXBVM3JLdm9Q?=
 =?utf-8?B?cU1EL200YTJFTWZGbXNuNEg4RmU2SFRBUmt1NFJGeEQ2K20wQ3pQSnZ5ZmRk?=
 =?utf-8?B?dlU5c0J3YUU2Umx5aG05OGRNb0trZXF1TFpDU1cxTHIxVHhMcVJhUG5rekFs?=
 =?utf-8?B?TDllSjZ3Tmp5a0ROeFRJZWIvMHpjU2w5bGhDRnRHK0ZTMXg0blNrOXNCNENw?=
 =?utf-8?B?UjNaVzBINVd5WVlQc2xTVTFyMWIvNjJIYWlNYWUweXVkdTRVQVVKUkpkdUIv?=
 =?utf-8?B?cmZSMkVBV29HdW5wdnlwdmNpa3ZiSHVWbytqQTdMcDBjQ3R5THcrQTZjRzQ2?=
 =?utf-8?B?UlM0SjM2bWpUQS9MY3pkTHg1SjlRcVhsUVZnNjJMdkpGTHJ6RkVGUVkrbEdo?=
 =?utf-8?B?NHUzNVhMeC9tWERCVFlhZlcveEc5U1RpRVBUSXFGU3R3OGdxaHFDaGhzNlJw?=
 =?utf-8?B?VGZDWFp0bmVxMFgzVFd4MHR6aGxyTGl4VFVvTUk1eUtTUTN1U3JTdnV0SEZH?=
 =?utf-8?B?bExDbG50bXhxbVBSWWZQaFdSSng0Z1lRa0tHejNuTXhZaGcvVnppMDM4UFQr?=
 =?utf-8?B?VUVERTIra2w3YStBWDh5cEdyLzcxNmRXL2Jtcm9WVGVWc0MvRlJGcktML08z?=
 =?utf-8?B?YVBYaE01ajhjYndWYTVRMFIxRVRhM3lSaEl5OWJIaDVlaDVST3RFSktBbEFl?=
 =?utf-8?B?QUp2OWhHRkJIdFhaSjRRaEsrOExDdjJOcWdrZFMyMlpKNjFkbTU3b2xrdTdl?=
 =?utf-8?B?NFNuTTRVUmluV1dFdDY2NzF6QWthUjFITktpaEQwcU5SaVpKMm9WUW9QWFJs?=
 =?utf-8?B?RmZxNHYxdjFQaXZuUGxpbzJueGhzYVdMRmt4ZG0xUTNSUWk3UmlZL20zNjl4?=
 =?utf-8?B?a3NSYmR5c2g3dHNWZEVFQWh6TGNsM3VGR3NZZUcrRngwWEphYXVHcFJMTHNh?=
 =?utf-8?B?bFFXYldwSkcyTjNMQ3NUK0p5d3plTkdiUFNWODlKY2IwZFo0QnNhdEhuTWFK?=
 =?utf-8?B?WW1ESEVEYWVOZkZpZXNVeFZjUlBGV3BkWnpkbFJrN1NyM3FiaGg4SU5UY212?=
 =?utf-8?B?TDNyLzVBcG1VZ0RUU2U3NXJBWCtMVnJwSy9yeDdHMlRTa1lSd0VOVEZhdGxn?=
 =?utf-8?B?ZUpYVVRTN0tMUHFibGhjVVZhSGRMUzc5V1FabnpiSi9Gc0toODVBRTA2VWN4?=
 =?utf-8?B?S01YcXg4eVNvb3NnM1pMMnN2UkV4dGRPSzlZczBCSG1ZZ003ZTJISDJWeWI5?=
 =?utf-8?B?MHZhSTBvSUhwRzFNb2JyNUIzdjBQcEJQOGNKQVdnaHFYUk1EYm5kdVJReGV0?=
 =?utf-8?B?SVNTbCtmaFZlV2ZDQnRJelZuNE40OGpTaGhTMjNTMTZOaU1WODNGaTJWK00w?=
 =?utf-8?B?V1B2elJXZHpYdFR2aGJjMTNQaWhNSkNCYUNLOUswQUFUK3E2OUVEemU4L0JY?=
 =?utf-8?B?a0NRbUl2bTFDWUV6bTQ2YVhIMDIrUDd5VU9FSnNRQXZkc0pSZ0F0ZXFVNkt5?=
 =?utf-8?B?UmhvVXdBMElYNTFxL3hhNUEveVVBWDhPRnp5ZXFWRlRBMWNZd0lxMmNwZCti?=
 =?utf-8?B?eWVnd1V2d0NsZ2VRRzg5TGVyV1dESlJQeVU2UGlMN0E4M29WdkhkelJvT2xq?=
 =?utf-8?B?Z1lSR0NrbXB5SE9jS1hxTE9QV2J0K2NOZnRSTGNXVHhqZUVyWlVHYmRWTU9P?=
 =?utf-8?B?NXRVeUlndDEvZGRwL0orUjBJN05ORmlEa2VuaVMyY3JZa1QvUXhaZFQ3V2FZ?=
 =?utf-8?B?OWhNTzAxcEdXaUFrQklyUXlJQlQ2MWxTVHB2Tk83T29XcE9mVFRHYjFYNjRW?=
 =?utf-8?B?TmZTcyt6V2p1SkM4SmZ6V1h3RUx1U1hnRVFaZlQ0d0hwWUxOajRtMnNGK3FB?=
 =?utf-8?B?bm9jTlBENFN6aktyenNPN2psRzcrVythQnU3QWpzbHRlWDEwcFlPdDc5akFJ?=
 =?utf-8?B?MWhFeUcyZlBhSXNwZGdaTHJDOFNEVmF3a2JYbzBWZmtQamI0RDcyMUlxbTlk?=
 =?utf-8?B?SE4va2EyRWhZNHdzUDlmaWt3K1IwNmZPRTkwOWtsZVNUN3JIOHROdktoZjJu?=
 =?utf-8?Q?9wp4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGlRK1dUVTFMU09VZkNwTEhpTEU3SFBCUzBaL1EzKzZ0N05OQ2lBM25TTHM2?=
 =?utf-8?B?WHVMcXZvTnQ5VVF4STBBQWpVOTdWN3pHSXhpUzRZY3Q0RDlVbnZHTnEyK215?=
 =?utf-8?B?R2NHelc0SWtRWWsrZTRvaVJZWHhZL0lGclRwM0hIallGNC9lRTRLWFJBYnBR?=
 =?utf-8?B?K1JUbWJ2N3B4Q0VIV256aGtYZENGeFFYbWt4NmJ5czVCbVNEYXRUVWhCQjBs?=
 =?utf-8?B?ajVtYjBmZU5ENmkrMUkyVjV0aHo1dmpjck16RXAyaEkydnJFVlV4Wi9oMmlq?=
 =?utf-8?B?MFJBOEVsalpDVEx5YWdOSEorbXJLOThhaWVXNHFuS0xpL2RMLzBSSkZHR2JO?=
 =?utf-8?B?TmYyTWx6WTZobFRLL3VoQ2l5TjYyaHhRaFM0bkJYM09kZFZDTVNndWcvUTE1?=
 =?utf-8?B?OFdEaGpXd3V5UUI0cy9lNGZ2M3dTUFRGVHpUZzg1MXQ3V01BUHRNakdnZG9X?=
 =?utf-8?B?dS94bDNyVVdCWHdMWWdySE1DSHF2dE0wQmI2YnYrOWdOZFVPWk9KdGEzWnFM?=
 =?utf-8?B?dytUWlpDTlM4TFZjMzYvMVlJWGNHSi9QSmhhem1ZMXpJQ1YxeDNvOHJzUitE?=
 =?utf-8?B?UGJqazFMQThnTzB2ZWh1MGJaUHNnWHpwZFhPcldVZm02MElPYi9KMGU2aklR?=
 =?utf-8?B?dmErOTZxdXJzWGN4V0I4c01NbUk2VVltRGRYRnNLZE5mM3UzenB3VGpLZ2Y1?=
 =?utf-8?B?NGdwb0g1aHpnSGZXcndWMTEwc3p2Z1R3Zkt6WDAxNEVwWURrTzNQT2JUOEpC?=
 =?utf-8?B?a3N2R1RBZEpsVDNWczJzcGVGbGduaDdGaDNPaklKWXI3ZzhDSDdTbGN5SlRy?=
 =?utf-8?B?ckF2NWVPbmZvMWNQVkMwdTlMVDhsSXFaNUo4VFVmSVYyd3lJaHFOZUNSSkVl?=
 =?utf-8?B?NEpjRGF1YUUxNFAyNmEwSlpQeEpWT2tYRFRMVUxpb0VhTG92WmVRQ3lyUnF4?=
 =?utf-8?B?LzVNVFZDMjBNV05PVnpJUmNhNGdGVXNKWjFZQi83a213R2xxS3RCRklsWFBu?=
 =?utf-8?B?eHFiMWlIUmdUaG1IRkFaT3NXQ28yOEdmT3JnUG9BZFRqOVhoUzVYc2h5bTZn?=
 =?utf-8?B?V2lQM1VqUkZab3FvQTlqakZtSWNkNDVoU05MdnRib241dHBLQjVlNkxhd1pl?=
 =?utf-8?B?WEd0dkoyM0dSVWpmOUZVMjBtYnJCdFF2QTJ1b2VGR0J4Tmhta2ZkenBCK0V5?=
 =?utf-8?B?djB5S3NsVHU4YmErNzk3OGs0QjB2WnhueXRlcG1RMURXSGdVdjM3MnVsSi8r?=
 =?utf-8?B?OERoTmpJQ1pHcWJKeVJySUt4YndUc1IyWmhFL0lvWGxrN2g0dmx4aEVMcUdF?=
 =?utf-8?B?TFYyTHo1TWRmOFIzc0tjM1NjY0piSEhPLzJiNGFSbmdxamphYnd5TmloYWha?=
 =?utf-8?B?c01RWFZ5anRVcnpDbmhrdGI5bk9ZQWxiUUFhTHVZQ3JiR2I1THBuOXpPU1dq?=
 =?utf-8?B?a3c0UGdpZ3p2eFRUK3NRRWF1NEdhNTkzRzZqekVBRXYzT3hoNTBBSnh0cWd3?=
 =?utf-8?B?VkZVb3NLWjd6clg1ZlVjRHJZUmk4ekZKNGExWTg2cmh1WThyTUVDOGpFWWcx?=
 =?utf-8?B?UXRMR0hhOUJLcm5ONnlNdHNrem1VcnVNSUJ2R2JJOXhZUXpFTnFXdTFGYjA1?=
 =?utf-8?B?SE9mM1hiS3FSR043Wk1kakxkdmhlVkwxM3l5QktBMzg2MkNqamJtRDlENmhY?=
 =?utf-8?B?TUwwYmV0OWNqZExEb0lDUWMvQmdGeGVPcTZoWkIvb3NSV1FBeWpRN00rYmwy?=
 =?utf-8?B?c0V6dmhvT3NKY29QVUJ4MW51RExUSzE3WG90Rzd5WHpGV0FEb25UV3NaemRE?=
 =?utf-8?B?TEFzZ2RPN1dSNE0wY0ZITW16Qml4cngxYXF5NlRCYThsOXk2K3ZwMjMvM2t5?=
 =?utf-8?B?L1hNak96Z0VNdmtoZU1HZWtJdWFVTCtIN3BLdE1HYy9odDM0bnhFckJSMGN3?=
 =?utf-8?B?Nkl3dWdLRUhZMnh6bWZwc1R4S1ZKc3VCblQxQlJJNDVpQ1QyTUNJMmpLNTJw?=
 =?utf-8?B?SmZNRm5ST25QQWNLVlhidS83YkpHdFROMHdqSjNuMWwzNElLSUpRNndCWnAv?=
 =?utf-8?B?MFpUNGdieUEvVENIcFk0L2dqQkNqUUhpMEhSRXJ1dUNYT0FFcU9DWEFVZWZM?=
 =?utf-8?B?L2VlQ0ltOTNGRnlvZ0FoREZRck1DM0RFdGpTTEhpOHcvaFpvcXp5b0dxLzh3?=
 =?utf-8?B?amovQmZLc3dYT05zQnl1TjMyQllPOXBNMUYrSFZ0UzBLaXVBNUlSQUxWa0xD?=
 =?utf-8?B?SzRqZ0o1b3NvOVZGRzIvbkorUTBTS0xrQ2ZzcndVZGVVbGtLd2l2WmRBY2hG?=
 =?utf-8?B?cSt3ak5zb0dOL2dmMFQ0V3BiZHZKOW51RkdjcWxZSFJ5cjVzajROQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89b8e86-a391-42aa-b948-08de5e9f2e1a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 18:58:10.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnRY+ZXuRdPesK+54bdGNw5OS/piK6TlVk67oMH9M++90VApzrxDXX5NITWhDRZNnhplyxxJC8xhPH0WVZO/og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731

On 1/28/26 12:51 PM, Alain Cousinie wrote:
> In-Reply-To: <20260115203725.828434-1-mario.limonciello@amd.com>
> 
> Hi,
> 
> (Excuse me, I'm not very familiar with the lore.kernel.org forum.)
> 
> The hp-bioscfg patch on 6.19-rc7 is causing my kernel to crash on my HP 
> Spectre 14-eu0xxx with Debian unstable.
> 
> See the dmesg output below.
> 
> I'm available for any help or questions...

Hi,

Can you have a try with this?

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c 
b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index dbe096eefa758..51e8977d3eb4a 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -696,6 +696,11 @@ static int hp_init_bios_package_attribute(enum 
hp_wmi_data_type attr_type,
                 return ret;
         }

+       if (!str_value || !str_value[0]) {
+               pr_debug("Ignoring attribute with empty name\n");
+               goto pack_attr_exit;
+       }
+
         /* All duplicate attributes found are ignored */
         duplicate = kset_find_obj(temp_kset, str_value);
         if (duplicate) {
> 
> [    5.489782] ------------[ cut here ]------------
> [    5.489785] kobject: (00000000e74f4f8b): attempted to be registered 
> with empty name!
> [    5.489787] WARNING: lib/kobject.c:219 at 
> kobject_add_internal+0x420/0x470, CPU#5: (udev-worker)/568
> [    5.489792] Modules linked in: soundwire_generic_allocation 
> snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda 
> snd_sof_intel_hda_mlink snd_sof_intel_hda snd_hda_codec_hdmi 
> soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_soc_sdw_utils 
> snd_sof intel_uncore_frequency intel_uncore_frequency_common 
> snd_sof_utils iwlmld(+) x86_pkg_temp_thermal snd_hda_ext_core 
> intel_powerclamp snd_hda_codec coretemp kvm_intel snd_hda_core 
> snd_hda_scodec_cs35l41_spi regmap_spi mac80211 hp_bioscfg(+) 
> intel_ipu6_isys snd_intel_dspcfg snd_intel_sdw_acpi 
> snd_soc_acpi_intel_match videobuf2_dma_sg libarc4 kvm videobuf2_memops 
> snd_soc_acpi_intel_sdca_quirks videobuf2_v4l2 snd_soc_acpi mei_gsc_proxy 
> snd_hwdep videobuf2_common crc8 soundwire_bus intel_rapl_msr 
> snd_soc_sdca btusb snd_soc_core btmtk btrtl firmware_attributes_class 
> snd_hda_scodec_cs35l41_i2c btbcm hid_sensor_gyro_3d snd_compress iwlwifi 
> hid_sensor_accel_3d hid_sensor_magn_3d hid_sensor_rotation irqbypass 
> snd_hda_scodec_cs35l41 btintel ghash_clmulni_intel ac97_bus
> [    5.489812]  spi_nor aesni_intel hid_sensor_trigger snd_pcm_dmaengine 
> processor_thermal_device_pci snd_soc_cs_amp_lib hid_sensor_iio_common 
> processor_thermal_device bluetooth snd_pcm mtd hp_wmi wmi_bmof pcspkr 
> gf128mul industrialio_triggered_buffer snd_soc_cs35l41_lib kfifo_buf 
> processor_thermal_wt_hint mei_me cs_dsp cfg80211 snd_timer 
> platform_temperature_control industrialio snd 
> processor_thermal_soc_slider mei soundcore platform_profile 
> processor_thermal_rfim processor_thermal_rapl intel_vpu 
> intel_rapl_common rfkill intel_ipu6 ov08x40 processor_thermal_wt_req 
> processor_thermal_power_floor v4l2_fwnode drm_shmem_helper igen6_edac 
> ipu_bridge processor_thermal_mbox intel_skl_int3472_tps68470 v4l2_async 
> tps68470_regulator serial_multi_instantiate clk_tps68470 videodev mc 
> joydev intel_pmc_core intel_skl_int3472_discrete int3403_thermal 
> pmt_telemetry int340x_thermal_zone pmt_discovery acpi_tad 
> intel_skl_int3472_common pmt_class button intel_hid 
> intel_pmc_ssram_telemetry soc_button_array acpi_pad sparse_keymap ac evdev
> [    5.489834]  parport_pc ppdev lp parport i2c_dev msr nvme_fabrics 
> efi_pstore nfnetlink efivarfs autofs4 uhci_hcd ehci_pci ehci_hcd xe 
> drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_exec configfs 
> drm_gpusvm_helper usbhid hid_sensor_custom hid_sensor_hub i915 
> hid_multitouch i2c_algo_bit drm_buddy ttm drm_display_helper cec nvme 
> intel_ishtp_hid xhci_pci hid_generic rc_core ucsi_acpi i2c_hid_acpi 
> nvme_core xhci_hcd i2c_hid typec_ucsi drm_client_lib psmouse hid 
> drm_kms_helper typec iTCO_wdt intel_pmc_bxt iTCO_vendor_support 
> nvme_keyring watchdog nvme_auth roles drm usbcore video thunderbolt 
> serio_raw hkdf int3400_thermal intel_lpss_pci i2c_i801 intel_ish_ipc 
> intel_lpss wmi battery fan acpi_thermal_rel intel_ishtp i2c_smbus 
> intel_vsec idma64 usb_common
> [    5.489859] CPU: 5 UID: 0 PID: 568 Comm: (udev-worker) Not tainted 
> 6.19.0-rc7-meteor #39 PREEMPT(full)
> [    5.489861] Hardware name: HP HP Spectre x360 2-in-1 Laptop 14- 
> eu0xxx/8C15, BIOS F.16 12/16/2025
> [    5.489862] RIP: 0010:kobject_add_internal+0x423/0x470
> [    5.489864] Code: 63 20 e9 a4 fc ff ff 48 8d 3d 79 42 a1 00 49 8b 74 
> 24 18 48 89 ea 67 48 0f b9 3a e9 24 ff ff ff 48 8d 3d 70 42 a1 00 48 89 
> de <67> 48 0f b9 3a 41 bc ea ff ff ff e9 d1 fd ff ff be 01 00 00 00 e8
> [    5.489865] RSP: 0018:ffffd044424cfa98 EFLAGS: 00010246
> [    5.489866] RAX: ffff895f026956b0 RBX: ffff895f27c5b840 RCX: 
> ffff895f026956b0
> [    5.489867] RDX: 0000000000000000 RSI: ffff895f27c5b840 RDI: 
> ffffffffb38736a0
> [    5.489867] RBP: ffffd044424cfb38 R08: ffff895f026956b0 R09: 
> ffff895f026956b0
> [    5.489868] R10: 0000000000000000 R11: 00000000ffffffff R12: 
> ffff895f026956b0
> [    5.489869] R13: 0000000000000000 R14: 00000000fffffff4 R15: 
> ffff895f3b6e28a0
> [    5.489869] FS:  00007f7bda352c80(0000) GS:ffff8966ac092000(0000) 
> knlGS:0000000000000000
> [    5.489870] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    5.489871] CR2: 000055ac09f17000 CR3: 00000001684a3001 CR4: 
> 0000000000f72ef0
> [    5.489872] PKRU: 55555554
> [    5.489872] Call Trace:
> [    5.489874]  <TASK>
> [    5.489875]  kobject_init_and_add+0x136/0x160
> [    5.489878]  hp_init_bios_attributes+0x265/0x38c [hp_bioscfg]
> [    5.489883]  ? __pfx_hp_init+0x10/0x10 [hp_bioscfg]
> [    5.489886]  hp_init+0x183/0xff0 [hp_bioscfg]
> [    5.489888]  do_one_initcall+0x8d/0x330
> [    5.489892]  do_init_module+0x62/0x230
> [    5.489895]  init_module_from_file+0xd7/0x140
> [    5.489897]  idempotent_init_module+0x148/0x340
> [    5.489899]  __x64_sys_finit_module+0x71/0xe0
> [    5.489901]  ? syscall_trace_enter+0x91/0x1e0
> [    5.489902]  do_syscall_64+0x7c/0xd70
> [    5.489904]  ? __do_sys_newfstatat+0xe0/0x170
> [    5.489907]  ? do_syscall_64+0x7c/0xd70
> [    5.489908]  ? exc_page_fault+0x77/0x170
> [    5.489910]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [    5.489912] RIP: 0033:0x7f7bd9d1bc69
> [    5.489914] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 
> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 77 51 0d 00 f7 d8 64 89 01 48
> [    5.489914] RSP: 002b:00007ffe11a56348 EFLAGS: 00000246 ORIG_RAX: 
> 0000000000000139
> [    5.489915] RAX: ffffffffffffffda RBX: 000055ee99a48110 RCX: 
> 00007f7bd9d1bc69
> [    5.489916] RDX: 0000000000000004 RSI: 00007f7bda30e44d RDI: 
> 0000000000000067
> [    5.489917] RBP: 0000000000000004 R08: 0000000000000000 R09: 
> 000055ee99899e80
> [    5.489917] R10: 0000000000000000 R11: 0000000000000246 R12: 
> 0000000000020000
> [    5.489919] R13: 00007f7bda30e44d R14: 000055ee99a42060 R15: 
> 0000000000000000
> [    5.489920]  </TASK>
> [    5.489921] ---[ end trace 0000000000000000 ]---
> 

