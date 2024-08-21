Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A841B3B21
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262137; cv=fail; b=DLWaL8NjiTyEG55vEehBLbWvmOZUv0M/bAtlhaMFkEvsDwD655Q++tcleH66+z9UhN4WpAzqsFT+Ks9UjKFvX5ZteGx/7wtQ2/2Bc+mz1Vqwn38D20pd7Y6E4JVtn3US7LGAgsjtaKzUN1MiJ3yAjh6AlcA48/N7zXudajq3fBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262137; c=relaxed/simple;
	bh=rDtBoavpjbVAuEddbzm4OtZeeK7PTqApBAeTbBSfolA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bUdvGpCua25BRCebSsHbnQ+PN/4p5MhDUGcIMOM8nHRmddD6SmnlYguxRVcE7bypbMBq9l6bh6qeDS4QSGwxvWnYIboFBDqGPhUc41KYkZ+xDzkQ0SE3rN61pbmHzyKfZ39+asfKg8wiuyzJCh6AOPNIY9Un2JAse2Ah9q7+I90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ohqdL2kh; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ohqdL2kh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWdkdC1nsq0h+wOfbJjId/wnF36TGeoMkGi6XQ64zT5UaGuSoPpo70bWEy2L/MiJXWffVL/WYMc0bS9Iv597HwGZOgNjZ+dPSeXfFx9q8TlQkTqm4hSzNdmngixVOJI0DLYnAvbbokw3c/TckI/HFHCsksj+qZTGjSw1Y05XYnv7lKYWXFE8yr1XTP71FRnOqafXEto/KVNwol5Lhx4SdABBo4ptPQwRI84SAgPSezDqDTAD6AvDeUgolPaY6+vsOB6i5VsL45VsNqHCFUMWwXmKcI5AVNFMpyMmhXnZbGdZzd5ua/Gk0iD9zkbnkW0p3SmjJRWsPCZCN0zU3m5vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUb5XRL21XuOhn4r1MtOZU0zvhjSxrveDIz2izz64Wo=;
 b=Pcj3Vl/8GNGZLLCDe6mzCSOfYu71TFEjT4xEZUoiop0GCVxB9P6ZE0Mv5t3qcgBlS9IHhQKIhj0POK+nknDZ+BzO2a86aM652rIRX/nU7Uq8PpJR1IreLPwYZ0jeplSr0mKOV35SX/6itjizVHmZVBThkwMEewg19UAYqqJmYmb0u3xwPxIV/sjXYbLOetBzVUorXXtdOaRqtGdpCwYSIcoMA8bBWFDx1144ug0wsInolUZz+97IJAUY+vpp8+HaFuQZoJcOj5wRjw541DJbaxXe+YmbJ5Qvx1P9qs0GFWePsws9hVVt4xPcLQK4xiSDZ/S6g9B4Nuo7mopScdc9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUb5XRL21XuOhn4r1MtOZU0zvhjSxrveDIz2izz64Wo=;
 b=ohqdL2kh3pVDWsr6SmUY/d6yYi70TtM93YP21Rbg5ucu9w3xqxrDZrK039RnTFsrLaOkMY4/xujKlWsGZCdggo3zez6y+8DEBkrCIFGQAZNCtDxCGB/9N432A+z0dk7+a0gdl4kHOKwrD+ugtkDyERaMM6uGphg5wXcceYooQN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 17:42:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 17:42:10 +0000
