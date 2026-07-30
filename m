Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222CF34B1A7;
	Thu, 30 Jul 2026 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405727; cv=fail; b=sbapbwXRR9r60df3DjLFVYe2nK2Vtj3OBi21/+bHtmnqnMIRdzPWgAupcAE/OKsjJHKM9HJ8NzAD9lOvhsyCK5w9+dh8Dih+ziB66D9ue97nqbmPAGkd/eFGI57pz/Z745qyCHTpA1BEvPxbwKxcNcYYXNgCSj5wiE4GxYgMOyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405727; c=relaxed/simple;
	bh=qBFbvPDqHwUPEIggQ5CHVec4EN902nIUHKF6I/ocFw8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wqv1YqKb3xQE1Eqs+YiPUshljc0isAYNUdnJ7TTVoqoPcL7OmEBLkPRop4Xc9zqm9HerHlchTuWi5kSlRYRuS2KeLbDBRJID6XclP0uJDm9PLY5Rh30ZbomMYT5euseQqJ4tsJjwVH6KoMIjvTjqjrRGPhdMSAx/V8nJcu42+FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EjArBSet; arc=fail smtp.client-ip=52.101.62.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EjArBSet"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwgInkgjbmbPcebahhzklfHxyFH1AM9NIpOZuUfrR7W56Jq6r3pnucvuNh0J8ItXxPbtDWfTDqtdD+PiP9WTKzPq40h/bCpsFjcZ8uEh1TKRhHhBHwMGBlXjXUyPa3RoCuUdrv3Vp1BEMc9Kp5Irnr7CWOEC47jwvnNvFya9ACrUXR+ugjoz3rTj8R2hyNrIskQnNWh2iAClLUgR1/WVFthTOB5sfX2eWTFBwmPkDYmHp8SGyaG7cftQgjhNRrXynhd1luPV1xnAuZB781gWwJjilf49lpGMcCMWfstblR+5H7z3sEkjinSLg3ehAwY00DJ+J2bVWzgE7OkExY3lcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBW4ntsCW9S0cdKkDGAPm4xATEYIqW/bD4H6DNt5svs=;
 b=UuyA4D9GKkQz2L0JJbrpUxRnrOIOv1wD7ONFiAfGRiKQtSQU+0853h4eNUzfR+wdvAzvKl/OgNPDRCYs8231KgTJMi8Pf8NkPZNvCtY61+wCGsufyWj8bFh3x5pJ6as5jp0qle/g1j385YFFgcPuGXWKPPntKZuKi2hcjITAcf2Fi2kdrRTPUTqQkwBTzQG23qhbPSYi9kcVzVWsF/sB6h8W2GSgjttLj0SluWDIAtCsECWKsSSY1yY9V02rzpWAxhgkSpOpH4563rh0gjgHUAueScW8gZHz4WG6FKX37kdqBfYSv5BjN5z4RIz104+PBxZNCIHTZ7Ld2PGaxQhsSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBW4ntsCW9S0cdKkDGAPm4xATEYIqW/bD4H6DNt5svs=;
 b=EjArBSetNLNxScMckPndtZaLAB4a99DKGAfm6qQyv+SUsC49pTPKRE0Zh105eCAriqXDq0La5SjA66wmX64rvjYeDVcUw7oLBLnj9NxoMQnwLwQ/agWLZIsVuUJWkg5dRM4kvMwxlzUgqhuZXzizteSNR32ivbWwsPytI7qYDL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 10:02:02 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 10:02:02 +0000
Message-ID: <b7aade7c-f77e-4440-9562-ec618b6aee2b@amd.com>
Date: Thu, 30 Jul 2026 15:31:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] platform/x86/amd/hsmp: Leave the hwmon power sensors
 off on client platforms
