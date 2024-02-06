Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2438127B6B
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Feb 2024 06:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707201527; cv=fail; b=alohnwtaky2UqRBYgpl+nIe0HNDlKRTqDc6FFUSFWyI51nojMmjQFMAbAtBxkc0Th8zGD5pVkmKseWROkZtjBu3m/NJ/VaLbiHwx7x3GB7J9lg8IRejMMdcqUcy+Fjr3+CrRQy6dvwTV3ORAqVB4RpOHZQIeMvRD/0fkgBYyt84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707201527; c=relaxed/simple;
	bh=DmF/IDc/uGi+63S1wFh0G04XI1CmMxqYWAT4r6fR9sE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bzMIvZyx98YLLnjoJoqOzw4gQw6K/MCik7gwc4yl09wIpM1ZGByc8aWiS+v97Xt7NBpa7a6JuhWfh4e/+dWyLwoMXPDA5oRUoqkLTgBOUybloRNdTzPA38Yt5uTXmkgu7jofRnpl5dFqmU1LnzbKL/qC/ma5zyXvz/Th2fc6Nqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e3zO/jCP; arc=fail smtp.client-ip=40.107.244.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e3zO/jCP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2jrXt6m739MY5BqCjul8Mhk4IM/qS0w2ooSFhGImYBLSCXGvJwp3HM/26zw1xKrGCKI4LeInQqjr+1iESowjRaId9gOd7C7Fu3xz0zYl0QGEKNXFkjS4zjsMg8DDPuhCw6mrAsxRSCh6lfb3bxBX+0lwecO9jsVYjXR3pLpJT3WiVpVzQBYdBYqupuieFQsYVpn4T5RD1kv1SY07BGnCCrBrUK5DDzSqsJb94d+zJ1lXTHijyT7rkHffukM3Fp1of64VhhZvlKfSGTtdZRIFr1bb6gXHvCmz1GeKb23bOx1sNuHzeDUaYDNz1pnYvIIn+Mw8nZgRoaGBtP8ia8HNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bU/HWRDJlcBMcbOCegjQsXTnbqDrBQ/K04UlRd7g7Lk=;
 b=Wtwye4VILRY5PrfNTqNqeoBcbehN1Ia50BtE6TFhF6OKA4n/zsopfqyQGirfoU0YmDDd/el4ahg/UmfVRHRL9mHhB+vIKgGHZSxd/dVjlI8XSzFkQd7wBo+w2vFZtfJloZoCU1CJx0wsiSTmTqKm1DeQIsB4Sj2vDAs1BKCw8W33NUJVtHUjDzzT6gPB0+h8uoOW9+PyNeQlQSa2xJDAr90BD7wGibg5BoV9203O71D28hSrQ2rCAPKhja5r2/PXoYkRpT2GnigaMbGhF6smjvaUwHuZJKmuA5piob6nMLoYt2oygeCh16hA0x4MsmqqfsX6Vv/KtsADagMJRRuT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU/HWRDJlcBMcbOCegjQsXTnbqDrBQ/K04UlRd7g7Lk=;
 b=e3zO/jCPz+QzDsxslo1CK0wKiKA6JUTHj+3Eo+20xxBy87+dLIDT+UoAkskhu9/JjD66XTEnrBQYimg00wC2wI/UiaFpLTBkgon/rlYGzS77F9JBnGxdQE1ofWUZfsa9KP1QEfk9Iej5ey8H3U8ZRKz0QvFWeuNGMxls3vVpl/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by PH0PR12MB8798.namprd12.prod.outlook.com (2603:10b6:510:28d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.15; Tue, 6 Feb
 2024 06:38:43 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::4196:178:d5af:9f2]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::4196:178:d5af:9f2%6]) with mapi id 15.20.7270.015; Tue, 6 Feb 2024
 06:38:43 +0000
Message-ID: <4b97ff14-dbd7-4c07-9bf6-5f17cd5c93eb@amd.com>
Date: Tue, 6 Feb 2024 12:08:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc() to
 devm_kcalloc()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
 <20240106022532.1746932-10-suma.hegde@amd.com>
 <8b896046-2058-805d-1998-7ae6d51edd01@linux.intel.com>
 <0c930967-ce51-edf9-c8c4-5e00d8ff7047@linux.intel.com>
 <6a60fd66-64df-491e-8879-3333c8f119d5@amd.com>
 <576a14c5-e0ad-e6d8-fc7a-0e0121f16c37@linux.intel.com>