Message-ID: <477d3b1c-9a58-4a37-9c43-ecc8e7c9b922@amd.com>
Date: Wed, 21 Aug 2024 12:42:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Extend support for PMC features on
 new AMD platform
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20240821150446.392726-1-Shyam-sundar.S-k@amd.com>
 <ed50679e-114f-4e7b-8465-1b8d4e0622d9@amd.com>
 <e2105771-ddcd-4e7e-bfc4-a656b6d56b58@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <e2105771-ddcd-4e7e-bfc4-a656b6d56b58@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 053212de-1f78-4595-64e4-08dcc20895b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTlSZ21MaTJzdm5GNStMZ0lWRXRLTHhmU1VvelNXeFlYcHd6Zm0vc21PSnA1?=
 =?utf-8?B?NHR4bFVYVUQrc2hwa1ZJVlFka1hTMndsNnYzTEd5RDBweW1JMkVzVXRwdHFL?=
 =?utf-8?B?aGtJa0I1d204OVV1eUVSZTBFRG0xc3EvTWtZaUMyTzVyZjNOK2wxV041c003?=
 =?utf-8?B?NmN1dWZRR2JQb0VrVU1VUkdJMDFGTjlhMTUyY2MzZWhUaTFUREEycFpab0l2?=
 =?utf-8?B?NE9zam5saTM2TXAwMW80K3VHTHF3VzF3N0dIT3p5dURBa2IvRzU0bWQ4QWdC?=
 =?utf-8?B?eXRsdGlRb3Z3STIwSTlhdEkvb1FDV0Z2UVdiaXVOK1dJY2ppYTZsQXlKWUVm?=
 =?utf-8?B?K0tQR3BZdTNEVXRobXpNcHRrMmJPWFF5K0NJY0c3MmdyeU1PVVlMSDNabFY2?=
 =?utf-8?B?ejdjNHRrc0VWbmxEdmZPaStxWS9lUXNuVVA1aWZ0ZStrSjdzeEhXNFNCQTUy?=
 =?utf-8?B?VGZIZm1jTS8wOUtQOGNjTzJPZjVjL0NmcHFMNXBvWlNENUUyM3Zvb0U0OE5n?=
 =?utf-8?B?MU1rakxxTXNFT29OM2h2T3ZVbThnMStCOHNPeTMvMnhxb0djbnd0Y2k4d2tQ?=
 =?utf-8?B?ODFBbll6Zm5WN205TEZuYnhvVzUxK2pYSFBpVXVrL2gyYW1BWTk3VnExOWNH?=
 =?utf-8?B?YVVLTlMxV1ZDY2UyMDNjeWdjS0ZQdzZpUncyRlZ4Tmc5WjdLa3owak9XNTMy?=
 =?utf-8?B?ZFZLdGkvTkRMZ1RRQ09selp2eUJSZzY4dzJPNlJsNXZXVnEwOEp0Y1RCZVpi?=
 =?utf-8?B?SmJBZ1dPMlEvUkFWRFZMUXpCZ1M2d1BCMnRtdUQyRWRpU2FOYTl0VmFEcWdw?=
 =?utf-8?B?OExOYzMvYVZSWmZIK1dPNlRZcTZSSUZ0VUM2SnUyc1RBVllzTEE1VndRL25v?=
 =?utf-8?B?NloyalkrMngzc29FeEdqMEp6VEV0bW1NVFN5U0lXelRzWlJ5RjREOTVZREp0?=
 =?utf-8?B?N2t5WHhoLzZpQ3R5OFVGK2lseHMvL2cyV2hKVGJncm1KRGFMS2lMU1FUeEtP?=
 =?utf-8?B?eUxzNFVRTklDcEJPODZneTJVaEkyTStaUTE1d2t6dmw0ZFRoRmdjU0FYdmZU?=
 =?utf-8?B?RU5xQVFUallLOUNkVUtIUWZEM3hPemI2MVZValUrdGtkaUFabnBHamxraFUv?=
 =?utf-8?B?RnFRWGkxQmw0NnlRaW15NVdNY3NucnZUMUVuSFRNVmNscjZaTDBVdVR6MExV?=
 =?utf-8?B?akpQSFdjYXEyaERpU2xMKzZGNUI2dUN6MkdEYlA1RnFNbnVwa1IzRkk4blVs?=
 =?utf-8?B?U1h3SU5Ba2tTRlM0R29zN0lERFJIcVZ6d25LZ2RmT2NFRnYwMDdaSFJyMTdQ?=
 =?utf-8?B?bEoza0U2aDRGdk9BYjNKY2xuVDR4UWdKUEE2ZXlTUm8xNlFESjI2OEZQdXh1?=
 =?utf-8?B?NzZnWWpjMGVRNnpGekFIVXZIQk9kNll3U3VLL2dYRWFXZFYvNmJjVFQ2Wmls?=
 =?utf-8?B?eXlWajlTNkk4THAwQ3oyazZnRDZTQ3ZYRWtQVXRwdW5BYk1LMzdzWExzK2xn?=
 =?utf-8?B?ODZSL0pjajV5OFowQ0QwbTV6QU5aMGlnbWo4c1FFQTZDWXN0Z3JUbzdwQVRp?=
 =?utf-8?B?ZElONmp0RzdFQlJIZnhyNTQ5MDhoNXJWcUN0MHZqS0g4MnF2VWt6cHhRYWNE?=
 =?utf-8?B?OVpiYUg5R0lEZEFrbDVlZWo4V2R3Ums4SVY3cDdKZ2ZqNDhtYkRUTlFaZUhS?=
 =?utf-8?B?M0NvcnByODBmeUJXYkl2UVRzZTRjWnM3ZTFpemc5WXlMTnlsUmFkeE1zTlk2?=
 =?utf-8?B?K1NvSjR3U2RXZ1NqTVl2MkVkUGVKMi9hR3JhN0daNzZic2JJVDMzQm1KYThN?=
 =?utf-8?B?RjZ6NnU0aFJpL3cyUWRmQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkZIdmJVN1pFdTBQRktmbEs0RHhPbVVqeGNEYWdBRzJoR0RwVmVFUmw4a1hD?=
 =?utf-8?B?cE83aDFFRGRNQitHQ25MY20vejJPSW9jWktpaG1USmNPcW9jdndWemtsc1Yw?=
 =?utf-8?B?RThBMkg5Z00yUEJnZEc1b2JibHBvdTFGbXNSQy96RElNT0UydUNHZ2F3R0Rn?=
 =?utf-8?B?N1UrTnV6RzRiVk5DWGZ0Z3ZKYWFMN0pXRUQ3ZG4yVXJwOTc2d2k5UnVhSEFx?=
 =?utf-8?B?YVBybGw2Qk5FZGVFeW5JQlJmQjhGTlluZXlxTnZzcEpDVnhWMEFmc1hDOVpp?=
 =?utf-8?B?Y3BKM1VHdmlVNGJkcDB4ZDFEMnMzUVdxUWxWN1VxK3JYVXRRY3l0eVMyUWRS?=
 =?utf-8?B?RW5weElQNTFZZTh3THArNks3NXBpazhtYXlPVUVCNmlVWFlkUVUyRUMvYVBp?=
 =?utf-8?B?dGxwSElzMEVrTzBhcFQ3dEdzbXFBTW9oQkdFRGo0ODQxcmxIb3A3SG9YZGEr?=
 =?utf-8?B?S2cvdGRqTUFJaGNIenVIVEtNcGI0aXhRamJpS3k5cEVPdlZVV05UcnpjdnEv?=
 =?utf-8?B?eU9XRDhGbk1HTnRGUFQ1UTAraWtZa2V1UHo5bTcrTXF3TDZDMC9SZHlIa25a?=
 =?utf-8?B?VEtJWTlVOFJVbC9zYWZpZnlPNnR3djAzZDZ0RHJUc0FtbjB2NXI4WmZveVhz?=
 =?utf-8?B?aFBLeXg4WnBnU0J2bWxna3NBQzZnZmVKVnVwcjJJbkpsZUVyczJoVkVtRG8r?=
 =?utf-8?B?VkNJWE5sYWNTaVRyRzlkTGtWWW1xWTJjVTZWUndtcDhFZGRPb2RFWmFFWVZT?=
 =?utf-8?B?Y0tqaTh0NjVUYnQwbmJIT1RpR2NvaVBwWEZHOGJheVl0TU53Zzl4ZmFsejZa?=
 =?utf-8?B?Z2ZvRmlsTzV4ZXcxZEF2Z3UxdEd6QjljU3dwYTQ0WHQzZFJCMGEwT2dKNjFl?=
 =?utf-8?B?K1pwOHY3aGFMNEtoaXpUNGZuc1R3dFJEOStNZXBwSkJOZ3ZXTjk2WjRqM0Fs?=
 =?utf-8?B?NnJsNHhqLzh4ZFpRQ1BvMXFOV2xpQ2lpOFRtdnYxdXhNNUFXUXphMVdSSXds?=
 =?utf-8?B?cUQ1N1BkOVhWL2lSekJzL2J0MWM5cEVXa2M4Sm1mdEdCTkoyR1V1Z2tpaDVK?=
 =?utf-8?B?QkQ4SGxFMVBTNHNUZlJtelR5L050bHZGY01nYzBSN243MTBaV003S2tkc0pa?=
 =?utf-8?B?MnNnTVBSY0tuVmRJRFByRnNVTk1taTVTbjgzSVhBVGlPcnRRUGNacEwxRTIv?=
 =?utf-8?B?VmQ5NEVhWitTbEc5OW5RQ3NmMnFIKzl1WXZvRjRqaDJEK0tUSG1CWXVOWXYz?=
 =?utf-8?B?RGFiLzRMdzhkSUhmQUJENEtUREcydFNPdzNmUGwzVnY4UHNJdmFPLzJ1bzAx?=
 =?utf-8?B?RWJBOTRYNzA5TzllSHhERDNoUldLQzlMN3RSbU5reUtMVHpJQkRyVGlyMnVI?=
 =?utf-8?B?QktVZDlOaHVJcDUvZWlSSDFwZzM0R3VtVk1Hb3RRRy9zRGVoZUtOS2pvZUIx?=
 =?utf-8?B?a2hVQUVlYkM2dzFsd3hNVkEzbUdYRlBFV3FPV3I2d3NWZUV2OGREdmdDSGhu?=
 =?utf-8?B?T3JtUG9IUk1wUktxSWtsM1JWaWxMd2RJVE9UaDE4eU1LQ1VZQjVNbS9PelpJ?=
 =?utf-8?B?QTZMeURHVVhKQmkwM0N0Wm1IbnUzUko0QlFhaHpGY2dRckJnVmtTNFVOY3h2?=
 =?utf-8?B?bU0yTTRSR0R4c0tPdU1QRHN1cXJOQ3FSVXlGUzZ4M3BvRlFQOE15cTBGSVFY?=
 =?utf-8?B?aE5lSGpVakdNS1lGVEVYRDZYUFhxclVYb3dodDVZdXUwRGNIUlJSL1YzYzBX?=
 =?utf-8?B?UWt5QVhqeHZ0cUpmZnZiYTI3eVVaTUlUeXRRdmdLa25SSGRqZGVUV0lsbkFM?=
 =?utf-8?B?RlRSVlNuT3RXdncrRjJUbmZLcVNOM3dObGd1YzV5aW5sUlphNjlHSWFzZzhs?=
 =?utf-8?B?MHFhSllDaWZTTWNMVFBRMDFaeVR3OWowaTBNVms3czh2b0srSmZPM3dmTzZ2?=
 =?utf-8?B?alhEZkFxZGlGTFB6RCtnWTk5RWE3Wi85OXEvQWFwQWxVMWNGb1FRYVVZU0NL?=
 =?utf-8?B?SC84QmhWMEFGSlZTS0VKcTZWV3JEOGMwYkxLYll2V0ltSURYWG9OY2lvdVVU?=
 =?utf-8?B?eGpCY2V3M1J0c0dOMkh4QmsrUkdHbHpBNnJzcGtEVDRZY2RsdUZEalNrTS93?=
 =?utf-8?Q?9w7mjwgOUnxmuFezFL/XPSgNB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053212de-1f78-4595-64e4-08dcc20895b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:42:10.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEtowRB7p1JypPmyyjL6H9oj8AzAi/E7mnlQH8a1+5WAi3RIZTzmyCwqKMxMLeENPIMpYT79umq/rQCfHN9VSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276

