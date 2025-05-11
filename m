Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54B2F41
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 May 2025 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746980558; cv=fail; b=dMgkgFNY7eTUy6em+0a4JpVBaSpOJC07cznqbL647zMMDCG8CEBuoAJXiFJ/7wQzpnd176FL7rxs5n1GWEGzIk1as0XrJqST8CeK+NSHuwWqElLyofBXN1TPRUts7PjnJQ0z6iJdoRt0umy29c1oW66u40qPnhWkOaeypMs9Ou8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746980558; c=relaxed/simple;
	bh=WUKgLxCerERYEHv016uuRAQGnKx/HLjgHm0Z7Oj8gR8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QqTNv2Oo+LqeiQ2bc2Ttj51Qe1lbOey7bCE7sfXaBlFU9Be421rohESQeEdFcUag5Gufz6Y4uLmxEb6pCm/EkcTTTm8sCjHyeiBdnQOccPOZvfrXji7GkfHS0RCOlih+qpVHz/fK5woKXeMBJ2IVzqJKpJm6DvwCOIFuMsKqQGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=v1VTuV72; arc=fail smtp.client-ip=40.107.237.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="v1VTuV72"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2z0Li6ShuvQrM0aGeCrtW/SCPDJdx8tzePi/azGuPOLZOtCB5rs+AqUBrUq6G1mH4EFSte5hSYimdUAJ+aaZv31sNCPiTuYDtHsOev1RbXBlx1qqgmVSo4QLlrW9YVon8ez5zAyjJpnHJ3el+AEhk048EIUha/fHxfcNf1omF5jQYFG9r3HkRAQseyvvVf8e33aSFIFQ+W2c6jXvzb+cocRViHiyiov1DuYzujaBjuva/pT6/QRohzzMc+rwJvuIxrWo79mVdVKUy0VCra6raH1n2KjTJ9MDl7d9P6sGc4MwIHa4UqBjn1l9neOkNrlkIIZP8M4tWofi6TkAg47ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DevaV5scd4cZO+KeAAilZrEfbys01MaXviUoGq4apiE=;
 b=Wf8LaAOrdPTXio+diNxO/pRohHz4hg070PQwr/Kfl/5RwesFw4OcaLHETyjjBf/Yr306WI2niRqwZB+4bp3M9h7rMyqOr7CldvBUI1brGPKDIb/h+4tmZ2stj5jtsTDCBRfHGkhTS8cJvQ+L3k0/xQzi0lhQ3ObuGd/Zoe1RHryWjhFQMBXamcMgSrMmusNgKoS/DYAOLEGqJBYXq+HamOEuPOzazJmFXgcG4oh34ZPI30jmr5GipY4jqD/Fd9zRLdvoNXYegd5bjFRahA6hrcAJQ7F05GEXmZTHv268wrl39OQ9FB/C+a4v9ZP0MCjmnsyq92D7io0IvEBpJRPxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DevaV5scd4cZO+KeAAilZrEfbys01MaXviUoGq4apiE=;
 b=v1VTuV72Wob6AfRbEiRivXFsf1+Z0mSHKT2bTJDsJW08ZysI/wjD+2sEo3apy7npBSivkVkL6bk29kb68M3kTHjZxb3050DdeXigR/zkVd5e8huO1Q+9NiNSweBZOfyEswqHifXBmCvHq+e+OE+4raQNWf8eOhrziLB/Iambab0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) by
 MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Sun, 11 May
 2025 16:22:33 +0000
Received: from DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a]) by DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::5df0:a9be:ee71:f30a%3]) with mapi id 15.20.8722.027; Sun, 11 May 2025
 16:22:33 +0000