To: Mario Limonciello <mario.limonciello@amd.com>,
 Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-5-muralidhara.mk@amd.com>
 <5348d035-b263-49d3-9067-264cdb4163ab@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <5348d035-b263-49d3-9067-264cdb4163ab@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0274.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::14) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: a682f54a-b3fe-4f6f-b8ce-08deee219a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|5023799004|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uOM3tpuGUKcFuHuAry+DG7Bu60OpRYIB3NybsU+z8fwJ9KUGIi1eXhcSnAHCJ7SoW4eYsAbmiPCBp9/VJ3jAcCVoxg1xxxLjPpDXUGDr7l958ozXLeu101FYUc3qw8EagGQOVk5fj3MBI9Bv41JaCGAiuOVr5oK83L0u2zP0JyYg0q1oP380l6T78lfLucDJYylnXAHzG+GjoOgpMu6QjasanJemkVsuzXr/RrWNsCoSye0baDaJdLCK0bkA1+2oXCnP7LEJvGE0fITXNbXzF8nojPM6BS8eywenri7+QRMATqwskcjm/jfWCqW7F4DWA8rVltPB9XYKQTjSIO/FzNHqvALxCByPUxJ9H3m1faUlKTxZaMLbPo48LhJ9isVV30zQSCryog6jH3fzImPZMXPPanVrKTfPLRJat27ppNyOEitCHSDcfqcUaH79wkiPxQ3f6IXeDPLZuvXuavU4XHTwNCRWMes45VhFOmq8C6F1uNlzHAn2PonXLk7OPaTg9Kscp1qyVouk7RdQ/rnr+y1MKZ0dy72NdBHcgl1bJ31uH5n1rE0wDcmKUjTQJf3xXVdxANIqLkQ5zkX2B9ZCyuwOC/QdWutLbmBlkd8EB5sC8O69GbfQBV6Rt73d081F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(5023799004)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2VYbThybTZVM1BsZ1lEQktkT0V2MjF4a0Vmc2pEMFhPVW95K2h3RlFBNUp0?=
 =?utf-8?B?NU5Ec2lGYW1RZUxDSDhCTUdLVDRlYk5TelBwLzVSQjNZVHIvbXFvMW9mNkx2?=
 =?utf-8?B?YWxFVmYya1BFcTZQaUpGZmpGM1doMXROSnFIYjdiTHdqNC9ob21mb3piUllx?=
 =?utf-8?B?cVo5UDB1TzR6ZVc4YUhTN0tqaTRIU2F2ZGJVNmN3VHB0WWNXU0JDWGxjVXNR?=
 =?utf-8?B?NlFXS0dUaVVTeWFmUGRqeFJpOUwwZHl1MWsrdHJhNUw5dmNlM0RVQ2M0eVMr?=
 =?utf-8?B?RitPaS9LSWNtWWRTdDVFcFlCU3JleExER2pUdWpmNnBvMGtFRmgzSVBoNU9H?=
 =?utf-8?B?RFYrNHJXejBCb3cvWGVDR2JObkxvb0VRTVRzejBLWWdVcjVZditaRTlLbm5z?=
 =?utf-8?B?M2tnaDVScE5jWHVSODNGT0s3M3gvc1Vrd0tSZjlRL2FYNUd2aDNzQXBDa3lu?=
 =?utf-8?B?WVVFSU1QN2FTbEtXTWNvT1Q4YzllaDRGRUlUUkJLU1NFcXJ0ZDQwSGpNQXQ2?=
 =?utf-8?B?YXI4QTNQUEtiYU5WN0ZIUW84WFZ5V1JUUitxSWc4a05WTTY5d3liM3RVWS9I?=
 =?utf-8?B?OWhRV1JibmgxeUNPc00vQVRoOTNyRGZEZFpHem9td0E3d2Uvak52ekR5V0Ra?=
 =?utf-8?B?bWJNZXg1c3BRT3d2UVVBR2N5REVRckxNQVZXZjdYYjd4dDd6OHJPTWc3a1JV?=
 =?utf-8?B?dzQrN1dZamxXQlB4ZGdoWGpTQW5BdjJUNkl2VkNhSDFDUVA1R0QvZ210S1dB?=
 =?utf-8?B?OXE4dkhUS0ZoWDRHOTcwcGhqUkRreTc2QnNkUU14S0FxR3BMMzJnNzNTSW0y?=
 =?utf-8?B?VXA2RGN2OHRVaXh4R0IwOURma04xa09SNXg4MzNETEg1bTBrcFZSaUIrZm82?=
 =?utf-8?B?QUhXem1JYW1KVk1aSXZjLzJTNy9TZTVqaStBSDQ3YUVJQzQzMXZST1huL1RD?=
 =?utf-8?B?RHFXZitRRVY0TktZQXlLbUQ1K3A5OWNSQ0hMK0dzTnNUSURIbE9mWDFrTFJ1?=
 =?utf-8?B?WUdteVlPYWZTeXNnaVdxaGFud1BvNXVqeDRRS3JFRmtMR0NOaEF1VzNkdFYy?=
 =?utf-8?B?bkZsakNjRWNmQUdsd3FZQWNycVJIeUVRNENUcVNQaFBmTHhjOUluWXQvK0xj?=
 =?utf-8?B?RUxsVFZPZ05NTXU3N2YyMjQrd2ppbkh0NUJVZ1QwbUFVdFBOVjFwNTFNMnpW?=
 =?utf-8?B?R25naDk1OVdwRE4yTTNBdEg2L2M1T2krRXpLMXg3RHRUdXJyT0VreFp2UjFQ?=
 =?utf-8?B?RCtIczVXZDk3dFFDdVpRQWtwdnVacThFSjFSaEV5WWIxZTBUZFMySThjZnQ5?=
 =?utf-8?B?T0FtSXZrNG1WelBpd3hkSXdQU1VXOXp4cE5OZkpWVjBpdk5OMFlDMFlyTkhL?=
 =?utf-8?B?bURHWGUxcUpoUHQ4U3ovS1RIM3NKeHFySXhJeUNFMHFxZUt2elVqRUdmTjV6?=
 =?utf-8?B?aGo4SmJBdzBpVFZNemtNRlB4b2lzQnh5UmVCR3dyVjBZZmtoWFA3ZWNlRk5q?=
 =?utf-8?B?TXFVSlA5ZjVNMGUyTVA1bXV6cjJSMnhDN0VqVVNwNjc0NGNGV1lBODJ6bFNj?=
 =?utf-8?B?UHRERzFWdHRBbXlMSWNZSHFFVGpHUGlqVFg0K0ZPcmt2SVF1bnBUYld4aHZG?=
 =?utf-8?B?NysyZk1vVXo3cmMvRWc1S3lLWnFIVG5HT0JHL253Y1lIZWN0SVEwNEZmWjZu?=
 =?utf-8?B?bTNuL0NHdjdJNHFHVXRCY09IcnlzNTZtdlFMR0pnUUpDc1NhbXphTE9ZQ294?=
 =?utf-8?B?aVN5VHF2WVI3VGxzVFVjU0x1bmJLbUtqRnRsTEhhMFlkMkN0aStncEwrR3Ar?=
 =?utf-8?B?RzcwKzY5Y3E0OFIvSktSd2VQaEN0UGFlU0dGVUtSd1JKaEhROFlVckI2alRL?=
 =?utf-8?B?M0ljSTNZV1dUVzU3d1FmT1BZaUpSaVdFR0YyaThsRVh1N2o2cVdWVXd0N2p4?=
 =?utf-8?B?YVU0czhMZ21nOTJuSmNNQ2p4NGJSVjYwL2FRM1FhYlgwQWJKL1hnZzVzc012?=
 =?utf-8?B?T0I5V250ZXhhUS9NNGFOcUhEaUpZdlNPckoyakNscFdpa0RrRFEzdkRXSXZC?=
 =?utf-8?B?cllUMWZHT3NDWll3SVkxRStGOU00MjltU0xPOVFEWllWN055THZVbTNnVUdh?=
 =?utf-8?B?SnBEVklPejRWdlg1Q0FETUZISU5aVmVJSU94UWZoL01iUlVuVWY5QUpsWncr?=
 =?utf-8?B?L2JkcXpkRmRmODI0M0hlUlVlRTBUeG11eXN2NXpQcndhMzRUOEl0TEhPZ2d5?=
 =?utf-8?B?R3ZNUHBDb21zL2w5VDEzME1sUStoc0dTTnBBLy9uMWhRcG5nOWpFV2hLcTU4?=
 =?utf-8?B?RnFoR3Nwcks0NldIVWkvM0xwb29LNG9PbVljUExlWVF5aVpIeUlVQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a682f54a-b3fe-4f6f-b8ce-08deee219a59
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:02:02.6087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIs6HwqSJSSW1d62WtMmcZwTzf1stqXeXqhQvUOeQ+rjeym5NigOpekT8n6kDruqV/02GQaQmfMXvmvfo/v4Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072