On 8/21/2024 12:40, Shyam Sundar S K wrote:
> 
> 
> On 8/21/2024 22:18, Mario Limonciello wrote:
>> On 8/21/2024 10:04, Shyam Sundar S K wrote:
>>> PMC driver has capability to get the IP information, idle mask
>>> values and
>>> STB data from the PMFW. Extend this support to the platforms that
>>> belong
>>> to family 1Ah model 60h series.
>>>
>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> This is actually a fix for another commit in 6.11.  Hans, Ilpo, can
>> you please take it in fixes?
>>
>> Fixes: 426463d94d45d ("platform/x86/amd/pmc: Send OS_HINT command for
>> new AMD platform")
>>
> 
> I'm not certain how this commit addresses the existing issue. Last
> week, when I sent out commit 426463d94d45d, I tested the changes on my
> test bed, and everything seemed to work fine.
> 
> If this new commit is indeed resolving an existing problem, I shall
> amend the commit message to make it more meaningful.

Hmm when I was talking to a colleague about it this morning s0i3 didn't 
start working on this platform until this change, presumably because the 
message IDs weren't properly configured without it.

> 
> Thanks,
> Shyam
> 
>>> ---
>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>>> b/drivers/platform/x86/amd/pmc/pmc.c
>>> index c3e51f0a5c33..bbb8edb62e00 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>> @@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct
>>> amd_pmc_dev *dev)
>>>            dev->smu_msg = 0x538;
>>>            break;
>>>        case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>            dev->num_ips = 22;
>>>            dev->s2d_msg_id = 0xDE;
>>>            dev->smu_msg = 0x938;
>>> @@ -597,6 +598,7 @@ static int amd_pmc_idlemask_read(struct
>>> amd_pmc_dev *pdev, struct device *dev,
>>>            val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>>>            break;
>>>        case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>            val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
>>>            break;
>>>        default:
>>> @@ -630,6 +632,7 @@ static bool amd_pmc_is_stb_supported(struct
>>> amd_pmc_dev *dev)
>>>        case AMD_CPU_ID_CB:
>>>        case AMD_CPU_ID_PS:
>>>        case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>            return true;
>>>        default:
>>>            return false;
>>