Message-ID: <3984e564-3f62-4f20-978e-4eb6b21dda1b@amd.com>
Date: Sun, 11 May 2025 21:52:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 1/3] platform/x86/amd/hsmp: Use a single DRIVER_VERSION for
 all hsmp modules
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250506101542.200811-1-suma.hegde@amd.com>
 <0f6fcfc6-f79f-e5fc-fa3e-6a6b6a5956c8@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <0f6fcfc6-f79f-e5fc-fa3e-6a6b6a5956c8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::17) To DM4PR12MB5962.namprd12.prod.outlook.com
 (2603:10b6:8:69::7)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5962:EE_|MN0PR12MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: 8664b530-245d-47be-955b-08dd90a808bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVlybEhYUVBlRm05Nk5ZM2Zyako2V0hHR2NhOVlUNkp1YzdrWEMwUVQxRjhP?=
 =?utf-8?B?TTZCeDBWWlVjNzZFWFVGMERqRlBFbkFqdFE4RGxFalkxTDIzd2xVYnErVE1Y?=
 =?utf-8?B?V3lCUVY2VlRtOUNvcE9oZGFTaW1mUGl5OTBYU1NNM2xLQzNZMUVwWnZIVlJI?=
 =?utf-8?B?VC9mWUhnRWp1YkNmSWU1cnFSbC93S0xwNFJhR1Vici9FK2dYOHY3QlZzaUZI?=
 =?utf-8?B?TFZzNjNweXluR2M1czU0ZlBJYklTd251QXkrNjhMU2d3YlFPaURPOTlUbXBn?=
 =?utf-8?B?QzZnQjdGc3kwRkFtNFhKLzhCT1VUamhjNzZrSUJTaGZGMmZ1K1BEN2U1UTZ2?=
 =?utf-8?B?SmRSeXFzZkJKYkQ0QW9aa1RKQmR2NnRNM2trVWJneHptUUFVbUlBbDh2RWcz?=
 =?utf-8?B?STBkUy9DdVNZeW1yRW13ZEpYN3FJK3F4UU5MclBSWmJGNC9pVjBFZWdOcE1R?=
 =?utf-8?B?MmlkT3E0OW9BMVNNaEd4RFZONm8wZVJhZ2hCRzBLRitEdS9wRGJkNTVhVDFx?=
 =?utf-8?B?RmZmTjZhSkIzWDhWQkZWT0lObzJ2YUE3YXpxbndNMnp4cHNvQ2dNU1RvUHkw?=
 =?utf-8?B?eTJWR2xmalAxeUtWOHQ0aDJ2ZWp6UTVVZzZ2OG9Cb0w0VGJ2eE5ERWJuR2hi?=
 =?utf-8?B?TVRORS9JeHRBZE5JVSsrOHpockRaOFlqMU9rSzFDOW1FTHJIdXpMMm5oK2Jq?=
 =?utf-8?B?T0pIa05CcWJod3E5WHhNN3ZWRTUrZTdjUno2KzFRcFZpKzZCWU1VRFhpTExZ?=
 =?utf-8?B?eEhNVHN5YnBoSmMvUm1ieDlTNGx3dzhGUzdSSU1Rbi9QYlJLRXlFKzNReDll?=
 =?utf-8?B?dUd6NGkrcGpVbXBYejd4aEVQMmFMc1B2V3VHK25nbjRsMnJmVUtkbG5DeG9I?=
 =?utf-8?B?d1ZoR0JBVU1WNWVxdTBmWnpyVXlvTFZ6a3RnalZTVnZNOHpENCtNZ283SkZ2?=
 =?utf-8?B?NGhFVmdMV2YvV215eWNxZ3VwUlNkZTJmczRoYmZaQXZJNCsxK0ZJeWxITW5R?=
 =?utf-8?B?OE12WnBQTEY1TTJ0QjdRK3lOQWJJVmdyeGFKNFRLK1ZkQkZXR2lNQ0hRN1Yw?=
 =?utf-8?B?ZUhrd2o5Zkp6OVZKL2dCeVcrdXpmSTRKakphU0Rlb3ZzSDU1M0FFc3o5cEVy?=
 =?utf-8?B?RTdXMmV1YmdHSDhpalU3YmR2Tk1qMUwyTTVJZWczZS8vVFlmU3BHY3lNclZM?=
 =?utf-8?B?Sk41NC9OcEtXQU16SnladS91WU5Bc0xheks3TmlwUGdFdnQ1dEJja1JkVGFZ?=
 =?utf-8?B?QWZSOGh3UmtvOWVnblUyMGI1aCtYWHNKeDRYT284L0ZCOUpSaHpsWExPbStI?=
 =?utf-8?B?MkxpMHFRT29VTDgwY3BqN2FJWWdDUyttKzZGUXVVWGZHSjdoN1owbnUrekVK?=
 =?utf-8?B?WDhRQU00V2l4UEdNR1N0aVhYTUUvdzF5eHFwaUhwc0M1YWJhNTRIamV5dkM0?=
 =?utf-8?B?S3QvVUlUajdwTmNiWnNyT2lENy8wVEgwNXZpZk1NdHVOcEs3SzhwRElZVzFK?=
 =?utf-8?B?RTdnQ203cnNoVWs0U3JJWWpCc2NPS0pZa2VBZU9NOEkyRkEzOERjNldaVDc1?=
 =?utf-8?B?TXlUU0ZSVFNFMUtIekdQc1NLZjZaWGFsazBOMGhoRHE0ZDVJNHNZRWRaNW9r?=
 =?utf-8?B?TjJRbjE3blc4WlJkcjJ3aEsyVkwwRndrcU5hdTNhMUdDcUZKZ1NtbGMxVllC?=
 =?utf-8?B?TzNmSnFPTmlEZ1JhU2NaTkY1c1RnT3MzRTFHRFJnNHZPd3Uya3lwZU9QMlpJ?=
 =?utf-8?B?clVnRldST1l4cDJON2IrQWFlQVRQSWdwVytTeFE1aUVTVnRST1dyRXhqNG1j?=
 =?utf-8?B?K0gvamgzWW9XMUMzdWhadGhsN1duVzArRENLWUp6ZGphSTMxblpiMTJQbWVu?=
 =?utf-8?Q?4yBh3LlJo2WfZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1VEd0FuemZUd0VWbWcyK2lqNzV4Z0FBSGNuMnhtSVkzUlJiWUowZy9OM0JT?=
 =?utf-8?B?UWc4MXQ3Zi9VSER1SlBQS0E1VnQ5NHFoVjhyL3Joekk2WTJNTDZFenJzVWR6?=
 =?utf-8?B?RVB5NVVqaUgxMUdCL3pBSEI0c2xWVGRzV0JhWXlWeFArUXVJV1dZZWhIQlFO?=
 =?utf-8?B?WmcraDJYV3JCd01kVFNZS3RUYzhOaHg2ZlpGMnE0VjlOVkJaY01ETTVWSDJz?=
 =?utf-8?B?eVp4UDFHcFA4NjZRWmpnRUVyMHR0ZXdtY29RM1ZITDMzUHNkLzFzb1I4b3ZV?=
 =?utf-8?B?eGlzb0x2cFc3TDdJRUduOWF0Z1AzS1dBd0J3OFRxY21COUlWLzlSUmN0VUw2?=
 =?utf-8?B?MnBvdjZ1bXJVdzMxUWRTNUU3bC9IUWZ4cjhXRVA3MlQwakprR2hKdno2dHFN?=
 =?utf-8?B?SU15bkNyeDhHOVNLamZLazN6TjBBaGIyeTdJV3RmQ3FIa00ydHUyeHdFSld1?=
 =?utf-8?B?aGtUKzE3bitjcldDYzArR3FobS9aV0RyQnpXcTZwTWlpQzJiWk9ERVJ2c2lT?=
 =?utf-8?B?S1h6WFlDSWE1ZHplSDJEUFpjS3ljMzlTcGZoaWlwWTJicFFqNFJtcG9NR201?=
 =?utf-8?B?TXZtdDVIYUdDano3QVBBcTJyWWtaT3ZVU3UzdGZudzhEQ0U2SDU5a0QzVlc3?=
 =?utf-8?B?N1lpd04rNGZsVzJodnZ6TldCZ2lORHVjWkFXQnBkWmxwL2t5WjRMMU96Skx0?=
 =?utf-8?B?VHFGNmd5K3E0emp2TDd5OG1pR2VUK1Rqb1RzNTY4bFk5Umx5cXRVb0RERDc5?=
 =?utf-8?B?U3NKZ000TWFFRkEvUlh5dERNVHVIZ2xyeUhUc3drby83VDluSVR6SUJBTk81?=
 =?utf-8?B?QmtEeFBITHFIQ2RGeHA1aVh4VnlReHBIM1k2b2pqOEZ3c1VJNE1YYytUbUFq?=
 =?utf-8?B?bGF3OTMwRnc0SUtGZVVMYTJNUlpmKzhPWnA3NldJdVIxVzlPaWtMZmxPVTF2?=
 =?utf-8?B?R2F6ZDJxby9xVE9GT25PWTJtMjlVRUEwRHR3WStPOTBka2UzdFlWQnE0K2da?=
 =?utf-8?B?RDZiSDc2cWZabXZ6bUFPK3VKNHpRZWNiVHgxSFpLZG9Wd2N5a1BKS1dKcDFM?=
 =?utf-8?B?TSt0TkErcHFSOUpSUXJ4QW9SbGFmSktaSVZZWHFQbUZTa040ck9ISXV1dkRa?=
 =?utf-8?B?cFYzbnN1VGtndWhjek5vcWc1U2paZTdMdmNvb1NMU0YvNGhWSkVBMUVPck0z?=
 =?utf-8?B?MUlQSVA0WDNBOFhqMVplMGYzUEtSMHFLTllXN1JQcFY4bCtJSFRLWUhBQ01w?=
 =?utf-8?B?bzV3bTlkbFUwaUh1S0RSZTdta0xLcGwxYy9uNDVzR3ZMZVN5T3FWcExOcmsr?=
 =?utf-8?B?VGVPQmNOenlGUDVFRXcyQ3RWcm1XWkZCNWx3cWhCOTBQNGxWcEdCVG83TGJu?=
 =?utf-8?B?aUJlRWlFaUFRMElLNzMwRzJYRytsZzFFYW5xS0hDa2pmQVU4Y0RTQXRIdE12?=
 =?utf-8?B?dmR0M1BuWVl2cHN5N0dJNlJlWFZPL3NtTnV5TWtqS2NjR0dmT2toekt5UVlO?=
 =?utf-8?B?UytBTzB4Z2RuaHRFQTNERDhmdFk1SUJkR1E3WDlKQ0hGUy9SUWhkdjNtbkFz?=
 =?utf-8?B?OGhLNDU3WXp6cTB0SDdUZFhpV2V5NWQzSnhHbkhLcXU1VElScjdpZEEzS2lj?=
 =?utf-8?B?ZTJlaDYxRzh0bW51SUlxUjduSU16bkFnOFJUVkt3K2RuREI4WGJZVXFFemlL?=
 =?utf-8?B?YmdIcWw0ckU4T3NuT1Vnc3UycnMydXlLa1ZCR1ZiL2UydndJdjdtaGtObjFX?=
 =?utf-8?B?ZkxzdEt6dk92NkNsK0tTa0cwd0tqNFFOWmhBREVFVTNrNzFGQ0VFTnphUStD?=
 =?utf-8?B?Z3pCYkM2T1orVXB2MmhVQkl4c3Q2TlAyVXI0WGZ1Z3lTcVhmeDFpR2V5R2Q4?=
 =?utf-8?B?ZWM0Qm8yOWZNYVQ3OXF2dlFMYlgzbWRHQXBGQU1Yc2QrOFZZeFdtOEhSK0VV?=
 =?utf-8?B?UHBEelU4Q3EzUEhDejFzSFN5aFpIY3UyKzBRSE90NjRscThyVW83WW9WbXY1?=
 =?utf-8?B?NkZlYUhtaVRyK25kQlMrYjg2ZjZyM3BGZ05Od1l5MUNPZTNDbHp2WFkxNGdB?=
 =?utf-8?B?K09reDZtWnNEY3dmUnZGR1RFZmFNamFZdm12R2RzajZLRnFRb3VhVk5uQ2NV?=
 =?utf-8?Q?ZDKFn2MrZ6NOu86Tc5qT1+/pA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8664b530-245d-47be-955b-08dd90a808bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 16:22:33.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c80tbnxpa2hkedHQCogTHYuTG5jVwqjmYQGuRxM/Mq7aNtuZpx5OfM9NsHO7m979tl9nzZp+5nENO8NgHpkzBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956