On 7/30/2026 3:05 AM, Mario Limonciello wrote:
> 
> 
> On 7/29/26 11:40, Muralidhara M K wrote:
>> hwmon.c issues the server power message IDs unconditionally, so on the
>> Family 1Ah client platforms the sensors address whatever the Ryzen
>> Master SMC set puts at those numbers:
>>
>>     power1_input    04h    HSMP_CLIENT_GET_METRICS_TABLE_VER
>>     power1_cap    06h    HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR
>>
>> Both match the num_args and response_sz that the sensors ask for, so
>> validate_message() accepts them and the two files report a metrics-table
>> version and the low half of a DRAM address as microwatts.
>>
>> The other two accesses are already rejected, as they land on a client
>> message taking a different num_args: power1_cap_max on 07h
>> (HSMP_CLIENT_SET_CORE_PSM_MARGIN) and the power1_cap write path, which
>> sends HSMP_SET_SOCKET_POWER_LIMIT on 05h
>> (HSMP_CLIENT_GET_METRICS_TABLE). No unintended firmware write is
>> possible either way.
>>
>> The client message set has no power telemetry to report instead
> 
> Is that right?  I thought the metrics table has accumulator values.
> 
You are right and that sentence was wrong; it is fixed in v2. The metric
table does carry power - system_power_acc, apu_power_acc, npu_power_acc
and the per-rail vddcr_*_telemetry_power fields.