Content-Language: en-US
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <576a14c5-e0ad-e6d8-fc7a-0e0121f16c37@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::10) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|PH0PR12MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4a00cd-8ae2-4dcf-f247-08dc26de42f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Z177LEsGkbmpcHP2B9k9Dsz2zAgqv4O7aLaXgOufbNF0QIEkzv+0CYihDyMvjBrkfuN59AoOAgqestglPSi40duZm8d/nuQx9d/ONhsDll0nW+veqrFDbFN05vKWPnzGhNCCQM7LkN9P/xFQq0+XfiOZt1cIDqmC36pJ1Y9Ki3yX1VO+qzTwD4NrWUlXldgEBzXXVMyuLoKhVPeYgozYpvZ8q4WSYyT4Qp1QO8zC2gAeIx2HW8c2GYy8G60EqHxzjcZN0oO6I8J9iZFzPONwocw0WYSW2oTkq4YPTV/aTK6gq5ChYPSAOYt41pb2/zTaSuCW9ZJKgljBt/Leh2AdQjhc5m7Csg3o7ssxiDEUIHWISnAcbP2AjVQ1MlCKlrWXTR7+N9uAXgMD/XN+kpN3zaXZC+xS5B1z2X33K5iN/0qfqQde/rrT5k9JSxhBvzMHw01DxDtWzS7g3/K614m4SnA6+M06NlVd+I7rCdTV1CPjnCz/hv81Zv6zQVrKtEuKNPVZp3olDz/8u+nNFpmHlNJAXdtIOUTRAjNSQXiWlhY/gEUBXoKEadPz27dnJsEHqrX52I/AldH3nY/Gh62Gjcu/+K7S9CNZ7KMH3F80Us/qQob71yrwIyPpCPARL/JdYHkSxx5gtpmRPOBg41pQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(230273577357003)(186009)(1800799012)(451199024)(64100799003)(2616005)(26005)(6666004)(41300700001)(83380400001)(66574015)(5660300002)(8936002)(54906003)(8676002)(6916009)(2906002)(66476007)(66946007)(4326008)(316002)(66556008)(6506007)(38100700002)(53546011)(478600001)(6512007)(86362001)(31696002)(36756003)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak5LaGlpNFUyekl5YTIvZTlweVgxMDg4NDV5eEdNVUFQTW01NWtucm1lcjZH?=
 =?utf-8?B?eE42aG5qdXFTa1E4cDAwOUx1eHpmMWNRbkxyRjFweXlIVDZTc1YwMzV6NFo0?=
 =?utf-8?B?dkxhR3pVWnZMM2c2d29ZUFB2Y0pQTmdqWFkyUC9VRkRieDRLcktLODdsRk91?=
 =?utf-8?B?RlZ6NCt1SnhvU01id2NETHN6OFl3K0dRNFhiVTRyaEdzamIxUm9tYW9mOHh5?=
 =?utf-8?B?MXRyRlY4QW5lcU1GcWJxWG53blFqZjhyMGQzaFNWUE5UYnFCS3JRMi9nOEhj?=
 =?utf-8?B?SzRBRS85em1ld1lVNU5LMXQ3R3ZFRlk2eEhDcWIrdlZHbFVaUnE4MWZhcC91?=
 =?utf-8?B?ejY5VSs1eFVmelFXcFBiWmE0bmdGZU5tMDBNZ2RHV0RydWdja2pqK3lBLzBi?=
 =?utf-8?B?dEJFN2pEcU1XOGdlYVY3ZWo3dVVIYzNJM1Z5cGFqMXdsTUJXaVJ5NlFCV1Ry?=
 =?utf-8?B?b2R3dnVxRTBmZ2pTeDVsVlNJVENOakRLMGl0NisxWElMOEFlRjVhMVhhSEZq?=
 =?utf-8?B?R2V2WC9nVXZycEYvQ0wrMktBcVA5Zk9Ld2x5bEhSSU5KUW5TQWNPdUNNYXhE?=
 =?utf-8?B?L0FPQ2E2MnZYdmVyUkhqVHRXeDMycElpSDlKOGM1MmVObmQyK2taVHBTVUZC?=
 =?utf-8?B?RnNwd2FoR2ptRTNERGJmV0dXK2o0MlZWbFc5VVRIWmtTN3ZWS1p1cE1JR2th?=
 =?utf-8?B?aXZ4WkJ4d1VhLy9IdmIzSEJBenlBVy9KTTFSWGFUUi9KdTg4RnkvYU5saTN0?=
 =?utf-8?B?WWpwUmxBb2FHa1ZzK0JralpRTVlybE5CL0p1V2QxOXVjN3ZtMDJDR2phYUcz?=
 =?utf-8?B?OVJDUmsvRitUQUdkNzlpUzMxeFlIc1hNYzNYWWFVMXFSU1JUTnl4dGRHZjJB?=
 =?utf-8?B?WHFzOFM4QklDQmpNTVI3cFJUSk40ZjVwVjZTOVZhbXBPd2xveTRvaDlRSVFx?=
 =?utf-8?B?K1VlaXRJOTRHTncvYXRxT0JlL2dGV0gxMzRTT0Zyd1BJYXBha1c1dWc3dU5G?=
 =?utf-8?B?V1hNSnJLVWpVbTVtQWFsWFMrZDMwaXdDNmU5MjFlK0JVTmJRdDBoRjR4QXB6?=
 =?utf-8?B?VnRIeDVnYXg1c1dxaUs0L3E4ZDJYUjlwNnRMQzJDQ0RmZDhGNWZEVmpYSFFr?=
 =?utf-8?B?OXhqejJmYXF0cDdtQW80b2VPSTlYMmFZQ3hPQVNrQUsycC9vcXltWHM0RERV?=
 =?utf-8?B?Mk5teCtqN3pUSER3UG5HUWRXWkdOSmV6OCtwYkRmcnk3dkR5SFJnclhrNEx5?=
 =?utf-8?B?WExtcFF4a2prQk8vT1MwRUl6cHJxMmh1L2VlT0EyaDZVRXd0UlBjZ2xIaFl4?=
 =?utf-8?B?ckRUdDJkVzA4Z3hYMlkzeGZnZzd3ellwZmVKcDA1WHg2aUpXWG9GZTYycmNs?=
 =?utf-8?B?OHhmUGptclA2VU51RXlIUnFPcDlyRnhGWkNydC84cDRMeEdsK2ZvSi9XeDI0?=
 =?utf-8?B?N21hTmJXMEtxckx2QnpsYWg0RUpGR1BvZWFPSEJ5cE01UEdLcHpBZHBrVmJF?=
 =?utf-8?B?ajNhckY5KzlnTGx3Mm5pTUVsWHZadFJtZ3JmUHlxems3QzNDOEx0QlZ0RTVW?=
 =?utf-8?B?c1RnV3puY2pRVTdQd0c5dnFqbHd6OEtja0xXbjNVUEZKUmcvbHBROXFtcmM5?=
 =?utf-8?B?TjhLUWxqSVVJakFkYXlhSnBidDgwMU1PbW5wN2NDd3NIM24yZThiVzNMc1l5?=
 =?utf-8?B?NGx3YnlOaFpjdXVvU2xqNEZLem1ReFJjWWFVdVp3TmNsMTUrTC9CTkR1ZjBQ?=
 =?utf-8?B?KzV4ZUNOMEVJM0xuNzdNejd0TzBQbXZVdndWNHlUdXY3V1AwWExvMVlFTks4?=
 =?utf-8?B?d1NLQks4UTVtYkE4QS9HSjBpdXRqTDFvYXVDOENnckhpUUdwUEdUVDZKT3cv?=
 =?utf-8?B?WXRqMkMweFcxaDlua0RSaVB5MS9DZkV1N3NNWFhNbjg0ZDhhVkx5TGZPbGFw?=
 =?utf-8?B?eElZckFPRkxvQWVVZUxiTGZlZVd3c20zbkJFc09NTThCRFRnQjdoMHpXRkVH?=
 =?utf-8?B?WGZmSEZnS242K29sTFJ3NkcxUUZuQTRSQ1U4K3FvOFRMWUlsdjZzZG1kY3dz?=
 =?utf-8?B?eG9uMlE3dTliQWc3UDBkSHZkU0xiUGE0cW1UTHRycEUvdlZUNlNnNU1sNzJh?=
 =?utf-8?Q?nrE+sh5BEmlaC4B8h2bZ8RxMm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4a00cd-8ae2-4dcf-f247-08dc26de42f9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 06:38:43.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLJX+WszjgGlVPUd3UcgwD/28q7/SarWcvaLb62cqZD8ySu/qUeY75mkSdiXzMrV91PGCBILzFRVBhQKpd+5mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8798