Hi Ilpo,


On 5/8/2025 8:04 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, 6 May 2025, Suma Hegde wrote:
>
>> Use a single DRIVER_VERSION for the plat, hsmp and acpi modules,
>> as all these modules are connected to a common functionality.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>> Changes since v3:
>> None
>>
>> This patch is rebased on https://lore.kernel.org/platform-driver-x86/20250425102357.266790-1-suma.hegde@amd.com/T/#u
>>
>> Changes since v2:
>> Update the commit message and description
>>
>> Changes since v1:
>> None
>>
>>   drivers/platform/x86/amd/hsmp/acpi.c | 1 -
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 2 --
>>   drivers/platform/x86/amd/hsmp/hsmp.h | 2 ++
>>   drivers/platform/x86/amd/hsmp/plat.c | 1 -
>>   4 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index eaae044e4f82..12f4950afcd9 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -28,7 +28,6 @@
>>   #include "hsmp.h"
>>
>>   #define DRIVER_NAME          "hsmp_acpi"
>> -#define DRIVER_VERSION               "2.3"
> This fails to apply on top of the review-ilpo-next branch, I've no idea on
> what commit this is based on. Could you please rebase and check if the
> entire series is fine wrt. the changes what this is based on vs what's in
> the review-ilpo-next branch.