What I should have written is narrower. The problem is not that the
client has no power figure, it is that hwmon's power1_* attributes reach
for it by issuing the server power message IDs, and those numbers are
metric-table queries in the client set. I registered the sensors on the
Model 80h system with the guard removed to show exactly what comes out:

         power1_input    5000            = table version 5, x1000
         power1_cap      1574441292000   = low word of the table DRAM
                                           address 0x5DD8114C, x1000
         power1_cap_max  -EINVAL

That is 5 mW and 1.57 MW. Both correlate exactly with what those message
IDs return on this part (04h -> 0x5, 06h -> 0x5DD8114C).

I also checked the write path, since that is the one that would matter:
writing power1_cap sends HSMP_SET_SOCKET_POWER_LIMIT (05h), which is
GET_METRICS_TABLE on the client and takes a different argument count, so
validate_message() rejects it with -EINVAL before a message is built.
dmesg stays empty across the attempt - nothing reaches firmware.

Getting a real reading is not a matter of substituting a message ID: the
table's power fields are monotonic accumulators, so power1_input would
have to read the table, difference two snapshots and normalise by
accumulation_counter. That is a different shape of sensor from the
one-message-per-read hwmon path here, so I would rather add it
deliberately on top than bend this patch into it. This one just keeps 
the misleading files from appearing.
> Which brings me to my next question - where is the format of the metrics 
> table declared?
> 
> It's probably (but not guaranteed) the same metrics table format used in 
> PMF.  IE this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers- 
> x86.git/commit/?h=review-ilpo- 
> next&id=641b41a7a12537f8898b1e14c62e0d85a8b872c2
> 
> But if userspace does and HSMP message to get the metrics table I think 
> we need a kernel header that shows them how to decode the structure.
> 
Agreed on the principle - userspace should not have to guess the layout.