On 1/31/2024 4:02 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Mon, 29 Jan 2024, Hegde, Suma wrote:
>
>> On 1/29/2024 6:14 PM, Ilpo Järvinen wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Thu, 25 Jan 2024, Ilpo Järvinen wrote:
>>>
>>>> On Sat, 6 Jan 2024, Suma Hegde wrote:
>>>>
>>>>> Use the standard array allocation variant of devm memory allocation
>>>>> APIs.
>>>>>
>>>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>>> I decided to apply all but this patch 10/11 into review-ilpo. I fixed the
>>>> parenthesis issue I mentioned in one of the patches while applying.
>>>>
>>>> Please check the comment I made against this patch and respin this one.
>>>>
>>>> I also noticed while applying one other extra parenthesis case in patch 5
>>>> but since it was not added, I didn't go to tweak it now myself, but just
>>>> you know.
>>> Hi Suma,
>>>
>>> There are number of issues and warnings due to these patches including
>>> one build failure due to lack of ACPI in the config (I think), can you
>>> please take a look at them.
>> Hi Ilpo,
>>
>> I have pushed patch with fixes for smatch error and warnings.
>>
>> For the CONFIG_ACPI=n build failure, I have added "depends on ACPI" for hsmp
>> driver and pushed patch for that.
> Hi,
>
> I've folded your fixes into the relevant patches now.
>
>> But we support NON-ACPI probing also, there may be x86 platforms with ACPI
>> disabled, is there a previous reference of how this can be handled
>>
>> without making it dependent on ACPI in Kconfig?
> Given you have quite much code that relates to ACPI case, perhaps
> creating hsmp-acpi.c wouldn't be a bad idea so you can make that file
> depend on ACPI without polluting the hsmp.c code with #ifdefs.


Thanks Ilpo for the suggestion. I will address Han's and Greg's comments 
and later will work on splitting the ACPI code into separate file.


Regards,

Suma

> --
>   i.