This patch series is re based on 
https://lore.kernel.org/platform-driver-x86/20250425102357.266790-1-suma.hegde@amd.com/T/#u 
(I added this as part of changelog)

I rechecked by applying this series on review-ilpo-next + the above 
patch. It applies clean.

Could you please take the above mentioned dependent patch and apply this 
series?


Thanks and Regards,

Suma

> --
>   i.
>
>>   /* These are the strings specified in ACPI table */
>>   #define MSG_IDOFF_STR                "MsgIdOffset"
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index a3ac09a90de4..3df34d7436a9 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -32,8 +32,6 @@
>>   #define HSMP_WR                      true
>>   #define HSMP_RD                      false
>>
>> -#define DRIVER_VERSION               "2.4"
>> -
>>   /*
>>    * When same message numbers are used for both GET and SET operation,
>>    * bit:31 indicates whether its SET or GET operation.
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index d58d4f0c20d5..7877cb97993b 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -25,6 +25,8 @@
>>   #define HSMP_DEVNODE_NAME    "hsmp"
>>   #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>>
>> +#define DRIVER_VERSION               "2.4"
>> +
>>   struct hsmp_mbaddr_info {
>>        u32 base_addr;
>>        u32 msg_id_off;
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index 81931e808bbc..4f03fdf988c1 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -24,7 +24,6 @@
>>   #include "hsmp.h"
>>
>>   #define DRIVER_NAME          "amd_hsmp"
>> -#define DRIVER_VERSION               "2.3"
>>
>>   /*
>>    * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>>