It is not the PMF layout. I compared against smu_pmf_metrics_v2: that is
a table of instantaneous u16 values in mW, MHz and centi-C delivered 
over the PMF-SMU mailbox. The HSMP client table is a different structure 
- u64 accumulators, per-CCX per-core arrays for residency, frequency,
temperature and power, per-rail set and telemetry voltages, 
per-throttler limit and residency groups, and the overclocking state. 
Same SoC, but different producers and different layouts, so sharing a 
struct would be wrong.

Where I would push back is on declaring it in a kernel header. There is
no single layout to declare: the model variants this series enables 
carry different telemetry tables, and each new model can add another. A 
header that covered them would need one large struct per table version, 
named after the version because there is nothing else to name it after, 
which reads badly and has to grow with every part. The driver decodes 
none of it - it copies the table out as bytes - so those declarations 
would exist only for userspace, in a header the kernel itself cannot 
validate against the firmware that produces the data.

The AMD Public PPR documents the telemetry table per model, with the
field order, widths and units. That is the reference a tool should 
decode against, and it stays correct as models are added without the 
kernel tracking a firmware data structure it never interprets. The 
driver's part is getting the bytes out, which the metric table ioctl 
already does.

amd_hsmp.rst says this in v2: it describes how to obtain the table, and
for the client sends the reader to the telemetry table for the model in
the PPR to decode it.

>> , so gate
>> the registration on the platform in both drivers rather than teach
>> hwmon.c two message sets. Server behaviour is unchanged.
>>
>> The ACPI sysfs attributes are left alone. They are hardcoded to server
>> message IDs too, but on the client each one is either meaningful or
>> rejected: 02h and 03h are the SMU and interface version queries in both
>> message sets, and the num_args and response_sz checks in
>> validate_message() reject the rest, including every ID that lands on a
>> client SET.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c | 13 ++++++++++---
>>   drivers/platform/x86/amd/hsmp/plat.c | 15 +++++++++++----
>>   2 files changed, 21 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/ 
>> x86/amd/hsmp/acpi.c
>> index bbf2b9a8a408..57758df9d353 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -670,9 +670,16 @@ static int init_acpi(struct device *dev)
>>               dev_info(dev, "Failed to init metric table\n");
>>       }
>> -    ret = hsmp_create_sensor(dev, sock_ind);
>> -    if (ret)
>> -        dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
>> +    /*
>> +     * The hwmon power messages are numbered as metric table queries 
>> in the
>> +     * client message set, so the sensors would report those 
>> responses as
>> +     * power readings.  Leave them off there, as plat.c does.
>> +     */
>> +    if (!is_client_platform()) {
>> +        ret = hsmp_create_sensor(dev, sock_ind);
>> +        if (ret)
>> +            dev_info(dev, "Failed to register HSMP sensors with 
>> hwmon\n");
>> +    }
>>       dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/ 
>> x86/amd/hsmp/plat.c
>> index bc29b0ec18f7..17877e25f43e 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -196,10 +196,17 @@ static int init_platform_device(struct device *dev)
>>                   dev_info(dev, "Failed to init metric table\n");
>>           }
>> -        /* Register with hwmon interface for reporting power */
>> -        ret = hsmp_create_sensor(dev, i);
>> -        if (ret)
>> -            dev_info(dev, "Failed to register HSMP sensors with 
>> hwmon\n");
>> +        /*
>> +         * Register with hwmon interface for reporting power.  Skipped
>> +         * on the client, where the power messages the sensors issue
>> +         * are numbered as metric table queries and would report those
>> +         * responses as power readings.
>> +         */
>> +        if (!is_client_platform()) {
>> +            ret = hsmp_create_sensor(dev, i);
>> +            if (ret)
>> +                dev_info(dev, "Failed to register HSMP sensors with 
>> hwmon\n");
>> +        }
>>       }
>>       return 0;
> 

