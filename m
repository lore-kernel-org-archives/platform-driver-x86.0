Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B0B224F3
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967959; cv=fail; b=Oqj6ldELB6OfLcp+uMpkTDBe/TcollaHaslj/G2RiQN1w3g4lm39x2TMLwD37ClCXdMIVspgyWzpOikNpKhmnRwvHWqBYz9kO2n7K9ciDbA2eIoK7FttwVrd2G68VezenaKUjrpZHbu9GESPr4JEveeE53Azr6KXqddCVyJ2eVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967959; c=relaxed/simple;
	bh=3HVO9HqFkQ2EirRl+JWRqXZkNppiQLfVEYdv0WOPFxc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eZdF5H2zbLNNzojN4yO8fc+l2fPXd9nnPXjB/AAKspep7KN0nVecaY2agz2e2YlC9vrb8Kw6bBc6VT+xZU6tLD6vsAzt1jkZUvU3S7UxkB9yRy7l/B07SvkkBVSGED7xvmY9Ef8mjiHHqmgYasK9nLn5xg1jQR9CuauPkaERfZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u5hb2qou; arc=fail smtp.client-ip=40.107.200.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u5hb2qou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFc9CxNzFVL7iet33tkFciHwu6GFzgNr6DYsImOWgjfhtCc2txpSN6xl6PBjsCOpX/coSNRGTMBXSHMzZnefoFgdi9Rwc1xhHpAzdC51Z2pFGOsZXXHhMpGeAcNi+HCDFRC5Frodix4MMvWmUnjiNkI/gGH9t4SJW37DN1tgtkZmuiAd2w3oJKL4ZabbnxhyHKBAt3U9k6Ls6ptTK4bM5l1MCdPCPTqHZBp5k6okMlA7i5n2L84XVObtELOTzML5BbvfDiEKLF2GknVkHwTN9ip5J0YDyqLuIRdklENn4l5lvZm+q89B+S3giBnxgRcx+VMuNlqHHLzmVFCcpvR28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzgS6TEwNm7giFyxsc0xVRepHkZ84NTxQkdcaxRHYDE=;
 b=P+0sHZqw77oEpNfkn6vsCaDhA5AdgOpo6K8YWR/ODjXZGUIRL3GtOj3KH+/vMIcuYh9UsVu/rltcQamucdCa6wS9Qu2mUjkMG9On3YIxs+T0yhDbr/nKm4r56Kuv9s6aBqNJaVzUDs+DzkwqK3t57p148vhuV1lPKqjq5aAosNy6d3kNzzT2hrMCqfdVLH0TZeA5CAHXjj/WJ9F+j5prLwgIMo6FtYWuTneuonWsTxxCXnyVbpI4ra/loYMXpwqeQUDB3pP1jvlPpt/s7L4S7X+afuC4IJCS8OxVZpaoCxSqURM+aAFniSOdgO69kWgeXTTHV7Uw2jbaDgXG8rOcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzgS6TEwNm7giFyxsc0xVRepHkZ84NTxQkdcaxRHYDE=;
 b=u5hb2qou2s7INyQOsGlDpzXKaIcXcHjJWq+3s0Sh4rLMupXnENaotlMB1X1v7uSXkXIfl5HwGCClmWMF2mxx5neij2CNJDLZyiEA0a0HUXLE3XbZHuJ2x9l3bSE0p0yJ6yIp6ae7ksGAECx5J/70Sdo9HSGBrNX4ZGQNvermDW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21)
 by CH3PR12MB8533.namprd12.prod.outlook.com (2603:10b6:610:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 18:39:13 +0000
Received: from CH3PR12MB8284.namprd12.prod.outlook.com
 ([fe80::1bc1:88b1:7cf7:87aa]) by CH3PR12MB8284.namprd12.prod.outlook.com
 ([fe80::1bc1:88b1:7cf7:87aa%4]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 18:39:12 +0000
Message-ID: <493b4c1a-91ca-43bc-8751-9baae9d26e73@amd.com>
Date: Tue, 14 Jul 2026 00:09:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] platform/x86/amd/pmf: Add 1AH_M80H metrics table and
 NPU metrics support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
 <20260710174219.2522269-6-Shyam-sundar.S-k@amd.com>
 <39c6af1d-f9fe-f093-0ca2-90f5c324ffde@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <39c6af1d-f9fe-f093-0ca2-90f5c324ffde@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0173.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::9) To CH3PR12MB8284.namprd12.prod.outlook.com
 (2603:10b6:610:12e::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8284:EE_|CH3PR12MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 63deb62c-f7d6-4015-f799-08dee10e0884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OZ8E5/6k+ucLhhT1Zcp8kyjfzV1H8q0ZTViOAm9hsLa3b/Hh8jR/zVYjyXaD8xm4xhV6r05JdMP0Wk3iUAlqfN8RC94jbk3xH+X7wjXe4NdiyM+W1y6rPTgWJogffddU5VvG9cEKftpqGJk51O6l/WA1SY3Ht0F0YeeZN0jY8dHYb8NcAI061y5MHxvzu44yA6E/+rND/1RgJ79TM8663J1lkUE57JZJCn11nGkJvjVtyCG11+NgZLFAATRN5fH9sHl1HxzjaYoABdPs3XtlwtBYmnLWzA0F6Mg2vlezqx3F+YnMYZLywLsfWt9uBNJKTDkAbybM9fitCrM7refreCglDECTdBCpbdTXVqdFul5KY43lFr7ITYFRh7RURHYGa5cHu6UjajWHa2h8HNWeDgg28brudfhWzYkb1x0+ehkIx/SnJqz9pmb4gDHKZZ+Qqhc2TozrbljYuttQFgRsSBxRVdeunAtm2VmOSahHZBbqh7MaxEKD17VLvmgtShLue3mDye15OINbPVGClLQ0OmHr4ybp+727vKDOa1qayt75viHLnlOm2bOQBfp43t3PprVMLj1e70wGDoorpOPBYDcX8U5biQrXJMRRAtxB4HeJdH0RfXCdVLpxrvaR3knQwkzUDeksNCXsdx3Zj28LBAFa0D0Qquq4XW3hNRtrQps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8284.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0NKRjBqdWlCbTllUUlQYzh5TTR5WThFaG9PdXNYcFhOd3lWbjBQTk5aRVNl?=
 =?utf-8?B?UlBmYjgvR2s3Y0FsRkh5YmlhbnJRaUtFbHNLY0M2MDk3c0g4dXZmMUVBWHp2?=
 =?utf-8?B?eW1uaDE3UytpSm1KRmVrNVRQd2ViRjRXTDd5RS96NFl6WVlFZ0FCM0xndnpq?=
 =?utf-8?B?cmxNWjdzOWtUUE03OGdvNDJ1Z0h1YzhXcVFxNU1CTzNlYVNmV0RpRlN4OEVq?=
 =?utf-8?B?QmtqaUF5WGhVRzZQSDUzTllIayt6RmppZENEVml2ZHBXU1I0dlpUcmoxcGpM?=
 =?utf-8?B?OU1iTVhDYVBHdUMva055TnFlWU4ycS9DVlYrendndjBvajBOY1czKzh5R2M4?=
 =?utf-8?B?aGxZSytOd2gyYTFHd1VFSlFZV213TzZURkZCQjMrVmRsRFowblkzRTU4Qnc2?=
 =?utf-8?B?VUJuYmRFZHEwSTJEc0dYK3J1UjNsWDhJWmwrL3hzOTQ3c0lScisxcW80Zjkv?=
 =?utf-8?B?NWdqU01yNWVISWlmWVlid2JKUWdjdWx0UDdtS3FTS3k3WW1VUGRwSlA4Wmd1?=
 =?utf-8?B?eDI2ZzlOUVQ0R09MMmhiTmhidFJZZDN4Mm5PYm4xSkd4bU9FV2pscUVUNEEx?=
 =?utf-8?B?R3NzRHJtczdkR2ZxWXBOUGNId2ZWcGxkQzRZQVArdDRkajhtYnhXMjVLNTNs?=
 =?utf-8?B?cGN5Mnl3S3BuQXlMTnYzRkkvcDNMNDlSaVpZaHM5SU9URkoxaXR2Y2dQVlBV?=
 =?utf-8?B?bXhaWFlNZTQ1TVdJMEhUb002TFM2cjU1WFZHM1VEZnpUYTlDWG9FUVFJQ3Vm?=
 =?utf-8?B?RytHZ3BpR05qdmtwRDQyeU9zVkxxZEdNYjQrdXpmMDNSNnVPTnYzbGhaQTRx?=
 =?utf-8?B?ak4yK1ByVUZvdWxSd2tVUVhxc1ZSOW5zU2xPcU5MRzlta3ZhTm9ZczN2RzBs?=
 =?utf-8?B?eDd4ZGFGR3FzWEJGLzFoL01xdXpTKy9ESUowRTZ1emZ1MzY5UHNiNHM1MVZZ?=
 =?utf-8?B?QytZbmlYRUFQVDhqMVBzR0VHV2RLNEZHeUk4M3ZTMDNORTBkbVdMbVRMUmxR?=
 =?utf-8?B?NFNPbWVLRTljd1VKNTh6c1g2c2JzdG43RjB1aTgrWVk4NjNBWUtpc1VpUFJz?=
 =?utf-8?B?enpHMWExeGRrT0lBMnFjZ2Q4QVNwYi8vd3VaRUFpcFA0Ni84amFJTW84YnR2?=
 =?utf-8?B?V2tqRzZCQVlxNzIrZmR3US9oemFiUUo2UWMxRzBtM3FzbGNGTTNrbFo2UlIr?=
 =?utf-8?B?aEhpdzdSK2RseXRVZ3pMMVpPMlovTnFQUFB6TkVTNEdlUE9MK1JXUkxXZC9Y?=
 =?utf-8?B?M2o3Y2lNSUFUM2VhYkMvbmRPM0RGYTY2V0JmZG5OeXRGbjVUMDdMOUVrQW9i?=
 =?utf-8?B?ZzFYVmF0eUUwam9HL2pWVFQ0eUNlRGtTRzRXVUFlSXRqQ09nYmZQNDhyNTE0?=
 =?utf-8?B?Sm5BMmhUeG9tcXJrQ3pZMHRud3htM2lrZWJsNDY3NVhHS2d6VkxTRGRlbGs0?=
 =?utf-8?B?anFjZ1QvVjVTdERLcWd1SEk1N1EyRXBUY1c0TjJpVURMZ1JlV0tEeUNyQ1hJ?=
 =?utf-8?B?SEpsSHlhZEJIQ0VoNnpoNzVrejJZMzBrdUdkbytwcFlOOFBxOXY5ZkRXcGFS?=
 =?utf-8?B?QUlmMU5aeUxDTXcyQ244RmZ3dExuY0QxTEJNeHNlWVZIMTFmMUt3OEhwVi92?=
 =?utf-8?B?dkxkM3ZraE1GOG5mdnR5S21QZ2JkcVhhQkVaVGNRZlg5a3hZY1dsNlZNREta?=
 =?utf-8?B?U2ZUcTJncmIxeTQxWGYxR0cremdCY1lFZHQxWFd6MUpoZ2thcnFiT0NaUGpD?=
 =?utf-8?B?czcwME5zN0NPMkxaSnhUcDVJWDZWRVRTN29tazFQQ0YvZVFmYWxCcUxMd3lH?=
 =?utf-8?B?a1B0MSttMi9iemltWjVmam90NGRuWVpOY0VlQkcvQWRLN1FXMy9KV3AzTGZn?=
 =?utf-8?B?UDV2TnlGT05OUGVINUVZUEFmMHFTNUx1YUcwbW5DMFFCbnFQa2hxenJTUWJt?=
 =?utf-8?B?VGpXMGJHeU5jMHB4bHppN0VINEMwTTRFdzlRRlhTT3BEVDc0dFNXYXdoejBq?=
 =?utf-8?B?RGpBeHJuV2pheG50TUllZTh5QXg5MXRKWkJ6eXBLTmdNUDB0OVBWbDdnbU1r?=
 =?utf-8?B?Vmhxd3F0UjF2cHU0bG8wK1lWZ2tkRlV4c1dwN3I1WFpOMXFYUXBJT2RhZTY2?=
 =?utf-8?B?N2x6bTRuV2tZVmhDaEhmUGVxTU51WmJYRjE4Q0ZIZ1BhUVg5cHF0T3VOdFZ1?=
 =?utf-8?B?RjlhYkJMN0Nackh3Q2NVRjRtRnZHZlAvY3FPZThwNGxvTmNhbmFKVkZYQUt5?=
 =?utf-8?B?QWlmOXZBWWRLeHdiaXZOK0lBVm4yaExHZkhlTWxkZDFqTGg1OU9SNURrMThD?=
 =?utf-8?B?NC95VnpRNTMzMmh1aExadWwwc29jaXBtWFNvcXYxV3NxL0hYaHlUQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63deb62c-f7d6-4015-f799-08dee10e0884
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:39:12.5936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slFjS2dVwRwOp1XC+7QkRTX0FTIQo71pIINq7uWiVbvquTIs+ZQ6pVfoslZ4DM3Y0K0fULoP69KDPCbBdND9EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8533



On 7/10/2026 23:46, Ilpo Järvinen wrote:
> On Fri, 10 Jul 2026, Shyam Sundar S K wrote:
> 
>> The 1AH_M80H platform introduces a new firmware managed DRAM based
>> metrics table (amd_pmf_metrics_v3) covering the full platform telemetry
>> including power, voltages, frequencies, throttlers and activity monitors.
>>
>> As a first consumer of this table, add NPU metrics retrieval. Unlike
>> earlier platforms that use a transfer table command, 1AH_M80H metrics
>> are accumulator based and require delta calculation between consecutive
>> samples.
>>
>> Extend amd_pmf_npu_metrics with npu_temp, populated from the
>> npu_temp_acc accumulator field available on 1AH_M80H.
>>
>> Key changes include:
>>  - Add DRAM based metrics table support for the 1AH_M80H platform
>>  - Introduce amd_pmf_get_tbl_dram_addr() to obtain the DRAM address
>>  - Add amd_pmf_get_metrics_table_log_sample() to trigger metrics updates
>>  - Add struct amd_pmf_metrics_v3 for the 1AH_M80H metrics format
>>  - Implement accumulator based delta calculation for metrics
>>  - Introduce amd_pmf_calculate_acc_npu_metrics() to get NPU metrics
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/core.c    |  25 +++
>>  drivers/platform/x86/amd/pmf/metrics.c | 142 ++++++++++++++++
>>  drivers/platform/x86/amd/pmf/pmf.h     | 218 +++++++++++++++++++++++++
>>  include/linux/amd-pmf-io.h             |   2 +
>>  4 files changed, 387 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index c0a21808b867..5d744eb71418 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -68,6 +68,12 @@ static bool smart_pc_support = true;
>>  module_param(smart_pc_support, bool, 0444);
>>  MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
>>  
>> +/* Helper to check if platform is 1AH_M80H */
>> +bool is_amd_pmf_1ah_m80h(struct amd_pmf_dev *pdev)
>> +{
>> +	return pdev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M80H_ROOT;
>> +}
>> +
>>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>>  {
>>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
>> @@ -155,6 +161,12 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
>>  
>>  	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>>  	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
>> +	if (is_amd_pmf_1ah_m80h(dev)) {
>> +		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[1]);
>> +		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT1:%d\n", value);
>> +		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[2]);
>> +		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT2:%d\n", value);
>> +	}
>>  
>>  	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
>>  	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
>> @@ -214,6 +226,13 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>>  			/* PMFW may take longer time to return back the data */
>>  			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>>  			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>> +			if (is_amd_pmf_1ah_m80h(dev) &&
>> +			    message == GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR) {
>> +				dev->dram_addr.hi = amd_pmf_reg_read(dev,
>> +								     dev->smu_regs->arg_reg[1]);
>> +				dev->dram_addr.size = amd_pmf_reg_read(dev,
>> +								       dev->smu_regs->arg_reg[2]);
>> +			}
>>  		}
>>  		break;
>>  	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
>> @@ -518,6 +537,12 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	if (err)
>>  		return err;
>>  
>> +	if (is_amd_pmf_1ah_m80h(dev)) {
>> +		err = amd_pmf_get_tbl_dram_addr(dev);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>>  	apmf_acpi_init(dev);
>>  	platform_set_drvdata(pdev, dev);
>>  	amd_pmf_dbgfs_register(dev);
>> diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
>> index 5a8ebacbc3b3..4cb45a8bbdb4 100644
>> --- a/drivers/platform/x86/amd/pmf/metrics.c
>> +++ b/drivers/platform/x86/amd/pmf/metrics.c
>> @@ -17,6 +17,8 @@
>>  #include <linux/device/devres.h>
>>  #include <linux/io.h>
>>  #include <linux/ktime.h>
>> +#include <linux/math.h>
>> +#include <linux/minmax.h>
> 
> This was the fourth header I was missing earlier from the almost always 
> forgotten list. :-)
> 
>>  #include <linux/string.h>
>>  #include <linux/workqueue.h>
>>  
>> @@ -24,6 +26,89 @@
>>  
>>  static struct device *pmf_device;
>>  
>> +static u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
>> +{
>> +	u64 val = DIV_ROUND_CLOSEST_ULL(avg_acc, 1024) * 1000;
> 
> Please use one of the 64-bit divide helpers whenever any of the values is 
> 64-bit.
> 
> Is that 1000 something from units.h?
> 
>> +
>> +	return min_t(u16, val, U16_MAX);
>> +}
>> +
>> +static u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
>> +{
>> +	u64 val = DIV_ROUND_CLOSEST_ULL(avg_acc, 1024);
> 
> Ditto.
> 
>> +
>> +	return min_t(u16, val, U16_MAX);
> 
> + limits.h
> 
>> +}
>> +
>> +static u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter,
>> +				  u64 curr_value, u64 prev_value)
>> +{
>> +	u32 counter_diff;
>> +	u64 val_diff;
>> +
>> +	/* Check for counter reset */
>> +	if (curr_counter <= prev_counter)
>> +		return 0;
>> +
>> +	counter_diff = curr_counter - prev_counter;
>> +
>> +	if (curr_value < prev_value)
>> +		return 0;
>> +
>> +	val_diff = curr_value - prev_value;
>> +
>> +	return DIV_ROUND_CLOSEST_ULL(val_diff, counter_diff);
> 
> Use 64-bit helpers.
> 

OK. Ack to all comments in this revision.

Thanks,
Shyam


